Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0025FC47BFD
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 15:24:00 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92277.1767713039432983858
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 07:23:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Xvx1U1mA;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8888a16d243so9870106d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 07:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767713038; x=1768317838; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qWd1Wxbtom1/i4nSMIiaYPV+LG9Nbmrsm6e+JrMIoOE=;
        b=Xvx1U1mAC+bq2YimJFq75igpPaLFaE/b4clvvisT0bbRwbGi7opMHsV18L4ySAK9js
         UudkQI+g2G/vmsrJ5YIuHTRHSvId8e8NEVUYWXxDS59BdCeowxIGQjXHZ/8A2nstz5yP
         mLYvvlBsTRJ+zHvLNWpvcWyFwePDVPy9SPQrGF2QFaOp548/z256b6zGVDpK3rG86pk8
         Qohb93+TcEef5V1ac/hAPHa6RR6z0M6SVBY2ZF53gW0BkUlYyYaKIURVRtCpnrVkLdaq
         aYghEy3XLQbGI3b/xDw0ZmLMnIhvBsE+O/nG0otlUbwrCh40hCYTib3qQpuKgmxmDCVq
         t/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767713038; x=1768317838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qWd1Wxbtom1/i4nSMIiaYPV+LG9Nbmrsm6e+JrMIoOE=;
        b=H3pGKqQ6PZpWmbxz43L0iIJvV5zS7opv3ZOFBOsxO7hFl0Vu+aTlLgdzqiH9cJLzxq
         5CSaPpZT/TsQoqqlj9copw6A1890XvD+5Qfv/SBsY70womoiJaXiBPN6DQCu86RZU1nM
         eHXQy3LeR+K5IGuVUwgDnJEVkBK2cC++t29a0yN7X/Iu2nW0QUpW06nCMpI2pLDj0TD7
         75HlwqcbmUpJ53A13kNYd4W6yPICX48kifvQeCNG0K/FSOgCXTD9NKx6xMdQxIkelW6H
         3e54OktUaTEpOBQ+lfhZkcbx1jNaxi2vCgkPlutRRkN8eRpdWaZBZix7eY9zPwuKgP4z
         wcMQ==
X-Gm-Message-State: AOJu0YykS6LfZcANFPUwvWehvV4+RxcSc9ywj2gMPpJJWAGkaL7Ge0dv
	BD0qUFjQaSzYwuOv7m8gSnSD4jfS6NfMyH0Yx+6X15ndU2cRDw96jij2crwMU+W/GNQ=
X-Gm-Gg: AY/fxX6Ze2NcDdFnFej9PNPg+YgakrEQMgZI4zA6PQx9jF4ljwxVHuRhvApL2JTekZa
	Zv7yBosO0+8YFucNnyK/bklKfGDCBHMzg5KkPbuwXWicBjXa+EK7ku22Zxz5gNrxJMyOyPf7g0B
	n3bRxyYEN+IymkT+TJPYAFxx/192SLaUG0taZ6Ldwv3eNdk/MDqjqGIhwkdnaZtoCyhRNoN6nIi
	L+QOUnus0S7cr2mJa2cNcuZKl6gosvIfbVDvRi00pqyBEIPRWZlH2xgk3h9gKFFV6pEfe1Nmf+K
	5SS9uug0kfXduOjPOVRo3tU9ci5gF36YUPnzznCgozsctCKP9uSieZDeDQeSVcw3qWBAKQeHQ/0
	7ePMJAcjf7InBUofSnW51jueBVrEJXBjd/HifzKy5OHluB9HEDblaqF2Ke6JWl/7nrqIedIVtsp
	IrrS4yzi0PnJWp+wsosTwsD0eLDgpdm+MruiNfU5sQk2HY8yoAbGMqIrdI5zy045FKg+8E1AEIr
	icVpu+9HyZ/7rs=
X-Google-Smtp-Source: AGHT+IF/C4yUwOf5mpbMtaU2h2rOsiGpdkEEsLAGtzYQUDBEb9+rqxAJ3mawPvAn1vNJ7iZ9xA0GiA==
X-Received: by 2002:a05:6214:238e:b0:88a:2f7f:e936 with SMTP id 6a1803df08f44-89075d1ca32mr51247076d6.2.1767713038175;
        Tue, 06 Jan 2026 07:23:58 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077267b9esm15587326d6.48.2026.01.06.07.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 07:23:57 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	haokexin@gmail.com
