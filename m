Return-Path: <ygl@koumoul.net>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 401B970034
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 12:47:34 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n3so4896193wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 05:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0UBTPBqEiXGiusip5Mst9tBry6ahi0w2ZRBOEWcKB6E=;
	b=KvUKWochshx4azqZxDqc4nAf3EiQfX9NL/fprfyvnqNtwXe81MAYX39ECunFZrWpRB
	FVNa7PR5qYkaAJHDgNTAjefNeigtZWBMnD1xLPMo3jfe0WVAEAOWmXym+AkD6P4gKNoh
	L39BT7Nixz45UoQOHI8RcZjqtCaldaqgf5Mgs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0UBTPBqEiXGiusip5Mst9tBry6ahi0w2ZRBOEWcKB6E=;
	b=EPQGPOcSvWjGvlZIh2hev4gOS6gppzrUGXFlZ7ofwPlEHdAiSwGz7X6rwDC2EjxV+W
	jQC89EOu6jn847Txr40PhAGEzUe7vB56S3g4YDoeg9oUc5Gq9Wz79wO6Ai9MaRQ0QpBc
	9cOGQNl4nyo3p2WDUq6musTEJX5vK+GQl85NqCGwZ/q0wHBiXEfYC8pPlPUs1zglP6CG
	PM7CQi4jlWFCOSfwiuFBADtAS4iaZRD6Nd3Yh+MiY4XT3qmzjsXiAaceVoEETHvocan0
	HWdSF2JSoZ3SrH2wl/4v72D4sXdlE369PXPTB6e3j1+r5T0UxVeLEx2nExkhXql3RAj1
	t9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=0UBTPBqEiXGiusip5Mst9tBry6ahi0w2ZRBOEWcKB6E=;
	b=J9vD0H/IQqOaYgcM2U1plXjlVQzNv3NUG635BUHf9uza1SBDmdXhzWxc35WLtKOw8n
	Qbbn7jttUs47H2eS8yJYlveAri1TTGYLTH5wtxry7q6VWyS/L07Pbx0YN3RrkoEU2So3
	QuQ+Hsj2ZEhiyZ9tPDIIyBBtkUUCWX4/lmmEF5yLOgv4ZDOftdv34O25V3pcvKiilVld
	H919FI773t+4OGu29ZV0U65tbsU7iSRoDQaqblqP+w+B7sFToLQv10L2OY0g829WuqhR
	mNq8FmOA/b5YJ6x7HnGMWo2OVwZf/zi55e7emLOTtjV75rDB5zuq206qSDnlEqEwTETS
	6glA==
X-Gm-Message-State: AOPr4FW4RIYSOVQSJxhu34uVxSFJF/R3BbA7CY+NelYhNJkJhiEXhO5esXaoMghaw2T+Eg==
X-Received: by 10.28.130.133 with SMTP id e127mr25718404wmd.48.1461070054800; 
	Tue, 19 Apr 2016 05:47:34 -0700 (PDT)
Received: from pollux.vannes.iot (pat35-3-82-245-140-164.fbx.proxad.net.
	[82.245.140.164]) by smtp.gmail.com with ESMTPSA id
	g141sm4228868wme.0.2016.04.19.05.47.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 19 Apr 2016 05:47:33 -0700 (PDT)
Sender: "Yannick Gicquel [ IoT.bzh ]" <ygl@koumoul.net>
From: Yannick Gicquel <yannick.gicquel@iot.bzh>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Apr 2016 14:46:43 +0200
Message-Id: <1461070003-12494-5-git-send-email-yannick.gicquel@iot.bzh>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1461070003-12494-1-git-send-email-yannick.gicquel@iot.bzh>
References: <1461070003-12494-1-git-send-email-yannick.gicquel@iot.bzh>
Subject: [RFC PATCH 4/4] kernel: fitimage: basic support for fitimage signature
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
X-List-Received-Date: Tue, 19 Apr 2016 12:47:34 -0000

