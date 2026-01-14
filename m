Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD6ED38FFC
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 17:24:26 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15745.1768411460289028068
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 09:24:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QlZF0I+q;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8c530866cf0so4797185a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 09:24:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768411459; x=1769016259; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8dzH1eNufKyBg+LmVWjoWnGoopX4KWAQWBb++XK+Do=;
        b=QlZF0I+qEkswyAY817ub2HddXbz+ZY0NzMC2Qf/0zEgJQFgD3Er/sBwoBuqzvfx9JZ
         e7wU0iYRaQzNjgktKC2uxvTvez7gjxk7AN4zttxzqn578EIVGEFurwxZF4wnAV7it7M2
         4mpXwm0cvvM6CULqnBi01/W7rdONSluUAFFkjCyjkBEy1iL+YM02Avhg8Eh0zOZQwE2+
         McXV1cK2MMf3FJ1cN+Mppj/4WrS3GjzGlO0kdAQd1MCVlu/Femi8Iar3Kgz4ret+L8+L
         00UiYsT5OzkpHgzmduKKmrIYIMQCUIax+w22lc+1DHekfzWxzwb3BuhcYbAFsmhxN5YM
         5K8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768411459; x=1769016259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t8dzH1eNufKyBg+LmVWjoWnGoopX4KWAQWBb++XK+Do=;
        b=qLF2uxFfmDQ5dhXJ0qHrhhGvJWjcdxj7oo4Bbm3oOZ9IwPHPFeyZtDGbDDdCpev9Bf
         qnuB4TVsbTVYiVGzoJVnlPfAqlwv2C1MHt3KOaYP9s7auPE22U0RH1e/rn37Rt+Rzr9h
         OU3egOw/4qC6nQM7VisaqTp1BMBP4G/qF2GefPfgj/vOCzqA+OOWrK0OSI6J1ugKA1UD
         l3LipEyzbewT76SfaW1bqBPC0dhg0PF1fo7nCbu+vssB77oAZle6yCbKtvAwMiJ6mvtp
         dtAE2VEoKkfD8a9AhvGxAMqFoQwZeIxi5ueRH0JitgiqpwwN5DLLP3abNenDxuDJfNfx
         LXgw==
X-Gm-Message-State: AOJu0YweBPtk119EM0QdhikUPoyLh8iVBDCGNZL+Q4U2TWCKcx6IBn9M
	H992RStYiBwoZYAeD8ecXUSc40sXsrB0avd6KEL1uPV2EYJbeiLSTS0UjJvZ9X9xQqc=
X-Gm-Gg: AY/fxX7m753xYmqzMH1Fe9vCZI6I49arC8xo/Co64Pce1KCCOS5i+mHyL8kYlVQ6iRZ
	0U778NJYQv/n9ZcEUQobu1cz2Yji2vJqKdR+t4t9Y6SWMojIeCQyw5xGKk5e7KdNgvJV6+tL1nm
	jZvWFrrYLe+1z7F05d1HD9Ck0qpUgrxP1s/wm2UiJTaShKaiM9mc1B5FE2aUzjUE0nIRa3oHLTt
	wlTR7HKi/ZkZaW8fRkg1/Sdt48BS7w2XEIhM9ry5yFqb1g9bNGeUpgDq4sv2NHw1U8hHdi6sTH1
	s8UEWecCBO4DPkZWgi6f02C6MizxEHqWy0qUuN2+jtlMvshbmE23At9EBi86b8tfE7yGq0+750s
	zrDKlPZhF2biTfpkFI6uSyBDcdxsBovVfW/jwp4+oighM1a4k7JBGFrNfPCftbgBuwCsrFmUIiP
	SIk/nSprvywYXhF6dpKmb8JCWI9+vmmA59B8OFdA7QN/wXJcON8GEGBL5sU/zeX6XNBS+joGsRx
	o2x9ypzaubofgcsdxa45ofnJQ==
X-Received: by 2002:a05:620a:a003:b0:8c5:338b:bfa0 with SMTP id af79cd13be357-8c5338bc4fcmr265330785a.20.1768411458465;
        Wed, 14 Jan 2026 09:24:18 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530bc0d9fsm197711385a.45.2026.01.14.09.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 09:24:17 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 05/06] linux-yocto/6.12: update CVE exclusions (6.12.64)
