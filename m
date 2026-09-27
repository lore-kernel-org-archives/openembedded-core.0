Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52AF3C9830E
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 07:43:53 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33588.1790495032303209536
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2026 00:43:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=1hCFh6GB;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so11934835e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 00:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790495030; x=1791099830; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=y4QB3LORk7ZIWPAYPpHxUAEnHg4Oju+LbnIHl2HR7h8=;
        b=1hCFh6GBwi7clp5h8vm8sM607tj02naDmSs5Fay3fFHcMeYPrxlQNJCCL5MqQwlqeC
         JWKX9nmlQ0Ew0jcblhVon0WA/ylPaT0BSIOqW3/dRIF8sbEKEjlIXXp2Tb36eWv1lNWq
         I/VQ42LkRqa8Z+eMtvHwtfQYIaWTsNdp54NEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790495030; x=1791099830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=y4QB3LORk7ZIWPAYPpHxUAEnHg4Oju+LbnIHl2HR7h8=;
        b=20XcNSmjXP4iOD9hdkW3ph5tTC1hFDbWjS/OnsUl5BKujQzGb4tBkMOUiwJBBI+o/n
         bJ96x3Kly8A/dtTdsMrjN6ZgHEb4hz5nG2P8tw6lRDjXhfoAlONjeW4QIOLHnkROUqMS
         Zsscow6uEIIKKxx0R0xYAcq/8jlG5/5SfjoWCI1VDcp5nybKEE5Kwsum/UBXzqKjBGY5
         bcPGa989crcXMrdsqqU4vCa6ajUgRAlbofL0hM/A7x8AI02+kY+6unTjJNzGY9wMePMO
         tYQEvBpDKG1wdhaHrj+nsBsZlAIB3QM0yO0tr5OBH9KOwvk175h+jqO8IwioQ7gsCS5T
         tFFQ==
X-Gm-Message-State: AFuF++l1So7DdAKXsBE7Qei3U4X74Yhz1JuXF39OoHiSzh5x9PMJvhWi
	inuzV8UfRCKLp88eteWnOImMZk8XHw4kDGicp6/yX9F79qh7vBzjISHzUvyEOX0cs68Te8Cz0jn
	j500dKNE=
X-Gm-Gg: AYBFou07f1ZXv4AZdJN5tBJC1OcZXA54mYq6eWhEE6IKjw1mOHKdD86qNduLAmO1SsQ
	6hxTgzbf9tYnfYistgwF8qlDgkj7ovJNTv1wu6/bhLNXWl+Tt91ACA4zIfHcmcSKK2eNGReIShy
	Nf4/hyMT28Wx1I4k694kbj0X2TRrRnkRfBxC8dr/K4ERfK8BETevJig/w6MTINXerTqlgWr7Pt0
	ODTTepLCb0Z0X4g2EczXUjFc9TSFM+v87SO1dtgTDlBeYtJX8CwAH63dXks9s0Z2VSLD1HWvcmo
	tDSNNZV+Zvy77iDnF0x4qqewjeymdxCtjkm+HbsioYLsOOwY5gxpWS09ZDonvrKyFmiuFd1CP+P
	CAWwDigj4V8dxqt34sRTcY1wn6hkUmNViwd3+0AwbrBHp815gUtti1Vdy4MwdNQH4SIscaJtM/h
	MGqHDQKxukgRH4uBVGIlJFKL8b5gfC1zBl3oqSrEfqyxej8QHl4Mewlld9YpCa46lH6XD1U0+Xu
	UUrp+vNcH/4zO7GJRmBKVCAWmuqQ6xdZcC4185IS3/D4nXPzBor+wefQt0G7FQdqOwDSI8YPx/5
	pqyikZwU
X-Received: by 2002:a05:600c:530f:b0:49f:ffdc:939d with SMTP id 5b1f17b1804b1-49fffdc9a4amr25838785e9.9.1790495030514;
        Sun, 27 Sep 2026 00:43:50 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30c43asm19821375f8f.3.2026.09.27.00.43.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 00:43:49 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 16/28]  sbom-cve-check-update-{nvd-native,cvelist-native}: upgrade 2026.08.25 -> 2026.09.12
Date: Sun, 27 Sep 2026 09:43:07 +0200
Message-ID: <df9e09b19138962570d8998b858719d3c4c26316.1790494949.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790494949.git.yoann.congal@smile.fr>
References: <cover.1790494949.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2026 07:43:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246666

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Update to newer database versions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 5bc50f5f1d7a8b4c37d32d78558f79a2337c3752)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...25.bb => sbom-cve-check-update-cvelist-native_2026-09-12.bb} | 2 +-
 ...bb => sbom-cve-check-update-nvd-native_2026.09.12-000023.bb} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-cvelist-native_2026-08-25.bb => sbom-cve-check-update-cvelist-native_2026-09-12.bb} (89%)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-nvd-native_2026.08.25-000009.bb => sbom-cve-check-update-nvd-native_2026.09.12-000023.bb} (89%)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-25.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-09-12.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-25.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-09-12.bb
index dcbd98396d2..b609b43f22e 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-08-25.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-09-12.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/CVEProject/cvelistV5"
 SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "cvelist"
 
-SRCREV = "ce11dbdcf79189e965d64b29161af93993619281"
+SRCREV = "9b9889cfd98306bf29b91df076c5118aae80b63f"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>.+)_baseline"
 
 require sbom-cve-check-update-db.inc
diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.25-000009.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.09.12-000023.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.25-000009.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.09.12-000023.bb
index 473e33411c6..7ba8647d6ae 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.08.25-000009.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.09.12-000023.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/fkie-cad/nvd-json-data-feeds"
 SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "nvd-fkie"
 
-SRCREV = "08cb7bde86fe9057c2338d7d61a705e642775bfd"
+SRCREV = "82336c26ab85706ae56efaa36ef5851ab92dd32c"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.+)"
 
 require sbom-cve-check-update-db.inc

