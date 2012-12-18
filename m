Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ddalex@intel.com>) id 1TkxiH-00018N-Nj
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 15:00:05 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Dec 2012 05:45:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,309,1355126400"; d="scan'208";a="233211345"
Received: from adamian-desktop.rb.intel.com ([10.237.105.141])
	by azsmga001.ch.intel.com with ESMTP; 18 Dec 2012 05:45:21 -0800
Received: by adamian-desktop.rb.intel.com (Postfix, from userid 1000)
	id 346245605BD; Tue, 18 Dec 2012 15:45:35 +0200 (EET)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: daniel@fooishbar.org, ross.burton@intel.com,
	openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2012 15:45:29 +0200
Message-Id: <1355838331-24404-2-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1355838331-24404-1-git-send-email-alexandru.damian@intel.com>
References: <1355838331-24404-1-git-send-email-alexandru.damian@intel.com>
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH 1/3] Wayland userspace library initial 1.0.3
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
X-List-Received-Date: Tue, 18 Dec 2012 14:00:06 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

Wayland is a new protocol a protocol for a client application to
display user interface windows through the use of a compositing
window manager. This package include the specific set of server-side
and client-side C libraries that implement the protocol.

Wayland is hosted on http://wayland.freedesktop.org/

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/recipes-graphics/wayland/wayland.inc      |   32 ++++++++++++++++++++++++
 meta/recipes-graphics/wayland/wayland_1.0.3.bb |    7 ++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/wayland.inc
 create mode 100644 meta/recipes-graphics/wayland/wayland_1.0.3.bb

diff --git a/meta/recipes-graphics/wayland/wayland.inc b/meta/recipes-graphics/wayland/wayland.inc
new file mode 100644
index 0000000..4f3ffa9
--- /dev/null
+++ b/meta/recipes-graphics/wayland/wayland.inc
@@ -0,0 +1,32 @@
+inherit autotools pkgconfig
+
+SUMMARY = "Wayland, a protocol between a compositor and clients"
+
+DESCRIPTION = "Wayland is a protocol for a compositor to talk to its clients \
+as well as a C library implementation of that protocol. The compositor can be \
+a standalone display server running on Linux kernel modesetting and evdev \
+input devices, an X application, or a wayland client itself. The clients can \
+be traditional applications, X servers (rootless or fullscreen) or other \
+display servers."
+
+HOMEPAGE = "http://wayland.freedesktop.org"
+SECTION = "wayland/base"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1d4476a7d98dd5691c53d4d43a510c72"
+
+# needs wayland-native for the wayland-scanner utility
+BBCLASSEXTEND = "native"
+
+DEPENDS_virtclass-native = "expat-native"
+DEPENDS = "expat wayland-native"
+
+EXTRA_OECONF_virtclass-native = "--disable-documentation"
+EXTRA_OECONF = "--disable-documentation --disable-scanner"
+
+# wayland installs a m4 macro for other projects to use. This m4 macro
+# includes a path to a makefile fragment to get the rules to generate
+# stubs from protocol description files.
+do_install_append() {
+  sed -i -e '4,10s,prefix=.*$,prefix=${D}/${prefix},;4,10s,exec_prefix=,exec_prefix=${D}/${exec_prefix},' \
+    ${D}/${datadir}/aclocal/wayland-scanner.m4
+}
diff --git a/meta/recipes-graphics/wayland/wayland_1.0.3.bb b/meta/recipes-graphics/wayland/wayland_1.0.3.bb
new file mode 100644
index 0000000..28dd49b
--- /dev/null
+++ b/meta/recipes-graphics/wayland/wayland_1.0.3.bb
@@ -0,0 +1,7 @@
+require wayland.inc
+
+SRC_URI = "http://wayland.freedesktop.org/releases/wayland-1.0.3.tar.xz"
+SRC_URI[md5sum] = "eebe23571fd4f9ceacc583238e5a8ae9"
+SRC_URI[sha256sum] = "f6be5ee11ba534baaa116350b5efb874bf9963bf3fb18bcf40130317e83a5913"
+
+PR = "r0"
-- 
1.7.10.4



