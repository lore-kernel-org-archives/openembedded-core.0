Return-Path: <Guojian.Zhou@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BE25B6FFC8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 08:10:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u0V8ATvk025635
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Jan 2016 00:10:29 -0800 (PST)
Received: from pek-lpgtest4.wrs.com (128.224.153.84) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 31 Jan 2016 00:10:28 -0800
From: <guojian.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 31 Jan 2016 16:10:27 +0800
Message-ID: <1454227827-1812-1-git-send-email-guojian.zhou@windriver.com>
X-Mailer: git-send-email 1.7.12.4
MIME-Version: 1.0
Subject: [PATCH 1/1] oe-core: Add the "PACKAGE_VENDOR_REPO" directory for the vendor-proprietary rpm
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
X-List-Received-Date: Sun, 31 Jan 2016 08:10:37 -0000
Content-Type: text/plain

From: Guojian Zhou <guojian.zhou@windriver.com>

The vendor proprietary rpms should be packaged into the
"vendor_proprietary_extensions" directory. Add the "PACKAGE_VENDOR_REPO"
to allow the recipes select the required packages directory.

Signed-off-by: Guojian Zhou <guojian.zhou@windriver.com>
---
 meta/classes/package_rpm.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 92ddf7a..cd3784d 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -675,13 +675,17 @@ python do_package_rpm () {
     targetsys = d.getVar('TARGET_SYS', True)
     targetvendor = d.getVar('HOST_VENDOR', True)
     package_arch = (d.getVar('PACKAGE_ARCH', True) or "").replace("-", "_")
+    package_vendor_repo = (d.getVar('PACKAGE_VENDOR_REPO', True) or "").replace("-", "_")
     sdkpkgsuffix = (d.getVar('SDKPKGSUFFIX', True) or "nativesdk").replace("-", "_")
     if package_arch not in "all any noarch".split() and not package_arch.endswith(sdkpkgsuffix):
         ml_prefix = (d.getVar('MLPREFIX', True) or "").replace("-", "_")
         d.setVar('PACKAGE_ARCH_EXTEND', ml_prefix + package_arch)
     else:
         d.setVar('PACKAGE_ARCH_EXTEND', package_arch)
-    pkgwritedir = d.expand('${PKGWRITEDIRRPM}/${PACKAGE_ARCH_EXTEND}')
+    if package_vendor_repo:
+        pkgwritedir = d.expand('${PKGWRITEDIRRPM}/${PACKAGE_VENDOR_REPO}')
+    else:
+        pkgwritedir = d.expand('${PKGWRITEDIRRPM}/${PACKAGE_ARCH_EXTEND}')
     pkgarch = d.expand('${PACKAGE_ARCH_EXTEND}${HOST_VENDOR}-${HOST_OS}')
     magicfile = d.expand('${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc')
     bb.utils.mkdirhier(pkgwritedir)
-- 
1.7.12.4


