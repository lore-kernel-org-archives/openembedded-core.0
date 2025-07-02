Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D551C83F04
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 03:12:51 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.15057.1751425969289410463
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 20:12:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fHfvFMuw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-748d982e92cso4840868b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 20:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751425968; x=1752030768; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hDSOrB4Z+QVa6aniYIqdj4XC9iz6Nse3bgAs9nmEtOI=;
        b=fHfvFMuw82T0kOAxYAS8oggbSbAYaAON+KCH3lfeUl2odI9mrPRbwf1sycsesH2CUi
         zp6rMB/RtMoe0c5zWchnFbd5LVXnJY4xXl+FjaHNKnexCK182gLuPvkiay903dPxaks2
         f1z5CEo6NX0MA685hE94qSh5bcVxQcVmdTsZ/CcxTIl8ytP0cpZqKjhNbOClbYeoITRn
         9+0hX/+i2AYUHbNKCMVlrH3Rqrjn7GPCoHbKGu8a3STowe2enIpKkD/APhbyl6JeW37W
         TOFRrXC8ND4J9XQ88xXri0HwDxV9mCoacEapnTXSgk5Ae7h5WMTSxCe/HAhc8u23N7gD
         lQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751425968; x=1752030768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDSOrB4Z+QVa6aniYIqdj4XC9iz6Nse3bgAs9nmEtOI=;
        b=RJyIEieTKjXbVUC6pSQ75MIznupdK83zENKXw9DAtohMPdhEPWnQW2vhfuN/WNrIoS
         GktbY36C1iIb1FyBNe6W51/FvE/EmTJOlpkdRV1NJ9HEADC8w4YAvJOeeuJDmif7U4ZD
         +X8+PBu7DTrH5JX3TJZhItqy4d4w2U95bGcJpTM0G9/lZEkhrl5KuUAfEyU0EpIlZ2on
         VT4gWcqV34/ewDLVTS+K3Zshz8el3feCXftROMNbcbCEttyqEmAL8UCSQ5COC4vy9dkP
         j1ji60+FmCO/31l5t7EyDP85TqmrnKQGuoGoOfOrBXLF7LyfHzSkQ1hVyyT7Z4TgC/aJ
         w4Bg==
X-Gm-Message-State: AOJu0Yw29DWg1TKWNdBJjLLIbPGccw6JBR6aHdwq4dKcHYY8oFaeC7XX
	Po/YT20biMrF1kmNdIt1SQq5n79weBEwP7fj/Riq+UBojgDrywoVdIV8iCaA+rUHjGa5z5FWnO5
	WlN6E
X-Gm-Gg: ASbGncvYGzVC/ZbQEMaGt+l4rwjjqqK4gTq9dxvFtleyIFcSNKLBr0xnsBe78SoN3yT
	olfOWfG3DZRFltIQqbNupJUY3T0E1AtiTwvwVnwv8ZoNO9PUpbhH025GO6pQzmZygZmKR/2g6tz
	cHSY4pF4jMpMP6AGNprQIkHnZU+G7QHoV1rS0BHwk8F+6kp0ekNeVjvwk2qwZwCcGIpY6BO5Ke6
	C9AvyLi1y/6XCAQ7U7Sd8DG12ck4N7eXfCdumT0c7/0rrdc9uS94fnz+l+3Mf6QCl5+L0nosdOS
	QuH3jrcny96q0nkZdbHfFTzWFAjBJiL13yRClemu7XAZh7aXQTHdIQ==
X-Google-Smtp-Source: AGHT+IG0p3Kv+PRt/gpPL9WpUbaCmmznu80RYRJHXe3kQfN0FLelzdNwKtnLoGsh9ljYnWVLa3mARg==
X-Received: by 2002:a05:6a20:748f:b0:1f5:619a:7f4c with SMTP id adf61e73a8af0-222d7f06890mr2509461637.29.1751425968239;
        Tue, 01 Jul 2025 20:12:48 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34f8:320a:2e39:118e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af58069a9sm13633241b3a.174.2025.07.01.20.12.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 20:12:47 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 15/19] linux-yocto: refresh CVE exclusions
