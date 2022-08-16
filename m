Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB865C25B0D
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 03:30:25 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.11504.1660620616445578598
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 20:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Mp13O7yo;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id gp7so8626675pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Aug 2022 20:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=Dw9EUbkldv4rxJUZhjeMadpR2vheJAU1gjjO4gWauhE=;
        b=Mp13O7yo2+z1dtnyPBBQJ3JVGi2DryGbNZlA8QZHbVcDykJ800zW8kkOZDvbtcup+v
         yeJTyDD0EDz54et0gk17WXdGcvltRJs0WgUlEAef9cZB9zA/pqqUnXpMDLGzwWwJIpyZ
         G8RKJSDNSBQ9qb7YgJWR1SAL0KxJMfZ5lW/mO70rJs+1tddIc4kBRgegIfuhnFdfqgMZ
         YYZ68Opvn+jTTcCDA2fIRohZvBPV7iPvIyzB7qAp10O0l7MrRHVsDmIS4gtVxwaDTZSS
         +vWHeiB5gKNHsQYOGrolv/xZ9SLWx9CObtc7D2Rx29ARJ0jXOaTT12xjT5WFsrB0t/tP
         081Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=Dw9EUbkldv4rxJUZhjeMadpR2vheJAU1gjjO4gWauhE=;
        b=BSko4nstpubjIeChPVcYhVff1D1L7eQY1kRJofa9WbLZfijsi4s9PbV9vX57YYlSIE
         UT76178VjGmFL0QpLocBIr+jevPnKRDfBDGCagSQJB18exyRPPwCh+06IUSDuh37/Tq0
         MYRtkSTalTlTmOBal2kUi/KHq3VZz6JuPqWbgRXaLixfUOFDercMiUMfNTWB7oREORGc
         BrN4hMXdB9XHeui3k0QMbUKxHZ6ZoRjMQZdEHElPJoTh3RhrT0OSDN9wy/TlTSNkkKWt
         KSFp+e2AKlRSmMRntTu0cOheh16MrMfAUVIaXbOn9X+5PjzEyqiXuORQI9a2287pmDVB
         UwBQ==
X-Gm-Message-State: ACgBeo33wY2jj2dB/UmNp436X586smkKYoOiNgJ9BV5kGoLAh8Vtixn6
	PrEHsdx/w7CC42jDcF9JJmN1GmFGcqNvSw==
X-Google-Smtp-Source: 
 AA6agR7JFrRcMZaCL7MWudzTRBlXXN470ZgmtsTgzhAbWgIq67lDBSXtqJDppKYyYT0fmpo7c9+H8A==
X-Received: by 2002:a17:90b:1b05:b0:1f7:3ac7:f044 with SMTP id
 nu5-20020a17090b1b0500b001f73ac7f044mr20858413pjb.214.1660620615523;
        Mon, 15 Aug 2022 20:30:15 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 b190-20020a621bc7000000b0052d87b76d12sm7218807pfb.68.2022.08.15.20.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Aug 2022 20:30:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 6/6] xmlto: Update to use upstream tip of trunk
Date: Mon, 15 Aug 2022 20:30:05 -0700
Message-Id: <20220816033005.2700801-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220816033005.2700801-1-raj.khem@gmail.com>
References: <20220816033005.2700801-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 03:30:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169420

There are several fixes which are done to fix builds with newer
compilers after 0.0.28 was releases in 2015 a long time ago.

Add a patch to fix manpages builds not trying to access network during
build

Regenerate xmlif from lex files, before configuring the build

Add UPSTREAM_CHECK_COMMITS = "1"

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2:
- Update patch status
- Add UPSTREAM_CHECK_COMMITS

 .../0001-Skip-validating-xmlto-output.patch   | 29 +++++++++++++++++++
 ...rop-the-test-of-xmllint-and-xsltproc.patch |  6 ++--
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb   | 16 +++++++---
 3 files changed, 44 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-devtools/xmlto/xmlto/0001-Skip-validating-xmlto-output.patch
 rename meta/recipes-devtools/xmlto/{xmlto-0.0.28 => xmlto}/configure.in-drop-the-test-of-xmllint-and-xsltproc.patch (91%)

