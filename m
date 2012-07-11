Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sowll-0000cG-Uv
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jul 2012 15:15:54 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Jul 2012 06:04:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="164251590"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.253])
	by orsmga001.jf.intel.com with ESMTP; 11 Jul 2012 06:04:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Jul 2012 14:04:33 +0100
Message-Id: <a865d3cc214fe68b4efe4d1a5355bf422dfcb0fd.1342011575.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1342011575.git.paul.eggleton@linux.intel.com>
References: <cover.1342011575.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1342011575.git.paul.eggleton@linux.intel.com>
References: <cover.1342011575.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] Rework installation of dev, dbg, doc, and locale packages
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
X-List-Received-Date: Wed, 11 Jul 2012 13:15:55 -0000

Use a similar mechanism that was previously used to install locales at
rootfs generation time to install other "complementary" packages (e.g.
*-dev packages) - i.e. install all of the explicitly requested packages
and their dependencies, then get a list of the packages that were
installed, and use that list to install the complementary packages. This
has been implemented by using a list of globs which should make it
easier to extend in future.

The previous locale package installation code assumed that the locale
packages did not have any dependencies that were not already installed;
now that we are installing non-locale packages this is no longer
correct. In practice only the rpm backend actually made use of this
assumption, so it needed to be changed to call into the existing package
backend code to do the complementary package installation rather than
calling rpm directly.

This fixes the doc-pkgs IMAGE_FEATURES feature to work correctly, and
also ensures that all dev/dbg packages get installed for
dev-pkgs/dbg-pkgs respectively even if the dependency chains between
those packages was not ensuring that already.

The code has also been adapted to work correctly with the new
SDK-from-image functionality. To that end, an SDKIMAGE_FEATURES variable
has been added to allow specifying what extra image features should go
into the SDK (extra, because by virtue of installing all of the packages
in the image into the target part of the SDK, we already include all of
IMAGE_FEATURES) with a default value of "dev-pkgs dbg-pkgs".

