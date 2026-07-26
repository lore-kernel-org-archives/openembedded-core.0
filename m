Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 645B7C54F4D
	for <webhook@archiver.kernel.org>; Sun, 26 Jul 2026 08:30:21 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7375.1785054613943754572
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jul 2026 01:30:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bfnZlbHl;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954d383e64so11184435e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 01:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1785054612; x=1785659412; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=eEQnw+yZG4u6FjxMXAZ3NwGd//BVqR4DTYUckOUkmuE=;
        b=bfnZlbHlJ9CHoNFJn3+4ND3zOYLFfLzmQNSIN5RM0vL+Un7PibSapE4NYaVMZbVY/E
         QmPDbZOTRxmz8h1zMI3Uv2Z4pEFcGwQmb/r2WwzyjPyNFFtzVsf08ruWccgG+D2W8rK0
         XZjJ4erdkIGELdKC/pjRziapPrj9RsjMdZeKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785054612; x=1785659412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eEQnw+yZG4u6FjxMXAZ3NwGd//BVqR4DTYUckOUkmuE=;
        b=oheHmSGXm3e0XDirYLhgi6s74QA/Zocp53LxmiCURPRVY4k4kl3g/tfRaaY+EvhfjV
         ctbyJh57PU9hmAfo+OwZbiQfZtcyZCu4y7dedIJCKppKoEYYPg9NwWDxzL9bSCGDZd8l
         pGNtMAlhgWrcXFg0xtuSdQmKxCRnmOYoevOmTEwMC15/M48FnsGQBp2h9scIJvRMhfoK
         szmRHJAaS8t7D4yl4fARtsq8C6ATsAGVSh4Gdmkhw+1Fby2RHhdse8VDlGJTqURNbiJe
         PLsjpX3LZXFxUnlRA2Ahkpu8Ismn7qEHAtBTYJA9bIBRbRc8/5oZHvif5w9KDHjJvViM
         fRtw==
X-Gm-Message-State: AOJu0YzuyYULgSM5bMuOpYbWqr0wwUMjrgLbL4GTGXhiT3oiGl+g2A5J
	X2bri4QidJ8WQzrOQpNsauf2RNZT320pb90kgvCBQK0r2HNCL3nn8r/MyuP33CPDwC8u+LEBZd2
	QtB85H58=
X-Gm-Gg: AR+sD13bTJIcpRcyVmUdTYEGy2ee+8JEoLo2kmzxRv/RA4pAp15R3ox/O2JBwkJ9sKH
	AALzCuL/jTYigUTyR9elUpTxG9CPK19Fems5npc5PUOwpoB7ZP4YqB2Xsvc6im7axPPb4UNNukq
	c5X7JDFHn/fBNXkz3qRRpHlW4GVrqMDNwx7VQ0ojv+4Tp6IJE+QNkBGYKSBImFiTN1MVAQP6+fv
	/mNcBS2K1bbgMaGCPANARqQ3WFuiSszfT/R3W47l5tgCEe3bhkBfwwp9eyQw7jxj9ZXcaKXODHM
	Jw12Q83NhkLGs/4luogQvkTCwYlA+rK2pCrHDG46WFpVOg03/dYnCAFv1jhQ1jF4dNnhPYgbA3O
	CcuBs6ZG5RuLNkTptGeoVuT+50yq6mel7sezzOsSq1BR0ikf+fviNeIZlEmxvjQu/ItOWt6POG0
	ltKavA3ZHOD28X7f/UhoVQaMXk28ORMyN9ZO7zSghTjMbjJtqLsx7RMamv6IK1REIFflxEQlPwA
	omUEw==
X-Received: by 2002:a05:600c:1553:b0:492:6f6f:fa42 with SMTP id 5b1f17b1804b1-496b5711f19mr57421015e9.37.1785054611642;
        Sun, 26 Jul 2026 01:30:11 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4f24a93sm142482505e9.11.2026.07.26.01.30.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 01:30:11 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/31] linux-yocto/6.6: update CVE exclusions (6.6.144)
Date: Sun, 26 Jul 2026 10:29:28 +0200
Message-ID: <9b5c90be9cd6dfa5ed42f2e05935068ba31bac1b.1785054430.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1785054429.git.yoann.congal@smile.fr>
References: <cover.1785054429.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jul 2026 08:30:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241987

From: Yoann Congal <yoann.congal@smile.fr>

$ ./meta/recipes-kernel/linux/generate-cve-exclusions.py .../cvelistV5/ 6.6.144 > meta/recipes-kernel/linux/cve-exclusion_6.6.inc

Generated at 2026-07-23 08:09:32.765073+00:00 for kernel version 6.6.144
From cvelistV5 cve_2026-07-23_0700Z

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/cve-exclusion_6.6.inc               | 1216 ++++++++++++++---
 1 file changed, 1052 insertions(+), 164 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
index 2a194e7c84d..fd17e611a4b 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2026-07-07 17:39:10.952928+00:00 for kernel version 6.6.142
-# From cvelistV5 cve_2026-07-07_1600Z
+# Generated at 2026-07-23 08:09:32.765073+00:00 for kernel version 6.6.144
+# From cvelistV5 cve_2026-07-23_0700Z
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.6.142"
+    this_version = "6.6.144"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -15132,7 +15132,7 @@ CVE_STATUS[CVE-2024-58091] = "fixed-version: only affects 6.11 onwards"
 
 CVE_STATUS[CVE-2024-58092] = "fixed-version: only affects 6.8 onwards"
 
