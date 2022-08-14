Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FEE8C25B0D
	for <webhook@archiver.kernel.org>; Sun, 14 Aug 2022 22:20:47 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web09.10140.1660515642596509675
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 15:20:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kEdrdy9R;
 spf=pass (domain: gmail.com, ip: 209.85.210.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d20so5358877pfq.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Aug 2022 15:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=QyiukIExWnp8nn97eS2F1XSbzpCmeq+r0B0VtEFNhNw=;
        b=kEdrdy9RbJme6wmiu+tmH2BG9K8cu8GE3lmQpG3+xLAgu1VqyTEgkaT4mYR4YohmBw
         G5dFpVTFSo9y9ubYqgHVqyTLVExkvXfUczDM/iluo5Y+P5TOtQx0x4epuj/10iJj2BDl
         bnQmlOEIE1tjY1+PwZdIbYseKFwVM5S6hWWhwUC69TUfSJqijS9KDwpD0jf5nFKyq5Jz
         FBrcdZ1inlltfe038oiOD9L13VEnuMkbj6RV4f1PU7U/RSzz68t5k9BmvQJ8VlDY4VRa
         uuN0R7F9Fos0BlEkOGfTiEKdRi1QqnhbSuEHuns+HodBZ1YQc9X7S57ZpHNTOvXIrnsY
         FnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=QyiukIExWnp8nn97eS2F1XSbzpCmeq+r0B0VtEFNhNw=;
        b=U7y2a8EeeVv66SHMuVdXv0POsyBZYkYJAbF4mSI7sAgpb2h946LoQh1VmBqUCXO8RJ
         KdVgUQvsm1vcShecq3DPgDV9YGjwmNsm1aTqfOjvqttY9nxHstCo6XhX9hLLEdm0SC1w
         1eNbucE8ALR3pW7dx8Xb+DIohdNXUvgjpVSDhzmcsZsW+ZSZrYQGxV2gWYCm3tAe2Kv1
         LaguYSQU0vhnl1Mi+Sirc6I5kmi72zbhS+M3UbSS+dDIDfnO3SHCtWguuS1l+Xoj5tnY
         M4W0z+R+DfLXTGa5HzEW9YSe5vE4TXTZjUkweZsM2GdzCLPHEKFUr16rcN0sTjDXGih7
         5RwQ==
X-Gm-Message-State: ACgBeo3Uhs7nU1fkuw+KiUIrZZeaSdt3PetXBygjliCRjcS3/WP8HCvw
	+MEZLkzewLtwgNSFt6D+ZW3ROwSkzVKNxA==
X-Google-Smtp-Source: 
 AA6agR5LJAP3iy28ZdgkYONaBmEQAIcfkWg8DQeJSLBFJyx26AT8r0QVn+XFBC+34TTb+gBqnGyiTw==
X-Received: by 2002:a63:dd4b:0:b0:41d:e855:7137 with SMTP id
 g11-20020a63dd4b000000b0041de8557137mr11850368pgj.595.1660515641486;
        Sun, 14 Aug 2022 15:20:41 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::bb7a])
        by smtp.gmail.com with ESMTPSA id
 k15-20020a170902d58f00b0016d8b0dfd61sm5819502plh.178.2022.08.14.15.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 15:20:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 02/10] xmlto: Update to use upstream tip of trunk
Date: Sun, 14 Aug 2022 15:20:29 -0700
Message-Id: <20220814222037.283943-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220814222037.283943-1-raj.khem@gmail.com>
References: <20220814222037.283943-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Aug 2022 22:20:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169329

There are several fixes which are done to fix builds with newer
compilers after 0.0.28 was releases in 2015 a long time ago.

Add a patch to fix manpages builds not trying to access network during
build

Regenerate xmlif from lex files, before configuring the build

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Skip-validating-xmlto-output.patch   | 29 +++++++++++++++++++
 ...rop-the-test-of-xmllint-and-xsltproc.patch |  6 ++--
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb   | 16 +++++++---
 3 files changed, 44 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-devtools/xmlto/xmlto/0001-Skip-validating-xmlto-output.patch
 rename meta/recipes-devtools/xmlto/{xmlto-0.0.28 => xmlto}/configure.in-drop-the-test-of-xmllint-and-xsltproc.patch (91%)

diff --git a/meta/recipes-devtools/xmlto/xmlto/0001-Skip-validating-xmlto-output.patch b/meta/recipes-devtools/xmlto/xmlto/0001-Skip-validating-xmlto-output.patch
new file mode 100644
index 00000000000..e1c24aba4ab
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
+Upstream-Status: Pending
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
index 5cb9a4c57be..dcb760dd930 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
@@ -6,17 +6,21 @@ LICENSE = "GPL-2.0-only"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
-SRC_URI = "https://releases.pagure.org/xmlto/xmlto-${PV}.tar.gz \
+SRCREV = "6fa6a0e07644f20abf2596f78a60112713e11cbe"
+
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


