Received: from stoexhubfe01.domain01.net ([83.145.59.140])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1Qcdbn-0005PW-06
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 15:18:11 +0200
Received: from localhost (193.235.91.228) by stoexhubfe01.domain01.net
	(10.12.10.6) with Microsoft SMTP Server id 8.3.137.0; Fri, 1 Jul 2011
	15:08:10 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Jul 2011 15:07:59 +0200
Message-ID: <e6337a61efe3cc794e12a9dbe80e9c0df0f51a41.1309525642.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1309525642.git.anders@chargestorm.se>
References: <cover.1309525642.git.anders@chargestorm.se>
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH v5 3/8] modules-init-tools(-cross): update to 3.16
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
X-List-Received-Date: Fri, 01 Jul 2011 13:18:11 -0000
Content-Type: text/plain

Update to get support for Linux 3.0.
Delete the ignore_arch_directory.patch (as it does not apply to 3.16).

Signed-off-by: Anders Darander <anders@chargestorm.se>
---
 .../files/ignore_arch_directory.patch              |   30 --------------------
 ...oss_3.12.bb => module-init-tools-cross_3.16.bb} |    4 +-
 .../module-init-tools/module-init-tools.inc        |    1 -
 ...nit-tools_3.12.bb => module-init-tools_3.16.bb} |    6 ++--
 4 files changed, 5 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-kernel/module-init-tools/files/ignore_arch_directory.patch
 rename meta/recipes-kernel/module-init-tools/{module-init-tools-cross_3.12.bb => module-init-tools-cross_3.16.bb} (62%)
 rename meta/recipes-kernel/module-init-tools/{module-init-tools_3.12.bb => module-init-tools_3.16.bb} (87%)

diff --git a/meta/recipes-kernel/module-init-tools/files/ignore_arch_directory.patch b/meta/recipes-kernel/module-init-tools/files/ignore_arch_directory.patch
deleted file mode 100644
index d29957d..0000000
--- a/meta/recipes-kernel/module-init-tools/files/ignore_arch_directory.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-# not sure the reason yet. Keep for a while and verify later.
-#
-# comments added by Kevin Tian <kevin.tian@intel.com>, 2010-07-21
-
-Upstream-Status: Pending
-
-diff -ruN module-init-tools-3.12.orig/modprobe.8 module-init-tools-3.12/modprobe.8
---- module-init-tools-3.12/modprobe.8.orig
-+++ module-init-tools-3.12/modprobe.8
-@@ -27,6 +27,7 @@
- (see \fBmodprobe.conf\fR(5)). \fBmodprobe\fR will also use module
- options specified on the kernel command line in the form of
- <module>\&.<option>\&.
-+All files in the \fI/etc/modprobe.d/arch/\fR directory are ignored.
- .PP
- Note that unlike in 2.4 series Linux kernels (which are not supported
- by this tool) this version of \fBmodprobe\fR does not
---- module-init-tools-3.12/modprobe.c.orig
-+++ module-init-tools-3.12/modprobe.c
-@@ -1052,6 +1052,10 @@
- 	DIR *dir;
- 	int ret = 0;
- 
-+	/* ignore everything in this directory */
-+	if (streq(filename, "/etc/modprobe.d/arch"))
-+		return 1;
-+
- 	dir = opendir(filename);
- 	if (dir) {
- 		struct file_entry {
diff --git a/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.12.bb b/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb
similarity index 62%
rename from meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.12.bb
rename to meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb
index 5cbf9c5..8b3458b 100644
--- a/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.12.bb
+++ b/meta/recipes-kernel/module-init-tools/module-init-tools-cross_3.16.bb
@@ -1,7 +1,7 @@
 require module-init-tools.inc
-PR = "r2"
+PR = "r0"
 inherit cross
-PROVIDES += "virtual/${TARGET_PREFIX}depmod virtual/${TARGET_PREFIX}depmod-2.6"
+PROVIDES += "virtual/${TARGET_PREFIX}depmod"
 
 SRC_URI += "file://no-static-binaries.patch"
 
diff --git a/meta/recipes-kernel/module-init-tools/module-init-tools.inc b/meta/recipes-kernel/module-init-tools/module-init-tools.inc
index 4d96d16..c290c4f 100644
--- a/meta/recipes-kernel/module-init-tools/module-init-tools.inc
+++ b/meta/recipes-kernel/module-init-tools/module-init-tools.inc
@@ -12,7 +12,6 @@ FILES_module-init-tools-depmod = "${sbindir}/depmod.26"
 FILES_module-init-tools-insmod-static = "${sbindir}/insmod.static"
 
 SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kernel/module-init-tools/module-init-tools-${PV}.tar.bz2 \
-           file://ignore_arch_directory.patch \
            file://modutils_extension.patch \
            file://disable_man.patch \
            file://grab_module_memset.patch"
diff --git a/meta/recipes-kernel/module-init-tools/module-init-tools_3.12.bb b/meta/recipes-kernel/module-init-tools/module-init-tools_3.16.bb
similarity index 87%
rename from meta/recipes-kernel/module-init-tools/module-init-tools_3.12.bb
rename to meta/recipes-kernel/module-init-tools/module-init-tools_3.16.bb
index 3d7c287..0248b46 100644
--- a/meta/recipes-kernel/module-init-tools/module-init-tools_3.12.bb
+++ b/meta/recipes-kernel/module-init-tools/module-init-tools_3.16.bb
@@ -1,5 +1,5 @@
 require module-init-tools.inc
-PR = "r1"
+PR = "r0"
 
 # autotools set prefix to /usr, however we want them in /bin and /sbin
 bindir = "/bin"
@@ -38,5 +38,5 @@ pkg_prerm_module-init-tools-depmod() {
 	update-alternatives --remove depmod /sbin/depmod.26
 }
 
-SRC_URI[md5sum] = "8b2257ce9abef74c4a44d825d23140f3"
-SRC_URI[sha256sum] = "d012ab07ea26721467a85a775f34747c1c8897e37f16bec5317d8a72ef8b4f17"
+SRC_URI[md5sum] = "bc44832c6e41707b8447e2847d2019f5"
+SRC_URI[sha256sum] = "e1f2cdcae64a8effc25e545a5e0bdaf312f816ebbcd0916e4e87450755fab64b"
-- 
1.7.4.1



