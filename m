Return-Path: <naresh.bhat@linaro.org>
Received: from mail-yh0-f44.google.com (mail-yh0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id D339D6013D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Mar 2015 15:46:52 +0000 (UTC)
Received: by yhot59 with SMTP id t59so1996265yho.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Mar 2015 07:46:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GxOzhSbg4pKIwoz9kF8jUEGeSkI3yCf6gj026FFuUOg=;
	b=K0MbojdjHh3/JnA3xsYAMi2tqozXU0Q7gVa+aFXKYvXZgE0eI3QhN6qZ4GeZosaZyb
	HXa6BF01Ww7UcB6n9bBzD24odCxWuQ2KRuTAFneaH9GqtmUGeKmGC4Ns//wl/3oliRf0
	KVbX2Xs0L9N0tFOYklliRQjQz/sAt+t4gc1yLoAGXsdzKCssUcLvwkWJAyeEI4vGrzsV
	td0fzLWBiWE+aXzke9pDKpwm2SVmT5BInF5bH58Q+6cjMtHADA/cuoLMHIFl8ln2n8lq
	OtRA01Z6TGaJwXcXRo25kdxyYU97QDbygv2LEcSjHAddad2ec/KIfYehfyuAR2fQU5b+
	VpAw==
X-Gm-Message-State: ALoCoQl0reIDiFYdw737gnfuBhAZRsPrPUGiZPCzDb6UEG1lwvoHEnjN7thSy7CwiHyghGHYIviD
X-Received: by 10.236.198.179 with SMTP id v39mr30961416yhn.70.1425397613978; 
	Tue, 03 Mar 2015 07:46:53 -0800 (PST)
Received: from Latitude-E6430.caveonetworks.com ([111.93.218.67])
	by mx.google.com with ESMTPSA id n22sm831796yho.1.2015.03.03.07.46.51
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 03 Mar 2015 07:46:52 -0800 (PST)
From: Naresh Bhat <naresh.bhat@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Mar 2015 21:16:24 +0530
Message-Id: <1425397584-5154-5-git-send-email-naresh.bhat@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1425397584-5154-1-git-send-email-naresh.bhat@linaro.org>
References: <1425397584-5154-1-git-send-email-naresh.bhat@linaro.org>
Subject: [OE-core Yocto PATCH 4/4] grub: Update grub git recipe
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
X-List-Received-Date: Tue, 03 Mar 2015 15:46:53 -0000

Update the grub git recipe with the following actions for native and non-native
- Base class extend to native
- do_configure_prepand
- do_install_append
- do_mkimage native
- do_deploy

Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
Reviewed-by: Graeme Gregory <graeme.gregory@linaro.org>
Reviewed-by: Matt Fleming <matt.fleming@intel.com>
---
 meta/recipes-bsp/grub/grub_git.bb |   51 ++++++++++++++++++++++++++++++++-----
 1 file changed, 45 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
index 3ab675b..a2abe01 100644
--- a/meta/recipes-bsp/grub/grub_git.bb
+++ b/meta/recipes-bsp/grub/grub_git.bb
@@ -8,6 +8,7 @@ DEFAULT_PREFERENCE_arm = "1"
 PV = "2.00+${SRCPV}"
 SRCREV = "87de66d9d83446ecddb29cfbdf7369102c8e209e"
 SRC_URI = "git://git.savannah.gnu.org/grub.git \
+           file://cfg \
            file://grub-2.00-fpmath-sse-387-fix.patch \
            file://autogen.sh-exclude-pc.patch \
            file://grub-2.00-add-oe-kernel.patch \
@@ -18,7 +19,7 @@ S = "${WORKDIR}/git"
 
 COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|aarch64.*)-(linux.*|freebsd.*)'
 
-inherit autotools gettext texinfo
+inherit autotools gettext texinfo deploy
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[grub-mount] = "--enable-grub-mount,--disable-grub-mount,fuse"
@@ -31,24 +32,62 @@ GRUBPLATFORM_arm = "uboot"
 GRUBPLATFORM_aarch64 = "efi"
 GRUBPLATFORM ??= "pc"
 
+CACHED_CONFIGUREVARS += "ac_cv_path_HELP2MAN="
 EXTRA_OECONF = "--with-platform=${GRUBPLATFORM} --disable-grub-mkfont --program-prefix="" \
                 --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
 
+B = "${S}"
+
+export ac_cv_path_HELP2MAN=""
+
 do_configure_prepend() {
-    ( cd ${S}
-      ${S}/autogen.sh )
+      ./autogen.sh
+}
+
+do_install_append_class-native() {
+        install -d ${D}${bindir}
+        install -m 755 grub-mkimage ${D}${bindir}
 }
 
-do_install_append () {
+do_install_append_class-target() {
+    # Search for the grub.cfg on the local boot media by using the
+    # built in cfg file provided via this recipe
+    grub-mkimage -c ../cfg -p /EFI/BOOT -d ./grub-core/ \
+        -O ${GRUB_TARGET}-${GRUBPLATFORM} -o ./${GRUB_IMAGE} \
+        boot linux ext2 fat serial part_msdos part_gpt \
+        normal efi_gop iso9660 search efinet tftp all_video chain \
+        gfxmenu jpeg gfxterm
+
     install -d ${D}${sysconfdir}/grub.d
- 
+    install -m 0755 ${B}/${GRUB_IMAGE} ${D}${bindir}
+}
+
+GRUB_TARGET_aarch64 = "arm64"
+GRUB_IMAGE_aarch64 = "grubaa64.efi"
+
+do_mkimage_class-native() {
+        :
+}
+
+do_deploy() {
+    install -d ${DEPLOYDIR}
+    install -m 0755 ${B}/${GRUB_IMAGE} ${DEPLOYDIR}
 }
 
+do_deploy_class-native() {
+        :
+}
+
+addtask deploy after do_install before do_build
+
 # debugedit chokes on bare metal binaries
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
-RDEPENDS_${PN} = "diffutils freetype"
+RDEPENDS_${PN}_class-target = "diffutils freetype"
 FILES_${PN}-dbg += "${libdir}/${BPN}/*/.debug"
 
 INSANE_SKIP_${PN} = "arch"
 INSANE_SKIP_${PN}-dbg = "arch"
+
+DEPENDS_class-target += "grub-native"
+BBCLASSEXTEND = "native"
-- 
1.7.9.5


