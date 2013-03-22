Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UJ8Cf-0007Fs-6c
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 21:04:43 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 22 Mar 2013 12:47:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,893,1355126400"; d="scan'208";a="217880794"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.1])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Mar 2013 12:47:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Mar 2013 19:47:39 +0000
Message-Id: <d6c0028803399294e9eb24cd598a2edf65bbcfbf.1363981627.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1363981627.git.paul.eggleton@linux.intel.com>
References: <cover.1363981627.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1363981627.git.paul.eggleton@linux.intel.com>
References: <cover.1363981627.git.paul.eggleton@linux.intel.com>
Subject: [RFC PATCH 1/2] classes/buildhistory: implement history collection for SDKs
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
X-List-Received-Date: Fri, 22 Mar 2013 20:04:44 -0000

SDKs are constructed in a similar manner to images, and the contents can
be influenced by a number of different factors, thus tracking the
contents of produced SDKs when buildhistory is enabled can help detect
the same kinds of issues as with images.

This required adding POPULATE_SDK_POST_HOST_COMMAND and
SDK_POSTPROCESS_COMMAND variables so that data collection functions can
be injected at the appropriate points in the SDK construction process,
as well as moving the list_installed_packages and
rootfs_list_installed_depends functions from the rootfs_{rpm,ipk,deb} to
the package_{rpm,ipk,deb} classes so they can also be called during
do_populate_sdk as well as do_rootfs.