Subject: [meta][PATCH 03/07] linux-yocto/6.12: update CVE exclusions (6.12.63)
Date: Tue,  6 Jan 2026 10:23:48 -0500
Message-Id: <20260106152352.932717-4-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20260106152352.932717-1-bruce.ashfield@gmail.com>
References: <20260106152352.932717-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 15:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228897

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 10 changes (9 new | 1 updated): - 9 new CVEs: CVE-2025-68687, CVE-2025-68688, CVE-2025-68689, CVE-2025-68690, CVE-2025-68691, CVE-2025-68692, CVE-2025-68693, CVE-2025-68694, CVE-2025-68695 - 1 updated CVEs: CVE-2025-7195
        Date: Wed, 24 Dec 2025 04:07:32 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.12.inc              | 380 +++++++++++++++++-
 1 file changed, 370 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
index 4839a53cd9..1b6693c271 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.12.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-12-15 16:44:27.465288+00:00 for kernel version 6.12.62
-# From linux_kernel_cves cve_2025-12-15_1600Z-2-gd297626114b
+# Generated at 2025-12-24 04:11:52.684157+00:00 for kernel version 6.12.63
+# From linux_kernel_cves cve_2025-12-24_0300Z-1-gf5a9200c11e
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.12.62"
+    this_version = "6.12.63"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -1442,7 +1442,7 @@ CVE_STATUS[CVE-2021-47618] = "fixed-version: Fixed from version 5.17"
 
 CVE_STATUS[CVE-2021-47619] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2021-47620] = "fixed-version: Fixed from version 5.17"
+CVE_STATUS[CVE-2021-47620] = "fixed-version: Fixed from version 5.16.5"
 
 CVE_STATUS[CVE-2021-47622] = "fixed-version: Fixed from version 5.17"
 
@@ -1960,7 +1960,7 @@ CVE_STATUS[CVE-2022-48841] = "fixed-version: Fixed from version 5.17"
 
 CVE_STATUS[CVE-2022-48842] = "fixed-version: Fixed from version 5.16.16"
 
-CVE_STATUS[CVE-2022-48843] = "fixed-version: Fixed from version 5.17"
+# CVE-2022-48843 has no known resolution
 
 CVE_STATUS[CVE-2022-48844] = "fixed-version: Fixed from version 5.17"
 
@@ -1980,7 +1980,7 @@ CVE_STATUS[CVE-2022-48851] = "fixed-version: Fixed from version 5.17"
 
 CVE_STATUS[CVE-2022-48852] = "fixed-version: Fixed from version 5.17"
 
-CVE_STATUS[CVE-2022-48853] = "fixed-version: Fixed from version 5.17"
+CVE_STATUS[CVE-2022-48853] = "fixed-version: Fixed from version 5.18"
 
 CVE_STATUS[CVE-2022-48854] = "fixed-version: Fixed from version 5.17"
 
@@ -2168,7 +2168,7 @@ CVE_STATUS[CVE-2022-48948] = "fixed-version: Fixed from version 6.2"
 
 CVE_STATUS[CVE-2022-48949] = "fixed-version: Fixed from version 6.2"
 
-CVE_STATUS[CVE-2022-48950] = "fixed-version: Fixed from version 6.1"
+CVE_STATUS[CVE-2022-48950] = "fixed-version: Fixed from version 6.0.14"
 
 CVE_STATUS[CVE-2022-48951] = "fixed-version: Fixed from version 6.1"
 
@@ -3686,8 +3686,6 @@ CVE_STATUS[CVE-2022-49728] = "fixed-version: Fixed from version 5.19"
 
 CVE_STATUS[CVE-2022-49729] = "fixed-version: Fixed from version 5.19"
 
-CVE_STATUS[CVE-2022-49730] = "fixed-version: Fixed from version 5.19"
-
 CVE_STATUS[CVE-2022-49731] = "fixed-version: Fixed from version 5.19"
 
 CVE_STATUS[CVE-2022-49732] = "fixed-version: Fixed from version 5.19"
@@ -17990,7 +17988,7 @@ CVE_STATUS[CVE-2025-40073] = "fixed-version: only affects 6.16 onwards"
 
 # CVE-2025-40074 needs backporting (fixed from 6.18)
 
-# CVE-2025-40075 needs backporting (fixed from 6.18)
+CVE_STATUS[CVE-2025-40075] = "cpe-stable-backport: Backported in 6.12.63"
 
 CVE_STATUS[CVE-2025-40076] = "fixed-version: only affects 6.17 onwards"
 
@@ -18528,5 +18526,367 @@ CVE_STATUS[CVE-2025-40344] = "cpe-stable-backport: Backported in 6.12.58"
 
 CVE_STATUS[CVE-2025-40345] = "cpe-stable-backport: Backported in 6.12.61"
 
