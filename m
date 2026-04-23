Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E376FFC0379
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 15:45:43 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.705.1776959137809220672
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 08:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=brEfQqsw;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-50e5ad864a6so43576281cf.0
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 08:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776959137; x=1777563937; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ewM10EDKJNObqgtlsBy5oYOEHrrSk+lXuj0hQ7wKbD4=;
        b=brEfQqswRbiQmiLoHP0wzmdwNNmYdmFSDsaPs/EoD00YiaWPA5GD/LJ5ijxkheq17M
         SdW9zHZr2AA8L5WC4J7Vdp7pqekCxOyNsKCYjpIiEQcnBEWMhaez6GLI4+qxcdDCQeXL
         KrJyxCLUssNJv8zKEU3zkpgWYMqcstWZOEctnC1u5piDDGsUc59xyK+KsCeYLoZ+wL2U
         xA0+mLQqsqzfTRTg1fxpw2IB2bnjE0T36JIG45OhBuNF5Fvcm8I1LCApzQB8q3CtN13Z
         uhA14VzRE5gA6Z6tviHeDMpfG9f1NcN44prfjytGacGZ89qpmXkFoK1Ls55K85OMqnVv
         BUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776959137; x=1777563937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ewM10EDKJNObqgtlsBy5oYOEHrrSk+lXuj0hQ7wKbD4=;
        b=LfbBNi4rzjhrIwZDvJqJ67tqA9Szlr4Shi1Yy5Y0EhiNVSvDyGrVUlg8hqC7icsb8e
         y9EkjUTxzIIr4WSI/CE3PGaZkeHB6d3+tKh7l1Etn/oXn1EVQNKw4ovWQFhPZGXIhtMo
         zErwbsPvWrRkeREvIvuBCF1prrYGj5q5K95m4s7Ox3JzaNyYz40rVgOsJGcW4PGsxgxA
         PuR4UpYxeHupLKZCV0CR0AjNjYEy1jauCfP+pxjZITvfNomKBkqwW9uuCJmGG7xNSCY5
         /G0bb032bCve055DkLjMD/S2ifphHwEGrxGmllzg0920CLHY3IgheCSC0aTIuAmxymtY
         7/gA==
X-Gm-Message-State: AOJu0YyxbKOzE7vG0AHoJZcL98yJgpm2uACHbS0Sm25Nf18uO9n0N+tv
	UnRkONR5AEj+6xkQXOq1ak/fFS7sv4/m7dNxRpBKL4oHbhMrtowu73//fNtCeSYc
X-Gm-Gg: AeBDievGFts0HzZFuaQL1QrQMYgUqxJKStsoHpo7gTHZzHutMQuTTIZzu+SSLKCd7j9
	CyOPdlbR8Fj06q3e1iyNWaiMFV6D3XOrsjqnZ+7GKhcTnINvssd08m5q4bdgue+BuxGPcYMnV0V
	FHgEiSNnYRxqoa1Rzz0r/4aTO3KiDXspp2T1xrVIn5Bb0v6C9oemivzLJa2ZbXlH0VkdI/6wOyD
	/OJTj4xefehym3Yk87k3S3qewCZ9T/ZU/nh/AYY9tco/ILmB2bfe1SgWlK8ghpHmIOlo7fAWoT6
	nDSfj/g8eyt41HfzXjTWqifWY3P9NYLQsYOMAm11MT4hP75PPwKeCJYOZ5Acb3Qjj4dFRPAbNJJ
	iiPS7CPAM/C1SApI14751KXyMs+ZYoO0jqzjCL9oNF8bZdc2SzcdrRchUgqmC5XeWC/XlNWnszB
	FkD/jLokLwrgjDgD0ZR+73Xl2+ceAJa7dkjs87QIMw7lXoZ9dmoJd8B/waCknZM/GE/iI6XP+PZ
	Xb0erxq/Z7ZXpSWaSS3JlUGT+UjtFyW8CVi82irqC6UKWnL+xS47hSzHLXFU/dDxZDwUA==
