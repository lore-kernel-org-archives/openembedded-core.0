Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90F8AC982E6
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:05 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1571.1789682880549927441
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TdFQZ5/p;
 spf=pass (domain: smile.fr, ip: 74.125.225.76, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485b1d2874fso16860f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682878; x=1790287678; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sfoQtQCjVkWGhL55r2DcK4y5Ckr4qrwPeBiSwgGtVH4=;
        b=TdFQZ5/pbgskR3UeSvsoklrtGEnaXvviAFMSSimFIIHZ3J9Vfkjui3KqjMGJk1i/h/
         rFZtcRBeSjBq84YvT/6LaRaK9Hjh685j3wmBILrCOrnNIQ4zIsd6T1RgmQXoENAdsexw
         BA3Ngz/BD3UljqqBjyzAj31QZIx2+3QmcxPOI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682878; x=1790287678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=sfoQtQCjVkWGhL55r2DcK4y5Ckr4qrwPeBiSwgGtVH4=;
        b=zHx9u5EKb03Wy3NA5rQWdcHOKxP59GCoA+0CPCLNYsOt+hpgPSlXrnU+04HnZ0nwTe
         sJRrYvhQt186VcMqgBEdei7uR3GAa8AJ6+h0SmJ8h5ywAWbUlYb1IdTOeeWTi93a8NBV
         YI7ReUs7Wq6SyM3/mCtlu3UGwb4UopasUr3LZVBWEraAf2O6FeHAjiytDUxomd0O8Gbm
         RxwkQUXcYdGzJs0DmAHrR2iWFRMvPpzI/LDP23aSUKbji7u92eWie0Aa/MwoJFE5Dqwd
         gP5sYx42/A9D5W/UpQ2h6t8L1gXmSAL384jx8KCjtNssyjoQC+GMNxkPaXiD32Rh+O/t
         Zm0w==
X-Gm-Message-State: AFuF++ksMsjoXzI9PMSAFvlMSgnoV+OtGuQtDC0p4ClAHy8O5NJaqQ6t
	L0lhNTNNuZwfkgJvn/cd6zE+Efz8auQ0rBEaK+Q9yCaNPlrFkjlUt+zalM9hiXHcH3k4mTmyB0U
	cSpW1Xg0=
X-Gm-Gg: AYBFou1Hq2gdElJXGKMBxJFVPkx9HA9Y0+aiW01nwFkdYCnCDFVDoJrDtU1epIzpB8K
	X6W3V5sIH07OFw6l4oPozb1jRtG1GGhqRD7k8/UMCS9slUKX5t5LlSruN/cci56it/z9emJr7aX
	wSao8lN45JkmE2+HowI83MWAUBywMKsPcM+i2ERQnLdvzKuboQ2iWcwMRhnR6BTNQPPM3QDgQTP
	2Y5HHqXNmeL+O7zgcFbEJJb55HmBHSmVKfS0EinakuFLc+NhPCTQFOyiU65ck3fhG/bYT7s6T9V
	j0qg+8DO5L7ZlGic2/hCdATwKmfeGbfav5abkXezsNGGjU7iIU7jV1R068thl2PhVbPCzaxMCM5
	5uSw8N3shc5MYsLVHNzuzRyu1I2yZbk1/y7sr+zBVCatu/N8ggLWorKbI3We2Yj8LT45bbc+3pX
	EjnJ52N+ieR05J2fqewWorh+tT+QG8vkPuBrphdj2EA02lUdmKfPkwd7yL8BLNVRquGPfFsVfle
	usvFPcaILaYBEZOEC97wX52hpBWMvEO6zEZTEXdjSfFoM+MD8ZBJfSbuAkYgKXDGcmOdBoeqgk=
X-Received: by 2002:a05:600c:3f06:b0:49d:257c:a735 with SMTP id 5b1f17b1804b1-49fc4ff42b4mr5977135e9.11.1789682878580;
        Thu, 17 Sep 2026 15:07:58 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.07.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:07:58 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 18/79] sbom-cve-check-update-cvelist-native: update to version 2026-06-24
Date: Fri, 18 Sep 2026 00:06:03 +0200
Message-ID: <4f248ad8c60ee85d3a5a99195e6b11dea79765e2.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246113

From: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>

Update cvelistV5 to the CVE database from 2026-06-24.

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: f7a706321eb783ad43d8d9666ea3536024cb5be8)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...07.bb => sbom-cve-check-update-cvelist-native_2026-06-24.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-cvelist-native_2026-05-07.bb => sbom-cve-check-update-cvelist-native_2026-06-24.bb} (89%)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-05-07.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-06-24.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-05-07.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-06-24.bb
index 7670172c40b..ca192bc9cf3 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-05-07.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-06-24.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/CVEProject/cvelistV5"
 SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "cvelist"
 
-SRCREV = "dd0e93c75034d0167498174c886a56729edc44de"
+SRCREV = "966bddf787997b471325e065cae82702a60c64ff"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>.+)_baseline"
 
 require sbom-cve-check-update-db.inc

