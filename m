Return-Path: <dbaryshkov@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4EB617D265
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 10:15:28 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id w67so4894180lff.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 03:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EfgnZG5lcLvxGsfNSJrzBZbYCFX0RcV0RA99JJv03Po=;
	b=BsOz5nj0EI3lc8LbzkMotiqY5bLrGmUFSaJWRL41VKzVqstKmtkhkjcV4E0e2EPxHQ
	twN7kXztRdLZo3d0UQNyGt3wKtdzAGri8w4UOaCvhz3ZSDxKMdUov0ch/XR8j+z8gtzq
	iJQg/LJ8INz3Td426pXOs+hqfArN3V62kbXwlI9JCwR887urLDdhA5Noj3J/QSCwJ/cs
	jyB+tHlTqcRZ9x6P49fURIFSBq/pIzeQmAxwzlvckhvvdjslOmYaCOL+bLJE+CbxFOox
	M3w1x4BVPCxXInkLutbwHUmRYARHZ4GFE2/fAmVHToP2WJ0iw2IadHIOAfbeYsmboOm/
	F1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EfgnZG5lcLvxGsfNSJrzBZbYCFX0RcV0RA99JJv03Po=;
	b=HY+1xNhRjpMjDTlheaH27BY86rq4RQfdB9EJ5vVMGmJcAhR9ufktjnKzd8Wqcz7ycC
	F/zU7M9J+hsKpN90flGeev8TqJ1mJGgY5ybKMJs8MN6dRo+63sAOxNRzwX1l7Q1Yd3sR
	5D1Fb//NLkVBHoOyWLTPhtUeHhznqYSFit6jj6UnDBFw+86MmgrqeabphSdGE6RWnz/c
	X8GNAuwSCsDT78nqIBHV0f44We5f0w9VTNTNbHEG90uaKSYv5yN7Fg4ID9DYcHRiPE53
	LST/Crl/7Y9+i5dMIA6XkE5RnqK9gmFOL9oLjppKMmW6xp/FDIvkd25eAt4UV+A0ZnAZ
	S7oA==
X-Gm-Message-State: APjAAAXeglwqQjXbpdgYkaeMkgdgWQnsnq0vGGW2MvzyzYf7Wth9KMYu
	C4Az8fddDLdSNW/sfWlVJeQVn3lE
X-Google-Smtp-Source: APXvYqxFItTovMdiMo2wof7AzlzGk9uWEAjnzJz9wniuKA6jkWDdWGfXI+c50LD5jiEkVx1mKR7CVQ==
X-Received: by 2002:ac2:5487:: with SMTP id t7mr8027969lfk.96.1569752128252;
	Sun, 29 Sep 2019 03:15:28 -0700 (PDT)
Received: from localhost.localdomain ([94.25.228.202])
	by smtp.gmail.com with ESMTPSA id
	d28sm2012918lfq.88.2019.09.29.03.15.27
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 29 Sep 2019 03:15:27 -0700 (PDT)
From: dbaryshkov@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 13:15:22 +0300
Message-Id: <20190929101526.2061-1-dbaryshkov@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
Subject: [PATCH 1/5] grub-efi: replace anonymous function with static configuration
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
X-List-Received-Date: Sun, 29 Sep 2019 10:15:28 -0000
Content-Transfer-Encoding: 8bit

From: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>

Replace anonymous function setting GRUB_* variables with static
configuration, since grub-efi.bbclass will use fixed names for grub
bootloader.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin-solenikov@mentor.com>
---
 meta/recipes-bsp/grub/grub-efi_2.04.bb | 40 ++++++++++++--------------
 1 file changed, 18 insertions(+), 22 deletions(-)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.04.bb b/meta/recipes-bsp/grub/grub-efi_2.04.bb
index b9d6225d2774..419f25c014b9 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.04.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.04.bb
@@ -13,26 +13,22 @@ SRC_URI += " \
 
 S = "${WORKDIR}/grub-${PV}"
 
