Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 122AFC4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 13:56:28 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.31720.1701870981063159370
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 05:56:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BRnqJub1;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d048d38881so33492205ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 05:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1701870980; x=1702475780; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9u+LxDkaTe2bsFaFvJIvlLv/8MTu/NQtnDXvfRaiXoc=;
        b=BRnqJub17peDOVcVGrsvmUZJhGWhGNzPO30RUa19JGwNCvNw0s9sAuUd9uYgJF36P3
         LD5DpiDDHTIC2ARItyhoxqN7nLFnvjqNti1BqtNuKmKHEnpxpmgSvgMnvoXn09ooYmAB
         JOM2pjPrsyFSvr0TOwA86MLZxxt4pd6Qmn+wwFIIZRmO2rBfIElBjlNFvrmOJ9Luv6ZH
         cfLtCirgAsL77sSxzuLCnZu4GygwF54luD4n947vMRiFy6RX++1UZwKgS0DcD295LoVr
         c5Nn+wB1/2ZoRi4dTs2ZzJcx/BgZKdexfB/X+mxJH66mEel9caKDA/z2qMZqxZD9cweU
         laAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701870980; x=1702475780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9u+LxDkaTe2bsFaFvJIvlLv/8MTu/NQtnDXvfRaiXoc=;
        b=HDbMU8oua8uI+ViVrz86lWIIA9apTTDRXNtFwXxkg5g7a4RqNAcsB/HKyMWMHkB6w5
         GL3hZAc10KLYLXBhNYjt/4JjchSFcxyFXkj40WszHvTjC3z8+gcAzyYW9e6OfbeSCDxj
         gLHuaaJWtJ+X6Cc2NOPDmM7vT7fbs5gKDxysnzeBwwyd/xyL48g/4N/EjJdgrbZNdBj3
         FN12CHOR5VFoBUpMmNzU2g27/A6kO/F4lDz7NnhGHlMH66sz0j2+XeymENflBINkjICA
         ++4YX4uTnOmXRuwPZrdLxox4CIO9QvCQ9pMUVwXZ0SycgJNFWe5Ek1fvDpLDP/cbJtqX
         1dXg==
X-Gm-Message-State: AOJu0Yy5GRsFhPAJsu5xTI5Zki8vwH6DeTCdbBh/PL0rtdAG5LJlwctU
	GKcPp7joKRT3pabHw4rRdwgfgDKnWLmCLHt8xxg=
X-Google-Smtp-Source: AGHT+IH/qN8gsHGKz7PH+KpZ5+PO40wfywj/Ho2SwjEXf8eq6/n0FVmXR8d8ZzYhFkX/KmZUIeBKUQ==
X-Received: by 2002:a17:903:2292:b0:1d0:b1ca:ef5 with SMTP id b18-20020a170903229200b001d0b1ca0ef5mr747962plh.135.1701870980127;
        Wed, 06 Dec 2023 05:56:20 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id h14-20020a170902680e00b001d07b659f91sm7887650plk.6.2023.12.06.05.56.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 05:56:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/11] cve-exclusion_5.4.inc: update for 5.4.262
Date: Wed,  6 Dec 2023 03:55:54 -1000
Message-Id: <a929aa6c0a57ed4e1192e1552eacc6dfda8eeee7.1701870718.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1701870718.git.steve@sakoman.com>
References: <cover.1701870718.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 13:56:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191897

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/cve-exclusion_5.4.inc               | 79 +++++++++++++++----
 1 file changed, 64 insertions(+), 15 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.4.inc b/meta/recipes-kernel/linux/cve-exclusion_5.4.inc
