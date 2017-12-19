Return-Path: <california.l.sullivan@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 354697867C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 22:58:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Dec 2017 14:58:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,428,1508828400"; d="scan'208";a="17433599"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga001.jf.intel.com with ESMTP; 19 Dec 2017 14:58:36 -0800
From: California Sullivan <california.l.sullivan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Dec 2017 14:58:30 -0800
Message-Id: <20171219225831.22587-18-california.l.sullivan@intel.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20171219225831.22587-1-california.l.sullivan@intel.com>
References: <20171219225831.22587-1-california.l.sullivan@intel.com>
Subject: [PATCH RFC 17/18] systemd-boot: add package that installs to boot
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
X-List-Received-Date: Tue, 19 Dec 2017 22:58:38 -0000

If the EFI_PROVIDER is systemd-boot, install as boot(x64|ia32) as per
convention. If its not the EFI_PROVIDER, install as
systemd-boot(x64|ia32), as to not collide with other possible
bootloaders.

Signed-off-by: California Sullivan <california.l.sullivan@intel.com>
---
 meta/recipes-core/systemd/systemd-boot_234.bb | 28 ++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd-boot_234.bb b/meta/recipes-core/systemd/systemd-boot_234.bb
index 7b18b25e35d..80b57a1d378 100644
--- a/meta/recipes-core/systemd/systemd-boot_234.bb
+++ b/meta/recipes-core/systemd/systemd-boot_234.bb
@@ -18,6 +18,26 @@ EXTRA_OECONF = " --enable-gnuefi \
                  EFI_CC='${EFI_CC}' \
                "
 
+# install to the image as boot*.efi if its the EFI_PROVIDER,
+# otherwise install as the full name.
+# This allows multiple bootloaders to coexist in a single image.
+python __anonymous () {
+    import re
+    target = d.getVar('TARGET_ARCH')
+    prefix = "" if d.getVar('EFI_PROVIDER', True) == "systemd-boot" else "systemd-"
+    if target == "x86_64":
+        systemdimage = prefix + "bootx64.efi"
+    else:
+        systemdimage = prefix + "bootia32.efi"
+    d.setVar("SYSTEMD_BOOT_IMAGE", systemdimage)
+    prefix = "systemd-" if prefix == "" else ""
+    d.setVar("SYSTEMD_BOOT_IMAGE_PREFIX", prefix)
+}
+
+FILES_${PN} = "/boot/EFI/BOOT/${SYSTEMD_BOOT_IMAGE}"
+
+RDEPENDS_${PN} += "virtual/systemd-bootconf"
+
 # Imported from the old gummiboot recipe
 TUNE_CCARGS_remove = "-mfpmath=sse"
 COMPATIBLE_HOST = "(x86_64.*|i.86.*)-linux"
@@ -29,12 +49,14 @@ do_compile() {
 		SYSTEMD_BOOT_EFI_ARCH="x64"
 	fi
 
-	oe_runmake systemd-boot${SYSTEMD_BOOT_EFI_ARCH}.efi
+	oe_runmake ${SYSTEMD_BOOT_IMAGE_PREFIX}${SYSTEMD_BOOT_IMAGE}
 }
 
 do_install() {
-	# Bypass systemd installation with a NOP
-	:
+	install -d ${D}/boot
+	install -d ${D}/boot/EFI
+	install -d ${D}/boot/EFI/BOOT
+	install ${B}/systemd-boot*.efi ${D}/boot/EFI/BOOT/${SYSTEMD_BOOT_IMAGE}
 }
 
 do_deploy () {
-- 
2.14.3


