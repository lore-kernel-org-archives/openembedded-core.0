Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C50D9C4332F
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 14:36:36 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.7594.1653489391091661760
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:36:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=BC7B2HOD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id y199so19380481pfb.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=BVN+yR6gOpOCDU9HEcpn2o5X/BN2rD2acwmVWwGwDvA=;
        b=BC7B2HODRc3XdMYHZCLlRuKvfGC1LUri43D+FhL9WqSIaOQgI1nX6b00iTsUf8BbLt
         GQ2LvjQQPEOlKnh9SjouPslRRd6uvblaJ9biyCcOI1VFyMcptVDrhl4AaNNnKLr4k5r5
         fzO96elEuycj2cmx1Ke9T/e+QMJrQy8EJ1I4w1IOvFBVyrfQMljvevHIW2dhphtgWkf7
         zUb7Ycv7FkmotN+denO4yDoaI6taBM/QMSJhljLJw5yyxzMBbXMmhmQeDSPQXRhTTCWy
         UY7sppGcSasTh5Cj1lt0x6MYecgZoWZLGgrH3RGcdJWWHxOOR680iaCwx4/5mbC4m4jJ
         fm4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BVN+yR6gOpOCDU9HEcpn2o5X/BN2rD2acwmVWwGwDvA=;
        b=PTE0PUgNIPiAgJASSQPz8FuK1+3AdFJhUK1seNr6XnAaswxLYDP8GRccX4kwlrP1rQ
         hMn6MPQChEBMn5OOzXkF807sR9/6z9At47wzrmII+nSHmIEW2hFYBwJA4rTWdLmnx7BL
         wrKwywpfdtT1CLWiapYim5O6Wj4qDumrZ36/DDvPz8WJbq/KvtmsZzLZDVEYdesmDqiQ
         tg+qmRtSKy5tROHQUF3+c1WdMhtVqEcL78puybHLjhkly6aRkOstHGYFkBE7xGihIVP4
         pQzN/+2AuGqukixJJihalDVRlI64rUQh5p4gzwEsnoUDS9NLDdB/23DD5VibZoI88xTx
         c1sA==
X-Gm-Message-State: AOAM532yeVJv47uSe2ohQQduA7DFERAYJNSuq4R8n4KqjPyy+56D42F2
	jOcvnJ+VWrb1EaBoMGSaGlOUDTDhaqQyv0ei
X-Google-Smtp-Source: 
 ABdhPJzaepxeaVqYXqykfQg3us0UJ8TZEYm7m3ZlZ7s1rCt4SZc65pnHoQedEU9HyB5C6pwDoyNTsw==
X-Received: by 2002:a05:6a00:b41:b0:50d:35fa:476d with SMTP id
 p1-20020a056a000b4100b0050d35fa476dmr34129300pfo.33.1653489389479;
        Wed, 25 May 2022 07:36:29 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 h6-20020a170902f70600b0015eb200cc00sm9399287plo.138.2022.05.25.07.36.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 07:36:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/4] pcre2: CVE-2022-1586 Out-of-bounds read
Date: Wed, 25 May 2022 04:36:09 -1000
Message-Id: 
 <7f4daf88b71f486ddc7140500d2b44181a99222f.1653489126.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1653489126.git.steve@sakoman.com>
References: <cover.1653489126.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 14:36:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166147

From: Hitendra Prajapati <hprajapati@mvista.com>

Source:  https://github.com/PCRE2Project/pcre2
MR: 118027
Type: Security Fix
Disposition: Backport from https://github.com/PCRE2Project/pcre2/commit/50a51cb7e67268e6ad417eb07c9de9bfea5cc55a
ChangeID: e9b448d96a7e58b34b2c4069757a6f3ca0917713
Description:

CVE-2022-1586: pcre2: Out-of-bounds read in compile_xclass_matchingpath in pcre2_jit_compile.c.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../libpcre/libpcre2/CVE-2022-1586.patch      | 59 +++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.34.bb |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2022-1586.patch

