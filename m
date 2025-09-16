Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23D1BCAC59E
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 15:51:27 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.2133.1758037884276559360
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 08:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P2gimA1N;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-77bec8ab89fso30723786d6.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 08:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758037883; x=1758642683; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uCmEUk+6z83oweYayU43cBGs27sLKL6/nccm/NbhGao=;
        b=P2gimA1N0k7pVJQ5O6Qt+QMbCeW0HGSMk9st5pQSGYTW1n0Dvz4Gk/NyIcYCfiY/eN
         Pq6qnBkHs6xVn9z/gM2riqWaqMG1YRs/wjKVHA5COBm3sumTlr3wED91J+t2XK0PQoM5
         6cebzmXUUVnwpESJaCgOLAU7Kna5vGYTk+fdbBaBvYR71tHF/U1g2Oep4TgxjnfryvAJ
         WkVDprnGFXcjSwcjybS+572Ph/tHVT9o+DCZvjSPuvVSaaeuC1487H5zlzk79S2jdp3N
         VlvGymytEbEeUIO62jkP1BjbpqEoZ5KUN+w23amdfGzyrW0oNCMXHtDpx89Bt81d43LE
         5z9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758037883; x=1758642683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uCmEUk+6z83oweYayU43cBGs27sLKL6/nccm/NbhGao=;
        b=hCcmd+iNHzjATpCxTJUeKQi0rV5+toGOGlyqWaWKjarcBGaxpMBcMwk9c4vgIBGar2
         3VFstLzFCXaMuxFdKMWb0av73YvMsYgw7M1tnCIfxK1BCmiZAejdf5l2RndlXtY8484q
         dXIu95oVILlaLSG7UIytAmVODLRaEFxQOyhxPP5enDGqrbsEe2BWwtw5GjalgYgoK072
         hQdAicJDkdguEyHtWKOJFHulOB59lzOygWcBk0EOn2LSrtQ+FmuF/b/7MYw46jfmYrEv
         Q/6GgYJjuay29F6Zai8LhmlqmPcsZTaFl9UONFpYDzU4mkH0bKy5R/4VDrxdOBiDCkq0
         OHcQ==
X-Gm-Message-State: AOJu0YznpYX76I1M+A7fxtZKVugueXuk4K27GVsFsVW/gwkR+rmBu7n4
	YkZJtUNyV88mDHXJe4UHbvQkO8cPzCvEOxohmcDq5tkh8E/kud2nSTWFBHn7nhO8
X-Gm-Gg: ASbGncsi2Wqzkjm71TyaS+Y6YBroY70nvMxZQwr3VVejrbe3kScLPC2eEOTCjACFerW
	O1Mafw08DRBwizlwFNuptuT5Lng83pRIcAm53auKTqLcsSsu+VwXy6XIm5BLKZKjsU8J5M8RzLO
	TzIEsAxkZvnhsng4KWuG1sN5bn+yl6yBnion3/4X9nzFpYxxKVrKG5P2aszeyXMbzyigaIspqVZ
	5qSKTypM3l80RFiVRSYoG5J4doRgnxxgGmRSFjgPtAXbd+jPYkfNKiyB35dGWPN8giSAEfYIdDU
	CEJKY2zveHlXo/7j8sSrRDOWt430S2diuHIIxObh95F2nlwnfrIxdo55OAq/POmQhiQhiD5UToa
	JroK/zXeZ53JotBUdtaMot9hkeFNHiyg8O4b8sYpo33Px51Ze0fXq4QpPEGTfIVyan643qil8x0
	MuBrPLruk+v9kQu5NdOK0TrBRaq/luaEGgLPRmRhBrfkdIKtBObeJxQdg=
X-Google-Smtp-Source: AGHT+IFa2eGBmBIBjKnYsaMoebB8ej8ohZR8JArDrF6qaPTKaJsReqaZ3HHjCYseKqso+eeq0edoZQ==
X-Received: by 2002:a05:6214:1945:b0:77e:2384:84b6 with SMTP id 6a1803df08f44-77e2393c8f5mr115063346d6.51.1758037882902;
        Tue, 16 Sep 2025 08:51:22 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-786c9c68cd2sm33724456d6.7.2025.09.16.08.51.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 08:51:22 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] linux-yocto/6.16: update CVE exclusions (6.16.7)
Date: Tue, 16 Sep 2025 11:51:17 -0400
Message-Id: <20250916155119.1583243-2-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250916155119.1583243-1-bruce.ashfield@gmail.com>
References: <20250916155119.1583243-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 15:51:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223565

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 1 changes (1 new | 0 updated): - 1 new CVEs: CVE-2025-10127 - 0 updated CVEs:
        Date: Thu, 11 Sep 2025 19:51:09 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.16.inc              | 360 +++++++++++++++++-
 1 file changed, 351 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.16.inc b/meta/recipes-kernel/linux/cve-exclusion_6.16.inc
index f3fb0f9fb0..631d65f197 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.16.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.16.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-09-03 19:14:52.747326+00:00 for kernel version 6.16.4
-# From linux_kernel_cves cve_2025-09-03_1900Z
+# Generated at 2025-09-11 19:55:57.111103+00:00 for kernel version 6.16.7
+# From linux_kernel_cves cve_2025-09-11_1900Z-3-gccd3d370b06
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.16.4"
+    this_version = "6.16.7"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -5848,8 +5848,6 @@ CVE_STATUS[CVE-2023-53135] = "fixed-version: Fixed from version 6.3"
 
 CVE_STATUS[CVE-2023-53136] = "fixed-version: Fixed from version 6.3"
 
-CVE_STATUS[CVE-2023-53137] = "fixed-version: Fixed from version 6.3"
-
 CVE_STATUS[CVE-2023-53138] = "fixed-version: Fixed from version 6.3"
 
 CVE_STATUS[CVE-2023-53139] = "fixed-version: Fixed from version 6.3"
