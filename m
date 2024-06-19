Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00F93C2BA15
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 09:00:12 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.16266.1718787610740835095
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 02:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l0EnYxrc;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-36087277246so2958236f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 02:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718787609; x=1719392409; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TTTcIye1o5SdSKdjKVA4BW2gImAzq5Mx+6WIYbpCCEA=;
        b=l0EnYxrcIrusa5Vt9HF7lCS3kqwSCVz1r7/ir21DPGWbqcGQk3dnh1w7T2J0YNf+cQ
         5Em+lSiJ2BGsLrmNq1Jy9Jqykxb35HSGPSm2fxYGkuCy1yC+GBHuJ2ZDm9ufVEteFshb
         WX8df9/PcZKeGz2DoN8+TFCmRutZY1OHJlsUJHqKYm3HBcTNCVz6Bb4j+KWeXSM8ZgzX
         El3Lnvv85w3iCht0380nbODqkfTgXJYfGI3WxLEllKW1vy/2Bongwb9R38PRta5vZ1vH
         +It61nBjJyiHxYIVjl4akbfXVaaxILxjkK6RJoKg96rVHq42cEsa+Wvy2b3lN8rAor/S
         PXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718787609; x=1719392409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TTTcIye1o5SdSKdjKVA4BW2gImAzq5Mx+6WIYbpCCEA=;
        b=RigqT+NoaHEv0N4GcpYJC4CrXmYU3ZF3sUY0Ofqr55+xgSI7IN9xysFiDS95J+vXkx
         WkUvshkZbLsYUI7pivf7/YoDKB4m7RoY+lW193QPY7Gwss8UMe0PovoYu0tf0qYaghao
         6OCbXbzHiQllKE1ll5DPbIfuvywAxh62805tOonPiwFJn6n/b+DVm5bI+qPS44oTYjn1
         QPkIPxPLUaN4LrPmCN2U8V797XMpPvwMVpHdMJrxIaZCkKZf+X4FhYjItSi33B3izB2c
         Sov+SyKf5QL/0NpzWAoYMeHFXBKJSHzQ862bzELefF/ijGm6BBhE72uefT8+TEdUybBc
         8sHw==
X-Gm-Message-State: AOJu0YzSTqAs/8+z9sAb0g3SsUJT8QrsXU79kXWuXzeBj9SSd0It/3eH
	uXIR14Y+/7UVC8X0NQZYcmFajCJBfZlkBajNYckIZK5gm44EHjuVKXmHHg==
X-Google-Smtp-Source: AGHT+IGHFI+Qyw17Zsp0bRc5E2+hh0qO9fmTc6xo5UM9e7ylKpfwn9InyjQJGI8FTyWDtsTR6Rii+Q==
X-Received: by 2002:adf:fe46:0:b0:362:7c2e:e9f7 with SMTP id ffacd0b85a97d-36317c7a051mr1361962f8f.32.1718787609155;
        Wed, 19 Jun 2024 02:00:09 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36076515a80sm16401876f8f.76.2024.06.19.02.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 02:00:08 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/15] dpkg: mark patches adding custom non-debian architectures as inappropriate for upstream
Date: Wed, 19 Jun 2024 10:59:56 +0200
Message-Id: <20240619085957.2787700-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240619085957.2787700-1-alex.kanavin@gmail.com>
References: <20240619085957.2787700-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 09:00:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200900

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch            | 2 +-
 .../dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch             | 2 +-
 .../dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch   | 2 +-
 meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch   | 2 +-
 meta/recipes-devtools/dpkg/dpkg/arch_pm.patch                   | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch b/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch
index b8a86975851..99044fbb1a9 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-Add-support-for-riscv32-CPU.patch
@@ -3,7 +3,7 @@ From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 29 Apr 2020 22:02:23 -0700
 Subject: [PATCH] Add support for riscv32 CPU
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [not a debian architecture]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  data/cputable                 | 1 +
diff --git a/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch b/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch
index e8d8576f859..602a0b22c5d 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0001-dpkg-Support-muslx32-build.patch
@@ -3,7 +3,7 @@ From: sweeaun <swee.aun.khor@intel.com>
 Date: Sun, 10 Sep 2017 00:14:15 -0700
 Subject: [PATCH] dpkg: Support muslx32 build
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [not a debian architecture]
 Changes made on ostable and tupletable to enable muslx32 build.
 
 Signed-off-by: sweeaun <swee.aun.khor@intel.com>
diff --git a/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch b/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch
index 8ac646b1a13..2573afb8e4d 100644
--- a/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/0006-add-musleabi-to-known-target-tripets.patch
@@ -8,7 +8,7 @@ Content-Transfer-Encoding: 8bit
 
 helps compiling dpkg for musl/arm-softfloat
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [not a debian architecture]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
 ---
diff --git a/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch b/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
index cbdf01dbd9a..b5eaa501722 100644
--- a/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/add_armeb_triplet_entry.patch
@@ -27,7 +27,7 @@ the required combination of "gnueabi-linux-armeb" was not found in
 the triplettable file thereby returning dpkg_arch as
 empty in configure script.
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [not a debian architecture]
 
 Signed-off-by: Krishnanjanappa, Jagadeesh <jagadeesh.krishnanjanappa@caviumnetworks.com>
 Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
diff --git a/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch b/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
index df2cd88ca42..ec5d5034883 100644
--- a/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
+++ b/meta/recipes-devtools/dpkg/dpkg/arch_pm.patch
@@ -8,7 +8,7 @@ architecture for mips64, and possibly other arch's
 because of faulty code added to Arch.pm in the latest
 release from upstream.  We remove that code.
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [not a debian architecture]
 
 Signed-off-by: Joe Slater <jslater@windriver.com>
 ---
-- 
2.39.2