+CVE_STATUS[CVE-2025-40346] = "cpe-stable-backport: Backported in 6.12.56"
+
+CVE_STATUS[CVE-2025-40347] = "cpe-stable-backport: Backported in 6.12.56"
+
+CVE_STATUS[CVE-2025-40348] = "cpe-stable-backport: Backported in 6.12.56"
+
+CVE_STATUS[CVE-2025-40349] = "cpe-stable-backport: Backported in 6.12.56"
+
+CVE_STATUS[CVE-2025-40350] = "cpe-stable-backport: Backported in 6.12.56"
+
+CVE_STATUS[CVE-2025-40351] = "cpe-stable-backport: Backported in 6.12.56"
+
+CVE_STATUS[CVE-2025-40352] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-40353] = "cpe-stable-backport: Backported in 6.12.56"
+
+CVE_STATUS[CVE-2025-40354] = "cpe-stable-backport: Backported in 6.12.56"
+
+# CVE-2025-40355 needs backporting (fixed from 6.18)
+
+CVE_STATUS[CVE-2025-40356] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-40357] = "cpe-stable-backport: Backported in 6.12.56"
+
+CVE_STATUS[CVE-2025-40358] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40359] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40360] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40361] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40362] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-40363] = "cpe-stable-backport: Backported in 6.12.58"
+
 CVE_STATUS[CVE-2025-40364] = "cpe-stable-backport: Backported in 6.12.14"
 
