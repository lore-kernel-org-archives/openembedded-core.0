Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F964D711AE
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 20:23:03 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1928.1766089375456749161
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 12:22:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AXFr2rHu;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8886fdf674bso11684646d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 12:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766089374; x=1766694174; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+AUspysd8X1P4KYzXQb2IBmITfY1r0utZWLHwtccKYE=;
        b=AXFr2rHuSG2Yy/1S7YQNaEI7NomYISWuNutR7oNzXwotmevpZ44r0DZ7oSyyFOoA3p
         p3IS8zGSg/F+pdz2J1huBBzK428DuA9uARRIw+TkB3RPJLa/yXK9tMsxMlbG+Gdr4RIH
         5PoTErm8qEUMEcEHoyD7fMvMT78qcTyMWLYevKjAL8EvscExjvYUSo6JJB4y8sjnPu26
         /DQihdusVKsuzhS6NQ9vSVLmsqGgl8IX+g7AIyIc+X36Tepgeomk+rWAk1CS4tQMmPj/
         UJjvhqFfTg4mvBIxljSVP/F73BQlkaPZPSMwCh+Q1SdMyyxRWUUioDphI1KgyQXoSBFH
         e+AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766089374; x=1766694174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+AUspysd8X1P4KYzXQb2IBmITfY1r0utZWLHwtccKYE=;
        b=U7m4WwGH3ibbdM/FInomQLKQY+DUrzlpbYQyij65qT5qgMHaqySo80GP1B/YE65dgE
         I7jD+Ui9P6QYGSMMi/3SYXCM/hTwVrCjhydzG6k3/hl9xE+gjLdx/9yJHIvmqwFRhgVV
         eZ8vOPHrR55V/nBKsxvnMLsbxYn/1fCfogH0nLqa0ExK9mnMyhWU8hVuNy2UmWdaZ9w/
         m2MNvnfttKt9tAJakduqYX4Cv/RBu1RfxYc9FLoc5TBZijIfRGOi/N/Odr87tI3CMK9w
         27WfGaV6YdqQ8dXN5b81wLCAsIMTnqal5Brv3iamZAOj5vh5pgf9uTcRHLZwZ5clCmRP
         W/YA==
X-Gm-Message-State: AOJu0YzMjv3ee5cqvrp1ecwKZwtFRWsSDrmJHV6/7jHwoQbVtiGEzt/z
	MrJIn6XZq3K4u5jyIl+GDEuZ53hbfBXbUqUMIwNi9dEClYWkoEHk7pXUy/yosIGXj/I=
X-Gm-Gg: AY/fxX468sBb1jPcubuALtnxp5lN1xrEBe+n3kmN5ESH3ps8tljcFWiRuYaegCIAQk1
	kQeppF7uHGcxsWvw13GUf7+mN5T0WRT4jkGJ4ECtUBnMqkrIt2TpXcmtl+kM2Gc5U9keeB0rKUP
	voSaNtOCCjpVVB1hXvZXrnxbYHoFCIdEDRJkQoaR+xSJue+cGjQmsxaJte95J9tp04Qs77e8Oyc
	tYe1OplRvScd+YazrJn003vUHpFvxErzCUUB0JxfWyaobrbw63KgtBm0gGMHfPXiGkDHoCaPihF
	2lkCV7KFEeL1muEhPKoWoitIdVYenvE3OJyaAv9sOWfvzvJD/ggztxsan4cOQolkQuqF9ZEGqUr
	Zr9+MeMotUpn6H6k50nxf/L+v2GECbKxHQ5tWLW+iN1lK6YddMvrRWUTaOoPwvAwG0Drzzqmea+
	hDdYfME+0O4b4Evo1yKGMZVlaqK8Porv/005OTYFgyiLdjDZPO3mECqJtSxXeTp8WifSrPsp1KD
	d/XEHawVKVMaNo=
X-Google-Smtp-Source: AGHT+IEwsdXi7sMjcdxus6F+zcZoMOdC9uS1zInIfNMyt0XPKMcytyWA7WdbxMjc1PdCsHiXrsMg2w==
X-Received: by 2002:a05:6214:1418:b0:880:4605:b2d3 with SMTP id 6a1803df08f44-88d8481cd4fmr12488996d6.63.1766089374355;
        Thu, 18 Dec 2025 12:22:54 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7dbdcsm3226456d6.43.2025.12.18.12.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 12:22:53 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [05/15][openembedded-core] linux-yocto/6.12: update CVE exclusions (6.12.62)
Date: Thu, 18 Dec 2025 15:22:30 -0500
Message-Id: <20251218202248.70476-5-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1766087617.bruce.ashfield@gmail.com>
References: <cover.1766087617.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 20:23:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228148

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 8 changes (0 new | 8 updated): - 0 new CVEs: - 8 updated CVEs: CVE-2024-41260, CVE-2025-13281, CVE-2025-14606, CVE-2025-14620, CVE-2025-14621, CVE-2025-67898, CVE-2025-67899, CVE-2025-7195
        Date: Mon, 15 Dec 2025 16:32:47 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/cve-exclusion_6.12.inc | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index d272b74737..4839a53cd9 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-12-09 15:18:04.005747+00:00 for kernel version 6.12.61
-# From linux_kernel_cves cve_2025-12-09_1500Z
+# Generated at 2025-12-15 16:44:27.465288+00:00 for kernel version 6.12.62
+# From linux_kernel_cves cve_2025-12-15_1600Z-2-gd297626114b
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.61"
+    this_version = "6.12.62"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -18266,7 +18266,7 @@ CVE_STATUS[CVE-2025-40213] = "fixed-version: only affects 6.17 onwards"
 
 CVE_STATUS[CVE-2025-40214] = "cpe-stable-backport: Backported in 6.12.59"
 
-# CVE-2025-40215 needs backporting (fixed from 6.16)
+CVE_STATUS[CVE-2025-40215] = "cpe-stable-backport: Backported in 6.12.62"
 
 CVE_STATUS[CVE-2025-40216] = "cpe-stable-backport: Backported in 6.12.36"
 
@@ -18526,5 +18526,7 @@ CVE_STATUS[CVE-2025-40343] = "cpe-stable-backport: Backported in 6.12.58"
 
 CVE_STATUS[CVE-2025-40344] = "cpe-stable-backport: Backported in 6.12.58"
 
+CVE_STATUS[CVE-2025-40345] = "cpe-stable-backport: Backported in 6.12.61"
+
 CVE_STATUS[CVE-2025-40364] = "cpe-stable-backport: Backported in 6.12.14"
 
-- 
2.39.2


