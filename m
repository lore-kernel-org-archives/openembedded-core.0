Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1Tghug-0001qG-RU
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 21:19:20 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Dec 2012 12:03:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,232,1355126400"; d="scan'208";a="229989514"
Received: from envy.jf.intel.com ([10.7.201.159])
	by orsmga001.jf.intel.com with ESMTP; 06 Dec 2012 12:03:47 -0800
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy.jf.intel.com (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	qB6K1Cg9027065; Thu, 6 Dec 2012 12:01:12 -0800
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id qB6K1C5Z027064;
	Thu, 6 Dec 2012 12:01:12 -0800
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Dec 2012 12:01:10 -0800
Message-Id: <222992b7bb2ed66071fed3b27ddab9f94c006e79.1354823958.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1354823958.git.elizabeth.flanagan@intel.com>
References: <cover.1354823958.git.elizabeth.flanagan@intel.com>
Subject: [PATCH v2 1/1] license.bbclass: Including locale packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Dec 2012 20:19:20 -0000

As locale packages are installed on the image, we should
be including them in the package/license manifest.

This ensures that the manifests are accurate and complete.

[ YOCTO #2461 ]

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/license.bbclass |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 66cde1c..e187895 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -13,7 +13,7 @@ do_populate_lic[cleandirs] = "${LICSSTATEDIR}"
 license_create_manifest() {
 	mkdir -p ${LICENSE_DIRECTORY}/${IMAGE_NAME}
 	# Get list of installed packages
-	list_installed_packages | grep -v "locale" | sort > ${LICENSE_DIRECTORY}/${IMAGE_NAME}/package.manifest
+	list_installed_packages |sort > ${LICENSE_DIRECTORY}/${IMAGE_NAME}/package.manifest
 	INSTALLED_PKGS=`cat ${LICENSE_DIRECTORY}/${IMAGE_NAME}/package.manifest`
 	LICENSE_MANIFEST="${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest"
 	# remove existing license.manifest file
@@ -27,11 +27,6 @@ license_create_manifest() {
 		filename=`ls ${TMPDIR}/pkgdata/*/runtime-reverse/${pkg}| head -1`
 		pkged_pn="$(sed -n 's/^PN: //p' ${filename})"
 
-		# exclude locale recipes
-		if [ "${pkged_pn}" = "*locale*" ]; then
-			continue
-		fi
-
 		# check to see if the package name exists in the manifest. if so, bail.
 		if grep -q "^PACKAGE NAME: ${pkg}" ${LICENSE_MANIFEST}; then
 			continue
-- 
1.7.5.4



