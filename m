Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8D2ED1D866
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 04:30:52 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35382.1764822644906194662
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 20:30:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L9gNrZe2;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8804650ca32so4457876d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 20:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764822644; x=1765427444; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jo91TuPP3jpQqEr4X4vlX6fKl3aJJEuGb+aAqL72foo=;
        b=L9gNrZe2eVkcRBuTK+IpuJ3nzJp9KroTFyPSWBI0rr5+rl6bMwZiZVmH1MRy9ymsj6
         6e2hXB657Z/u5YW41r7pZAvpDkK9ol6nZBuc0QDuoxOlecKrkp1dC8+gEYjI23nSxMa6
         C3ahXeG+lhVS03vQWdkZvYke+Er3OBvJwY/TXl45yUNP2QNkdF+4R5o9N6C4bWMoOazw
         QuY5yNlVUJcyxUC/4u7dxvjNlaE7+qKaZjqV7u5ujjTUcHpqVDaN9Le+7GNIYuKLdCwU
         cWlOjnd+RkDqG7c4da7cPpJ2MFJKZo/9CL5mdRDCP9+2mlI7YKHx6NEBsg4qwv0/0MFW
         nOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764822644; x=1765427444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jo91TuPP3jpQqEr4X4vlX6fKl3aJJEuGb+aAqL72foo=;
        b=am7V764soLteBl1ToVHV6Iko2eQsqzoJ9TxbzcCX0x3KfImPYFjw3sRqcw/9LcD0vK
         2cYmwXR67h5qR82aZmWUk6LUpR0E32PkWCxYIc6Btf8m0YXF83tEjXrPiLwcit5ktQTk
         ll6dR49NdNAlW8Zu7JVa6LM1uEzvkYSZ7tjW8BGBqtBJLiR3oFGkYtOYL1mDOvvvUZXY
         3cuP5yE76wwFel3rsC7cuvfN19+uoYtgooN19BcKEMspmg2zM+nC2CF9FImXZr25QmP1
         PdEh2qOB6X8lRJJ3Y7ipIii+7nqfmABIixrspy2It7O/liZMLTDeqLFkcfvxrVTVoT3D
         COJg==
X-Gm-Message-State: AOJu0Yyhvupia2qxVPJi+hudvegu6esLxpEJqKpHKocFqf2TQyhkRKgv
	5Ym5I0Hmx444YaCTh+zemIxQMK7iVqpvFocXUAsT+MqpqS7B70ihkwgxZaquw18uivw=
X-Gm-Gg: ASbGncuBX4GSwuKVximnefymm6nPoztk9D2+WFIY1JFj0K6zHtqfVW/SqzHhQiFyj9I
	LcGLa1xGQAmcSC9krTScwz4ImSqokT+FbNPiRreoZ0BfelfL7DmUWLk4q1+evjh1+5CCZOyYiZK
	Ql1Yipg4HXd41Sq7YuyMyQZUdLuNozSL3q9qQ/qH+bIBKOcpyKMPWzFCfGL/EzZdIzYnr0K09NS
	donE8Vke4W1MNm++0fq4rASQPsYCfZtO0uR25vgqOwXP3GBZeobddbK7rfwo+7tikUHzfIuKRO1
	YMsS2sZAcuQDERea+/ua5ttSRgGeTZGb99ckNSFcAxBBPFp5+Qqi6CxZFWez+3zXgX/FFHbW5rU
	4Y8d4Whmgw68qU5ZHYZ/1PMLh8FLgOj3b8R6CpPsbfnTxrYraUTL5gHx1GHOrOv6gcO/gjitppC
	bMtSL/E1gtXZ/w2g0tB9y9kzUK+fNBVPX464C/OWXgiyoQZvS3LOWEkXRz5v2HPatW2gEZMqCVL
	IWiZ7S7fVAJJ+nxUrz20Mq+ow==
X-Google-Smtp-Source: AGHT+IGWjrrd/q2tRneXtcRMt8NBfLhV2d5ANIraXyPaebHXVIiDXpIgG078pHnn5Vdb4NvCxNAJhQ==
X-Received: by 2002:a05:6214:3387:b0:880:5636:6241 with SMTP id 6a1803df08f44-88819594cd7mr72630486d6.65.1764822643712;
        Wed, 03 Dec 2025 20:30:43 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88827f3347asm3191476d6.6.2025.12.03.20.30.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:30:43 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/16] linux-yocto/6.12: update CVE exclusions (6.12.57)
Date: Wed,  3 Dec 2025 23:30:22 -0500
Message-Id: <4916c7f06055be6b0492ff4c8e604dc504705432.1764822465.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1764822465.git.bruce.ashfield@gmail.com>
References: <cover.1764822465.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 04:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227261

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 4 changes (1 new | 3 updated): - 1 new CVEs: CVE-2025-8558 - 3 updated CVEs: CVE-2014-5406, CVE-2023-7312, CVE-2025-50363
        Date: Mon, 3 Nov 2025 18:44:24 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.12.inc              | 194 ++++++++++++++++--
 1 file changed, 180 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index 1e596c11b7f..b35fb07d314 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-10-28 03:21:45.408892+00:00 for kernel version 6.12.55
