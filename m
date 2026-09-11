Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC838C88E5C
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 22:15:49 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50887.1789164946992321927
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2026 15:15:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=BG/sBy9O;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912e2406so1710445e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 15:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789164945; x=1789769745; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IoqidnrdKQBRUlvFZnNfc8+4ASy/jL8Bpa5K2Cn3C5U=;
        b=BG/sBy9OfthefWgkh9e2zAOs1hrWq70lJ/ueVGStsnbFxV3Pdc/kihm6nqFGY4hbAG
         Qs01bF7p2HIqUHAHky3XGaUwBKu4oheRUNk+K4G6YKORSrOZe5UX1PXbpZwDS32e07mE
         XgUERnhIaU5Ro1FR/4oLJCdOVE6bYMN3c/07Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164945; x=1789769745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IoqidnrdKQBRUlvFZnNfc8+4ASy/jL8Bpa5K2Cn3C5U=;
        b=FREi6jTobTauLr6qr1iXhQ33HIhzgnzIvIjMybIyYdjS/cxHK6H+OOElgZGgZ4Ag2n
         CjGWmzCFPY4UvPstertzXWLEG9JbeK8gwIc5QJFQB7XtO7kOpTFF8tZLMvN/m7k79cw4
         N3w5QmKfmmpO2O2J2PFMluiyC0+XYFHzDvUlWVP89+j8j+fwBGWI4yp45IEqTWAlbfaQ
         xLMtnYthN6BS8x09EilGLETz9CAyrWibDmj7KsoRWI0d9Q1DoxO3iYC/UBnp+ns1eFHV
         ks/gNQ3m6jKJ81XeA/UjToMt3S03Sz+pb7YyncDFmtejCWFor2lHfAyGJ0f1NURzWRgD
         YeKw==
X-Gm-Message-State: AFuF++kz86c4fx2ESwqYZOUzDYSMbX02C9+PLlr5t+uQiZvpEPRr+XvS
	+b40uxQX8U0bHTm0hWZatOt2FjIN1ENjRxkR8JFuBEaOkXzXRcnFev2ItMbGSroH6uR49FTVFw2
	XfQrMSg8=
X-Gm-Gg: AYBFou0+yloXbrJy0ahlS27QQ8w/WM4KBTa4jwIHIIxM2/6LMzCfNsGSHDw23lu3+hx
	uRJMgXMTjieK3DmEk7MK7Td2ClcpBRV7c5lMQ05EjWx05BahARJPSXu6c6x8Ox2jpxBQobjAX4I
	FQoTHzKednW09kPil/nAizgMd2QoxV+ZdqzLcEnpoP/YSNsktSWeCGn2dGmVJh05A6NIrWKlK9/
	rJfQ699hkp2oJ9Y9wmcyishbr6yW7+eJEuCjoDHSyrW7pQtunmwa0FC3p7FFl/rTZ8oKZZkkmjX
	Nx0Wn5uV4u0OUJdJr8LISKeMCDOIUyUXASftvjTMZ3/+GfQFP51xYkEGztTKoAzTsJ5gd0GYue/
	j42wFhpcMVgS178t9mhQbWBcDuiCka1fA3kN6OzaOm5Xf8AFzmLK9S7IfwPe809QFu0N/Y6JHPW
	6PE4Tq/qn9zsU0DjG9kxMXgPL73dm4stKHmfjTF3DfIwJY4YWxpvWnndlTUSer/AjbBOd2S712j
	ej7SVIZ1b7t7XCr61Dh5Og3THnQjc65w3VlE/E8KCNqUj8UltvRJpvQyBgy3EezIb9pShgJ0us=
X-Received: by 2002:a05:600c:19cb:b0:49e:6581:7baf with SMTP id 5b1f17b1804b1-49e658188e3mr55283595e9.2.1789164943998;
        Fri, 11 Sep 2026 15:15:43 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm8434045e9.11.2026.09.11.15.15.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:15:43 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/13] linux-yocto/6.6: update CVE exclusions (6.6.151)
Date: Sat, 12 Sep 2026 00:14:55 +0200
Message-ID: <0298f0068f71ba4991ce1dca1c4e0a3e4bbe8be1.1789163914.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789163914.git.yoann.congal@smile.fr>
References: <cover.1789163914.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2026 22:15:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245674

From: Yoann Congal <yoann.congal@smile.fr>

$ ./meta/recipes-kernel/linux/generate-cve-exclusions.py .../cvelistV5/ 6.6.151 > meta/recipes-kernel/linux/cve-exclusion_6.6.inc

Generated at 2026-09-10 12:23:31.488006+00:00 for kernel version 6.6.151
From cvelistV5 cve_2026-09-10_1100Z-4-g5fc16492753

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../linux/cve-exclusion_6.6.inc               | 4540 ++++++++++++++++-
 1 file changed, 4465 insertions(+), 75 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
index fd17e611a4b..d2704e76449 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.6.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2026-07-23 08:09:32.765073+00:00 for kernel version 6.6.144
-# From cvelistV5 cve_2026-07-23_0700Z
+# Generated at 2026-09-10 12:23:31.488006+00:00 for kernel version 6.6.151
+# From cvelistV5 cve_2026-09-10_1100Z-4-g5fc16492753
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.6.144"
+    this_version = "6.6.151"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -1226,8 +1226,6 @@ CVE_STATUS[CVE-2021-47502] = "fixed-version: Fixed from version 5.16"
 
 CVE_STATUS[CVE-2021-47503] = "fixed-version: Fixed from version 5.16"
 
-CVE_STATUS[CVE-2021-47504] = "fixed-version: Fixed from version 5.16"
-
 CVE_STATUS[CVE-2021-47505] = "fixed-version: Fixed from version 5.16"
 
 CVE_STATUS[CVE-2021-47506] = "fixed-version: Fixed from version 5.16"
@@ -1480,7 +1478,7 @@ CVE_STATUS[CVE-2021-47643] = "fixed-version: Fixed from version 5.18"
 
 CVE_STATUS[CVE-2021-47644] = "fixed-version: Fixed from version 5.18"
 
-CVE_STATUS[CVE-2021-47645] = "fixed-version: Fixed from version 5.18"
+# CVE-2021-47645 has no known resolution
 
 CVE_STATUS[CVE-2021-47646] = "fixed-version: Fixed from version 5.18"
 
@@ -2028,8 +2026,6 @@ CVE_STATUS[CVE-2022-48875] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2022-48876] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2022-48877] = "fixed-version: Fixed from version 6.2"
-
 CVE_STATUS[CVE-2022-48878] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2022-48879] = "fixed-version: Fixed from version 6.2"
@@ -4198,6 +4194,8 @@ CVE_STATUS[CVE-2022-49998] = "fixed-version: Fixed from version 6.0"
 
 CVE_STATUS[CVE-2022-49999] = "fixed-version: Fixed from version 6.0"
 
+CVE_STATUS[CVE-2022-4994] = "fixed-version: Fixed from version 6.0"
+
 CVE_STATUS[CVE-2022-50000] = "fixed-version: Fixed from version 6.0"
 
 CVE_STATUS[CVE-2022-50001] = "fixed-version: Fixed from version 6.0"
@@ -5916,7 +5914,7 @@ CVE_STATUS[CVE-2023-52483] = "fixed-version: Fixed from version 6.6"
 
 CVE_STATUS[CVE-2023-52484] = "fixed-version: Fixed from version 6.6"
 
-# CVE-2023-52485 needs backporting (fixed from 6.8)
+CVE_STATUS[CVE-2023-52485] = "fixed-version: only affects 6.7 onwards"
 
 CVE_STATUS[CVE-2023-52486] = "cpe-stable-backport: Backported in 6.6.15"
 
@@ -6054,7 +6052,7 @@ CVE_STATUS[CVE-2023-52583] = "cpe-stable-backport: Backported in 6.6.16"
 
 CVE_STATUS[CVE-2023-52584] = "cpe-stable-backport: Backported in 6.6.16"
 
-CVE_STATUS[CVE-2023-52585] = "cpe-stable-backport: Backported in 6.6.32"
+CVE_STATUS[CVE-2023-52585] = "fixed-version: only affects 6.7 onwards"
 
 # CVE-2023-52586 needs backporting (fixed from 6.8)
 
@@ -9034,6 +9032,8 @@ CVE_STATUS[CVE-2023-7324] = "fixed-version: Fixed from version 6.3"
 
 CVE_STATUS[CVE-2024-14027] = "cpe-stable-backport: Backported in 6.6.133"
 
+# CVE-2024-14040 needs backporting (fixed from 6.12)
+
 CVE_STATUS[CVE-2024-26581] = "cpe-stable-backport: Backported in 6.6.17"
 
 CVE_STATUS[CVE-2024-26582] = "cpe-stable-backport: Backported in 6.6.18"
@@ -9852,7 +9852,7 @@ CVE_STATUS[CVE-2024-27008] = "cpe-stable-backport: Backported in 6.6.29"
 
 CVE_STATUS[CVE-2024-27009] = "cpe-stable-backport: Backported in 6.6.29"
 
-# CVE-2024-27010 needs backporting (fixed from 6.9)
+# CVE-2024-27010 may need backporting (fixed from 6.6.156)
 
 CVE_STATUS[CVE-2024-27011] = "cpe-stable-backport: Backported in 6.6.55"
 
@@ -11068,7 +11068,7 @@ CVE_STATUS[CVE-2024-39476] = "cpe-stable-backport: Backported in 6.6.34"
 
 CVE_STATUS[CVE-2024-39477] = "fixed-version: only affects 6.9 onwards"
 
-# CVE-2024-39478 needs backporting (fixed from 6.10)
+# CVE-2024-39478 may need backporting (fixed from 6.6.156)
 
 CVE_STATUS[CVE-2024-39479] = "cpe-stable-backport: Backported in 6.6.34"
 
@@ -12472,7 +12472,7 @@ CVE_STATUS[CVE-2024-46752] = "cpe-stable-backport: Backported in 6.6.51"
 
 CVE_STATUS[CVE-2024-46753] = "cpe-stable-backport: Backported in 6.6.87"
 
-# CVE-2024-46754 needs backporting (fixed from 6.11)
+# CVE-2024-46754 may need backporting (fixed from 6.6.156)
 
 CVE_STATUS[CVE-2024-46755] = "cpe-stable-backport: Backported in 6.6.51"
 
@@ -15134,9 +15134,9 @@ CVE_STATUS[CVE-2024-58092] = "fixed-version: only affects 6.8 onwards"
 
 CVE_STATUS[CVE-2024-58093] = "cpe-stable-backport: Backported in 6.6.87"
 
-# CVE-2024-58094 needs backporting (fixed from 6.15)
+# CVE-2024-58094 may need backporting (fixed from 6.6.156)
 
-# CVE-2024-58095 needs backporting (fixed from 6.15)
+# CVE-2024-58095 may need backporting (fixed from 6.6.156)
 
 CVE_STATUS[CVE-2024-58096] = "cpe-stable-backport: Backported in 6.6.123"
 
@@ -16088,7 +16088,7 @@ CVE_STATUS[CVE-2025-22102] = "cpe-stable-backport: Backported in 6.6.92"
 
 CVE_STATUS[CVE-2025-22103] = "cpe-stable-backport: Backported in 6.6.117"
 
