Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7DB6C83038
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 03:12:50 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.15055.1751425961899883086
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 20:12:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nftfYNWH;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.170, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-748fe69a7baso6126929b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 20:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751425961; x=1752030761; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OrlNXcj1CrZTvQoG5AOH3EoUM8w7oVQkkviuzensSmc=;
        b=nftfYNWHHZ2GEIdGlivlYwt6PYPryvo8Dh7k4RZzLSehQyizcJkm6dD4AF8mRbX12b
         smWBmF35DLoGJdM+fJHije6V0k7ygBfWOOfZCHm7USoCnBKuOrceT+V42Ja2Iu1hWN1U
         ZZ1D92ZpiHNP2+7cjBWeFzTakzpoQcKuOrZZA8PRSq5r3VK38d76TlFIf9LmKZvFznb2
         naLx50KK1pHHZMCEyFHlO4jVqQJmOYo+az6oxFoXmBIrbo1U53ib1w4UNmN7HorUSoJy
         KxWda7fBkPeA0OKLcpUALz4lz75iLAKhwve6Yt92O0D0vC7dMBCtmfDF2cvJeLHcgayM
         L6tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751425961; x=1752030761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OrlNXcj1CrZTvQoG5AOH3EoUM8w7oVQkkviuzensSmc=;
        b=vQ9625CipCcl8reY0MYNjIHJ1CHdYflD/q475gr4ol8lbQQfbqME1wNL9iO6k0pPKH
         2epEqtDdUPmR8T0mpPIZH4knEw1mCnp+qpQWr2U/pF5vNAnjAW+cvJehCZvQOpfd+iiT
         /VxtSIgkc7Pjcbo47fs0NrTEkDBibp1yrTapEqwpOMRXVVPeXTUgqMUwkceYB9dRrPZJ
         0a8dIIi1jz7LDPEjKnb5vTsBWowawvPNRFmEdSe5tBCt848qrs3L6jPCvqt/fJ22LdS/
         CzsJXnTcnvVJ+jKGQesoP1TDXofA6HO8ZYfiINZuPJo4C9z4HIvKia4DDHtfuZd9S0qj
         87Qw==
X-Gm-Message-State: AOJu0YzNsw/t0O8JU4Uf1gwCJ9xqSqMF1ugHXBT2q83jG9qdS4KHauHw
	k5ks5F2XSZ3lMpEMYuwiTU736JYhspUMtM4s9eu6Nq6C9tY04+JPjOxvzgEjipJIRvO4JSI7uTQ
	+YqRW
X-Gm-Gg: ASbGncuv4CqlBhpafhyAG1UJXLwLOc0fQfuYQrWZQBcT9G1nCOi2pyS8wDJj7an73JY
	GbO7OLAIIt2XGYgnAEadCWnnQp6Bx2g5oA2l5H4gsO6sbKuQE0D/xyZJ1oLS7FTu2c88kO54LiX
	ewbeLXymMXoA3R8KPzVjZIMrqDGJudy7esugxNGWF57Q7NJNWXgeWgpcmMyDc+xXkgXiI0pI6g+
	Alf6LBOjg0DL39ZcravEvh6tb9GR14wuGR1Ps0dozTSBsI4+d1goX1SX6BjwpwxxHGfifVtbOo6
	tliLLwaOZNtS7tV4jzyTzIVvITaYx7nrwHI/nyvEJ8R2nLMECJkOEw==
X-Google-Smtp-Source: AGHT+IGfsvtpU/t2sxOj+K7MpoNdwDqgLxOTZCaO0NMYIcu/Xr1E3lLciGM1lMKW/CFv7PJLRvtNOQ==
X-Received: by 2002:a05:6a20:6a0a:b0:1f5:717b:46dc with SMTP id adf61e73a8af0-222d7e8389amr2570830637.27.1751425960961;
        Tue, 01 Jul 2025 20:12:40 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34f8:320a:2e39:118e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af58069a9sm13633241b3a.174.2025.07.01.20.12.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 20:12:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 11/19] cve-exclusion_6.12.inc: Update using current cvelistV5
Date: Tue,  1 Jul 2025 20:11:56 -0700
Message-ID: <131b9ee79e4377c0a5ca1ba09d1ecd313548af00.1751425749.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751425749.git.steve@sakoman.com>
References: <cover.1751425749.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 03:12:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219765

From: Niko Mauno <niko.mauno@vaisala.com>

