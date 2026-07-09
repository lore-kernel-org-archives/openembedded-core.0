Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 194AFC4450F
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 10:07:18 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5891.1783591633102415954
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 03:07:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=X+aAhAfp;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493e4cccd8dso7422165e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 03:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783591631; x=1784196431; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=llAtX/ycn8ZsonvaboXhe9CiSBWbcwqxhvQLFzFsSmE=;
        b=X+aAhAfp2zbPnQ4xF8NPkPMfEyT7BHhOUxTAbfHpGZNRAPC1yZz6wkHSBDiiwsg4p6
         x/bBEIcmRd2FQT7w0vzxUQ+LRKWCEvGBMvV4hq+fij16Tag3OESv9BiHAaXEOFC4ljh8
         N3anywzIZVIHMKzhVzKdDvFWtjqtFGkzuBZIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591631; x=1784196431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=llAtX/ycn8ZsonvaboXhe9CiSBWbcwqxhvQLFzFsSmE=;
        b=WTQBwqZd3QwCejz00I+Ez0wMCBavQYLSsv/ACIRMOhJglobKFOCZZPpQngoOkdSaGl
         CgATpTo+E+fvOYv+HTnbNJeTDcYRtGQix9Fvx7PcLgQOcSdZrfkXwDQOcQNou0fXE3bS
         DmyLJsh+8GaMvCAsClqhrfYA8eAx56mbw2KiV+9c4PmD1Eot0Fuzkq5F1HcpPFJz5qc4
         7IxT8SecY2SD1dsXRvNTSAg5A8twzIyTEUSuNBMtGMpax690fJlznSP/lXqcnCxOrhM6
         IP1T/o5k0BMtBuHBtMLDgQ7mjH+C0KNrcNz7uoaL5ZN+eLGV1NN9hOtg/GOdtlapyl/7
         EWtQ==
X-Gm-Message-State: AOJu0Yz4hjBfp7iUfvpCjdPu8kivXKtdnUZ1PkjZrEjIU3pukuUqbGif
	gUjDG727A7jFvUEhMBPPACm5kSqoCppzDK+eduseSZ97ZeMJpaOSK9KLciYf3Z90Y4lr/xOET6P
	e8GyDHsU=
X-Gm-Gg: AfdE7cnA81wszGg91sUJrp43G3j77gxhb4Vxj4T+jYaU6btPwuS9SkuBahX58/VWTpY
	PsdNk69XkScmdkvPQU0tRWFLJ8TxTRoCbwDV2W0tGxvvmX1mnZjMW0qeJEsKC+jBfGKhqZpCpuj
	9nnZYGyN1Omol+H62ZB7ypJ8JRuqoWIFiIqpgAbih937oguhijAgUHxz6oD0ULD6xc82II4jtg8
	huXjzqbl2RGxmCgA9jQRoQN9gDwf5uip86H/mP7k1hE/HeVDbJrMPbOJGB3U/on/nUf9KJnE7Xo
	JM1Pe5M99Z07X1NwvyHZzifyh12yEWQyPrw7KIcd15TkEz3GMr1RnTS+1n+KBfvPvZ+/v80Zm4h
	a/ZdmbRJHYHuM/msWDxzr1/URIKbhBZFFfaD9djtgnKUQRA8gmb245macpWQM6wRSTZdRnukUCG
	/FPzP6mBX0//r+K8ua3u0omkEoe+E5O0UyxhUv3b8gwsfPUcBJOoxBpK6RrdDBrWq+JNHZphGD1
	4pOOwg02na64oXubA==
X-Received: by 2002:a05:600c:3e87:b0:492:7019:caca with SMTP id 5b1f17b1804b1-493e68cbea4mr63272465e9.26.1783591629734;
        Thu, 09 Jul 2026 03:07:09 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fd88810a86c49142.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fd88:810a:86c4:9142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a5d174sm149687135e9.2.2026.07.09.03.07.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:07:08 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/25] linux-yocto/6.6: update CVE exclusions (6.6.142)
Date: Thu,  9 Jul 2026 12:06:32 +0200
Message-ID: <d69bfe3b3a38a7e777b42ebc0862e76a0b7551e8.1783590688.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783590688.git.yoann.congal@smile.fr>
References: <cover.1783590688.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 10:07:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240565

From: Esa Jaaskela <esa.jaaskela@suomi24.fi>

Regenerated to fix this warning:
WARNING: linux-yocto-6.6.142+git-r0 do_cve_check: Kernel CVE status needs updating: generated for 6.6.127 but kernel is 6.6.142

$ ./meta/recipes-kernel/linux/generate-cve-exclusions.py .../cvelistV5/ 6.6.142 > meta/recipes-kernel/linux/cve-exclusion_6.6.inc

Generated at 2026-07-07 17:39:10.952928+00:00 for kernel version 6.6.142
From cvelistV5 cve_2026-07-07_1600Z

Signed-off-by: Esa Jaaskela <esa.jaaskela@suomi24.fi>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/cve-exclusion_6.6.inc               | 3418 +++++++++++++----
 1 file changed, 2668 insertions(+), 750 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
index fcd38c56aed..2a194e7c84d 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
@@ -1,17 +1,19 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2026-05-27 12:02:49.732909+00:00 for kernel version 6.6.127
-# From cvelistV5 cve_2026-05-27_0900Z
+# Generated at 2026-07-07 17:39:10.952928+00:00 for kernel version 6.6.142
+# From cvelistV5 cve_2026-07-07_1600Z
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.6.127"
+    this_version = "6.6.142"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
 }
 do_cve_check[prefuncs] += "check_kernel_cve_status_version"
 
+# CVE-2018-10902 has no known resolution
+
 CVE_STATUS[CVE-2019-25160] = "fixed-version: Fixed from version 5.0"
 
 CVE_STATUS[CVE-2019-25162] = "fixed-version: Fixed from version 6.0"
@@ -6634,7 +6636,7 @@ CVE_STATUS[CVE-2023-52918] = "cpe-stable-backport: Backported in 6.6.48"
 
 CVE_STATUS[CVE-2023-52919] = "fixed-version: Fixed from version 6.6"
 
-# CVE-2023-52920 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2023-52920] = "cpe-stable-backport: Backported in 6.6.140"
 
 CVE_STATUS[CVE-2023-52921] = "fixed-version: Fixed from version 6.5"
 
@@ -9030,7 +9032,7 @@ CVE_STATUS[CVE-2023-54326] = "fixed-version: Fixed from version 6.5"
 
 CVE_STATUS[CVE-2023-7324] = "fixed-version: Fixed from version 6.3"
 
-# CVE-2024-14027 may need backporting (fixed from 6.6.133)
+CVE_STATUS[CVE-2024-14027] = "cpe-stable-backport: Backported in 6.6.133"
 
 CVE_STATUS[CVE-2024-26581] = "cpe-stable-backport: Backported in 6.6.17"
 
@@ -9874,7 +9876,7 @@ CVE_STATUS[CVE-2024-27020] = "cpe-stable-backport: Backported in 6.6.29"
 
 CVE_STATUS[CVE-2024-27021] = "fixed-version: only affects 6.8 onwards"
 
-# CVE-2024-27022 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2024-27022] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2024-27023] = "cpe-stable-backport: Backported in 6.6.19"
 
@@ -11942,7 +11944,7 @@ CVE_STATUS[CVE-2024-43823] = "cpe-stable-backport: Backported in 6.6.44"
 
 CVE_STATUS[CVE-2024-43825] = "cpe-stable-backport: Backported in 6.6.44"
 
-# CVE-2024-43826 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2024-43826] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2024-43827] = "fixed-version: only affects 6.8 onwards"
 
@@ -12346,7 +12348,7 @@ CVE_STATUS[CVE-2024-46689] = "cpe-stable-backport: Backported in 6.6.49"
 
 CVE_STATUS[CVE-2024-46690] = "fixed-version: only affects 6.9 onwards"
 
-# CVE-2024-46691 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2024-46691] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2024-46692] = "cpe-stable-backport: Backported in 6.6.49"
 
@@ -14482,7 +14484,7 @@ CVE_STATUS[CVE-2024-56645] = "cpe-stable-backport: Backported in 6.6.66"
 
 CVE_STATUS[CVE-2024-56646] = "fixed-version: only affects 6.9 onwards"
 
-# CVE-2024-56647 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2024-56647] = "cpe-stable-backport: Backported in 6.6.140"
 
 CVE_STATUS[CVE-2024-56648] = "cpe-stable-backport: Backported in 6.6.66"
 
@@ -15258,7 +15260,7 @@ CVE_STATUS[CVE-2025-21680] = "cpe-stable-backport: Backported in 6.6.74"
 
 CVE_STATUS[CVE-2025-21681] = "cpe-stable-backport: Backported in 6.6.74"
 
-# CVE-2025-21682 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-21682] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2025-21683] = "cpe-stable-backport: Backported in 6.6.74"
 
@@ -15368,7 +15370,7 @@ CVE_STATUS[CVE-2025-21737] = "fixed-version: only affects 6.10 onwards"
 
 CVE_STATUS[CVE-2025-21738] = "cpe-stable-backport: Backported in 6.6.78"
 
-# CVE-2025-21739 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2025-21739] = "cpe-stable-backport: Backported in 6.6.135"
 
 CVE_STATUS[CVE-2025-21741] = "cpe-stable-backport: Backported in 6.6.78"
 
@@ -15392,7 +15394,7 @@ CVE_STATUS[CVE-2025-21750] = "cpe-stable-backport: Backported in 6.6.78"
 
 CVE_STATUS[CVE-2025-21751] = "fixed-version: only affects 6.12 onwards"
 
-CVE_STATUS[CVE-2025-21752] = "fixed-version: only affects 6.6.130 onwards"
+# CVE-2025-21752 may need backporting (fixed from 6.7)
 
 CVE_STATUS[CVE-2025-21753] = "cpe-stable-backport: Backported in 6.6.78"
 
@@ -16128,7 +16130,7 @@ CVE_STATUS[CVE-2025-22123] = "fixed-version: only affects 6.9 onwards"
 
 # CVE-2025-22124 may need backporting (fixed from 6.7)
 
-# CVE-2025-22125 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2025-22125] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2025-22126] = "cpe-stable-backport: Backported in 6.6.88"
 
@@ -16140,7 +16142,7 @@ CVE_STATUS[CVE-2025-22128] = "fixed-version: only affects 6.8 onwards"
 
 # CVE-2025-23130 needs backporting (fixed from 6.15)
 
-# CVE-2025-23131 needs backporting (fixed from 6.15)
+# CVE-2025-23131 may need backporting (fixed from 6.6.144)
 
 # CVE-2025-23132 needs backporting (fixed from 6.15)
 
@@ -17030,7 +17032,7 @@ CVE_STATUS[CVE-2025-38162] = "cpe-stable-backport: Backported in 6.6.125"
 
 CVE_STATUS[CVE-2025-38163] = "cpe-stable-backport: Backported in 6.6.94"
 
-# CVE-2025-38164 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-38164] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2025-38165] = "cpe-stable-backport: Backported in 6.6.94"
 
@@ -17548,7 +17550,7 @@ CVE_STATUS[CVE-2025-38424] = "cpe-stable-backport: Backported in 6.6.95"
 
 CVE_STATUS[CVE-2025-38425] = "cpe-stable-backport: Backported in 6.6.95"
 
-# CVE-2025-38426 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-38426] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2025-38427] = "cpe-stable-backport: Backported in 6.6.95"
 
@@ -17758,7 +17760,7 @@ CVE_STATUS[CVE-2025-38529] = "cpe-stable-backport: Backported in 6.6.100"
 
 CVE_STATUS[CVE-2025-38530] = "cpe-stable-backport: Backported in 6.6.100"
 
-# CVE-2025-38531 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2025-38531] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2025-38532] = "cpe-stable-backport: Backported in 6.6.100"
 
@@ -17802,8 +17804,6 @@ CVE_STATUS[CVE-2025-38551] = "fixed-version: only affects 6.11.2 onwards"
 
 CVE_STATUS[CVE-2025-38552] = "cpe-stable-backport: Backported in 6.6.101"
 
-CVE_STATUS[CVE-2025-38553] = "cpe-stable-backport: Backported in 6.6.102"
-
 CVE_STATUS[CVE-2025-38554] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2025-38555] = "cpe-stable-backport: Backported in 6.6.102"
@@ -17864,7 +17864,7 @@ CVE_STATUS[CVE-2025-38581] = "cpe-stable-backport: Backported in 6.6.102"
 
 CVE_STATUS[CVE-2025-38583] = "cpe-stable-backport: Backported in 6.6.102"
 
-# CVE-2025-38584 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2025-38584] = "cpe-stable-backport: Backported in 6.6.140"
 
 # CVE-2025-38585 needs backporting (fixed from 6.17)
 
@@ -18100,7 +18100,7 @@ CVE_STATUS[CVE-2025-38702] = "cpe-stable-backport: Backported in 6.6.103"
 
 CVE_STATUS[CVE-2025-38703] = "fixed-version: only affects 6.8 onwards"
 
-# CVE-2025-38704 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-38704] = "cpe-stable-backport: Backported in 6.6.130"
 
 # CVE-2025-38705 needs backporting (fixed from 6.17)
 
@@ -18112,7 +18112,7 @@ CVE_STATUS[CVE-2025-38708] = "cpe-stable-backport: Backported in 6.6.103"
 
 CVE_STATUS[CVE-2025-38709] = "cpe-stable-backport: Backported in 6.6.109"
 
-# CVE-2025-38710 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2025-38710] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2025-38711] = "cpe-stable-backport: Backported in 6.6.103"
 
@@ -18318,7 +18318,7 @@ CVE_STATUS[CVE-2025-39745] = "fixed-version: only affects 6.14 onwards"
 
 # CVE-2025-39747 needs backporting (fixed from 6.17)
 
-# CVE-2025-39748 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-39748] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2025-39749] = "cpe-stable-backport: Backported in 6.6.103"
 