-# CVE-2025-22104 needs backporting (fixed from 6.15)
+# CVE-2025-22104 may need backporting (fixed from 6.6.156)
 
 CVE_STATUS[CVE-2025-22105] = "cpe-stable-backport: Backported in 6.6.119"
 
@@ -17108,13 +17108,13 @@ CVE_STATUS[CVE-2025-38201] = "cpe-stable-backport: Backported in 6.6.124"
 
 CVE_STATUS[CVE-2025-38202] = "cpe-stable-backport: Backported in 6.6.95"
 
-# CVE-2025-38203 needs backporting (fixed from 6.16)
+# CVE-2025-38203 may need backporting (fixed from 6.6.156)
 
 # CVE-2025-38204 needs backporting (fixed from 6.16)
 
 CVE_STATUS[CVE-2025-38205] = "fixed-version: only affects 6.7 onwards"
 
-# CVE-2025-38206 needs backporting (fixed from 6.16)
+# CVE-2025-38206 may need backporting (fixed from 6.6.156)
 
 # CVE-2025-38207 needs backporting (fixed from 6.16)
 
@@ -17174,7 +17174,7 @@ CVE_STATUS[CVE-2025-38235] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2025-38236] = "cpe-stable-backport: Backported in 6.6.96"
 
-# CVE-2025-38237 needs backporting (fixed from 6.16)
+# CVE-2025-38237 may need backporting (fixed from 6.6.156)
 
 CVE_STATUS[CVE-2025-38238] = "fixed-version: only affects 6.14 onwards"
 
@@ -17748,7 +17748,7 @@ CVE_STATUS[CVE-2025-38523] = "fixed-version: only affects 6.12 onwards"
 
 CVE_STATUS[CVE-2025-38524] = "cpe-stable-backport: Backported in 6.6.100"
 
-CVE_STATUS[CVE-2025-38525] = "fixed-version: only affects 6.14 onwards"
+CVE_STATUS[CVE-2025-38525] = "cpe-stable-backport: Backported in 6.6.151"
 
 CVE_STATUS[CVE-2025-38526] = "cpe-stable-backport: Backported in 6.6.100"
 
@@ -18484,7 +18484,7 @@ CVE_STATUS[CVE-2025-39831] = "fixed-version: only affects 6.11 onwards"
 
 CVE_STATUS[CVE-2025-39832] = "cpe-stable-backport: Backported in 6.6.104"
 
-# CVE-2025-39833 needs backporting (fixed from 6.17)
+# CVE-2025-39833 may need backporting (fixed from 6.6.156)
 
 CVE_STATUS[CVE-2025-39834] = "fixed-version: only affects 6.12 onwards"
 
@@ -18616,7 +18616,7 @@ CVE_STATUS[CVE-2025-39899] = "fixed-version: only affects 6.8 onwards"
 
 CVE_STATUS[CVE-2025-39900] = "fixed-version: only affects 6.12 onwards"
 
-# CVE-2025-39901 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-39901] = "cpe-stable-backport: Backported in 6.6.148"
 
 CVE_STATUS[CVE-2025-39902] = "cpe-stable-backport: Backported in 6.6.105"
 
@@ -18664,7 +18664,7 @@ CVE_STATUS[CVE-2025-39923] = "cpe-stable-backport: Backported in 6.6.107"
 
 CVE_STATUS[CVE-2025-39924] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2025-39925 needs backporting (fixed from 6.17)
+# CVE-2025-39925 may need backporting (fixed from 6.6.156)
 
 CVE_STATUS[CVE-2025-39926] = "fixed-version: only affects 6.9 onwards"
 
@@ -18922,7 +18922,7 @@ CVE_STATUS[CVE-2025-40052] = "cpe-stable-backport: Backported in 6.6.112"
 
 CVE_STATUS[CVE-2025-40053] = "cpe-stable-backport: Backported in 6.6.112"
 
-# CVE-2025-40054 needs backporting (fixed from 6.18)
+# CVE-2025-40054 may need backporting (fixed from 6.6.153)
 
 CVE_STATUS[CVE-2025-40055] = "cpe-stable-backport: Backported in 6.6.112"
 
@@ -18942,7 +18942,7 @@ CVE_STATUS[CVE-2025-40062] = "cpe-stable-backport: Backported in 6.6.112"
 
 CVE_STATUS[CVE-2025-40063] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2025-40064 needs backporting (fixed from 6.18)
+# CVE-2025-40064 may need backporting (fixed from 6.6.156)
 
 # CVE-2025-40065 needs backporting (fixed from 6.18)
 
@@ -19018,7 +19018,7 @@ CVE_STATUS[CVE-2025-40100] = "cpe-stable-backport: Backported in 6.6.114"
 
 CVE_STATUS[CVE-2025-40101] = "fixed-version: only affects 6.7.11 onwards"
 
-# CVE-2025-40102 needs backporting (fixed from 6.18)
+# CVE-2025-40102 may need backporting (fixed from 6.6.156)
 
 CVE_STATUS[CVE-2025-40103] = "cpe-stable-backport: Backported in 6.6.114"
 
@@ -19090,7 +19090,7 @@ CVE_STATUS[CVE-2025-40137] = "cpe-stable-backport: Backported in 6.6.112"
 
 CVE_STATUS[CVE-2025-40138] = "fixed-version: only affects 6.17 onwards"
 
-# CVE-2025-40139 needs backporting (fixed from 6.18)
+# CVE-2025-40139 may need backporting (fixed from 6.6.156)
 
 CVE_STATUS[CVE-2025-40140] = "cpe-stable-backport: Backported in 6.6.112"
 
@@ -19146,7 +19146,7 @@ CVE_STATUS[CVE-2025-40166] = "fixed-version: only affects 6.8 onwards"
 
 CVE_STATUS[CVE-2025-40167] = "cpe-stable-backport: Backported in 6.6.114"
 
-# CVE-2025-40168 needs backporting (fixed from 6.18)
+# CVE-2025-40168 may need backporting (fixed from 6.6.156)
 
 CVE_STATUS[CVE-2025-40169] = "cpe-stable-backport: Backported in 6.6.112"
 
@@ -19424,7 +19424,7 @@ CVE_STATUS[CVE-2025-40305] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2025-40306] = "cpe-stable-backport: Backported in 6.6.117"
 
-# CVE-2025-40307 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-40307] = "cpe-stable-backport: Backported in 6.6.148"
 
 CVE_STATUS[CVE-2025-40308] = "cpe-stable-backport: Backported in 6.6.117"
 
@@ -19798,7 +19798,7 @@ CVE_STATUS[CVE-2025-68310] = "cpe-stable-backport: Backported in 6.6.117"
 
 CVE_STATUS[CVE-2025-68312] = "cpe-stable-backport: Backported in 6.6.117"
 
-CVE_STATUS[CVE-2025-68313] = "fixed-version: only affects 6.8 onwards"
+CVE_STATUS[CVE-2025-68313] = "fixed-version: only affects 6.6.156 onwards"
 
 CVE_STATUS[CVE-2025-68314] = "fixed-version: only affects 6.17 onwards"
 
@@ -20048,7 +20048,7 @@ CVE_STATUS[CVE-2025-68779] = "fixed-version: only affects 6.18 onwards"
 
 CVE_STATUS[CVE-2025-68780] = "cpe-stable-backport: Backported in 6.6.120"
 
-CVE_STATUS[CVE-2025-68781] = "cpe-stable-backport: Backported in 6.6.120"
+# CVE-2025-68781 needs backporting (fixed from 6.19)
 
 CVE_STATUS[CVE-2025-68782] = "cpe-stable-backport: Backported in 6.6.120"
 
@@ -20442,7 +20442,7 @@ CVE_STATUS[CVE-2025-71287] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2025-71288] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2025-71289 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2025-71289] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2025-71290] = "fixed-version: only affects 6.16 onwards"
 
@@ -20494,6 +20494,8 @@ CVE_STATUS[CVE-2025-71314] = "fixed-version: only affects 6.10 onwards"
 
 # CVE-2025-71315 needs backporting (fixed from 6.19)
 
+CVE_STATUS[CVE-2026-17523] = "fixed-version: Fixed from version 5.4"
+
 CVE_STATUS[CVE-2026-22976] = "cpe-stable-backport: Backported in 6.6.121"
 
 CVE_STATUS[CVE-2026-22977] = "cpe-stable-backport: Backported in 6.6.121"
@@ -21308,7 +21310,7 @@ CVE_STATUS[CVE-2026-23382] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23384] = "fixed-version: only affects 6.18 onwards"
 
-CVE_STATUS[CVE-2026-23385] = "fixed-version: only affects 6.10 onwards"
+CVE_STATUS[CVE-2026-23385] = "cpe-stable-backport: Backported in 6.6.151"
 
 CVE_STATUS[CVE-2026-23386] = "cpe-stable-backport: Backported in 6.6.130"
 
@@ -21456,7 +21458,7 @@ CVE_STATUS[CVE-2026-23457] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-23458] = "cpe-stable-backport: Backported in 6.6.130"
 
-CVE_STATUS[CVE-2026-23459] = "fixed-version: only affects 6.14 onwards"
+CVE_STATUS[CVE-2026-23459] = "fixed-version: only affects 6.6.153 onwards"
 
 CVE_STATUS[CVE-2026-23460] = "cpe-stable-backport: Backported in 6.6.130"
 
@@ -21516,8 +21518,6 @@ CVE_STATUS[CVE-2026-31402] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-31403] = "cpe-stable-backport: Backported in 6.6.130"
 
-CVE_STATUS[CVE-2026-31404] = "fixed-version: only affects 6.14 onwards"
-
 CVE_STATUS[CVE-2026-31405] = "cpe-stable-backport: Backported in 6.6.130"
 
 CVE_STATUS[CVE-2026-31406] = "fixed-version: only affects 6.11 onwards"
@@ -21712,7 +21712,7 @@ CVE_STATUS[CVE-2026-31500] = "cpe-stable-backport: Backported in 6.6.131"
 
 CVE_STATUS[CVE-2026-31501] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-31502 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-31502] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-31503] = "cpe-stable-backport: Backported in 6.6.131"
 
@@ -22512,7 +22512,7 @@ CVE_STATUS[CVE-2026-43117] = "cpe-stable-backport: Backported in 6.6.136"
 
 # CVE-2026-43118 needs backporting (fixed from 7.0)
 
-# CVE-2026-43119 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43119] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-43120] = "cpe-stable-backport: Backported in 6.6.136"
 
@@ -22704,7 +22704,7 @@ CVE_STATUS[CVE-2026-43214] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-43215] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-43216 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43216] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-43217] = "fixed-version: only affects 6.15 onwards"
 
@@ -23180,7 +23180,7 @@ CVE_STATUS[CVE-2026-43454] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2026-43455] = "cpe-stable-backport: Backported in 6.6.130"
 
-# CVE-2026-43456 needs backporting (fixed from 7.0)
+CVE_STATUS[CVE-2026-43456] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-43457] = "cpe-stable-backport: Backported in 6.6.130"
 
@@ -23534,7 +23534,7 @@ CVE_STATUS[CVE-2026-45960] = "cpe-stable-backport: Backported in 6.6.128"
 
 CVE_STATUS[CVE-2026-45962] = "cpe-stable-backport: Backported in 6.6.128"
 
