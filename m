Return-Path: <vince@underview.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33778EB64D8
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 06:48:13 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web10.5443.1686725284690694819
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jun 2023 23:48:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@underview.tech header.s=google header.b=GpHJM0yw;
 spf=pass (domain: underview.tech, ip: 209.85.210.48, mailfrom: vince@underview.tech)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6b426eb7e81so409424a34.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jun 2023 23:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=underview.tech; s=google; t=1686725284; x=1689317284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AUl8XE7QLZvg/94N5bYsfm1csn/AKvWJAfc+bIQnwSw=;
        b=GpHJM0ywvXqE6COqrTroUjWZOiKS0XZy7u7eng6oEzF9CmN2FlYN+EUBVKt/5JHoEp
         YVNyochbXFBZg+gqulFGUT/jG7Ryf6KevBld9cqSV5FUDK9N/xSNdZMq20cqJO+ED5da
         /8m4j5BfNQ0i0t8jENjmYU7VskQaDiwk94hW4rbHgi01lh2egvnZxYbsNbqtA3JOUoDd
         M2DMPw5ZRKDErNyOMEkeH0mAZqK0yJeXsz9t3tOy2pZ/Q7jlduXR9/PH5kqfR9dMaREu
         ox/ooeF7evnaOn2fz3lylvmlL9XXmpyDvd5fqR2S0kaEUmrQoiHZ+1WBzD4JCLGSDvNY
         kMXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686725284; x=1689317284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AUl8XE7QLZvg/94N5bYsfm1csn/AKvWJAfc+bIQnwSw=;
        b=mFeohHSb+rFxgBk9VR9DUISZHRw97rIHo7C6Ran+KPETNe/MD/Jvpbuaoj6o00jyIX
         AbZuyTWT4yFA2xhVJkKX8Vw45rf39ZVCz0Sc6we3gUlTp3qtsrgckrntYm1MAQG54+2R
         USc/pNycnkMn2rlkfydvKCqbtZJ7zZ/UmSVyAH6Ozja0I9anLrfyGGE/WeJRN8dvT/Fh
         BL0mNarx2QN7akwS4EJdSKtcqW9+qou6AN9IsGfGreot4cwuT4MClpjbarOA0uzJ7G3u
         Tup2RvLggkjnkLhlRbywfjRIvM9WN/mKmH8Tj2vctTzWzxcWYZwPcVWg+/0xY9ZYB7B/
         oNYQ==
X-Gm-Message-State: AC+VfDwo5O/sEa2jn4SOkqD+K7L5xB1Q+x3KdTVcijjyQ2fdRXNgkedM
	Y6A4hBQCUfKl3EhfutNmXzqDkp8UuUH+7J3ou7A=
X-Google-Smtp-Source: ACHHUZ4MRn9+gBjuLb3kJRWksucqem1qbiKHpdHZxISaorE6EBY3fg8HejUy0y6gMa2B+/9IF0CGow==
X-Received: by 2002:a05:6830:86:b0:6ab:983f:a56b with SMTP id a6-20020a056830008600b006ab983fa56bmr12098730oto.11.1686725283729;
        Tue, 13 Jun 2023 23:48:03 -0700 (PDT)
Received: from vince-B550I-AORUS-PRO-AX.attlocal.net ([2600:1700:1124:8090:a368:f365:98f7:e9e3])
        by smtp.gmail.com with ESMTPSA id m4-20020a9d7e84000000b006a44338c8efsm5655179otp.44.2023.06.13.23.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 23:48:03 -0700 (PDT)
From: Vincent Davis Jr <vince@underview.tech>
To: openembedded-core@lists.openembedded.org
Cc: Vincent Davis Jr <vince@underview.tech>
Subject: [PATCH v2] vulkan-validation-layers: cleanup recipe
Date: Wed, 14 Jun 2023 01:45:20 -0500
Message-Id: <20230614064519.35240-1-vince@underview.tech>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jun 2023 06:48:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182734

Commit doesn't change build behavior

* Removes ${libdir} from FILES:${PN} as its not required.
* Updates PACKAGECONFIG to uses just one @bb.utils.filter call.
* Updates GLSLANG_INSTALL_DIR to <recipe-sysroot>/lib${64} as
  that contains the actual directory of the glslang .cmake
  config files.

Signed-off-by: Vincent Davis Jr <vince@underview.tech>
---
 .../vulkan/vulkan-validation-layers_1.3.243.0.bb         | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.243.0.bb b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.243.0.bb
index 6e1ef7a05d..bfb4b370b8 100644
--- a/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.243.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-validation-layers_1.3.243.0.bb
@@ -23,7 +23,7 @@ DEPENDS = "vulkan-headers vulkan-loader spirv-headers spirv-tools glslang"
 EXTRA_OECMAKE = "\
     -DBUILD_TESTS=OFF \
     -DUSE_ROBIN_HOOD_HASHING=OFF \
-    -DGLSLANG_INSTALL_DIR=${STAGING_DATADIR} \
+    -DGLSLANG_INSTALL_DIR=${STAGING_LIBDIR} \
     -DVULKAN_HEADERS_INSTALL_DIR=${STAGING_EXECPREFIXDIR} \
     -DSPIRV_HEADERS_INSTALL_DIR=${STAGING_EXECPREFIXDIR} \
     "
@@ -31,14 +31,11 @@ EXTRA_OECMAKE = "\
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


