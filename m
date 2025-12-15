Return-Path: <adam.duskett@amarulasolutions.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23509D5B172
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 10:20:54 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45239.1765794047940448215
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 02:20:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=EQ2OuX6Z;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.41, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b79f698aa91so58780366b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 02:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1765794046; x=1766398846; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HhltgnRbBHNpSyqpXMGoxPaBoPgCIDBhVHh6giEa310=;
        b=EQ2OuX6Z6EfEhZqIxoiUxAp0/LbBXtelVyJP74dre3FOB1msmabKmIgqN45RW5eScw
         uFtRmasDi546FOYeqyuCvYrvXchLDD1IsZccXSHR03rcDhpCugpF2Iaqpkn3VBmBRiqN
         P9Etvp3RRr4SGUA8ea9mBZ3zo7ioguc013Uko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765794046; x=1766398846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HhltgnRbBHNpSyqpXMGoxPaBoPgCIDBhVHh6giEa310=;
        b=ZZCSfEXr9tr+dC4mhXBc7QyQD6rbyhgSXUDQbqrVrw4RvsbZAmQRo2jQGLnYTV0Rfr
         L2+Xz02C5eyPDxSCGMtsy7gsb9/hUiR5S9JR6wRLuSh+5POqZ2kDRyxdykix4eAfoPV0
         N39u0Ep8QNFcQZipRnAUDlkE+mxloy4kA8PiCPj+2ZEFAa+1PLPyIy3str9uxshLxeYu
         Ub/MOmYJVvLZuygjxtnypHuzb16BJFiztMv3/8bA2HeXKjYqKYh835Xudrps8UhKPNL3
         d1T4iVz4d5bpn/Pqxl7rmqzpMvSZU+w/MRFP9iMpmMejKeDQOWDE+QtIwBu6cWIcN83X
         6iPg==
X-Gm-Message-State: AOJu0YyJtveXnb+1D8AB+Cb6zWO2BVkCWUNxOA+CED4ozahp2fQIXksM
	v0Z+h10NG+KSlu8+hSuchKgvBmYpT6j70kxDY9PkaT7PNyMSm2sFKSIPTx46PHUFnTQHstDNi7r
	wBhQS
X-Gm-Gg: AY/fxX4uDCLMFBun0RIZ9qNn0hlO6RoHipWaaQ+igmorkCuK4B/ySO8MahZIu/+2Wxp
	rlDRg0O9cUzlv//2eB/9/4NDx6Vxv4WlK2sx+Grxhsi2QLP9vv5pEOMX10JlsXdmVAF4DsfoOet
	uBcdGh2qkAvYZmudsWOOmEeZXyf6RU+owdt0rcZN8AOh8WNqy8mk2gPZ8ar+EsdXlu3UOY6O47g
	gOT3M61mcWgZgzSnxBpHWHT5JEdcFsvi3GmV5CfBAeVPAFatiXHz5F2Q5jpNrmloqVuPSyB83fU
	KURE11aQcCJSHEscE9OrGUbPxH7MmV9UGadI088wj4zHDT4esnHchda6d6a8euLMPm2s3PHhjkA
	Cm0fKcutocTQMuzbVaPefmaIymiFqb4QRJEvst5r+L8jCdmp6RdyRex4ikg8Z8fYSK1zRPt0Agx
	+kj9dgD86xL2eYr8+hrPhG2YIN+QsMc3l4ZeEd4452nR7NIk8OHLpKayD1Y724DueHlTD2yJKTm
	ldaFZVmvXprrcSRTCWEiqsFfCzNlwASLxhuj05AaXG4u94xg2E5xUQRBA==
X-Google-Smtp-Source: AGHT+IH8R6a3O7mp9uQRZtWtSbh6tgQ87gVP4t4OO82nw59QGxL7cjZDJXiM2u8JRQJr7yMX/AyHkQ==
X-Received: by 2002:a17:907:7fa8:b0:b76:26bc:fb4a with SMTP id a640c23a62f3a-b7d238af004mr644867866b.4.1765794046290;
        Mon, 15 Dec 2025 02:20:46 -0800 (PST)
Received: from adam.amarulasolutions.com (2001-1c00-8101-1200-3ddc-5bb8-0efa-16f1.cable.dynamic.v6.ziggo.nl. [2001:1c00:8101:1200:3ddc:5bb8:efa:16f1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa51757asm1357193566b.45.2025.12.15.02.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 02:20:45 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v4 5/7] librepo: add PACKAGECONFIG[sequoia]
Date: Mon, 15 Dec 2025 11:20:39 +0100
Message-ID: <20251215102041.1630567-5-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251215102041.1630567-1-adam.duskett@amarulasolutions.com>
References: <20251215102041.1630567-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 10:20:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227721

Currently, librepo compiled with -DUSE_GPGME=ON (the default setting)
causes dnf5 to fail importing repository keys. A very long writeup
of the issue is linked below. [1]

Add a new PACKAGECONFIG[sequoia] option which sets -DUSE_GPGME=OFF
and adds rpm and rpm-sequoia to the dependency list which ensures
dnf5 works with repository signing.

1: https://github.com/rpm-software-management/dnf5/issues/2539

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta/recipes-devtools/librepo/librepo_1.20.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/librepo/librepo_1.20.0.bb b/meta/recipes-devtools/librepo/librepo_1.20.0.bb
index 6557dda43a..7a2e9e6b9b 100644
--- a/meta/recipes-devtools/librepo/librepo_1.20.0.bb
+++ b/meta/recipes-devtools/librepo/librepo_1.20.0.bb
@@ -15,6 +15,8 @@ DEPENDS = "curl glib-2.0 openssl attr gpgme libxml2"
 
 inherit cmake setuptools3-base pkgconfig
 
+PACKAGECONFIG[sequoia] = "-DUSE_GPGME=OFF,-DUSE_GPGME=ON,rpm rpm-sequoia"
+
 EXTRA_OECMAKE = " \
     -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} \
     -DPYTHON_DESIRED=3 \
-- 
2.52.0