This is an initial support of fitImage signature to enable U-Boot verified
boot. This feature is implemented by adding a signature tag to the
configuration section of the generated fit-image.its file.

When a UBOOT_SIGN_ENABLE variable is set to "1", the signature procedure is
activated and performs a second call to mkimage to sign the fitImage file and
to include the public key in the deployed U-Boot device tree blob. (This
implementation depends on the use of CONFIG_OF_SEPARATE in U-Boot.)

As the U-Boot device tree blob is appended in the deploy dir, a dependency
on 'u-boot:do_deploy' is added when the feature is activated.

Signed-off-by: Yannick Gicquel <yannick.gicquel@iot.bzh>
---
 meta/classes/kernel-fitimage.bbclass | 45 +++++++++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 62e0017..cbf07ba 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -1,5 +1,8 @@
 inherit kernel-uboot
 
+# To resolve the following UBOOT_DTB_BINARY identifier
+require recipes-bsp/u-boot/u-boot-sign.inc
+
 python __anonymous () {
     kerneltype = d.getVar('KERNEL_IMAGETYPE', True)
     if kerneltype == 'fitImage':
@@ -15,6 +18,12 @@ python __anonymous () {
         image = d.getVar('INITRAMFS_IMAGE', True)
         if image:
             d.appendVarFlag('do_assemble_fitimage', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
+
+        # Verified boot will sign the fitImage and append the public key to
+        # U-boot dtb. We ensure the U-Boot dtb is deployed before assembling
+        # the fitImage:
+        if d.getVar('UBOOT_SIGN_ENABLE', True):
+            d.appendVarFlag('do_assemble_fitimage', 'depends', ' u-boot:do_deploy')
 }
 
 # Options for the device tree compiler passed to mkimage '-D' feature:
@@ -132,6 +141,9 @@ EOF
 fitimage_emit_section_config() {
 
 	conf_csum="sha1"
+	if [ -n "${UBOOT_SIGN_ENABLE}" ] ; then
+		conf_sign_keyname="${UBOOT_SIGN_KEYNAME}"
+	fi
 
 	# Test if we have any DTBs at all
 	if [ -z "${2}" ] ; then
@@ -152,6 +164,26 @@ fitimage_emit_section_config() {
                         hash@1 {
                                 algo = "${conf_csum}";
                         };
+EOF
+
+	if [ ! -z "${conf_sign_keyname}" ] ; then
+
+		if [ -z "${2}" ] ; then
+			sign_line="sign-images = \"kernel\";"
+		else
+			sign_line="sign-images = \"fdt\", \"kernel\";"
+		fi
+
+		cat << EOF >> fit-image.its
+                        signature@1 {
+                                algo = "${conf_csum},rsa2048";
+                                key-name-hint = "${conf_sign_keyname}";
+                                sign-images = "fdt", "kernel";
+                        };
+EOF
+	fi
+
+	cat << EOF >> fit-image.its
                 };
 EOF
 }
@@ -160,7 +192,7 @@ do_assemble_fitimage() {
 	if test "x${KERNEL_IMAGETYPE}" = "xfitImage" ; then
 		kernelcount=1
 		dtbcount=""
-		rm -f fit-image.its
+		rm -f fit-image.its arch/${ARCH}/boot/fitImage
 
 		fitimage_emit_fit_header
 
@@ -216,6 +248,17 @@ do_assemble_fitimage() {
 			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
 			-f fit-image.its \
 			arch/${ARCH}/boot/fitImage
+
+		#
+		# Step 5: Sign the image and add public key to U-Boot dtb
+		#
+		if test -n "${UBOOT_SIGN_ENABLE}"; then
+			uboot-mkimage \
+				${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
+				-F -k "${UBOOT_SIGN_KEYDIR}" \
+				-K "${DEPLOY_DIR_IMAGE}/${UBOOT_DTB_BINARY}" \
+				-r arch/${ARCH}/boot/fitImage
+		fi
 	fi
 }
 
-- 
1.9.1


