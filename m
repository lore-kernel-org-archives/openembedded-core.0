Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1RZAY6-0007zv-Oc
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Dec 2011 01:12:18 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 09 Dec 2011 16:05:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="94558747"
Received: from unknown (HELO cenodoxus.amr.corp.intel.com) ([10.255.12.199])
	by fmsmga001.fm.intel.com with ESMTP; 09 Dec 2011 16:05:26 -0800
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Dec 2011 16:05:23 -0800
Message-Id: <20529d73fb789c458d36692761c7da2cfea6c813.1323475141.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <e335966f9acb0586d498f9c390bd797de2987db5.1323475141.git.elizabeth.flanagan@intel.com>
References: <e335966f9acb0586d498f9c390bd797de2987db5.1323475141.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1323475141.git.elizabeth.flanagan@intel.com>
References: <cover.1323475141.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 2/3] license.bbclass: remove deb exlusion
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
X-List-Received-Date: Sat, 10 Dec 2011 00:12:18 -0000

From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>

This commit requires 4a13766c7b223d as it removes the exclusion
of deb package types from license manifest creation.

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/license.bbclass |   49 +++++++++++++++++++----------------------
 1 files changed, 23 insertions(+), 26 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index e520a4c..96fdb46 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -77,34 +77,31 @@ license_create_manifest() {
     list_installed_packages | grep -v "locale" |sort > ${LICENSE_DIRECTORY}/${IMAGE_NAME}/package.manifest
     INSTALLED_PKGS=`cat ${LICENSE_DIRECTORY}/${IMAGE_NAME}/package.manifest`
     # list of installed packages is broken for deb
-    if [ ${IMAGE_PKGTYPE} != "deb" ]; then
-
-        for pkg in ${INSTALLED_PKGS}; do
-            # not the best way to do this but licenses are not arch dependant iirc
-            files=`find ${TMPDIR}/pkgdata/*/runtime -name ${pkg}| head -1`
-            for filename in $files; do
-                pkged_pn="$(sed -n 's/^PN: //p' ${filename})"
-                pkged_lic="$(sed -n '/^LICENSE: /{ s/^LICENSE: //; s/[+|&()*]/ /g; s/  */ /g; p }' ${filename})"
-                # check to see if the package name exists in the manifest. if so, bail.
-                if ! grep -q "PACKAGE NAME: ${pkg}" ${filename}; then
-                    # exclude local recipes
-                    if [ ! "${pkged_pn}" = "*locale*" ]; then
-                        echo "PACKAGE NAME:" ${pkg} >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
-                        echo "RECIPE NAME:" ${pkged_pn} >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
-                        echo "LICENSE: " >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
-                        for lic in ${pkged_lic}; do
-                            if [ -e "${LICENSE_DIRECTORY}/${pkged_pn}/generic_${lic}" ]; then
-                                echo ${lic}|sed s'/generic_//'g >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
-                            else
-                                echo "WARNING: The license listed, " ${lic} " was not in the licenses collected for " ${pkged_pn}>> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
-                            fi
-                        done
-                        echo "" >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
-                    fi
+    for pkg in ${INSTALLED_PKGS}; do
+        # not the best way to do this but licenses are not arch dependant iirc
+        files=`find ${TMPDIR}/pkgdata/*/runtime -name ${pkg}| head -1`
+        for filename in $files; do
+            pkged_pn="$(sed -n 's/^PN: //p' ${filename})"
+            pkged_lic="$(sed -n '/^LICENSE: /{ s/^LICENSE: //; s/[+|&()*]/ /g; s/  */ /g; p }' ${filename})"
+            # check to see if the package name exists in the manifest. if so, bail.
+            if ! grep -q "PACKAGE NAME: ${pkg}" ${filename}; then
+                # exclude local recipes
+                if [ ! "${pkged_pn}" = "*locale*" ]; then
+                    echo "PACKAGE NAME:" ${pkg} >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
+                    echo "RECIPE NAME:" ${pkged_pn} >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
+                    echo "LICENSE: " >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
+                    for lic in ${pkged_lic}; do
+                        if [ -e "${LICENSE_DIRECTORY}/${pkged_pn}/generic_${lic}" ]; then
+                            echo ${lic}|sed s'/generic_//'g >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
+                        else
+                            echo "WARNING: The license listed, " ${lic} " was not in the licenses collected for " ${pkged_pn}>> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
+                        fi
+                    done
+                    echo "" >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
                 fi
-            done
+            fi
         done
-    fi
+    done
 
     # Two options here:
     # - Just copy the manifest
-- 
1.7.1



