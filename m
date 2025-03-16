Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B112AC35FF6
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 16:12:52 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.31801.1742141569395971026
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 09:12:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dozSRLCR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso12281605e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 09:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742141567; x=1742746367; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RJMLIzSTX1wlj03RW14GM1yARSbUikR8DfwlU2EjxcA=;
        b=dozSRLCRBPfR9N+vu1yoQO75P8myMbTnbyST65H/ncNDHOCzDgUq4gmoGUB8iWzORx
         70vFVRRzukSpR5qd+oqmhzBdP7lOtnzCt8oqKMFkFSHELYYvJBHO+spaWtuhHUiNBD+w
         OpxtxtjDx9xHZQOm/bdCho3tgK4wfyUhMF2S8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742141567; x=1742746367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RJMLIzSTX1wlj03RW14GM1yARSbUikR8DfwlU2EjxcA=;
        b=QCkI9nZG4CikVF2BxPlhO4oCpp8RUHZfj4t5OC/NZLbkvKaJh7LFXXa1e1brAIcMJK
         gVpuVwUwHDbREXkvUvXe9nO8r9pJyY+TuYmoMdlYbSDXOx/Ln562FLHnw8EauZmMhayW
         dfshyvymu8hPaCA7lK9lEohh0mwriIDur5iDrKhAJcSJLQsRrEXWz9EzBCbYDncGYcz6
         Jvpa610NQFRjv89ngDAmRon7rxHtLsy+1o7wvFUUDDyJA7aAvY2a4eipG7P7bzUdmLVo
         bGsrqAyMoyuL2s3D+DVy9kaJ9a8wgCKF8wAsI+WXOnl/KTc3vhh4sEZN8d5EcgoeOtTt
         RblA==
X-Gm-Message-State: AOJu0Yw00vguuHXFu2ed56xDi8rcmotiQle+U81HLK6rKn2Zx3GEEQ9s
	4E9N9c3D9Zusya7sZhpmPk0DVJS6+6890kgfbo9DNM9I1p2k8n83yzw53GOxaE09D2gyoHhLpkb
	T
X-Gm-Gg: ASbGnctW0MtpUYwSnlYEO5ouMJmRGh3DuMn+pbrRWufZUN3rOWk4NIzQqR6CLtKpNvF
	anniEfmm0JVGufnX7CZTxi0t7h85fVwFMYCCX+LKX8Q5ukpNLF07B3Sonv9vcgpRsYaramf8hN9
	80rX8OD1Y1Xo2xDCUcB2ySTtRDQXagaUXgiAilMpUNqGQJJ2Ym8IcLiMfsyinVxi4phGrAI/yrX
	69za46nUwBWF3VxRATG3tmnqY6ZF9WPzxq/Fz342PkFpnPS6oOckXjKb9XLkaBAwNl5P4EhO/Zo
	dxfSHwjz7Af7hK3oqnnsJS4K7Nbo0ZyJEwCzozAy0+F0049mgsQI1C5B3NqcQP9YO5gy9qC0nA=
	=
X-Google-Smtp-Source: AGHT+IEiPUmLryJjyHN4j8P10PYROQI5YnIxf6/bNmgh9JaAKLik2mtm8R621oyOVOpVxYtbryCx6w==
X-Received: by 2002:a05:600c:1994:b0:43c:f575:e305 with SMTP id 5b1f17b1804b1-43d1ec825f3mr92424485e9.8.1742141567360;
        Sun, 16 Mar 2025 09:12:47 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bead:7cef:d139:9ec0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200faebbsm80252225e9.30.2025.03.16.09.12.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 09:12:46 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 25/43] python3-scons: upgrade 4.8.1 -> 4.9.0
Date: Sun, 16 Mar 2025 16:11:51 +0000
Message-ID: <20250316161209.3629986-25-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
References: <20250316161209.3629986-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 16:12:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213028

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../python/{python3-scons_4.8.1.bb => python3-scons_4.9.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-scons_4.8.1.bb => python3-scons_4.9.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-scons_4.8.1.bb b/meta/recipes-devtools/python/python3-scons_4.9.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-scons_4.8.1.bb
rename to meta/recipes-devtools/python/python3-scons_4.9.0.bb
index 8f5e268af8a..2163d4b1a34 100644
--- a/meta/recipes-devtools/python/python3-scons_4.8.1.bb
+++ b/meta/recipes-devtools/python/python3-scons_4.9.0.bb
@@ -4,11 +4,11 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d903b0b8027f461402bac9b5169b36f7"
 
-SRC_URI[sha256sum] = "5b641357904d2f56f7bfdbb37e165ab996b6143c948b9df0efc7305f54949daa"
+SRC_URI[sha256sum] = "f1a5e161bf3d1411d780d65d7919654b9405555994621d3d68e42d62114b592a"
 
 inherit pypi python_setuptools_build_meta
 
-S = "${WORKDIR}/SCons-${PV}"
+S = "${WORKDIR}/scons-${PV}"
 
 RDEPENDS:${PN}:class-target = "\
   python3-core \

