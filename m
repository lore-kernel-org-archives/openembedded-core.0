Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C3FD58E5B
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 04:55:51 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.153758.1772427344537011777
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Mar 2026 20:55:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y7sEm3IF;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-506aa685d62so23253331cf.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Mar 2026 20:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772427343; x=1773032143; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P98Pjvrhz4Ffps0Qi9H+E9N+nmStVSAeiyjALxH9+XY=;
        b=Y7sEm3IFrgv0GJD5T99GywRzmCNpzAxBzri2vI9tTGET9g72zXpZkIqoppURO1smGU
         V8naosrQCOeDk6cvEygdXkdMVM05ZlPzntz8LPtHIyEPCHAJEL8XPaxELxT2x5uKK1A0
         ZpA6hhMCS1xw+BSqzh2oLJM9YxeyM9x2OQc0Sz14TkJP2kDMBbHkZaQLmj7QNH0uMjgH
         S7hOcHLfPjvzKLAGP+mUEHVMdYRdjYRnRdkszBf1s7Cikevdf83SMQXB9qbMDalBC6Xb
         RlFLnY/D7UWfnV9m5oyjOuVt6o3dyYVFSFK8fJ9VBPfTfTUhDug+qSIBvOW/dbLO++UI
         L5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772427343; x=1773032143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P98Pjvrhz4Ffps0Qi9H+E9N+nmStVSAeiyjALxH9+XY=;
        b=aCynDOTq7DGnrzsXPWdeigBjyYCBszMpwVi2pUpNYfIr9UVSxw3CsK21mGPzSwH4I8
         uNjCXHFBLMO1d1Dh/4yeGEH0OHyP2LRdLxhOtcMw/grQXCsrXQwn1XPWy1Ca1ioXXL+y
         Qq6O5lUMtOBdRsqTLhJy8pAid0I1413hiNtM5uG1QmEQdwikOBAhlclQpD82xQ7IUS5y
         gMOvVEf7m7OfoVExvoEUxse8pUdmGLjX4t8w2bTuCE6sP1xwMgykJ5fj6vYOQjlFUmKA
         gDQE+XCc7dK6qTY3qkLmfsO32Kxm+7due50nUgVNrX3JGoRuujvsnAZk7diH2PNeE4nX
         Gtnw==
X-Gm-Message-State: AOJu0YwtqPBzcytcEfD3qHIRDDG5CnrPg2oQ+G0p8gddtyfuKy26MwJ+
	Hs4eog4qQMSejqs0qIZSH2La4oA5g17x/37UIkPRnuixClduhc5wYGr3
X-Gm-Gg: ATEYQzw2riGTXrD5j38CcMujQayY2Cb3RSEqQ1Un81hAP89GADQLbvTPqP+if+NViCJ
	bbT4S3ZrXRQHXbHv4EImfAzyPBuYCEI2fEGe+vIKnzJffLNQsx5vGPgKWLGpY8w5O5fgX5X/LLe
	85R/q/MIW1ZXezdFqxvaCLqSC6l0PtIA5dDwcer3SVDzhjOt+fCiza2uo6OJaUay5m/+pJLIqz2
	zXJPP+tyiuIAn1ZJsF9z4zWOKbcxjZMuaUtsVm58iZM9fvYWGfKS3MqLW/6DVeXLe9yI/Ki0TOl
	NZi7DQ9BHL+2dtVEX/tpfQXIpuSrXg3xRlcS36uKeIE9G3HyeN8bmLPAgfMa4egdCAftrU5mz5v
	CGOLCxQ+uwjJVmM70TxgctINhuDfKhN7s5mPnzc5BWzL5J68YlNH3QXBZTUulSPSX78wQHVtezJ
	UMgrRej+95AqXHcqUjLdhmV1HzxDRhruTZYEK9YPSy/Hvk3Bg9oEscv+Tt+hHt7hepg5tF5roi2
	e105Wn6C/6h7ePbUWihR2Of/1Het6/Yle+W8n+MJaYU9jJ9TKFsAJyrdLQ=
X-Received: by 2002:a05:622a:50b:b0:4ed:8264:91ba with SMTP id d75a77b69052e-507529ac7b2mr130455201cf.58.1772427343376;
        Sun, 01 Mar 2026 20:55:43 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a017add76sm2488406d6.36.2026.03.01.20.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 20:55:42 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [meta][PATCH 02/10] linux-yocto/6.18: update CVE exclusions (6.18.9)
