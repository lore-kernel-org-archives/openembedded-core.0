Return-Path: <limon.anibal@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2FF2A600EB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 14:59:33 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id x4so49706plv.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 06:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BqzLbYECHb26ZPmdO3DDpfT8yfgIqQozvE8ncSJqwAw=;
	b=vQED7UCI+l0DY78DRLPK8bcTYVA64S7VFmx6LfHuCPi9CVmC2pV+LBeEyOEVlQZwIh
	qtQrTobF0YSRTpZ5Xa37n1zh5Q78E2tg2xfYxA4g6iLH1fCH1KRKYsNFVfHDWIyffsad
	mmVkwXBE7HJM96pYtvhqrWTsrHICj0EDO4hgMY6lJ24VyFgYxtmBo8gwFsK1jXVhkJfd
	xO99v3Ck9ShHvzsRLLfZ3GvElDZYIfoSbtkZISy93d0C6+qMQaCOEq23KfYicsjrE7F/
	ox6jlxCoteLLVnIraCr/EZdEcyKY7Fy1YWcq/Phk1lF3jpSIQa7fZNCpqZvg1735Wtr+
	aYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BqzLbYECHb26ZPmdO3DDpfT8yfgIqQozvE8ncSJqwAw=;
	b=ogXyFvz55dobu1n1CEJApizpTAYLsy+Y8qgz6qMnl8/zbXa7+4av2I9xNwVvyC02Wa
	T86LRV/x3OXawNswEPvfRwx1Fqg2b89+MGm+VHgGG4xPpHt+9hrl/eLPhoWw1wXM6dZO
	d5XxvpGYXMxDFwLnYTLdH9atnz6uvRJPorlavEPj5N8jWUlW2rmaS62FeuNKl3csTz+y
	S4mVZ7lW/MzC+M9ibUhTkB3VoEAZDYvKPXUAu6+c5WudkfU0WL18uu7JTosIvHVNLRbZ
	hX3K6WOcIQ+nal+OGVM40lKLjP+7hCacKjSHvHuumOewZBlP0FhW4OB2Y1VCPbV+4EQN
	ic1g==
X-Gm-Message-State: AJaThX5jkNBf5tSxn1ScZcRPPsDME2IR/ZlRmfZ5skf1F9ys3kqcGojS
	tgIqWrjggMq8nIjm6n2JYCCA2F6r
X-Google-Smtp-Source: AGs4zMbjg6eabCfN9r+OiBhvtg2cd6owPeGEXwcfm3blfWhEt8IAcQBZbXyfvBHJ982ci+xWptpoiw==
X-Received: by 10.84.244.2 with SMTP id g2mr42202898pll.170.1511881174511;
	Tue, 28 Nov 2017 06:59:34 -0800 (PST)
Received: from blackbox.Home (187-177-61-29.dynamic.axtel.net. [187.177.61.29])
	by smtp.gmail.com with ESMTPSA id
	125sm50304756pff.14.2017.11.28.06.59.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Nov 2017 06:59:33 -0800 (PST)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <limon.anibal@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Nov 2017 08:59:28 -0600
Message-Id: <20171128145928.5784-1-limon.anibal@gmail.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Cc: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCHv2] recipes-graphics/piglit: Add patch to fix build in some platforms
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
X-List-Received-Date: Tue, 28 Nov 2017 14:59:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Aníbal Limón <anibal.limon@linaro.org>

The entry point is not guaranteed to exist, so use the
piglit_egl_get_default_display() helper which does the correct thing.

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
 ...gl-context-priority.c-Use-piglit_egl_get_.patch | 41 ++++++++++++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb         |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-tests-egl-egl-context-priority.c-Use-piglit_egl_get_.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-egl-context-priority.c-Use-piglit_egl_get_.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-egl-context-priority.c-Use-piglit_egl_get_.patch
new file mode 100644
index 0000000000..13b997c037
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-egl-context-priority.c-Use-piglit_egl_get_.patch
@@ -0,0 +1,41 @@
+From cb562a383229074b44db6998b85572d2abe7c363 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
+Date: Fri, 24 Nov 2017 10:31:55 -0600
+Subject: [PATCH] tests/egl/egl-context-priority.c: Use
+ piglit_egl_get_default_display
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The entry point is not guaranteed to exist, so use the
+piglit_egl_get_default_display() helper which does the correct thing.
+
+Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
+Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
+Reviewed-by: Tapani Pälli <tapani.palli@intel.com>
+Reviewed-by: Emil Velikov <emil.velikov@collabora.com>
+
+Upstream-status: Backport
+
+https://github.com/Igalia/piglit/commit/cb562a3832
+---
+ tests/egl/egl-context-priority.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/tests/egl/egl-context-priority.c b/tests/egl/egl-context-priority.c
+index 7f26fc614..9590ccae3 100644
+--- a/tests/egl/egl-context-priority.c
++++ b/tests/egl/egl-context-priority.c
+@@ -99,8 +99,7 @@ piglit_init(int argc, char **argv)
+ 	if (!strstr(exts, "EGL_MESA_platform_surfaceless"))
+ 		piglit_report_result(PIGLIT_SKIP);
+ 
+-	dpy = eglGetPlatformDisplay(EGL_PLATFORM_SURFACELESS_MESA,
+-				    EGL_DEFAULT_DISPLAY, NULL);
++	dpy = piglit_egl_get_default_display(EGL_PLATFORM_SURFACELESS_MESA);
+ 
+ 	ok = eglInitialize(dpy, &major, &minor);
+ 	if (!ok) {
+-- 
+2.11.0
+
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index d274a8fbd5..45fd534dfa 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
 SRC_URI = "git://anongit.freedesktop.org/piglit \
            file://0001-cmake-install-bash-completions-in-the-right-place.patch \
            file://0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch \
+           file://0001-tests-egl-egl-context-priority.c-Use-piglit_egl_get_.patch \
            "
 UPSTREAM_VERSION_UNKNOWN = "1"
 
-- 
2.11.0


