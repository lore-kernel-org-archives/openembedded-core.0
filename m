Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 89324782B4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:16:12 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id 70so909806wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 10:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=dA1iN4RGzdZ0e5ftFeatCX9URfCyaLvFqHMW0DjgX0Y=;
	b=JfMbdjrX91S5LyzN3IwYIrJeP5Rm4vD2RmqVzq/Z2+wRma5MMp8F2WP8w5erSbAj7Q
	4thx+VWITnf4R0MHOul06T6pawdE/Ko97jnDn1ub81ltIZrbZBmc8CwN7KwAmYF9Yhbw
	mhJ/NdxnOs9uHA/tae2otOgncOiFDA6CA5rVQLly6wOt4TSsDLamdWZTgnb0XtUG7wfm
	R4ZEFZyj8wg2oWVjDoDhm9Hes3ZmyUfjTVxG9r5xEF33EE3CcEltBZ2IuSCuJNA4P4qq
	jbHg5H1xdf1nJv+YFlRh8mz6EuR4O2JP3Eugs7qRoA9y/swEpsynGVJSf5y79oQgtbeu
	3ZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dA1iN4RGzdZ0e5ftFeatCX9URfCyaLvFqHMW0DjgX0Y=;
	b=N6VbVCRBXV92utb8hHWsCK/9b/GQqEkg2/mCNWHGAdQ8u7nCNqcDb79yWxWZL8PEMf
	eH8LeuEoeKUGexJo//Ni3o7IdQUw+G0P7U4B238FQ3TVHb4xaWslqrz81uJMObKdSkJ7
	lbNS3eMVjq5rkmzvHIwAcNBzq6hLc3EGqvM4eXsC6Oic9/9UZHDk7l6MpJDo+o8nQVnJ
	tcIYrFj2WpSq4vLX3cauduRs/45kkb1/oNAS0Mc18/eIUgqYFlPd/vjej5hyL7i2tR1Y
	E2yAmQwHkOTCRpYHxUkkR44K7iUPBeTJcHSL45j+9O0OmgnpFreReOUnmudgG3U886Mz
	4ajA==
X-Gm-Message-State: AKS2vOxay2S9Lfwpx3s+r0bNYbVQXPBBonuONjDZjcl+hoUe9o4nI4+l
	OyKv2KauXQdXPxz4
X-Received: by 10.80.144.68 with SMTP id z4mr4201508edz.143.1497546972943;
	Thu, 15 Jun 2017 10:16:12 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.206.46])
	by smtp.gmail.com with ESMTPSA id i38sm363684eda.18.2017.06.15.10.16.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 15 Jun 2017 10:16:12 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jun 2017 19:16:05 +0200
Message-Id: <1497546965-25081-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] core-image-sato: drop packagegroup-core-x11-sato-games from IMAGE_INSTALL
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Jun 2017 17:16:13 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

packagegroup-core-x11-sato-games package is being RDEPENDS by
packagegroup-core-x11-sato, hence will be installed if x11-sato is
choosen in IMAGE_FEATURES. So it's unnecessary appending it into
IMAGE_INSTALL.

Even worse, it's causing the following error when x11 is not
in DISTRO_FEATURES:
| ERROR: Required build target 'core-image-sato' has no buildable providers.
| Missing or unbuildable dependency chain was: ['core-image-sato', 'packagegroup-core-x11-sato-games']

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/recipes-sato/images/core-image-sato.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
index 99dad11..b897950 100644
--- a/meta/recipes-sato/images/core-image-sato.bb
+++ b/meta/recipes-sato/images/core-image-sato.bb
@@ -8,7 +8,5 @@ LICENSE = "MIT"
 
 inherit core-image
 
-IMAGE_INSTALL += "packagegroup-core-x11-sato-games"
-
 TOOLCHAIN_HOST_TASK_append = " nativesdk-intltool nativesdk-glib-2.0"
 TOOLCHAIN_HOST_TASK_remove_task-populate-sdk-ext = " nativesdk-intltool nativesdk-glib-2.0"
-- 
2.7.4