-# From linux_kernel_cves cve_2025-10-28_0200Z-1-g573c9628fcf
+# Generated at 2025-11-03 18:50:12.770797+00:00 for kernel version 6.12.57
+# From linux_kernel_cves cve_2025-11-03_1800Z-3-g832f00439f0
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.55"
+    this_version = "6.12.57"
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
@@ -13644,7 +13644,7 @@ CVE_STATUS[CVE-2024-57993] = "cpe-stable-backport: Backported in 6.12.13"
 
 CVE_STATUS[CVE-2024-57994] = "cpe-stable-backport: Backported in 6.12.13"
 
-# CVE-2024-57995 needs backporting (fixed from 6.14)
+CVE_STATUS[CVE-2024-57995] = "cpe-stable-backport: Backported in 6.12.57"
 
 CVE_STATUS[CVE-2024-57996] = "cpe-stable-backport: Backported in 6.12.13"
 
@@ -14206,7 +14206,7 @@ CVE_STATUS[CVE-2025-21831] = "cpe-stable-backport: Backported in 6.12.14"
 
 CVE_STATUS[CVE-2025-21832] = "cpe-stable-backport: Backported in 6.12.14"
 
-# CVE-2025-21833 needs backporting (fixed from 6.14)
+CVE_STATUS[CVE-2025-21833] = "cpe-stable-backport: Backported in 6.12.57"
 
 CVE_STATUS[CVE-2025-21834] = "cpe-stable-backport: Backported in 6.12.14"
 
@@ -14746,7 +14746,7 @@ CVE_STATUS[CVE-2025-22103] = "cpe-stable-backport: Backported in 6.12.46"
 
 # CVE-2025-22104 needs backporting (fixed from 6.15)
 
-# CVE-2025-22105 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-22105] = "cpe-stable-backport: Backported in 6.12.57"
 
 CVE_STATUS[CVE-2025-22106] = "cpe-stable-backport: Backported in 6.12.49"
 
@@ -14796,7 +14796,7 @@ CVE_STATUS[CVE-2025-22128] = "cpe-stable-backport: Backported in 6.12.35"
 
 # CVE-2025-23129 needs backporting (fixed from 6.15)
 
-# CVE-2025-23130 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-23130] = "cpe-stable-backport: Backported in 6.12.57"
 
 # CVE-2025-23131 needs backporting (fixed from 6.15)
 
@@ -14986,7 +14986,7 @@ CVE_STATUS[CVE-2025-37801] = "cpe-stable-backport: Backported in 6.12.26"
 
 CVE_STATUS[CVE-2025-37802] = "cpe-stable-backport: Backported in 6.12.26"
 
-# CVE-2025-37803 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-37803] = "cpe-stable-backport: Backported in 6.12.57"
 
 CVE_STATUS[CVE-2025-37805] = "cpe-stable-backport: Backported in 6.12.26"
 
@@ -15094,7 +15094,7 @@ CVE_STATUS[CVE-2025-37858] = "cpe-stable-backport: Backported in 6.12.24"
 
 CVE_STATUS[CVE-2025-37859] = "cpe-stable-backport: Backported in 6.12.24"
 
-# CVE-2025-37860 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-37860] = "cpe-stable-backport: Backported in 6.12.57"
 
 CVE_STATUS[CVE-2025-37861] = "cpe-stable-backport: Backported in 6.12.24"
 
@@ -16640,7 +16640,7 @@ CVE_STATUS[CVE-2025-38641] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2025-38642] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2025-38643 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-38643] = "cpe-stable-backport: Backported in 6.12.57"
 
 CVE_STATUS[CVE-2025-38644] = "cpe-stable-backport: Backported in 6.12.42"
 
@@ -16840,7 +16840,7 @@ CVE_STATUS[CVE-2025-39676] = "cpe-stable-backport: Backported in 6.12.44"
 
 # CVE-2025-39677 needs backporting (fixed from 6.17)
 
-# CVE-2025-39678 needs backporting (fixed from 6.17)
+CVE_STATUS[CVE-2025-39678] = "cpe-stable-backport: Backported in 6.12.56"
 
 CVE_STATUS[CVE-2025-39679] = "cpe-stable-backport: Backported in 6.12.44"
 
@@ -17504,7 +17504,7 @@ CVE_STATUS[CVE-2025-40012] = "cpe-stable-backport: Backported in 6.12.50"
 
 CVE_STATUS[CVE-2025-40013] = "cpe-stable-backport: Backported in 6.12.51"
 
-# CVE-2025-40014 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-40014] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2025-40015] = "fixed-version: only affects 6.15 onwards"
 
@@ -17526,6 +17526,172 @@ CVE_STATUS[CVE-2025-40023] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2025-40024] = "cpe-stable-backport: Backported in 6.12.50"
 
