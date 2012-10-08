Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <daniel@fooishbar.org>) id 1TL9kH-0003r6-Bm
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Oct 2012 11:35:29 +0200
Received: by mail-da0-f47.google.com with SMTP id s35so1311663dak.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Oct 2012 02:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=17GqbrrhLT6wpFl2/rTbjObCEWK6Dme/XEiFphWOeuw=;
	b=OkLG0IY5OfTXVoS5Sd36AsQHtn4a1bVSM6QoPecGpczHCX8ol4PsnQ5cpQ/8s1peSa
	wKI6SutSXGhfIlS8gxNU/PBhZWUWeAzvZKKMJXzaLc25K2U+OhZRSkMePMRWb6oBAfT0
	GYcUPHu2FRxUYpAXZRGJCj2PZVTkHD7GJL+7zTJ0BoEVgBDBuFQhxWW9Wt4qw99PZsfe
	XdUtsVp05TV3axmkbAd6NISGvg4d8KvbQjrC0/ljBAFbtH0Dq3QS+Tn1BckgfM0iD9rf
	a8f6YC2kaFq3u/Oqc6Q4e6MV2ZCJDGr/gq+IKhsq1Hc3zb3OaMZG3FHrpC8stViHuAw/
	i/Vw==
Received: by 10.66.9.2 with SMTP id v2mr41235274paa.65.1349688142695;
	Mon, 08 Oct 2012 02:22:22 -0700 (PDT)
Received: from swamp81.fooishbar.org (115-64-155-100.static.tpgi.com.au.
	[115.64.155.100])
	by mx.google.com with ESMTPS id vz8sm10442350pbc.63.2012.10.08.02.22.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 08 Oct 2012 02:22:21 -0700 (PDT)
Received: by swamp81.fooishbar.org (Postfix, from userid 1000)
	id 84A131167; Mon,  8 Oct 2012 20:22:17 +1100 (EST)
From: Daniel Stone <daniel@fooishbar.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Oct 2012 20:22:17 +1100
Message-Id: <1349688137-22470-3-git-send-email-daniel@fooishbar.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1349688137-22470-1-git-send-email-daniel@fooishbar.org>
References: <1349687945.15658.100.camel@ted>
	<1349688137-22470-1-git-send-email-daniel@fooishbar.org>
X-Gm-Message-State: ALoCoQltmS3RIM8F0/fmULnW3U/jM9FOvfNa71l88NydiqRXIryBcKO8NdMYo3d56iTrxjty19cO
Subject: [PATCH 3/3] DRM: Add --disable-cairo-tests switch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Oct 2012 09:35:29 -0000

Rather than implicitly relying on Cairo being disabled through not being
present, add a configure switch to forcibly disable it.

Patch backported from upstream git.

Signed-off-by: Daniel Stone <daniel@fooishbar.org>
---
 meta/recipes-graphics/drm/libdrm.inc               |    2 +
 .../drm/libdrm/disable-cairo.patch                 |   74 ++++++++++++++++++++
 meta/recipes-graphics/drm/libdrm_2.4.39.bb         |    1 +
 3 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-graphics/drm/libdrm/disable-cairo.patch

diff --git a/meta/recipes-graphics/drm/libdrm.inc b/meta/recipes-graphics/drm/libdrm.inc
index cc09791..a64a5df 100644
--- a/meta/recipes-graphics/drm/libdrm.inc
+++ b/meta/recipes-graphics/drm/libdrm.inc
@@ -18,6 +18,8 @@ DEPENDS += " libpciaccess"
 
 inherit autotools pkgconfig
 
+EXTRA_OECONF += "--disable-cairo-tests"
+
 PACKAGES =+ "${PN}-tests ${PN}-drivers ${PN}-kms"
 FILES_${PN}-tests = "${bindir}/dr* ${bindir}/mode*"
 FILES_${PN}-drivers = "${libdir}/libdrm_*.so.*"
