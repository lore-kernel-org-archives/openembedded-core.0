Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC81D711BB
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 20:23:13 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2035.1766089391072451367
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 12:23:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hJQjYqHK;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4f1b4bb40aaso5447671cf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 12:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766089390; x=1766694190; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=peAca7HEDnviGn1Vs2WIVmYnCrN5k66KbfHdRlcmsdg=;
        b=hJQjYqHKfXsi6Hju+6KFBjAJ1OMsu/cSXcaDZAuBOokVDIxLh9RmAlnIHDBLT5YyiM
         oMLSBH3q2QA/+NxxxSYvpfaYEJvHSm6mzqCP6RXgaOuvCI5EKIKqsJMdsyMsN2W3yqwZ
         UGvp3iTi/WpkdDmnt6+QN1hw19KzSvLytVqdQonQUMrSogZINkSJu7WWNpC+fJUtWLam
         QnfegYOhQBWwrR2Tswq43JxyWR4Vjs+6fr5N+gaJ1fHxsp2QMs2gwv1oQHzvKfct+6do
         k3bvWDP+e27ElnHVyMtaeFqd++EpvX+wEqZ0LnnsKF7FGyzrqtj5xARzj5sg/pcg+Zu3
         /Kcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766089390; x=1766694190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=peAca7HEDnviGn1Vs2WIVmYnCrN5k66KbfHdRlcmsdg=;
        b=ezFGugRo54aZZ907se2IoC2NL6drjiAA7HS2Vq76CCnmHSY/VOwlm4Rerg4BJwnQoK
         7+WVPN6vkMbPtYB8nqXbp2XfhIMO0TsZhOfXo7PmMxiMOyEAgqkL5lc5aHAZ4paZy5y+
         2xB2swAc4HesWxGAKpReeOJK0FryoPFRU94RT6JyaAFwj1/Q31FwWesuilivhAL/MvrH
         ebU5xBrqAtoV1I5OVIlnEqYEwA0Jg94WhW9k0NTOcOIugHC+hqcMjyuth7HHDDobTNlK
         6lNSGuAaomAvpT/nFzb//POoEQaS7+4N8PTjzpttwPCaf4du8SzFlOnOp6MLAMNBBfYg
         jENA==
X-Gm-Message-State: AOJu0YxXwOym89MdZDXrGss1kOpsFC4V8PVPFkaaRRwWRbQHTClv5t1D
	WengfqdN8FlzeASV67klvpaE+RpCWTBnQqGmKcfuXC0CliVYjp8htktOnffJfx+v5Ho=
X-Gm-Gg: AY/fxX7qgJEVk95TOPyjS8wtD59jDrZfkC4U8h9RlezjEPF6RZUVtJnAdIY/nY5jTBL
	OQGliPxz1JPyB3qEZWVOeB0xTzXtIsVX5Kgs0kTI83PTT+1Z29pMcKfOSMKxWwMvYXJbflYZLWU
	8D9Va65lueCn2VMGgOSvzAasuR9kdY9qjV8SttPSLA2ams87e1F7TO9FxY09Sc2v4bGqtAllME2
	E1Cj36SemgXmrdIb6qb+6+ayH1AgR7VCq2Um9XQ1T4Iaz4p69TFJZZKGQGuu49L2mj2zFomL719
	QhnKDJ+aSHN3JvP7UWWgQcxOhjQtBLXr1nkInJhOTbXAjqkmFzbg/bGfuzlmHYJxW8+oHBZJqOf
	Y2Hgunz2U8QS95L3c2t0ViNpJpx5SQFYiQsOpWb3d8XGwDJAf+M5V8hBTz1U6/NIJxm+7vepOIQ
	3JxdOCJdwNzmQTdE3gX3sOJq24FVb/ii9gjMawQ1ARKOTVvnfIC8wEbRZfrG15PaA3OYRpZ3NA4
	k6XNfBsEd65JSM=
