Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D077C30658
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 09:00:12 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.16251.1718787603966750330
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 02:00:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c/7cCUw8;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-361b376236fso1300326f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 02:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718787602; x=1719392402; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/LSuEamG45G+Vm6WSbCzBf50hzKaLK3Yo8mPHlG4I0=;
        b=c/7cCUw8Ym7oX9V3JcCjdv9NjELJrl89glL1mpiRsjX10BwTqQMKkiyjBtvj3P0wHq
         QZvWftoVhjK4yMcvRoDKHQYpbxs916RpSpklD3aNAn2asC2dJIXl42XH0avRoerz7Lx6
         jsszzEWodI1ZWdcR3YsFYCwXmsI1Rl03i5dMG2p4DfY8WMFWX5BQGfpM+G5sVS6UyM2z
         GJh8buOREt7Ogc20efXHxRp45Z0Kv8Kavy+ctXTLwYA8tniY0248jfxA/3m9Zty6T0qF
         rG9gz5v436glP+ief3WzUI0sbh6s4Rcz2HXms/LVGBWqrNiX7GXiorjidWC3yTZZhWKF
         96Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718787602; x=1719392402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b/LSuEamG45G+Vm6WSbCzBf50hzKaLK3Yo8mPHlG4I0=;
        b=jpk/xeyevjWKcTF0EBxtH2LeU4IqO1bfwR69XLbkfRQLOuvk/unzqY62J45RdakTyF
         waD1/1N9Ydqk5hEHS8Rhm1Q75tFmVYjt3kQxRSu/i2qg90OKkERYN121WtvlP9dOF6zI
         j4OQhQZecjzlk52FcrR7yHbGZ5dxgfRk4dnTg4ZhZEZrXGubcpFYXdEdsEgNsfA08Wlz
         QSpUMBkIOdFYBc1O2ZkMt5/KmxoB090+FlFxCuESKHJyKUM0L4xac9zH09ZOGBMbAy7h
         bA2RC1IAkzC4qWcFjwvsbFXk0bz+TyivQByxUi/E8Kwj2t3/IzLr4RQW17dxrXHXt3M3
         jczQ==
X-Gm-Message-State: AOJu0YxTGU9cl2Sd+iDOu9atjgC1zXX7OBNDrWmdpZ50gMvcfM7fI+EH
	rRf2ZOT+87XTii0kd9gSz22trjkKq9dHdoV3vX8p5410I1WCq8d/kcgh3g==
X-Google-Smtp-Source: AGHT+IF4ypu4EMXJj9V2fwjgL15HKb9fIcAnQE4OuuT/IWf+cVzhih2Q1qUXMU0SvS2ztx1/a3XKhw==
X-Received: by 2002:adf:f0cc:0:b0:360:7506:2b8 with SMTP id ffacd0b85a97d-363195b1f0dmr1404955f8f.52.1718787601981;
        Wed, 19 Jun 2024 02:00:01 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36076515a80sm16401876f8f.76.2024.06.19.02.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 02:00:01 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/15] libnewt: move to meta-oe
Date: Wed, 19 Jun 2024 10:59:44 +0200
Message-Id: <20240619085957.2787700-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240619085957.2787700-1-alex.kanavin@gmail.com>
References: <20240619085957.2787700-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 09:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200888

From: Alexander Kanavin <alex@linutronix.de>

There are no consumers in oe-core (after obsolete perf dependency was dropped),
and so no reason to keep it there.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/distro_alias.inc     |  2 -
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../0001-detect-gold-as-GNU-linker-too.patch  | 29 ----------
 ...tinfo-library-to-the-linking-librari.patch | 26 ---------
 .../newt/files/cross_ar.patch                 | 56 -------------------
 meta/recipes-extended/newt/libnewt_0.52.24.bb | 56 -------------------
 6 files changed, 170 deletions(-)
 delete mode 100644 meta/recipes-extended/newt/files/0001-detect-gold-as-GNU-linker-too.patch
 delete mode 100644 meta/recipes-extended/newt/files/Makefile.in-Add-tinfo-library-to-the-linking-librari.patch
 delete mode 100644 meta/recipes-extended/newt/files/cross_ar.patch
 delete mode 100644 meta/recipes-extended/newt/libnewt_0.52.24.bb

