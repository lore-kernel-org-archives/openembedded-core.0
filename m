Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f53.google.com (mail-pl0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id DA2ED79029
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 16:32:51 +0000 (UTC)
Received: by mail-pl0-f53.google.com with SMTP id g6-v6so8516634plq.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Aug 2018 09:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=E9g64zqCggKgjWVrXQgXb38Bdya+7kMi6UwU+NGH7PA=;
	b=fVB6BD9NCm5ct2XXcniJHq0oteBCydDYS88h0zcIyky3r9BuMC5jgPoHKrsUZX0NeA
	k5nNixzygeoy868c17hR83LrH0u+Ww84SZCJrI5M0XT8nEixKpqv8tNv/hMGLAq0ctHT
	mkQGDZYtrjLIR9kMlEOhqbqMb3Y5YX1auBPpYhBGhQUze8tTIktstT8wpxHEJeFxsGTF
	i9agGYNQB+i18qv2m+H5zUt53ezgryzlPOR34ln6V2IwSpzCbLQ4zYom3d753lhBtoTS
	50Pa5JZ6N5x8d0zlHALgNI04ZOCeBFL9y2v0TWJ93SIvMPT9e8JCJWvgOtZ2S6WXX7Ox
	ktkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=E9g64zqCggKgjWVrXQgXb38Bdya+7kMi6UwU+NGH7PA=;
	b=lr/unHAq3PpIXRXz5AcSnkznZfOjqk8OOX7GYcXGoJERaZPZ154+XSjSwsjQ4jC7bp
	PPJpqJjRaXB89GwFlJc6Pqna/5GKF9/p6A1liyI5UUchr4nCrdy+yNvIGMkMYpQDDqa7
	lLyL001rBoa1Bgpj22Wce0aSfdgkS4GaFKVuYlUWCcu3d0TA2xb33lnpRmr7eQtrXHIg
	CLrdRVvseN7Jwm0R92XZ3yc3yGe7SmjPpXaQGDWuMQPZAoTeYg9BYqBrl6runMWQ7Kbn
	I86bMz2/vyASvg0QbEbCk34WJl3g00FAHxEfHkXTXpap4HokP6PlGNqgG5M6ZGAO8FRq
	rdrw==
X-Gm-Message-State: AOUpUlF42qI2crnixRwJicLIxCho7LblkwDyW9CLMxh9opD4hkWx2tVq
	n3CSqVXl91rOebrOhgdXsxL/4xeo
X-Google-Smtp-Source: AA+uWPyj7YWKc9FCWrb2cPL84vNodfERTNL4R24p9rkMOPRp+efi8F3kKowh2JBRgERZf9A7y1B6Pw==
X-Received: by 2002:a17:902:20e3:: with SMTP id
	v32-v6mr21260326plg.232.1534264372589; 
	Tue, 14 Aug 2018 09:32:52 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::f217])
	by smtp.gmail.com with ESMTPSA id
	v6-v6sm41075345pfa.28.2018.08.14.09.32.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Aug 2018 09:32:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Aug 2018 09:32:43 -0700
Message-Id: <20180814163243.24088-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180814163243.24088-1-raj.khem@gmail.com>
References: <20180814163243.24088-1-raj.khem@gmail.com>
Subject: [PATCH 2/2] eglinfo: Fix build with raspberrypi with userland graphics driver
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
X-List-Received-Date: Tue, 14 Aug 2018 16:32:51 -0000

Let pkgconfig figure out headers and libraries instead of manually
forcing waf to do it.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/eglinfo/eglinfo.inc     |  3 +-
 ...01-Check-for-libegl-using-pkg-config.patch | 31 +++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/eglinfo/files/0001-Check-for-libegl-using-pkg-config.patch

diff --git a/meta/recipes-graphics/eglinfo/eglinfo.inc b/meta/recipes-graphics/eglinfo/eglinfo.inc
index 8e7d9bddda..c8f0e897bf 100644
--- a/meta/recipes-graphics/eglinfo/eglinfo.inc
+++ b/meta/recipes-graphics/eglinfo/eglinfo.inc
@@ -8,6 +8,7 @@ DEPENDS = "virtual/egl"
 
 SRC_URI = "git://github.com/dv1/eglinfo.git;branch=master \
            file://0001-Add-STAGING_INCDIR-to-searchpath-for-egl-headers.patch \
+           file://0001-Check-for-libegl-using-pkg-config.patch \
           "
 SRCREV = "4b317648ec6cf39556a9e5d8078f605bc0edd5de"
 
@@ -15,7 +16,7 @@ CVE_PRODUCT = "eglinfo"
 
 S = "${WORKDIR}/git"
 
-inherit waf distro_features_check
+inherit waf distro_features_check pkgconfig
 # depends on virtual/egl
 REQUIRED_DISTRO_FEATURES ?= "opengl"
 
diff --git a/meta/recipes-graphics/eglinfo/files/0001-Check-for-libegl-using-pkg-config.patch b/meta/recipes-graphics/eglinfo/files/0001-Check-for-libegl-using-pkg-config.patch
new file mode 100644
index 0000000000..0289ac228c
--- /dev/null
+++ b/meta/recipes-graphics/eglinfo/files/0001-Check-for-libegl-using-pkg-config.patch
@@ -0,0 +1,31 @@
+From 58d51d941d3f4dfa38be18282d3e285d76d9020d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 13 Aug 2018 15:46:53 -0700
+Subject: [PATCH] Check for libegl using pkg-config
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ wscript | 1 +
+ 1 file changed, 1 insertion(+)
+
+Index: git/wscript
+===================================================================
+--- git.orig/wscript
++++ git/wscript
+@@ -160,14 +160,9 @@ def configure_raspberrypi_device(conf, p
+ 		conf.env['PLATFORM_USELIBS'] += ["X11"]
+ 	elif platform == "fb":
+ 		conf.env['PLATFORM_SOURCE'] = ['src/platform_fb_raspberrypi.cpp']
+-	conf.check_cxx(mandatory = 1, lib = ['GLESv2', 'EGL', 'bcm_host'], uselib_store = 'EGL')
++	conf.check_cfg(package='egl', args='--libs --cflags')
+ 	import os
+ 	sysroot = conf.options.sysroot + conf.options.prefix
+-        std_include_path = os.path.join(sysroot, 'include')
+-	vcos_pthread_path = os.path.join(sysroot, 'include/interface/vcos/pthreads')
+-	vcms_host_path = os.path.join(sysroot, 'include/interface/vmcs_host/linux')
+-	if not conf.check_cxx(mandatory = 0, header_name = ['vcos_platform_types.h', 'EGL/egl.h', 'bcm_host.h'], includes = [vcos_pthread_path, vcms_host_path, std_include_path], uselib_store = 'EGL'):
+-		conf.fatal('Check if --prefix and --sysroot are set correctly.')
+ 	conf.env['WITH_APIS'] = []
+ 	if check_gles2(conf):
+ 		conf.env['WITH_APIS'] += ['GLES1', 'GLES2']
-- 
2.18.0


