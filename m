Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A59CD4F21
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 10:10:17 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72253.1778580612849531901
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2026 03:10:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fDFYMBPt;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d77f6092eso3292930f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 03:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778580611; x=1779185411; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o7ea0Pglpu3eXWpqBNceM/0inDM5fqGc8n7+7iWX3Oo=;
        b=fDFYMBPtrQ8nPpsAOjoRraYSODOe++UZ7+PiJClKKmfjsMZ5iCpGxj2wjXyKyHBZO3
         0TBL7wyJvyRc8vLlT1WBi74iceoVgBlWoby0j/sdE/14Jc7rVpvkYNl0Knz7ssVnTmHg
         r6QB12HTXJdl7gB+e04upMjdReGI1p5j01T3JIz2tNmZNlDMRTzBqk2CiVD9EDd8AD00
         ajAw9kUjT+lz7D7eX749fPDCjQny+7mnDibX8Z+3mcwdvyCXGDmoHIxH35LzWWcRvecl
         t+sgFUk5J+X90QdvI4MUYlKccfwJ9ta5Yu/ZWgfI5ZR5+J5Rb/YKi2DqVvC6tRco1fic
         Ev0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778580611; x=1779185411;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o7ea0Pglpu3eXWpqBNceM/0inDM5fqGc8n7+7iWX3Oo=;
        b=nzYQ94ctcNbsAqXVOdF/pqU9Ktm+mHypBrwqJtXe1XbhSVkKUo6BXmJw3hPMyZRkha
         J0lsX3IjEodx+rKTHFR4X/Gz2xyqHmcYN+TKQea7eU4BkBDPsaeG9KFC1RtLJevZZDGm
         JeWWZFrnXvY9K6F7CFGFUP11jI71iHOC75YtsS3QONgrWTOANmB0fTSWrxpXB5TBclcr
         eMv2On65ITQg4zdTyUxPk1zfdQX45M2LREKjubHFnsB08BLuXZQ+zaFByRw1J7Sll/EQ
         7VHPSGHIccHN602yVl1biFPMQ91pONNn3bUAHd1DEoDZKHhMwXs75kO+AqxoD82d4v+R
         K4Eg==
X-Gm-Message-State: AOJu0Yx/rHIh65leifM15ECevl8lw0PqHUkqi9Ej5i3I7hxIELTHA7OS
	KNc0HejpqdPealTIpHRGXtobW+jvnEk3X1aLfRBj1DarWrptSnrI7QgN/f3D9g==
X-Gm-Gg: Acq92OHWTU6lndlfRjS8giS8JKtAlWZVDK4G2yFTOOcH1GAMp7a28DSgWUfof6Z9Wb/
	lqetj3RrEG6P2nQZVyZkNRW2478p1WK3zrVBB0w2EUznG6V+tQAnsJdawWE3R9upmi6pjWnAlll
	rj51+3Yjcnnoelmbga+8H82QNT2DHd22p01eVBBddSJdV2reyspg2AvGxBygVZvdFUsjgcbQYd3
	xxEgLCSk6ybMc39LMyuLZ/uc+2mHpDyYLodczHo2KlKdSR6EUWHnMTesa5EtJF9b9Vm/15gkwsl
	KTrU5bT1pEsiMRdrge/V+GYbA3qj0kC1NWe8C0FwEdggHJpQlfmpNd9Jf6BX/Tp7udBbZ7dYQnn
	jO2Q95oOfZDhDhAanO+Np8z5jtyzFDklU5Bz4BFWsS56PUlVzrJQJ33W0l3Tj7eDkpAc5VTAjJU
	n8Dmrv+aO9VPQrVT/wgRXRR/dCygJokG9fSSI8Cerer1RhM/eAEGHuADnyuZo=
X-Received: by 2002:a05:600c:621a:b0:48d:35e:849d with SMTP id 5b1f17b1804b1-48e8fe4dca6mr34906115e9.6.1778580611116;
        Tue, 12 May 2026 03:10:11 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f429fdfsm14111875e9.15.2026.05.12.03.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 03:10:10 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] sbom-cve-check: set PV from upstream tags and ensure version checks are correct
Date: Tue, 12 May 2026 12:10:02 +0200
Message-ID: <20260512101002.2282038-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 May 2026 10:10:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236875

From: Alexander Kanavin <alex@linutronix.de>

These recipes didn't set PV, which by default is 1.0. This isn't correct:
upstream does provide date-based tags that can be used to perform version upgrades.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ve.bb => sbom-cve-check-update-cvelist-native_2026-05-07.bb} | 2 +-
 ...bb => sbom-cve-check-update-nvd-native_2026.05.07-000006.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-cvelist-native.bb => sbom-cve-check-update-cvelist-native_2026-05-07.bb} (88%)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-nvd-native.bb => sbom-cve-check-update-nvd-native_2026.05.07-000006.bb} (90%)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-05-07.bb
similarity index 88%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-05-07.bb
index 3763e7f21f..7670172c40 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-05-07.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/CVEProject/cvelistV5"
 SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "cvelist"
 
-# cve_2026-05-07_1300Z
 SRCREV = "dd0e93c75034d0167498174c886a56729edc44de"
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>.+)_baseline"
 
 require sbom-cve-check-update-db.inc
diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.05.07-000006.bb
similarity index 90%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.05.07-000006.bb
index 26a14e6eb1..02446e30ce 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.05.07-000006.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/fkie-cad/nvd-json-data-feeds"
 SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "nvd-fkie"
 
-# v2026.05.07-000006
 SRCREV = "72d8841c8ad9083ebf6723063f275444ea0d76f9"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.+)"
 
 require sbom-cve-check-update-db.inc
-- 
2.47.3