Fixes [YOCTO #2614].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/image.bbclass            |   85 ++++++++++++++++++++++-----------
 meta/classes/package_rpm.bbclass      |   74 ++++++++++++++++------------
 meta/classes/populate_sdk_deb.bbclass |    2 +
 meta/classes/populate_sdk_ipk.bbclass |    2 +
 meta/classes/populate_sdk_rpm.bbclass |    3 ++
 meta/classes/rootfs_deb.bbclass       |   12 +++--
 meta/classes/rootfs_ipk.bbclass       |   16 ++++---
 meta/classes/rootfs_rpm.bbclass       |   29 ++++++-----
 8 files changed, 140 insertions(+), 83 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index f1b829f..4ca3430 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -6,7 +6,8 @@ inherit imagetest-${IMAGETEST}
 inherit populate_sdk_base
 
 TOOLCHAIN_TARGET_TASK += "${PACKAGE_INSTALL}"
-TOOLCHAIN_TARGET_TASK_ATTEMPTONLY += "${PACKAGE_INSTALL_ATTEMPTONLY} ${PACKAGE_GROUP_dev-pkgs} ${PACKAGE_GROUP_dbg-pkgs}"
+TOOLCHAIN_TARGET_TASK_ATTEMPTONLY += "${PACKAGE_INSTALL_ATTEMPTONLY}"
+POPULATE_SDK_POST_TARGET_COMMAND += "rootfs_install_complementary populate_sdk; "
 
 inherit gzipnative
 
@@ -38,25 +39,23 @@ def normal_groups(d):
     features = set(oe.data.typed_value('IMAGE_FEATURES', d))
     return features.difference(extras)
 
-def normal_pkgs_to_install(d):
-    import oe.packagedata
-
-    to_install = oe.data.typed_value('IMAGE_INSTALL', d)
-    features = normal_groups(d)
-    required = list(oe.packagegroup.required_packages(features, d))
-    optional = list(oe.packagegroup.optional_packages(features, d))
-    all_packages = to_install + required + optional
-
-    recipes = filter(None, [oe.packagedata.recipename(pkg, d) for pkg in all_packages])
-
-    return all_packages + recipes
-
-PACKAGE_GROUP_dbg-pkgs = "${@' '.join('%s-dbg' % pkg for pkg in normal_pkgs_to_install(d))}"
-PACKAGE_GROUP_dbg-pkgs[optional] = "1"
-PACKAGE_GROUP_dev-pkgs = "${@' '.join('%s-dev' % pkg for pkg in normal_pkgs_to_install(d))}"
-PACKAGE_GROUP_dev-pkgs[optional] = "1"
-PACKAGE_GROUP_doc-pkgs = "${@' '.join('%s-doc' % pkg for pkg in normal_pkgs_to_install(d))}"
-PACKAGE_GROUP_doc-pkgs[optional] = "1"
+# Wildcards specifying complementary packages to install for every package that has been explicitly
+# installed into the rootfs
+def complementary_globs(featurevar, d):
+    globs = []
+    features = set((d.getVar(featurevar, True) or '').split())
+    for feature in features:
+        if feature == 'dev-pkgs':
+            globs.append('*-dev')
+        elif feature == 'doc-pkgs':
+            globs.append('*-doc')
+        elif feature == 'dbg-pkgs':
+            globs.append('*-dbg')
+    return ' '.join(globs)
+
+IMAGE_INSTALL_COMPLEMENTARY = '${@complementary_globs("IMAGE_FEATURES", d)}'
+SDKIMAGE_FEATURES ??= "dev-pkgs dbg-pkgs"
+SDKIMAGE_INSTALL_COMPLEMENTARY = '${@complementary_globs("SDKIMAGE_FEATURES", d)}'
 
 # "export IMAGE_BASENAME" not supported at this time
 IMAGE_INSTALL ?= ""
@@ -306,16 +305,43 @@ get_split_linguas() {
     done | sort | uniq
 }
 
-rootfs_install_all_locales() {
-    # Generate list of installed packages for which additional locale packages might be available
-    INSTALLED_PACKAGES=`list_installed_packages | egrep -v -- "(-locale-|^locale-base-|-dev$|-doc$|^kernel|^glibc|^ttf|^task|^perl|^python)"`
+rootfs_install_complementary() {
+    # Install complementary packages based upon the list of currently installed packages
+    # e.g. locales, *-dev, *-dbg, etc. This will only attempt to install these packages,
+    # if they don't exist then no error will occur.
+    # Note: every backend needs to call this function explicitly after the normal
+    # package installation
+
+    # Get list of installed packages
+    INSTALLED_PACKAGES=`list_installed_packages`
+
+    if [ "$1" != "populate_sdk" ] ; then
+        # Generate list of installed packages for which locale packages might be available
+        INSTALLED_LOCALISABLE=`echo "$INSTALLED_PACKAGES" | egrep -v -- "(-locale-|^locale-base-|-dev$|-doc$|^kernel|^glibc|^ttf|^task|^perl|^python)"`
+        # Generate a list of locale packages that exist
+        SPLIT_LINGUAS=`get_split_linguas`
+        PACKAGES_TO_INSTALL=""
+        for lang in $SPLIT_LINGUAS; do
+            for pkg in $INSTALLED_LOCALISABLE; do
+                existing_pkg=`rootfs_check_package_exists $pkg-locale-$lang`
+                if [ "$existing_pkg" != "" ]; then
+                    PACKAGES_TO_INSTALL="$PACKAGES_TO_INSTALL $existing_pkg"
+                fi
+            done
+        done
+    fi
 
-    # Generate a list of locale packages that exist
-    SPLIT_LINGUAS=`get_split_linguas`
-    PACKAGES_TO_INSTALL=""
-    for lang in $SPLIT_LINGUAS; do
-        for pkg in $INSTALLED_PACKAGES; do
-            existing_pkg=`rootfs_check_package_exists $pkg-locale-$lang`
+    # Apply the globs to all the packages currently installed
+    if [ "$1" = "populate_sdk" ] ; then
+        GLOBS="${SDKIMAGE_INSTALL_COMPLEMENTARY}"
+    else
+        GLOBS="${IMAGE_INSTALL_COMPLEMENTARY}"
+    fi
+    GLOB_ITEMS=`echo "$GLOBS" | sed -e 's/\s/\n/g' -e 's/\*/\\\1/g'`
+    for glob in $GLOB_ITEMS; do
+        GLOB_PACKAGES=`echo "$INSTALLED_PACKAGES" | sed "s/\(.*\)/$glob/"`
+        for pkg in $GLOB_PACKAGES; do
+            existing_pkg=`rootfs_check_package_exists $pkg`
             if [ "$existing_pkg" != "" ]; then
                 PACKAGES_TO_INSTALL="$PACKAGES_TO_INSTALL $existing_pkg"
             fi
@@ -324,6 +350,7 @@ rootfs_install_all_locales() {
 
     # Install the packages, if any
     if [ "$PACKAGES_TO_INSTALL" != "" ]; then
+        echo "Installing complementary packages"
         rootfs_install_packages $PACKAGES_TO_INSTALL
     fi
 
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 2a29917..57a02e5 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -209,6 +209,7 @@ rpm_update_pkg () {
 # INSTALL_PACKAGES_LINGUAS_RPM - additional packages for uclibc
 # INSTALL_PROVIDENAME_RPM - content for provide name
 # INSTALL_TASK_RPM - task name
+# INSTALL_COMPLEMENTARY_RPM - 1 to enable complementary package install mode
 
 package_install_internal_rpm () {
 
@@ -222,31 +223,35 @@ package_install_internal_rpm () {
 	local providename="${INSTALL_PROVIDENAME_RPM}"
 	local task="${INSTALL_TASK_RPM}"
 
-	# Setup base system configuration
-	mkdir -p ${target_rootfs}/etc/rpm/
-	echo "${platform}${TARGET_VENDOR}-${TARGET_OS}" > ${target_rootfs}/etc/rpm/platform
-	if [ ! -z "$platform_extra" ]; then
-		for pt in $platform_extra ; do
-			case $pt in
-				noarch | any | all)
-					os="`echo ${TARGET_OS} | sed "s,-.*,,"`.*"
-					;;
-				*)
-					os="${TARGET_OS}"
-					;;
-			esac
-			echo "$pt-.*-$os" >> ${target_rootfs}/etc/rpm/platform
-		done
-	fi
+	if [ "${INSTALL_COMPLEMENTARY_RPM}" != "1" ] ; then
+		# Setup base system configuration
+		mkdir -p ${target_rootfs}/etc/rpm/
+		echo "${platform}${TARGET_VENDOR}-${TARGET_OS}" > ${target_rootfs}/etc/rpm/platform
+		if [ ! -z "$platform_extra" ]; then
+			for pt in $platform_extra ; do
+				case $pt in
+					noarch | any | all)
+						os="`echo ${TARGET_OS} | sed "s,-.*,,"`.*"
+						;;
+					*)
+						os="${TARGET_OS}"
+						;;
+				esac
+				echo "$pt-.*-$os" >> ${target_rootfs}/etc/rpm/platform
+			done
+		fi
 
-	# Tell RPM that the "/" directory exist and is available
-	mkdir -p ${target_rootfs}/etc/rpm/sysinfo
-	echo "/" >${target_rootfs}/etc/rpm/sysinfo/Dirnames
-	if [ ! -z "$providename" ]; then
-		cat /dev/null > ${target_rootfs}/etc/rpm/sysinfo/Providename
-		for provide in $providename ; do
-			echo $provide >> ${target_rootfs}/etc/rpm/sysinfo/Providename
-		done
+		# Tell RPM that the "/" directory exist and is available
+		mkdir -p ${target_rootfs}/etc/rpm/sysinfo
+		echo "/" >${target_rootfs}/etc/rpm/sysinfo/Dirnames
+		if [ ! -z "$providename" ]; then
+			cat /dev/null > ${target_rootfs}/etc/rpm/sysinfo/Providename
+			for provide in $providename ; do
+				echo $provide >> ${target_rootfs}/etc/rpm/sysinfo/Providename
+			done
+		fi
+	else
+		mv ${target_rootfs}/install/total_solution.manifest ${target_rootfs}/install/original_solution.manifest
 	fi
 
 	# Setup manifest of packages to install...
@@ -499,13 +504,22 @@ mutex_set_max 163840
 # ================ Replication
 EOF
 
-	# RPM is special. It can't handle dependencies and preinstall scripts correctly. Its
-	# probably a feature. The only way to convince rpm to actually run the preinstall scripts 
-	# for base-passwd and shadow first before installing packages that depend on these packages 
-	# is to do two image installs, installing one set of packages, then the other.
-	if [ "${INC_RPM_IMAGE_GEN}" = "1" -a -f "$pre_btmanifest" ]; then
-		echo "Skipping pre install due to exisitng image"
+	if [ "${INSTALL_COMPLEMENTARY_RPM}" = "1" ] ; then
+		# Only install packages not already installed (dependency calculation will
+		# almost certainly have added some that have been)
+		sort ${target_rootfs}/install/original_solution.manifest > ${target_rootfs}/install/original_solution_sorted.manifest
+		sort ${target_rootfs}/install/total_solution.manifest > ${target_rootfs}/install/total_solution_sorted.manifest
+		comm -2 -3 ${target_rootfs}/install/total_solution_sorted.manifest \
+			${target_rootfs}/install/original_solution_sorted.manifest | awk '{print $1}' > \
+			${target_rootfs}/install/diff.manifest
+		mv ${target_rootfs}/install/diff.manifest ${target_rootfs}/install/total_solution.manifest
+	elif [ "${INC_RPM_IMAGE_GEN}" = "1" -a -f "$pre_btmanifest" ]; then
+		echo "Skipping pre install due to existing image"
 	else
+		# RPM is special. It can't handle dependencies and preinstall scripts correctly. Its
+		# probably a feature. The only way to convince rpm to actually run the preinstall scripts
+		# for base-passwd and shadow first before installing packages that depend on these packages
+		# is to do two image installs, installing one set of packages, then the other.
 		rm -f ${target_rootfs}/install/initial_install.manifest
 		echo "Installing base dependencies first (base-passwd, base-files and shadow) since rpm is special"
 		grep /base-passwd-[0-9] ${target_rootfs}/install/total_solution.manifest >> ${target_rootfs}/install/initial_install.manifest || true
diff --git a/meta/classes/populate_sdk_deb.bbclass b/meta/classes/populate_sdk_deb.bbclass
index 9e9e1e1..6f89dcf 100644
--- a/meta/classes/populate_sdk_deb.bbclass
+++ b/meta/classes/populate_sdk_deb.bbclass
@@ -36,6 +36,8 @@ populate_sdk_deb () {
 
 	package_install_internal_deb
 
+	${POPULATE_SDK_POST_TARGET_COMMAND}
+
 	populate_sdk_post_deb ${INSTALL_ROOTFS_DEB}
 
 	populate_sdk_log_check populate_sdk
diff --git a/meta/classes/populate_sdk_ipk.bbclass b/meta/classes/populate_sdk_ipk.bbclass
index 4321afb..65a95e7 100644
--- a/meta/classes/populate_sdk_ipk.bbclass
+++ b/meta/classes/populate_sdk_ipk.bbclass
@@ -29,6 +29,8 @@ populate_sdk_ipk() {
 
 	package_install_internal_ipk
 
+	${POPULATE_SDK_POST_TARGET_COMMAND}
+
 	#install host
 	export INSTALL_ROOTFS_IPK="${SDK_OUTPUT}"
 	export INSTALL_CONF_IPK="${IPKGCONF_SDK}"
diff --git a/meta/classes/populate_sdk_rpm.bbclass b/meta/classes/populate_sdk_rpm.bbclass
index 365a337..fac653b 100644
--- a/meta/classes/populate_sdk_rpm.bbclass
+++ b/meta/classes/populate_sdk_rpm.bbclass
@@ -37,6 +37,7 @@ populate_sdk_rpm () {
 	export INSTALL_PACKAGES_LINGUAS_RPM=""
 	export INSTALL_PROVIDENAME_RPM="/bin/sh /bin/bash /usr/bin/env /usr/bin/perl pkgconfig pkgconfig(pkg-config)"
 	export INSTALL_TASK_RPM="populate_sdk-target"
+	export INSTALL_COMPLEMENTARY_RPM=""
 
 	# Setup base system configuration
 	mkdir -p ${INSTALL_ROOTFS_RPM}/etc/rpm/
@@ -74,6 +75,7 @@ EOF
 	export INSTALL_PLATFORM_EXTRA_RPM
 
 	package_install_internal_rpm
+	${POPULATE_SDK_POST_TARGET_COMMAND}
 	populate_sdk_post_rpm ${INSTALL_ROOTFS_RPM}
 
 	## install nativesdk ##
@@ -86,6 +88,7 @@ EOF
 	export INSTALL_PACKAGES_LINGUAS_RPM=""
 	export INSTALL_PROVIDENAME_RPM="/bin/sh /bin/bash /usr/bin/env /usr/bin/perl pkgconfig libGL.so()(64bit) libGL.so"
 	export INSTALL_TASK_RPM="populate_sdk_rpm-nativesdk"
+	export INSTALL_COMPLEMENTARY_RPM=""
 
 	# List must be prefered to least preferred order
 	INSTALL_PLATFORM_EXTRA_RPM=""
diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index 67871a9..4833303 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -10,7 +10,7 @@ do_rootfs[recrdeptask] += "do_package_write_deb"
 
 do_rootfs[lockfiles] += "${WORKDIR}/deb.lock"
 
-DEB_POSTPROCESS_COMMANDS = "rootfs_install_all_locales; "
+DEB_POSTPROCESS_COMMANDS = ""
 
 opkglibdir = "${localstatedir}/lib/opkg"
 
@@ -42,6 +42,8 @@ fakeroot rootfs_deb_do_rootfs () {
 	package_install_internal_deb
 	${DEB_POSTPROCESS_COMMANDS}
 
+	rootfs_install_complementary
+
 	export D=${IMAGE_ROOTFS}
 	export OFFLINE_ROOT=${IMAGE_ROOTFS}
 	export IPKG_OFFLINE_ROOT=${IMAGE_ROOTFS}
@@ -87,7 +89,8 @@ remove_packaging_data_files() {
 	rm -rf ${IMAGE_ROOTFS}/usr/dpkg/
 }
 
-DPKG_QUERY_COMMAND = "${STAGING_BINDIR_NATIVE}/dpkg --admindir=${IMAGE_ROOTFS}/var/lib/dpkg"
+# This will of course only work after rootfs_deb_do_rootfs has been called
+DPKG_QUERY_COMMAND = "${STAGING_BINDIR_NATIVE}/dpkg --admindir=$INSTALL_ROOTFS_DEB/var/lib/dpkg"
 
 list_installed_packages() {
 	${DPKG_QUERY_COMMAND} -l | grep ^ii | awk '{ print $2 }'
@@ -119,7 +122,6 @@ rootfs_check_package_exists() {
 rootfs_install_packages() {
 	${STAGING_BINDIR_NATIVE}/apt-get install $@ --force-yes --allow-unauthenticated
 
-	for pkg in $@ ; do
-		deb_package_setflag installed $pkg
-	done
+	# Mark all packages installed
+	sed -i -e "s/Status: install ok unpacked/Status: install ok installed/;" $INSTALL_ROOTFS_DEB/var/lib/dpkg/status
 }
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 9732385..1a81f82 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -15,10 +15,12 @@ do_rootfs[recrdeptask] += "do_package_write_ipk"
 do_rootfs[lockfiles] += "${WORKDIR}/ipk.lock"
 
 IPKG_ARGS = "-f ${IPKGCONF_TARGET} -o ${IMAGE_ROOTFS} --force-overwrite"
+# The _POST version also works when constructing the matching SDK
+IPKG_ARGS_POST = "-f ${IPKGCONF_TARGET} -o $INSTALL_ROOTFS_IPK --force-overwrite"
 
 OPKG_PREPROCESS_COMMANDS = "package_update_index_ipk; package_generate_ipkg_conf"
 
-OPKG_POSTPROCESS_COMMANDS = "ipk_insert_feed_uris; rootfs_install_all_locales; "
+OPKG_POSTPROCESS_COMMANDS = "ipk_insert_feed_uris; "
 
 opkglibdir = "${localstatedir}/lib/opkg"
 
@@ -74,6 +76,8 @@ fakeroot rootfs_ipk_do_rootfs () {
 	#mkdir -p ${IMAGE_ROOTFS}/etc/opkg/
 	#grep "^arch" ${IPKGCONF_TARGET} >${IMAGE_ROOTFS}/etc/opkg/arch.conf
 
+	rootfs_install_complementary
+
 	${OPKG_POSTPROCESS_COMMANDS}
 	${ROOTFS_POSTINSTALL_COMMAND}
 	
@@ -130,7 +134,7 @@ list_installed_packages() {
 
 get_package_filename() {
 	set +x
-	info=`opkg-cl ${IPKG_ARGS} info $1 | grep -B 7 -A 7 "^Status.* \(\(installed\)\|\(unpacked\)\)" || true`
+	info=`opkg-cl ${IPKG_ARGS_POST} info $1 | grep -B 7 -A 7 "^Status.* \(\(installed\)\|\(unpacked\)\)" || true`
 	name=`echo "${info}" | awk '/^Package/ {printf $2"_"}'`
 	name=$name`echo "${info}" | awk -F: '/^Version/ {printf $NF"_"}' | sed 's/^\s*//g'`
 	name=$name`echo "${info}" | awk '/^Archi/ {print $2".ipk"}'`
@@ -145,21 +149,21 @@ get_package_filename() {
 }
 
 list_package_depends() {
-	opkg-cl ${IPKG_ARGS} info $1 | grep ^Depends | sed -e 's/^Depends: //' -e 's/,//g' -e 's:([=<>]* [^ )]*)::g'
+	opkg-cl ${IPKG_ARGS_POST} info $1 | grep ^Depends | sed -e 's/^Depends: //' -e 's/,//g' -e 's:([=<>]* [^ )]*)::g'
 }
 
 list_package_recommends() {
-	opkg-cl ${IPKG_ARGS} info $1 | grep ^Recommends | sed -e 's/^Recommends: //' -e 's/,//g' -e 's:([=<>]* [^ )]*)::g'
+	opkg-cl ${IPKG_ARGS_POST} info $1 | grep ^Recommends | sed -e 's/^Recommends: //' -e 's/,//g' -e 's:([=<>]* [^ )]*)::g'
 }
 
 rootfs_check_package_exists() {
-	if [ `opkg-cl ${IPKG_ARGS} info $1 | wc -l` -gt 2 ]; then
+	if [ `opkg-cl ${IPKG_ARGS_POST} info $1 | wc -l` -gt 2 ]; then
 		echo $1
 	fi
 }
 
 rootfs_install_packages() {
-	opkg-cl ${IPKG_ARGS} install $PACKAGES_TO_INSTALL
+	opkg-cl ${IPKG_ARGS_POST} install $PACKAGES_TO_INSTALL
 }
 
 ipk_insert_feed_uris () {
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 4551f7a..fb15f45 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -21,7 +21,7 @@ do_rootfs[depends] += "opkg-native:do_populate_sysroot"
 do_rootfs[recrdeptask] += "do_package_write_rpm"
 
 RPM_PREPROCESS_COMMANDS = "package_update_index_rpm; package_generate_rpm_conf; "
-RPM_POSTPROCESS_COMMANDS = "rootfs_install_all_locales; "
+RPM_POSTPROCESS_COMMANDS = ""
 
 # 
 # Allow distributions to alter when [postponed] package install scripts are run
@@ -55,6 +55,7 @@ fakeroot rootfs_rpm_do_rootfs () {
 	export INSTALL_PACKAGES_LINGUAS_RPM="${LINGUAS_INSTALL}"
 	export INSTALL_PROVIDENAME_RPM=""
 	export INSTALL_TASK_RPM="rootfs_rpm_do_rootfs"
+	export INSTALL_COMPLEMENTARY_RPM=""
 
 	# Setup base system configuration
 	mkdir -p ${INSTALL_ROOTFS_RPM}/etc/rpm/
@@ -68,6 +69,8 @@ fakeroot rootfs_rpm_do_rootfs () {
 
 	package_install_internal_rpm
 
+	rootfs_install_complementary
+
 	export D=${IMAGE_ROOTFS}
 	export OFFLINE_ROOT=${IMAGE_ROOTFS}
 	export IPKG_OFFLINE_ROOT=${IMAGE_ROOTFS}
@@ -133,7 +136,7 @@ remove_packaging_data_files() {
 	rm -rf ${IMAGE_ROOTFS}${opkglibdir}
 }
 
-RPM_QUERY_CMD = '${RPM} --root ${IMAGE_ROOTFS} -D "_dbpath ${rpmlibdir}" \
+RPM_QUERY_CMD = '${RPM} --root $INSTALL_ROOTFS_RPM -D "_dbpath ${rpmlibdir}" \
 		-D "__dbi_txn create nofsync private"'
 
 list_installed_packages() {
@@ -172,20 +175,20 @@ list_package_recommends() {
 }
 
 rootfs_check_package_exists() {
-	resolve_package_rpm ${RPMCONF_TARGET_BASE}-base_archs.conf $1
+	# package_install_internal_rpm takes care of this for rootfs_install_packages
+	# now, so we don't need to do the check here as well
+	echo $1
 }
 
 rootfs_install_packages() {
-    # The pkg to be installed here is not controlled by the
-    # package_install_internal_rpm, so it may have already been
-    # installed(e.g, installed in the first time when generate the
-    # rootfs), use '--replacepkgs' to always install them
-	for pkg in $@; do
-		${RPM} --root ${IMAGE_ROOTFS} -D "_dbpath ${rpmlibdir}" \
-			-D "__dbi_txn create nofsync private" \
-			--noscripts --notriggers --noparentdirs --nolinktos \
-			--replacepkgs -Uhv $pkg || true
-	done
+	# Note - we expect the variables not set here to already have been set
+	export INSTALL_PACKAGES_RPM=""
+	export INSTALL_PACKAGES_ATTEMPTONLY_RPM="$@"
+	export INSTALL_PROVIDENAME_RPM=""
+	export INSTALL_TASK_RPM="rootfs_install_packages"
+	export INSTALL_COMPLEMENTARY_RPM="1"
+
+	package_install_internal_rpm
 }
 
 python () {
-- 
1.7.9.5



