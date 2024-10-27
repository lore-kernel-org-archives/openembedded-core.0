Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE4C5D13572
	for <webhook@archiver.kernel.org>; Sun, 27 Oct 2024 17:01:34 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.33418.1730048484895423121
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Oct 2024 10:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MAHh4U4v;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d41894a32so2703350f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 10:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730048483; x=1730653283; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=huqG1NdCxRq8XAB7wONeOhKL8tuogbVDgTMnpRxPUso=;
        b=MAHh4U4vjEyoHRPLq5FbQ0tiMhMA3lCUVS5QQov+48X+hq4QiCCXssajHmrxsOEfyH
         WnQemrmN4ro8l2TkREbdt2pC+zR7A+Yv7I0H8bPQnE9SIT2F5kxZKSmzDXj+0DafD4fM
         mJPx41Yc+XZHDRZoeb1Xeks3lZMVxmtFeCD7119gLDE+MGkk/wQitlndQQl8Vpd9whUz
         xgo6qnaKwbExeJ2RAxfZefh77xGFveUAwfQ5Es6L6QE2prt2FVCeJZzvckpY8ZNk9OnF
         P5FEWQzT6HZe6I3s29OO+khl9X7VOAH1R8HsWNXq0P2XM2ICetsbU44SvnLTs2SU68r9
         GH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730048483; x=1730653283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=huqG1NdCxRq8XAB7wONeOhKL8tuogbVDgTMnpRxPUso=;
        b=KzM6nnLpxSSxGPiKRioJ3PlxrLTGjIinuzChqkvwFgQO2T7fiGc7JhVTco+3A+958b
         h11bTjoEQfoEAAvcXTmzf33vgIpBrf55sw6q+DxBa8GccJ9Evd04eKr3JPJAFJiSSdjs
         /LjqPD6ts7u1ZZiRbtRWp43f7N/CZ0bDS0b0OfPf+vnYb2DQ4MoX3n17WAr9SE6unKOt
         SBIhR7Sjw537SXjv58ByYESDkrMhGGteE7REQ5mipsvN9nRh6VojWmR5YqUHtWWLhgNW
         zm2i/XQHIKWalyGlGbgtMNZDSN79Z7CJZmJUNun1O/b5eDnMgl+06Dcf7v7Ha91MnYT0
         PLWQ==
X-Gm-Message-State: AOJu0YwPWkFHzR2bT8l9I15Gwfa1+RSAegwHjmyWE6oO3S03zxTZu+H/
	pV6ZcpGvB7I9ZlwZVykKwuA1tuzWi5RKu2mVGgGxlqsCtC85rTyR9ixLgQ==
X-Google-Smtp-Source: AGHT+IFxtmtfQpYfEbN75HZfW1ukhrj+eU8UqXpFFYfsJpdh8Pv4Jhi0mVjHKunFji7tIj9GyUnJzg==
X-Received: by 2002:adf:f408:0:b0:374:cee6:c298 with SMTP id ffacd0b85a97d-380458593d1mr8417218f8f.21.1730048482886;
        Sun, 27 Oct 2024 10:01:22 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b92958sm7140209f8f.106.2024.10.27.10.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 10:01:22 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [kirkstone][PATCH] xmlto: backport a patch to fix build with gcc-14 on host
Date: Sun, 27 Oct 2024 18:01:18 +0100
Message-ID: <20241027170119.2876289-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Oct 2024 17:01:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206406

* need to add dependency on flex-native because now when the
  .l file is modified by the .patch file it will try to regenerate
  the c code and fail:

| make[1]: Entering directory 'work/x86_64-linux/xmlto-native/0.0.28-r0/build'
| /bin/bash ../xmlto-0.0.28/ylwrap ../xmlto-0.0.28/xmlif/xmlif.l .c xmlif/xmlif.c -- /bin/bash 'work/x86_64-linux/xmlto-native/0.0.28-r0/xmlto-0.0.28/missing' flex
| work/x86_64-linux/xmlto-native/0.0.28-r0/xmlto-0.0.28/missing: line 81: flex: command not found
| WARNING: 'flex' is missing on your system.
|          You should only need it if you modified a '.l' file.
|          You may want to install the Fast Lexical Analyzer package:
|          <https://github.com/westes/flex>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 ...001-Fix-return-type-of-main-function.patch | 42 +++++++++++++++++++
 .../0001-fix-Wimplicit-int-for-ifsense.patch  | 33 +++++++++++++++
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb   |  4 +-
 3 files changed, 78 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-Fix-return-type-of-main-function.patch
 create mode 100644 meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-fix-Wimplicit-int-for-ifsense.patch

