Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9635473F2A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 May 2015 07:05:10 +0000 (UTC)
Received: by igbpi8 with SMTP id pi8so93028537igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 May 2015 00:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=774D7CUAoROCf1XxMOSxZMuK76OY4+RCDL43ZY8E16s=;
	b=diQsA+odraSOVZC6b6hxIrvbhPDEcRSPvFiUlKzyzZUkLnT0KHKz8AUi3Kx38oTWRa
	qaqsdKSOsiwPQBZIjIRZ8GB0avHPVD6u7G2owz1z0G93S/Lu38izRlbr4+w3udoLlCh2
	N7wMnktlko5hQSyKn8CpZcBAWthmmEKNHh+zR7YIwpVaX2Vmsg4TsMnLHwLrCeuTcsGm
	crCTsyu8Ifs56l7C+9Re6OGs0j9aj9IZVhcNJ1QMZr8NwYXA/whsxP+tVkBvlTQnnPtr
	OfdYUht9EuSHAw1VSIdpKjnpvXO+/vsIGAYuRGeOuvjt2o61vZ71EdWCnU6o08p5hMIx
	870g==
X-Received: by 10.42.226.8 with SMTP id iu8mr1126442icb.17.1430895911730;
	Wed, 06 May 2015 00:05:11 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id m5sm622733ioi.4.2015.05.06.00.05.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 May 2015 00:05:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 May 2015 00:04:59 -0700
Message-Id: <255b008af3c6dbe562d8e114d17a9ed72b7709da.1430895556.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <f19629f2963bbec46e41a35626a11a64fc4a0c6d.1430895556.git.raj.khem@gmail.com>
References: <f19629f2963bbec46e41a35626a11a64fc4a0c6d.1430895556.git.raj.khem@gmail.com>
In-Reply-To: <cover.1430895556.git.raj.khem@gmail.com>
References: <cover.1430895556.git.raj.khem@gmail.com>
Subject: [PATCH 6/6] libart-lgpl: Fix cross compiling
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
X-List-Received-Date: Wed, 06 May 2015 07:05:10 -0000

We use standard ISO C data types and get rid of configure guess work
which is iffy in cross compiled environment. Cleans up the re-build as well
since we were deleting art_config.h without considering if the file is
there in first place or not.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../libart_lgpl-2.3.21-crosscompile.patch          | 84 ++++++++++++++++++++++
 meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb     | 10 +--
 2 files changed, 87 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-gnome/gnome/libart-lgpl/libart_lgpl-2.3.21-crosscompile.patch

diff --git a/meta/recipes-gnome/gnome/libart-lgpl/libart_lgpl-2.3.21-crosscompile.patch b/meta/recipes-gnome/gnome/libart-lgpl/libart_lgpl-2.3.21-crosscompile.patch
new file mode 100644
index 0000000..0261f58
--- /dev/null
+++ b/meta/recipes-gnome/gnome/libart-lgpl/libart_lgpl-2.3.21-crosscompile.patch
@@ -0,0 +1,84 @@
+Taken from portage
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+From e1443c945a4cf67096d8c27721aadd7368382b3f Mon Sep 17 00:00:00 2001
+From: Gilles Dartiguelongue <eva@gentoo.org>
+Date: Tue, 6 Apr 2010 15:22:25 +0200
+Subject: [PATCH 2/2] gentoo: use ISO types for fixed type size
+
+---
+ Makefile.am  |   11 ++---------
+ art_config.h |    5 +++++
+ configure.in |   10 ----------
+ 3 files changed, 7 insertions(+), 19 deletions(-)
+ create mode 100644 art_config.h
+
+diff --git a/Makefile.am b/Makefile.am
+index 95952da..6aa2fe3 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -2,13 +2,6 @@ check_PROGRAMS = testart testuta
+ 
+ bin_SCRIPTS = \
+ 	libart2-config
+-	
+-noinst_SCRIPTS = gen_art_config.sh
+-
+-BUILT_SOURCES = art_config.h
+-
+-art_config.h:
+-	./gen_art_config.sh > art_config.h
+ 
+ EXTRA_DIST = 			\
+ 	libart.def		\
+@@ -173,5 +166,5 @@ install-data-local: install-ms-lib install-libtool-import-lib
+ 
+ uninstall-local: uninstall-ms-lib uninstall-libtool-import-lib
+ 
+-CLEANFILES = $(BUILT_SOURCES) $(bin_SCRIPTS)
+-DISTCLEANFILES = $(BUILT_SOURCES) $(bin_SCRIPTS)
++CLEANFILES = $(bin_SCRIPTS)
++DISTCLEANFILES = $(bin_SCRIPTS)
+diff --git a/art_config.h b/art_config.h
+new file mode 100644
+index 0000000..5985f1f
+--- a/art_config.h
++++ b/art_config.h
+@@ -0,0 +1,5 @@
++#include <stdint.h>
++
++typedef uint8_t art_u8;
++typedef uint16_t art_u16;
++typedef uint32_t art_u32;
+diff --git a/configure.in b/configure.in
+index e4804f7..ddcac4f 100644
+--- a/configure.in
++++ b/configure.in
+@@ -92,15 +92,6 @@ AC_FUNC_ALLOCA
+ 
+ AC_C_BIGENDIAN
+ 
+-AC_CHECK_SIZEOF(char)
+-AC_SUBST(ART_SIZEOF_CHAR, $ac_cv_sizeof_char)
+-AC_CHECK_SIZEOF(short)
+-AC_SUBST(ART_SIZEOF_SHORT, $ac_cv_sizeof_short)
+-AC_CHECK_SIZEOF(int)
+-AC_SUBST(ART_SIZEOF_INT, $ac_cv_sizeof_int)
+-AC_CHECK_SIZEOF(long)
+-AC_SUBST(ART_SIZEOF_LONG, $ac_cv_sizeof_long)
+-
+ AC_CONFIG_FILES([
+ libart-features.h
+ Makefile
+@@ -109,6 +100,5 @@ libart-2.0-uninstalled.pc
+ libart-zip])
+ 
+ AC_CONFIG_FILES([libart-config],[chmod +x libart-config])
+-AC_CONFIG_FILES([gen_art_config.sh],[chmod +x gen_art_config.sh])
+ 
+ AC_OUTPUT
+-- 
+1.7.0.4
+
diff --git a/meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb b/meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb
index 1384616..95581b2 100644
--- a/meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb
+++ b/meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7"
 PR = "r2"
 
 # can't use gnome.oeclass due to _ in filename
-SRC_URI = "${GNOME_MIRROR}/libart_lgpl/2.3/libart_lgpl-${PV}.tar.bz2"
+SRC_URI = "${GNOME_MIRROR}/libart_lgpl/2.3/libart_lgpl-${PV}.tar.bz2 \
+           file://libart_lgpl-2.3.21-crosscompile.patch \
+          "
 
 SRC_URI[md5sum] = "08559ff3c67fd95d57b0c5e91a6b4302"
 SRC_URI[sha256sum] = "fdc11e74c10fc9ffe4188537e2b370c0abacca7d89021d4d303afdf7fd7476fa"
@@ -18,9 +20,3 @@ FILES_${PN} = "${libdir}/*.so.*"
 FILES_${PN}-dev += "${bindir}/libart2-config"
 
 S = "${WORKDIR}/libart_lgpl-${PV}"
-
-do_compile_prepend() {
-	# enforce regeneration of art_config.h
-	rm ${S}/art_config.h
-}
-
-- 
2.1.4


