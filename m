Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9890C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 17:07:56 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web11.450.1646845676496410174
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 09:07:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OSdrvvtN;
 spf=pass (domain: gmail.com, ip: 209.85.215.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id 27so2472035pgk.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 09:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Iky+fmOpB3hCwKAjspEECNzc9FoshB2RKfxEyA/VNZ8=;
        b=OSdrvvtNGioWY7ouMeK6rZQEdAWh3fh/JouQwpY7MS/aLC+rdbQ4xonFlgvclz3/RU
         hb4qK+nLAcPi6olU3ZvkFs81pq+WK/JutMIi4j58NGh0TJPmOB3/x5feVMTCqX+QS+xf
         P9txHpC3PxKfpUd2VUwJK/CUN10IttsGTEq8qJh0KtgN5MxHOKY01Sn7EjcpamKsUXZU
         8mfQGMT8wx3bURsrsl7M5ibWma19tyevtiIJXyAlbbafX8LISCV+CTESLFCFPRKBl++D
         st9RT5lr04vHw9EWaRtJr75dxaM2aJoe2xSOKLYIvPnRkbN5wUbX9J7TcQEVjFQSMAeD
         MoAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Iky+fmOpB3hCwKAjspEECNzc9FoshB2RKfxEyA/VNZ8=;
        b=oh5Q8mVZr7Ba3D43YMb6gHgToDWQhn+KuREWaRJGy6PvA3WJupeABZp3mqERZ226yt
         pS1kbkaCTtNgJpDPmOuCWbOwGlVW87nSRIamvs9iloA5BgzEr56lc15dcz4Vq8aE/riJ
         V/pkwp+eRt8P3+jovi8rUwnMxNh0LmLyLQTAXenXAYsIWTjxWMcUJyOmlotdARsK9sKp
         LrdhKqRfoUuZoAsnYmiS9Xg1/tk5EF687FBuwkRV23OpmKHGzxNBg/+aWwdFk5S7CBbd
         3rjwaIWYonrbY11MPmPHz7fi8TfYA4jhys/F2oWbUA908eMf9g99//5iarH+eyCiIm8H
         YKow==
X-Gm-Message-State: AOAM533+pC0A/FggGCXcWM+9gNJbHVLOb4pgk/ujBEDuyyOYCUa50E8S
	GBqu9m66yMLs+CVgZ0LfVCyVelq+KPy4sQ==
X-Google-Smtp-Source: 
 ABdhPJycpvuTc0sgutTzK5DxX+lkij6zUZUU8+Iz68/21vfPd5ptIWzh0Cy6oh2FuBOrUfMZ2g5BQQ==
X-Received: by 2002:a65:5189:0:b0:378:f265:982e with SMTP id
 h9-20020a655189000000b00378f265982emr581615pgq.582.1646845675696;
        Wed, 09 Mar 2022 09:07:55 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::ff3d])
        by smtp.gmail.com with ESMTPSA id
 s1-20020a056a00178100b004f731a1a952sm3940277pfg.168.2022.03.09.09.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Mar 2022 09:07:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] webkitgtk: Fix build when x11 is not in distro features
Date: Wed,  9 Mar 2022 09:07:52 -0800
Message-Id: <20220309170752.2892032-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220309170752.2892032-1-raj.khem@gmail.com>
References: <20220309170752.2892032-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 17:07:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162980

ANGLE's copy of khrplatform.h is not uptodate with mesa/khronos khrplatform.h
which uses MESA_EGL_NO_X11_HEADERS which is now renamed in newer headers to
EGL_NO_X11 from mesa/khronos headers, however this define is
relatively new and 3D stacks do not have this adopted but apps
like qemu and bunch of others depend on it, I guess they assume mesa.
One can argue that its better to fix the 3D stacks to behave
like mesa but this means every BSP using these stacks will need to
carry such a fix.

https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/include/EGL/eglplatform.h

This patch helps with that

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.34.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb b/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb
index 8cea8a86000..6870eed5259 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.34.6.bb
@@ -98,6 +98,9 @@ EXTRA_OECMAKE:append:arc = " -DENABLE_JIT=OFF "
 CFLAGS:append:arc = " -mlong-calls"
 CXXFLAGS:append:arc = " -mlong-calls"
 
+# Needed for non-mesa graphics stacks when x11 is disabled
+CXXFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_X11=1', d)}"
+
 # Javascript JIT is not supported on powerpc
 EXTRA_OECMAKE:append:powerpc = " -DENABLE_JIT=OFF "
 EXTRA_OECMAKE:append:powerpc64 = " -DENABLE_JIT=OFF "
-- 
2.35.1


