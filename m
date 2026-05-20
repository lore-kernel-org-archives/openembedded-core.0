Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF7ECD5BA4
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:21:22 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7289.1779265280572740410
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:21:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kyrLn/c6;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so3701533f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 01:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779265279; x=1779870079; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lAqmdYoD2V9fx5+lSC9pNNKABSsBgz6M2WYY9oXERm0=;
        b=kyrLn/c6vHNE39xYvpukwIFf3EraPSXaJDVMiYsw3G93dLdrOxYxhJI8L6V0A0w/Sz
         CNu7yQTwHZ3RVhvlj7f5uV1Q4gpCr+5A7qi2XI1W9rHT15djfuH1jlzsXeSHaKkwDv7P
         5T2VmUZDpdcy/0Jz0dBjOiILVVZxyY/N2C/EI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265279; x=1779870079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lAqmdYoD2V9fx5+lSC9pNNKABSsBgz6M2WYY9oXERm0=;
        b=ed8ZaKmddLEeYUYIRowMK7i13FE2Jz8a4ymBQcGZf/nzHw0of6/GJE6x+WW6CG7tZY
         L5+LhBRIJ4DLmIMkL1ASuy4EIX/lu+GegZFSjRCqQ9VgGShTiwP/QVa3W6KMC0Cb2N3L
         LpgiltTWh0Lk62ImGQnMfxHjY56yGOpt3+QkMUm8Cp9iNINtpwnCL47TEl/z5Sxrk91V
         WO/EvZEQuO8/i6Y04k86NjEA8C98sNigKOAxDtzaGpoXdMrSKM9i5qg4rnTPQAoYNcVS
         fQ6el32eRu+HyBLBOCFY5xtYIhg1ltzpKxCyh846YTz1PuUs5LUPyV8PClDfCrOsLCD9
         vdeg==
X-Gm-Message-State: AOJu0Yx6i9EGWdDToSXYEpG4BMGM9hpG3TVo4rm2EjsRX6KxURRUrGNW
	ovbts5cm8qeUIqZufS2cEKej7yDl3t9x+N0JzX6tK0vCVLuVb8Gz02z5t5XGb5UAP0Rg6ayNx2E
	KR2eQ
X-Gm-Gg: Acq92OGcmSHmL4dNZQoc870o/2GpO2pu41ScVa4tBtZEjJ5dnBxSADyo58GK2i6IMu+
	83wLKPyHZYATr4gO91E83BP8LOQkowNjMnrSgkaQO2Md8mbNFzgQKLgN1AEPz0/jwOSczOXFc2E
	B2dBd8CVwpLnB/PEWGjFzJUtHx6vK+HWFXGt352G7GkvryCqnlxsoIJJEwTM5dP8jl5PrqiI5fK
	BISAmj4Pj/PtBIeaaSh/eeGiF0d0or+26GsERHV6JXgZ0OkXdpkZuPcM7cM0rqoH37z2U49zRuE
	sy5af4aMJo9G6yDhypLSC6tJheIMbaA87YMx4mXjArWu0TI2gkERO8UMKff/Xx9P8Sb7dVYUnIy
	n8Cxo5xZ+L1YUgJwtwWAVKby91RbEFYx8ilWC8emjLj8aBx57UTLYXuPEpVx1ZTTWfOqOR7ayfO
	5mv0x3z6Czr+rHMFzDqzdlA43XvRyyZRU1KpPkuKLkowEKTRZ/pdGPX+uh8ES8TSGWX9nX7ypny
	KPeSVasSmU7pGPs8D50sQ6vRITy
X-Received: by 2002:a05:600c:570a:b0:48f:c649:e6fa with SMTP id 5b1f17b1804b1-48fd636a2f4mr269143835e9.15.1779265278696;
        Wed, 20 May 2026 01:21:18 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-250c-63aa-0256-2b9f-d16e-d784.rev.sfr.net. [2a02:8440:250c:63aa:256:2b9f:d16e:d784])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm56350642f8f.10.2026.05.20.01.21.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:21:18 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose v2 24/28] sbom-cve-check: set PV from upstream tags and ensure version checks are correct
Date: Wed, 20 May 2026 10:20:25 +0200
Message-ID: <61189f25d1e9bef1c1e28ad69493862292682035.1779264709.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779264709.git.yoann.congal@smile.fr>
References: <cover.1779264709.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:21:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237423

From: Alexander Kanavin <alex@linutronix.de>

These recipes didn't set PV, which by default is 1.0. This isn't correct:
upstream does provide date-based tags that can be used to perform version upgrades.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d8d4dee746e86d746295c5b7ab1b880bb427e0a4)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
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
index 3763e7f21f7..7670172c40b 100644
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
index 26a14e6eb16..02446e30cee 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.05.07-000006.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/fkie-cad/nvd-json-data-feeds"
 SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "nvd-fkie"
 
-# v2026.05.07-000006
 SRCREV = "72d8841c8ad9083ebf6723063f275444ea0d76f9"
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.+)"
 
 require sbom-cve-check-update-db.inc

