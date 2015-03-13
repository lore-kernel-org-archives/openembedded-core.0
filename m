Return-Path: <naresh.bhat@linaro.org>
Received: from mail-yh0-f54.google.com (mail-yh0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 2600F6013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 14:56:09 +0000 (UTC)
Received: by yhl29 with SMTP id 29so1850390yhl.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 07:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zHulOe8HxT0bCtKlHdEWCIHl6UwmaGSHsEuAzH9KLUo=;
	b=eTjPMU/CRslQxsbq2ybfTH2bb5X5pfhfZTDPnV+JuXzDjUxyx43VXtA1Zc3kz6xWY1
	rdr8bpJ+v5/g78A7ddrdrHWYlE3wrm2+appU6OiQPrcJoChyXgNRClKsnGPz0hl0DW26
	qHkEhTNetgP722G9TIoIza6eJLsAi4lf4+yxBYdoaUrkH1EStszape8iOGTjlkrOEPKk
	Xg/HOim3D4O+An+pCSeNKnUJYFsbN2SLdnlgDOMV3CByYE835tJZv0VS5HHHCoIrYL4Q
	VYfHe/Lo8H6H8wK1fy1usr4OZvHmnRk7I4cBKTpV1Qzo/4H9s+/O9gmfc6euLYyFvfSX
	7Gnw==
X-Gm-Message-State: ALoCoQn0+pB9mamO0mlgMs+Oa2IgTHcbm1M6jid6E/h9KUM37Vt5cfahR2CRUCqGMok6ud1gNSeo
X-Received: by 10.170.205.142 with SMTP id w136mr48480033yke.75.1426258570532; 
	Fri, 13 Mar 2015 07:56:10 -0700 (PDT)
Received: from Latitude-E6430.caveonetworks.com ([111.93.218.67])
	by mx.google.com with ESMTPSA id a74sm1773572yhq.31.2015.03.13.07.56.06
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Mar 2015 07:56:09 -0700 (PDT)
From: Naresh Bhat <naresh.bhat@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Mar 2015 20:25:26 +0530
Message-Id: <1426258527-2329-5-git-send-email-naresh.bhat@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1426258527-2329-1-git-send-email-naresh.bhat@linaro.org>
References: <1426258527-2329-1-git-send-email-naresh.bhat@linaro.org>
Cc: matt.fleming@intel.com
Subject: [OE-core v1 PATCH 4/5] grub: Update grub git recipe
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
X-List-Received-Date: Fri, 13 Mar 2015 14:56:10 -0000

Update the grub git recipe with the following actions for native and target
- Base class extend to native
- do_configure_prepend
- do_install_append
- do_mkimage native
- do_deploy

Signed-off-by: Naresh Bhat <naresh.bhat@linaro.org>
---
 meta/recipes-bsp/grub/grub_git.bb |   48 +++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub_git.bb b/meta/recipes-bsp/grub/grub_git.bb
index 3ab675b..a5ab649 100644
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
@@ -31,24 +32,57 @@ GRUBPLATFORM_arm = "uboot"
 GRUBPLATFORM_aarch64 = "efi"
 GRUBPLATFORM ??= "pc"
 
+CACHED_CONFIGUREVARS += "ac_cv_path_HELP2MAN="
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


