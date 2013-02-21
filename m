Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1U8fBe-0007Mi-Qw
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Feb 2013 00:04:23 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1LMm9jv009680
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Feb 2013 14:48:10 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 21 Feb 2013 14:48:07 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Feb 2013 17:18:29 -0600
Message-ID: <1361488709-2340-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1361488709-2340-1-git-send-email-mark.hatle@windriver.com>
References: <1361488709-2340-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 1/1] rootfs_rpm.bbclass: Handle multilib configures with different OS values
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
X-List-Received-Date: Thu, 21 Feb 2013 23:04:25 -0000
Content-Type: text/plain

[ CQID: WIND00404082 ]

It is possible for the TARGET_OS to change dependending on the multilib used
for a given package build.  mips64 has two potential TARGET_OS values: linux
and linux-gnun32.  The RPM and Smart setup needs to distinguish between the
two otherwise packages of the "non-default" TARGET_OS may be ignored as
incompatible.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass      | 31 ++++++++------------------
 meta/classes/populate_sdk_rpm.bbclass | 42 +++++++++++++++++++++++++----------
 meta/classes/rootfs_rpm.bbclass       | 37 +++++++++++++++++++++---------
 3 files changed, 66 insertions(+), 44 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index dac89a7..7a1da33 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -248,8 +248,6 @@ translate_oe_to_smart() {
 package_install_internal_rpm () {
 
 	local target_rootfs="$INSTALL_ROOTFS_RPM"
-	local platform="`echo $INSTALL_PLATFORM_RPM | sed 's#-#_#g'`"
-	local platform_extra="`echo $INSTALL_PLATFORM_EXTRA_RPM | sed 's#-#_#g'`"
 	local package_to_install="$INSTALL_PACKAGES_RPM"
 	local package_attemptonly="$INSTALL_PACKAGES_ATTEMPTONLY_RPM"
 	local package_linguas="$INSTALL_PACKAGES_LINGUAS_RPM"
@@ -273,29 +271,17 @@ package_install_internal_rpm () {
 		# Setup base system configuration
 		echo "Note: configuring RPM platform settings"
 		mkdir -p ${target_rootfs}/etc/rpm/
-		if [ -n "${sdk_mode}" ]; then
-			platform_vendor="${SDK_VENDOR}"
-			platform_os="${SDK_OS}"
-		else
-			platform_vendor="${TARGET_VENDOR}"
-			platform_os="${TARGET_OS}"
-		fi
-
-		echo "${platform}${platform_vendor}-${platform_os}" > ${target_rootfs}/etc/rpm/platform
+		echo "$INSTALL_PLATFORM_RPM" > ${target_rootfs}/etc/rpm/platform
 
-
-		if [ ! -z "$platform_extra" ]; then
-			for pt in $platform_extra ; do
+		if [ ! -z "$INSTALL_PLATFORM_EXTRA_RPM" ]; then
+			for pt in $INSTALL_PLATFORM_EXTRA_RPM ; do
 				channel_priority=$(expr $channel_priority + 5)
 				case $pt in
-					noarch | any | all)
-						os="`echo ${platform_os} | sed "s,-.*,,"`.*"
-						;;
-					*)
-						os="${platform_os}"
+					noarch-* | any-* | all-*)
+						pt=$(echo $pt | sed "s,-linux.*$,-linux\.*,")
 						;;
 				esac
-				echo "$pt-.*-$os" >> ${target_rootfs}/etc/rpm/platform
+				echo "$pt" >> ${target_rootfs}/etc/rpm/platform
 			done
 		fi
 
@@ -360,12 +346,13 @@ EOF
 		smart --data-dir=${target_rootfs}/var/lib/smart config --set rpm-extra-macros._tmppath=/install/tmp
 		# Optional debugging
 		#smart --data-dir=${target_rootfs}/var/lib/smart config --set rpm-log-level=debug
+		#smart --data-dir=${target_rootfs}/var/lib/smart config --set rpm-log-file=/tmp/smart-debug-logfile
 
 		# Delay this until later...
 		#smart --data-dir=${target_rootfs}/var/lib/smart channel --add rpmsys type=rpm-sys -y
 
-		platform_extra_fixed=`echo "$platform_extra" | tr - _`
-		for arch in $platform_extra_fixed ; do
+		for canonical_arch in $INSTALL_PLATFORM_EXTRA_RPM; do
+			arch=$(echo $canonical_arch | sed "s,\([^-]*\)-.*,\1,")
 			if [ -d ${DEPLOY_DIR_RPM}/$arch -a ! -e ${target_rootfs}/install/channel.$arch.stamp ] ; then
 				echo "Note: adding Smart channel $arch ($channel_priority)"
 				smart --data-dir=${target_rootfs}/var/lib/smart channel --add $arch type=rpm-md type=rpm-md baseurl=${DEPLOY_DIR_RPM}/$arch -y
