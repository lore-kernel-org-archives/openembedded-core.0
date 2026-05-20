Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E8DCD5BB1
	for <webhook@archiver.kernel.org>; Wed, 20 May 2026 08:21:12 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7278.1779265262240810877
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 May 2026 01:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=o6H/q+GJ;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso60267725e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 01:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779265261; x=1779870061; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7e3baXU966NXPvqcW/VR37EGm4oDAwNd670im0ikUIY=;
        b=o6H/q+GJ7gC0q4hipRTO2XUm8NeN1on1fggrJCqXDf0JbVhWBT5RynruCfz/gIOFTs
         7SC/sDaiWPCAYk7O6f8dU9bTyh57dCDF1l+X4c83oeEz7+zv1xmijrhIL5AYbLt8mpTY
         YWIxFAHP6N5La62iW69OcoLZwk66wkMUZyM+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779265261; x=1779870061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7e3baXU966NXPvqcW/VR37EGm4oDAwNd670im0ikUIY=;
        b=oUynqXNwae/uiXKpkKeydjwLDGadNoG6+YzMC0obTCIakvfOHQiulJ4JjePEsFvBQ1
         gEDDuXDorDYDyeGUu3HYba+NabRtED9mf4Iksfg0/XDuo5Y123uxV/5HcN/aJsI9vxQE
         zofDQyM6ik1WZpdQ8m9g1RVm/QSZdRGmi4D0JHCNXYQam8BspDOO0i4j/bFo6hUKOrHO
         rsJKNtX6Enh5MyqA1qM9m8Di04XW7gqP+m4F2m/YY94aNnZhuD0d5b6Xv/GWvfqaalRS
         jL/glGLa5lDJTVvfO822kLqwAZ82M9fdUx0McqxDdk4THJ9NxoD+UuJyjlS8zHrrzxPS
         TloQ==
X-Gm-Message-State: AOJu0YwVdPZ1g0AlxNkMapDL88gb/JahKP8cLUG69cG6CxuDCoGCDOL7
	yDy+CAeS2eCryBZ0DfePrXAY0l/x9rdnnyHuTgOYM4e+q1PM4sWywK8n98u6q9OgtRRbxpJdSE8
	bMSg/
X-Gm-Gg: Acq92OF7XsTsM+xkfOBvIAmAmC0Ni90/tMa+/JpS1bF//ji122zMYlI08MSEiYzr9qA
	XQzTGu9PgmlmUnvbKDNUYW+CH30c2vJli5ESKoOgz0xgQQB6xw61NuS92+b7MfQUIe0xpvIiNuX
	a0toVIRdnd5xNfyp6nKyTgj/OUxs47v8bUlwI9O8O3F5nu28xwlNXa2OLMutqnNwJFJ6F6k8lnX
	KjBmIczfr+b7eRgZ9jrxHoEMUq65S54oEiaUTC+AzgdDJ9C85ARBA8JdacbjbRiCU53/utQWXBH
	iGe6WyO61FHngjEGWx0NQcP4Pw9/e/QojYRXg2GVLDLJgdkKDbRbxskuOHwa0oKFwja5SaiLq7T
	rNwpbv+BKIvYgXfT4sXBTA5D1nDXjinn4HZbUGGYd7MOYb676va52+4aHMmwRr4ifr6KA/S2Min
	0+UbvIqnL4VVnurxmY4OzFP/jIjCVonrF4RONiS5hYNpTAoUDVLka5uJJrn13r6GmzBkoBkjCO7
	DiF0KnLNDJywLps2B9xhJCzjsVtg8CumnUNAHES6IK5KttOaw==
X-Received: by 2002:a05:600c:3104:b0:48d:35e:82cb with SMTP id 5b1f17b1804b1-48fe651b2a9mr336564775e9.28.1779265260604;
        Wed, 20 May 2026 01:21:00 -0700 (PDT)
Received: from localhost.localdomain (2a02-8440-250c-63aa-0256-2b9f-d16e-d784.rev.sfr.net. [2a02:8440:250c:63aa:256:2b9f:d16e:d784])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm56350642f8f.10.2026.05.20.01.20.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 01:21:00 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose v2 07/28] sbom-cve-check-update-nvd-native: Update source revision
Date: Wed, 20 May 2026 10:20:08 +0200
Message-ID: <9d3d22ca591c13a84a9210779d03c0c7cc91d062.1779264709.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779264709.git.yoann.congal@smile.fr>
References: <cover.1779264709.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 May 2026 08:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237406

From: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>

Update source revision to v2026.05.07-000006

(cherry picked from commit 3724b93538d3acbec9f48d4c524b51d166071708)
Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../sbom-cve-check/sbom-cve-check-update-nvd-native.bb        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb
index c868ba09c18..26a14e6eb16 100644
--- a/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb
+++ b/meta/recipes-devtools/sbom-cve-check/sbom-cve-check-update-nvd-native.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/fkie-cad/nvd-json-data-feeds"
 SRC_URI = "git://github.com/fkie-cad/nvd-json-data-feeds.git;branch=main;protocol=https;destsuffix="
 SBOM_CVE_CHECK_DB_NAME = "nvd-fkie"
 
-# v2026.03.19-010002
-SRCREV = "49f8bbe1b0b0884e16bdc37ab68db997085570a7"
+# v2026.05.07-000006
+SRCREV = "72d8841c8ad9083ebf6723063f275444ea0d76f9"
 
 require sbom-cve-check-update-db.inc