Date: Wed, 14 Jan 2026 12:24:05 -0500
Message-ID: <20260114172406.2271015-6-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260114172406.2271015-1-bruce.ashfield@gmail.com>
References: <20260114172406.2271015-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 17:24:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229361

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 21 changes (3 new | 18 updated): - 3 new CVEs: CVE-2026-22200, CVE-2026-22784, CVE-2026-22785 - 18 updated CVEs: CVE-2025-12379, CVE-2025-13393, CVE-2025-63314, CVE-2025-66689, CVE-2025-68276, CVE-2025-68468, CVE-2025-68471, CVE-2025-68472, CVE-2025-68622, CVE-2025-68656, CVE-2025-68657, CVE-2025-69169, CVE-2025-8110, CVE-2026-0674, CVE-2026-0676, CVE-2026-0822, CVE-2026-21858, CVE-2026-22251
        Date: Mon, 12 Jan 2026 18:46:34 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.12.inc              | 1566 ++++++++++++++---
 1 file changed, 1350 insertions(+), 216 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index 1b6693c271..c08b091825 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-12-24 04:11:52.684157+00:00 for kernel version 6.12.63
-# From linux_kernel_cves cve_2025-12-24_0300Z-1-gf5a9200c11e
+# Generated at 2026-01-12 18:49:23.230016+00:00 for kernel version 6.12.64
+# From linux_kernel_cves cve_2026-01-12_1800Z-2-g66e4b29f774
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.63"
+    this_version = "6.12.64"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -1960,8 +1960,6 @@ CVE_STATUS[CVE-2022-48841] = "fixed-version: Fixed from version 5.17"
 
 CVE_STATUS[CVE-2022-48842] = "fixed-version: Fixed from version 5.16.16"
 
-# CVE-2022-48843 has no known resolution
-
 CVE_STATUS[CVE-2022-48844] = "fixed-version: Fixed from version 5.17"
 
 CVE_STATUS[CVE-2022-48845] = "fixed-version: Fixed from version 5.17"
@@ -5458,6 +5456,346 @@ CVE_STATUS[CVE-2022-50678] = "fixed-version: Fixed from version 6.1"
 
 CVE_STATUS[CVE-2022-50679] = "fixed-version: Fixed from version 6.1"
 
+CVE_STATUS[CVE-2022-50697] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50698] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50699] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50700] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50701] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2022-50702] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50703] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50704] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50705] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50706] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50707] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50708] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50709] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50710] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50711] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50712] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50713] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50714] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50715] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50716] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50717] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50718] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50719] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50720] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50721] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50722] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50723] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50724] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50725] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50726] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50727] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50728] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50729] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50730] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50731] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50732] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50733] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50734] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50735] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50736] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50737] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50738] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50739] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50740] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50741] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50742] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50743] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50744] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50745] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50746] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50747] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50748] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50749] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50750] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50751] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50752] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50753] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50754] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50755] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50756] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50757] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50758] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50759] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50760] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50761] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50762] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50763] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50764] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50765] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50766] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50767] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50768] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50769] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50770] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50771] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50772] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50773] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50774] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50775] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2022-50776] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50777] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50778] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50779] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50780] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50781] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50782] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50783] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50784] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50785] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50786] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50809] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50810] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50811] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50812] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50813] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50814] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50815] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50816] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50817] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50818] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50819] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50820] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50821] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50822] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50823] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50824] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50825] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50826] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50827] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50828] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50829] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50830] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2022-50832] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2022-50833] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50834] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50835] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50836] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50837] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50838] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50839] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50840] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50841] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50842] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50843] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50844] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50845] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50846] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50847] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50848] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50849] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50850] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50851] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50852] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50853] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50854] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50855] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50856] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50857] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50858] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50859] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50860] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50861] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50862] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50863] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50864] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50865] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50866] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50867] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50868] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50869] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50870] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50871] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50872] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2022-50873] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50874] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2022-50875] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50876] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50877] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50878] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50879] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50880] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50881] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2022-50882] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50883] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50884] = "fixed-version: Fixed from version 6.1"
+
+CVE_STATUS[CVE-2022-50885] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50886] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50887] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50888] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2022-50889] = "fixed-version: Fixed from version 6.2"
+
 CVE_STATUS[CVE-2023-32246] = "fixed-version: Fixed from version 6.4"
 
 CVE_STATUS[CVE-2023-32249] = "fixed-version: Fixed from version 6.4"
@@ -6722,8 +7060,6 @@ CVE_STATUS[CVE-2023-53181] = "fixed-version: Fixed from version 6.5"
 
 CVE_STATUS[CVE-2023-53182] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53183] = "fixed-version: Fixed from version 6.5"
-
 CVE_STATUS[CVE-2023-53184] = "fixed-version: Fixed from version 6.4.8"
 
 CVE_STATUS[CVE-2023-53185] = "fixed-version: Fixed from version 6.5"