Regenerated with

 ./generate-cve-exclusions.py ~/cvelistV5/ 6.12.27 > cve-exclusion_6.12.inc

With ~/cvelistV5/ containing clone from
https://github.com/CVEProject/cvelistV5.git repository main branch at
git hash b20d0043711588b6409ae3118bc0510ab888c316.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0df05f0bf82fdffb14c4243d07ace22b2d7e4c79)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/cve-exclusion_6.12.inc              | 226 ++++++++++++++++--
 1 file changed, 208 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index 656d1f6898..49d8bfcf0c 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,6 +1,6 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-05-12 13:07:15.166162+00:00 for version 6.12.27
+# Generated at 2025-05-24 07:35:37.850677+00:00 for version 6.12.27
 
 python check_kernel_cve_status_version() {
     this_version = "6.12.27"
@@ -1956,7 +1956,7 @@ CVE_STATUS[CVE-2022-48840] = "fixed-version: Fixed from version 5.16.17"
 
 CVE_STATUS[CVE-2022-48841] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2022-48842] = "fixed-version: Fixed from version 5.17"
+CVE_STATUS[CVE-2022-48842] = "fixed-version: Fixed from version 5.16.16"
 
 CVE_STATUS[CVE-2022-48843] = "fixed-version: Fixed from version 5.17"
 
@@ -2358,8 +2358,6 @@ CVE_STATUS[CVE-2022-49054] = "fixed-version: Fixed from version 5.18"
 
 CVE_STATUS[CVE-2022-49055] = "fixed-version: Fixed from version 5.18"
 
-CVE_STATUS[CVE-2022-49056] = "fixed-version: Fixed from version 5.17.4"
-
 CVE_STATUS[CVE-2022-49057] = "fixed-version: Fixed from version 5.18"
 
 CVE_STATUS[CVE-2022-49058] = "fixed-version: Fixed from version 5.18"
@@ -4078,8 +4076,6 @@ CVE_STATUS[CVE-2022-49931] = "fixed-version: Fixed from version 6.1"
 
 CVE_STATUS[CVE-2022-49932] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2022-49933] = "fixed-version: Fixed from version 6.3"
-
 # CVE-2023-34319 has no known resolution
 
 # CVE-2023-34324 has no known resolution
@@ -4564,7 +4560,7 @@ CVE_STATUS[CVE-2023-52731] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2023-52732] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2023-52733] = "fixed-version: Fixed from version 6.2"
+# CVE-2023-52733 has no known resolution
 
 CVE_STATUS[CVE-2023-52735] = "fixed-version: Fixed from version 6.2"
 
@@ -5284,6 +5280,8 @@ CVE_STATUS[CVE-2023-53144] = "fixed-version: Fixed from version 6.3"
 
 CVE_STATUS[CVE-2023-53145] = "fixed-version: Fixed from version 6.3"
 
+CVE_STATUS[CVE-2023-53146] = "fixed-version: Fixed from version 6.6"
+
 CVE_STATUS[CVE-2024-26581] = "fixed-version: Fixed from version 6.8"
 
 CVE_STATUS[CVE-2024-26582] = "fixed-version: Fixed from version 6.8"
@@ -11438,8 +11436,6 @@ CVE_STATUS[CVE-2025-21631] = "cpe-stable-backport: Backported in 6.12.10"
 
 CVE_STATUS[CVE-2025-21632] = "cpe-stable-backport: Backported in 6.12.10"
 
-CVE_STATUS[CVE-2025-21633] = "cpe-stable-backport: Backported in 6.12.10"
-
 CVE_STATUS[CVE-2025-21634] = "cpe-stable-backport: Backported in 6.12.10"
 
 CVE_STATUS[CVE-2025-21635] = "cpe-stable-backport: Backported in 6.12.10"
@@ -11544,8 +11540,6 @@ CVE_STATUS[CVE-2025-21684] = "cpe-stable-backport: Backported in 6.12.11"
 
 CVE_STATUS[CVE-2025-21685] = "cpe-stable-backport: Backported in 6.12.11"
 
-CVE_STATUS[CVE-2025-21686] = "cpe-stable-backport: Backported in 6.12.12"
-
 CVE_STATUS[CVE-2025-21687] = "cpe-stable-backport: Backported in 6.12.12"
 
 CVE_STATUS[CVE-2025-21688] = "fixed-version: only affects 6.13 onwards"