-# CVE-2024-58093 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2024-58093] = "cpe-stable-backport: Backported in 6.6.87"
 
 # CVE-2024-58094 needs backporting (fixed from 6.15)
 
@@ -15520,7 +15520,7 @@ CVE_STATUS[CVE-2025-21815] = "fixed-version: only affects 6.7 onwards"
 
 CVE_STATUS[CVE-2025-21816] = "cpe-stable-backport: Backported in 6.6.93"
 
-CVE_STATUS[CVE-2025-21817] = "fixed-version: only affects 6.13.2 onwards"
+CVE_STATUS[CVE-2025-21817] = "fixed-version: only affects 6.12.96 onwards"
 
 CVE_STATUS[CVE-2025-21819] = "cpe-stable-backport: Backported in 6.6.78"
 
@@ -16142,7 +16142,7 @@ CVE_STATUS[CVE-2025-22128] = "fixed-version: only affects 6.8 onwards"
 
 # CVE-2025-23130 needs backporting (fixed from 6.15)
 
-# CVE-2025-23131 may need backporting (fixed from 6.6.144)
+CVE_STATUS[CVE-2025-23131] = "cpe-stable-backport: Backported in 6.6.144"
 
 # CVE-2025-23132 needs backporting (fixed from 6.15)
 
@@ -19764,7 +19764,7 @@ CVE_STATUS[CVE-2025-68294] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2025-68295] = "cpe-stable-backport: Backported in 6.6.119"
 
-# CVE-2025-68296 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2025-68296] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2025-68297] = "cpe-stable-backport: Backported in 6.6.119"
 
@@ -19958,7 +19958,7 @@ CVE_STATUS[CVE-2025-68734] = "cpe-stable-backport: Backported in 6.6.117"
 
 CVE_STATUS[CVE-2025-68735] = "fixed-version: only affects 6.10 onwards"
 
-# CVE-2025-68736 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2025-68736] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2025-68737] = "fixed-version: only affects 6.18 onwards"
 
@@ -20022,7 +20022,7 @@ CVE_STATUS[CVE-2025-68766] = "cpe-stable-backport: Backported in 6.6.120"
 
 CVE_STATUS[CVE-2025-68767] = "cpe-stable-backport: Backported in 6.6.120"
 
-# CVE-2025-68768 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2025-68768] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2025-68769] = "cpe-stable-backport: Backported in 6.6.120"
 
@@ -21098,7 +21098,7 @@ CVE_STATUS[CVE-2026-23275] = "fixed-version: only affects 6.13 onwards"
 
 CVE_STATUS[CVE-2026-23277] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23278 may need backporting (fixed from 6.6.144)
+CVE_STATUS[CVE-2026-23278] = "cpe-stable-backport: Backported in 6.6.144"
 
 CVE_STATUS[CVE-2026-23279] = "cpe-stable-backport: Backported in 6.6.130"
 
@@ -21230,7 +21230,7 @@ CVE_STATUS[CVE-2026-23344] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-23345] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2026-23346 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-23346] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-23347] = "cpe-stable-backport: Backported in 6.6.130"
 
@@ -21546,7 +21546,7 @@ CVE_STATUS[CVE-2026-31417] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-31418] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-31419 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-31419] = "cpe-stable-backport: Backported in 6.6.143"
 
 # CVE-2026-31420 needs backporting (fixed from 7.0)
 
@@ -21572,7 +21572,7 @@ CVE_STATUS[CVE-2026-31430] = "cpe-stable-backport: Backported in 6.6.135"
 
 CVE_STATUS[CVE-2026-31431] = "cpe-stable-backport: Backported in 6.6.137"
 
-# CVE-2026-31432 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-31432] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-31433] = "cpe-stable-backport: Backported in 6.6.131"
 
@@ -21680,7 +21680,7 @@ CVE_STATUS[CVE-2026-31484] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-31485] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31486 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-31486] = "cpe-stable-backport: Backported in 6.6.143"
 
 # CVE-2026-31487 needs backporting (fixed from 7.0)
 
@@ -22294,7 +22294,7 @@ CVE_STATUS[CVE-2026-43008] = "fixed-version: only affects 6.19 onwards"
 
 # CVE-2026-43009 needs backporting (fixed from 7.0)
 
-# CVE-2026-43010 may need backporting (fixed from 6.6.144)
+CVE_STATUS[CVE-2026-43010] = "cpe-stable-backport: Backported in 6.6.144"
 
 CVE_STATUS[CVE-2026-43011] = "cpe-stable-backport: Backported in 6.6.134"
 
@@ -22312,7 +22312,7 @@ CVE_STATUS[CVE-2026-43017] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-43018] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43019 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-43019] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-43020] = "cpe-stable-backport: Backported in 6.6.134"
 
@@ -22450,7 +22450,7 @@ CVE_STATUS[CVE-2026-43086] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-43087] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-43088 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-43088] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-43089] = "cpe-stable-backport: Backported in 6.6.136"
 
