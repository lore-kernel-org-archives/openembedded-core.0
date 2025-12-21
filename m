Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA1FCE67497
	for <webhook@archiver.kernel.org>; Sun, 21 Dec 2025 21:37:36 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68782.1766353053717404596
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Dec 2025 13:37:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ltdmnrXN;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7aa9be9f03aso2777635b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 13:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766353053; x=1766957853; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TOTqQGL5Q06S0zp/8hIDg69y+f9h7MF+VsU1B0IVY+k=;
        b=ltdmnrXND6vPogiOzev//R/JH8337mLflq8Pbhy5qfASYnBJUZYMqTISvSiHgxrhKK
         t/KVH6Jb3qL+D6OdjDIbMVgqsTUCJhsBLb6Z4VhqCs+rke3f8IIyhFjrKF1dhzW4ENz0
         ps3s0e9sFJvMAnVoCQCJrFXz7KCQOSSs1aZldIxYuWWbPe4rj302SltsfpPsyHSAAXC8
         79+xXnS/c0UHSZyOfgQGyzXfhVUrOoWO2zX3RILZiz4mQpZ9Vp9JQHHYmBnZ7I6ehCfq
         z7V68dxSrvRop/v+xMj7wA8NqP6OrtCHauKRkRBBC/z4zE8gzmgdct1ZgFOZEBHYv/TQ
         xT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766353053; x=1766957853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TOTqQGL5Q06S0zp/8hIDg69y+f9h7MF+VsU1B0IVY+k=;
        b=X0UBF+iM6Ub8ne+gkk1V6QsWce6vXJvig5Tx24f/Xj1rtIwOTXsj8lvjnnicyJaLaM
         CbyqImQ2kAS8QuMNPz6jmzTdSDWgD0j407ljBR7G9VWs5b7UjtI+IYD78EPZwz8quZRH
         tUxRoigQ2y5rQHMo6TtCTaNLOi2o7fuwJo5PtESC6lpmxLsXTpm0wl6hEdUuaIE9bOnC
         RtcFA2NzhdW09Lng9q9jTzbw4yaKEIn6mf208hs9S5CgNsE8QK78bc2kmR2rdGZIFV6j
         9OM9qNe/oH5Gh4EH6o0FRW/pNqLnEKHPgT4+tPwIvh/p2paBcNN85eTjA02vccHSbKGe
         pcFA==
X-Gm-Message-State: AOJu0Yy0qKssRaolToL1PL+g8mAnjuFCPCWAM5m/TbIpgiyItoj0SqUG
	4kgyPZIX4Gi0jUcDVHSl5W8pRwH0Jpz+7+JWcLV9Sg0zdB/vInOX8dPAAzf9IbYqkHSqBjeUiMh
	SHaOJ7D0=
X-Gm-Gg: AY/fxX7e3ShAI+aPww+kwhF7mOHf61/r0s1NAHnCZwiIVvw2OCMzssErNQxLGN8DxPW
	DdVFLILTqphdDsQkuIBAG9v4PPpVmNMrfH8f4FTmGQZQBdOE1XomdWOClbabMY+5QKlsdd4iPoe
	YiS9WR90f0RGpbqCxqm0OkPG57K44/UGp5LHlk4x9bksiB0KwUtKnWzyARjLJ/+xepm8w3291YA
	cVaDqKnZ2TM6YkwslzbJwZDRl/TP+aDE7CcQmvAxJRqn7lzqzWZMtoDiUgCdFA0vPtLc4ccXBJG
	LrM4vZD/7i93/ANYJGN3vB/QfphC6B5+IuTY7MMBnF7mW+7bABFba54YVXvWCo9KXcKaKP0ko/g
	2+8oraCpP1zTrSHdtxFvwIwtdbuTVWgmA8k9StEV+cZkRen609Da6QA5QleIFEzkr8NfyfqsuP8
	pZ
X-Google-Smtp-Source: AGHT+IFSnbiAfuLtKeomnQg3oxUw9Vhcn4WZvG0rHKz5He3qvlq+UhLavY+fWs9B85HmHY6iNbUnbw==
X-Received: by 2002:a05:6a00:3286:b0:7aa:3fed:40ff with SMTP id d2e1a72fcca58-7ff64116e68mr7983789b3a.13.1766353052794;
        Sun, 21 Dec 2025 13:37:32 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:dd61:72c7:d0b8:fed])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfabcbcsm8211166b3a.31.2025.12.21.13.37.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 13:37:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 07/18] linux-yocto/6.12: update CVE exclusions (6.12.59)