@@ -11836,8 +11830,6 @@ CVE_STATUS[CVE-2025-21835] = "cpe-stable-backport: Backported in 6.12.16"
 
 CVE_STATUS[CVE-2025-21836] = "cpe-stable-backport: Backported in 6.12.16"
 
-# CVE-2025-21837 needs backporting (fixed from 6.14)
-
 CVE_STATUS[CVE-2025-21838] = "cpe-stable-backport: Backported in 6.12.16"
 
 CVE_STATUS[CVE-2025-21839] = "cpe-stable-backport: Backported in 6.12.16"
@@ -12364,7 +12356,7 @@ CVE_STATUS[CVE-2025-22100] = "fixed-version: only affects 6.13 onwards"
 
 # CVE-2025-22101 needs backporting (fixed from 6.15rc1)
 
-# CVE-2025-22102 needs backporting (fixed from 6.15rc1)
+# CVE-2025-22102 needs backporting (fixed from 6.12.30)
 
 # CVE-2025-22103 needs backporting (fixed from 6.15rc1)
 
@@ -12616,8 +12608,6 @@ CVE_STATUS[CVE-2025-37802] = "cpe-stable-backport: Backported in 6.12.26"
 
 # CVE-2025-37803 needs backporting (fixed from 6.15rc2)
 
-CVE_STATUS[CVE-2025-37804] = "cpe-stable-backport: Backported in 6.12.26"
-
 CVE_STATUS[CVE-2025-37805] = "cpe-stable-backport: Backported in 6.12.26"
 
 CVE_STATUS[CVE-2025-37806] = "cpe-stable-backport: Backported in 6.12.26"
@@ -12650,7 +12640,7 @@ CVE_STATUS[CVE-2025-37819] = "cpe-stable-backport: Backported in 6.12.26"
 
 CVE_STATUS[CVE-2025-37820] = "cpe-stable-backport: Backported in 6.12.26"
 
-# CVE-2025-37821 needs backporting (fixed from 6.15rc4)
+# CVE-2025-37821 needs backporting (fixed from 6.12.29)
 
 CVE_STATUS[CVE-2025-37822] = "cpe-stable-backport: Backported in 6.12.26"
 
@@ -12766,7 +12756,7 @@ CVE_STATUS[CVE-2025-37878] = "cpe-stable-backport: Backported in 6.12.26"
 
 CVE_STATUS[CVE-2025-37879] = "cpe-stable-backport: Backported in 6.12.26"
 
-CVE_STATUS[CVE-2025-37880] = "cpe-stable-backport: Backported in 6.12.26"
+# CVE-2025-37880 needs backporting (fixed from 6.15rc1)
 
 CVE_STATUS[CVE-2025-37881] = "cpe-stable-backport: Backported in 6.12.26"
 
@@ -12786,10 +12776,210 @@ CVE_STATUS[CVE-2025-37888] = "cpe-stable-backport: Backported in 6.12.26"
 
 CVE_STATUS[CVE-2025-37889] = "cpe-stable-backport: Backported in 6.12.20"
 
+# CVE-2025-37890 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37891 needs backporting (fixed from 6.12.28)
+
+CVE_STATUS[CVE-2025-37892] = "cpe-stable-backport: Backported in 6.12.24"
+
 CVE_STATUS[CVE-2025-37893] = "cpe-stable-backport: Backported in 6.12.23"
 
+# CVE-2025-37894 needs backporting (fixed from 6.12.28)
+
+CVE_STATUS[CVE-2025-37895] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-37896] = "fixed-version: only affects 6.14 onwards"
+
+# CVE-2025-37897 needs backporting (fixed from 6.12.28)
+
+CVE_STATUS[CVE-2025-37898] = "fixed-version: only affects 6.13 onwards"
+
+# CVE-2025-37899 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37900 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37901 needs backporting (fixed from 6.12.28)
+
+CVE_STATUS[CVE-2025-37902] = "fixed-version: only affects 6.15rc5 onwards"
+
+# CVE-2025-37903 needs backporting (fixed from 6.12.28)
+
+CVE_STATUS[CVE-2025-37904] = "fixed-version: only affects 6.13 onwards"
+
+# CVE-2025-37905 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37906 needs backporting (fixed from 6.15rc4)
+
+# CVE-2025-37907 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37908 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37909 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37910 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37911 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37912 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37913 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37914 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37915 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37916 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37917 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37918 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37919 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37920 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37921 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37922 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37923 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37924 needs backporting (fixed from 6.12.28)
+
 # CVE-2025-37925 needs backporting (fixed from 6.15rc1)
 