X-Received: by 2002:a05:622a:1ba6:b0:50b:1e5d:9930 with SMTP id d75a77b69052e-50e36eb86f4mr406110101cf.58.1776959135704;
        Thu, 23 Apr 2026 08:45:35 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50fb416b3f5sm74400031cf.28.2026.04.23.08.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 08:45:35 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: yoann.congal@smile.fr
Cc: openembedded-core@lists.openembedded.org
Subject: [openembedded-core][whinlatter][PATCH 16/18] linux-yocto/6.12: update CVE exclusions (6.12.81)
Date: Thu, 23 Apr 2026 11:45:07 -0400
Message-ID: <20260423154509.1933646-17-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
References: <20260423154509.1933646-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 15:45:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235815

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 4 changes (4 new | 0 updated): - 4 new CVEs: CVE-2026-24893, CVE-2026-25125, CVE-2026-25133, CVE-2026-27287 - 0 updated CVEs:
        Date: Tue, 14 Apr 2026 20:56:01 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.12.inc              | 98 ++++++++++++-------
 1 file changed, 64 insertions(+), 34 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index e4e81ee492..2ae4f461e5 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2026-04-08 14:59:27.074934+00:00 for kernel version 6.12.80
-# From linux_kernel_cves cve_2026-04-08_1400Z
+# Generated at 2026-04-14 21:08:51.681656+00:00 for kernel version 6.12.81
+# From linux_kernel_cves cve_2026-04-14_2000Z-1-g4a280a922d3
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.80"
+    this_version = "6.12.81"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -18450,7 +18450,7 @@ CVE_STATUS[CVE-2025-39814] = "fixed-version: only affects 6.16 onwards"
 
 CVE_STATUS[CVE-2025-39815] = "cpe-stable-backport: Backported in 6.12.45"
 
-CVE_STATUS[CVE-2025-39816] = "cpe-stable-backport: Backported in 6.12.49"
+CVE_STATUS[CVE-2025-39816] = "cpe-stable-backport: Backported in 6.12.81"
 
 CVE_STATUS[CVE-2025-39817] = "cpe-stable-backport: Backported in 6.12.45"
 
@@ -20424,7 +20424,7 @@ CVE_STATUS[CVE-2025-71267] = "cpe-stable-backport: Backported in 6.12.75"
 
 CVE_STATUS[CVE-2025-71268] = "cpe-stable-backport: Backported in 6.12.70"
 
-# CVE-2025-71269 needs backporting (fixed from 6.19)
+CVE_STATUS[CVE-2025-71269] = "cpe-stable-backport: Backported in 6.12.81"
 
 CVE_STATUS[CVE-2025-71270] = "cpe-stable-backport: Backported in 6.12.70"
 
@@ -20970,7 +20970,7 @@ CVE_STATUS[CVE-2026-23245] = "cpe-stable-backport: Backported in 6.12.78"
 
 CVE_STATUS[CVE-2026-23246] = "cpe-stable-backport: Backported in 6.12.77"
 
-# CVE-2026-23247 needs backporting (fixed from 7.0rc3)
+# CVE-2026-23247 needs backporting (fixed from 7.0)
 
 CVE_STATUS[CVE-2026-23248] = "fixed-version: only affects 6.14 onwards"
 
@@ -21006,7 +21006,7 @@ CVE_STATUS[CVE-2026-23263] = "fixed-version: only affects 6.17 onwards"
 
 CVE_STATUS[CVE-2026-23264] = "cpe-stable-backport: Backported in 6.12.70"
 
-# CVE-2026-23265 needs backporting (fixed from 7.0rc1)
+# CVE-2026-23265 needs backporting (fixed from 7.0)
 
 CVE_STATUS[CVE-2026-23266] = "cpe-stable-backport: Backported in 6.12.74"
 
@@ -21020,7 +21020,7 @@ CVE_STATUS[CVE-2026-23270] = "cpe-stable-backport: Backported in 6.12.77"
 
 CVE_STATUS[CVE-2026-23271] = "cpe-stable-backport: Backported in 6.12.77"
 
-# CVE-2026-23272 needs backporting (fixed from 7.0rc3)
+# CVE-2026-23272 needs backporting (fixed from 7.0)
 
 CVE_STATUS[CVE-2026-23273] = "cpe-stable-backport: Backported in 6.12.75"
 
