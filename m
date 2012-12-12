Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TirKT-0003Mh-0i
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 19:46:49 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Dec 2012 10:32:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,267,1355126400"; d="scan'208";a="263101044"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.189])
	by fmsmga002.fm.intel.com with ESMTP; 12 Dec 2012 10:32:12 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Dec 2012 18:31:26 +0000
Message-Id: <e0e8b47ccf0d3616b50f600f5dde43e3a2334773.1355337025.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1355337025.git.paul.eggleton@linux.intel.com>
References: <cover.1355337025.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1355337025.git.paul.eggleton@linux.intel.com>
References: <cover.1355337025.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v3 02/13] classes/*_rpm: integrate Smart into RPM filesystem construction
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
X-List-Received-Date: Wed, 12 Dec 2012 18:46:49 -0000

Use Smart to construct the root filesystem for images and the contents
of SDKs rather than the custom scripts around rpm we had previously.
This ensures the result when producing an updated image will be the
same as upgrading to the same package versions from an older image on
the target, as well as allowing us to remove a substantial amount of
code making the rpm classes much easier to follow.

Some bugfixes from Bogdan Marinescu <bogdan.marinescu@intel.com>.
SDK implementation and testing as well as a number of bugfixes from
Mark Hatle <mark.hatle@windriver.com>.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass      |  531 ++++++---------------------------
 meta/classes/populate_sdk_rpm.bbclass |   51 +---
 meta/classes/rootfs_rpm.bbclass       |   34 ++-
 3 files changed, 121 insertions(+), 495 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 293c52c..4b81b68 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -16,88 +16,27 @@ python package_rpm_install () {
     bb.fatal("package_rpm_install not implemented!")
 }
 
-RPMCONF_TARGET_BASE = "${DEPLOY_DIR_RPM}/solvedb"
-RPMCONF_HOST_BASE = "${DEPLOY_DIR_RPM}/solvedb-sdk"
 #
-# Update the Packages depsolver db in ${DEPLOY_DIR_RPM}
+# Update the packages indexes ${DEPLOY_DIR_RPM}
 #
 package_update_index_rpm () {
 	if [ ! -z "${DEPLOY_KEEP_PACKAGES}" -o ! -e "${DEPLOY_DIR_RPM}" ]; then
 		return
 	fi
 
-	# Update target packages
 	base_archs="`echo ${PACKAGE_ARCHS} | sed 's/-/_/g'`"
 	ml_archs="`echo ${MULTILIB_PACKAGE_ARCHS} | sed 's/-/_/g'`"
-	package_update_index_rpm_common "${RPMCONF_TARGET_BASE}" base_archs ml_archs
+	sdk_archs="`echo ${SDK_PACKAGE_ARCHS} | sed 's/-/_/g'`"
 
-	# Update SDK packages
-	base_archs="`echo ${SDK_PACKAGE_ARCHS} | sed 's/-/_/g'`"
-	package_update_index_rpm_common "${RPMCONF_HOST_BASE}" base_archs
-}
-
-package_update_index_rpm_common () {
-	rpmconf_base="$1"
-	shift
-
-        createdirs=""
-	for archvar in "$@"; do
-		eval archs=\${${archvar}}
-		packagedirs=""
-		for arch in $archs; do
-			packagedirs="${DEPLOY_DIR_RPM}/$arch $packagedirs"
-			rm -rf ${DEPLOY_DIR_RPM}/$arch/solvedb.done
-		done
-
-		cat /dev/null > ${rpmconf_base}-${archvar}.conf
-		for pkgdir in $packagedirs; do
-			if [ -e $pkgdir/ ]; then
-				echo "Generating solve db for $pkgdir..."
-				echo $pkgdir/solvedb >> ${rpmconf_base}-${archvar}.conf
-                                createdirs="$createdirs $pkgdir"
-			fi
-		done
-	done
-	rpm-createsolvedb.py "${RPM}" $createdirs
-}
-
-#
-# Generate an rpm configuration suitable for use against the
-# generated depsolver db's...
-#
-package_generate_rpm_conf () {
-	# Update target packages
-	package_generate_rpm_conf_common "${RPMCONF_TARGET_BASE}" base_archs ml_archs
-
-	# Update SDK packages
-	package_generate_rpm_conf_common "${RPMCONF_HOST_BASE}" base_archs
-}
-
-package_generate_rpm_conf_common() {
-	rpmconf_base="$1"
-	shift
+	archs=`for arch in $base_archs $ml_archs $sdk_archs ; do
+		echo $arch
+	done | sort | uniq`
 
-	printf "_solve_dbpath " > ${rpmconf_base}.macro
-	o_colon="false"
-
-	for archvar in "$@"; do
-		printf "_solve_dbpath " > ${rpmconf_base}-${archvar}.macro
-		colon="false"
-		for each in `cat ${rpmconf_base}-${archvar}.conf` ; do
-			if [ "$o_colon" = "true" ]; then
-				printf ":" >> ${rpmconf_base}.macro
-			fi
-			if [ "$colon" = "true" ]; then
-				printf ":" >> ${rpmconf_base}-${archvar}.macro
-			fi
-			printf "%s" $each >> ${rpmconf_base}.macro
-			o_colon="true"
-			printf "%s" $each >> ${rpmconf_base}-${archvar}.macro
-			colon="true"
-		done
-		printf "\n" >> ${rpmconf_base}-${archvar}.macro
+	for arch in $archs; do
+		if [ -d ${DEPLOY_DIR_RPM}/$arch ] ; then
+			createrepo --update -q ${DEPLOY_DIR_RPM}/$arch
+		fi
 	done
-	printf "\n" >> ${rpmconf_base}.macro
 }
 
 rpm_log_check() {
@@ -122,150 +61,23 @@ rpm_log_check() {
 
 
 #
-# Resolve package names to filepaths
-# resolve_pacakge <pkgname> <solvdb conffile>
-#
-resolve_package_rpm () {
-	local conffile="$1"
-	shift
-	local pkg_name=""
-	for solve in `cat ${conffile}`; do
-		pkg_name=$(${RPM} -D "_dbpath $solve" -D "__dbi_txn create nofsync" -q --qf "%{packageorigin}\n" "$@" | grep -v "is not installed" || true)
-		if [ -n "$pkg_name" -a "$pkg_name" != "(none)" ]; then
-			echo $pkg_name
-			break;
-		fi
-	done
-}
-
-# rpm common command and options
-rpm_common_comand () {
-
-    local target_rootfs="${INSTALL_ROOTFS_RPM}"
-
-    ${RPM} --root ${target_rootfs} \
-        --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
-        --predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
-        -D "_var ${localstatedir}" \
-        -D "_dbpath ${rpmlibdir}" \
-        -D "_tmppath /install/tmp" \
-        --noparentdirs --nolinktos \
-        -D "__dbi_txn create nofsync private" \
-        -D "_cross_scriptlet_wrapper ${WORKDIR}/scriptlet_wrapper" $@
-}
-
-# install or remove the pkg
-rpm_update_pkg () {
-
-    manifest=$1
-    # The manifest filename, e.g. total_solution.manifest
-    m_name=${manifest##/*/}
-    local target_rootfs="${INSTALL_ROOTFS_RPM}"
-    installdir=$target_rootfs/install
-    pre_btmanifest=$installdir/pre_bt.manifest
-    cur_btmanifest=$installdir/cur_bt.manifest
-
-    # Install/remove the different pkgs when total_solution.manifest is
-    # comming and incremental image generation is enabled.
-    if [ "${INC_RPM_IMAGE_GEN}" = "1" -a -d "${target_rootfs}${rpmlibdir}" \
-        -a "$m_name" = "total_solution.manifest" \
-        -a "${INSTALL_COMPLEMENTARY_RPM}" != "1" ]; then
-        # Get the previous installed list
-        rpm --root $target_rootfs --dbpath ${rpmlibdir} \
-            -qa --qf '%{PACKAGEORIGIN} %{BUILDTIME}\n' | sort -u -o $pre_btmanifest
-        # Get the current installed list (based on install/var/lib/rpm)
-        rpm --root $installdir -D "_dbpath $installdir" \
-            -qa --qf '%{PACKAGEORIGIN} %{BUILDTIME}\n' | sort -u -o $cur_btmanifest
-        comm -1 -3 $cur_btmanifest $pre_btmanifest | sed 's#.*/\(.*\)\.rpm .*#\1#' > \
-            $installdir/remove.manifest
-        comm -2 -3 $cur_btmanifest $pre_btmanifest | awk '{print $1}' > \
-            $installdir/incremental.manifest
-
-        # Attempt to remove unwanted pkgs, the scripts(pre, post, etc.) has not
-        # been run by now, so don't have to run them(preun, postun, etc.) when
-        # erase the pkg
-        if [ -s $installdir/remove.manifest ]; then
-            rpm_common_comand --noscripts --nodeps \
-                -e `cat $installdir/remove.manifest`
-        fi
-
-        # Attempt to install the incremental pkgs
-        if [ -s $installdir/incremental.manifest ]; then
-            rpm_common_comand --replacefiles --replacepkgs \
-               -Uvh $installdir/incremental.manifest
-        fi
-    else
-        # Attempt to install
-        rpm_common_comand --replacepkgs -Uhv $manifest
-    fi
-}
-
-process_pkg_list_rpm() {
-	local insttype=$1
-	shift
-	# $@ is special POSIX linear array can not be assigned
-	# to a local variable directly in dash since its separated by
-	# space and dash expands it before assignment
-	# and local x=1 2 3 and not x="1 2 3"
-	local pkgs
-	pkgs="$@"
-	local confbase=${INSTALL_CONFBASE_RPM}
-
-	printf "" > ${target_rootfs}/install/base_archs.pkglist
-	printf "" > ${target_rootfs}/install/ml_archs.pkglist
-
-	for pkg in $pkgs; do
-		echo "Processing $pkg..."
-
-		archvar=base_archs
-		ml_pkg=$pkg
-		for i in ${MULTILIB_PREFIX_LIST} ; do
-				subst=${pkg#${i}-}
-				if [ $subst != $pkg ] ; then
-						ml_pkg=$subst
-						archvar=ml_archs
-						break
-				fi
-		done
-
-		echo $ml_pkg >> ${target_rootfs}/install/$archvar.pkglist
-	done
-
-	local manifestpfx="install"
-	local extraopt=""
-	if [ "$insttype" = "attemptonly" ] ; then
-		manifestpfx="install_attemptonly"
-		extraopt="-i"
-	fi
-
-	rpmresolve $extraopt ${confbase}-base_archs.conf ${target_rootfs}/install/base_archs.pkglist -o ${target_rootfs}/install/${manifestpfx}.manifest
-	if [ -s ${target_rootfs}/install/ml_archs.pkglist ] ; then
-		rpmresolve $extraopt ${confbase}-ml_archs.conf ${target_rootfs}/install/ml_archs.pkglist -o ${target_rootfs}/install/${manifestpfx}_multilib.manifest
-	fi
-}
-
-#
 # Install a bunch of packages using rpm.
-# There are 3 solutions in an image's FRESH generation:
-# 1) initial_solution
-# 2) total_solution
-# 3) COMPLEMENTARY solution
+# There are two solutions in an image's FRESH generation:
+# 1) main package solution
+# 2) complementary solution
 #
-# It is different when incremental image generation is enabled in the
-# SECOND generation:
-# 1) The initial_solution is skipped.
-# 2) The incremental image generation takes action during the total_solution
-#    installation, the previous installed COMPLEMENTARY pkgs usually would be
-#    removed here, the new COMPLEMENTARY ones would be installed in the next
-#    step.
-# 3) The COMPLEMENTARY would always be installed since it is
-#    generated based on the second step's image.
+# It is different when incremental image generation is enabled:
+# 1) The incremental image generation takes action during the main package
+#    installation, the previous installed complementary packages would
+#    usually be removed here, and the new complementary ones would be
+#    installed in the next step.
+# 2) The complementary would always be installed since it is
+#    generated based on the first step's image.
 #
 # the following shell variables needs to be set before calling this func:
 # INSTALL_ROOTFS_RPM - install root dir
 # INSTALL_PLATFORM_RPM - main platform
 # INSTALL_PLATFORM_EXTRA_RPM - extra platform
-# INSTALL_CONFBASE_RPM - configuration file base name
 # INSTALL_PACKAGES_RPM - packages to be installed
 # INSTALL_PACKAGES_ATTEMPTONLY_RPM - packages attemped to be installed only
 # INSTALL_PACKAGES_LINGUAS_RPM - additional packages for uclibc
@@ -275,15 +87,20 @@ process_pkg_list_rpm() {
 
 package_install_internal_rpm () {
 
-	local target_rootfs="${INSTALL_ROOTFS_RPM}"
-	local platform="`echo ${INSTALL_PLATFORM_RPM} | sed 's#-#_#g'`"
-	local platform_extra="`echo ${INSTALL_PLATFORM_EXTRA_RPM} | sed 's#-#_#g'`"
-	local confbase="${INSTALL_CONFBASE_RPM}"
-	local package_to_install="${INSTALL_PACKAGES_RPM}"
-	local package_attemptonly="${INSTALL_PACKAGES_ATTEMPTONLY_RPM}"
-	local package_linguas="${INSTALL_PACKAGES_LINGUAS_RPM}"
-	local providename="${INSTALL_PROVIDENAME_RPM}"
-	local task="${INSTALL_TASK_RPM}"
+	local target_rootfs="$INSTALL_ROOTFS_RPM"
+	local platform="`echo $INSTALL_PLATFORM_RPM | sed 's#-#_#g'`"
+	local platform_extra="`echo $INSTALL_PLATFORM_EXTRA_RPM | sed 's#-#_#g'`"
+	local package_to_install="$INSTALL_PACKAGES_RPM"
+	local package_attemptonly="$INSTALL_PACKAGES_ATTEMPTONLY_RPM"
+	local package_linguas="$INSTALL_PACKAGES_LINGUAS_RPM"
+	local providename="$INSTALL_PROVIDENAME_RPM"
+	local task="$INSTALL_TASK_RPM"
+
+	# Configure internal RPM environment when using Smart
+	export RPM_ETCRPM=${target_rootfs}/etc/rpm
+
+	# Setup temporary directory -- install...
+	mkdir -p ${target_rootfs}/install
 
 	if [ "${INSTALL_COMPLEMENTARY_RPM}" != "1" ] ; then
 		# Setup base system configuration
@@ -306,166 +123,74 @@ package_install_internal_rpm () {
 		# Tell RPM that the "/" directory exist and is available
 		mkdir -p ${target_rootfs}/etc/rpm/sysinfo
 		echo "/" >${target_rootfs}/etc/rpm/sysinfo/Dirnames
+
 		if [ ! -z "$providename" ]; then
 			cat /dev/null > ${target_rootfs}/etc/rpm/sysinfo/Providename
 			for provide in $providename ; do
 				echo $provide >> ${target_rootfs}/etc/rpm/sysinfo/Providename
 			done
 		fi
-	else
-		# We may run through the complementary installs multiple times.  For each time
-		# we should add the previous solution manifest to the full "original" set to
-		# avoid duplicate install steps.
-		echo "Update original solution..."
-		for m in ${target_rootfs}/install/initial_solution.manifest \
-			${target_rootfs}/install/total_solution.manifest; do
-			if [ -s $m ]; then
-				cat $m >> ${target_rootfs}/install/original_solution.manifest
-				rm -f $m
-			fi
-		done
-		sort -u ${target_rootfs}/install/original_solution.manifest -o ${target_rootfs}/install/original_solution.manifest.new
-		mv ${target_rootfs}/install/original_solution.manifest.new ${target_rootfs}/install/original_solution.manifest
-	fi
 
-	# Setup manifest of packages to install...
-	mkdir -p ${target_rootfs}/install
-	rm -f ${target_rootfs}/install/install.manifest
-	rm -f ${target_rootfs}/install/install_multilib.manifest
-	rm -f ${target_rootfs}/install/install_attemptonly.manifest
+		# Configure RPM... we enforce these settings!
+		mkdir -p ${target_rootfs}${rpmlibdir}
+		mkdir -p ${target_rootfs}${rpmlibdir}/log
+		# After change the __db.* cache size, log file will not be generated automatically,
+		# that will raise some warnings, so touch a bare log for rpm write into it.
+		touch ${target_rootfs}${rpmlibdir}/log/log.0000000001
+		if [ ! -e ${target_rootfs}${rpmlibdir}/DB_CONFIG ]; then
+			cat > ${target_rootfs}${rpmlibdir}/DB_CONFIG << EOF
+# ================ Environment
+set_data_dir .
+set_create_dir .
+set_lg_dir ./log
+set_tmp_dir ./tmp
+set_flags db_log_autoremove on
 
-	# Uclibc builds don't provide this stuff...
-	if [ x${TARGET_OS} = "xlinux" ] || [ x${TARGET_OS} = "xlinux-gnueabi" ] ; then
-		if [ ! -z "${package_linguas}" ]; then
-			process_pkg_list_rpm linguas ${package_linguas}
-		fi
-	fi
+# -- thread_count must be >= 8
+set_thread_count 64
 
-	if [ ! -z "${package_to_install}" ]; then
-		process_pkg_list_rpm default ${package_to_install}
-	fi
+# ================ Logging
 
-	# Normal package installation
-
-	# Generate an install solution by doing a --justdb install, then recreate it with
-	# an actual package install!
-	if [ -s ${target_rootfs}/install/install.manifest ]; then
-		echo "# Install manifest padding" >> ${target_rootfs}/install/install.manifest
-		${RPM} --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
-			--predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
-			--root "${target_rootfs}/install" \
-			-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}-base_archs.macro`" \
-			-D "__dbi_txn create nofsync" \
-			-U --justdb --replacepkgs --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
-			${target_rootfs}/install/install.manifest
-	fi
+# ================ Memory Pool
+set_cachesize 0 1048576 0
+set_mp_mmapsize 268435456
 
-	if [ ! -z "${package_attemptonly}" ]; then
-		echo "Adding attempt only packages..."
-		process_pkg_list_rpm attemptonly ${package_attemptonly}
-		cat ${target_rootfs}/install/install_attemptonly.manifest | while read pkg_name
-		do
-			echo "Attempting $pkg_name..." >> "`dirname ${BB_LOGFILE}`/log.do_${task}_attemptonly.${PID}"
-			${RPM} --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
-				--predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
-				--root "${target_rootfs}/install" \
-				-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}.macro`" \
-				-D "__dbi_txn create nofsync private" \
-				-U --justdb --replacepkgs --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
-			$pkg_name >> "`dirname ${BB_LOGFILE}`/log.do_${task}_attemptonly.${PID}" 2>&1 || true
-		done
-	fi
+# ================ Locking
+set_lk_max_locks 16384
+set_lk_max_lockers 16384
+set_lk_max_objects 16384
+ mutex_set_max 163840
 
-	#### Note: 'Recommends' is an arbitrary tag that means _SUGGESTS_ in OE-core..
-	# Add any recommended packages to the image
-	# RPM does not solve for recommended packages because they are optional...
-	# So we query them and tree them like the ATTEMPTONLY packages above...
-	# Change the loop to "1" to run this code...
-	loop=0
-	if [ $loop -eq 1 ]; then
-	 echo "Processing recommended packages..."
-	 cat /dev/null >  ${target_rootfs}/install/recommend.list
-	 while [ $loop -eq 1 ]; do
-		# Dump the full set of recommends...
-		${RPM} --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
-			--predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
-			--root "${target_rootfs}/install" \
-			-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}.macro`" \
-			-D "__dbi_txn create nofsync private" \
-			-qa --qf "[%{RECOMMENDS}\n]" | sort -u > ${target_rootfs}/install/recommend
-		# Did we add more to the list?
-		grep -v -x -F -f ${target_rootfs}/install/recommend.list ${target_rootfs}/install/recommend > ${target_rootfs}/install/recommend.new || true
-		# We don't want to loop unless there is a change to the list!
-		loop=0
-		cat ${target_rootfs}/install/recommend.new | \
-		 while read pkg ; do
-			# Ohh there was a new one, we'll need to loop again...
-			loop=1
-			echo "Processing $pkg..."
-			found=0
-			for archvar in base_archs ml_archs ; do
-				pkg_name=$(resolve_package_rpm ${confbase}-${archvar}.conf ${pkg})
-				if [ -n "$pkg_name" ]; then
-					found=1
-					break
-				fi
-			done
+# ================ Replication
+EOF
+		fi
 
-			if [ $found -eq 0 ]; then
-				echo "Note: Unable to find package $pkg -- suggests"
-				echo "Unable to find package $pkg." >> "`dirname ${BB_LOGFILE}`/log.do_${task}_recommend.${PID}"
-				continue
+		# Create database so that smart doesn't complain (lazy init)
+		rpm --root $target_rootfs --dbpath /var/lib/rpm -qa > /dev/null
+
+		# Configure smart
+		rm -rf ${target_rootfs}/var/lib/smart
+		smart --data-dir=${target_rootfs}/var/lib/smart config --set rpm-root=${target_rootfs}
+		smart --data-dir=${target_rootfs}/var/lib/smart config --set rpm-dbpath=${rpmlibdir}
+		smart --data-dir=${target_rootfs}/var/lib/smart config --set rpm-nolinktos=1
+		smart --data-dir=${target_rootfs}/var/lib/smart config --set rpm-noparentdirs=1
+		smart --data-dir=${target_rootfs}/var/lib/smart config --set rpm-extra-macros._var=${localstatedir}
+		smart --data-dir=${target_rootfs}/var/lib/smart config --set rpm-extra-macros._tmppath=/install/tmp
+		smart --data-dir=${target_rootfs}/var/lib/smart channel --add rpmsys type=rpm-sys -y
+
+		for arch in $platform_extra ; do
+			if [ -d ${DEPLOY_DIR_RPM}/$arch -a ! -e ${target_rootfs}/install/channel.$arch.stamp ] ; then
+				smart --data-dir=${target_rootfs}/var/lib/smart channel --add $arch type=rpm-md type=rpm-md baseurl=${DEPLOY_DIR_RPM}/$arch -y
+				touch ${target_rootfs}/install/channel.$arch.stamp
 			fi
-			echo "Attempting $pkg_name..." >> "`dirname ${BB_LOGFILE}`/log.do_{task}_recommend.${PID}"
-			${RPM} --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
-				--predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
-				--root "${target_rootfs}/install" \
-				-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}.macro`" \
-				-D "__dbi_txn create nofsync private" \
-				-U --justdb --replacepkgs --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
-				$pkg_name >> "`dirname ${BB_LOGFILE}`/log.do_${task}_recommend.${PID}" 2>&1 || true
 		done
-		cat ${target_rootfs}/install/recommend.list ${target_rootfs}/install/recommend.new | sort -u > ${target_rootfs}/install/recommend.new.list
-		mv -f ${target_rootfs}/install/recommend.new.list ${target_rootfs}/install/recommend.list
-		rm ${target_rootfs}/install/recommend ${target_rootfs}/install/recommend.new
-	 done
 	fi
 
-	# Now that we have a solution, pull out a list of what to install...
-	echo "Manifest: ${target_rootfs}/install/install_solution.manifest"
-	${RPM} -D "_dbpath ${target_rootfs}/install" -qa --qf "%{packageorigin}\n" \
-		--root "${target_rootfs}/install" \
-		-D "__dbi_txn create nofsync private" \
-		> ${target_rootfs}/install/install_solution.manifest
-
-	touch ${target_rootfs}/install/install_multilib_solution.manifest
-
-	if [ -s "${target_rootfs}/install/install_multilib.manifest" ]; then
-		# multilib package installation
-		echo "# Install multilib manifest padding" >> ${target_rootfs}/install/install_multilib.manifest
-
-		# Generate an install solution by doing a --justdb install, then recreate it with
-		# an actual package install!
-		${RPM} --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
-			--predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
-			--root "${target_rootfs}/install" \
-			-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}-ml_archs.macro`" \
-			-D "__dbi_txn create nofsync" \
-			-U --justdb --replacepkgs --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
-			${target_rootfs}/install/install_multilib.manifest
-
-		# Now that we have a solution, pull out a list of what to install...
-		echo "Manifest: ${target_rootfs}/install/install_multilib.manifest"
-		${RPM} -D "_dbpath ${target_rootfs}/install" -qa --qf "%{packageorigin}\n" \
-			--root "${target_rootfs}/install" \
-			-D "__dbi_txn create nofsync private" \
-			> ${target_rootfs}/install/install_multilib_solution.manifest
-
+	# Uclibc builds don't provide this stuff...
+	if [ x${TARGET_OS} != "xlinux" ] && [ x${TARGET_OS} != "xlinux-gnueabi" ] ; then
+		package_linguas=""
 	fi
 
-	cat ${target_rootfs}/install/install_solution.manifest \
-	    ${target_rootfs}/install/install_multilib_solution.manifest | sort -u > ${target_rootfs}/install/total_solution.manifest
-
 	# Construct install scriptlet wrapper
 	cat << EOF > ${WORKDIR}/scriptlet_wrapper
 #!/bin/bash
@@ -491,93 +216,17 @@ fi
 EOF
 
 	chmod 0755 ${WORKDIR}/scriptlet_wrapper
+	smart --data-dir=${target_rootfs}/var/lib/smart config --set rpm-extra-macros._cross_scriptlet_wrapper=${WORKDIR}/scriptlet_wrapper
 
-	# Configure RPM... we enforce these settings!
-	mkdir -p ${target_rootfs}${rpmlibdir}
-	mkdir -p ${target_rootfs}${rpmlibdir}/log
-	# After change the __db.* cache size, log file will not be generated automatically,
-	# that will raise some warnings, so touch a bare log for rpm write into it.
-	touch ${target_rootfs}${rpmlibdir}/log/log.0000000001
-	cat > ${target_rootfs}${rpmlibdir}/DB_CONFIG << EOF
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
+	smart --data-dir=${target_rootfs}/var/lib/smart install -y ${package_to_install} ${package_linguas}
 
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
-	if [ "${INSTALL_COMPLEMENTARY_RPM}" = "1" ] ; then
-		# Only install packages not already installed (dependency calculation will
-		# almost certainly have added some that have been)
-		sort -u ${target_rootfs}/install/original_solution.manifest > ${target_rootfs}/install/original_solution_sorted.manifest
-		sort -u ${target_rootfs}/install/total_solution.manifest > ${target_rootfs}/install/total_solution_sorted.manifest
-		comm -2 -3 ${target_rootfs}/install/total_solution_sorted.manifest \
-			${target_rootfs}/install/original_solution_sorted.manifest > \
-			${target_rootfs}/install/diff.manifest
-		mv ${target_rootfs}/install/diff.manifest ${target_rootfs}/install/total_solution.manifest
-	elif [ "${INC_RPM_IMAGE_GEN}" = "1" -a -f "${target_rootfs}/etc/passwd" ]; then
-		echo "Skipping pre install due to existing image"
-	else
-		# RPM is special. It can't handle dependencies and preinstall scripts correctly. Its
-		# probably a feature. The only way to convince rpm to actually run the preinstall scripts
-		# for base-passwd and shadow first before installing packages that depend on these packages
-		# is to do two image installs, installing one set of packages, then the other.
-		rm -f ${target_rootfs}/install/initial_install.manifest
-		echo "Installing base dependencies first (base-passwd, base-files and shadow) since rpm is special"
-		grep /base-passwd-[0-9] ${target_rootfs}/install/total_solution.manifest >> ${target_rootfs}/install/initial_install.manifest || true
-		grep /base-files-[0-9] ${target_rootfs}/install/total_solution.manifest >> ${target_rootfs}/install/initial_install.manifest || true
-		grep /shadow-[0-9] ${target_rootfs}/install/total_solution.manifest >> ${target_rootfs}/install/initial_install.manifest || true
-
-		if [ -s ${target_rootfs}/install/initial_install.manifest ]; then
-			echo "# Initial Install manifest padding..." >> ${target_rootfs}/install/initial_install.manifest
-
-			# Generate an install solution by doing a --justdb install, then recreate it with
-			# an actual package install!
-			mkdir -p ${target_rootfs}/initial
-
-			${RPM} --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
-				--predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
-				--root "${target_rootfs}/install" \
-				-D "_dbpath ${target_rootfs}/initial" -D "`cat ${confbase}.macro`" \
-				-D "__dbi_txn create nofsync" \
-				-U --justdb --replacepkgs --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
-				${target_rootfs}/install/initial_install.manifest
-
-			${RPM} -D "_dbpath ${target_rootfs}/initial" -qa --qf "%{packageorigin}\n" \
-				-D "__dbi_txn create nofsync private" \
-				--root "${target_rootfs}/install" \
-				> ${target_rootfs}/install/initial_solution.manifest
-
-			rpm_update_pkg ${target_rootfs}/install/initial_solution.manifest
-		
-			grep -Fv -f ${target_rootfs}/install/initial_solution.manifest ${target_rootfs}/install/total_solution.manifest > ${target_rootfs}/install/total_solution.manifest.new
-			mv ${target_rootfs}/install/total_solution.manifest.new ${target_rootfs}/install/total_solution.manifest
-		
-			rm -rf ${target_rootfs}/initial
-		fi
+	if [ ! -z "${package_attemptonly}" ]; then
+		echo "Installing attempt only packages..."
+		for pkg_name in ${package_attemptonly} ; do
+			echo "Attempting $pkg_name..." >> "`dirname ${BB_LOGFILE}`/log.do_${task}_attemptonly.${PID}"
+			smart --data-dir=${target_rootfs}/var/lib/smart install -y $pkg_name >> "`dirname ${BB_LOGFILE}`/log.do_${task}_attemptonly.${PID}" 2>&1 || true
+		done
 	fi
-
-	echo "Installing main solution manifest (${target_rootfs}/install/total_solution.manifest)"
-
-	rpm_update_pkg ${target_rootfs}/install/total_solution.manifest
 }
 
 python write_specfile () {
diff --git a/meta/classes/populate_sdk_rpm.bbclass b/meta/classes/populate_sdk_rpm.bbclass
index 1c54049..1d6b1be 100644
--- a/meta/classes/populate_sdk_rpm.bbclass
+++ b/meta/classes/populate_sdk_rpm.bbclass
@@ -1,10 +1,20 @@
+# Smart is python based, so be sure python-native is available to us.
+EXTRANATIVEPATH += "python-native"
+
 do_populate_sdk[depends] += "rpm-native:do_populate_sysroot"
 do_populate_sdk[depends] += "rpmresolve-native:do_populate_sysroot"
+do_populate_sdk[depends] += "python-smartpm-native:do_populate_sysroot"
+
+# Needed for update-alternatives
+do_populate_sdk[depends] += "opkg-native:do_populate_sysroot"
+
+# Creating the repo info in do_rootfs
 do_populate_sdk[depends] += "createrepo-native:do_populate_sysroot"
+
 do_populate_sdk[recrdeptask] += "do_package_write_rpm"
 
 rpmlibdir = "/var/lib/rpm"
-RPMOPTS="--dbpath ${rpmlibdir} --define='_openall_before_chroot 1'"
+RPMOPTS="--dbpath ${rpmlibdir}"
 RPM="rpm ${RPMOPTS}"
 
 do_populate_sdk[lockfiles] += "${DEPLOY_DIR_RPM}/rpm.lock"
@@ -16,58 +26,29 @@ populate_sdk_post_rpm () {
 	# remove lock files
 	rm -f ${target_rootfs}/__db.*
 
-	# Move manifests into the directory with the logs
-	mv ${target_rootfs}/install/*.manifest ${T}/
-
 	# Remove all remaining resolver files
 	rm -rf ${target_rootfs}/install
+	rm -rf ${target_rootfs}/var/lib/smart
 }
 
 populate_sdk_rpm () {
 
 	package_update_index_rpm
-	package_generate_rpm_conf
 
 	## install target ##
 	# This needs to work in the same way as rootfs_rpm.bbclass!
 	#
 	export INSTALL_ROOTFS_RPM="${SDK_OUTPUT}/${SDKTARGETSYSROOT}"
 	export INSTALL_PLATFORM_RPM="${TARGET_ARCH}"
-	export INSTALL_CONFBASE_RPM="${RPMCONF_TARGET_BASE}"
 	export INSTALL_PACKAGES_RPM="${TOOLCHAIN_TARGET_TASK}"
 	export INSTALL_PACKAGES_ATTEMPTONLY_RPM="${TOOLCHAIN_TARGET_TASK_ATTEMPTONLY}"
 	export INSTALL_PACKAGES_LINGUAS_RPM=""
-	export INSTALL_PROVIDENAME_RPM="/bin/sh /bin/bash /usr/bin/env /usr/bin/perl pkgconfig pkgconfig(pkg-config)"
+	export INSTALL_PROVIDENAME_RPM=""
 	export INSTALL_TASK_RPM="populate_sdk-target"
 	export INSTALL_COMPLEMENTARY_RPM=""
 
 	# Setup base system configuration
 	mkdir -p ${INSTALL_ROOTFS_RPM}/etc/rpm/
-	mkdir -p ${INSTALL_ROOTFS_RPM}${rpmlibdir}
-	mkdir -p ${INSTALL_ROOTFS_RPM}${rpmlibdir}/log
-	cat > ${INSTALL_ROOTFS_RPM}${rpmlibdir}/DB_CONFIG << EOF
-# ================ Environment
-set_data_dir            .
-set_create_dir          .
-set_lg_dir              ./log
-set_tmp_dir             ./tmp
-
-# -- thread_count must be >= 8
-set_thread_count        64
-
-# ================ Logging
-
-# ================ Memory Pool
-set_mp_mmapsize         268435456
-
-# ================ Locking
-set_lk_max_locks        16384
-set_lk_max_lockers      16384
-set_lk_max_objects      16384
-mutex_set_max           163840
-
-# ================ Replication
-EOF
 
 	# List must be prefered to least preferred order
 	INSTALL_PLATFORM_EXTRA_RPM=""
@@ -84,7 +65,6 @@ EOF
 	echo "Installing NATIVESDK packages"
 	export INSTALL_ROOTFS_RPM="${SDK_OUTPUT}"
 	export INSTALL_PLATFORM_RPM="${SDK_ARCH}"
-	export INSTALL_CONFBASE_RPM="${RPMCONF_HOST_BASE}"
 	export INSTALL_PACKAGES_RPM="${TOOLCHAIN_HOST_TASK}"
 	export INSTALL_PACKAGES_ATTEMPTONLY_RPM="${TOOLCHAIN_TARGET_HOST_ATTEMPTONLY}"
 	export INSTALL_PACKAGES_LINGUAS_RPM=""
@@ -112,11 +92,6 @@ EOF
 	rm -rf ${SDK_OUTPUT}/etc
 
 	populate_sdk_log_check populate_sdk
-
-	# Workaround so the parser knows we need the resolve_package function!
-	if false ; then
-		resolve_package_rpm foo ${RPMCONF_TARGET_BASE}.conf || true
-	fi
 }
 
 python () {
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 2bb1b08..d0b0d57 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -7,11 +7,15 @@ ROOTFS_PKGMANAGE = "rpm zypper"
 # Add 50Meg of extra space for zypper database space
 IMAGE_ROOTFS_EXTRA_SPACE_append = "${@base_contains("PACKAGE_INSTALL", "zypper", " + 51200", "" ,d)}"
 
+# Smart is python based, so be sure python-native is available to us.
+EXTRANATIVEPATH += "python-native"
+
 # Postinstalls on device are handled within this class at present
 ROOTFS_PKGMANAGE_BOOTSTRAP = ""
 
 do_rootfs[depends] += "rpm-native:do_populate_sysroot"
 do_rootfs[depends] += "rpmresolve-native:do_populate_sysroot"
+do_rootfs[depends] += "python-smartpm-native:do_populate_sysroot"
 
 # Needed for update-alternatives
 do_rootfs[depends] += "opkg-native:do_populate_sysroot"
@@ -21,8 +25,8 @@ do_rootfs[depends] += "createrepo-native:do_populate_sysroot"
 
 do_rootfs[recrdeptask] += "do_package_write_rpm"
 
-RPM_PREPROCESS_COMMANDS = "package_update_index_rpm; package_generate_rpm_conf; "
-RPM_POSTPROCESS_COMMANDS = ""
+RPM_PREPROCESS_COMMANDS = "package_update_index_rpm; "
+RPM_POSTPROCESS_COMMANDS = "rpm_setup_smart_target_config; "
 
 # 
 # Allow distributions to alter when [postponed] package install scripts are run
@@ -32,7 +36,7 @@ POSTINSTALL_INITPOSITION ?= "98"
 rpmlibdir = "/var/lib/rpm"
 opkglibdir = "${localstatedir}/lib/opkg"
 
-RPMOPTS="--dbpath ${rpmlibdir} --define='_openall_before_chroot 1'"
+RPMOPTS="--dbpath ${rpmlibdir}"
 RPM="rpm ${RPMOPTS}"
 
 # RPM doesn't work with multiple rootfs generation at once due to collisions in the use of files 
@@ -42,13 +46,10 @@ do_rootfs[lockfiles] += "${DEPLOY_DIR_RPM}/rpm.lock"
 fakeroot rootfs_rpm_do_rootfs () {
 	${RPM_PREPROCESS_COMMANDS}
 
-	#createrepo "${DEPLOY_DIR_RPM}"
-
 	# install packages
 	# This needs to work in the same way as populate_sdk_rpm.bbclass!
 	export INSTALL_ROOTFS_RPM="${IMAGE_ROOTFS}"
 	export INSTALL_PLATFORM_RPM="${TARGET_ARCH}"
-	export INSTALL_CONFBASE_RPM="${RPMCONF_TARGET_BASE}"
 	export INSTALL_PACKAGES_RPM="${PACKAGE_INSTALL}"
 	export INSTALL_PACKAGES_ATTEMPTONLY_RPM="${PACKAGE_INSTALL_ATTEMPTONLY}"
 	export INSTALL_PACKAGES_LINGUAS_RPM="${LINGUAS_INSTALL}"
@@ -114,18 +115,10 @@ EOF
 	# remove lock files
 	rm -f ${IMAGE_ROOTFS}${rpmlibdir}/__db.*
 
-	# Move manifests into the directory with the logs
-	mv ${IMAGE_ROOTFS}/install/*.manifest ${T}/
-
 	# Remove all remaining resolver files
 	rm -rf ${IMAGE_ROOTFS}/install
 
 	log_check rootfs
-
-	# Workaround so the parser knows we need the resolve_package function!
-	if false ; then
-		resolve_package_rpm foo ${RPMCONF_TARGET_BASE}.conf || true
-	fi
 }
 
 remove_packaging_data_files() {
@@ -135,10 +128,19 @@ remove_packaging_data_files() {
 	mkdir -p $t
 	mv ${IMAGE_ROOTFS}${rpmlibdir} $t
 	rm -rf ${IMAGE_ROOTFS}${opkglibdir}
+	rm -rf ${IMAGE_ROOTFS}/var/lib/smart
+}
+
+rpm_setup_smart_target_config() {
+	# Set up smart configuration for the target
+	rm -rf ${IMAGE_ROOTFS}/var/lib/smart
+	smart --data-dir=${IMAGE_ROOTFS}/var/lib/smart channel --add rpmsys type=rpm-sys -y
+	smart --data-dir=${IMAGE_ROOTFS}/var/lib/smart config --set rpm-nolinktos=1
+	smart --data-dir=${IMAGE_ROOTFS}/var/lib/smart config --set rpm-noparentdirs=1
+	rm -f ${IMAGE_ROOTFS}/var/lib/smart/config.old
 }
 
-RPM_QUERY_CMD = '${RPM} --root $INSTALL_ROOTFS_RPM -D "_dbpath ${rpmlibdir}" \
-		-D "__dbi_txn create nofsync private"'
+RPM_QUERY_CMD = '${RPM} --root $INSTALL_ROOTFS_RPM -D "_dbpath ${rpmlibdir}"'
 
 list_installed_packages() {
 	GET_LIST=$(${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{ARCH} %{PACKAGEORIGIN} %{Platform}\n]")
-- 
1.7.10.4