-# CVE-2026-45963 needs backporting (fixed from 7.0)
+# CVE-2026-45963 may need backporting (fixed from 6.6.156)
 
 CVE_STATUS[CVE-2026-45964] = "cpe-stable-backport: Backported in 6.6.128"
 
@@ -23994,8 +23994,6 @@ CVE_STATUS[CVE-2026-46192] = "fixed-version: only affects 6.17 onwards"
 
 CVE_STATUS[CVE-2026-46193] = "cpe-stable-backport: Backported in 6.6.140"
 
-CVE_STATUS[CVE-2026-46194] = "cpe-stable-backport: Backported in 6.6.140"
-
 CVE_STATUS[CVE-2026-46195] = "cpe-stable-backport: Backported in 6.6.140"
 
 CVE_STATUS[CVE-2026-46196] = "cpe-stable-backport: Backported in 6.6.140"
@@ -24516,7 +24514,7 @@ CVE_STATUS[CVE-2026-53023] = "cpe-stable-backport: Backported in 6.6.141"
 
 CVE_STATUS[CVE-2026-53026] = "fixed-version: only affects 6.18.4 onwards"
 
-# CVE-2026-53027 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53027] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-53028] = "fixed-version: only affects 6.18 onwards"
 
@@ -24640,9 +24638,9 @@ CVE_STATUS[CVE-2026-53087] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2026-53088] = "cpe-stable-backport: Backported in 6.6.141"
 
-# CVE-2026-53089 needs backporting (fixed from 7.1)
+# CVE-2026-53089 may need backporting (fixed from 6.6.156)
 
-# CVE-2026-53090 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53090] = "cpe-stable-backport: Backported in 6.6.148"
 
 # CVE-2026-53091 needs backporting (fixed from 7.1)
 
@@ -25124,7 +25122,7 @@ CVE_STATUS[CVE-2026-53329] = "cpe-stable-backport: Backported in 6.6.143"
 
 CVE_STATUS[CVE-2026-53331] = "cpe-stable-backport: Backported in 6.6.143"
 
-# CVE-2026-53332 needs backporting (fixed from 7.1)
+CVE_STATUS[CVE-2026-53332] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-53333] = "fixed-version: only affects 6.18 onwards"
 
@@ -25244,9 +25242,9 @@ CVE_STATUS[CVE-2026-53390] = "cpe-stable-backport: Backported in 6.6.144"
 
 CVE_STATUS[CVE-2026-53391] = "cpe-stable-backport: Backported in 6.6.144"
 
-# CVE-2026-53392 needs backporting (fixed from 7.2rc1)
+CVE_STATUS[CVE-2026-53392] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-53393 needs backporting (fixed from 7.2rc1)
+CVE_STATUS[CVE-2026-53393] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-53394] = "fixed-version: only affects 6.10 onwards"
 
@@ -25258,13 +25256,13 @@ CVE_STATUS[CVE-2026-53397] = "cpe-stable-backport: Backported in 6.6.144"
 
 CVE_STATUS[CVE-2026-53398] = "cpe-stable-backport: Backported in 6.6.144"
 
-# CVE-2026-53399 needs backporting (fixed from 7.2rc1)
+CVE_STATUS[CVE-2026-53399] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-53400 needs backporting (fixed from 7.2rc1)
+CVE_STATUS[CVE-2026-53400] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-53401 needs backporting (fixed from 7.2rc1)
+# CVE-2026-53401 needs backporting (fixed from 7.2)
 
-# CVE-2026-53402 needs backporting (fixed from 7.2rc1)
+CVE_STATUS[CVE-2026-53402] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-53403] = "cpe-stable-backport: Backported in 6.6.144"
 
@@ -25292,9 +25290,9 @@ CVE_STATUS[CVE-2026-63803] = "cpe-stable-backport: Backported in 6.6.144"
 
 CVE_STATUS[CVE-2026-63804] = "cpe-stable-backport: Backported in 6.6.144"
 
-# CVE-2026-63805 needs backporting (fixed from 7.2rc1)
+# CVE-2026-63805 needs backporting (fixed from 7.2)
 
-# CVE-2026-63806 needs backporting (fixed from 7.2rc1)
+CVE_STATUS[CVE-2026-63806] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-63807] = "cpe-stable-backport: Backported in 6.6.144"
 
@@ -25302,9 +25300,9 @@ CVE_STATUS[CVE-2026-63808] = "cpe-stable-backport: Backported in 6.6.144"
 
 CVE_STATUS[CVE-2026-63809] = "cpe-stable-backport: Backported in 6.6.144"
 
-# CVE-2026-63810 needs backporting (fixed from 7.2rc1)
+CVE_STATUS[CVE-2026-63810] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-63811 needs backporting (fixed from 7.2rc1)
+# CVE-2026-63811 needs backporting (fixed from 7.2)
 
 CVE_STATUS[CVE-2026-63812] = "cpe-stable-backport: Backported in 6.6.144"
 
@@ -25312,15 +25310,15 @@ CVE_STATUS[CVE-2026-63813] = "fixed-version: only affects 7.0 onwards"
 
 CVE_STATUS[CVE-2026-63814] = "cpe-stable-backport: Backported in 6.6.144"
 
-# CVE-2026-63815 needs backporting (fixed from 7.2rc1)
+CVE_STATUS[CVE-2026-63815] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-63816 needs backporting (fixed from 7.2rc1)
+CVE_STATUS[CVE-2026-63816] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-63817] = "cpe-stable-backport: Backported in 6.6.144"
 
-# CVE-2026-63818 needs backporting (fixed from 7.2rc1)
+CVE_STATUS[CVE-2026-63818] = "cpe-stable-backport: Backported in 6.6.145"
 
-# CVE-2026-63819 needs backporting (fixed from 7.2rc1)
+# CVE-2026-63819 needs backporting (fixed from 7.2)
 
 CVE_STATUS[CVE-2026-63820] = "fixed-version: only affects 7.0 onwards"
 
@@ -25332,7 +25330,7 @@ CVE_STATUS[CVE-2026-63823] = "cpe-stable-backport: Backported in 6.6.144"
 
 CVE_STATUS[CVE-2026-63824] = "cpe-stable-backport: Backported in 6.6.144"
 
-# CVE-2026-63825 needs backporting (fixed from 7.2rc1)
+# CVE-2026-63825 needs backporting (fixed from 7.2)
 
 CVE_STATUS[CVE-2026-63826] = "cpe-stable-backport: Backported in 6.6.144"
 
@@ -25340,7 +25338,7 @@ CVE_STATUS[CVE-2026-63827] = "cpe-stable-backport: Backported in 6.6.144"
 
 CVE_STATUS[CVE-2026-63828] = "cpe-stable-backport: Backported in 6.6.144"
 
-# CVE-2026-63829 needs backporting (fixed from 7.2rc1)
+CVE_STATUS[CVE-2026-63829] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-63830] = "cpe-stable-backport: Backported in 6.6.144"
 
@@ -25426,8 +25424,6 @@ CVE_STATUS[CVE-2026-63870] = "cpe-stable-backport: Backported in 6.6.143"
 
 # CVE-2026-63871 needs backporting (fixed from 7.1)
 
-# CVE-2026-63872 needs backporting (fixed from 7.1)
-
 CVE_STATUS[CVE-2026-63873] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2026-63874] = "fixed-version: only affects 6.15 onwards"
@@ -25822,7 +25818,7 @@ CVE_STATUS[CVE-2026-64068] = "fixed-version: only affects 6.10 onwards"
 
 CVE_STATUS[CVE-2026-64069] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2026-64070 needs backporting (fixed from 7.1)
+# CVE-2026-64070 may need backporting (fixed from 6.6.156)
 
 CVE_STATUS[CVE-2026-64071] = "fixed-version: only affects 6.13 onwards"
 
@@ -25846,7 +25842,7 @@ CVE_STATUS[CVE-2026-64080] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2026-64081] = "fixed-version: only affects 6.15 onwards"
 
-# CVE-2026-64082 needs backporting (fixed from 7.1)
+# CVE-2026-64082 may need backporting (fixed from 6.6.156)
 
 CVE_STATUS[CVE-2026-64083] = "cpe-stable-backport: Backported in 6.6.142"
 
@@ -25998,8 +25994,6 @@ CVE_STATUS[CVE-2026-64156] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2026-64157] = "fixed-version: only affects 6.10.8 onwards"
 
-CVE_STATUS[CVE-2026-64158] = "fixed-version: only affects 6.8 onwards"
-
 CVE_STATUS[CVE-2026-64159] = "fixed-version: only affects 6.10.8 onwards"
 
 # CVE-2026-64160 needs backporting (fixed from 7.1)
@@ -26056,23 +26050,4419 @@ CVE_STATUS[CVE-2026-64185] = "cpe-stable-backport: Backported in 6.6.142"
 
 CVE_STATUS[CVE-2026-64186] = "fixed-version: only affects 6.17 onwards"
 
-# CVE-2026-64187 needs backporting (fixed from 7.2rc4)
+CVE_STATUS[CVE-2026-64187] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-64188] = "cpe-stable-backport: Backported in 6.6.144"
 
-# CVE-2026-64189 needs backporting (fixed from 7.2rc2)
+CVE_STATUS[CVE-2026-64189] = "cpe-stable-backport: Backported in 6.6.145"
 
 # CVE-2026-64190 needs backporting (fixed from 7.1)
 
 CVE_STATUS[CVE-2026-64191] = "cpe-stable-backport: Backported in 6.6.144"
 
-# CVE-2026-64192 needs backporting (fixed from 7.2rc2)
+CVE_STATUS[CVE-2026-64192] = "cpe-stable-backport: Backported in 6.6.148"
 
-# CVE-2026-64205 needs backporting (fixed from 7.2rc1)
+CVE_STATUS[CVE-2026-64205] = "cpe-stable-backport: Backported in 6.6.148"
 
-# CVE-2026-64206 needs backporting (fixed from 7.2rc3)
+CVE_STATUS[CVE-2026-64206] = "cpe-stable-backport: Backported in 6.6.145"
 
 CVE_STATUS[CVE-2026-64207] = "fixed-version: only affects 6.17 onwards"
 
