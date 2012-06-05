Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Sc1vs-0001kH-7E
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 00:08:56 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q55LwTXA023779
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Jun 2012 14:58:29 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 5 Jun 2012 14:58:28 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Jun 2012 17:04:14 -0500
Message-ID: <7bd529e79af90b5be989d9eb1406b2b5e750a4e1.1338933735.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1338933735.git.mark.hatle@windriver.com>
References: <cover.1338933735.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 8/8 v6] package_rpm: Verify that the package manifests are not empty
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
X-List-Received-Date: Tue, 05 Jun 2012 22:08:56 -0000
Content-Type: text/plain

An empty manifest will cause a failure condition.  We ensure that any install
actions occur only with a manifest larger then size 0.  Also ensure that padding
is added to the end of the manifest, instead of the beginning to enable this
size check.  (Padding is required for very small manifest files..)

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass |   59 ++++++++++++++++++++++----------------
 1 files changed, 34 insertions(+), 25 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index b84c044..bb9aa1a 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -182,6 +182,7 @@ rpm_update_pkg () {
         # been run by now, so don't have to run them(preun, postun, etc.) when
         # erase the pkg
         if [ -s ${target_rootfs}/install/remove.manifest ]; then
+            echo "# Removal manifest padding...." >> ${target_rootfs}/install/remove.manifest
             rpm_common_comand --noscripts --nodeps \
                 -e `cat ${target_rootfs}/install/remove.manifest`
         fi
@@ -249,7 +250,7 @@ package_install_internal_rpm () {
 
 	# Setup manifest of packages to install...
 	mkdir -p ${target_rootfs}/install
-	echo "# Install manifest" > ${target_rootfs}/install/install.manifest
+	rm -f ${target_rootfs}/install/install.manifest
 
 	# Uclibc builds don't provide this stuff...
 	if [ x${TARGET_OS} = "xlinux" ] || [ x${TARGET_OS} = "xlinux-gnueabi" ] ; then
@@ -309,12 +310,15 @@ package_install_internal_rpm () {
 
 	# Generate an install solution by doing a --justdb install, then recreate it with
 	# an actual package install!
-	${RPM} --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
-		--predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
-		-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}-base_archs.macro`" \
-		-D "__dbi_txn create nofsync" \
-		-U --justdb --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
-		${target_rootfs}/install/install.manifest
+	if [ -s ${target_rootfs}/install/install.manifest ]; then
+		echo "# Install manifest padding" >> ${target_rootfs}/install/install.manifest
+		${RPM} --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
+			--predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
+			-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}-base_archs.macro`" \
+			-D "__dbi_txn create nofsync" \
+			-U --justdb --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
+			${target_rootfs}/install/install.manifest
+	fi
 
 	if [ ! -z "${package_attemptonly}" ]; then
 		echo "Adding attempt only packages..."
@@ -407,8 +411,9 @@ package_install_internal_rpm () {
 
 	touch ${target_rootfs}/install/install_multilib_solution.manifest
 
-	if [ -e "${target_rootfs}/install/install_multilib.manifest" ]; then
+	if [ -s "${target_rootfs}/install/install_multilib.manifest" ]; then
 		# multilib package installation
+		echo "# Install multilib manifest padding" >> ${target_rootfs}/install/install_multilib.manifest
 
 		# Generate an install solution by doing a --justdb install, then recreate it with
 		# an actual package install!
@@ -493,33 +498,37 @@ EOF
 	if [ "${INC_RPM_IMAGE_GEN}" = "1" -a -f "$pre_btmanifest" ]; then
 		echo "Skipping pre install due to exisitng image"
 	else
-		echo "# Initial Install manifest" > ${target_rootfs}/install/initial_install.manifest
+		rm -f ${target_rootfs}/install/initial_install.manifest
 		echo "Installing base dependencies first (base-passwd, base-files and shadow) since rpm is special"
 		grep /base-passwd-[0-9] ${target_rootfs}/install/total_solution.manifest >> ${target_rootfs}/install/initial_install.manifest || true
 		grep /base-files-[0-9] ${target_rootfs}/install/total_solution.manifest >> ${target_rootfs}/install/initial_install.manifest || true
 		grep /shadow-[0-9] ${target_rootfs}/install/total_solution.manifest >> ${target_rootfs}/install/initial_install.manifest || true
 
-		# Generate an install solution by doing a --justdb install, then recreate it with
-		# an actual package install!
-		mkdir -p ${target_rootfs}/initial
+		if [ -s ${target_rootfs}/install/initial_install.manifest ]; then
+			echo "# Initial Install manifest padding..." >> ${target_rootfs}/install/initial_install.manifest
 
-		${RPM} --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
-			--predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
-			-D "_dbpath ${target_rootfs}/initial" -D "`cat ${confbase}.macro`" \
-			-D "__dbi_txn create nofsync" \
-			-U --justdb --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
-			${target_rootfs}/install/initial_install.manifest
+			# Generate an install solution by doing a --justdb install, then recreate it with
+			# an actual package install!
+			mkdir -p ${target_rootfs}/initial
 
-		${RPM} -D "_dbpath ${target_rootfs}/initial" -qa --qf "%{packageorigin}\n" \
-			-D "__dbi_txn create nofsync private" \
-			> ${target_rootfs}/install/initial_solution.manifest
+			${RPM} --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
+				--predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
+				-D "_dbpath ${target_rootfs}/initial" -D "`cat ${confbase}.macro`" \
+				-D "__dbi_txn create nofsync" \
+				-U --justdb --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
+				${target_rootfs}/install/initial_install.manifest
+
+			${RPM} -D "_dbpath ${target_rootfs}/initial" -qa --qf "%{packageorigin}\n" \
+				-D "__dbi_txn create nofsync private" \
+				> ${target_rootfs}/install/initial_solution.manifest
 
-		rpm_update_pkg ${target_rootfs}/install/initial_solution.manifest
+			rpm_update_pkg ${target_rootfs}/install/initial_solution.manifest
 		
-		grep -Fv -f ${target_rootfs}/install/initial_solution.manifest ${target_rootfs}/install/total_solution.manifest > ${target_rootfs}/install/total_solution.manifest.new
-		mv ${target_rootfs}/install/total_solution.manifest.new ${target_rootfs}/install/total_solution.manifest
+			grep -Fv -f ${target_rootfs}/install/initial_solution.manifest ${target_rootfs}/install/total_solution.manifest > ${target_rootfs}/install/total_solution.manifest.new
+			mv ${target_rootfs}/install/total_solution.manifest.new ${target_rootfs}/install/total_solution.manifest
 		
-		rm -rf ${target_rootfs}/initial
+			rm -rf ${target_rootfs}/initial
+		fi
 	fi
 
 	echo "Installing main solution manifest (${target_rootfs}/install/total_solution.manifest)"
-- 
1.7.3.4



