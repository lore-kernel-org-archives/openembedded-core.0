Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QlqWa-0001Dk-HL
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 01:00:24 +0200
Received: by rex (Postfix, from userid 1000)
	id 1407A201DD; Tue, 26 Jul 2011 23:50:29 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2011 23:50:25 +0100
Message-Id: <bfe5838302fbcfe989e3c26c9e04c927c4755e65.1311720062.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1311720062.git.richard.purdie@linuxfoundation.org>
References: <cover.1311720062.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 1/3] package/rootfs_rpm: Implement RPM multilib package handling
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
X-List-Received-Date: Tue, 26 Jul 2011 23:00:24 -0000

From: Mark Hatle <mark.hatle@windriver.com>

This is a first pass at adding multilib support to the RPM package
and image handling code.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass |  229 ++++++++++++++++++++++++--------------
 meta/classes/rootfs_rpm.bbclass  |   17 +++-
 2 files changed, 160 insertions(+), 86 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 2cc5742..05f3929 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -21,67 +21,71 @@ RPMCONF_HOST_BASE = "${DEPLOY_DIR_RPM}/solvedb-sdk"
 # Update the Packages depsolver db in ${DEPLOY_DIR_RPM}
 #
 package_update_index_rpm () {
-	rpmarchs="${PACKAGE_ARCHS}"
-
 	if [ ! -z "${DEPLOY_KEEP_PACKAGES}" ]; then
 		return
 	fi
 
-	packagedirs=""
-	packagedirs_sdk=""
-	for arch in $rpmarchs ; do
-		sdkarch=`echo $arch | sed -e 's/${HOST_ARCH}/${SDK_ARCH}/'`
-		extension="-nativesdk"
-		if [ "$sdkarch" = "all" -o "$sdkarch" = "any" -o "$sdkarch" = "noarch" ]; then
-		    extension=""
-		fi
-		packagedirs="${DEPLOY_DIR_RPM}/$arch $packagedirs"
-		packagedirs_sdk="${DEPLOY_DIR_RPM}/$sdkarch$extension $packagedirs_sdk"
+	base_package_archs="${PACKAGE_ARCHS}"
+	ml_package_archs="${MULTILIB_PACKAGE_ARCHS}"
+
+	for archvar in base_package_archs ml_package_archs; do
+		eval archs=\${${archvar}}
+		packagedirs=""
+		packagedirs_sdk=""
+		for arch in $archs; do
+			sdkarch=`echo $arch | sed -e 's/${HOST_ARCH}/${SDK_ARCH}/'`
+			extension="-nativesdk"
+			if [ "$sdkarch" = "all" -o "$sdkarch" = "any" -o "$sdkarch" = "noarch" ]; then
+			    extension=""
+			fi
+			packagedirs="${DEPLOY_DIR_RPM}/$arch $packagedirs"
+			packagedirs_sdk="${DEPLOY_DIR_RPM}/$sdkarch$extension $packagedirs_sdk"
 
-		rm -rf ${DEPLOY_DIR_RPM}/$arch/solvedb
-		rm -rf ${DEPLOY_DIR_RPM}/$sdkarch$extension/solvedb
-	done
+			rm -rf ${DEPLOY_DIR_RPM}/$arch/solvedb
+			rm -rf ${DEPLOY_DIR_RPM}/$sdkarch$extension/solvedb
+		done
 
-	cat /dev/null > ${RPMCONF_TARGET_BASE}.conf
-	for pkgdir in $packagedirs; do
-		if [ -e $pkgdir/ ]; then
-			echo "Generating solve db for $pkgdir..."
-			echo $pkgdir/solvedb >> ${RPMCONF_TARGET_BASE}.conf
-			if [ -d $pkgdir/solvedb ]; then
-				# We've already processed this and it's a duplicate
-				continue
+		cat /dev/null > ${RPMCONF_TARGET_BASE}-${archvar}.conf
+		for pkgdir in $packagedirs; do
+			if [ -e $pkgdir/ ]; then
+				echo "Generating solve db for $pkgdir..."
+				echo $pkgdir/solvedb >> ${RPMCONF_TARGET_BASE}-${archvar}.conf
+				if [ -d $pkgdir/solvedb ]; then
+					# We've already processed this and it's a duplicate
+					continue
+				fi
+				mkdir -p $pkgdir/solvedb
+				echo "# Dynamically generated solve manifest" >> $pkgdir/solvedb/manifest
+				find $pkgdir -maxdepth 1 -type f >> $pkgdir/solvedb/manifest
+				${RPM} -i --replacepkgs --replacefiles --oldpackage \
+					-D "_dbpath $pkgdir/solvedb" --justdb \
+					--noaid --nodeps --noorder --noscripts --notriggers --noparentdirs --nolinktos --stats \
+					--ignoresize --nosignature --nodigest \
+					-D "__dbi_txn create nofsync" \
+					$pkgdir/solvedb/manifest
 			fi
-			mkdir -p $pkgdir/solvedb
-			echo "# Dynamically generated solve manifest" >> $pkgdir/solvedb/manifest
-			find $pkgdir -maxdepth 1 -type f >> $pkgdir/solvedb/manifest
-			${RPM} -i --replacepkgs --replacefiles --oldpackage \
-				-D "_dbpath $pkgdir/solvedb" --justdb \
-				--noaid --nodeps --noorder --noscripts --notriggers --noparentdirs --nolinktos --stats \
-				--ignoresize --nosignature --nodigest \
-				-D "__dbi_txn create nofsync" \
-				$pkgdir/solvedb/manifest
-		fi
-	done
+		done
 
-	cat /dev/null > ${RPMCONF_HOST_BASE}.conf
-	for pkgdir in $packagedirs_sdk; do
-		if [ -e $pkgdir/ ]; then
-			echo "Generating solve db for $pkgdir..."
-			echo $pkgdir/solvedb >> ${RPMCONF_HOST_BASE}.conf
-			if [ -d $pkgdir/solvedb ]; then
-				# We've already processed this and it's a duplicate
-				continue
-			fi	
-			mkdir -p $pkgdir/solvedb
-			echo "# Dynamically generated solve manifest" >> $pkgdir/solvedb/manifest
-			find $pkgdir -maxdepth 1 -type f >> $pkgdir/solvedb/manifest
-			${RPM} -i --replacepkgs --replacefiles --oldpackage \
-				-D "_dbpath $pkgdir/solvedb" --justdb \
-				--noaid --nodeps --noorder --noscripts --notriggers --noparentdirs --nolinktos --stats \
-				--ignoresize --nosignature --nodigest \
-				-D "__dbi_txn create nofsync" \
-				$pkgdir/solvedb/manifest
-		fi
+		cat /dev/null > ${RPMCONF_HOST_BASE}.conf
+		for pkgdir in $packagedirs_sdk; do
+			if [ -e $pkgdir/ ]; then
+				echo "Generating solve db for $pkgdir..."
+				echo $pkgdir/solvedb >> ${RPMCONF_HOST_BASE}-${archvar}.conf
+				if [ -d $pkgdir/solvedb ]; then
+					# We've already processed this and it's a duplicate
+					continue
+				fi	
+				mkdir -p $pkgdir/solvedb
+				echo "# Dynamically generated solve manifest" >> $pkgdir/solvedb/manifest
+				find $pkgdir -maxdepth 1 -type f >> $pkgdir/solvedb/manifest
+				${RPM} -i --replacepkgs --replacefiles --oldpackage \
+					-D "_dbpath $pkgdir/solvedb" --justdb \
+					--noaid --nodeps --noorder --noscripts --notriggers --noparentdirs --nolinktos --stats \
+					--ignoresize --nosignature --nodigest \
+					-D "__dbi_txn create nofsync" \
+					$pkgdir/solvedb/manifest
+			fi
+		done
 	done
 }
 