@@ -7026,7 +7362,7 @@ CVE_STATUS[CVE-2023-53337] = "fixed-version: Fixed from version 6.4"
 
 CVE_STATUS[CVE-2023-53338] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53339] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-53339] = "fixed-version: Fixed from version 6.4.12"
 
 CVE_STATUS[CVE-2023-53340] = "fixed-version: Fixed from version 6.4"
 
@@ -7286,8 +7622,6 @@ CVE_STATUS[CVE-2023-53467] = "fixed-version: Fixed from version 6.3"
 
 CVE_STATUS[CVE-2023-53468] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53469] = "fixed-version: Fixed from version 6.5"
-
 CVE_STATUS[CVE-2023-53470] = "fixed-version: Fixed from version 6.4"
 
 CVE_STATUS[CVE-2023-53471] = "fixed-version: Fixed from version 6.4"
@@ -7700,341 +8034,1001 @@ CVE_STATUS[CVE-2023-53675] = "fixed-version: Fixed from version 6.3"
 
 CVE_STATUS[CVE-2023-53676] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53677] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-53677] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53678] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53679] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53680] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53681] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53682] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53683] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53684] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53685] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53686] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53687] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53692] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53693] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53694] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53695] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53696] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53697] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53698] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53699] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53700] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53702] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53703] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53704] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53705] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53706] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53707] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53708] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53709] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53710] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53711] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53712] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53713] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53714] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53715] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53716] = "fixed-version: Fixed from version 6.3.5"
+
+CVE_STATUS[CVE-2023-53717] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53718] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53719] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53720] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53721] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53722] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53723] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53724] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53725] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53726] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53727] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53728] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53729] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53730] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53731] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53732] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53733] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53742] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53743] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53744] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53745] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53746] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53747] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53748] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53750] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53751] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53752] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53753] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53754] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53755] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53756] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53757] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53758] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53759] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53760] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53761] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53762] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53763] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53764] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53765] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53766] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53767] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53768] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53769] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53777] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53778] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53780] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53781] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53782] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53783] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53784] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53785] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53786] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53787] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53788] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53789] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53790] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53791] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53792] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53793] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53794] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53795] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53796] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53797] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53798] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53799] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53800] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53801] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53802] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53803] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53804] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53806] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53807] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53808] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53809] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53810] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53811] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53812] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53813] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53814] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53815] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53816] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53817] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53818] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53819] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53820] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53821] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53822] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53823] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53824] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53825] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53826] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53827] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53828] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53829] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53830] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53831] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53832] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53833] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53834] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53836] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53837] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53838] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53839] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53840] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53841] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53842] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53843] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53844] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53845] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53846] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53847] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53848] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53849] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53850] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53851] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53852] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53853] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53854] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53855] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53856] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53857] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53858] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53859] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53860] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53861] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53862] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53863] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53864] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53865] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53866] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53867] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53986] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53987] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53988] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53989] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53990] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-53991] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53992] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53993] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-53994] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53995] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53996] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-53997] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53998] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-53999] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54000] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54001] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54002] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54003] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-54004] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54005] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54006] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-54007] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54008] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-54009] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54010] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54011] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-54012] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54013] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-54014] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54015] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54016] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-54017] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-54018] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-54019] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54020] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-54021] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54022] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-54023] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54024] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-54025] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54026] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54027] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54028] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54030] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-54031] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54032] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54033] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54034] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-54035] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54036] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-54037] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54038] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54039] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-54040] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-54041] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-54042] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54043] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-54044] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54045] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-54046] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-54047] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54048] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54049] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-54050] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54051] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54052] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-54053] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54055] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-54056] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54057] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-54058] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54059] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-54060] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54062] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54063] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54064] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-54065] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-54066] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-54067] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54068] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54069] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-54070] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-54071] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54072] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54073] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54074] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54075] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54076] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54077] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54078] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54079] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54080] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-54081] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54083] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54084] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54085] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-54086] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54087] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-54088] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54089] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-54090] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54091] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54092] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54093] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-54094] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54095] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-54096] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54097] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54098] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-54099] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54100] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54101] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54102] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54104] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54105] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-54106] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54107] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-54108] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-54109] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54110] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-54111] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-54112] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-54113] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-54114] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54115] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54116] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54117] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-54118] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-54119] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54120] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-54121] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54122] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-54123] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54124] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54125] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54126] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54127] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-54128] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-54129] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54130] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-54131] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54132] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54133] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54134] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-54135] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54136] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-54137] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-54138] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54139] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54140] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-54141] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54142] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54143] = "fixed-version: Fixed from version 6.6"
+
+CVE_STATUS[CVE-2023-54144] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-54145] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54146] = "fixed-version: Fixed from version 6.2"
+
+CVE_STATUS[CVE-2023-54147] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54148] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54149] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54150] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54151] = "fixed-version: Fixed from version 6.4"
+
+CVE_STATUS[CVE-2023-54152] = "fixed-version: Fixed from version 6.3"
+
+CVE_STATUS[CVE-2023-54153] = "fixed-version: Fixed from version 6.5"
+
+CVE_STATUS[CVE-2023-54154] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53678] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54155] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53679] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54156] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53680] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54157] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53681] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54158] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53682] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54159] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53683] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54160] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53684] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54162] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53685] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54164] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53686] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2023-54165] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53687] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54166] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53692] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54167] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53693] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54168] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53694] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54169] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53695] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54170] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53696] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54171] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53697] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2023-54172] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53698] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54173] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53699] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54174] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53700] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54175] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53702] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54176] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53703] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54177] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53704] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54178] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53705] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54179] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53706] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54180] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2023-53707] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54181] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53708] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2023-54182] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53709] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54183] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53710] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54184] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53711] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2023-54185] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53712] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2023-54186] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53713] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54187] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53714] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54188] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53715] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54189] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53716] = "fixed-version: Fixed from version 6.3.5"
+CVE_STATUS[CVE-2023-54190] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53717] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54191] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53718] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54192] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53719] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54193] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53720] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54194] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53721] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2023-54195] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53722] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2023-54196] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53723] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54197] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53724] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54198] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53725] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54199] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53726] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2023-54200] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53727] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2023-54201] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53728] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54202] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53729] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2023-54203] = "fixed-version: Fixed from version 6.2.11"
 
