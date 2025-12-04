Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A83CD1CDDE
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 04:30:52 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35380.1764822642526723845
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Dec 2025 20:30:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=a04rHhv4;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4ee158187aaso5308171cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 20:30:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764822641; x=1765427441; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfbW64jH+fW8v643xh4ZphNz+YnLrGk9eED9D2kWTdw=;
        b=a04rHhv4DBIorijNRvHoqF6FaFnP83sJ6abB4kPq3ATfIJwulhzZmCYTFGY2jyYCd3
         xCUKNhWwUYEVwrO/kanB7CIrAIDtiJgObO9oT6eVoJ60YBjGK4p6mQmvgpIvv/zE66kh
         XIZBe4/3FriNVgkg7TDsnIUcAS4josD2vYsmAsb2XjvrNe3/4R6suSRoPJ0LuiZk6WKw
         fDjaDm2Ang4EFn+B6/ISLsxiS/M2JjpDeJVwqc00u4RwXdTVtvW83xAUA+b9Gb6Dvi81
         m/PFSppLQrnFpgdAnrl85YYmsX+7av5rax8P3wPbJccGADcSj6omQENzvwdwcdHEjwu5
         NXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764822641; x=1765427441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cfbW64jH+fW8v643xh4ZphNz+YnLrGk9eED9D2kWTdw=;
        b=uj/DcksjFUgIJmCpP6N7DRlScu8okyd3tXHXmEK1DUD6TDkzZlr5ig5ZRCYd664w2K
         nt9cjHqnNTH7Pfx7P9xwnFUYw9+RIpdkIiXrAYxMvaJ+3i2RO8xLXTMIO8vQWYibOlLq
         dGqWbo2O5MIuFcKeJd91DesmWrnQYN1LoDxMy80uK9x7ls5HQuNMh8vAxGRgZQzn1bDW
         Sak0ytbAE+d1nia/M2Jf4ccJGgVtpI2/73Vema2yNQqjKlaMFz6fvWHQ5GDqiy7rNyTD
         eDYydPqx4rsImtYdml6Y8b7GXWGLaeabwtQPTpZIPA5jNDiwlSEwxzdjSPxkAebfy9V/
         PCnQ==
X-Gm-Message-State: AOJu0Yz0aNdCfDe+yOtwvgd50LyqI+ntjI2q9/BcHSTHkQs2sBmaldMX
	IzhqrqDZyTiowZwIthbI+euaSGODlazevui1VJg6MIW6wmsBQ0TVpjYb69Qqqecb6LY=
X-Gm-Gg: ASbGnctmfcXCzH4Xw9tMOfQ/46KV27KQuBJt9zOrNPw9DUTvUs/pX1zDBDRBfgh6bh2
	NgZryubZieXqMzldlbDF1p0Kw232EvYTd8nFFAHUB9fx+nkWh48odZjIF0B08/EyIcstxyihH1a
	x0RyXyrwUsoNEQewIC8LNiNfspkRro7Nyokt8XziCaIZQkrVR99rNd1I7S9xRZthIqxV0GP1pkc
	0xIt7Nlsb4B3PNHCRCAOlcGMgh3rfC0TrahP6Gg6/Ssu8BWyQNysfy4QOeA2w228JY60WdJHWlM
	IUxKsyyrM9EcH6arvySnImaXKyhaprhzxSPbxX2kvC3YmMhezx820C3adE4itr1GQ/W0izK0fnz
	VGYxcKfEKbrSyOoD4xdkrqiiXnrUpR8FzP8daOa0FqFksWhrV7DuAPoDmLVAChKVC2wzZpanj5N
	fWMtxiRGPtLYriN993KshLg9ldKlNFNaFS4H5L0fd0UowIiY2DfIQiJmSxEgf3NOPj32B+Alp4I
	qtAWGYTbes/hJg=
X-Google-Smtp-Source: AGHT+IG2+EPeTAZ8xxj+ebBQEFWyziJPKkRSHvAnHGdXQinqX0fak/rcpWFUnJgrLyYk01j5OhvHXg==
X-Received: by 2002:a05:622a:58b:b0:4ee:275c:28d7 with SMTP id d75a77b69052e-4f0176bf908mr72527421cf.75.1764822641370;
        Wed, 03 Dec 2025 20:30:41 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88827f3347asm3191476d6.6.2025.12.03.20.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 20:30:40 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/16] linux-yocto/6.17: update CVE exclusions (6.17.10)