diff --git a/meta/recipes-graphics/drm/libdrm/disable-cairo.patch b/meta/recipes-graphics/drm/libdrm/disable-cairo.patch
new file mode 100644
index 0000000..90e79d4
--- /dev/null
+++ b/meta/recipes-graphics/drm/libdrm/disable-cairo.patch
@@ -0,0 +1,74 @@
+commit c81d1df4926072d24b4dad1b488e618e57eff1c6
+Author: Daniel Stone <daniel@fooishbar.org>
+Date:   Thu Oct 4 10:26:37 2012 +1000
+
+    configure.ac: Allow forcible disabling of Cairo support
+    
+    We don't want to build libdrm tests with Cairo support under Poky, since
+    they're never used and also cause a build loop from libdrm -> cairo ->
+    mesa-dri -> libdrm.
+    
+    To avoid variance in build results, introduce a --disable-cairo-tests
+    switch.
+    
+    Upstream-Status: Backport
+    
+    Signed-off-by: Daniel Stone <daniel@fooishbar.org>
+
+diff --git a/configure.ac b/configure.ac
+index 290362c..8c28107 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -222,11 +222,23 @@ if test "x$EXYNOS" = xyes; then
+ 	AC_DEFINE(HAVE_EXYNOS, 1, [Have EXYNOS support])
+ fi
+ 
++AC_ARG_ENABLE([cairo-tests],
++              [AS_HELP_STRING([--enable-cairo-tests],
++                              [Enable support for Cairo rendering in tests (default: auto)])],
++              [CAIRO=$enableval], [CAIRO=auto])
+ PKG_CHECK_MODULES(CAIRO, cairo, [HAVE_CAIRO=yes], [HAVE_CAIRO=no])
+-if test "x$HAVE_CAIRO" = xyes; then
+-	AC_DEFINE(HAVE_CAIRO, 1, [Have cairo support])
++AC_MSG_CHECKING([whether to enable Cairo tests])
++if test "x$CAIRO" = xauto; then
++	CAIRO="$HAVE_CAIRO"
+ fi
+-AM_CONDITIONAL(HAVE_CAIRO, [test "x$HAVE_CAIRO" = xyes])
++if test "x$CAIRO" = xyes; then
++	if ! test "x$HAVE_CAIRO" = xyes; then
++		AC_MSG_ERROR([Cairo support required but not present])
++	fi
++	AC_DEFINE(HAVE_CAIRO, 1, [Have Cairo support])
++fi
++AC_MSG_RESULT([$CAIRO])
++AM_CONDITIONAL(HAVE_CAIRO, [test "x$CAIRO" = xyes])
+ 
+ # For enumerating devices in test case
+ PKG_CHECK_MODULES(LIBUDEV, libudev, [HAVE_LIBUDEV=yes], [HAVE_LIBUDEV=no])
+diff --git a/tests/modetest/Makefile.am b/tests/modetest/Makefile.am
+index b5ec771..065ae13 100644
+--- a/tests/modetest/Makefile.am
++++ b/tests/modetest/Makefile.am
+@@ -1,8 +1,7 @@
+ AM_CFLAGS = \
+ 	-I$(top_srcdir)/include/drm \
+ 	-I$(top_srcdir)/libkms/ \
+-	-I$(top_srcdir) \
+-	$(CAIRO_CFLAGS)
++	-I$(top_srcdir)
+ 
+ noinst_PROGRAMS = \
+ 	modetest
+@@ -12,5 +11,9 @@ modetest_SOURCES = \
+ 
+ modetest_LDADD = \
+ 	$(top_builddir)/libdrm.la \
+-	$(top_builddir)/libkms/libkms.la \
+-	$(CAIRO_LIBS)
++	$(top_builddir)/libkms/libkms.la
++
++if HAVE_CAIRO
++AM_CFLAGS += $(CAIRO_CFLAGS)
++modetest_LDADD += $(CAIRO_LIBS)
++endif
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.39.bb b/meta/recipes-graphics/drm/libdrm_2.4.39.bb
index 4e6a8d5..f3ce2b1 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.39.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.39.bb
@@ -4,6 +4,7 @@ PR = "${INC_PR}.0"
 
 SRC_URI += "file://installtests.patch \
             file://GNU_SOURCE_definition.patch \
+            file://disable-cairo.patch \
            "
 
 SRC_URI[md5sum] = "9a299e021d81bab6c82307582c78319d"
-- 
1.7.10.4



