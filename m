Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23BBDCAC5B9
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 18:59:44 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.6457.1759172376714327436
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 11:59:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EFrsY9qX;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-85b94fe19e2so493900885a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 11:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759172376; x=1759777176; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqooK4VdquudD0yVtR0g/2Om3WYE6PrsZwP+SIFXUcg=;
        b=EFrsY9qXNMOWxfdZ5fJTft/2Z4TQPOGsJBPrb0XEIfolkxSLsz+nLVFkRWM79ZpPio
         Z5A6lWCpEm5iUY8J4I3UJY7r8/5Ul94KyXBw4iquRYcPpHBZVYEiQo+PAehi7zFHH5AM
         nTwTu2kvscrpD1rPCRJp7k4305CJGs2MgX1KYfcXp4fr39DZ5v5GL4CtrI5XrgBWgMOX
         /tb2EqlogEWP/QKBp7NFrkehr08qYdYsEJL8IUDVOKezHLQie/kqJjic627OKU5uQe/6
         pyMWNgTtsQE64U4WeAd4/bORZ2y8+8xXi5eIT/6v0rrN4pUmqvzjIGfWNMC4m13Wlz0s
         67dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759172376; x=1759777176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HqooK4VdquudD0yVtR0g/2Om3WYE6PrsZwP+SIFXUcg=;
        b=tRzWawd4fdvYA6J3e1Kba022OqtetfLAlTTLBgPWUnzc9jH+My5XaMY9yOq/MhC0Dw
         OrdpSVya1LELvGHhz1Ww2VsKxqcK4xiKVYrlUS+iKtGPW1B1PWEYW5/00LgwryhzH0+r
         U1XTwTJuvFfthv0Q4uFyZorPFsiFZdS1jFtdj1uIwGpOjC+VyIvUlrArhe2qHufrvQgF
         Zyl/pLyJ+6gAAPv9tAtsCel6p2GDmRCKQ/oBt1pHdsDoUEl3DzqNjYyeEJZ8JZKqzWSs
         jbE5pisjlHCVH36aYd42WfNSqVpjmvpOmYCzYTVgYRjISPvZMW73NurB/wKAAiCaBcgH
         yWNQ==
X-Gm-Message-State: AOJu0YzKkjHLZfXiP9EcoWyEhCyOl09YIbZlvkukBgyrmIx7VmSwfwQl
	585oOrERakuNY4NKElH2ksmFHk5K4Ach74qpUKRhYuSdbLljmXjTzcPRVC04W5aWWaU=
X-Gm-Gg: ASbGncv4aZPka6MgFcXESMpsjr0hLGb0ttAtSJK+Sh0waRfslEsu0sknr4Y4U64/78+
	ROamnCW7FxpntQc7kYmC5LXkj13gdAMRxAiLB7rqMPruJW8kjlFIqXD2oWeHYuxBeR6sgDTB9+1
	IedCkHNHeJBJjwXSn2ev2bGGStixczIXygWxLZWb22KSh9mF65ulblTn+98sBCKHDaEj942nYnw
	KGJxshetreuMCWCc2IAzRWplO+N18XQCpcJO1AjmywgU+Qz022fLa43pire3BdZUrfsZq0rHUHD
	wWwJskWBLmOEdW4+2tUW6Ice+SeGhjGvbwyhh8qC9MTTazgziLuuQ1nTB4MwtQcxFJwU39DY+ao
	FfSoClmS5qJFfqYQ/cQ1tXN6kA9BDpycK3Kmyw+ek54rl/VBe/BA1d7sTmufQd9FDpFWtmWt9FJ
	L+Lbgm4n89cDTCxSmsn5p/OqQ9x0ynRmYOJ2z9HRW4Y+H+K5F6giQQ5CFsEx4iI1De+A==
X-Google-Smtp-Source: AGHT+IFXR9T+jpQe8OmQV40POm89SV8HqJxLztvPCHrrlx1i2Byk/XVsuhM2U3BrhKjq8m8q9ccucw==
X-Received: by 2002:a05:620a:4081:b0:85f:89:e109 with SMTP id af79cd13be357-85f0089e549mr1970062585a.38.1759172375530;
        Mon, 29 Sep 2025 11:59:35 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85c337a1e1csm873240285a.62.2025.09.29.11.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 11:59:35 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/4] linux-yocto/6.12: update CVE exclusions (6.12.49)
Date: Mon, 29 Sep 2025 14:59:30 -0400
Message-Id: <20250929185930.1689034-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250929185930.1689034-1-bruce.ashfield@gmail.com>
References: <20250929185930.1689034-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 18:59:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224169

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
 .../linux/cve-exclusion_6.12.inc              | 64 ++++++++++++++++---
 1 file changed, 56 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index 74d9e2867d..6c327e489a 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-09-22 03:24:27.411969+00:00 for kernel version 6.12.48
