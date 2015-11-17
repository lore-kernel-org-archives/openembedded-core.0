Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id BA6816010B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 11:58:18 +0000 (UTC)
Received: by wmec201 with SMTP id c201so22319050wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 03:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=Matxez+QMNxrXrxgKRAQhMhDwmgwNRKMCpE8l4+cmHU=;
	b=cyZWlEHmsYhFO8dLtZdlrjHyGjQUqUNMUwWiyWrgzJn24dyGywDt6BPJVyYhYAB0p2
	X1MIua3CFv/wrtTnbHRBiPL4kXvvThLo7Cva+WFz1MBKvKhQqn9Pk9/uh5GIpGCoF0ub
	Ibn92+pIcCtmHSY/ieWg1rxA9CkilXz30LOwOLvA/TLFo1kc1TtRG1k8QwBlrqDbH/V/
	Y4O8SdqOL7xTGjFT1qVdBBYAKBp6qfpd1dJ1Yuxv15/U3X6giWcL7dL69mS0VW9YC2uO
	oC2lsMYWjfB5bQ3L7NZc77P53Q3wD8PSUb3ONPRWw0Bhbwu69uhrxan0Y0cGtrsoYhZq
	FN8g==
X-Received: by 10.194.92.138 with SMTP id cm10mr43299972wjb.6.1447761498763;
	Tue, 17 Nov 2015 03:58:18 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	v4sm30040497wjx.18.2015.11.17.03.58.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Nov 2015 03:58:17 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Nov 2015 11:58:08 +0100
Message-Id: <82ab52c6235587509b01dcef43516e98a2ecc40d.1447757562.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.3
In-Reply-To: <cover.1447757562.git.Martin.Jansa@gmail.com>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1447757562.git.Martin.Jansa@gmail.com>
References: <cover.1447757562.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 16/16] libsdl2: require GLES when building Wayland support
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
X-List-Received-Date: Tue, 17 Nov 2015 11:58:19 -0000

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


