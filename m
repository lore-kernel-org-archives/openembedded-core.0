Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 5108F71DDE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 11:19:23 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-02.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1cGl7E-0003it-Sd from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Dec 2016 03:19:25 -0800
Received: from awais-Precision-M4700.pkl.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-02.mgc.mentorg.com (137.202.0.106) with Microsoft SMTP
	Server id 14.3.224.2; Tue, 13 Dec 2016 11:19:23 +0000
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Dec 2016 16:19:19 +0500
Message-ID: <1481627960-3608-1-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] grub_git: extend recipe for proper target deployment
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
X-List-Received-Date: Tue, 13 Dec 2016 11:19:25 -0000
Content-Type: text/plain

This extends the grub_git recipe so it can deploy grub
on the target boot disk just like grub-efi. Mainly
this copies stuff from the grub-efi recipe and then
adjusts some bits accordingly. This would allow
using the latest and greatest versions of grub
on the target.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 meta/recipes-bsp/grub/grub_git.bb | 60 +++++++++++++++++++++++++++++++++++----
 1 file changed, 54 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
index eb824cc..86fa208 100644
--- a/meta/recipes-bsp/grub/grub_git.bb
+++ b/meta/recipes-bsp/grub/grub_git.bb
@@ -3,11 +3,15 @@ require grub2.inc
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_arm = "1"
 
+DEPENDS_class-target += "grub-native"
+RDEPENDS_${PN}_class-target = "diffutils freetype"
+
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/grub-git:"
 
 PV = "2.00+${SRCPV}"
 SRCREV = "7a5b301e3adb8e054288518a325135a1883c1c6c"
 SRC_URI = "git://git.savannah.gnu.org/grub.git \
+           file://cfg \
            file://0001-Disable-mfpmath-sse-as-well-when-SSE-is-disabled.patch \
            file://autogen.sh-exclude-pc.patch \
            file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
@@ -19,29 +23,73 @@ COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
 COMPATIBLE_HOST_armv7a = 'null'
 COMPATIBLE_HOST_armv7ve = 'null'
 
-inherit autotools gettext texinfo
+inherit autotools gettext texinfo deploy
 
 # configure.ac has code to set this automagically from the target tuple
 # but the OE freeform one (core2-foo-bar-linux) don't work with that.
-
 GRUBPLATFORM_arm = "uboot"
 GRUBPLATFORM_aarch64 = "efi"
 GRUBPLATFORM ??= "pc"
 
+CACHED_CONFIGUREVARS += "ac_cv_path_HELP2MAN="
 EXTRA_OECONF = "--with-platform=${GRUBPLATFORM} --disable-grub-mkfont --program-prefix="" \
                 --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
-
+EXTRA_OECONF += "${@bb.utils.contains('GRUBPLATFORM', 'efi', '--enable-efiemu=no', '', d)}"
 EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'largefile', '--enable-largefile', '--disable-largefile', d)}"
 
-do_install_append () {
+# Determine the target arch for the grub modules
+python __anonymous () {
+    import re
+    target = d.getVar('TARGET_ARCH', True)
+    platform = d.getVar('GRUBPLATFORM', True)
+    if target == "x86_64":
+        grubtarget = 'x86_64'
+        grubimage = "bootx64." + platform
+    elif re.match('i.86', target):
+        grubtarget = 'i386'
+        grubimage = "bootia32." + platform
+    elif re.match('arm', target):
+        grubtarget = 'arm'
+        grubimage = "bootarm." + platform
+    elif re.match('aarch64', target):
+        grubtarget = 'arm64'
+        grubimage = "bootaa64." + platform
+    else:
+        raise bb.parse.SkipPackage("grub is incompatible with target %s" % target)
+    d.setVar("GRUB_TARGET", grubtarget)
+    d.setVar("GRUB_IMAGE", grubimage)
+}
+
+do_install_class-native() {
+    install -d ${D}${bindir}
+    install -m 755 grub-mkimage ${D}${bindir}
+}
+
+do_install_append() {
     install -d ${D}${sysconfdir}/grub.d
     rm -rf ${D}${libdir}/charset.alias
 }
 
+GRUB_BUILDIN ?= "boot linux ext2 fat serial part_msdos part_gpt normal efi_gop iso9660 search"
+do_deploy() {
+    # Search for the grub.cfg on the local boot media by using the
+    # built in cfg file provided via this recipe
+    grub-mkimage -c ../cfg -p /EFI/BOOT -d ./grub-core/ \
+                   -O ${GRUB_TARGET}-${GRUBPLATFORM} -o ./${GRUB_IMAGE} \
+                   ${GRUB_BUILDIN}
+    install -m 644 ${B}/${GRUB_IMAGE} ${DEPLOYDIR}
+}
+
+do_deploy_class-native() {
+    :
+}
+
+addtask deploy after do_install before do_build
+
 # debugedit chokes on bare metal binaries
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
-RDEPENDS_${PN} = "diffutils freetype"
-
 INSANE_SKIP_${PN} = "arch"
 INSANE_SKIP_${PN}-dbg = "arch"
+
+BBCLASSEXTEND = "native"
-- 
1.9.1