@@ -18348,7 +18348,7 @@ CVE_STATUS[CVE-2025-39761] = "cpe-stable-backport: Backported in 6.6.103"
 
 CVE_STATUS[CVE-2025-39763] = "cpe-stable-backport: Backported in 6.6.103"
 
-# CVE-2025-39764 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-39764] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2025-39765] = "fixed-version: only affects 6.12 onwards"
 
@@ -18674,7 +18674,7 @@ CVE_STATUS[CVE-2025-39928] = "fixed-version: only affects 6.13 onwards"
 
 CVE_STATUS[CVE-2025-39929] = "cpe-stable-backport: Backported in 6.6.108"
 
-CVE_STATUS[CVE-2025-39930] = "fixed-version: only affects 6.6.130 onwards"
+CVE_STATUS[CVE-2025-39930] = "cpe-stable-backport: Backported in 6.6.135"
 
 CVE_STATUS[CVE-2025-39931] = "cpe-stable-backport: Backported in 6.6.108"
 
@@ -18776,7 +18776,7 @@ CVE_STATUS[CVE-2025-39979] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2025-39980] = "cpe-stable-backport: Backported in 6.6.109"
 
-# CVE-2025-39981 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2025-39981] = "cpe-stable-backport: Backported in 6.6.140"
 
 CVE_STATUS[CVE-2025-39982] = "cpe-stable-backport: Backported in 6.6.109"
 
@@ -19082,7 +19082,7 @@ CVE_STATUS[CVE-2025-40133] = "fixed-version: only affects 6.12 onwards"
 
 CVE_STATUS[CVE-2025-40134] = "cpe-stable-backport: Backported in 6.6.112"
 
-# CVE-2025-40135 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-40135] = "cpe-stable-backport: Backported in 6.6.130"
 
 # CVE-2025-40136 needs backporting (fixed from 6.18)
 
@@ -19110,7 +19110,7 @@ CVE_STATUS[CVE-2025-40148] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2025-40149] = "cpe-stable-backport: Backported in 6.6.121"
 
-# CVE-2025-40150 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-40150] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2025-40151] = "fixed-version: only affects 6.17 onwards"
 
@@ -19236,7 +19236,7 @@ CVE_STATUS[CVE-2025-40211] = "cpe-stable-backport: Backported in 6.6.117"
 
 CVE_STATUS[CVE-2025-40212] = "fixed-version: only affects 6.12 onwards"
 
-CVE_STATUS[CVE-2025-40213] = "fixed-version: only affects 6.6.140 onwards"
+# CVE-2025-40213 may need backporting (fixed from 6.7)
 
 CVE_STATUS[CVE-2025-40214] = "cpe-stable-backport: Backported in 6.6.117"
 
@@ -19248,7 +19248,7 @@ CVE_STATUS[CVE-2025-40217] = "fixed-version: only affects 6.11 onwards"
 
 CVE_STATUS[CVE-2025-40218] = "cpe-stable-backport: Backported in 6.6.113"
 
-# CVE-2025-40219 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2025-40219] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2025-40220] = "cpe-stable-backport: Backported in 6.6.115"
 
@@ -19294,7 +19294,7 @@ CVE_STATUS[CVE-2025-40240] = "cpe-stable-backport: Backported in 6.6.115"
 
 CVE_STATUS[CVE-2025-40241] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2025-40242 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2025-40242] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2025-40243] = "cpe-stable-backport: Backported in 6.6.115"
 
@@ -19614,7 +19614,7 @@ CVE_STATUS[CVE-2025-68204] = "cpe-stable-backport: Backported in 6.6.118"
 
 CVE_STATUS[CVE-2025-68205] = "fixed-version: only affects 6.17 onwards"
 
-# CVE-2025-68206 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-68206] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2025-68207] = "fixed-version: only affects 6.12.37 onwards"
 
@@ -19678,7 +19678,7 @@ CVE_STATUS[CVE-2025-68237] = "cpe-stable-backport: Backported in 6.6.118"
 
 CVE_STATUS[CVE-2025-68238] = "cpe-stable-backport: Backported in 6.6.118"
 
-# CVE-2025-68239 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-68239] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2025-68240] = "fixed-version: only affects 6.12 onwards"
 
@@ -19764,7 +19764,7 @@ CVE_STATUS[CVE-2025-68294] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2025-68295] = "cpe-stable-backport: Backported in 6.6.119"
 
-# CVE-2025-68296 needs backporting (fixed from 6.18)
+# CVE-2025-68296 may need backporting (fixed from 6.6.143)
 
 CVE_STATUS[CVE-2025-68297] = "cpe-stable-backport: Backported in 6.6.119"
 
@@ -19802,7 +19802,7 @@ CVE_STATUS[CVE-2025-68313] = "fixed-version: only affects 6.8 onwards"
 
 CVE_STATUS[CVE-2025-68314] = "fixed-version: only affects 6.17 onwards"
 
-# CVE-2025-68315 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2025-68315] = "cpe-stable-backport: Backported in 6.6.140"
 
 CVE_STATUS[CVE-2025-68316] = "fixed-version: only affects 6.13 onwards"
 
@@ -19840,7 +19840,7 @@ CVE_STATUS[CVE-2025-68332] = "cpe-stable-backport: Backported in 6.6.120"
 
 CVE_STATUS[CVE-2025-68333] = "fixed-version: only affects 6.12 onwards"
 
-# CVE-2025-68334 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-68334] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2025-68335] = "cpe-stable-backport: Backported in 6.6.120"
 
@@ -19958,7 +19958,7 @@ CVE_STATUS[CVE-2025-68734] = "cpe-stable-backport: Backported in 6.6.117"
 
 CVE_STATUS[CVE-2025-68735] = "fixed-version: only affects 6.10 onwards"
 
-# CVE-2025-68736 needs backporting (fixed from 6.19)
+# CVE-2025-68736 may need backporting (fixed from 6.6.143)
 
 CVE_STATUS[CVE-2025-68737] = "fixed-version: only affects 6.18 onwards"
 
@@ -20022,7 +20022,7 @@ CVE_STATUS[CVE-2025-68766] = "cpe-stable-backport: Backported in 6.6.120"
 
 CVE_STATUS[CVE-2025-68767] = "cpe-stable-backport: Backported in 6.6.120"
 
-# CVE-2025-68768 needs backporting (fixed from 6.19)
+# CVE-2025-68768 may need backporting (fixed from 6.6.143)
 
 CVE_STATUS[CVE-2025-68769] = "cpe-stable-backport: Backported in 6.6.120"
 
@@ -20304,7 +20304,7 @@ CVE_STATUS[CVE-2025-71150] = "cpe-stable-backport: Backported in 6.6.120"
 
 CVE_STATUS[CVE-2025-71151] = "cpe-stable-backport: Backported in 6.6.120"
 
-# CVE-2025-71152 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-71152] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2025-71153] = "cpe-stable-backport: Backported in 6.6.120"
 
@@ -20322,7 +20322,7 @@ CVE_STATUS[CVE-2025-71159] = "fixed-version: only affects 6.18 onwards"
 
 CVE_STATUS[CVE-2025-71160] = "cpe-stable-backport: Backported in 6.6.121"
 
-# CVE-2025-71161 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-71161] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2025-71162] = "cpe-stable-backport: Backported in 6.6.122"
 
@@ -20336,7 +20336,7 @@ CVE_STATUS[CVE-2025-71182] = "cpe-stable-backport: Backported in 6.6.121"
 
 CVE_STATUS[CVE-2025-71183] = "cpe-stable-backport: Backported in 6.6.121"
 
-# CVE-2025-71184 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-71184] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2025-71185] = "cpe-stable-backport: Backported in 6.6.122"
 
@@ -20374,13 +20374,13 @@ CVE_STATUS[CVE-2025-71201] = "fixed-version: only affects 6.14 onwards"
 
 # CVE-2025-71202 needs backporting (fixed from 6.19)
 
-# CVE-2025-71203 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-71203] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2025-71204] = "cpe-stable-backport: Backported in 6.6.124"
 
 CVE_STATUS[CVE-2025-71220] = "cpe-stable-backport: Backported in 6.6.124"
 
-# CVE-2025-71221 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-71221] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2025-71222] = "cpe-stable-backport: Backported in 6.6.124"
 
@@ -20412,17 +20412,17 @@ CVE_STATUS[CVE-2025-71237] = "cpe-stable-backport: Backported in 6.6.125"
 
 CVE_STATUS[CVE-2025-71238] = "cpe-stable-backport: Backported in 6.6.127"
 
-# CVE-2025-71239 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2025-71239] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2025-71265 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2025-71265] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2025-71266 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2025-71266] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2025-71267 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2025-71267] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2025-71268] = "cpe-stable-backport: Backported in 6.6.124"
 
-# CVE-2025-71269 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2025-71269] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2025-71270] = "cpe-stable-backport: Backported in 6.6.124"
 
@@ -20432,33 +20432,33 @@ CVE_STATUS[CVE-2025-71271] = "fixed-version: only affects 6.13 onwards"
 
 # CVE-2025-71273 needs backporting (fixed from 7.0)
 
-# CVE-2025-71274 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2025-71274] = "cpe-stable-backport: Backported in 6.6.128"
 
 # CVE-2025-71285 needs backporting (fixed from 7.0)
 
-# CVE-2025-71286 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2025-71286] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2025-71287 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-71287] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2025-71288 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2025-71288] = "cpe-stable-backport: Backported in 6.6.130"
 
 # CVE-2025-71289 needs backporting (fixed from 7.0)
 
 CVE_STATUS[CVE-2025-71290] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2025-71291 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2025-71291] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2025-71292 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2025-71292] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2025-71293] = "fixed-version: only affects 6.18 onwards"
 
 CVE_STATUS[CVE-2025-71294] = "fixed-version: only affects 6.7 onwards"
 
-# CVE-2025-71295 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2025-71295] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2025-71296] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2025-71297 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2025-71297] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2025-71298] = "fixed-version: only affects 6.16 onwards"
 
@@ -20470,6 +20470,30 @@ CVE_STATUS[CVE-2025-71301] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2025-71302] = "fixed-version: only affects 6.10 onwards"
 
+CVE_STATUS[CVE-2025-71303] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2025-71304] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2025-71305] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2025-71306] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-71307] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2025-71308] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-71309] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2025-71311] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2025-71312] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2025-71313 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2025-71314] = "fixed-version: only affects 6.10 onwards"
+
+# CVE-2025-71315 needs backporting (fixed from 6.19)
+
 CVE_STATUS[CVE-2026-22976] = "cpe-stable-backport: Backported in 6.6.121"
 
 CVE_STATUS[CVE-2026-22977] = "cpe-stable-backport: Backported in 6.6.121"
@@ -20526,7 +20550,7 @@ CVE_STATUS[CVE-2026-23002] = "fixed-version: only affects 6.12 onwards"
 
 CVE_STATUS[CVE-2026-23003] = "cpe-stable-backport: Backported in 6.6.122"
 
-# CVE-2026-23004 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23004] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23005] = "cpe-stable-backport: Backported in 6.6.122"
 
@@ -20618,13 +20642,13 @@ CVE_STATUS[CVE-2026-23048] = "fixed-version: only affects 6.18 onwards"
 
 CVE_STATUS[CVE-2026-23049] = "cpe-stable-backport: Backported in 6.6.122"
 
-# CVE-2026-23050 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23050] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23051] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2026-23052] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-23053 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23053] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23054] = "cpe-stable-backport: Backported in 6.6.122"
 
@@ -20650,7 +20674,7 @@ CVE_STATUS[CVE-2026-23064] = "cpe-stable-backport: Backported in 6.6.122"
 
 CVE_STATUS[CVE-2026-23065] = "fixed-version: only affects 6.8 onwards"
 
-# CVE-2026-23066 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23066] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23067] = "fixed-version: only affects 6.16 onwards"
 
@@ -20754,7 +20778,7 @@ CVE_STATUS[CVE-2026-23116] = "cpe-stable-backport: Backported in 6.6.122"
 
 CVE_STATUS[CVE-2026-23117] = "fixed-version: only affects 6.18.2 onwards"
 
-# CVE-2026-23118 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23118] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23119] = "cpe-stable-backport: Backported in 6.6.122"
 
@@ -20794,7 +20818,7 @@ CVE_STATUS[CVE-2026-23136] = "cpe-stable-backport: Backported in 6.6.121"
 
 # CVE-2026-23137 needs backporting (fixed from 6.19)
 
-# CVE-2026-23138 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23138] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23139] = "cpe-stable-backport: Backported in 6.6.121"
 
@@ -20826,13 +20850,13 @@ CVE_STATUS[CVE-2026-23152] = "fixed-version: only affects 6.7 onwards"
 
 CVE_STATUS[CVE-2026-23153] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-23154 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23154] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23155] = "cpe-stable-backport: Backported in 6.6.123"
 
 CVE_STATUS[CVE-2026-23156] = "cpe-stable-backport: Backported in 6.6.123"
 
-# CVE-2026-23157 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23157] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23158] = "fixed-version: only affects 6.11 onwards"
 
@@ -20860,7 +20884,7 @@ CVE_STATUS[CVE-2026-23169] = "cpe-stable-backport: Backported in 6.6.125"
 
 CVE_STATUS[CVE-2026-23170] = "cpe-stable-backport: Backported in 6.6.123"
 
-# CVE-2026-23171 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-23171] = "cpe-stable-backport: Backported in 6.6.140"
 
 CVE_STATUS[CVE-2026-23172] = "cpe-stable-backport: Backported in 6.6.123"
 
@@ -20972,7 +20996,7 @@ CVE_STATUS[CVE-2026-23225] = "fixed-version: only affects 6.19 onwards"
 
 # CVE-2026-23226 needs backporting (fixed from 7.0)
 
-# CVE-2026-23227 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23227] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23228] = "cpe-stable-backport: Backported in 6.6.125"
 
@@ -20980,7 +21004,7 @@ CVE_STATUS[CVE-2026-23229] = "cpe-stable-backport: Backported in 6.6.125"
 
 CVE_STATUS[CVE-2026-23230] = "cpe-stable-backport: Backported in 6.6.125"
 
