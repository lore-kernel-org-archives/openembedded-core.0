Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 7C8336E320
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 15:36:59 +0000 (UTC)
Received: by mail-wg0-f53.google.com with SMTP id k14so6674809wgh.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jan 2014 07:37:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=g6kUiSbsfMkgHeCIGmBTfHju5Nar7+OSNJ/T4TRz56o=;
	b=a3+xE1UG2SituZz4ryqaH/DTwl8DYo7V2QCQ8lq0xhCqr03sZAaKk/RRtwktvgsYK0
	/jn+n1jSVs9hiC9ro1yQYlAsoaYCBKhCsAwGnUQjBEyC/vstLmSVKZN3i+cVQzBef/wy
	1C+kZeHNNV7heUqIDEW3wlPw9w372bMmRzNshXGlwrKJyTvV+qoFqo1wNoFzmuqidxqP
	V+OhqReL0zeH35NwDb36vn7wRwrBGq6ARG3YmoUjIHuLojf2YriqIJSi2VEFj04WDQsY
	l7XX+7Ngua8uOnhU+rr3uvmAj80XB9kaEO7yCal5q1WiY0zHycfXa+KrStaVZIFQ4JsL
	XgMQ==
X-Gm-Message-State: ALoCoQnrj9JgoU4k+TJ1YHtEWIynb1vUgrHrYZv7gAGE1mfcZ37rpFCblxzbyHxQW14ETOBlh2Lk
X-Received: by 10.194.185.113 with SMTP id fb17mr22464305wjc.29.1389627420138; 
	Mon, 13 Jan 2014 07:37:00 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id j3sm18405905wiy.3.2014.01.13.07.36.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Jan 2014 07:36:59 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jan 2014 15:36:51 +0000
Message-Id: <1389627413-7106-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1389627413-7106-1-git-send-email-ross.burton@intel.com>
References: <1389627413-7106-1-git-send-email-ross.burton@intel.com>
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
X-List-Received-Date: Mon, 13 Jan 2014 15:36:59 -0000

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


