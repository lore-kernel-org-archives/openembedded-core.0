Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 376AEC43638
	for <webhook@archiver.kernel.org>; Sat, 27 Jun 2026 07:55:47 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51586.1782546940396414639
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Jun 2026 00:55:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=bjbmMwSD;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-472055b0efaso37438f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 00:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782546938; x=1783151738; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVqt4g35CebGii99qW8wByawO0Lvl77ba5GbfUeMV34=;
        b=bjbmMwSDac+Ocsx1fzpGZdxfGCZpgM02RtAcfr1r7hF6Hk6l8Upcqbg/domVVvoGYr
         gJyQtyX7tE+ioh3VXds3sLY0dpZ2NVXYiiPU8zv/kD5+XL4bZD7B/yDJZik52/7yIv37
         a/MxDprE9Xny+DE54Esb4C3C1DwR33mUSQ6Zrbn8NpDm7M4XERLtFB56M5s7Mteh4MKR
         cmCQJpSpzdLPjoA2ZtMSs94h27BRKZSnMZ0xUyhpo4ypw1yoOgxKVaTzgZIb+d2mvCNn
         6jN1iB/VdOVyTjKMvM/SJgTJmuSOH/cCdEZdlkqhtnahrwb4gAPKbz5Yc7j66ur/VRau
         ShPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782546938; x=1783151738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vVqt4g35CebGii99qW8wByawO0Lvl77ba5GbfUeMV34=;
        b=MV9k/OqDp6Voz3ffKRD3pZbzmUGyIBZjQ+lCyGLD0LQ7uUtBcrboY+3/LIuAVPtw7l
         JpkSyZIqmtb86QOuoiLdfz+BtaFr6dmfJ98y0qcjTJ2YYeHSLer2Ejx61OoRhP1YNdqT
         H2VeXod92Ynr/Ya3xkdR88PF3gzi/ZjY88PBM4D5TIf3HYd5lh5SEKLphehSs9kmtGhB
         Nvzpya5BTJYoXrbiJlipVSn/zqh/CbE6n5DBE8Lmp+ugTFTcHSJQNmZDuQuqm1h1/dnG
         ShHUP+g1Egq1J6LVv9cvWPFvQcu7kCSWpozLDAS8HDg1Sx4WDFs/6qF7RAmkyCeKC7dA
         YOYg==
X-Gm-Message-State: AOJu0YxUdAPJFp5Iiwl6XaZ2DGgUIIyP/wO6qZveBWrxkCMlziyIrhLR
	Nfi3lX0k+oTZ40XMrYg2wjlFBQ3ghBUu8DG9NbquNoLYvV593Uc8ZptoshnZsvLHiw4=
X-Gm-Gg: AfdE7cmO2CrbQoRZ3kTxhLfs9Oi2TLTevXoLoLwct5r6/D5ver4zzgb4ddShMD+STmA
	QqFrbQrtwqa7udFlUyyWdTRLDlW/7+XFQHLDQiQK6j9TLPwmvl21OlMoDEthrG9F7GT6s/LTG5I
	RFGxDYC+w+V8oZ9HhbClps8CB0bYgAtxykEX9DNjpvWkUC80DegYHc2d1bbnwVM/5I276aDhISj
	8LEFN8HYarIvSF+LZoEn+bNzExyK7Iy3BvXu3yKiMbWLeN/NBhjpopmM6fXZJPTf+FsRiQefGEu
	50uElXVo3WilIAzQlHmiULpXlarbxY8kT0bqOaXjZqZRx6IUKKsde2rCInfTwJQaCNw4C/9572A
	EW6JDe5P+ske56Yja2yyd+bGN52Ap1MnFgnVDhkRvlwNYhyWMESFzTSo33QFqBpSmKFTm0yWmaU
	GqW+V3dvNK3rudB1F5NCHAYs+VsLw4fh3nTnOTfNsr69pYlXQ0
X-Received: by 2002:adf:e192:0:b0:43c:f52b:8003 with SMTP id ffacd0b85a97d-46dc35b0820mr16207827f8f.36.1782546938339;
        Sat, 27 Jun 2026 00:55:38 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46f4ffc11d9sm11421952f8f.37.2026.06.27.00.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 00:55:37 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/8] gtk-doc: upgrade 1.35.1 -> 1.36.1