Date: Tue,  1 Jul 2025 20:12:00 -0700
Message-ID: <6507be4fd7e1738b15509cbd42267548ba4a42a5.1751425749.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751425749.git.steve@sakoman.com>
References: <cover.1751425749.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 03:12:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219769

From: Ross Burton <ross.burton@arm.com>

As we upgraded the kernel, the exclusions need to be updated too.

This marks many CVEs as resolved.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e99d1e7116aef8c5458cd51c0b97b8e275ade3a9)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/cve-exclusion_6.12.inc              | 246 +++++++++---------
 1 file changed, 122 insertions(+), 124 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index 120b1b5ef7..d33880eae0 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,9 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-05-24 12:18:11.126849+00:00 for version 6.12.27
+# Generated at 2025-05-29 10:54:43.823437+00:00 for kernel version 6.12.30
+# From cvelistV5 cve_2025-05-29_1000Z-1-g4f2590b715f
+
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.27"
+    this_version = "6.12.30"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -6894,8 +6896,6 @@ CVE_STATUS[CVE-2024-36905] = "fixed-version: Fixed from version 6.9"
 
 CVE_STATUS[CVE-2024-36906] = "fixed-version: Fixed from version 6.9"
 
-# CVE-2024-36907 has no known resolution
-
 CVE_STATUS[CVE-2024-36908] = "fixed-version: Fixed from version 6.9"
 
 CVE_STATUS[CVE-2024-36909] = "fixed-version: Fixed from version 6.9"
@@ -11412,15 +11412,15 @@ CVE_STATUS[CVE-2024-58090] = "cpe-stable-backport: Backported in 6.12.18"
 
 CVE_STATUS[CVE-2024-58092] = "cpe-stable-backport: Backported in 6.12.22"
 
-# CVE-2024-58093 needs backporting (fixed from 6.15rc1)
+# CVE-2024-58093 needs backporting (fixed from 6.15)
 
-# CVE-2024-58094 needs backporting (fixed from 6.15rc1)
+# CVE-2024-58094 needs backporting (fixed from 6.15)
 
-# CVE-2024-58095 needs backporting (fixed from 6.15rc1)
+# CVE-2024-58095 needs backporting (fixed from 6.15)
 
-# CVE-2024-58096 needs backporting (fixed from 6.15rc1)
+# CVE-2024-58096 needs backporting (fixed from 6.15)
 
-# CVE-2024-58097 needs backporting (fixed from 6.15rc1)
+# CVE-2024-58097 needs backporting (fixed from 6.15)
 
 CVE_STATUS[CVE-2024-58098] = "cpe-stable-backport: Backported in 6.12.25"
 
@@ -12354,39 +12354,39 @@ CVE_STATUS[CVE-2025-22099] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2025-22100] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2025-22101 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22101 needs backporting (fixed from 6.15)
 
-# CVE-2025-22102 may need backporting (fixed from 6.12.30)
+CVE_STATUS[CVE-2025-22102] = "cpe-stable-backport: Backported in 6.12.30"
 
-# CVE-2025-22103 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22103 needs backporting (fixed from 6.15)
 
-# CVE-2025-22104 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22104 needs backporting (fixed from 6.15)
 
-# CVE-2025-22105 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22105 needs backporting (fixed from 6.15)
 
-# CVE-2025-22106 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22106 needs backporting (fixed from 6.15)
 
-# CVE-2025-22107 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22107 needs backporting (fixed from 6.15)
 
-# CVE-2025-22108 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22108 needs backporting (fixed from 6.15)
 
-# CVE-2025-22109 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22109 needs backporting (fixed from 6.15)
 
 CVE_STATUS[CVE-2025-22110] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2025-22111 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22111 needs backporting (fixed from 6.15)
 
 CVE_STATUS[CVE-2025-22112] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2025-22113 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22113 needs backporting (fixed from 6.15)
 
 CVE_STATUS[CVE-2025-22114] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2025-22115 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22115 needs backporting (fixed from 6.15)
 
