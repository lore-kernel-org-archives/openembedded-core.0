Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 05B287D41F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Aug 2019 15:00:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 46BKxF4lMnz63
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Aug 2019 17:00:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1566140433;
	bh=wSSSloPg7zQsTW6PikCbGrLU9eUWo4peOQRLd5mAAe4=;
	h=From:To:Subject:Date:From;
	b=h/NzvQJCJQGKIS4NxJ3pYoPqW1SYo0wtIk740tpCkI6tEKnHb7BPel0Pi8haCxHsU
	OlzjQ2+zp+8cW2TG3K7quJfW1B6GbWfIeClomXbmeO84al7tU4HEn32ZF8GeRP8OU8
	TNAwfqASAvZIccwGSsEmuYEqqgPCh+lNE89IemQ7mPGkgJnX5QeqfRzD8HuAV8LKQd
	kQYH1pgvvGSUMTOAQ20ypSW+nVNwstBHaNI40M5yn6QNdnJgJtxi35nkQ3yFR2ZIg2
	dbSIfiXN3uXt3vUVeknVpOFC5OnC5nzDVLfSxVsbxOBKguijIoOk1HgojED7huOU+A
	9IUqMcQZ52xX8/Z2pAj3zl1s0h237IeuLXJoj453O4DNch+F8KjX8ev0o9IHrT1r5B
	3316bonWkMFaEuSemdRsnOif1q2eR2iVXxMBhKqlu7I3LxQL0uErDIxBbaRkc9AoLV
	02d/CPplSdO6/oeC6jkANlxOjUdjbAIXmNn/j4tjgZNalmXBtLZT3EV9Iy+FwACxyu
	OVUuszDtQMbnU99cgX6nPRXLNsnYQIZnFGKsFyn0xmqEXTgihJPu8bkfJ+4uOpa1vC
	F8LTQovLCLldtcKFfWUK7KwoeSkm51dZyhfFbsCwN7lMdhIc2NytW0hVI/prpaBk2L
	vB1748PxoFc+9FN4rTZ5tNB8=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Aug 2019 18:00:32 +0300
Message-Id: <20190818150032.12232-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] kmod: Replace dolt hacks with backport of upstream dolt removal
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 18 Aug 2019 15:00:34 -0000

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-kernel/kmod/kmod.inc             |  7 +----
 .../kmod/0001-build-Stop-using-dolt.patch     | 28 +++++++++++++++++++
 .../kmod/kmod/avoid_parallel_tests.patch      |  5 ++--
 3 files changed, 32 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-kernel/kmod/kmod/0001-build-Stop-using-dolt.patch

diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index e68860f6b4..334453838e 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -20,6 +20,7 @@ PV = "26"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
            file://depmod-search.conf \
+           file://0001-build-Stop-using-dolt.patch \
            file://avoid_parallel_tests.patch \
           "
 
@@ -28,14 +29,8 @@ S = "${WORKDIR}/git"
 EXTRA_AUTORECONF += "--install --symlink"
 EXTRA_OECONF +=" --enable-tools --with-zlib"
 
-CACHED_CONFIGUREVARS += "ac_cv_path_DOLT_BASH='/usr/bin/env bash'"
-
 PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
 PACKAGECONFIG[logging] = " --enable-logging,--disable-logging"
 PACKAGECONFIG[manpages] = "--enable-manpages, --disable-manpages, libxslt-native xmlto-native"
 
 GTKDOC_DOCDIR = "${S}/libkmod/docs"
-
-do_configure_append () {
-	sed -i 's#}libtool#}${TARGET_SYS}-libtool#' ${B}/doltlibtool
-}
diff --git a/meta/recipes-kernel/kmod/kmod/0001-build-Stop-using-dolt.patch b/meta/recipes-kernel/kmod/kmod/0001-build-Stop-using-dolt.patch
new file mode 100644
index 0000000000..c915ad5e8a
--- /dev/null
+++ b/meta/recipes-kernel/kmod/kmod/0001-build-Stop-using-dolt.patch
@@ -0,0 +1,28 @@
+From f8b8d7b330433511d19a936ddfc7b7d1af5490b5 Mon Sep 17 00:00:00 2001
+From: Adrian Bunk <bunk@kernel.org>
+Date: Wed, 20 Feb 2019 14:22:04 +0200
+Subject: build: Stop using dolt
+
+This does regress "make -12" from 0.7s to 0.9s on my
+Coffee Lake machine, but even on slower hardware this
+will not amount to a noticable slowdown.
+
+On the other hand using dolt can create problems for
+people doing cross-compilation, e.g. Yocto has two
+hacks just for dolt in kmod:
+https://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-kernel/kmod/kmod.inc?id=a17abae00785c76cfffe5381a22fb2c86b982e82
+
+Signed-off-by: Adrian Bunk <bunk@kernel.org>
+Upstream-Status: Backport
+
+--- a/configure.ac
++++ b/configure.ac
+@@ -17,7 +17,6 @@ AM_MAINTAINER_MODE([enable])
+ AM_INIT_AUTOMAKE([check-news foreign 1.11 silent-rules tar-pax no-dist-gzip dist-xz subdir-objects color-tests parallel-tests])
+ AM_SILENT_RULES([yes])
+ LT_INIT([disable-static pic-only])
+-DOLT
+ 
+ AS_IF([test "x$enable_static" = "xyes"], [AC_MSG_ERROR([--enable-static is not supported by kmod])])
+ AS_IF([test "x$enable_largefile" = "xno"], [AC_MSG_ERROR([--disable-largefile is not supported by kmod])])
+
diff --git a/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch b/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch
index 990c338fa9..04a8204815 100644
--- a/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch
+++ b/meta/recipes-kernel/kmod/kmod/avoid_parallel_tests.patch
@@ -20,7 +20,7 @@ diff --git a/configure.ac b/configure.ac
 index ee72283..60980c0 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -14,7 +14,7 @@ AC_USE_SYSTEM_EXTENSIONS
+@@ -14,8 +14,8 @@ AC_USE_SYSTEM_EXTENSIONS
  AC_SYS_LARGEFILE
  AC_PREFIX_DEFAULT([/usr])
  AM_MAINTAINER_MODE([enable])
@@ -28,4 +28,5 @@ index ee72283..60980c0 100644
 +AM_INIT_AUTOMAKE([check-news foreign 1.11 silent-rules tar-pax no-dist-gzip dist-xz subdir-objects color-tests serial-tests])
  AM_SILENT_RULES([yes])
  LT_INIT([disable-static pic-only])
- DOLT
+
+ AS_IF([test "x$enable_static" = "xyes"], [AC_MSG_ERROR([--enable-static is not supported by kmod])])
-- 
2.17.1


