Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6198DCD5BAF
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:21:02 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7277.1779265261245762663
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0hgIF6Jh;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-453903ee4adso1635804f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 01:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779265259; x=1779870059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r4QbPNFNlo9az+eFASZc6qC/jQFj97YGYCUZSwuhQxE=;
        b=0hgIF6JhMUsk2J2rFRogecNj5nfs7uii7w7t5XL8F/lhWkEH175T/CG9er++FuFhaU
         LsKIkaQgU2FtCGyVrUA/ulqXACAkamPWwQZjy3jjkIggIzbB9s9CbKz64YH7+RvQlCVD
         CD2G0Fr3jRRMmJpS4wpQiWZzFSWpRnbdDFAfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265259; x=1779870059;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r4QbPNFNlo9az+eFASZc6qC/jQFj97YGYCUZSwuhQxE=;
        b=eiMqP+xyLDSOkbA66foPJvTBsq6yXgztxzCeafagjEHqL1IOmCXxbhfZt8HAKtlDVA
         fxbvETI6cHtFD1/50iRh0MnQidOZtNHfmsZZ0XcsX133W4uPBeX5LtgmPaHIUx33Jc4/
         GV4nszIOFmOH8QeKL4jshj8MdiDYJZ/w+ghGh5lhhFSWVQ3kYSetiXdOLay69B6au9Ny
         c+WcGxvHxgaFaeoDAXEMh7l8jZ/Q2kCHGXmuZeA0VoUuVWDJpFmIP/Ofx+rI9guw+zk9
         jJM1uMR9W2S6gwlhfJdZRGo8/DFfUcGfzaHn7MNlQpZdsosPtuulBZ/62eWz6WoMTV+v
         GQbg==
X-Gm-Message-State: AOJu0YxOVfmio2Izo9krTvFWyb49BXLoCxu/Bgk6XbAARRVJv1eby56c
	1juA7vsfAcJeFvfkdF082nVCN0ChhKVcvYheeHZjbPCuNfdymAEIeYMkJ2P24mY3yrrV5JigqlN
	BKI/2
X-Gm-Gg: Acq92OF6O4Ec+BeKWS+qpzeDUdIX5TBqpV614lkQuE0gAsAziOGQzlXY6O9f0FPebtv
	P/rEWweLR1SsaKhFa9c3iq3bA6xhuDyjh5vOMFG+iagHri4hcTnqwFDzKDwCkDWIBCZHBKCDhut
	5FWk+y2FAzPPm2FOrob0BOHG6E8sVVIvz0fYGGZFWT3d+l9AzrLweTydSeUjR35AgbqT7+C4Ixj
	yA+RBj5A/pXEABBlSVenpD2K+Fd5PyNamCzHI0S9/JVbRiROnv1XrLdH8doO1wK63o6fC3vGOFp
	XJMSxcuE3BqCu9x29Bg5EIb4txGSP+YfPNvQPNyEHeLfQJphnE+cLf2cRm3Aq1gt5BxvK913+Aa
	/WRu7IzcrkrDzIUwTs7Vzfk3eJNLxAa/rfe1V6ms49dG7vWx/REJ42LY9sc6Ko4bg6IHUD2ryYe
	gCVnNoYTkzAcdFhNZ2FEbv/hPughnsHT5AYOfWyzFl0yyIl4UCTyP+g0PiA7BtSrRsC+Uo89tU5
	il0jSSt5611zhktCl386GcMwzm9
X-Received: by 2002:a05:6000:268a:b0:43d:1bf6:927 with SMTP id ffacd0b85a97d-45e5c367482mr36781556f8f.14.1779265259285;
        Wed, 20 May 2026 01:20:59 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-250c-63aa-0256-2b9f-d16e-d784.rev.sfr.net. [2a02:8440:250c:63aa:256:2b9f:d16e:d784])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm56350642f8f.10.2026.05.20.01.20.58
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:20:58 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose v2 06/28] sbom-cve-check-update-cvelist-native: Update source revision
Date: Wed, 20 May 2026 10:20:07 +0200
Message-ID: <ff88f9e551c2ed66ba1749e1c6ab4542ee39da26.1779264709.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779264709.git.yoann.congal@smile.fr>
References: <cover.1779264709.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237405

From: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>

Update source revision to cve_2026-05-07_1300Z

(cherry picked from commit 30b1f91d2a8cb1df5d4a65d2b55a3d26ff76937f)
Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../sbom-cve-check/sbom-cve-check-update-cvelist-native.bb    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb
index 33871221659..3763e7f21f7 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-cvelist-native.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/CVEProject/cvelistV5"
 SRC_URI = "git://github.com/CVEProject/cvelistV5.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "cvelist"
 
-# 2026-03-19_baseline
-SRCREV = "ada54ee3cc8380820aa45e4996910bdc9dcb94e7"
+# cve_2026-05-07_1300Z
+SRCREV = "dd0e93c75034d0167498174c886a56729edc44de"
 
 require sbom-cve-check-update-db.inc

