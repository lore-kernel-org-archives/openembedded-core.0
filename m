Return-Path: <naresh.bhat@linaro.org>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 097CC739AD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 18:32:03 +0000 (UTC)
Received: by igkb16 with SMTP id b16so23629728igk.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2015 11:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zHulOe8HxT0bCtKlHdEWCIHl6UwmaGSHsEuAzH9KLUo=;
	b=KL+L4NOm+Qy6niYj1YzkopJ6tR1NomQQpO2QEGyHJ9Ad2H/kGaFMC86BSr7LKsxfgS
	YpyhzWw9L4bUfeIml/i2+gl1IsaDfAo5eG83vDJK0Ql9IhglYDTdSb3DDliRj8JdYr65
	U0zZNESpIH2b9Du39pRdiHvA/QsJ9yWGwPgRaNkg8IztPaLANrf1UJXOjKih4KJ3fZ1M
	HAXif9Q2FKBWJv0NtMq4SukNpGeHB2WxJ0PB2yctqWLtMru0oO460SWoRh5hdddZLMHD
	a8404HNVNntFUDiFeHjhA4xNmIoitgOcrB5wyA2cNieTH0ejf0gO4C0X8HMsLLLKzzwu
	jUYQ==
X-Gm-Message-State: ALoCoQmRLBP2DLOXi6Wj0hLczBLmcY1jAadCuaMmHR4F5FfbLSWUJog8FfHLOfIRQ2tu0l1PVP21
X-Received: by 10.42.123.75 with SMTP id q11mr29690463icr.87.1425925924722;
	Mon, 09 Mar 2015 11:32:04 -0700 (PDT)
Received: from Latitude-E6430.domain.name (64.2.3.194.ptr.us.xo.net.
	[64.2.3.194])
	by mx.google.com with ESMTPSA id w3sm6552503igz.4.2015.03.09.11.32.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 09 Mar 2015 11:32:03 -0700 (PDT)
From: Naresh Bhat <naresh.bhat@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Mar 2015 00:01:15 +0530
Message-Id: <1425925876-9663-5-git-send-email-naresh.bhat@linaro.org>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1425925876-9663-1-git-send-email-naresh.bhat@linaro.org>
References: <1425925876-9663-1-git-send-email-naresh.bhat@linaro.org>
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
X-List-Received-Date: Mon, 09 Mar 2015 18:32:06 -0000

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