-# From linux_kernel_cves cve_2025-09-22_0200Z-2-gd662e5ed470
+# Generated at 2025-09-29 01:53:40.204255+00:00 for kernel version 6.12.49
+# From linux_kernel_cves cve_2025-09-29_0100Z
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.48"
+    this_version = "6.12.49"
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
 CVE_STATUS[CVE-2025-21629] = "cpe-stable-backport: Backported in 6.12.9"
 
 CVE_STATUS[CVE-2025-21631] = "cpe-stable-backport: Backported in 6.12.10"
@@ -13878,7 +13878,7 @@ CVE_STATUS[CVE-2025-22103] = "cpe-stable-backport: Backported in 6.12.46"
 
 # CVE-2025-22105 needs backporting (fixed from 6.15)
 
-# CVE-2025-22106 needs backporting (fixed from 6.15)
+CVE_STATUS[CVE-2025-22106] = "cpe-stable-backport: Backported in 6.12.49"
 
 # CVE-2025-22107 needs backporting (fixed from 6.15)
 
@@ -15134,7 +15134,7 @@ CVE_STATUS[CVE-2025-38320] = "cpe-stable-backport: Backported in 6.12.35"
 
 CVE_STATUS[CVE-2025-38321] = "cpe-stable-backport: Backported in 6.12.35"
 
-# CVE-2025-38322 needs backporting (fixed from 6.16)
+CVE_STATUS[CVE-2025-38322] = "cpe-stable-backport: Backported in 6.12.49"
 
 CVE_STATUS[CVE-2025-38323] = "cpe-stable-backport: Backported in 6.12.35"
 
@@ -16246,7 +16246,7 @@ CVE_STATUS[CVE-2025-39814] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2025-39815] = "cpe-stable-backport: Backported in 6.12.45"
 
-# CVE-2025-39816 needs backporting (fixed from 6.17rc4)
+CVE_STATUS[CVE-2025-39816] = "cpe-stable-backport: Backported in 6.12.49"
 
 CVE_STATUS[CVE-2025-39817] = "cpe-stable-backport: Backported in 6.12.45"
 
@@ -16348,6 +16348,54 @@ CVE_STATUS[CVE-2025-39865] = "cpe-stable-backport: Backported in 6.12.46"
 
 CVE_STATUS[CVE-2025-39866] = "cpe-stable-backport: Backported in 6.12.46"
 
+CVE_STATUS[CVE-2025-39867] = "fixed-version: only affects 6.17rc1 onwards"
+
+CVE_STATUS[CVE-2025-39868] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-39869] = "cpe-stable-backport: Backported in 6.12.48"
+
+CVE_STATUS[CVE-2025-39870] = "cpe-stable-backport: Backported in 6.12.48"
+
+CVE_STATUS[CVE-2025-39871] = "cpe-stable-backport: Backported in 6.12.48"
+
+CVE_STATUS[CVE-2025-39872] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-39873] = "cpe-stable-backport: Backported in 6.12.48"
+
+CVE_STATUS[CVE-2025-39874] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-39875] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-39876] = "cpe-stable-backport: Backported in 6.12.48"
+
+CVE_STATUS[CVE-2025-39877] = "cpe-stable-backport: Backported in 6.12.48"
+
+CVE_STATUS[CVE-2025-39878] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-39879] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-39880] = "cpe-stable-backport: Backported in 6.12.48"
+
+CVE_STATUS[CVE-2025-39881] = "cpe-stable-backport: Backported in 6.12.48"
+
+CVE_STATUS[CVE-2025-39882] = "cpe-stable-backport: Backported in 6.12.48"
+
+CVE_STATUS[CVE-2025-39883] = "cpe-stable-backport: Backported in 6.12.48"
+
+CVE_STATUS[CVE-2025-39884] = "cpe-stable-backport: Backported in 6.12.48"
+
+CVE_STATUS[CVE-2025-39885] = "cpe-stable-backport: Backported in 6.12.48"
+
+CVE_STATUS[CVE-2025-39886] = "cpe-stable-backport: Backported in 6.12.48"
+
+CVE_STATUS[CVE-2025-39887] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-39888] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-39889] = "cpe-stable-backport: Backported in 6.12.25"
+
+CVE_STATUS[CVE-2025-39890] = "cpe-stable-backport: Backported in 6.12.34"
+
 CVE_STATUS[CVE-2025-39930] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2025-39989] = "cpe-stable-backport: Backported in 6.12.23"
-- 
2.39.2


