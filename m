Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC73D1CDD7
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 04:30:52 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35251.1764822651037599486
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 20:30:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dygmqcql;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-882360ca0e2so3496496d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 20:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764822650; x=1765427450; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ueL8+lzlcGkEKr2OP5D6iy5Jc3DNfSN7yn1nMwc4OCg=;
        b=DygmqcqlQjj+b53xVHzwPkD96OGTdtHjpqT+MqJZvVrnBUGEU4IYBmkN0cJ2BojWtA
         pjlgMZyZOxLrRjaEc4OJ/7Z6D1FG1YZvnEySDiDWqonMXJ8iJ/q/TA+yxsOpHakq6k+B
         XJs5ohuZhalW7xvrI3ZuOHUZuxLDzOIJOd8qr69zH0mK1Mrqf8oNUwH4zKEzs/pC8jGu
         in0G/cleECRFUlND8j3R8uAEVqO/T1bPwZSOt4Czwl41Lvef/X2QodbiBUfzHTAACP4K
         hn6C+MwiEBiYhW1JR/Cg6D263+QEdKZlbXiV3nuVqs9o6pQftVk3DgOyvZ0cvyAsAFCk
         GcgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764822650; x=1765427450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ueL8+lzlcGkEKr2OP5D6iy5Jc3DNfSN7yn1nMwc4OCg=;
        b=Z5YObB/h46T5AnwBzPCnJ1NBBN9N8Qusie4GkH5Uj8PYzYxOVB5+IXk0Qcnncxq2hm
         f5XsrJxDqvz74yWEswdOqlfFknmOlVVXc+J/QGyxzs+cXNXmJ6AUBJIFhKmPsgsHZikV
         AHIUkicL7niKHrZcPS+Nl+ca8JfEwPslaCgqsJbv9ciW3oGzc+63+GzrzUeQR6hn9i3s
         VYnjw/9xqhi/LJWKsPhxS8e4lppskf640zmMF9ewreUasp+qlH1lNsXx01K+zBz4BXIQ
         zT5R8a1i4/eStykYiW0wrabiTAs12JQMReoqiSr1orGLcQkIB9NhFrZwlXp5g8VKsaOv
         cLJQ==
X-Gm-Message-State: AOJu0YwVqrlVdcONCVrCDy7Ldds1dJrSRGgVGAhvqSp2ucVXF9fA1tFk
	a39oNPwBmZCWWXxe0A+cUHV6oHBjNrXDU8Hp6/Rfz6mKpeYbjtlB+xZW82mCJrnw3NQ=
X-Gm-Gg: ASbGncte5HDGAKmYzVjhoyf2ID4TgPysWRk2OVP2trLwNM01lg/wC0zxQlSH6Q+8mtm
	CUJxtzLfVcj6XDm5vyw/rf7hIw1hYsIwxuYAie+Q8yQg5eyeDClTSGJVmeiHS9kUCeag8N0SPOK
	oHBUYalN6rNDF7pRF9iC8DjBKdXPgs61A0QW6IhU/C7T5q7GtQzKXvS/VN3YX4ELP0o3UJsrvET
	bHa4Xxs+8J//+22mi+8/gRY/0vIqlgVlGimSF26bfNXWb8ud5FtZ93S0081ZHEAlScIJMcyXuxX
	Xmf8a4pZtp/FiwMOILuEnMS+xcqJngZHOHVKPGUAP3DgLAO9bQZ/VmVF7zBjljNv+R0uSyEW8r/
	Ts4by07cpGoJiOpSAZJN56gayfT6sp6OFXWdHrggEXO5fuptTakPyB8oFCNDhNL7WZmgZbz6EkR
	t8Ghfg0fOU/ehd8i6pzwYrL8hUruIL4R3T9b4wptWWeOYZuKbW9NfKq7ipiJTDNA76u2dpROlIy
	Z+xUAs3/xFD3z0=
X-Google-Smtp-Source: AGHT+IGgRJ9Uv4asQ8AQIstL2SdtZHaC502fUscY26D194pV7rfHjcDVEUX4/c+AXEGYqyvoKkhOnw==
X-Received: by 2002:a05:6214:212a:b0:880:626a:b129 with SMTP id 6a1803df08f44-888194e5370mr82248076d6.24.1764822649731;
        Wed, 03 Dec 2025 20:30:49 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88827f3347asm3191476d6.6.2025.12.03.20.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:30:48 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 14/16] linux-yocto/6.12: update CVE exclusions (6.12.59)
Date: Wed,  3 Dec 2025 23:30:26 -0500
Message-Id: <8e2adda03088bea5f87a4781be0c75946d4a357d.1764822465.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1764822465.git.bruce.ashfield@gmail.com>
References: <cover.1764822465.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 04:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227265

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 9 changes (1 new | 8 updated): - 1 new CVEs: CVE-2025-7007 - 8 updated CVEs: CVE-2025-34147, CVE-2025-34148, CVE-2025-34149, CVE-2025-34150, CVE-2025-34151, CVE-2025-34152, CVE-2025-35028, CVE-2025-7195
        Date: Mon, 1 Dec 2025 16:36:50 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.12.inc              | 76 ++++++++++---------
 1 file changed, 42 insertions(+), 34 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index b66f36a2023..583ce7aa405 100644
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
2.39.2


