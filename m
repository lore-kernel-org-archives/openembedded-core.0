Return-Path: <limon.anibal@gmail.com>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id BF1387807D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 15:12:51 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id q3so140727oth.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Nov 2017 07:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YkhgFKpioqmvUmWzTGgJRT/eb3b+bopZ1Cd0F9D2Wgk=;
	b=UNPcA+1Rqp+//SmS1jEatvzAxHlSluHTwedK1KBkYueZ/aN81L/D553B3w27h9bxGf
	yQ3AlKsUbAK4VH9kJVm1wSnq1xp5EoFPdAgoZZhHcWLVW3MKnOvDPulUbSGgPsx7jRRx
	35Bp63G+0Ss9G0pfxbRA/qPcpLuwb2KAiH8eQ4CMl5xHKNFe8E3f2RjKj0Omx9ZcOOcO
	5H1O86aFKzYP0zFWYAdbz//UWVjUs95WeLHPq6P9qEsdfzKBWJPHD8+TIS5peh3R6IEc
	txV0KlwUZ+DdQWLmbK4KKCukoDI6HsWOj9UgGg9xqGrCf9E1/alEHIVDTAeWQSB9Ge84
	M67A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=YkhgFKpioqmvUmWzTGgJRT/eb3b+bopZ1Cd0F9D2Wgk=;
	b=EUoWhkIuTaYdjpL73CgWW1u/Ynhd3OFO2n3hjNhjj1zhLcJukoy1r8+T/hJhw1i/2W
	bqIbypxJ/bcBPuUscghfkIBrX49OWlpElWcvXIxZIaXTe23YHbuaVNaMPzkBQSHybrdR
	tD0sEQiFfMHlcI8BO0gM6H9WlbXAx8yKhhvFOa+hLPLdSa1EP3Vf88OIoKc9Vopjn4Ec
	BL66sIqyKYMocSDFuD2Y7lso8VOxov7FXzqh+00xTs4C0sQDAI280BJk06/rVrqttUWf
	qFTxfnlRG15NQCFYivPLGJGlko943pd31Her2FaZ+d5S7znKgdj0yJIQWxRMrUHJKcRD
	PNsg==
X-Gm-Message-State: AJaThX7XDZFeQhlAwk/qVOaOznDV9GiWiSWyiXAdwr1vv2PYscT+k6WZ
	S148iyQkfQAG4UjHTIs/pWFlHB0T
X-Google-Smtp-Source: AGs4zMargbobgv20/JP1yUAAy3Ph0QU3+UiBUniTPfUSnxIviWnIOxIYF+Nlsu24AQ5OqvBDr7Gx9A==
X-Received: by 10.157.81.105 with SMTP id u38mr29606289oti.231.1511881972258; 
	Tue, 28 Nov 2017 07:12:52 -0800 (PST)
Received: from blackbox.Home (187-177-61-29.dynamic.axtel.net. [187.177.61.29])
	by smtp.gmail.com with ESMTPSA id
	j3sm12231275oia.15.2017.11.28.07.12.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 28 Nov 2017 07:12:51 -0800 (PST)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <limon.anibal@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Nov 2017 09:12:48 -0600
Message-Id: <20171128151248.6601-1-limon.anibal@gmail.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Cc: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCHv3] recipes-graphics/piglit: Add patch to fix build in some platforms
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
X-List-Received-Date: Tue, 28 Nov 2017 15:12:52 -0000
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
index 0000000000..fbd60f23e7
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
+https://cgit.freedesktop.org/piglit/commit/?id=cb562a3832
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


