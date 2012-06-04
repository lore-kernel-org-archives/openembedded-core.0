Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SbbXD-0004t6-5i
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jun 2012 19:57:43 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q54HlHQE000786
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Jun 2012 10:47:17 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 4 Jun 2012 10:47:16 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Jun 2012 12:52:51 -0500
Message-ID: <7da56c920238535a626b0addc57d5defcdf17012.1338832215.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1338832214.git.mark.hatle@windriver.com>
References: <cover.1338832214.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 6/6] rootfs_rpm.bbclass: Update database configuration and initial install
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
X-List-Received-Date: Mon, 04 Jun 2012 17:57:43 -0000
Content-Type: text/plain

Move the creation of the database configuration files to just before we
perform the install actions.  This ensures they will exist even in SDK or
other non-target filesystem images.

Also check the initial install actually has something to install, otherwise
this can lead to a failure case.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass |   71 +++++++++++++++++++++++++++++---------
 meta/classes/rootfs_rpm.bbclass  |   31 ----------------
 2 files changed, 54 insertions(+), 48 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 097fa12..9f13a07 100644
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
@@ -454,6 +455,38 @@ EOF
 
 	chmod 0755 ${WORKDIR}/scriptlet_wrapper
 
+	# Configure RPM... we enforce these settings!
+	mkdir -p ${target_rootfs}${rpmlibdir}
+	mkdir -p ${target_rootfs}${rpmlibdir}/log
+	# After change the __db.* cache size, log file will not be generated automatically,
+	# that will raise some warnings, so touch a bare log for rpm write into it.
+	touch ${target_rootfs}${rpmlibdir}/log/log.0000000001
+	cat > ${target_rootfs}${rpmlibdir}/DB_CONFIG << EOF
+# ================ Environment
+set_data_dir .
+set_create_dir .
+set_lg_dir ./log
+set_tmp_dir ./tmp
+set_flags db_log_autoremove on
+
+# -- thread_count must be >= 8
+set_thread_count 64
+
+# ================ Logging
+
+# ================ Memory Pool
+set_cachesize 0 1048576 0
+set_mp_mmapsize 268435456
+
+# ================ Locking
+set_lk_max_locks 16384
+set_lk_max_lockers 16384
+set_lk_max_objects 16384
+mutex_set_max 163840
+
+# ================ Replication
+EOF
+
 	# RPM is special. It can't handle dependencies and preinstall scripts correctly. Its
 	# probably a feature. The only way to convince rpm to actually run the preinstall scripts 
 	# for base-passwd and shadow first before installing packages that depend on these packages 
@@ -461,33 +494,37 @@ EOF
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
 
-		rpm_update_pkg ${target_rootfs}/install/initial_solution.manifest
+			${RPM} -D "_dbpath ${target_rootfs}/initial" -qa --qf "%{packageorigin}\n" \
+				-D "__dbi_txn create nofsync private" \
+				> ${target_rootfs}/install/initial_solution.manifest
+
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
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 703fa15..d227e61 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -59,37 +59,6 @@ fakeroot rootfs_rpm_do_rootfs () {
 	# Setup base system configuration
 	mkdir -p ${INSTALL_ROOTFS_RPM}/etc/rpm/
 
-	mkdir -p ${INSTALL_ROOTFS_RPM}${rpmlibdir}
-	mkdir -p ${INSTALL_ROOTFS_RPM}${rpmlibdir}/log
-	# After change the __db.* cache size, log file will not be generated automatically,
-	# that will raise some warnings, so touch a bare log for rpm write into it.
-	touch ${INSTALL_ROOTFS_RPM}${rpmlibdir}/log/log.0000000001
-	cat > ${INSTALL_ROOTFS_RPM}${rpmlibdir}/DB_CONFIG << EOF
-# ================ Environment
-set_data_dir .
-set_create_dir .
-set_lg_dir ./log
-set_tmp_dir ./tmp
-set_flags db_log_autoremove on
-
-# -- thread_count must be >= 8
-set_thread_count 64
-
-# ================ Logging
-
-# ================ Memory Pool
-set_cachesize 0 1048576 0
-set_mp_mmapsize 268435456
-
-# ================ Locking
-set_lk_max_locks 16384
-set_lk_max_lockers 16384
-set_lk_max_objects 16384
-mutex_set_max 163840
-
-# ================ Replication
-EOF
-
 	# List must be prefered to least preferred order
 	INSTALL_PLATFORM_EXTRA_RPM=""
 	for each_arch in ${MULTILIB_PACKAGE_ARCHS} ${PACKAGE_ARCHS}; do
-- 
1.7.3.4



