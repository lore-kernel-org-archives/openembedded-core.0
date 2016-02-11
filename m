Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3684160107
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 23:40:02 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id c200so95697725wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 15:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=L9hyAc7ieQ6n/TS3jtOv5KR+mM5ssW/5SydjCy4eo+g=;
	b=vGi1FhmyAXxpWzqYtnHOFdj4WOFG/4CmxXvn6XNfCiFWhv1WFLtejO7Nxj82/KG0hX
	QX9hI3Mh7W79oepPPYIqn6KABDEcFeypmCjybR55h7EzZrO/bImJ4xAbNaij9c83YNem
	LRzJvViHE/7cDlmBWRH+NQh8v2iQVZU2DKpUE+MyGUjJdx3Nf9US26KQP6NNjbu9KPYN
	/IuiHnJY5YX9jNmTlxNTURMiuzkqFfK/0ZWSvcqHco4LKI8EFLvs9cuCAZKgTbjxFqve
	0k2/f2SuN/H4OEQ3CZJ9JA3mFPCRtkpAPnNpfMD97ggpwDZr+vcAspnOUEV+u0PWhdFv
	3M8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=L9hyAc7ieQ6n/TS3jtOv5KR+mM5ssW/5SydjCy4eo+g=;
	b=E0BzqFxSrpRh0V8XQ3IPkVtuCrrWv3Fx0udX9ccNgh+2IYXHeKsXqe0+BbS5k8KZaN
	/pcTuradVTKha96+kg6uVxGPx4TeiJkRPbShSv5AVA/o/GkGF1IVaIizdUrUOQ4Lvf16
	SirNqdIoVTvMPyFOOm3M8UtRvNhzeK6j0XKvKtsFNhR7RlCxvy7u4YACRhURtNLDmLaA
	SEDcqWI5DCHzbRN1+NHmuK4zFRaJwohYQE4Eh+RVsDyXkkn3a1Jl1Qeo6I1PjZVlG5XP
	hHC9oKKixZBMJdsELNaNybtXZE03CGp8fljt8rQKAYH3qV/OXlBHPqyilC7e/Pv03occ
	CEEQ==
X-Gm-Message-State: AG10YORv8wTXlQdVGMAbspkkyA5rFpZKL2sCA4vcaKjwlnftg5WTuIeoM4J7TvvvblqYkhQp
X-Received: by 10.28.182.136 with SMTP id g130mr1165671wmf.10.1455234002990;
	Thu, 11 Feb 2016 15:40:02 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	xx3sm9590056wjc.32.2016.02.11.15.40.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 Feb 2016 15:40:02 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Feb 2016 23:39:54 +0000
Message-Id: <1455233994-12069-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
MIME-Version: 1.0
Subject: [PATCH] libdrm: don't detect components that have been disabled
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
X-List-Received-Date: Thu, 11 Feb 2016 23:40:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We pass --disable-cairo-tests but if cairo is in the sysroot it is detected and
used, which causes problems in mass builds as cairo could be removed whilst
libdrm is being built.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/drm/libdrm/detect.patch | 59 +++++++++++++++++++++++++++
 meta/recipes-graphics/drm/libdrm_2.4.66.bb    |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-graphics/drm/libdrm/detect.patch

diff --git a/meta/recipes-graphics/drm/libdrm/detect.patch b/meta/recipes-graphics/drm/libdrm/detect.patch
new file mode 100644
index 0000000..6397a59
--- /dev/null
+++ b/meta/recipes-graphics/drm/libdrm/detect.patch
@@ -0,0 +1,59 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+commit 798022b61c58d945f9027c823a188dcedecd3d06
+Author: Marcin Ślusarz <marcin.slusarz@gmail.com>
+Date:   Sun Jan 24 13:17:34 2016 +0100
+
+    configure.ac: don't detect disabled options dependencies
+    
+    Currently with --disable-amdgpu --disable-valgrind --disable-cairo-tests
+    cunit, valgrind and cairo are still detected.
+    
+    Signed-off-by: Marcin Ślusarz <marcin.slusarz@gmail.com>
+    Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
+
+diff --git a/configure.ac b/configure.ac
+index 057a846..a09be61 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -363,12 +363,14 @@ fi
+-# Detect cunit library
+-PKG_CHECK_MODULES([CUNIT], [cunit >= 2.1], [have_cunit=yes], [have_cunit=no])
+-# If pkg-config does not find cunit, check it using AC_CHECK_LIB.  We
+-# do this because Debian (Ubuntu) lacks pkg-config file for cunit.
+-# fixed in 2.1-2.dfsg-3: http://anonscm.debian.org/cgit/collab-maint/cunit.git/commit/?h=debian
+-if test "x${have_cunit}" = "xno"; then
+-	AC_CHECK_LIB([cunit], [CU_initialize_registry], [have_cunit=yes], [have_cunit=no])
+-	if test "x${have_cunit}" = "xyes"; then
+-		CUNIT_LIBS="-lcunit"
+-		CUNIT_CFLAGS=""
+-		AC_SUBST([CUNIT_LIBS])
+-		AC_SUBST([CUNIT_CFLAGS])
++if test "x$AMDGPU" != xno; then
++	# Detect cunit library
++	PKG_CHECK_MODULES([CUNIT], [cunit >= 2.1], [have_cunit=yes], [have_cunit=no])
++	# If pkg-config does not find cunit, check it using AC_CHECK_LIB.  We
++	# do this because Debian (Ubuntu) lacks pkg-config file for cunit.
++	# fixed in 2.1-2.dfsg-3: http://anonscm.debian.org/cgit/collab-maint/cunit.git/commit/?h=debian
++	if test "x${have_cunit}" = "xno"; then
++		AC_CHECK_LIB([cunit], [CU_initialize_registry], [have_cunit=yes], [have_cunit=no])
++		if test "x${have_cunit}" = "xyes"; then
++			CUNIT_LIBS="-lcunit"
++			CUNIT_CFLAGS=""
++			AC_SUBST([CUNIT_LIBS])
++			AC_SUBST([CUNIT_CFLAGS])
++		fi
+@@ -375,0 +378,2 @@ if test "x${have_cunit}" = "xno"; then
++else
++	have_cunit=no
+@@ -404 +408,3 @@ AC_ARG_ENABLE([cairo-tests],
+-PKG_CHECK_MODULES(CAIRO, cairo, [HAVE_CAIRO=yes], [HAVE_CAIRO=no])
++if test "x$CAIRO" != xno; then
++	PKG_CHECK_MODULES(CAIRO, cairo, [HAVE_CAIRO=yes], [HAVE_CAIRO=no])
++fi
+@@ -449 +455,3 @@ AC_ARG_ENABLE(valgrind,
+-PKG_CHECK_MODULES(VALGRIND, [valgrind], [have_valgrind=yes], [have_valgrind=no])
++if test "x$VALGRIND" != xno; then
++	PKG_CHECK_MODULES(VALGRIND, [valgrind], [have_valgrind=yes], [have_valgrind=no])
++fi
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.66.bb b/meta/recipes-graphics/drm/libdrm_2.4.66.bb
index 028db4a..3280920 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.66.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.66.bb
@@ -13,6 +13,7 @@ DEPENDS = "libpthread-stubs udev libpciaccess"
 SRC_URI = "http://dri.freedesktop.org/libdrm/${BP}.tar.bz2 \
            file://installtests.patch \
            file://0001-tests-kms-steal-crtc-Include-sys-select.h.patch \
+           file://detect.patch \
           "
 
 SRC_URI[md5sum] = "c6809c48538d6e5999588832045ff014"
-- 
2.7.0