-# CVE-2025-22116 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22116 needs backporting (fixed from 6.15)
 
-# CVE-2025-22117 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22117 needs backporting (fixed from 6.15)
 
 CVE_STATUS[CVE-2025-22118] = "fixed-version: only affects 6.13 onwards"
 
@@ -12394,39 +12394,39 @@ CVE_STATUS[CVE-2025-22119] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2025-22120] = "cpe-stable-backport: Backported in 6.12.26"
 
-# CVE-2025-22121 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22121 needs backporting (fixed from 6.15)
 
-# CVE-2025-22122 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22122 needs backporting (fixed from 6.15)
 
-# CVE-2025-22123 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22123 needs backporting (fixed from 6.15)
 
-# CVE-2025-22124 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22124 needs backporting (fixed from 6.15)
 
-# CVE-2025-22125 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22125 needs backporting (fixed from 6.15)
 
 CVE_STATUS[CVE-2025-22126] = "cpe-stable-backport: Backported in 6.12.25"
 
-# CVE-2025-22127 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22127 needs backporting (fixed from 6.15)
 
-# CVE-2025-22128 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22128 needs backporting (fixed from 6.15)
 
-# CVE-2025-23129 needs backporting (fixed from 6.15rc1)
+# CVE-2025-23129 needs backporting (fixed from 6.15)
 
-# CVE-2025-23130 needs backporting (fixed from 6.15rc1)
+# CVE-2025-23130 needs backporting (fixed from 6.15)
 
-# CVE-2025-23131 needs backporting (fixed from 6.15rc1)
+# CVE-2025-23131 needs backporting (fixed from 6.15)
 
-# CVE-2025-23132 needs backporting (fixed from 6.15rc1)
+# CVE-2025-23132 needs backporting (fixed from 6.15)
 
-# CVE-2025-23133 needs backporting (fixed from 6.15rc1)
+# CVE-2025-23133 needs backporting (fixed from 6.15)
 
 CVE_STATUS[CVE-2025-23134] = "cpe-stable-backport: Backported in 6.12.23"
 
-# CVE-2025-23135 needs backporting (fixed from 6.15rc1)
+# CVE-2025-23135 needs backporting (fixed from 6.15)
 
 CVE_STATUS[CVE-2025-23136] = "cpe-stable-backport: Backported in 6.12.23"
 
-# CVE-2025-23137 needs backporting (fixed from 6.15rc1)
+# CVE-2025-23137 needs backporting (fixed from 6.15)
 
 CVE_STATUS[CVE-2025-23138] = "cpe-stable-backport: Backported in 6.12.23"
 
@@ -12460,7 +12460,7 @@ CVE_STATUS[CVE-2025-23153] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2025-23154] = "cpe-stable-backport: Backported in 6.12.24"
 
-# CVE-2025-23155 needs backporting (fixed from 6.15rc1)
+# CVE-2025-23155 needs backporting (fixed from 6.15)
 
 CVE_STATUS[CVE-2025-23156] = "cpe-stable-backport: Backported in 6.12.24"
 
@@ -12488,13 +12488,13 @@ CVE_STATUS[CVE-2025-37741] = "cpe-stable-backport: Backported in 6.12.24"
 
 CVE_STATUS[CVE-2025-37742] = "cpe-stable-backport: Backported in 6.12.24"
 
-# CVE-2025-37743 needs backporting (fixed from 6.15rc1)
+# CVE-2025-37743 needs backporting (fixed from 6.15)
 
 CVE_STATUS[CVE-2025-37744] = "cpe-stable-backport: Backported in 6.12.24"
 
 CVE_STATUS[CVE-2025-37745] = "cpe-stable-backport: Backported in 6.12.24"
 
-# CVE-2025-37746 needs backporting (fixed from 6.15rc1)
+# CVE-2025-37746 needs backporting (fixed from 6.15)
 
 CVE_STATUS[CVE-2025-37747] = "cpe-stable-backport: Backported in 6.12.24"
 
