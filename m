Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QuHaT-0005qG-03
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 07:25:45 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Aug 2011 22:21:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,249,1312182000"; d="scan'208";a="40123000"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by azsmga001.ch.intel.com with ESMTP; 18 Aug 2011 22:21:04 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Aug 2011 13:21:57 +0800
Message-Id: <f83d2a0ef4b2e0931ce09d830388caf8aba58d84.1313731222.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1313731222.git.lianhao.lu@intel.com>
References: <cover.1313731222.git.lianhao.lu@intel.com>
Subject: [PATCH 1/1] adt-installer: Removed the hard coded repo url.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Aug 2011 05:25:45 -0000

[YOCTO #1380] Removed the hard coded repo url in opkg configuration
files.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 .../adt-installer/opkg/conf/opkg-sdk-i686.conf     |    2 +-
 .../adt-installer/opkg/conf/opkg-sdk-x86_64.conf   |    2 +-
 .../installer/adt-installer_1.0.bb                 |    5 ++++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/opkg/conf/opkg-sdk-i686.conf b/meta/recipes-devtools/installer/adt-installer/opkg/conf/opkg-sdk-i686.conf
index 9c93a72..71c62e8 100644
--- a/meta/recipes-devtools/installer/adt-installer/opkg/conf/opkg-sdk-i686.conf
+++ b/meta/recipes-devtools/installer/adt-installer/opkg/conf/opkg-sdk-i686.conf
@@ -2,4 +2,4 @@ arch all 1
 arch any 6
 arch noarch 11
 arch i686-nativesdk 16
-src yp-i686-nativesdk http://adtrepo.yoctoproject.org/1.0/adt-ipk/i686-nativesdk
+src yp-i686-nativesdk ADTREPO_URL/adt-ipk/i686-nativesdk
diff --git a/meta/recipes-devtools/installer/adt-installer/opkg/conf/opkg-sdk-x86_64.conf b/meta/recipes-devtools/installer/adt-installer/opkg/conf/opkg-sdk-x86_64.conf
index 3e70aac..f0d0634 100644
--- a/meta/recipes-devtools/installer/adt-installer/opkg/conf/opkg-sdk-x86_64.conf
+++ b/meta/recipes-devtools/installer/adt-installer/opkg/conf/opkg-sdk-x86_64.conf
@@ -2,4 +2,4 @@ arch all 1
 arch any 6
 arch noarch 11
 arch x86_64-nativesdk 16
-src yp-x86_64-nativesdk http://adtrepo.yoctoproject.org/1.0/adt-ipk/x86_64-nativesdk
+src yp-x86_64-nativesdk ADTREPO_URL/adt-ipk/x86_64-nativesdk
diff --git a/meta/recipes-devtools/installer/adt-installer_1.0.bb b/meta/recipes-devtools/installer/adt-installer_1.0.bb
index 0537440..74e1b9f 100644
--- a/meta/recipes-devtools/installer/adt-installer_1.0.bb
+++ b/meta/recipes-devtools/installer/adt-installer_1.0.bb
@@ -31,7 +31,7 @@ ALLOW_EMPTY = "1"
 PACKAGES = ""
 PACKAGE_ARCH = "all"
 
-PR = "r3"
+PR = "r4"
 
 ADT_DEPLOY = "${TMPDIR}/deploy/sdk/"
 ADT_DIR = "${WORKDIR}/adt-installer/"
@@ -54,6 +54,8 @@ SRC_URI = "svn://opkg.googlecode.com/svn;module=trunk;proto=http \
            file://opkg/conf/opkg-sdk-i686.conf \
 	  "
 
+ADTREPO = "http://adtrepo.yoctoproject.org/${SDK_VERSION}"
+
 do_deploy[umask] = 022
 
 fakeroot do_deploy () {
@@ -63,6 +65,7 @@ fakeroot do_deploy () {
 	rm -rf ${ADT_DIR}
 	mkdir -p ${ADT_DIR}/opkg/build
 	cp -r opkg ${ADT_DIR}/
+	sed -i -e 's#ADTREPO_URL#${ADTREPO}#' ${ADT_DIR}/opkg/conf/*.conf
 	cp -r trunk ${ADT_DIR}/opkg/build/
 	mv ${ADT_DIR}/opkg/build/trunk ${ADT_DIR}/opkg/build/opkg-svn
 	cp -r scripts ${ADT_DIR}/
-- 
1.7.0.4



