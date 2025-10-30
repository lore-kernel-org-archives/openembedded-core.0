Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D17C1CCFA00
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 17:12:48 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.3239.1761844361071241303
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 10:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JrGiZF+p;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-891208f6185so111815085a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 10:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761844360; x=1762449160; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+9GjT+IXApL94ehDKNdFnXwSAUHq73J7942niLGgtI=;
        b=JrGiZF+pw156odYdx88Btxmb2G3zQuuJvv+zE7YckCdVhE9+QvQhNe8RfzZsQkMfcZ
         mEBg8r4k9mWPxNt8N1lymZXvfgjgnHtAxd0SZkBydBzSFykCysktZ253//SuJYHUtflb
         +4GsyLHCe1LFr+Ff9Th2n0xMNfi5Vlv7Z6Tj89iQYJH4AhuYtPuiRo7EsMNaNM6KOjYM
         YzzBNegwRVxdpzkMdrw+rHhIQHjN1A8Kk8RqqAQVWP+vmoUZbDFZ1aC5FKALUxWwbi+H
         8CqiPSuxHLisVAwmyKQ8eLPfGo2pICz4G/jXfHtcO2Eo/yoA0QjfXSOaULbyG88/cx5U
         GkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761844360; x=1762449160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+9GjT+IXApL94ehDKNdFnXwSAUHq73J7942niLGgtI=;
        b=EHWP0IiE7nEiVd7jFAwUpngeiGm5xUjYPy+mZsoZa+ULVpEFwgJ1FeMiO5VnVXocXs
         EiWEqc6+QPEIy5b9aXZmNOzROuqcvPTwDMrcwkYQ4iqPV7y12ZXvdajM15VdvFrZEOWC
         Pgag8QcXZiAZiM2+3Mp9wfZklg4Apx2pwXjnhUzbrV1arT+C7qzh4uvld6JKayq60XIt
         38T4ZW1NQMdIxTRUYF6cKrhQgT2TyN6ktNPrmAX5Tz8NsfrZVRMuJ+0XJxNg3n8lBUWf
         YcZGsmRN1GbkCkmJDquuVwRXpGvRultZTiM0wLMvHTTaAyfgaTrSFLkiRiBvohPK69Ev
         QNIQ==
X-Gm-Message-State: AOJu0YyUeSpczdOw67a1wE76VRyHvjM99dXhYQRqX8AFBrNpcPIZ3ANN
	3mgOrELklhSAr+eTyqg4MzMzOZA2r4f1lxND8Dys6susNp8jkyAfVEw18LW8d4qAQeM=
X-Gm-Gg: ASbGncu+YykovDtW+SkzB3khTEoMpx2XO22sYC7GSQ6soMj0CFJ3Yy/k8MJR0+6BS3O
	LNnytGsoWxI12hSICtDjAqZ/6wKUavyQxIClb9DM+LViK0vUay5BTyJK/o0JpNtuvS/1+q/mECV
	aEPQ4GGm5RqhDc5Qf0mu/an4fpHA5TB5LcbS3MhFOw1QkhEdK9VsDYlHZTh7RtV4gJv2FjnISkB
	LBoebL+uFnt6d4FyU6Z7Gjb5ZLr/CfcrDK8iJbqM4FPdl0dsOOQiAZO6yrjNdpedN4CoEpW3QRB
	EeM+4R5dAKOCxQut39U+cIrt4n0VsLAzl5VdfkVkIweJM2tiqNCL4YoYZWNDcc8sJScef7Z2P1w
	dfO7vQWvuKBtfe+VRW2Fd8Urxcq/ypsu3X7cFo6n+8RImNE1vaSQWCkvw0wytk3V/C4srP1OAgY
	rwLI5Nr40AspC8jjm1taPNAjzqjpY5s0I01a8YIsTOqsIOBZYCB3Oa3NnYokaWqsvrGvTlBLiNu
	2XoXo4FabnNYAA=
X-Google-Smtp-Source: AGHT+IHmxHVLLT42NNu5VpK+m6kJAikU8u7DXR4IaH7p2qEOoN0wlVMwmA8PyzCH/BpmbbZLTfzGZw==
X-Received: by 2002:a05:620a:371c:b0:8a4:b9eb:e623 with SMTP id af79cd13be357-8ab99591f72mr24374585a.35.1761844359848;
        Thu, 30 Oct 2025 10:12:39 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-89f254ab74fsm1279296385a.32.2025.10.30.10.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 10:12:39 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 07/14] linux-yocto/6.17: update CVE exclusions (6.17.6)
Date: Thu, 30 Oct 2025 13:12:20 -0400
Message-Id: <606ec2a80159804f97df8cb502e0fba46f48740c.1761844161.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1761844161.git.bruce.ashfield@gmail.com>
References: <cover.1761844161.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Oct 2025 17:12:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225509

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 6 changes (4 new | 2 updated): - 4 new CVEs: CVE-2025-60319, CVE-2025-61120, CVE-2025-61121, CVE-2025-62726 - 2 updated CVEs: CVE-2023-41265, CVE-2025-12517
        Date: Thu, 30 Oct 2025 16:36:48 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.17.inc              | 172 +++++++++++++++++-
 1 file changed, 167 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.17.inc b/meta/recipes-kernel/linux/cve-exclusion_6.17.inc
