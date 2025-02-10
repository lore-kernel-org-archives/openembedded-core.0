Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E07FC021A3
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 13:38:30 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.49707.1739191862039661114
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Feb 2025 04:51:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J6yGmO8W;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: pio.lobacz@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ab795ebaa02so472817566b.1
        for <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 04:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739191860; x=1739796660; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pgXvXubrYD3i9brG6daJcLZELBOOY0cfe59iAc0HJOU=;
        b=J6yGmO8Wl42nP3oRQ9MNGxUPBJiqbZvrpT8oxuRuBLZmuZ+xEJ8Wf/NKCcXXwxucFp
         U7BuveeLlFWPT3wRB4+YglOAYQHsft8vIJ14pE1jQDwP/iPOxPo+YhOmxNQ9trbSxDDh
         NmcSmauKHRGLPHL16erhJomRO781AxBEA9ScKiXl/Mts5WGXIH9eC6m75BPyqvSxNePw
         Wd0QzTdO2mtqcrS1eNmvLlEULx0la8BQbIWMj713jEcQXD/IL3qLdNjvT+HxMeE7AkbI
         fQy4m/GaCZE3wB8qbfQm5ZAH292ZIWNrf+uyAVXZEE1e4KCD3PRc6iU113zBbIhZHuzL
         +Rjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739191860; x=1739796660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pgXvXubrYD3i9brG6daJcLZELBOOY0cfe59iAc0HJOU=;
        b=ZJAypWPKnTHnkqleY8X2PzaKNY2l6o/8Tx+0+W/5pHzBtrubcCaT62KX2QxTD/QNJ3
         U2Eq9vHSgFvy4+piLm1m9g2l6wLf4FJDPZnJXDBiD/hlz/mRbnTiYDXVZQWBetgxYYw6
         in7TDgTddkutVzFW+7/Vb2C5PAHMuXRlua6kWR6AVzNn1b0nxicXWxv4v73Pu3rL0iRI
         fLmrkNbbOUT7b4jXmW9bLQ/zH8Yd83oZy2kBo5Tm/rJLyap/AwW9L0wz6tAu5l7jM4XG
         AUQRx3dz/9+RlI7nFh1NevcmK/R/9c5wrc084oMKaUVYiIllShz71o9O3oYXzTDmG/4n
         cOzA==
X-Gm-Message-State: AOJu0YzJXoDaFnHkQBp/KzCn0HocSR5alz7v26j6qwVrp140yyrbuE02
	iWNlBDeeW30Kxl8+tvD0IVRgrmaAyx15yCAN5jGSmW4VuEl1jtethOKE0IjH
X-Gm-Gg: ASbGnctZiWCNr2VD6Jituh2M5V0ssB+5W0rtnU+ZUFS0hugraWGJOVFCGUEGySZ7QKx
	BIPirxutPPmB1mqpOyM9emtQ25c9rbACcEHQ7ugOpkWjUutHmohzBj4xKxvnwAKPExzG4S87Tac
	I2cr09m8yYNICnLCXFgIFXuYsevMxB+2QBifg40pqhqt2JMZls9sv/1sWK+OYzLxM1eY328eZ/b
	qimwUTgb02LJSXtGP3fJ1MipKzTH6wOrXOhKY0lXGHBR6xVEedyKKgjZZuTZB1Jqtwc05zB36/j
	Siac55WzLmXGTMasZA==
X-Google-Smtp-Source: AGHT+IGfV8WLzPN2N04SjIRNhD8ljTXWagJMLvnXt7x6NTYHrQU01v2ySm7suK1YvzgZ+mUkjJ9RFQ==
X-Received: by 2002:a17:907:360c:b0:ab7:63fa:e4a8 with SMTP id a640c23a62f3a-ab7897b37ffmr1199798966b.0.1739191860120;
        Mon, 10 Feb 2025 04:51:00 -0800 (PST)
Received: from latitude.lan ([185.53.145.148])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7c15cad87sm218559766b.144.2025.02.10.04.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 04:50:59 -0800 (PST)
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <pio.lobacz@gmail.com>
To: openembedded-core@lists.openembedded.org,
	JPEWhacker@gmail.com
Cc: =?UTF-8?q?Piotr=20=C5=81obacz?= <pio.lobacz@gmail.com>
Subject: [OE-core][PATCH] classes/create-spdx-2.2: Fix SPDXDIR affecting multiconfig machines
Date: Mon, 10 Feb 2025 13:50:47 +0100
Message-ID: <20250210125047.2644290-1-pio.lobacz@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Feb 2025 13:38:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211096

Currently SPDXDIR is pointing to `${WORKDIR}/spdx` which means that the by-id
and by-namespace SPDX files are created without differentiation between machines.
This means that for two machines using a common package architecture
(e.g. genericx86-64 and qqemux86-64), there would be overlapping files. This means
that the build of one can remove files from the other leading to build failures. An
example would be:

MACHINE=qemux86-64 bitbake core-image-minimal
MACHINE=genericx86-64 bitbake core-image-minimal
MACHINE=qemux86-64 bitbake linux-yocto -c clean
MACHINE=genericx86-64 bitbake core-image-minimal -C rootfs

To fix this, add MACHINE_ARCH to the SPDXDIR path used for the files in order
to differentiate packages' dependencies between machines.

This commit fixes issue repored by Khem [1]

[1] https://patchwork.yoctoproject.org/comment/13577/

Signed-off-by: Piotr Łobacz <pio.lobacz@gmail.com>
---
 meta/classes/create-spdx-2.2.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index ade1a04be3..9e228891ab 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -11,7 +11,7 @@ DEPLOY_DIR_SPDX ??= "${DEPLOY_DIR}/spdx"
 CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
-SPDXDIR ??= "${WORKDIR}/spdx"
+SPDXDIR ??= "${WORKDIR}/spdx/${MACHINE_ARCH}"
 SPDXDEPLOY = "${SPDXDIR}/deploy"
 SPDXWORK = "${SPDXDIR}/work"
 SPDXIMAGEWORK = "${SPDXDIR}/image-work"
-- 
2.48.1