-# CVE-2026-64600 needs backporting (fixed from 7.2rc4)
+CVE_STATUS[CVE-2026-64208] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-64209] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-64210 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-64211] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-64212 needs backporting (fixed from 7.1)
+
+# CVE-2026-64213 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-64214] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64215] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-64216] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-64217] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64218] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64219] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64220] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64221] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64222] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-64223] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-64224] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-64225] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-64226] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-64227] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-64228] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-64229] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-64230] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-64231] = "cpe-stable-backport: Backported in 6.6.142"
+
+CVE_STATUS[CVE-2026-64232] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-64233] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-64234] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-64235] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-64236] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-64237] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-64238] = "fixed-version: only affects 6.19.12 onwards"
+
+CVE_STATUS[CVE-2026-64239] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-64240] = "cpe-stable-backport: Backported in 6.6.143"
+
+# CVE-2026-64241 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-64242] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-64243] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-64244] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-64245] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-64246] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-64247] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-64248] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64249] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-64250] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64251] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-64252] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-64253] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-64254] = "cpe-stable-backport: Backported in 6.6.144"
+
+# CVE-2026-64255 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-64256] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-64257] = "fixed-version: Fixed from version 5.16"
+
+CVE_STATUS[CVE-2026-64258] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-64259] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-64260] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-64261] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-64262] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-64263] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-64264] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-64265] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-64266] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64267] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-64268] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64269] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64270] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64271] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64272] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64273] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64274] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64275] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64276] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64277] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64278] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-64279] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64280] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-64281] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-64282] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-64283] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-64284] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-64285] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-64286] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64287] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64288] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-64289] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-64290] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-64291] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-64292] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-64293] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-64294] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64295] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-64296] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64297] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64298] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64299] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64300] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-64301] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64302] = "fixed-version: only affects 6.18.7 onwards"
+
+CVE_STATUS[CVE-2026-64303] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64304] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-64305 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-64306] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64307] = "fixed-version: only affects 6.12.75 onwards"
+
+CVE_STATUS[CVE-2026-64308] = "fixed-version: only affects 6.12.75 onwards"
+
+CVE_STATUS[CVE-2026-64309] = "fixed-version: only affects 6.12.75 onwards"
+
+CVE_STATUS[CVE-2026-64310] = "fixed-version: only affects 6.12.75 onwards"
+
+CVE_STATUS[CVE-2026-64311] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-64312] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64313] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64314] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-64315] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64316] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64317] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64318] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64319] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-64320 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-64321] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-64322] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64323] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64324] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64325] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-64326] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64327] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-64328] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-64329] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64330] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64331] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64332] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64333] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64334] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64335] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64336] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64337] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64338] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64339] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-64340] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-64341 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-64342] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64343] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64344] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64345] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64346] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64347] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64348] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64349] = "fixed-version: only affects 6.18.32 onwards"
+
+CVE_STATUS[CVE-2026-64350] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64351] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64352] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64353] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-64354] = "fixed-version: only affects 6.11.6 onwards"
+
+CVE_STATUS[CVE-2026-64355] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64356] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-64357] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-64358] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64359] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64360] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64361] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64362] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64363] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64364] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64365] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64366] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-64367] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-64368] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64369] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-64370] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64371] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64372] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64373] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64374] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64375] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64376] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-64377 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-64378] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64379] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64380] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64381] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64382] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64383] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64384] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64385] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64386] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64387] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-64388 needs backporting (fixed from 7.2)
+
+# CVE-2026-64389 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-64390] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-64391 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-64392] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64393] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64394] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64395] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64396] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64397] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64398] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64399] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-64400 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-64401] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64402] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64403] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64404] = "fixed-version: only affects 6.12.6 onwards"
+
+CVE_STATUS[CVE-2026-64405] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64406] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64407] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64408] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64409] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64410] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-64411] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64412] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64413] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64414] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-64415] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-64416] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-64417] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64418] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-64419] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64420] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64421] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64422] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64423] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-64424 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-64425] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64426] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-64427] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-64428] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64429] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64430] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64431] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-64432] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64433] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64434] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64435] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64436] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64437] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64438] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64439] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-64440] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64441] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64442] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64443] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64444] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64445] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64446] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64447] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-64448] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64449] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64450] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64451] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-64452] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64453] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-64454] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64455] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64456] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64457] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-64458] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64459] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-64460] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-64461] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64462] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64463] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64464] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-64465] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64466] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-64467] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-64468] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64469] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64470] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64471] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64472] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64473] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-64474] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64475] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64476] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64477] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-64478] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64479] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64480] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-64481 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-64482] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64483] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64484] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64485] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-64486] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64487] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64488] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64489] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64490] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-64491] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-64492] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-64493] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64494] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64495] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64496] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64497] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64498] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-64499] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-64500] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64501] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-64502] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-64503] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64504] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64505] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64506] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-64507] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64508] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64509] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-64510] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64511] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64512] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-64513 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-64514] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64515] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-64516] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-64517] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-64518] = "fixed-version: only affects 6.12.5 onwards"
+
+CVE_STATUS[CVE-2026-64519] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-64520] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-64521] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-64522] = "fixed-version: only affects 6.17.4 onwards"
+
+# CVE-2026-64523 needs backporting (fixed from 7.1)
+
+CVE_STATUS[CVE-2026-64524] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-64525] = "fixed-version: only affects 6.12.83 onwards"
+
+CVE_STATUS[CVE-2026-64526] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-64527] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-64528] = "cpe-stable-backport: Backported in 6.6.143"
+
+CVE_STATUS[CVE-2026-64529] = "cpe-stable-backport: Backported in 6.6.144"
+
+CVE_STATUS[CVE-2026-64530] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64531] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64532] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64533] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64534] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64535] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64536] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64537] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64538] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-64539 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-64540] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64541] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64542] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-64543] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64544] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64545] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64546] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64547] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64548] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64549] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64550] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64551] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64552] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64553] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64554] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64555] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-64556] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64557] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64558] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-64559] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-64560] = "cpe-stable-backport: Backported in 6.6.147"
+
+CVE_STATUS[CVE-2026-64561] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-64562] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-64563] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-64564] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-64565] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-64566] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-64567] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-64568] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-64569] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-64570] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-64571] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-64572] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-64573] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-64574] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-64575] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-64576] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-64577] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-64578] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-64579] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-64580] = "cpe-stable-backport: Backported in 6.6.148"
+
+# CVE-2026-64581 may need backporting (fixed from 6.6.154)
+
+CVE_STATUS[CVE-2026-64582] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64583] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-64584] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-64585] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64586] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-64587] = "cpe-stable-backport: Backported in 6.6.130"
+
+CVE_STATUS[CVE-2026-64588] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-64589] = "fixed-version: only affects 6.12.11 onwards"
+
+CVE_STATUS[CVE-2026-64590] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-64591] = "fixed-version: only affects 6.18.20 onwards"
+
+CVE_STATUS[CVE-2026-64592] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-64593] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64594] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64595] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-64596] = "fixed-version: only affects 6.15.6 onwards"
+
+CVE_STATUS[CVE-2026-64597] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64598] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64599] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64600] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64601] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-64602] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-64603] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-64604] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-68081 needs backporting (fixed from 7.2)
+
+# CVE-2026-68082 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-68083 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-68084] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-68085] = "fixed-version: only affects 6.12.92 onwards"
+
+# CVE-2026-68086 has no known resolution
+
+CVE_STATUS[CVE-2026-68087] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-68088] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-68089] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-68090] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-68091] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-68092] = "fixed-version: only affects 6.12.5 onwards"
+
+CVE_STATUS[CVE-2026-68093] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68094] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-68095] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-68096] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68097] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68098] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68099] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68100] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68102] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68103] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-68104] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68105] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-68106] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68107] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68108] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68109] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-68110] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68111] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68112] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68113] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-68114] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-68115] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68116] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68117] = "cpe-stable-backport: Backported in 6.6.148"
+
+# CVE-2026-68118 may need backporting (fixed from 6.6.153)
+
+CVE_STATUS[CVE-2026-68119] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-68120] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-68121] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68122] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-68123] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68124] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68125] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68126] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68127] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68128] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-68129] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-68130] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68131] = "cpe-stable-backport: Backported in 6.6.148"
+
+# CVE-2026-68132 may need backporting (fixed from 6.6.153)
+
+CVE_STATUS[CVE-2026-68133] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-68134] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-68135] = "cpe-stable-backport: Backported in 6.6.148"
+
+# CVE-2026-68136 may need backporting (fixed from 6.6.153)
+
+CVE_STATUS[CVE-2026-68137] = "cpe-stable-backport: Backported in 6.6.148"
+
+# CVE-2026-68138 may need backporting (fixed from 6.6.153)
+
+CVE_STATUS[CVE-2026-68139] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-68140] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68141] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68142] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68143] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68144] = "cpe-stable-backport: Backported in 6.6.148"
+
+# CVE-2026-68145 may need backporting (fixed from 6.6.153)
+
+CVE_STATUS[CVE-2026-68146] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68147] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68148] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68149] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68150] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-68151] = "cpe-stable-backport: Backported in 6.6.148"
+
+# CVE-2026-68152 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-68153] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68154] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68155] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68156] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68157] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68158] = "cpe-stable-backport: Backported in 6.6.148"
+
+# CVE-2026-68159 may need backporting (fixed from 6.6.153)
+
+CVE_STATUS[CVE-2026-68160] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68161] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-68162] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-68163] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-68164] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68165] = "cpe-stable-backport: Backported in 6.6.148"
+
+# CVE-2026-68166 may need backporting (fixed from 6.6.153)
+
+CVE_STATUS[CVE-2026-68167] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-68168] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-68169] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-68170] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-68172] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-68173] = "fixed-version: only affects 6.14.6 onwards"
+
+CVE_STATUS[CVE-2026-68174] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-68175] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68176] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68177] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-68178] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-68179] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-68180] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68181] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68182] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68183] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-68184] = "cpe-stable-backport: Backported in 6.6.148"
+
+# CVE-2026-68185 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-68186] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68187] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68188] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68189] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68190] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68191] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-68192] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68193] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-68194] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68195] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68196] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68197] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68198] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-68199] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68200] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-68201] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-68202] = "cpe-stable-backport: Backported in 6.6.148"
+
+# CVE-2026-68203 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-68204] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68205] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-68206] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68207] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68208] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-68209] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68210] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68211] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-68212] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68213] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68214] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68215] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68216] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68217] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68218] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68219] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68220] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68221] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-68222] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68223] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68224] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-68225] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-68226] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68227] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68228] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-68229] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68230] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-68231] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68232] = "fixed-version: only affects 6.15 onwards"
+
+# CVE-2026-68233 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-68234] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68235] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-68236] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68237] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-68238 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-68239] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-68240] = "fixed-version: only affects 6.18 onwards"
+
+# CVE-2026-68241 needs backporting (fixed from 7.2)
+
+# CVE-2026-68242 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-68243] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68244] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68245] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-68246] = "cpe-stable-backport: Backported in 6.6.148"
+
+# CVE-2026-68247 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-68248] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68249] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68250] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68251] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68252] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-68253] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-68254] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-68255] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68256] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68257] = "fixed-version: only affects 6.12.59 onwards"
+
+# CVE-2026-68258 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-68259] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68260] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-68261] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-68262] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-68263] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-68264] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-68265] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-68266] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-68267] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-68268] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-68269] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68270] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-68271] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68272] = "cpe-stable-backport: Backported in 6.6.148"
+
+# CVE-2026-68273 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-68274] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-68275] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-68276] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-68277] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68278] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68279] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68280] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68281] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-68282] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-68283] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-68284] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68285] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-68286 needs backporting (fixed from 7.2)
+
+# CVE-2026-68287 needs backporting (fixed from 7.2)
+
+# CVE-2026-68288 needs backporting (fixed from 7.2)
+
+# CVE-2026-68289 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-68290] = "fixed-version: only affects 6.12.10 onwards"
+
+CVE_STATUS[CVE-2026-68291] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-68292] = "fixed-version: only affects 6.18 onwards"
+
+# CVE-2026-68293 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-68294] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68295] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-68296] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-68297] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68298] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-68299] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68300] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68301] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68302] = "cpe-stable-backport: Backported in 6.6.148"
+
+# CVE-2026-68303 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-68304] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68305] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-68306] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68307] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-68308] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68309] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68310] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68311] = "fixed-version: only affects 6.11 onwards"
+
+# CVE-2026-68312 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-68313] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68314] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-68315] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68316] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-68317] = "cpe-stable-backport: Backported in 6.6.148"
+
+# CVE-2026-68318 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-68319] = "fixed-version: only affects 6.8.7 onwards"
+
+CVE_STATUS[CVE-2026-68320] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68321] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-68322] = "cpe-stable-backport: Backported in 6.6.151"
+
+# CVE-2026-68323 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-68324] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68325] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68326] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68327] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68328] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68329] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68330] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-68331] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68332] = "fixed-version: only affects 6.18.6 onwards"
+
+CVE_STATUS[CVE-2026-68333] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68334] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-68335] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68336] = "cpe-stable-backport: Backported in 6.6.148"
+
+# CVE-2026-68337 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-68338] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68339] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68340] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68341] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-68342] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-68343] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68344] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68345] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-68346] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-68347] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-68348] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68349] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68350] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68351] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68352] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68353] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68354] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68355] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68356] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-68357] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68358] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-68359] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68360] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68361] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68362] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68363] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68364] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-68365] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68366] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68367] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-68368] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68369] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68370] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68371] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-68372] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-68373] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68374] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-68375] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-68376] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68377] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68378] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-68379] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-68380] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-68381] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68382] = "fixed-version: only affects 6.10.14 onwards"
+
+CVE_STATUS[CVE-2026-68383] = "fixed-version: only affects 6.12.43 onwards"
+
+CVE_STATUS[CVE-2026-68384] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-68385] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-68386] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68387] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-68388] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68389] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68390] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-68391] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68392] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68393] = "fixed-version: only affects 6.12.28 onwards"
+
+CVE_STATUS[CVE-2026-68394] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-68395] = "cpe-stable-backport: Backported in 6.6.148"
+
+# CVE-2026-68396 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-68397] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68398] = "cpe-stable-backport: Backported in 6.6.148"
+
+# CVE-2026-68399 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-68400] = "fixed-version: only affects 6.7 onwards"
+
+# CVE-2026-68401 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-68402] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68403] = "cpe-stable-backport: Backported in 6.6.148"
+
+# CVE-2026-68404 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-68405] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68406] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68407] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68408] = "fixed-version: only affects 6.12.78 onwards"
+
+# CVE-2026-68409 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-68410] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68411] = "cpe-stable-backport: Backported in 6.6.148"
+
+# CVE-2026-68412 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-68413] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68414] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68415] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-68416] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68417] = "cpe-stable-backport: Backported in 6.6.148"
+
+# CVE-2026-68418 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-68419] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68420] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-68421] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-68422] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68423] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-68424] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-68425] = "cpe-stable-backport: Backported in 6.6.148"
+
+# CVE-2026-68426 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-68427] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68428] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68429] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68430] = "cpe-stable-backport: Backported in 6.6.148"
+
+# CVE-2026-68431 may need backporting (fixed from 6.6.153)
+
+CVE_STATUS[CVE-2026-68432] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68433] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68434] = "cpe-stable-backport: Backported in 6.6.148"
+
+# CVE-2026-68435 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-68436] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-68437] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-68438] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-68439] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-68440] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-68441 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-68442] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-68443] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-68444] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68445] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68446] = "cpe-stable-backport: Backported in 6.6.148"
+
+# CVE-2026-68447 needs backporting (fixed from 7.2)
+
+# CVE-2026-68448 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-68449] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68450] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-68451] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-68452] = "cpe-stable-backport: Backported in 6.6.151"
+
+# CVE-2026-68453 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-68454] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-68455] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-68456] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-68457] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-68458] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-68459] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-68460] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-68461] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-68462] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-68463] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-68464] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-68465] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-68466] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-68467] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-68468] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-68469] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-68470 needs backporting (fixed from 7.2)
+
+# CVE-2026-68471 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-68472] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-68473] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-68474] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-68475] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-68476] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-68477] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-68478] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-68479] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-68480] = "cpe-stable-backport: Backported in 6.6.150"
+
+CVE_STATUS[CVE-2026-72003] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-72004] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72005] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72006] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-72007] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72008] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-72009 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72010] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72011] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-72012] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72013] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72014] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72015] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72016] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-72017] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72018] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-72019] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72020] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72021] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72022] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72023] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72024] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72025] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72026] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-72027] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-72028] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72029] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72030] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72031] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-72032] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-72033] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72034] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-72035] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72036] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72037] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72038] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72039] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72040] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72041] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-72042 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-72043] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72045] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72046] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-72047] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72048] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72049] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72050] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-72051] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72052] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72053] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72054] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72055] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72056] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72057] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72058] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72059] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72060] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-72061] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72062] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72063] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72064] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-72065] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72066] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72067] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72068] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72069] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72070] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72071] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72072] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-72073 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72074] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72075] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72076] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72077] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72078] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72079] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72080] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-72081] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72082] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72083] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72084] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72085] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72086] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72087] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72088] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72089] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72090] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-72091] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-72092] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-72093] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-72094] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72095] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-72096] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72097] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-72098 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72099] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72100] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-72101] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-72102] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72103] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-72104] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-72105] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72106] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72107] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72108] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72109] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72110] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72111] = "fixed-version: only affects 6.10.13 onwards"
+
+CVE_STATUS[CVE-2026-72112] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72113] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72114] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72115] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72116] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72117] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72118] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72119] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72120] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72121] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72122] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72123] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72124] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72125] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72126] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72127] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-72128] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-72129] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-72130 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72131] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-72132] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72133] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72134] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-72135] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72136] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72137] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-72138] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72139] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-72140] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72141] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-72142] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72143] = "fixed-version: only affects 6.18.16 onwards"
+
+CVE_STATUS[CVE-2026-72144] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72145] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72146] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72147] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72148] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72149] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72150] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-72151] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-72152] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72153] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72154] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-72155] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72156] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72157] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72158] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72159] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72160] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72161] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-72162 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72163] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72164] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72165] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72166] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72167] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-72168 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72169] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-72170] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72171] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72172] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72173] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-72174] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-72175] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-72176] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72177] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72178] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-72179] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72180] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-72181] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72182] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72183] = "fixed-version: only affects 6.12.24 onwards"
+
+CVE_STATUS[CVE-2026-72184] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72185] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72186] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72187] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72188] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72189] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72190] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72191] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72192] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72193] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72194] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72195] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72196] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72197] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-72198 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72199] = "fixed-version: only affects 7.1 onwards"
+
+# CVE-2026-72200 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72201] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72202] = "fixed-version: only affects 7.1 onwards"
+
+# CVE-2026-72203 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72204] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72205] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72206] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72207] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72208] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72209] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72210] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72211] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72212] = "fixed-version: only affects 6.8 onwards"
+
+# CVE-2026-72213 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72214] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72215] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72216] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72217] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72218] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72219] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72220] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-72221] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72222] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72223] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72224] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72225] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72226] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72227] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-72228] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72229] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72230] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72231] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72232] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72233] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72234] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72235] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72236] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72237] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72238] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72239] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72240] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72241] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72242] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72243] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72244] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-72245] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72247] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72248] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-72249] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-72250] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72251] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72252] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72253] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72254] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72255] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72256] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72257] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72258] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72259] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72260] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72261] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72262] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72263] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-72264] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72265] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72266] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72267] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72268] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72269] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72270] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72271] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72272] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72273] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72274] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72275] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72276] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72277] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-72278] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-72279] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-72280] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-72281] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72282] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72283] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-72284] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72285] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-72286] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-72287] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-72288 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72289] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72290] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72291] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72292] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-72293] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-72294] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-72295] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-72296] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72297] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72298] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72299] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72300] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72301] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72302] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72303] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-72304] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72305] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-72306] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72307] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72308] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72309] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72310] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72311] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72312] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72313] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-72314] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-72315 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-72316] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72317] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72318] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72319] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-72320 needs backporting (fixed from 7.2)
+
+# CVE-2026-72321 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72322] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72323] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-72324 needs backporting (fixed from 7.2)
+
+# CVE-2026-72325 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72326] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72327] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-72328] = "fixed-version: only affects 6.16 onwards"
+
+# CVE-2026-72329 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72330] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72331] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-72332] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-72333] = "fixed-version: only affects 6.18.21 onwards"
+
+# CVE-2026-72334 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72335] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72336] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-72337 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72338] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72339] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72340] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-72341 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72342] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72343] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72344] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72345] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-72346] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72347] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72348] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72349] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72350] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72351] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-72352 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72353] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72354] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72355] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-72356] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-72357] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-72358] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72359] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72360] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-72361] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-72362] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-72363] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-72364] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-72365] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-72366] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-72367] = "fixed-version: only affects 6.12.10 onwards"
+
+CVE_STATUS[CVE-2026-72368] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-72369] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72370] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-72371] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72372] = "fixed-version: only affects 6.12.97 onwards"
+
+# CVE-2026-72373 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72374] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-72375 needs backporting (fixed from 7.2)
+
+# CVE-2026-72376 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72377] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-72378] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72379] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-72380 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72381] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72382] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-72383 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72384] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72385] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-72386] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-72387] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-72388] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-72389] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72390] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72391] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72392] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-72393] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-72394] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-72395] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72396] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-72397 needs backporting (fixed from 7.2)
+
+# CVE-2026-72398 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72399] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72400] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72401] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-72402 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72403] = "fixed-version: only affects 6.14 onwards"
+
+# CVE-2026-72404 needs backporting (fixed from 7.2)
+
+# CVE-2026-72405 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72406] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72407] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-72408] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-72409] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72410] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-72411] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72412] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-72413 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72414] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72415] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-72416] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72417] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-72418] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72419] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-72420 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72421] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72422] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-72423 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72424] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72425] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72426] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72427] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72428] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72429] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-72430] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-72431] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-72432] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72433] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-72434 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72435] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72436] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72437] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-72438 needs backporting (fixed from 7.2)
+
+# CVE-2026-72439 needs backporting (fixed from 7.2)
+
+# CVE-2026-72440 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72441] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72442] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-72443] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72444] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72445] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-72446] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-72447] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72448] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72449] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72450] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72451] = "fixed-version: only affects 6.12.13 onwards"
+
+CVE_STATUS[CVE-2026-72452] = "fixed-version: only affects 6.12.80 onwards"
+
+CVE_STATUS[CVE-2026-72453] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-72454 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72455] = "fixed-version: only affects 6.18.14 onwards"
+
+CVE_STATUS[CVE-2026-72456] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-72457] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-72458] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-72459] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72460] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72461] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-72462] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-72463] = "fixed-version: only affects 6.12.94 onwards"
+
+CVE_STATUS[CVE-2026-72464] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72465] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72466] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72467] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72468] = "fixed-version: only affects 6.11 onwards"
+
+# CVE-2026-72469 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72470] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72471] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-72472 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72473] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72474] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-72475] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-72476] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72477] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-72478] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72479] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72480] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72481] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72482] = "fixed-version: only affects 6.18.22 onwards"
+
+CVE_STATUS[CVE-2026-72483] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72484] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-72485 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72486] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72487] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-72488 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72489] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72490] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-72491] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-72492] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-72493 needs backporting (fixed from 7.2)
+
+# CVE-2026-72494 needs backporting (fixed from 7.2)
+
+# CVE-2026-72495 needs backporting (fixed from 7.2)
+
+# CVE-2026-72496 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72497] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-72498] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-72499] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-72500] = "fixed-version: only affects 6.12 onwards"
+
+# CVE-2026-72501 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-72502] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74255] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74256] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-74257 needs backporting (fixed from 7.2)
+
+# CVE-2026-74258 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74259] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74260] = "fixed-version: only affects 6.16 onwards"
+
+# CVE-2026-74261 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74262] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74263] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-74264 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74265] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74266] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-74267] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-74268 needs backporting (fixed from 7.2)
+
+# CVE-2026-74269 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74270] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74271] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-74272 needs backporting (fixed from 7.2)
+
+# CVE-2026-74273 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74274] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-74275] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-74276] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74277] = "fixed-version: only affects 6.16 onwards"
+
+# CVE-2026-74278 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74279] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74280] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74281] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74282] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74283] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74284] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74285] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-74286] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-74287] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74288] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-74289 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74290] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-74291 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74292] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74293] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-74294 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74295] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74296] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74297] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74298] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-74299] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-74300] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74301] = "fixed-version: only affects 6.11 onwards"
+
+# CVE-2026-74302 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-74303] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74304] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-74305] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74306] = "fixed-version: only affects 6.10 onwards"
+
+# CVE-2026-74307 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74308] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74309] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-74310] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74311] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-74312] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74313] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-74314 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74315] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-74316] = "fixed-version: only affects 6.9 onwards"
+
+# CVE-2026-74317 needs backporting (fixed from 7.2)
+
+# CVE-2026-74318 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74319] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-74320] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74321] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74322] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-74323] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-74324] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-74325] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-74326] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-74327] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74328] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-74329] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74330] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74331] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74332] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-74333] = "fixed-version: only affects 6.13 onwards"
+
+# CVE-2026-74334 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74335] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-74336] = "fixed-version: only affects 6.18 onwards"
+
+# CVE-2026-74337 needs backporting (fixed from 7.2)
+
+# CVE-2026-74338 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74339] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74340] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74341] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-74342 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74343] = "fixed-version: only affects 7.1 onwards"
+
+# CVE-2026-74344 needs backporting (fixed from 7.2)
+
+# CVE-2026-74345 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74346] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-74347 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74348] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74349] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-74350 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74351] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74352] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-74353] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-74354] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-74355] = "fixed-version: only affects 6.15 onwards"
+
+# CVE-2026-74356 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74357] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-74358] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-74359] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74360] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-74361] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-74362] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74363] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74364] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-74365] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74366] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-74367] = "fixed-version: only affects 6.13 onwards"
+
+# CVE-2026-74368 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-74369] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-74370] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-74371] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-74372] = "fixed-version: only affects 6.13 onwards"
+
+# CVE-2026-74373 needs backporting (fixed from 7.2)
+
+# CVE-2026-74374 needs backporting (fixed from 7.2)
+
+# CVE-2026-74375 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74376] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74377] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74378] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74379] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74380] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74381] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74382] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74383] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-74384] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74385] = "fixed-version: only affects 6.7 onwards"
+
+# CVE-2026-74386 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74387] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-74388 needs backporting (fixed from 7.2)
+
+# CVE-2026-74389 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74390] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74391] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74392] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-74393] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-74394] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74395] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74396] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-74397] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74398] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74399] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74400] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-74401] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74402] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74403] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-74404] = "fixed-version: only affects 6.9 onwards"
+
+# CVE-2026-74405 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74406] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-74407 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74408] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74409] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-74410] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74411] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74412] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-74413] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-74414] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-74415] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-74416] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74417] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74418] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-74419] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-74420] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-74421] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-74422] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-74423] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-74424] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74425] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-74426] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74427] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74428] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-74429] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-74430] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-74431] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-74432] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74433] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-74434] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-74435] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74436] = "cpe-stable-backport: Backported in 6.6.148"
+
+CVE_STATUS[CVE-2026-74437] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-74438] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74439] = "fixed-version: only affects 6.8.2 onwards"
+
+CVE_STATUS[CVE-2026-74440] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-74441] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74442] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-74443] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74444] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74445] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74446] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74447] = "fixed-version: only affects 6.12.75 onwards"
+
+CVE_STATUS[CVE-2026-74448] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74449] = "fixed-version: only affects 6.11 onwards"
+
+# CVE-2026-74450 may need backporting (fixed from 6.6.153)
+
+CVE_STATUS[CVE-2026-74451] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-74452] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-74453] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74454] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74455] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74456] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74457] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74458] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74459] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74460] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74461] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74462] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-74463] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74464] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74465] = "cpe-stable-backport: Backported in 6.6.151"
+
+# CVE-2026-74466 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74467] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74468] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74469] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74470] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74471] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74472] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74473] = "cpe-stable-backport: Backported in 6.6.151"
+
+# CVE-2026-74474 may need backporting (fixed from 6.6.153)
+
+CVE_STATUS[CVE-2026-74475] = "cpe-stable-backport: Backported in 6.6.151"
+
+# CVE-2026-74476 may need backporting (fixed from 6.6.153)
+
+CVE_STATUS[CVE-2026-74477] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-74478] = "cpe-stable-backport: Backported in 6.6.151"
+
+# CVE-2026-74479 may need backporting (fixed from 6.6.153)
+
+CVE_STATUS[CVE-2026-74480] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74481] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74482] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74483] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-74484] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-74485] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74486] = "fixed-version: only affects 6.14 onwards"
+
+# CVE-2026-74487 may need backporting (fixed from 6.6.153)
+
+CVE_STATUS[CVE-2026-74488] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74489] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-74490] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74491] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-74492] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74493] = "cpe-stable-backport: Backported in 6.6.151"
+
+# CVE-2026-74494 may need backporting (fixed from 6.6.153)
+
+CVE_STATUS[CVE-2026-74495] = "cpe-stable-backport: Backported in 6.6.151"
+
+# CVE-2026-74496 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74497] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74498] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74499] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74500] = "fixed-version: only affects 6.10.14 onwards"
+
+CVE_STATUS[CVE-2026-74501] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74502] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74503] = "fixed-version: only affects 6.12.94 onwards"
+
+CVE_STATUS[CVE-2026-74504] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-74505] = "cpe-stable-backport: Backported in 6.6.151"
+
+# CVE-2026-74506 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74507] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74508] = "cpe-stable-backport: Backported in 6.6.151"
+
+# CVE-2026-74509 may need backporting (fixed from 6.6.154)
+
+CVE_STATUS[CVE-2026-74510] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74512] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74513] = "fixed-version: only affects 6.10 onwards"
+
+# CVE-2026-74514 may need backporting (fixed from 6.6.152)
+
+CVE_STATUS[CVE-2026-74515] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74516] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74517] = "fixed-version: only affects 6.12.41 onwards"
+
+CVE_STATUS[CVE-2026-74518] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74519] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74520] = "fixed-version: only affects 6.11 onwards"
+
+# CVE-2026-74521 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74522] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74523] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74524] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-74525] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74526] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-74527 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74528] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-74529] = "fixed-version: only affects 6.12.28 onwards"
+
+CVE_STATUS[CVE-2026-74530] = "fixed-version: only affects 6.12.28 onwards"
+
+CVE_STATUS[CVE-2026-74531] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74532] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74533] = "fixed-version: only affects 6.11.11 onwards"
+
+CVE_STATUS[CVE-2026-74534] = "fixed-version: only affects 6.11.11 onwards"
+
+CVE_STATUS[CVE-2026-74535] = "fixed-version: only affects 6.12.2 onwards"
+
+# CVE-2026-74536 needs backporting (fixed from 7.2)
+
+# CVE-2026-74537 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74538] = "fixed-version: only affects 6.8.9 onwards"
+
+CVE_STATUS[CVE-2026-74539] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-74540] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74541] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74542] = "fixed-version: only affects 6.12 onwards"
+
+# CVE-2026-74543 needs backporting (fixed from 7.2)
+
+# CVE-2026-74544 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74545] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-74546] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74547] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74548] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74549] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74550] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74551] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74552] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74553] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74554] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-74555] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74556] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74557] = "cpe-stable-backport: Backported in 6.6.151"
+
+# CVE-2026-74558 needs backporting (fixed from 7.2)
+
+# CVE-2026-74559 needs backporting (fixed from 7.2)
+
+# CVE-2026-74560 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74561] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-74562] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-74563] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74564] = "cpe-stable-backport: Backported in 6.6.151"
+
+# CVE-2026-74565 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74566] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74567] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74568] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-74569] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74570] = "fixed-version: only affects 7.1 onwards"
+
+# CVE-2026-74571 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74572] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74573] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-74574] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74575] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74576] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-74577] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-74578] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-74579] = "cpe-stable-backport: Backported in 6.6.151"
+
+# CVE-2026-74580 may need backporting (fixed from 6.6.152)
+
+CVE_STATUS[CVE-2026-74581] = "cpe-stable-backport: Backported in 6.6.151"
+
+# CVE-2026-74582 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74583 may need backporting (fixed from 6.6.152)
+
+CVE_STATUS[CVE-2026-74584] = "cpe-stable-backport: Backported in 6.6.144"
+
+# CVE-2026-74585 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74586 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74587 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74588 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74589 may need backporting (fixed from 6.6.152)
+
+CVE_STATUS[CVE-2026-74590] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-74591] = "fixed-version: only affects 6.15 onwards"
+
+# CVE-2026-74592 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74593] = "fixed-version: only affects 6.18 onwards"
+
+# CVE-2026-74594 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74595 may need backporting (fixed from 6.6.152)
+
+CVE_STATUS[CVE-2026-74596] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-74597 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74598 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74599 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-74600 needs backporting (fixed from 7.2)
+
+# CVE-2026-74601 may need backporting (fixed from 6.6.153)
+
+CVE_STATUS[CVE-2026-74602] = "fixed-version: only affects 6.8 onwards"
+
+# CVE-2026-74603 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74604 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74605 may need backporting (fixed from 6.7)
+
+# CVE-2026-74606 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74607 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-74608 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74609 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74610 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74611 needs backporting (fixed from 7.2)
+
+# CVE-2026-74612 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74613 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74614 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74615 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74616 may need backporting (fixed from 6.6.152)
+
+CVE_STATUS[CVE-2026-74617] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-74618] = "fixed-version: only affects 6.7 onwards"
+
+# CVE-2026-74619 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74620 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74621 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74622 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74623 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74624 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74625 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74626 may need backporting (fixed from 6.6.154)
+
+CVE_STATUS[CVE-2026-74627] = "fixed-version: only affects 6.16 onwards"
+
+# CVE-2026-74628 may need backporting (fixed from 6.6.153)
+
+CVE_STATUS[CVE-2026-74629] = "fixed-version: only affects 6.18 onwards"
+
+# CVE-2026-74630 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74631 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74632 may need backporting (fixed from 6.6.153)
+
+CVE_STATUS[CVE-2026-74633] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-74634] = "fixed-version: only affects 6.8 onwards"
+
+# CVE-2026-74635 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74636 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74637 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-74638 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-74639] = "fixed-version: only affects 6.18.39 onwards"
+
+CVE_STATUS[CVE-2026-74640] = "fixed-version: only affects 6.14 onwards"
+
+# CVE-2026-74641 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74642 may need backporting (fixed from 6.6.152)
+
+CVE_STATUS[CVE-2026-74643] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-74644] = "fixed-version: only affects 6.12.44 onwards"
+
+CVE_STATUS[CVE-2026-74645] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-74646 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74647 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74648 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74649 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74650 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74651 may need backporting (fixed from 6.6.152)
+
+CVE_STATUS[CVE-2026-74652] = "fixed-version: only affects 6.14 onwards"
+
+# CVE-2026-74653 needs backporting (fixed from 7.2)
+
+# CVE-2026-74654 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74655 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-74656 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74657 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74658 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74659 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74660 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74661 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74662 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-74663 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74664 may need backporting (fixed from 6.6.152)
+
+CVE_STATUS[CVE-2026-74665] = "fixed-version: only affects 6.9 onwards"
+
+# CVE-2026-74666 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74667 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74668 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74669 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74670 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74671 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74672 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-74673 may need backporting (fixed from 6.6.152)
+
+CVE_STATUS[CVE-2026-74674] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-74675 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74676 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74677 needs backporting (fixed from 7.2)
+
+# CVE-2026-74678 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74679 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74680 may need backporting (fixed from 6.6.152)
+
+CVE_STATUS[CVE-2026-74681] = "fixed-version: only affects 6.18 onwards"
+
+# CVE-2026-74682 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74683 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74684 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74685] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-74686] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-74687 needs backporting (fixed from 7.2)
+
+# CVE-2026-74688 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74689 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74690 needs backporting (fixed from 7.2)
+
+# CVE-2026-74691 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74692 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74693 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74694 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74695 needs backporting (fixed from 7.2)
+
+# CVE-2026-74696 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74697 may need backporting (fixed from 6.6.152)
+
+CVE_STATUS[CVE-2026-74698] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-74699] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-74700 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74701 may need backporting (fixed from 6.6.152)
+
+CVE_STATUS[CVE-2026-74702] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-74703] = "fixed-version: only affects 6.15 onwards"
+
+# CVE-2026-74704 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74705 may need backporting (fixed from 6.6.152)
+
+CVE_STATUS[CVE-2026-74706] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-74707] = "fixed-version: only affects 6.14.2 onwards"
+
+CVE_STATUS[CVE-2026-74708] = "fixed-version: only affects 6.14.2 onwards"
+
+CVE_STATUS[CVE-2026-74709] = "fixed-version: only affects 6.14.2 onwards"
+
+CVE_STATUS[CVE-2026-74710] = "fixed-version: only affects 6.8 onwards"
+
+# CVE-2026-74711 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74712] = "fixed-version: only affects 6.12 onwards"
+
+# CVE-2026-74713 needs backporting (fixed from 7.2)
+
+# CVE-2026-74714 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74715 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-74716] = "fixed-version: only affects 6.16 onwards"
+
+# CVE-2026-74717 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74718 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74719 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74720 may need backporting (fixed from 6.6.152)
+
+CVE_STATUS[CVE-2026-74721] = "fixed-version: only affects 6.16 onwards"
+
+# CVE-2026-74722 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74723 needs backporting (fixed from 7.2)
+
+# CVE-2026-74724 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-74725 needs backporting (fixed from 7.2)
+
+# CVE-2026-74726 may need backporting (fixed from 6.6.152)
+
+CVE_STATUS[CVE-2026-74727] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-74728] = "fixed-version: only affects 6.9 onwards"
+
+# CVE-2026-74729 needs backporting (fixed from 7.2)
+
+# CVE-2026-74730 may need backporting (fixed from 6.6.152)
+
+CVE_STATUS[CVE-2026-74731] = "fixed-version: only affects 7.1 onwards"
+
+# CVE-2026-74732 needs backporting (fixed from 7.2)
+
+# CVE-2026-74733 may need backporting (fixed from 6.7)
+
+# CVE-2026-74734 needs backporting (fixed from 7.2)
+
+# CVE-2026-74735 needs backporting (fixed from 7.2)
+
+# CVE-2026-74736 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-74737 may need backporting (fixed from 6.6.153)
+
+CVE_STATUS[CVE-2026-74738] = "fixed-version: only affects 6.14 onwards"
+
+# CVE-2026-74739 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-74740 may need backporting (fixed from 6.6.153)
+
+CVE_STATUS[CVE-2026-74741] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-74742] = "fixed-version: only affects 6.12.61 onwards"
+
+# CVE-2026-74743 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-74744 may need backporting (fixed from 6.6.153)
+
+CVE_STATUS[CVE-2026-74745] = "fixed-version: only affects 6.15 onwards"
+
+# CVE-2026-74746 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-74747 needs backporting (fixed from 7.2)
+
+# CVE-2026-74748 may need backporting (fixed from 6.6.153)
+
+CVE_STATUS[CVE-2026-74749] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-74750] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-74751] = "fixed-version: only affects 7.1 onwards"
+
+# CVE-2026-74752 needs backporting (fixed from 7.2)
+
+# CVE-2026-74753 may need backporting (fixed from 6.6.156)
+
+# CVE-2026-74754 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-80519] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-80520] = "fixed-version: only affects 6.16 onwards"
+
+# CVE-2026-80521 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-80522] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-80523] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-80524] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-80525] = "fixed-version: only affects 6.10 onwards"
+
+# CVE-2026-80526 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80527 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80528 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80529 may need backporting (fixed from 6.6.153)
+
+CVE_STATUS[CVE-2026-80530] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-80531] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-80532] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-80533] = "fixed-version: only affects 6.10 onwards"
+
+# CVE-2026-80534 may need backporting (fixed from 6.6.153)
+
+CVE_STATUS[CVE-2026-80535] = "fixed-version: only affects 6.10 onwards"
+
+# CVE-2026-80536 may need backporting (fixed from 6.6.154)
+
+CVE_STATUS[CVE-2026-80537] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-80538] = "fixed-version: only affects 6.13 onwards"
+
+# CVE-2026-80539 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80540 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80541 may need backporting (fixed from 6.6.153)
+
+CVE_STATUS[CVE-2026-80542] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-80543] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-80544] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-80545] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-80546] = "fixed-version: only affects 7.1 onwards"
+
+# CVE-2026-80547 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80548 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80549 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80550 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80551 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80552 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80553 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80554 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80555 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80556 needs backporting (fixed from 7.2)
+
+# CVE-2026-80557 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80558 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80559 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80560 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80561 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80562 may need backporting (fixed from 6.6.154)
+
+CVE_STATUS[CVE-2026-80563] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-80564] = "fixed-version: only affects 6.17 onwards"
+
+# CVE-2026-80565 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80566 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80567 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80568 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80569 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80570 may need backporting (fixed from 6.6.153)
+
+CVE_STATUS[CVE-2026-80571] = "fixed-version: only affects 6.16 onwards"
+
+# CVE-2026-80572 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80573 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80574 may need backporting (fixed from 6.6.153)
+
+CVE_STATUS[CVE-2026-80575] = "fixed-version: only affects 6.11 onwards"
+
+# CVE-2026-80576 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-80577] = "fixed-version: only affects 6.10 onwards"
+
+# CVE-2026-80578 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80579 needs backporting (fixed from 7.2)
+
+# CVE-2026-80580 needs backporting (fixed from 7.2)
+
+# CVE-2026-80581 may need backporting (fixed from 6.6.154)
+
+CVE_STATUS[CVE-2026-80582] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-80583 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80584 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80585 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80586 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80587 may need backporting (fixed from 6.6.153)
+
+CVE_STATUS[CVE-2026-80588] = "fixed-version: only affects 6.18.35 onwards"
+
+# CVE-2026-80589 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80590 may need backporting (fixed from 6.6.155)
+
+CVE_STATUS[CVE-2026-80591] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80592] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-80593] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80594] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80595] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80596] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-80597] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80598] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80599] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80600] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80601] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80602] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80603] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80604] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80605] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80606] = "fixed-version: only affects 6.18 onwards"
+
+# CVE-2026-80607 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-80608] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-80609] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80610] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-80611 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-80612] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-80613] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80614] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-80615] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-80616 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-80617] = "fixed-version: only affects 6.18.33 onwards"
+
+CVE_STATUS[CVE-2026-80618] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80619] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80620] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80621] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-80622] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-80623 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-80624] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80625] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-80626] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80627] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-80628 needs backporting (fixed from 7.2)
+
+# CVE-2026-80629 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-80630] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-80631 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-80632] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-80633] = "fixed-version: only affects 7.1 onwards"
+
+# CVE-2026-80634 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-80635] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80636] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-80637 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-80638] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-80639] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-80640] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-80641] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-80642] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-80643 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-80644] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80645] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80646] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80647] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80648] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-80649] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-80650 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-80651] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-80652] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-80653 needs backporting (fixed from 7.2)
+
+# CVE-2026-80654 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-80655] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-80656] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-80657] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-80658] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-80659] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80660] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80661] = "fixed-version: only affects 6.15 onwards"
+
+# CVE-2026-80662 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-80663] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80664] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80665] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-80666] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-80667] = "fixed-version: only affects 6.7 onwards"
+
+# CVE-2026-80668 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-80669] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-80670 needs backporting (fixed from 7.2)
+
+# CVE-2026-80671 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-80672] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-80673] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-80674] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-80675] = "fixed-version: only affects 6.18 onwards"
+
+# CVE-2026-80676 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-80677] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80678] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-80679] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-80680] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-80681] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-80682] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-80683] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-80684] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-80685] = "fixed-version: only affects 6.15 onwards"
+
+# CVE-2026-80686 may need backporting (fixed from 6.6.153)
+
+CVE_STATUS[CVE-2026-80687] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-80688] = "fixed-version: only affects 6.13.11 onwards"
+
+# CVE-2026-80689 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-80690] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-80691] = "cpe-stable-backport: Backported in 6.6.151"
+
+# CVE-2026-80692 may need backporting (fixed from 6.7)
+
+CVE_STATUS[CVE-2026-80693] = "fixed-version: only affects 6.7 onwards"
+
+# CVE-2026-80694 needs backporting (fixed from 7.2)
+
+# CVE-2026-80695 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-80696] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-80697] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-80698 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-80699] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-80700] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-80701] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-80702] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-80703] = "cpe-stable-backport: Backported in 6.6.151"
+
+# CVE-2026-80704 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-80705] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-80706] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-80707] = "cpe-stable-backport: Backported in 6.6.151"
+
+# CVE-2026-80708 may need backporting (fixed from 6.6.152)
+
+CVE_STATUS[CVE-2026-80709] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-80710] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-80711] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-80712] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-80713] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-80714] = "cpe-stable-backport: Backported in 6.6.151"
+
+# CVE-2026-80715 may need backporting (fixed from 6.6.153)
+
+CVE_STATUS[CVE-2026-80716] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-80717] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-80718] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-80719] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-80720] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-80721] = "fixed-version: only affects 6.11.11 onwards"
+
+CVE_STATUS[CVE-2026-80722] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-80723] = "fixed-version: only affects 6.12.13 onwards"
+
+CVE_STATUS[CVE-2026-80724] = "fixed-version: only affects 6.13 onwards"
+
+# CVE-2026-80725 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80726 may need backporting (fixed from 6.6.152)
+
+CVE_STATUS[CVE-2026-80727] = "fixed-version: only affects 6.8 onwards"
+
+# CVE-2026-80728 may need backporting (fixed from 6.6.152)
+
+CVE_STATUS[CVE-2026-80729] = "fixed-version: only affects 6.15 onwards"
+
+# CVE-2026-80730 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-80731 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-80732 may need backporting (fixed from 6.6.152)
+
+# CVE-2026-80733 may need backporting (fixed from 6.6.152)
+
+CVE_STATUS[CVE-2026-80734] = "fixed-version: only affects 6.14.6 onwards"
+
+CVE_STATUS[CVE-2026-80735] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-80736] = "fixed-version: only affects 6.9 onwards"
+
+# CVE-2026-80737 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80738 needs backporting (fixed from 7.2)
+
+# CVE-2026-80739 may need backporting (fixed from 6.6.152)
+
+CVE_STATUS[CVE-2026-80740] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-80741] = "fixed-version: only affects 6.14 onwards"
+
+# CVE-2026-80742 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80743 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80744 may need backporting (fixed from 6.6.153)
+
+CVE_STATUS[CVE-2026-80745] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-80746] = "fixed-version: only affects 7.1 onwards"
+
+# CVE-2026-80747 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-80748] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-80749] = "fixed-version: only affects 6.11 onwards"
+
+CVE_STATUS[CVE-2026-80750] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2026-80751] = "fixed-version: only affects 6.19 onwards"
+
+# CVE-2026-80752 may need backporting (fixed from 6.6.153)
+
+CVE_STATUS[CVE-2026-80753] = "fixed-version: only affects 6.16 onwards"
+
+# CVE-2026-80754 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80755 needs backporting (fixed from 7.2)
+
+# CVE-2026-80756 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80757 may need backporting (fixed from 6.6.153)
+
+CVE_STATUS[CVE-2026-80758] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-80759] = "fixed-version: only affects 6.12 onwards"
+
+CVE_STATUS[CVE-2026-80760] = "fixed-version: only affects 6.13 onwards"
+
+# CVE-2026-80761 needs backporting (fixed from 7.3rc1)
+
+# CVE-2026-80762 may need backporting (fixed from 6.6.156)
+
+# CVE-2026-80763 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80764 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80765 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80766 may need backporting (fixed from 6.6.156)
+
+# CVE-2026-80767 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80768 may need backporting (fixed from 6.6.156)
+
+CVE_STATUS[CVE-2026-80769] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-80770 may need backporting (fixed from 6.6.156)
+
+# CVE-2026-80771 needs backporting (fixed from 7.3rc1)
+
+# CVE-2026-80772 may need backporting (fixed from 6.6.154)
+
+CVE_STATUS[CVE-2026-80773] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-80774] = "fixed-version: only affects 6.12.35 onwards"
+
+CVE_STATUS[CVE-2026-80775] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-80776] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-80777] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-80778] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-80779] = "fixed-version: only affects 6.9 onwards"
+
+# CVE-2026-80780 may need backporting (fixed from 6.6.156)
+
+# CVE-2026-80781 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80782 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80783 may need backporting (fixed from 6.6.156)
+
+# CVE-2026-80784 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80785 needs backporting (fixed from 7.2)
+
+# CVE-2026-80786 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-80787] = "fixed-version: only affects 6.14 onwards"
+
+# CVE-2026-80788 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80789 may need backporting (fixed from 6.6.156)
+
+# CVE-2026-80790 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80791 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80792 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80793 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80794 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80795 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80796 may need backporting (fixed from 6.6.156)
+
+# CVE-2026-80797 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80798 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80799 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80800 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80801 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80802 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80803 may need backporting (fixed from 6.6.154)
+
+CVE_STATUS[CVE-2026-80804] = "fixed-version: only affects 7.0 onwards"
+
+# CVE-2026-80805 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80806 may need backporting (fixed from 6.6.156)
+
+# CVE-2026-80807 may need backporting (fixed from 6.6.156)
+
+# CVE-2026-80808 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80809 may need backporting (fixed from 6.6.154)
+
+CVE_STATUS[CVE-2026-80810] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-80811] = "fixed-version: only affects 6.15 onwards"
+
+# CVE-2026-80812 may need backporting (fixed from 6.6.154)
+
+CVE_STATUS[CVE-2026-80813] = "fixed-version: only affects 6.13 onwards"
+
+# CVE-2026-80814 may need backporting (fixed from 6.6.154)
+
+CVE_STATUS[CVE-2026-80815] = "fixed-version: only affects 6.10 onwards"
+
+CVE_STATUS[CVE-2026-80816] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-80817] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2026-80818] = "fixed-version: only affects 6.17 onwards"
+
+# CVE-2026-80819 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80820 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-80821] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-80822] = "fixed-version: only affects 6.14 onwards"
+
+# CVE-2026-80823 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80824 may need backporting (fixed from 6.6.156)
+
+CVE_STATUS[CVE-2026-80825] = "fixed-version: only affects 6.7 onwards"
+
+# CVE-2026-80826 may need backporting (fixed from 6.6.156)
+
+# CVE-2026-80827 may need backporting (fixed from 6.6.156)
+
+# CVE-2026-80828 may need backporting (fixed from 6.6.156)
+
+# CVE-2026-80829 may need backporting (fixed from 6.6.156)
+
+# CVE-2026-80830 may need backporting (fixed from 6.6.156)
+
+# CVE-2026-80831 may need backporting (fixed from 6.6.156)
+
+# CVE-2026-80832 may need backporting (fixed from 6.6.156)
+
+# CVE-2026-80833 needs backporting (fixed from 7.3rc1)
+
+# CVE-2026-80834 needs backporting (fixed from 7.3rc1)
+
+CVE_STATUS[CVE-2026-80835] = "fixed-version: only affects 6.7 onwards"
+
+# CVE-2026-80836 needs backporting (fixed from 7.3rc1)
+
+# CVE-2026-80837 needs backporting (fixed from 7.3rc1)
+
+CVE_STATUS[CVE-2026-80838] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-80839] = "fixed-version: only affects 6.8 onwards"
+
+# CVE-2026-80840 may need backporting (fixed from 6.6.156)
+
+# CVE-2026-80841 needs backporting (fixed from 7.3rc1)
+
+# CVE-2026-80842 may need backporting (fixed from 6.6.156)
+
+# CVE-2026-80843 may need backporting (fixed from 6.6.156)
+
+# CVE-2026-80844 may need backporting (fixed from 6.6.156)
+
+CVE_STATUS[CVE-2026-80845] = "fixed-version: only affects 6.11 onwards"
+
+# CVE-2026-80846 may need backporting (fixed from 6.6.156)
+
+# CVE-2026-80847 needs backporting (fixed from 7.3rc1)
+
+# CVE-2026-80848 may need backporting (fixed from 6.6.156)
+
+CVE_STATUS[CVE-2026-80849] = "fixed-version: only affects 6.7 onwards"
+
+CVE_STATUS[CVE-2026-80850] = "fixed-version: only affects 6.7 onwards"
+
+# CVE-2026-80851 needs backporting (fixed from 7.3rc1)
+
+# CVE-2026-80852 may need backporting (fixed from 6.6.156)
+
+CVE_STATUS[CVE-2026-80853] = "fixed-version: only affects 7.2 onwards"
+
+# CVE-2026-80854 may need backporting (fixed from 6.6.156)
+
+# CVE-2026-80855 may need backporting (fixed from 6.6.156)
+
+# CVE-2026-80856 may need backporting (fixed from 6.6.156)
+
+CVE_STATUS[CVE-2026-80857] = "fixed-version: only affects 6.18.25 onwards"
+
+CVE_STATUS[CVE-2026-80858] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-80859] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-80860] = "fixed-version: only affects 6.12.96 onwards"
+
+# CVE-2026-80861 needs backporting (fixed from 7.3rc1)
+
+CVE_STATUS[CVE-2026-80862] = "fixed-version: only affects 6.12 onwards"
+
+# CVE-2026-80863 may need backporting (fixed from 6.6.156)
+
+# CVE-2026-80864 needs backporting (fixed from 7.3rc1)
+
+CVE_STATUS[CVE-2026-80865] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-80866 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-80867] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80868] = "fixed-version: only affects 7.0 onwards"
+
+CVE_STATUS[CVE-2026-80869] = "fixed-version: only affects 7.1 onwards"
+
+CVE_STATUS[CVE-2026-80870] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80871] = "fixed-version: only affects 6.18 onwards"
+
+# CVE-2026-80872 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-80873] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2026-80874] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-80875] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80876] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80877] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80878] = "fixed-version: only affects 6.8 onwards"
+
+CVE_STATUS[CVE-2026-80879] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80880] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80881] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80882] = "fixed-version: only affects 6.12.91 onwards"
+
+CVE_STATUS[CVE-2026-80883] = "cpe-stable-backport: Backported in 6.6.145"
+
+# CVE-2026-80884 needs backporting (fixed from 7.2)
+
+CVE_STATUS[CVE-2026-80885] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2026-80886] = "cpe-stable-backport: Backported in 6.6.145"
+
+CVE_STATUS[CVE-2026-80887] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-80888] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-80889] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-80890] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-80891] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-80892] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-80893] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-80894] = "fixed-version: only affects 6.12.24 onwards"
+
+CVE_STATUS[CVE-2026-80895] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-80896] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2026-80897] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-80898] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2026-80899] = "fixed-version: only affects 6.9 onwards"
+
+CVE_STATUS[CVE-2026-80900] = "fixed-version: only affects 6.19 onwards"
+
+CVE_STATUS[CVE-2026-80901] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-80902] = "cpe-stable-backport: Backported in 6.6.151"
+
+CVE_STATUS[CVE-2026-80903] = "fixed-version: only affects 6.12.18 onwards"
+
+# CVE-2026-80904 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80905 needs backporting (fixed from 7.2)
+
+# CVE-2026-80906 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80907 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80908 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80909 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80910 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80911 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80912 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80913 may need backporting (fixed from 6.6.153)
+
+# CVE-2026-80914 needs backporting (fixed from 7.3rc1)
+
+CVE_STATUS[CVE-2026-80915] = "fixed-version: only affects 6.11.3 onwards"
+
+# CVE-2026-80916 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80917 may need backporting (fixed from 6.6.154)
+
+# CVE-2026-80918 may need backporting (fixed from 6.6.154)
+
+CVE_STATUS[CVE-2026-80919] = "fixed-version: only affects 7.1 onwards"
+
+# CVE-2026-80920 needs backporting (fixed from 7.3rc1)
+
+# CVE-2026-80921 may need backporting (fixed from 6.6.156)
+
+CVE_STATUS[CVE-2026-80922] = "fixed-version: only affects 6.7 onwards"
+
+# CVE-2026-80923 may need backporting (fixed from 6.6.156)
+
+CVE_STATUS[CVE-2026-80924] = "fixed-version: only affects 6.15 onwards"
+
+# CVE-2026-80925 needs backporting (fixed from 7.3rc1)
 