diff --git a/meta/conf/distro/include/distro_alias.inc b/meta/conf/distro/include/distro_alias.inc
index ccbc1d1969f..58163a9f7a8 100644
--- a/meta/conf/distro/include/distro_alias.inc
+++ b/meta/conf/distro/include/distro_alias.inc
@@ -147,8 +147,6 @@ DISTRO_PN_ALIAS:pn-libjson = "Ubuntu=libjson0-dev Debian=libjson0-dev"
 DISTRO_PN_ALIAS:pn-libksba = "Fedora=libksba Debian=libksba8 Ubuntu=libksba"
 DISTRO_PN_ALIAS:pn-libmatchbox = "Ubuntu=libmatchbox Fedora=libmatchbox"
 DISTRO_PN_ALIAS:pn-libmpc = "Fedora=libmpc OpenSuse=libmpc2"
-DISTRO_PN_ALIAS:pn-libnewt = "Debian=libnewt0.52 Fedora=newt"
-DISTRO_PN_ALIAS:pn-libnewt-python = "Ubuntu=python-newt Fedora=newt-python"
 DISTRO_PN_ALIAS:pn-libnl = "Mandriva=libnl Fedora=libnl"
 DISTRO_PN_ALIAS:pn-libnss-mdns = "Meego=nss-mdns OpenSuSE=nss-mdns Ubuntu=nss-mdns Mandriva=nss_mdns Debian=nss-mdns"
 DISTRO_PN_ALIAS:pn-libowl = "Debian=owl OpenedHand"
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 42599267c1c..14e0637c838 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -359,7 +359,6 @@ RECIPE_MAINTAINER:pn-libmnl = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libmpc = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libmodule-build-perl = "Tim Orling <tim.orling@konsulko.com>"
 RECIPE_MAINTAINER:pn-libmodulemd = "Alexander Kanavin <alex.kanavin@gmail.com>"