Implements [YOCTO #3964].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass      |  130 ++++++++++++++++++++++----------
 meta/classes/package_deb.bbclass       |   28 +++++++
 meta/classes/package_ipk.bbclass       |   24 ++++++
 meta/classes/package_rpm.bbclass       |   17 +++++
 meta/classes/populate_sdk_base.bbclass |    2 +
 meta/classes/populate_sdk_deb.bbclass  |    1 +
 meta/classes/populate_sdk_ipk.bbclass  |    2 +
 meta/classes/populate_sdk_rpm.bbclass  |    1 +
 meta/classes/rootfs_deb.bbclass        |   27 -------
 meta/classes/rootfs_ipk.bbclass        |   22 ------
 meta/classes/rootfs_rpm.bbclass        |   16 ----
 11 files changed, 165 insertions(+), 105 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 07b3c1e..b559ebf 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -3,14 +3,15 @@
 #
 # Based in part on testlab.bbclass and packagehistory.bbclass
 #
-# Copyright (C) 2011 Intel Corporation
+# Copyright (C) 2013 Intel Corporation
 # Copyright (C) 2007-2011 Koen Kooi <koen@openembedded.org>
 #
 
-BUILDHISTORY_FEATURES ?= "image package"
+BUILDHISTORY_FEATURES ?= "image package sdk"
 BUILDHISTORY_DIR ?= "${TMPDIR}/buildhistory"
 BUILDHISTORY_DIR_IMAGE = "${BUILDHISTORY_DIR}/images/${MACHINE_ARCH}/${TCLIBC}/${IMAGE_BASENAME}"
 BUILDHISTORY_DIR_PACKAGE = "${BUILDHISTORY_DIR}/packages/${MULTIMACH_TARGET_SYS}/${PN}"
+BUILDHISTORY_DIR_SDK = "${BUILDHISTORY_DIR}/sdk/${SDK_NAME}"
 BUILDHISTORY_COMMIT ?= "0"
 BUILDHISTORY_COMMIT_AUTHOR ?= "buildhistory <buildhistory@${DISTRO}>"
 BUILDHISTORY_PUSH_REPO ?= ""
@@ -315,69 +316,91 @@ def write_pkghistory(pkginfo, d):
                 os.unlink(filevarpath)
 
 
-buildhistory_get_image_installed() {
-	# Anything requiring the use of the packaging system should be done in here
-	# in case the packaging files are going to be removed for this image
-
-	if [ "${@base_contains('BUILDHISTORY_FEATURES', 'image', '1', '0', d)}" = "0" ] ; then
-		return
-	fi
-
-	mkdir -p ${BUILDHISTORY_DIR_IMAGE}
+buildhistory_get_installed() {
+	mkdir -p $1
 
 	# Get list of installed packages
-	pkgcache="${BUILDHISTORY_DIR_IMAGE}/installed-packages.tmp"
+	pkgcache="$1/installed-packages.tmp"
 	list_installed_packages file | sort > $pkgcache
 
-	cat $pkgcache | awk '{ print $1 }' > ${BUILDHISTORY_DIR_IMAGE}/installed-package-names.txt
-	cat $pkgcache | awk '{ print $2 }' | xargs -n1 basename > ${BUILDHISTORY_DIR_IMAGE}/installed-packages.txt
+	cat $pkgcache | awk '{ print $1 }' > $1/installed-package-names.txt
+	cat $pkgcache | awk '{ print $2 }' | xargs -n1 basename > $1/installed-packages.txt
 
 	# Produce dependency graph
 	# First, filter out characters that cause issues for dot
-	rootfs_list_installed_depends | sed -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' > ${BUILDHISTORY_DIR_IMAGE}/depends.tmp
+	rootfs_list_installed_depends | sed -e 's:-:_:g' -e 's:\.:_:g' -e 's:+::g' > $1/depends.tmp
 	# Change delimiter from pipe to -> and set style for recommend lines
-	sed -i -e 's:|: -> :' -e 's:\[REC\]:[style=dotted]:' -e 's:$:;:' ${BUILDHISTORY_DIR_IMAGE}/depends.tmp
+	sed -i -e 's:|: -> :' -e 's:\[REC\]:[style=dotted]:' -e 's:$:;:' $1/depends.tmp
 	# Add header, sorted and de-duped contents and footer and then delete the temp file
-	printf "digraph depends {\n    node [shape=plaintext]\n" > ${BUILDHISTORY_DIR_IMAGE}/depends.dot
-	cat ${BUILDHISTORY_DIR_IMAGE}/depends.tmp | sort | uniq >> ${BUILDHISTORY_DIR_IMAGE}/depends.dot
-	echo "}" >>  ${BUILDHISTORY_DIR_IMAGE}/depends.dot
-	rm ${BUILDHISTORY_DIR_IMAGE}/depends.tmp
+	printf "digraph depends {\n    node [shape=plaintext]\n" > $1/depends.dot
+	cat $1/depends.tmp | sort | uniq >> $1/depends.dot
+	echo "}" >>  $1/depends.dot
+	rm $1/depends.tmp
 
 	# Produce installed package sizes list
-	printf "" > ${BUILDHISTORY_DIR_IMAGE}/installed-package-sizes.tmp
+	printf "" > $1/installed-package-sizes.tmp
 	cat $pkgcache | while read pkg pkgfile
 	do
 		if [ -f $pkgfile ] ; then
 			pkgsize=`du -k $pkgfile | head -n1 | awk '{ print $1 }'`
-			echo $pkgsize $pkg >> ${BUILDHISTORY_DIR_IMAGE}/installed-package-sizes.tmp
+			echo $pkgsize $pkg >> $1/installed-package-sizes.tmp
 		fi
 	done
-	cat ${BUILDHISTORY_DIR_IMAGE}/installed-package-sizes.tmp | sort -n -r | awk '{print $1 "\tKiB " $2}' > ${BUILDHISTORY_DIR_IMAGE}/installed-package-sizes.txt
-	rm ${BUILDHISTORY_DIR_IMAGE}/installed-package-sizes.tmp
+	cat $1/installed-package-sizes.tmp | sort -n -r | awk '{print $1 "\tKiB " $2}' > $1/installed-package-sizes.txt
+	rm $1/installed-package-sizes.tmp
 
 	# We're now done with the cache, delete it
 	rm $pkgcache
 
-	# Produce some cut-down graphs (for readability)
-	grep -v kernel_image ${BUILDHISTORY_DIR_IMAGE}/depends.dot | grep -v kernel_2 | grep -v kernel_3 > ${BUILDHISTORY_DIR_IMAGE}/depends-nokernel.dot
-	grep -v libc6 ${BUILDHISTORY_DIR_IMAGE}/depends-nokernel.dot | grep -v libgcc > ${BUILDHISTORY_DIR_IMAGE}/depends-nokernel-nolibc.dot
-	grep -v update_ ${BUILDHISTORY_DIR_IMAGE}/depends-nokernel-nolibc.dot > ${BUILDHISTORY_DIR_IMAGE}/depends-nokernel-nolibc-noupdate.dot
-	grep -v kernel_module ${BUILDHISTORY_DIR_IMAGE}/depends-nokernel-nolibc-noupdate.dot > ${BUILDHISTORY_DIR_IMAGE}/depends-nokernel-nolibc-noupdate-nomodules.dot
+	if [ "$2" != "sdk" ] ; then
+		# Produce some cut-down graphs (for readability)
+		grep -v kernel_image $1/depends.dot | grep -v kernel_2 | grep -v kernel_3 > $1/depends-nokernel.dot
+		grep -v libc6 $1/depends-nokernel.dot | grep -v libgcc > $1/depends-nokernel-nolibc.dot
+		grep -v update_ $1/depends-nokernel-nolibc.dot > $1/depends-nokernel-nolibc-noupdate.dot
+		grep -v kernel_module $1/depends-nokernel-nolibc-noupdate.dot > $1/depends-nokernel-nolibc-noupdate-nomodules.dot
+	fi
 
 	# add complementary package information
 	if [ -e ${WORKDIR}/complementary_pkgs.txt ]; then
-		cp ${WORKDIR}/complementary_pkgs.txt ${BUILDHISTORY_DIR_IMAGE}
+		cp ${WORKDIR}/complementary_pkgs.txt $1
 	fi
 }
 
-buildhistory_get_imageinfo() {
+buildhistory_get_image_installed() {
+	# Anything requiring the use of the packaging system should be done in here
+	# in case the packaging files are going to be removed for this image
+
 	if [ "${@base_contains('BUILDHISTORY_FEATURES', 'image', '1', '0', d)}" = "0" ] ; then
 		return
 	fi
 
-	# List the files in the image, but exclude date/time etc.
+	buildhistory_get_installed ${BUILDHISTORY_DIR_IMAGE}
+}
+
+buildhistory_get_sdk_installed() {
+	# Anything requiring the use of the packaging system should be done in here
+	# in case the packaging files are going to be removed for this SDK
+
+	if [ "${@base_contains('BUILDHISTORY_FEATURES', 'sdk', '1', '0', d)}" = "0" ] ; then
+		return
+	fi
+
+	buildhistory_get_installed ${BUILDHISTORY_DIR_SDK}/$1 sdk
+}
+
+buildhistory_list_files() {
+	# List the files in the specified directory, but exclude date/time etc.
 	# This awk script is somewhat messy, but handles where the size is not printed for device files under pseudo
-	( cd ${IMAGE_ROOTFS} && find . -ls | awk '{ if ( $7 ~ /[0-9]/ ) printf "%s %10-s %10-s %10s %s %s %s\n", $3, $5, $6, $7, $11, $12, $13 ; else printf "%s %10-s %10-s %10s %s %s %s\n", $3, $5, $6, 0, $10, $11, $12 }' | sort -k5 > ${BUILDHISTORY_DIR_IMAGE}/files-in-image.txt )
+	( cd $1 && find . -ls | awk '{ if ( $7 ~ /[0-9]/ ) printf "%s %10-s %10-s %10s %s %s %s\n", $3, $5, $6, $7, $11, $12, $13 ; else printf "%s %10-s %10-s %10s %s %s %s\n", $3, $5, $6, 0, $10, $11, $12 }' | sort -k5 > $2 )
+}
+
+
+buildhistory_get_imageinfo() {
+	if [ "${@base_contains('BUILDHISTORY_FEATURES', 'image', '1', '0', d)}" = "0" ] ; then
+		return
+	fi
+
+	buildhistory_list_files ${IMAGE_ROOTFS} ${BUILDHISTORY_DIR_IMAGE}/files-in-image.txt
 
 	# Record some machine-readable meta-information about the image
 	printf ""  > ${BUILDHISTORY_DIR_IMAGE}/image-info.txt
@@ -395,11 +418,32 @@ ${@buildhistory_get_layers(d)}
 END
 }
 
+buildhistory_get_sdkinfo() {
+	if [ "${@base_contains('BUILDHISTORY_FEATURES', 'sdk', '1', '0', d)}" = "0" ] ; then
+		return
+	fi
+
+	buildhistory_list_files ${SDK_OUTPUT} ${BUILDHISTORY_DIR_SDK}/files-in-sdk.txt
+
+	# Record some machine-readable meta-information about the SDK
+	printf ""  > ${BUILDHISTORY_DIR_SDK}/sdk-info.txt
+	cat >> ${BUILDHISTORY_DIR_SDK}/sdk-info.txt <<END
+${@buildhistory_get_sdkvars(d)}
+END
+	sdksize=`du -ks ${SDK_OUTPUT} | awk '{ print $1 }'`
+	echo "SDKSIZE = $sdksize" >> ${BUILDHISTORY_DIR_SDK}/sdk-info.txt
+}
+
 # By prepending we get in before the removal of packaging files
 ROOTFS_POSTPROCESS_COMMAND =+ "buildhistory_get_image_installed ; "
 
 IMAGE_POSTPROCESS_COMMAND += " buildhistory_get_imageinfo ; "
 
+POPULATE_SDK_POST_TARGET_COMMAND += "buildhistory_get_sdk_installed target ; "
+POPULATE_SDK_POST_HOST_COMMAND += "buildhistory_get_sdk_installed host ; "
+
+SDK_POSTPROCESS_COMMAND += "buildhistory_get_sdkinfo ; "
+
 def buildhistory_get_layers(d):
     layertext = "Configured metadata layers:\n%s\n" % '\n'.join(get_layers_branch_rev(d))
     return layertext
@@ -418,15 +462,11 @@ def squashspaces(string):
     import re
     return re.sub("\s+", " ", string).strip()
 
-
-def buildhistory_get_imagevars(d):
-    imagevars = "DISTRO DISTRO_VERSION USER_CLASSES IMAGE_CLASSES IMAGE_FEATURES IMAGE_LINGUAS IMAGE_INSTALL BAD_RECOMMENDATIONS ROOTFS_POSTPROCESS_COMMAND IMAGE_POSTPROCESS_COMMAND"
-    listvars = "USER_CLASSES IMAGE_CLASSES IMAGE_FEATURES IMAGE_LINGUAS IMAGE_INSTALL BAD_RECOMMENDATIONS"
-
-    imagevars = imagevars.split()
+def outputvars(vars, listvars, d):
+    vars = vars.split()
     listvars = listvars.split()
     ret = ""
-    for var in imagevars:
+    for var in vars:
         value = d.getVar(var, True) or ""
         if var in listvars:
             # Squash out spaces
@@ -434,6 +474,16 @@ def buildhistory_get_imagevars(d):
         ret += "%s = %s\n" % (var, value)
     return ret.rstrip('\n')
 
+def buildhistory_get_imagevars(d):
+    imagevars = "DISTRO DISTRO_VERSION USER_CLASSES IMAGE_CLASSES IMAGE_FEATURES IMAGE_LINGUAS IMAGE_INSTALL BAD_RECOMMENDATIONS ROOTFS_POSTPROCESS_COMMAND IMAGE_POSTPROCESS_COMMAND"
+    listvars = "USER_CLASSES IMAGE_CLASSES IMAGE_FEATURES IMAGE_LINGUAS IMAGE_INSTALL BAD_RECOMMENDATIONS"
+    return outputvars(imagevars, listvars, d)
+
+def buildhistory_get_sdkvars(d):
+    sdkvars = "DISTRO DISTRO_VERSION SDK_NAME SDK_VERSION SDKMACHINE SDKIMAGE_FEATURES BAD_RECOMMENDATIONS"
+    listvars = "SDKIMAGE_FEATURES BAD_RECOMMENDATIONS"
+    return outputvars(sdkvars, listvars, d)
+
 
 buildhistory_commit() {
 	if [ ! -d ${BUILDHISTORY_DIR} ] ; then
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 4559199..a937b85 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -423,3 +423,31 @@ addtask package_write_deb before do_package_write after do_packagedata do_packag
 PACKAGEINDEXES += "[ ! -e ${DEPLOY_DIR_DEB} ] || package_update_index_deb;"
 PACKAGEINDEXDEPS += "dpkg-native:do_populate_sysroot"
 PACKAGEINDEXDEPS += "apt-native:do_populate_sysroot"
+
+
+# This will of course only work after rootfs_deb_do_rootfs or populate_sdk_deb has been called
+DPKG_QUERY_COMMAND = "${STAGING_BINDIR_NATIVE}/dpkg-query --admindir=$INSTALL_ROOTFS_DEB/var/lib/dpkg"
+
+list_installed_packages() {
+	if [ "$1" = "arch" ] ; then
+		# Here we want the PACKAGE_ARCH not the deb architecture
+		${DPKG_QUERY_COMMAND} -W -f='${Package} ${PackageArch}\n'
+	elif [ "$1" = "file" ] ; then
+		${DPKG_QUERY_COMMAND} -W -f='${Package} ${Package}_${Version}_${Architecture}.deb\n' | while read pkg pkgfile
+		do
+			fullpath=`find ${DEPLOY_DIR_DEB} -name "$pkgfile" || true`
+			if [ "$fullpath" = "" ] ; then
+				echo "$pkg $pkgfile"
+			else
+				echo "$pkg $fullpath"
+			fi
+		done
+	else
+		${DPKG_QUERY_COMMAND} -W -f='${Package}\n'
+	fi
+}
+
+rootfs_list_installed_depends() {
+	# Cheat here a little bit by using the opkg query helper util
+	${DPKG_QUERY_COMMAND} -W -f='Package: ${Package}\nDepends: ${Depends}\nRecommends: ${Recommends}\n\n' | opkg-query-helper.py
+}
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index d003ae7..cec2f17 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -430,3 +430,27 @@ addtask package_write_ipk before do_package_write after do_packagedata do_packag
 PACKAGEINDEXES += "[ ! -e ${DEPLOY_DIR_IPK} ] || package_update_index_ipk;"
 PACKAGEINDEXDEPS += "opkg-utils-native:do_populate_sysroot"
 PACKAGEINDEXDEPS += "opkg-native:do_populate_sysroot"
+
+
+list_installed_packages() {
+	if [ "$1" = "arch" ] ; then
+		opkg-cl ${OPKG_ARGS} status | opkg-query-helper.py -a
+	elif [ "$1" = "file" ] ; then
+		opkg-cl ${OPKG_ARGS} status | opkg-query-helper.py -f | while read pkg pkgfile
+		do
+			fullpath=`find ${DEPLOY_DIR_IPK} -name "$pkgfile" || true`
+			if [ "$fullpath" = "" ] ; then
+				echo "$pkg $pkgfile"
+			else
+				echo "$pkg $fullpath"
+			fi
+		done
+	else
+		opkg-cl ${OPKG_ARGS} list_installed | awk '{ print $1 }'
+	fi
+}
+
+rootfs_list_installed_depends() {
+	opkg-cl ${OPKG_ARGS} status | opkg-query-helper.py
+}
+
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 12b4bfa..7d67b96 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -1155,3 +1155,20 @@ addtask package_write_rpm before do_package_write after do_packagedata do_packag
 PACKAGEINDEXES += "[ ! -e ${DEPLOY_DIR_RPM} ] || package_update_index_rpm;"
 PACKAGEINDEXDEPS += "rpm-native:do_populate_sysroot"
 PACKAGEINDEXDEPS += "createrepo-native:do_populate_sysroot"
+
+
+RPM_QUERY_CMD = '${RPM} --root $INSTALL_ROOTFS_RPM -D "_dbpath ${rpmlibdir}"'
+
+list_installed_packages() {
+	if [ "$1" = "arch" ]; then
+		${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{ARCH}\n]" | translate_smart_to_oe arch
+	elif [ "$1" = "file" ]; then
+		${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{ARCH} %{PACKAGEORIGIN}\n]" | translate_smart_to_oe
+	else
+		${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{ARCH}\n]" | translate_smart_to_oe
+	fi
+}
+
+rootfs_list_installed_depends() {
+	rpmresolve -t $INSTALL_ROOTFS_RPM/${rpmlibdir}
+}
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 4015030..6280705 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -86,6 +86,8 @@ fakeroot populate_sdk_image() {
 
 	# Link the ld.so.cache file into the hosts filesystem
 	ln -s /etc/ld.so.cache ${SDK_OUTPUT}/${SDKPATHNATIVE}/etc/ld.so.cache
+
+	${SDK_POSTPROCESS_COMMAND}
 }
 
 fakeroot create_sdk_files() {
diff --git a/meta/classes/populate_sdk_deb.bbclass b/meta/classes/populate_sdk_deb.bbclass
index e1705e7b..0361a13 100644
--- a/meta/classes/populate_sdk_deb.bbclass
+++ b/meta/classes/populate_sdk_deb.bbclass
@@ -56,6 +56,7 @@ populate_sdk_deb () {
 	export INSTALL_TASK_DEB="populate_sdk-nativesdk"
 
 	package_install_internal_deb
+	${POPULATE_SDK_POST_HOST_COMMAND}
 	populate_sdk_post_deb ${SDK_OUTPUT}/${SDKPATHNATIVE}
 
 	#move remainings
diff --git a/meta/classes/populate_sdk_ipk.bbclass b/meta/classes/populate_sdk_ipk.bbclass
index 3a5ecda..becaf96 100644
--- a/meta/classes/populate_sdk_ipk.bbclass
+++ b/meta/classes/populate_sdk_ipk.bbclass
@@ -41,6 +41,8 @@ populate_sdk_ipk() {
 
 	package_install_internal_ipk
 
+	${POPULATE_SDK_POST_HOST_COMMAND}
+
 	#post clean up
 	install -d ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/${sysconfdir}
 	install -m 0644 ${IPKGCONF_TARGET} ${IPKGCONF_SDK} ${SDK_OUTPUT}/${SDKTARGETSYSROOT}/${sysconfdir}/
diff --git a/meta/classes/populate_sdk_rpm.bbclass b/meta/classes/populate_sdk_rpm.bbclass
index 2dfb80c..bbee35e 100644
--- a/meta/classes/populate_sdk_rpm.bbclass
+++ b/meta/classes/populate_sdk_rpm.bbclass
@@ -113,6 +113,7 @@ populate_sdk_rpm () {
 	export INSTALL_PLATFORM_EXTRA_RPM
 
 	package_install_internal_rpm --sdk
+	${POPULATE_SDK_POST_HOST_COMMAND}
 	populate_sdk_post_rpm ${INSTALL_ROOTFS_RPM}
 
 	# move host RPM library data
diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index abc9f3b..e642cf3 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -99,33 +99,6 @@ remove_packaging_data_files() {
 	rm -rf ${IMAGE_ROOTFS}/usr/dpkg/
 }
 
-# This will of course only work after rootfs_deb_do_rootfs has been called
-DPKG_QUERY_COMMAND = "${STAGING_BINDIR_NATIVE}/dpkg-query --admindir=$INSTALL_ROOTFS_DEB/var/lib/dpkg"
-
-list_installed_packages() {
-	if [ "$1" = "arch" ] ; then
-		# Here we want the PACKAGE_ARCH not the deb architecture
-		${DPKG_QUERY_COMMAND} -W -f='${Package} ${PackageArch}\n'
-	elif [ "$1" = "file" ] ; then
-		${DPKG_QUERY_COMMAND} -W -f='${Package} ${Package}_${Version}_${Architecture}.deb\n' | while read pkg pkgfile
-		do
-			fullpath=`find ${DEPLOY_DIR_DEB} -name "$pkgfile" || true`
-			if [ "$fullpath" = "" ] ; then
-				echo "$pkg $pkgfile"
-			else
-				echo "$pkg $fullpath"
-			fi
-		done
-	else
-		${DPKG_QUERY_COMMAND} -W -f='${Package}\n'
-	fi
-}
-
-rootfs_list_installed_depends() {
-	# Cheat here a little bit by using the opkg query helper util
-	${DPKG_QUERY_COMMAND} -W -f='Package: ${Package}\nDepends: ${Depends}\nRecommends: ${Recommends}\n\n' | opkg-query-helper.py
-}
-
 rootfs_install_packages() {
 	${STAGING_BINDIR_NATIVE}/apt-get install `cat $1` --force-yes --allow-unauthenticated
 
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index e38ba86..3e1f959 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -141,28 +141,6 @@ remove_packaging_data_files() {
 	mkdir ${IMAGE_ROOTFS}${OPKGLIBDIR}/opkg
 }
 
-list_installed_packages() {
-	if [ "$1" = "arch" ] ; then
-		opkg-cl ${OPKG_ARGS} status | opkg-query-helper.py -a
-	elif [ "$1" = "file" ] ; then
-		opkg-cl ${OPKG_ARGS} status | opkg-query-helper.py -f | while read pkg pkgfile
-		do
-			fullpath=`find ${DEPLOY_DIR_IPK} -name "$pkgfile" || true`
-			if [ "$fullpath" = "" ] ; then
-				echo "$pkg $pkgfile"
-			else
-				echo "$pkg $fullpath"
-			fi
-		done
-	else
-		opkg-cl ${OPKG_ARGS} list_installed | awk '{ print $1 }'
-	fi
-}
-
-rootfs_list_installed_depends() {
-	opkg-cl ${OPKG_ARGS} status | opkg-query-helper.py
-}
-
 rootfs_install_packages() {
 	opkg-cl ${OPKG_ARGS} install `cat $1`
 }
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 8392a1e..1d3ea64 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -156,22 +156,6 @@ rpm_setup_smart_target_config() {
 	rm -f ${IMAGE_ROOTFS}/var/lib/smart/config.old
 }
 
-RPM_QUERY_CMD = '${RPM} --root $INSTALL_ROOTFS_RPM -D "_dbpath ${rpmlibdir}"'
-
-list_installed_packages() {
-	if [ "$1" = "arch" ]; then
-		${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{ARCH}\n]" | translate_smart_to_oe arch
-	elif [ "$1" = "file" ]; then
-		${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{ARCH} %{PACKAGEORIGIN}\n]" | translate_smart_to_oe
-	else
-		${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{ARCH}\n]" | translate_smart_to_oe
-	fi
-}
-
-rootfs_list_installed_depends() {
-	rpmresolve -t $INSTALL_ROOTFS_RPM/${rpmlibdir}
-}
-
 rootfs_install_packages() {
 	# Note - we expect the variables not set here to already have been set
 	export INSTALL_PACKAGES_RPM=""
-- 
1.7.10.4