-# CVE-2026-23231 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-23231] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-23232] = "fixed-version: only affects 6.19 onwards"
 
@@ -21002,15 +21026,15 @@ CVE_STATUS[CVE-2026-23238] = "cpe-stable-backport: Backported in 6.6.127"
 
 CVE_STATUS[CVE-2026-23241] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2026-23242 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-23242] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-23243 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-23243] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-23244 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23244] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23245 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23245] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23246 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23246] = "cpe-stable-backport: Backported in 6.6.130"
 
 # CVE-2026-23247 needs backporting (fixed from 7.0)
 
@@ -21024,11 +21048,11 @@ CVE_STATUS[CVE-2026-23251] = "fixed-version: only affects 6.10 onwards"
 
 CVE_STATUS[CVE-2026-23252] = "fixed-version: only affects 6.10 onwards"
 
-# CVE-2026-23253 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23253] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23254] = "cpe-stable-backport: Backported in 6.6.124"
 
-# CVE-2026-23255 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-23255] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-23256] = "cpe-stable-backport: Backported in 6.6.124"
 
@@ -21054,119 +21078,119 @@ CVE_STATUS[CVE-2026-23266] = "cpe-stable-backport: Backported in 6.6.127"
 
 CVE_STATUS[CVE-2026-23267] = "cpe-stable-backport: Backported in 6.6.127"
 
-# CVE-2026-23268 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23268] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23269 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23269] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23270 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23270] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23271 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23271] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23272 may need backporting (fixed from 6.6.141)
+CVE_STATUS[CVE-2026-23272] = "cpe-stable-backport: Backported in 6.6.141"
 
-# CVE-2026-23273 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-23273] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-23274 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23274] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23275] = "fixed-version: only affects 6.13 onwards"
 
 # CVE-2026-23276 needs backporting (fixed from 7.0)
 
-# CVE-2026-23277 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23277] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23278 needs backporting (fixed from 7.0)
+# CVE-2026-23278 may need backporting (fixed from 6.6.144)
 
-# CVE-2026-23279 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23279] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23280] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-23281 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23281] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23282] = "fixed-version: only affects 6.17 onwards"
 
 CVE_STATUS[CVE-2026-23283] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-23284 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23284] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23285 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23285] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23286 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23286] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23287 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23287] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23288] = "fixed-version: only affects 6.19.4 onwards"
 
-# CVE-2026-23289 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23289] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23290 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23290] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23291 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23291] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23292 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23292] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23293 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23293] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23294] = "fixed-version: only affects 6.18 onwards"
 
 CVE_STATUS[CVE-2026-23295] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-23296 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23296] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23297] = "fixed-version: only affects 6.10 onwards"
 
-# CVE-2026-23298 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23298] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23299] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-23300 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23300] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23301] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-23302 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-23302] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-23303 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23303] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23304 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23304] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23305] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-23306 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23306] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23307 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23307] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23308 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23308] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23309 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23309] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23310 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23310] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23311] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-23312 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23312] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23313 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-23313] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-23314] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-23315 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23315] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23316] = "fixed-version: only affects 6.11 onwards"
 
-# CVE-2026-23317 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23317] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23318 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23318] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23319 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23319] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23321 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23321] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23322] = "fixed-version: only affects 6.18 onwards"
 
 CVE_STATUS[CVE-2026-23323] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-23324 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23324] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23325 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23325] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23326] = "fixed-version: only affects 6.13 onwards"
 
@@ -21176,39 +21200,39 @@ CVE_STATUS[CVE-2026-23328] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2026-23329] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-23330 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-23330] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-23331] = "fixed-version: only affects 6.13 onwards"
 
 CVE_STATUS[CVE-2026-23332] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-23334 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23334] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23335 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23335] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23336 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23336] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23337] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-23338] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-23339 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23339] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23340 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23340] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23341] = "fixed-version: only affects 6.19.4 onwards"
 
 CVE_STATUS[CVE-2026-23342] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-23343 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23343] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23344] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-23345] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2026-23346 needs backporting (fixed from 7.0)
+# CVE-2026-23346 may need backporting (fixed from 6.6.143)
 
-# CVE-2026-23347 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23347] = "cpe-stable-backport: Backported in 6.6.130"
 
 # CVE-2026-23348 needs backporting (fixed from 7.0)
 
@@ -21216,9 +21240,9 @@ CVE_STATUS[CVE-2026-23349] = "fixed-version: only affects 6.18 onwards"
 
 CVE_STATUS[CVE-2026-23350] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-23351 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23351] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23352 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23352] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23353] = "fixed-version: only affects 6.19 onwards"
 
@@ -21226,43 +21250,43 @@ CVE_STATUS[CVE-2026-23354] = "fixed-version: only affects 6.9 onwards"
 
 CVE_STATUS[CVE-2026-23355] = "fixed-version: only affects 6.18.14 onwards"
 
-# CVE-2026-23356 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23356] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23357 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23357] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23358] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-23359 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23359] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23360 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-23360] = "cpe-stable-backport: Backported in 6.6.131"
 
 # CVE-2026-23361 needs backporting (fixed from 7.0)
 
-# CVE-2026-23362 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23362] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23363] = "fixed-version: only affects 6.7 onwards"
 
-# CVE-2026-23364 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23364] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23365 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23365] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23366] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-23367 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23367] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23368 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23368] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23369] = "fixed-version: only affects 6.7 onwards"
 
-# CVE-2026-23370 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23370] = "cpe-stable-backport: Backported in 6.6.130"
 
 # CVE-2026-23371 needs backporting (fixed from 7.0)
 
-# CVE-2026-23372 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23372] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23373] = "fixed-version: only affects 6.9 onwards"
 
-# CVE-2026-23374 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-23374] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-23375] = "fixed-version: only affects 6.8 onwards"
 
@@ -21270,15 +21294,15 @@ CVE_STATUS[CVE-2026-23376] = "fixed-version: only affects 6.17.3 onwards"
 
 # CVE-2026-23377 needs backporting (fixed from 7.0)
 
-# CVE-2026-23378 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23378] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23379 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23379] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23380] = "fixed-version: only affects 6.10 onwards"
 
-# CVE-2026-23381 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23381] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23382 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23382] = "cpe-stable-backport: Backported in 6.6.130"
 
 # CVE-2026-23383 needs backporting (fixed from 7.0)
 
@@ -21286,63 +21310,63 @@ CVE_STATUS[CVE-2026-23384] = "fixed-version: only affects 6.18 onwards"
 
 CVE_STATUS[CVE-2026-23385] = "fixed-version: only affects 6.10 onwards"
 
-# CVE-2026-23386 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23386] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23387 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23387] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23388 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23388] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23389 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-23389] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-23390] = "fixed-version: only affects 6.12 onwards"
 
-# CVE-2026-23391 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23391] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23392 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23392] = "cpe-stable-backport: Backported in 6.6.130"
 
 # CVE-2026-23393 needs backporting (fixed from 7.0)
 
-# CVE-2026-23394 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2026-23394] = "cpe-stable-backport: Backported in 6.6.142"
 
-# CVE-2026-23395 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23395] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23396 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23396] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23397 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23397] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23398 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23398] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23399 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-23399] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-23400] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-23401 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-23401] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2026-23402] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-23403 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23403] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23404 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23404] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23405 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23405] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23406 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23406] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23407 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23407] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23408 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23408] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23409 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23409] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23410 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23410] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23411 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23411] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23412 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23412] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23413 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23413] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23414 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-23414] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2026-23415] = "fixed-version: only affects 6.16 onwards"
 
@@ -21352,13 +21376,13 @@ CVE_STATUS[CVE-2026-23417] = "fixed-version: only affects 6.9 onwards"
 
 CVE_STATUS[CVE-2026-23418] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2026-23419 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23419] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23420 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23420] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23421] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-23422 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23422] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23423] = "fixed-version: only affects 6.13 onwards"
 
@@ -21366,11 +21390,11 @@ CVE_STATUS[CVE-2026-23424] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2026-23425] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2026-23426 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23426] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23427 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23427] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23428 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23428] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23429] = "fixed-version: only affects 6.18.7 onwards"
 
@@ -21382,7 +21406,7 @@ CVE_STATUS[CVE-2026-23432] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-23433] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-23434 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23434] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23435] = "fixed-version: only affects 6.18.2 onwards"
 
@@ -21390,67 +21414,67 @@ CVE_STATUS[CVE-2026-23436] = "fixed-version: only affects 6.13 onwards"
 
 CVE_STATUS[CVE-2026-23437] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2026-23438 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23438] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23439 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23439] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23440 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23440] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23441 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23441] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23442 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-23442] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-23443 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23443] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23444 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-23444] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-23445] = "fixed-version: only affects 6.10 onwards"
 
-# CVE-2026-23446 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23446] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23447 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23447] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23448 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23448] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23449 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23449] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23450 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23450] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23451] = "fixed-version: only affects 6.18.19 onwards"
 
-# CVE-2026-23452 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23452] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23453] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-23454 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23454] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23455 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23455] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23456 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23456] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23457 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23457] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23458 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23458] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23459] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2026-23460 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23460] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23461 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23461] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23462 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23462] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23463 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23463] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23464] = "fixed-version: only affects 6.8 onwards"
 
-# CVE-2026-23465 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23465] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23466] = "fixed-version: only affects 6.12 onwards"
 
 CVE_STATUS[CVE-2026-23467] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-23468 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-23468] = "cpe-stable-backport: Backported in 6.6.140"
 
 CVE_STATUS[CVE-2026-23469] = "fixed-version: only affects 6.8 onwards"
 
@@ -21458,101 +21482,101 @@ CVE_STATUS[CVE-2026-23470] = "fixed-version: only affects 6.8 onwards"
 
 # CVE-2026-23472 needs backporting (fixed from 7.0)
 
-# CVE-2026-23474 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23474] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-23475 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-23475] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-31389 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31389] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-31390] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-31391 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31391] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-31392 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31392] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-31393 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31393] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-31394] = "fixed-version: only affects 6.11 onwards"
 
 CVE_STATUS[CVE-2026-31395] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2026-31396 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31396] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-31397] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2026-31398] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-31399 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31399] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-31400 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31400] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-31401] = "fixed-version: only affects 6.11 onwards"
 
-# CVE-2026-31402 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31402] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-31403 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31403] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-31404] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2026-31405 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31405] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-31406] = "fixed-version: only affects 6.11 onwards"
 
-# CVE-2026-31407 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31407] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31408 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31408] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31409 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31409] = "cpe-stable-backport: Backported in 6.6.130"
 
 # CVE-2026-31410 needs backporting (fixed from 7.0)
 
-# CVE-2026-31411 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-31411] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-31412 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31412] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-31413] = "fixed-version: only affects 6.12.75 onwards"
 
-# CVE-2026-31414 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31414] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-31415 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31415] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-31416 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31416] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-31417 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31417] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-31418 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31418] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-31419 needs backporting (fixed from 7.0)
+# CVE-2026-31419 may need backporting (fixed from 6.6.143)
 
 # CVE-2026-31420 needs backporting (fixed from 7.0)
 
-# CVE-2026-31421 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31421] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-31422 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31422] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-31423 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31423] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-31424 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31424] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-31425 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31425] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-31426 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31426] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31427 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31427] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31428 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31428] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31429 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31429] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31430 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31430] = "cpe-stable-backport: Backported in 6.6.135"
 
-# CVE-2026-31431 may need backporting (fixed from 6.6.137)
+CVE_STATUS[CVE-2026-31431] = "cpe-stable-backport: Backported in 6.6.137"
 
-# CVE-2026-31432 needs backporting (fixed from 7.0)
+# CVE-2026-31432 may need backporting (fixed from 6.6.143)
 
-# CVE-2026-31433 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31433] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31434 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31434] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2026-31435] = "fixed-version: only affects 6.12 onwards"
 
@@ -21562,45 +21586,45 @@ CVE_STATUS[CVE-2026-31437] = "fixed-version: only affects 6.18.17 onwards"
 
 CVE_STATUS[CVE-2026-31438] = "fixed-version: only affects 6.8 onwards"
 
-# CVE-2026-31439 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31439] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31440 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-31440] = "cpe-stable-backport: Backported in 6.6.140"
 
-# CVE-2026-31441 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31441] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2026-31442] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2026-31443] = "fixed-version: only affects 6.14 onwards"
 
-CVE_STATUS[CVE-2026-31444] = "fixed-version: only affects 6.6.130 onwards"
+CVE_STATUS[CVE-2026-31444] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2026-31445] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-31446 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31446] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31447 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31447] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31448 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31448] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31449 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-31449] = "cpe-stable-backport: Backported in 6.6.140"
 
-# CVE-2026-31450 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31450] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-31451 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31451] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31452 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31452] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31453 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31453] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31454 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31454] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31455 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31455] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2026-31456] = "fixed-version: only affects 6.12 onwards"
 
 CVE_STATUS[CVE-2026-31457] = "fixed-version: only affects 6.17 onwards"
 
-# CVE-2026-31458 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31458] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2026-31459] = "fixed-version: only affects 6.17.6 onwards"
 
@@ -21612,17 +21636,17 @@ CVE_STATUS[CVE-2026-31461] = "fixed-version: only affects 6.13 onwards"
 
 CVE_STATUS[CVE-2026-31463] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-31464 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31464] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2026-31465] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-31466 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31466] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-31467 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31467] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2026-31468] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-31469 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31469] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2026-31470] = "fixed-version: only affects 6.7 onwards"
 
@@ -21630,117 +21654,117 @@ CVE_STATUS[CVE-2026-31471] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2026-31472] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2026-31473 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31473] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31474 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31474] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2026-31475] = "fixed-version: only affects 6.14.9 onwards"
 
-# CVE-2026-31476 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31476] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31477 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31477] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31478 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31478] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2026-31479] = "fixed-version: only affects 6.8 onwards"
 
