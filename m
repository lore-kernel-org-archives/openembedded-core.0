Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3462BE6919D
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 20:08:26 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.87684.1766434099729082035
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 12:08:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T/iRCWxy;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b76b5afdf04so633105166b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 12:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766434098; x=1767038898; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZgVHN+J3OHcWyP0kDPfRCLXyMnCeAnIybAJe7DlHrWs=;
        b=T/iRCWxypri8A2aougj9s69CXXUIx3iPFFraM9+K/DxTKC/oIdzxav/XI9DdxZIf+R
         UI45/kOK1XRsyHuFC2lrSs1LPnEoLuqdYgyMXDjtaGw/sC8omswazkz7e/DIza0ciQ6l
         kO7tq3UJ1Enf2RdYoGQ9MxSDmnz7yYv/VJzKSKWDGzBbCLNjUkwBoo5CIKM9IRpqf5Nb
         bDA9JpBkIOk+R2Zzgka1rT7a2mkzAdfMHJMFpMYjy+95/QkjPRRlAVzh+jthGqvi/LM3
         tvUCvsXO64x3bBCBubTPPx7Yz/FRG1yaoaqee6B+zJDSELTxOYaKlJuBOlMtrorrXbCA
         rqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766434098; x=1767038898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZgVHN+J3OHcWyP0kDPfRCLXyMnCeAnIybAJe7DlHrWs=;
        b=iTBs68o/JWYt6nOAZpvmizz4hCXzXmsrGaJ+4XTspf2h+4myY5V47JuB3bBI3xAeq1
         jNxg6OxdjwMfSRwZTcVO9YLy9aSi6OLKOa8tE5ZRFYALBv6+1dD5+L347PETQ48SujAP
         Xhbr1BRwN0cXAzvLSKKlKx4DzV0MlmG7AKS8H2ujwlkCSnUJ5QDWsjbg+YSSxwS+55U2
         oHGQ/x7Aw/as0uiDsyz/MYUdyH5+fZGmvJoaihKvL2GYUITQY4CoReY7FZiFfy8VxrGt
         3+RtvB01nXvFTmiRgvFHCNLbSvWGE4K8GUVim1DRslO9vhyKA4Ef0UR4XIaLnxy7Rb/v
         czFQ==
X-Gm-Message-State: AOJu0Yx6GaRJiXGCxctas/bDxXxXmqiYhS6qtBPvMXv4YbFkQC4yTgCO
	9wEMoKYnI2YFFFhICSWv48I8vvjYGdI60SbUQB0eaccRDmbGFF87Entuzl9FDA==
X-Gm-Gg: AY/fxX4DIE6Q5+vk2bts0qFCvv9HGZlT5MJQPrp1EjVprzlSLtzSGzg9Wgy4d0ZTPS6
	6Qnrwgv6YRuOSgrGV48JtClMCq2B3PuBQ6QJY+ynli6jINxNQx59hgybEz+k9WjMo7B330F8YR6
	/COMlWVPkjc7nbVJa0xp6R88DmYMAbsnEV85iZcmBA5Gix15agYFBkp6xJQrlCTaSr866k25EWw
	bBHEjocnQTEZ2B4Ud/9OCo68GvGiS5KFkM6aO3UJiHtITeQXsO4ySC/lbQWTjoozg3zm/nnXH63
	daJGHseIi7OGHy6sf/rzNfQt/hkOEXaZVyyL9XeN03YFp1MavvMqw59xBEj02j6/6NzpgHmDijS
	B7N3RGeuPoCYXcLmrCpCs7Ao0ss8mtBiBOM8S1of6/PaDXjXFiT366XR/hR4e59uPJmU01qouvk
	+sDcWkS+rcwXVGcPa55kCGU4BcrWUqjncbmPvaG2w6bBEexnM=
X-Google-Smtp-Source: AGHT+IEKJQTZyG3AoyLZyvEh7+1Los9QNY7YQ2P4jZ9aRGV6rS6IHD6Agtm/t7bYjUnFyI67ISd5eQ==
X-Received: by 2002:a17:907:1b12:b0:b7a:1bdb:30d9 with SMTP id a640c23a62f3a-b8037233de7mr1099868366b.65.1766434098035;
        Mon, 22 Dec 2025 12:08:18 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f3e271sm1182344066b.60.2025.12.22.12.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 12:08:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 046/114] ninja: upgrade 1.13.1 -> 1.13.2
Date: Mon, 22 Dec 2025 21:06:28 +0100
Message-ID: <20251222200739.2278706-46-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251222200739.2278706-1-alex.kanavin@gmail.com>
References: <20251222200739.2278706-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:08:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228371

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-devtools/ninja/{ninja_1.13.1.bb => ninja_1.13.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ninja/{ninja_1.13.1.bb => ninja_1.13.2.bb} (94%)

diff --git a/meta/recipes-devtools/ninja/ninja_1.13.1.bb b/meta/recipes-devtools/ninja/ninja_1.13.2.bb
similarity index 94%
rename from meta/recipes-devtools/ninja/ninja_1.13.1.bb
rename to meta/recipes-devtools/ninja/ninja_1.13.2.bb
index dcaa889c04..e750c78c46 100644
--- a/meta/recipes-devtools/ninja/ninja_1.13.1.bb
+++ b/meta/recipes-devtools/ninja/ninja_1.13.2.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a81586a64ad4e476c791cda7e2f2c52e"
 
 DEPENDS = "re2c-native ninja-native"
 
-SRCREV = "79feac0f3e3bc9da9effc586cd5fea41e7550051"
+SRCREV = "3441b633c2fe2c494e958780ba0f4227b1327634"
 
 SRC_URI = "git://github.com/ninja-build/ninja.git;branch=release;protocol=https;tag=v${PV}"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
-- 
2.47.3