diff --git a/meta/recipes-devtools/xmlto/xmlto/0001-Skip-validating-xmlto-output.patch b/meta/recipes-devtools/xmlto/xmlto/0001-Skip-validating-xmlto-output.patch
new file mode 100644
index 00000000000..c6857a9da51
--- /dev/null
+++ b/meta/recipes-devtools/xmlto/xmlto/0001-Skip-validating-xmlto-output.patch
@@ -0,0 +1,29 @@
+From 3deb7a0eded04ab08a9cb2d88526cb1c7b440061 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 14 Aug 2022 00:23:29 -0700
+Subject: [PATCH] Skip validating xmlto output
+
+Avoids network access
+
+Upstream-Status: Submitted [https://pagure.io/xmlto/pull-request/11]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 50fa279..6a2da62 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -68,7 +68,7 @@ EXTRA_DIST = xmlto.spec \
+ 	doc/xmlif.xml \
+ 	xmlto.mak
+ 
+-GEN_MANPAGE = FORMAT_DIR=$(top_srcdir)/format $(BASH) ./xmlto -o $(@D) man $<
++GEN_MANPAGE = FORMAT_DIR=$(top_srcdir)/format $(BASH) ./xmlto --skip-validation -o $(@D) man $<
+ man/man1/xmlto.1: doc/xmlto.xml ; $(GEN_MANPAGE)
+ man/man1/xmlif.1: doc/xmlif.xml ; $(GEN_MANPAGE)
+ 
+-- 
+2.37.2
+
diff --git a/meta/recipes-devtools/xmlto/xmlto-0.0.28/configure.in-drop-the-test-of-xmllint-and-xsltproc.patch b/meta/recipes-devtools/xmlto/xmlto/configure.in-drop-the-test-of-xmllint-and-xsltproc.patch
similarity index 91%
rename from meta/recipes-devtools/xmlto/xmlto-0.0.28/configure.in-drop-the-test-of-xmllint-and-xsltproc.patch
rename to meta/recipes-devtools/xmlto/xmlto/configure.in-drop-the-test-of-xmllint-and-xsltproc.patch
index 6d547a6c994..7cc3cbe0fb2 100644
--- a/meta/recipes-devtools/xmlto/xmlto-0.0.28/configure.in-drop-the-test-of-xmllint-and-xsltproc.patch
+++ b/meta/recipes-devtools/xmlto/xmlto/configure.in-drop-the-test-of-xmllint-and-xsltproc.patch
@@ -9,9 +9,9 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  configure.in | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/configure.in b/configure.in
---- a/configure.in
-+++ b/configure.in
+diff --git a/configure.ac b/configure.ac
+--- a/configure.ac
++++ b/configure.ac
 @@ -42,10 +42,10 @@ AC_ARG_VAR([LOCALE], [Name and path of the `locale' program.])
  AC_PATH_PROG([LOCALE], [locale], [locale])
  
diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
index 5cb9a4c57be..1913dd2833d 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
@@ -6,17 +6,21 @@ LICENSE = "GPL-2.0-only"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-SRC_URI = "https://releases.pagure.org/xmlto/xmlto-${PV}.tar.gz \
+SRCREV = "6fa6a0e07644f20abf2596f78a60112713e11cbe"
+UPSTREAM_CHECK_COMMITS = "1"
+SRC_URI = "git://pagure.io/xmlto.git;protocol=https;branch=master \
            file://configure.in-drop-the-test-of-xmllint-and-xsltproc.patch \
+           file://0001-Skip-validating-xmlto-output.patch \
 "
-SRC_URI[md5sum] = "a1fefad9d83499a15576768f60f847c6"
-SRC_URI[sha256sum] = "2f986b7c9a0e9ac6728147668e776d405465284e13c74d4146c9cbc51fd8aad3"
+S = "${WORKDIR}/git"
+
+PV .= "+0.0.29+git${SRCPV}"
 
 inherit autotools
 
 CLEANBROKEN = "1"
 
-DEPENDS = "libxml2-native"
+DEPENDS = "libxml2-native libxslt-native flex-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
 
 RDEPENDS:${PN} = "docbook-xml-dtd4 \
                   docbook-xsl-stylesheets \
@@ -36,6 +40,10 @@ BBCLASSEXTEND = "native"
 
 EXTRA_OECONF:append = " BASH=/bin/bash GCP=/bin/cp XMLLINT=xmllint XSLTPROC=xsltproc"
 
+do_configure:prepend() {
+    flex -o ${S}/xmlif/xmlif.c ${S}/xmlif/xmlif.l
+}
+
 do_install:append:class-native() {
     create_wrapper ${D}${bindir}/xmlto XML_CATALOG_FILES=${sysconfdir}/xml/catalog
 }
-- 
2.37.2