Date: Sat, 27 Jun 2026 09:55:24 +0200
Message-ID: <20260627075532.3153679-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260627075532.3153679-1-alex.kanavin@gmail.com>
References: <20260627075532.3153679-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Jun 2026 07:55:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239686

From: Alexander Kanavin <alex@linutronix.de>

Convert to meson, remove autotools-specific tweaks and patches:
- conditionaltests.patch adds an option already available in meson
- 0001-Do-not-error-out-if-xsltproc-is-not-found.patch
(see below).

Add a patch to avoid unneeded check for runtime python
module dependencies.

Move dependencies needed to run gtk-doc to gtk-doc bbclass
(so they aren't built and pulled in until actually needed).

This allows dropping the 'working-scripts' logic in the recipe,
except for xsltproc-native whose location is used during build.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes-recipe/gtk-doc.bbclass           |  2 +-
 ...t-error-out-if-xsltproc-is-not-found.patch | 28 -------------
 ...code-paths-to-perl-python-in-scripts.patch |  2 +-
 ...not-check-for-pygments-at-build-time.patch | 37 ++++++++++++++++
 .../gtk-doc/files/conditionaltests.patch      | 42 -------------------
 .../gtk-doc/files/no-clobber.patch            |  2 +-
 .../gtk-doc/files/pkg-config-native.patch     |  2 +-
 .../{gtk-doc_1.35.1.bb => gtk-doc_1.36.1.bb}  | 33 ++++-----------
 8 files changed, 49 insertions(+), 99 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-out-if-xsltproc-is-not-found.patch
 create mode 100644 meta/recipes-gnome/gtk-doc/files/0001-meson.build-do-not-check-for-pygments-at-build-time.patch
 delete mode 100644 meta/recipes-gnome/gtk-doc/files/conditionaltests.patch
 rename meta/recipes-gnome/gtk-doc/{gtk-doc_1.35.1.bb => gtk-doc_1.36.1.bb} (51%)

diff --git a/meta/classes-recipe/gtk-doc.bbclass b/meta/classes-recipe/gtk-doc.bbclass
index 9d3911966b..4b1bfb34a1 100644
--- a/meta/classes-recipe/gtk-doc.bbclass
+++ b/meta/classes-recipe/gtk-doc.bbclass
@@ -36,7 +36,7 @@ DEPENDS:append = " gtk-doc-native"
 export STAGING_DIR_HOST
 
 inherit python3native pkgconfig qemu
-DEPENDS:append = "${@' qemu-native' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
+DEPENDS:append = "${@' qemu-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native python3-pygments-native' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
 do_compile:prepend:class-target () {
     if [ ${GTKDOC_ENABLED} = True ]; then
diff --git a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-out-if-xsltproc-is-not-found.patch b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-out-if-xsltproc-is-not-found.patch
deleted file mode 100644
index 575ca5d32f..0000000000
--- a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-error-out-if-xsltproc-is-not-found.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 5d64ab3a7c18904231d611b1262d1289b7282930 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 7 Sep 2016 14:52:04 +0300
-Subject: [PATCH] Do not error out if xsltproc is not found.
-
-This allows us to drop the hard xsltproc dependency, if we're not
-going to actually run the gtkdoc scripts (when api documentation is
-disabled).
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index f238de9..909771d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -37,7 +37,7 @@ dnl Check for xsltproc
- dnl
- AC_PATH_PROG([XSLTPROC], [xsltproc])
- if test -z "$XSLTPROC"; then
--	AC_MSG_ERROR([xsltproc not found])
-+	AC_MSG_WARN([xsltproc not found])
- fi
- 
- dnl
diff --git a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch
index 600ea40f3d..c9d78145ff 100644
--- a/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch
+++ b/meta/recipes-gnome/gtk-doc/files/0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch
@@ -1,4 +1,4 @@
-From 98fc3c6e6ac36a2351ee7ff260bf74a7866c8483 Mon Sep 17 00:00:00 2001
+From 00a3a827aca9e053cb0d69bea50a61fece341f0f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Aug 2016 16:44:46 +0300
 Subject: [PATCH] Do not hardocode paths to perl/python in scripts.
diff --git a/meta/recipes-gnome/gtk-doc/files/0001-meson.build-do-not-check-for-pygments-at-build-time.patch b/meta/recipes-gnome/gtk-doc/files/0001-meson.build-do-not-check-for-pygments-at-build-time.patch
new file mode 100644
index 0000000000..045b7a74a9
--- /dev/null
+++ b/meta/recipes-gnome/gtk-doc/files/0001-meson.build-do-not-check-for-pygments-at-build-time.patch
@@ -0,0 +1,37 @@
+From 80b4f8edc4273803a89d02bb6209734f7cfcce3e Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Sun, 21 Jun 2026 11:11:04 +0200
+Subject: [PATCH] meson.build: do not check for python modules at build time
+
+pygments and parametrized are run-time dependencies, and should
+not be enforced at build time as they are never actually used then.
+
+This is especially useful in cross-compilation, as the modules
+are checked in the python installation on the build host, and that
+has no relevance to the target environment that the build outputs
+will be executed in.
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gtk-doc/-/merge_requests/105]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ meson.build | 7 +------
+ 1 file changed, 1 insertion(+), 6 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 30f1520..a49d734 100644
+--- a/meson.build
++++ b/meson.build
+@@ -8,12 +8,7 @@ fs = import('fs')
+ gnome = import('gnome')
+ python = import('python')
+ 
+-required_python_modules = ['pygments']
+-if get_option('tests')
+-  required_python_modules += ['parameterized']
+-endif
+-
+-python3 = python.find_installation('python3', modules: required_python_modules)
++python3 = python.find_installation('python3')
+ 
+ # Paths
+ srcdir = meson.current_source_dir()
diff --git a/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch b/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch
deleted file mode 100644
index 81017f61ce..0000000000
--- a/meta/recipes-gnome/gtk-doc/files/conditionaltests.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From e4d003318a87ff895b1fcdad1ba4ca3f4f730cf9 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Tue, 27 Jun 2017 21:00:58 +0100
-Subject: [PATCH] gtk-doc: Handle floating gtk-doc dependency
-
-Allow the tests to be explicitly disabled to avoid floating dependnecy
-issues. This is not really an issue with RSS but is on previous releases.
-
-RP 2017/6/27
-Upstream-Status: Pending
----
- configure.ac | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/configure.ac b/configure.ac
-index 909771d..9db9fbc 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -82,6 +82,11 @@ if test "x$GCC" = "xyes"; then
- 	fi
- fi
- 
-+AC_ARG_ENABLE([tests],
-+	AS_HELP_STRING([--enable-tests],
-+	[enable tests (default=yes)]),,
-+	[enable_tests="yes"])
-+
- dnl if glib is available we can enable the tests
- PKG_CHECK_MODULES(TEST_DEPS, [glib-2.0 >= 2.6.0 gobject-2.0 >= 2.6.0],
- 	[	glib_prefix="`$PKG_CONFIG --variable=prefix glib-2.0`"
-@@ -92,6 +97,11 @@ PKG_CHECK_MODULES(TEST_DEPS, [glib-2.0 >= 2.6.0 gobject-2.0 >= 2.6.0],
- 		build_tests="no"
- 	]
- )
-+if test "x$enable_tests" != "xyes"; then
-+	gtk_doc_use_libtool="no"
-+	build_tests="no"
-+fi
-+
- AM_CONDITIONAL(GTK_DOC_USE_LIBTOOL, test -n "$LIBTOOL" -a x$gtk_doc_use_libtool = xyes )
- dnl this enables the rule in test/Makefile.am
- AM_CONDITIONAL(BUILD_TESTS, test x$build_tests = xyes)
diff --git a/meta/recipes-gnome/gtk-doc/files/no-clobber.patch b/meta/recipes-gnome/gtk-doc/files/no-clobber.patch
index a75c2bceb7..a9c7154fc4 100644
--- a/meta/recipes-gnome/gtk-doc/files/no-clobber.patch
+++ b/meta/recipes-gnome/gtk-doc/files/no-clobber.patch
@@ -1,4 +1,4 @@
-From bcf24419dc1965086793b4ff66a2f9b06574f974 Mon Sep 17 00:00:00 2001
+From 01a52d8cf076e2692d947c8ed2681cb794eaa3c0 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Wed, 21 Mar 2018 14:47:29 +0000
 Subject: [PATCH] gtk-doc: don't regenerate gtk-doc in do_install
diff --git a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
index b1c6c25dc4..856860dc21 100644
--- a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
+++ b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
@@ -1,4 +1,4 @@
-From 24ddd2afb4fcdb8b7c88af5caec0c18ec9e7ff4e Mon Sep 17 00:00:00 2001
+From 9149fb41bdc1421102ccc3c0b64066e6dc03a2bd Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 5 Sep 2016 22:25:44 +0100
 Subject: [PATCH] Use native pkg-config when looking for gtk-doc.
diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.35.1.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb
similarity index 51%
rename from meta/recipes-gnome/gtk-doc/gtk-doc_1.35.1.bb
rename to meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb
index c9ab7ff1e9..883a754524 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.35.1.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.36.1.bb
@@ -5,55 +5,38 @@ HOMEPAGE = "https://www.gtk.org/docs/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase
 
-# Configure the scripts correctly (and build their dependencies) only if they are actually
-# going to be used; otheriwse we need only the m4/makefile includes from the gtk-doc tarball.
-PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "api-documentation", "working-scripts", "", d)}"
+DEPENDS += "libxslt-native"
 
