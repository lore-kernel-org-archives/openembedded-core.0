Return-Path: <andrey.z@gmail.com>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 43B0F7FD76
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 10:45:32 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f129so6504347wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jan 2020 02:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Y8SUtSV/rboote8Un575+zKG4hrdNYjpmMisWQVLC7I=;
	b=upUAsL9GxijTj5TOT5KBKE6Rq36oQ1c+JwqIAdabgnAULfVbw8pLqhZM0VYX6mkUsz
	EQ+8OnL0tlu6DgmeIrLwwvBBcLm3WW7xNl/tjeyoA6mNmJTrFayIQHEwWSXVTi7yExJl
	Fzjc8X5hMo7waGBzBVDLxyg8O7IhtlApEq6K/HkDeCeusDij8mVYveoZU94l9s2gQjre
	0tGh4lFU33SHSWeo+OJzpeCsid0GaY1LnEGLBpx1lPCbLXdPnM3ovfaseC7A0LVosUuq
	dsFJnpNU5s0gXM3XtTJBFDCxVmZbWIRhxcCRv0q0tdEwaDaKP0IszNjcg9fw8fyi3HiS
	j2SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Y8SUtSV/rboote8Un575+zKG4hrdNYjpmMisWQVLC7I=;
	b=QG/8BCic+6lmGBpLSbCWvEFbycTzoQKM1jRbC8fDVcgdyZN5wk6BOrvGNlwIAPNgdR
	bwIFP1UinlUkDmBCR3Fan7aDLo1ytyKtOULWbGRYXDITVzHrs0zmqbwbdGoTyLeCsgra
	TpPG6HsO0nwD5XPFuLLG68cM6KPVd8ZvC2J3OcbmfOwanTPss39eElju0Nk5YM4owqiT
	4bWerCLdB6jQ7PhU84k+vEN9AI28hbi/O0J5Zim2XD/9Fix0g1UEUt/kjxS8gXeB0163
	1e8iomGOfOWqGlORDrzPpdliM3fKft91o9dAx8rGuFDkDgGVrqYqszTnBKwfATXA2RcC
	rVJA==
X-Gm-Message-State: APjAAAXQ5Rd5vQ52J4muQ+FcTkleTkcKELvUf7C+1IwaeWXNWG1lE6wh
	N/lRV5wf3OZYeHvGkEIWCkrZgeqe
X-Google-Smtp-Source: APXvYqzytrrvLhPZ+4sZNyaWT33E7xSSdHXeePhptVOhVigShF+8qNi4i0k5knNXad9WK7ls9dkZWQ==
X-Received: by 2002:a1c:7715:: with SMTP id t21mr13240819wmi.149.1580121932618;
	Mon, 27 Jan 2020 02:45:32 -0800 (PST)
Received: from aherlnxbspsrv01.lgs-net.com ([193.8.40.126])
	by smtp.gmail.com with ESMTPSA id
	e18sm19578795wrw.70.2020.01.27.02.45.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 27 Jan 2020 02:45:32 -0800 (PST)
From: Andrey Zhizhikin <andrey.z@gmail.com>
X-Google-Original-From: Andrey Zhizhikin
	<andrey.zhizhikin@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org,
	anuj.mittal@intel.com
Date: Mon, 27 Jan 2020 10:44:44 +0000
Message-Id: <20200127104444.14102-1-andrey.zhizhikin@leica-geosystems.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] gstreamer1.0-plugins-bad: resolve opencv pkg-config in meson build
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
X-List-Received-Date: Mon, 27 Jan 2020 10:45:32 -0000

From: Andrey Zhizhikin <andrey.z@gmail.com>

When opencv is picked in PACKAGECONFIG, plugin fails to locate data
dirs. This is due to meson.build file uses 'test' utility to verify that
the data dirs path is present and not taking sysroot into prefix.

Introduce additional patch, which picks up PKG_CONFIG_SYSROOT_DIR as
prefix for 'test' utility to verify the data dir is actually present.

Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
---
 ...issing-opencv-data-dir-in-yocto-buil.patch | 49 +++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.16.1.bb        |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
new file mode 100644
index 0000000000..4b6591c0d8
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch
@@ -0,0 +1,49 @@
+From f41caae14b618ab815ede3c408e7482b00316e3e Mon Sep 17 00:00:00 2001
+From: Andrey Zhizhikin <andrey.z@gmail.com>
+Date: Mon, 27 Jan 2020 10:22:35 +0000
+Subject: [PATCH] opencv: resolve missing opencv data dir in yocto build
+
+When Yocto build is performed, opencv searches for data dir using simple
+'test' command, this fails because pkg-config provides an absolute
+path on the target which needs to be prepended by PKG_CONFIG_SYSROOT_DIR
+in order for the 'test' utility to pick up the absolute path.
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Andrey Zhizhikin <andrey.z@gmail.com>
+---
+ ext/opencv/meson.build | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/ext/opencv/meson.build b/ext/opencv/meson.build
+index f38b55dfe..a26403482 100644
+--- a/ext/opencv/meson.build
++++ b/ext/opencv/meson.build
+@@ -78,20 +78,21 @@ else
+ endif
+ 
+ if opencv_found
++  pkgconf_sysroot = run_command(python3, '-c', 'import os; print(os.environ.get("PKG_CONFIG_SYSROOT_DIR"))').stdout().strip()
+   opencv_prefix = opencv_dep.get_pkgconfig_variable('prefix')
+   gstopencv_cargs += ['-DOPENCV_PREFIX="' + opencv_prefix + '"']
+ 
+   # Check the data dir used by opencv for its xml data files
+   # Use prefix from pkg-config to be compatible with cross-compilation
+-  r = run_command('test', '-d', opencv_prefix + '/share/opencv')
++  r = run_command('test', '-d', pkgconf_sysroot + opencv_prefix + '/share/opencv')
+   if r.returncode() == 0
+     gstopencv_cargs += '-DOPENCV_PATH_NAME="opencv"'
+   else
+-    r = run_command('test', '-d', opencv_prefix + '/share/OpenCV')
++    r = run_command('test', '-d', pkgconf_sysroot + opencv_prefix + '/share/OpenCV')
+     if r.returncode() == 0
+       gstopencv_cargs += '-DOPENCV_PATH_NAME="OpenCV"'
+     else
+-      r = run_command('test', '-d', opencv_prefix + '/share/opencv4')
++      r = run_command('test', '-d', pkgconf_sysroot + opencv_prefix + '/share/opencv4')
+       if r.returncode() == 0
+         gstopencv_cargs += '-DOPENCV_PATH_NAME="opencv4"'
+       else
+-- 
+2.17.1
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb
index 56ae7a179e..024277eeb1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.1.bb
@@ -6,6 +6,7 @@ SRC_URI = " \
     file://fix-maybe-uninitialized-warnings-when-compiling-with-Os.patch \
     file://avoid-including-sys-poll.h-directly.patch \
     file://ensure-valid-sentinels-for-gst_structure_get-etc.patch \
+    file://opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
 "
 SRC_URI[md5sum] = "24d4d30ecc67d5cbc77c0475bcea1210"
 SRC_URI[sha256sum] = "56481c95339b8985af13bac19b18bc8da7118c2a7d9440ed70e7dcd799c2adb5"
-- 
2.17.1