X-Google-Smtp-Source: AGHT+IGu+ExjI5wRLEM40QqMmM2dCpsOud+7NcDbFRuqACHdacD8I7WxsC1O9GS0vMFGxg5P6ecYiQ==
X-Received: by 2002:ac8:5d14:0:b0:4ef:cfab:5a55 with SMTP id d75a77b69052e-4f4abd93d15mr7990131cf.60.1766089389527;
        Thu, 18 Dec 2025 12:23:09 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7dbdcsm3226456d6.43.2025.12.18.12.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 12:23:08 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [15/15][openembedded-core] linux-yocto/6.18: update CVE exclusions (6.18.1)
Date: Thu, 18 Dec 2025 15:22:40 -0500
Message-Id: <20251218202248.70476-15-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1766087617.bruce.ashfield@gmail.com>
References: <cover.1766087617.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 20:23:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228158

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 13 changes (3 new | 10 updated): - 3 new CVEs: CVE-2025-65742, CVE-2025-66434, CVE-2025-66435 - 10 updated CVEs: CVE-2024-1394, CVE-2024-44598, CVE-2024-44599, CVE-2025-13823, CVE-2025-13824, CVE-2025-14589, CVE-2025-34411, CVE-2025-34412, CVE-2025-55184, CVE-2025-60786
        Date: Mon, 15 Dec 2025 16:49:37 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.18.inc              | 669 +++++++++---------
 1 file changed, 336 insertions(+), 333 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.18.inc b/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
index d5d6d88243..6545ed4d2c 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.18.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-12-09 15:30:33.713956+00:00 for kernel version 6.18
-# From linux_kernel_cves cve_2025-12-09_1500Z-1-g085e057e2ea
+# Generated at 2025-12-15 16:54:43.920979+00:00 for kernel version 6.18.1
+# From linux_kernel_cves cve_2025-12-15_1600Z-3-ge310f2e801a
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.18"
+    this_version = "6.18.1"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -17822,33 +17822,33 @@ CVE_STATUS[CVE-2025-39989] = "fixed-version: Fixed from version 6.15"
 
 CVE_STATUS[CVE-2025-39990] = "fixed-version: Fixed from version 6.17"
 
-CVE_STATUS[CVE-2025-39991] = "cpe-stable-backport: Backported in 6.17.1"
+CVE_STATUS[CVE-2025-39991] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-39992] = "cpe-stable-backport: Backported in 6.17.1"
+CVE_STATUS[CVE-2025-39992] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-39993] = "cpe-stable-backport: Backported in 6.17.1"
+CVE_STATUS[CVE-2025-39993] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-39994] = "cpe-stable-backport: Backported in 6.17.1"
+CVE_STATUS[CVE-2025-39994] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-39995] = "cpe-stable-backport: Backported in 6.17.1"
+CVE_STATUS[CVE-2025-39995] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-39996] = "cpe-stable-backport: Backported in 6.17.1"
+CVE_STATUS[CVE-2025-39996] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-39997] = "cpe-stable-backport: Backported in 6.17.1"
+CVE_STATUS[CVE-2025-39997] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-39998] = "cpe-stable-backport: Backported in 6.17.1"
+CVE_STATUS[CVE-2025-39998] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-39999] = "cpe-stable-backport: Backported in 6.17.1"
+CVE_STATUS[CVE-2025-39999] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40000] = "cpe-stable-backport: Backported in 6.17.1"
+CVE_STATUS[CVE-2025-40000] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40001] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40001] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40002] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40002] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40003] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40003] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40004] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40004] = "fixed-version: Fixed from version 6.18"
 
 CVE_STATUS[CVE-2025-40005] = "fixed-version: Fixed from version 6.17"
 
@@ -17866,19 +17866,19 @@ CVE_STATUS[CVE-2025-40011] = "fixed-version: Fixed from version 6.17"
 
 CVE_STATUS[CVE-2025-40012] = "fixed-version: Fixed from version 6.17"
 
-CVE_STATUS[CVE-2025-40013] = "cpe-stable-backport: Backported in 6.17.1"
+CVE_STATUS[CVE-2025-40013] = "fixed-version: Fixed from version 6.18"
 
 CVE_STATUS[CVE-2025-40014] = "fixed-version: Fixed from version 6.15"
 
