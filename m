Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id CC8C06D44A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 11:56:01 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id q58so404398wes.31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2013 03:56:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=i5DX7jKti40buYvOrz+M1XztXt4NM2Oj3x3Dqg+JUkw=;
	b=Z4IrxcH0uZslvMj7uoBz1bmg/EMfDtf4Bn8QBYUkShCB3bOlPzirrDP9/0ykZXFSmB
	UevBM9oAkQVwTKYGiuFxh4fJjHoaII0ndHn7aaZufnumdZIFpkwD0yidhTqAPa0BBAQZ
	pqb5vshIwr98grtqw/VsmA5G+MqXsnfDWa0Mu9lbVotWadKhNIPzPqpjXNkKoktshD98
	YZ/P2SuT925W9fcB17HOz7gE0EvzfZpOdA3A+9HNDZ6W5ZB+Fab+is2Hq1CF27x46Yhf
	MRt+Zs0M1AuwJAiH8ycJR0pUtJ1fvs+TIIKoxMSsv8YLe2jqfDxLa68oLzs1C8STnv86
	TiuQ==
X-Gm-Message-State: ALoCoQnHu6lBiTH/Fs2daBLy2Cty4vWHN8XUrt2IKOymGB7MK7+hwssEZ2TD9I1U4PEXOnBl5tjE
X-Received: by 10.194.175.202 with SMTP id cc10mr6251469wjc.48.1383825363156; 
	Thu, 07 Nov 2013 03:56:03 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id q3sm34492026wib.5.2013.11.07.03.56.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Nov 2013 03:56:02 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2013 11:55:33 +0000
Message-Id: <1383825335-2306-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1383825335-2306-1-git-send-email-ross.burton@intel.com>
References: <1383825335-2306-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/5] wayland: upgrade to 1.3.0
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
X-List-Received-Date: Thu, 07 Nov 2013 11:56:05 -0000

wayland-scanner now uses pkg-config instead of hard-coding paths, so edit the
script to use pkg-config-native.

Based on work by Ewan Le Bideau-Canevet <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/wayland/wayland_1.1.0.bb |   39 ------------------------
 meta/recipes-graphics/wayland/wayland_1.3.0.bb |   36 ++++++++++++++++++++++
 2 files changed, 36 insertions(+), 39 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/wayland_1.1.0.bb
 create mode 100644 meta/recipes-graphics/wayland/wayland_1.3.0.bb

diff --git a/meta/recipes-graphics/wayland/wayland_1.1.0.bb b/meta/recipes-graphics/wayland/wayland_1.1.0.bb
deleted file mode 100644
index a71402e..0000000
--- a/meta/recipes-graphics/wayland/wayland_1.1.0.bb
+++ /dev/null
@@ -1,39 +0,0 @@
-SUMMARY = "Wayland, a protocol between a compositor and clients"
-DESCRIPTION = "Wayland is a protocol for a compositor to talk to its clients \
-as well as a C library implementation of that protocol. The compositor can be \
-a standalone display server running on Linux kernel modesetting and evdev \
-input devices, an X application, or a wayland client itself. The clients can \
-be traditional applications, X servers (rootless or fullscreen) or other \
-display servers."
-HOMEPAGE = "http://wayland.freedesktop.org"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=1d4476a7d98dd5691c53d4d43a510c72 \
-                    file://src/wayland-server.c;endline=21;md5=079ae21dbf98ada52ec23744851b0a5c"
-
-SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
-SRC_URI[md5sum] = "d2dc9398a83692cafc16eba6e45f85d8"
-SRC_URI[sha256sum] = "2ef587cf1a0e52b6dee44eeb9c288110e8180819abf4e419d247dfe234867a5c"
-
-SRC_URI_append_class-native = " file://just-scanner.patch"
-
-inherit autotools pkgconfig
-
-# We need wayland-native for the wayland-scanner utility
-BBCLASSEXTEND = "native"
-
-DEPENDS_virtclass-native = "expat-native libffi-native"
-DEPENDS = "expat libffi wayland-native"
-
-EXTRA_OECONF_virtclass-native = "--disable-documentation"
-EXTRA_OECONF = "--disable-documentation --disable-scanner"
-
-# Wayland installs a M4 macro for other projects to use. This M4 macro includes
-# a path to a Makefile fragment to get the rules to generate stubs from protocol
-# description files.  The paths to the sysroot end up incorrect, so fix them.
-do_configure_append_class-native() {
-  sed -e 's,@prefix@,${STAGING_DIR_NATIVE},g' \
-      -e 's,@exec_prefix@,${STAGING_DIR_NATIVE},g' \
-      -e 's,@bindir@,${STAGING_BINDIR_NATIVE},g' \
-      -e 's,@datarootdir@,${STAGING_DATADIR_NATIVE},g' \
-  ${S}/wayland-scanner.m4.in > ${B}/wayland-scanner.m4
-}
diff --git a/meta/recipes-graphics/wayland/wayland_1.3.0.bb b/meta/recipes-graphics/wayland/wayland_1.3.0.bb
new file mode 100644
index 0000000..212e08a
--- /dev/null
+++ b/meta/recipes-graphics/wayland/wayland_1.3.0.bb
@@ -0,0 +1,36 @@
+SUMMARY = "Wayland, a protocol between a compositor and clients"
+DESCRIPTION = "Wayland is a protocol for a compositor to talk to its clients \
+as well as a C library implementation of that protocol. The compositor can be \
+a standalone display server running on Linux kernel modesetting and evdev \
+input devices, an X application, or a wayland client itself. The clients can \
+be traditional applications, X servers (rootless or fullscreen) or other \
+display servers."
+HOMEPAGE = "http://wayland.freedesktop.org"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1d4476a7d98dd5691c53d4d43a510c72 \
+                    file://src/wayland-server.c;endline=21;md5=079ae21dbf98ada52ec23744851b0a5c"
+
+SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "d16d27081e0871de82d08840c2f133fc"
+SRC_URI[sha256sum] = "2e817685f68a26acd19964d69ddbc4549ba5412114ad95e1a9f5934cce470d6e"
+
+SRC_URI_append_class-native = " file://just-scanner.patch"
+
+inherit autotools pkgconfig
+
+# We need wayland-native for the wayland-scanner utility
+BBCLASSEXTEND = "native"
+
+DEPENDS_virtclass-native = "expat-native libffi-native"
+DEPENDS = "expat libffi wayland-native"
+
+EXTRA_OECONF_virtclass-native = "--disable-documentation"
+EXTRA_OECONF = "--disable-documentation --disable-scanner"
+
+# Wayland installs a M4 macro for other projects to use, which uses the target
+# pkg-config to find files.  Replace pkg-config with pkg-config-native.
+do_install_append_class-native() {
+  sed -e 's,PKG_CHECK_MODULES(.*),,g' \
+      -e 's,$PKG_CONFIG,pkg-config-native,g' \
+      -i ${D}/${datadir}/aclocal/wayland-scanner.m4
+}
-- 
1.7.10.4


