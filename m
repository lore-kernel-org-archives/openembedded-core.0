Return-Path: <tanuk@iki.fi>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
	[66.111.4.27])
	by mail.openembedded.org (Postfix) with ESMTP id C5D22731D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 06:53:07 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 6F6E4205FE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 01:53:06 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute1.internal (MEProxy); Thu, 14 Jan 2016 01:53:06 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:message-id:subject:to
	:x-sasl-enc:x-sasl-enc; s=smtpout; bh=T2RBGLNDHMmK1F29i/PlnPfmf4
	I=; b=Ki514rpL5qCHgfPHtcCwclcjxcDQssDnArn8zp0RK3x+VEFA4A0X8G2L9U
	l0/7xHi6o/4aqfQARURAr69Xktlgf5Q/unHK1NeqVQbThnmJ0SICkydj/WAJq3Nj
	k3pTviq0dPrwazPsZLXyu/Tvqp75ZLRk/uWB75Y1pxHp8ErGs=
X-Sasl-enc: LzA320VNOHiMs23KaBaKzDlpD1mtL7GjaHXi88u6VwWc 1452754385
Received: from laptop.tanuk.dy.fi (a88-114-110-232.elisa-laajakaista.fi
	[88.114.110.232])
	by mail.messagingengine.com (Postfix) with ESMTPA id BEF96C016F2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 01:53:05 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 08:52:58 +0200
Message-Id: <1452754378-2096-1-git-send-email-tanuk@iki.fi>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] alsa-lib: 1.0.29 -> 1.1.0
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
X-List-Received-Date: Thu, 14 Jan 2016 06:53:10 -0000

Changelog: http://alsa-project.org/main/index.php/Changes_v1.0.29_v1.1.0

The most significant change is probably the addition of the "topology
API", which is used to change the DSP topology from userspace. My
understanding is that the API is (or will be) needed to support some
new hardware, but I don't know any specifics about that.

Rebased Check-if-wordexp-function-is-supported.patch.

Dropped 0001-build-Do-not-try-to-detect-cross-compiler.patch, since it
is included in the new release.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 ...build-Do-not-try-to-detect-cross-compiler.patch | 45 -------------------
 .../Check-if-wordexp-function-is-supported.patch   | 14 +++---
 meta/recipes-multimedia/alsa/alsa-lib_1.0.29.bb    | 50 ----------------------
 meta/recipes-multimedia/alsa/alsa-lib_1.1.0.bb     | 49 +++++++++++++++++++++
 4 files changed, 56 insertions(+), 102 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0001-build-Do-not-try-to-detect-cross-compiler.patch
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib_1.0.29.bb
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib_1.1.0.bb

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/0001-build-Do-not-try-to-detect-cross-compiler.patch b/meta/recipes-multimedia/alsa/alsa-lib/0001-build-Do-not-try-to-detect-cross-compiler.patch
deleted file mode 100644
index 583bc3d..0000000
--- a/meta/recipes-multimedia/alsa/alsa-lib/0001-build-Do-not-try-to-detect-cross-compiler.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 17aeb3565f411e7796cabe403f92d15948a8ca95 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 21 Aug 2015 14:42:45 -0700
-Subject: [PATCH] build: Do not try to detect cross-compiler
-
-cross compilers are passed via path may not be a gcc based cross
-compiler in such cases this check fails and try's to force gcc based
-cross compiler detection, This code is a convenience that limits the
-build system
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- configure.ac | 14 --------------
- 1 file changed, 14 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 3022cf8..9d77440 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -27,20 +27,6 @@ AC_PREFIX_DEFAULT(/usr)
- 
- dnl Checks for programs.
- 
--dnl try to gues cross-compiler if not set
--if test "x$host" != "x$build" -a -z "`echo $CC | grep -e '-gcc'`";
--then
--  AC_MSG_CHECKING(for cross-compiler)
--
--  which ${program_prefix}gcc >/dev/null 2>&1 && CC=${program_prefix}gcc
--  which ${host_cpu}-${host_os}-gcc >/dev/null 2>&1 \
--  && CC=${host_cpu}-${host_os}-gcc
--  which ${host_cpu}-${host_vendor}-${host_os}-gcc >/dev/null 2>&1 \
--  && CC=${host_cpu}-${host_vendor}-${host_os}-gcc
--
--  AC_MSG_RESULT($CC)
--fi
--	    
- CFLAGS="$CFLAGS -D_GNU_SOURCE"
- 
- 
--- 
-2.1.4
-
diff --git a/meta/recipes-multimedia/alsa/alsa-lib/Check-if-wordexp-function-is-supported.patch b/meta/recipes-multimedia/alsa/alsa-lib/Check-if-wordexp-function-is-supported.patch
index 75a6eb8..795e48a 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib/Check-if-wordexp-function-is-supported.patch
+++ b/meta/recipes-multimedia/alsa/alsa-lib/Check-if-wordexp-function-is-supported.patch
@@ -1,4 +1,4 @@
-From e33357b59a10d44e9bec5d24100ce23ca300cc79 Mon Sep 17 00:00:00 2001
+From 3408f8e78776b12f131e433749721602f87e0a70 Mon Sep 17 00:00:00 2001
 From: "Hong H. Pham" <hong.pham@windriver.com>
 Date: Fri, 29 Aug 2014 17:13:55 +0300
 Subject: [PATCH] Check if wordexp function is supported
