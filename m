Return-Path: <naresh.bhat@linaro.org>
Received: from mail-pd0-f174.google.com (mail-pd0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id CBD2973979
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 11:27:39 +0000 (UTC)
Received: by pdbop1 with SMTP id op1so40508821pdb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2015 04:27:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZOT+8Anf584/G+lAR1XSMRUM22Cj8QhngEIMYP1x0po=;
	b=ST5emZpXWgXBfis9hqaIbyTsZvIGYedf2Y1ID7IciL9Mf1QMxSLiS4YSrKnxX9OpOP
	5NEogBRfcpWQQ4iuyV1dhj+cdl6TwppCzsr0Y0Y/4bu2GwSRjus9cpXbiT8aaRJPRGfh
	RWJD5fCzyqMyyTnRdTYzAFj7ilAeRQHEdgVZv/2HR4eyodOt8LbstAaLCeXWH7RfvfKQ
	4CMeeKJZNJwJ967PB4T4ZJP+7dZdhpx9V8R7djTUvOyi5vEa7Y9HcSU8hs/HGd3FZSA9
	EKjWMQs8nQqjXDK10HNFusAgs0RoPwguIdpSUc6VQHux+Rx9RHFswdLMiMD31yhZjQsv
	1S7A==
X-Gm-Message-State: ALoCoQnqA/elonyuYP0RRzSgXV3riaPNG6A9KZKu4apc17eibrakEJ9SRw+Idr2lbDKCzg2Q78Vj
X-Received: by 10.70.130.97 with SMTP id od1mr46875809pdb.0.1426678061384;
	Wed, 18 Mar 2015 04:27:41 -0700 (PDT)
Received: from Latitude-E6430.domain.name ([119.82.123.224])
	by mx.google.com with ESMTPSA id x1sm27111518pdr.17.2015.03.18.04.27.38
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 18 Mar 2015 04:27:40 -0700 (PDT)
From: Naresh Bhat <naresh.bhat@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Mar 2015 16:57:09 +0530
Message-Id: <1426678029-19516-6-git-send-email-naresh.bhat@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1426678029-19516-1-git-send-email-naresh.bhat@linaro.org>
References: <1426678029-19516-1-git-send-email-naresh.bhat@linaro.org>
Cc: matt.fleming@intel.com
Subject: [OE-core v2 PATCH 5/5] grub: Update grub git recipe
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
X-List-Received-Date: Wed, 18 Mar 2015 11:27:40 -0000

Update the grub git recipe with the following actions for native and target

- Base class extend to native

This is required because on aarch64 we need native recipe to be compiled for host architecture and generate grub-mkimage, which is
executed on host machine to generate grubaa64.efi binary for target architecture. In the case of x86/x86_64 architecture
it does not make any difference because host=target. The flow on aarch64 is as below

grub-native compile for host (generates grub-mkimage) ==> do_install_append_class-target() generates grubaa64.efi binary by executing host executable binary grub-mkimage ==> do_deploy() deploy the grubaa64.efi

Hence add the below lines

+DEPENDS_class-target += "grub-native"
+BBCLASSEXTEND = "native"

- Add autotools-brokensep

The recipe is fails to work (because B!=S) when I have add this recipe to luvOS, hence inherit autotools-brokensep instead of autotools.
May be this needs to be fixed.

- On x86 architecture the recipe builds only for PC, It may be required to extend this recipe.

Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
---
 meta/recipes-bsp/grub/grub_git.bb |   47 +++++++++++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
index 3ab675b..1ac99f9 100644
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
+inherit autotools-brokensep gettext texinfo deploy
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[grub-mount] = "--enable-grub-mount,--disable-grub-mount,fuse"
@@ -34,21 +35,53 @@ GRUBPLATFORM ??= "pc"
 EXTRA_OECONF = "--with-platform=${GRUBPLATFORM} --disable-grub-mkfont --program-prefix="" \
                 --enable-liblzma=no --enable-device-mapper=no --enable-libzfs=no"
 
+export ac_cv_path_HELP2MAN=""
+
 do_configure_prepend() {
-    ( cd ${S}
-      ${S}/autogen.sh )
+      ./autogen.sh
+}
+
+do_install_append_class-native() {
+        install -m 755 -D grub-mkimage ${D}${bindir}
 }
 
-do_install_append () {
-    install -d ${D}${sysconfdir}/grub.d
- 
+do_install_append_class-target() {
+    # Search for the grub.cfg on the local boot media by using the
+    # built in cfg file provided via this recipe
+    grub-mkimage -c ../cfg -p /EFI/BOOT -d ./grub-core/ \
+        -O ${GRUB_TARGET}-${GRUBPLATFORM} -o ./${GRUB_IMAGE} \
+        boot linux ext2 fat serial part_msdos part_gpt \
+        normal efi_gop iso9660 search efinet tftp all_video chain \
+        gfxmenu jpeg gfxterm
+
+    install -m 0755 -D ${B}/${GRUB_IMAGE} ${D}${bindir}
+}
+
+GRUB_TARGET_aarch64 = "arm64"
+GRUB_IMAGE_aarch64 = "grubaa64.efi"
+
+do_mkimage_class-native() {
+        :
 }
 
+do_deploy() {
+    install -m 0755 -D ${B}/${GRUB_IMAGE} ${DEPLOYDIR}
+}
+
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