-# CVE-2026-31480 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31480] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2026-31481] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-31482 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31482] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31483 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31483] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2026-31484] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-31485 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31485] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31486 needs backporting (fixed from 7.0)
+# CVE-2026-31486 may need backporting (fixed from 6.6.143)
 
 # CVE-2026-31487 needs backporting (fixed from 7.0)
 
-# CVE-2026-31488 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-31488] = "cpe-stable-backport: Backported in 6.6.140"
 
-# CVE-2026-31489 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-31489] = "cpe-stable-backport: Backported in 6.6.140"
 
 CVE_STATUS[CVE-2026-31490] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-31491] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-31492 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31492] = "cpe-stable-backport: Backported in 6.6.131"
 
 # CVE-2026-31493 needs backporting (fixed from 7.0)
 
-# CVE-2026-31494 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31494] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31495 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31495] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31496 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31496] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31497 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31497] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31498 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31498] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2026-31499] = "fixed-version: only affects 6.12.20 onwards"
 
-# CVE-2026-31500 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31500] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2026-31501] = "fixed-version: only affects 6.15 onwards"
 
 # CVE-2026-31502 needs backporting (fixed from 7.0)
 
-# CVE-2026-31503 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31503] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31504 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31504] = "cpe-stable-backport: Backported in 6.6.131"
 
 # CVE-2026-31505 needs backporting (fixed from 7.0)
 
 # CVE-2026-31506 needs backporting (fixed from 7.0)
 
-# CVE-2026-31507 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31507] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31508 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31508] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31509 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31509] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31510 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31510] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2026-31511] = "fixed-version: only affects 6.12.59 onwards"
 
-# CVE-2026-31512 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31512] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2026-31513] = "fixed-version: only affects 6.12.75 onwards"
 
 CVE_STATUS[CVE-2026-31514] = "fixed-version: only affects 6.12.75 onwards"
 
-# CVE-2026-31515 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31515] = "cpe-stable-backport: Backported in 6.6.131"
 
 # CVE-2026-31516 needs backporting (fixed from 7.0)
 
 CVE_STATUS[CVE-2026-31517] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2026-31518 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31518] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31519 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31519] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31520 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31520] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31521 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31521] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31522 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31522] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31523 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31523] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31524 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31524] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31525 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31525] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2026-31526] = "fixed-version: only affects 6.7 onwards"
 
-# CVE-2026-31527 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-31527] = "cpe-stable-backport: Backported in 6.6.142"
 
-# CVE-2026-31528 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31528] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2026-31529] = "fixed-version: only affects 6.19 onwards"
 
@@ -21748,9 +21772,9 @@ CVE_STATUS[CVE-2026-31529] = "fixed-version: only affects 6.19 onwards"
 
 # CVE-2026-31531 needs backporting (fixed from 7.0)
 
-# CVE-2026-31532 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31532] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31533 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31533] = "cpe-stable-backport: Backported in 6.6.135"
 
 CVE_STATUS[CVE-2026-31535] = "fixed-version: only affects 6.18 onwards"
 
@@ -21762,37 +21786,37 @@ CVE_STATUS[CVE-2026-31538] = "fixed-version: only affects 6.18 onwards"
 
 CVE_STATUS[CVE-2026-31539] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-31540 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31540] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-31541] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-31542 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31542] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-31543] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2026-31544] = "fixed-version: only affects 6.17 onwards"
 
-# CVE-2026-31545 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31545] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-31546 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31546] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-31547] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-31548 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31548] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-31549 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31549] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-31550 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31550] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-31551 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31551] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-31552 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31552] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-31553] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-31554] = "fixed-version: only affects 6.7 onwards"
 
-# CVE-2026-31555 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31555] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2026-31556] = "fixed-version: only affects 6.8 onwards"
 
@@ -21808,13 +21832,13 @@ CVE_STATUS[CVE-2026-31561] = "fixed-version: only affects 6.9 onwards"
 
 CVE_STATUS[CVE-2026-31562] = "fixed-version: only affects 6.9 onwards"
 
-# CVE-2026-31563 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31563] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2026-31564] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-31565 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31565] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31566 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31566] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2026-31567] = "fixed-version: only affects 6.17.8 onwards"
 
@@ -21822,7 +21846,7 @@ CVE_STATUS[CVE-2026-31567] = "fixed-version: only affects 6.17.8 onwards"
 
 CVE_STATUS[CVE-2026-31569] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2026-31570 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31570] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2026-31571] = "fixed-version: only affects 6.15 onwards"
 
@@ -21834,113 +21858,113 @@ CVE_STATUS[CVE-2026-31574] = "fixed-version: only affects 7.0 onwards"
 
 CVE_STATUS[CVE-2026-31575] = "fixed-version: only affects 6.7 onwards"
 
-# CVE-2026-31576 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31576] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31577 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31577] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31578 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31578] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31579 needs backporting (fixed from 7.1rc1)
+# CVE-2026-31579 needs backporting (fixed from 7.1)
 
-# CVE-2026-31580 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31580] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31581 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31581] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-31582] = "fixed-version: only affects 6.7 onwards"
 
-# CVE-2026-31583 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31583] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31584 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31584] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31585 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31585] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31586 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31586] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31587 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31587] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31588 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31588] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-31589] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2026-31590 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31590] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-31591] = "fixed-version: only affects 6.11 onwards"
 
-# CVE-2026-31592 needs backporting (fixed from 7.1rc1)
+# CVE-2026-31592 needs backporting (fixed from 7.1)
 
 CVE_STATUS[CVE-2026-31593] = "fixed-version: only affects 6.11 onwards"
 
-# CVE-2026-31594 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31594] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31595 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31595] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31596 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31596] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31597 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31597] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31598 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31598] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31599 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31599] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-31600] = "fixed-version: only affects 6.18 onwards"
 
 CVE_STATUS[CVE-2026-31601] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-31602 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31602] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31603 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31603] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31604 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31604] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31605 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31605] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31606 needs backporting (fixed from 7.1rc1)
+# CVE-2026-31606 needs backporting (fixed from 7.1)
 
-# CVE-2026-31607 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31607] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-31608] = "fixed-version: only affects 6.18.11 onwards"
 
 CVE_STATUS[CVE-2026-31609] = "fixed-version: only affects 6.18.11 onwards"
 
-# CVE-2026-31610 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31610] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31611 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31611] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31612 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31612] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31613 may need backporting (fixed from 6.6.141)
+CVE_STATUS[CVE-2026-31613] = "cpe-stable-backport: Backported in 6.6.141"
 
-# CVE-2026-31614 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31614] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31615 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31615] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31616 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31616] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31617 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31617] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31618 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31618] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31619 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31619] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-31620] = "fixed-version: only affects 6.18 onwards"
 
 CVE_STATUS[CVE-2026-31621] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-31622 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31622] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31623 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31623] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31624 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31624] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31625 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31625] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31626 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31626] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31627 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31627] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31628 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31628] = "cpe-stable-backport: Backported in 6.6.135"
 
-# CVE-2026-31629 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31629] = "cpe-stable-backport: Backported in 6.6.136"
 
 # CVE-2026-31630 needs backporting (fixed from 7.0)
 
@@ -21950,23 +21974,23 @@ CVE_STATUS[CVE-2026-31632] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2026-31633] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-31634 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31634] = "cpe-stable-backport: Backported in 6.6.135"
 
 CVE_STATUS[CVE-2026-31635] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2026-31636] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-31637 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31637] = "cpe-stable-backport: Backported in 6.6.135"
 
-# CVE-2026-31638 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31638] = "cpe-stable-backport: Backported in 6.6.135"
 
-# CVE-2026-31639 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31639] = "cpe-stable-backport: Backported in 6.6.135"
 
 CVE_STATUS[CVE-2026-31640] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2026-31641] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-31642 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31642] = "cpe-stable-backport: Backported in 6.6.135"
 
 CVE_STATUS[CVE-2026-31643] = "fixed-version: only affects 6.16 onwards"
 
@@ -21974,17 +21998,17 @@ CVE_STATUS[CVE-2026-31644] = "fixed-version: only affects 6.12 onwards"
 
 # CVE-2026-31645 needs backporting (fixed from 7.0)
 
-# CVE-2026-31646 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31646] = "cpe-stable-backport: Backported in 6.6.135"
 
 CVE_STATUS[CVE-2026-31647] = "fixed-version: only affects 6.9 onwards"
 
-# CVE-2026-31648 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31648] = "cpe-stable-backport: Backported in 6.6.135"
 
-# CVE-2026-31649 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31649] = "cpe-stable-backport: Backported in 6.6.135"
 
 CVE_STATUS[CVE-2026-31650] = "fixed-version: only affects 6.17 onwards"
 
-# CVE-2026-31651 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31651] = "cpe-stable-backport: Backported in 6.6.135"
 
 CVE_STATUS[CVE-2026-31652] = "fixed-version: only affects 6.17 onwards"
 
@@ -21992,75 +22016,73 @@ CVE_STATUS[CVE-2026-31653] = "fixed-version: only affects 6.17 onwards"
 
 CVE_STATUS[CVE-2026-31654] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-31655 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31655] = "cpe-stable-backport: Backported in 6.6.135"
 
-# CVE-2026-31656 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31656] = "cpe-stable-backport: Backported in 6.6.135"
 
-# CVE-2026-31657 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31657] = "cpe-stable-backport: Backported in 6.6.135"
 
-# CVE-2026-31658 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31658] = "cpe-stable-backport: Backported in 6.6.135"
 
-# CVE-2026-31659 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31659] = "cpe-stable-backport: Backported in 6.6.135"
 
-# CVE-2026-31660 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31660] = "cpe-stable-backport: Backported in 6.6.135"
 
-# CVE-2026-31661 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31661] = "cpe-stable-backport: Backported in 6.6.135"
 
-# CVE-2026-31662 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31662] = "cpe-stable-backport: Backported in 6.6.135"
 
 # CVE-2026-31663 needs backporting (fixed from 7.0)
 
-# CVE-2026-31664 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31664] = "cpe-stable-backport: Backported in 6.6.135"
 
-# CVE-2026-31665 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31665] = "cpe-stable-backport: Backported in 6.6.135"
 
 CVE_STATUS[CVE-2026-31666] = "fixed-version: only affects 6.10 onwards"
 
-# CVE-2026-31667 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31667] = "cpe-stable-backport: Backported in 6.6.135"
 
-# CVE-2026-31668 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31668] = "cpe-stable-backport: Backported in 6.6.135"
 
-# CVE-2026-31669 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31669] = "cpe-stable-backport: Backported in 6.6.135"
 
-# CVE-2026-31670 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31670] = "cpe-stable-backport: Backported in 6.6.135"
 
-# CVE-2026-31671 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31671] = "cpe-stable-backport: Backported in 6.6.135"
 
-# CVE-2026-31672 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31672] = "cpe-stable-backport: Backported in 6.6.135"
 
-# CVE-2026-31673 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31673] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31674 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31674] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31675 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31675] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-31676 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31676] = "cpe-stable-backport: Backported in 6.6.136"
 
 # CVE-2026-31677 needs backporting (fixed from 7.0)
 
-# CVE-2026-31678 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31678] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31679 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-31679] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-31680 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31680] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-31681 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31681] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31682 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31682] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-31683 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31683] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-31684 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31684] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31685 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31685] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31686 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31686] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-31687] = "cpe-stable-backport: Backported in 6.6.126"
 
-# CVE-2026-31688 needs backporting (fixed from 7.0)
-
-# CVE-2026-31689 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31689] = "cpe-stable-backport: Backported in 6.6.135"
 
 CVE_STATUS[CVE-2026-31690] = "fixed-version: only affects 6.15 onwards"
 
@@ -22068,63 +22090,63 @@ CVE_STATUS[CVE-2026-31691] = "fixed-version: only affects 6.14 onwards"
 
 # CVE-2026-31692 needs backporting (fixed from 7.0)
 
-# CVE-2026-31693 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-31693] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-31694 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31694] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-31695 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31695] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-31696 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31696] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31697 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31697] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31698 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31698] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31699 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31699] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31700 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31700] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31701 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31701] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31702 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31702] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-31703] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-31704 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31704] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31705 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31705] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31706 needs backporting (fixed from 7.1rc1)
+# CVE-2026-31706 needs backporting (fixed from 7.1)
 
-# CVE-2026-31707 may need backporting (fixed from 6.6.141)
+CVE_STATUS[CVE-2026-31707] = "cpe-stable-backport: Backported in 6.6.141"
 
-# CVE-2026-31708 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31708] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31709 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-31709] = "cpe-stable-backport: Backported in 6.6.140"
 
 CVE_STATUS[CVE-2026-31710] = "fixed-version: only affects 7.0 onwards"
 
-# CVE-2026-31711 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31711] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31712 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-31712] = "cpe-stable-backport: Backported in 6.6.140"
 
 CVE_STATUS[CVE-2026-31713] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-31714 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31714] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31715 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-31715] = "cpe-stable-backport: Backported in 6.6.140"
 
-# CVE-2026-31716 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-31716] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-31717 may need backporting (fixed from 6.7)
+CVE_STATUS[CVE-2026-31717] = "cpe-stable-backport: Backported in 6.6.142"
 
-# CVE-2026-31718 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-31718] = "cpe-stable-backport: Backported in 6.6.140"
 
 CVE_STATUS[CVE-2026-31719] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-31720 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31720] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-31721 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-31721] = "cpe-stable-backport: Backported in 6.6.135"
 
 # CVE-2026-31722 needs backporting (fixed from 7.0)
 
@@ -22134,15 +22156,15 @@ CVE_STATUS[CVE-2026-31719] = "fixed-version: only affects 6.15 onwards"
 
 # CVE-2026-31725 needs backporting (fixed from 7.0)
 
-# CVE-2026-31726 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31726] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-31727] = "fixed-version: only affects 6.12.78 onwards"
 
-# CVE-2026-31728 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31728] = "cpe-stable-backport: Backported in 6.6.134"
 
 # CVE-2026-31729 needs backporting (fixed from 7.0)
 