diff --git a/meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-Fix-return-type-of-main-function.patch b/meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-Fix-return-type-of-main-function.patch
new file mode 100644
index 0000000000..f28f1fb56a
--- /dev/null
+++ b/meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-Fix-return-type-of-main-function.patch
@@ -0,0 +1,42 @@
+From 6347e1b9da2140acdd55e3e7ac1199456793e17c Mon Sep 17 00:00:00 2001
+From: Thomas Kuehne <thomas@kuehne.cn>
+Date: Sat, 11 Dec 2021 20:56:00 +0000
+Subject: [PATCH] Fix return type of main function
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes:
+xmlif/xmlif.l:242:1: warning: return type defaults to ‘int’ [-Wimplicit-int]
+  242 | main(int argc, char *argv[])
+      | ^~~~
+
+Signed-off-by: Thomas Kuehne <thomas@kuehne.cn>
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Upstream-Status: Backport [v0.0.29 https://pagure.io/xmlto/c/8e34f087bf410bcc5fe445933d6ad9bae54f24b5?branch=master]
+---
+ xmlif/xmlif.l | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/xmlif/xmlif.l b/xmlif/xmlif.l
+index ac42136..78a62bc 100644
+--- a/xmlif/xmlif.l
++++ b/xmlif/xmlif.l
+@@ -239,7 +239,7 @@ WS		[ \t\n]*
+ 
+ int yywrap() {exit(0);};
+ 
+-main(int argc, char *argv[])
++int main(int argc, char *argv[])
+ {
+     int i;
+ 
+@@ -265,7 +265,7 @@ main(int argc, char *argv[])
+ 	    exit(1);
+ 	}
+ 
+-    yylex();
++    return yylex();
+ }
+ 
+ /*
diff --git a/meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-fix-Wimplicit-int-for-ifsense.patch b/meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-fix-Wimplicit-int-for-ifsense.patch
new file mode 100644
index 0000000000..d5c25ba08a
--- /dev/null
+++ b/meta/recipes-devtools/xmlto/xmlto-0.0.28/0001-fix-Wimplicit-int-for-ifsense.patch
@@ -0,0 +1,33 @@
+From 1375e2df75530cd198bd16ac3de38e2b0d126276 Mon Sep 17 00:00:00 2001
+From: Thomas Kuehne <thomas@kuehne.cn>
+Date: Sat, 11 Dec 2021 21:10:41 +0100
+Subject: [PATCH] fix -Wimplicit-int for ifsense
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+fixes:
+xmlif/xmlif.l:46:8: warning: type defaults to ‘int’ in declaration of ‘ifsense’ [-Wimplicit-int]
+   46 | static ifsense;                 /* sense of last `if' or unless seen */
+      |        ^~~~~~~
+
+Signed-off-by: Thomas Kuehne <thomas@kuehne.cn>
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Upstream-Status: Backport [v0.0.29 https://pagure.io/xmlto/c/1375e2df75530cd198bd16ac3de38e2b0d126276?branch=master
+---
+ xmlif/xmlif.l | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/xmlif/xmlif.l b/xmlif/xmlif.l
+index ac42136..6e5970e 100644
+--- a/xmlif/xmlif.l
++++ b/xmlif/xmlif.l
+@@ -43,7 +43,7 @@
+ 
+ static char **selections;	/* selection tokens */
+ static int nselections;		/* number of selections */
+-static ifsense;			/* sense of last `if' or unless seen */
++static int ifsense;		/* sense of last `if' or unless seen */
+ static char *attribute;		/* last attribute scanned */
+ 
+ struct stack_t {
diff --git a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
index 5cb9a4c57b..2c9ee27f82 100644
--- a/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
+++ b/meta/recipes-devtools/xmlto/xmlto_0.0.28.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 SRC_URI = "https://releases.pagure.org/xmlto/xmlto-${PV}.tar.gz \
            file://configure.in-drop-the-test-of-xmllint-and-xsltproc.patch \
+           file://0001-Fix-return-type-of-main-function.patch \
+           file://0001-fix-Wimplicit-int-for-ifsense.patch \
 "
 SRC_URI[md5sum] = "a1fefad9d83499a15576768f60f847c6"
 SRC_URI[sha256sum] = "2f986b7c9a0e9ac6728147668e776d405465284e13c74d4146c9cbc51fd8aad3"
@@ -16,7 +18,7 @@ inherit autotools
 
 CLEANBROKEN = "1"
 
-DEPENDS = "libxml2-native"
+DEPENDS = "libxml2-native flex-native"
 
 RDEPENDS:${PN} = "docbook-xml-dtd4 \
                   docbook-xsl-stylesheets \
-- 
2.47.0


