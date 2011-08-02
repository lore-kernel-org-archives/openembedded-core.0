Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Qo2jB-0005dR-0p
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 02:20:57 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p720GZ5H020005
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Aug 2011 17:16:35 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 1 Aug 2011 17:16:35 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 1 Aug 2011 19:17:38 -0500
Message-ID: <5b08c765709fc1fe8d9bfe1e4ba94365701a5166.1312243899.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312243899.git.mark.hatle@windriver.com>
References: <cover.1312243899.git.mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 1/5] rootfs_rpm: Cleanup and minor bug fixes
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
X-List-Received-Date: Tue, 02 Aug 2011 00:20:57 -0000
Content-Type: text/plain

in packages_rpm.bbclass:

Cleanup the way package_update_index_rpm works.  Break this out into two
functions, one for common functionality and one for controlling target vs
sdk package processing.

Similar change to package_generate_rpm_conf.

Usage of IMAGE_ROOTFS should actually be "target_rootfs", this fixes a problem
with the SDK case.

in rootfs_rpm.bbclass:

Minor re-order of the values, and avoid multiple uses of IMAGE_ROOTFS in order
to make the merge with the SDK behavior easier.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass |  128 ++++++++++++++++---------------------
 meta/classes/rootfs_rpm.bbclass  |   17 +++---
 2 files changed, 64 insertions(+), 81 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 950f665..0f16613 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -25,31 +25,41 @@ package_update_index_rpm () {
 		return
 	fi
 
-	base_package_archs="${PACKAGE_ARCHS}"
-	ml_package_archs="${MULTILIB_PACKAGE_ARCHS}"
+	# Update target packages
+	base_archs="${PACKAGE_ARCHS}"
+	ml_archs="${MULTILIB_PACKAGE_ARCHS}"
+	package_update_index_rpm_common "${RPMCONF_TARGET_BASE}" base_archs ml_archs
+
+	# Update SDK packages
+	base_archs=""
+	for arch in ${PACKAGE_ARCHS}; do
+		sdkarch=`echo $arch | sed -e 's/${HOST_ARCH}/${SDK_ARCH}/'`
+		extension="-nativesdk"
+		if [ "$sdkarch" = "all" -o "$sdkarch" = "any" -o "$sdkarch" = "noarch" ]; then
+		    extension=""
+		fi
+		base_archs="$base_archs $sdkarch$extension"
+	done
+	package_update_index_rpm_common "${RPMCONF_HOST_BASE}" base_archs
+}
+
+package_update_index_rpm_common () {
+	rpmconf_base="$1"
+	shift
 
-	for archvar in base_package_archs ml_package_archs; do
+	for archvar in "$@"; do
 		eval archs=\${${archvar}}
 		packagedirs=""
-		packagedirs_sdk=""
 		for arch in $archs; do
-			sdkarch=`echo $arch | sed -e 's/${HOST_ARCH}/${SDK_ARCH}/'`
-			extension="-nativesdk"
-			if [ "$sdkarch" = "all" -o "$sdkarch" = "any" -o "$sdkarch" = "noarch" ]; then
-			    extension=""
-			fi
 			packagedirs="${DEPLOY_DIR_RPM}/$arch $packagedirs"
-			packagedirs_sdk="${DEPLOY_DIR_RPM}/$sdkarch$extension $packagedirs_sdk"
-
 			rm -rf ${DEPLOY_DIR_RPM}/$arch/solvedb
-			rm -rf ${DEPLOY_DIR_RPM}/$sdkarch$extension/solvedb
 		done
 
-		cat /dev/null > ${RPMCONF_TARGET_BASE}-${archvar}.conf
+		cat /dev/null > ${rpmconf_base}-${archvar}.conf
 		for pkgdir in $packagedirs; do
 			if [ -e $pkgdir/ ]; then
 				echo "Generating solve db for $pkgdir..."
-				echo $pkgdir/solvedb >> ${RPMCONF_TARGET_BASE}-${archvar}.conf
+				echo $pkgdir/solvedb >> ${rpmconf_base}-${archvar}.conf
 				if [ -d $pkgdir/solvedb ]; then
 					# We've already processed this and it's a duplicate
 					continue
@@ -65,27 +75,6 @@ package_update_index_rpm () {
 					$pkgdir/solvedb/manifest
 			fi
 		done
-
-		cat /dev/null > ${RPMCONF_HOST_BASE}-${archvar}.conf
-		for pkgdir in $packagedirs_sdk; do
-			if [ -e $pkgdir/ ]; then
-				echo "Generating solve db for $pkgdir..."
-				echo $pkgdir/solvedb >> ${RPMCONF_HOST_BASE}-${archvar}.conf
-				if [ -d $pkgdir/solvedb ]; then
-					# We've already processed this and it's a duplicate
-					continue
-				fi	
-				mkdir -p $pkgdir/solvedb
-				echo "# Dynamically generated solve manifest" >> $pkgdir/solvedb/manifest
-				find $pkgdir -maxdepth 1 -type f >> $pkgdir/solvedb/manifest
-				${RPM} -i --replacepkgs --replacefiles --oldpackage \
-					-D "_dbpath $pkgdir/solvedb" --justdb \
-					--noaid --nodeps --noorder --noscripts --notriggers --noparentdirs --nolinktos --stats \
-					--ignoresize --nosignature --nodigest \
-					-D "__dbi_txn create nofsync" \
-					$pkgdir/solvedb/manifest
-			fi
-		done
 	done
 }
 
@@ -94,45 +83,38 @@ package_update_index_rpm () {
 # generated depsolver db's...
 #
 package_generate_rpm_conf () {
-	printf "_solve_dbpath " > ${RPMCONF_TARGET_BASE}.macro
-	o_colon_t=false
-	o_colon_h=false
+	# Update target packages
+	package_generate_rpm_conf_common "${RPMCONF_TARGET_BASE}" base_archs ml_archs
 
-	for archvar in base_package_archs ml_package_archs; do
-		printf "_solve_dbpath " > ${RPMCONF_TARGET_BASE}-${archvar}.macro
-		colon=false
-		for each in `cat ${RPMCONF_TARGET_BASE}-${archvar}.conf` ; do
-			if [ "$o_colon_t" == true ]; then
-				printf ":" >> ${RPMCONF_TARGET_BASE}.macro
-			fi
-			if [ "$colon" == true ]; then
-				printf ":" >> ${RPMCONF_TARGET_BASE}-${archvar}.macro
-			fi
-			printf "%s" $each >> ${RPMCONF_TARGET_BASE}.macro
-			o_colon_t=true
-			printf "%s" $each >> ${RPMCONF_TARGET_BASE}-${archvar}.macro
-			colon=true
-		done
-		printf "\n" >> ${RPMCONF_TARGET_BASE}-${archvar}.macro
+	# Update SDK packages
+	package_generate_rpm_conf_common "${RPMCONF_HOST_BASE}" base_archs
+}
+
+package_generate_rpm_conf_common() {
+	rpmconf_base="$1"
+	shift
+
+	printf "_solve_dbpath " > ${rpmconf_base}.macro
+	o_colon=false
 
-		printf "_solve_dbpath " > ${RPMCONF_HOST_BASE}-${archvar}.macro
+	for archvar in "$@"; do
+		printf "_solve_dbpath " > ${rpmconf_base}-${archvar}.macro
 		colon=false
-		for each in `cat ${RPMCONF_HOST_BASE}-${archvar}.conf` ; do
-			if [ "$o_colon_h" == true ]; then
-				printf ":" >> ${RPMCONF_HOST_BASE}.macro
+		for each in `cat ${rpmconf_base}-${archvar}.conf` ; do
+			if [ "$o_colon" == true ]; then
+				printf ":" >> ${rpmconf_base}.macro
 			fi
 			if [ "$colon" == true ]; then
-				printf ":" >> ${RPMCONF_HOST_BASE}-${archvar}.macro
+				printf ":" >> ${rpmconf_base}-${archvar}.macro
 			fi
-			printf "%s" $each >> ${RPMCONF_HOST_BASE}.macro
-			o_colon_h=true
-			printf "%s" $each >> ${RPMCONF_HOST_BASE}-${archvar}.macro
+			printf "%s" $each >> ${rpmconf_base}.macro
+			o_colon=true
+			printf "%s" $each >> ${rpmconf_base}-${archvar}.macro
 			colon=true
 		done
-		printf "\n" >> ${RPMCONF_HOST_BASE}-${archvar}.macro
+		printf "\n" >> ${rpmconf_base}-${archvar}.macro
 	done
-	printf "\n" >> ${RPMCONF_TARGET_BASE}.macro
-	printf "\n" >> ${RPMCONF_HOST_BASE}.macro
+	printf "\n" >> ${rpmconf_base}.macro
 }
 
 rpm_log_check() {
@@ -211,7 +193,7 @@ package_install_internal_rpm () {
 	mkdir -p ${target_rootfs}/etc/rpm/sysinfo
 	echo "/" >${target_rootfs}/etc/rpm/sysinfo/Dirnames
 	if [ ! -z "$providename" ]; then
-		>>${target_rootfs}/etc/rpm/sysinfo/Providename
+		cat /dev/null > ${target_rootfs}/etc/rpm/sysinfo/Providename
 		for provide in $providename ; do
 			echo $provide >> ${target_rootfs}/etc/rpm/sysinfo/Providename
 		done
@@ -227,10 +209,10 @@ package_install_internal_rpm () {
 			for pkg in ${package_linguas}; do
 				echo "Processing $pkg..."
 
-				archvar=base_package_archs
+				archvar=base_archs
 				ml_pkg=$(echo ${pkg} | sed "s,^${MLPREFIX}\(.*\),\1,")
 				if [ "${ml_pkg}" != "${pkg}" ]; then
-					archvar=ml_package_archs
+					archvar=ml_archs
 				fi
 
 				pkg_name=$(resolve_package_rpm ${confbase}-${archvar}.conf ${ml_pkg})
@@ -238,7 +220,7 @@ package_install_internal_rpm () {
 					echo "Unable to find package $pkg ($ml_pkg)!"
 					exit 1
 				fi
-				echo $pkg_name >> ${IMAGE_ROOTFS}/install/install.manifest
+				echo $pkg_name >> ${target_rootfs}/install/install.manifest
 			done
 		fi
 	fi
@@ -247,10 +229,10 @@ package_install_internal_rpm () {
 		for pkg in ${package_to_install} ; do
 			echo "Processing $pkg..."
 
-			archvar=base_package_archs
+			archvar=base_archs
 			ml_pkg=$(echo ${pkg} | sed "s,^${MLPREFIX}\(.*\),\1,")
 			if [ "${ml_pkg}" != "${pkg}" ]; then
-				archvar=ml_package_archs
+				archvar=ml_archs
 			fi
 
 			pkg_name=$(resolve_package_rpm ${confbase}-${archvar}.conf ${ml_pkg})
@@ -258,7 +240,7 @@ package_install_internal_rpm () {
 				echo "Unable to find package $pkg ($ml_pkg)!"
 				exit 1
 			fi
-			echo $pkg_name >> ${IMAGE_ROOTFS}/install/install.manifest
+			echo $pkg_name >> ${target_rootfs}/install/install.manifest
 		done
 	fi
 
@@ -303,7 +285,7 @@ package_install_internal_rpm () {
 		# Dump the full set of recommends...
 		${RPM} --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
 			--predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
-			-D "_dbpath ${IMAGE_ROOTFS}/install" -D "`cat ${confbase}.macro`" \
+			-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}.macro`" \
 			-D "__dbi_txn create nofsync private" \
 			-qa --qf "[%{RECOMMENDS}\n]" | sort -u > ${target_rootfs}/install/recommend
 		# Did we add more to the list?
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index dfe4612..4f627a5 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -52,12 +52,16 @@ fakeroot rootfs_rpm_do_rootfs () {
 
 	#createrepo "${DEPLOY_DIR_RPM}"
 
+	# install packages
+	# This needs to work in the same way as populate_sdk_rpm.bbclass!
+	export INSTALL_ROOTFS_RPM="${IMAGE_ROOTFS}"
+
 	# Setup base system configuration
-	mkdir -p ${IMAGE_ROOTFS}/etc/rpm/
+	mkdir -p ${INSTALL_ROOTFS_RPM}/etc/rpm/
 
-	mkdir -p ${IMAGE_ROOTFS}${rpmlibdir}
-	mkdir -p ${IMAGE_ROOTFS}${rpmlibdir}/log
-	cat > ${IMAGE_ROOTFS}${rpmlibdir}/DB_CONFIG << EOF
+	mkdir -p ${INSTALL_ROOTFS_RPM}${rpmlibdir}
+	mkdir -p ${INSTALL_ROOTFS_RPM}${rpmlibdir}/log
+	cat > ${INSTALL_ROOTFS_RPM}${rpmlibdir}/DB_CONFIG << EOF
 # ================ Environment
 set_data_dir            .
 set_create_dir          .
@@ -81,15 +85,13 @@ mutex_set_max           163840
 # ================ Replication
 EOF
 
-	#install pacakges
-	export INSTALL_ROOTFS_RPM="${IMAGE_ROOTFS}"
 	export INSTALL_PLATFORM_RPM="${TARGET_ARCH}"
 	export INSTALL_CONFBASE_RPM="${RPMCONF_TARGET_BASE}"
 	export INSTALL_PACKAGES_NORMAL_RPM="${PACKAGE_INSTALL}"
 	export INSTALL_PACKAGES_ATTEMPTONLY_RPM="${PACKAGE_INSTALL_ATTEMPTONLY}"
 	export INSTALL_PACKAGES_LINGUAS_RPM="${LINGUAS_INSTALL}"
 	export INSTALL_PROVIDENAME_RPM=""
-	export INSTALL_TASK_RPM="populate_sdk"
+	export INSTALL_TASK_RPM="rootfs_rpm_do_rootfs"
 
 	# List must be prefered to least preferred order
 	INSTALL_PLATFORM_EXTRA_RPM=""
@@ -221,5 +223,4 @@ python () {
             ml_package_archs += localdata.getVar("PACKAGE_ARCHS", True) or ""
             #bb.note("ML_PACKAGE_ARCHS %s %s %s" % (eext[1], localdata.getVar("PACKAGE_ARCHS", True) or "(none)", overrides))
     bb.data.setVar('MULTILIB_PACKAGE_ARCHS', ml_package_archs, d)
-
 }
-- 
1.7.3.4



