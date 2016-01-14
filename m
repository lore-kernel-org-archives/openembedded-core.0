Return-Path: <tanuk@iki.fi>
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
	[66.111.4.27])
	by mail.openembedded.org (Postfix) with ESMTP id C6AD7731D2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 12:41:34 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id B3F8F20AFD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 07:41:34 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
	by compute6.internal (MEProxy); Thu, 14 Jan 2016 07:41:34 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:in-reply-to:message-id
	:references:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=zbC3
	SsSDQXtM1WUZu4LCTfKFAww=; b=ic0ilFsg6sryBKoUFfVmB1Gqjm92vsGJ1f31
	7jim7Cwc4rcUP6xK+kvASkqelajOGc7+tsViG0zEIIhJtOotNzlka+NILbMoU5M+
	x0OREYHSL8XcUErvbeXKrzrP7GhNezZCgW1lXaZmdSfNcYuOnqK15aSDFFdiJbkb
	tVhjEqg=
X-Sasl-enc: lIAFNEzCqlb4irTq1O9APror40ZHNS7x2pUWLXX2r2GH 1452775294
Received: from laptop.tanuk.dy.fi (a88-114-110-232.elisa-laajakaista.fi
	[88.114.110.232])
	by mail.messagingengine.com (Postfix) with ESMTPA id 2A1B4680174
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 07:41:34 -0500 (EST)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Jan 2016 14:41:22 +0200
Message-Id: <1452775282-5514-1-git-send-email-tanuk@iki.fi>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1452754378-2096-1-git-send-email-tanuk@iki.fi>
References: <1452754378-2096-1-git-send-email-tanuk@iki.fi>
Subject: [PATCH v2] alsa-lib: 1.0.29 -> 1.1.0
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
X-List-Received-Date: Thu, 14 Jan 2016 12:41:35 -0000

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

Sorry, I sent v1 again without rename detection, making the changes
hard to see. I now found that "git config diff.renames" helps with
this, so this shouldn't happen any more. There are no functional
changes in v2.

 ...build-Do-not-try-to-detect-cross-compiler.patch | 45 ----------------------
 .../Check-if-wordexp-function-is-supported.patch   | 14 +++----
 .../alsa/{alsa-lib_1.0.29.bb => alsa-lib_1.1.0.bb} |  5 +--
 3 files changed, 9 insertions(+), 55 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0001-build-Do-not-try-to-detect-cross-compiler.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.0.29.bb => alsa-lib_1.1.0.bb} (88%)

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
 
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.0.29.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.1.0.bb
similarity index 88%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.0.29.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.1.0.bb
index 8eaeff4..d62c1fc 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.0.29.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.0.bb
@@ -16,10 +16,9 @@ ARM_INSTRUCTION_SET = "arm"
 
 SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/${BP}.tar.bz2 \
            file://Check-if-wordexp-function-is-supported.patch \
-           file://0001-build-Do-not-try-to-detect-cross-compiler.patch \
 "
-SRC_URI[md5sum] = "de67e0eca72474d6b1121037dafe1024"
-SRC_URI[sha256sum] = "73043c35eb9636be0f4af6a240235c213f12a25feb1f04aeeac8cb7e30fcbdd0"
+SRC_URI[md5sum] = "69515ca73c3c4a212ef45160dea846c1"
+SRC_URI[sha256sum] = "dfde65d11e82b68f82e562ab6228c1fb7c78854345d3c57e2c68a9dd3dae1f15"
 
 inherit autotools pkgconfig
 
-- 
2.6.4


