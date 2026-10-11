Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC4DCA9ECF
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:29 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23448.1791708084133088910
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=OvKpVNiZ;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-486e8faff03so389007f8f.1
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708082; x=1792312882; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BDdRS7kCUIBhCw9RXTcCVznzGMBUlGT9bbkVieSzNsE=;
        b=OvKpVNiZaCfOptNKYq5QGVnMU6hIXUj9bCPxYpUEar6ZErY6Q/eReyqAgMl3pLFoM9
         4iF5Pnw1wik7lwdoV/wj+8rH3VoyVywY//jpMK9eiF5tFpc0IvIwNyjMpHqI/guJ6BPc
         ZDf0tZ34b3k+dV9lrZTrXUaL25+gO0pGZrl3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708082; x=1792312882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BDdRS7kCUIBhCw9RXTcCVznzGMBUlGT9bbkVieSzNsE=;
        b=Bq0Pbp+cdQoqYT/R7APpO9I6huDuhAH2UHRQhRVwm483oI10uuMLhabinsqSjy2OWW
         c6Y/ZaM+nrV4Xux4MokuaxHP9xI6VAKZuVwCNjLn1yT9j0YoPgSoGhzc9AFv31PgoTES
         44hqpnrGuCuGx3DOB+//aLIgTcxKFYSdya51Ywuve8lYspM92OW7HJxAh1Em5xgVHJ0U
         Duu/n76SkImuM03VMbpqJ/jND2b6pT/pSfHFl5jo+MfdB/AOoZ/k1wegFCsGKCEpM19f
         Pu3UQRLM9gOdSufGB5i11J1Mus6OvGwqODg0nnAqX/3z0doP+plQVaDZ7N0MliRGBHwL
         jrjg==
X-Gm-Message-State: AFq9FYLDeQo/1U/CbVD3rdvAqSLVlHHUfTLg5h2QPxNJeqWLNdNuDzN9
	1/7HJmFwFc865BvGBa8+/F3HD16qbCtd3uvmSlcgJ0uL2pDEdJQEJSOM4xXUN8yRV5uIZ3UdiVR
	zdaoubwo=
X-Gm-Gg: AYBFou1OwqaDzEKILZOwW56ZNNytBbJ+Q+RvGUfUBYSjY9e2Qg4OCb2h0A+0qYwBsk1
	3IbXnA/wcqrDMXZQgHDBcT8hnhMOGIZJwCK5Gm837FEOF1QoTMNL8G6Vx+RHoYVvfnLrhtpzo+p
	rwZSZi7eFKjpMjaqvvXpaAbXgIqsrVquWfSlXw6J7piFkZnFHtLoNx76NI49ufn/NsgyPUnlLye
	FkgZBccbiJvX3EF1xs8gsxXyJhtv7PYlD9UVkdXLaqEA/ik9ek394YXD+hpPDMDu2Vq4Ad4ba5X
	RbpL+kWRRQDI1uZi5KOsRp0BsIUA+6Jl72jfJlGeBDiE5BNClY2kIVZy9DVwwDH1+LDIxx4DqT5
	/ParTsA7t44dkwXSwgQsnoFA57gf+0MJeeaqxKJ6e+lWlb4AUCDl05VunkYWq0/fqt2AgVIdAwN
	dVfUnvSfBR155VBbMSRalLWHg96vt+SdqvpAMTWpllK6AEqIVSrCa9x+jDjP7kfCw+QRloUHW7q
	f4RlgwEd1j85+23l0iV1bpciZJp4y7Bu5lcsKn2pP5AKbS/4YJFzZvZOMYiYJEgAfK8kqeIrg==
X-Received: by 2002:a05:6000:454f:b0:48c:69bd:e971 with SMTP id ffacd0b85a97d-48dbaadb133mr7611130f8f.16.1791708082387;
        Sun, 11 Oct 2026 01:41:22 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:21 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 33/60] barebox: upgrade 2026.04.0 -> 2026.04.2
Date: Sun, 11 Oct 2026 10:40:06 +0200
Message-ID: <2d1c214b939574f131f6ae728951b6d1fda5bf07.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247542

From: Lucas Stach <l.stach@pengutronix.de>

Bump to the latest stable release, which includes a fix for a
FIT image verification bypass, see:
https://github.com/barebox/barebox/security/advisories/GHSA-jhvm-7xq8-rvgm

Release: https://github.com/barebox/barebox/releases/tag/v2026.04.2

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-bsp/barebox/barebox-common.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-bsp/barebox/barebox-common.inc b/meta/recipes-bsp/barebox/barebox-common.inc
index f736ca68e02..db7fb25e264 100644
--- a/meta/recipes-bsp/barebox/barebox-common.inc
+++ b/meta/recipes-bsp/barebox/barebox-common.inc
@@ -3,6 +3,6 @@ SECTION = "bootloaders"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=f5125d13e000b9ca1f0d3364286c4192"
 
-PV = "2026.04.0"
+PV = "2026.04.2"
 SRC_URI = "https://barebox.org/download/barebox-${PV}.tar.bz2"
-SRC_URI[sha256sum] = "07fd3e3440c23e27d0094432f67827887fcc0e37d5fe24dc257c39b97c4294a0"
+SRC_URI[sha256sum] = "aa575d3ca4e7a8abe6b9796d0ff1d1ace43f86e34c627cc055ddb0a7ebd9dbe2"