-# CVE-2026-31730 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31730] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-31731] = "fixed-version: only affects 6.8 onwards"
 
@@ -22156,15 +22178,15 @@ CVE_STATUS[CVE-2026-31735] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-31736] = "fixed-version: only affects 6.11 onwards"
 
-# CVE-2026-31737 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31737] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-31738 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31738] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-31739] = "fixed-version: only affects 6.10 onwards"
 
-# CVE-2026-31740 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31740] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-31741 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31741] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-31742] = "fixed-version: only affects 6.18.20 onwards"
 
@@ -22176,39 +22198,39 @@ CVE_STATUS[CVE-2026-31745] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-31746] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-31747 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31747] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-31748 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31748] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-31749 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31749] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-31750] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-31751 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31751] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-31752 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31752] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-31753] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-31754 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31754] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-31755 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31755] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-31756 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31756] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-31757] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-31758 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31758] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-31759 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31759] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-31760] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2026-31761 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31761] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-31762 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31762] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-31763 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31763] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-31764] = "fixed-version: only affects 6.19 onwards"
 
@@ -22218,17 +22240,17 @@ CVE_STATUS[CVE-2026-31766] = "fixed-version: only affects 6.16 onwards"
 
 # CVE-2026-31767 needs backporting (fixed from 7.0)
 
-# CVE-2026-31768 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31768] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-31769] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2026-31770 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31770] = "cpe-stable-backport: Backported in 6.6.134"
 
 # CVE-2026-31771 needs backporting (fixed from 7.0)
 
 CVE_STATUS[CVE-2026-31772] = "fixed-version: only affects 6.12.2 onwards"
 
-# CVE-2026-31773 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31773] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-31774] = "fixed-version: only affects 6.10 onwards"
 
@@ -22238,13 +22260,13 @@ CVE_STATUS[CVE-2026-31776] = "fixed-version: only affects 6.19 onwards"
 
 # CVE-2026-31777 needs backporting (fixed from 7.0)
 
-# CVE-2026-31778 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31778] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-31779 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31779] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-31780 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31780] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-31781 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-31781] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-31782] = "fixed-version: only affects 6.16 onwards"
 
@@ -22254,11 +22276,11 @@ CVE_STATUS[CVE-2026-31784] = "fixed-version: only affects 6.17 onwards"
 
 CVE_STATUS[CVE-2026-31785] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-31786 may need backporting (fixed from 6.6.137)
+CVE_STATUS[CVE-2026-31786] = "cpe-stable-backport: Backported in 6.6.137"
 
-# CVE-2026-31787 may need backporting (fixed from 6.6.137)
+CVE_STATUS[CVE-2026-31787] = "cpe-stable-backport: Backported in 6.6.137"
 
-# CVE-2026-31788 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-31788] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-43004] = "fixed-version: only affects 6.15 onwards"
 
@@ -22266,181 +22288,181 @@ CVE_STATUS[CVE-2026-43005] = "fixed-version: only affects 6.17 onwards"
 
 CVE_STATUS[CVE-2026-43006] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-43007 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43007] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-43008] = "fixed-version: only affects 6.19 onwards"
 
 # CVE-2026-43009 needs backporting (fixed from 7.0)
 
-# CVE-2026-43010 needs backporting (fixed from 7.0)
+# CVE-2026-43010 may need backporting (fixed from 6.6.144)
 
-# CVE-2026-43011 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43011] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-43012] = "fixed-version: only affects 6.12.9 onwards"
 
-# CVE-2026-43013 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43013] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43014 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43014] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43015 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43015] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43016 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43016] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43017 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43017] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43018 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43018] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43019 needs backporting (fixed from 7.0)
+# CVE-2026-43019 may need backporting (fixed from 6.6.143)
 
-# CVE-2026-43020 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43020] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-43021] = "fixed-version: only affects 6.19 onwards"
 
 # CVE-2026-43022 may need backporting (fixed from 6.7)
 
-# CVE-2026-43023 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43023] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43024 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43024] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43025 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43025] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43026 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43026] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43027 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43027] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43028 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43028] = "cpe-stable-backport: Backported in 6.6.134"
 
 # CVE-2026-43029 may need backporting (fixed from 6.7)
 
-# CVE-2026-43030 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43030] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-43031] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-43032 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43032] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43033 may need backporting (fixed from 6.6.137)
+CVE_STATUS[CVE-2026-43033] = "cpe-stable-backport: Backported in 6.6.137"
 
 CVE_STATUS[CVE-2026-43034] = "fixed-version: only affects 6.8 onwards"
 
-# CVE-2026-43035 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43035] = "cpe-stable-backport: Backported in 6.6.134"
 
 # CVE-2026-43036 needs backporting (fixed from 7.0)
 
-# CVE-2026-43037 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43037] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43038 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43038] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-43039] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-43040 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43040] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43041 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43041] = "cpe-stable-backport: Backported in 6.6.134"
 
 # CVE-2026-43042 needs backporting (fixed from 7.0)
 
-# CVE-2026-43043 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43043] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43044 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43044] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-43045] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-43046 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43046] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43047 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43047] = "cpe-stable-backport: Backported in 6.6.134"
 
 # CVE-2026-43048 needs backporting (fixed from 7.0)
 
 # CVE-2026-43049 needs backporting (fixed from 7.0)
 
-# CVE-2026-43050 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43050] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43051 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43051] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43052 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43052] = "cpe-stable-backport: Backported in 6.6.142"
 
 # CVE-2026-43053 needs backporting (fixed from 7.0)
 
-# CVE-2026-43054 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43054] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-43055] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-43056 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43056] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43057 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43057] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43058 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43058] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-43059] = "fixed-version: only affects 6.12.59 onwards"
 
-# CVE-2026-43060 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43060] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43061 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43061] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43062 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43062] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-43063] = "fixed-version: only affects 6.10 onwards"
 
-# CVE-2026-43064 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-43064] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-43065 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-43065] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-43066 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-43066] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-43067 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43067] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43068 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-43068] = "cpe-stable-backport: Backported in 6.6.131"
 
-# CVE-2026-43069 may need backporting (fixed from 6.6.131)
+CVE_STATUS[CVE-2026-43069] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2026-43070] = "fixed-version: only affects 6.18.17 onwards"
 
-# CVE-2026-43071 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43071] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-43072 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43072] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-43073 needs backporting (fixed from 7.1rc1)
+# CVE-2026-43073 needs backporting (fixed from 7.1)
 
-# CVE-2026-43074 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43074] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-43075 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43075] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-43076 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43076] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-43077 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43077] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-43078 may need backporting (fixed from 6.6.137)
+CVE_STATUS[CVE-2026-43078] = "cpe-stable-backport: Backported in 6.6.137"
 
-# CVE-2026-43079 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43079] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-43080 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43080] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-43081 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43081] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-43082 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43082] = "cpe-stable-backport: Backported in 6.6.136"
 
 # CVE-2026-43083 needs backporting (fixed from 7.0)
 
 CVE_STATUS[CVE-2026-43084] = "fixed-version: only affects 6.12.75 onwards"
 
-# CVE-2026-43085 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43085] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-43086 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43086] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-43087] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-43088 needs backporting (fixed from 7.0)
+# CVE-2026-43088 may need backporting (fixed from 6.6.143)
 
-# CVE-2026-43089 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43089] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-43090] = "fixed-version: only affects 6.12 onwards"
 
-# CVE-2026-43091 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43091] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-43092 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43092] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-43093 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43093] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-43094 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43094] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-43095] = "fixed-version: only affects 6.17 onwards"
 
@@ -22448,9 +22470,9 @@ CVE_STATUS[CVE-2026-43096] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-43097] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-43098 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43098] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-43099 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43099] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-43100] = "fixed-version: only affects 6.18 onwards"
 
@@ -22458,11 +22480,11 @@ CVE_STATUS[CVE-2026-43100] = "fixed-version: only affects 6.18 onwards"
 
 CVE_STATUS[CVE-2026-43102] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-43103 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43103] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-43104 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43104] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-43105 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43105] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-43106] = "fixed-version: only affects 6.19 onwards"
 
@@ -22470,37 +22492,35 @@ CVE_STATUS[CVE-2026-43106] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-43108] = "fixed-version: only affects 6.11 onwards"
 
-# CVE-2026-43109 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-43109] = "cpe-stable-backport: Backported in 6.6.140"
 
-# CVE-2026-43110 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43110] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-43111 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43111] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-43112 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43112] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-43113 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43113] = "cpe-stable-backport: Backported in 6.6.136"
 
-# CVE-2026-43114 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43114] = "cpe-stable-backport: Backported in 6.6.136"
 
 # CVE-2026-43115 needs backporting (fixed from 7.0)
 
-# CVE-2026-43116 needs backporting (fixed from 7.0)
+# CVE-2026-43116 may need backporting (fixed from 6.6.143)
 
-# CVE-2026-43117 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43117] = "cpe-stable-backport: Backported in 6.6.136"
 
 # CVE-2026-43118 needs backporting (fixed from 7.0)
 
 # CVE-2026-43119 needs backporting (fixed from 7.0)
 
-# CVE-2026-43120 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43120] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-43121] = "fixed-version: only affects 6.15 onwards"
 
-CVE_STATUS[CVE-2026-43122] = "fixed-version: only affects 6.18 onwards"
-
-# CVE-2026-43123 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43123] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43124 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43124] = "cpe-stable-backport: Backported in 6.6.128"
 
 # CVE-2026-43125 needs backporting (fixed from 7.0)
 
@@ -22508,55 +22528,55 @@ CVE_STATUS[CVE-2026-43122] = "fixed-version: only affects 6.18 onwards"
 
 # CVE-2026-43127 may need backporting (fixed from 6.7)
 
-# CVE-2026-43128 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43128] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43129 needs backporting (fixed from 7.0)
+# CVE-2026-43129 may need backporting (fixed from 6.6.143)
 
-# CVE-2026-43130 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43130] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43131] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-43132 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43132] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43133 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43133] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43134 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43134] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43135 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43135] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43136 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43136] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43137 may need backporting (fixed from 6.6.141)
+CVE_STATUS[CVE-2026-43137] = "cpe-stable-backport: Backported in 6.6.141"
 
 CVE_STATUS[CVE-2026-43138] = "fixed-version: only affects 6.9 onwards"
 
-# CVE-2026-43139 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43139] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43140 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43140] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43141 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43141] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43142] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-43143 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43143] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43144] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2026-43145 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43145] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43146] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-43147 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43147] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43148 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43148] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43149 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43149] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43150 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43150] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43151] = "fixed-version: only affects 6.18.3 onwards"
 
-# CVE-2026-43152 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43152] = "cpe-stable-backport: Backported in 6.6.128"
 
 # CVE-2026-43153 needs backporting (fixed from 7.0)
 
@@ -22564,21 +22584,21 @@ CVE_STATUS[CVE-2026-43154] = "fixed-version: only affects 6.18 onwards"
 
 CVE_STATUS[CVE-2026-43155] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-43156 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43156] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43157 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43157] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43158 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43158] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43159 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43159] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43160] = "fixed-version: only affects 6.17 onwards"
 
 # CVE-2026-43161 needs backporting (fixed from 7.0)
 
-# CVE-2026-43162 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43162] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43163 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43163] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43164] = "fixed-version: only affects 6.18 onwards"
 
@@ -22586,19 +22606,19 @@ CVE_STATUS[CVE-2026-43165] = "fixed-version: only affects 6.13 onwards"
 
 CVE_STATUS[CVE-2026-43166] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-43167 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43167] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43168 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43168] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43169] = "fixed-version: only affects 6.7 onwards"
 
-# CVE-2026-43170 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43170] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43171 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43171] = "cpe-stable-backport: Backported in 6.6.128"
 
 # CVE-2026-43172 needs backporting (fixed from 7.0)
 
-# CVE-2026-43173 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43173] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43174] = "fixed-version: only affects 6.15 onwards"
 
@@ -22612,27 +22632,27 @@ CVE_STATUS[CVE-2026-43178] = "fixed-version: only affects 6.12.70 onwards"
 
 CVE_STATUS[CVE-2026-43179] = "fixed-version: only affects 6.17 onwards"
 
-# CVE-2026-43180 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43180] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43181] = "fixed-version: only affects 6.17 onwards"
 
-# CVE-2026-43182 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43182] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43183 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43183] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43184 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43184] = "cpe-stable-backport: Backported in 6.6.128"
 
 # CVE-2026-43185 needs backporting (fixed from 7.0)
 
-# CVE-2026-43186 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43186] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43187 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43187] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43188] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-43189 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43189] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43190 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43190] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43191] = "fixed-version: only affects 6.7 onwards"
 
@@ -22640,11 +22660,11 @@ CVE_STATUS[CVE-2026-43192] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-43193] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-43194 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43194] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43195] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-43196 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43196] = "cpe-stable-backport: Backported in 6.6.128"
 
 # CVE-2026-43197 needs backporting (fixed from 7.0)
 
@@ -22652,99 +22672,99 @@ CVE_STATUS[CVE-2026-43195] = "fixed-version: only affects 6.16 onwards"
 
 # CVE-2026-43199 needs backporting (fixed from 7.0)
 
-# CVE-2026-43200 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43200] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43201] = "fixed-version: only affects 6.12.63 onwards"
 
-# CVE-2026-43202 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43202] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43203 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43203] = "cpe-stable-backport: Backported in 6.6.128"
 
 # CVE-2026-43204 needs backporting (fixed from 7.0)
 
-# CVE-2026-43205 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43205] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43206 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43206] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43207 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43207] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43208] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-43209 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43209] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43210] = "fixed-version: only affects 6.12 onwards"
 
-# CVE-2026-43211 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43211] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43212 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43212] = "cpe-stable-backport: Backported in 6.6.128"
 
 # CVE-2026-43213 needs backporting (fixed from 7.0)
 
