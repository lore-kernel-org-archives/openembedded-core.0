Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1SBEQa-0000au-HH
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 01:01:53 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 Mar 2012 16:51:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="144370027"
Received: from unknown (HELO cenodoxus.amr.corp.intel.com) ([10.255.15.233])
	by fmsmga002.fm.intel.com with ESMTP; 23 Mar 2012 16:51:49 -0700
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 16:51:44 -0700
Message-Id: <87a506b8715a07aaf33e3e8ee6c781ce5033d456.1332546190.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <f0393ed61291561b5823079b9528e8df24d56a3f.1332546190.git.elizabeth.flanagan@intel.com>
References: <f0393ed61291561b5823079b9528e8df24d56a3f.1332546190.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1332546190.git.elizabeth.flanagan@intel.com>
References: <cover.1332546190.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 5/8] license.bbclass: Style guide compliance
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
X-List-Received-Date: Sat, 24 Mar 2012 00:01:53 -0000

From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>

From my understanding, bash indents should be tabbed and python
4 spaces. Correcting some bash whitespace in license to comply
with the style guide.

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/classes/license.bbclass |  114 +++++++++++++++++++++---------------------
 1 files changed, 57 insertions(+), 57 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index eab630e..394a6d4 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -75,63 +75,63 @@ SPDXLICENSEMAP[AFLv1] = "AFL-1.2"
 SPDXLICENSEMAP[EPLv1.0] = "EPL-1.0"
 
 license_create_manifest() {
-    mkdir -p ${LICENSE_DIRECTORY}/${IMAGE_NAME}
-    # Get list of installed packages
-    list_installed_packages | grep -v "locale" |sort > ${LICENSE_DIRECTORY}/${IMAGE_NAME}/package.manifest
-    INSTALLED_PKGS=`cat ${LICENSE_DIRECTORY}/${IMAGE_NAME}/package.manifest`
-    # list of installed packages is broken for deb
-    for pkg in ${INSTALLED_PKGS}; do
-        # not the best way to do this but licenses are not arch dependant iirc
-        files=`find ${TMPDIR}/pkgdata/*/runtime -name ${pkg}| head -1`
-        for filename in $files; do
-            pkged_pn="$(sed -n 's/^PN: //p' ${filename})"
-            pkged_lic="$(sed -n '/^LICENSE: /{ s/^LICENSE: //; s/[+|&()*]/ /g; s/  */ /g; p }' ${filename})"
-            # check to see if the package name exists in the manifest. if so, bail.
-            if ! grep -q "PACKAGE NAME: ${pkg}" ${filename}; then
-                # exclude local recipes
-                if [ ! "${pkged_pn}" = "*locale*" ]; then
-                    echo "PACKAGE NAME:" ${pkg} >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
-                    echo "RECIPE NAME:" ${pkged_pn} >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
-                    echo "LICENSE: " >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
-                    for lic in ${pkged_lic}; do
-                        if [ -e "${LICENSE_DIRECTORY}/${pkged_pn}/generic_${lic}" ]; then
-                            echo ${lic}|sed s'/generic_//'g >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
-                        else
-                            echo "WARNING: The license listed, " ${lic} " was not in the licenses collected for " ${pkged_pn}>> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
-                        fi
-                    done
-                    echo "" >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
-                fi
-            fi
-        done
-    done
-
-    # Two options here:
-    # - Just copy the manifest
-    # - Copy the manifest and the license directories
-    # With both options set we see a .5 M increase in core-image-minimal
-    if [ -n "${COPY_LIC_MANIFEST}" ]; then
-        mkdir -p ${IMAGE_ROOTFS}/usr/share/common-licenses/
-        cp ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest ${IMAGE_ROOTFS}/usr/share/common-licenses/license.manifest
-        if [ -n "${COPY_LIC_DIRS}" ]; then
-            for pkg in ${INSTALLED_PKGS}; do
-                mkdir -p ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}
-                for lic in `ls ${LICENSE_DIRECTORY}/${pkg}`; do
-                    # Really don't need to copy the generics as they're 
-                    # represented in the manifest and in the actual pkg licenses
-                    # Doing so would make your image quite a bit larger
-                    if [[ "${lic}" != "generic_"* ]]; then
-                        cp ${LICENSE_DIRECTORY}/${pkg}/${lic} ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}/${lic}
-                    elif [[ "${lic}" == "generic_"* ]]; then
-                        if [ ! -f ${IMAGE_ROOTFS}/usr/share/common-licenses/${lic} ]; then
-                            cp ${LICENSE_DIRECTORY}/${pkg}/${lic} ${IMAGE_ROOTFS}/usr/share/common-licenses/
-                        fi
-                        ln -s ../${lic} ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}/${lic}
-                    fi
-                done
-            done
-        fi
-    fi
+	mkdir -p ${LICENSE_DIRECTORY}/${IMAGE_NAME}
+	# Get list of installed packages
+	list_installed_packages | grep -v "locale" |sort > ${LICENSE_DIRECTORY}/${IMAGE_NAME}/package.manifest
+	INSTALLED_PKGS=`cat ${LICENSE_DIRECTORY}/${IMAGE_NAME}/package.manifest`
+	# list of installed packages is broken for deb
+	for pkg in ${INSTALLED_PKGS}; do
+		# not the best way to do this but licenses are not arch dependant iirc
+		files=`find ${TMPDIR}/pkgdata/*/runtime -name ${pkg}| head -1`
+		for filename in $files; do
+			pkged_pn="$(sed -n 's/^PN: //p' ${filename})"
+			pkged_lic="$(sed -n '/^LICENSE: /{ s/^LICENSE: //; s/[+|&()*]/ /g; s/  */ /g; p }' ${filename})"
+			# check to see if the package name exists in the manifest. if so, bail.
+			if ! grep -q "PACKAGE NAME: ${pkg}" ${filename}; then
+				# exclude local recipes
+				if [ ! "${pkged_pn}" = "*locale*" ]; then
+					echo "PACKAGE NAME:" ${pkg} >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
+					echo "RECIPE NAME:" ${pkged_pn} >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
+					echo "LICENSE: " >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
+					for lic in ${pkged_lic}; do
+						if [ -e "${LICENSE_DIRECTORY}/${pkged_pn}/generic_${lic}" ]; then
+							echo ${lic}|sed s'/generic_//'g >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
+						else
+							echo "WARNING: The license listed, " ${lic} " was not in the licenses collected for " ${pkged_pn}>> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
+						fi
+					done
+					echo "" >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
+				fi
+			fi
+		done
+	done
+
+	# Two options here:
+	# - Just copy the manifest
+	# - Copy the manifest and the license directories
+	# With both options set we see a .5 M increase in core-image-minimal
+	if [ -n "${COPY_LIC_MANIFEST}" ]; then
+		mkdir -p ${IMAGE_ROOTFS}/usr/share/common-licenses/
+		cp ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest ${IMAGE_ROOTFS}/usr/share/common-licenses/license.manifest
+		if [ -n "${COPY_LIC_DIRS}" ]; then
+			for pkg in ${INSTALLED_PKGS}; do
+				mkdir -p ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}
+				for lic in `ls ${LICENSE_DIRECTORY}/${pkg}`; do
+					# Really don't need to copy the generics as they're 
+					# represented in the manifest and in the actual pkg licenses
+					# Doing so would make your image quite a bit larger
+					if [[ "${lic}" != "generic_"* ]]; then
+						cp ${LICENSE_DIRECTORY}/${pkg}/${lic} ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}/${lic}
+					elif [[ "${lic}" == "generic_"* ]]; then
+						if [ ! -f ${IMAGE_ROOTFS}/usr/share/common-licenses/${lic} ]; then
+							cp ${LICENSE_DIRECTORY}/${pkg}/${lic} ${IMAGE_ROOTFS}/usr/share/common-licenses/
+						fi
+						ln -s ../${lic} ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}/${lic}
+					fi
+				done
+			done
+		fi
+	fi
 
 }
 
-- 
1.7.1