-# This will cause target gtk-doc to hardcode paths of native dependencies
-# into its scripts. This means that target gtk-doc package is broken;
-# hopefully no one minds because its scripts are not used for anything during build
-# and shouldn't be used on targets.
-PACKAGECONFIG[working-scripts] = ",,libxslt-native docbook-xml-dtd4-native docbook-xsl-stylesheets python3-pygments"
-PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,glib-2.0"
+PACKAGECONFIG ??= ""
 
-CACHED_CONFIGUREVARS += "ac_cv_path_XSLTPROC=xsltproc"
+PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false,glib-2.0"
 
-SRC_URI[archive.sha256sum] = "611c9f24edd6d88a8ae9a79d73ab0dc63c89b81e90ecc31d6b9005c5f05b25e2"
+EXTRA_OEMESON = "-Dyelp_manual=false"
+
+SRC_URI[archive.sha256sum] = "0e517a5f97069831181be177516bde8aa8b3922398f2bdb09e265d22aecadbc5"
 SRC_URI += "file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch \
-           file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch \
-           file://conditionaltests.patch \
            file://no-clobber.patch \
+           file://0001-meson.build-do-not-check-for-pygments-at-build-time.patch \
            "
 SRC_URI:append:class-native = " file://pkg-config-native.patch"
 
 BBCLASSEXTEND = "native nativesdk"
 
