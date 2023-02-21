Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0175C636D6
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 01:22:03 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.31857.1676942514229627399
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Feb 2023 17:21:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=U1jX5sNP;
 spf=pass (domain: linaro.org, ip: 209.85.208.181, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lj1-f181.google.com with SMTP id b18so2859274ljr.4
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Feb 2023 17:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ldc73VQusSknkIYZVOivYCr6GiZsan5jbW66rnD77KA=;
        b=U1jX5sNPSX2m5aDXq4NO44bIQ6WGW9wV0HcHOBe3MKnScRRdF2gnDn5fCXWVU7wIBN
         P5V9qSXuBPWAtABZoHHZO8gwgozRGM00HI1Y5CWlCDw0aAsvKc5z262SxotDxCXeNWtX
         Vabz5c1i4g9uqXTjVAR47ONYpumf758SC/gScaW2XiETe2w2d+uFJIea+6d2eNrUmGgz
         lUJQYHSI4Yqoc1KX6Lzox+ADo/L8yAPcsU545zEdIu9Ziu0MCGXHAkHtZcFW8V6zju5s
         VE8uUb/wzOcaQrKrsPS/z60aLB2A0SjV3L1HDVj00JnTu4LwpHZ11pdrjWiHtxcByWRE
         TpgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ldc73VQusSknkIYZVOivYCr6GiZsan5jbW66rnD77KA=;
        b=lIhAj9Q8U3IVg+QuFAZqOhIj6Dlmgg85cOuXWu8vHws+1c1O/6hnLfriJbabI3iq2V
         WOgpe79uXaDxjTp5P7ywnfjFhydyICgSxqOswSDweYmsyKGqZFUayv+yS+GUh/JH2g6f
         l1zdAm4tdr6eEo6VzcH6FIKzhPZGQSiK3rHpOQKyvsoXc9vcnQcr40SBSi8+au7LA4sX
         VsIC0ArUagjI0dq+zEDp/geYEvJxkStOO3Xqw0inmnGqau7Aggb7BgjJvRBflAopBF10
         hyoiGGf2BR3B2Unx7Za3K3J5JWEiS/ARD8AVFw7iHm81hWLaF8ih96jzkSUKrRYT2rfk
         8Gzg==
X-Gm-Message-State: AO0yUKXHlFEUHFZydPgcBRmmFO0gTIlxjEiKGTTj0g79eXbG62a3N2aC
	4pdjNtRGYqXo2ENkyDjD25qJ5AIgwyFe5hRG
X-Google-Smtp-Source: AK7set91nroGBsImTbNADqg2q7UV3/Ka4zDTpBFFcSJJUPN3QrCS4tftg88NjFlY9n92IlRAnz9EFg==
X-Received: by 2002:a2e:8297:0:b0:294:716d:8d5 with SMTP id y23-20020a2e8297000000b00294716d08d5mr784747ljg.1.1676942511727;
        Mon, 20 Feb 2023 17:21:51 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l5-20020a19c205000000b004ceb053c3ebsm355146lfc.179.2023.02.20.17.21.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Feb 2023 17:21:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] mesa: provide support for packing development and testing tools
Date: Tue, 21 Feb 2023 04:21:44 +0300
Message-Id: <20230221012144.3309467-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 01:22:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177478

Mesa contains several optional tools that can be useful for application
and driver developers. Add a packageconfig option to build a mesa-tools
package containing relevant programs.

Note, the fdperf tool for the freedreno depends on libconfig, which is
not a part of oe-core, thus this tool is not built by default by this
recipe even when freedreno driver is selected. The fdperf tool needs to
be explicitly enabled by adding 'freedreno-fdperf' to the PACKAGECONFIG.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v1:
- Moved fdperf handling to a separate PACKAGECONFIG entry.

---
 meta/recipes-graphics/mesa/mesa.inc | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 0a3dc1dd62a0..8a8a057c6bf8 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -107,6 +107,23 @@ VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',fre
 VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
 PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',glslang-native vulkan-loader vulkan-headers"
 
+# mesa development and testing tools support, per driver
+TOOLS = ""
+TOOLS_DEPS = ""
+TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
+TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
+TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
+TOOLS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
+
+# dependencies for tools.
+TOOLS_DEPS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ' ncurses libxml2 ', '', d)}"
+
+# the fdperf tool requires libconfig (a part of meta-oe) so it needs special
+# treatment in addition to the usual 'freedreno tools'.
+PACKAGECONFIG[freedreno-fdperf] = ",,libconfig"
+
+PACKAGECONFIG[tools] = "-Dtools=${@strip_comma('${TOOLS}')}, -Dtools='', ${TOOLS_DEPS}"
+
 PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false"
 PACKAGECONFIG[glvnd] = "-Dglvnd=true, -Dglvnd=false, libglvnd"
 
@@ -211,7 +228,7 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libopencl-mesa libopencl-mesa-dev \
              libxatracker libxatracker-dev \
              mesa-megadriver mesa-vulkan-drivers \
-             mesa-vdpau-drivers \
+             mesa-vdpau-drivers mesa-tools \
             "
 
 do_install:append () {
@@ -323,6 +340,9 @@ FILES:libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/GL/osmesa.h ${libdir}
 FILES:libxatracker-dev = "${libdir}/libxatracker.so ${libdir}/libxatracker.la \
                           ${includedir}/xa_tracker.h ${includedir}/xa_composite.h ${includedir}/xa_context.h \
                           ${libdir}/pkgconfig/xatracker.pc"
+# catch all to get all the tools and data
+FILES:${PN}-tools = "${bindir} ${datadir}"
+ALLOW_EMPTY:${PN}-tools = "1"
 
 # Fix upgrade path from mesa to mesa-megadriver
 RREPLACES:mesa-megadriver = "mesa"
-- 
2.30.2


