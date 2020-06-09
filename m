Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web11.4632.1591700248096807300
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 03:57:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: quanyang.wang@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 059AvRqU001543
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Jun 2020 03:57:27 -0700 (PDT)
Received: from pek-qwang2-d1.wrs.com (128.224.162.199) by
 ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
 14.3.487.0; Tue, 9 Jun 2020 03:57:26 -0700
From: "quanyang.wang" <quanyang.wang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] mesa: use x11 as egl_native_platform when the configure argument "platforms" contains x11
Date: Tue, 9 Jun 2020 18:57:25 +0800
Message-ID: <20200609105725.31674-1-quanyang.wang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Quanyang Wang <quanyang.wang@windriver.com>

This fixes an issue that the mesa egl library detecting the wrong
platform type.

Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
---
When mesa update from 19.1 to 20.0, there is an issue that the mesa egl
will detect the wrong platform type, this issue results that in the sato
X11 window system all opengl/opengles apps by using egl run into
"Segmentation fault".

I have filed a bug to mesa community:
https://gitlab.freedesktop.org/mesa/mesa/-/issues/3075#note_519060
Until now there is no response from the developers.

There are several solutions to resolve it:
1) When running an openg/opengles app in sato, export
EGL_PLATFORM="x11".
2) Adjust the configure argument order in mesa.inc to make "-Dplatforms=wayland,x11,drm,surfaceless"
to be "-Dplatforms=x11,wayland,drm,surfaceless" to dodge this issue.
3) Apply this patch for a workaround then waiting for mesa development
community to work out a perfect solution.

 ...-egl_native_platform-when-the-config.patch | 57 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc           |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-meson-use-x11-as-egl_native_platform-when-the-config.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-meson-use-x11-as-egl_native_platform-when-the-config.patch b/meta/recipes-graphics/mesa/files/0001-meson-use-x11-as-egl_native_platform-when-the-config.patch
new file mode 100644
index 0000000000..825dc988a0
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-meson-use-x11-as-egl_native_platform-when-the-config.patch
@@ -0,0 +1,57 @@
+From 8fe9af6ba8477f6a3d7a85168bb47e7d953d090c Mon Sep 17 00:00:00 2001
+From: Quanyang Wang <quanyang.wang@windriver.com>
+Date: Tue, 9 Jun 2020 10:59:47 +0800
+Subject: [PATCH] meson: use x11 as egl_native_platform when the configure
+ argument "platforms" contains x11
+
+When mesa is configured with argument "-Dplatforms=wayland,x11,drm,surfaceless",
+in meson.build, the "wayland" is the first element of "platforms" and the
+"egl_native_platform" will be "wayland", then in src/egl/meson.build,
+_EGL_NATIVE_PLATFORM will be assigned to be _EGL_NATIVE_WAYLAND. And in the
+commit 86d3a346 ("egl: fix _EGL_NATIVE_PLATFORM fallback"), the function
+_eglNativePlatformDetectNativeDisplay delete the return value _EGL_PLATFORM_X11
+when detecting "wayland" and "gbm" failed, this will result that in _eglGetNativePlatform
+the platform type will be _EGL_NATIVE_PLATFORM which is equal to be _EGL_NATIVE_WAYLAND
+even if the app runs at a "X11" platform.
+
+So when an X11 app using egl:
+x_dpy = XOpenDisplay(NULL);
+...
+dpy = eglGetDisplay((EGLNativeDisplayType) x_dpy);
+eglGetDisplay will run into crash because libEGL.so detected the wrong platform type.
+
+root@genericx86-64:~# export DISPLAY=:0
+root@genericx86-64:~# eglgears_x11
+Segmentation fault
+
+When apps run at wayland or gbm platform, eglGetDisplay can detect the platform type
+automatically, but x11 can't. So use x11 as egl_native_platform when the configure
+argument "platforms" contains x11.
+
+Upstream-Status: Pending
+
+Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
+---
+ meson.build | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index b25fa19..ae95e73 100644
+--- a/meson.build
++++ b/meson.build
+@@ -307,7 +307,11 @@ if _platforms.length() != 0 and _platforms != ['']
+     error('Invalid argument list given to -Dplatforms, please fix.')
+   endif
+   with_platforms = true
+-  egl_native_platform = _platforms[0]
++  if with_platform_x11
++    egl_native_platform = 'x11'
++  else
++    egl_native_platform = _platforms[0]
++  endif
+ endif
+ 
+ _xlib_lease = get_option('xlib-lease')
+-- 
+2.17.1
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 965e12d17e..ccaf42f9ad 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -21,6 +21,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0004-Revert-mesa-Enable-asm-unconditionally-now-that-gen_.patch \
            file://0005-vc4-use-intmax_t-for-formatted-output-of-timespec-me.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
+           file://0001-meson-use-x11-as-egl_native_platform-when-the-config.patch \
            "
 
 SRC_URI[md5sum] = "609cb7664204e031d4c65c602c652a28"
-- 
2.17.1