Date: Sun, 21 Dec 2025 13:37:00 -0800
Message-ID: <a4439849582ab2d1e49bb689ff4e6254ee67811a.1766352840.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766352840.git.steve@sakoman.com>
References: <cover.1766352840.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 21:37:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228265

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 9 changes (1 new | 8 updated): - 1 new CVEs: CVE-2025-7007 - 8 updated CVEs: CVE-2025-34147, CVE-2025-34148, CVE-2025-34149, CVE-2025-34150, CVE-2025-34151, CVE-2025-34152, CVE-2025-35028, CVE-2025-7195
        Date: Mon, 1 Dec 2025 16:36:50 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8b9015df191ba8cba766341b8773d611a43b3ff8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/cve-exclusion_6.12.inc              | 76 ++++++++++---------
 1 file changed, 42 insertions(+), 34 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index b66f36a202..583ce7aa40 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-11-14 16:49:37.841595+00:00 for kernel version 6.12.58
-# From linux_kernel_cves cve_2025-11-14_1600Z-2-g7d42ca6d8de
+# Generated at 2025-12-01 16:43:28.801277+00:00 for kernel version 6.12.59
+# From linux_kernel_cves cve_2025-12-01_1600Z-2-g8d7b13eec97
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.58"
+    this_version = "6.12.59"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -14750,7 +14750,7 @@ CVE_STATUS[CVE-2025-22105] = "cpe-stable-backport: Backported in 6.12.57"
 
 CVE_STATUS[CVE-2025-22106] = "cpe-stable-backport: Backported in 6.12.49"
 
-# CVE-2025-22107 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-22107] = "cpe-stable-backport: Backported in 6.12.59"
 
 # CVE-2025-22108 needs backporting (fixed from 6.15)
 
@@ -14778,7 +14778,7 @@ CVE_STATUS[CVE-2025-22119] = "cpe-stable-backport: Backported in 6.12.35"
 
 CVE_STATUS[CVE-2025-22120] = "cpe-stable-backport: Backported in 6.12.26"
 
-# CVE-2025-22121 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-22121] = "cpe-stable-backport: Backported in 6.12.59"
 
 CVE_STATUS[CVE-2025-22122] = "cpe-stable-backport: Backported in 6.12.33"
 
@@ -14794,7 +14794,7 @@ CVE_STATUS[CVE-2025-22126] = "cpe-stable-backport: Backported in 6.12.25"
 
 CVE_STATUS[CVE-2025-22128] = "cpe-stable-backport: Backported in 6.12.35"
 
-# CVE-2025-23129 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-23129] = "cpe-stable-backport: Backported in 6.12.59"
 
 CVE_STATUS[CVE-2025-23130] = "cpe-stable-backport: Backported in 6.12.57"
 
@@ -16710,7 +16710,7 @@ CVE_STATUS[CVE-2025-38676] = "cpe-stable-backport: Backported in 6.12.44"
 
 CVE_STATUS[CVE-2025-38677] = "cpe-stable-backport: Backported in 6.12.44"
 
-# CVE-2025-38678 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-38678] = "cpe-stable-backport: Backported in 6.12.59"
 
 CVE_STATUS[CVE-2025-38679] = "cpe-stable-backport: Backported in 6.12.43"
 
@@ -17438,7 +17438,7 @@ CVE_STATUS[CVE-2025-39979] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2025-39980] = "cpe-stable-backport: Backported in 6.12.50"
 
-# CVE-2025-39981 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-39981] = "cpe-stable-backport: Backported in 6.12.59"
 
 CVE_STATUS[CVE-2025-39982] = "cpe-stable-backport: Backported in 6.12.50"
 
@@ -17526,7 +17526,7 @@ CVE_STATUS[CVE-2025-40023] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2025-40024] = "cpe-stable-backport: Backported in 6.12.50"
 
-# CVE-2025-40025 needs backporting (fixed from 6.18rc1)
+# CVE-2025-40025 needs backporting (fixed from 6.18)
 
 CVE_STATUS[CVE-2025-40026] = "cpe-stable-backport: Backported in 6.12.52"
 
@@ -17584,7 +17584,7 @@ CVE_STATUS[CVE-2025-40052] = "cpe-stable-backport: Backported in 6.12.53"
 
 CVE_STATUS[CVE-2025-40053] = "cpe-stable-backport: Backported in 6.12.53"
 
-# CVE-2025-40054 needs backporting (fixed from 6.18rc1)
+# CVE-2025-40054 needs backporting (fixed from 6.18)
 
 CVE_STATUS[CVE-2025-40055] = "cpe-stable-backport: Backported in 6.12.53"
 