-CVE_STATUS[CVE-2025-40015] = "cpe-stable-backport: Backported in 6.17.1"
+CVE_STATUS[CVE-2025-40015] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40016] = "cpe-stable-backport: Backported in 6.17.1"
+CVE_STATUS[CVE-2025-40016] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40017] = "cpe-stable-backport: Backported in 6.17.1"
+CVE_STATUS[CVE-2025-40017] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40018] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40018] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40019] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40019] = "fixed-version: Fixed from version 6.18"
 
 CVE_STATUS[CVE-2025-40020] = "fixed-version: Fixed from version 6.17"
 
@@ -17890,640 +17890,643 @@ CVE_STATUS[CVE-2025-40023] = "fixed-version: Fixed from version 6.17"
 
 CVE_STATUS[CVE-2025-40024] = "fixed-version: Fixed from version 6.17"
 
-CVE_STATUS[CVE-2025-40025] = "cpe-stable-backport: Backported in 6.17.2"
+CVE_STATUS[CVE-2025-40025] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40026] = "cpe-stable-backport: Backported in 6.17.2"
+CVE_STATUS[CVE-2025-40026] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40027] = "cpe-stable-backport: Backported in 6.17.2"
+CVE_STATUS[CVE-2025-40027] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40028] = "cpe-stable-backport: Backported in 6.17.2"
+CVE_STATUS[CVE-2025-40028] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40029] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40029] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40030] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40030] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40031] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40031] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40032] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40032] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40033] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40033] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40034] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40034] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40035] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40035] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40036] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40036] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40037] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40037] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40038] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40038] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40039] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40039] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40040] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40040] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40041] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40041] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40042] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40042] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40043] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40043] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40044] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40044] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40045] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40045] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40046] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40046] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40047] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40047] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40048] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40048] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40049] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40049] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40050] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40050] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40051] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40051] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40052] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40052] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40053] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40053] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40054] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40054] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40055] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40055] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40056] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40056] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40057] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40057] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40058] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40058] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40059] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40059] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40060] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40060] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40061] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40061] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40062] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40062] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40063] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40063] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40064] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40064] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40065] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40065] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40066] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40066] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40067] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40067] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40068] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40068] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40069] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40069] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40070] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40070] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40071] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40071] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40072] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40072] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40073] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40073] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40074] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40074] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40075] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40075] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40076] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40076] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40077] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40077] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40078] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40078] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40079] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40079] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40080] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40080] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40081] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40081] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40082] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40082] = "fixed-version: Fixed from version 6.18"
 
 CVE_STATUS[CVE-2025-40083] = "fixed-version: Fixed from version 6.16"
 
-CVE_STATUS[CVE-2025-40084] = "cpe-stable-backport: Backported in 6.17.6"
+CVE_STATUS[CVE-2025-40084] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40085] = "cpe-stable-backport: Backported in 6.17.5"
+CVE_STATUS[CVE-2025-40085] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40086] = "cpe-stable-backport: Backported in 6.17.5"
+CVE_STATUS[CVE-2025-40086] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40087] = "cpe-stable-backport: Backported in 6.17.5"
+CVE_STATUS[CVE-2025-40087] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40088] = "cpe-stable-backport: Backported in 6.17.5"
+CVE_STATUS[CVE-2025-40088] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40089] = "cpe-stable-backport: Backported in 6.17.5"
+CVE_STATUS[CVE-2025-40089] = "fixed-version: Fixed from version 6.18"
 
 CVE_STATUS[CVE-2025-40090] = "fixed-version: Fixed from version 6.17.5"
 
