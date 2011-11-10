Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROPOP-0005ag-S6
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 08:49:57 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2011 23:43:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,488,1315206000"; d="scan'208";a="83351247"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2011 23:43:23 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 23:43:12 -0800
Message-Id: <8cae1ba412c73e71f31fd5ee3bc8d605b7e400ba.1320910946.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL (v2) 30/33] classes: Remove various bashisms
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
X-List-Received-Date: Thu, 10 Nov 2011 07:50:02 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image-prelink.bbclass |    2 +-
 meta/classes/kernel.bbclass        |    2 +-
 meta/classes/package_rpm.bbclass   |   18 +++++++++---------
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/classes/image-prelink.bbclass b/meta/classes/image-prelink.bbclass
index 350c29d..53ef47e 100644
--- a/meta/classes/image-prelink.bbclass
+++ b/meta/classes/image-prelink.bbclass
@@ -24,7 +24,7 @@ prelink_image () {
 	${STAGING_DIR_NATIVE}${sbindir_native}/prelink --root ${IMAGE_ROOTFS} -amR -N -c ${sysconfdir}/prelink.conf
 
 	# Remove the prelink.conf if we had to add it.
-	if [ "$dummy_prelink_conf" == "true" ]; then
+	if [ "$dummy_prelink_conf" = "true" ]; then
 		rm -f ${IMAGE_ROOTFS}${sysconfdir}/prelink.conf
 	fi
 
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 42543e0..dc711f2 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -152,7 +152,7 @@ kernel_do_install() {
 	#
 	cp -fR * $kerneldir
 	cp .config $kerneldir
-	if [ ! "${S}" == "${B}" ]; then
+	if [ "${S}" != "${B}" ]; then
 		cp -fR ${S}/* $kerneldir
 	fi
 	install -m 0644 ${KERNEL_OUTPUT} $kerneldir/${KERNEL_IMAGETYPE}
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index c01863e..f122c70 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -87,22 +87,22 @@ package_generate_rpm_conf_common() {
 	shift
 
 	printf "_solve_dbpath " > ${rpmconf_base}.macro
-	o_colon=false
+	o_colon="false"
 
 	for archvar in "$@"; do
 		printf "_solve_dbpath " > ${rpmconf_base}-${archvar}.macro
-		colon=false
+		colon="false"
 		for each in `cat ${rpmconf_base}-${archvar}.conf` ; do
-			if [ "$o_colon" == true ]; then
+			if [ "$o_colon" = "true" ]; then
 				printf ":" >> ${rpmconf_base}.macro
 			fi
-			if [ "$colon" == true ]; then
+			if [ "$colon" = "true" ]; then
 				printf ":" >> ${rpmconf_base}-${archvar}.macro
 			fi
 			printf "%s" $each >> ${rpmconf_base}.macro
-			o_colon=true
+			o_colon="true"
 			printf "%s" $each >> ${rpmconf_base}-${archvar}.macro
-			colon=true
+			colon="true"
 		done
 		printf "\n" >> ${rpmconf_base}-${archvar}.macro
 	done
@@ -214,7 +214,7 @@ package_install_internal_rpm () {
 				ml_prefix=`echo ${pkg} | cut -d'-' -f1`
 				ml_pkg=$pkg
 				for i in ${MULTILIB_PREFIX_LIST} ; do
-					if [ ${ml_prefix} == ${i} ]; then
+					if [ ${ml_prefix} = ${i} ]; then
 						ml_pkg=$(echo ${pkg} | sed "s,^${ml_prefix}-\(.*\),\1,")
 						archvar=ml_archs
 						manifest=install_multilib.manifest
@@ -240,7 +240,7 @@ package_install_internal_rpm () {
 			ml_prefix=`echo ${pkg} | cut -d'-' -f1`
 			ml_pkg=$pkg
 			for i in ${MULTILIB_PREFIX_LIST} ; do
-				if [ ${ml_prefix} == ${i} ]; then
+				if [ ${ml_prefix} = ${i} ]; then
 					ml_pkg=$(echo ${pkg} | sed "s,^${ml_prefix}-\(.*\),\1,")
 					archvar=ml_archs
 					manifest=install_multilib.manifest
@@ -276,7 +276,7 @@ package_install_internal_rpm () {
 			ml_prefix=`echo ${pkg} | cut -d'-' -f1`
 			ml_pkg=$pkg
 			for i in ${MULTILIB_PREFIX_LIST} ; do
-				if [ ${ml_prefix} == ${i} ]; then
+				if [ ${ml_prefix} = ${i} ]; then
 					ml_pkg=$(echo ${pkg} | sed "s,^${ml_prefix}-\(.*\),\1,")
 					archvar=ml_archs
 					break
-- 
1.7.6.4



