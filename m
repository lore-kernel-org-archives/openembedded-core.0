Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 091FE6FFD4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 13:47:03 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id u63so24607424wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Dec 2015 05:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Matxez+QMNxrXrxgKRAQhMhDwmgwNRKMCpE8l4+cmHU=;
	b=yb7jE9/W+ONzFJ0PcFZOH/qVobrEBhAmhKuLra33T+icx+XSOaGnFR+LCuPSRxjIhq
	S573sP5UXSL67eehag2FaarjOBKqwynvWlz5zlkHTWNQJ9+B+fjSmGSQXMrKXYlSBsKT
	5bUwuM39rRRZMkJUFgvFZfV3c5qDTX6zqPpwvE/BGa1oBrghUKIDnX+wC0jamKLLb4h5
	MJlDq5FubGO9+plGQ1mL2JPpLZZM8qmbRMSoNLlyAII30IA/qZ6RAtjEVp0gygtFFgs8
	VTImGnGK1/eqTuspKVuu8F0SeDbi8qjuBuf8Jwyb3R9vDpaeQeoEG3Nap4Y5Yw8oOQqf
	oNVQ==
X-Received: by 10.194.57.178 with SMTP id j18mr15085017wjq.113.1449755223664; 
	Thu, 10 Dec 2015 05:47:03 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	kb5sm12503227wjc.20.2015.12.10.05.47.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 05:47:02 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Dec 2015 14:48:30 +0100
Message-Id: <1449755316-17611-9-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1449754341.git.Martin.Jansa@gmail.com>
References: <cover.1449754341.git.Martin.Jansa@gmail.com>
Subject: [PATCH 09/11] libsdl2: require GLES when building Wayland support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Dec 2015 13:47:03 -0000

From: Ross Burton <ross.burton@intel.com>

The Wayland support requires GLES2 to be enabled as otherwise the EGL support
code in SDL2 isn't enabled.

| In file included from .../SDL2-2.0.3/src/video/wayland/SDL_waylandvideo.c:34:0:
| .../SDL2-2.0.3/src/video/wayland/SDL_waylandvideo.c: In function 'Wayland_CreateDevice':
| .../SDL2-2.0.3/src/video/wayland/SDL_waylandopengles.h:38:38: error: 'SDL_EGL_GetSwapInterval' undeclared (first use in this function)
|  #define Wayland_GLES_GetSwapInterval SDL_EGL_GetSwapInterval

Solve this by adding gles2 to the Wayland PACKAGECONFIG option.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb b/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb
index 97f64f3..f138f97 100644
--- a/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb
+++ b/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb
@@ -39,7 +39,7 @@ PACKAGECONFIG ??= " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland gles2', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
 "
 PACKAGECONFIG[alsa]       = "--enable-alsa --disable-alsatest,--disable-alsa,alsa-lib,"
-- 
2.6.3