-# CVE-2026-43214 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43214] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43215 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43215] = "cpe-stable-backport: Backported in 6.6.128"
 
 # CVE-2026-43216 needs backporting (fixed from 7.0)
 
 CVE_STATUS[CVE-2026-43217] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-43218 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43218] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43219 needs backporting (fixed from 7.0)
+# CVE-2026-43219 may need backporting (fixed from 6.6.143)
 
-CVE_STATUS[CVE-2026-43220] = "fixed-version: only affects 6.6.128 onwards"
+CVE_STATUS[CVE-2026-43220] = "cpe-stable-backport: Backported in 6.6.140"
 
-# CVE-2026-43221 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43221] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43222 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43222] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43223 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43223] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43224] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-43225 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43225] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43226 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43226] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43227 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43227] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43228] = "fixed-version: only affects 6.18 onwards"
 
 CVE_STATUS[CVE-2026-43229] = "fixed-version: only affects 6.8 onwards"
 
-# CVE-2026-43230 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43230] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43231 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43231] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43232 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43232] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43233 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43233] = "cpe-stable-backport: Backported in 6.6.128"
 
 # CVE-2026-43234 needs backporting (fixed from 7.0)
 
 CVE_STATUS[CVE-2026-43235] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-43236 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43236] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43237] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-43238 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43238] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43239 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43239] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43240 may need backporting (fixed from 6.6.128)
+# CVE-2026-43240 may need backporting (fixed from 6.6.143)
 
-# CVE-2026-43241 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43241] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43242 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43242] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43243] = "fixed-version: only affects 6.11 onwards"
 
 # CVE-2026-43244 needs backporting (fixed from 7.0)
 
-# CVE-2026-43245 may need backporting (fixed from 6.6.141)
+CVE_STATUS[CVE-2026-43245] = "cpe-stable-backport: Backported in 6.6.141"
 
-# CVE-2026-43246 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43246] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43247] = "fixed-version: only affects 6.13 onwards"
 
@@ -22754,19 +22774,19 @@ CVE_STATUS[CVE-2026-43247] = "fixed-version: only affects 6.13 onwards"
 
 # CVE-2026-43250 needs backporting (fixed from 7.0)
 
-# CVE-2026-43251 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43251] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43252 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43252] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43253 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43253] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43254] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-43255 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43255] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43256 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43256] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43257 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43257] = "cpe-stable-backport: Backported in 6.6.128"
 
 # CVE-2026-43258 needs backporting (fixed from 7.0)
 
@@ -22774,67 +22794,67 @@ CVE_STATUS[CVE-2026-43259] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2026-43260] = "fixed-version: only affects 6.11 onwards"
 
-# CVE-2026-43261 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43261] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43262 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43262] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43263] = "fixed-version: only affects 6.8 onwards"
 
-# CVE-2026-43264 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43264] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43265 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43265] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43266 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43266] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43267] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-43268 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43268] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43269 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43269] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43270 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43270] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43271 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43271] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43272] = "fixed-version: only affects 6.12 onwards"
 
-# CVE-2026-43273 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43273] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43274] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2026-43275 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43275] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43276] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-43277 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43277] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43278 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43278] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43279 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43279] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43280] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-43281 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43281] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-43282] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-43283 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43283] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43284 may need backporting (fixed from 6.6.138)
+CVE_STATUS[CVE-2026-43284] = "cpe-stable-backport: Backported in 6.6.138"
 
 CVE_STATUS[CVE-2026-43285] = "fixed-version: only affects 6.18 onwards"
 
 CVE_STATUS[CVE-2026-43286] = "fixed-version: only affects 6.14.8 onwards"
 
-# CVE-2026-43287 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43287] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43288 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43288] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43289 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43289] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43290] = "fixed-version: only affects 6.17 onwards"
 
-# CVE-2026-43291 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43291] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43292] = "fixed-version: only affects 6.9 onwards"
 
@@ -22842,9 +22862,9 @@ CVE_STATUS[CVE-2026-43293] = "fixed-version: only affects 6.10 onwards"
 
 # CVE-2026-43294 needs backporting (fixed from 7.0)
 
-# CVE-2026-43295 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43295] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43296 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43296] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43297] = "fixed-version: only affects 6.8 onwards"
 
@@ -22856,11 +22876,11 @@ CVE_STATUS[CVE-2026-43300] = "fixed-version: only affects 6.7 onwards"
 
 CVE_STATUS[CVE-2026-43301] = "fixed-version: only affects 6.8 onwards"
 
-# CVE-2026-43302 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43302] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43303 needs backporting (fixed from 7.0)
+# CVE-2026-43303 may need backporting (fixed from 6.6.143)
 
-# CVE-2026-43304 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43304] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43305] = "fixed-version: only affects 6.19 onwards"
 
@@ -22874,23 +22894,23 @@ CVE_STATUS[CVE-2026-43307] = "fixed-version: only affects 6.12 onwards"
 
 # CVE-2026-43310 needs backporting (fixed from 7.0)
 
-# CVE-2026-43311 needs backporting (fixed from 7.0)
+# CVE-2026-43311 may need backporting (fixed from 6.6.143)
 
-# CVE-2026-43312 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43312] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43313 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43313] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43314 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43314] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43315 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43315] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43316 may need backporting (fixed from 6.6.128)
+CVE_STATUS[CVE-2026-43316] = "cpe-stable-backport: Backported in 6.6.128"
 
 # CVE-2026-43317 needs backporting (fixed from 7.0)
 
 # CVE-2026-43318 needs backporting (fixed from 7.0)
 
-# CVE-2026-43319 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43319] = "cpe-stable-backport: Backported in 6.6.142"
 
 CVE_STATUS[CVE-2026-43320] = "fixed-version: only affects 6.10.13 onwards"
 
@@ -22900,49 +22920,49 @@ CVE_STATUS[CVE-2026-43322] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-43323] = "fixed-version: only affects 6.12.78 onwards"
 
-# CVE-2026-43324 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43324] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-43325] = "fixed-version: only affects 6.9 onwards"
 
 CVE_STATUS[CVE-2026-43326] = "fixed-version: only affects 6.12 onwards"
 
-# CVE-2026-43327 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43327] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43328 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43328] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43329 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43329] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43330 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43330] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43331 needs backporting (fixed from 7.0)
+# CVE-2026-43331 may need backporting (fixed from 6.6.143)
 
-# CVE-2026-43332 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43332] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43333 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43333] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43334 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43334] = "cpe-stable-backport: Backported in 6.6.134"
 
 CVE_STATUS[CVE-2026-43335] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-43336 may need backporting (fixed from 6.6.135)
+CVE_STATUS[CVE-2026-43336] = "cpe-stable-backport: Backported in 6.6.135"
 
 CVE_STATUS[CVE-2026-43337] = "fixed-version: only affects 6.11.3 onwards"
 
 # CVE-2026-43338 needs backporting (fixed from 7.0)
 
-# CVE-2026-43339 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43339] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43340 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43340] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43341 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43341] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43342 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43342] = "cpe-stable-backport: Backported in 6.6.134"
 
-# CVE-2026-43343 may need backporting (fixed from 6.6.134)
+CVE_STATUS[CVE-2026-43343] = "cpe-stable-backport: Backported in 6.6.134"
 
 # CVE-2026-43344 needs backporting (fixed from 7.0)
 
-# CVE-2026-43345 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43345] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-43346] = "fixed-version: only affects 6.12.11 onwards"
 
@@ -22952,7 +22972,7 @@ CVE_STATUS[CVE-2026-43348] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-43349] = "fixed-version: only affects 6.18.13 onwards"
 
-# CVE-2026-43350 may need backporting (fixed from 6.6.136)
+CVE_STATUS[CVE-2026-43350] = "cpe-stable-backport: Backported in 6.6.136"
 
 CVE_STATUS[CVE-2026-43351] = "fixed-version: only affects 6.14 onwards"
 
@@ -22962,71 +22982,71 @@ CVE_STATUS[CVE-2026-43351] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2026-43354] = "fixed-version: only affects 6.12 onwards"
 
-# CVE-2026-43355 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43355] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-43356] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-43357 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43357] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-43358] = "fixed-version: only affects 6.16.4 onwards"
 
-# CVE-2026-43359 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43359] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43360 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43360] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43361 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43361] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43362 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43362] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43363 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43363] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-43364] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-43365 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43365] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43366 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43366] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-43367] = "fixed-version: only affects 6.18.16 onwards"
 
-# CVE-2026-43368 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43368] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-43369] = "fixed-version: only affects 6.18.16 onwards"
 
-# CVE-2026-43370 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43370] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43371 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43371] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43372 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43372] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43373 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43373] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-43374] = "fixed-version: only affects 6.9 onwards"
 
 CVE_STATUS[CVE-2026-43375] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-43376 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43376] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43377 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43377] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43378 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43378] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43379 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43379] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43380 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43380] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43381 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43381] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43382 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43382] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43383 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43383] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-43384] = "fixed-version: only affects 6.7 onwards"
 
 CVE_STATUS[CVE-2026-43385] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-43386 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43386] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43387 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43387] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-43388] = "fixed-version: only affects 6.14 onwards"
 
@@ -23046,7 +23066,7 @@ CVE_STATUS[CVE-2026-43395] = "fixed-version: only affects 6.8 onwards"
 
 CVE_STATUS[CVE-2026-43396] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-43397 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43397] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-43398] = "fixed-version: only affects 6.16 onwards"
 
@@ -23062,27 +23082,27 @@ CVE_STATUS[CVE-2026-43403] = "fixed-version: only affects 6.12 onwards"
 
 CVE_STATUS[CVE-2026-43404] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-43405 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43405] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43406 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43406] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43407 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43407] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-43408] = "fixed-version: only affects 6.12.48 onwards"
 
-# CVE-2026-43409 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43409] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-43410] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-43411 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43411] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43412 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43412] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43413 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43413] = "cpe-stable-backport: Backported in 6.6.130"
 
 # CVE-2026-43414 may need backporting (fixed from 6.7)
 
-# CVE-2026-43415 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43415] = "cpe-stable-backport: Backported in 6.6.130"
 
 # CVE-2026-43416 needs backporting (fixed from 7.0)
 
@@ -23090,33 +23110,29 @@ CVE_STATUS[CVE-2026-43417] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-43418] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-43419 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43419] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43420 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43420] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43421 needs backporting (fixed from 7.0)
+# CVE-2026-43421 may need backporting (fixed from 6.6.143)
 
-CVE_STATUS[CVE-2026-43422] = "fixed-version: only affects 6.18.17 onwards"
+CVE_STATUS[CVE-2026-43424] = "cpe-stable-backport: Backported in 6.6.130"
 
-CVE_STATUS[CVE-2026-43423] = "fixed-version: only affects 6.18.17 onwards"
+CVE_STATUS[CVE-2026-43425] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43424 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43426] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43425 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43427] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43426 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43428] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43427 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43429] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43428 may need backporting (fixed from 6.6.130)
-
-# CVE-2026-43429 may need backporting (fixed from 6.6.130)
-
-# CVE-2026-43430 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43430] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-43431] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-43432 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43432] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-43433] = "fixed-version: only affects 6.18 onwards"
 
@@ -23124,17 +23140,17 @@ CVE_STATUS[CVE-2026-43434] = "fixed-version: only affects 6.18 onwards"
 
 CVE_STATUS[CVE-2026-43435] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-43436 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43436] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43437 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43437] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-43438] = "fixed-version: only affects 6.12 onwards"
 
-# CVE-2026-43439 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43439] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-43440] = "fixed-version: only affects 6.18.16 onwards"
 
-# CVE-2026-43441 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43441] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-43442] = "fixed-version: only affects 6.19 onwards"
 
@@ -23142,35 +23158,35 @@ CVE_STATUS[CVE-2026-43442] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-43444] = "fixed-version: only affects 6.12 onwards"
 
-# CVE-2026-43445 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43445] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-43446] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-43447] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-43448 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43448] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43449 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43449] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43450 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43450] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43451 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43451] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43452 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43452] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43453 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43453] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-43454] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-43455 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43455] = "cpe-stable-backport: Backported in 6.6.130"
 
 # CVE-2026-43456 needs backporting (fixed from 7.0)
 
-# CVE-2026-43457 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43457] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43458 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43458] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43459 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43459] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-43460] = "fixed-version: only affects 6.14 onwards"
 
@@ -23184,27 +23200,27 @@ CVE_STATUS[CVE-2026-43463] = "fixed-version: only affects 6.7.3 onwards"
 
 # CVE-2026-43465 may need backporting (fixed from 6.7)
 
-# CVE-2026-43466 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43466] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-43467] = "fixed-version: only affects 6.12.56 onwards"
 
-# CVE-2026-43468 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43468] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43469 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43469] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-43470] = "fixed-version: only affects 6.10 onwards"
 
-# CVE-2026-43471 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43471] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43472 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43472] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43473 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43473] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-43474] = "fixed-version: only affects 6.17 onwards"
 
-# CVE-2026-43475 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43475] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43476 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43476] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-43477] = "fixed-version: only affects 6.16 onwards"
 
@@ -23212,15 +23228,15 @@ CVE_STATUS[CVE-2026-43478] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-43479] = "fixed-version: only affects 6.17 onwards"
 
-# CVE-2026-43480 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43480] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-43481] = "fixed-version: only affects 6.13 onwards"
 
 CVE_STATUS[CVE-2026-43482] = "fixed-version: only affects 6.12 onwards"
 
-# CVE-2026-43483 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43483] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43484 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43484] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-43485] = "fixed-version: only affects 6.7 onwards"
 
@@ -23228,45 +23244,1947 @@ CVE_STATUS[CVE-2026-43486] = "fixed-version: only affects 6.9 onwards"
 
 CVE_STATUS[CVE-2026-43487] = "fixed-version: only affects 6.9 onwards"
 
-# CVE-2026-43488 may need backporting (fixed from 6.6.130)
+CVE_STATUS[CVE-2026-43488] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-43489] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-43490 may need backporting (fixed from 6.6.141)
+CVE_STATUS[CVE-2026-43490] = "cpe-stable-backport: Backported in 6.6.141"
 
