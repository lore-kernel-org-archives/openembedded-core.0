Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA093CD98D2
	for <webhook@archiver.kernel.org>; Sun, 14 Jun 2026 08:04:42 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.105068.1781424273014319996
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Jun 2026 01:04:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XtTTMygS;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b915ded5so21723955e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 01:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1781424271; x=1782029071; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cFLRGv3qayv+9L6xVp4r2lQ16OYaTGfJSAynOuu83e4=;
        b=XtTTMygSgZmXO7RVCzGGEU95pkNVCAB6xRkHIVPeGOiDqkuUVQUC0aUph57QmHslOE
         DzSzXRMfia+YA0xvRDG2jH0cvHkdLi7V2sOfmqnr6IBz0Adv/eylqMdWSZ4E4JLESQc5
         znd5gmcV6CCi/2L16J4S18T2RXIEfyb6SHBF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424271; x=1782029071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cFLRGv3qayv+9L6xVp4r2lQ16OYaTGfJSAynOuu83e4=;
        b=fSFZPlzPqHQn9q5MeoKzDAsewX3SQqBs90Ad6bvEP7pyKqQXTtro75jS4g0PkM29Qe
         y5yYPBO4CX/O0cc6hPfdckBY1MfLgQAMtbKQ/iGlgju7obU+kETOkImDGlj9GTJY6Edk
         fFydp14dU9nYVFNZ/Ho9venGd1US4SidleBQuS7XlZeQxjriJ83lKCcRpttc2TK32ViR
         EDN/wHz8gjzdCyx0WrLChi2hxAAFs603DxelRMj4T86ETId2cf6BRgl4sewdWcCBppZ0
         ck19ya8+WaWQNRHzVIBshNRPTt3BxDGVbwLYmh2ZUZQJGUOzrO2KdO1+Nv5zwJ+9Jmw6
         6h5A==
X-Gm-Message-State: AOJu0Yxx+0yvdrhoABRmj/z+Ogy07dSW5X96lm3Iq9rC8lUjbHTynpj/
	0BA3sFk79u01bU+jVATpeBfE3Ln3xdbMFA38PkslU/yxCSBSJ2te0rsHGzFB+CW6dAcW4WdAob0
	+/0Y6
X-Gm-Gg: Acq92OHq8ztGuRTv++I1B1cbYBfAzm6FYPaTlVBgM0StLZlnDggViWaPkEy8ZlMOohO
	EvdQ2pYmPlEWO+tdtdNm6j3IC1ozX17g3ajLUTK8el8QZWJjvjB9PGgVcuEBQ5fmjJqi8KCU9wS
	Zt9Qfft/4OfnU5XhS+ge4qmLB9btNgW3cCChNY+YfztXC3HScqQwlQhkUZexR+B8l4WbqYjJg0I
	D3Yr87F/pfw6FcZhhh+qzDn/djFaQuvw0e51g7PXdaRi1WIohnDM2Z2WaKj3R1gaVfARxC2b0ik
	zwkuWrdoJHsMOMcrnLicEvN2SeWvdwugqm2K+cyozkUTZT4bkiWzKuytvoWlFQJqcd16W/BhhpO
	nazwaEN1X0g+WyBYR+fV/JLRLnRdL8g3N1ouvfoFfX6o3LCH1eOk1WzrSH2tIx3d0dQSTuRibGO
	5ffBftLgbxJiz7ZxtJOqn5XnuiS1aNZ9ULxfSmYTPSAD8BbzCAwdT5uYmeIjrt6/E=
X-Received: by 2002:a05:600c:e54a:20b0:490:e190:38f3 with SMTP id 5b1f17b1804b1-490ec504dc0mr78389435e9.21.1781424271276;
        Sun, 14 Jun 2026 01:04:31 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b23b:4f5a:d2e8:6789])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492202edf89sm149999065e9.1.2026.06.14.01.04.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:04:30 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 54/56] vulkan-volk: upgrade 1.4.341.0 -> 1.4.350.0
Date: Sun, 14 Jun 2026 09:03:05 +0100
Message-ID: <20260614080307.4017177-54-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
References: <20260614080307.4017177-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Jun 2026 08:04:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238738

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{vulkan-volk_1.4.341.0.bb => vulkan-volk_1.4.350.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-volk_1.4.341.0.bb => vulkan-volk_1.4.350.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.341.0.bb b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-volk_1.4.341.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb
index 144e44969ac..4541b71a982 100644
--- a/meta/recipes-graphics/vulkan/vulkan-volk_1.4.341.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-volk_1.4.350.0.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=cfcbdd69e15396e371f639c69acf40bf"
 
 SRC_URI = "git://github.com/zeux/volk.git;branch=master;protocol=https;tag=vulkan-sdk-${PV}"
-SRCREV = "d979819fd03de3a7606d6e23d6ff4968942599da"
+SRCREV = "3ca312a4f38baa63d8006b6905abbeeb89c8087d"
 
 REQUIRED_DISTRO_FEATURES = "vulkan"
 

