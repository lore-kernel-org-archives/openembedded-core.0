Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1221CCAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 18:59:44 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web10.6641.1759172374890021321
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 11:59:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M/kQZcy2;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-869ecba3bd2so182399685a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 11:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759172374; x=1759777174; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FfvU23zbsMlZG+rEGc8QfedKPtGEAsX+Xu/Sv4QPA+Q=;
        b=M/kQZcy23QqoqC4v0TaLDJHkrxyxiHVusZ5IRO+CoZGr22h5pGwJitcX2HoiXV/FsI
         l0d3XTpaBhGwk/CbWGsFHw6IPebipGPpF34hKCOyXYNmQO/cI1YpFAJBlhVpec5/QY0b
         gheltlhSkzunU/AKOZoMB4CQ1NOfsMuV5RCLU//U8PQ/GxBbOK8Mv1DxAeuWD89wa9B3
         uirouhG46fH1GTOMsVrYglj6E35aywcFoSoNEL6JknVinIbaYOHrgbL85kkMhGozipFY
         cYn/Wolir5VlDn8sGtjqUBQLT6/oD8BWVeveOrMwGxl7GIGBxHNcZnGCkztEluPqd4IR
         Hzsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759172374; x=1759777174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FfvU23zbsMlZG+rEGc8QfedKPtGEAsX+Xu/Sv4QPA+Q=;
        b=MoDjBHYs4cd7ZiYhg24vP9W9CiYExtPyR5sdr2ke8q6ZXZ8TrFGKPKkF1lLDbakUCq
         dfnq8A+lsuJ9rULNTBc74mf8rnzOBencfvJleZoL9kHQnKN2tJ3L124Eett3vrSwV2GN
         3nvNi9vz+rg7gh2Nt5rb+DGV5IZ49H45QSzS5aSLGu8PCUt99C1SWUroWgpSG+AtEi9u
         5cIG9B3+qpnso8dCVj9X8hGZ07/gSoHYu9BaEfY1W0hsJaGHEoe/aq2bS9irb6ERf3cD
         e8/i4bZX5Zoxk2hkLEwhEr3jRGV7mOhteyq+5V5qvGdyMImYYuTxwE/ZU9vYGFC1AFmQ
         2T+A==
X-Gm-Message-State: AOJu0YzoxLUEhvXHxqvi56d2glu4rKtJceHSmsIM6Gmzc2TM3442Ylfx
	QOU1JUUA+1DKXd2vimzHSyJt9MQSR9F5/IhkoJ9OytlF3rqXYu+sNbUo2mnlWLhACnw=
X-Gm-Gg: ASbGnctfaHWiIfBIcM5auVpO8ROeNEwytXcVv8o7UoTE3eLWKk7tAMuzQ0mPixvmTa5
	0QNVard2BLx8Ew+sw9HZi5O+1mFWqS+cei9sNfp/9+eYZyq/pnifhUKPBrYcWbqz+XA/hHjKhu+
	HiuI85b2Bmm4Nx5/3ucdcEQDVyov3SHh8gj07ruzRiIXPQrEStaKQfUbS5JqtRAKW8of1gyp5Go
	qfPPaOVd4kAm18nfkxC99j/BUrRuxqpz/ZlqBWt3Zx6vu2L5Y7vVx3vxSo0zwtBn2lUpDkdJpul
	Gs6C4PC6/EMKB8vBdZTawDVuCtXTvsYWs1DV9A+nn7lW2qTqmEjNx3YsHQFtE+snZxqRAc3el1g
	E0vHEAmlG1NqsiHLIJvT0QHheqAsEP2B9Z/7e4BGoS42Ql56IN1Wdeirm6zi9Dbmg8EAjhXxP2H
	cePMRf7yL1s1WAqP033y3S3/CuWShEC8od85cJL0QKTFcum29cn1/TpcePWmL3eHC0ug==
X-Google-Smtp-Source: AGHT+IGLQcFJ13/sNX6JRHLY6bdA7XeMwpc7tXwg54FgoHtcvwLIHD8+688j17XeDY2YF0SmbrFuOw==
X-Received: by 2002:a05:620a:7083:b0:857:3c07:cd28 with SMTP id af79cd13be357-85ae8b3253emr2181369485a.69.1759172373604;
        Mon, 29 Sep 2025 11:59:33 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85c337a1e1csm873240285a.62.2025.09.29.11.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 11:59:33 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto/6.16: update CVE exclusions (6.16.9)
Date: Mon, 29 Sep 2025 14:59:28 -0400
Message-Id: <20250929185930.1689034-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250929185930.1689034-1-bruce.ashfield@gmail.com>
References: <20250929185930.1689034-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 18:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224167

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 1 changes (1 new | 0 updated): - 1 new CVEs: CVE-2025-11135 - 0 updated CVEs:
        Date: Mon, 29 Sep 2025 01:40:51 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.16.inc              | 58 +++++++++++++++++--
 1 file changed, 53 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.16.inc b/meta/recipes-kernel/linux/cve-exclusion_6.16.inc
