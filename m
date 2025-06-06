Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3586AC67861
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 20:58:36 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.5505.1749243511011061791
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 13:58:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IY0EPinO;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a4f78ebec8so1535829f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 13:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749243509; x=1749848309; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=awotewyAkVEL81B7kiEkmlvcmedzvUDl8UFKqsHl8So=;
        b=IY0EPinOCzT+fTnCY+zvNQ5k+DGKqMGws+0Ufq8+F+2wB9MhOP3QrCgL/Q9s20gtM2
         L2gDsegIIsFZLZdodKTBZMZeZDeDk70ESz+/8RenIDl6hvk+SUB4HNYR4HIfcCskjSLe
         WSSiuPlt+Ij8dLKlSwfuJy5GAHe1P9WCGbTcFtC9m7aRkZp+Opd6Q5oOnfk6I9y+46tx
         WOgD5mrxbhuuVX6tUrIIM29XWsddoDopGVC/sv4Y1d3rqsqcrWLqYD5G6fZ4NZs/WXhI
         FpJ9dNtpKsMNY3xjoy7i8wz8fLitXjE7BojqdhmG7Ii+WTo5F0MEAMsUDwWJyrq1xwJV
         qo5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749243509; x=1749848309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=awotewyAkVEL81B7kiEkmlvcmedzvUDl8UFKqsHl8So=;
        b=ayu9fxMwF4fhQy5qvq5iNkBJXp/AbRNIjCDXPMC7HByy9HwZ4OvGhmT5r7ytOfKl1u
         d1JeLUyj4akebwuY9vxwiAJddR2/J0mVoEsSnibaPcfbbDwzIFwubVxmIElJxisi/j+m
         ktxIIPHikC2f5Qnk7bGKKo+xRbRj36+L9yEwlc6txHrZ2u1qMbSdIkcIv3Wyl1sz/CAG
         IOMqr4zW/Pfjl6r36O7nR3I17CkYn5l+WUN7Q9DK8dXUoW62hn4zRNmlfGfPFI4Zi3iX
         yEI7yylgJqL2ezTxU0/uHIJ45is+ny/J5E4fEdOfMU44MDHYf0H6tlk3dQq9BraRxc1O
         lC/A==
X-Gm-Message-State: AOJu0YxyC01lmdkwE5zLtdpTFtYs0xOCBkI0lQlGzWzhwdSpJEpQjytU
	lZXZ3xarxy/wWEui40ELZj8gVG74mCc5hzQneFG5yTrf8DY14JxJsOzqwxCNFA==
X-Gm-Gg: ASbGncu18r5tRcopV1RBvptGHKL//Sisqx5FSocPkmz8AL3SVn2IH2gkUQyBMkOHBb4
	1O8xHeZhl7c3etTuTGaofSUS26CZJxwZFcCzth40x9+bcRbz8OxPs4i3BbImQYJvBX1LAkyMNLa
	//nbBINLlX6aY2DKuG0r2qT1kBq/Oxxyzv8EvoF+c9nsZdqri/MvbE9gRCAbdRoTx17MTDgw2c/
	jOvVLNV+sfETMzs8C8AGWfS7mXbOOaSW46nHdjKc7YYtDWvblqWAyPn1ci4aNUdHcxM/JY1DcPz
	gDGX8pRrgJVwWawbqb+9pH+FW0b6nyYRTDIlG0ZDtlH0IJ4xgrYoF8A2rJrIaSesWBLiYJ5Lg44
	SjgVpXnH6X9vv
X-Google-Smtp-Source: AGHT+IGW87zCbhK8sNtGoN1yTmhEHDYAY5QTVqvwrd+oBI238wTWLbMIAuX9C2L06xHpaZmv3X4UFQ==
X-Received: by 2002:a05:6000:26c8:b0:3a4:eb92:b5eb with SMTP id ffacd0b85a97d-3a531cec2c6mr3794500f8f.50.1749243509266;
        Fri, 06 Jun 2025 13:58:29 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f4e7sm2850859f8f.77.2025.06.06.13.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 13:58:28 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/5] piglit: replace setting PIGLIT_BUILD_DIR with a correct reproducibility fix
Date: Fri,  6 Jun 2025 22:58:07 +0200
Message-Id: <20250606205809.4071299-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250606205809.4071299-1-alex.kanavin@gmail.com>
References: <20250606205809.4071299-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 20:58:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218183

From: Alexander Kanavin <alex@linutronix.de>

PIGLIT_BUILD_DIR was set to source tree location relative to B as a
reproducibility workaround some years ago. Aafter some investigation
I found where the actual issue is (addressed by the patch).

Also, setting PIGLIT_BUILD_DIR relative to ${B} in a hardcoded way
is problematic as S and B are not necessarily related that way (e.g. when
sources are in UNPACKDIR or somewhere else entirely).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...r.py-modify-_command-and-not-command.patch | 32 +++++++++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb    |  3 +-
 2 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch
new file mode 100644
index 00000000000..f8600556e5d
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-no_error.py-modify-_command-and-not-command.patch
@@ -0,0 +1,32 @@
+From 846efe923932d66810305b228fa09f83a172296d Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Thu, 22 May 2025 17:34:15 +0200
+Subject: [PATCH] tests/no_error.py: modify _command and not command
+
+command getter function has hidden magic that prepends build paths;
+this is an undesirable side effect here, as we only want to append a parameter
+and not change anything else.
+
+In particular this avoids adding build paths to installed .xml.gz file,
+ensuring reproducibility. Xml writer is already using _command for the
+same reason.
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/piglit/-/merge_requests/1016]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ tests/no_error.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tests/no_error.py b/tests/no_error.py
+index 4ecaa9a01..c64eec0a1 100644
+--- a/tests/no_error.py
++++ b/tests/no_error.py
+@@ -21,4 +21,4 @@ for name, test in itertools.chain(_profile1.test_list.items(),
+                                   _profile2.test_list.items()):
+     if isinstance(test, (PiglitGLTest, ShaderTest, MultiShaderTest)):
+         profile.test_list['{} khr_no_error'.format(name)] = test
+-        test.command += ['-khr_no_error']
++        test._command += ['-khr_no_error']
+-- 
+2.39.5
+
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index e30efdf33bd..dc210ff56d8 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            file://0001-tests-Fix-narrowing-errors-seen-with-clang.patch \
            file://0001-CMakeLists.txt-do-not-obtain-wayland-scanner-path-fr.patch \
            file://0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch \
+           file://0001-tests-no_error.py-modify-_command-and-not-command.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
@@ -48,8 +49,6 @@ PACKAGECONFIG[x11] = "-DPIGLIT_USE_X11=1 -DPIGLIT_BUILD_GL_TESTS=ON -DPIGLIT_BUI
 PACKAGECONFIG[vulkan] = "-DPIGLIT_BUILD_VK_TESTS=ON,-DPIGLIT_BUILD_VK_TESTS=OFF,glslang-native vulkan-loader,glslang"
 PACKAGECONFIG[wayland] = "-DPIGLIT_USE_WAYLAND=1,-DPIGLIT_USE_WAYLAND=0,wayland-native wayland wayland-protocols"
 
-export PIGLIT_BUILD_DIR = "../../../../git"
-
 do_configure:prepend() {
    if [ "${@bb.utils.contains('PACKAGECONFIG', 'freeglut', 'yes', 'no', d)}" = "no" ]; then
         sed -i -e "/^#.*include <GL\/freeglut_ext.h>$/d" ${S}/src/piglit/glut_wrap.h
-- 
2.39.5