-# Determine the target arch for the grub modules
+GRUB_TARGET = "UNSUPPORTED"
+GRUB_TARGET_x86-64 = "x86_64"
+GRUB_TARGET_x86 = "i386"
+GRUB_TARGET_aarch64 = "arm64"
+GRUB_TARGET_arm = "arm"
+
+GRUB_IMAGE = "grub-efi-${EFI_BOOT_IMAGE}"
+
+# install to the image as boot*.efi if its the EFI_PROVIDER,
+# otherwise install as the full name.
+# This allows multiple bootloaders to coexist in a single image.
 python __anonymous () {
-    import re
-    target = d.getVar('TARGET_ARCH')
-    prefix = "" if d.getVar('EFI_PROVIDER') == "grub-efi" else "grub-efi-"
-    if target == "x86_64":
-        grubtarget = 'x86_64'
-    elif re.match('i.86', target):
-        grubtarget = 'i386'
-    elif re.match('aarch64', target):
-        grubtarget = 'arm64'
-    elif re.match('arm', target):
-        grubtarget = 'arm'
+    if d.getVar('EFI_PROVIDER') == "grub-efi":
+        d.setVar("GRUB_EFI_BOOT_IMAGE", d.getVar("EFI_BOOT_IMAGE"))
     else:
-        raise bb.parse.SkipRecipe("grub-efi is incompatible with target %s" % target)
-    grubimage = prefix + d.getVar("EFI_BOOT_IMAGE")
-    d.setVar("GRUB_TARGET", grubtarget)
-    d.setVar("GRUB_IMAGE", grubimage)
-    prefix = "grub-efi-" if prefix == "" else ""
-    d.setVar("GRUB_IMAGE_PREFIX", prefix)
+        d.setVar("GRUB_EFI_BOOT_IMAGE", d.getVar("GRUB_IMAGE"))
 }
 
 inherit deploy
@@ -45,7 +41,7 @@ do_mkimage() {
 	# Search for the grub.cfg on the local boot media by using the
 	# built in cfg file provided via this recipe
 	grub-mkimage -c ../cfg -p ${EFIDIR} -d ./grub-core/ \
-	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE_PREFIX}${GRUB_IMAGE} \
+	               -O ${GRUB_TARGET}-efi -o ./${GRUB_IMAGE} \
 	               ${GRUB_BUILDIN}
 }
 
@@ -57,7 +53,7 @@ do_mkimage_class-native() {
 
 do_install_append_class-target() {
 	install -d ${D}${EFI_FILES_PATH}
-	install -m 644 ${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE} ${D}${EFI_FILES_PATH}/${GRUB_IMAGE}
+	install -m 644 ${B}/${GRUB_IMAGE} ${D}${EFI_FILES_PATH}/${GRUB_EFI_BOOT_IMAGE}
 }
 
 do_install_class-native() {
@@ -86,7 +82,7 @@ GRUB_BUILDIN ?= "boot linux ext2 fat serial part_msdos part_gpt normal \
                  efi_gop iso9660 configfile search loadenv test"
 
 do_deploy() {
-	install -m 644 ${B}/${GRUB_IMAGE_PREFIX}${GRUB_IMAGE} ${DEPLOYDIR}
+	install -m 644 ${B}/${GRUB_IMAGE} ${DEPLOYDIR}
 }
 
 do_deploy_class-native() {
@@ -97,7 +93,7 @@ addtask deploy after do_install before do_build
 
 FILES_${PN} = "${libdir}/grub/${GRUB_TARGET}-efi \
                ${datadir}/grub \
-               ${EFI_FILES_PATH}/${GRUB_IMAGE} \
+               ${EFI_FILES_PATH}/${GRUB_EFI_BOOT_IMAGE} \
                "
 
 FILES_${PN}_remove_aarch64 = "${libdir}/grub/${GRUB_TARGET}-efi"
-- 
2.23.0