@@ -14756,8 +14754,6 @@ CVE_STATUS[CVE-2025-38601] = "cpe-stable-backport: Backported in 6.16.1"
 
 CVE_STATUS[CVE-2025-38602] = "cpe-stable-backport: Backported in 6.16.1"
 
-CVE_STATUS[CVE-2025-38603] = "cpe-stable-backport: Backported in 6.16.1"
-
 CVE_STATUS[CVE-2025-38604] = "cpe-stable-backport: Backported in 6.16.1"
 
 CVE_STATUS[CVE-2025-38605] = "cpe-stable-backport: Backported in 6.16.1"
@@ -14772,8 +14768,6 @@ CVE_STATUS[CVE-2025-38609] = "cpe-stable-backport: Backported in 6.16.1"
 
 CVE_STATUS[CVE-2025-38610] = "cpe-stable-backport: Backported in 6.16.1"
 
-CVE_STATUS[CVE-2025-38611] = "cpe-stable-backport: Backported in 6.16.1"
-
 CVE_STATUS[CVE-2025-38612] = "cpe-stable-backport: Backported in 6.16.1"
 
 CVE_STATUS[CVE-2025-38613] = "cpe-stable-backport: Backported in 6.16.1"
@@ -14908,16 +14902,362 @@ CVE_STATUS[CVE-2025-38677] = "cpe-stable-backport: Backported in 6.16.4"
 
 CVE_STATUS[CVE-2025-38678] = "cpe-stable-backport: Backported in 6.16.2"
 
+CVE_STATUS[CVE-2025-38679] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38680] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38681] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38682] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38683] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38684] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38685] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38686] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38687] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38688] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38689] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38690] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38691] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38692] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38693] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38694] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38695] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38696] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38697] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38698] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38699] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38700] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38701] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38702] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38703] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38704] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38705] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38706] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38707] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38708] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38709] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38710] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38711] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38712] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38713] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38714] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38715] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38716] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38717] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38718] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38719] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38720] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38721] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38722] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38723] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38724] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38725] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38726] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38727] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38728] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38729] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38730] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-38731] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-38732] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-38733] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-38734] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-38735] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-38736] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-38737] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39673] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39674] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39675] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39676] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39677] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39678] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39679] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39680] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39681] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39682] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39683] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39684] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39685] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39686] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39687] = "cpe-stable-backport: Backported in 6.16.4"
+
 CVE_STATUS[CVE-2025-39688] = "fixed-version: Fixed from version 6.15"
 
+CVE_STATUS[CVE-2025-39689] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39690] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39691] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39692] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39693] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39694] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39695] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39696] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39697] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39698] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39699] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39700] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39701] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39702] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39703] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39704] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39705] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39706] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39707] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39708] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39709] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39710] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39711] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39712] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39713] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39714] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39715] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39716] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39717] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39718] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39719] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39720] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39721] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39722] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39723] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39724] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39725] = "fixed-version: Fixed from version 6.16"
+
+CVE_STATUS[CVE-2025-39726] = "fixed-version: Fixed from version 6.16"
+
+CVE_STATUS[CVE-2025-39727] = "cpe-stable-backport: Backported in 6.16.1"
+
 CVE_STATUS[CVE-2025-39728] = "fixed-version: Fixed from version 6.15"
 
+CVE_STATUS[CVE-2025-39729] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-39730] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-39731] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-39732] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-39733] = "cpe-stable-backport: Backported in 6.16.1"
+
+CVE_STATUS[CVE-2025-39734] = "cpe-stable-backport: Backported in 6.16.1"
+
 CVE_STATUS[CVE-2025-39735] = "fixed-version: Fixed from version 6.15"
 
+CVE_STATUS[CVE-2025-39736] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39737] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39738] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39739] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39740] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39741] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39742] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39743] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39744] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39745] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39746] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39747] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39748] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39749] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39750] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39751] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39752] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39753] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39754] = "cpe-stable-backport: Backported in 6.16.2"
+
 CVE_STATUS[CVE-2025-39755] = "fixed-version: Fixed from version 6.15"
 
+CVE_STATUS[CVE-2025-39756] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39757] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39758] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39759] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39760] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39761] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39762] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39763] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39764] = "cpe-stable-backport: Backported in 6.16.2"
+
+CVE_STATUS[CVE-2025-39765] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39766] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39767] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39768] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39769] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39770] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39771] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39772] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39773] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39774] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39775] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39776] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39777] = "cpe-stable-backport: Backported in 6.16.4"
+
 CVE_STATUS[CVE-2025-39778] = "fixed-version: Fixed from version 6.15"
 
+CVE_STATUS[CVE-2025-39779] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39780] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39781] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39782] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39783] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39784] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39785] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39786] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39787] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39788] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39789] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39790] = "cpe-stable-backport: Backported in 6.16.4"
+
+CVE_STATUS[CVE-2025-39791] = "cpe-stable-backport: Backported in 6.16.4"
+
 CVE_STATUS[CVE-2025-39930] = "fixed-version: Fixed from version 6.15"
 
 CVE_STATUS[CVE-2025-39989] = "fixed-version: Fixed from version 6.15"
@@ -14926,6 +15266,8 @@ CVE_STATUS[CVE-2025-40014] = "fixed-version: Fixed from version 6.15"
 
 CVE_STATUS[CVE-2025-40114] = "fixed-version: Fixed from version 6.15"
 
+# CVE-2025-40300 has no known resolution
+
 CVE_STATUS[CVE-2025-40325] = "fixed-version: Fixed from version 6.15"
 
 # CVE-2025-40364 has no known resolution
-- 
2.39.2


