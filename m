Return-Path: <jpuhlman@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE90FC433F5
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 05:20:14 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.5978.1653369590137885066
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 22:20:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=kovUhfwT;
 spf=pass (domain: mvista.com, ip: 209.85.216.50,
 mailfrom: jpuhlman@mvista.com)
Received: by mail-pj1-f50.google.com with SMTP id
 v5-20020a17090a7c0500b001df84fa82f8so1181321pjf.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 22:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fNdaxGIMxiFoeFsbF7IYE3//keN4Q/sDWHL5BSHOKEc=;
        b=kovUhfwTC9pFErAiKQc2bpzeep6k8yjcUR5S0smKaDVZvLqPHAk1bL0KYotAOuaCh5
         leFuQTN0pTQkiXrv13wWYWrYzvMqOWhQnKKYy9APjHzhM8mZAhMq9NocKeAv4FI6mCx5
         hTQRu4iNZjvSWwtvteMmDMEsrhMfChTAHvuoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fNdaxGIMxiFoeFsbF7IYE3//keN4Q/sDWHL5BSHOKEc=;
        b=4JsfKRhsfAxaWmbtfinXQDo7w8TgELppbdvsPSRz2u0jrqp9Idn+X5pxhDmIYvJOtT
         tmmvWvoilPFF8nXz0F9B8gRa4/acsLMYKgqlKslptyEqh1dQ3o892lMNCJHyuHKaJ5BP
         H/b3gbUPa/3HUqoLuFz98zMFrwBm6yFq7WLbyJ86izeEXeJRPeYsLICL2771Xvjo9vMO
         JRS6niLr/HlY1lzwKK6QybMpg01WHB3mF510wWKSAALkCASaGT8N4xP8rvWmh/s7O8tc
         RbgM3OMS7/3f6/3EvWL9Bmn+ELRYrLfVS8lc/0UCE+S7+isyGv5I1CGX6teI+2Vd1BeS
         duzg==
X-Gm-Message-State: AOAM533SYd092uBdq2OqmHcZ/mAKPSW6gAw2K2sYZMLO1sv3xUZBEZiX
	9p5iyfHaMwd1K9DyhEku6GJtKyffLbdopA==
X-Google-Smtp-Source: 
 ABdhPJxsN+vAkJNNaROBO68Ih7hIpm6PAyaQG+JhezFcQwyQHnvv09bVO3BEv9DeEvdTdDybL+kQ0g==
X-Received: by 2002:a17:902:690b:b0:159:65c:9044 with SMTP id
 j11-20020a170902690b00b00159065c9044mr26591280plk.47.1653369609566;
        Mon, 23 May 2022 22:20:09 -0700 (PDT)
Received: from brown (99-14-97-149.lightspeed.frokca.sbcglobal.net.
 [99.14.97.149])
        by smtp.gmail.com with ESMTPSA id
 f2-20020a170902f38200b0015e8d4eb24fsm6014957ple.153.2022.05.23.22.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 May 2022 22:20:09 -0700 (PDT)
Received: by brown (sSMTP sendmail emulation); Mon, 23 May 2022 22:20:07 -0700
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>,
	"Jeremy A . Puhlman" <jpuhlman@mvista.com>
Subject: [dunfell][PATCH] pcre2: CVE-2022-1586 Out-of-bounds read
Date: Mon, 23 May 2022 22:20:06 -0700
Message-Id: <20220524052006.4172188-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 May 2022 05:20:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166047

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
2.35.3


