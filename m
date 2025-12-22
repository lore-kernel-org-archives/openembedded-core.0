Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4037E69191
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:15 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87790.1766434091807241819
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=baQ5HGHJ;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b79af62d36bso755144066b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434090; x=1767038890; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mlsYun2EuOxPEaYYB+TyATcf8JxWBVm3oRSEHr66SOw=;
        b=baQ5HGHJa+t+nVfwLPpB2SKwYYPtKBL80ZZbz92npwSe9SyGf83SGCWwCuD2K1mG6L
         Zvhe8J6a+UXEjiCXB563tp3bY99thBYfPBYLJCbxZFr62STsBKdwk3x+5GgkYBgxdnTe
         eaknh6ZK4vuvkEmDoSK/6p20gbGS9qVEyLyC8tb//jmItl58fNqWxBG8ut694FvCtT/M
         AcyW3au+5RU8DKL+lV2Cxm3JwdGsHoZUdlMwRI9meyZDdNq9TT4uNPq/YdSbhfDMkTWV
         zB2YLukVJY7n+lVxEy+rfrIKEd/PutNCd4mmKS1SBrYvGLnxEAIVJd1psgz5OvcgWTFT
         vF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434090; x=1767038890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mlsYun2EuOxPEaYYB+TyATcf8JxWBVm3oRSEHr66SOw=;
        b=wwQZIWAuwy4BMJZ8Rf6Ot/MPwmzAXywun4QOEbxC5z5LJehnxlK92vVIImwqx/pVE3
         uzxOWHltdJjO4qtX6wHbICGq5s39/aKlvxKdlJmnuBg4RuVpm0IomyJbEyrdUgty8C9z
         ZAV6YPsjGRMp9LPKddCrGdnVpNsB94w3PYMA+jsMzpg2+gy8SkzTO/1WxQ5mK1ghu+UU
         SfMOynuZ1cm4AVmYv9Qe4jU/sjn9J9NOWd6ilN9s+SDZL7J2Ulhtldl8A32nvEdUdocx
         9TKAbQkm/um5+Guhi9BkkDf00G4nV94+nYgiPlhXNN77NtuCv9H6eQBjqC6icwZK589A
         ctuw==
X-Gm-Message-State: AOJu0YxaZtNibAKYW0gaWbfsMpt06+a4AejOOsexGBSX+k4cSWpnvJdW
	cOT0X4yOQ0Ur7PiCADEPHV9Fkyo5fO0NRY0AkKlAE1N2W13NnPVoSPPB1dkoKw==
X-Gm-Gg: AY/fxX75uYiorE/Y0Geqb7xVrOCv3mR33SzpqKJeojWqc+54CNx8Tbq1Pj7Qpwshtwx
	y9w5orRuJU1EaitifCa9b8QPFZ8YWnJHbtDO56XRX8ZBeRNr2q1l6ZpP4lMGMKmX5Ly6BSciFEi
	e6VlR+U29pEm6YtbMHg8rkS0ZkCc3/TcA/3RqLiU2Htj1DtePDsdu7fCDfOBCuMiFWK/8VlKK7B
	Yc4L5ytb1p7v6WsMf/g6sOnmADvSfqoRsCfrdvuApe/eT7r+mc/BorwM9c889qX5Gw+SjWbcnP+
	ZvrhwuJj8qlMwacNq7BV58n7nRr7vJDTYBWzVLPOY8QC4zZjGlFKirFh0181/lCSbgOxVOYYo1E
	tFefnT3cKQoByZPnuUY4QNodxdP+VnSTofQVWzw3xJjbjDygeE1itQWlU6rhVX3JFcpqw0upDFw
	5OYg3hYAFLlCtyAdmK8gGYK1fLsNW2rujHmR7Dap84suHPiEk=
X-Google-Smtp-Source: AGHT+IH/ki6Ldrg2m22zVM3d1V2bUur5frAcufvJnwIle3y5w8j7W7+3Ureu6EAHY3WysnMwhqNqHQ==
X-Received: by 2002:a17:907:781:b0:b73:74b4:f236 with SMTP id a640c23a62f3a-b803719745cmr1409661766b.46.1766434090049;
        Mon, 22 Dec 2025 12:08:10 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:09 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 034/114] libjpeg-turbo: upgrade 3.1.2 -> 3.1.3
Date: Mon, 22 Dec 2025 21:06:16 +0100
Message-ID: <20251222200739.2278706-34-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228359

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../jpeg/{libjpeg-turbo_3.1.2.bb => libjpeg-turbo_3.1.3.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/jpeg/{libjpeg-turbo_3.1.2.bb => libjpeg-turbo_3.1.3.bb} (97%)

diff --git a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb
similarity index 97%
rename from meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb
rename to meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb
index d4877bb92b..26e84ca42c 100644
--- a/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb
+++ b/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb
@@ -9,7 +9,7 @@ DEPENDS:append:x86-64:class-target = " nasm-native"
 DEPENDS:append:x86:class-target = " nasm-native"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "8f0012234b464ce50890c490f18194f913a7b1f4e6a03d6644179fa0f867d0cf"
+SRC_URI[sha256sum] = "075920b826834ac4ddf97661cc73491047855859affd671d52079c6867c1c6c0"
 
 PE = "1"
 
-- 
2.47.3


