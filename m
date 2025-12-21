Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 929A2E67497
	for <webhook@archiver.kernel.org>; Sun, 21 Dec 2025 21:37:26 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68630.1766353043244464626
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Dec 2025 13:37:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=A2jWI717;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7b6dd81e2d4so3565339b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 13:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766353042; x=1766957842; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lLxA94/yE30ET5Zx9X5ksRo0sewAVGSW2BZ2fGSwuAc=;
        b=A2jWI7170e7SJpSGAzGmIxIUDCG43zQeohUqfPvsxDksvdQcyMyM4Ze4owkp6opdiD
         /mCWb2iGpWMPlMk8nrIpHQVV7kTeCJFkpPG11F8PPWDcm+uk0ix9fN7HSpzuLArBLnB9
         zQdwEh8BLeKRLZ81liWbxbd7gXUHB8AZ5zkrSVSEyoNURhp/S6ot7fGhy1fvEGdJKtyi
         tjoBvNRrazpP+rLaPeOR1RBwx0mXw4F66ldQccATLb1NwlQDFMLkV2pE1qCtNrYDtrhA
         hrr6q3cNrypJa8f14iN/IYpAKaAnU0C1WpI+TkgbEeCZJ6jf2934KPOSqyibtmspalvf
         pLow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766353042; x=1766957842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lLxA94/yE30ET5Zx9X5ksRo0sewAVGSW2BZ2fGSwuAc=;
        b=GO46YuFgxBiFAr/FneG2IFvFhtpLKs3ZdJsIXMktmlt/wnAYaJvnsj7LAJRRn0gbag
         eA8chqDaIzY5qxX6WtaxDVDh8W9Otm+5RFIFHP32vergu7OyOlDeKsSSTBvgws1eAGM0
         XbUl0wRlTJz56IQP/SicHiOYKRFHD+FHk29C1slv/l6SjH/XD9wMAjmvlcYjs8wPbbtk
         wiV5Sd77z/XxEYMbyNUW8O+3ojiTO4nbD8xZr4n3EFJ9zdeYGMgw8nbr7UegnVxhXyv3
         QfXp1W2mgi5vjq30nom3GsSFwO2r8RqAaWHZDkW42a0/eBCWZDtG2EOecZo8p8VaIKZQ
         ayyg==
X-Gm-Message-State: AOJu0YxWFwoFNOEoOBn8qafSQIZer8iuk86eBWLTUHctCgW5LT1xTGTZ
	ConiILBUa5C3Z9VotjOfoSnwe8igpMJ5qiBjg5TjgwAZpAGb5d6xdkmXMLClZF0W/Jlcsdng/1C
	HP7GCQ5o=
X-Gm-Gg: AY/fxX7oTr82wJzIlA5/1VBkVa7PbtiAkDvEVzE0MeisLzrQbS5okbavWEymxm0OiNA
	L47QGP2EoeMjPPgBJd4lSzYsBYf7Je7d9ATLfyxbx2nGoGcdiU47xev7V9Orw2US2M+h2mIMc8L
	V7BrTmsLvvoij1lt1WVBsTnwvaFPqkflf6r/Mpvb+OT7UimDs70+JNsb7jJicjM7V++5cEd2lwU
	wz/E5B3AdrGiR3VhU16Hy15SL6LzBExYP1ICX4GC98OolIS00vpVJh4lnUe9/haz0MXYX1WB7G5
	2qxmQuvdy2VyRlbBFDf6buC7oKaE1Qeitx3xVA0FQQnpEjZ6IEzU84Rk/icVxY5Eaovk8BG57dK
	jKPwzb9Swor+cCXc+Ze1sJ+OrRr43CRjX540gsww0hB7MNqzb9u2Sx4e58b7CTFfyuWNDhIu5g9
	Uq
X-Google-Smtp-Source: AGHT+IE/BRwDJKqo0MVQpQf2ITXaeXVn1w+c5UE6l28K/90BDgIjYTD/zJoIIg4GRTvwizYXi5tKiA==
X-Received: by 2002:a05:6a00:e11:b0:7f7:a2f:aef4 with SMTP id d2e1a72fcca58-7ff64ece91fmr7396456b3a.29.1766353042350;
        Sun, 21 Dec 2025 13:37:22 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:dd61:72c7:d0b8:fed])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfabcbcsm8211166b3a.31.2025.12.21.13.37.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 13:37:21 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 03/18] linux-yocto/6.12: update CVE exclusions (6.12.57)
Date: Sun, 21 Dec 2025 13:36:56 -0800
Message-ID: <025b13fe72a06805573875ff928715c9b6fc5324.1766352840.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766352840.git.steve@sakoman.com>
References: <cover.1766352840.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 21:37:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228261

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 4 changes (1 new | 3 updated): - 1 new CVEs: CVE-2025-8558 - 3 updated CVEs: CVE-2014-5406, CVE-2023-7312, CVE-2025-50363
        Date: Mon, 3 Nov 2025 18:44:24 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 4c7a27b24747dbdbd6d1dde99486ecc7e79fb34f)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../linux/cve-exclusion_6.12.inc              | 194 ++++++++++++++++--
 1 file changed, 180 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index 1e596c11b7..b35fb07d31 100644
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
2.43.0