@@ -12508,8 +12508,6 @@ CVE_STATUS[CVE-2025-37751] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2025-37752] = "cpe-stable-backport: Backported in 6.12.24"
 
-CVE_STATUS[CVE-2025-37753] = "fixed-version: only affects 6.15rc1 onwards"
-
 CVE_STATUS[CVE-2025-37754] = "cpe-stable-backport: Backported in 6.12.24"
 
 CVE_STATUS[CVE-2025-37755] = "cpe-stable-backport: Backported in 6.12.24"
@@ -12606,7 +12604,7 @@ CVE_STATUS[CVE-2025-37801] = "cpe-stable-backport: Backported in 6.12.26"
 
 CVE_STATUS[CVE-2025-37802] = "cpe-stable-backport: Backported in 6.12.26"
 
-# CVE-2025-37803 needs backporting (fixed from 6.15rc2)
+# CVE-2025-37803 needs backporting (fixed from 6.15)
 
 CVE_STATUS[CVE-2025-37805] = "cpe-stable-backport: Backported in 6.12.26"
 
@@ -12640,7 +12638,7 @@ CVE_STATUS[CVE-2025-37819] = "cpe-stable-backport: Backported in 6.12.26"
 
 CVE_STATUS[CVE-2025-37820] = "cpe-stable-backport: Backported in 6.12.26"
 
-# CVE-2025-37821 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37821] = "cpe-stable-backport: Backported in 6.12.29"
 
 CVE_STATUS[CVE-2025-37822] = "cpe-stable-backport: Backported in 6.12.26"
 
@@ -12680,7 +12678,7 @@ CVE_STATUS[CVE-2025-37840] = "cpe-stable-backport: Backported in 6.12.24"
 
 CVE_STATUS[CVE-2025-37841] = "cpe-stable-backport: Backported in 6.12.24"
 
-# CVE-2025-37842 needs backporting (fixed from 6.15rc1)
+# CVE-2025-37842 needs backporting (fixed from 6.15)
 
 CVE_STATUS[CVE-2025-37843] = "cpe-stable-backport: Backported in 6.12.24"
 
@@ -12706,7 +12704,7 @@ CVE_STATUS[CVE-2025-37853] = "cpe-stable-backport: Backported in 6.12.24"
 
 CVE_STATUS[CVE-2025-37854] = "cpe-stable-backport: Backported in 6.12.24"
 
-# CVE-2025-37855 needs backporting (fixed from 6.15rc1)
+# CVE-2025-37855 needs backporting (fixed from 6.15)
 
 CVE_STATUS[CVE-2025-37856] = "cpe-stable-backport: Backported in 6.12.24"
 
@@ -12716,7 +12714,7 @@ CVE_STATUS[CVE-2025-37858] = "cpe-stable-backport: Backported in 6.12.24"
 
 CVE_STATUS[CVE-2025-37859] = "cpe-stable-backport: Backported in 6.12.24"
 
-# CVE-2025-37860 needs backporting (fixed from 6.15rc1)
+# CVE-2025-37860 needs backporting (fixed from 6.15)
 
 CVE_STATUS[CVE-2025-37861] = "cpe-stable-backport: Backported in 6.12.24"
 
@@ -12756,7 +12754,7 @@ CVE_STATUS[CVE-2025-37878] = "cpe-stable-backport: Backported in 6.12.26"
 
 CVE_STATUS[CVE-2025-37879] = "cpe-stable-backport: Backported in 6.12.26"
 
-# CVE-2025-37880 needs backporting (fixed from 6.15rc1)
+# CVE-2025-37880 needs backporting (fixed from 6.15)
 
 CVE_STATUS[CVE-2025-37881] = "cpe-stable-backport: Backported in 6.12.26"
 
@@ -12776,99 +12774,97 @@ CVE_STATUS[CVE-2025-37888] = "cpe-stable-backport: Backported in 6.12.26"
 
 CVE_STATUS[CVE-2025-37889] = "cpe-stable-backport: Backported in 6.12.20"
 
