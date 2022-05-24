Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD241C433F5
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 05:19:34 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.5977.1653369572015512413
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 22:19:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=XztIn7UF;
 spf=pass (domain: mvista.com, ip: 209.85.210.179,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-pf1-f179.google.com with SMTP id f21so3152216pfa.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 22:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=45WVHh41vADAHCn4waJog6wqaMKriVUD7Yci2cwbgmg=;
        b=XztIn7UFUJPyeYJJrom7jlWFNwosP2g/ZPXBZgpiOxUeGNt9Jc4rn6GTTMB9A0VsOe
         1TWsPeOQq0YgvL7k2As4kXhC0t0Z0u0nW35lQ7JXZ8ri8eWFhhhHhTA5onGnedCRNCQM
         WFp7m9k5lk5jBk19I7etDLpA6hKDgegq+TYEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=45WVHh41vADAHCn4waJog6wqaMKriVUD7Yci2cwbgmg=;
        b=KDN5X4lcM5CKNeeOmGmZHvY4ojwUZCNm4ng1SGVmgiwBqoG3mLf8JqLSduJc+ghMxM
         UwMQ0l1P/dzmNbjvoK1td+JTd2kaFp9t8U1bbZa9R7dHrCPnG7XlXOFiGmcHEBQjZgOX
         oQ1vmvJcyUqkZ/kuaGP+IS2hJYZ342D2pxojbmGclMCqDSVmh2V21PmTUUAQO1CtB1I9
         E9QlWh9QC6SuQKWZm7vLnCh9c08EOljheU/ktnapBs38pr00hicas7g2zyjpo3Y+y/Kl
         XauV6rYKdhZVjCf5i9ACVT8kcfuhwPSK3MsIxO6+BDgLmfDPNbAbkWxKeK/DPPHo9i2S
         UdgA==
X-Gm-Message-State: AOAM530P0BZMLhXoxrvTNi388KuOAXmLCLyscQow/wsGM+OZFBeNiQE5
	tLchicfDcgu2V9oXNEXRLsfeQNzELTj5dw==
X-Google-Smtp-Source: 
 ABdhPJxTlvCBdYx2E5vesbsrIhkkk33jAAX16k5g1mzvmhmnKhkPBrwZ1Iv8hXkFc/Gtvyl1k42PAQ==
X-Received: by 2002:a63:f34d:0:b0:3f5:dc3d:da5d with SMTP id
 t13-20020a63f34d000000b003f5dc3dda5dmr23308221pgj.108.1653369571122;
        Mon, 23 May 2022 22:19:31 -0700 (PDT)
Received: from brown (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 b12-20020a170903228c00b0016184e7b013sm6167692plh.36.2022.05.23.22.19.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 22:19:30 -0700 (PDT)
Received: by brown (sSMTP sendmail emulation); Mon, 23 May 2022 22:19:28 -0700
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>,
	"Jeremy A . Puhlman" <jpuhlman@mvista.com>
Subject: [kirkstone][PATCH] pcre2: CVE-2022-1586 Out-of-bounds read
Date: Mon, 23 May 2022 22:19:26 -0700
Message-Id: <20220524051926.4172053-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 May 2022 05:19:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166045

From: Hitendra Prajapati <hprajapati@mvista.com>

Backport from https://github.com/PCRE2Project/pcre2/commit/50a51cb7e67268e6ad417eb07c9de9bfea5cc55a
CVE-2022-1586: pcre2: Out-of-bounds read in compile_xclass_matchingpath in pcre2_jit_compile.c.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
(cherry picked from commit 7519eb1cb624bb576cfe60f7470d40c566818ac3)
Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 .../libpcre/libpcre2/CVE-2022-1586.patch      | 58 +++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.39.bb |  5 +-
 2 files changed, 61 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2022-1586.patch

diff --git a/meta/recipes-support/libpcre/libpcre2/CVE-2022-1586.patch b/meta/recipes-support/libpcre/libpcre2/CVE-2022-1586.patch
new file mode 100644
index 0000000000..10d88d7b73
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre2/CVE-2022-1586.patch
@@ -0,0 +1,58 @@
+From e881ed5028622959cf8859c053501fb1b16387f1 Mon Sep 17 00:00:00 2001
+From: Hitendra Prajapati <hprajapati@mvista.com>
+Date: Mon, 23 May 2022 13:52:39 +0530
+Subject: [PATCH] CVE-2022-1586
+
+Upstream-Status: Backport from https://github.com/PCRE2Project/pcre2/commit/50a51cb7e67268e6ad417eb07c9de9bfea5cc55a
+
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ ChangeLog               | 3 +++
+ src/pcre2_jit_compile.c | 2 +-
+ src/pcre2_jit_test.c    | 3 +++
+ 3 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index d27542d..cd3da65 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -63,6 +63,9 @@ Version 10.39 29-October-2021
+ 
+   Reformat slightly to make it C89 compatible again.
+ 
++23. Fixed a unicode properrty matching issue in JIT. The character was not
++fully read in caseless matching.
++
+ 
+ Version 10.38 01-October-2021
+ -----------------------------
+diff --git a/src/pcre2_jit_compile.c b/src/pcre2_jit_compile.c
+index db2ce65..5baca9b 100644
+--- a/src/pcre2_jit_compile.c
++++ b/src/pcre2_jit_compile.c
+@@ -7473,7 +7473,7 @@ while (*cc != XCL_END)
+     {
+     SLJIT_ASSERT(*cc == XCL_PROP || *cc == XCL_NOTPROP);
+     cc++;
+-    if (*cc == PT_CLIST)
++    if (*cc == PT_CLIST && *cc == XCL_PROP)
+       {
+       other_cases = PRIV(ucd_caseless_sets) + cc[1];
+       while (*other_cases != NOTACHAR)
+diff --git a/src/pcre2_jit_test.c b/src/pcre2_jit_test.c
+index 8dee16e..7bb307e 100644
+--- a/src/pcre2_jit_test.c
++++ b/src/pcre2_jit_test.c
+@@ -412,6 +412,9 @@ static struct regression_test_case regression_test_cases[] = {
+ 	{ MUP, A, 0, 0 | F_PROPERTY, "[\\P{L&}]{2}[^\xc2\x85-\xc2\x89\\p{Ll}\\p{Lu}]{2}", "\xc3\xa9\xe6\x92\xad.a\xe6\x92\xad|\xc2\x8a#" },
+ 	{ PCRE2_UCP, 0, 0, 0 | F_PROPERTY, "[a-b\\s]{2,5}[^a]", "AB  baaa" },
+ 	{ MUP, 0, 0, 0 | F_NOMATCH, "[^\\p{Hangul}\\p{Z}]", " " },
++	{ MUP, 0, 0, 0, "[\\p{Lu}\\P{Latin}]+", "c\xEA\xA4\xAE,A,b" },
++	{ MUP, 0, 0, 0, "[\\x{a92e}\\p{Lu}\\P{Latin}]+", "c\xEA\xA4\xAE,A,b" },
++	{ CMUP, 0, 0, 0, "[^S]\\B", "\xe2\x80\x8a" },
+ 
+ 	/* Possible empty brackets. */
+ 	{ MU, A, 0, 0, "(?:|ab||bc|a)+d", "abcxabcabd" },
+-- 
+2.35.3
+
diff --git a/meta/recipes-support/libpcre/libpcre2_10.39.bb b/meta/recipes-support/libpcre/libpcre2_10.39.bb
index b5ec62fe18..36c51d700a 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.39.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.39.bb
@@ -10,8 +10,9 @@ SECTION = "devel"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=43cfa999260dd853cd6cb174dc396f3d"
 
-SRC_URI = "https://github.com/PhilipHazel/pcre2/releases/download/pcre2-${PV}/pcre2-${PV}.tar.bz2"
-
+SRC_URI = "https://github.com/PhilipHazel/pcre2/releases/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
+           file://CVE-2022-1586.patch \
+"
 UPSTREAM_CHECK_URI = "https://github.com/PhilipHazel/pcre2/releases"
 
 SRC_URI[sha256sum] = "0f03caf57f81d9ff362ac28cd389c055ec2bf0678d277349a1a4bee00ad6d440"
-- 
2.35.3


