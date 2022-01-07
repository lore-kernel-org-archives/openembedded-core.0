Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Khem Raj" <raj.khem@gmail.com>
Subject: [PATCH v2] libsdl2: Fix build when libunwind is not used
Date: Fri,  7 Jan 2022 11:22:55 -0800
Message-Id: <20220107192255.3128781-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>, =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>

clang provides libunwind.h and cmake adds a check to
find libunwind when this header is detected, which was
not the case with automake. The check however is expecting
specific unwinder implementation which provides libunwind-generic
solib, this is not a standard library that all implementations
will provide, therefore make this check optional.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
v2: Udate patch status to submitted

 .../libsdl2/optional-libunwind-generic.patch   | 18 ++++++++++++++++++
 .../recipes-graphics/libsdl2/libsdl2_2.0.18.bb |  1 +
 2 files changed, 19 insertions(+)
 create mode 100644 meta/recipes-graphics/libsdl2/libsdl2/optional-libunwind-generic.patch

diff --git a/meta/recipes-graphics/libsdl2/libsdl2/optional-libunwind-generic.patch b/meta/recipes-graphics/libsdl2/libsdl2/optional-libunwind-generic.patch
new file mode 100644
index 00000000000..757b99a5f68
--- /dev/null
+++ b/meta/recipes-graphics/libsdl2/libsdl2/optional-libunwind-generic.patch
@@ -0,0 +1,18 @@
+Do not error when libunwind-generic is not found, Not all
+implementations of libunwind will provide this library therefore
+do not make it hard error if its not found.
+
+Upstream-Status: Submitted [https://github.com/libsdl-org/SDL/pull/5194]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1358,7 +1358,7 @@ elseif(UNIX AND NOT APPLE AND NOT ANDROI
+       if(HAVE_LIBUNWIND_H)
+         # We've already found the header, so REQUIRE the lib to be present
+         pkg_search_module(UNWIND REQUIRED libunwind)
+-        pkg_search_module(UNWIND_GENERIC REQUIRED libunwind-generic)
++        pkg_search_module(UNWIND_GENERIC libunwind-generic)
+         list(APPEND EXTRA_LIBS ${UNWIND_LIBRARIES} ${UNWIND_GENERIC_LIBRARIES})
+       endif()
+     endif()
diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
index 893386343a7..1559d5e9425 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.18.bb
@@ -18,6 +18,7 @@ PROVIDES = "virtual/libsdl2"
 
 SRC_URI = "http://www.libsdl.org/release/SDL2-${PV}.tar.gz \
            file://0001-Fix-build-against-wayland-1.20.patch \
+           file://optional-libunwind-generic.patch \
 "
 
 S = "${WORKDIR}/SDL2-${PV}"
-- 
2.34.1

