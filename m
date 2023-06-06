Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB3BC77B73
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 15:14:40 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.1318.1686064476913231549
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jun 2023 08:14:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@underview.tech header.s=google header.b=Lm2A6r6C;
 spf=pass (domain: underview.tech, ip: 209.85.128.181, mailfrom: vince@underview.tech)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-565ba53f434so68308247b3.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 08:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1686064476; x=1688656476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0cdSUwwkvpQUMUQE9WRPwLtID0y+XlYWgxIiBuQZh/E=;
        b=Lm2A6r6C9hjOHD8dY0H2HFh5sFyD8FEgxkvFXcv/EAAz+UqykP2ADr3SPyVtmdYgzn
         InUiXV2yntku0vEp0w1akFieKYA1hHJsRWhfasHSLT4dPnmbiaejrAivSD5BAK+AFp4l
         vKlAF7Wzht60MWhO3oZ93ci6kILHo2IS22eC5M/UHWV4IIFbVlX89ZqoI19xdECeHVjZ
         Wl8CikEgPdgl0TqyY6xmlt88nR4X9gK2RqV3esU/kb9Ul6Pubfsl705ypgUzWKFMy2A2
         MKozyNHDILy33Y0kX5Yb2raf+aBjXscN/GfjUsmvlW+V5jvAJ1ULzNPfrgLlyOulCLZ4
         lq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686064476; x=1688656476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0cdSUwwkvpQUMUQE9WRPwLtID0y+XlYWgxIiBuQZh/E=;
        b=G8TRTjlQp7QjpUPuImLk5KJjKf28zXY5WMLZ0XbynT45zAFK0/Lt49yBG6+MGXP02Z
         fhZLy6E3BVMhUwvWwyeqaBTOpFxORnvkCv20eTSHEPJidLKeFmLMO1vZMegCw6VcNKXs
         e3lHiUmFRGHOveTl/Kbna5IQazoL33pyLenO0hoiu1IDoQFOoP8SXNLR/QquOKA77lRr
         aVCrO3UhsMjKvJry0WC3qbqeKzizT6qw+IRW9+oO13cHacBRECayO2UJzwUHqv0iYQAo
         3PVyuV08px18pnA2XTq6LHKUiQx6nEFMAi7uDpyhy23vYGcd+47x9GJ3qz6opMncaf0R
         uMvg==
X-Gm-Message-State: AC+VfDwOlHFRRNlYv/9itGdp3NgOcq5g/BXVLqsI+zKQocDcp0PGIc2u
	VEhKc73ZZpSO7dW5ZOiSx2LH7n1mGURlyqOfDDc=
X-Google-Smtp-Source: ACHHUZ4+kWcKKLt+9T/z6iP+r3tRLYFZCpsXEaVz3OmEsgXTj+mDJ33vCJlEPNYbxGx7Ba1ABZ8mtQ==
X-Received: by 2002:a0d:de41:0:b0:561:d21d:8ce3 with SMTP id h62-20020a0dde41000000b00561d21d8ce3mr3279527ywe.3.1686064475934;
        Tue, 06 Jun 2023 08:14:35 -0700 (PDT)
Received: from vince-B550I-AORUS-PRO-AX.attlocal.net ([2600:1700:1124:8090:dddf:4c5a:5682:75fe])
        by smtp.gmail.com with ESMTPSA id v16-20020a814810000000b005688deeefc2sm4096786ywa.20.2023.06.06.08.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 08:14:35 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v3 2/2] vulkan-validation-layers: add new recipe v1.3.243.0
Date: Tue,  6 Jun 2023 10:13:37 -0500
Message-Id: <20230606151335.6019-2-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606151335.6019-1-vince@underview.tech>
References: <20230606151335.6019-1-vince@underview.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jun 2023 15:14:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182446

Add a recipe to build the Khronos official Vulkan validation
layers that can assist developers in verifying that their
applications correctly use the Vulkan APIs.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../vulkan-validation-layers_1.3.243.0.bb     | 51 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.243.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 0f7b7287bb..b06ae43dac 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -827,6 +827,7 @@ RECIPE_MAINTAINER:pn-vulkan-headers = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-vulkan-loader = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER:pn-vulkan-samples = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-vulkan-tools = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER:pn-vulkan-validation-layers = "Vincent Davis Jr <vince@underview.tech>"
 RECIPE_MAINTAINER:pn-waffle = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-watchdog = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-watchdog-config = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.243.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.243.0.bb
new file mode 100644
index 0000000000..6e1ef7a05d
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.243.0.bb
@@ -0,0 +1,51 @@
+SUMMARY = "Vulkan Validation layers"
+DESCRIPTION = "Khronos official Vulkan validation layers to assist developers \
+in verifying that their applications correctly use the Vulkan API"
+HOMEPAGE = "https://www.khronos.org/vulkan/"
+BUGTRACKER = "https://github.com/KhronosGroup/Vulkan-ValidationLayers"
+SECTION = "libs"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=8df9e8826734226d08cb412babfa599c"
+
+SRC_URI = "git://git@github.com/KhronosGroup/Vulkan-ValidationLayers.git;branch=sdk-1.3.243;protocol=https"
+SRCREV = "4ac0fd8e6cb3d49105d707d9ec07f0f3aa0943d6"
+
+S = "${WORKDIR}/git"
+
+REQUIRED_DISTRO_FEATURES = "vulkan"
+
+DEPENDS = "vulkan-headers vulkan-loader spirv-headers spirv-tools glslang"
+
+# BUILD_TESTS            - Not required for OE builds
+# USE_ROBIN_HOOD_HASHING - Provides substantial performance improvements on all platforms.
+#                          Yocto project doesn't contain a recipe for package so disabled it.
+EXTRA_OECMAKE = "\
+    -DBUILD_TESTS=OFF \
+    -DUSE_ROBIN_HOOD_HASHING=OFF \
+    -DGLSLANG_INSTALL_DIR=${STAGING_DATADIR} \
+    -DVULKAN_HEADERS_INSTALL_DIR=${STAGING_EXECPREFIXDIR} \
+    -DSPIRV_HEADERS_INSTALL_DIR=${STAGING_EXECPREFIXDIR} \
+    "
+
+PACKAGECONFIG[x11] = "-DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON, -DBUILD_WSI_XLIB_SUPPORT=OFF -DBUILD_WSI_XCB_SUPPORT=OFF, libxcb libx11 libxrandr"
+PACKAGECONFIG[wayland] = "-DBUILD_WSI_WAYLAND_SUPPORT=ON, -DBUILD_WSI_WAYLAND_SUPPORT=OFF, wayland"
+
+PACKAGECONFIG ?= "\
+    ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} \
+    "
+
+inherit cmake features_check pkgconfig
+
+FILES:${PN} += "${datadir}/vulkan ${libdir}"
+
+SOLIBS = ".so"
+FILES_SOLIBSDEV = ""
+
+# These recipes need to be updated in lockstep with each other:
+# glslang, vulkan-headers, vulkan-loader, vulkan-tools,
+# vulkan-validation-layers, spirv-headers, spirv-tools
+# The tags versions should always be sdk-x.y.z, as this is what
+# upstream considers a release.
+UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