-CVE_STATUS[CVE-2023-53730] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54204] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53731] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54205] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53732] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54206] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53733] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54207] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53742] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54208] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53743] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2023-54209] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53744] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54210] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53745] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54211] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53746] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54213] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53747] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54214] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53748] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54215] = "fixed-version: Fixed from version 6.5"
 
-# CVE-2023-53749 has no known resolution
+CVE_STATUS[CVE-2023-54216] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53750] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54217] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53751] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54218] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53752] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2023-54219] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53753] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54220] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53754] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54221] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53755] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54222] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53756] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54223] = "fixed-version: Fixed from version 6.4.10"
 
-CVE_STATUS[CVE-2023-53757] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54224] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53758] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54225] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53759] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54226] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53760] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54227] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53761] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54228] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53762] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2023-54229] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53763] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2023-54230] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53764] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54231] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53765] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54232] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53766] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54233] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53767] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54234] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53768] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54235] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53769] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54236] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53777] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54237] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53778] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54238] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53779] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54239] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53780] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54240] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53781] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54241] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53782] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2023-54242] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53783] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54243] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53784] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54244] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53785] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2023-54245] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53786] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54246] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53787] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54247] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53788] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54248] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53789] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54249] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53790] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54250] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53791] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2023-54251] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53792] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54252] = "fixed-version: Fixed from version 6.2.11"
 
-CVE_STATUS[CVE-2023-53793] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54253] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53794] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54254] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53795] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54255] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53796] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54257] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53797] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54258] = "fixed-version: Fixed from version 6.4.12"
 
-CVE_STATUS[CVE-2023-53798] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54259] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53799] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2023-54260] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53800] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54261] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53801] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54262] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53802] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54263] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53803] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54264] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53804] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54265] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53806] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54266] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53807] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54267] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53808] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2023-54268] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53809] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54269] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53810] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54270] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53811] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54271] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53812] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54272] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53813] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54273] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53814] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54274] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53815] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54275] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53816] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54276] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53817] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2023-54277] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53818] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54278] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53819] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54279] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53820] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54280] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53821] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54281] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53822] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54282] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53823] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54283] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53824] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54284] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53825] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2023-54285] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53826] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54286] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53827] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54287] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53828] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2023-54288] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53829] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2023-54289] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53830] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54291] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53831] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2023-54292] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53832] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54293] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53833] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54294] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53834] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54295] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53836] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2023-54296] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53837] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54297] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53838] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54298] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53839] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54299] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53840] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54300] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53841] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54301] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53842] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54302] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53843] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54303] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53844] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54304] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53845] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54305] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53846] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54306] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53847] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54307] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53848] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2023-54308] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53849] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54309] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53850] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54310] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53851] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54311] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53852] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54312] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53853] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54313] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53854] = "fixed-version: Fixed from version 6.4"
+CVE_STATUS[CVE-2023-54314] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53855] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54315] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53856] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2023-54316] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53857] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2023-54317] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53858] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54318] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53859] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54319] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53860] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2023-54320] = "fixed-version: Fixed from version 6.4"
 
