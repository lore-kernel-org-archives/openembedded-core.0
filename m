Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6DA8D78AD3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jul 2018 13:04:21 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id w16-v6so2262139wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jul 2018 06:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=eJLzobHC50kHb1qGvs8laHYwb3xnhZq58U9uOUlDQAk=;
	b=Vo4COn5d7HP952sLjZvKLR5MZ+4JujMQ1QvWyXYEX53t7UWo0MVFI+7mwsoVJj3VuN
	JTmGvbzszcJ+auvGwAQ40JcaNyv+1c/sbgRrPyTAyceXR9L78g8cn5rn6SpNcjHg7BoL
	NjOAAzOWn9G4oySqOairBqsEY+cH5ZmiWp63Q8MAy5vPQyyBMPkaViEVdNC5gtgPWm3x
	oGP+Gk2pjYCqL3ontFmpl9H2QPjrV57aiEOSiW1tLjx6a77fCsyAiSUOHOwPOYIico5g
	XG8dLRJJufY1tZzova1r1WAhu1TR6cY6kYxuus99FAoP5vVOOz11CV/VaPlXHRrxwdfL
	J3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=eJLzobHC50kHb1qGvs8laHYwb3xnhZq58U9uOUlDQAk=;
	b=DVXzyHRfLmkgVIX2F440M1FAN4J0bPRBRVYJKkh/BNpSegRLazy/0W06/fmH5cg48S
	8HkKrnwAH/KOCK8nj/x1GFHeFQ7OBTf9NfNc+d7lLKzXS3VZH0459gVDn8gXv4wdv/OE
	n2YismDqsEdkHF1W2ALs0fFmafGe8BscQqOmOzEll8UYDT1dPghSD0k73R6T2eN17Xof
	EDLbd37cDfRh810JuN/n5nWVhFhlu+Xt1IgMw2H1DxJImJ7ic4p4f73/FILmdlynBN2Y
	knArUaCdjMJDZPx7V9AioFjXjNb+dlIYaJkeL4rlIO/K1ddOMHN5ogy1KEE/dJoLeIWE
	G3BA==
X-Gm-Message-State: APt69E2HobA3PtukpTdIb92BrwOqgL6JTa6BjVw9aeDHx+1F4LEgozzD
	F6ZEoPxuKp3BFA1IWXhOWW4jSg3l
X-Google-Smtp-Source: AAOMgpdr6Dan/+ccZXh4PWMvo3RcBTdhxQF+DVqaaXXVUwu60i6XtxhGbEiPoqd3cBJag4iFjj5KWA==
X-Received: by 2002:a1c:f009:: with SMTP id
	a9-v6mr11231819wmb.104.1530623061689; 
	Tue, 03 Jul 2018 06:04:21 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	j9-v6sm1863006wrr.52.2018.07.03.06.04.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Jul 2018 06:04:20 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Jul 2018 14:04:12 +0100
Message-Id: <20180703130412.26102-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180703130412.26102-1-ross.burton@intel.com>
References: <20180703130412.26102-1-ross.burton@intel.com>
Subject: [PATCH 4/4] libdrm: port to Meson
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
X-List-Received-Date: Tue, 03 Jul 2018 13:04:21 -0000

Drop the patch to install tests as the Meson build allows this.

Drop the patch to disable cunit as this predates recipe-specific-sysroots and
isn't required anymore.

As Meson always builds the test suite (instead of building before running it),
add a patch to fix compilation with musl.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...ac-Allow-explicit-enabling-of-cunit-tests.patch | 53 ----------------------
 .../recipes-graphics/drm/libdrm/installtests.patch | 25 ----------
 meta/recipes-graphics/drm/libdrm/musl-ioctl.patch  | 35 ++++++++++++++
 meta/recipes-graphics/drm/libdrm_2.4.92.bb         | 22 ++++-----
 4 files changed, 44 insertions(+), 91 deletions(-)
 delete mode 100644 meta/recipes-graphics/drm/libdrm/0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch
 delete mode 100644 meta/recipes-graphics/drm/libdrm/installtests.patch
 create mode 100644 meta/recipes-graphics/drm/libdrm/musl-ioctl.patch