@@ -21052,7 +21052,7 @@ CVE_STATUS[CVE-2026-23286] = "cpe-stable-backport: Backported in 6.12.77"
 
 CVE_STATUS[CVE-2026-23287] = "cpe-stable-backport: Backported in 6.12.77"
 
-CVE_STATUS[CVE-2026-23288] = "fixed-version: only affects 6.19 onwards"
+CVE_STATUS[CVE-2026-23288] = "fixed-version: only affects 6.19.4 onwards"
 
 CVE_STATUS[CVE-2026-23289] = "cpe-stable-backport: Backported in 6.12.77"
 
@@ -21080,7 +21080,7 @@ CVE_STATUS[CVE-2026-23300] = "cpe-stable-backport: Backported in 6.12.77"
 
 CVE_STATUS[CVE-2026-23301] = "fixed-version: only affects 6.19 onwards"
 
-# CVE-2026-23302 needs backporting (fixed from 7.0rc3)
+# CVE-2026-23302 needs backporting (fixed from 7.0)
 
 CVE_STATUS[CVE-2026-23303] = "cpe-stable-backport: Backported in 6.12.77"
 
@@ -21128,20 +21128,18 @@ CVE_STATUS[CVE-2026-23325] = "cpe-stable-backport: Backported in 6.12.77"
 
 CVE_STATUS[CVE-2026-23326] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2026-23327 needs backporting (fixed from 7.0rc2)
+# CVE-2026-23327 needs backporting (fixed from 7.0)
 
 CVE_STATUS[CVE-2026-23328] = "fixed-version: only affects 6.14 onwards"
 
 CVE_STATUS[CVE-2026-23329] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-23330 needs backporting (fixed from 7.0rc3)
+# CVE-2026-23330 needs backporting (fixed from 7.0)
 
 CVE_STATUS[CVE-2026-23331] = "fixed-version: only affects 6.13 onwards"
 
 CVE_STATUS[CVE-2026-23332] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-23333 needs backporting (fixed from 7.0rc1)
-
 CVE_STATUS[CVE-2026-23334] = "cpe-stable-backport: Backported in 6.12.77"
 
 CVE_STATUS[CVE-2026-23335] = "cpe-stable-backport: Backported in 6.12.77"
@@ -21156,7 +21154,7 @@ CVE_STATUS[CVE-2026-23339] = "cpe-stable-backport: Backported in 6.12.77"
 
 CVE_STATUS[CVE-2026-23340] = "cpe-stable-backport: Backported in 6.12.77"
 
-CVE_STATUS[CVE-2026-23341] = "fixed-version: only affects 6.19 onwards"
+CVE_STATUS[CVE-2026-23341] = "fixed-version: only affects 6.19.4 onwards"
 
 CVE_STATUS[CVE-2026-23342] = "fixed-version: only affects 6.18 onwards"
 
@@ -21166,11 +21164,11 @@ CVE_STATUS[CVE-2026-23344] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-23345] = "fixed-version: only affects 6.13 onwards"
 
-# CVE-2026-23346 needs backporting (fixed from 7.0rc2)
+# CVE-2026-23346 needs backporting (fixed from 7.0)
 
 CVE_STATUS[CVE-2026-23347] = "cpe-stable-backport: Backported in 6.12.77"
 
-# CVE-2026-23348 needs backporting (fixed from 7.0rc2)
+# CVE-2026-23348 needs backporting (fixed from 7.0)
 
 CVE_STATUS[CVE-2026-23349] = "fixed-version: only affects 6.18 onwards"
 
@@ -21184,7 +21182,7 @@ CVE_STATUS[CVE-2026-23353] = "fixed-version: only affects 6.19 onwards"
 
 CVE_STATUS[CVE-2026-23354] = "cpe-stable-backport: Backported in 6.12.77"
 
-CVE_STATUS[CVE-2026-23355] = "fixed-version: only affects 6.18 onwards"
+CVE_STATUS[CVE-2026-23355] = "fixed-version: only affects 6.18.14 onwards"
 
 CVE_STATUS[CVE-2026-23356] = "cpe-stable-backport: Backported in 6.12.77"
 