Date: Sun,  1 Mar 2026 23:55:28 -0500
Message-ID: <20260302045537.2153587-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260302045537.2153587-1-bruce.ashfield@gmail.com>
References: <20260302045537.2153587-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 04:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232162

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 4 changes (4 new | 0 updated): - 4 new CVEs: CVE-2026-25931, CVE-2026-25934, CVE-2026-25938, CVE-2026-25939 - 0 updated CVEs:
        Date: Mon, 9 Feb 2026 22:23:00 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.18.inc               | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.18.inc b/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
index 383f35291e..0de60d7d94 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2026-02-05 00:48:36.677660+00:00 for kernel version 6.18.8
-# From linux_kernel_cves 2026-02-05_baseline
+# Generated at 2026-02-09 22:31:26.580286+00:00 for kernel version 6.18.9
+# From linux_kernel_cves cve_2026-02-09_2200Z
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.18.8"
+    this_version = "6.18.9"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -20156,7 +20156,7 @@ CVE_STATUS[CVE-2025-71072] = "cpe-stable-backport: Backported in 6.18.3"
 
 CVE_STATUS[CVE-2025-71073] = "cpe-stable-backport: Backported in 6.18.3"
 
-# CVE-2025-71074 needs backporting (fixed from 6.19rc1)
+# CVE-2025-71074 needs backporting (fixed from 6.19)
 
 CVE_STATUS[CVE-2025-71075] = "cpe-stable-backport: Backported in 6.18.3"
 
@@ -20300,7 +20300,7 @@ CVE_STATUS[CVE-2025-71144] = "cpe-stable-backport: Backported in 6.18.5"
 
 # CVE-2025-71145 has no known resolution
 
-CVE_STATUS[CVE-2025-71146] = "cpe-stable-backport: Backported in 6.18.3"
+CVE_STATUS[CVE-2025-71146] = "fixed-version: Fixed from version 6.18.3"
 
 CVE_STATUS[CVE-2025-71147] = "cpe-stable-backport: Backported in 6.18.3"
 
@@ -20390,7 +20390,7 @@ CVE_STATUS[CVE-2026-22981] = "cpe-stable-backport: Backported in 6.18.6"
 
 CVE_STATUS[CVE-2026-22982] = "cpe-stable-backport: Backported in 6.18.6"
 
-CVE_STATUS[CVE-2026-22983] = "cpe-stable-backport: Backported in 6.18.6"
+CVE_STATUS[CVE-2026-22983] = "fixed-version: Fixed from version 6.18.6"
 
 CVE_STATUS[CVE-2026-22984] = "cpe-stable-backport: Backported in 6.18.6"
 
@@ -20400,7 +20400,7 @@ CVE_STATUS[CVE-2026-22986] = "cpe-stable-backport: Backported in 6.18.6"
 
 CVE_STATUS[CVE-2026-22987] = "cpe-stable-backport: Backported in 6.18.6"
 
-CVE_STATUS[CVE-2026-22988] = "cpe-stable-backport: Backported in 6.18.6"
+CVE_STATUS[CVE-2026-22988] = "fixed-version: Fixed from version 6.18.6"
 
 CVE_STATUS[CVE-2026-22989] = "cpe-stable-backport: Backported in 6.18.6"
 
@@ -20414,7 +20414,7 @@ CVE_STATUS[CVE-2026-22993] = "cpe-stable-backport: Backported in 6.18.6"
 
 CVE_STATUS[CVE-2026-22994] = "cpe-stable-backport: Backported in 6.18.6"
 
-CVE_STATUS[CVE-2026-22995] = "cpe-stable-backport: Backported in 6.18.6"
+CVE_STATUS[CVE-2026-22995] = "fixed-version: Fixed from version 6.18.6"
 
 CVE_STATUS[CVE-2026-22996] = "cpe-stable-backport: Backported in 6.18.7"
 
@@ -20588,7 +20588,7 @@ CVE_STATUS[CVE-2026-23080] = "cpe-stable-backport: Backported in 6.18.8"
 
 CVE_STATUS[CVE-2026-23081] = "cpe-stable-backport: Backported in 6.18.8"
 
-CVE_STATUS[CVE-2026-23082] = "cpe-stable-backport: Backported in 6.18.8"
+CVE_STATUS[CVE-2026-23082] = "fixed-version: Fixed from version 6.18.8"
 
 CVE_STATUS[CVE-2026-23083] = "cpe-stable-backport: Backported in 6.18.8"
 
-- 
2.43.0


