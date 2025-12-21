Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB93E66886
	for <webhook@archiver.kernel.org>; Sun, 21 Dec 2025 21:37:56 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.68802.1766353071577780423
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Dec 2025 13:37:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=eBB7Mbv1;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7ba55660769so2635066b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 13:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1766353071; x=1766957871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RP3TI/2OdHDsIEKsrg9zqr4yse1GjgH6zKVdAYoRSxo=;
        b=eBB7Mbv1g4SXcfKu9VnScujfzPnLzP2Sg0WMv+Oqs9/BJHBG7eAI0ixNuLM8T2GxbH
         C7kkl3u1k43TdoliAZt4OZjL7SwHBZoEKK/5zYOByXhOpXlXALT/eAGrDbaMjy0JXzx/
         6RSU6F3+4LB/+toeO1/mSY45e5wpiLFpl8XBQAFCR1TMFX7P/KdSNkglqAIY/USfbOQF
         5m74NYmKngv2b7oduxFVhe3JttK7wTsdizJWVxGy9s53D3J7U3paXhv2WgWgKvVmAHDo
         kwXU/zJr0HNv36KWP4k4jnCCvGxELYqkw3nt5F78vU7QC9zEGa5ujr91rTWXgvL3k5wx
         jOSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766353071; x=1766957871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RP3TI/2OdHDsIEKsrg9zqr4yse1GjgH6zKVdAYoRSxo=;
        b=QvrDj0B0YokOIj/qeJDxcoDeAYuTEigMal1Jjea1SDshR7Vq56KMQdYayUH3AJdt5b
         P1OFfBg40Jr3YEMlh+jZvqYVzsePDDL8YQL+EOdNxk1HQ8QtmHu8FTibwPHoeQk0IW5v
         Jz85X2YPUTtvLQTALIihComj6yzBc/ewX2VQayVbpofDoisHL4umBROBsQSphiHwRmPo
         gw8oErn6yVWwOncEGYWFUcNKqtdQcKwVVJ4cawDaXBRRi7s2cPZ3MG6jW6kWUPPjRylM
         3hAsuLrioUwe+CqxgR/cy+1GosNWD6o8LmFgFQJqjwXj84vmVbnwaKyyRI8igS7NGlWc
         PGLQ==
X-Gm-Message-State: AOJu0YzpYYYiJon0Pljzs4kzxhMiukX/syGjgM6SzO6qnC/0wHd7o68a
	OPprG8CIFHXgVcAp+WFdCvOAn/KHXULA6kzBdWVzKiFUSNi0BB5OaSf7j7zLedzDPDOofeWITOn
	YdbIJpkA=
X-Gm-Gg: AY/fxX4rlAN2FWCFOSssreJVxEcF2CkrW7ptIQWiSHSkG/IZntXjuYLv8clNPemcjqy
	3YnVLU3zteGs1fq7TT0qUpbK9qpTFCmJRB8sguwuwCphMMByA3jLqtVMiPUYHTZHbI9Wn7udqWZ
	1eI2/z97BQpvdYMa090FK+Dd8MSFaK71sSmXypP+drKtVKWaMuH/n5A1pZ8ht7uWyI5zTR28WsB
	N7Lp5Idmz2uOrvUKxdkGglgFJCv3dm8UkOmQr96FFspa3s5qEzj2U9mz8wzSa7H/ACRGGEkyhq4
	Q7Hfu7zKGRf+7K34S/7KvI7NDQZHf1GZn822FTw3Q0rhExlq7clzL2kKsU8DNeJshD6yKoBtl50
	yPbLEa/R265VaWL6jWkjUA+Xqv4b1/4dgsynjiXr/8SJSR8AE2RJlyX3ApaV9IyiA/R1qpCqLXL
	Ru
X-Google-Smtp-Source: AGHT+IHDulZsJ3E50IofqhH1pXjSqWlPUvp6nKPltclJhXkfIzDCD+H9en/4nDHU2JlLUubjWj46Dw==
X-Received: by 2002:a05:6a00:1da6:b0:7e8:4471:8cf with SMTP id d2e1a72fcca58-7ff668711e2mr8638079b3a.48.1766353070843;
        Sun, 21 Dec 2025 13:37:50 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:dd61:72c7:d0b8:fed])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfabcbcsm8211166b3a.31.2025.12.21.13.37.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 13:37:50 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 17/18] create-spdx-image-3.0: Image SPDX/SBOM tasks are retained for eSDK installation
Date: Sun, 21 Dec 2025 13:37:10 -0800
Message-ID: <3f57280caa7918f10e4e9685ad87a3128d4e9f0f.1766352840.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1766352840.git.steve@sakoman.com>
References: <cover.1766352840.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 21:37:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228275

From: Jayasurya Maganuru <Maganuru.Jayasurya@windriver.com>

Fixes [YOCTO #15853]

Image SPDX/SBOM tasks were running after do_sdk_depends, causing their
signatures to be excluded from locked-sigs.inc. As a result, the eSDK installer
attempted to re-run these tasks, leading to unexpected task execution errors.

Run do_create_image_sbom_spdx before do_sdk_depends to ensure all image
SPDX/SBOM tasks are completed and captured in the locked signatures.

Signed-off-by: Jayasurya Maganuru <Maganuru.Jayasurya@windriver.com>
Suggested-by: Joshua Watt <jpewhacker@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 11c5653f16d4fbb751b2a4ad4e477bbe779d6e72)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/create-spdx-image-3.0.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/classes-recipe/create-spdx-image-3.0.bbclass
index 636ab14eb0..f070b7e697 100644
--- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
+++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
@@ -69,7 +69,7 @@ python do_create_image_sbom_spdx() {
     import oe.spdx30_tasks
     oe.spdx30_tasks.create_image_sbom_spdx(d)
 }
-addtask do_create_image_sbom_spdx after do_create_rootfs_spdx do_create_image_spdx before do_build
+addtask do_create_image_sbom_spdx after do_create_rootfs_spdx do_create_image_spdx before do_build do_sdk_depends
 SSTATETASKS += "do_create_image_sbom_spdx"
 SSTATE_SKIP_CREATION:task-create-image-sbom = "1"
 do_create_image_sbom_spdx[sstate-inputdirs] = "${SPDXIMAGEDEPLOYDIR}"
-- 
2.43.0