-# Do not check for XML catalogs when building because that
-# information is not used for anything during build. Recipe
-# dependencies make sure we have all the right bits.
-do_configure:prepend() {
-        sed -i -e 's,^JH_CHECK_XML_CATALOG.*,,' ${S}/configure.ac
-}
-
 do_install:append () {
     # configure values for python3 and pkg-config encoded in scripts
     for fn in ${bindir}/gtkdoc-depscan \
         ${bindir}/gtkdoc-mkhtml2 \
         ${datadir}/gtk-doc/python/gtkdoc/config_data.py \
         ${datadir}/gtk-doc/python/gtkdoc/config.py; do
-        sed -e 's,${RECIPE_SYSROOT_NATIVE}/usr/bin/pkg-config,${bindir}/pkg-config,' \
+        sed -e 's,${RECIPE_SYSROOT_NATIVE}/usr/bin/,,' \
             -e 's,${HOSTTOOLS_DIR}/python3,${bindir}/python3,' \
             -e '1s|^#!.*|#!/usr/bin/env python3|' \
             -i ${D}$fn
     done
 }
 
-FILES:${PN} += "${datadir}/sgml"
-FILES:${PN}-doc = ""
-
 SYSROOT_PREPROCESS_FUNCS:append:class-native = " gtkdoc_makefiles_sysroot_preprocess"
 gtkdoc_makefiles_sysroot_preprocess() {
         # Patch the gtk-doc makefiles so that the qemu wrapper is used to run transient binaries
-- 
2.47.3