@@ -22506,7 +22506,7 @@ CVE_STATUS[CVE-2026-43114] = "cpe-stable-backport: Backported in 6.6.136"
 
 # CVE-2026-43115 needs backporting (fixed from 7.0)
 
-# CVE-2026-43116 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-43116] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-43117] = "cpe-stable-backport: Backported in 6.6.136"
 
@@ -22530,7 +22530,7 @@ CVE_STATUS[CVE-2026-43124] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43128] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43129 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-43129] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-43130] = "cpe-stable-backport: Backported in 6.6.128"
 
@@ -22710,7 +22710,7 @@ CVE_STATUS[CVE-2026-43217] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2026-43218] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43219 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-43219] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-43220] = "cpe-stable-backport: Backported in 6.6.140"
 
@@ -22752,7 +22752,7 @@ CVE_STATUS[CVE-2026-43238] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43239] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43240 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-43240] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-43241] = "cpe-stable-backport: Backported in 6.6.128"
 
@@ -22878,7 +22878,7 @@ CVE_STATUS[CVE-2026-43301] = "fixed-version: only affects 6.8 onwards"
 
 CVE_STATUS[CVE-2026-43302] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43303 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-43303] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-43304] = "cpe-stable-backport: Backported in 6.6.128"
 
@@ -22894,7 +22894,7 @@ CVE_STATUS[CVE-2026-43307] = "fixed-version: only affects 6.12 onwards"
 
 # CVE-2026-43310 needs backporting (fixed from 7.0)
 
-# CVE-2026-43311 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-43311] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-43312] = "cpe-stable-backport: Backported in 6.6.128"
 
@@ -22934,7 +22934,7 @@ CVE_STATUS[CVE-2026-43329] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-43330] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43331 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-43331] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-43332] = "cpe-stable-backport: Backported in 6.6.134"
 
@@ -23114,7 +23114,7 @@ CVE_STATUS[CVE-2026-43419] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-43420] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43421 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-43421] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-43424] = "cpe-stable-backport: Backported in 6.6.130"
 
@@ -23308,7 +23308,7 @@ CVE_STATUS[CVE-2026-45848] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-45849] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-45850 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-45850] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-45851] = "cpe-stable-backport: Backported in 6.6.128"
 
@@ -23468,7 +23468,7 @@ CVE_STATUS[CVE-2026-45928] = "fixed-version: only affects 6.8 onwards"
 
 CVE_STATUS[CVE-2026-45929] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-45930 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-45930] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-45931] = "fixed-version: only affects 6.14 onwards"
 
@@ -23714,7 +23714,7 @@ CVE_STATUS[CVE-2026-46052] = "cpe-stable-backport: Backported in 6.6.140"
 
 CVE_STATUS[CVE-2026-46053] = "cpe-stable-backport: Backported in 6.6.140"
 
-# CVE-2026-46054 may need backporting (fixed from 6.6.144)
+CVE_STATUS[CVE-2026-46054] = "cpe-stable-backport: Backported in 6.6.144"
 
 CVE_STATUS[CVE-2026-46055] = "fixed-version: only affects 7.0 onwards"
 
@@ -23790,7 +23790,7 @@ CVE_STATUS[CVE-2026-46089] = "cpe-stable-backport: Backported in 6.6.140"
 
 CVE_STATUS[CVE-2026-46091] = "cpe-stable-backport: Backported in 6.6.140"
 
-# CVE-2026-46092 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-46092] = "cpe-stable-backport: Backported in 6.6.140"
 
 CVE_STATUS[CVE-2026-46093] = "fixed-version: only affects 6.9 onwards"
 
@@ -23876,7 +23876,7 @@ CVE_STATUS[CVE-2026-46133] = "cpe-stable-backport: Backported in 6.6.140"
 
 CVE_STATUS[CVE-2026-46134] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2026-46135 may need backporting (fixed from 6.6.144)
+CVE_STATUS[CVE-2026-46135] = "cpe-stable-backport: Backported in 6.6.144"
 
 CVE_STATUS[CVE-2026-46136] = "cpe-stable-backport: Backported in 6.6.140"
 
@@ -23886,7 +23886,7 @@ CVE_STATUS[CVE-2026-46138] = "cpe-stable-backport: Backported in 6.6.140"
 
 CVE_STATUS[CVE-2026-46139] = "fixed-version: only affects 6.12.23 onwards"
 
-# CVE-2026-46140 may need backporting (fixed from 6.6.144)
+CVE_STATUS[CVE-2026-46140] = "cpe-stable-backport: Backported in 6.6.144"
 
 CVE_STATUS[CVE-2026-46141] = "fixed-version: only affects 6.18 onwards"
 
@@ -24086,7 +24086,7 @@ CVE_STATUS[CVE-2026-46240] = "fixed-version: only affects 6.18.16 onwards"
 
 # CVE-2026-46241 needs backporting (fixed from 7.1)
 
-# CVE-2026-46242 may need backporting (fixed from 6.6.144)
+CVE_STATUS[CVE-2026-46242] = "cpe-stable-backport: Backported in 6.6.144"
 
 CVE_STATUS[CVE-2026-46243] = "cpe-stable-backport: Backported in 6.6.142"
 
