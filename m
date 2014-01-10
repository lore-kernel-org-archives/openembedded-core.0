Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 23BA56B7B6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 17:02:16 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id k14so4355271wgh.20
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 09:02:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=g6kUiSbsfMkgHeCIGmBTfHju5Nar7+OSNJ/T4TRz56o=;
	b=UUVX/I7r2ou96BPuP3sw8/HFOvq6q3Mrc2YIcIC8jBCL04T6FjYDNTphYIrwsA+5m1
	mhK8CId+KmGVXJbB4Jfceb3RNcvC9ey3L+DP6Pnc/OIdnKDTTlrPQE6q4uvfHs62+dmS
	JTEpkCN9PsTIYSZ4buigfkZo+80y7hwqgrW9BvsvtpszintaFU/IyA9ktUto/0N0UY3J
	76ZVbeYbvEZqhiQvh4iefkJBSRgJ/ycYZsC5LMhfTjMTYSRcDJIHeO1LQK8iMVmyLaq9
	YC0QFcNwDE/UVMnxAdcKJgqNmYwzv+ASBIqE6NlcJXaRWcy7MfmwqLJbW+xeBIzrkBBV
	A/Nw==
X-Gm-Message-State: ALoCoQlmdwsx5DU7/s792lYxWKb3crDnmVm6ijHU2Id/UiPYOhrf3kjkRl7qkGKwwMPnN0y0POED
X-Received: by 10.194.108.100 with SMTP id hj4mr9324624wjb.83.1389373337755;
	Fri, 10 Jan 2014 09:02:17 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id eh7sm3494947wic.2.2014.01.10.09.02.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Jan 2014 09:02:17 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2014 17:02:07 +0000
Message-Id: <1389373329-21241-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1389373329-21241-1-git-send-email-ross.burton@intel.com>
References: <1389373329-21241-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH][V2 3/5] waffle: add (from meta-oe)
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
X-List-Received-Date: Fri, 10 Jan 2014 17:02:17 -0000

Waffle is needed for Piglit.  This recipe is taken directly frome meta-oe.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/waffle/files/cflags.patch |   27 ++++++++++++++++++
 meta/recipes-graphics/waffle/waffle_1.2.2.bb    |   34 +++++++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-graphics/waffle/files/cflags.patch
 create mode 100644 meta/recipes-graphics/waffle/waffle_1.2.2.bb

diff --git a/meta/recipes-graphics/waffle/files/cflags.patch b/meta/recipes-graphics/waffle/files/cflags.patch
new file mode 100644
index 0000000..3819756
--- /dev/null
+++ b/meta/recipes-graphics/waffle/files/cflags.patch
@@ -0,0 +1,27 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 2abec1cb3c17fa5ec8d945d79acd74a39c38293a Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@intel.com>
+Date: Wed, 12 Dec 2012 12:57:18 +0000
+Subject: cmake: respect existing CMAKE_C_FLAGS
+
+When cross-compiling it's not unusual to need specific arguments passed to gcc
+such as --sysroot.  Ensure that these are passed on from the toolchain file by
+appending to CMAKE_C_FLAGS instead of overwriting it.
+
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+Index: waffle-1.2.2/CMakeLists.txt
+===================================================================
+--- waffle-1.2.2.orig/CMakeLists.txt	2012-11-28 00:43:40.000000000 +0000
++++ waffle-1.2.2/CMakeLists.txt	2013-02-13 11:34:02.476188233 +0000
+@@ -212,7 +212,7 @@
+ # ------------------------------------------------------------------------------
+ 
+ # FIXME: Only enable c99 if compiler supports it.
+-set(CMAKE_C_FLAGS "--std=c99 -Wall -Werror=implicit-function-declaration")
++set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} --std=c99 -Wall -Werror=implicit-function-declaration")
+ if("${CMAKE_SYSTEM_NAME}" STREQUAL "Linux")
+     # On MacOS, the SSE2 headers trigger this error.
+     set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Werror=missing-prototypes")
diff --git a/meta/recipes-graphics/waffle/waffle_1.2.2.bb b/meta/recipes-graphics/waffle/waffle_1.2.2.bb
new file mode 100644
index 0000000..4f80191
--- /dev/null
+++ b/meta/recipes-graphics/waffle/waffle_1.2.2.bb
@@ -0,0 +1,34 @@
+SUMMARY = "cross-platform C library to defer selection of GL API and of window system"
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4c5154407c2490750dd461c50ad94797 \
+                    file://include/waffle/waffle.h;endline=24;md5=61dbf8697f61c78645e75a93c585b1bf"
+
+SRC_URI = "http://people.freedesktop.org/~chadversary/waffle/files/release/${BPN}-${PV}/${BPN}-${PV}.tar.xz \
+           file://cflags.patch"
+
+SRC_URI[md5sum] = "fdd07cea7709422fbf72418ee63a285d"
+SRC_URI[sha256sum] = "7e342c859b58d4e051b347ef3d7740ed2f3b6c506b93daec272724afe7dd1311"
+
+inherit cmake
+
+# This should be overridden per-machine to reflect the capabilities of the GL
+# stack.
+PACKAGECONFIG ??= "glx"
+
+# I say virtual/libgl, actually wants gl.pc
+PACKAGECONFIG[glx] = "-Dwaffle_has_glx=1,,virtual/libgl libx11"
+
+# I say virtual/libgl, actually wants wayland-egl.pc, egl.pc, and the wayland
+# DISTRO_FEATURE.
+PACKAGECONFIG[wayland] = "-Dwaffle_has_wayland=1,,virtual/libgl wayland"
+
+# I say virtual/libgl, actually wants gbm.pc egl.pc
+PACKAGECONFIG[gbm] = "-Dwaffle_has_wayland=1,,virtual/libgl udev"
+
+# I say virtual/libgl, actually wants egl.pc
+PACKAGECONFIG[x11-egl] = "-Dwaffle_has_x11_egl=1,,virtual/libgl libxcb"
+
+# Take the flags added by PACKAGECONFIG and pass them to cmake.
+EXTRA_OECMAKE = "${EXTRA_OECONF}"
+
+FILES_${PN}-dev += "${datadir}/cmake/Modules/FindWaffle.cmake"
-- 
1.7.10.4


