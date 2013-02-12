Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1U5Ij3-0000zN-NS
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 17:29:36 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Feb 2013 08:11:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,650,1355126400"; d="scan'208";a="284742032"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 12 Feb 2013 08:12:52 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Feb 2013 18:12:38 +0200
Message-Id: <6644f9bd4918d4c0e098b62194895468cd49f597.1360684306.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1360684306.git.laurentiu.palcu@intel.com>
References: <cover.1360684306.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1360684306.git.laurentiu.palcu@intel.com>
References: <cover.1360684306.git.laurentiu.palcu@intel.com>
Subject: [PATCH 03/11] rootfs_(ipk|deb|rpm).bbclass: check package installation status after ROOTFS_POSTPROCESS_COMMAND
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
X-List-Received-Date: Tue, 12 Feb 2013 16:29:54 -0000

Since the intercept fall-back procedure will change the package
installation status, do the checking after ROOTFS_POSTPROCESS_COMMAND
ends.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/rootfs_deb.bbclass |   14 +++++++-------
 meta/classes/rootfs_ipk.bbclass |   13 ++++++-------
 meta/classes/rootfs_rpm.bbclass |   20 ++++++++++----------
 3 files changed, 23 insertions(+), 24 deletions(-)

diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index 9997996..92a6579 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -70,13 +70,6 @@ fakeroot rootfs_deb_do_rootfs () {
 
 	set -e
 
-	if ${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "true", "false" ,d)}; then
-		if grep Status:.install.ok.unpacked ${IMAGE_ROOTFS}/var/lib/dpkg/status; then
-			bberror "Some packages could not be configured offline and rootfs is read-only."
-			exit 1
-		fi
-	fi
-
 	install -d ${IMAGE_ROOTFS}/${sysconfdir}
 	echo ${BUILDNAME} > ${IMAGE_ROOTFS}/${sysconfdir}/version
 
@@ -91,6 +84,13 @@ fakeroot rootfs_deb_do_rootfs () {
 
 	${ROOTFS_POSTPROCESS_COMMAND}
 
+	if ${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "true", "false" ,d)}; then
+		if grep Status:.install.ok.unpacked ${IMAGE_ROOTFS}/var/lib/dpkg/status; then
+			bberror "Some packages could not be configured offline and rootfs is read-only."
+			exit 1
+		fi
+	fi
+
 	log_check rootfs
 }
 
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index fadec4d..135bb60 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -80,7 +80,12 @@ fakeroot rootfs_ipk_do_rootfs () {
 
 	${OPKG_POSTPROCESS_COMMANDS}
 	${ROOTFS_POSTINSTALL_COMMAND}
-	
+
+	install -d ${IMAGE_ROOTFS}/${sysconfdir}
+	echo ${BUILDNAME} > ${IMAGE_ROOTFS}/${sysconfdir}/version
+
+	${ROOTFS_POSTPROCESS_COMMAND}
+
 	if ${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "true", "false" ,d)}; then
 		if grep Status:.install.ok.unpacked ${STATUS}; then
 			bberror "Some packages could not be configured offline and rootfs is read-only."
@@ -88,11 +93,6 @@ fakeroot rootfs_ipk_do_rootfs () {
 		fi
 	fi
 
-	install -d ${IMAGE_ROOTFS}/${sysconfdir}
-	echo ${BUILDNAME} > ${IMAGE_ROOTFS}/${sysconfdir}/version
-
-	${ROOTFS_POSTPROCESS_COMMAND}
-	
 	rm -f ${IMAGE_ROOTFS}${OPKGLIBDIR}/opkg/lists/*
 	if ${@base_contains("IMAGE_FEATURES", "package-management", "false", "true", d)}; then
 		if ! grep Status:.install.ok.unpacked ${STATUS}; then
@@ -114,7 +114,6 @@ fakeroot rootfs_ipk_do_rootfs () {
 			remove_packaging_data_files
 		fi
 	fi
-	set +x
 	log_check rootfs
 }
 
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 119bf92..5651243 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -87,15 +87,6 @@ fakeroot rootfs_rpm_do_rootfs () {
 
 	${ROOTFS_POSTINSTALL_COMMAND}
 
-	if ${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "true", "false" ,d)}; then
-		if [ -d ${IMAGE_ROOTFS}/etc/rpm-postinsts ] ; then
-			if [ "`ls -A ${IMAGE_ROOTFS}/etc/rpm-postinsts`" != "" ] ; then
-				bberror "Some packages could not be configured offline and rootfs is read-only."
-				exit 1
-			fi
-		fi
-	fi
-
 	# Report delayed package scriptlets
 	for i in ${IMAGE_ROOTFS}/etc/rpm-postinsts/*; do
 		if [ -f $i ]; then
@@ -126,7 +117,16 @@ EOF
 
 	${RPM_POSTPROCESS_COMMANDS}
 	${ROOTFS_POSTPROCESS_COMMAND}
-	
+
+	if ${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "true", "false" ,d)}; then
+		if [ -d ${IMAGE_ROOTFS}/etc/rpm-postinsts ] ; then
+			if [ "`ls -A ${IMAGE_ROOTFS}/etc/rpm-postinsts`" != "" ] ; then
+				bberror "Some packages could not be configured offline and rootfs is read-only."
+				exit 1
+			fi
+		fi
+	fi
+
 	rm -rf ${IMAGE_ROOTFS}/var/cache2/
 	rm -rf ${IMAGE_ROOTFS}/var/run2/
 	rm -rf ${IMAGE_ROOTFS}/var/log2/
-- 
1.7.9.5



