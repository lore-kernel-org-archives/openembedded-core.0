Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38428C77B7A
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 02:30:01 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.113.1685068196638744578
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 19:29:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=kizKlYVS;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-530638a60e1so219258a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 19:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1685068195; x=1687660195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VuvDc+fPuzohGk7V5JMvDwpodxp8jnUYcQShIqn8390=;
        b=kizKlYVSdvgnuyN7NKn/P8eEMnd/8NRFfRy5ldwlj7HtZ4z+VgmVdIYw6Hgg5ocBeP
         yS0F82Kn2Dms36vXXCrznqZOl5isG7L8T2f67gVEGglkVnLpC1E6qGKq0EieP+sDWMqg
         JgvEZ/bPoNozWvHlrwUtQSIqdZYNiX6I2nmOLK0Qehawhg+ZmvSZmQa0W6YRBb/1xFQk
         X8N7u8dltk1uaZrPzFGHk/vxGdhRep7x+dL/CGzg2ZIFY3usBV4RI2FdOEpj2OtB+4Ni
         TzsUOYO/7xeBFbnFcxevQxiJ7aO4op5vOhoO01Lwx8tajfqdF5EpJZhWpwzI+HGN7AiF
         Kgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685068195; x=1687660195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VuvDc+fPuzohGk7V5JMvDwpodxp8jnUYcQShIqn8390=;
        b=E6cNHBGzQeGSyduoHFxy4hExeBkczKeUQmwwXsep6+UDjiI75km+iiO48S1GKRej47
         ECYxSVn4Mf81kneG+wiycXCQssAFharUDKs1IAXUILx28RunR7t22OMnk4QCNSgrwbdI
         /F6cxmO5xEMIO33z/k0tYKX0zApbOYPUdeAXaL3HoZTW+p2WHaXYCz9CTU9T6GbrHNbJ
         dsc2FS5XKK9zwe2KJB6TJRaZkckHu05epSgo8I8oNiBE54TCDXOkVpgqpPu5DMRFAxfT
         +NWOROOMPkeYi5gSi7rpsrD/tgT87+x/moHjZkXXgx3zcjZwIh23+3lXh8fo0iuLM5iG
         H7/A==
X-Gm-Message-State: AC+VfDwaljghA8IxejciDRyCbu4KhajVnbqynlryA8hW6c/ClrKWoz21
	WJ+1j8zSnbTs1TU4CaEcRRW3im+hiqSPzdsB98s=
X-Google-Smtp-Source: ACHHUZ5PW3FZ8sK1jo67u1obV7LCoAeDwcndLIj2lOhuSVkUGiZkTVoWS0QdWevceZ/hgluwmgqORg==
X-Received: by 2002:a17:902:6bc4:b0:1aa:cddd:57d8 with SMTP id m4-20020a1709026bc400b001aacddd57d8mr772910plt.30.1685068195320;
        Thu, 25 May 2023 19:29:55 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id t13-20020a170902b20d00b0019ee045a2b3sm2023794plr.308.2023.05.25.19.29.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 19:29:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 19/21] piglit: Add PACKAGECONFIG for glx and opencl
Date: Thu, 25 May 2023 16:29:07 -1000
Message-Id: <b0f54a3db7877a95a163bd480b93cfe6f0b97dcd.1685068004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1685068004.git.steve@sakoman.com>
References: <cover.1685068004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 02:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181751

From: Tom Hochstein <tom.hochstein@nxp.com>

- Allow GLX tests to be disabled for systems that don't support it.

- Allow OpenCL tests to be enabled.

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...roper-WAYLAND_INCLUDE_DIRS-variable.patch} |  0
 ...-shader.c-do-not-hardcode-build-pat.patch} |  0
 ...n-t-enable-GLX-if-tests-are-disabled.patch | 32 +++++++++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb    | 11 ++++---
 4 files changed, 39 insertions(+), 4 deletions(-)
 rename meta/recipes-graphics/piglit/piglit/{0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch => 0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch} (100%)
 rename meta/recipes-graphics/piglit/piglit/{0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch => 0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch} (100%)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0005-cmake-Don-t-enable-GLX-if-tests-are-disabled.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch b/meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