-CVE_STATUS[CVE-2025-40091] = "cpe-stable-backport: Backported in 6.17.5"
+CVE_STATUS[CVE-2025-40091] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40092] = "cpe-stable-backport: Backported in 6.17.5"
+CVE_STATUS[CVE-2025-40092] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40093] = "cpe-stable-backport: Backported in 6.17.5"
+CVE_STATUS[CVE-2025-40093] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40094] = "cpe-stable-backport: Backported in 6.17.5"
+CVE_STATUS[CVE-2025-40094] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40095] = "cpe-stable-backport: Backported in 6.17.5"
+CVE_STATUS[CVE-2025-40095] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40096] = "cpe-stable-backport: Backported in 6.17.5"
+CVE_STATUS[CVE-2025-40096] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40097] = "cpe-stable-backport: Backported in 6.17.5"
+CVE_STATUS[CVE-2025-40097] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40098] = "cpe-stable-backport: Backported in 6.17.5"
+CVE_STATUS[CVE-2025-40098] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40099] = "cpe-stable-backport: Backported in 6.17.5"
+CVE_STATUS[CVE-2025-40099] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40100] = "cpe-stable-backport: Backported in 6.17.5"
+CVE_STATUS[CVE-2025-40100] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40101] = "cpe-stable-backport: Backported in 6.17.5"
+CVE_STATUS[CVE-2025-40101] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40102] = "cpe-stable-backport: Backported in 6.17.5"
+CVE_STATUS[CVE-2025-40102] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40103] = "cpe-stable-backport: Backported in 6.17.5"
+CVE_STATUS[CVE-2025-40103] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40104] = "cpe-stable-backport: Backported in 6.17.5"
+CVE_STATUS[CVE-2025-40104] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40105] = "cpe-stable-backport: Backported in 6.17.5"
+CVE_STATUS[CVE-2025-40105] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40106] = "cpe-stable-backport: Backported in 6.17.6"
+CVE_STATUS[CVE-2025-40106] = "fixed-version: Fixed from version 6.18"
 
 CVE_STATUS[CVE-2025-40107] = "fixed-version: Fixed from version 6.17"
 
-CVE_STATUS[CVE-2025-40108] = "cpe-stable-backport: Backported in 6.17.2"
+CVE_STATUS[CVE-2025-40108] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40109] = "cpe-stable-backport: Backported in 6.17.2"
+CVE_STATUS[CVE-2025-40109] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40110] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40110] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40111] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40111] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40112] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40112] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40113] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40113] = "fixed-version: Fixed from version 6.18"
 
 CVE_STATUS[CVE-2025-40114] = "fixed-version: Fixed from version 6.15"
 
-CVE_STATUS[CVE-2025-40115] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40115] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40116] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40116] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40117] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40117] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40118] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40118] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40119] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40119] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40120] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40120] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40121] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40121] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40122] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40122] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40123] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40123] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40124] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40124] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40125] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40125] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40126] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40126] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40127] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40127] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40129] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40129] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40130] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40130] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40131] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40131] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40132] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40132] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40133] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40133] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40134] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40134] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40135] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40135] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40136] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40136] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40137] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40137] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40138] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40138] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40139] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40139] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40140] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40140] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40141] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40141] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40142] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40142] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40143] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40143] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40145] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40145] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40146] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40146] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40147] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40147] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40148] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40148] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40149] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40149] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40150] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40150] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40151] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40151] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40152] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40152] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40153] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40153] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40154] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40154] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40155] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40155] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40156] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40156] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40157] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40157] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40158] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40158] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40159] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40159] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40160] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40160] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40161] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40161] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40162] = "cpe-stable-backport: Backported in 6.17.5"
+CVE_STATUS[CVE-2025-40162] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40163] = "cpe-stable-backport: Backported in 6.17.5"
+CVE_STATUS[CVE-2025-40163] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40164] = "cpe-stable-backport: Backported in 6.17.5"
+CVE_STATUS[CVE-2025-40164] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40165] = "cpe-stable-backport: Backported in 6.17.5"
+CVE_STATUS[CVE-2025-40165] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40166] = "cpe-stable-backport: Backported in 6.17.5"
+CVE_STATUS[CVE-2025-40166] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40167] = "cpe-stable-backport: Backported in 6.17.5"
+CVE_STATUS[CVE-2025-40167] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40168] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40168] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40169] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40169] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40170] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40170] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40171] = "cpe-stable-backport: Backported in 6.17.3"
+CVE_STATUS[CVE-2025-40171] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40172] = "cpe-stable-backport: Backported in 6.17.5"
+CVE_STATUS[CVE-2025-40172] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40173] = "cpe-stable-backport: Backported in 6.17.5"
+CVE_STATUS[CVE-2025-40173] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40174] = "cpe-stable-backport: Backported in 6.17.5"
+CVE_STATUS[CVE-2025-40174] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40175] = "cpe-stable-backport: Backported in 6.17.5"
+CVE_STATUS[CVE-2025-40175] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40176] = "cpe-stable-backport: Backported in 6.17.5"
+CVE_STATUS[CVE-2025-40176] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40177] = "cpe-stable-backport: Backported in 6.17.5"
+CVE_STATUS[CVE-2025-40177] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40178] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40178] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40179] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40179] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40180] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40180] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40181] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40181] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40182] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40182] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40183] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40183] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40184] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40184] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40185] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40185] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40186] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40186] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40187] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40187] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40188] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40188] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40189] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40189] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40190] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40190] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40191] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40191] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40192] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40192] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40193] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40193] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40194] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40194] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40195] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40195] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40196] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40196] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40197] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40197] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40198] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40198] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40199] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40199] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40200] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40200] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40201] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40201] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40202] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40202] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40203] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40203] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40204] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40204] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40205] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40205] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40206] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40206] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40207] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40207] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40208] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40208] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40209] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40209] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40210] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40210] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40211] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40211] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40212] = "cpe-stable-backport: Backported in 6.17.9"
+CVE_STATUS[CVE-2025-40212] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40213] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40213] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40214] = "cpe-stable-backport: Backported in 6.17.9"
+CVE_STATUS[CVE-2025-40214] = "fixed-version: Fixed from version 6.18"
 
 CVE_STATUS[CVE-2025-40215] = "fixed-version: Fixed from version 6.16"
 
 CVE_STATUS[CVE-2025-40216] = "fixed-version: Fixed from version 6.16"
 
