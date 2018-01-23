Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id 935FD78741
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 16:01:18 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id a27so2542631qtd.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jan 2018 08:01:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:organization;
	bh=ti3D8xh08AG6CSUvHHB8XsI0rharh9hbR8cmf7vI76M=;
	b=LfvIBXzpq2Nb2wnLdeSKD9/C9RdMNjZBG8xd3hhTauklq7jTCD0V+PiU3voTyOlNiy
	hC8Pb8ov/x79APhNuv0qFTDpNe3yAN53kRD4JYk1bZtvdqckselbtjxvs54gL+WtBoN5
	WzTje79C8joPVf6sSPqzVQ/MyQm4rV5wp3e4uxTsk/kAA+Dee/uhi7xQx4i4mPjVUeCo
	0fF2IiqtKKPV/968WM5CxViIglm7Zi0a284kRM/UKn0BEszOBE3OUcsUw3HzjBLSFhPa
	y4u9yLcg3OUwZuPMuD1PTBXr5pH+DvwInhnNDk5/ach+at5mxkNxuRd77DhZDqsPIo5Q
	TS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=ti3D8xh08AG6CSUvHHB8XsI0rharh9hbR8cmf7vI76M=;
	b=KtRjtj9mxd+7lmuK/7OrwrRqSm5PPVawcq28gSIAENJc0SBDxNmMJWC8tUjD3EXInZ
	Tzlt3dUf7cTY10EXKp89VRfCzccmPYLvIVbUJAFMsDFD3hNVVW7sD8wG2F2EYoCfxc6+
	41L9Bv1FICjlAmKLxvGqw7JGYzxvxyz07wIg/hOaJ5EOt/ZVXtN4eoqs5+O4qnSPWOGn
	gpaNpy7GtG8Zf1gpb35U1baEAb0m1uYWvfiF8QUa/OaQ8AS92cW7zGRIiUISQ1ycmA4B
	UJVtLoEbSfIB2onsIAI3HArguWnrWpoW3K2BwS3ohguVmpyokWmvhWZfheyKl9OMUeF6
	Gavw==
X-Gm-Message-State: AKwxytdoW5244kuP5DNAP5Q37my/dh+q9LCpzEA5xZsQAUMiwFbIN7dr
	g9sXbamQ+n0VnCOH92Vjti5tSpNU
X-Google-Smtp-Source: AH8x226vbiJPjLCRQjfxkjPIkkGulH812B8lpCueGBxF5IEErEnGZckx3wzMduHN8unSzSDwa4f7Rg==
X-Received: by 10.55.21.1 with SMTP id f1mr3951945qkh.135.1516723279390;
	Tue, 23 Jan 2018 08:01:19 -0800 (PST)
Received: from centrium.lab.ossystems ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id g1sm524404qta.46.2018.01.23.08.01.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Jan 2018 08:01:17 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jan 2018 14:01:00 -0200
Message-Id: <20180123160100.20345-1-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.14.2
Organization: O.S. Systems Software LTDA.
Subject: [rocko][PATCH] libepoxy: Fix build break for EGL_CAST dependency
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
X-List-Received-Date: Tue, 23 Jan 2018 16:01:18 -0000

From: Tom Hochstein <tom.hochstein@nxp.com>

This is a backport [1] to fix the following build error:

| In file included from /home/r60874/upstream/xwayland/tmp/work/armv7at2hf-neon-mx6qdl-fslc-linux-gnueabi/gtk+3/3.22.17-r0/recipe-sysroot/usr/include/epoxy/egl.h:46:0,
|                  from ../../../gtk+-3.22.17/gdk/wayland/gdkglcontext-wayland.h:32,
|                  from ../../../gtk+-3.22.17/gdk/wayland/gdkglcontext-wayland.c:24:
| ../../../gtk+-3.22.17/gdk/wayland/gdkglcontext-wayland.c: In function 'gdk_wayland_gl_context_realize':
| ../../../gtk+-3.22.17/gdk/wayland/gdkglcontext-wayland.c:179:43: error: expected expression before 'EGLContext'
|                                          : EGL_NO_CONTEXT,
|                                            ^

[1] https://github.com/anholt/libepoxy/commit/ebe3a53db1c0bb34e1ca963b95d1f222115f93f8

Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit b468e28194be39f6d6a2084bb51773c45253d5f7)
Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
Acked-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../Add-fallback-definition-for-EGL-CAST.patch     | 33 ++++++++++++++++++++++
 meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb   |  3 +-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/libepoxy/libepoxy/Add-fallback-definition-for-EGL-CAST.patch

diff --git a/meta/recipes-graphics/libepoxy/libepoxy/Add-fallback-definition-for-EGL-CAST.patch b/meta/recipes-graphics/libepoxy/libepoxy/Add-fallback-definition-for-EGL-CAST.patch
new file mode 100644
index 0000000000..b9297257dc
--- /dev/null
+++ b/meta/recipes-graphics/libepoxy/libepoxy/Add-fallback-definition-for-EGL-CAST.patch
@@ -0,0 +1,33 @@
+Add fallback definition for EGL_CAST
+
+The EGL API update from d11104f introduced a dependency on the
+EGL_CAST() macro, provided by an updated eglplatform.h. Given that we
+don't provide eglplatform.h, add a fallback definition for if we're
+building against Mesa 17.0.x or similar.
+
+https://bugs.gentoo.org/show_bug.cgi?id=623926
+
+Upstream-Status: Backport [https://github.com/anholt/libepoxy/commit/ebe3a53db1c0bb34e1ca963b95d1f222115f93f8]
+
+Signed-off-by: Tom Hochstein <tom.hochstein@nxp.com>
+
+Index: libepoxy-1.4.3/src/gen_dispatch.py
+===================================================================
+--- libepoxy-1.4.3.orig/src/gen_dispatch.py	2017-06-06 04:24:13.000000000 -0500
++++ libepoxy-1.4.3/src/gen_dispatch.py	2017-11-06 12:45:43.594966473 -0600
+@@ -491,6 +491,15 @@
+             self.outln('#include "epoxy/gl.h"')
+             if self.target == "egl":
+                 self.outln('#include "EGL/eglplatform.h"')
++                # Account for older eglplatform.h, which doesn't define
++                # the EGL_CAST macro.
++                self.outln('#ifndef EGL_CAST')
++                self.outln('#if defined(__cplusplus)')
++                self.outln('#define EGL_CAST(type, value) (static_cast<type>(value))')
++                self.outln('#else')
++                self.outln('#define EGL_CAST(type, value) ((type) (value))')
++                self.outln('#endif')
++                self.outln('#endif')
+         else:
+             # Add some ridiculous inttypes.h redefinitions that are
+             # from khrplatform.h and not included in the XML.  We
diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
index c8b398f176..0172322b92 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb
@@ -5,7 +5,8 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=58ef4c80d401e07bd9ee8b6b58cf464b"
 
-SRC_URI = "https://github.com/anholt/${BPN}/releases/download/${PV}/${BP}.tar.xz"
+SRC_URI = "https://github.com/anholt/${BPN}/releases/download/${PV}/${BP}.tar.xz \
+           file://Add-fallback-definition-for-EGL-CAST.patch"
 SRC_URI[md5sum] = "af4c3ce0fb1143bdc4e43f85695a9bed"
 SRC_URI[sha256sum] = "0b808a06c9685a62fca34b680abb8bc7fb2fda074478e329b063c1f872b826f6"
 UPSTREAM_CHECK_URI = "https://github.com/anholt/libepoxy/releases"
-- 
2.14.2


