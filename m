Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1Th7MX-00044C-Q1
	for openembedded-core@lists.openembedded.org;
	Sat, 08 Dec 2012 00:29:46 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qB7NFHnx020595
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Dec 2012 15:15:17 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Fri, 7 Dec 2012 15:15:17 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Dec 2012 17:30:30 -0600
Message-ID: <1354923030-23316-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 4/6 v3] package_rpm: Update the way the multilib package names are translated
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
X-List-Received-Date: Fri, 07 Dec 2012 23:29:46 -0000
Content-Type: text/plain

The variable MULTILIB_PACKAGE_ARCHS has been removed in favor of a
repurposed MULTILIB_PREFIX_LIST.  The format of this item is now
<libid>:<arch>:<arch1>:...:<archN>.  This ensures that we can correctly
translate the libid to one of the supported archs in a tri-lib system.

All of the users of MULTILIB_PREFIX_LIST and MULTILIB_PACKAGE_ARCHS have
been modified accordingly.

Also change the way attempted packages are installed, verify the package
exists in the translate functions, then perform the install in one single
operation.  This results in a significantly faster install time.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass      |  185 ++++++++++++++++++++++++++++++--
 meta/classes/populate_sdk_rpm.bbclass |   28 +++--
 meta/classes/rootfs_rpm.bbclass       |   47 ++++-----
 3 files changed, 214 insertions(+), 46 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 4b81b68..f1b30a3 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -24,11 +24,25 @@ package_update_index_rpm () {
 		return
 	fi
 
-	base_archs="`echo ${PACKAGE_ARCHS} | sed 's/-/_/g'`"
-	ml_archs="`echo ${MULTILIB_PACKAGE_ARCHS} | sed 's/-/_/g'`"
-	sdk_archs="`echo ${SDK_PACKAGE_ARCHS} | sed 's/-/_/g'`"
+	sdk_archs="${SDK_PACKAGE_ARCHS}"
+	sdk_archs=${sdk_archs//-/_}
+
+	target_archs=""
+	for i in ${MULTILIB_PREFIX_LIST} ; do
+		old_IFS="$IFS"
+		IFS=":"
+		set $i
+		IFS="$old_IFS"
+		shift # remove mlib
+		while [ -n "$1" ]; do
+			target_archs="$target_archs $1"
+			shift
+		done
+	done
 
-	archs=`for arch in $base_archs $ml_archs $sdk_archs ; do
+	target_archs=${target_archs//-/_}
+
+	archs=`for arch in $target_archs $sdk_archs ; do
 		echo $arch
 	done | sort | uniq`
 
@@ -59,6 +73,141 @@ rpm_log_check() {
 	true
 }
 
+# Translate the RPM/Smart format names to the OE multilib format names
+# Input via stdin (only the first item per line is converted!)
+# Output via stdout
+translate_smart_to_oe() {
+	arg1="$1"
+
+	# Dump installed packages
+	while read pkg arch other ; do
+		if [ -z "$pkg" ]; then
+			continue
+		fi
+		new_pkg=$pkg
+		for i in ${MULTILIB_PREFIX_LIST} ; do
+			old_IFS="$IFS"
+			IFS=":"
+			set $i
+			IFS="$old_IFS"
+			mlib="$1"
+			shift
+			while [ -n "$1" ]; do
+				cmp_arch=$1
+				shift
+				if [ "$arch" = "$cmp_arch" -o "${arch//_/-}" = "$cmp_arch" ]; then
+					if [ "$mlib" = "default" ]; then
+						new_pkg="$pkg"
+					else
+						new_pkg="$mlib-$pkg"
+					fi
+					break
+				fi
+			done
+			if [ "$arch" = "$cmp_arch" -o "${arch//_/-}" = "$cmp_arch" ]; then
+				break
+			fi
+		done
+
+		#echo "$pkg -> $new_pkg" >&2
+		if [ "$arg1" = "arch" ]; then
+			echo $new_pkg $cmp_arch $other
+		else
+			echo $new_pkg $other
+		fi
+	done
+}		
+
+# Translate the OE multilib format names to the RPM/Smart format names
+# Input via arguments
+# Ouput via pkgs_to_install
+translate_oe_to_smart() {
+	default_archs=""
+	sdk_mode=""
+	if [ "$1" = "--sdk" ]; then
+		shift
+		sdk_mode="true"
+		# Need to reverse the order of the SDK_ARCHS highest -> lowest priority
+		for arch in ${SDK_PACKAGE_ARCHS} ; do
+		        default_archs="${archs//-/_} $default_archs"
+		done
+	fi
+
+	attemptonly="Error"
+	if [ "$1" = "--attemptonly" ]; then
+		attemptonly="Warning"
+		shift
+	fi
+
+	# Dump a list of all available packages
+	[ ! -e ${target_rootfs}/install/tmp/fullpkglist.query ] && smart --data-dir=${target_rootfs}/var/lib/smart query --output ${target_rootfs}/install/tmp/fullpkglist.query
+
+	pkgs_to_install=""
+	for pkg in "$@" ; do
+		new_pkg="$pkg"
+		if [ -z "$sdk_mode" ]; then
+			for i in ${MULTILIB_PREFIX_LIST} ; do
+				old_IFS="$IFS"
+				IFS=":"
+				set $i
+				IFS="$old_IFS"
+				mlib="$1"
+				shift
+				if [ "$mlib" = "default" ]; then
+					if [ -z "$default_archs" ]; then
+						default_archs=$@
+					fi
+					continue
+				fi
+				subst=${pkg#${mlib}-}
+				if [ "$subst" != "$pkg" ]; then
+					feeds=$@
+					while [ -n "$1" ]; do
+						arch="$1"
+						arch=${arch//-/_}
+						shift
+						if grep -q '^'$subst'-[^-]*-[^-]*@'$arch'$' ${target_rootfs}/install/tmp/fullpkglist.query ; then
+							new_pkg="$subst@$arch"
+							# First found is best match
+							break
+						fi
+					done
+					if [ "$pkg" = "$new_pkg" ]; then
+						# Failed to translate, package not found!
+						echo "$attemptonly: $pkg not found in the $mlib feeds ($feeds)." >&2
+						if [ "$attemptonly" = "Error" ]; then
+							exit 1
+						fi
+						continue
+					fi
+				fi
+			done
+		fi
+		# Apparently not a multilib package...
+		if [ "$pkg" = "$new_pkg" ]; then
+			for arch in $default_archs ; do
+				arch=${arch//-/_}
+				if grep -q '^'$pkg'-[^-]*-[^-]*@'$arch'$' ${target_rootfs}/install/tmp/fullpkglist.query ; then
+					new_pkg="$pkg@$arch"
+					# First found is best match
+					break
+				fi
+			done
+			if [ "$pkg" = "$new_pkg" ]; then
+				# Failed to translate, package not found!
+				echo "$attemptonly: $pkg not found in the base feeds ($default_archs)." >&2
+				if [ "$attemptonly" = "Error" ]; then
+					exit 1
+				fi
+				continue
+			fi
+		fi
+		#echo "$pkg -> $new_pkg" >&2
+		pkgs_to_install="${pkgs_to_install} ${new_pkg}"
+	done
+	export pkgs_to_install
+}
+
 
 #
 # Install a bunch of packages using rpm.
@@ -96,18 +245,26 @@ package_install_internal_rpm () {
 	local providename="$INSTALL_PROVIDENAME_RPM"
 	local task="$INSTALL_TASK_RPM"
 
+	local sdk_mode=""
+	if [ "$1" = "--sdk" ]; then
+		sdk_mode="--sdk"
+	fi
+
 	# Configure internal RPM environment when using Smart
 	export RPM_ETCRPM=${target_rootfs}/etc/rpm
 
 	# Setup temporary directory -- install...
-	mkdir -p ${target_rootfs}/install
+	rm -rf ${target_rootfs}/install
+	mkdir -p ${target_rootfs}/install/tmp
 
+	channel_priority=5
 	if [ "${INSTALL_COMPLEMENTARY_RPM}" != "1" ] ; then
 		# Setup base system configuration
 		mkdir -p ${target_rootfs}/etc/rpm/
 		echo "${platform}${TARGET_VENDOR}-${TARGET_OS}" > ${target_rootfs}/etc/rpm/platform
 		if [ ! -z "$platform_extra" ]; then
 			for pt in $platform_extra ; do
+				channel_priority=$(expr $channel_priority + 5)
 				case $pt in
 					noarch | any | all)
 						os="`echo ${TARGET_OS} | sed "s,-.*,,"`.*"
@@ -179,10 +336,13 @@ EOF
 		smart --data-dir=${target_rootfs}/var/lib/smart channel --add rpmsys type=rpm-sys -y
 
 		for arch in $platform_extra ; do
+			arch=${arch//-/_}
 			if [ -d ${DEPLOY_DIR_RPM}/$arch -a ! -e ${target_rootfs}/install/channel.$arch.stamp ] ; then
 				smart --data-dir=${target_rootfs}/var/lib/smart channel --add $arch type=rpm-md type=rpm-md baseurl=${DEPLOY_DIR_RPM}/$arch -y
+				smart --data-dir=${target_rootfs}/var/lib/smart channel --set $arch priority=$channel_priority
 				touch ${target_rootfs}/install/channel.$arch.stamp
 			fi
+			channel_priority=$(expr $channel_priority - 5)
 		done
 	fi
 
@@ -218,14 +378,15 @@ EOF
 	chmod 0755 ${WORKDIR}/scriptlet_wrapper
 	smart --data-dir=${target_rootfs}/var/lib/smart config --set rpm-extra-macros._cross_scriptlet_wrapper=${WORKDIR}/scriptlet_wrapper
 
-	smart --data-dir=${target_rootfs}/var/lib/smart install -y ${package_to_install} ${package_linguas}
+	# Determine what to install
+	translate_oe_to_smart ${sdk_mode} ${package_to_install} ${package_linguas}
 
-	if [ ! -z "${package_attemptonly}" ]; then
-		echo "Installing attempt only packages..."
-		for pkg_name in ${package_attemptonly} ; do
-			echo "Attempting $pkg_name..." >> "`dirname ${BB_LOGFILE}`/log.do_${task}_attemptonly.${PID}"
-			smart --data-dir=${target_rootfs}/var/lib/smart install -y $pkg_name >> "`dirname ${BB_LOGFILE}`/log.do_${task}_attemptonly.${PID}" 2>&1 || true
-		done
+	[ -n "$pkgs_to_install" ] && smart --data-dir=${target_rootfs}/var/lib/smart install -y ${pkgs_to_install}
+
+	if [ -n "${package_attemptonly}" ]; then
+		translate_oe_to_smart ${sdk_mode} --attemptonly $package_attemptonly
+		echo "Attempting $pkgs_to_install"
+		smart --data-dir=${target_rootfs}/var/lib/smart install -y $pkgs_to_install >> "`dirname ${BB_LOGFILE}`/log.do_${task}_attemptonly.${PID}" 2>&1 || true
 	fi
 }
 
diff --git a/meta/classes/populate_sdk_rpm.bbclass b/meta/classes/populate_sdk_rpm.bbclass
index 1d6b1be..396f1a2 100644
--- a/meta/classes/populate_sdk_rpm.bbclass
+++ b/meta/classes/populate_sdk_rpm.bbclass
@@ -52,8 +52,16 @@ populate_sdk_rpm () {
 
 	# List must be prefered to least preferred order
 	INSTALL_PLATFORM_EXTRA_RPM=""
-	for each_arch in ${MULTILIB_PACKAGE_ARCHS} ${PACKAGE_ARCHS} ; do
-		INSTALL_PLATFORM_EXTRA_RPM="$each_arch $INSTALL_PLATFORM_EXTRA_RPM"
+	for i in ${MULTILIB_PREFIX_LIST} ; do
+		old_IFS="$IFS"
+		IFS=":"
+		set $i
+		IFS="$old_IFS"
+		shift #remove mlib
+		while [ -n "$1" ]; do
+			INSTALL_PLATFORM_EXTRA_RPM="$INSTALL_PLATFORM_EXTRA_RPM $1"
+			shift
+		done
 	done
 	export INSTALL_PLATFORM_EXTRA_RPM
 
@@ -79,7 +87,7 @@ populate_sdk_rpm () {
 	done
 	export INSTALL_PLATFORM_EXTRA_RPM
 
-	package_install_internal_rpm
+	package_install_internal_rpm --sdk
 	populate_sdk_post_rpm ${INSTALL_ROOTFS_RPM}
 
 	# move host RPM library data
@@ -96,8 +104,11 @@ populate_sdk_rpm () {
 
 python () {
     # The following code should be kept in sync w/ the rootfs_rpm version.
-    ml_package_archs = ""
-    ml_prefix_list = ""
+
+    # package_arch order is reversed.  This ensures the -best- match is listed first!
+    package_archs = d.getVar("PACKAGE_ARCHS", True) or ""
+    package_archs = ":".join(package_archs.split()[::-1])
+    ml_prefix_list = "%s:%s" % ('default', package_archs)
     multilibs = d.getVar('MULTILIBS', True) or ""
     for ext in multilibs.split():
         eext = ext.split(':')
@@ -107,11 +118,8 @@ python () {
             if default_tune:
                 localdata.setVar("DEFAULTTUNE", default_tune)
             package_archs = localdata.getVar("PACKAGE_ARCHS", True) or ""
-            package_archs = " ".join([i in "all noarch any".split() and i or eext[1]+"_"+i for i in package_archs.split()])
-            ml_package_archs += " " + package_archs
-            ml_prefix_list += " " + eext[1]
-            #bb.note("ML_PACKAGE_ARCHS %s %s %s" % (eext[1], localdata.getVar("PACKAGE_ARCHS", True) or "(none)", overrides))
-    d.setVar('MULTILIB_PACKAGE_ARCHS', ml_package_archs)
+            package_archs = ":".join([i in "all noarch any".split() and i or eext[1]+"_"+i for i in package_archs.split()][::-1])
+            ml_prefix_list += " %s:%s" % (eext[1], package_archs)
     d.setVar('MULTILIB_PREFIX_LIST', ml_prefix_list)
 }
 
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index a507ad6..5000956 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -62,8 +62,16 @@ fakeroot rootfs_rpm_do_rootfs () {
 
 	# List must be prefered to least preferred order
 	INSTALL_PLATFORM_EXTRA_RPM=""
-	for each_arch in ${MULTILIB_PACKAGE_ARCHS} ${PACKAGE_ARCHS}; do
-		INSTALL_PLATFORM_EXTRA_RPM="$each_arch $INSTALL_PLATFORM_EXTRA_RPM"
+	for i in ${MULTILIB_PREFIX_LIST} ; do
+		old_IFS="$IFS"
+		IFS=":"
+		set $i
+		IFS="$old_IFS"
+		shift #remove mlib
+		while [ -n "$1" ]; do  
+			INSTALL_PLATFORM_EXTRA_RPM="$INSTALL_PLATFORM_EXTRA_RPM $1"
+			shift
+		done
 	done
 	export INSTALL_PLATFORM_RPM
 
@@ -143,21 +151,12 @@ rpm_setup_smart_target_config() {
 RPM_QUERY_CMD = '${RPM} --root $INSTALL_ROOTFS_RPM -D "_dbpath ${rpmlibdir}"'
 
 list_installed_packages() {
-	GET_LIST=$(${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{ARCH} %{PACKAGEORIGIN} %{Platform}\n]")
-
-	# Use awk to find the multilib prefix and compare it
-	# with the platform RPM thinks it is part of
-	for prefix in `echo ${MULTILIB_PREFIX_LIST}`; do
-		GET_LIST=$(echo "$GET_LIST" | awk -v prefix="$prefix" '$0 ~ prefix {printf("%s-%s\n", prefix, $0); } $0 !~ prefix {print $0}')
-	done
-
-	# print the info, need to different return counts
-	if [ "$1" = "arch" ] ; then
-		echo "$GET_LIST" | awk -v archs="${PACKAGE_ARCHS}" '{if(!index(archs, $2)) {gsub("_", "-", $2)} print $1, $2}'
-        elif [ "$1" = "file" ] ; then
-		echo "$GET_LIST" | awk '{print $1, $3}'
-        else
-		echo "$GET_LIST" | awk '{print $1}' 
+	if [ "$1" = "arch" ]; then
+		${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{ARCH}\n]" | translate_smart_to_oe arch | tee /tmp/arch_list
+	elif [ "$1" = "file" ]; then
+		${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{ARCH} %{PACKAGEORIGIN}\n]" | translate_smart_to_oe | tee /tmp/file_list
+	else
+		${RPM_QUERY_CMD} -qa --qf "[%{NAME} %{ARCH}\n]" | translate_smart_to_oe | tee /tmp/default_list
 	fi
 }
 
@@ -187,8 +186,11 @@ python () {
         d.setVar('RPM_POSTPROCESS_COMMANDS', '')
 
     # The following code should be kept in sync w/ the populate_sdk_rpm version.
-    ml_package_archs = ""
-    ml_prefix_list = ""
+
+    # package_arch order is reversed.  This ensures the -best- match is listed first!
+    package_archs = d.getVar("PACKAGE_ARCHS", True) or ""
+    package_archs = ":".join(package_archs.split()[::-1])
+    ml_prefix_list = "%s:%s" % ('default', package_archs)
     multilibs = d.getVar('MULTILIBS', True) or ""
     for ext in multilibs.split():
         eext = ext.split(':')
@@ -198,10 +200,7 @@ python () {
             if default_tune:
                 localdata.setVar("DEFAULTTUNE", default_tune)
             package_archs = localdata.getVar("PACKAGE_ARCHS", True) or ""
-            package_archs = " ".join([i in "all noarch any".split() and i or eext[1]+"_"+i for i in package_archs.split()])
-            ml_package_archs += " " + package_archs
-            ml_prefix_list += " " + eext[1]
-            #bb.note("ML_PACKAGE_ARCHS %s %s %s" % (eext[1], localdata.getVar("PACKAGE_ARCHS", True) or "(none)", overrides))
-    d.setVar('MULTILIB_PACKAGE_ARCHS', ml_package_archs)
+            package_archs = ":".join([i in "all noarch any".split() and i or eext[1]+"_"+i for i in package_archs.split()][::-1])
+            ml_prefix_list += " %s:%s" % (eext[1], package_archs)
     d.setVar('MULTILIB_PREFIX_LIST', ml_prefix_list)
 }
-- 
1.7.3.4



