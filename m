Return-Path: <george.mccollister@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2E420771AA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 16:38:59 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id a101so5823395oic.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 09:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Wua1YB8MAXqNSh57yZ4Iw6agDXAEzXIibM0x+DyFxHo=;
	b=fg8gvwCfRfN5EFMn0Y2aLM/Bh0Xhk8JGzE8BC/A2t9n2LvrahbVpEk+EO9P+/a+TtX
	skpJNO5antkecbnXv+raHBuS2MwgtFkX2QvFZgfKNcqDotrqFClqmcIZidsOMaQSRa7t
	CokJludtDyuvJ+ufBeXFJQLmfit4eCIjJcAP6vF/e5jz0qjUJYdI809QXglGpIUSQyUO
	ecEgoCZ/1VO9ScKoinzedlH8QGcnDpdtGK7ZYtdpTrr0bshtLfa1Km/jgwFOXOi6DZCg
	5F4monsS7tPZRHUYp/IfIWMoaR9HO+pddqe+cl8E0IhnAuRGuwTYtsXkQv7InrTz/0q2
	LEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Wua1YB8MAXqNSh57yZ4Iw6agDXAEzXIibM0x+DyFxHo=;
	b=LC/iZn877rzjOxAjG98BgHCy7dcAoWMAkLEy04dRKifz1O3147tXMV9jER9/DtlKao
	MAO9+0vN6zBJQy2hEVmTwlenJyqCXv2587CEJI2CGC+ltpxsi/nRKawPWUffqoygH9AA
	y9lqiVZSARPVSCKwKWcdH2XiA8HiZv6rlVJDYhHi833h/rN14m36kTMvybioZthlkMdm
	12SxsaXZxPRZGrkhLqmM3QSnGV9K305GlHKlB4sIxBqvXVQlKacQAj/6QVX5G3xSyFZ2
	a25YpoSwDcRQwl1vui3xMacjYaNAekbQgrAF9G2r0eb+jv3klYmjfLAlo8nFheQkDFUh
	REog==
X-Gm-Message-State: AEkoouvg8R6WWTFNK37iZWOtrIiAeaspQUbsb9Ui7/Zz+FJDCJZN3hMdFkAcyEST6/79FQ==
X-Received: by 10.157.36.6 with SMTP id p6mr12212475ota.124.1470674340739;
	Mon, 08 Aug 2016 09:39:00 -0700 (PDT)
Received: from localhost.localdomain (216-21-169-52.slc.googlefiber.net.
	[216.21.169.52]) by smtp.gmail.com with ESMTPSA id
	e195sm12516486oic.21.2016.08.08.09.38.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Aug 2016 09:39:00 -0700 (PDT)
From: George McCollister <george.mccollister@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Aug 2016 11:37:55 -0500
Message-Id: <e74cb3bef91ce6767fc1c9d1afbb6d9fc0b9eac9.1470672689.git.george.mccollister@gmail.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1470672689.git.george.mccollister@gmail.com>
References: <cover.1470672689.git.george.mccollister@gmail.com>
In-Reply-To: <cover.1470672689.git.george.mccollister@gmail.com>
References: <cover.1470672689.git.george.mccollister@gmail.com>
Cc: marex@denx.de, trini@konsulko.com, andrew.bradford@kodakalaris.com,
	denys@ti.com
Subject: [PATCH v2 3/5] kernel-fitimage: Add x86 support
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
X-List-Received-Date: Mon, 08 Aug 2016 16:39:00 -0000

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
index f05d8a5..8580247 100644
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


