Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1RJR6x-0002cY-I0
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Oct 2011 16:39:15 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.ottawa.windriver.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9REX3p3001648;
	Thu, 27 Oct 2011 07:33:05 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 27 Oct 2011 10:32:48 -0400
Message-Id: <aebe0239eb25f311c94e8200c509f2696dd81d65.1319725711.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1319725711.git.bruce.ashfield@windriver.com>
References: <cover.1319725711.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1319725711.git.bruce.ashfield@windriver.com>
References: <cover.1319725711.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 2/3] linux-libc-headers: provide 3.0.x and 3.1 headers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Oct 2011 14:39:16 -0000

Provide both a 3.0.x and a 3.1 set of headers to the toolchain.
Compatibility is maintained with older 2.6 headers by creating a
new variable that changes the SRC_URI based on the major version
number of the kernel.

Built and booted with 2.6.37.2, 3.0.8 and 3.1 linux-libc-headers.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 .../linux-libc-headers/linux-libc-headers.inc      |   17 +++++++++++++----
 .../linux-libc-headers/linux-libc-headers_3.0.8.bb |    7 +++++++
 .../linux-libc-headers/linux-libc-headers_3.1.bb   |    7 +++++++
 4 files changed, 28 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.0.8.bb
 create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.1.bb

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 2bf1beb..ed722be 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -21,7 +21,7 @@ SDKGCCVERSION ?= "4.6%"
 BINUVERSION ?= "2.21.1a"
 EGLIBCVERSION ?= "2.13"
 UCLIBCVERSION ?= "0.9.32"
-LINUXLIBCVERSION ?= "2.6.37.2"
+LINUXLIBCVERSION ?= "3.1"
 
 # Temporary preferred version overrides for PPC
 PREFERRED_VERSION_u-boot-mkimage-native_powerpc ?= "2009.08"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
index e586ac3..4137be1 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
@@ -1,9 +1,18 @@
-DESCRIPTION = "Sanitized set of 2.6 kernel headers for the C library's use."
+DESCRIPTION = "Sanitized set of kernel headers for the C library's use."
 SECTION = "devel"
 LICENSE = "GPLv2"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7" 
-SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/v2.6/linux-${PV}.tar.bz2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
+
+python __anonymous () {
+    major = d.getVar("PV",True).split('.')[0]
+    if major == "3":
+	d.setVar("HEADER_FETCH_VER", "3.0")
+    else:
+	d.setVar("HEADER_FETCH_VER", "2.6")
+}
+
+SRC_URI = "${KERNELORG_MIRROR}/linux/kernel/v${HEADER_FETCH_VER}/linux-${PV}.tar.bz2"
 
 S = "${WORKDIR}/linux-${PV}"
 
@@ -54,4 +63,4 @@ RDEPENDS_${PN}-dev = ""
 RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
 INHIBIT_DEFAULT_DEPS = "1"
-DEPENDS += "unifdef-native"
\ No newline at end of file
+DEPENDS += "unifdef-native"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.0.8.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.0.8.bb
new file mode 100644
index 0000000..7bb5895
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.0.8.bb
@@ -0,0 +1,7 @@
+require linux-libc-headers.inc
+
+PR = "r1"
+
+SRC_URI += " file://connector-msg-size-fix.patch"
+SRC_URI[md5sum] = "eac4d398a0ecd98214487cd47a228998"
+SRC_URI[sha256sum] = "4ed16da319848f681f711dbda2ac2cf1b306a280ec22f90bae190cf23b533add"
diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.1.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.1.bb
new file mode 100644
index 0000000..b87ecde
--- /dev/null
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_3.1.bb
@@ -0,0 +1,7 @@
+require linux-libc-headers.inc
+
+PR = "r1"
+
+SRC_URI += " file://connector-msg-size-fix.patch"
+SRC_URI[md5sum] = "8d43453f8159b2332ad410b19d86a931"
+SRC_URI[sha256sum] = "2573d2378c754b0c602b57586e9311e5b38c5d1e6c137f02873833633a4b9359"
-- 
1.7.0.4