-# CVE-2026-43491 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-43491] = "cpe-stable-backport: Backported in 6.6.140"
 
-# CVE-2026-43492 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-43492] = "cpe-stable-backport: Backported in 6.6.140"
 
-# CVE-2026-43493 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-43493] = "cpe-stable-backport: Backported in 6.6.140"
 
-# CVE-2026-43494 may need backporting (fixed from 6.6.141)
+CVE_STATUS[CVE-2026-43494] = "cpe-stable-backport: Backported in 6.6.141"
 
-# CVE-2026-43495 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-43495] = "cpe-stable-backport: Backported in 6.6.140"
 
-# CVE-2026-43496 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-43496] = "cpe-stable-backport: Backported in 6.6.140"
 
-# CVE-2026-43497 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-43497] = "cpe-stable-backport: Backported in 6.6.140"
 
 CVE_STATUS[CVE-2026-43498] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-43499 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-43499] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-43500] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-43501] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-43502] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-43503] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-45834] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-45835] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-45836] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-45837] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-45838] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-45839] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-45840] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-45841] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-45842] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-45843] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-45844] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-45845] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-45846] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-45847] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45848] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45849] = "cpe-stable-backport: Backported in 6.6.128"
+
+# CVE-2026-45850 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-45851] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45852] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45853] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-45854] = "fixed-version: only affects 6.15 onwards"
+
+# CVE-2026-45855 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-45856] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45857] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45858] = "cpe-stable-backport: Backported in 6.6.130"
+
+# CVE-2026-45859 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-45860] = "cpe-stable-backport: Backported in 6.6.128"
+
+# CVE-2026-45861 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-45862] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45863] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-45864] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45865] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45866] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45867] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45868] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45869] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45870] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45871] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45872] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45873] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45874] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-45875] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45876] = "fixed-version: only affects 6.13 onwards"
+
+# CVE-2026-45877 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-45878] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45879] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45880] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45881] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45882] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-45883] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45884] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-45885] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45886] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45887] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-45888] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-45889] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-45890] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45891] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45892] = "fixed-version: Fixed from version 6.1.168"
+
+# CVE-2026-45893 needs backporting (fixed from 7.0)
+
+# CVE-2026-45894 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-45895] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45896] = "fixed-version: only affects 6.17 onwards"
+
+# CVE-2026-45897 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-45898] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-45899] = "cpe-stable-backport: Backported in 6.6.130"
+
+CVE_STATUS[CVE-2026-45900] = "fixed-version: only affects 6.11 onwards"
+
+# CVE-2026-45901 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-45902] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45903] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-45904] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45905] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45906] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-45907] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-45908] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-45909] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-45910] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45911] = "cpe-stable-backport: Backported in 6.6.130"
+
+CVE_STATUS[CVE-2026-45912] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45913] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45914] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45915] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45916] = "cpe-stable-backport: Backported in 6.6.128"
+
+# CVE-2026-45917 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-45918] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-45919] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45920] = "cpe-stable-backport: Backported in 6.6.130"
+
+CVE_STATUS[CVE-2026-45921] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45922] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-45923] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45924] = "cpe-stable-backport: Backported in 6.6.130"
+
+CVE_STATUS[CVE-2026-45925] = "fixed-version: only affects 6.12.18 onwards"
+
+CVE_STATUS[CVE-2026-45926] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-45927] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-45928] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-45929] = "fixed-version: only affects 6.16 onwards"
+
+# CVE-2026-45930 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-45931] = "fixed-version: only affects 6.14 onwards"
+
+# CVE-2026-45932 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-45933] = "fixed-version: only affects 6.11 onwards"
+
+# CVE-2026-45934 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-45935] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45936] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45937] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-45938] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-45939] = "fixed-version: only affects 6.13 onwards"
+
+# CVE-2026-45940 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-45941] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45942] = "cpe-stable-backport: Backported in 6.6.130"
+
+# CVE-2026-45943 needs backporting (fixed from 7.0)
+
+# CVE-2026-45944 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-45945] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-45946] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45947] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45948] = "cpe-stable-backport: Backported in 6.6.128"
+
+# CVE-2026-45949 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-45950] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-45951] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-45952] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-45953] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-45954] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45955] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-45956] = "cpe-stable-backport: Backported in 6.6.130"
+
+CVE_STATUS[CVE-2026-45957] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45958] = "cpe-stable-backport: Backported in 6.6.130"
+
+CVE_STATUS[CVE-2026-45959] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-45960] = "cpe-stable-backport: Backported in 6.6.128"
+
+# CVE-2026-45961 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-45962] = "cpe-stable-backport: Backported in 6.6.128"
+
+# CVE-2026-45963 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-45964] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45965] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45966] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-45967] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-45968] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45969] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45970] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45971] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-45972] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45973] = "fixed-version: only affects 6.12.2 onwards"
+
+CVE_STATUS[CVE-2026-45974] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45975] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-45976] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45977] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-45978] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45979] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-45980] = "fixed-version: only affects 6.14.9 onwards"
+
+CVE_STATUS[CVE-2026-45981] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45982] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45983] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45984] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-45985] = "cpe-stable-backport: Backported in 6.6.130"
+
+CVE_STATUS[CVE-2026-45986] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-45987] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-45988] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-45989] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-45990] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-45991] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-45993] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-45994] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-45995] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-45996] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-45997] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-45998] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-45999] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46000] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46001] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-46002] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46003] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46004] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46005] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46006] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46007] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-46008] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-46009] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46010] = "fixed-version: only affects 6.16.9 onwards"
+
+CVE_STATUS[CVE-2026-46011] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46012] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46013] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-46014 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46015] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46016] = "cpe-stable-backport: Backported in 6.6.140"
+
+# CVE-2026-46017 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46018] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46019] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46020] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-46021] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46022] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46023] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46024] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46025] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-46026] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46027] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46028] = "cpe-stable-backport: Backported in 6.6.137"
+
+CVE_STATUS[CVE-2026-46029] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-46030] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-46031] = "cpe-stable-backport: Backported in 6.6.140"
+
+# CVE-2026-46032 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46033] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46034] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-46035] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-46036] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-46037] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46038] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46039] = "fixed-version: only affects 6.16.9 onwards"
+
+CVE_STATUS[CVE-2026-46040] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46041] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-46042] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-46043] = "cpe-stable-backport: Backported in 6.6.140"
+
+# CVE-2026-46044 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46045] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-46046] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46047] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46048] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46049] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46050] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46051] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46052] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46053] = "cpe-stable-backport: Backported in 6.6.140"
+
+# CVE-2026-46054 may need backporting (fixed from 6.6.144)
+
+CVE_STATUS[CVE-2026-46055] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-46056] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46057] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-46058] = "cpe-stable-backport: Backported in 6.6.140"
+
+# CVE-2026-46059 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46060] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-46061] = "fixed-version: only affects 6.12.31 onwards"
+
+CVE_STATUS[CVE-2026-46062] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46063] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46064] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46065] = "cpe-stable-backport: Backported in 6.6.140"
+
+# CVE-2026-46066 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46067] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-46068] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-46069] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46070] = "cpe-stable-backport: Backported in 6.6.140"
+
+# CVE-2026-46071 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46072] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46073] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-46074] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-46075] = "cpe-stable-backport: Backported in 6.6.140"
+
+# CVE-2026-46076 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46077] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46078] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46079] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46080] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46081] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-46082] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46083] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46084] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46085] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46086] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46087] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-46088] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46089] = "cpe-stable-backport: Backported in 6.6.140"
+
+# CVE-2026-46090 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46091] = "cpe-stable-backport: Backported in 6.6.140"
+
+# CVE-2026-46092 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46093] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-46094] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46095] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-46096] = "fixed-version: only affects 6.18.3 onwards"
+
+CVE_STATUS[CVE-2026-46097] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-46098] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46099] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46100] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-46101] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46102] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46103] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46104] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-46105] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-46106] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46107] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46108] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46109] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46110] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46111] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46112] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46113] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46114] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46115] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46116] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46117] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-46118] = "fixed-version: only affects 6.18.32 onwards"
+
+CVE_STATUS[CVE-2026-46119] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46120] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46121] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46122] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46123] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46124] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46125] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46126] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-46127] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46128] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46129] = "cpe-stable-backport: Backported in 6.6.140"
+
+# CVE-2026-46130 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-46131] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46132] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46133] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46134] = "fixed-version: only affects 6.14 onwards"
+
+# CVE-2026-46135 may need backporting (fixed from 6.6.144)
+
+CVE_STATUS[CVE-2026-46136] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46137] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-46138] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46139] = "fixed-version: only affects 6.12.23 onwards"
+
+# CVE-2026-46140 may need backporting (fixed from 6.6.144)
+
+CVE_STATUS[CVE-2026-46141] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-46142] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46143] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46144] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-46145] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-46146] = "cpe-stable-backport: Backported in 6.6.140"
+
+# CVE-2026-46147 needs backporting (fixed from 7.1)
+
+# CVE-2026-46148 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46149] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46150] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46151] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46152] = "cpe-stable-backport: Backported in 6.6.140"
+
+# CVE-2026-46153 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46154] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-46155] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46156] = "cpe-stable-backport: Backported in 6.6.140"
+
+# CVE-2026-46157 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46158] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-46159] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46160] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-46161] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46162] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-46163] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46164] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-46165] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46166] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-46167] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46168] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46169] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46170] = "cpe-stable-backport: Backported in 6.6.142"
+
+# CVE-2026-46171 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46172] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46173] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46174] = "cpe-stable-backport: Backported in 6.6.139"
+
+# CVE-2026-46175 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46176] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46177] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46178] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46179] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46180] = "cpe-stable-backport: Backported in 6.6.140"
+
+# CVE-2026-46181 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46182] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-46183] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-46184] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46185] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46186] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46187] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46188] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-46189] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46190] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46191] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46192] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-46193] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46194] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46195] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46196] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46197] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46198] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46199] = "cpe-stable-backport: Backported in 6.6.140"
+
+# CVE-2026-46200 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46201] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-46202] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-46203] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-46204] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46205] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46206] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46207] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-46208] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46209] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46210] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-46211] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-46212] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46213] = "fixed-version: only affects 6.15.6 onwards"
+
+CVE_STATUS[CVE-2026-46214] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46215] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-46216] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-46218] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46219] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46220] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46221] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-46222] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-46223] = "fixed-version: only affects 6.19.12 onwards"
+
+CVE_STATUS[CVE-2026-46224] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-46225] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46226] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46227] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46228] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-46229] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46230] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46231] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46232] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46233] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46234] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46235] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46236] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46238] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46239] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-46240] = "fixed-version: only affects 6.18.16 onwards"
+
+# CVE-2026-46241 needs backporting (fixed from 7.1)
+
+# CVE-2026-46242 may need backporting (fixed from 6.6.144)
+
+CVE_STATUS[CVE-2026-46243] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-46244] = "cpe-stable-backport: Backported in 6.6.142"
+
+# CVE-2026-46245 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-46246] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-46247] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-46248] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-46249] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-46250] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-46251] = "cpe-stable-backport: Backported in 6.6.128"
+
+# CVE-2026-46252 may need backporting (fixed from 6.6.144)
+
+CVE_STATUS[CVE-2026-46253] = "cpe-stable-backport: Backported in 6.6.128"
+
+# CVE-2026-46254 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-46255] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-46256] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-46257] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-46258] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-46259] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-46260] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-46261] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-46262] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-46263] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-46264] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-46265] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-46266] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-46267] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-46268] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-46269] = "fixed-version: only affects 6.15.10 onwards"
+
+CVE_STATUS[CVE-2026-46270] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-46271] = "fixed-version: only affects 6.16 onwards"
+
+# CVE-2026-46272 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-46273] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46274] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-46275] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-46276] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46277] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-46278] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-46279] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-46280] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46281] = "fixed-version: only affects 6.18 onwards"
+
+# CVE-2026-46282 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46283] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-46284] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-46285] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46286] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46287] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46288] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-46289] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46290] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-46291] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46292] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-46293] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46294] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46295] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-46296] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46297] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-46298] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-46299] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46300] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-46301] = "cpe-stable-backport: Backported in 6.6.140"
+
+# CVE-2026-46302 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46303] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46304] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46305] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-46306] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46307] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46308] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-46309] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-46310] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-46311] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-46312] = "cpe-stable-backport: Backported in 6.6.140"
+
+CVE_STATUS[CVE-2026-46313] = "fixed-version: only affects 6.10 onwards"
+
+# CVE-2026-46314 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-46315] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-46316] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-46317] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-46318] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-46319] = "cpe-stable-backport: Backported in 6.6.141"
+
+# CVE-2026-46320 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-46321 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-46322 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-46323] = "cpe-stable-backport: Backported in 6.6.142"
+
+# CVE-2026-46324 needs backporting (fixed from 7.1)
+
+# CVE-2026-46325 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-46326] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-46327] = "fixed-version: only affects 6.12.34 onwards"
+
+CVE_STATUS[CVE-2026-46328] = "cpe-stable-backport: Backported in 6.6.128"
+
+CVE_STATUS[CVE-2026-46329] = "fixed-version: only affects 6.12 onwards"
+
+# CVE-2026-46330 needs backporting (fixed from 7.0)
+
+# CVE-2026-46331 may need backporting (fixed from 6.6.144)
+
+CVE_STATUS[CVE-2026-46332] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-46333] = "cpe-stable-backport: Backported in 6.6.139"
+
+CVE_STATUS[CVE-2026-52904] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-52905] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-52906] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-52907] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-52908 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-52909 may need backporting (fixed from 6.6.144)
+
+# CVE-2026-52910 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-52911] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-52912] = "cpe-stable-backport: Backported in 6.6.142"
+
+# CVE-2026-52913 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-52914] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-52915] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-52916] = "cpe-stable-backport: Backported in 6.6.142"
+
+# CVE-2026-52917 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-52918] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-52919] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-52920] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-52921] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-52922] = "cpe-stable-backport: Backported in 6.6.142"
+
+# CVE-2026-52923 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-52924 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-52925] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-52926] = "cpe-stable-backport: Backported in 6.6.142"
+
+# CVE-2026-52927 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-52928 may need backporting (fixed from 6.6.144)
+
+# CVE-2026-52929 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-52930 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-52931] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-52932] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-52933] = "cpe-stable-backport: Backported in 6.6.140"
+
+# CVE-2026-52934 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-52935 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-52936] = "cpe-stable-backport: Backported in 6.6.141"
+
+# CVE-2026-52937 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-52938] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-52939 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-52940] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-52941] = "cpe-stable-backport: Backported in 6.6.142"
+
+# CVE-2026-52942 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-52943 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-52944 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-52945] = "fixed-version: only affects 6.15.3 onwards"
+
+# CVE-2026-52946 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-52947 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-52948 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-52949] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-52950] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-52951] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-52952] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-52953 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-52954] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-52955] = "cpe-stable-backport: Backported in 6.6.141"
+
+# CVE-2026-52956 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-52957] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-52958] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-52959] = "fixed-version: only affects 6.13.8 onwards"
+
+CVE_STATUS[CVE-2026-52960] = "fixed-version: only affects 6.15 onwards"
+
+# CVE-2026-52961 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-52962] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-52963] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-52964] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-52965] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-52966] = "fixed-version: only affects 6.18.32 onwards"
+
+CVE_STATUS[CVE-2026-52967] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-52968] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-52969] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-52970] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-52971] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-52972] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-52973] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-52974] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-52975] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-52976] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-52977] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-52978] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-52979] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-52980] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-52981] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-52982] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-52983] = "fixed-version: only affects 6.12.91 onwards"
+
+CVE_STATUS[CVE-2026-52984] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-52985] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-52986] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-52987] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-52988 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-52989] = "cpe-stable-backport: Backported in 6.6.141"
+
+# CVE-2026-52990 needs backporting (fixed from 7.1)
+
+# CVE-2026-52991 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-52992] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-52993] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-52994] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-52995] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-52996] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-52997] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-52998] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-52999] = "cpe-stable-backport: Backported in 6.6.141"
+
+# CVE-2026-53000 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53001] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53002] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53003] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53004] = "cpe-stable-backport: Backported in 6.6.141"
+
+# CVE-2026-53005 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53006] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53007] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-53008] = "fixed-version: only affects 6.18 onwards"
+
+# CVE-2026-53009 needs backporting (fixed from 7.1)
+
+# CVE-2026-53010 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-53011] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53012] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53013] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53014] = "fixed-version: only affects 6.8 onwards"
+
+# CVE-2026-53015 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53016] = "cpe-stable-backport: Backported in 6.6.141"
+
+# CVE-2026-53017 needs backporting (fixed from 7.1)
+
+# CVE-2026-53018 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53019] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-53020] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-53021] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53022] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53023] = "cpe-stable-backport: Backported in 6.6.141"
+
+# CVE-2026-53024 needs backporting (fixed from 7.1)
+
+# CVE-2026-53025 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53026] = "fixed-version: only affects 6.18.4 onwards"
+
+# CVE-2026-53027 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53028] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-53029] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-53030] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-53031] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-53032] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53033] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53034] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53035] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53036] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53037] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53038] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-53039] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53040] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53041] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53042] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-53043] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53044] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-53045] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53046] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53047] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53048] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53049] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53050] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53051] = "fixed-version: only affects 6.12.2 onwards"
+
+CVE_STATUS[CVE-2026-53052] = "cpe-stable-backport: Backported in 6.6.141"
+
+# CVE-2026-53053 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53054] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-53055] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-53056] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53057] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-53058] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53059] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53060] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53061] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53062] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53063] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53064] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53065] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53066] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53067] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-53068] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53069] = "cpe-stable-backport: Backported in 6.6.141"
+
+# CVE-2026-53070 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53071] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53072] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53073] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53074] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53075] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53076] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53077] = "cpe-stable-backport: Backported in 6.6.141"
+
+# CVE-2026-53078 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53079] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-53080 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53081] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-53082] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53083] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53084] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-53085] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-53086] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53087] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-53088] = "cpe-stable-backport: Backported in 6.6.141"
+
+# CVE-2026-53089 needs backporting (fixed from 7.1)
+
+# CVE-2026-53090 needs backporting (fixed from 7.1)
+
+# CVE-2026-53091 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53092] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-53093] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53094] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53095] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-53096] = "cpe-stable-backport: Backported in 6.6.141"
+
+# CVE-2026-53097 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53098] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53099] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-53100] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-53101] = "fixed-version: only affects 6.9 onwards"
+
+# CVE-2026-53102 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53103] = "fixed-version: only affects 6.11.2 onwards"
+
+CVE_STATUS[CVE-2026-53104] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-53105] = "fixed-version: only affects 6.11 onwards"
+
+# CVE-2026-53106 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53107] = "fixed-version: only affects 6.18.16 onwards"
+
+# CVE-2026-53108 needs backporting (fixed from 7.1)
+
+# CVE-2026-53109 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53110] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53111] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53112] = "cpe-stable-backport: Backported in 6.6.141"
+
+# CVE-2026-53113 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53114] = "fixed-version: only affects 6.14 onwards"
+
+# CVE-2026-53115 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53116] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-53117] = "cpe-stable-backport: Backported in 6.6.141"
+
+# CVE-2026-53118 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53119] = "fixed-version: only affects 6.11 onwards"
+
+# CVE-2026-53120 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53121] = "fixed-version: only affects 6.14 onwards"
+
+# CVE-2026-53122 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53123] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-53124] = "fixed-version: only affects 6.14.6 onwards"
+
+CVE_STATUS[CVE-2026-53125] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-53126] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53127] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-53128] = "cpe-stable-backport: Backported in 6.6.141"
+
+# CVE-2026-53129 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53130] = "cpe-stable-backport: Backported in 6.6.141"
+
+# CVE-2026-53131 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53132 needs backporting (fixed from 7.1)
+
+# CVE-2026-53133 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53134 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53135 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53136 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53137 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53138 may need backporting (fixed from 6.6.144)
+
+# CVE-2026-53139 may need backporting (fixed from 6.6.144)
+
+CVE_STATUS[CVE-2026-53140] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-53141] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-53142] = "fixed-version: only affects 6.8 onwards"
+
+# CVE-2026-53143 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53144 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53145] = "fixed-version: only affects 6.18.32 onwards"
+
+# CVE-2026-53146 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53147 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53148 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53149 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53150 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53151 may need backporting (fixed from 6.6.144)
+
+CVE_STATUS[CVE-2026-53152] = "fixed-version: only affects 6.12.78 onwards"
+
+CVE_STATUS[CVE-2026-53153] = "fixed-version: only affects 6.13 onwards"
+
+# CVE-2026-53154 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53155] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-53156 needs backporting (fixed from 7.1)
+
+# CVE-2026-53157 may need backporting (fixed from 6.6.144)
+
+# CVE-2026-53158 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53159 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53160 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53161 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53162] = "fixed-version: only affects 6.16 onwards"
+
+# CVE-2026-53163 may need backporting (fixed from 6.6.144)
+
+CVE_STATUS[CVE-2026-53164] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-53165] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-53166 may need backporting (fixed from 6.7)
+
+# CVE-2026-53167 may need backporting (fixed from 6.6.144)
+
+# CVE-2026-53168 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53169] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-53170] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-53171] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-53172] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-53173] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-53174] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-53175] = "fixed-version: only affects 6.12.93 onwards"
+
+# CVE-2026-53176 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53177 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53178 needs backporting (fixed from 7.1)
+
+# CVE-2026-53179 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53180] = "fixed-version: only affects 6.9 onwards"
+
+# CVE-2026-53181 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53182 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53183 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53184 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53185 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53186 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53187] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-53188] = "fixed-version: only affects 6.15 onwards"
+
+# CVE-2026-53189 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53190 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53191] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-53192] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-53193] = "fixed-version: only affects 6.12 onwards"
+
+# CVE-2026-53194 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53195 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53196 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53197] = "fixed-version: only affects 6.14 onwards"
+
+# CVE-2026-53198 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53199 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53200] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-53201] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-53202] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-53203] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-53204] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-53205] = "fixed-version: only affects 6.12.30 onwards"
+
+CVE_STATUS[CVE-2026-53206] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-53207 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53208 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53209 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53210] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-53211] = "fixed-version: only affects 6.18 onwards"
+
+# CVE-2026-53212 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53213 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53214 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53215 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53216 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53217 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53218 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53219 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53220 needs backporting (fixed from 7.1)
+
+# CVE-2026-53221 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53222] = "fixed-version: only affects 6.18 onwards"
+
+# CVE-2026-53223 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53224 needs backporting (fixed from 7.1)
+
+# CVE-2026-53225 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53226 needs backporting (fixed from 7.1)
+
+# CVE-2026-53227 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53228 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53229 needs backporting (fixed from 7.1)
+
+# CVE-2026-53230 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53231] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-53232 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53233] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-53234] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-53235] = "fixed-version: only affects 6.10 onwards"
+
+# CVE-2026-53236 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53237 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53238 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53239 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53240] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-53241] = "fixed-version: only affects 6.10 onwards"
+
+# CVE-2026-53242 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53243] = "fixed-version: only affects 7.0.10 onwards"
+
+CVE_STATUS[CVE-2026-53244] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-53245 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53246 needs backporting (fixed from 7.1)
+
+# CVE-2026-53247 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53248] = "fixed-version: only affects 6.15 onwards"
+
+# CVE-2026-53249 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53250] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-53251] = "fixed-version: only affects 6.12.2 onwards"
+
+# CVE-2026-53252 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53253 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53254 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53255 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53256 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53257] = "fixed-version: only affects 6.16 onwards"
+
+# CVE-2026-53258 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53259] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-53260] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-53261] = "fixed-version: only affects 6.7 onwards"
+
+# CVE-2026-53262 needs backporting (fixed from 7.1)
+
+# CVE-2026-53263 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53264 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53265 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53266 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53267 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53268 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53269 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53270 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53271 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53272 needs backporting (fixed from 7.1)
+
+# CVE-2026-53273 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53274 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53275 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53276] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-53277] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-53278] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-53279] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53280] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-53281] = "fixed-version: only affects 6.12.57 onwards"
+
+CVE_STATUS[CVE-2026-53282] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-53283] = "fixed-version: only affects 6.16 onwards"
+
+# CVE-2026-53284 needs backporting (fixed from 7.1)
+
+# CVE-2026-53285 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53286] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-53287] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53288] = "fixed-version: only affects 6.12.54 onwards"
+
+CVE_STATUS[CVE-2026-53289] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53290] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-53291] = "cpe-stable-backport: Backported in 6.6.141"
+
+# CVE-2026-53292 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53293] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53294] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53295] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53296] = "cpe-stable-backport: Backported in 6.6.141"
+
+# CVE-2026-53297 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53298] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-53299] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-53300] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-53301] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-53302] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-53303] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53304] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53305] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-53306] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53307] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-53308] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-53309] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53310] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-53311] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-53312] = "fixed-version: only affects 6.13 onwards"
+
+# CVE-2026-53313 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53314] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53315] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-53316] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-53317 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53318] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-53319] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-53320] = "cpe-stable-backport: Backported in 6.6.141"
+
+CVE_STATUS[CVE-2026-53321] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-53322] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-53323] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-53324] = "fixed-version: only affects 6.13 onwards"
+
+# CVE-2026-53325 may need backporting (fixed from 6.6.144)
+
+CVE_STATUS[CVE-2026-53326] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-53327 may need backporting (fixed from 6.6.144)
+
+CVE_STATUS[CVE-2026-53328] = "fixed-version: only affects 6.12 onwards"
+
+# CVE-2026-53329 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53330 needs backporting (fixed from 7.1)
+
+# CVE-2026-53331 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53332 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-53333] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-53334] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-53335] = "fixed-version: only affects 6.18 onwards"
+
+# CVE-2026-53336 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53337 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53338] = "fixed-version: only affects 6.16 onwards"
+
+# CVE-2026-53339 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53340] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-53341] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-53342] = "fixed-version: only affects 6.16 onwards"
+
+# CVE-2026-53343 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53344] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-53345 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53346] = "fixed-version: only affects 6.12 onwards"
+
+# CVE-2026-53347 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53348] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-53349 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53350 may need backporting (fixed from 6.6.143)
+
+CVE_STATUS[CVE-2026-53351] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-53352 may need backporting (fixed from 6.6.143)
+
+# CVE-2026-53353 may need backporting (fixed from 6.6.143)
 