@@ -24106,7 +24106,7 @@ CVE_STATUS[CVE-2026-46250] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-46251] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-46252 may need backporting (fixed from 6.6.144)
+CVE_STATUS[CVE-2026-46252] = "cpe-stable-backport: Backported in 6.6.144"
 
 CVE_STATUS[CVE-2026-46253] = "cpe-stable-backport: Backported in 6.6.128"
 
@@ -24242,11 +24242,11 @@ CVE_STATUS[CVE-2026-46318] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-46319] = "cpe-stable-backport: Backported in 6.6.141"
 
-# CVE-2026-46320 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-46320] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-46321 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-46321] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-46322 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-46322] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-46323] = "cpe-stable-backport: Backported in 6.6.142"
 
@@ -24264,7 +24264,7 @@ CVE_STATUS[CVE-2026-46329] = "fixed-version: only affects 6.12 onwards"
 
 # CVE-2026-46330 needs backporting (fixed from 7.0)
 
-# CVE-2026-46331 may need backporting (fixed from 6.6.144)
+CVE_STATUS[CVE-2026-46331] = "cpe-stable-backport: Backported in 6.6.144"
 
 CVE_STATUS[CVE-2026-46332] = "fixed-version: only affects 6.12 onwards"
 
@@ -24278,17 +24278,17 @@ CVE_STATUS[CVE-2026-52906] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-52907] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-52908 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-52908] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-52909 may need backporting (fixed from 6.6.144)
+CVE_STATUS[CVE-2026-52909] = "cpe-stable-backport: Backported in 6.6.144"
 
-# CVE-2026-52910 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-52910] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-52911] = "cpe-stable-backport: Backported in 6.6.141"
 
 CVE_STATUS[CVE-2026-52912] = "cpe-stable-backport: Backported in 6.6.142"
 
-# CVE-2026-52913 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-52913] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-52914] = "cpe-stable-backport: Backported in 6.6.142"
 
@@ -24296,7 +24296,7 @@ CVE_STATUS[CVE-2026-52915] = "cpe-stable-backport: Backported in 6.6.142"
 
 CVE_STATUS[CVE-2026-52916] = "cpe-stable-backport: Backported in 6.6.142"
 
-# CVE-2026-52917 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-52917] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-52918] = "cpe-stable-backport: Backported in 6.6.142"
 
@@ -24308,21 +24308,21 @@ CVE_STATUS[CVE-2026-52921] = "cpe-stable-backport: Backported in 6.6.142"
 
 CVE_STATUS[CVE-2026-52922] = "cpe-stable-backport: Backported in 6.6.142"
 
-# CVE-2026-52923 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-52923] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-52924 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-52924] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-52925] = "cpe-stable-backport: Backported in 6.6.141"
 
 CVE_STATUS[CVE-2026-52926] = "cpe-stable-backport: Backported in 6.6.142"
 
-# CVE-2026-52927 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-52927] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-52928 may need backporting (fixed from 6.6.144)
+CVE_STATUS[CVE-2026-52928] = "cpe-stable-backport: Backported in 6.6.144"
 
-# CVE-2026-52929 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-52929] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-52930 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-52930] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-52931] = "cpe-stable-backport: Backported in 6.6.142"
 
@@ -24330,9 +24330,9 @@ CVE_STATUS[CVE-2026-52932] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2026-52933] = "cpe-stable-backport: Backported in 6.6.140"
 
-# CVE-2026-52934 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-52934] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-52935 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-52935] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-52936] = "cpe-stable-backport: Backported in 6.6.141"
 
@@ -24340,25 +24340,25 @@ CVE_STATUS[CVE-2026-52936] = "cpe-stable-backport: Backported in 6.6.141"
 
 CVE_STATUS[CVE-2026-52938] = "fixed-version: only affects 7.0 onwards"
 
-# CVE-2026-52939 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-52939] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-52940] = "fixed-version: only affects 6.17 onwards"
 
 CVE_STATUS[CVE-2026-52941] = "cpe-stable-backport: Backported in 6.6.142"
 
-# CVE-2026-52942 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-52942] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-52943 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-52943] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-52944 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-52944] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-52945] = "fixed-version: only affects 6.15.3 onwards"
 
-# CVE-2026-52946 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-52946] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-52947 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-52947] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-52948 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-52948] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-52949] = "fixed-version: only affects 6.15 onwards"
 
@@ -24622,7 +24622,7 @@ CVE_STATUS[CVE-2026-53077] = "cpe-stable-backport: Backported in 6.6.141"
 
 CVE_STATUS[CVE-2026-53079] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-53080 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53080] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-53081] = "fixed-version: only affects 6.11 onwards"
 
@@ -24724,23 +24724,23 @@ CVE_STATUS[CVE-2026-53128] = "cpe-stable-backport: Backported in 6.6.141"
 
 CVE_STATUS[CVE-2026-53130] = "cpe-stable-backport: Backported in 6.6.141"
 
-# CVE-2026-53131 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53131] = "cpe-stable-backport: Backported in 6.6.143"
 
 # CVE-2026-53132 needs backporting (fixed from 7.1)
 
-# CVE-2026-53133 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53133] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53134 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53134] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53135 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53135] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53136 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53136] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53137 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53137] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53138 may need backporting (fixed from 6.6.144)
+CVE_STATUS[CVE-2026-53138] = "cpe-stable-backport: Backported in 6.6.144"
 