-CVE_STATUS[CVE-2023-53861] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2023-54321] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53862] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54322] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53863] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54323] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53864] = "fixed-version: Fixed from version 6.6"
+CVE_STATUS[CVE-2023-54324] = "fixed-version: Fixed from version 6.6"
 
-CVE_STATUS[CVE-2023-53865] = "fixed-version: Fixed from version 6.5"
+CVE_STATUS[CVE-2023-54325] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53866] = "fixed-version: Fixed from version 6.3"
+CVE_STATUS[CVE-2023-54326] = "fixed-version: Fixed from version 6.5"
 
 CVE_STATUS[CVE-2023-7324] = "fixed-version: Fixed from version 6.3"
 
@@ -9674,8 +10668,6 @@ CVE_STATUS[CVE-2024-36921] = "fixed-version: Fixed from version 6.9"
 
 CVE_STATUS[CVE-2024-36922] = "fixed-version: Fixed from version 6.9"
 
-CVE_STATUS[CVE-2024-36923] = "fixed-version: Fixed from version 6.9"
-
 CVE_STATUS[CVE-2024-36924] = "fixed-version: Fixed from version 6.9"
 
 CVE_STATUS[CVE-2024-36925] = "fixed-version: Fixed from version 6.9"
@@ -11090,8 +12082,6 @@ CVE_STATUS[CVE-2024-43893] = "fixed-version: Fixed from version 6.11"
 
 CVE_STATUS[CVE-2024-43894] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2024-43895] = "fixed-version: Fixed from version 6.11"
-
 CVE_STATUS[CVE-2024-43896] = "fixed-version: Fixed from version 6.11"
 
 CVE_STATUS[CVE-2024-43897] = "fixed-version: Fixed from version 6.10.5"
@@ -11204,8 +12194,6 @@ CVE_STATUS[CVE-2024-44970] = "fixed-version: Fixed from version 6.11"
 
 CVE_STATUS[CVE-2024-44971] = "fixed-version: Fixed from version 6.11"
 
-CVE_STATUS[CVE-2024-44972] = "fixed-version: Fixed from version 6.11"
-
 CVE_STATUS[CVE-2024-44973] = "fixed-version: Fixed from version 6.11"
 
 CVE_STATUS[CVE-2024-44974] = "fixed-version: Fixed from version 6.11"
@@ -11750,8 +12738,6 @@ CVE_STATUS[CVE-2024-47670] = "fixed-version: Fixed from version 6.11"
 
 CVE_STATUS[CVE-2024-47671] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2024-47672] = "fixed-version: Fixed from version 6.11"
-
 CVE_STATUS[CVE-2024-47673] = "fixed-version: Fixed from version 6.11"
 
 CVE_STATUS[CVE-2024-47674] = "fixed-version: Fixed from version 6.11"
@@ -11772,7 +12758,7 @@ CVE_STATUS[CVE-2024-47681] = "fixed-version: Fixed from version 6.12"
 
 CVE_STATUS[CVE-2024-47682] = "fixed-version: Fixed from version 6.12"
 
-CVE_STATUS[CVE-2024-47683] = "fixed-version: Fixed from version 6.12"
+CVE_STATUS[CVE-2024-47683] = "fixed-version: Fixed from version 6.11"
 
 CVE_STATUS[CVE-2024-47684] = "fixed-version: Fixed from version 6.12"
 
@@ -13746,8 +14732,6 @@ CVE_STATUS[CVE-2024-56779] = "cpe-stable-backport: Backported in 6.12.4"
 
 CVE_STATUS[CVE-2024-56780] = "cpe-stable-backport: Backported in 6.12.4"
 
-CVE_STATUS[CVE-2024-56781] = "cpe-stable-backport: Backported in 6.12.5"
-
 CVE_STATUS[CVE-2024-56782] = "cpe-stable-backport: Backported in 6.12.5"
 
 CVE_STATUS[CVE-2024-56783] = "cpe-stable-backport: Backported in 6.12.5"
@@ -15120,7 +16104,7 @@ CVE_STATUS[CVE-2025-22107] = "cpe-stable-backport: Backported in 6.12.59"
 
 CVE_STATUS[CVE-2025-22110] = "fixed-version: only affects 6.14 onwards"
 
-# CVE-2025-22111 needs backporting (fixed from 6.15)
+# CVE-2025-22111 may need backporting (fixed from 6.12.65)
 
 CVE_STATUS[CVE-2025-22112] = "cpe-stable-backport: Backported in 6.12.35"
 
@@ -15504,7 +16488,7 @@ CVE_STATUS[CVE-2025-37882] = "cpe-stable-backport: Backported in 6.12.26"
 
 CVE_STATUS[CVE-2025-37883] = "cpe-stable-backport: Backported in 6.12.26"
 
