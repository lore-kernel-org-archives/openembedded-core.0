Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.2659.1592467050673120648
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2020 00:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: yanfei.xu@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 05I7vRZB005374
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Thu, 18 Jun 2020 00:57:28 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Thu, 18 Jun 2020
 00:57:27 -0700
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <bruce.ashfield@gmail.com>
CC: <zhe.he@windriver.com>
Subject: [OE-core] [PATCH v2] classes/kernel: Use a copied image for kernel*.rpm if fs don't support symlinks
Date: Thu, 18 Jun 2020 15:57:25 +0800
Message-ID: <20200618075725.39434-1-yanfei.xu@windriver.com>
X-Mailer: git-send-email 2.18.2
MIME-Version: 1.0
Content-Type: text/plain

From: Yanfei Xu <yanfei.xu@windriver.com>

Some filesystems don't support symlink, then you will get failure when
you install or update the kernel rpm package. Now we use a copied iamge
for these filesystems instead of symlink.

Suggested-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
---
 meta/classes/kernel.bbclass | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 41101a64a0..749d1a0f29 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -94,6 +94,14 @@ python __anonymous () {
         d.appendVar('RDEPENDS_%s-image' % kname, ' %s-image-%s' % (kname, typelower))
         d.setVar('PKG_%s-image-%s' % (kname,typelower), '%s-image-%s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
         d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower), '1')
+        d.setVar('pkg_postinst_ontarget_%s-image-%s' % (kname,typelower), """
+set +e
+ln -sf %s-${KERNEL_VERSION} ${KERNEL_IMAGEDEST}/%s > /dev/null 2>&1
+if [ $? -ne 0 ]; then
+    echo "Filesystem on ${KERNEL_IMAGEDEST}/ doesn't support symlinks, falling back to copied image (%s)."
+fi
+set -e
+""" % (type, type, type))
 
     image = d.getVar('INITRAMFS_IMAGE')
     # If the INTIRAMFS_IMAGE is set but the INITRAMFS_IMAGE_BUNDLE is set to 0,
@@ -386,7 +394,7 @@ kernel_do_install() {
 	for imageType in ${KERNEL_IMAGETYPES} ; do
 		install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} ${D}/${KERNEL_IMAGEDEST}/${imageType}-${KERNEL_VERSION}
 		if [ "${KERNEL_PACKAGE_NAME}" = "kernel" ]; then
-			ln -sf ${imageType}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${imageType}
+			install -m 0644 ${D}/${KERNEL_IMAGEDEST}/${imageType}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${imageType}
 		fi
 	done
 	install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
-- 
2.18.2