-# CVE-2026-53139 may need backporting (fixed from 6.6.144)
+CVE_STATUS[CVE-2026-53139] = "cpe-stable-backport: Backported in 6.6.144"
 
 CVE_STATUS[CVE-2026-53140] = "fixed-version: only affects 6.8 onwards"
 
@@ -24748,57 +24748,55 @@ CVE_STATUS[CVE-2026-53141] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2026-53142] = "fixed-version: only affects 6.8 onwards"
 
-# CVE-2026-53143 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53143] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53144 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53144] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-53145] = "fixed-version: only affects 6.18.32 onwards"
 
-# CVE-2026-53146 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53146] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53147 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53147] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53148 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53148] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53149 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53149] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53150 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53150] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53151 may need backporting (fixed from 6.6.144)
+CVE_STATUS[CVE-2026-53151] = "cpe-stable-backport: Backported in 6.6.144"
 
 CVE_STATUS[CVE-2026-53152] = "fixed-version: only affects 6.12.78 onwards"
 
 CVE_STATUS[CVE-2026-53153] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2026-53154 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53154] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-53155] = "fixed-version: only affects 6.19 onwards"
 
 # CVE-2026-53156 needs backporting (fixed from 7.1)
 
-# CVE-2026-53157 may need backporting (fixed from 6.6.144)
+CVE_STATUS[CVE-2026-53157] = "cpe-stable-backport: Backported in 6.6.144"
 
-# CVE-2026-53158 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53158] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53159 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53159] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53160 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53160] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53161 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53161] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-53162] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-53163 may need backporting (fixed from 6.6.144)
+CVE_STATUS[CVE-2026-53163] = "cpe-stable-backport: Backported in 6.6.144"
 
 CVE_STATUS[CVE-2026-53164] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2026-53165] = "fixed-version: only affects 7.0 onwards"
 
-# CVE-2026-53166 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2026-53167] = "cpe-stable-backport: Backported in 6.6.144"
 
-# CVE-2026-53167 may need backporting (fixed from 6.6.144)
-
-# CVE-2026-53168 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53168] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-53169] = "fixed-version: only affects 6.19 onwards"
 
@@ -24814,9 +24812,9 @@ CVE_STATUS[CVE-2026-53174] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-53175] = "fixed-version: only affects 6.12.93 onwards"
 
-# CVE-2026-53176 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53176] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53177 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53177] = "cpe-stable-backport: Backported in 6.6.143"
 
 # CVE-2026-53178 needs backporting (fixed from 7.1)
 
@@ -24824,25 +24822,25 @@ CVE_STATUS[CVE-2026-53175] = "fixed-version: only affects 6.12.93 onwards"
 
 CVE_STATUS[CVE-2026-53180] = "fixed-version: only affects 6.9 onwards"
 
-# CVE-2026-53181 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53181] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53182 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53182] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53183 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53183] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53184 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53184] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53185 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53185] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53186 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53186] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-53187] = "fixed-version: only affects 6.17 onwards"
 
 CVE_STATUS[CVE-2026-53188] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-53189 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53189] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53190 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53190] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-53191] = "fixed-version: only affects 6.12 onwards"
 
@@ -24850,17 +24848,17 @@ CVE_STATUS[CVE-2026-53192] = "fixed-version: only affects 6.12 onwards"
 
 CVE_STATUS[CVE-2026-53193] = "fixed-version: only affects 6.12 onwards"
 
-# CVE-2026-53194 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53194] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53195 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53195] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53196 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53196] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-53197] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2026-53198 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53198] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53199 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53199] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-53200] = "fixed-version: only affects 6.19 onwards"
 
@@ -24876,57 +24874,57 @@ CVE_STATUS[CVE-2026-53205] = "fixed-version: only affects 6.12.30 onwards"
 
 CVE_STATUS[CVE-2026-53206] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-53207 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53207] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53208 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53208] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53209 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53209] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-53210] = "fixed-version: only affects 6.8 onwards"
 
 CVE_STATUS[CVE-2026-53211] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-53212 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53212] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53213 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53213] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53214 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53214] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53215 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53215] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53216 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53216] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53217 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53217] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53218 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53218] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53219 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53219] = "cpe-stable-backport: Backported in 6.6.143"
 
 # CVE-2026-53220 needs backporting (fixed from 7.1)
 
-# CVE-2026-53221 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53221] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-53222] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-53223 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53223] = "cpe-stable-backport: Backported in 6.6.143"
 
 # CVE-2026-53224 needs backporting (fixed from 7.1)
 
-# CVE-2026-53225 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53225] = "cpe-stable-backport: Backported in 6.6.143"
 
 # CVE-2026-53226 needs backporting (fixed from 7.1)
 
-# CVE-2026-53227 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53227] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53228 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53228] = "cpe-stable-backport: Backported in 6.6.143"
 
 # CVE-2026-53229 needs backporting (fixed from 7.1)
 
-# CVE-2026-53230 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53230] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-53231] = "fixed-version: only affects 7.0 onwards"
 
-# CVE-2026-53232 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53232] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-53233] = "fixed-version: only affects 6.12 onwards"
 
