Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5922E9D804
	for <webhook@archiver.kernel.org>; Sun,  5 Apr 2026 14:43:18 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36093.1775400195185361668
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Apr 2026 07:43:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UMGnIZDb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d04fc3bf2so1795240f8f.3
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 07:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1775400193; x=1776004993; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JJsRcodIaO4xSBXO2hCfcxvKiDL6AIIBCRbvg0ZAVIU=;
        b=UMGnIZDbH5ICDWH6JiXykMKAtsJE1d4Ut6bZtYwAOf1TuOydUOGlvWFeFg+fiKx3PB
         bLB6sOrXL9e3uD+AIw/UxUq+uITfB2udr+Y2cin2gDukfhK+06Ee5ZKLzi4WL0ijlm3H
         MB02i42lDjcmxf8W2KuQk6fAsr4CJj+24vLqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775400193; x=1776004993;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JJsRcodIaO4xSBXO2hCfcxvKiDL6AIIBCRbvg0ZAVIU=;
        b=Xnid3GNL+h4Kyyn4YEIzijqanObHNnONbBiR8RnlbEhP2BY6skhDGq//TSEmhh/JWG
         8hFouyNBRewYj8C5ZRQdVIquI0CNC6P/Xz5M/hgOkYPagSHPEXKVoTq0YEguTD3aJAIi
         vT1mJkC6S8iPJjMR7dh63GyPx2Jz9z0UUbI/dKl/ubZeeLR3o7xMfVoaIHvCHI3CTdNA
         aR4cRS6OylOg65wZckzPUcuszr7VuPTEzE6cdXFvF2j3xo8FLSfavOeYIr2tUpMcMv1g
         d60hisAweZUOABY0x5L5SWiMJue0vGO1AZA3r+PYEjj/FlWBtN+aix2MDGLsK8/ZSULF
         5MYQ==
X-Gm-Message-State: AOJu0YygMsm7n19VNlip11bCxun9RgUUu4IUo1svdED+Tn5Kr6RdZ1nP
	n5RWDsrRsVMQ724642miyhF+jCHFpJxXUYuMQZY6RI+281Bdinfgg2c3WX8ZAcCxnd2FAJHCKcw
	sJWb+
X-Gm-Gg: AeBDieue+lVSELlBIyn8TqvJ1RB77a8rk4a+cHxKc9vDILv+3csSlS1NT0vKr1Ktz6I
	fZ3Ah2xybVVwu3YyquzA3XZC1IUhACBssvBc+ea2dm4MoewqQJNrVfFHLdv0TzLzJ13/gdJFQ/W
	X1QtygsG+kIEuz0QRxjsp4xXjwYOLSBlZR5f9EYVKAr8iAkoo/bZdRlTreVNeknigxS//bWu/zE
	6aDq9n04Ie32xaIggp4gUL9lZqLL4qbNDMUffkUrKjVwE2aieFbTKYeNlHNqS3ba8MJ3X6cNuZD
	LhMmCUqa7zV9a5McoNLmw3mW4JCOX8Uo4SivbnvNzYNjv76mCSYBfgkn7a4OejPCQz5tVqX9Q/8
	ui4Oesl2QJylhpTUYozyS3N3dtc0P9LO55KD76X7JYutMbn4YvmomQd8NmUCxk7+6OJsl0VAXiM
	hBbm0FQQOQjV8BSl5YHKNpIHnthBNNxttjOAXKrSh+pFe1DExvEGmG
X-Received: by 2002:a05:6000:2dc1:b0:439:c279:32df with SMTP id ffacd0b85a97d-43d292e1f30mr14586104f8f.35.1775400192862;
        Sun, 05 Apr 2026 07:43:12 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5e42:a555:17a8:9bbc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2c5468sm32474083f8f.13.2026.04.05.07.43.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:43:12 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] image_types_wic: Add files/wic to the search path for wks files
Date: Sun,  5 Apr 2026 15:43:08 +0100
Message-ID: <20260405144311.3734472-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Apr 2026 14:43:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234631

With the move of wic to a standalone tool, "files/wic" makes the most
logical place to look for files in the standard layer structure. Add
this to the search path.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/image_types_wic.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/image_types_wic.bbclass b/meta/classes-recipe/image_types_wic.bbclass
index f613c59b2cb..cd1131a7ccc 100644
--- a/meta/classes-recipe/image_types_wic.bbclass
+++ b/meta/classes-recipe/image_types_wic.bbclass
@@ -45,7 +45,7 @@ inherit_defer ${@bb.utils.contains('INITRAMFS_IMAGE_BUNDLE', '1', 'kernel-artifa
 
 WKS_FILE ??= "${IMAGE_BASENAME}.${MACHINE}.wks"
 WKS_FILES ?= "${WKS_FILE} ${IMAGE_BASENAME}.wks"
-WKS_SEARCH_PATH ?= "${THISDIR}:${@':'.join('%s/wic' % p for p in '${BBPATH}'.split(':'))}:${@':'.join('%s/scripts/lib/wic/canned-wks' % l for l in '${BBPATH}:${COREBASE}'.split(':'))}"
+WKS_SEARCH_PATH ?= "${THISDIR}:${@':'.join('%s/files/wic' % p for p in '${BBPATH}'.split(':'))}:${@':'.join('%s/wic' % p for p in '${BBPATH}'.split(':'))}:${@':'.join('%s/scripts/lib/wic/canned-wks' % l for l in '${BBPATH}:${COREBASE}'.split(':'))}"
 WKS_FULL_PATH = "${@wks_search(d.getVar('WKS_FILES').split(), d.getVar('WKS_SEARCH_PATH')) or ''}"
 
 def wks_search(files, search_path):