-# CVE-2025-37890 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37890] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37891 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37891] = "cpe-stable-backport: Backported in 6.12.28"
 
 CVE_STATUS[CVE-2025-37892] = "cpe-stable-backport: Backported in 6.12.24"
 
 CVE_STATUS[CVE-2025-37893] = "cpe-stable-backport: Backported in 6.12.23"
 
-# CVE-2025-37894 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37894] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37895 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37895] = "cpe-stable-backport: Backported in 6.12.28"
 
 CVE_STATUS[CVE-2025-37896] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2025-37897 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37897] = "cpe-stable-backport: Backported in 6.12.28"
 
 CVE_STATUS[CVE-2025-37898] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2025-37899 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37899] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37900 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37900] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37901 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37901] = "cpe-stable-backport: Backported in 6.12.28"
 
-CVE_STATUS[CVE-2025-37902] = "fixed-version: only affects 6.15rc5 onwards"
-
-# CVE-2025-37903 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37903] = "cpe-stable-backport: Backported in 6.12.28"
 
 CVE_STATUS[CVE-2025-37904] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2025-37905 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37905] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37906 needs backporting (fixed from 6.15rc4)
+# CVE-2025-37906 needs backporting (fixed from 6.15)
 
-# CVE-2025-37907 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37907] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37908 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37908] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37909 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37909] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37910 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37910] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37911 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37911] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37912 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37912] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37913 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37913] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37914 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37914] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37915 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37915] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37916 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37916] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37917 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37917] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37918 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37918] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37919 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37919] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37920 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37920] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37921 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37921] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37922 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37922] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37923 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37923] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37924 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37924] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37925 needs backporting (fixed from 6.15rc1)
+# CVE-2025-37925 needs backporting (fixed from 6.15)
 
-# CVE-2025-37926 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37926] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37927 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37927] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37928 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37928] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37929 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37929] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37930 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37930] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37931 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37931] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37932 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37932] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37933 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37933] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37934 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37934] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37935 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37935] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37936 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37936] = "cpe-stable-backport: Backported in 6.12.28"
 
 CVE_STATUS[CVE-2025-37937] = "cpe-stable-backport: Backported in 6.12.23"
 
@@ -12888,63 +12884,63 @@ CVE_STATUS[CVE-2025-37944] = "cpe-stable-backport: Backported in 6.12.25"
 
 CVE_STATUS[CVE-2025-37945] = "cpe-stable-backport: Backported in 6.12.24"
 
-# CVE-2025-37946 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37946] = "cpe-stable-backport: Backported in 6.12.29"
 
-# CVE-2025-37947 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37947] = "cpe-stable-backport: Backported in 6.12.29"
 
-# CVE-2025-37948 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37948] = "cpe-stable-backport: Backported in 6.12.29"
 
-# CVE-2025-37949 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37949] = "cpe-stable-backport: Backported in 6.12.29"
 
 CVE_STATUS[CVE-2025-37950] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2025-37951 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37951] = "cpe-stable-backport: Backported in 6.12.29"
 
-# CVE-2025-37952 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37952] = "cpe-stable-backport: Backported in 6.12.29"
 
-# CVE-2025-37953 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37953] = "cpe-stable-backport: Backported in 6.12.29"
 
-# CVE-2025-37954 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37954] = "cpe-stable-backport: Backported in 6.12.29"
 
-# CVE-2025-37955 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37955] = "cpe-stable-backport: Backported in 6.12.29"
 
-# CVE-2025-37956 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37956] = "cpe-stable-backport: Backported in 6.12.29"
 
-# CVE-2025-37957 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37957] = "cpe-stable-backport: Backported in 6.12.29"
 
-# CVE-2025-37958 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37958] = "cpe-stable-backport: Backported in 6.12.29"
 
-# CVE-2025-37959 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37959] = "cpe-stable-backport: Backported in 6.12.29"
 
-# CVE-2025-37960 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37960] = "cpe-stable-backport: Backported in 6.12.29"
 
-# CVE-2025-37961 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37961] = "cpe-stable-backport: Backported in 6.12.29"
 