+# CVE-2025-40025 needs backporting (fixed from 6.18rc1)
+
+CVE_STATUS[CVE-2025-40026] = "cpe-stable-backport: Backported in 6.12.52"
+
+CVE_STATUS[CVE-2025-40027] = "cpe-stable-backport: Backported in 6.12.52"
+
+CVE_STATUS[CVE-2025-40028] = "cpe-stable-backport: Backported in 6.12.52"
+
+CVE_STATUS[CVE-2025-40029] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40030] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40031] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40032] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40033] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40034] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-40035] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40036] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40037] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40038] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40039] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40040] = "cpe-stable-backport: Backported in 6.12.55"
+
+CVE_STATUS[CVE-2025-40041] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-40042] = "cpe-stable-backport: Backported in 6.12.54"
+
+CVE_STATUS[CVE-2025-40043] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40044] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40045] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40046] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-40047] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40048] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40049] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40050] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-40051] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40052] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40053] = "cpe-stable-backport: Backported in 6.12.53"
+
+# CVE-2025-40054 needs backporting (fixed from 6.18rc1)
+
+CVE_STATUS[CVE-2025-40055] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40056] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40057] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40058] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40059] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40060] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40061] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40062] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40063] = "fixed-version: only affects 6.16 onwards"
+
+# CVE-2025-40064 needs backporting (fixed from 6.18rc1)
+
+# CVE-2025-40065 needs backporting (fixed from 6.18rc1)
+
+CVE_STATUS[CVE-2025-40066] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-40067] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40068] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40069] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-40070] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40071] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40072] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-40073] = "fixed-version: only affects 6.16 onwards"
+
+# CVE-2025-40074 needs backporting (fixed from 6.18rc1)
+
+# CVE-2025-40075 needs backporting (fixed from 6.18rc1)
+
+CVE_STATUS[CVE-2025-40076] = "fixed-version: only affects 6.17 onwards"
+
+# CVE-2025-40077 needs backporting (fixed from 6.18rc1)
+
+CVE_STATUS[CVE-2025-40078] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40079] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40080] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40081] = "cpe-stable-backport: Backported in 6.12.53"
+
+CVE_STATUS[CVE-2025-40082] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-40083] = "cpe-stable-backport: Backported in 6.12.57"
+
+CVE_STATUS[CVE-2025-40084] = "cpe-stable-backport: Backported in 6.12.56"
+
+CVE_STATUS[CVE-2025-40085] = "cpe-stable-backport: Backported in 6.12.55"
+
+# CVE-2025-40086 needs backporting (fixed from 6.18rc2)
+
+CVE_STATUS[CVE-2025-40087] = "cpe-stable-backport: Backported in 6.12.55"
+
+CVE_STATUS[CVE-2025-40088] = "cpe-stable-backport: Backported in 6.12.55"
+
+CVE_STATUS[CVE-2025-40089] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-40090] = "cpe-stable-backport: Backported in 6.12.55"
+
+CVE_STATUS[CVE-2025-40091] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-40092] = "cpe-stable-backport: Backported in 6.12.55"
+
+CVE_STATUS[CVE-2025-40093] = "cpe-stable-backport: Backported in 6.12.55"
+
+CVE_STATUS[CVE-2025-40094] = "cpe-stable-backport: Backported in 6.12.55"
+
+CVE_STATUS[CVE-2025-40095] = "cpe-stable-backport: Backported in 6.12.55"
+
+CVE_STATUS[CVE-2025-40096] = "cpe-stable-backport: Backported in 6.12.55"
+
+# CVE-2025-40097 needs backporting (fixed from 6.18rc2)
+
+# CVE-2025-40098 needs backporting (fixed from 6.18rc2)
+
+CVE_STATUS[CVE-2025-40099] = "cpe-stable-backport: Backported in 6.12.55"
+
+CVE_STATUS[CVE-2025-40100] = "cpe-stable-backport: Backported in 6.12.55"
+
+CVE_STATUS[CVE-2025-40101] = "cpe-stable-backport: Backported in 6.12.55"
+
+# CVE-2025-40102 needs backporting (fixed from 6.18rc2)
+
+CVE_STATUS[CVE-2025-40103] = "cpe-stable-backport: Backported in 6.12.55"
+
+CVE_STATUS[CVE-2025-40104] = "cpe-stable-backport: Backported in 6.12.55"
+
+CVE_STATUS[CVE-2025-40105] = "cpe-stable-backport: Backported in 6.12.55"
+
+CVE_STATUS[CVE-2025-40106] = "cpe-stable-backport: Backported in 6.12.56"
+
+CVE_STATUS[CVE-2025-40107] = "cpe-stable-backport: Backported in 6.12.52"
+
 CVE_STATUS[CVE-2025-40114] = "cpe-stable-backport: Backported in 6.12.23"
 
 CVE_STATUS[CVE-2025-40300] = "cpe-stable-backport: Backported in 6.12.47"
-- 
2.39.2


