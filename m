Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3474DC25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 16:24:46 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web09.31377.1660753481782377728
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 09:24:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SfYMYuC+;
 spf=pass (domain: gmail.com, ip: 209.85.214.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id 20so3817154plo.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 09:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=x6//4A6P7MsT3KRjZuEaOowLVmRrTlvQ1B6qjJDFqtM=;
        b=SfYMYuC+NbN5hjtv9Ikao/Gs4MwY+5li2aYL6NmrkCCvO0ngWfqPrcWzkIxH68uhxv
         xGK1uqvbp3aMpFYxnJn9ccbTz1ta7xE8DVMd7LopMYOANmJu0gpvwMQxFCMAUlxJ7JBO
         pzg5hBg8Nd0Bb9xrl88hRc1mcDUAchVb1UTFrnvDy0wYPNTogHe0vUZGzIa/b4ZLBoRy
         d71FfXtFLvli1NOuUkpnd5YOAdPBDmysDEXWu7hy+Sh13dBiNfmgp5dCIHsvEZA5mqsE
         DJ3J/dF/yWvsBK4JaGT1CEqSOY4+f17rDq/tBo9Qm7mUFLoZJGfxGOZ9bpxaKy1PnTLn
         3FBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=x6//4A6P7MsT3KRjZuEaOowLVmRrTlvQ1B6qjJDFqtM=;
        b=tRLvADwfk/LSyedk0YDW8HG3dhhDIO5UtvpULLRQH+KRZi4G915dEQJqL+OiLDZ3ig
         m9KB+e9dU+PCzu452w6uUnPhRm2TOjN3ZVH9NPSoew69JsnLlZp5tjbKk5Tm+8Im6ArS
         FwxFZyA7IGE7PzxCzmgts/2t+k+4EEs4pDWJOdRstEOyaS57JNEdKhZ1w/krfaZcxPfJ
         /Ia5ON4j/uhKRWtnZ2Yy2jMfjd5mRSJcpGwNoOeoadsGrgVE4cCZu7x5BF2di/LGffzg
         q/CrnC00B2Q4dvwrZUNtikKHPG90cHMs2eeSv60ZyJbn/tLnXj7LkNJp3cuE1M1ACdpC
         Sz8w==
X-Gm-Message-State: ACgBeo0rIYKuaMJ+8aioYHgUAUR87K6Lll1SpmiYRuWziX4f8MvGC3oL
	cMAQvkwiFp901aP5+/4m8q6UMXtCRqkMcg==
X-Google-Smtp-Source: 
 AA6agR6alVDyRhopIqjqysceW5vkUrj58AUPliiFqrDUOga6Rl50fodxdTmIohTvWE7ZrY66iL2sZA==
X-Received: by 2002:a17:90b:4acc:b0:1f5:7f05:12e8 with SMTP id
 mh12-20020a17090b4acc00b001f57f0512e8mr4468397pjb.92.1660753480637;
        Wed, 17 Aug 2022 09:24:40 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 v13-20020a655c4d000000b0040ced958e8fsm9713601pgr.80.2022.08.17.09.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 09:24:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/2] xmlto: Update to use upstream tip of trunk
Date: Wed, 17 Aug 2022 09:24:36 -0700
Message-Id: <20220817162437.1150136-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 16:24:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169494

There are several fixes which are done to fix builds with newer
compilers after 0.0.28 was releases in 2015 a long time ago.

Add a patch to fix manpages builds not trying to access network during
build

Add UPSTREAM_CHECK_COMMITS = "1"

Regenerate xmlif from lex files, before configuring the build.
Run lex from sourcedir to avoid emitting absolute source paths via #line
directive into generated c source file which ends up causing
reproducability isssue

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix reproducibility failure

 .../0001-Skip-validating-xmlto-output.patch   | 29 +++++++++++++++++++
 ...rop-the-test-of-xmllint-and-xsltproc.patch |  6 ++--
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb   | 16 +++++++---
 3 files changed, 44 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-devtools/xmlto/xmlto/0001-Skip-validating-xmlto-output.patch
 rename meta/recipes-devtools/xmlto/{xmlto-0.0.28 => xmlto}/configure.in-drop-the-test-of-xmllint-and-xsltproc.patch (91%)

diff --git a/meta/recipes-devtools/xmlto/xmlto/0001-Skip-validating-xmlto-output.patch b/meta/recipes-devtools/xmlto/xmlto/0001-Skip-validating-xmlto-output.patch
new file mode 100644
index 0000000000..c6857a9da5
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
index 6d547a6c99..7cc3cbe0fb 100644
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
index 5cb9a4c57b..373eca2454 100644
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
+    (cd ${S} && flex -o xmlif/xmlif.c xmlif/xmlif.l)
+}
+
 do_install:append:class-native() {
     create_wrapper ${D}${bindir}/xmlto XML_CATALOG_FILES=${sysconfdir}/xml/catalog
 }
-- 
2.37.2