-CVE_STATUS[CVE-2025-40217] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40217] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40218] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40218] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40219] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40219] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40220] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40220] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40221] = "cpe-stable-backport: Backported in 6.17.4"
+CVE_STATUS[CVE-2025-40221] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40222] = "cpe-stable-backport: Backported in 6.17.6"
+CVE_STATUS[CVE-2025-40222] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40223] = "cpe-stable-backport: Backported in 6.17.6"
+CVE_STATUS[CVE-2025-40223] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40224] = "cpe-stable-backport: Backported in 6.17.6"
+CVE_STATUS[CVE-2025-40224] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40225] = "cpe-stable-backport: Backported in 6.17.6"
+CVE_STATUS[CVE-2025-40225] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40226] = "cpe-stable-backport: Backported in 6.17.6"
+CVE_STATUS[CVE-2025-40226] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40227] = "cpe-stable-backport: Backported in 6.17.6"
+CVE_STATUS[CVE-2025-40227] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40228] = "cpe-stable-backport: Backported in 6.17.6"
+CVE_STATUS[CVE-2025-40228] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40229] = "cpe-stable-backport: Backported in 6.17.6"
+CVE_STATUS[CVE-2025-40229] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40230] = "cpe-stable-backport: Backported in 6.17.6"
+CVE_STATUS[CVE-2025-40230] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40231] = "cpe-stable-backport: Backported in 6.17.6"
+CVE_STATUS[CVE-2025-40231] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40232] = "cpe-stable-backport: Backported in 6.17.6"
+CVE_STATUS[CVE-2025-40232] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40233] = "cpe-stable-backport: Backported in 6.17.6"
+CVE_STATUS[CVE-2025-40233] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40234] = "cpe-stable-backport: Backported in 6.17.6"
+CVE_STATUS[CVE-2025-40234] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40235] = "cpe-stable-backport: Backported in 6.17.6"
+CVE_STATUS[CVE-2025-40235] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40236] = "cpe-stable-backport: Backported in 6.17.6"
+CVE_STATUS[CVE-2025-40236] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40237] = "cpe-stable-backport: Backported in 6.17.6"
+CVE_STATUS[CVE-2025-40237] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40238] = "cpe-stable-backport: Backported in 6.17.6"
+CVE_STATUS[CVE-2025-40238] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40239] = "cpe-stable-backport: Backported in 6.17.6"
+CVE_STATUS[CVE-2025-40239] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40240] = "cpe-stable-backport: Backported in 6.17.6"
+CVE_STATUS[CVE-2025-40240] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40241] = "cpe-stable-backport: Backported in 6.17.6"
+CVE_STATUS[CVE-2025-40241] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40242] = "cpe-stable-backport: Backported in 6.17.6"
+CVE_STATUS[CVE-2025-40242] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40243] = "cpe-stable-backport: Backported in 6.17.6"
+CVE_STATUS[CVE-2025-40243] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40244] = "cpe-stable-backport: Backported in 6.17.6"
+CVE_STATUS[CVE-2025-40244] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40245] = "cpe-stable-backport: Backported in 6.17.6"
+CVE_STATUS[CVE-2025-40245] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40246] = "cpe-stable-backport: Backported in 6.17.10"
+CVE_STATUS[CVE-2025-40246] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40247] = "cpe-stable-backport: Backported in 6.17.10"
+CVE_STATUS[CVE-2025-40247] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40248] = "cpe-stable-backport: Backported in 6.17.10"
+CVE_STATUS[CVE-2025-40248] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40249] = "cpe-stable-backport: Backported in 6.17.10"
+CVE_STATUS[CVE-2025-40249] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40250] = "cpe-stable-backport: Backported in 6.17.10"
+CVE_STATUS[CVE-2025-40250] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40251] = "cpe-stable-backport: Backported in 6.17.10"
+CVE_STATUS[CVE-2025-40251] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40252] = "cpe-stable-backport: Backported in 6.17.10"
+CVE_STATUS[CVE-2025-40252] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40253] = "cpe-stable-backport: Backported in 6.17.10"
+CVE_STATUS[CVE-2025-40253] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40254] = "cpe-stable-backport: Backported in 6.17.10"
+CVE_STATUS[CVE-2025-40254] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40255] = "cpe-stable-backport: Backported in 6.17.10"
+CVE_STATUS[CVE-2025-40255] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40256] = "cpe-stable-backport: Backported in 6.17.10"
+CVE_STATUS[CVE-2025-40256] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40257] = "cpe-stable-backport: Backported in 6.17.10"
+CVE_STATUS[CVE-2025-40257] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40258] = "cpe-stable-backport: Backported in 6.17.10"
+CVE_STATUS[CVE-2025-40258] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40259] = "cpe-stable-backport: Backported in 6.17.10"
+CVE_STATUS[CVE-2025-40259] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40260] = "cpe-stable-backport: Backported in 6.17.10"
+CVE_STATUS[CVE-2025-40260] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40261] = "cpe-stable-backport: Backported in 6.17.10"
+CVE_STATUS[CVE-2025-40261] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40262] = "cpe-stable-backport: Backported in 6.17.10"
+CVE_STATUS[CVE-2025-40262] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40263] = "cpe-stable-backport: Backported in 6.17.10"
+CVE_STATUS[CVE-2025-40263] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40264] = "cpe-stable-backport: Backported in 6.17.10"
+CVE_STATUS[CVE-2025-40264] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40265] = "cpe-stable-backport: Backported in 6.17.10"
+CVE_STATUS[CVE-2025-40265] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40266] = "cpe-stable-backport: Backported in 6.17.10"
+CVE_STATUS[CVE-2025-40266] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40267] = "cpe-stable-backport: Backported in 6.17.9"
+CVE_STATUS[CVE-2025-40267] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40268] = "cpe-stable-backport: Backported in 6.17.9"
+CVE_STATUS[CVE-2025-40268] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40269] = "cpe-stable-backport: Backported in 6.17.9"
+CVE_STATUS[CVE-2025-40269] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40270] = "cpe-stable-backport: Backported in 6.17.9"
+CVE_STATUS[CVE-2025-40270] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40271] = "cpe-stable-backport: Backported in 6.17.9"
+CVE_STATUS[CVE-2025-40271] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40272] = "cpe-stable-backport: Backported in 6.17.9"
+CVE_STATUS[CVE-2025-40272] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40273] = "cpe-stable-backport: Backported in 6.17.9"
+CVE_STATUS[CVE-2025-40273] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40274] = "cpe-stable-backport: Backported in 6.17.9"
+CVE_STATUS[CVE-2025-40274] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40275] = "cpe-stable-backport: Backported in 6.17.9"
+CVE_STATUS[CVE-2025-40275] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40276] = "cpe-stable-backport: Backported in 6.17.9"
+CVE_STATUS[CVE-2025-40276] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40277] = "cpe-stable-backport: Backported in 6.17.9"
+CVE_STATUS[CVE-2025-40277] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40278] = "cpe-stable-backport: Backported in 6.17.9"
+CVE_STATUS[CVE-2025-40278] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40279] = "cpe-stable-backport: Backported in 6.17.9"
+CVE_STATUS[CVE-2025-40279] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40280] = "cpe-stable-backport: Backported in 6.17.9"
+CVE_STATUS[CVE-2025-40280] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40281] = "cpe-stable-backport: Backported in 6.17.9"
+CVE_STATUS[CVE-2025-40281] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40282] = "cpe-stable-backport: Backported in 6.17.9"
+CVE_STATUS[CVE-2025-40282] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40283] = "cpe-stable-backport: Backported in 6.17.9"
+CVE_STATUS[CVE-2025-40283] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40284] = "cpe-stable-backport: Backported in 6.17.9"
+CVE_STATUS[CVE-2025-40284] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40285] = "cpe-stable-backport: Backported in 6.17.9"
+CVE_STATUS[CVE-2025-40285] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40286] = "cpe-stable-backport: Backported in 6.17.9"
+CVE_STATUS[CVE-2025-40286] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40287] = "cpe-stable-backport: Backported in 6.17.9"
+CVE_STATUS[CVE-2025-40287] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40288] = "cpe-stable-backport: Backported in 6.17.9"
+CVE_STATUS[CVE-2025-40288] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40289] = "cpe-stable-backport: Backported in 6.17.9"
+CVE_STATUS[CVE-2025-40289] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40290] = "cpe-stable-backport: Backported in 6.17.11"
+CVE_STATUS[CVE-2025-40290] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40291] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40291] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40292] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40292] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40293] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40293] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40294] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40294] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40295] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40295] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40296] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40296] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40297] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40297] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40298] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40298] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40299] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40299] = "fixed-version: Fixed from version 6.18"
 
 CVE_STATUS[CVE-2025-40300] = "fixed-version: Fixed from version 6.17"
 