Date: Wed,  3 Dec 2025 23:30:20 -0500
Message-Id: <1f663575fb2b7f3c9760552748a8a0fa25744fd5.1764822465.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1764822465.git.bruce.ashfield@gmail.com>
References: <cover.1764822465.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Dec 2025 04:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227259

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Data pulled from: https://github.com/CVEProject/cvelistV5

    1/1 [
        Author: cvelistV5 Github Action
        Email: github_action@example.com
        Subject: 4 changes (1 new | 3 updated): - 1 new CVEs: CVE-2025-65406 - 3 updated CVEs: CVE-2024-32384, CVE-2025-13829, CVE-2025-7195
        Date: Mon, 1 Dec 2025 16:21:32 +0000

    ]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/cve-exclusion_6.17.inc              | 20 +++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/linux/cve-exclusion_6.17.inc b/meta/recipes-kernel/linux/cve-exclusion_6.17.inc
index 10dc5930194..0dfce883031 100644
--- a/meta/recipes-kernel/linux/cve-exclusion_6.17.inc
+++ b/meta/recipes-kernel/linux/cve-exclusion_6.17.inc
@@ -1,11 +1,11 @@
 
 # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
-# Generated at 2025-11-14 16:03:48.166784+00:00 for kernel version 6.17.8
-# From linux_kernel_cves cve_2025-11-14_1500Z-6-g27598c15037
+# Generated at 2025-12-01 16:25:15.356251+00:00 for kernel version 6.17.10
+# From linux_kernel_cves cve_2025-12-01_1600Z-1-g77d6c1b8483
 
 
 python check_kernel_cve_status_version() {
-    this_version = "6.17.8"
+    this_version = "6.17.10"
     kernel_version = d.getVar("LINUX_VERSION")
     if kernel_version != this_version:
         bb.warn("Kernel CVE status needs updating: generated for %s but kernel is %s" % (this_version, kernel_version))
@@ -17656,7 +17656,7 @@ CVE_STATUS[CVE-2025-40088] = "cpe-stable-backport: Backported in 6.17.5"
 
 CVE_STATUS[CVE-2025-40089] = "cpe-stable-backport: Backported in 6.17.5"
 
-CVE_STATUS[CVE-2025-40090] = "cpe-stable-backport: Backported in 6.17.5"
+CVE_STATUS[CVE-2025-40090] = "fixed-version: Fixed from version 6.17.5"
 
 CVE_STATUS[CVE-2025-40091] = "cpe-stable-backport: Backported in 6.17.5"
 
@@ -17762,8 +17762,6 @@ CVE_STATUS[CVE-2025-40142] = "cpe-stable-backport: Backported in 6.17.3"
 
 CVE_STATUS[CVE-2025-40143] = "cpe-stable-backport: Backported in 6.17.3"
 
-CVE_STATUS[CVE-2025-40144] = "cpe-stable-backport: Backported in 6.17.3"
-
 CVE_STATUS[CVE-2025-40145] = "cpe-stable-backport: Backported in 6.17.3"
 
 CVE_STATUS[CVE-2025-40146] = "cpe-stable-backport: Backported in 6.17.3"
@@ -17892,6 +17890,16 @@ CVE_STATUS[CVE-2025-40207] = "cpe-stable-backport: Backported in 6.17.4"
 
 CVE_STATUS[CVE-2025-40208] = "cpe-stable-backport: Backported in 6.17.4"
 
+CVE_STATUS[CVE-2025-40209] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40210] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40211] = "cpe-stable-backport: Backported in 6.17.8"
+
+CVE_STATUS[CVE-2025-40212] = "cpe-stable-backport: Backported in 6.17.9"
+
+CVE_STATUS[CVE-2025-40213] = "cpe-stable-backport: Backported in 6.17.8"
+
 CVE_STATUS[CVE-2025-40300] = "fixed-version: Fixed from version 6.17"
 
 CVE_STATUS[CVE-2025-40325] = "fixed-version: Fixed from version 6.15"
-- 
2.39.2


