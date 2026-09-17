Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58411C982E5
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:05 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1670.1789682878525537903
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:07:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zjQs7+pt;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e66390995so564305e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682877; x=1790287677; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UTV7Xk50d7T34ketiW0egi0tizvCaz9I5qWsL1ZJSu8=;
        b=zjQs7+pt6VgoOZsFBi0PFAC75otTCzAwSB3eh2YAFUgYUNAIV3z/GjWoDYSt8+Gxdm
         xk6MA1gmRdYsQAG7gNBzGBnny79slWAZx+whyefKSy6BwvknDczPSLgrm19Aa1kK33tC
         eKR5ueiP0gPwKNqFqaokwtNwr9MliqfYThUOQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682877; x=1790287677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UTV7Xk50d7T34ketiW0egi0tizvCaz9I5qWsL1ZJSu8=;
        b=jwn2g0vNJBAEymYm5PSjEPvkO9gjY3WKAhQ5g+gbFKxLBYQDW6Qozi7uA4I46Lf2R2
         sRWJOiwQzkfJqng3dhvkmKYlgvgUOToWPC/dS9VK+7SH68FgIQQn20xeRf+EOhQo08Fy
         nfpNu7v0nYkpr4Ap4Hgs2H2/ypDaXir27L7yq6A37SHdENNYCFrClW8ooxwOQn77iVTK
         EAXOc23CZXp4zH6ELX3VqFiVQkUhOdrEg1Vxs/tSDyBKXERoSyszvCs5JZhxzg5t4U9C
         ErOGw51Vxpdf1djZiNdK8TWd+mPsRDEcGw5LO3EulIUodpzvYcOhVkmzZGBp36e85ahs
         A6Pg==
X-Gm-Message-State: AFuF++m516DJo5M2FoQpLWnc2tmqT1g3Pu/xbX0gmMYbLubsm68FmFOY
	wgxVoJNYOg4uOdBNENpK0nvrOzqnfhvh1TrFZFo0UuK9g0Yd7RUDDuOHLft2UVp4G5uO4TFgSbF
	scqGfqac=
X-Gm-Gg: AYBFou0E6m7Pner4yrQiv/Eo0b5t8bggBMrUDSpgVwLufa731GMxP0kcADixHQfw9FV
	//Ow6yWW9zrc1x6hQkGjPDqNSjA7G5+82dMcrkuCIAvamlYsC4SeqlARjzaj7vwP0/WyMlF6UmH
	oqMdbWxdPI1vr0kXyO6Dfl28o4xkvETRT9X5I4cewV8xpmOO9NqSeu3X/Fnlgvaq9kqfqbWgFGB
	zX83ALTICHoq4zNiUIhsnN9vn9Va24gR51W8D7SYeaA7igwBYi8Hqep3yAcsFqeutjhGwm2Mnko
	OzD6WWYE0taald6LVoFxcX3dENDfPQ5GTqzjiuQCGhgeJWje4SHA/ZRWDllkY2hxLOLgyN9ezu6
	kN/C0/4hCGBbWVKjV3uiJ4WlUi2bXxhB+XsZ8SZcORAUZq7k6iSUgFEZPF35t/hvhJaVTtECf4q
	eNRYjaGBS2hf89eqyZc9Czj3BE/9C19HiFqqomMH+QTCdF9Kpnw0ljBrGShn+Ndkp3zardIqgxR
	dEZp/jFHcxhEa/6adHqBYbvOeRszuhq9lbYr34KQUQkBtAZci0RJnPCbGV7CpJ+R7injsefxVY=
X-Received: by 2002:a05:600c:3550:b0:49e:7d74:7b7a with SMTP id 5b1f17b1804b1-49fc56db8f3mr3330225e9.6.1789682876752;
        Thu, 17 Sep 2026 15:07:56 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.07.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:07:56 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 14/79] sbom-cve-check-update-nvd-native: upgrade 2026.05.07-000006 -> 2026.06.09-000006
Date: Fri, 18 Sep 2026 00:05:59 +0200
Message-ID: <1a593c7063ed86519d5b8a3a0bbcde98834569cd.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246109

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: d33c73535229b5066901faedaaaca0aa6bbd99bf)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...bb => sbom-cve-check-update-nvd-native_2026.06.09-000006.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-nvd-native_2026.05.07-000006.bb => sbom-cve-check-update-nvd-native_2026.06.09-000006.bb} (89%)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.05.07-000006.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.09-000006.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.05.07-000006.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.09-000006.bb
index 02446e30cee..2917c89e628 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.05.07-000006.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native_2026.06.09-000006.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/fkie-cad/nvd-json-data-feeds"
 SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "nvd-fkie"
 
-SRCREV = "72d8841c8ad9083ebf6723063f275444ea0d76f9"
+SRCREV = "7ff4a0622bfdf5313c79635951112d2a45bbe9fd"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.+)"
 
 require sbom-cve-check-update-db.inc

