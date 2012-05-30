Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eflanagan@envy.jf.intel.com>) id 1SZsG6-0005M1-8C
	for openembedded-core@lists.openembedded.org;
	Thu, 31 May 2012 01:24:54 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 30 May 2012 16:13:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="150535325"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga002.jf.intel.com with ESMTP; 30 May 2012 16:13:34 -0700
Received: from envy.jf.intel.com (localhost [127.0.0.1])
	by envy.jf.intel.com (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	q4UNLDcc014746 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 16:21:13 -0700
Received: (from eflanagan@localhost)
	by envy.jf.intel.com (8.14.4/8.14.4/Submit) id q4UNLDpu014745
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 16:21:13 -0700
From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 May 2012 16:21:12 -0700
Message-Id: <d4873d2c5a3c1b82e77bd7c64334372903a265e1.1338419594.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1338419593.git.elizabeth.flanagan@intel.com>
References: <cover.1338419593.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 1/1] license.bbclass: optimize pkg runtime data
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
X-List-Received-Date: Wed, 30 May 2012 23:24:54 -0000

This fixes an ugly way I was trying to find pkg runtime
data for package and license manifest creation.

rootfs generation times for core-image-minimal:

Prior to patch
real	0m41.570s
user	1m40.466s
sys	0m6.768s

With patch
real	0m27.527s
user	0m9.833s
sys	0m3.496s

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/license.bbclass |   40 +++++++++++++++++++---------------------
 1 files changed, 19 insertions(+), 21 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 6c4a673..d93ddf9 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -86,28 +86,26 @@ license_create_manifest() {
 	# list of installed packages is broken for deb
 	for pkg in ${INSTALLED_PKGS}; do
 		# not the best way to do this but licenses are not arch dependant iirc
-		files=`find ${TMPDIR}/pkgdata/*/runtime -name ${pkg}| head -1`
-		for filename in $files; do
-			pkged_pn="$(sed -n 's/^PN: //p' ${filename})"
-			pkged_lic="$(sed -n '/^LICENSE: /{ s/^LICENSE: //; s/[+|&()*]/ /g; s/  */ /g; p }' ${filename})"
-			# check to see if the package name exists in the manifest. if so, bail.
-			if ! grep -q "PACKAGE NAME: ${pkg}" ${filename}; then
-				# exclude local recipes
-				if [ ! "${pkged_pn}" = "*locale*" ]; then
-					echo "PACKAGE NAME:" ${pkg} >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
-					echo "RECIPE NAME:" ${pkged_pn} >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
-					echo "LICENSE: " >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
-					for lic in ${pkged_lic}; do
-						if [ -e "${LICENSE_DIRECTORY}/${pkged_pn}/generic_${lic}" ]; then
-							echo ${lic}|sed s'/generic_//'g >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
-						else
-							echo "WARNING: The license listed, " ${lic} " was not in the licenses collected for " ${pkged_pn}>> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
-						fi
-					done
-					echo "" >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
-				fi
+		filename=`ls ${TMPDIR}/pkgdata/*/runtime/${pkg}| head -1`
+		pkged_pn="$(sed -n 's/^PN: //p' ${filename})"
+		pkged_lic="$(sed -n '/^LICENSE: /{ s/^LICENSE: //; s/[+|&()*]/ /g; s/  */ /g; p }' ${filename})"
+		# check to see if the package name exists in the manifest. if so, bail.
+		if ! grep -q "PACKAGE NAME: ${pkg}" ${filename}; then
+			# exclude local recipes
+			if [ ! "${pkged_pn}" = "*locale*" ]; then
+				echo "PACKAGE NAME:" ${pkg} >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
+				echo "RECIPE NAME:" ${pkged_pn} >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
+				echo "LICENSE: " >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
+				for lic in ${pkged_lic}; do
+					if [ -e "${LICENSE_DIRECTORY}/${pkged_pn}/generic_${lic}" ]; then
+						echo ${lic}|sed s'/generic_//'g >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
+					else
+						echo "WARNING: The license listed, " ${lic} " was not in the licenses collected for " ${pkged_pn}>> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
+					fi
+				done
+				echo "" >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
 			fi
-		done
+		fi
 	done
 
 	# Two options here:
-- 
1.7.5.4



