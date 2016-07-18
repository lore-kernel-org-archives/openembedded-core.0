Return-Path: <george.mccollister@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 097406FFED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 17:58:23 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id w143so16757290oiw.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 10:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Jn9d8TOc594vSfhbBXdas6Hs9wvsSyj2mDKsKjvNFyk=;
	b=ahKsjH7pGlH4cm33SX8Bo/bQ2p7UZKnDvH2m1plVbigBhKIM3dIxKlnnB3tXIcF7E6
	ljAqnsqqaQKS6Wr7bKgfz58ELygdxNGdIR0OQq/J90XgiC3jw6X96Ai4o22ndrKOt5gB
	tEeWOH3owPBcwENWvUZHhbxKNQu7WhAvwM40aSB5BJ3VULtEn24chfSKdbYdSSHgFCCt
	EgH+EpihoDpJfXyBNboSfdIz9hsmPkB6ncbPhDtrkVJ82ZGSJv7dM8FigMIfMVJ8Q4yz
	4eRnXXUGHER4o2/OLscqb3GqoGzHWFWTO0b5b9alTE0ZMmQWFdkN3EEgJbdEzWG6ovbX
	WsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Jn9d8TOc594vSfhbBXdas6Hs9wvsSyj2mDKsKjvNFyk=;
	b=E07c8hj0I49fuO5/jyTp5a6fMxmDAq37kLEGTITWnU+BP6Pk2pWJTDe3XxYW/f230L
	ZnrSslfnapXJ/Ua2qDlzo8CrkoY05ou/2PLMGKu8vmFP/BQUvG9hNKOM0PUbDFFQhvfi
	tUzoM3InKgT9rQYMKl+QfeZvEgmeCArX6KB5Vn42HY4ssjYkPhAz9sROG3XAOnwNjxP7
	YkjeeuFGrDIw21sdTbukG2Ja7eTtj5wOzmqoTUXezvQj43429qLk5i+GPLQoROXWlDyQ
	9FRj4jd+QNJY8S/wWBOW+hgK0WmcPaxpenhnyr+7WmY65mxLmVkDwiiXUvT3arODaUS1
	mz4w==
X-Gm-Message-State: ALyK8tLnn1Qo1i8WtdotOMTVbtSDmQ8wYff+BbmL8Id9ZdFq5s4SYveQmAkQMYdNMsQT/w==
X-Received: by 10.157.62.183 with SMTP id b52mr5151642otc.178.1468864704117;
	Mon, 18 Jul 2016 10:58:24 -0700 (PDT)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52]) by smtp.gmail.com with ESMTPSA id
	s20sm9402275ota.25.2016.07.18.10.58.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 18 Jul 2016 10:58:23 -0700 (PDT)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jul 2016 12:57:56 -0500
Message-Id: <e4091eb7e89b6946db9fafd1f3bdb722818d167e.1468862824.git.george.mccollister@gmail.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <1c06daa2a3dad03821aff6a7f7502036fb90f2b4.1468862824.git.george.mccollister@gmail.com>
References: <1c06daa2a3dad03821aff6a7f7502036fb90f2b4.1468862824.git.george.mccollister@gmail.com>
In-Reply-To: <cover.1468862824.git.george.mccollister@gmail.com>
References: <cover.1468862824.git.george.mccollister@gmail.com>
Cc: marex@denx.de
Subject: [PATCH 2/3] kernel-fitimage: Add x86 support
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
X-List-Received-Date: Mon, 18 Jul 2016 17:58:24 -0000

For x86, bzImage must be built instead of zImage.

Include setup.bin (which is required to boot the kernel) in the fitimage
and always use a load/boot address of 0x00090000.

For details see:
http://git.denx.de/?p=u-boot.git;a=blob;f=doc/uImage.FIT/x86-fit-boot.txt

Signed-off-by: George McCollister <george.mccollister@gmail.com>
---
 meta/classes/kernel-fitimage.bbclass | 112 +++++++++++++++++++++++++----------
 1 file changed, 82 insertions(+), 30 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index ede69e7..d4e3ed8 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -7,12 +7,17 @@ python __anonymous () {
         depends = "%s u-boot-mkimage-native dtc-native" % depends
         d.setVar("DEPENDS", depends)
 
+        if d.getVar("UBOOT_ARCH", True) == "x86":
+            replacementtype = "bzImage"
+        else:
+            replacementtype = "zImage"
+
 	# Override KERNEL_IMAGETYPE_FOR_MAKE variable, which is internal
 	# to kernel.bbclass . We have to override it, since we pack zImage
 	# (at least for now) into the fitImage .
         typeformake = d.getVar("KERNEL_IMAGETYPE_FOR_MAKE", True) or ""
         if 'fitImage' in typeformake.split():
-            d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('fitImage', 'zImage'))
+            d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake.replace('fitImage', replacementtype))
 
         image = d.getVar('INITRAMFS_IMAGE', True)
         if image:
@@ -138,6 +143,33 @@ EOF
 }
 
 #
+# Emit the fitImage ITS setup section
+#
+# $1 ... .its filename
+# $2 ... Image counter
+# $3 ... Path to setup image
+fitimage_emit_section_setup() {
+
+	setup_csum="sha1"
+
+	cat << EOF >> ${1}
+                setup@${2} {
+                        description = "Linux setup.bin";
+                        data = /incbin/("${3}");
+                        type = "x86_setup";
+                        arch = "${UBOOT_ARCH}";
+                        os = "linux";
+                        compression = "none";
+                        load = <0x00090000>;
+                        entry = <0x00090000>;
+                        hash@1 {
+                                algo = "${setup_csum}";
+                        };
+                };
+EOF
+}
+
+#
 # Emit the fitImage ITS ramdisk section
 #
 # $1 ... .its filename