index a6d72242e2..17776b59a0 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.16.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.16.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-09-22 03:24:59.110083+00:00 for kernel version 6.16.8
-# From linux_kernel_cves cve_2025-09-22_0200Z-2-gd662e5ed470
+# Generated at 2025-09-29 01:46:30.994598+00:00 for kernel version 6.16.9
+# From linux_kernel_cves cve_2025-09-29_0100Z
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.16.8"
+    this_version = "6.16.9"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -4984,8 +4984,6 @@ CVE_STATUS[CVE-2022-50401] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2022-50402] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2022-50403] = "fixed-version: Fixed from version 6.2"
-
 CVE_STATUS[CVE-2022-50404] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2022-50405] = "fixed-version: Fixed from version 6.2"
@@ -12944,6 +12942,8 @@ CVE_STATUS[CVE-2024-58239] = "fixed-version: Fixed from version 6.8"
 
 CVE_STATUS[CVE-2024-58240] = "fixed-version: Fixed from version 6.8"
 
+CVE_STATUS[CVE-2024-58241] = "fixed-version: Fixed from version 6.12"
+
 CVE_STATUS[CVE-2025-21629] = "fixed-version: Fixed from version 6.13"
 
 CVE_STATUS[CVE-2025-21631] = "fixed-version: Fixed from version 6.13"
@@ -16348,6 +16348,54 @@ CVE_STATUS[CVE-2025-39865] = "cpe-stable-backport: Backported in 6.16.6"
 
 CVE_STATUS[CVE-2025-39866] = "cpe-stable-backport: Backported in 6.16.6"
 
+CVE_STATUS[CVE-2025-39867] = "fixed-version: only affects 6.17rc1 onwards"
+
+CVE_STATUS[CVE-2025-39868] = "cpe-stable-backport: Backported in 6.16.8"
+
+CVE_STATUS[CVE-2025-39869] = "cpe-stable-backport: Backported in 6.16.8"
+
+CVE_STATUS[CVE-2025-39870] = "cpe-stable-backport: Backported in 6.16.8"
+
+CVE_STATUS[CVE-2025-39871] = "cpe-stable-backport: Backported in 6.16.8"
+
+CVE_STATUS[CVE-2025-39872] = "cpe-stable-backport: Backported in 6.16.8"
+
+CVE_STATUS[CVE-2025-39873] = "cpe-stable-backport: Backported in 6.16.8"
+
+CVE_STATUS[CVE-2025-39874] = "cpe-stable-backport: Backported in 6.16.8"
+
+CVE_STATUS[CVE-2025-39875] = "cpe-stable-backport: Backported in 6.16.8"
+
+CVE_STATUS[CVE-2025-39876] = "cpe-stable-backport: Backported in 6.16.8"
+
+CVE_STATUS[CVE-2025-39877] = "cpe-stable-backport: Backported in 6.16.8"
+
+CVE_STATUS[CVE-2025-39878] = "cpe-stable-backport: Backported in 6.16.8"
+
+CVE_STATUS[CVE-2025-39879] = "cpe-stable-backport: Backported in 6.16.8"
+
+CVE_STATUS[CVE-2025-39880] = "cpe-stable-backport: Backported in 6.16.8"
+
+CVE_STATUS[CVE-2025-39881] = "cpe-stable-backport: Backported in 6.16.8"
+
+CVE_STATUS[CVE-2025-39882] = "cpe-stable-backport: Backported in 6.16.8"
+
+CVE_STATUS[CVE-2025-39883] = "cpe-stable-backport: Backported in 6.16.8"
+
+CVE_STATUS[CVE-2025-39884] = "cpe-stable-backport: Backported in 6.16.8"
+
+CVE_STATUS[CVE-2025-39885] = "cpe-stable-backport: Backported in 6.16.8"
+
+CVE_STATUS[CVE-2025-39886] = "cpe-stable-backport: Backported in 6.16.8"
+
+CVE_STATUS[CVE-2025-39887] = "cpe-stable-backport: Backported in 6.16.8"
+
+CVE_STATUS[CVE-2025-39888] = "cpe-stable-backport: Backported in 6.16.8"
+
+CVE_STATUS[CVE-2025-39889] = "fixed-version: Fixed from version 6.15"
+
+CVE_STATUS[CVE-2025-39890] = "fixed-version: Fixed from version 6.16"
+
 CVE_STATUS[CVE-2025-39930] = "fixed-version: Fixed from version 6.15"
 
 CVE_STATUS[CVE-2025-39989] = "fixed-version: Fixed from version 6.15"
-- 
2.39.2


