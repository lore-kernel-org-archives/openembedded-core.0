Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1U2Igq-0005xY-M1
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 10:50:20 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r149YQBB010206
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Feb 2013 01:34:26 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.131) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 4 Feb 2013 01:34:25 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Feb 2013 17:34:16 +0800
Message-ID: <b5205643903edcac70fb680d2620bd5bc050df96.1359968242.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1359968242.git.hongxu.jia@windriver.com>
References: <cover.1359968242.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 5/5] package_deb.bbclass:support incremental deb image generation
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
X-List-Received-Date: Mon, 04 Feb 2013 09:50:22 -0000
Content-Type: text/plain

1. Support incremental deb image generation, here is the design:
1) Update packages index file in ${DEPLOY_DIR_DEB}, and figure out newly added
packages at current image session comparing with previous image session.

2) Config apt

3) If not support incremental deb image generation
   1, Install packages additional for uclibc, normal, attempt only.

   2, Dump solution manifest which lists all the *to be installed* packages
   including 1, and the automatically installed according to the dependencies.

4) else if support incremental deb image generation
   1, Collect *to be installed* packages which include additional for uclibc,
   normal, attempt only and don't include automatically installed by RDEPENDS.

   2, Dump solution manifest which lists all the *to be installed* packages
   including 1, and the automatically installed according to the dependencies.

   3, Figure out unused packages, they are in the installed manifest and not in
   the solution manifest.

   4, Remove unused packages.

   5, Figure out existed packages, they are in both the solution manifest and the
   installed manifest.

   6, Figure out updated packages, they belong to both the existed packages
   and newly added packages.

   7, Reinstall updated packages.

5) Change solution manifest to installed manifest for next image session.

6) Back up dpkg database for next image session.

2. Change apt config dir to let the config not be used by other tasks's apt.

3. The params in deb package control don't allow character `_', so change the
arch's `_' to `-' in it.

4. Remove duplicate arch while using dpkg-scanpackages to update the packages
index files.

5. Run `apt-get -f install' to correct packages broken dependencies to fix
meta-toolchain-sdk fail on do_populate_sdk.

