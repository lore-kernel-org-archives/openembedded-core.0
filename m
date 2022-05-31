Return-Path: <davidegarde2000@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48952C433EF
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 08:26:16 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web09.46955.1653985568964700134
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 01:26:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UCar8lIw;
 spf=pass (domain: gmail.com, ip: 209.85.218.45,
 mailfrom: davidegarde2000@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id m20so25026740ejj.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 01:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=meIbaQk1+VgAaVIOTXIRGSUVS8WUzD2SrxZCRK4g6Ko=;
        b=UCar8lIwQn0C9JNR3j6O5hfEGLG5a9c59e3vsUPudiSBHncJIRRGlxxbSIhenWFyYt
         zJzlu26W1XPEtEUAiA/Q1xc/lb5fgPI/YHj9mNfmiNpCJyQ/bNfM9sNmhs/A+6Im03g7
         CNrLJ7vZ1yekxT2NCGmuTdyy385i6Q+T3LYj5OJ3kHNfw5XaB5x8YwGGfYf+XTNzfBvg
         Cce0aZVb7AHqnyiLgEKw63/mRSIwf7leeS/o5b9VSTeSUHMsVxJsfnyAZe5sgNd7FLnv
         edOpsIzo8wG9M2tgUl85FUbt/hyiwP4u13yF+VZajNAhvf2CcdiHyYNWow8Wd2lvubAE
         rIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=meIbaQk1+VgAaVIOTXIRGSUVS8WUzD2SrxZCRK4g6Ko=;
        b=IM9cIoiCINwwgoqwx5OhDhETWFSn6AYOuiTL0D56sN2YnCwKm9UtKhrGRdwx893uXY
         hlne3KVp1rhV7sQToXBY0iwwZE5ghtmeoQTvBowe/WwnDlAffS7WtBb8qWRtlUeotjxg
         miPYfLLDjME7cZEVn05m/2yqBfkhrdyTRMxuW7UMilPSskmXygzFng4QSD5o9ocAGjJH
         B//dd53N6QIZ1jwLWrDmqHwwTbI+huslaz/Shqgizmag2TnazAzwvH5WXceEc+TNMXo5
         4qPVe1Zr+jpyI1qeIkis0Ii+pGSFCb+ctuwr/uOpUBpAFp9k2+Ov55IPBuLuVYTNwor2
         9k4g==
X-Gm-Message-State: AOAM533R/PLYVyS50cyZheVHqij0t0mdkT2C3izQm8k1U9xn12uLHJ1v
	p5kAWzNyNgHdFQEAct1Xidk11h3BMow=
X-Google-Smtp-Source: 
 ABdhPJyPgzamqZZ6+pwXG7wTCtQZIQqjOlef7t/qz33+Er2k72GbATLWl8HQcokihhd8FaVlu6FmgQ==
X-Received: by 2002:a17:906:9b86:b0:6f8:24e7:af7d with SMTP id
 dd6-20020a1709069b8600b006f824e7af7dmr53091555ejc.295.1653985566980;
        Tue, 31 May 2022 01:26:06 -0700 (PDT)
Received: from tony3oo3-XPS-13-9370.home
 (host-87-12-122-122.business.telecomitalia.it. [87.12.122.122])
        by smtp.gmail.com with ESMTPSA id
 a92-20020a509ee5000000b0042dbc55f6e4sm5164269edf.7.2022.05.31.01.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 01:26:06 -0700 (PDT)
From: Davide Gardenal <davidegarde2000@gmail.com>
X-Google-Original-From: Davide Gardenal <davide.gardenal@huawei.com>
To: openembedded-core@lists.openembedded.org
Cc: Davide Gardenal <davide.gardenal@huawei.com>
Subject: [kirkstone][PATCH v2] libpcre2: upgrade 10.39 -> 10.40
Date: Tue, 31 May 2022 10:26:03 +0200
Message-Id: <20220531082603.11954-1-davide.gardenal@huawei.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 08:26:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166305

Security fixes and update to Unicode property handling.

Upstream release notes:
https://github.com/PCRE2Project/pcre2/releases/tag/pcre2-10.40

CVE: CVE-2022-1587

Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
---
Updates:
    - v2: change commit message
---
 .../libpcre/libpcre2/CVE-2022-1586.patch      | 58 -------------------
 .../{libpcre2_10.39.bb => libpcre2_10.40.bb}  |  5 +-
 2 files changed, 2 insertions(+), 61 deletions(-)
 delete mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2022-1586.patch
 rename meta/recipes-support/libpcre/{libpcre2_10.39.bb => libpcre2_10.40.bb} (90%)

diff --git a/meta/recipes-support/libpcre/libpcre2/CVE-2022-1586.patch b/meta/recipes-support/libpcre/libpcre2/CVE-2022-1586.patch
deleted file mode 100644
index 10d88d7b73..0000000000
--- a/meta/recipes-support/libpcre/libpcre2/CVE-2022-1586.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From e881ed5028622959cf8859c053501fb1b16387f1 Mon Sep 17 00:00:00 2001
-From: Hitendra Prajapati <hprajapati@mvista.com>
-Date: Mon, 23 May 2022 13:52:39 +0530
-Subject: [PATCH] CVE-2022-1586
-
-Upstream-Status: Backport from https://github.com/PCRE2Project/pcre2/commit/50a51cb7e67268e6ad417eb07c9de9bfea5cc55a
-
-Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
----
- ChangeLog               | 3 +++
- src/pcre2_jit_compile.c | 2 +-
- src/pcre2_jit_test.c    | 3 +++
- 3 files changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/ChangeLog b/ChangeLog
-index d27542d..cd3da65 100644
---- a/ChangeLog
-+++ b/ChangeLog
-@@ -63,6 +63,9 @@ Version 10.39 29-October-2021
- 
-   Reformat slightly to make it C89 compatible again.
- 
-+23. Fixed a unicode properrty matching issue in JIT. The character was not
-+fully read in caseless matching.
-+
- 
- Version 10.38 01-October-2021
- -----------------------------
-diff --git a/src/pcre2_jit_compile.c b/src/pcre2_jit_compile.c
-index db2ce65..5baca9b 100644
---- a/src/pcre2_jit_compile.c
-+++ b/src/pcre2_jit_compile.c
-@@ -7473,7 +7473,7 @@ while (*cc != XCL_END)
-     {
-     SLJIT_ASSERT(*cc == XCL_PROP || *cc == XCL_NOTPROP);
-     cc++;
--    if (*cc == PT_CLIST)
-+    if (*cc == PT_CLIST && *cc == XCL_PROP)
-       {
-       other_cases = PRIV(ucd_caseless_sets) + cc[1];
-       while (*other_cases != NOTACHAR)
-diff --git a/src/pcre2_jit_test.c b/src/pcre2_jit_test.c
-index 8dee16e..7bb307e 100644
---- a/src/pcre2_jit_test.c
-+++ b/src/pcre2_jit_test.c
-@@ -412,6 +412,9 @@ static struct regression_test_case regression_test_cases[] = {
- 	{ MUP, A, 0, 0 | F_PROPERTY, "[\\P{L&}]{2}[^\xc2\x85-\xc2\x89\\p{Ll}\\p{Lu}]{2}", "\xc3\xa9\xe6\x92\xad.a\xe6\x92\xad|\xc2\x8a#" },
- 	{ PCRE2_UCP, 0, 0, 0 | F_PROPERTY, "[a-b\\s]{2,5}[^a]", "AB  baaa" },
- 	{ MUP, 0, 0, 0 | F_NOMATCH, "[^\\p{Hangul}\\p{Z}]", " " },
-+	{ MUP, 0, 0, 0, "[\\p{Lu}\\P{Latin}]+", "c\xEA\xA4\xAE,A,b" },
-+	{ MUP, 0, 0, 0, "[\\x{a92e}\\p{Lu}\\P{Latin}]+", "c\xEA\xA4\xAE,A,b" },
-+	{ CMUP, 0, 0, 0, "[^S]\\B", "\xe2\x80\x8a" },
- 
- 	/* Possible empty brackets. */
- 	{ MU, A, 0, 0, "(?:|ab||bc|a)+d", "abcxabcabd" },
--- 
-2.35.3
-
diff --git a/meta/recipes-support/libpcre/libpcre2_10.39.bb b/meta/recipes-support/libpcre/libpcre2_10.40.bb
similarity index 90%
rename from meta/recipes-support/libpcre/libpcre2_10.39.bb
rename to meta/recipes-support/libpcre/libpcre2_10.40.bb
index 36c51d700a..3843d43b69 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.39.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.40.bb
@@ -8,14 +8,13 @@ SUMMARY = "Perl Compatible Regular Expressions version 2"
 HOMEPAGE = "http://www.pcre.org"
 SECTION = "devel"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=43cfa999260dd853cd6cb174dc396f3d"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=41bfb977e4933c506588724ce69bf5d2"
 
 SRC_URI = "https://github.com/PhilipHazel/pcre2/releases/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
-           file://CVE-2022-1586.patch \
 "
 UPSTREAM_CHECK_URI = "https://github.com/PhilipHazel/pcre2/releases"
 
-SRC_URI[sha256sum] = "0f03caf57f81d9ff362ac28cd389c055ec2bf0678d277349a1a4bee00ad6d440"
+SRC_URI[sha256sum] = "14e4b83c4783933dc17e964318e6324f7cae1bc75d8f3c79bc6969f00c159d68"
 
 CVE_PRODUCT = "pcre2"
 
-- 
2.32.0


