Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C82ACEFD1D
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 23:01:28 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2905.1767740481316819794
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 15:01:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=mMZlTBXG;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47a95efd2ceso12880855e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 15:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1767740479; x=1768345279; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/q6sUbU8uHMOPjj11flh+L+IeCLfhsF0vvcsJXYY78=;
        b=mMZlTBXGFtaMytS6Pcu+amX5fwPX7B9AmzEof345zGXw5mKBMZ1kryPUo7nUssuVL6
         geYPdV4Nr/rlW1A3rhp7g4BQ3N3/z8W+cGKF6ZuUDBIY2Ra50czbJv+G5pcByR596T91
         Whyie0lStuuXWkaBOsmzVY0KcZIxkgX/csRZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767740479; x=1768345279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b/q6sUbU8uHMOPjj11flh+L+IeCLfhsF0vvcsJXYY78=;
        b=dPkwquVWbxrYs0d3EKV4My1f4DwchpKUjJOfZ+Huh/XijpCiub7YXG+oXFfcfWHQhi
         ESHcb9HULMpsC535vaE+F0JMCTnhIms6J424KypATvmJjWWucyEGN0qp5DoOAwzkOhoU
         x9lTHeOBBc8h4g/aLqfcTSMp3y7EqFnIb67jE/jkYYOqB7kLlNujb/14meQ0mo6ksySv
         aOzZTUfKw+J76JWtqUKll3g3ftZcfwINN1GDXPOJOIZa7dmurTEG7kiVKJuWWtUfCoYc
         s8DkpQNvFHJ1DP9gd5DRr+/lMyWQiFsvpZ6c2oDyiQhRZnPzIrJD5+96rLTd/ITsV7yk
         SgSQ==
X-Gm-Message-State: AOJu0Yy9KN7eyVdK4f0MPv8JD6yS5B0EMUdzFrBH7by8YkUJNr4qFixq
	jMIqP1KiZwjiPEQRACSrGFoHDTOPnGMXxy2mA/gpKyk5EOaqFIB3j9pSmrY9yhrr8/wGQFvuHfk
	3TOo5
X-Gm-Gg: AY/fxX6/oHf3wzFVM9W9tfvQbuIeAF6Hln5RHE8PB0v8l7CoYUj8sTK4u15P9kKbhtN
	W5N9/l645QGjvtpoze7Ui1quTKpewZeNRf8KET+xA9QhxyJewyfk4vMOrb+POByQGyAnOklpKsS
	88wpk/QDIMPXMXYrZmDJiVMSL9jhkKh8WpCnBRtx4ORaaBDgAck0eFLifFmAqIxBayIA5ZKkGbr
	pVNV+9iBBrs23Kn2lu3gjDGIUXY8nMYHy+/xoZskUCOxKUQCLgZ4yiFce+irS2D7QbaI5B1mwTR
	HI6qoUhVTVO6EEhZtb5vlW1wXwZQZV58eByThONWogIDeY211Ehc7HIlKeTqh60GNSVB/tmkcns
	6WqzGeUfU9X0fsoJIUVVfc7yJBC+Oo4qC3OmGokD/z+ZsimIvgEecEpZu7FbD5vH7vKNprgz1Qw
	AObpibnFTCRJc8iw6UAPPKViKf/MoTc9MKCQbs/ZfTLdx9s3/M62V+xZZGoKFsdkCVGDK8dj/ro
	zpcXc7aj8sbPIQ=
X-Google-Smtp-Source: AGHT+IFUAcxwPlXASfGLpVjLcZRYhnlo3s6REyBtjh91NVP3PllQ5SQXxTkyK8eIueVkS6cN/+uyyQ==
X-Received: by 2002:a5d:64e7:0:b0:432:86f5:18a1 with SMTP id ffacd0b85a97d-432c363510fmr661671f8f.0.1767740479348;
        Tue, 06 Jan 2026 15:01:19 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa006e79022da706e1a0.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:6e79:22d:a706:e1a0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee24esm6908933f8f.33.2026.01.06.15.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 15:01:18 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [patch][whinlatter 2/2] Revert "create-spdx-image-3.0: Image SPDX/SBOM tasks are retained for eSDK installation"
Date: Tue,  6 Jan 2026 23:59:57 +0100
Message-ID: <20260106225956.207106-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260106225956.207106-2-yoann.congal@smile.fr>
References: <20260106225956.207106-2-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 23:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228939

From: Yoann Congal <yoann.congal@smile.fr>

This reverts commit 3f57280caa7918f10e4e9685ad87a3128d4e9f0f.
This commit was not in master before landing in whinlatter.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/classes-recipe/create-spdx-image-3.0.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/classes-recipe/create-spdx-image-3.0.bbclass
index f070b7e697..636ab14eb0 100644
--- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
+++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
@@ -69,7 +69,7 @@ python do_create_image_sbom_spdx() {
     import oe.spdx30_tasks
     oe.spdx30_tasks.create_image_sbom_spdx(d)
 }
-addtask do_create_image_sbom_spdx after do_create_rootfs_spdx do_create_image_spdx before do_build do_sdk_depends
+addtask do_create_image_sbom_spdx after do_create_rootfs_spdx do_create_image_spdx before do_build
 SSTATETASKS += "do_create_image_sbom_spdx"
 SSTATE_SKIP_CREATION:task-create-image-sbom = "1"
 do_create_image_sbom_spdx[sstate-inputdirs] = "${SPDXIMAGEDEPLOYDIR}"

