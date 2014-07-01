Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A49AD65D33
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Jul 2014 20:01:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s61K1JZ7009712
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 Jul 2014 13:01:19 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 1 Jul 2014 13:01:18 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Jul 2014 15:01:12 -0500
Message-ID: <7ed0fc66eefb52419e04e2ddf017efbb419b2330.1404244287.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1404244287.git.mark.hatle@windriver.com>
References: <cover.1404244287.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] package_rpm.bbclass: Should be using HOST_* not TARGET_*
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
X-List-Received-Date: Tue, 01 Jul 2014 20:01:22 -0000
Content-Type: text/plain

When building target packages, HOST_OS and TARGET_OS are the same, as is the
VENDOR field.  However, when building an SDK this is not true.  The patch
corrects the oversight and switches to using the 'HOST' version and resolves
the issue of meta-mingw not working w/ the rpm packaging.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 71cfdc1..0a32b3e 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -652,7 +652,7 @@ python do_package_rpm () {
     # Setup the rpmbuild arguments...
     rpmbuild = d.getVar('RPMBUILD', True)
     targetsys = d.getVar('TARGET_SYS', True)
-    targetvendor = d.getVar('TARGET_VENDOR', True)
+    targetvendor = d.getVar('HOST_VENDOR', True)
     package_arch = (d.getVar('PACKAGE_ARCH', True) or "").replace("-", "_")
     sdkpkgsuffix = (d.getVar('SDKPKGSUFFIX', True) or "nativesdk").replace("-", "_")
     if package_arch not in "all any noarch".split() and not package_arch.endswith(sdkpkgsuffix):
@@ -661,7 +661,7 @@ python do_package_rpm () {
     else:
         d.setVar('PACKAGE_ARCH_EXTEND', package_arch)
     pkgwritedir = d.expand('${PKGWRITEDIRRPM}/${PACKAGE_ARCH_EXTEND}')
-    pkgarch = d.expand('${PACKAGE_ARCH_EXTEND}${TARGET_VENDOR}-${TARGET_OS}')
+    pkgarch = d.expand('${PACKAGE_ARCH_EXTEND}${HOST_VENDOR}-${HOST_OS}')
     magicfile = d.expand('${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc')
     bb.utils.mkdirhier(pkgwritedir)
     os.chmod(pkgwritedir, 0755)
-- 
1.9.3


