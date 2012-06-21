Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1ShXJI-0004uK-Oq
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 04:39:53 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q5L2T700003880
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 19:29:07 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 20 Jun 2012 19:29:06 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jun 2012 10:30:00 +0800
Message-ID: <3f182aa0ab19494800404d9b3fce27ddbdb5048a.1340177329.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1340177329.git.liezhi.yang@windriver.com>
References: <cover.1340177329.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] package_rpm.bbclass: fix incremental rpm generation
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
X-List-Received-Date: Thu, 21 Jun 2012 02:39:53 -0000
Content-Type: text/plain

Fixes:
* Remove the "echo '# Remove manifest padding....' > remove.manifest,
  The remove.manifest would be used via "rpm -e `remove.manifest`",
  there would be error since there is no pkg called: Remove, manifest or
  padding

* The incremental.manifest can't be null when used by rpm, so check it
  before use.

* The rpm needs:
	--root "${target_rootfs}/install"
  when use:
	-D "_dbpath ${target_rootfs}/install"
  Otherwise it would use the ${target_rootfs} as the root, and use the
  ${target_rootfs}/var/lib/rpm as the dbpath, this is OK in a fresh
  installation, but there would be errors when increment rpm generation.

[YOCTO #2617]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/package_rpm.bbclass |   16 +++++++++++++---
 1 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index d5406c2..5559a46 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -182,14 +182,15 @@ rpm_update_pkg () {
         # been run by now, so don't have to run them(preun, postun, etc.) when
         # erase the pkg
         if [ -s ${target_rootfs}/install/remove.manifest ]; then
-            echo "# Remove manifest padding...." >> ${target_rootfs}/install/remove.manifest
             rpm_common_comand --noscripts --nodeps \
                 -e `cat ${target_rootfs}/install/remove.manifest`
         fi
 
         # Attempt to install the incremental pkgs
-        rpm_common_comand --nodeps --replacefiles --replacepkgs \
-            -Uvh ${target_rootfs}/install/incremental.manifest
+        if [ -s ${target_rootfs}/install/incremental.manifest ]; then
+            rpm_common_comand --nodeps --replacefiles --replacepkgs \
+               -Uvh ${target_rootfs}/install/incremental.manifest
+        fi
     else
         # Attempt to install
         rpm_common_comand --replacepkgs -Uhv $manifest
@@ -314,6 +315,7 @@ package_install_internal_rpm () {
 		echo "# Install manifest padding" >> ${target_rootfs}/install/install.manifest
 		${RPM} --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
 			--predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
+			--root "${target_rootfs}/install" \
 			-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}-base_archs.macro`" \
 			-D "__dbi_txn create nofsync" \
 			-U --justdb --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
@@ -343,6 +345,7 @@ package_install_internal_rpm () {
 			echo "Attempting $pkg_name..." >> "${WORKDIR}/temp/log.do_${task}_attemptonly.${PID}"
 			${RPM} --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
 				--predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
+				--root "${target_rootfs}/install" \
 				-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}.macro`" \
 				-D "__dbi_txn create nofsync private" \
 				-U --justdb --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
@@ -363,6 +366,7 @@ package_install_internal_rpm () {
 		# Dump the full set of recommends...
 		${RPM} --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
 			--predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
+			--root "${target_rootfs}/install" \
 			-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}.macro`" \
 			-D "__dbi_txn create nofsync private" \
 			-qa --qf "[%{RECOMMENDS}\n]" | sort -u > ${target_rootfs}/install/recommend
@@ -392,6 +396,7 @@ package_install_internal_rpm () {
 			echo "Attempting $pkg_name..." >> "${WORKDIR}/temp/log.do_{task}_recommend.${PID}"
 			${RPM} --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
 				--predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
+				--root "${target_rootfs}/install" \
 				-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}.macro`" \
 				-D "__dbi_txn create nofsync private" \
 				-U --justdb --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
@@ -406,6 +411,7 @@ package_install_internal_rpm () {
 	# Now that we have a solution, pull out a list of what to install...
 	echo "Manifest: ${target_rootfs}/install/install.manifest"
 	${RPM} -D "_dbpath ${target_rootfs}/install" -qa --qf "%{packageorigin}\n" \
+		--root "${target_rootfs}/install" \
 		-D "__dbi_txn create nofsync private" \
 		> ${target_rootfs}/install/install_solution.manifest
 
@@ -419,6 +425,7 @@ package_install_internal_rpm () {
 		# an actual package install!
 		${RPM} --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
 			--predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
+			--root "${target_rootfs}/install" \
 			-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}-ml_archs.macro`" \
 			-D "__dbi_txn create nofsync" \
 			-U --justdb --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
@@ -427,6 +434,7 @@ package_install_internal_rpm () {
 		# Now that we have a solution, pull out a list of what to install...
 		echo "Manifest: ${target_rootfs}/install/install_multilib.manifest"
 		${RPM} -D "_dbpath ${target_rootfs}/install" -qa --qf "%{packageorigin}\n" \
+			--root "${target_rootfs}/install" \
 			-D "__dbi_txn create nofsync private" \
 			> ${target_rootfs}/install/install_multilib_solution.manifest
 
@@ -513,6 +521,7 @@ EOF
 
 			${RPM} --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
 				--predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
+				--root "${target_rootfs}/install" \
 				-D "_dbpath ${target_rootfs}/initial" -D "`cat ${confbase}.macro`" \
 				-D "__dbi_txn create nofsync" \
 				-U --justdb --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
@@ -520,6 +529,7 @@ EOF
 
 			${RPM} -D "_dbpath ${target_rootfs}/initial" -qa --qf "%{packageorigin}\n" \
 				-D "__dbi_txn create nofsync private" \
+				--root "${target_rootfs}/install" \
 				> ${target_rootfs}/install/initial_solution.manifest
 
 			rpm_update_pkg ${target_rootfs}/install/initial_solution.manifest
-- 
1.7.1



