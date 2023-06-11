Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B70BDC7EE23
	for <webhook@archiver.kernel.org>; Sun, 11 Jun 2023 23:11:59 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.47132.1686525114652005466
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jun 2023 16:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=g3nOgDcY;
 spf=pass (domain: underview.tech, ip: 209.85.210.44, mailfrom: vince@underview.tech)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6b2d356530eso1119476a34.0
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 16:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1686525114; x=1689117114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UCeqTfBBOWUyOv95bXC57XDuf105ekozGdetfPvGs+c=;
        b=g3nOgDcY8rVGM+49T2/gdcJfbZ4tZqSSg4wvd1mDkSvxX5jvrFdZIrVlDuv/EVELgb
         8P/G96H+kSzmEMT1OSSQdVgeasg7tNxxkMuO9UGU57npBBAuQe03XQXzaw8VA4rdf4tV
         8E6/eZ1BZwGOP5wgeNh7PQk4bcmOzgAlM9XHOHILi2vnmHskjCXtrrURc2+tcv7uGK6z
         pXUTHx/Qa+fwcXTV5Ng7waZ8QNmS8Ea76cKBn+qAyj51sG4XTgzZrkq4mv5f7LOuzuvn
         AYFZf2EOL0ZE3MloVJp5uLDAd8yMYVVQ2OoLx2VMf6fY7LkBE4JPQbvZ8fl9c8ghPo3R
         GyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686525114; x=1689117114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UCeqTfBBOWUyOv95bXC57XDuf105ekozGdetfPvGs+c=;
        b=RwRQWVwjpGh8JF7JefSJ1BQDGJSqhGQMxQMTZJIVIjueTShlz2MgWi47iIKA9XYycR
         jP8lUO9UUChZD7S0QhcgTt5Z1J2Lz8wuJKmVs73ZnuAvEZmomPbFN+vBAwsySH/WuJ0R
         uc4P0OjlVEMFVUCS21LVH11kU6EVLskWq413nPY5f4rffdphJ07zUu9PPOXPrtnjUwtb
         Z3D9OPZeFYmxKWEfzzdlbztd80yceTdx6pGOjG9ENnaxcs8YkBu4jg3bWtDPoabN7SFU
         XoN/sMAd9E5woqw8f0vA8pTEuLVhNj2qpV9EOD5V/nvG7jl3ut3EEEyVRM4njatqCyQU
         2Erg==
X-Gm-Message-State: AC+VfDwnL9rWFenZP+IlTPJXU/+V9T/DaL6oYAtE6/61qcmRaPgLROzN
	Miz9/MXTOGb4rNJU6TXZa6JqFUPAgwGTcBNUfd4=
X-Google-Smtp-Source: ACHHUZ7nfK/gapvRgYf83che4tpWysy1SXPxe6OtnRebLdQknPKXQbYEniU6NfiKOyMqfbaXgITCsA==
X-Received: by 2002:a9d:6e83:0:b0:6a1:1bd4:d8c8 with SMTP id a3-20020a9d6e83000000b006a11bd4d8c8mr4778527otr.26.1686525113327;
        Sun, 11 Jun 2023 16:11:53 -0700 (PDT)
Received: from vince-B550I-AORUS-PRO-AX.attlocal.net ([2600:1700:1124:8090:f287:be73:6bd4:6065])
        by smtp.gmail.com with ESMTPSA id v5-20020a056830140500b006af9463988dsm3423854otp.80.2023.06.11.16.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 16:11:53 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH] vulkan-validation-layers: cleanup recipe
Date: Sun, 11 Jun 2023 18:11:35 -0500
Message-Id: <20230611231135.1995485-1-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 23:11:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182642

Commit doesn't change build behavior hopefully allows
cmake to find required .cmake files faster.

* Removes ${libdir} from FILES:${PN} as its not required.
* Updates PACKAGECONFIG to uses just one @bb.utils.filter call.
* Updates GLSLANG_INSTALL_DIR to <recipe-sysroot>/lib${64} as
  that contains the actual directory of the glslang .cmake
  config files.
* VULKAN_HEADERS_INSTALL_DIR and SPIRV_HEADERS_INSTALL_DIR
  are updated to <recipe-sysroot>/usr/share from
  <recipe-sysroot>/usr. According to cmake
  "Config Mode Search Procedure" the choosen directory would
  be the second entry list of directories to search when looking
  for .cmake files after first looking into
  CMAKE_FIND_PACKAGE_REDIRECTS_DIR directory.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 .../vulkan/vulkan-validation-layers_1.3.243.0.bb    | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.243.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.243.0.bb
index 6e1ef7a05d..c33c543f6f 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.243.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.243.0.bb
@@ -23,22 +23,19 @@ DEPENDS = "vulkan-headers vulkan-loader spirv-headers spirv-tools glslang"
 EXTRA_OECMAKE = "\
     -DBUILD_TESTS=OFF \
     -DUSE_ROBIN_HOOD_HASHING=OFF \
-    -DGLSLANG_INSTALL_DIR=${STAGING_DATADIR} \
-    -DVULKAN_HEADERS_INSTALL_DIR=${STAGING_EXECPREFIXDIR} \
-    -DSPIRV_HEADERS_INSTALL_DIR=${STAGING_EXECPREFIXDIR} \
+    -DGLSLANG_INSTALL_DIR=${STAGING_LIBDIR} \
+    -DVULKAN_HEADERS_INSTALL_DIR=${STAGING_DATADIR} \
+    -DSPIRV_HEADERS_INSTALL_DIR=${STAGING_DATADIR} \
     "
 
 PACKAGECONFIG[x11] = "-DBUILD_WSI_XLIB_SUPPORT=ON -DBUILD_WSI_XCB_SUPPORT=ON, -DBUILD_WSI_XLIB_SUPPORT=OFF -DBUILD_WSI_XCB_SUPPORT=OFF, libxcb libx11 libxrandr"
 PACKAGECONFIG[wayland] = "-DBUILD_WSI_WAYLAND_SUPPORT=ON, -DBUILD_WSI_WAYLAND_SUPPORT=OFF, wayland"
 
-PACKAGECONFIG ?= "\
-    ${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)} \
-    ${@bb.utils.filter('DISTRO_FEATURES', 'wayland', d)} \
-    "
+PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d)}"
 
 inherit cmake features_check pkgconfig
 
-FILES:${PN} += "${datadir}/vulkan ${libdir}"
+FILES:${PN} += "${datadir}/vulkan"
 
 SOLIBS = ".so"
 FILES_SOLIBSDEV = ""
-- 
2.34.1


