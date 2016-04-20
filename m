Return-Path: <ygl@koumoul.net>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 0B9C0700FD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 13:51:34 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id e201so10795248wme.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Apr 2016 06:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QBF2MvZMg540s0Q+o5cWQwSYHo0T0gvTP+ciHFuGkNM=;
	b=f18OtlJ4SooOfcvCkv6KuuUpMYZqi8+Aw67wKsg53mX5H8quEB8Q4fUlaPI8LkeQ9t
	XAGPBNhrmo83Tv7T8WoWI9hmphxPkUN6QoJwjQXPgYlsJFdEVUafFkoR/rrmzvYNEF2U
	EVM6jEXOylEusTf12lImPNSJGP93nTNMI0WwU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QBF2MvZMg540s0Q+o5cWQwSYHo0T0gvTP+ciHFuGkNM=;
	b=GGkxdzVm9UElmmV8MicPLpMmTFkLoIc1waOKRy3+xM9Fu6XgiayJqRJMr3gG5kZa2+
	JhNcbRBLNNxlVebxIfmXHQ8ewViAUt1tE/Q+rYbJRPUwqu8CakJxEcdIfC4cKAfYlp2z
	4wcTUfMMhvZZO5xV0S0KcPvTQK7+ENJdmQ+Gv5jDTOXPff8zUszzZfmfrPcIJz7/zKH+
	71lqTeoPOWzrpXzFWYuUsqtcUi7oGuhrG7Kd0FUXxVro6mzaAZGsOkMlj26LthJpzNLS
	0Y/SR+GKKt2bgzeE0hgpnn/oOdvmNJ4sGLHJhuIlVF22AyfFBYTaAjL63cvIKbKSXjmu
	WbXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=QBF2MvZMg540s0Q+o5cWQwSYHo0T0gvTP+ciHFuGkNM=;
	b=i1O2x1WXeHQFp+cRJM+x6wcogDFo/CW1+U+5o+BFDY2LhaA9eQ2wyckws7LgWmdEeO
	teLzbOMqWw33Ce6uWjHA9sV+rtt+gHYTeGDLj7lpzzlg6wPF57/SHndsYsfhuFSqkVbH
	LRAbuTXAYa4NtjuGx8rLkKfjCyxXjs1G9KFDqut23MhnLzPuX36DRhEB/qRTSf8gKFud
	09Z52ZXZM5eMDGQMbndFsBgev+DNk+KLF+z9foRYeNUg7g9eTZcP6NcXgQeFWuEu5G57
	V1sWhERMdyPjtwQWxgKd0msOXYtjy9Kxoj82Lf70HYg1C3yChe80ONG0lswwQUQUi8P8
	hx4A==
X-Gm-Message-State: AOPr4FUUw42EMLasTmyxS5L799oC6K2/VMEVo7Rz6Gxuao7H1QyQs/hXkiZdZoW+8JI6AA==
X-Received: by 10.28.144.20 with SMTP id s20mr10040213wmd.12.1461160294683;
	Wed, 20 Apr 2016 06:51:34 -0700 (PDT)
Received: from pollux.vannes.iot (pat35-3-82-245-140-164.fbx.proxad.net.
	[82.245.140.164])
	by smtp.gmail.com with ESMTPSA id w3sm5770581wjt.0.2016.04.20.06.51.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Apr 2016 06:51:34 -0700 (PDT)
Sender: "Yannick Gicquel [ IoT.bzh ]" <ygl@koumoul.net>
From: Yannick Gicquel <yannick.gicquel@iot.bzh>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Apr 2016 15:50:39 +0200
Message-Id: <1461160239-7799-5-git-send-email-yannick.gicquel@iot.bzh>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1461160239-7799-1-git-send-email-yannick.gicquel@iot.bzh>
References: <1461160239-7799-1-git-send-email-yannick.gicquel@iot.bzh>
Subject: [RFC][PATCH v2 4/4] kernel: fitimage: basic support for fitimage signature
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
X-List-Received-Date: Wed, 20 Apr 2016 13:51:38 -0000

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
 meta/classes/kernel-fitimage.bbclass | 44 ++++++++++++++++++++++++++++++++++--
 1 file changed, 42 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 62e0017..dfd3306 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -1,4 +1,4 @@
-inherit kernel-uboot
+inherit kernel-uboot uboot-sign
 
 python __anonymous () {
     kerneltype = d.getVar('KERNEL_IMAGETYPE', True)
@@ -15,6 +15,12 @@ python __anonymous () {
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
@@ -132,6 +138,9 @@ EOF
 fitimage_emit_section_config() {
 
 	conf_csum="sha1"
+	if [ -n "${UBOOT_SIGN_ENABLE}" ] ; then
+		conf_sign_keyname="${UBOOT_SIGN_KEYNAME}"
+	fi
 
 	# Test if we have any DTBs at all
 	if [ -z "${2}" ] ; then
@@ -152,6 +161,26 @@ fitimage_emit_section_config() {
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
@@ -160,7 +189,7 @@ do_assemble_fitimage() {
 	if test "x${KERNEL_IMAGETYPE}" = "xfitImage" ; then
 		kernelcount=1
 		dtbcount=""
-		rm -f fit-image.its
+		rm -f fit-image.its arch/${ARCH}/boot/fitImage
 
 		fitimage_emit_fit_header
 
@@ -216,6 +245,17 @@ do_assemble_fitimage() {
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


