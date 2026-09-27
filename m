Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11D9CCA5FA0
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 07:43:55 +0000 (UTC)
Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32858.1790495029563733000
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 00:43:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bFsG7ibO;
 spf=pass (domain: smile.fr, ip: 74.125.225.99, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-488811c9ebaso882170f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 00:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790495028; x=1791099828; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u9xaCOnWB5duaChlG23cDu5emzobes7ZXgL0/9TvHVQ=;
        b=bFsG7ibOfK3PGAYOI6q1WyYU2paB1IlbhPBRIQcuP0hYvtExjRm+P/UnDSOo0nP16s
         YhX+vu2gHITCqut+C6tiqe71+jDHeiRxvqdPGrflUQ5Kcp7NVbG8cBYSlmeSRBluTcPH
         v4mSPZrNc27gB3p6SPed8c465zoiwUAmMisnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790495028; x=1791099828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=u9xaCOnWB5duaChlG23cDu5emzobes7ZXgL0/9TvHVQ=;
        b=Yzvn9S3Nf1uD43UpmleogLsPaKoswpVbpWw0/JAKUYNm04+HokKJOFjuDNZCug6ZVN
         C4MEjhM9lb6gEGgrNo4DyKYOJ0gISjElUWtjzG/E7VvO0jnUsO2Jr/dO4VbjTUsEAzg+
         UV2N/6uBVGtcVB2yql9gzaEw117C7eVJfodf5Jwgi5eglRChfzCoKfujx5VjKOghO2nZ
         Ebwh6VErzWSlGXyFu8kdq5UpgALwsVezS/4S6RkMmANh2YxuPPgNOiitBqPn7md6uIvM
         iAeVkmkIi5cGrs1BSB5SDTZsTUBwXFtcMg7ZYqMXx2skgLZb6jvMyWrMjNhBY9wD9X6Z
         zdAg==
X-Gm-Message-State: AFuF++kdW0jJG6q+3mHl2V+yPTAASgjaTDkiOmA5bVMD61Wo1zUycQAT
	fLVxKvndLVOoDVd0YEHI6NcVYSL2Du/9SC2mdlz1/BHwGCHrsNRXsHIF2FkDwKxWhhW5r+pkyK8
	+z2lc7Vo=
X-Gm-Gg: AYBFou1FFLalG/ARhDhN2C7PZ11Tyg9Uc0XkYRRHWBoB8EdIMNNEMOxP9xZkGLG+Kh9
	f9TrAEGeCR2asjUKXNB7HTCAAhOG+0g80Du4qDB0gesyPjHz8bJ9nWAnSmtUUdzlcVdBIkRFE9P
	ugyQCmMCBwe5q+mv6qaxEBXeJfzo3mrvIqmBBY8wAfgfnaWFn9ZxhwGTDi8041vzPw+rpC7cmhy
	RSPDpJlxs592E6As4ULtdYRpuogFt8EY+CG7vP8i/hEksZnqsYYjm3tzGFosmcBp8cv6HzVYk3y
	cVho12/6SbEuQPNa1mbaPX9qgtEvuUlKe3qXEncZXBM4rudwALQ3//6BOw4Y7qSQmzOJNdK00Hb
	EEtU4n35r7cbg78KyfwpTajHrCeLPCOVbKI5HUVuoyQv2CkH2yOovHVfFYrOY9ASb2bsb7dSz1f
	+S/hZivcsCtarH9j5FPhqChKHQ+BfQq7zxDIahvVCZMGvBnHhRcCmnmrdo3Zt1YF5kG6W4vHr4e
	zqYSie5Ab3jg9y/da0rvlVWcWZeFlEcjJbKBjAOpIaNQo/7Z0nvu/jKDvXAnUSDSW6YTphAVVM=
X-Received: by 2002:a05:600c:6994:b0:49b:d03:8d3a with SMTP id 5b1f17b1804b1-49fe66cbb4dmr169822405e9.11.1790495027816;
        Sun, 27 Sep 2026 00:43:47 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30c43asm19821375f8f.3.2026.09.27.00.43.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:43:47 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 13/28]  sbom-cve-check-update-nvd-native,sbom-cve-check-update-cvelist-native: upgrade 2026.08.03-000011 -> 2026.08.25-000009
Date: Sun, 27 Sep 2026 09:43:04 +0200
Message-ID: <d8a0cd6f9003ffc9786b1797d6c3e9b9896f3094.1790494949.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790494949.git.yoann.congal@smile.fr>
References: <cover.1790494949.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 07:43:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246663

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 8d6b930f4d11627b90db3e902e382692c38cde15)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...03.bb => sbom-cve-check-update-cvelist-native_2026-08-25.bb} | 2 +-
 ...bb => sbom-cve-check-update-nvd-native_2026.08.25-000009.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-cvelist-native_2026-08-03.bb => sbom-cve-check-update-cvelist-native_2026-08-25.bb} (89%)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-nvd-native_2026.08.03-000011.bb => sbom-cve-check-update-nvd-native_2026.08.25-000009.bb} (89%)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-03.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-25.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-03.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-25.bb
index aa21b06953e..dcbd98396d2 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-03.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-25.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/CVEProject/cvelistV5"
 SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "cvelist"
 
-SRCREV = "b160e6f2915ac726b29ee0689fc920f5016abef5"
+SRCREV = "ce11dbdcf79189e965d64b29161af93993619281"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>.+)_baseline"
 
 require sbom-cve-check-update-db.inc
diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.03-000011.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.25-000009.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.03-000011.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.25-000009.bb
index 720b5ded0ac..473e33411c6 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.03-000011.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.25-000009.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/fkie-cad/nvd-json-data-feeds"
 SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "nvd-fkie"
 
-SRCREV = "b9f52bb052695dac5cabbd58e049eaac73697161"
+SRCREV = "08cb7bde86fe9057c2338d7d61a705e642775bfd"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.+)"
 
 require sbom-cve-check-update-db.inc