diff --git a/meta/recipes-support/libpcre/libpcre2/CVE-2022-1586.patch b/meta/recipes-support/libpcre/libpcre2/CVE-2022-1586.patch
new file mode 100644
index 0000000000..fbbbc9ca77
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre2/CVE-2022-1586.patch
@@ -0,0 +1,59 @@
+From 233c4248550d0c1d9bfee42198d5ee0855b7d413 Mon Sep 17 00:00:00 2001
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
+ src/pcre2_jit_test.c    | 4 ++++
+ 3 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index 0926c29..b5d72dc 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,6 +1,9 @@
+ Change Log for PCRE2
+ --------------------
+ 
++23. Fixed a unicode properrty matching issue in JIT. The character was not
++fully read in caseless matching.
++
+ 
+ Version 10.34 21-November-2019
+ ------------------------------
+diff --git a/src/pcre2_jit_compile.c b/src/pcre2_jit_compile.c
+index f564127..5d43865 100644
+--- a/src/pcre2_jit_compile.c
++++ b/src/pcre2_jit_compile.c
+@@ -7119,7 +7119,7 @@ while (*cc != XCL_END)
+     {
+     SLJIT_ASSERT(*cc == XCL_PROP || *cc == XCL_NOTPROP);
+     cc++;
+-    if (*cc == PT_CLIST)
++    if (*cc == PT_CLIST && *cc == XCL_PROP)
+       {
+       other_cases = PRIV(ucd_caseless_sets) + cc[1];
+       while (*other_cases != NOTACHAR)
+diff --git a/src/pcre2_jit_test.c b/src/pcre2_jit_test.c
+index a9b3880..9df87fd 100644
+--- a/src/pcre2_jit_test.c
++++ b/src/pcre2_jit_test.c
+@@ -408,6 +408,10 @@ static struct regression_test_case regression_test_cases[] = {
+ 	{ MUP, A, 0, 0 | F_PROPERTY, "[\xc3\xa2-\xc3\xa6\xc3\x81-\xc3\x84\xe2\x80\xa8-\xe2\x80\xa9\xe6\x92\xad\\p{Zs}]{2,}", "\xe2\x80\xa7\xe2\x80\xa9\xe6\x92\xad \xe6\x92\xae" },
+ 	{ MUP, A, 0, 0 | F_PROPERTY, "[\\P{L&}]{2}[^\xc2\x85-\xc2\x89\\p{Ll}\\p{Lu}]{2}", "\xc3\xa9\xe6\x92\xad.a\xe6\x92\xad|\xc2\x8a#" },
+ 	{ PCRE2_UCP, 0, 0, 0 | F_PROPERTY, "[a-b\\s]{2,5}[^a]", "AB  baaa" },
++	{ MUP, 0, 0, 0 | F_NOMATCH, "[^\\p{Hangul}\\p{Z}]", " " },
++	{ MUP, 0, 0, 0, "[\\p{Lu}\\P{Latin}]+", "c\xEA\xA4\xAE,A,b" },
++	{ MUP, 0, 0, 0, "[\\x{a92e}\\p{Lu}\\P{Latin}]+", "c\xEA\xA4\xAE,A,b" },
++	{ CMUP, 0, 0, 0, "[^S]\\B", "\xe2\x80\x8a" },
+ 
+ 	/* Possible empty brackets. */
+ 	{ MU, A, 0, 0, "(?:|ab||bc|a)+d", "abcxabcabd" },
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/libpcre/libpcre2_10.34.bb b/meta/recipes-support/libpcre/libpcre2_10.34.bb
index f2c36944d8..213b946a54 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.34.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.34.bb
@@ -12,6 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=b1588d3bb4cb0e1f5a597d908f8c5b37"
 
 SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/pcre2-${PV}.tar.bz2 \
            file://pcre-cross.patch \
+           file://CVE-2022-1586.patch \
 "
 
 SRC_URI[md5sum] = "d280b62ded13f9ccf2fac16ee5286366"
-- 
2.25.1