-# CVE-2026-43500 may need backporting (fixed from 6.6.140)
+# CVE-2026-53354 may need backporting (fixed from 6.6.143)
 
-# CVE-2026-43501 may need backporting (fixed from 6.6.140)
+# CVE-2026-53355 may need backporting (fixed from 6.6.143)
 
-# CVE-2026-43502 may need backporting (fixed from 6.6.140)
+# CVE-2026-53356 may need backporting (fixed from 6.6.143)
 
-# CVE-2026-43503 may need backporting (fixed from 6.6.141)
+CVE_STATUS[CVE-2026-53357] = "cpe-stable-backport: Backported in 6.6.142"
 
-# CVE-2026-45834 may need backporting (fixed from 6.6.140)
+# CVE-2026-53358 may need backporting (fixed from 6.6.143)
 
-# CVE-2026-45835 may need backporting (fixed from 6.6.140)
+# CVE-2026-53359 may need backporting (fixed from 6.6.144)
 
-# CVE-2026-45836 may need backporting (fixed from 6.6.140)
+CVE_STATUS[CVE-2026-53360] = "fixed-version: only affects 6.10 onwards"
 
-# CVE-2026-46300 may need backporting (fixed from 6.6.141)
+# CVE-2026-53361 may need backporting (fixed from 6.6.144)
 
-# CVE-2026-46333 may need backporting (fixed from 6.6.139)
+# CVE-2026-53362 may need backporting (fixed from 6.6.144)
 