-CVE_STATUS[CVE-2025-37884] = "cpe-stable-backport: Backported in 6.12.26"
+CVE_STATUS[CVE-2025-37884] = "fixed-version: only affects 6.13 onwards"
 
 CVE_STATUS[CVE-2025-37885] = "cpe-stable-backport: Backported in 6.12.26"
 
@@ -15618,8 +16602,6 @@ CVE_STATUS[CVE-2025-37940] = "cpe-stable-backport: Backported in 6.12.24"
 
 CVE_STATUS[CVE-2025-37941] = "cpe-stable-backport: Backported in 6.12.24"
 
-CVE_STATUS[CVE-2025-37942] = "cpe-stable-backport: Backported in 6.12.24"
-
 CVE_STATUS[CVE-2025-37943] = "cpe-stable-backport: Backported in 6.12.24"
 
 CVE_STATUS[CVE-2025-37944] = "cpe-stable-backport: Backported in 6.12.25"
@@ -15872,8 +16854,6 @@ CVE_STATUS[CVE-2025-38071] = "cpe-stable-backport: Backported in 6.12.31"
 
 CVE_STATUS[CVE-2025-38072] = "cpe-stable-backport: Backported in 6.12.31"
 
-CVE_STATUS[CVE-2025-38073] = "cpe-stable-backport: Backported in 6.12.31"
-
 CVE_STATUS[CVE-2025-38074] = "cpe-stable-backport: Backported in 6.12.31"
 
 CVE_STATUS[CVE-2025-38075] = "cpe-stable-backport: Backported in 6.12.31"
@@ -16190,7 +17170,7 @@ CVE_STATUS[CVE-2025-38232] = "cpe-stable-backport: Backported in 6.12.35"
 
 CVE_STATUS[CVE-2025-38233] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2025-38234 needs backporting (fixed from 6.16)
+CVE_STATUS[CVE-2025-38234] = "cpe-stable-backport: Backported in 6.12.64"
 
 CVE_STATUS[CVE-2025-38235] = "fixed-version: only affects 6.15 onwards"
 
@@ -17336,7 +18316,7 @@ CVE_STATUS[CVE-2025-39743] = "cpe-stable-backport: Backported in 6.12.43"
 
 CVE_STATUS[CVE-2025-39744] = "cpe-stable-backport: Backported in 6.12.43"
 
-# CVE-2025-39745 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-39745] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2025-39746] = "cpe-stable-backport: Backported in 6.12.43"
 
@@ -17584,7 +18564,7 @@ CVE_STATUS[CVE-2025-39870] = "cpe-stable-backport: Backported in 6.12.48"
 
 CVE_STATUS[CVE-2025-39871] = "cpe-stable-backport: Backported in 6.12.48"
 
-CVE_STATUS[CVE-2025-39872] = "fixed-version: only affects 6.14 onwards"
+CVE_STATUS[CVE-2025-39872] = "cpe-stable-backport: Backported in 6.12.64"
 
 CVE_STATUS[CVE-2025-39873] = "cpe-stable-backport: Backported in 6.12.48"
 
@@ -17648,7 +18628,7 @@ CVE_STATUS[CVE-2025-39903] = "cpe-stable-backport: Backported in 6.12.46"
 
 CVE_STATUS[CVE-2025-39904] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2025-39905 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-39905] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2025-39906] = "fixed-version: only affects 6.15 onwards"
 
@@ -18162,7 +19142,7 @@ CVE_STATUS[CVE-2025-40162] = "cpe-stable-backport: Backported in 6.12.55"
 
 CVE_STATUS[CVE-2025-40163] = "fixed-version: only affects 6.17 onwards"
 
-# CVE-2025-40164 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-40164] = "cpe-stable-backport: Backported in 6.12.64"
 
 CVE_STATUS[CVE-2025-40165] = "cpe-stable-backport: Backported in 6.12.55"
 
@@ -18174,7 +19154,7 @@ CVE_STATUS[CVE-2025-40167] = "cpe-stable-backport: Backported in 6.12.55"
 
 CVE_STATUS[CVE-2025-40169] = "cpe-stable-backport: Backported in 6.12.53"
 
-# CVE-2025-40170 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-40170] = "cpe-stable-backport: Backported in 6.12.64"
 
 CVE_STATUS[CVE-2025-40171] = "cpe-stable-backport: Backported in 6.12.53"
 
@@ -18254,7 +19234,7 @@ CVE_STATUS[CVE-2025-40208] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2025-40209] = "cpe-stable-backport: Backported in 6.12.58"
 
-# CVE-2025-40210 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-40210] = "fixed-version: only affects 6.17 onwards"
 
 CVE_STATUS[CVE-2025-40211] = "cpe-stable-backport: Backported in 6.12.58"
 
