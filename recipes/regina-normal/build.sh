#!/bin/sh

mkdir build && cd build

echo ${PREFIX}

# Running with no GUI since https://gitlab.freedesktop.org/xdg/shared-mime-info
# isn't part of conda
#
# And I can't figure out how to get this even compiled:
# The README.md says to call ./autogen.sh first, but that file isn't there.

#   -DDISABLE_GUI=1 \

cmake \
  -DCMAKE_PREFIX_PATH=${PREFIX} \
  -DCMAKE_INSTALL_PREFIX=${PREFIX} \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_RPATH="${PREFIX}/lib" \
  -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
  -DCMAKE_MACOSX_RPATH=ON \
  -DREGINA_INSTALL_TYPE=XDG \
  ..

make install # -j${CPU_COUNT}
