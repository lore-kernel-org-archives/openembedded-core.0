Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.9838.1611053597418268513
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Jan 2021 02:53:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: abdellatif.elkhlifi@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0F8F91042;
	Tue, 19 Jan 2021 02:53:17 -0800 (PST)
Received: from e121910.arm.com (unknown [10.57.9.194])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 920B53F68F;
	Tue, 19 Jan 2021 02:53:15 -0800 (PST)
From: "Abdellatif El Khlifi" <abdellatif.elkhlifi@arm.com>
To: openembedded-core@lists.openembedded.org,
	Lakshmi.Kailasanathan@arm.com,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
Subject: [meta-oe][PATCH v2 2/3] kernel: skip installing fitImage when using Initramfs bundles
Date: Tue, 19 Jan 2021 10:53:02 +0000
Message-Id: <20210119105303.20592-3-abdellatif.elkhlifi@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210119105303.20592-1-abdellatif.elkhlifi@arm.com>
References: <20210119105303.20592-1-abdellatif.elkhlifi@arm.com>

From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>

When including an initramfs bundle inside a FIT image, the fitImage is created
after the install task by do_assemble_fitimage_initramfs.

This happens after the generation of the initramfs bundle
(done by do_bundle_initramfs).

So, at the level of the install task we should not try to install the fitImage.
The fitImage is still not generated yet.

After the generation of the fitImage, the deploy task copies the fitImage from
the build directory to the deploy folder.

Change-Id: I3eaa6bba1412f388f710fa0f389f66631c1c4826
Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
---
 meta/classes/kernel.bbclass | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 2f1006ddf0..ddff2ddcd2 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -415,9 +415,23 @@ kernel_do_install() {
 	#
 	install -d ${D}/${KERNEL_IMAGEDEST}
 	install -d ${D}/boot
+
+	#
+	# When including an initramfs bundle inside a FIT image, the fitImage is created after the install task
+	# by do_assemble_fitimage_initramfs.
+	# This happens after the generation of the initramfs bundle (done by do_bundle_initramfs).
+	# So, at the level of the install task we should not try to install the fitImage. fitImage is still not
+	# generated yet.
+	# After the generation of the fitImage, the deploy task copies the fitImage from the build directory to
+	# the deploy folder.
+	#
+
 	for imageType in ${KERNEL_IMAGETYPES} ; do
-		install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType ${D}/${KERNEL_IMAGEDEST}/$imageType-${KERNEL_VERSION}
+		if [ $imageType != "fitImage" ] || [ "${INITRAMFS_IMAGE_BUNDLE}" != "1" ] ; then
+			install -m 0644 ${KERNEL_OUTPUT_DIR}/$imageType ${D}/${KERNEL_IMAGEDEST}/$imageType-${KERNEL_VERSION}
+		fi
 	done
+
 	install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
 	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
 	install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
-- 
2.17.1