-# CVE-2025-37962 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37962] = "cpe-stable-backport: Backported in 6.12.29"
 
-# CVE-2025-37963 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37963] = "cpe-stable-backport: Backported in 6.12.29"
 
-# CVE-2025-37964 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37964] = "cpe-stable-backport: Backported in 6.12.29"
 
-# CVE-2025-37965 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37965] = "cpe-stable-backport: Backported in 6.12.29"
 
 CVE_STATUS[CVE-2025-37966] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2025-37967 may need backporting (fixed from 6.12.30)
+CVE_STATUS[CVE-2025-37967] = "cpe-stable-backport: Backported in 6.12.30"
 
-# CVE-2025-37968 may need backporting (fixed from 6.12.30)
+CVE_STATUS[CVE-2025-37968] = "cpe-stable-backport: Backported in 6.12.30"
 
-# CVE-2025-37969 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37969] = "cpe-stable-backport: Backported in 6.12.29"
 
-# CVE-2025-37970 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37970] = "cpe-stable-backport: Backported in 6.12.29"
 
-# CVE-2025-37971 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37971] = "cpe-stable-backport: Backported in 6.12.29"
 
-# CVE-2025-37972 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37972] = "cpe-stable-backport: Backported in 6.12.29"
 
-# CVE-2025-37973 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37973] = "cpe-stable-backport: Backported in 6.12.29"
 
-# CVE-2025-37974 may need backporting (fixed from 6.12.29)
+CVE_STATUS[CVE-2025-37974] = "cpe-stable-backport: Backported in 6.12.29"
 
 CVE_STATUS[CVE-2025-37975] = "cpe-stable-backport: Backported in 6.12.25"
 
@@ -12964,7 +12960,7 @@ CVE_STATUS[CVE-2025-37982] = "cpe-stable-backport: Backported in 6.12.25"
 
 CVE_STATUS[CVE-2025-37983] = "cpe-stable-backport: Backported in 6.12.26"
 
-# CVE-2025-37984 needs backporting (fixed from 6.15rc1)
+# CVE-2025-37984 needs backporting (fixed from 6.15)
 
 CVE_STATUS[CVE-2025-37985] = "cpe-stable-backport: Backported in 6.12.26"
 
@@ -12976,13 +12972,15 @@ CVE_STATUS[CVE-2025-37988] = "cpe-stable-backport: Backported in 6.12.26"
 
 CVE_STATUS[CVE-2025-37989] = "cpe-stable-backport: Backported in 6.12.26"
 
-# CVE-2025-37990 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37990] = "cpe-stable-backport: Backported in 6.12.28"
+
+CVE_STATUS[CVE-2025-37991] = "cpe-stable-backport: Backported in 6.12.28"
 
-# CVE-2025-37991 may need backporting (fixed from 6.12.28)
+CVE_STATUS[CVE-2025-37992] = "cpe-stable-backport: Backported in 6.12.30"
 
 CVE_STATUS[CVE-2025-38049] = "cpe-stable-backport: Backported in 6.12.23"
 
-# CVE-2025-38104 needs backporting (fixed from 6.15rc1)
+# CVE-2025-38104 needs backporting (fixed from 6.15)
 
 CVE_STATUS[CVE-2025-38152] = "cpe-stable-backport: Backported in 6.12.23"
 
@@ -13008,11 +13006,11 @@ CVE_STATUS[CVE-2025-39930] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2025-39989] = "cpe-stable-backport: Backported in 6.12.23"
 
-# CVE-2025-40014 needs backporting (fixed from 6.15rc1)
+# CVE-2025-40014 needs backporting (fixed from 6.15)
 
 CVE_STATUS[CVE-2025-40114] = "cpe-stable-backport: Backported in 6.12.23"
 
-# CVE-2025-40325 needs backporting (fixed from 6.15rc1)
+# CVE-2025-40325 needs backporting (fixed from 6.15)
 
 # CVE-2025-40364 has no known resolution
 
-- 
2.43.0