@@ -17604,9 +17604,9 @@ CVE_STATUS[CVE-2025-40062] = "cpe-stable-backport: Backported in 6.12.53"
 
 CVE_STATUS[CVE-2025-40063] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2025-40064 needs backporting (fixed from 6.18rc1)
+# CVE-2025-40064 needs backporting (fixed from 6.18)
 
-# CVE-2025-40065 needs backporting (fixed from 6.18rc1)
+# CVE-2025-40065 needs backporting (fixed from 6.18)
 
 CVE_STATUS[CVE-2025-40066] = "fixed-version: only affects 6.15 onwards"
 
@@ -17624,13 +17624,13 @@ CVE_STATUS[CVE-2025-40072] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2025-40073] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2025-40074 needs backporting (fixed from 6.18rc1)
+# CVE-2025-40074 needs backporting (fixed from 6.18)
 
-# CVE-2025-40075 needs backporting (fixed from 6.18rc1)
+# CVE-2025-40075 needs backporting (fixed from 6.18)
 
 CVE_STATUS[CVE-2025-40076] = "fixed-version: only affects 6.17 onwards"
 
-# CVE-2025-40077 needs backporting (fixed from 6.18rc1)
+CVE_STATUS[CVE-2025-40077] = "cpe-stable-backport: Backported in 6.12.59"
 
 CVE_STATUS[CVE-2025-40078] = "cpe-stable-backport: Backported in 6.12.53"
 
@@ -17648,7 +17648,7 @@ CVE_STATUS[CVE-2025-40084] = "cpe-stable-backport: Backported in 6.12.56"
 
 CVE_STATUS[CVE-2025-40085] = "cpe-stable-backport: Backported in 6.12.55"
 
-# CVE-2025-40086 needs backporting (fixed from 6.18rc2)
+# CVE-2025-40086 needs backporting (fixed from 6.18)
 
 CVE_STATUS[CVE-2025-40087] = "cpe-stable-backport: Backported in 6.12.55"
 
@@ -17670,9 +17670,9 @@ CVE_STATUS[CVE-2025-40095] = "cpe-stable-backport: Backported in 6.12.55"
 
 CVE_STATUS[CVE-2025-40096] = "cpe-stable-backport: Backported in 6.12.55"
 
-# CVE-2025-40097 needs backporting (fixed from 6.18rc2)
+CVE_STATUS[CVE-2025-40097] = "cpe-stable-backport: Backported in 6.12.59"
 
-# CVE-2025-40098 needs backporting (fixed from 6.18rc2)
+# CVE-2025-40098 needs backporting (fixed from 6.18)
 
 CVE_STATUS[CVE-2025-40099] = "cpe-stable-backport: Backported in 6.12.55"
 
@@ -17680,7 +17680,7 @@ CVE_STATUS[CVE-2025-40100] = "cpe-stable-backport: Backported in 6.12.55"
 
 CVE_STATUS[CVE-2025-40101] = "cpe-stable-backport: Backported in 6.12.55"
 
-# CVE-2025-40102 needs backporting (fixed from 6.18rc2)
+# CVE-2025-40102 needs backporting (fixed from 6.18)
 
 CVE_STATUS[CVE-2025-40103] = "cpe-stable-backport: Backported in 6.12.55"
 
@@ -17702,7 +17702,7 @@ CVE_STATUS[CVE-2025-40111] = "cpe-stable-backport: Backported in 6.12.54"
 
 CVE_STATUS[CVE-2025-40112] = "cpe-stable-backport: Backported in 6.12.53"
 
-# CVE-2025-40113 needs backporting (fixed from 6.18rc1)
+# CVE-2025-40113 needs backporting (fixed from 6.18)
 
 CVE_STATUS[CVE-2025-40114] = "cpe-stable-backport: Backported in 6.12.23"
 
@@ -17734,7 +17734,7 @@ CVE_STATUS[CVE-2025-40127] = "cpe-stable-backport: Backported in 6.12.53"
 
 CVE_STATUS[CVE-2025-40129] = "cpe-stable-backport: Backported in 6.12.53"
 
-# CVE-2025-40130 needs backporting (fixed from 6.18rc1)
+# CVE-2025-40130 needs backporting (fixed from 6.18)
 
 CVE_STATUS[CVE-2025-40131] = "fixed-version: only affects 6.16 onwards"
 
@@ -17744,15 +17744,15 @@ CVE_STATUS[CVE-2025-40133] = "cpe-stable-backport: Backported in 6.12.55"
 
 CVE_STATUS[CVE-2025-40134] = "cpe-stable-backport: Backported in 6.12.53"
 