index 4c17b701df..983424d427 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_5.4.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_5.4.inc
@@ -1,9 +1,9 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2023-10-24 06:03:05.289306 for version 5.4.257
+# Generated at 2023-12-05 04:45:42.561193 for version 5.4.262
 
 python check_kernel_cve_status_version() {
-    this_version = "5.4.257"
+    this_version = "5.4.262"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -5638,7 +5638,8 @@ CVE_CHECK_WHITELIST += "CVE-2021-43976"
 # cpe-stable-backport: Backported in 5.4.170
 CVE_CHECK_WHITELIST += "CVE-2021-44733"
 
-# CVE-2021-44879 needs backporting (fixed from 5.17rc1)
+# cpe-stable-backport: Backported in 5.4.260
+CVE_CHECK_WHITELIST += "CVE-2021-44879"
 
 # cpe-stable-backport: Backported in 5.4.171
 CVE_CHECK_WHITELIST += "CVE-2021-45095"
@@ -6500,7 +6501,7 @@ CVE_CHECK_WHITELIST += "CVE-2022-43945"
 
 # CVE-2022-44033 needs backporting (fixed from 6.4rc1)
 
-# CVE-2022-44034 has no known resolution
+# CVE-2022-44034 needs backporting (fixed from 6.4rc1)
 
 # CVE-2022-4543 has no known resolution
 
@@ -6670,7 +6671,8 @@ CVE_CHECK_WHITELIST += "CVE-2023-1118"
 # fixed-version: only affects 5.15rc1 onwards
 CVE_CHECK_WHITELIST += "CVE-2023-1192"
 
-# CVE-2023-1193 has no known resolution
+# fixed-version: only affects 5.15rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-1193"
 
 # fixed-version: only affects 5.15rc1 onwards
 CVE_CHECK_WHITELIST += "CVE-2023-1194"
@@ -6964,7 +6966,8 @@ CVE_CHECK_WHITELIST += "CVE-2023-3106"
 
 # CVE-2023-31084 needs backporting (fixed from 6.4rc3)
 
-# CVE-2023-31085 needs backporting (fixed from 5.4.258)
+# cpe-stable-backport: Backported in 5.4.258
+CVE_CHECK_WHITELIST += "CVE-2023-31085"
 
 # cpe-stable-backport: Backported in 5.4.247
 CVE_CHECK_WHITELIST += "CVE-2023-3111"
@@ -7079,7 +7082,8 @@ CVE_CHECK_WHITELIST += "CVE-2023-34256"
 # fixed-version: only affects 6.1 onwards
 CVE_CHECK_WHITELIST += "CVE-2023-34319"
 
-# CVE-2023-34324 needs backporting (fixed from 5.4.258)
+# fixed-version: only affects 5.10rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-34324"
 
 # fixed-version: only affects 5.15rc1 onwards
 CVE_CHECK_WHITELIST += "CVE-2023-3439"
@@ -7104,7 +7108,8 @@ CVE_CHECK_WHITELIST += "CVE-2023-35824"
 # fixed-version: only affects 5.18rc1 onwards
 CVE_CHECK_WHITELIST += "CVE-2023-35826"
 
-# CVE-2023-35827 has no known resolution
+# cpe-stable-backport: Backported in 5.4.259
+CVE_CHECK_WHITELIST += "CVE-2023-35827"
 
 # cpe-stable-backport: Backported in 5.4.243
 CVE_CHECK_WHITELIST += "CVE-2023-35828"
@@ -7182,7 +7187,8 @@ CVE_CHECK_WHITELIST += "CVE-2023-3867"
 # cpe-stable-backport: Backported in 5.4.257
 CVE_CHECK_WHITELIST += "CVE-2023-39189"
 
-# CVE-2023-39191 needs backporting (fixed from 6.3rc1)
+# fixed-version: only affects 5.19rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-39191"
 
 # cpe-stable-backport: Backported in 5.4.257
 CVE_CHECK_WHITELIST += "CVE-2023-39192"
@@ -7193,6 +7199,11 @@ CVE_CHECK_WHITELIST += "CVE-2023-39193"
 # cpe-stable-backport: Backported in 5.4.255
 CVE_CHECK_WHITELIST += "CVE-2023-39194"
 
+# cpe-stable-backport: Backported in 5.4.251
+CVE_CHECK_WHITELIST += "CVE-2023-39197"
+
+# CVE-2023-39198 needs backporting (fixed from 6.5rc7)
+
 # fixed-version: only affects 5.6rc1 onwards
 CVE_CHECK_WHITELIST += "CVE-2023-4004"
 
@@ -7204,7 +7215,8 @@ CVE_CHECK_WHITELIST += "CVE-2023-4015"
 # cpe-stable-backport: Backported in 5.4.253
 CVE_CHECK_WHITELIST += "CVE-2023-40283"
 
-# CVE-2023-40791 needs backporting (fixed from 6.5rc6)
+# fixed-version: only affects 6.3rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-40791"
 
 # cpe-stable-backport: Backported in 5.4.253
 CVE_CHECK_WHITELIST += "CVE-2023-4128"
@@ -7246,7 +7258,8 @@ CVE_CHECK_WHITELIST += "CVE-2023-42752"
 # cpe-stable-backport: Backported in 5.4.257
 CVE_CHECK_WHITELIST += "CVE-2023-42753"
 
-# CVE-2023-42754 needs backporting (fixed from 5.4.258)
+# cpe-stable-backport: Backported in 5.4.258
+CVE_CHECK_WHITELIST += "CVE-2023-42754"
 
 # cpe-stable-backport: Backported in 5.4.257
 CVE_CHECK_WHITELIST += "CVE-2023-42755"
@@ -7281,14 +7294,16 @@ CVE_CHECK_WHITELIST += "CVE-2023-4569"
 # cpe-stable-backport: Backported in 5.4.235
 CVE_CHECK_WHITELIST += "CVE-2023-45862"
 
-# CVE-2023-45863 needs backporting (fixed from 6.3rc1)
+# cpe-stable-backport: Backported in 5.4.260
+CVE_CHECK_WHITELIST += "CVE-2023-45863"
 
 # cpe-stable-backport: Backported in 5.4.257
 CVE_CHECK_WHITELIST += "CVE-2023-45871"
 
-# CVE-2023-45898 needs backporting (fixed from 6.6rc1)
+# fixed-version: only affects 6.5rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-45898"
 
-# CVE-2023-4610 has no known resolution
+# CVE-2023-4610 needs backporting (fixed from 6.4)
 
 # fixed-version: only affects 6.4rc1 onwards
 CVE_CHECK_WHITELIST += "CVE-2023-4611"
@@ -7298,6 +7313,13 @@ CVE_CHECK_WHITELIST += "CVE-2023-4611"
 # cpe-stable-backport: Backported in 5.4.257
 CVE_CHECK_WHITELIST += "CVE-2023-4623"
 
+# fixed-version: only affects 5.10rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-46813"
+
+# CVE-2023-46862 needs backporting (fixed from 6.6)
+
+# CVE-2023-47233 has no known resolution
+
 # CVE-2023-4732 needs backporting (fixed from 5.14rc1)
 
 # CVE-2023-4881 needs backporting (fixed from 6.6rc1)
@@ -7305,7 +7327,14 @@ CVE_CHECK_WHITELIST += "CVE-2023-4623"
 # cpe-stable-backport: Backported in 5.4.257
 CVE_CHECK_WHITELIST += "CVE-2023-4921"
 
-# CVE-2023-5158 has no known resolution
+# fixed-version: only affects 6.0rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-5090"
+
+# fixed-version: only affects 5.13rc1 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-5158"
+
+# cpe-stable-backport: Backported in 5.4.260
+CVE_CHECK_WHITELIST += "CVE-2023-5178"
 
 # fixed-version: only affects 5.9rc1 onwards
 CVE_CHECK_WHITELIST += "CVE-2023-5197"
@@ -7313,3 +7342,23 @@ CVE_CHECK_WHITELIST += "CVE-2023-5197"
 # fixed-version: only affects 6.1rc1 onwards
 CVE_CHECK_WHITELIST += "CVE-2023-5345"
 
+# fixed-version: only affects 6.2 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-5633"
+
+# cpe-stable-backport: Backported in 5.4.259
+CVE_CHECK_WHITELIST += "CVE-2023-5717"
+
+# CVE-2023-5972 needs backporting (fixed from 6.6rc7)
+
+# CVE-2023-6039 needs backporting (fixed from 6.5rc5)
+
+# fixed-version: only affects 6.6rc3 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-6111"
+
+# CVE-2023-6121 needs backporting (fixed from 6.7rc3)
+
+# fixed-version: only affects 5.7rc7 onwards
+CVE_CHECK_WHITELIST += "CVE-2023-6176"
+
+# CVE-2023-6238 has no known resolution
+
-- 
2.34.1


