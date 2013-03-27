Received: from mail-wi0-f176.google.com ([209.85.212.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UKuqQ-0000cK-Fi
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 19:13:29 +0100
Received: by mail-wi0-f176.google.com with SMTP id hm14so2567384wib.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2013 10:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=feqEV2K0ENdQbwzOQdI6uI4vOEzL91ZVbeLdzKkND2A=;
	b=BDta09gwz1O4bTXAxSqOffhaCIQoCUspvFCVqLQZDBHBRBXS1vKzajSPHksXAFvyR6
	61cpu9iodP9G3ezXettWiQnIh4iaUibpmqIWeX1xPXGsTaQWtRcJuyipoNaosVH8Fe/M
	mbLgxwgyN3B4y8Ihb9NCfBSUPBCApLrtW2xkPtyVDBXIR/D6vczAALNx/vBROMn1NMZn
	wyTk6Y/MCNldje5bLuAS7Cuu+810wALiOijUZF4/RWzKGheZVQfq+HVz3aWwBBqUIHAp
	2ZusjrSrjSim/PPKsLjlJtL240dKXjGvsV47GsgN4Bkcx4xLtopmyWCo9L9lnWTjlFJ+
	a5kQ==
X-Received: by 10.180.86.1 with SMTP id l1mr11297599wiz.32.1364406964151;
	Wed, 27 Mar 2013 10:56:04 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id s2sm11140154wib.4.2013.03.27.10.56.02
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Mar 2013 10:56:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Mar 2013 17:53:24 +0000
Message-Id: <1364406805-2644-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQkqVmBcy5ZGk2ZoZyHie9QQgcKJZOzqbWT7wQCTVQgVuZWDjGk/t1PLMPXyRdWa1EN/T8p6
Subject: [PATCH] wayland: upgrade to 1.0.6
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 27 Mar 2013 18:13:30 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/wayland/wayland_1.0.3.bb |   37 ------------------------
 meta/recipes-graphics/wayland/wayland_1.0.6.bb |   37 ++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 37 deletions(-)
 delete mode 100644 meta/recipes-graphics/wayland/wayland_1.0.3.bb
 create mode 100644 meta/recipes-graphics/wayland/wayland_1.0.6.bb

diff --git a/meta/recipes-graphics/wayland/wayland_1.0.3.bb b/meta/recipes-graphics/wayland/wayland_1.0.3.bb
deleted file mode 100644
index 6e01b22..0000000
--- a/meta/recipes-graphics/wayland/wayland_1.0.3.bb
+++ /dev/null
@@ -1,37 +0,0 @@
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
-SRC_URI[md5sum] = "eebe23571fd4f9ceacc583238e5a8ae9"
-SRC_URI[sha256sum] = "f6be5ee11ba534baaa116350b5efb874bf9963bf3fb18bcf40130317e83a5913"
-
-inherit autotools pkgconfig
-
-# We need wayland-native for the wayland-scanner utility
-BBCLASSEXTEND = "native"
-
-DEPENDS_virtclass-native = "expat-native"
-DEPENDS = "expat wayland-native"
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
diff --git a/meta/recipes-graphics/wayland/wayland_1.0.6.bb b/meta/recipes-graphics/wayland/wayland_1.0.6.bb
new file mode 100644
index 0000000..6385933
--- /dev/null
+++ b/meta/recipes-graphics/wayland/wayland_1.0.6.bb
@@ -0,0 +1,37 @@
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
+SRC_URI[md5sum] = "936a2590aea69fa3c0cf234d54b9137c"
+SRC_URI[sha256sum] = "f52a012df699eff434b0f49e56000d6978b5f781048402ca8e0232242970fc49"
+
+inherit autotools pkgconfig
+
+# We need wayland-native for the wayland-scanner utility
+BBCLASSEXTEND = "native"
+
+DEPENDS_virtclass-native = "expat-native"
+DEPENDS = "expat wayland-native"
+
+EXTRA_OECONF_virtclass-native = "--disable-documentation"
+EXTRA_OECONF = "--disable-documentation --disable-scanner"
+
+# Wayland installs a M4 macro for other projects to use. This M4 macro includes
+# a path to a Makefile fragment to get the rules to generate stubs from protocol
+# description files.  The paths to the sysroot end up incorrect, so fix them.
+do_configure_append_class-native() {
+  sed -e 's,@prefix@,${STAGING_DIR_NATIVE},g' \
+      -e 's,@exec_prefix@,${STAGING_DIR_NATIVE},g' \
+      -e 's,@bindir@,${STAGING_BINDIR_NATIVE},g' \
+      -e 's,@datarootdir@,${STAGING_DATADIR_NATIVE},g' \
+  ${S}/wayland-scanner.m4.in > ${B}/wayland-scanner.m4
+}
-- 
1.7.10.4



