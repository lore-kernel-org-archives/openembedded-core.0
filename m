Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.1721.1592374856182301615
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2020 23:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: yanfei.xu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 05H6Krw6005898
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Tue, 16 Jun 2020 23:20:53 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Tue, 16 Jun 2020
 23:20:52 -0700
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: <bruce.ashfield@gmail.com>, <openembedded-core@lists.openembedded.org>
CC: <zhe.he@windriver.com>
Subject: [OE-core] [PATCH 1/1] classes/kernel: Use a copy for kernel*.rpm when fs don't support symlink
Date: Wed, 17 Jun 2020 14:20:28 +0800
Message-ID: <20200617062028.5542-2-yanfei.xu@windriver.com>
X-Mailer: git-send-email 2.18.2
In-Reply-To: <20200617062028.5542-1-yanfei.xu@windriver.com>
References: <20200617062028.5542-1-yanfei.xu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain

From: Yanfei Xu <yanfei.xu@windriver.com>

Some filesystems don't support symlink, then you will get failed when
you install or update the kernel rpm package. Now we use a copy for
these filesystems instead of symlink.

Suggested-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
---
 meta/classes/kernel.bbclass | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 41101a64a0..e9b5a84de7 100644
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
+    echo "Filesystem on ${KERNEL_IMAGEDEST}/ doesn't support symlink, then use a copy."
+fi
+set -e
+""" % (type, type))
 
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
@@ -602,6 +610,7 @@ pkg_postinst_${KERNEL_PACKAGE_NAME}-base () {
 	fi
 }
 
+
 PACKAGESPLITFUNCS_prepend = "split_kernel_packages "
 
 python split_kernel_packages () {
-- 
2.18.2