@@ -24934,47 +24932,47 @@ CVE_STATUS[CVE-2026-53234] = "fixed-version: only affects 6.12 onwards"
 
 CVE_STATUS[CVE-2026-53235] = "fixed-version: only affects 6.10 onwards"
 
-# CVE-2026-53236 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53236] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53237 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53237] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53238 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53238] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53239 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53239] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-53240] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2026-53241] = "fixed-version: only affects 6.10 onwards"
 
-# CVE-2026-53242 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53242] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-53243] = "fixed-version: only affects 7.0.10 onwards"
 
 CVE_STATUS[CVE-2026-53244] = "fixed-version: only affects 7.0 onwards"
 
-# CVE-2026-53245 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53245] = "cpe-stable-backport: Backported in 6.6.143"
 
 # CVE-2026-53246 needs backporting (fixed from 7.1)
 
-# CVE-2026-53247 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53247] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-53248] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-53249 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53249] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-53250] = "fixed-version: only affects 6.8 onwards"
 
 CVE_STATUS[CVE-2026-53251] = "fixed-version: only affects 6.12.2 onwards"
 
-# CVE-2026-53252 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53252] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53253 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53253] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53254 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53254] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53255 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53255] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53256 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53256] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-53257] = "fixed-version: only affects 6.16 onwards"
 
@@ -24988,31 +24986,31 @@ CVE_STATUS[CVE-2026-53261] = "fixed-version: only affects 6.7 onwards"
 
 # CVE-2026-53262 needs backporting (fixed from 7.1)
 
-# CVE-2026-53263 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53263] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53264 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53264] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53265 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53265] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53266 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53266] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53267 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53267] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53268 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53268] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53269 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53269] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53270 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53270] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53271 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53271] = "cpe-stable-backport: Backported in 6.6.143"
 
 # CVE-2026-53272 needs backporting (fixed from 7.1)
 
-# CVE-2026-53273 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53273] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53274 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53274] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53275 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53275] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-53276] = "fixed-version: only affects 6.19 onwards"
 
@@ -25112,19 +25110,19 @@ CVE_STATUS[CVE-2026-53323] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2026-53324] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2026-53325 may need backporting (fixed from 6.6.144)
+CVE_STATUS[CVE-2026-53325] = "cpe-stable-backport: Backported in 6.6.144"
 
 CVE_STATUS[CVE-2026-53326] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-53327 may need backporting (fixed from 6.6.144)
+CVE_STATUS[CVE-2026-53327] = "cpe-stable-backport: Backported in 6.6.144"
 
 CVE_STATUS[CVE-2026-53328] = "fixed-version: only affects 6.12 onwards"
 
-# CVE-2026-53329 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53329] = "cpe-stable-backport: Backported in 6.6.143"
 
 # CVE-2026-53330 needs backporting (fixed from 7.1)
 
-# CVE-2026-53331 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53331] = "cpe-stable-backport: Backported in 6.6.143"
 
 # CVE-2026-53332 needs backporting (fixed from 7.1)
 
@@ -25134,13 +25132,13 @@ CVE_STATUS[CVE-2026-53334] = "fixed-version: only affects 6.18 onwards"
 
 CVE_STATUS[CVE-2026-53335] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-53336 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53336] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53337 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53337] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-53338] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-53339 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53339] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-53340] = "fixed-version: only affects 6.14 onwards"
 
@@ -25148,43 +25146,933 @@ CVE_STATUS[CVE-2026-53341] = "fixed-version: only affects 6.11 onwards"
 
 CVE_STATUS[CVE-2026-53342] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-53343 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53343] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-53344] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-53345 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53345] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-53346] = "fixed-version: only affects 6.12 onwards"
 
-# CVE-2026-53347 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53347] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-53348] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-53349 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53349] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53350 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53350] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-53351] = "fixed-version: only affects 7.0 onwards"
 
-# CVE-2026-53352 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53352] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53353 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53353] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53354 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53354] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53355 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53355] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53356 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53356] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-53357] = "cpe-stable-backport: Backported in 6.6.142"
 
-# CVE-2026-53358 may need backporting (fixed from 6.6.143)
+CVE_STATUS[CVE-2026-53358] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53359 may need backporting (fixed from 6.6.144)
+CVE_STATUS[CVE-2026-53359] = "cpe-stable-backport: Backported in 6.6.144"
 
 CVE_STATUS[CVE-2026-53360] = "fixed-version: only affects 6.10 onwards"
 