@@ -18386,7 +19366,7 @@ CVE_STATUS[CVE-2025-40274] = "cpe-stable-backport: Backported in 6.12.59"
 
 CVE_STATUS[CVE-2025-40275] = "cpe-stable-backport: Backported in 6.12.59"
 
-# CVE-2025-40276 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-40276] = "cpe-stable-backport: Backported in 6.12.64"
 
 CVE_STATUS[CVE-2025-40277] = "cpe-stable-backport: Backported in 6.12.59"
 
@@ -18444,7 +19424,7 @@ CVE_STATUS[CVE-2025-40303] = "cpe-stable-backport: Backported in 6.12.58"
 
 CVE_STATUS[CVE-2025-40304] = "cpe-stable-backport: Backported in 6.12.58"
 
-CVE_STATUS[CVE-2025-40305] = "cpe-stable-backport: Backported in 6.12.58"
+CVE_STATUS[CVE-2025-40305] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2025-40306] = "cpe-stable-backport: Backported in 6.12.58"
 
@@ -18452,7 +19432,7 @@ CVE_STATUS[CVE-2025-40307] = "cpe-stable-backport: Backported in 6.12.58"
 
 CVE_STATUS[CVE-2025-40308] = "cpe-stable-backport: Backported in 6.12.58"
 
-CVE_STATUS[CVE-2025-40309] = "cpe-stable-backport: Backported in 6.12.58"
+CVE_STATUS[CVE-2025-40309] = "fixed-version: only affects 6.13 onwards"
 
 CVE_STATUS[CVE-2025-40310] = "cpe-stable-backport: Backported in 6.12.58"
 
@@ -18484,7 +19464,7 @@ CVE_STATUS[CVE-2025-40323] = "cpe-stable-backport: Backported in 6.12.58"
 
 CVE_STATUS[CVE-2025-40324] = "cpe-stable-backport: Backported in 6.12.58"
 
-# CVE-2025-40325 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-40325] = "cpe-stable-backport: Backported in 6.12.64"
 
 CVE_STATUS[CVE-2025-40326] = "fixed-version: only affects 6.14 onwards"
 
@@ -18506,7 +19486,7 @@ CVE_STATUS[CVE-2025-40333] = "cpe-stable-backport: Backported in 6.12.58"
 
 # CVE-2025-40335 needs backporting (fixed from 6.18)
 
-# CVE-2025-40336 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-40336] = "fixed-version: only affects 6.15 onwards"
 
 CVE_STATUS[CVE-2025-40337] = "cpe-stable-backport: Backported in 6.12.58"
 
@@ -18556,8 +19536,6 @@ CVE_STATUS[CVE-2025-40359] = "cpe-stable-backport: Backported in 6.12.58"
 
 CVE_STATUS[CVE-2025-40360] = "cpe-stable-backport: Backported in 6.12.58"
 
-CVE_STATUS[CVE-2025-40361] = "cpe-stable-backport: Backported in 6.12.58"
-
 CVE_STATUS[CVE-2025-40362] = "cpe-stable-backport: Backported in 6.12.58"
 
 CVE_STATUS[CVE-2025-40363] = "cpe-stable-backport: Backported in 6.12.58"
@@ -18636,13 +19614,11 @@ CVE_STATUS[CVE-2025-68201] = "cpe-stable-backport: Backported in 6.12.59"
 
 CVE_STATUS[CVE-2025-68202] = "cpe-stable-backport: Backported in 6.12.59"
 
-# CVE-2025-68203 needs backporting (fixed from 6.18)
-
 CVE_STATUS[CVE-2025-68204] = "cpe-stable-backport: Backported in 6.12.59"
 
 CVE_STATUS[CVE-2025-68205] = "fixed-version: only affects 6.17 onwards"
 
-# CVE-2025-68206 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-68206] = "cpe-stable-backport: Backported in 6.12.64"
 
 CVE_STATUS[CVE-2025-68207] = "cpe-stable-backport: Backported in 6.12.59"
 
@@ -18678,8 +19654,6 @@ CVE_STATUS[CVE-2025-68222] = "cpe-stable-backport: Backported in 6.12.60"
 
 CVE_STATUS[CVE-2025-68223] = "cpe-stable-backport: Backported in 6.12.60"
 
-CVE_STATUS[CVE-2025-68224] = "cpe-stable-backport: Backported in 6.12.60"
-
 CVE_STATUS[CVE-2025-68225] = "fixed-version: only affects 6.17 onwards"
 
 CVE_STATUS[CVE-2025-68226] = "fixed-version: only affects 6.17.8 onwards"