+CVE_STATUS[CVE-2025-68167] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-68168] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-68169] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-68170] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-68171] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-68172] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-68173] = "cpe-stable-backport: Backported in 6.12.58"
+
+# CVE-2025-68174 needs backporting (fixed from 6.18)
+
+# CVE-2025-68175 needs backporting (fixed from 6.18)
+
+CVE_STATUS[CVE-2025-68176] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-68177] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-68178] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-68179] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-68180] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-68181] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-68182] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-68183] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-68184] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-68185] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-68186] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-68187] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-68188] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-68189] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-68190] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-68191] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-68192] = "cpe-stable-backport: Backported in 6.12.58"
+
+# CVE-2025-68193 needs backporting (fixed from 6.18)
+
+CVE_STATUS[CVE-2025-68194] = "cpe-stable-backport: Backported in 6.12.58"
+
+# CVE-2025-68195 has no known resolution
+
+# CVE-2025-68196 needs backporting (fixed from 6.18)
+
+CVE_STATUS[CVE-2025-68197] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-68198] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-68199] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-68200] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-68201] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-68202] = "cpe-stable-backport: Backported in 6.12.59"
+
+# CVE-2025-68203 needs backporting (fixed from 6.18)
+
+CVE_STATUS[CVE-2025-68204] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-68205] = "fixed-version: only affects 6.17 onwards"
+
+# CVE-2025-68206 needs backporting (fixed from 6.18)
+
+CVE_STATUS[CVE-2025-68207] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-68208] = "cpe-stable-backport: Backported in 6.12.59"
+
+# CVE-2025-68209 needs backporting (fixed from 6.18)
+
+CVE_STATUS[CVE-2025-68210] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-68211] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-68212] = "fixed-version: only affects 6.14 onwards"
+
+CVE_STATUS[CVE-2025-68213] = "cpe-stable-backport: Backported in 6.12.60"
+
+CVE_STATUS[CVE-2025-68214] = "cpe-stable-backport: Backported in 6.12.60"
+
+CVE_STATUS[CVE-2025-68215] = "cpe-stable-backport: Backported in 6.12.60"
+
+CVE_STATUS[CVE-2025-68216] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-68217] = "cpe-stable-backport: Backported in 6.12.60"
+
+CVE_STATUS[CVE-2025-68218] = "cpe-stable-backport: Backported in 6.12.60"
+
+CVE_STATUS[CVE-2025-68219] = "cpe-stable-backport: Backported in 6.12.60"
+
+CVE_STATUS[CVE-2025-68220] = "cpe-stable-backport: Backported in 6.12.60"
+
+CVE_STATUS[CVE-2025-68221] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-68222] = "cpe-stable-backport: Backported in 6.12.60"
+
+CVE_STATUS[CVE-2025-68223] = "cpe-stable-backport: Backported in 6.12.60"
+
+CVE_STATUS[CVE-2025-68224] = "cpe-stable-backport: Backported in 6.12.60"
+
+CVE_STATUS[CVE-2025-68225] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-68226] = "fixed-version: only affects 6.17.8 onwards"
+
+CVE_STATUS[CVE-2025-68227] = "cpe-stable-backport: Backported in 6.12.60"
+
+CVE_STATUS[CVE-2025-68228] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-68229] = "cpe-stable-backport: Backported in 6.12.60"
+
+CVE_STATUS[CVE-2025-68230] = "cpe-stable-backport: Backported in 6.12.60"
+
+CVE_STATUS[CVE-2025-68231] = "cpe-stable-backport: Backported in 6.12.60"
+
+CVE_STATUS[CVE-2025-68232] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-68233] = "cpe-stable-backport: Backported in 6.12.60"
+
+CVE_STATUS[CVE-2025-68234] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-68235] = "cpe-stable-backport: Backported in 6.12.60"
+
+# CVE-2025-68236 needs backporting (fixed from 6.18)
+
+CVE_STATUS[CVE-2025-68237] = "cpe-stable-backport: Backported in 6.12.60"
+
+CVE_STATUS[CVE-2025-68238] = "cpe-stable-backport: Backported in 6.12.60"
+
+# CVE-2025-68239 needs backporting (fixed from 6.18)
+
+CVE_STATUS[CVE-2025-68240] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-68241] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-68242] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-68243] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-68244] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-68245] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-68246] = "cpe-stable-backport: Backported in 6.12.59"
+
+CVE_STATUS[CVE-2025-68247] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-68248] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-68249] = "cpe-stable-backport: Backported in 6.12.56"
+
+CVE_STATUS[CVE-2025-68250] = "fixed-version: only affects 6.16 onwards"
+
+# CVE-2025-68251 needs backporting (fixed from 6.18)
+
+CVE_STATUS[CVE-2025-68252] = "cpe-stable-backport: Backported in 6.12.56"
+
+CVE_STATUS[CVE-2025-68253] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-68254] = "cpe-stable-backport: Backported in 6.12.62"
+
+CVE_STATUS[CVE-2025-68255] = "cpe-stable-backport: Backported in 6.12.62"
+
+CVE_STATUS[CVE-2025-68256] = "cpe-stable-backport: Backported in 6.12.62"
+
+CVE_STATUS[CVE-2025-68257] = "cpe-stable-backport: Backported in 6.12.62"
+
+CVE_STATUS[CVE-2025-68258] = "cpe-stable-backport: Backported in 6.12.62"
+
+CVE_STATUS[CVE-2025-68259] = "cpe-stable-backport: Backported in 6.12.62"
+
+CVE_STATUS[CVE-2025-68260] = "fixed-version: only affects 6.18 onwards"
+
+CVE_STATUS[CVE-2025-68261] = "cpe-stable-backport: Backported in 6.12.62"
+
+CVE_STATUS[CVE-2025-68262] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-68263] = "cpe-stable-backport: Backported in 6.12.62"
+
+CVE_STATUS[CVE-2025-68264] = "cpe-stable-backport: Backported in 6.12.62"
+
+CVE_STATUS[CVE-2025-68265] = "cpe-stable-backport: Backported in 6.12.62"
+
+CVE_STATUS[CVE-2025-68266] = "cpe-stable-backport: Backported in 6.12.62"
+
+# CVE-2025-68281 needs backporting (fixed from 6.18)
+
+CVE_STATUS[CVE-2025-68282] = "cpe-stable-backport: Backported in 6.12.61"
+
+CVE_STATUS[CVE-2025-68283] = "cpe-stable-backport: Backported in 6.12.61"
+
+CVE_STATUS[CVE-2025-68284] = "cpe-stable-backport: Backported in 6.12.61"
+
+CVE_STATUS[CVE-2025-68285] = "cpe-stable-backport: Backported in 6.12.61"
+
+CVE_STATUS[CVE-2025-68286] = "cpe-stable-backport: Backported in 6.12.61"
+
+CVE_STATUS[CVE-2025-68287] = "cpe-stable-backport: Backported in 6.12.61"
+
+CVE_STATUS[CVE-2025-68288] = "cpe-stable-backport: Backported in 6.12.61"
+
+CVE_STATUS[CVE-2025-68289] = "cpe-stable-backport: Backported in 6.12.61"
+
+CVE_STATUS[CVE-2025-68290] = "cpe-stable-backport: Backported in 6.12.61"
+
+CVE_STATUS[CVE-2025-68291] = "cpe-stable-backport: Backported in 6.12.61"
+
+CVE_STATUS[CVE-2025-68292] = "cpe-stable-backport: Backported in 6.12.61"
+
+CVE_STATUS[CVE-2025-68293] = "cpe-stable-backport: Backported in 6.12.61"
+
+CVE_STATUS[CVE-2025-68294] = "fixed-version: only affects 6.15 onwards"
+
+CVE_STATUS[CVE-2025-68295] = "cpe-stable-backport: Backported in 6.12.61"
+
+CVE_STATUS[CVE-2025-68296] = "cpe-stable-backport: Backported in 6.12.61"
+
+CVE_STATUS[CVE-2025-68297] = "cpe-stable-backport: Backported in 6.12.61"
+
+CVE_STATUS[CVE-2025-68298] = "cpe-stable-backport: Backported in 6.12.61"
+
+CVE_STATUS[CVE-2025-68299] = "fixed-version: only affects 6.17.9 onwards"
+
+CVE_STATUS[CVE-2025-68300] = "cpe-stable-backport: Backported in 6.12.61"
+
+CVE_STATUS[CVE-2025-68301] = "cpe-stable-backport: Backported in 6.12.61"
+
+CVE_STATUS[CVE-2025-68302] = "cpe-stable-backport: Backported in 6.12.61"
+
+CVE_STATUS[CVE-2025-68303] = "cpe-stable-backport: Backported in 6.12.61"
+
+# CVE-2025-68304 needs backporting (fixed from 6.18)
+
+CVE_STATUS[CVE-2025-68305] = "cpe-stable-backport: Backported in 6.12.61"
+
+CVE_STATUS[CVE-2025-68306] = "cpe-stable-backport: Backported in 6.12.61"
+
+CVE_STATUS[CVE-2025-68307] = "cpe-stable-backport: Backported in 6.12.61"
+
+CVE_STATUS[CVE-2025-68308] = "cpe-stable-backport: Backported in 6.12.61"
+
+# CVE-2025-68309 needs backporting (fixed from 6.18)
+
+CVE_STATUS[CVE-2025-68310] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-68311] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-68312] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-68313] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-68314] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-68315] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-68316] = "fixed-version: only affects 6.13 onwards"
+
+CVE_STATUS[CVE-2025-68317] = "cpe-stable-backport: Backported in 6.12.58"
+
+# CVE-2025-68318 needs backporting (fixed from 6.18)
+
+# CVE-2025-68319 needs backporting (fixed from 6.18)
+
+CVE_STATUS[CVE-2025-68320] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-68321] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-68322] = "cpe-stable-backport: Backported in 6.12.58"
+
+CVE_STATUS[CVE-2025-68323] = "fixed-version: only affects 6.16 onwards"
+
+CVE_STATUS[CVE-2025-68324] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68325] = "cpe-stable-backport: Backported in 6.12.63"
+
+CVE_STATUS[CVE-2025-68326] = "fixed-version: only affects 6.17 onwards"
+
+CVE_STATUS[CVE-2025-68327] = "cpe-stable-backport: Backported in 6.12.61"
+
+CVE_STATUS[CVE-2025-68328] = "cpe-stable-backport: Backported in 6.12.61"
+
+CVE_STATUS[CVE-2025-68329] = "cpe-stable-backport: Backported in 6.12.61"
+
+CVE_STATUS[CVE-2025-68330] = "cpe-stable-backport: Backported in 6.12.61"
+
+CVE_STATUS[CVE-2025-68331] = "cpe-stable-backport: Backported in 6.12.61"
+
+CVE_STATUS[CVE-2025-68332] = "cpe-stable-backport: Backported in 6.12.62"
+
+# CVE-2025-68333 needs backporting (fixed from 6.18)
+
+# CVE-2025-68334 needs backporting (fixed from 6.18)
+
+CVE_STATUS[CVE-2025-68335] = "cpe-stable-backport: Backported in 6.12.62"
+
+CVE_STATUS[CVE-2025-68336] = "cpe-stable-backport: Backported in 6.12.62"
+
+CVE_STATUS[CVE-2025-68337] = "cpe-stable-backport: Backported in 6.12.62"
+
+CVE_STATUS[CVE-2025-68338] = "cpe-stable-backport: Backported in 6.12.61"
+
+CVE_STATUS[CVE-2025-68339] = "cpe-stable-backport: Backported in 6.12.61"
+
+CVE_STATUS[CVE-2025-68340] = "cpe-stable-backport: Backported in 6.12.61"
+
+CVE_STATUS[CVE-2025-68341] = "cpe-stable-backport: Backported in 6.12.61"
+
+CVE_STATUS[CVE-2025-68342] = "cpe-stable-backport: Backported in 6.12.61"
+
+CVE_STATUS[CVE-2025-68343] = "cpe-stable-backport: Backported in 6.12.61"
+
-- 
2.39.2


