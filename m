Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9640D44D5E
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 13:33:36 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.45794.1730900014991116315
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 05:33:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=CpyVdgBZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-71e52582cf8so5786723b3a.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 05:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730900014; x=1731504814; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8c+s+3W+0NpknorBHlFgNUbWnfK2UgFBIx5RGBcHAsU=;
        b=CpyVdgBZ5MIBU02jtc5gc6iDD8jDS0JSIM+ZQCdIt0QuFzFOEbFmpgdhaqbt0CiJmc
         MDLvgZuLS1vrUhYXi/9K7QVtzZftpwztXH5/mdNxGcT5ujgXK+/IFsQG1xu4b/WSZg5G
         8PI38xlCURmMhRA5h9ZXVHTAJtZ3lP6H0PkuXB+rfU0v6bJ18zzLwOZku/NkcWkXPWtr
         f4lEZOS+T3QL2bg1DXGvhh/Y+1YZbu0zWhblW+iIdh7UiZWTuPBb212df51WFqtd+j5S
         9wrchT6Unr05V3L4uTUW03qofuRG4mc7daRqXlTUgU1ddMnCO0n+n1Krafyp8MUNH/Ku
         F1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900014; x=1731504814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8c+s+3W+0NpknorBHlFgNUbWnfK2UgFBIx5RGBcHAsU=;
        b=AyFjAf0BhdEAOM6IbUXK12Fbf06PK82Di4zS297Ay41wtRdwCMcunhRuiRV8NAcAaC
         tPs9CtDuBHPxeMPR7tpc2Dk3bv6ZgBLW7GuhU0h8dONrHgIF5UCyh3PtZw837k8Wn+c2
         dyGB1jxI+XGIgWvx3+4KvnT+Tyrt756SpEZa1rplmeUPGSxs30HyoyDEng5FuYBqsEL5
         gLIvr7FzGTzMy39F5k0DFeI0NXY0c9rc2KbRbbYMaHjKGKMe+LaEuvtHedLDN7aJMVTP
         LblCel9ReQhp9Vb+ipcf5aH/67glffVwsf3jr01VvKzZ34Q+fP/g2+VobLKxdak+ISYR
         gqDA==
X-Gm-Message-State: AOJu0YzzTEChV9bAzCeEbGcroK5yrvcBorPNA7Lb5OYA/QgdD54v27oZ
	X11pic6MI6texSMcNMayA7O5VxVxt4p+C1yv3Toyv2CdRwvNQnpVmB6gEEupamCQKWmcRkNGHnH
	8
X-Google-Smtp-Source: AGHT+IHUxLC3xEGq6UdvFlBBmz/3je57EYlnIReB/GI0Eb/+rJR+RwsdTB2OMM0jL0GDLpQlur62mA==
X-Received: by 2002:a05:6a00:808:b0:71d:ee1b:c854 with SMTP id d2e1a72fcca58-720c98d1ff4mr29172603b3a.9.1730900014130;
        Wed, 06 Nov 2024 05:33:34 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1e5722sm11631717b3a.71.2024.11.06.05.33.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 05:33:33 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 3/5] gcc: restore a patch for Neoverse N2 core
Date: Wed,  6 Nov 2024 05:33:20 -0800
Message-Id: <4c75edda8ec28fb8dee19ca90a1ea7f33ba80999.1730899830.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1730899830.git.steve@sakoman.com>
References: <cover.1730899830.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 13:33:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206770

From: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>

Commit 7806e21e7d47 ("gcc: upgrade to v11.5") removed one patch named
0001-aarch64-Update-Neoverse-N2-core-defini.patch by mistake, this will
cause the Neoverse N2 core to be identified as the armv8.5 architecture,
restore this patch to avoid related compilation issues.

Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-11.5.inc        |  1 +
 ...4-Update-Neoverse-N2-core-definition.patch | 40 +++++++++++++++++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse-N2-core-definition.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.5.inc b/meta/recipes-devtools/gcc/gcc-11.5.inc
