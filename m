Return-Path: <limon.anibal@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 33C8D6011A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 16:52:06 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id e142so15440631oih.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Nov 2017 08:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8/auwI34rWxEGGSMzKyv5LfSlFfGq0y5be+ObSFKXZY=;
	b=i+1ndp7yLH7bdtFU3Si6PKEdX7+D3B+ae7lwXGM2X6DFRrAGuiJKPp8aS6njytJi1R
	uhZW98w8OPyoVdF4Ga3iZ+JXBvLJHBV93Mrq+h4y0MV0/OdlfE/k1esOIaoNC4pqFAV3
	Sup4t1/CsHWXowKy6jnI5vj+c6Z6McouHqAFEwr1thpdGpo3Y9/YPwjWr7xXeVBLbBue
	ln8bnuk1BKHI5iSSwF9ujBZqFULdpA5aWtsW/LAcsYjFc0goZgrzArPPn8r/RSLLDh6u
	GjhevAHL6ah/M+bKSHwd4aW14U9rfXAsCm+GsPL+nYRmJjflvXNtY0g0R+f74METXapq
	uRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=8/auwI34rWxEGGSMzKyv5LfSlFfGq0y5be+ObSFKXZY=;
	b=MG15H+fXaxLG11/M6pJIO+Ki7nXNMTyHAo6y3izLthsKsvYsTZCHkDi/rUKGDV/zsQ
	eDMlzcNCL7yNNKdmz9PsS7easjZdyTnu5ZBcVraQrnPFse5vtjlTzG1vSJkfoJglYi0x
	YMifnZGeS2mHEcRRy61DAa+O9bpHEcMMVJWjlUcM6NwlXP+SmyPq8oMkR+7HrdjAr4tt
	ozpG80/egypozx4i1tOEk2aXKmRYlk2gx5LRdlIndxMICOR3U/KO76mR7I2B8ZCv/WwQ
	zuE3fxZWYensBQxgkzyRRPJcuyll0nY9y8NIjdHreK535ENskeMhu/euf8TbXjdrckLE
	X0gg==
X-Gm-Message-State: AJaThX4x5hAVyV7Af2/JsBK05KJNQW+WKI0a0yMHZwphkkJ54kMp0N51
	AMalSw2CXmd7QI/7kJkCkX3+xKoz
X-Google-Smtp-Source: AGs4zMZefdGQgjzxh/YYol3yqdF6Ox4nqngGA49w4qAoTQd+6OvxLDRntDG9Nb1HTrBL5mIExAvr+g==
X-Received: by 10.202.57.66 with SMTP id g63mr17538166oia.346.1511542327500;
	Fri, 24 Nov 2017 08:52:07 -0800 (PST)
Received: from blackbox.Home (187-177-61-29.dynamic.axtel.net. [187.177.61.29])
	by smtp.gmail.com with ESMTPSA id f62sm990762oic.44.2017.11.24.08.52.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Nov 2017 08:52:06 -0800 (PST)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <limon.anibal@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Nov 2017 10:52:03 -0600
Message-Id: <20171124165203.11759-1-limon.anibal@gmail.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Cc: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
Subject: [PATCH] recipes-graphics/piglit: Add patch for fix build in HiKey platforms
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
X-List-Received-Date: Fri, 24 Nov 2017 16:52:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Aníbal Limón <anibal.limon@linaro.org>

Some EGL implementations do not actually ship all Khronos-extensions.
As it turns out, the Mali 450 driver does not include eglGetPlatformDisplay
symbol so there is not grauntee to exists use piglit_egl_get_default_display
wrapper instead.

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
 ...gl-context-priority.c-Use-piglit_egl_get_.patch | 39 ++++++++++++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb         |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-tests-egl-egl-context-priority.c-Use-piglit_egl_get_.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-tests-egl-egl-context-priority.c-Use-piglit_egl_get_.patch b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-egl-context-priority.c-Use-piglit_egl_get_.patch
new file mode 100644
index 0000000000..6b73950fc1
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-tests-egl-egl-context-priority.c-Use-piglit_egl_get_.patch
@@ -0,0 +1,39 @@
+From 3b6c3abe3698abb0ae08d14a399eea29805cafd6 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
+Date: Fri, 24 Nov 2017 10:11:42 -0600
+Subject: [PATCH] tests/egl/egl-context-priority.c: Use
+ piglit_egl_get_default_display
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Some EGL implementations do not actually ship all Khronos-extensions.
+As it turns out, the Mali 450 driver does not include eglGetPlatformDisplay
+symbol so there is not grauntee to exists use piglit_egl_get_default_display
+wrapper instead. See rev 45095dc08b.
+
+Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
+Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
+
+Upstream-Status: Submitted [piglit@lists.freedesktop.org]
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
index eae3eed342..c6d4e5c6e0 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b2beded7103a3d8a442a2a0391d607b0"
 SRC_URI = "git://anongit.freedesktop.org/piglit \
            file://0001-cmake-install-bash-completions-in-the-right-place.patch \
            file://0001-tests-Use-FE_UPWARD-only-if-its-defined-in-fenv.h.patch \
+           file://0001-tests-egl-egl-context-priority.c-Use-piglit_egl_get_.patch \
            "
 
 # From 2017-02-06
-- 
2.11.0


