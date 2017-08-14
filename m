Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2213E783DA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 03:24:26 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id y129so8404761pgy.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Aug 2017 20:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5Z1QvFff/sW7bEs4/J8vBVn1QY67k3qpY5M8SDULyko=;
	b=PFY3Xa13d9ak+9YiRMAJOhEzlWqBNb5bz8Fe4+0FTLK3NOciJKvw0i8j2p1SMyHejk
	80iGcm3ZpLAh7USEZEnX8Y57/oTfrj2MTZVse1Nhf82Qcj+6daG/CnCzWABh7MJZNXKu
	nAvgMxXa8Ej7l0VeQk7ocoPLZd3IeInAB16knnqLh9JgXyqMSbI6BA5vNBSE8gmNJnn4
	UqycKEyz023xOChE4E7q4hv1m2zgl427F//cFfZYXIomtVI0aoqdL3Iic9Y4oGYjV1Bb
	JoK4eujE7cE60v7zx++Ibz+GUt16K2mxtkzMGt5egslyLoI5/XGCApnXO+XXV7LBo8u8
	/vJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5Z1QvFff/sW7bEs4/J8vBVn1QY67k3qpY5M8SDULyko=;
	b=mpmjUOf7BG59ARz/2xOHqXuVohkyExNH0aCTDay9yu6uUNVmZgaSVbxbF1A+5JKcFE
	Q82fTm9a/jAZxtq3IhmD5WDpMOsgIDSJMNsm73UO7KENftwnW8G0nVOiXyCx9d+TmQBT
	bWWrHdhqsbsd7ERZfD7tsT3AZV0Qjt7PkTqab+fDSGbEbcOTR5WFu2j82pJgCNTrSd7m
	r5m7UIT5lHqnVw1RHPrk+tdXgdCsu/DXPVNO+rq960+BTZXEjg+FnbZV9IQT5qRAx9gX
	Yz0mibIKnYZ+nj5kTboy0zFhPXlXumpAcTeJUZ/VMBi9266i4Tmt0bSKvTgYtO1p0i2D
	ydJg==
X-Gm-Message-State: AHYfb5gCBrUSxk25VkG5W36FlraD5TjUWpf++St0j3vh31Vhrmuiepfq
	NfYDmvC1Zat9fziw
X-Received: by 10.84.133.11 with SMTP id 11mr26808888plf.77.1502681068281;
	Sun, 13 Aug 2017 20:24:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::8319])
	by smtp.gmail.com with ESMTPSA id
	y87sm11930051pfa.41.2017.08.13.20.24.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 13 Aug 2017 20:24:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Aug 2017 20:24:17 -0700
Message-Id: <20170814032418.3936-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170814032418.3936-1-raj.khem@gmail.com>
References: <20170814032418.3936-1-raj.khem@gmail.com>
Subject: [PATCH 2/3] mesa: Enable gallium-llvm on x86 and x86_64
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
X-List-Received-Date: Mon, 14 Aug 2017 03:24:27 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/cairo/cairo.inc | 3 ++-
 meta/recipes-graphics/mesa/mesa.inc   | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
index 8e1e2e1b88..f07b42d573 100644
--- a/meta/recipes-graphics/cairo/cairo.inc
+++ b/meta/recipes-graphics/cairo/cairo.inc
@@ -22,7 +22,8 @@ X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
 DEPENDS = "libpng fontconfig pixman glib-2.0 zlib"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)} \
-           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)}"
+           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)}"
 
 PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no --disable-xlib,${X11DEPENDS}"
 PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 45361c7790..a26858df85 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -36,6 +36,9 @@ PACKAGECONFIG ??= "gbm egl gles dri \
 		${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11 vulkan', d)} \
 		${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
 		"
+PACKAGECONFIG_append_x86 = " gallium-llvm gallium r600"
+PACKAGECONFIG_append_x86-64 = " gallium-llvm gallium r600"
+
 PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm"
 
 X11_DEPS = "xf86driproto glproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
-- 
2.14.1