@@ -171,6 +203,7 @@ EOF
 # $2 ... Linux kernel ID
 # $3 ... DTB image ID
 # $4 ... ramdisk ID
+# $5 ... config ID
 fitimage_emit_section_config() {
 
 	conf_csum="sha1"
@@ -179,24 +212,25 @@ fitimage_emit_section_config() {
 	fi
 
 	# Test if we have any DTBs at all
-	if [ -z "${3}" -a -z "${4}" ] ; then
-		conf_desc="Boot Linux kernel"
-		fdt_line=""
-		ramdisk_line=""
-	elif [ -z "${4}" ]; then
-		conf_desc="Boot Linux kernel with FDT blob"
-		fdt_line="fdt = \"fdt@${3}\";"
-		ramdisk_line=""
-	elif [ -z "${3}" ]; then
-		conf_desc="Boot Linux kernel with ramdisk"
-		fdt_line=""
-		ramdisk_line="ramdisk = \"ramdisk@${4}\";"
-	else
-		conf_desc="Boot Linux kernel with FDT blob, ramdisk"
+	conf_desc="Linux kernel"
+	kernel_line="kernel = \"kernel@${2}\";"
+	fdt_line=""
+	ramdisk_line=""
+
+	if [ -n "${3}" ]; then
+		conf_desc="${conf_desc}, FDT blob"
 		fdt_line="fdt = \"fdt@${3}\";"
+	fi
+
+	if [ -n "${4}" ]; then
+		conf_desc="${conf_desc}, ramdisk"
 		ramdisk_line="ramdisk = \"ramdisk@${4}\";"
 	fi
-	kernel_line="kernel = \"kernel@${2}\";"
+
+	if [ -n "${5}" ]; then
+		conf_desc="${conf_desc}, setup"
+		setup_line="setup = \"setup@${5}\";"
+	fi
 
 	cat << EOF >> ${1}
                 default = "conf@1";
@@ -205,6 +239,7 @@ fitimage_emit_section_config() {
 			${kernel_line}
 			${fdt_line}
 			${ramdisk_line}
+			${setup_line}
                         hash@1 {
                                 algo = "${conf_csum}";
                         };
@@ -212,16 +247,22 @@ EOF
 
 	if [ ! -z "${conf_sign_keyname}" ] ; then
 
-		if [ -z "${3}" -a -z "${4}" ] ; then
-			sign_line="sign-images = \"kernel\";"
-		elif [ -z "${4}" ]; then
-			sign_line="sign-images = \"fdt\", \"kernel\";"
-		elif [ -z "${3}" ]; then
-			sign_line="sign-images = \"ramdisk\", \"kernel\";"
-		else
-			sign_line="sign-images = \"ramdisk\", \"fdt\", \"kernel\";"
+		sign_line="sign-images = \"kernel\""
+
+		if [ -n "${3}" ]; then
+			sign_line="${sign_line}, \"fdt\""
+		fi
+
+		if [ -n "${4}" ]; then
+			sign_line="${sign_line}, \"ramdisk\""
 		fi
 
+		if [ -n "${5}" ]; then
+			sign_line="${sign_line}, \"setup\""
+		fi
+
+		sign_line="${sign_line};"
+
 		cat << EOF >> ${1}
                         signature@1 {
                                 algo = "${conf_csum},rsa2048";
@@ -246,6 +287,7 @@ fitimage_assemble() {
 	kernelcount=1
 	dtbcount=""
 	ramdiskcount=${3}
+	setupcount=""
 	rm -f ${1} arch/${ARCH}/boot/${2}
 
 	fitimage_emit_fit_header ${1}
@@ -279,7 +321,15 @@ fitimage_assemble() {
 	fi
 
 	#
-	# Step 3: Prepare a ramdisk section.
+	# Step 3: Prepare a setup section. (For x86)
+	#
+	if test -e arch/${ARCH}/boot/setup.bin ; then
+		setupcount=1
+		fitimage_emit_section_setup ${1} "${setupcount}" arch/${ARCH}/boot/setup.bin
+	fi
+
+	#
+	# Step 4: Prepare a ramdisk section.
 	#
 	if [ "x${ramdiskcount}" = "x1" ] ; then
 		copy_initramfs
@@ -290,21 +340,23 @@ fitimage_assemble() {
 
 	# Force the first Kernel and DTB in the default config
 	kernelcount=1
-	dtbcount=1
+	if test -n "${dtbcount}"; then
+		dtbcount=1
+	fi
 
 	#
-	# Step 4: Prepare a configurations section
+	# Step 5: Prepare a configurations section
 	#
 	fitimage_emit_section_maint ${1} confstart
 
-	fitimage_emit_section_config ${1} ${kernelcount} ${dtbcount} ${ramdiskcount}
+	fitimage_emit_section_config ${1} "${kernelcount}" "${dtbcount}" "${ramdiskcount}" "${setupcount}"
 
 	fitimage_emit_section_maint ${1} sectend
 
 	fitimage_emit_section_maint ${1} fitend
 
 	#
-	# Step 5: Assemble the image
+	# Step 6: Assemble the image
 	#
 	uboot-mkimage \
 		${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
@@ -312,7 +364,7 @@ fitimage_assemble() {
 		arch/${ARCH}/boot/${2}
 
 	#
-	# Step 6: Sign the image and add public key to U-Boot dtb
+	# Step 7: Sign the image and add public key to U-Boot dtb
 	#
 	if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ] ; then
 		uboot-mkimage \
-- 
2.8.0