+# CVE-2025-37926 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37927 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37928 needs backporting (fixed from 6.12.28)
+
+CVE_STATUS[CVE-2025-37929] = "fixed-version: only affects 6.15rc1 onwards"
+
+# CVE-2025-37930 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37931 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37932 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37933 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37934 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37935 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37936 needs backporting (fixed from 6.12.28)
+
+CVE_STATUS[CVE-2025-37937] = "cpe-stable-backport: Backported in 6.12.23"
+
+CVE_STATUS[CVE-2025-37938] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37939] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-37940] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37941] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37942] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37943] = "cpe-stable-backport: Backported in 6.12.24"
+
+CVE_STATUS[CVE-2025-37944] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37945] = "cpe-stable-backport: Backported in 6.12.24"
+
+# CVE-2025-37946 needs backporting (fixed from 6.12.29)
+
+# CVE-2025-37947 needs backporting (fixed from 6.12.29)
+
+# CVE-2025-37948 needs backporting (fixed from 6.12.29)
+
+# CVE-2025-37949 needs backporting (fixed from 6.12.29)
+
+CVE_STATUS[CVE-2025-37950] = "fixed-version: only affects 6.14 onwards"
+
+# CVE-2025-37951 needs backporting (fixed from 6.12.29)
+
+# CVE-2025-37952 needs backporting (fixed from 6.12.29)
+
+CVE_STATUS[CVE-2025-37953] = "fixed-version: only affects 6.15rc2 onwards"
+
+# CVE-2025-37954 needs backporting (fixed from 6.12.29)
+
+# CVE-2025-37955 needs backporting (fixed from 6.12.29)
+
+# CVE-2025-37956 needs backporting (fixed from 6.12.29)
+
+# CVE-2025-37957 needs backporting (fixed from 6.12.29)
+
+# CVE-2025-37958 needs backporting (fixed from 6.12.29)
+
+# CVE-2025-37959 needs backporting (fixed from 6.12.29)
+
+# CVE-2025-37960 needs backporting (fixed from 6.12.29)
+
+# CVE-2025-37961 needs backporting (fixed from 6.12.29)
+
+CVE_STATUS[CVE-2025-37962] = "fixed-version: only affects 6.15rc1 onwards"
+
+# CVE-2025-37963 needs backporting (fixed from 6.12.29)
+
+CVE_STATUS[CVE-2025-37964] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-37965] = "fixed-version: only affects 6.15rc2 onwards"
+
+CVE_STATUS[CVE-2025-37966] = "fixed-version: only affects 6.13 onwards"
+
+# CVE-2025-37967 needs backporting (fixed from 6.12.30)
+
+# CVE-2025-37968 needs backporting (fixed from 6.12.30)
+
+# CVE-2025-37969 needs backporting (fixed from 6.12.29)
+
+# CVE-2025-37970 needs backporting (fixed from 6.12.29)
+
+# CVE-2025-37971 needs backporting (fixed from 6.12.29)
+
+# CVE-2025-37972 needs backporting (fixed from 6.12.29)
+
+# CVE-2025-37973 needs backporting (fixed from 6.12.29)
+
+CVE_STATUS[CVE-2025-37974] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-37975] = "cpe-stable-backport: Backported in 6.12.25"
+
+# CVE-2025-37976 has no known resolution
+
+CVE_STATUS[CVE-2025-37977] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37978] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37979] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37980] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37981] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37982] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-37983] = "cpe-stable-backport: Backported in 6.12.26"
+
+# CVE-2025-37984 needs backporting (fixed from 6.15rc1)
+
+CVE_STATUS[CVE-2025-37985] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37986] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37987] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37988] = "cpe-stable-backport: Backported in 6.12.26"
+
+CVE_STATUS[CVE-2025-37989] = "cpe-stable-backport: Backported in 6.12.26"
+
+# CVE-2025-37990 needs backporting (fixed from 6.12.28)
+
+# CVE-2025-37991 needs backporting (fixed from 6.12.28)
+
 CVE_STATUS[CVE-2025-38049] = "cpe-stable-backport: Backported in 6.12.23"
 
 # CVE-2025-38104 needs backporting (fixed from 6.15rc1)
-- 
2.43.0