index d8bd69e363..126afb8ede 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.17.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.17.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-10-24 17:33:21.643193+00:00 for kernel version 6.17.5
-# From linux_kernel_cves cve_2025-10-24_1700Z-1-g54a7791aaf0
+# Generated at 2025-10-30 16:47:14.266821+00:00 for kernel version 6.17.6
+# From linux_kernel_cves cve_2025-10-30_1600Z-2-g07cefa3115c
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.17.5"
+    this_version = "6.17.6"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -6806,8 +6806,6 @@ CVE_STATUS[CVE-2023-53291] = "fixed-version: Fixed from version 6.5"
 
 CVE_STATUS[CVE-2023-53292] = "fixed-version: Fixed from version 6.5"
 
-CVE_STATUS[CVE-2023-53293] = "fixed-version: Fixed from version 6.4"
-
 CVE_STATUS[CVE-2023-53294] = "fixed-version: Fixed from version 6.4"
 
 CVE_STATUS[CVE-2023-53295] = "fixed-version: Fixed from version 6.3"
@@ -7676,6 +7674,8 @@ CVE_STATUS[CVE-2023-53732] = "fixed-version: Fixed from version 6.4"
 
 CVE_STATUS[CVE-2023-53733] = "fixed-version: Fixed from version 6.5"
 
+CVE_STATUS[CVE-2023-7324] = "fixed-version: Fixed from version 6.3"
+
 CVE_STATUS[CVE-2024-26581] = "fixed-version: Fixed from version 6.8"
 
 CVE_STATUS[CVE-2024-26582] = "fixed-version: Fixed from version 6.8"
@@ -17526,6 +17526,168 @@ CVE_STATUS[CVE-2025-40023] = "fixed-version: Fixed from version 6.17"
 
 CVE_STATUS[CVE-2025-40024] = "fixed-version: Fixed from version 6.17"
 
+CVE_STATUS[CVE-2025-40025] = "cpe-stable-backport: Backported in 6.17.2"
+
+CVE_STATUS[CVE-2025-40026] = "cpe-stable-backport: Backported in 6.17.2"
+
+CVE_STATUS[CVE-2025-40027] = "cpe-stable-backport: Backported in 6.17.2"
+
+CVE_STATUS[CVE-2025-40028] = "cpe-stable-backport: Backported in 6.17.2"
+
+CVE_STATUS[CVE-2025-40029] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40030] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40031] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40032] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40033] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40034] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40035] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40036] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40037] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40038] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40039] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40040] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40041] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40042] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40043] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40044] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40045] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40046] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40047] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40048] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40049] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40050] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40051] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40052] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40053] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40054] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40055] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40056] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40057] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40058] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40059] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40060] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40061] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40062] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40063] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40064] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40065] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40066] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40067] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40068] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40069] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40070] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40071] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40072] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40073] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40074] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40075] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40076] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40077] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40078] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40079] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40080] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40081] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40082] = "cpe-stable-backport: Backported in 6.17.3"
+
+CVE_STATUS[CVE-2025-40083] = "fixed-version: Fixed from version 6.16"
+
+# CVE-2025-40084 has no known resolution
+
+CVE_STATUS[CVE-2025-40085] = "cpe-stable-backport: Backported in 6.17.5"
+
+CVE_STATUS[CVE-2025-40086] = "cpe-stable-backport: Backported in 6.17.5"
+
+CVE_STATUS[CVE-2025-40087] = "cpe-stable-backport: Backported in 6.17.5"
+
+CVE_STATUS[CVE-2025-40088] = "cpe-stable-backport: Backported in 6.17.5"
+
+CVE_STATUS[CVE-2025-40089] = "cpe-stable-backport: Backported in 6.17.5"
+
+CVE_STATUS[CVE-2025-40090] = "cpe-stable-backport: Backported in 6.17.5"
+
+CVE_STATUS[CVE-2025-40091] = "cpe-stable-backport: Backported in 6.17.5"
+
+CVE_STATUS[CVE-2025-40092] = "cpe-stable-backport: Backported in 6.17.5"
+
+CVE_STATUS[CVE-2025-40093] = "cpe-stable-backport: Backported in 6.17.5"
+
+CVE_STATUS[CVE-2025-40094] = "cpe-stable-backport: Backported in 6.17.5"
+
+CVE_STATUS[CVE-2025-40095] = "cpe-stable-backport: Backported in 6.17.5"
+
+CVE_STATUS[CVE-2025-40096] = "cpe-stable-backport: Backported in 6.17.5"
+
+CVE_STATUS[CVE-2025-40097] = "cpe-stable-backport: Backported in 6.17.5"
+
+CVE_STATUS[CVE-2025-40098] = "cpe-stable-backport: Backported in 6.17.5"
+
+CVE_STATUS[CVE-2025-40099] = "cpe-stable-backport: Backported in 6.17.5"
+
+CVE_STATUS[CVE-2025-40100] = "cpe-stable-backport: Backported in 6.17.5"
+
+CVE_STATUS[CVE-2025-40101] = "cpe-stable-backport: Backported in 6.17.5"
+
+CVE_STATUS[CVE-2025-40102] = "cpe-stable-backport: Backported in 6.17.5"
+
+CVE_STATUS[CVE-2025-40103] = "cpe-stable-backport: Backported in 6.17.5"
+
+CVE_STATUS[CVE-2025-40104] = "cpe-stable-backport: Backported in 6.17.5"
+
+CVE_STATUS[CVE-2025-40105] = "cpe-stable-backport: Backported in 6.17.5"
+
 CVE_STATUS[CVE-2025-40114] = "fixed-version: Fixed from version 6.15"
 
 CVE_STATUS[CVE-2025-40300] = "fixed-version: Fixed from version 6.17"
-- 
2.39.2