@@ -91,25 +95,43 @@ package_update_index_rpm () {
 #
 package_generate_rpm_conf () {
 	printf "_solve_dbpath " > ${RPMCONF_TARGET_BASE}.macro
-	colon=false
-	for each in `cat ${RPMCONF_TARGET_BASE}.conf` ; do
-		if [ "$colon" == true ]; then
-			printf ":" >> ${RPMCONF_TARGET_BASE}.macro
-		fi
-		printf "%s" $each >> ${RPMCONF_TARGET_BASE}.macro
-		colon=true
-	done
-	printf "\n" >> ${RPMCONF_TARGET_BASE}.macro
+	o_colon_t=false
+	o_colon_h=false
+
+	for archvar in base_package_archs ml_package_archs; do
+		printf "_solve_dbpath " > ${RPMCONF_TARGET_BASE}-${archvar}.macro
+		colon=false
+		for each in `cat ${RPMCONF_TARGET_BASE}-${archvar}.conf` ; do
+			if [ "$o_colon_t" == true ]; then
+				printf ":" >> ${RPMCONF_TARGET_BASE}.macro
+			fi
+			if [ "$colon" == true ]; then
+				printf ":" >> ${RPMCONF_TARGET_BASE}-${archvar}.macro
+			fi
+			printf "%s" $each >> ${RPMCONF_TARGET_BASE}.macro
+			o_colon_t=true
+			printf "%s" $each >> ${RPMCONF_TARGET_BASE}-${archvar}.macro
+			colon=true
+		done
+		printf "\n" >> ${RPMCONF_TARGET_BASE}-${archvar}.macro
 
-	printf "_solve_dbpath " > ${RPMCONF_HOST_BASE}.macro
-	colon=false
-	for each in `cat ${RPMCONF_HOST_BASE}.conf` ; do
-		if [ "$colon" == true ]; then
-			printf ":" >> ${RPMCONF_HOST_BASE}.macro
-		fi
-		printf "%s" $each >> ${RPMCONF_HOST_BASE}.macro
-		colon=true
+		printf "_solve_dbpath " > ${RPMCONF_HOST_BASE}-${archvar}.macro
+		colon=false
+		for each in `cat ${RPMCONF_HOST_BASE}-${archvar}.conf` ; do
+			if [ "$o_colon_h" == true ]; then
+				printf ":" >> ${RPMCONF_HOST_BASE}.macro
+			fi
+			if [ "$colon" == true ]; then
+				printf ":" >> ${RPMCONF_HOST_BASE}-${archvar}.macro
+			fi
+			printf "%s" $each >> ${RPMCONF_HOST_BASE}.macro
+			o_colon_h=true
+			printf "%s" $each >> ${RPMCONF_HOST_BASE}-${archvar}.macro
+			colon=true
+		done
+		printf "\n" >> ${RPMCONF_HOST_BASE}-${archvar}.macro
 	done
+	printf "\n" >> ${RPMCONF_TARGET_BASE}.macro
 	printf "\n" >> ${RPMCONF_HOST_BASE}.macro
 }
 
@@ -139,11 +161,11 @@ rpm_log_check() {
 # resolve_pacakge <pkgname> <solvdb conffile>
 #
 resolve_package_rpm () {
-	local pkg="$1"
-	local conffile="$2"
+	local conffile="$1"
+	shift
 	local pkg_name=""
 	for solve in `cat ${conffile}`; do
-		pkg_name=$(${RPM} -D "_dbpath $solve" -D "__dbi_txn create nofsync" -q --yaml $pkg | grep -i 'Packageorigin' | cut -d : -f 2)
+		pkg_name=$(${RPM} -D "_dbpath $solve" -D "__dbi_txn create nofsync" -q --yaml $@ | grep -i 'Packageorigin' | cut -d : -f 2)
 		if [ -n "$pkg_name" ]; then
 			break;
 		fi
@@ -178,10 +200,10 @@ package_install_internal_rpm () {
 
 	# Setup base system configuration
 	mkdir -p ${target_rootfs}/etc/rpm/
-	echo "${platform}-poky-linux-gnu" > ${target_rootfs}/etc/rpm/platform
+	echo "${platform}${TARGET_VENDOR}-${TARGET_OS}" > ${target_rootfs}/etc/rpm/platform
 	if [ ! -z "$platform_extra" ]; then
 		for pt in $platform_extra ; do
-			echo "$pt-.*-linux.*" >> ${target_rootfs}/etc/rpm/platform
+			echo "$pt-.*-${TARGET_OS}" >> ${target_rootfs}/etc/rpm/platform
 		done
 	fi
 
@@ -204,9 +226,16 @@ package_install_internal_rpm () {
 		if [ ! -z "${package_lingusa}" ]; then
 			for pkg in ${package_lingusa}; do
 				echo "Processing $pkg..."
-				pkg_name=$(resolve_package_rpm $pkg ${confbase}.conf)
+
+				archvar=base_package_archs
+				ml_pkg=$(echo ${pkg} | sed "s,^${MLPREFIX}\(.*\),\1,")
+				if [ "${ml_pkg}" != "${pkg}" ]; then
+					archvar=ml_package_archs
+				fi
+
+				pkg_name=$(resolve_package_rpm ${confbase}-${archvar}.conf ${ml_pkg})
 				if [ -z "$pkg_name" ]; then
-					echo "Unable to find package $pkg!"
+					echo "Unable to find package $pkg ($ml_pkg)!"
 					exit 1
 				fi
 				echo $pkg_name >> ${IMAGE_ROOTFS}/install/install.manifest
@@ -217,12 +246,19 @@ package_install_internal_rpm () {
 	if [ ! -z "${package_to_install}" ]; then
 		for pkg in ${package_to_install} ; do
 			echo "Processing $pkg..."
-			pkg_name=$(resolve_package_rpm $pkg ${confbase}.conf)
+
+			archvar=base_package_archs
+			ml_pkg=$(echo ${pkg} | sed "s,$^{MLPREFIX}\(.*\),\1,")
+			if [ "${ml_pkg}" != "${pkg}" ]; then
+				archvar=ml_package_archs
+			fi
+
+			pkg_name=$(resolve_package_rpm ${confbase}-${archvar}.conf ${ml_pkg})
 			if [ -z "$pkg_name" ]; then
-				echo "Unable to find package $pkg!"
+				echo "Unable to find package $pkg ($ml_pkg)!"
 				exit 1
 			fi
-			echo $pkg_name >> ${target_rootfs}/install/install.manifest
+			echo $pkg_name >> ${IMAGE_ROOTFS}/install/install.manifest
 		done
 	fi
 
@@ -318,6 +354,21 @@ python write_specfile () {
 	import textwrap
 	import oe.packagedata
 
+	# We need a simple way to remove the MLPREFIX from the package name,
+	# and dependency information...
+	def strip_multilib(name, d):
+		multilibs = d.getVar('MULTILIBS', True) or ""
+		for ext in multilibs.split():
+			eext = ext.split(':')
+			if len(eext) > 1 and eext[0] == 'multilib' and name and name.find(eext[1] + '-') == 0:
+				name = (eext[1] + '-').join(name.split(eext[1] + '-', 1)[1:])
+		return name
+
+#		ml = bb.data.getVar("MLPREFIX", d, True)
+#		if ml and name and len(ml) != 0 and name.find(ml) == 0:
+#			return ml.join(name.split(ml, 1)[1:])
+#		return name
+
 	# In RPM, dependencies are of the format: pkg <>= Epoch:Version-Release
 	# This format is similar to OE, however there are restrictions on the
 	# characters that can be in a field.  In the Version field, "-"
@@ -346,7 +397,7 @@ python write_specfile () {
 							pv = subd['PKGV']
 							reppv = pv.replace('-', '+')
 							ver = ver.replace(pv, reppv)
-				newdeps_dict[dep] = ver
+				newdeps_dict[strip_multilib(dep, d)] = ver
 			depends = bb.utils.join_deps(newdeps_dict)
 			bb.data.setVar(varname, depends.strip(), d)
 
@@ -394,7 +445,7 @@ python write_specfile () {
 		return
 
 	# Construct the SPEC file...
-	srcname    = bb.data.getVar('PN', d, True)
+	srcname    = strip_multilib(bb.data.getVar('PN', d, True), d)
 	srcsummary = (bb.data.getVar('SUMMARY', d, True) or bb.data.getVar('DESCRIPTION', d, True) or ".")
 	srcversion = bb.data.getVar('PKGV', d, True).replace('-', '+')
 	srcrelease = bb.data.getVar('PKGR', d, True)
@@ -405,7 +456,7 @@ python write_specfile () {
 	srchomepage    = bb.data.getVar('HOMEPAGE', d, True)
 	srcdescription = bb.data.getVar('DESCRIPTION', d, True) or "."
 
-	srcdepends     = bb.data.getVar('DEPENDS', d, True)
+	srcdepends     = strip_multilib(bb.data.getVar('DEPENDS', d, True), d)
 	srcrdepends    = []
 	srcrrecommends = []
 	srcrsuggests   = []
@@ -448,7 +499,7 @@ python write_specfile () {
 
 		conffiles = (bb.data.getVar('CONFFILES', localdata, True) or "").split()
 
-		splitname    = pkgname
+		splitname    = strip_multilib(pkgname, d)
 
 		splitsummary = (bb.data.getVar('SUMMARY', localdata, True) or bb.data.getVar('DESCRIPTION', localdata, True) or ".")
 		splitversion = (bb.data.getVar('PKGV', localdata, True) or "").replace('-', '+')
@@ -699,6 +750,14 @@ python write_specfile () {
 python do_package_rpm () {
 	import os
 
+	# We need a simple way to remove the MLPREFIX from the package name,
+	# and dependency information...
+	def strip_multilib(name, d):
+		ml = bb.data.getVar("MLPREFIX", d, True)
+		if ml and name and len(ml) != 0 and name.find(ml) == 0:
+			return ml.join(name.split(ml, 1)[1:])
+		return name
+
 	workdir = bb.data.getVar('WORKDIR', d, True)
 	outdir = bb.data.getVar('DEPLOY_DIR_IPK', d, True)
 	tmpdir = bb.data.getVar('TMPDIR', d, True)
@@ -714,7 +773,7 @@ python do_package_rpm () {
 		return
 
 	# Construct the spec file...
-	srcname    = bb.data.getVar('PN', d, True)
+	srcname    = strip_multilib(bb.data.getVar('PN', d, True), d)
 	outspecfile = workdir + "/" + srcname + ".spec"
 	bb.data.setVar('OUTSPECFILE', outspecfile, d)
 	bb.build.exec_func('write_specfile', d)
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index b554bae..04c0483 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -93,7 +93,7 @@ EOF
 
 	# List must be prefered to least preferred order
 	INSTALL_PLATFORM_EXTRA_RPM=""
-	for each_arch in ${PACKAGE_ARCHS} ; do
+	for each_arch in ${MULTILIB_PACKAGE_ARCHS} ${PACKAGE_ARCHS}; do
 		INSTALL_PLATFORM_EXTRA_RPM="$each_arch $INSTALL_PLATFORM_EXTRA_RPM"
 	done
 	export INSTALL_PLATFORM_RPM
@@ -207,4 +207,19 @@ python () {
         bb.data.setVarFlag('do_rootfs', 'recrdeptask', flags, d)
         bb.data.setVar('RPM_PREPROCESS_COMMANDS', '', d)
         bb.data.setVar('RPM_POSTPROCESS_COMMANDS', '', d)
+
+    ml_package_archs = ""
+    multilibs = d.getVar('MULTILIBS', True) or ""
+    for ext in multilibs.split():
+        eext = ext.split(':')
+        if len(eext) > 1 and eext[0] == 'multilib':
+            localdata = bb.data.createCopy(d)
+            overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + eext[1]
+            localdata.setVar("OVERRIDES", overrides)
+            # TEMP: OVERRIDES isn't working right
+            localdata.setVar("TUNENAME", localdata.getVar("TUNENAME_virtclass-multilib-" + eext[1], False) or "")
+            ml_package_archs += localdata.getVar("PACKAGE_ARCHS", True) or ""
+            bb.note("ML_PACKAGE_ARCHS %s %s %s" % (eext[1], localdata.getVar("PACKAGE_ARCHS", True) or "(none)", overrides))
+    bb.data.setVar('MULTILIB_PACKAGE_ARCHS', ml_package_archs, d)
+
 }
-- 
1.7.4.1