similarity index 100%
rename from meta/recipes-graphics/piglit/piglit/0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
rename to meta/recipes-graphics/piglit/piglit/0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch
diff --git a/meta/recipes-graphics/piglit/piglit/0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch b/meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
similarity index 100%
rename from meta/recipes-graphics/piglit/piglit/0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
rename to meta/recipes-graphics/piglit/piglit/0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch
diff --git a/meta/recipes-graphics/piglit/piglit/0005-cmake-Don-t-enable-GLX-if-tests-are-disabled.patch b/meta/recipes-graphics/piglit/piglit/0005-cmake-Don-t-enable-GLX-if-tests-are-disabled.patch
new file mode 100644
index 0000000000..ef6fda0f4e
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0005-cmake-Don-t-enable-GLX-if-tests-are-disabled.patch
@@ -0,0 +1,32 @@
+From 13ff43fe760ac343b33d8e8c84b89886aac07116 Mon Sep 17 00:00:00 2001
+From: Tom Hochstein <tom.hochstein@nxp.com>
+Date: Fri, 3 Jun 2022 10:44:29 -0500
+Subject: [PATCH] cmake: Don't enable GLX if tests are disabled
+
+Allow building for systems that don't support GLX.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/720]
+Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
+---
+ CMakeLists.txt | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e1aeb5ddf..85e171aba 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -134,10 +134,7 @@ if(PIGLIT_BUILD_CL_TESTS)
+ endif(PIGLIT_BUILD_CL_TESTS)
+ 
+ IF(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
+-	if(X11_FOUND AND OPENGL_gl_LIBRARY)
+-		# Assume the system has GLX. In the future, systems may exist
+-		# with libGL and libX11 but no GLX, but that world hasn't
+-		# arrived yet.
++	if(X11_FOUND AND OPENGL_gl_LIBRARY AND PIGLIT_BUILD_GLX_TESTS)
+ 		set(PIGLIT_HAS_GLX True)
+ 		add_definitions(-DPIGLIT_HAS_GLX)
+ 	endif()
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 3ae7a14e46..5b7a206247 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -8,10 +8,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
 
 SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=main \
            file://0001-cmake-install-bash-completions-in-the-right-place.patch \
-           file://0001-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch \
            file://0001-Add-a-missing-include-for-htobe32-definition.patch \
-           file://0002-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch \
-           "
+           file://0002-cmake-use-proper-WAYLAND_INCLUDE_DIRS-variable.patch \
+           file://0003-tests-util-piglit-shader.c-do-not-hardcode-build-pat.patch \
+           file://0005-cmake-Don-t-enable-GLX-if-tests-are-disabled.patch"
+
 UPSTREAM_CHECK_COMMITS = "1"
 
 SRCREV = "2f80c7cc9c02d37574dc8ba3140b7dd8eb3cbf82"
@@ -36,8 +37,10 @@ REQUIRED_DISTRO_FEATURES += "opengl"
 export TEMP = "${B}/temp/"
 do_compile[dirs] =+ "${B}/temp/"
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 glx', '', d)}"
 PACKAGECONFIG[freeglut] = "-DPIGLIT_USE_GLUT=1,-DPIGLIT_USE_GLUT=0,freeglut,"
+PACKAGECONFIG[glx] = "-DPIGLIT_BUILD_GLX_TESTS=ON,-DPIGLIT_BUILD_GLX_TESTS=OFF"
+PACKAGECONFIG[opencl] = "-DPIGLIT_BUILD_CL_TESTS=ON,-DPIGLIT_BUILD_CL_TESTS=OFF,opencl-icd-loader"
 PACKAGECONFIG[x11] = "-DPIGLIT_BUILD_GL_TESTS=ON,-DPIGLIT_BUILD_GL_TESTS=OFF,${X11_DEPS}, ${X11_RDEPS}"
 PACKAGECONFIG[vulkan] = "-DPIGLIT_BUILD_VK_TESTS=ON,-DPIGLIT_BUILD_VK_TESTS=OFF,vulkan-loader"
 
-- 
2.34.1


