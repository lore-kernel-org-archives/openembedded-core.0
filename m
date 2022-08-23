Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Steve Sakoman" <steve@sakoman.com>
Subject: [OE-core][kirkstone 10/28] libwpe: upgrade 1.12.0 -> 1.12.2
Date: Tue, 23 Aug 2022 12:35:22 -1000
Message-Id: <89feb5d2c39bf6b01f996bba522948ebb99863c7.1661293746.git.steve@sakoman.com>
In-Reply-To: <cover.1661293745.git.steve@sakoman.com>
References: <cover.1661293745.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Alexander Kanavin <alex.kanavin@gmail.com>

What’s new in libwpe 1.12.1?
- Fix pasteboard to use the generic interface by default.
- Fix memory allocation to always abort execution on failure.

What’s new in libwpe 1.12.1?
- Fix pasteboard to use the generic interface by default.
- Fix memory allocation to always abort execution on failure.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 03b7bfb0f011ba812808fa353611178cd5618e81)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ure-due-to-libc-using-libc-functions.patch | 42 +++++++++++++++++++
 .../{libwpe_1.12.0.bb => libwpe_1.12.2.bb}    |  6 ++-
 2 files changed, 46 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-sato/webkit/libwpe/0001-Fix-build-failure-due-to-libc-using-libc-functions.patch
 rename meta/recipes-sato/webkit/{libwpe_1.12.0.bb => libwpe_1.12.2.bb} (72%)

diff --git a/meta/recipes-sato/webkit/libwpe/0001-Fix-build-failure-due-to-libc-using-libc-functions.patch b/meta/recipes-sato/webkit/libwpe/0001-Fix-build-failure-due-to-libc-using-libc-functions.patch
new file mode 100644
index 0000000000..6d27b4835d
--- /dev/null
+++ b/meta/recipes-sato/webkit/libwpe/0001-Fix-build-failure-due-to-libc-using-libc-functions.patch
@@ -0,0 +1,42 @@
+From ccf8a58c3536ca0e62748e0ea477514e14d821bc Mon Sep 17 00:00:00 2001
+From: Adrian Perez de Castro <aperez@igalia.com>
+Date: Thu, 4 Aug 2022 12:19:05 +0300
+Subject: [PATCH] Fix build failure due to libc++ using libc functions
+
+Include the "alloc-private.h" header after the C++ standard library
+headers. This sidesteps build failures caused by implementations of
+std::map and std::string which use libc memory allocation functions
+in expanded templates after they have been marked with the "poison"
+pragma.
+
+Fixes #115
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ src/pasteboard-generic.cpp | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/pasteboard-generic.cpp b/src/pasteboard-generic.cpp
+index 86fe4ee..a357027 100644
+--- a/src/pasteboard-generic.cpp
++++ b/src/pasteboard-generic.cpp
+@@ -26,12 +26,15 @@
+ 
+ #include "pasteboard-private.h"
+ 
+-#include "alloc-private.h"
+-#include <cstdlib>
+-#include <cstring>
+ #include <map>
+ #include <string>
+ 
++// We need to include this header last, in order to avoid template expansions
++// from the C++ standard library happening after it forbids usage of the libc
++// memory functions.
++#include "alloc-private.h"
++#include <cstring>
++
+ namespace Generic {
+ using Pasteboard = std::map<std::string, std::string>;
+ }
diff --git a/meta/recipes-sato/webkit/libwpe_1.12.0.bb b/meta/recipes-sato/webkit/libwpe_1.12.2.bb
similarity index 72%
rename from meta/recipes-sato/webkit/libwpe_1.12.0.bb
rename to meta/recipes-sato/webkit/libwpe_1.12.2.bb
index ac4ee3eb23..e23a9ac32d 100644
--- a/meta/recipes-sato/webkit/libwpe_1.12.0.bb
+++ b/meta/recipes-sato/webkit/libwpe_1.12.2.bb
@@ -10,8 +10,10 @@ inherit cmake features_check pkgconfig
 
 REQUIRED_DISTRO_FEATURES = "opengl"
 
-SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "e8eeca228a6b4c36294cfb63f7d3ba9ada47a430904a5a973b3c99c96a44c18c"
+SRC_URI = "https://wpewebkit.org/releases/${BPN}-${PV}.tar.xz \
+           file://0001-Fix-build-failure-due-to-libc-using-libc-functions.patch \
+           "
+SRC_URI[sha256sum] = "4ac4fd0a8b562b721bffd0f46ae9f06c2b5a3114407581978be875a9d651642a"
 
 # This is a tweak of upstream-version-is-even needed because
 # ipstream directory contains tarballs for other components as well.
-- 
2.25.1

