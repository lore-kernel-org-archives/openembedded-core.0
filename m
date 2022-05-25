Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5127C433FE
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 14:30:06 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web10.7514.1653489005753812311
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=mtx09SmE;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id t28so11440315pga.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UgHlZgILg60T9psgOWukIn8iVKrS/f0CASyPQa6y6GA=;
        b=mtx09SmE/zeNeEnPwbO9vKrIhaV8AHa6zQtxtmRCyIW2p0xQ9k9S/0GJvBMccobZRA
         BHHtAr1v0Dat/f7pg3KWuH0DOwwUQmGsTTYQ0OK1w2RyhmYvVbvl+D4FeIuJ6PrNggq1
         wUZzAVokEyy5pjpaXdss3ZmA5ZxmZNBiH6M35EoYtGJ77DyxjSHlAEg8kpJwKp+HZSt8
         W3bJ9bmlisqS4i8JtwnaTWWPAb6DGf0ApcNMKHTdJbtPTbqAwFjMNj4aYLtQ6sn9JOGw
         W+7Nl1HGNeyh5BpBUcY36/hn8n0BwkdRV5drpWWiwZo3sruPZk33LXxpYqEzfmHy8+bd
         Q2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UgHlZgILg60T9psgOWukIn8iVKrS/f0CASyPQa6y6GA=;
        b=3STtLhwvf1RLOctrO176w4T5t20Q2g3hU5rr3kN7UcXXUqqIds1w2Y4Z4GuusZUBlh
         QO5ExI74xQcXYscyko8RYakUy80s/Zgz6PDLQ7JuO/d5PkvSuMExaQWBEreLeojLEUtS
         NQJ/YygtCDSWwsGZUvInDiNy6OAJI92jXYB/xulp9P+XhjYhP8WEu6mkUD4Ki3vryoQE
         wBylzQxpdf0fSAGfzobB3Kfo1k3Sf0DF9Ppxy3tZhm+t9WOs6knd/U/wkZm8ymSM0gn3
         n8fA6KV0MDS50jMQLbtnuLJYCSysoT74Zi6nVQAje8eJQH9AdSiw6YPQuRwtZkvwrlag
         lccg==
X-Gm-Message-State: AOAM531GBYRuDVHAOdaO+lpiSTsjWjEENeezHShnXLwAQVl3AFHwWDix
	T3ni8PYELOpkRjveqcP8/T7tin4m/Y5wQG7O
X-Google-Smtp-Source: 
 ABdhPJz1pP1hXDjCIuWGI6p/whHMRAw2cabsXqx2O0VrS2LbqdAbwJNehtuJdSAa7GUAktcV/cT30g==
X-Received: by 2002:aa7:88cc:0:b0:518:931b:7d0e with SMTP id
 k12-20020aa788cc000000b00518931b7d0emr18906934pff.21.1653489004403;
        Wed, 25 May 2022 07:30:04 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a8-20020a656408000000b003db141a5f26sm8553837pgv.1.2022.05.25.07.30.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 07:30:03 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 01/19] pcre2: CVE-2022-1586 Out-of-bounds read
Date: Wed, 25 May 2022 04:29:29 -1000
Message-Id: 
 <fb6c980105ffd0262517299ab366218c61cc0665.1653488418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1653488418.git.steve@sakoman.com>
References: <cover.1653488418.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 14:30:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166127

From: Hitendra Prajapati <hprajapati@mvista.com>

Backport from https://github.com/PCRE2Project/pcre2/commit/50a51cb7e67268e6ad417eb07c9de9bfea5cc55a
CVE-2022-1586: pcre2: Out-of-bounds read in compile_xclass_matchingpath in pcre2_jit_compile.c.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
(cherry picked from commit 7519eb1cb624bb576cfe60f7470d40c566818ac3)
Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


