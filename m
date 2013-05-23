Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 47EC56A451
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 13:15:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2013 06:15:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,728,1363158000"; d="scan'208";a="342006803"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2013 06:15:31 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2013 16:15:20 +0300
Message-Id: <f12bd1a1da9972585901e34540533380daea7a1b.1369313581.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1369313581.git.laurentiu.palcu@intel.com>
References: <cover.1369313581.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1369313581.git.laurentiu.palcu@intel.com>
References: <cover.1369313581.git.laurentiu.palcu@intel.com>
Subject: [PATCH 2/7] rootfs_*.bbclass: add some helper functions
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
X-List-Received-Date: Thu, 23 May 2013 13:15:31 -0000

This patch adds the following helper functions:
 * delayed_postinsts - outputs the list of delayed postinstalls;
 * save_postinsts - this will save the delayed postinstalls for ipk/deb
   in /etc/(ipk|deb)_postinsts;
 * rootfs_remove_packages - removes packages from an image;

Additionaly, this patch will remove a piece of code in
rootfs_ipk_do_rootfs which will be moved to image.bbclass and used for
all backends;

[YOCTO #4484]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/rootfs_deb.bbclass |   23 +++++++++++++++++++++--
 meta/classes/rootfs_ipk.bbclass |   39 ++++++++++++++++++---------------------
 meta/classes/rootfs_rpm.bbclass |   23 +++++++++++++++++++++--
 3 files changed, 60 insertions(+), 25 deletions(-)

diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index e642cf3..edd1037 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -85,7 +85,7 @@ fakeroot rootfs_deb_do_rootfs () {
 	${ROOTFS_POSTPROCESS_COMMAND}
 
 	if ${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "true", "false" ,d)}; then
-		if grep Status:.install.ok.unpacked ${IMAGE_ROOTFS}/var/lib/dpkg/status; then
+		if [ -n "$(delayed_postinsts)" ]; then
 			bberror "Some packages could not be configured offline and rootfs is read-only."
 			exit 1
 		fi
@@ -94,9 +94,22 @@ fakeroot rootfs_deb_do_rootfs () {
 	log_check rootfs
 }
 
+rootfs_deb_do_rootfs[vardeps] += "delayed_postinsts"
+
+delayed_postinsts () {
+	cat ${IMAGE_ROOTFS}/var/lib/dpkg/status|grep -e "^Package:" -e "^Status:"|sed -ne 'N;s/Package: \(.*\)\nStatus:.*unpacked/\1/p'
+}
+
+save_postinsts () {
+	for p in $(delayed_postinsts); do
+		install -d ${IMAGE_ROOTFS}${sysconfdir}/deb-postinsts
+		cp ${IMAGE_ROOTFS}/var/lib/dpkg/info/$p.postinst ${IMAGE_ROOTFS}${sysconfdir}/deb-postinsts/$p
+	done
+}
+
 remove_packaging_data_files() {
 	rm -rf ${IMAGE_ROOTFS}${opkglibdir}
-	rm -rf ${IMAGE_ROOTFS}/usr/dpkg/
+	rm -rf ${IMAGE_ROOTFS}/var/lib/dpkg/
 }
 
 rootfs_install_packages() {
@@ -105,3 +118,9 @@ rootfs_install_packages() {
 	# Mark all packages installed
 	sed -i -e "s/Status: install ok unpacked/Status: install ok installed/;" $INSTALL_ROOTFS_DEB/var/lib/dpkg/status
 }
+
+rootfs_remove_packages() {
+	# for some reason, --root doesn't really work here... We use --admindir&--instdir instead.
+	${STAGING_BINDIR_NATIVE}/dpkg --admindir=${IMAGE_ROOTFS}/var/lib/dpkg --instdir=${IMAGE_ROOTFS} -r --force-depends $@
+}
+
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 3e1f959..1403422 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -91,36 +91,29 @@ fakeroot rootfs_ipk_do_rootfs () {
 	${ROOTFS_POSTPROCESS_COMMAND}
 
 	if ${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "true", "false" ,d)}; then
-		if grep Status:.install.ok.unpacked ${STATUS}; then
+		if [ -n "$(delayed_postinsts)" ]; then
 			bberror "Some packages could not be configured offline and rootfs is read-only."
 			exit 1
 		fi
 	fi
 
 	rm -f ${IMAGE_ROOTFS}${OPKGLIBDIR}/opkg/lists/*
-	if ${@base_contains("IMAGE_FEATURES", "package-management", "false", "true", d)}; then
-		if ! grep Status:.install.ok.unpacked ${STATUS}; then
-			# All packages were successfully configured.
-			# update-rc.d, base-passwd, run-postinsts are no further use, remove them now
-			remove_run_postinsts=false
-			if [ -e ${IMAGE_ROOTFS}${sysconfdir}/init.d/run-postinsts ]; then
-				remove_run_postinsts=true
-			fi
-			opkg-cl ${OPKG_ARGS} --force-depends remove update-rc.d base-passwd ${ROOTFS_BOOTSTRAP_INSTALL} || true
-
-			# Need to remove rc.d files for run-postinsts by hand since opkg won't
-			# call postrm scripts in offline root mode.
-			if $remove_run_postinsts; then
-				update-rc.d -f -r ${IMAGE_ROOTFS} run-postinsts remove
-			fi
-
-			# Also delete the status files
-			remove_packaging_data_files
-		fi
-	fi
 	log_check rootfs
 }
 
+rootfs_ipk_do_rootfs[vardeps] += "delayed_postinsts"
+
+delayed_postinsts () {
+	cat ${STATUS}|grep -e "^Package:" -e "^Status:"|sed -ne 'N;s/Package: \(.*\)\nStatus:.*unpacked/\1/p'
+}
+
+save_postinsts () {
+	for p in $(delayed_postinsts); do
+		install -d ${IMAGE_ROOTFS}${sysconfdir}/ipk-postinsts
+		cp ${IMAGE_ROOTFS}${OPKGLIBDIR}/opkg/info/$p.postinst ${IMAGE_ROOTFS}${sysconfdir}/ipk-postinsts/$p
+	done
+}
+
 rootfs_ipk_write_manifest() {
 	manifest=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.manifest
 	cp ${IMAGE_ROOTFS}${OPKGLIBDIR}/opkg/status $manifest
@@ -145,6 +138,10 @@ rootfs_install_packages() {
 	opkg-cl ${OPKG_ARGS} install `cat $1`
 }
 
+rootfs_remove_packages() {
+	opkg-cl ${OPKG_ARGS} --force-depends remove $@
+}
+
 ipk_insert_feed_uris () {
 
 	echo "Building from feeds activated!"
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index d373dab..d1d6eff 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -114,8 +114,8 @@ fakeroot rootfs_rpm_do_rootfs () {
 	${ROOTFS_POSTPROCESS_COMMAND}
 
 	if ${@base_contains("IMAGE_FEATURES", "read-only-rootfs", "true", "false" ,d)}; then
-		if [ -d ${IMAGE_ROOTFS}/etc/rpm-postinsts ] ; then
-			if [ "`ls -A ${IMAGE_ROOTFS}/etc/rpm-postinsts`" != "" ] ; then
+		if [ -d ${IMAGE_ROOTFS}${sysconfdir}/rpm-postinsts ] ; then
+			if [ "`ls -A ${IMAGE_ROOTFS}${sysconfdir}/rpm-postinsts`" != "" ] ; then
 				bberror "Some packages could not be configured offline and rootfs is read-only."
 				exit 1
 			fi
@@ -135,6 +135,20 @@ fakeroot rootfs_rpm_do_rootfs () {
 	log_check rootfs
 }
 
+rootfs_rpm_do_rootfs[vardeps] += "delayed_postinsts"
+
+delayed_postinsts() {
+	if [ -d ${IMAGE_ROOTFS}${sysconfdir}/rpm-postinsts ]; then
+		ls ${IMAGE_ROOTFS}${sysconfdir}/rpm-postinsts
+	fi
+}
+
+save_postinsts() {
+	# this is just a stub. For RPM, the failed postinstalls are already saved in
+	# /etc/rpm-postinsts
+	true
+}
+
 remove_packaging_data_files() {
 	# Save the rpmlib for increment rpm image generation
 	t="${T}/saved_rpmlib/var/lib"
@@ -165,6 +179,11 @@ rootfs_install_packages() {
 	package_install_internal_rpm
 }
 
+rootfs_remove_packages() {
+	echo rpm -e --nodeps --root=${IMAGE_ROOTFS} --dbpath=/var/lib/rpm $@
+	rpm -e --nodeps --root=${IMAGE_ROOTFS} --dbpath=/var/lib/rpm $@
+}
+
 python () {
     if d.getVar('BUILD_IMAGES_FROM_FEEDS', True):
         flags = d.getVarFlag('do_rootfs', 'recrdeptask')
-- 
1.7.9.5