@@ -21216,19 +21214,19 @@ CVE_STATUS[CVE-2026-23369] = "cpe-stable-backport: Backported in 6.12.77"
 
 CVE_STATUS[CVE-2026-23370] = "cpe-stable-backport: Backported in 6.12.77"
 
-# CVE-2026-23371 needs backporting (fixed from 7.0rc3)
+# CVE-2026-23371 needs backporting (fixed from 7.0)
 
 CVE_STATUS[CVE-2026-23372] = "cpe-stable-backport: Backported in 6.12.77"
 
 CVE_STATUS[CVE-2026-23373] = "cpe-stable-backport: Backported in 6.12.77"
 
-# CVE-2026-23374 needs backporting (fixed from 7.0rc3)
+# CVE-2026-23374 needs backporting (fixed from 7.0)
 
 CVE_STATUS[CVE-2026-23375] = "cpe-stable-backport: Backported in 6.12.78"
 
 CVE_STATUS[CVE-2026-23376] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-23377 needs backporting (fixed from 7.0rc3)
+# CVE-2026-23377 needs backporting (fixed from 7.0)
 
 CVE_STATUS[CVE-2026-23378] = "cpe-stable-backport: Backported in 6.12.77"
 
@@ -21244,7 +21242,7 @@ CVE_STATUS[CVE-2026-23383] = "cpe-stable-backport: Backported in 6.12.77"
 
 CVE_STATUS[CVE-2026-23384] = "fixed-version: only affects 6.18 onwards"
 
-# CVE-2026-23385 needs backporting (fixed from 7.0rc3)
+# CVE-2026-23385 needs backporting (fixed from 7.0)
 
 CVE_STATUS[CVE-2026-23386] = "cpe-stable-backport: Backported in 6.12.78"
 
@@ -21252,7 +21250,7 @@ CVE_STATUS[CVE-2026-23387] = "cpe-stable-backport: Backported in 6.12.77"
 
 CVE_STATUS[CVE-2026-23388] = "cpe-stable-backport: Backported in 6.12.77"
 
-# CVE-2026-23389 needs backporting (fixed from 7.0rc3)
+CVE_STATUS[CVE-2026-23389] = "cpe-stable-backport: Backported in 6.12.81"
 
 CVE_STATUS[CVE-2026-23390] = "cpe-stable-backport: Backported in 6.12.74"
 
@@ -21262,7 +21260,7 @@ CVE_STATUS[CVE-2026-23392] = "cpe-stable-backport: Backported in 6.12.78"
 
 CVE_STATUS[CVE-2026-23393] = "cpe-stable-backport: Backported in 6.12.78"
 
-# CVE-2026-23394 needs backporting (fixed from 7.0rc5)
+# CVE-2026-23394 needs backporting (fixed from 7.0)
 
 CVE_STATUS[CVE-2026-23395] = "cpe-stable-backport: Backported in 6.12.78"
 
@@ -21358,11 +21356,11 @@ CVE_STATUS[CVE-2026-23440] = "cpe-stable-backport: Backported in 6.12.78"
 
 CVE_STATUS[CVE-2026-23441] = "cpe-stable-backport: Backported in 6.12.78"
 
-# CVE-2026-23442 needs backporting (fixed from 7.0rc5)
+# CVE-2026-23442 needs backporting (fixed from 7.0)
 
 CVE_STATUS[CVE-2026-23443] = "cpe-stable-backport: Backported in 6.12.78"
 
-# CVE-2026-23444 needs backporting (fixed from 7.0rc5)
+# CVE-2026-23444 needs backporting (fixed from 7.0)
 
 CVE_STATUS[CVE-2026-23445] = "cpe-stable-backport: Backported in 6.12.78"
 
@@ -21376,7 +21374,7 @@ CVE_STATUS[CVE-2026-23449] = "cpe-stable-backport: Backported in 6.12.78"
 
 CVE_STATUS[CVE-2026-23450] = "cpe-stable-backport: Backported in 6.12.78"
 
-CVE_STATUS[CVE-2026-23451] = "fixed-version: only affects 6.18 onwards"
+CVE_STATUS[CVE-2026-23451] = "fixed-version: only affects 6.18.19 onwards"
 
 CVE_STATUS[CVE-2026-23452] = "cpe-stable-backport: Backported in 6.12.78"
 