diff --git a/meta/classes/populate_sdk_rpm.bbclass b/meta/classes/populate_sdk_rpm.bbclass
index 0595aa7..2dfb80c 100644
--- a/meta/classes/populate_sdk_rpm.bbclass
+++ b/meta/classes/populate_sdk_rpm.bbclass
@@ -39,7 +39,7 @@ populate_sdk_rpm () {
 	# This needs to work in the same way as rootfs_rpm.bbclass!
 	#
 	export INSTALL_ROOTFS_RPM="${SDK_OUTPUT}/${SDKTARGETSYSROOT}"
-	export INSTALL_PLATFORM_RPM="${TARGET_ARCH}"
+	export INSTALL_PLATFORM_RPM="$(echo ${TARGET_ARCH} | tr - _)${TARGET_VENDOR}-${TARGET_OS}"
 	export INSTALL_PACKAGES_RPM="${TOOLCHAIN_TARGET_TASK}"
 	export INSTALL_PACKAGES_ATTEMPTONLY_RPM="${TOOLCHAIN_TARGET_TASK_ATTEMPTONLY}"
 	export INSTALL_PACKAGES_LINGUAS_RPM=""
@@ -57,20 +57,31 @@ populate_sdk_rpm () {
 	# List must be prefered to least preferred order
 	default_extra_rpm=""
 	INSTALL_PLATFORM_EXTRA_RPM=""
-	for i in ${MULTILIB_PREFIX_LIST} ; do
+	for os in ${MULTILIB_OS_LIST} ; do
 		old_IFS="$IFS"
 		IFS=":"
-		set $i
+		set -- $os
 		IFS="$old_IFS"
 		mlib=$1
-		shift #remove mlib
-		while [ -n "$1" ]; do
-			if [ "$mlib" = "${BBEXTENDVARIANT}" ]; then
-				default_extra_rpm="$default_extra_rpm $1"
-			else
-				INSTALL_PLATFORM_EXTRA_RPM="$INSTALL_PLATFORM_EXTRA_RPM $1"
+		mlib_os=$2
+		for prefix in ${MULTILIB_PREFIX_LIST} ; do
+			old_IFS="$IFS"
+			IFS=":"
+			set -- $prefix
+			IFS="$old_IFS"
+			if [ "$mlib" != "$1" ]; then
+				continue
 			fi
-			shift
+			shift #remove mlib
+			while [ -n "$1" ]; do
+				platform="$(echo $1 | tr - _)-.*-$mlib_os"
+				if [ "$mlib" = "${BBEXTENDVARIANT}" ]; then
+					default_extra_rpm="$default_extra_rpm $platform"
+				else
+					INSTALL_PLATFORM_EXTRA_RPM="$INSTALL_PLATFORM_EXTRA_RPM $platform"
+				fi
+				shift
+			done
 		done
 	done
 	if [ -n "$default_extra_rpm" ]; then
@@ -85,7 +96,7 @@ populate_sdk_rpm () {
 	## install nativesdk ##
 	echo "Installing NATIVESDK packages"
 	export INSTALL_ROOTFS_RPM="${SDK_OUTPUT}"
-	export INSTALL_PLATFORM_RPM="${SDK_ARCH}"
+	export INSTALL_PLATFORM_RPM="$(echo ${TARGET_ARCH} | tr - _)${SDK_VENDOR}-${SDK_OS}"
 	export INSTALL_PACKAGES_RPM="${TOOLCHAIN_HOST_TASK}"
 	export INSTALL_PACKAGES_ATTEMPTONLY_RPM="${TOOLCHAIN_TARGET_HOST_ATTEMPTONLY}"
 	export INSTALL_PACKAGES_LINGUAS_RPM=""
@@ -96,7 +107,8 @@ populate_sdk_rpm () {
 	# List must be prefered to least preferred order
 	INSTALL_PLATFORM_EXTRA_RPM=""
 	for each_arch in ${SDK_PACKAGE_ARCHS} ; do
-		INSTALL_PLATFORM_EXTRA_RPM="$each_arch $INSTALL_PLATFORM_EXTRA_RPM"
+		platform="$(echo $each_arch | tr - _)-.*-${SDK_OS}"
+		INSTALL_PLATFORM_EXTRA_RPM="$platform $INSTALL_PLATFORM_EXTRA_RPM"
 	done
 	export INSTALL_PLATFORM_EXTRA_RPM
 
@@ -121,7 +133,9 @@ python () {
     # package_arch order is reversed.  This ensures the -best- match is listed first!
     package_archs = d.getVar("PACKAGE_ARCHS", True) or ""
     package_archs = ":".join(package_archs.split()[::-1])
+    package_os = d.getVar("TARGET_OS", True) or ""
     ml_prefix_list = "%s:%s" % ('default', package_archs)
+    ml_os_list = "%s:%s" % ('default', package_os)
     multilibs = d.getVar('MULTILIBS', True) or ""
     for ext in multilibs.split():
         eext = ext.split(':')
@@ -130,9 +144,13 @@ python () {
             default_tune = localdata.getVar("DEFAULTTUNE_virtclass-multilib-" + eext[1], False)
             if default_tune:
                 localdata.setVar("DEFAULTTUNE", default_tune)
+                bb.data.update_data(localdata)
             package_archs = localdata.getVar("PACKAGE_ARCHS", True) or ""
             package_archs = ":".join([i in "all noarch any".split() and i or eext[1]+"_"+i for i in package_archs.split()][::-1])
+            package_os = localdata.getVar("TARGET_OS", True) or ""
             ml_prefix_list += " %s:%s" % (eext[1], package_archs)
+            ml_os_list += " %s:%s" % (eext[1], package_os)
     d.setVar('MULTILIB_PREFIX_LIST', ml_prefix_list)
+    d.setVar('MULTILIB_OS_LIST', ml_os_list)
 }
 
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 920380e..9dc2bf9 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -50,7 +50,7 @@ fakeroot rootfs_rpm_do_rootfs () {
 	# install packages
 	# This needs to work in the same way as populate_sdk_rpm.bbclass!
 	export INSTALL_ROOTFS_RPM="${IMAGE_ROOTFS}"
-	export INSTALL_PLATFORM_RPM="${TARGET_ARCH}"
+	export INSTALL_PLATFORM_RPM="$(echo ${TARGET_ARCH} | tr - _)${TARGET_VENDOR}-${TARGET_OS}"
 	export INSTALL_PACKAGES_RPM="${PACKAGE_INSTALL}"
 	export INSTALL_PACKAGES_ATTEMPTONLY_RPM="${PACKAGE_INSTALL_ATTEMPTONLY}"
 	export INSTALL_PACKAGES_LINGUAS_RPM="${LINGUAS_INSTALL}"
@@ -64,20 +64,31 @@ fakeroot rootfs_rpm_do_rootfs () {
 	# List must be prefered to least preferred order
 	default_extra_rpm=""
 	INSTALL_PLATFORM_EXTRA_RPM=""
-	for i in ${MULTILIB_PREFIX_LIST} ; do
+	for os in ${MULTILIB_OS_LIST} ; do
 		old_IFS="$IFS"
 		IFS=":"
-		set $i
+		set -- $os
 		IFS="$old_IFS"
 		mlib=$1
-		shift #remove mlib
-		while [ -n "$1" ]; do
-			if [ "$mlib" = "${BBEXTENDVARIANT}" ]; then
-				default_extra_rpm="$default_extra_rpm $1"
-			else
-				INSTALL_PLATFORM_EXTRA_RPM="$INSTALL_PLATFORM_EXTRA_RPM $1"
+		mlib_os=$2
+		for prefix in ${MULTILIB_PREFIX_LIST} ; do
+			old_IFS="$IFS"
+			IFS=":"
+			set -- $prefix
+			IFS="$old_IFS"
+			if [ "$mlib" != "$1" ]; then
+				continue
 			fi
-			shift
+			shift #remove mlib
+			while [ -n "$1" ]; do
+				platform="$(echo $1 | tr - _)-.*-$mlib_os"
+				if [ "$mlib" = "${BBEXTENDVARIANT}" ]; then
+					default_extra_rpm="$default_extra_rpm $platform"
+				else
+					INSTALL_PLATFORM_EXTRA_RPM="$INSTALL_PLATFORM_EXTRA_RPM $platform"
+				fi
+				shift
+			done
 		done
 	done
 	if [ -n "$default_extra_rpm" ]; then
@@ -210,7 +221,9 @@ python () {
     # package_arch order is reversed.  This ensures the -best- match is listed first!
     package_archs = d.getVar("PACKAGE_ARCHS", True) or ""
     package_archs = ":".join(package_archs.split()[::-1])
+    package_os = d.getVar("TARGET_OS", True) or ""
     ml_prefix_list = "%s:%s" % ('default', package_archs)
+    ml_os_list = "%s:%s" % ('default', package_os)
     multilibs = d.getVar('MULTILIBS', True) or ""
     for ext in multilibs.split():
         eext = ext.split(':')
@@ -219,8 +232,12 @@ python () {
             default_tune = localdata.getVar("DEFAULTTUNE_virtclass-multilib-" + eext[1], False)
             if default_tune:
                 localdata.setVar("DEFAULTTUNE", default_tune)
+                bb.data.update_data(localdata)
             package_archs = localdata.getVar("PACKAGE_ARCHS", True) or ""
             package_archs = ":".join([i in "all noarch any".split() and i or eext[1]+"_"+i for i in package_archs.split()][::-1])
+            package_os = localdata.getVar("TARGET_OS", True) or ""
             ml_prefix_list += " %s:%s" % (eext[1], package_archs)
+            ml_os_list += " %s:%s" % (eext[1], package_os)
     d.setVar('MULTILIB_PREFIX_LIST', ml_prefix_list)
+    d.setVar('MULTILIB_OS_LIST', ml_os_list)
 }
-- 
1.8.1.2.545.g2f19ada



