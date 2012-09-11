Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Vladimir_Zapolskiy@mentor.com>) id 1TBFNl-0008Ly-GA
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 03:35:17 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1TBF2P-0007cB-Tg from Vladimir_Zapolskiy@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 18:13:13 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 10 Sep 2012 18:13:13 -0700
Received: from eyas.fin.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.1.289.1; Tue, 11 Sep 2012 02:13:11 +0100
From: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Sep 2012 04:13:43 +0300
Message-ID: <1347326028-32469-2-git-send-email-vladimir_zapolskiy@mentor.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1347326028-32469-1-git-send-email-vladimir_zapolskiy@mentor.com>
References: <1347326028-32469-1-git-send-email-vladimir_zapolskiy@mentor.com>
MIME-Version: 1.0
X-Originating-IP: [137.202.0.76]
X-OriginalArrivalTime: 11 Sep 2012 01:13:13.0784 (UTC)
	FILETIME=[9DCE3B80:01CD8FBA]
Subject: [PATCH 1/6] classes/license: define LICENSE_MANIFEST variable
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
X-List-Received-Date: Tue, 11 Sep 2012 01:35:17 -0000
Content-Type: text/plain

Cosmetic change, saves space and reduces code line length.

Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
---
 meta/classes/license.bbclass |   21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 432e580..0335f41 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -80,9 +80,10 @@ license_create_manifest() {
 	# Get list of installed packages
 	list_installed_packages | grep -v "locale" |sort > ${LICENSE_DIRECTORY}/${IMAGE_NAME}/package.manifest
 	INSTALLED_PKGS=`cat ${LICENSE_DIRECTORY}/${IMAGE_NAME}/package.manifest`
+	LICENSE_MANIFEST="${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest"
 	# remove existing license.manifest file
-	if [ -f ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest ]; then
-		rm ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
+	if [ -f ${LICENSE_MANIFEST} ]; then
+		rm ${LICENSE_MANIFEST}
 	fi
 	# list of installed packages is broken for deb
 	for pkg in ${INSTALLED_PKGS}; do
@@ -95,18 +96,18 @@ license_create_manifest() {
 		if ! grep -q "PACKAGE NAME: ${pkg}" ${filename}; then
 			# exclude local recipes
 			if [ ! "${pkged_pn}" = "*locale*" ]; then
-				echo "PACKAGE NAME:" ${pkg} >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
-				echo "PACKAGE VERSION:" ${pkged_pv} >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
-				echo "RECIPE NAME:" ${pkged_pn} >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
-				echo "LICENSE: " >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
+				echo "PACKAGE NAME:" ${pkg} >> ${LICENSE_MANIFEST}
+				echo "PACKAGE VERSION:" ${pkged_pv} >> ${LICENSE_MANIFEST}
+				echo "RECIPE NAME:" ${pkged_pn} >> ${LICENSE_MANIFEST}
+				echo "LICENSE: " >> ${LICENSE_MANIFEST}
 				for lic in ${pkged_lic}; do
 					if [ -e "${LICENSE_DIRECTORY}/${pkged_pn}/generic_${lic}" ]; then
-						echo ${lic}|sed s'/generic_//'g >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
+						echo ${lic}|sed s'/generic_//'g >> ${LICENSE_MANIFEST}
 					else
-						echo "WARNING: The license listed, " ${lic} " was not in the licenses collected for " ${pkged_pn}>> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
+						echo "WARNING: The license listed, " ${lic} " was not in the licenses collected for " ${pkged_pn} >> ${LICENSE_MANIFEST}
 					fi
 				done
-				echo "" >> ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest
+				echo "" >> ${LICENSE_MANIFEST}
 			fi
 		fi
 	done
@@ -117,7 +118,7 @@ license_create_manifest() {
 	# With both options set we see a .5 M increase in core-image-minimal
 	if [ -n "${COPY_LIC_MANIFEST}" ]; then
 		mkdir -p ${IMAGE_ROOTFS}/usr/share/common-licenses/
-		cp ${LICENSE_DIRECTORY}/${IMAGE_NAME}/license.manifest ${IMAGE_ROOTFS}/usr/share/common-licenses/license.manifest
+		cp ${LICENSE_MANIFEST} ${IMAGE_ROOTFS}/usr/share/common-licenses/license.manifest
 		if [ -n "${COPY_LIC_DIRS}" ]; then
 			for pkg in ${INSTALLED_PKGS}; do
 				mkdir -p ${IMAGE_ROOTFS}/usr/share/common-licenses/${pkg}
-- 
1.7.10



