Return-Path: <osama.abdelkader@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EACE1CA0EED
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 10:35:32 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.10931.1755599732341924413
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 03:35:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YXapvfDD;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: osama.abdelkader@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afca3e71009so906991366b.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 03:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755599731; x=1756204531; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yu8y8TFfgXhz6nNjudGmibdiLw2VMTm5EtoO3UMIecI=;
        b=YXapvfDD9ZgBsQwj7I8TCqDv6bLE5jd8dnUdwxyDcmD/FIXbqCtdDc+6pFmDx7Cdq+
         a2EaFJKelagZIcQQsVRKnxgprnjLHg4z5/lD+c/UmTtV33MqCynjX8UtJs7f890MmEyc
         pNG6dW1GRmAlbTb0qbQM2p8V45b9sb1Uz/0NSAhXFS6/dg80y9yB952DZoLpeNhUcZl4
         hMUwfeEPgcA6jDQcZ9LnN6gRB64HHdbqXV6AbMe1tmyZivvh+uYxVs3T3YONifowvR9v
         E4iZ9CMDqoI/LpyfRBpbFu7o5LNLAcgeDb9h7eSvFMyOAJdW/6jx1ZjR2SRFAnpUvFGk
         TYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755599731; x=1756204531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yu8y8TFfgXhz6nNjudGmibdiLw2VMTm5EtoO3UMIecI=;
        b=st25QgpdKNL8HQs9AlF42hYZ0QvON5ki+vKwsGC/r6AE0h7Pj+7rrfgKL4v8FhQ/6a
         UfoBh2MEYPo6GfuBnCade9XC0DieodYHqLmil4dlpTU6kNCXWiTQogwptMurvT5binWW
         IJU27Gc7Fk8jYx/5sRwiXdrZutDDlVejXf3ZPx7lagdRFxMPCTLymOB1LUmKoDl4BBph
         hPFJVaiCz8UIhAX8EDnMihR8qDLrRCO7IbJSfBEiwA2+qQGTsjOT6yKCfLdul/8i/IKm
         Y3PLxiJv8b7hHtbJbuK4eMvKz7MBAOqBYnGTsi2cKWSA3zoZYu09T34d1KpL9mOv/nIM
         j8Og==
X-Gm-Message-State: AOJu0YyZC93pC+5eqa+838eOluuOygsu6bATi20lARvQ7SHj7LOLecTg
	NXh5tH8j05QZWkd06K8QOXnFGmnSd8oE6zQroWCLhAJ1YMLbb+kmB8bMElCG5NiP5SA=
X-Gm-Gg: ASbGnctGoBdPjQMx2o3kMM1G2cYs3tnouLW1MF/k2c2ReaNeyqRqoR+EByge/nZFFbE
	UU6zmZgoWlTmRmGB3sEm6vRcl6lj2cCanKhwwvAqWzdgv1Pd71suSe+Qken+6GI25ZWs53gU0nY
	8Owv1ONFPuBgVEM1EzyjMEaNhU5TMGl7uf5YIuDcfjDRIBtYXr++IUzz6b5IiGoTlKPBGNIoGTs
	5n7U/cTtvd57kZ4H1GI4N+v2ZqaddcZVJ5kpKnLNipmTD84IGoTcpvUmahv47WHMxGGILyPV8C2
	5smF5oGzs7/DTjhMD6JwQOwq8SZGFKyDs53Nb3syvjHgdkg8c64V3WUtOINevbURcavvC9Q2qnk
	phvjGLRehru0Hyu+BaOxcGor7GID7bRuS9PqkLpCwFE47OcJdKlZs2sGY0bPH6LN5TSWbSD8Qn1
	Zzx+aS2Co9+VznOkhV6r7atazUI4X96OMweNKCBA==
X-Google-Smtp-Source: AGHT+IG8q/ItbMoboWCAMRLwbOKRohYizjumnizmns3rv64jesRSQYpxQigxCJP7fTaYP395IOEX1g==
X-Received: by 2002:a17:906:f5a3:b0:af9:70f0:62e3 with SMTP id a640c23a62f3a-afddecf0d5fmr181445566b.15.1755599730382;
        Tue, 19 Aug 2025 03:35:30 -0700 (PDT)
Received: from DESKTOP-RK42V0R.localdomain (ipservice-092-210-202-008.092.210.pools.vodafone-ip.de. [92.210.202.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce72ce4sm979367666b.32.2025.08.19.03.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 03:35:29 -0700 (PDT)
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: anuj.mittal@intel.com,
	Peter.Marko@siemens.com,
	Osama Abdelkader <osama.abdelkader@gmail.com>
Subject: [PATCH v2] init-system-helpers: upgrade 1.68 -> 1.69
Date: Tue, 19 Aug 2025 12:35:27 +0200
Message-ID: <20250819103527.8497-1-osama.abdelkader@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 10:35:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222100

Changes:
Add postinst to hotfix an upgrade bug on certain newly live-installed
systems built using Trixie's live-build (Closes: #1111039)

Full changelog:
https://salsa.debian.org/debian/init-system-helpers/-/blob/debian/1.69/debian/changelog

Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
---
v2: add ";tag=debian/${PV}"
---
 ...nit-system-helpers_1.68.bb => init-system-helpers_1.69.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/initscripts/{init-system-helpers_1.68.bb => init-system-helpers_1.69.bb} (93%)

diff --git a/meta/recipes-core/initscripts/init-system-helpers_1.68.bb b/meta/recipes-core/initscripts/init-system-helpers_1.69.bb
similarity index 93%
rename from meta/recipes-core/initscripts/init-system-helpers_1.68.bb
rename to meta/recipes-core/initscripts/init-system-helpers_1.69.bb
index 48ac7792d3..c4843747b7 100644
--- a/meta/recipes-core/initscripts/init-system-helpers_1.68.bb
+++ b/meta/recipes-core/initscripts/init-system-helpers_1.69.bb
@@ -16,8 +16,8 @@ SECTION = "base"
 LICENSE = "BSD-3-Clause & GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=c4ec20aa158fa9de26ee1accf78dcaae"
 
-SRCREV = "78486a4a2a305170b66ce4d907bedadbaed10daf"
-SRC_URI = "git://salsa.debian.org/debian/init-system-helpers.git;protocol=https;branch=master"
+SRCREV = "592518fcedf96c9b763f214a9acbdc1109aaa385"
+SRC_URI = "git://salsa.debian.org/debian/init-system-helpers.git;protocol=https;branch=master;tag=debian/${PV}"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))(?!_exp)"
 
 do_configure[noexec] = "1"
-- 
2.43.0


