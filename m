Return-Path: <dbaryshkov@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3318C636D4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 13:25:07 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.14738.1676467500376236306
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 05:25:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=GB3/K+oQ;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: dmitry.baryshkov@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id f34so27549910lfv.10
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 05:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=LjBTqXbhjg7hJlO71WjTGGaWzReRSJdSNzltxf2Ilfk=;
        b=GB3/K+oQ+mBm526W1JhAlpXlexQV5MwWLDXV+yMO4AxZSp1y9Z+iqE6Y0A5xi9jw2Q
         UrMwnyfrjFzzV+WDKZkbUc9tA/mjPBUJ+fsdL08w/uT7v3ovozZPQt3ZXueQAcFUR0iZ
         xa8efsMu9PQ5vb5hZU56XS5ldnEZMkbgrzBQUciDZD5YO90vUGb/cePunIMjgZxhR1lv
         kb8U0vtVRNEY1w/9AEZQIAqa1VzdK3gKMx2dD09NSSBXy18HuMh1i3UOUu/5TA4ULWxr
         H3JoqRDCeAPScTZIBgLS7GmW2skUI5FpU881pOh1myeAjQGwgeoO1R0xELffUZSQPDXt
         dvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LjBTqXbhjg7hJlO71WjTGGaWzReRSJdSNzltxf2Ilfk=;
        b=wPKpN9dYVFi6fvXXJZClQHzqDyh8iiWn8D1BKzLwg6xWgTpYIaebYwV7EOnU8VZAX5
         jfIq3oaEfr+K7INUCOHf9IxWcdmYPI7IEs9akN766xD/JjhJYf1hK3fw9tkLEr5mWRNk
         QYIUHOLqnXOLZxhnzukS1CYNh91hccOviM6wZtWjMvURYydNXgI3FO6l3Z9GVgDO2Sqc
         SVA3GxzuWwi7+Jov8s9AlkxEp8lWfEBX0zQZ28Si1Pb7mdFm4ybbYNJ0Lxyxfpx+EroG
         oiZ2lWwwUYcA60+m4dPMuN6dtgdxfv+2gVR0ezCHv9kDyTnBtz+ifmncFpF8HbeGDhL5
         LTHw==
X-Gm-Message-State: AO0yUKW9n/UmvPe5O/ohDpKRORMEQSCW9/TEJk8i2Rokb5uo254XGUno
	70Ryh3bRtSImqhQp808cUqvPio8gazvFh7qq
X-Google-Smtp-Source: AK7set9ZBA/junhyjbGQzFj5BVUe7i+D8H7AFPJSIbJfVfu44VAq2nYtLRwdTPfOfBrGkncCCQzhlg==
X-Received: by 2002:ac2:5494:0:b0:4d0:62b9:87c0 with SMTP id t20-20020ac25494000000b004d062b987c0mr421255lfk.13.1676467498024;
        Wed, 15 Feb 2023 05:24:58 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l4-20020ac25544000000b004db4bc2f085sm221676lfk.79.2023.02.15.05.24.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 05:24:57 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mesa: provide support for packing development and testing tools
Date: Wed, 15 Feb 2023 16:24:54 +0300
Message-Id: <20230215132454.4114658-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 13:25:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177188

Mesa contains several optional tools that can be useful for application
and driver developers. Add a packageconfig option to build a mesa-tools
package containing relevant programs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 meta/recipes-graphics/mesa/mesa.inc | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 0a3dc1dd62a0..96e4a1959332 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -107,6 +107,20 @@ VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',fre
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
+# dependencies for tools. libconfig is optional, it is a part of meta-oe so it needs special treatment
+TOOLS_DEPS_FREEDRENO_LIBCONFIG = " ${@bb.utils.contains('BBFILE_COLLECTIONS', 'openembedded-layer', 'libconfig', '', d)} "
+TOOLS_DEPS:append = "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ' ncurses libxml2 ${TOOLS_DEPS_FREEDRENO_LIBCONFIG} ', '', d)}"
+
+PACKAGECONFIG[tools] = "-Dtools=${@strip_comma('${TOOLS}')}, -Dtools='', ${TOOLS_DEPS}"
+
 PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false"
 PACKAGECONFIG[glvnd] = "-Dglvnd=true, -Dglvnd=false, libglvnd"
 
@@ -211,7 +225,7 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libopencl-mesa libopencl-mesa-dev \
              libxatracker libxatracker-dev \
              mesa-megadriver mesa-vulkan-drivers \
-             mesa-vdpau-drivers \
+             mesa-vdpau-drivers mesa-tools \
             "
 
 do_install:append () {
@@ -323,6 +337,9 @@ FILES:libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/GL/osmesa.h ${libdir}
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


