Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB81CD5BB3
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 23:30:40 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.956.1779233433812909199
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 16:30:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gF/KnLku;
 spf=pass (domain: smile.fr, ip: 209.85.128.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so31922205e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 16:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779233432; x=1779838232; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/lvlWWciNdkQTmu+FRu1qwbpndXC88XlCU1DVPVxVc=;
        b=gF/KnLkuXXK6q+7QKW5lAebmxg+874VQ7w+oeQovbFp4s9UNecY9Yfp0bL0iBM3NX0
         DUEeYrkHOrjU3RqwdMAJXR95qtgR29R2fAWREPMFG4/7YZZYUCLpFXoYxoIDP2i7t8ks
         hQFe7l/qiGRSuHANnvWLDJCvrWAFOP8cmSaCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779233432; x=1779838232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9/lvlWWciNdkQTmu+FRu1qwbpndXC88XlCU1DVPVxVc=;
        b=jG7fhLFGwdlXSU+NvbzyFXgcqpFC7h8FyU+RIWXnP+6NE+ZthZ+yVDC41D05nUbD6P
         BfD5c3ZZEPIT43m3G0bm1vLSPbGVPH4We9FS31S4aZs/LwRa6xDJWcwlK+JeYbdI14Ld
         xG0mf5TcVSt1AoM0TA3aAOx3NJYZxpZIe+DFpKTMOisrjdQg1XbyzT1PqGPuwREkxKSH
         pZsU+GHHY3+BNOJ+s8tDua8ETsY1Brt4u5hHROQoWTgvy1sLYmDGsqPkoA+aR9kUwrK0
         hgHEH1+v8Ri266mIAAxe+DK5rYUgv3YJZcSXJKXgJQahl9dVh/OoutuZaXSmIkKQ3HXF
         nHBQ==
X-Gm-Message-State: AOJu0YxMNA9pPQ1Pd829uKiMrEWTo96vHoN/yWnySLLPuZ5CjUSYh88U
	2Lv7OSTEJ57PntbwwLUpFsP47dGVBykg1sXPAu2lpdyUquD8HVUsf/bnJdcAYrDuFmHhf0fbIjZ
	Y24o3
X-Gm-Gg: Acq92OHIEs7Hbuiy3ZHIBpQIhqxxQfJye/MMjRuD2O4F5SWukHT2Uh4ND/ZBYrsYr13
	+P+Hzi9Vx79X/WSDyN7XgCsXnoEE5dsgz4TLJmMEWIP8ID0WWACWXoewERstnIpDZkVVSm6q2KG
	nvkTd+dwjbrH+mXYsgC6xMXiFqUw2MHTVuUFvp9HIsAI0q4krdWRQ0Ax570QPDskEy/0MN2Wp/v
	nzLuKGmAFyf3t+vBawE5zUlzG9zv+f8yJJdhGFhX2qTM3LAahiMlTTAzuCpR/Qj2p3QkPYYttMf
	phydM09oXp4FvjK1PSSmDot7VSjVH/Rt6AqKHkKM71jIXng/qjc3dHjXhBTvd7eo0NdxPp4kN70
	c4OGaUs3K01ecSiJT0Ctb+A/Wq+rQnKzwT4j25VLLpn0DN0a5V3xG6/IXof3Nq00FneKv+Ddh8I
	rONeDcUXStuUpVKmgHtb28Tha37rCY+liUdNMkJqfWOCcIG6ipm6COUbU7tgBdE/akdFI6Q1RgG
	NfAbIQ4UScChx6kF4dqxyD7xUw=
X-Received: by 2002:a05:600c:3e11:b0:48f:e230:c3fb with SMTP id 5b1f17b1804b1-48fe6626a8emr326471865e9.33.1779233432218;
        Tue, 19 May 2026 16:30:32 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe5bc94sm224705795e9.4.2026.05.19.16.30.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 16:30:31 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 11/28] libsdl2: set status for CVE-2026-35444
Date: Wed, 20 May 2026 01:29:48 +0200
Message-ID: <e2ea9d60afddf38e5a8d4a7c4d22e5efd98a5e4e.1779232800.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1779232800.git.yoann.congal@smile.fr>
References: <cover.1779232800.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 23:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237358

From: Peter Marko <peter.marko@siemens.com>

This CVE is for SDL_IMAGE, not SDL.

Mapping in sbom-cve-check tool seems to be wrong at [1].
It maps both SDL and SDL_IMAGE to the same CPE.

[1] https://github.com/bootlin/sbom-cve-check/blob/v1.3.0/src/sbom_cve_check/products/products.toml#L1608

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit fef169063e49f516ea96e2243869808ba58550d0)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb
index 834cf096b97..2b583448ef5 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb
@@ -85,3 +85,5 @@ CFLAGS:append:class-native = " -DNO_SHARED_MEMORY"
 FILES:${PN} += "${datadir}/licenses/SDL2/LICENSE.txt"
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2026-35444] = "cpe-incorrect: this CVE is for sdl_image"