diff --git a/meta/recipes-graphics/drm/libdrm/0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch b/meta/recipes-graphics/drm/libdrm/0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch
deleted file mode 100644
index 40bebc0f50c..00000000000
--- a/meta/recipes-graphics/drm/libdrm/0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From e6bd4205b0b546afe991ae6f72256645f4404ad4 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Mon, 5 Sep 2016 14:41:37 +0300
-Subject: [PATCH libdrm] configure.ac: Allow explicit enabling of cunit tests
-
-Add --with-cunit to make it easier to do reproducible builds. Default
-is still to probe cunit and build opportunistically.
-
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Upstream-Status: Submitted [mailing list]
----
- configure.ac | 14 ++++++++++++--
- 1 file changed, 12 insertions(+), 2 deletions(-)
-
-Index: libdrm-2.4.91/configure.ac
-===================================================================
---- libdrm-2.4.91.orig/configure.ac
-+++ libdrm-2.4.91/configure.ac
-@@ -163,6 +163,12 @@ AC_ARG_ENABLE(install-test-programs,
- 		  [Install test programs (default: no)]),
- 		  [INSTALL_TESTS=$enableval], [INSTALL_TESTS=no])
- 
-+AC_ARG_WITH([cunit],
-+            [AS_HELP_STRING([--with-cunit],
-+                            [Build tests that use cunit (default: auto)])],
-+            [],
-+            [with_cunit=auto])
-+
- dnl ===========================================================================
- dnl check compiler flags
- AC_DEFUN([LIBDRM_CC_TRY_FLAG], [
-@@ -411,7 +417,7 @@ else
- 	AC_DEFINE(HAVE_RADEON, 0)
- fi
- 
--if test "x$AMDGPU" != xno; then
-+if test "x$with_cunit" != xno -a "x$AMDGPU" != xno; then
- 	# Detect cunit library
- 	PKG_CHECK_MODULES([CUNIT], [cunit >= 2.1], [have_cunit=yes], [have_cunit=no])
- 	# If pkg-config does not find cunit, check it using AC_CHECK_LIB.  We
-@@ -436,7 +442,11 @@ if test "x$AMDGPU" = xyes; then
- 	AC_DEFINE(HAVE_AMDGPU, 1, [Have amdgpu support])
- 
- 	if test "x$have_cunit" = "xno"; then
--		AC_MSG_WARN([Could not find cunit library. Disabling amdgpu tests])
-+		if test "x$with_cunit" = "xyes"; then
-+			AC_MSG_ERROR([Could not find cunit library but --with-cunit was given])
-+		elif test "x$with_cunit" = "xauto"; then
-+			AC_MSG_WARN([Could not find cunit library. Disabling amdgpu tests])
-+		fi
- 	fi
- else
- 	AC_DEFINE(HAVE_AMDGPU, 0)
diff --git a/meta/recipes-graphics/drm/libdrm/installtests.patch b/meta/recipes-graphics/drm/libdrm/installtests.patch
deleted file mode 100644
index ec1fb0236e4..00000000000
--- a/meta/recipes-graphics/drm/libdrm/installtests.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 5c6eb43c2f6e7f2ee7c25c92e42f4e4403fa0527 Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Tue, 21 Feb 2017 14:37:52 +0200
-Subject: [PATCH] tests: also install test apps
-
-Upstream-Status: Inappropriate [configuration]
-
-Signed-off-by: Yu Ke <ke.yu@intel.com>
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- tests/Makefile.am | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index 0355a92..b4882cd 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -45,3 +45,4 @@ TESTS = \
- check_PROGRAMS = \
- 	$(TESTS) \
- 	drmdevice
-+bin_PROGRAMS = $(check_PROGRAMS)
--- 
-2.1.4
-
diff --git a/meta/recipes-graphics/drm/libdrm/musl-ioctl.patch b/meta/recipes-graphics/drm/libdrm/musl-ioctl.patch
new file mode 100644
index 00000000000..e3d6c5b8537
--- /dev/null
+++ b/meta/recipes-graphics/drm/libdrm/musl-ioctl.patch
@@ -0,0 +1,35 @@
+Upstream-Status: Submitted
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 46c0fd6c827a8cb4d04e067bf04fab579ac4712e Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Mon, 18 Jun 2018 15:07:03 +0100
+Subject: [PATCH] tests/nouveau/threaded: adapt ioctl signature
+
+POSIX says ioctl() has the signature (int, int, ...) but glibc has decided to
+use (int, unsigned long int, ...) instead.
+
+Use a #ifdef to adapt the replacement function as appropriate.
+---
+ tests/nouveau/threaded.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/tests/nouveau/threaded.c b/tests/nouveau/threaded.c
+index 3669bcd3..e1c27c01 100644
+--- a/tests/nouveau/threaded.c
++++ b/tests/nouveau/threaded.c
+@@ -36,7 +36,11 @@ static int failed;
+ 
+ static int import_fd;
+ 
++#ifdef __GLIBC__
+ int ioctl(int fd, unsigned long request, ...)
++#else
++int ioctl(int fd, int request, ...)
++#endif
+ {
+ 	va_list va;
+ 	int ret;
+-- 
+2.11.0
+
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.92.bb b/meta/recipes-graphics/drm/libdrm_2.4.92.bb
index 2b3bf4f83d2..347090cd5f2 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.92.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.92.bb
@@ -11,23 +11,19 @@ PROVIDES = "drm"
 DEPENDS = "libpthread-stubs libpciaccess"
 
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
-           file://installtests.patch \
-           file://0001-configure.ac-Allow-explicit-enabling-of-cunit-tests.patch \
-          "
-
+           file://musl-ioctl.patch"
 SRC_URI[md5sum] = "f9b00d985f82d0be6ecc20c799acc89e"
 SRC_URI[sha256sum] = "e9e48fdb4de139dc4d9880aa1473158a16ff6aff63d14341367bd30a51ff39fa"
 
-inherit autotools pkgconfig manpages
+inherit meson pkgconfig manpages
+
+EXTRA_OEMESON = "-Dvalgrind=false \
+                 -Dcairo-tests=false \
+                 -Dinstall-test-programs=true \
+                 -Domap=true \
+                 -Detnaviv=true"
 
-EXTRA_OECONF += "--disable-cairo-tests \
-                 --without-cunit \
-                 --enable-omap-experimental-api \
-                 --enable-etnaviv-experimental-api \
-                 --enable-install-test-programs \
-                 --disable-valgrind \
-                "
-PACKAGECONFIG[manpages] = "--enable-manpages, --disable-manpages, libxslt-native xmlto-native"
+PACKAGECONFIG[manpages] = "-Dman-pages=true,-Dman-pages=false,libxslt-native xmlto-native"
 
 ALLOW_EMPTY_${PN}-drivers = "1"
 PACKAGES =+ "${PN}-tests ${PN}-drivers ${PN}-radeon ${PN}-nouveau ${PN}-omap \
-- 
2.11.0