@@ -21410,17 +21408,15 @@ CVE_STATUS[CVE-2026-23466] = "cpe-stable-backport: Backported in 6.12.78"
 
 CVE_STATUS[CVE-2026-23467] = "fixed-version: only affects 6.16 onwards"
 
-# CVE-2026-23468 needs backporting (fixed from 7.0rc5)
+# CVE-2026-23468 needs backporting (fixed from 7.0)
 
-# CVE-2026-23469 needs backporting (fixed from 7.0rc5)
+# CVE-2026-23469 needs backporting (fixed from 7.0)
 
 CVE_STATUS[CVE-2026-23470] = "cpe-stable-backport: Backported in 6.12.78"
 
-CVE_STATUS[CVE-2026-23471] = "cpe-stable-backport: Backported in 6.12.78"
-
-# CVE-2026-23472 needs backporting (fixed from 7.0rc5)
+# CVE-2026-23472 needs backporting (fixed from 7.0)
 
-# CVE-2026-23473 needs backporting (fixed from 7.0rc5)
+# CVE-2026-23473 needs backporting (fixed from 7.0)
 
 CVE_STATUS[CVE-2026-23474] = "cpe-stable-backport: Backported in 6.12.78"
 
@@ -21462,7 +21458,7 @@ CVE_STATUS[CVE-2026-31405] = "cpe-stable-backport: Backported in 6.12.78"
 
 CVE_STATUS[CVE-2026-31406] = "cpe-stable-backport: Backported in 6.12.80"
 
-# CVE-2026-31407 needs backporting (fixed from 7.0rc5)
+# CVE-2026-31407 needs backporting (fixed from 7.0)
 
 CVE_STATUS[CVE-2026-31408] = "cpe-stable-backport: Backported in 6.12.80"
 
@@ -21472,5 +21468,39 @@ CVE_STATUS[CVE-2026-31410] = "cpe-stable-backport: Backported in 6.12.78"
 
 CVE_STATUS[CVE-2026-31411] = "cpe-stable-backport: Backported in 6.12.75"
 
+CVE_STATUS[CVE-2026-31412] = "cpe-stable-backport: Backported in 6.12.78"
+
+CVE_STATUS[CVE-2026-31413] = "cpe-stable-backport: Backported in 6.12.80"
+
+CVE_STATUS[CVE-2026-31414] = "cpe-stable-backport: Backported in 6.12.81"
+
+CVE_STATUS[CVE-2026-31415] = "cpe-stable-backport: Backported in 6.12.81"
+
+CVE_STATUS[CVE-2026-31416] = "cpe-stable-backport: Backported in 6.12.81"
+
+CVE_STATUS[CVE-2026-31417] = "cpe-stable-backport: Backported in 6.12.81"
+
+CVE_STATUS[CVE-2026-31418] = "cpe-stable-backport: Backported in 6.12.81"
+
+# CVE-2026-31419 needs backporting (fixed from 7.0)
+
+# CVE-2026-31420 needs backporting (fixed from 7.0)
+
+CVE_STATUS[CVE-2026-31421] = "cpe-stable-backport: Backported in 6.12.81"
+
+CVE_STATUS[CVE-2026-31422] = "cpe-stable-backport: Backported in 6.12.81"
+
+CVE_STATUS[CVE-2026-31423] = "cpe-stable-backport: Backported in 6.12.81"
+
+CVE_STATUS[CVE-2026-31424] = "cpe-stable-backport: Backported in 6.12.81"
+
+CVE_STATUS[CVE-2026-31425] = "cpe-stable-backport: Backported in 6.12.81"
+
+CVE_STATUS[CVE-2026-31426] = "cpe-stable-backport: Backported in 6.12.80"
+
+CVE_STATUS[CVE-2026-31427] = "cpe-stable-backport: Backported in 6.12.80"
+
+CVE_STATUS[CVE-2026-31428] = "cpe-stable-backport: Backported in 6.12.80"
+
 CVE_STATUS[CVE-2026-31788] = "cpe-stable-backport: Backported in 6.12.78"
 
-- 
2.43.0