6. Enhance the way of invoking `dpkg-scanpackages' to save the wasted time.

[YOCTO #1893]
[YOCTO #3721]
[YOCTO #3720]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/package_deb.bbclass |  390 ++++++++++++++++++++++++++++++++++----
 1 file changed, 358 insertions(+), 32 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 5740948..c36d5d5 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -78,14 +78,220 @@ package_update_index_deb () {
 		fi
 	done
 
+	# Remove duplicate arch
+	debarchs=`echo $debarchs | sed "s/ /\n/g" | sort -u | xargs echo`
+	echo "debarchs=$debarchs"
 	for arch in $debarchs; do
 		if [ ! -d ${DEPLOY_DIR_DEB}/$arch ]; then
 			continue;
 		fi
 		cd ${DEPLOY_DIR_DEB}/$arch
-		dpkg-scanpackages . | gzip > Packages.gz
-		echo "Label: $arch" > Release
+
+		if [ "${INC_DEB_IMAGE_GEN}" = "1" ]; then
+			# It takes a long time to run dpkg-scanpackages, so if packages
+			# have no change with previous image, there is no need to run
+			# dpkg-scanpackages.
+			> ${T}/diff_pkglist_$arch
+			dump_diff_pkg_manifest_deb . $arch ${T}/diff_pkglist_$arch
+			if [ -s ${T}/diff_pkglist_$arch ]; then
+				dpkg-scanpackages . | gzip > Packages.gz
+				echo "Label: $arch" > Release
+			else
+				echo "NOTE: Packages in $arch have no change"
+			fi
+		else
+			dpkg-scanpackages . | gzip > Packages.gz
+			echo "Label: $arch" > Release
+		fi
 	done
+
+	# Figure out newly added deb packages at current image session
+	> ${T}/deb_index_add
+	dump_newly_added_pkg_manifest_deb "$debarchs" "${T}/deb_index_add"
+}
+
+#
+# Dump a manifest which contains a bunch of deb packages that are newly added
+# at the current image session.
+# $1: Input, the package archs.
+# $2: Output, the manifest that lists all newly added packages.
+dump_newly_added_pkg_manifest_deb () {
+	local packagearchs="$1"
+	local newly_added_manifest="$2"
+	local old_pwd=$(pwd)
+
+	> ${T}/deb_index_cur
+
+	# The format of deb_index_cur:
+	# `PackageFileName__LastModificationTime'
+	# Such as:
+	# "xtscal-dev_0.6.3-r13_i586.deb__1358835142"
+	for pkgarch in $packagearchs; do
+		if [ -d ${DEPLOY_DIR_DEB}/$pkgarch ]; then
+			cd ${DEPLOY_DIR_DEB}/$pkgarch
+
+			# Ignore error if deb doesn't exist in dir.
+			stat -c '%n__%Y' *.deb >> ${T}/deb_index_cur 2>/dev/null || true
+		fi
+	done
+
+	sort -u ${T}/deb_index_cur -o ${T}/deb_index_cur
+
+	# Deb incremental generation is based on the previous image
+	if [ "${INC_DEB_IMAGE_GEN}" = "1" -a -e ${T}/deb_index_prev ]; then
+		# Dump the newly added packages.
+		comm -2 -3 ${T}/deb_index_cur ${T}/deb_index_prev | awk -F'_' \
+			'{print $1}' | sort -u -o $newly_added_manifest
+	fi
+
+	# Back up for the next image session
+	mv -f ${T}/deb_index_cur ${T}/deb_index_prev
+
+	cd $old_pwd
+}
+
+#
+# Dump a manifest which contains packages that are different between the
+# current image session and the previous image session.
+# $1 Input, dir where the package located.
+# $2 Input, package's arch
+# $3 Output, the manifest that list all different packages.
+dump_diff_pkg_manifest_deb () {
+	pkg_dir=$1
+	pkg_arch=$2
+	diff_manifest=$3
+
+	local old_pwd=$(pwd)
+	local pkgs_index_cur=${T}/deb_pkg_index/${pkg_arch}_cur
+	local pkgs_index=${T}/deb_pkg_index/${pkg_arch}
+
+	cd $pkg_dir/
+	mkdir -p ${T}/deb_pkg_index
+
+	# The format of pkgs_index_cur:
+	# `PackageFileName__LastModificationTime'
+	# Such as:
+	# "xtscal-dev_0.6.3-r13_i586.deb__1358835142"
+	# Ignore error if deb doesn't exist in pkg_dir.
+	stat -c '%n__%Y' *.deb > $pkgs_index_cur 2>/dev/null || true
+
+	if [ -s $pkgs_index ]; then
+		# Dump packages that are different between $pkgs_index_cur and $pkgs_index
+		comm -3 $pkgs_index_cur $pkgs_index > $diff_manifest
+	else
+		cp -f $pkgs_index_cur $diff_manifest
+	fi
+
+	# Back up for the next image session
+	mv $pkgs_index_cur $pkgs_index
+
+	cd $old_pwd
+}
+
+#
+# Dump a manifest which contains a bunch of deb packages that will be installed in
+# rootfs.
+# $1: Input, the rootfs dir, where the opkg database located and packages installed.
+# $2: Input, packages to be installed, not include automatically installed.
+# $3: Output, the solution manifest which lists all the *to be installed* packages
+#            including the needed to be installed ($2) and the automatically installed
+#            according to the dependencies.
+package_dump_solution_manifest_deb () {
+	local target_rootfs="$1"
+	local packages_list="$2"
+	local deb_solution_manifest="$3"
+
+	# Back up and clear dpkg database in order to cheat dpkg that there is no package
+	# has been installed in rootfs, so dpkg will install from zero.
+	mv ${target_rootfs}/var/lib/dpkg/status ${target_rootfs}/var/lib/dpkg/status.bak
+	mv ${target_rootfs}/var/lib/dpkg/available ${target_rootfs}/var/lib/dpkg/available.bak
+	> ${target_rootfs}/var/lib/dpkg/status
+	> ${target_rootfs}/var/lib/dpkg/available
+
+	> ${deb_solution_manifest}
+	if [ "${packages_list}" != "" ]; then
+		# Simulate install package from zero, it will automatically search the
+		# dependency.
+		apt-get install -s ${packages_list} >> ${deb_solution_manifest}
+		if [ $? -ne 0 ]; then
+			echo "ERROR: apt-get -s ${packages_list} failed"
+			exit 1
+		fi
+	fi
+
+	# Such as "Inst bash (4.2-r6 i586:localhost)" --> "bash"
+	sed -i -n -e 's/^Inst \(.*\) (.*$/\1/p' ${deb_solution_manifest}
+
+	sort -u ${deb_solution_manifest} -o ${deb_solution_manifest}
+
+	# Restore dpkg database.
+	mv ${target_rootfs}/var/lib/dpkg/status.bak ${target_rootfs}/var/lib/dpkg/status
+	mv ${target_rootfs}/var/lib/dpkg/available.bak ${target_rootfs}/var/lib/dpkg/available
+}
+
+#
+# Remove unused packages by comparing the two manifest ($1 and $2).
+# $1: Input, solution manifest
+# $2: Input, installed manifest
+package_remove_unused_deb () {
+	local deb_solution_manifest=$1
+	local deb_installed_manifest=$2
+
+	# Figure out unused packages, they are in the installed manifest and not in
+	# the solution manifest.
+	package_to_remove=$(comm -1 -3 ${deb_solution_manifest} \
+				${deb_installed_manifest})
+
+	for i in ${package_to_remove}; do
+		echo "NOTE: Removing $i"
+
+		# The apt is an essential package, need interaction.
+		if [ "$i" = "apt" ]; then
+			echo 'Yes, do as I say!' | apt-get purge $i --force-yes \
+				--allow-unauthenticated
+		else
+			apt-get purge $i --force-yes --allow-unauthenticated
+		fi
+
+		if [ $? -ne 0 ]; then
+			echo "ERROR: perge $i failed"
+			exit 1
+		fi
+	done
+}
+
+#
+# Reinstall packages which have been updated at this image session.
+# The update means the package is in installed manifest and in solution
+# manifest and also in the newly added packages manifest.
+#
+# $1: Input, solution manifest
+# $2: Input, installed manifest
+package_reinstall_updated_deb () {
+	local deb_solution_manifest=$1
+	local deb_installed_manifest=$2
+	local deb_exist_manifest=${T}/pkgs_index_exist
+
+	> $deb_exist_manifest
+
+	# Figure out existed packages, they are in both the solution manifest
+	# and the installed manifest.
+	comm -1 -2 $deb_solution_manifest $deb_installed_manifest | \
+		sort -u > $deb_exist_manifest
+
+	# Figure out updated packages, they belong to both the existed
+	# packages and newly added packages
+	reinstall_list=`comm -1 -2 $deb_exist_manifest ${T}/deb_index_add | xargs echo`
+
+	if [ "${reinstall_list}" != "" ]; then
+		echo "NOTE: Updating ${reinstall_list}"
+		apt-get install --force-yes --allow-unauthenticated --reinstall ${reinstall_list}
+		if [ $? -ne 0 ]; then
+			echo "ERROR: reinstall ${reinstall_list} failed"
+			exit 1
+		fi
+	fi
+	rm -f $deb_exist_manifest
 }
 
 #