-RECIPE_MAINTAINER:pn-libnewt = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER:pn-libnl = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-libnotify = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-libnsl2 = "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/recipes-extended/newt/files/0001-detect-gold-as-GNU-linker-too.patch b/meta/recipes-extended/newt/files/0001-detect-gold-as-GNU-linker-too.patch
deleted file mode 100644
index 090ed5c1c9e..00000000000
--- a/meta/recipes-extended/newt/files/0001-detect-gold-as-GNU-linker-too.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 08ba909500412611953aea0fa2fe0d8fe76b6e24 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Wed, 21 Sep 2016 21:14:40 +0200
-Subject: [PATCH] detect gold as GNU linker too
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
-
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 468c718..cd93f30 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -28,7 +28,7 @@ AC_CHECK_SIZEOF([void *])
- AC_MSG_CHECKING([for GNU ld])
- LD=$($CC -print-prog-name=ld 2>&5)
- 
--if test $($LD -v 2>&1 | $ac_cv_path_GREP -c "GNU ld") = 0; then
-+if test $($LD -v 2>&1 | $ac_cv_path_GREP -c "GNU ") = 0; then
-   # Not
-   GNU_LD=""
-   AC_MSG_RESULT([no])
diff --git a/meta/recipes-extended/newt/files/Makefile.in-Add-tinfo-library-to-the-linking-librari.patch b/meta/recipes-extended/newt/files/Makefile.in-Add-tinfo-library-to-the-linking-librari.patch
deleted file mode 100644
index bc55582fd90..00000000000
--- a/meta/recipes-extended/newt/files/Makefile.in-Add-tinfo-library-to-the-linking-librari.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From fad40cfc18a42946a9a9e440c3434cd6b847ff9d Mon Sep 17 00:00:00 2001
-From: Otavio Salvador <otavio@ossystems.com.br>
-Date: Mon, 18 Jan 2016 17:05:19 +0000
-Subject: [PATCH] Makefile.in: Add tinfo library to the linking libraries
-Organization: O.S. Systems Software LTDA.
-
-Upstream-Status: Pending
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
----
- Makefile.in | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index a85d00f..98b85f9 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -1,4 +1,4 @@
--LIBS = -lslang @LIBS@
-+LIBS = -lslang -ltinfo @LIBS@
- LIBTCL = @TCL_LIB_FLAG@
- 
- CC = @CC@
--- 
-2.1.4
-
diff --git a/meta/recipes-extended/newt/files/cross_ar.patch b/meta/recipes-extended/newt/files/cross_ar.patch
deleted file mode 100644
index 86cc0be1d38..00000000000
--- a/meta/recipes-extended/newt/files/cross_ar.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-Fix cross link using autoconf detected AR
-
-If building on 32bit host and creating 64bit libraries, the target
-package builds should not invoke the 32bit hosts's ar.  Specifically
-you will get an error message like:
-
-x86_64-linux-gcc    -m64 --sysroot=/opt/qemux86-64/tmp/sysroots/qemux86-64 -g -o test test.o libnewt.a -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -lslang
-libnewt.a: could not read symbols: Archive has no index; run ranlib to add one
-collect2: error: ld returned 1 exit status
-
-Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
-
-Upstream-Status: Pending
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- Makefile.in  | 3 ++-
- configure.ac | 4 ++++
- 2 files changed, 6 insertions(+), 1 deletion(-)
-
-Index: newt-0.52.20/Makefile.in
-===================================================================
---- newt-0.52.20.orig/Makefile.in
-+++ newt-0.52.20/Makefile.in
-@@ -7,6 +7,7 @@ CFLAGS = @CFLAGS@
- LDFLAGS = @LDFLAGS@
- CPPFLAGS = -D_GNU_SOURCE @CPPFLAGS@
- GNU_LD = @GNU_LD@
-+AR = @AR@
- 
- VERSION = @VERSION@
- TAG = r$(subst .,-,$(VERSION))
-@@ -109,7 +110,7 @@ whiptcl.$(SOEXT): $(WHIPTCLOBJS) $(LIBNE
- 	$(CC) -shared $(SHCFLAGS) $(LDFLAGS) -o whiptcl.$(SOEXT) $(WHIPTCLOBJS) -L. -lnewt  $(LIBTCL) -lpopt $(LIBS)
- 
- $(LIBNEWT): $(LIBOBJS)
--	ar rv $@ $^
-+	$(AR) rv $@ $^
- 
- newt.o $(SHAREDDIR)/newt.o: newt.c Makefile
- 
-Index: newt-0.52.20/configure.ac
-===================================================================
---- newt-0.52.20.orig/configure.ac
-+++ newt-0.52.20/configure.ac
-@@ -15,6 +15,10 @@ AC_PROG_INSTALL
- AC_PROG_LN_S
- AC_PROG_GREP
- AC_SYS_LARGEFILE
-+AN_MAKEVAR([AR], [AC_PROG_AR])
-+AN_PROGRAM([ar], [AC_PROG_AR])
-+AC_DEFUN([AC_PROG_AR], [AC_CHECK_TOOL(AR, ar, :)])
-+AC_PROG_AR
- 
- AC_CHECK_SIZEOF([long])
- AC_CHECK_SIZEOF([long long])
diff --git a/meta/recipes-extended/newt/libnewt_0.52.24.bb b/meta/recipes-extended/newt/libnewt_0.52.24.bb
deleted file mode 100644
index 1e39a1c5cae..00000000000
--- a/meta/recipes-extended/newt/libnewt_0.52.24.bb
+++ /dev/null
@@ -1,56 +0,0 @@
-SUMMARY = "A library for text mode user interfaces"
-
-DESCRIPTION = "Newt is a programming library for color text mode, widget based user \
-interfaces.  Newt can be used to add stacked windows, entry widgets, \
-checkboxes, radio buttons, labels, plain text fields, scrollbars, \
-etc., to text mode user interfaces.  This package also contains the \
-shared library needed by programs built with newt, as well as a \
-/usr/bin/dialog replacement called whiptail.  Newt is based on the \
-slang library."
-
-HOMEPAGE = "https://releases.pagure.org/newt/"
-SECTION = "libs"
-
-LICENSE = "LGPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
-
-# slang needs to be >= 2.2
-DEPENDS = "slang popt python3"
-
-SRC_URI = "https://releases.pagure.org/newt/newt-${PV}.tar.gz \
-           file://cross_ar.patch \
-           file://Makefile.in-Add-tinfo-library-to-the-linking-librari.patch \
-           file://0001-detect-gold-as-GNU-linker-too.patch \
-           "
-
-SRC_URI[sha256sum] = "5ded7e221f85f642521c49b1826c8de19845aa372baf5d630a51774b544fbdbb"
-
-S = "${WORKDIR}/newt-${PV}"
-
-inherit autotools-brokensep python3native python3-dir python3targetconfig
-
-EXTRA_OECONF = "--without-tcl --with-python"
-
-EXTRA_OEMAKE += "PYTHONVERS=${PYTHON_DIR}"
-
-CLEANBROKEN = "1"
-
-export CPPFLAGS
-
-PACKAGES:prepend = "whiptail ${PN}-python "
-
-RDEPENDS:${PN}-python += "python3-core"
-FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/*"
-
-do_configure:prepend() {
-    sh autogen.sh
-}
-
-do_compile:prepend() {
-    # Make sure the recompile is OK
-    rm -f ${B}/.depend
-}
-
-FILES:whiptail = "${bindir}/whiptail"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.39.2


