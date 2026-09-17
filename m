Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B22D9C982DB
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:04 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1573.1789682881073228268
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=jvaVZTf9;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d391aso786145e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682879; x=1790287679; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xxP52CXndjVafiChfoJzg1ggw4TunHghYuZx0pFmcZU=;
        b=jvaVZTf9slFdO3JU74vlQXSrFqnlhLipLPlqhO7JXo2mwY1PUqD/bDrLe8gXDM1M/d
         pUYAZWjeRu4mav2YZsx0Lb/jVMRCTCdAcg5fHAmjyYj62hCm0Et7rfLEKbzAnOAirbST
         3z7J/QPloav2APtl24Ig7c6qY93zwNIgA6KRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682879; x=1790287679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xxP52CXndjVafiChfoJzg1ggw4TunHghYuZx0pFmcZU=;
        b=I77niHhG9LL9OuaFHTTetf6LFuc550nPx/aYV0/nP5vJ4qnIvh1EB05K4RSVqbp82f
         XDRMVSXbRM2ufA6pkIED2St5ONriSdFEazFXM0l9fGwpdBfX7mhislqry3JR6QBHLYbg
         OEoarPnY/rkkwKMMrU6rL+7RXDgOOXuwjDknRDDVMBXorHJajUXkMlsboExSAan8FWEb
         Dtvs0PYv9uVEzK8JTXynS81QCOCSycAzYHpiWTy9zOWma7m2KfhcV+REiZv/LBjLBCRr
         oZbkkULd+rnQe3KJgDJz/Rj9DHiyYwjX8+QujGpAgkMFgYSB95P83dmIMmZtqq/p1wLV
         ULCQ==
X-Gm-Message-State: AFuF++nvRrhME0siiuuOSoDJQaMZ3YfXI/qofFysJXs4G+0bZb5MCN/F
	5Xrj/LeXB240uyGvY41aTi3p0MI3FDP9eoQJZJ9PXBsqq/0DEyt4+w3UN7h/TMJncnrR3u/jEqn
	F9FQKDyA=
X-Gm-Gg: AYBFou2KK7gZ5OU+IkTtQm5cIDlnQkNpysHknpOTdKQixkJ/wSG7z+UL+NnDSEannzL
	mwz3R+HgmbnKCQrr9YNVCb4DKYONWnMhTshS2CdrJhXOzZvpO3SLOtn6Y4IX0LQCWay4zKidrAd
	uR8Qg0X6j+e6X/y62C0Q7uOE2lczglFQqw+zpRjyZlvoBsowWop9m3iFtry1rLt/WXFRRkEEmgu
	OafvEQCXHOaT0jCK6kxxHIpprVgLXWMTttg3NxwSkysyapbCKl8rjt+sQ4pI3KXbvCvu6DhTaWq
	u1eV5bKOoImzydfhReWkXiJuTZrbdg9uSflJup9bmBT9z0CVo+vpd1Fj83P+Pl/0BUa2GYJDVGq
	XD7BaSLmhfMiEplyk7FW9mpvOLhax+w7cE0wbKywkSzL1mpFVHX8msaAD88FXQUKXRFj9gJBdkK
	aU0jsulSy6Cy7ccmw4M4ltomNwxgHqtLouBLdg9XFyt6T8v0RXiFO33DgHkIcowXq//fExSJbAg
	WJWkOQgHS4CjOS9yCxJZkQugQTjblINzpV7Mf4kw0h1hc8tRIzrI0bdn/hcZ42hh/W0ZrJsPzEx
	/7Ph9vBH9w==
X-Received: by 2002:a05:600c:4e8f:b0:49c:fc6c:be19 with SMTP id 5b1f17b1804b1-49fc574c2b9mr3201995e9.31.1789682879445;
        Thu, 17 Sep 2026 15:07:59 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.07.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:07:59 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 20/79] sbom-cve-check-update-cvelist-native: -> 2026-07-23
Date: Fri, 18 Sep 2026 00:06:05 +0200
Message-ID: <d46757f6713ab8136de64c9a533f5450d51169b5.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246115

From: Tim Orling <ticotimo@gmail.com>

The diff is quite large, but a partial comparison can be seen:
https://github.com/CVEProject/cvelistV5/compare/2026-06-24_baseline..2026-07-23_baseline

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 1323691ceab2a338c4d5b9c15624b8d22c472e7f)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 ...24.bb => sbom-cve-check-update-cvelist-native_2026-07-23.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/sbom-cve-check/{sbom-cve-check-update-cvelist-native_2026-06-24.bb => sbom-cve-check-update-cvelist-native_2026-07-23.bb} (89%)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-06-24.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-07-23.bb
similarity index 89%
rename from meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-06-24.bb
rename to meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-07-23.bb
index ca192bc9cf3..0e664d89e07 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-06-24.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native_2026-07-23.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/CVEProject/cvelistV5"
 SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "cvelist"
 
-SRCREV = "966bddf787997b471325e065cae82702a60c64ff"
+SRCREV = "7a274ec07043f54c07d0a3b5c7fc89ba5793f023"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>.+)_baseline"
 
 require sbom-cve-check-update-db.inc