index 5d29b8e61e..f17ec9da5c 100644
--- a/meta/recipes-devtools/gcc/gcc-11.5.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.5.inc
@@ -65,6 +65,7 @@ SRC_URI = "\
            file://0003-CVE-2021-42574.patch \
            file://0004-CVE-2021-42574.patch \
            file://0001-CVE-2021-46195.patch \
+           file://0001-aarch64-Update-Neoverse-N2-core-definition.patch \
 	   file://0002-aarch64-add-armv9-a-to-march.patch \
 	   file://0003-aarch64-Enable-FP16-feature-by-default-for-Armv9.patch \
 	   file://0004-arm-add-armv9-a-architecture-to-march.patch \
diff --git a/meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse-N2-core-definition.patch b/meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse-N2-core-definition.patch
new file mode 100644
index 0000000000..4159042ebb
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse-N2-core-definition.patch
@@ -0,0 +1,40 @@
+From 30ade014c7b7d22a2a26697b5a2079a278ea560d Mon Sep 17 00:00:00 2001
+From: Andre Vieira <andre.simoesdiasvieira@arm.com>
+Date: Thu, 8 Sep 2022 06:02:18 +0000
+Subject: [PATCH] aarch64: Update Neoverse N2 core definition
+
+commit 9f37d31324f89d0b7b2abac988a976d121ae29c6 from upstream.
+
+gcc/ChangeLog:
+
+        * config/aarch64/aarch64-cores.def: Update Neoverse N2 core entry.
+
+Upstream-Status: Backport
+Signed-off-by: Ruiqiang Hao <Ruiqiang.Hao@windriver.com>
+---
+ gcc/config/aarch64/aarch64-cores.def | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/gcc/config/aarch64/aarch64-cores.def b/gcc/config/aarch64/aarch64-cores.def
+index 0243e3d4d..722f3e64e 100644
+--- a/gcc/config/aarch64/aarch64-cores.def
++++ b/gcc/config/aarch64/aarch64-cores.def
+@@ -147,7 +147,6 @@ AARCH64_CORE("neoverse-512tvb", neoverse512tvb, cortexa57, 8_4A,  AARCH64_FL_FOR
+ AARCH64_CORE("saphira",     saphira,    saphira,    8_4A,  AARCH64_FL_FOR_ARCH8_4 | AARCH64_FL_CRYPTO, saphira,   0x51, 0xC01, -1)
+ 
+ /* Armv8.5-A Architecture Processors.  */
+-AARCH64_CORE("neoverse-n2", neoversen2, cortexa57, 8_5A, AARCH64_FL_FOR_ARCH8_5 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_F16 | AARCH64_FL_SVE | AARCH64_FL_SVE2 | AARCH64_FL_SVE2_BITPERM | AARCH64_FL_RNG | AARCH64_FL_MEMTAG, neoversen2, 0x41, 0xd49, -1)
+ AARCH64_CORE("cobalt-100",   cobalt100, cortexa57, 8_5A, AARCH64_FL_FOR_ARCH8_5 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_F16 | AARCH64_FL_SVE | AARCH64_FL_SVE2 | AARCH64_FL_SVE2_BITPERM | AARCH64_FL_RNG | AARCH64_FL_MEMTAG, neoversen2, 0x6d, 0xd49, -1)
+ AARCH64_CORE("neoverse-v2", neoversev2, cortexa57, 8_5A, AARCH64_FL_FOR_ARCH8_5 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_F16 | AARCH64_FL_SVE | AARCH64_FL_SVE2 | AARCH64_FL_SVE2_BITPERM | AARCH64_FL_RNG | AARCH64_FL_MEMTAG, neoverse512tvb, 0x41, 0xd4f, -1)
+ AARCH64_CORE("grace", grace, cortexa57, 8_5A, AARCH64_FL_FOR_ARCH8_5 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_F16 | AARCH64_FL_CRYPTO | AARCH64_FL_SHA3 | AARCH64_FL_SM4 | AARCH64_FL_SVE | AARCH64_FL_SVE2 | AARCH64_FL_SVE2_BITPERM | AARCH64_FL_SVE2_AES | AARCH64_FL_SVE2_SM4 | AARCH64_FL_SVE2_SHA3, neoverse512tvb, 0x41, 0xd4f, -1)
+@@ -167,4 +166,7 @@ AARCH64_CORE("cortex-a76.cortex-a55",  cortexa76cortexa55, cortexa53, 8_2A,  AAR
+ /* Armv8-R Architecture Processors.  */
+ AARCH64_CORE("cortex-r82", cortexr82, cortexa53, 8R, AARCH64_FL_FOR_ARCH8_R, cortexa53, 0x41, 0xd15, -1)
+ 
++/* Armv9-A Architecture Processors. */
++AARCH64_CORE("neoverse-n2", neoversen2, cortexa57, 9A, AARCH64_FL_FOR_ARCH9 | AARCH64_FL_I8MM | AARCH64_FL_BF16 | AARCH64_FL_F16 | AARCH64_FL_SVE | AARCH64_FL_SVE2 | AARCH64_FL_SVE2_BITPERM | AARCH64_FL_RNG | AARCH64_FL_MEMTAG | AARCH64_FL_PROFILE, neoversen2, 0x41, 0xd49, -1)
++
+ #undef AARCH64_CORE
+-- 
+2.46.2
+
-- 
2.34.1