-CVE_STATUS[CVE-2025-40301] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40301] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40302] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40302] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40303] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40303] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40304] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40304] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40305] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40305] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40306] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40306] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40307] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40307] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40308] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40308] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40309] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40309] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40310] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40310] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40311] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40311] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40312] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40312] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40313] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40313] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40314] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40314] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40315] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40315] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40316] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40316] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40317] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40317] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40318] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40318] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40319] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40319] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40320] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40320] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40321] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40321] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40322] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40322] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40323] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40323] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40324] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40324] = "fixed-version: Fixed from version 6.18"
 
 CVE_STATUS[CVE-2025-40325] = "fixed-version: Fixed from version 6.15"
 
-CVE_STATUS[CVE-2025-40326] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40326] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40327] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40327] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40328] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40328] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40329] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40329] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40330] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40330] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40331] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40331] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40332] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40332] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40333] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40333] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40334] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40334] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40335] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40335] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40336] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40336] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40337] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40337] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40338] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40338] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40339] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40339] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40340] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40340] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40341] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40341] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40342] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40342] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40343] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40343] = "fixed-version: Fixed from version 6.18"
 
-CVE_STATUS[CVE-2025-40344] = "cpe-stable-backport: Backported in 6.17.8"
+CVE_STATUS[CVE-2025-40344] = "fixed-version: Fixed from version 6.18"
+
+CVE_STATUS[CVE-2025-40345] = "fixed-version: Fixed from version 6.18"
 
 CVE_STATUS[CVE-2025-40364] = "fixed-version: Fixed from version 6.14"
+
-- 
2.39.2


