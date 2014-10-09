Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C2EB665E1A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Oct 2014 09:36:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s999aF0C016045
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Oct 2014 02:36:16 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.174.1; Thu, 9 Oct 2014 02:36:15 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Oct 2014 17:34:07 +0800
Message-ID: <1412847247-27105-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH] qemu: update to latest stable version and git revision
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
X-List-Received-Date: Thu, 09 Oct 2014 09:36:17 -0000
Content-Type: text/plain

Update qemu to latest stable version 2.1.2. And update to latest git
revision too.

* Remove backport patch 0001-Back-porting-security-fix-CVE-2014-5388.patch
* Remove task do_sanitize_sources that no directory .git in submodules
  any more
* Make a copy of Qemu-Arm-versatilepb-Add-memory-size-checking.patch
  that baseline in git version changed

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...rm-versatilepb-Add-memory-size-checking-2.patch | 45 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu_2.1.0.bb           | 28 --------------
 meta/recipes-devtools/qemu/qemu_2.1.2.bb           | 20 ++++++++++
 meta/recipes-devtools/qemu/qemu_git.bb             | 17 ++++++--
 4 files changed, 79 insertions(+), 31 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking-2.patch
 delete mode 100644 meta/recipes-devtools/qemu/qemu_2.1.0.bb
 create mode 100644 meta/recipes-devtools/qemu/qemu_2.1.2.bb

diff --git a/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking-2.patch b/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking-2.patch
new file mode 100644
index 0000000..562907f
--- /dev/null
+++ b/meta/recipes-devtools/qemu/files/Qemu-Arm-versatilepb-Add-memory-size-checking-2.patch
@@ -0,0 +1,45 @@
+From 896fa02c24347e6e9259812cfda187b1d6ca6199 Mon Sep 17 00:00:00 2001
+From: Jiang Lu <lu.jiang@windriver.com>
+Date: Wed, 13 Nov 2013 10:38:08 +0800
+Subject: [PATCH] Qemu:Arm:versatilepb: Add memory size checking
+
+The machine can not work with memory over 256M, so add a checking
+at startup. If the memory size exceed 256M, just stop emulation then
+throw out warning about memory limitation.
+
+Upstream-Status: Pending
+
+Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
+
+Updated it on 2014-01-15 for rebasing
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+
+
+Make a copy of Qemu-Arm-versatilepb-Add-memory-size-checking.patch that
+the baseline changed in git version.
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ hw/arm/versatilepb.c |    6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
+index b48d84c..ad2cd5a 100644
+--- a/hw/arm/versatilepb.c
++++ b/hw/arm/versatilepb.c
+@@ -198,6 +198,14 @@ static void versatile_init(MachineState *machine, int board_id)
+         fprintf(stderr, "Unable to find CPU definition\n");
+         exit(1);
+     }
++
++    if (ram_size > (256 << 20)) {
++        fprintf(stderr,
++                "qemu: Too much memory for this machine: %d MB, maximum 256 MB\n",
++                ((unsigned int)ram_size / (1 << 20)));
++        exit(1);
++    }
++
+     memory_region_init_ram(ram, NULL, "versatile.ram", machine->ram_size,
+                            &error_abort);
+     vmstate_register_ram_global(ram);
diff --git a/meta/recipes-devtools/qemu/qemu_2.1.0.bb b/meta/recipes-devtools/qemu/qemu_2.1.0.bb
deleted file mode 100644
index a82d052..0000000
--- a/meta/recipes-devtools/qemu/qemu_2.1.0.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-require qemu.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
-                    file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
-
-SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
-            file://qemu-enlarge-env-entry-size.patch \
-            file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
-            file://0001-Back-porting-security-fix-CVE-2014-5388.patch \
-            "
-SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
-SRC_URI[md5sum] = "6726977292b448cbc7f89998fac6983b"
-SRC_URI[sha256sum] = "397e23184f4bf613589a8fe0c6542461dc2afdf17ed337e97e6fd2f31e8f8802"
-
-COMPATIBLE_HOST_class-target_mips64 = "null"
-
-do_sanitize_sources() {
-    # These .git files point to a nonexistent path "../.git/modules" and will confuse git
-    # if it tries to recurse into those directories.
-    rm -f ${S}/dtc/.git ${S}/pixman/.git
-}
-
-addtask sanitize_sources after do_unpack before do_patch
-
-do_install_append() {
-    # Prevent QA warnings about installed ${localstatedir}/run
-    if [ -d ${D}${localstatedir}/run ]; then rmdir ${D}${localstatedir}/run; fi
-}
diff --git a/meta/recipes-devtools/qemu/qemu_2.1.2.bb b/meta/recipes-devtools/qemu/qemu_2.1.2.bb
new file mode 100644
index 0000000..8779b92
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu_2.1.2.bb
@@ -0,0 +1,20 @@
+require qemu.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
+                    file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913 \
+                   "
+
+SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
+            file://qemu-enlarge-env-entry-size.patch \
+            file://Qemu-Arm-versatilepb-Add-memory-size-checking.patch \
+           "
+SRC_URI_prepend = "http://wiki.qemu-project.org/download/${BP}.tar.bz2"
+SRC_URI[md5sum] = "0ff197c4ed4b695620bc4734e77c888f"
+SRC_URI[sha256sum] = "fd10f5e45cf5a736fa5a3e1c279ae9821534e700beb7d1aab88a07648a394885"
+
+COMPATIBLE_HOST_class-target_mips64 = "null"
+
+do_install_append() {
+    # Prevent QA warnings about installed ${localstatedir}/run
+    if [ -d ${D}${localstatedir}/run ]; then rmdir ${D}${localstatedir}/run; fi
+}
diff --git a/meta/recipes-devtools/qemu/qemu_git.bb b/meta/recipes-devtools/qemu/qemu_git.bb
index a30932a..912c18a 100644
--- a/meta/recipes-devtools/qemu/qemu_git.bb
+++ b/meta/recipes-devtools/qemu/qemu_git.bb
@@ -1,15 +1,26 @@
 require qemu.inc
 
-SRCREV = "04024dea2674861fcf13582a77b58130c67fccd8"
+SRCREV = "b6011bd8a57c1eda81a857d21adeb9b66e58b1b0"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
-                    file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913"
+                    file://COPYING.LIB;endline=24;md5=c04def7ae38850e7d3ef548588159913 \
+                   "
 
-PV = "1.3.0+git${SRCPV}"
+PV = "2.1.0+git${SRCPV}"
 
+SRC_URI += "file://configure-fix-Darwin-target-detection.patch \
+            file://qemu-enlarge-env-entry-size.patch \
+            file://Qemu-Arm-versatilepb-Add-memory-size-checking-2.patch \
+           "
 SRC_URI_prepend = "git://git.qemu.org/qemu.git"
+
 S = "${WORKDIR}/git"
 
 DEFAULT_PREFERENCE = "-1"
 
 COMPATIBLE_HOST_class-target_mips64 = "null"
+
+do_install_append() {
+    # Prevent QA warnings about installed ${localstatedir}/run
+    if [ -d ${D}${localstatedir}/run ]; then rmdir ${D}${localstatedir}/run; fi
+}
-- 
1.9.1


