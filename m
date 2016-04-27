Return-Path: <ygl@koumoul.net>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 74A1F758DB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 14:23:26 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id n129so4378997wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 07:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=koumoul.net; s=dkim;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ceU8+FkyPkhIyHUN8BvSHWzuvW4qm+RRwLCWk9Edts0=;
	b=L15EGXqU1Uv45+btUoXhujHO7aepy7g6mlS+G1xCh+GGF5Vs5p4gbnsIKQUdpmSUZ9
	GeEd13Ya96G09sSYU8zR/02zSCBiBtwnpV+nKUskwYFq4kgBFfzyBWpPYTP+Li1ImxXi
	RV5dEHf0A+EWUUM3FkH2MIMATsXtI2S2z9W1o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=iot-bzh.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ceU8+FkyPkhIyHUN8BvSHWzuvW4qm+RRwLCWk9Edts0=;
	b=xWdznnlhzlX0NXIrKObcNGvTyIkkLOO/2uCN7CvaHv8u02iU/7FqXyNhhOaKDliT7e
	5kNSydgCOfUaitHtI/5nxleu4NDpeRdwTIaSTah3VtGOb+AF8r53mjEyxjBymSQR450a
	yxxm1sRSxB1k8L8fV/1r2u/qo/lfvmqW2Fx9dtogaDzT3LDaHQgte2yEKfo9SpxLZkcd
	NhcNUIaQz+xFit7c3ZBLEuVYaPahceGFpCVVo/TNI6XGHYtTu3Ofrvtr5dbl+NBRFNu4
	z+CJK6s0Vtv6CjO+uDXw+upseOx5YTRYqP77hk806CpjwCiOffWAjhS2ASiAi6hr/ex8
	gvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=ceU8+FkyPkhIyHUN8BvSHWzuvW4qm+RRwLCWk9Edts0=;
	b=UVatWMJrDHVptQMGueMoSDNi2bfmAnFgZQyB3FrCk0ghh9ktgAfnPrhejEP7FEwmS0
	iWS5EwUFu47eSX8FkOFnBhLkdfqRnqjxq0MQsoq+bb6VWhG0J6PAzUMDsr0Neky9PHbe
	X8EDMoJIOThy/y9kyr/lBzJ2nEyS7Clw4KwRP1gGPmqfF+Edvw3GqsvkQZXIQsmh1jNq
	bwD/LNunDljPZTlxOsHsY7LwEzb05Y/LBlD/SzZMGr9KWSBQXODYtCRMPh6kvqxIMB/l
	vBSCv2NaolXNjqJtVjc0hoUwdarayFQZU55nsePSPs4MTvIG+/K8WrekehZMamwP6KsS
	btaQ==
X-Gm-Message-State: AOPr4FWPVNabv8NCObYzCtzysjMXHga9T9mWE4P0rJa0G+dRPtgGgffObG39BGl6gB3k2g==
X-Received: by 10.194.3.20 with SMTP id 20mr11007361wjy.59.1461767006634;
	Wed, 27 Apr 2016 07:23:26 -0700 (PDT)
Received: from pollux.vannes.iot (pat35-3-82-245-140-164.fbx.proxad.net.
	[82.245.140.164]) by smtp.gmail.com with ESMTPSA id
	kq9sm4313514wjc.26.2016.04.27.07.23.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Apr 2016 07:23:25 -0700 (PDT)
Sender: "Yannick Gicquel [ IoT.bzh ]" <ygl@koumoul.net>
From: Yannick Gicquel <yannick.gicquel@iot.bzh>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Apr 2016 16:20:56 +0200
Message-Id: <1461766856-27881-5-git-send-email-yannick.gicquel@iot.bzh>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1461766856-27881-1-git-send-email-yannick.gicquel@iot.bzh>
References: <1461766856-27881-1-git-send-email-yannick.gicquel@iot.bzh>
Subject: [PATCH v3 4/4] kernel: fitimage: basic support for fitimage signature
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
X-List-Received-Date: Wed, 27 Apr 2016 14:23:27 -0000

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
 meta/classes/kernel-fitimage.bbclass | 45 ++++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 62e0017..809bd4d 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -1,4 +1,4 @@
-inherit kernel-uboot
+inherit kernel-uboot uboot-sign
 
 python __anonymous () {
     kerneltype = d.getVar('KERNEL_IMAGETYPE', True)
@@ -15,6 +15,13 @@ python __anonymous () {
         image = d.getVar('INITRAMFS_IMAGE', True)
         if image:
             d.appendVarFlag('do_assemble_fitimage', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
+
+        # Verified boot will sign the fitImage and append the public key to
+        # U-boot dtb. We ensure the U-Boot dtb is deployed before assembling
+        # the fitImage:
+        if d.getVar('UBOOT_SIGN_ENABLE', True):
+            uboot_pn = d.getVar('PREFERRED_PROVIDER_u-boot', True) or 'u-boot'
+            d.appendVarFlag('do_assemble_fitimage', 'depends', ' %s:do_deploy' % uboot_pn)
 }
 
 # Options for the device tree compiler passed to mkimage '-D' feature:
@@ -132,6 +139,9 @@ EOF
 fitimage_emit_section_config() {
 
 	conf_csum="sha1"
+	if [ -n "${UBOOT_SIGN_ENABLE}" ] ; then
+		conf_sign_keyname="${UBOOT_SIGN_KEYNAME}"
+	fi
 
 	# Test if we have any DTBs at all
 	if [ -z "${2}" ] ; then
@@ -152,6 +162,26 @@ fitimage_emit_section_config() {
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
@@ -160,7 +190,7 @@ do_assemble_fitimage() {
 	if test "x${KERNEL_IMAGETYPE}" = "xfitImage" ; then
 		kernelcount=1
 		dtbcount=""
-		rm -f fit-image.its
+		rm -f fit-image.its arch/${ARCH}/boot/fitImage
 
 		fitimage_emit_fit_header
 
@@ -216,6 +246,17 @@ do_assemble_fitimage() {
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