@@ -104,13 +310,31 @@ package_install_internal_deb () {
 	local target_rootfs="${INSTALL_ROOTFS_DEB}"
 	local dpkg_arch="${INSTALL_BASEARCH_DEB}"
 	local archs="${INSTALL_ARCHS_DEB}"
-	local package_to_install="${INSTALL_PACKAGES_NORMAL_DEB}"
+	local package_normal="${INSTALL_PACKAGES_NORMAL_DEB}"
 	local package_attemptonly="${INSTALL_PACKAGES_ATTEMPTONLY_DEB}"
 	local package_linguas="${INSTALL_PACKAGES_LINGUAS_DEB}"
 	local task="${INSTALL_TASK_DEB}"
+	local package_all=""
+
+	# The deb_installed_manifest is used to list the packages which has
+	# been installed by the previous deb image.
+	local deb_installed_manifest="${T}/deb_${task}_installed.manifest"
+
+	# The deb_solution_manifest is used to list the packages which should
+	# be installed just right now.
+	local deb_solution_manifest="${T}/deb_${task}_solution.manifest"
 
-	rm -f ${STAGING_ETCDIR_NATIVE}/apt/sources.list.rev
-	rm -f ${STAGING_ETCDIR_NATIVE}/apt/preferences
+	# Save apt config files in "${T}/${task}_apt". The dir is task related in
+	# order to make sure the files not be used by other tasks at the same time.
+	local apt_conf_dir="${T}/${task}_apt"
+
+	# The dpkg_dir is used to keep previous image's dpkg database.
+	local dpkg_dir="${T}/dpkg${INSTALL_ROOTFS_DEB}"
+	mkdir -p ${dpkg_dir}
+
+	mkdir -p ${apt_conf_dir}
+	> ${apt_conf_dir}/sources.list.rev
+	> ${apt_conf_dir}/preferences
 
 	priority=1
 	for arch in $archs; do
@@ -118,68 +342,165 @@ package_install_internal_deb () {
 			continue;
 		fi
 
-		echo "deb file:${DEPLOY_DIR_DEB}/$arch/ ./" >> ${STAGING_ETCDIR_NATIVE}/apt/sources.list.rev
+		echo "deb file:${DEPLOY_DIR_DEB}/$arch/ ./" >> ${apt_conf_dir}/sources.list.rev
 		(echo "Package: *"
 		echo "Pin: release l=$arch"
 		echo "Pin-Priority: $(expr 800 + $priority)"
-		echo) >> ${STAGING_ETCDIR_NATIVE}/apt/preferences
+		echo) >> ${apt_conf_dir}/preferences
 		priority=$(expr $priority + 5)
 	done
 
-	tac ${STAGING_ETCDIR_NATIVE}/apt/sources.list.rev > ${STAGING_ETCDIR_NATIVE}/apt/sources.list
+	tac ${apt_conf_dir}/sources.list.rev > ${apt_conf_dir}/sources.list
+
+	# Check if apt's config is valid
+	local valid_aptconfig=`grep -c "#APT_CONF_DIR#" ${STAGING_ETCDIR_NATIVE}/apt/apt.conf.sample`
+	if [ $valid_aptconfig = "0" ]; then
+		echo "ERROR: Apt config is invalid, please recompile apt-native first"
+		exit 1
+	fi
 
+	# The params in deb package control don't allow character `_', so
+	# change the arch's `_' to `-' in it.
+	dpkg_arch=`echo ${dpkg_arch} | sed 's/_/-/'`
 	cat "${STAGING_ETCDIR_NATIVE}/apt/apt.conf.sample" \
 		| sed -e "s#Architecture \".*\";#Architecture \"${dpkg_arch}\";#" \
 		| sed -e "s:#ROOTFS#:${target_rootfs}:g" \
-		> "${STAGING_ETCDIR_NATIVE}/apt/apt-${task}.conf"
-
-	export APT_CONFIG="${STAGING_ETCDIR_NATIVE}/apt/apt-${task}.conf"
+		| sed -e "s:#APT_CONF_DIR#:${apt_conf_dir}:g" \
+		> "${apt_conf_dir}/apt-${task}.conf"
+	export APT_CONFIG="${apt_conf_dir}/apt-${task}.conf"
 
 	mkdir -p ${target_rootfs}/var/lib/dpkg/info
 	mkdir -p ${target_rootfs}/var/lib/dpkg/updates
 
-	> ${target_rootfs}/var/lib/dpkg/status
-	> ${target_rootfs}/var/lib/dpkg/available
+	# Generate image from zero
+	if [ "${INC_DEB_IMAGE_GEN}" != "1" -o ! -e "${deb_installed_manifest}" ]; then
+		echo "NOTE: Init dpkg database"
+		> ${target_rootfs}/var/lib/dpkg/status
+		> ${target_rootfs}/var/lib/dpkg/available
+
+		apt-get update
+		if [ $? -ne 0 ]; then
+			echo "ERROR: apt-get update failed"
+			exit 1
+		fi
+
+		# Uclibc builds don't provide this stuff..
+		if [ x${TARGET_OS} = "xlinux" ] || [ x${TARGET_OS} = "xlinux-gnueabi" ] ; then
+			if [ ! -z "${package_linguas}" ]; then
+				package_all="${package_all} glibc-localedata-i18n ${package_linguas}"
+				echo "NOTE: Installing  glibc-localedata-i18n"
+				apt-get install glibc-localedata-i18n --force-yes --allow-unauthenticated
+				if [ $? -ne 0 ]; then
+					echo "ERROR: Install glibc-localedata-i18n failed"
+					exit 1
+				fi
 
-	apt-get update
+				for i in ${package_linguas}; do
+					echo "NOTE: Installing linguas $i"
+					apt-get install $i --force-yes --allow-unauthenticated
+					if [ $? -ne 0 ]; then
+						echo "ERROR: Install $i failed"
+						exit 1
+					fi
+				done
+			fi
+		fi
 
-	# Uclibc builds don't provide this stuff..
-	if [ x${TARGET_OS} = "xlinux" ] || [ x${TARGET_OS} = "xlinux-gnueabi" ] ; then
-		if [ ! -z "${package_linguas}" ]; then
-			apt-get install glibc-localedata-i18n --force-yes --allow-unauthenticated
+		# Normal install
+		package_all="${package_all} ${package_normal}"
+		for i in ${package_normal}; do
+			echo "NOTE: Installing normal $i"
+			apt-get install $i --force-yes --allow-unauthenticated
 			if [ $? -ne 0 ]; then
+				echo "ERROR: Install $i failed"
 				exit 1
 			fi
-			for i in ${package_linguas}; do
-				apt-get install $i --force-yes --allow-unauthenticated
-				if [ $? -ne 0 ]; then
-					exit 1
-				fi
+
+			# Correct the broken dependencies to fix the install error,
+			# such as installing avahi need to do so.
+			apt-get install -f
+			if [ $? -ne 0 ]; then
+				echo "ERROR: apt-get intall -f failed"
+				exit 1
+			fi
+		done
+
+		# Attempt install
+		rm -f `dirname ${BB_LOGFILE}`/log.do_${task}-attemptonly.${PID}
+		if [ ! -z "${package_attemptonly}" ]; then
+			package_all="${package_all} ${package_attemptonly}"
+			for i in ${package_attemptonly}; do
+				echo "NOTE: Installing attemptonly $i"
+				apt-get install $i --force-yes --allow-unauthenticated >> \
+					`dirname ${BB_LOGFILE}`/log.do_${task}-attemptonly.${PID} 2>&1 || true
 			done
 		fi
-	fi
 
-	# normal install
-	for i in ${package_to_install}; do
-		apt-get install $i --force-yes --allow-unauthenticated
+		# Dump solution manifest which could be used at next incremental image session.
+		package_all=`echo $package_all | sed "s/ /\n/g" | sort -u | xargs echo`
+		package_dump_solution_manifest_deb "${target_rootfs}" "${package_all}" "${deb_solution_manifest}"
+
+	# Deb incremental generation is based on the previous image
+	elif [ "${INC_DEB_IMAGE_GEN}" = "1" -a -e ${deb_installed_manifest} ]; then
+		echo "Restore previous dpkg database"
+		cp -fr ${dpkg_dir}/* ${target_rootfs}/var/lib/dpkg/
+
+		apt-get update
 		if [ $? -ne 0 ]; then
+			echo "ERROR: apt-get update failed"
 			exit 1
 		fi
-	done
 
-	rm -f `dirname ${BB_LOGFILE}`/log.do_${task}-attemptonly.${PID}
-	if [ ! -z "${package_attemptonly}" ]; then
-		for i in ${package_attemptonly}; do
-			apt-get install $i --force-yes --allow-unauthenticated >> `dirname ${BB_LOGFILE}`/log.do_${task}-attemptonly.${PID} 2>&1 || true
+		# Uclibc builds don't provide this stuff..
+		if [ x${TARGET_OS} = "xlinux" ] || [ x${TARGET_OS} = "xlinux-gnueabi" ] ; then
+			if [ ! -z "${package_linguas}" ]; then
+				package_all="${package_all} glibc-localedata-i18n ${package_linguas}"
+			fi
+		fi
+
+		# Normal install
+		package_all="${package_all} ${package_normal}"
+
+		# Attempt install
+		if [ ! -z "${package_attemptonly}" ]; then
+			package_all="${package_all} ${package_attemptonly}"
+		fi
+
+		package_all=`echo $package_all | sed "s/ /\n/g" | sort -u | xargs echo`
+		package_dump_solution_manifest_deb "${target_rootfs}" "${package_all}" "${deb_solution_manifest}"
+
+		# Remove unused packages by comparing the two manifests.
+		package_remove_unused_deb "${deb_solution_manifest}" "${deb_installed_manifest}"
+
+		# Update existed packages by comparing the two manifests.
+		package_reinstall_updated_deb "${deb_solution_manifest}" "${deb_installed_manifest}"
+
+		echo "NOTE: Atempt to correct broken dependencies"
+		for i in ${package_all}; do
+			echo "NOTE: Installing $i again"
+			apt-get install $i -f --force-yes --allow-unauthenticated
+			if [ $? -ne 0 ]; then
+				echo "ERROR: Install $i failed"
+				exit 1
+			fi
 		done
+
+		# Remove Config-version
+		sed -i -e "/^Config-Version:/d" ${target_rootfs}/var/lib/dpkg/status
 	fi
 
+	# Change solution manifest to installed manifest for next image session.
+	mv ${deb_solution_manifest} ${deb_installed_manifest}
+
 	find ${target_rootfs} -name \*.dpkg-new | for i in `cat`; do
 		mv $i `echo $i | sed -e's,\.dpkg-new$,,'`
 	done
 
 	# Mark all packages installed
 	sed -i -e "s/Status: install ok unpacked/Status: install ok installed/;" ${target_rootfs}/var/lib/dpkg/status
+
+	# Back up dpkg database for the next image session.
+	cp -rf ${target_rootfs}/var/lib/dpkg/* ${dpkg_dir}
 }
 
 deb_log_check() {
@@ -305,6 +626,11 @@ python do_package_deb () {
                     raise KeyError(f)
                 if i == 'DPKG_ARCH' and d.getVar('PACKAGE_ARCH', True) == 'all':
                     data = 'all'
+                elif i == 'PACKAGE_ARCH' or i == 'DPKG_ARCH':
+                    # The params in deb package control don't allow character
+                    # `_', so change the arch's `_' to `-'. Such as `x86_64'
+                    # -->`x86-64'
+                    data = data.replace('_', '-')
                 l2.append(data)
             return l2
 
-- 
1.7.10.4