-# CVE-2026-53361 may need backporting (fixed from 6.6.144)
+CVE_STATUS[CVE-2026-53361] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-53362] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-53363] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-53364] = "fixed-version: only affects 6.16.4 onwards"
+
+CVE_STATUS[CVE-2026-53365] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-53366] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-53367] = "fixed-version: only affects 6.17.10 onwards"
+
+# CVE-2026-53368 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53369] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-53370] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-53371] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-53372] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-53373] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-53374] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-53375] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-53376] = "cpe-stable-backport: Backported in 6.6.140"
+
+# CVE-2026-53377 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53378] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-53379] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-53380] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-53381] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-53382] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-53383] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-53384] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-53385] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-53386] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-53387] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-53388] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-53389] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-53390] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-53391] = "cpe-stable-backport: Backported in 6.6.144"
+
+# CVE-2026-53392 needs backporting (fixed from 7.2rc1)
+
+# CVE-2026-53393 needs backporting (fixed from 7.2rc1)
+
+CVE_STATUS[CVE-2026-53394] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-53395] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-53396] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-53397] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-53398] = "cpe-stable-backport: Backported in 6.6.144"
+
+# CVE-2026-53399 needs backporting (fixed from 7.2rc1)
+
+# CVE-2026-53400 needs backporting (fixed from 7.2rc1)
+
+# CVE-2026-53401 needs backporting (fixed from 7.2rc1)
+
+# CVE-2026-53402 needs backporting (fixed from 7.2rc1)
+
+CVE_STATUS[CVE-2026-53403] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-63793] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-63794] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-63795] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-63796] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-63797] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-63798] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-63799] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-63800] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-63801] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-63802] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-63803] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-63804] = "cpe-stable-backport: Backported in 6.6.144"
+
+# CVE-2026-63805 needs backporting (fixed from 7.2rc1)
+
+# CVE-2026-63806 needs backporting (fixed from 7.2rc1)
+
+CVE_STATUS[CVE-2026-63807] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-63808] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-63809] = "cpe-stable-backport: Backported in 6.6.144"
+
+# CVE-2026-63810 needs backporting (fixed from 7.2rc1)
+
+# CVE-2026-63811 needs backporting (fixed from 7.2rc1)
+
+CVE_STATUS[CVE-2026-63812] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-63813] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-63814] = "cpe-stable-backport: Backported in 6.6.144"
+
+# CVE-2026-63815 needs backporting (fixed from 7.2rc1)
+
+# CVE-2026-63816 needs backporting (fixed from 7.2rc1)
+
+CVE_STATUS[CVE-2026-63817] = "cpe-stable-backport: Backported in 6.6.144"
+
+# CVE-2026-63818 needs backporting (fixed from 7.2rc1)
+
+# CVE-2026-63819 needs backporting (fixed from 7.2rc1)
+
+CVE_STATUS[CVE-2026-63820] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-63821] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-63822] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-63823] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-63824] = "cpe-stable-backport: Backported in 6.6.144"
+
+# CVE-2026-63825 needs backporting (fixed from 7.2rc1)
+
+CVE_STATUS[CVE-2026-63826] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-63827] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-63828] = "cpe-stable-backport: Backported in 6.6.144"
+
+# CVE-2026-63829 needs backporting (fixed from 7.2rc1)
+
+CVE_STATUS[CVE-2026-63830] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-63831] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-63832] = "fixed-version: only affects 6.12.13 onwards"
+
+CVE_STATUS[CVE-2026-63833] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-63834] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-63835] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-63836] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-63837] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-63838] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-63839] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-63840] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-63841] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-63842] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-63843] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-63844] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-63845] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-63846] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-63847] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-63848] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-63849] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-63850] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-63851] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-63852] = "cpe-stable-backport: Backported in 6.6.141"
+
+# CVE-2026-63853 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-63854] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-63855] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-63856] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-63857] = "fixed-version: only affects 6.11 onwards"
+
+# CVE-2026-63858 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-63859] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-63860] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-63861] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-63862] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-63863] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-63864] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-63865] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-63866] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-63867] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63868] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63869] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-63870] = "cpe-stable-backport: Backported in 6.6.143"
+
+# CVE-2026-63871 needs backporting (fixed from 7.1)
+
+# CVE-2026-63872 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-63873] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-63874] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-63875] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63876] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63877] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63878] = "fixed-version: only affects 6.18 onwards"
+
+# CVE-2026-63879 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-63880] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-63881] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63882] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63883] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63884] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63885] = "fixed-version: only affects 6.18.32 onwards"
+
+CVE_STATUS[CVE-2026-63886] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63887] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63888] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63889] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63890] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63891] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63892] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63893] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63894] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-63895] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63896] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63897] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63898] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63899] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63900] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63901] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63902] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63903] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63904] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63905] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63906] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63907] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-63908] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63909] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63910] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-63911] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-63912] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63913] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63914] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63915] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63916] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63917] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63918] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-63919] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63920] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63921] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63922] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63923] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-63924] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63925] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63926] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63927] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63928] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63929] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-63930] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63931] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63932] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-63933] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63934] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63935] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-63936] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-63937] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-63938] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-63939] = "fixed-version: only affects 6.11 onwards"
+
+# CVE-2026-63940 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-63941] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-63942] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63943] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63944] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63945] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63946] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63947] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63948] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63949] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63950] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-63951] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-63952] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63953] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-63954] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63955] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-63956] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63957] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63958] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63959] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63960] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63961] = "cpe-stable-backport: Backported in 6.6.143"
+
+# CVE-2026-63962 needs backporting (fixed from 7.1)
+
+# CVE-2026-63963 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-63964] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63965] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-63966] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-63967] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63968] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63969] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63970] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-63971] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63972] = "fixed-version: only affects 6.18.33 onwards"
+
+CVE_STATUS[CVE-2026-63973] = "cpe-stable-backport: Backported in 6.6.143"
+
+# CVE-2026-63974 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-63975] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63976] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63977] = "fixed-version: only affects 6.18 onwards"
+
+# CVE-2026-63978 needs backporting (fixed from 7.1)
+
+# CVE-2026-63979 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-63980] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-63981] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-63982] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-63983 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-63984] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63985] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63986] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-63987] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-63988] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-63989] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-63990] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63991] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63992] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63993] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63994] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-63995] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-63996] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-63997] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-63998] = "fixed-version: only affects 6.11 onwards"
+
+# CVE-2026-63999 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-64000] = "cpe-stable-backport: Backported in 6.6.143"
+
+# CVE-2026-64001 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-64002] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-64003] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-64004] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-64005] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-64006] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-64007] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-64008] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-64009] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-64010] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-64011] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-64012] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-64013] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-64014] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-64015] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64016] = "fixed-version: only affects 6.18.33 onwards"
+
+# CVE-2026-64017 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-64018] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64019] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-64020] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-64021] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-64022] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-64023] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-64024] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-64025] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64026] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-64027] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-64028] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64029] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64030] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-64031] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-64032] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64033] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64034] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64035] = "fixed-version: only affects 6.16 onwards"
+
+# CVE-2026-64036 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-64037] = "fixed-version: only affects 6.15 onwards"
+
+# CVE-2026-64038 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-64039] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64040] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-64041] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-64042] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-64043] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-64044] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-64045] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-64046] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64047] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64048] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64049] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-64050] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-64051] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64052] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-64053] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-64054] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-64055] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64056] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64057] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-64058] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-64059] = "fixed-version: only affects 6.12 onwards"
+
+# CVE-2026-64060 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-64061] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-64062] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-64063] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-64064] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-64065] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-64066] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-64067] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-64068] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-64069] = "fixed-version: only affects 6.14 onwards"
+
+# CVE-2026-64070 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-64071] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-64072] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-64073] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64074] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-64075] = "fixed-version: only affects 6.14 onwards"
+
+# CVE-2026-64076 needs backporting (fixed from 7.1)
+
+# CVE-2026-64077 needs backporting (fixed from 7.1)
+
+# CVE-2026-64078 needs backporting (fixed from 7.1)
+
+# CVE-2026-64079 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-64080] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-64081] = "fixed-version: only affects 6.15 onwards"
+
+# CVE-2026-64082 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-64083] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64084] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64085] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64086] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64087] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64088] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64089] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64090] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-64091] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-64092] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64093] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-64094] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-64095] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-64096] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64097] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64098] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64099] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-64100] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-64101] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-64102] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64103] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64104] = "fixed-version: only affects 6.13.8 onwards"
+
+CVE_STATUS[CVE-2026-64105] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-64106] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64107] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-64108] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64109] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-64110] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-64111] = "fixed-version: only affects 6.8 onwards"
+
+# CVE-2026-64112 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-64113] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64114] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64115] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64116] = "cpe-stable-backport: Backported in 6.6.143"
+
+# CVE-2026-64117 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-64118] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64119] = "fixed-version: only affects 6.11.3 onwards"
+
+CVE_STATUS[CVE-2026-64120] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-64121] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64122] = "fixed-version: only affects 6.18.14 onwards"
+
+CVE_STATUS[CVE-2026-64123] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-64124] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-64125] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64126] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64127] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-64128] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64129] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-64130] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-64131] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-64132] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-64133] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64134] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64135] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64136] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64137] = "cpe-stable-backport: Backported in 6.6.143"
+
+# CVE-2026-64138 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-64139] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64140] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-64141] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64142] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-64143] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-64144] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64145] = "fixed-version: only affects 6.13 onwards"
+
+# CVE-2026-64146 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-64147] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64148] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64149] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-64150] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-64151] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-64152] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-64153] = "cpe-stable-backport: Backported in 6.6.142"
+
+# CVE-2026-64154 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-64155] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64156] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-64157] = "fixed-version: only affects 6.10.8 onwards"
+
+CVE_STATUS[CVE-2026-64158] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-64159] = "fixed-version: only affects 6.10.8 onwards"
+
+# CVE-2026-64160 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-64161] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-64162] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-64163] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64164] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64165] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64166] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64167] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-64168] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64169] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-64170] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64171] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-64172] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-64173] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64174] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64175] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-64176] = "fixed-version: only affects 6.17.9 onwards"
+
+CVE_STATUS[CVE-2026-64177] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64178] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64179] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64180] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-64181] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-64182] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64183] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64184] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64185] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64186] = "fixed-version: only affects 6.17 onwards"
+
+# CVE-2026-64187 needs backporting (fixed from 7.2rc4)
+
+CVE_STATUS[CVE-2026-64188] = "cpe-stable-backport: Backported in 6.6.144"
+
+# CVE-2026-64189 needs backporting (fixed from 7.2rc2)
+
+# CVE-2026-64190 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-64191] = "cpe-stable-backport: Backported in 6.6.144"
+
+# CVE-2026-64192 needs backporting (fixed from 7.2rc2)
+
+# CVE-2026-64205 needs backporting (fixed from 7.2rc1)
+
+# CVE-2026-64206 needs backporting (fixed from 7.2rc3)
+
+CVE_STATUS[CVE-2026-64207] = "fixed-version: only affects 6.17 onwards"
 
-# CVE-2026-53362 may need backporting (fixed from 6.6.144)
+# CVE-2026-64600 needs backporting (fixed from 7.2rc4)
 

