Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.4861.1592567256245033428
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2020 04:47:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: yanfei.xu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 05JBlWvb023463
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Fri, 19 Jun 2020 04:47:32 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Fri, 19 Jun 2020
 04:47:32 -0700
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: <bruce.ashfield@gmail.com>, <richard.purdie@linuxfoundation.org>,
        <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 1/1 v3] classes/kernel: Use a copy of image for kernel*.rpm if fs doesn't support symlinks
Date: Fri, 19 Jun 2020 19:47:27 +0800
Message-ID: <20200619114727.40142-2-yanfei.xu@windriver.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200619114727.40142-1-yanfei.xu@windriver.com>
References: <20200619114727.40142-1-yanfei.xu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Yanfei Xu <yanfei.xu@windriver.com>

Some filesystems don't support symlink, then you will get failure when
you install or update the kernel rpm package. Now we use a copy of
image for these filesystems instead of symlink.

Suggested-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Suggested-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
---
 meta/classes/kernel.bbclass | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 20a0135fc9..1269b54343 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -94,6 +94,22 @@ python __anonymous () {
         d.appendVar('RDEPENDS_%s-image' % kname, ' %s-image-%s' % (kname, typelower))
         d.setVar('PKG_%s-image-%s' % (kname,typelower), '%s-image-%s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
         d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower), '1')
+        d.setVar('pkg_postinst_ontarget_%s-image-%s' % (kname,typelower), """
+set +e
+ln -sf %s-${KERNEL_VERSION} ${KERNEL_IMAGEDEST}/%s > /dev/null 2>&1
+if [ $? -ne 0 ]; then
+    echo "Filesystem on ${KERNEL_IMAGEDEST}/ doesn't support symlinks, falling back to copied image (%s)."
+    install -m 0644 ${KERNEL_IMAGEDEST}/%s-${KERNEL_VERSION} ${KERNEL_IMAGEDEST}/%s 
+fi
+set -e
+""" % (type, type, type, type, type))
+        d.setVar('pkg_postrm_%s-image-%s' % (kname,typelower), """
+set +e
+if [ -f "${KERNEL_IMAGEDEST}/%s" -o -L "${KERNEL_IMAGEDEST}/%s" ]; then
+    rm -f ${KERNEL_IMAGEDEST}/%s  > /dev/null 2>&1
+fi
+set -e
+""" % (type, type, type))
 
     image = d.getVar('INITRAMFS_IMAGE')
     # If the INTIRAMFS_IMAGE is set but the INITRAMFS_IMAGE_BUNDLE is set to 0,
@@ -385,9 +401,6 @@ kernel_do_install() {
 	install -d ${D}/boot
 	for imageType in ${KERNEL_IMAGETYPES} ; do
 		install -m 0644 ${KERNEL_OUTPUT_DIR}/${imageType} ${D}/${KERNEL_IMAGEDEST}/${imageType}-${KERNEL_VERSION}
-		if [ "${KERNEL_PACKAGE_NAME}" = "kernel" ]; then
-			ln -sf ${imageType}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${imageType}
-		fi
 	done
 	install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
 	install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
-- 
2.18.2