@@ -18,15 +18,15 @@ Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
  2 files changed, 5 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index b8353a0..773b72f 100644
+index 9490d39..b08a90a 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -311,7 +311,10 @@ fi
+@@ -295,7 +295,10 @@ fi
  AC_SUBST(ALSA_DEPLIBS)
  
  dnl Check for headers
--AC_CHECK_HEADERS([wordexp.h endian.h sys/endian.h])
-+AC_CHECK_HEADERS([wordexp.h endian.h sys/endian.h],
+-AC_CHECK_HEADERS([wordexp.h endian.h sys/endian.h sys/shm.h])
++AC_CHECK_HEADERS([wordexp.h endian.h sys/endian.h sys/shm.h],
 +  dnl Make sure wordexp is supported by the C library
 +  AC_CHECK_FUNCS([wordexp])
 +)
@@ -34,7 +34,7 @@ index b8353a0..773b72f 100644
  dnl Check for resmgr support...
  AC_MSG_CHECKING(for resmgr support)
 diff --git a/src/userfile.c b/src/userfile.c
-index 3a73836..b8ce809 100644
+index 72779da..e9d13e6 100644
 --- a/src/userfile.c
 +++ b/src/userfile.c
 @@ -32,7 +32,7 @@
@@ -47,5 +47,5 @@ index 3a73836..b8ce809 100644
  #include <assert.h>
  int snd_user_file(const char *file, char **result)
 -- 
-1.9.1
+2.6.4
 
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.29.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.0.29.bb
deleted file mode 100644
index 8eaeff4..0000000
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.29.bb
+++ /dev/null
@@ -1,50 +0,0 @@
-SUMMARY = "ALSA sound library"
-HOMEPAGE = "http://www.alsa-project.org"
-BUGTRACKER = "https://bugtrack.alsa-project.org/alsa-bug/login_page.php"
-SECTION = "libs/multimedia"
-LICENSE = "LGPLv2.1 & GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
-                    file://src/socket.c;beginline=1;endline=26;md5=11ff89a8a7a4a690a5c78effe8159545"
-
-BBCLASSEXTEND = "native nativesdk"
-
-# configure.in sets -D__arm__ on the command line for any arm system
-# (not just those with the ARM instruction set), this should be removed,
-# (or replaced by a permitted #define).
-#FIXME: remove the following
-ARM_INSTRUCTION_SET = "arm"
-
-SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/${BP}.tar.bz2 \
-           file://Check-if-wordexp-function-is-supported.patch \
-           file://0001-build-Do-not-try-to-detect-cross-compiler.patch \
-"
-SRC_URI[md5sum] = "de67e0eca72474d6b1121037dafe1024"
-SRC_URI[sha256sum] = "73043c35eb9636be0f4af6a240235c213f12a25feb1f04aeeac8cb7e30fcbdd0"
-
-inherit autotools pkgconfig
-
-require alsa-fpu.inc
-EXTRA_OECONF += "${@get_alsa_fpu_setting(bb, d)} "
-
-EXTRA_OECONF = "--disable-python"
-
-EXTRA_OECONF_append_libc-uclibc = " --with-versioned=no "
-
-PACKAGES =+ "alsa-server libasound alsa-conf-base alsa-conf alsa-doc"
-FILES_${PN} += "${libdir}/${BPN}/smixer/*.so"
-FILES_${PN}-dev += "${libdir}/${BPN}/smixer/*.la"
-FILES_libasound = "${libdir}/libasound.so.*"
-FILES_alsa-server = "${bindir}/*"
-FILES_alsa-conf = "${datadir}/alsa/"
-FILES_alsa-conf-base = "\
-${datadir}/alsa/alsa.conf \
-${datadir}/alsa/cards/aliases.conf \
-${datadir}/alsa/pcm/default.conf \
-${datadir}/alsa/pcm/dmix.conf \
-${datadir}/alsa/pcm/dsnoop.conf"
-
-RDEPENDS_libasound = "alsa-conf-base alsa-conf"
-# upgrade path
-RPROVIDES_${PN}-dev = "alsa-dev"
-RREPLACES_${PN}-dev = "alsa-dev"
-RCONFLICTS_${PN}-dev = "alsa-dev"
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.0.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.1.0.bb
new file mode 100644
index 0000000..d62c1fc
--- /dev/null
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.0.bb
@@ -0,0 +1,49 @@
+SUMMARY = "ALSA sound library"
+HOMEPAGE = "http://www.alsa-project.org"
+BUGTRACKER = "https://bugtrack.alsa-project.org/alsa-bug/login_page.php"
+SECTION = "libs/multimedia"
+LICENSE = "LGPLv2.1 & GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7fbc338309ac38fefcd64b04bb903e34 \
+                    file://src/socket.c;beginline=1;endline=26;md5=11ff89a8a7a4a690a5c78effe8159545"
+
+BBCLASSEXTEND = "native nativesdk"
+
+# configure.in sets -D__arm__ on the command line for any arm system
+# (not just those with the ARM instruction set), this should be removed,
+# (or replaced by a permitted #define).
+#FIXME: remove the following
+ARM_INSTRUCTION_SET = "arm"
+
+SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/${BP}.tar.bz2 \
+           file://Check-if-wordexp-function-is-supported.patch \
+"
+SRC_URI[md5sum] = "69515ca73c3c4a212ef45160dea846c1"
+SRC_URI[sha256sum] = "dfde65d11e82b68f82e562ab6228c1fb7c78854345d3c57e2c68a9dd3dae1f15"
+
+inherit autotools pkgconfig
+
+require alsa-fpu.inc
+EXTRA_OECONF += "${@get_alsa_fpu_setting(bb, d)} "
+
+EXTRA_OECONF = "--disable-python"
+
+EXTRA_OECONF_append_libc-uclibc = " --with-versioned=no "
+
+PACKAGES =+ "alsa-server libasound alsa-conf-base alsa-conf alsa-doc"
+FILES_${PN} += "${libdir}/${BPN}/smixer/*.so"
+FILES_${PN}-dev += "${libdir}/${BPN}/smixer/*.la"
+FILES_libasound = "${libdir}/libasound.so.*"
+FILES_alsa-server = "${bindir}/*"
+FILES_alsa-conf = "${datadir}/alsa/"
+FILES_alsa-conf-base = "\
+${datadir}/alsa/alsa.conf \
+${datadir}/alsa/cards/aliases.conf \
+${datadir}/alsa/pcm/default.conf \
+${datadir}/alsa/pcm/dmix.conf \
+${datadir}/alsa/pcm/dsnoop.conf"
+
+RDEPENDS_libasound = "alsa-conf-base alsa-conf"
+# upgrade path
+RPROVIDES_${PN}-dev = "alsa-dev"
+RREPLACES_${PN}-dev = "alsa-dev"
+RCONFLICTS_${PN}-dev = "alsa-dev"
-- 
2.6.4