-# CVE-2025-40135 needs backporting (fixed from 6.18rc1)
+# CVE-2025-40135 needs backporting (fixed from 6.18)
 
-# CVE-2025-40136 needs backporting (fixed from 6.18rc1)
+# CVE-2025-40136 needs backporting (fixed from 6.18)
 
 CVE_STATUS[CVE-2025-40137] = "cpe-stable-backport: Backported in 6.12.53"
 
 CVE_STATUS[CVE-2025-40138] = "fixed-version: only affects 6.17 onwards"
 
-# CVE-2025-40139 needs backporting (fixed from 6.18rc1)
+# CVE-2025-40139 needs backporting (fixed from 6.18)
 
 CVE_STATUS[CVE-2025-40140] = "cpe-stable-backport: Backported in 6.12.53"
 
@@ -17762,19 +17762,17 @@ CVE_STATUS[CVE-2025-40142] = "cpe-stable-backport: Backported in 6.12.53"
 
 CVE_STATUS[CVE-2025-40143] = "fixed-version: only affects 6.17 onwards"
 
-CVE_STATUS[CVE-2025-40144] = "cpe-stable-backport: Backported in 6.12.53"
-
 CVE_STATUS[CVE-2025-40145] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2025-40146 needs backporting (fixed from 6.18rc1)
+# CVE-2025-40146 needs backporting (fixed from 6.18)
 
-# CVE-2025-40147 needs backporting (fixed from 6.18rc1)
+# CVE-2025-40147 needs backporting (fixed from 6.18)
 
 CVE_STATUS[CVE-2025-40148] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2025-40149 needs backporting (fixed from 6.18rc1)
+# CVE-2025-40149 needs backporting (fixed from 6.18)
 
-# CVE-2025-40150 needs backporting (fixed from 6.18rc1)
+# CVE-2025-40150 needs backporting (fixed from 6.18)
 
 CVE_STATUS[CVE-2025-40151] = "fixed-version: only affects 6.17 onwards"
 
@@ -17790,7 +17788,7 @@ CVE_STATUS[CVE-2025-40156] = "cpe-stable-backport: Backported in 6.12.53"
 
 CVE_STATUS[CVE-2025-40157] = "cpe-stable-backport: Backported in 6.12.53"
 
-# CVE-2025-40158 needs backporting (fixed from 6.18rc1)
+# CVE-2025-40158 needs backporting (fixed from 6.18)
 
 CVE_STATUS[CVE-2025-40159] = "cpe-stable-backport: Backported in 6.12.54"
 
@@ -17802,7 +17800,7 @@ CVE_STATUS[CVE-2025-40162] = "cpe-stable-backport: Backported in 6.12.55"
 
 CVE_STATUS[CVE-2025-40163] = "fixed-version: only affects 6.17 onwards"
 
-# CVE-2025-40164 needs backporting (fixed from 6.18rc2)
+# CVE-2025-40164 needs backporting (fixed from 6.18)
 
 CVE_STATUS[CVE-2025-40165] = "cpe-stable-backport: Backported in 6.12.55"
 
@@ -17810,11 +17808,11 @@ CVE_STATUS[CVE-2025-40166] = "cpe-stable-backport: Backported in 6.12.55"
 
 CVE_STATUS[CVE-2025-40167] = "cpe-stable-backport: Backported in 6.12.55"
 
-# CVE-2025-40168 needs backporting (fixed from 6.18rc1)
+# CVE-2025-40168 needs backporting (fixed from 6.18)
 
 CVE_STATUS[CVE-2025-40169] = "cpe-stable-backport: Backported in 6.12.53"
 
-# CVE-2025-40170 needs backporting (fixed from 6.18rc1)
+# CVE-2025-40170 needs backporting (fixed from 6.18)
 
 CVE_STATUS[CVE-2025-40171] = "cpe-stable-backport: Backported in 6.12.53"
 
@@ -17892,6 +17890,16 @@ CVE_STATUS[CVE-2025-40207] = "cpe-stable-backport: Backported in 6.12.54"
 
 CVE_STATUS[CVE-2025-40208] = "fixed-version: only affects 6.15 onwards"
 
+CVE_STATUS[CVE-2025-40209] = "cpe-stable-backport: Backported in 6.12.58"
+
+# CVE-2025-40210 needs backporting (fixed from 6.18)
+
+CVE_STATUS[CVE-2025-40211] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40212] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-40213] = "fixed-version: only affects 6.17 onwards"
+
 CVE_STATUS[CVE-2025-40300] = "cpe-stable-backport: Backported in 6.12.47"
 
 # CVE-2025-40325 needs backporting (fixed from 6.15)
-- 
2.43.0