@@ -18764,7 +19738,7 @@ CVE_STATUS[CVE-2025-68265] = "cpe-stable-backport: Backported in 6.12.62"
 
 CVE_STATUS[CVE-2025-68266] = "cpe-stable-backport: Backported in 6.12.62"
 
-# CVE-2025-68281 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-68281] = "fixed-version: only affects 6.17 onwards"
 
 CVE_STATUS[CVE-2025-68282] = "cpe-stable-backport: Backported in 6.12.61"
 
@@ -18820,7 +19794,7 @@ CVE_STATUS[CVE-2025-68307] = "cpe-stable-backport: Backported in 6.12.61"
 
 CVE_STATUS[CVE-2025-68308] = "cpe-stable-backport: Backported in 6.12.61"
 
-# CVE-2025-68309 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-68309] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2025-68310] = "cpe-stable-backport: Backported in 6.12.58"
 
@@ -18890,3 +19864,163 @@ CVE_STATUS[CVE-2025-68342] = "cpe-stable-backport: Backported in 6.12.61"
 
 CVE_STATUS[CVE-2025-68343] = "cpe-stable-backport: Backported in 6.12.61"
 
+CVE_STATUS[CVE-2025-68344] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68345] = "cpe-stable-backport: Backported in 6.12.64"
+
+CVE_STATUS[CVE-2025-68346] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68347] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68348] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68349] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68350] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2025-68351] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-68352] = "cpe-stable-backport: Backported in 6.12.63"
+
+# CVE-2025-68353 needs backporting (fixed from 6.19rc1)
+
+CVE_STATUS[CVE-2025-68354] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68355] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2025-68356] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68357] = "fixed-version: Fixed from version 6.12.64"
+
+# CVE-2025-68358 needs backporting (fixed from 6.19rc1)
+
+# CVE-2025-68359 needs backporting (fixed from 6.19rc1)
+
+# CVE-2025-68360 needs backporting (fixed from 6.19rc1)
+
+CVE_STATUS[CVE-2025-68361] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68362] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68363] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68364] = "cpe-stable-backport: Backported in 6.12.63"
+
+# CVE-2025-68365 needs backporting (fixed from 6.19rc1)
+
+CVE_STATUS[CVE-2025-68366] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68367] = "cpe-stable-backport: Backported in 6.12.63"
+
+# CVE-2025-68368 needs backporting (fixed from 6.19rc1)
+
+CVE_STATUS[CVE-2025-68369] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68370] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-68371] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68372] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68373] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-68374] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68375] = "fixed-version: only affects 6.16 onwards"
+
+# CVE-2025-68376 needs backporting (fixed from 6.19rc1)
+
+CVE_STATUS[CVE-2025-68377] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2025-68378] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68379] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68380] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68724] = "cpe-stable-backport: Backported in 6.12.63"
+
+# CVE-2025-68725 needs backporting (fixed from 6.19rc1)
+
+CVE_STATUS[CVE-2025-68726] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-68727] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68728] = "cpe-stable-backport: Backported in 6.12.63"
+
+# CVE-2025-68729 needs backporting (fixed from 6.19rc1)
+
+# CVE-2025-68730 needs backporting (fixed from 6.19rc1)
+
+CVE_STATUS[CVE-2025-68731] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2025-68732] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68733] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68734] = "cpe-stable-backport: Backported in 6.12.59"
+
+# CVE-2025-68735 needs backporting (fixed from 6.19rc1)
+
+# CVE-2025-68736 needs backporting (fixed from 6.19rc1)
+
+CVE_STATUS[CVE-2025-68737] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2025-68738] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-68739] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-68740] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68741] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68742] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68743] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-68744] = "cpe-stable-backport: Backported in 6.12.63"
+
+# CVE-2025-68745 needs backporting (fixed from 6.19rc1)
+
+CVE_STATUS[CVE-2025-68746] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68747] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68748] = "cpe-stable-backport: Backported in 6.12.63"
+
+# CVE-2025-68749 needs backporting (fixed from 6.19rc1)
+
+CVE_STATUS[CVE-2025-68750] = "cpe-stable-backport: Backported in 6.12.36"
+
+# CVE-2025-68751 needs backporting (fixed from 6.19rc1)
+
+CVE_STATUS[CVE-2025-68752] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-68753] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68754] = "fixed-version: only affects 6.13 onwards"
+
+# CVE-2025-68755 needs backporting (fixed from 6.19rc1)
+
+CVE_STATUS[CVE-2025-68756] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68757] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68758] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68759] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68760] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-68761] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2025-68762] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-68763] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68764] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68765] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68766] = "cpe-stable-backport: Backported in 6.12.63"
+
-- 
2.43.0


