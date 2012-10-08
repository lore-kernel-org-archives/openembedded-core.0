Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <daniel@fooishbar.org>) id 1TL9kG-0003r4-UE
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Oct 2012 11:35:29 +0200
Received: by mail-da0-f47.google.com with SMTP id s35so1311657dak.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Oct 2012 02:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=rgxzo2f6MTYk4uCSmm2L7EaREjsHZK7Tgd+RFxXG+eE=;
	b=EkJFzXpUdZzbRJCiAkeM2wtvd/EBK8xN76DK9Ouxn7eamSsb3AR4eVfU7ibhWCHjpV
	gnADt/aSHuXdb35VURhH6VNKZGPqt+4JSXkQdabrmlZ31WCw3LU5xR34GUlGwxu4MYll
	uSrTS/3RrIhTB0aGNtoMooheAXEFY9FZ/In2yfhgX2/stmhmh8v8+IYRPYQIDch7Gxnb
	YBTxKrcLHZYJ1+4H+srTomcMV4cHLFr2cNnp9Xi6F0cg0lDvxnbKiuHkiXpmAODLPbdl
	67y9d/0M5jzvZBLDsxRLi6wRC1HKKbYj1bPVO81frT4kYHoBH6LorANXpm5M7RV/5yEp
	vcTA==
Received: by 10.66.86.2 with SMTP id l2mr41775160paz.70.1349688142200;
	Mon, 08 Oct 2012 02:22:22 -0700 (PDT)
Received: from swamp81.fooishbar.org (115-64-155-100.static.tpgi.com.au.
	[115.64.155.100])
	by mx.google.com with ESMTPS id uu10sm10457527pbc.2.2012.10.08.02.22.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 08 Oct 2012 02:22:21 -0700 (PDT)
Received: by swamp81.fooishbar.org (Postfix, from userid 1000)
	id 7BDB7771; Mon,  8 Oct 2012 20:22:17 +1100 (EST)
From: Daniel Stone <daniel@fooishbar.org>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Oct 2012 20:22:15 +1100
Message-Id: <1349688137-22470-1-git-send-email-daniel@fooishbar.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1349687945.15658.100.camel@ted>
References: <1349687945.15658.100.camel@ted>
X-Gm-Message-State: ALoCoQkZkCb6k6Wn1N5mjgf+PNsX/EFJmR68NEJJUwR+Hx7Dt8R2RGFXbbmpKpGfBM5TNK1ybrdZ
Subject: [PATCH 1/3] Revert "libdrm: Explicitly disable the cairo dependency"
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

A better patch has already been pushed upstream.

This reverts commit 7f4a8dd914e35c2eaaba7bd953273d10a94d85eb.
---
 meta/recipes-graphics/drm/libdrm.inc           |    2 --
 meta/recipes-graphics/drm/libdrm/nocairo.patch |   39 ------------------------
 meta/recipes-graphics/drm/libdrm_2.4.39.bb     |    1 -
 3 files changed, 42 deletions(-)
 delete mode 100644 meta/recipes-graphics/drm/libdrm/nocairo.patch

diff --git a/meta/recipes-graphics/drm/libdrm.inc b/meta/recipes-graphics/drm/libdrm.inc
index 2ed9c14..cc09791 100644
--- a/meta/recipes-graphics/drm/libdrm.inc
+++ b/meta/recipes-graphics/drm/libdrm.inc
@@ -18,8 +18,6 @@ DEPENDS += " libpciaccess"
 
 inherit autotools pkgconfig
 
-EXTRA_OECONF += "--disable-cairo"
-
 PACKAGES =+ "${PN}-tests ${PN}-drivers ${PN}-kms"
 FILES_${PN}-tests = "${bindir}/dr* ${bindir}/mode*"
 FILES_${PN}-drivers = "${libdir}/libdrm_*.so.*"
diff --git a/meta/recipes-graphics/drm/libdrm/nocairo.patch b/meta/recipes-graphics/drm/libdrm/nocairo.patch
deleted file mode 100644
index f9b7f3a..0000000
--- a/meta/recipes-graphics/drm/libdrm/nocairo.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-We don't want the cairo dependency. Unfortunately simply checking whether its present 
-isn't good enough. If its not in DEPENDS, it can disappear half way through building.
-We therefore need to explictly disable it.
-
-RP
-2012/10/5
-
-Index: libdrm-2.4.39/configure.ac
-===================================================================
---- libdrm-2.4.39.orig/configure.ac	2012-08-24 14:54:42.000000000 +0000
-+++ libdrm-2.4.39/configure.ac	2012-10-05 11:37:52.484821221 +0000
-@@ -63,6 +63,11 @@
- 	      [Disable KMS mm abstraction library (default: auto)]),
- 	      [LIBKMS=$enableval], [LIBKMS=auto])
- 
-+AC_ARG_ENABLE(cairo,
-+	      AS_HELP_STRING([--disable-cairo],
-+	      [Disable cairo (default: auto)]),
-+	      [ENABLECAIRO=$enableval], [ENABLECAIRO=auto])
-+
- AC_ARG_ENABLE(intel,
- 	      AS_HELP_STRING([--disable-intel],
- 	      [Enable support for intel's KMS API (default: auto)]),
-@@ -201,9 +206,12 @@
- 	AC_DEFINE(HAVE_EXYNOS, 1, [Have EXYNOS support])
- fi
- 
--PKG_CHECK_MODULES(CAIRO, cairo, [HAVE_CAIRO=yes], [HAVE_CAIRO=no])
--if test "x$HAVE_CAIRO" = xyes; then
--	AC_DEFINE(HAVE_CAIRO, 1, [Have cairo support])
-+HAVE_CAIRO=no
-+if test "x$ENABLECAIRO" = xyes; then
-+	PKG_CHECK_MODULES(CAIRO, cairo, [HAVE_CAIRO=yes], [HAVE_CAIRO=no])
-+	if test "x$HAVE_CAIRO" = xyes; then
-+		AC_DEFINE(HAVE_CAIRO, 1, [Have cairo support])
-+	fi
- fi
- AM_CONDITIONAL(HAVE_CAIRO, [test "x$HAVE_CAIRO" = xyes])
- 
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.39.bb b/meta/recipes-graphics/drm/libdrm_2.4.39.bb
index cb1f7f9..4e6a8d5 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.39.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.39.bb
@@ -4,7 +4,6 @@ PR = "${INC_PR}.0"
 
 SRC_URI += "file://installtests.patch \
             file://GNU_SOURCE_definition.patch \
-            file://nocairo.patch \
            "
 
 SRC_URI[md5sum] = "9a299e021d81bab6c82307582c78319d"
-- 
1.7.10.4



