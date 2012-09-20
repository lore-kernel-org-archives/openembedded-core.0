Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TEdiA-0006dg-Fl
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Sep 2012 12:10:22 +0200
Received: by pbcwy7 with SMTP id wy7so4546684pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2012 02:57:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=atk/B6aKa1ZtPyU8vtHL3eBhwRupsyu0B1rB/ScMFYw=;
	b=U14gQjMiRJKvBys7uSWy1RSW4YlQFXJT4ePu2XkoFjcMP/liKd3uzA5BeDYz4PHsdR
	PcljO3DzzAZ+4a+WXWqlrZjLDxzvfHT3fU7fJj8B36izRLSRaYvJ8Cpju811FSvIL+Fv
	qfa09qTCwOXSpiXw7vflMn3QYkVxezlrJlJnP8/Q37JIKuAgbQqfBMsvZMF9ZJk139e0
	nLmiKledo5KAnnUIiD/yP31OlSkphMhOJNzxTvSbTZFjY6dykG2v7XOmWH5skhviPV7q
	5yepnGf3cu9N3edkkyp+LgqENEyeR6jXcE7g1KuUAyYpvQm0UPEOQS6m64jW0DfKXV1e
	VtIQ==
Received: by 10.68.218.196 with SMTP id pi4mr5136377pbc.128.1348135059313;
	Thu, 20 Sep 2012 02:57:39 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id b10sm2222685pav.17.2012.09.20.02.57.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 20 Sep 2012 02:57:38 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Sep 2012 12:56:59 +0300
Message-Id: <1348135019-19878-1-git-send-email-andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQkCazeYr+gDxCf6C3A347xRCPCk2LavoxSNEsYiD7pkIGazg9cCxQ2gmsH3KQRs7k1WTqiw
Subject: [PATCH V2] Replace "echo -e" with "printf" to have the same behavior in dash or bash
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
X-List-Received-Date: Thu, 20 Sep 2012 10:10:22 -0000

oe-core removed the prerequisite to have sh as bash. POSIX doesn't define
any options and furthermore allows 'echo -e' to be the default behavior.
This means that in dash 'echo -e' will actually print '-e' and interpret
backslashes by default. We use instead 'printf' builtin command with or
without '\n' to simulate 'echo -e' or 'echo -n'.
'printf' needs format while 'echo' can be used without any arguments. So
'echo >' was replaced by 'printf "" >'.
'echo' without '-n' flag adds a new line by default so to keep the same
behavior of two new lines while using 'echo "\n"', 'printf "\n\n"' is
used.

[YOCTO #3138]

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/classes/buildhistory.bbclass                 |    6 +++---
 meta/classes/cml1.bbclass                         |    2 +-
 meta/classes/license.bbclass                      |    6 +++---
 meta/classes/package_deb.bbclass                  |    2 +-
 meta/classes/package_ipk.bbclass                  |    2 +-
 meta/classes/package_rpm.bbclass                  |    6 +++---
 meta/classes/populate_sdk_base.bbclass            |    8 ++++----
 meta/recipes-core/base-files/base-files_3.0.14.bb |    8 ++++----
 meta/recipes-extended/libzypp/libzypp_git.bb      |    4 ++--
 meta/recipes-extended/lsb/lsb_4.1.bb              |    6 +++---
 scripts/contrib/ddimage                           |    2 +-
 11 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index e121088..8519c74 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -293,13 +293,13 @@ buildhistory_get_image_installed() {
 	# Change delimiter from pipe to -> and set style for recommend lines
 	sed -i -e 's:|: -> :' -e 's:\[REC\]:[style=dotted]:' -e 's:$:;:' ${BUILDHISTORY_DIR_IMAGE}/depends.tmp
 	# Add header, sorted and de-duped contents and footer and then delete the temp file
-	echo -e "digraph depends {\n    node [shape=plaintext]" > ${BUILDHISTORY_DIR_IMAGE}/depends.dot
+	printf "digraph depends {\n    node [shape=plaintext]\n" > ${BUILDHISTORY_DIR_IMAGE}/depends.dot
 	cat ${BUILDHISTORY_DIR_IMAGE}/depends.tmp | sort | uniq >> ${BUILDHISTORY_DIR_IMAGE}/depends.dot
 	echo "}" >>  ${BUILDHISTORY_DIR_IMAGE}/depends.dot
 	rm ${BUILDHISTORY_DIR_IMAGE}/depends.tmp
 
 	# Produce installed package sizes list
-	echo -n > ${BUILDHISTORY_DIR_IMAGE}/installed-package-sizes.tmp
+	printf "" > ${BUILDHISTORY_DIR_IMAGE}/installed-package-sizes.tmp
 	cat $pkgcache | while read pkg pkgfile
 	do
 		if [ -f $pkgfile ] ; then
@@ -330,7 +330,7 @@ buildhistory_get_imageinfo() {
 	( cd ${IMAGE_ROOTFS} && find . -ls | awk '{ if ( $7 ~ /[0-9]/ ) printf "%s %10-s %10-s %10s %s %s %s\n", $3, $5, $6, $7, $11, $12, $13 ; else printf "%s %10-s %10-s %10s %s %s %s\n", $3, $5, $6, 0, $10, $11, $12 }' | sort -k5 > ${BUILDHISTORY_DIR_IMAGE}/files-in-image.txt )
 
 	# Record some machine-readable meta-information about the image
-	echo -n > ${BUILDHISTORY_DIR_IMAGE}/image-info.txt
+	printf ""  > ${BUILDHISTORY_DIR_IMAGE}/image-info.txt
 	cat >> ${BUILDHISTORY_DIR_IMAGE}/image-info.txt <<END
 ${@buildhistory_get_imagevars(d)}
 END
diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index 67f17ad..37ed792 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -20,7 +20,7 @@ python do_menuconfig() {
         except OSError:
             mtime = 0
 
-        oe_terminal("${SHELL} -c \"make menuconfig; if [ $? -ne 0 ]; then echo 'Command failed.'; echo -n 'Press any key to continue... '; read r; fi\"", '${PN} Configuration', d)
+        oe_terminal("${SHELL} -c \"make menuconfig; if [ $? -ne 0 ]; then echo 'Command failed.'; printf 'Press any key to continue... '; read r; fi\"", '${PN} Configuration', d)
 
         # FIXME this check can be removed when the minimum bitbake version has been bumped
         if hasattr(bb.build, 'write_taint'):
diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index 29fe938..024e579 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -112,16 +112,16 @@ license_create_manifest() {
 		echo "PACKAGE NAME:" ${pkg} >> ${LICENSE_MANIFEST}
 		echo "PACKAGE VERSION:" ${pkged_pv} >> ${LICENSE_MANIFEST}
 		echo "RECIPE NAME:" ${pkged_pn} >> ${LICENSE_MANIFEST}
-		echo -n "LICENSE:" >> ${LICENSE_MANIFEST}
+		printf "LICENSE:" >> ${LICENSE_MANIFEST}
 		for lic in ${pkged_lic}; do
 			# to reference a license file trim trailing + symbol
 			if [ -e "${LICENSE_DIRECTORY}/${pkged_pn}/generic_${lic%+}" ]; then
-				echo -n " ${lic}" >> ${LICENSE_MANIFEST}
+				printf " ${lic}" >> ${LICENSE_MANIFEST}
 			else
 				echo "WARNING: The license listed ${lic} was not in the licenses collected for ${pkged_pn}"
 			fi
 		done
-		echo -e "\n" >> ${LICENSE_MANIFEST}
+		printf "\n\n" >> ${LICENSE_MANIFEST}
 	done
 
 	# Two options here:
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 48511df..a6d4e02 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -192,7 +192,7 @@ deb_log_check() {
 		if (echo "$lf_txt" | grep -v log_check | grep "$keyword_die") >/dev/null 2>&1
 		then
 			echo "log_check: There were error messages in the logfile"
-			echo -e "log_check: Matched keyword: [$keyword_die]\n"
+			printf "log_check: Matched keyword: [$keyword_die]\n\n"
 			echo "$lf_txt" | grep -v log_check | grep -C 5 -i "$keyword_die"
 			echo ""
 			do_exit=1
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index e94586e..dbf0feb 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -181,7 +181,7 @@ ipk_log_check() {
 		if (echo "$lf_txt" | grep -v log_check | grep "$keyword_die") >/dev/null 2>&1
 		then
 			echo "log_check: There were error messages in the logfile"
-			echo -e "log_check: Matched keyword: [$keyword_die]\n"
+			printf "log_check: Matched keyword: [$keyword_die]\n\n"
 			echo "$lf_txt" | grep -v log_check | grep -C 5 -i "$keyword_die"
 			echo ""
 			do_exit=1
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 61f0117..0972af5 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -110,7 +110,7 @@ rpm_log_check() {
 		if (echo "$lf_txt" | grep -v log_check | grep "$keyword_die") >/dev/null 2>&1
 		then
 			echo "log_check: There were error messages in the logfile"
-			echo -e "log_check: Matched keyword: [$keyword_die]\n"
+			printf "log_check: Matched keyword: [$keyword_die]\n\n"
 			echo "$lf_txt" | grep -v log_check | grep -C 5 -i "$keyword_die"
 			echo ""
 			do_exit=1
@@ -211,8 +211,8 @@ process_pkg_list_rpm() {
 	pkgs="$@"
 	local confbase=${INSTALL_CONFBASE_RPM}
 
-	echo -n > ${target_rootfs}/install/base_archs.pkglist
-	echo -n > ${target_rootfs}/install/ml_archs.pkglist
+	printf "" > ${target_rootfs}/install/base_archs.pkglist
+	printf "" > ${target_rootfs}/install/ml_archs.pkglist
 
 	for pkg in $pkgs; do
 		echo "Processing $pkg..."
diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 1c151d7..2bff41f 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -118,7 +118,7 @@ fakeroot create_shar() {
 
 DEFAULT_INSTALL_DIR="${SDKPATH}"
 
-echo -n "Enter target directory for Poky SDK (default: $DEFAULT_INSTALL_DIR): "
+printf "Enter target directory for Poky SDK (default: $DEFAULT_INSTALL_DIR): "
 read target_sdk_dir
 
 if [ "$target_sdk_dir" = "" ]; then
@@ -128,7 +128,7 @@ fi
 eval target_sdk_dir=$target_sdk_dir
 target_sdk_dir=$(readlink -m $target_sdk_dir)
 
-echo -n "You are about to install Poky SDK to \"$target_sdk_dir\". Proceed[Y/n]?"
+printf "You are about to install Poky SDK to \"$target_sdk_dir\". Proceed[Y/n]?"
 read answer
 
 if [ "$answer" = "" ]; then
@@ -148,11 +148,11 @@ fi
 
 payload_offset=$(($(grep -na -m1 "^MARKER:$" $(basename $0)|cut -d':' -f1) + 1))
 
-echo -n "Extracting SDK..."
+printf "Extracting SDK..."
 tail -n +$payload_offset $(basename $0) | tar xj --strip-components=4 -C $target_sdk_dir
 echo "done"
 
-echo -n "Setting it up..."
+printf "Setting it up..."
 # fix environment paths
 env_setup_script=$(find $target_sdk_dir -name "environment-setup-${REAL_MULTIMACH_TARGET_SYS}")
 sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g" -i $env_setup_script
diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
index e80cff1..ba355ee 100644
--- a/meta/recipes-core/base-files/base-files_3.0.14.bb
+++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
@@ -117,11 +117,11 @@ do_install_basefilesissue () {
 
 	install -m 644 ${WORKDIR}/issue*  ${D}${sysconfdir}  
         if [ -n "${DISTRO_NAME}" ]; then
-		echo -n "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
-		echo -n "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue.net
+		printf "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue
+		printf "${DISTRO_NAME} " >> ${D}${sysconfdir}/issue.net
 		if [ -n "${DISTRO_VERSION}" ]; then
-			echo -n "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue
-			echo -n "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue.net
+			printf "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue
+			printf "${DISTRO_VERSION} " >> ${D}${sysconfdir}/issue.net
 		fi
 		echo "\n \l" >> ${D}${sysconfdir}/issue
 		echo >> ${D}${sysconfdir}/issue
diff --git a/meta/recipes-extended/libzypp/libzypp_git.bb b/meta/recipes-extended/libzypp/libzypp_git.bb
index 3a323e7..1729c78 100644
--- a/meta/recipes-extended/libzypp/libzypp_git.bb
+++ b/meta/recipes-extended/libzypp/libzypp_git.bb
@@ -106,10 +106,10 @@ do_archgen () {
 				continue;;
 		esac
 		if [ "${AVOID_CONSTRUCTOR}" != "true" ]; then
-		  echo -n "  const Arch Arch_${each_arch} " | tr - _		>> zypp/oe-arch.h
+		  printf "  const Arch Arch_${each_arch} " | tr - _		>> zypp/oe-arch.h
 		  echo "(_${each_arch});" | tr - _				>> zypp/oe-arch.h
 		else
-		  echo -n "  const Arch Arch_${each_arch} " | tr - _		>> zypp/oe-arch.h
+		  printf "  const Arch Arch_${each_arch} " | tr - _		>> zypp/oe-arch.h
 		  echo "( IdString ( \"${each_arch}\" ) );" | tr - _		>> zypp/oe-arch.h
 		fi
 	done
diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
index a3242db..55ea241 100644
--- a/meta/recipes-extended/lsb/lsb_4.1.bb
+++ b/meta/recipes-extended/lsb/lsb_4.1.bb
@@ -31,12 +31,12 @@ do_install(){
 	mkdir -p ${D}${base_bindir}
 	mkdir -p ${D}/${baselib}
 	mkdir -p ${D}${sysconfdir}/lsb-release.d
-	echo -n "LSB_VERSION=\"core-4.1-noarch:" > ${D}${sysconfdir}/lsb-release
+	printf "LSB_VERSION=\"core-4.1-noarch:" > ${D}${sysconfdir}/lsb-release
 
 	if [ "${TARGET_ARCH}" = "i586" ];then
-		echo -n "core-4.1-ia32" >>  ${D}${sysconfdir}/lsb-release
+		printf "core-4.1-ia32" >>  ${D}${sysconfdir}/lsb-release
 	else
-		echo -n "core-4.1-${TARGET_ARCH}" >>  ${D}${sysconfdir}/lsb-release
+		printf "core-4.1-${TARGET_ARCH}" >>  ${D}${sysconfdir}/lsb-release
 	fi
 	echo "\"" >> ${D}${sysconfdir}/lsb-release
 	echo "DISTRIB_ID=${DISTRO}" >> ${D}${sysconfdir}/lsb-release
diff --git a/scripts/contrib/ddimage b/scripts/contrib/ddimage
index 2cba9b2..956699c 100755
--- a/scripts/contrib/ddimage
+++ b/scripts/contrib/ddimage
@@ -75,7 +75,7 @@ fi
 image_details $IMAGE
 device_details $(basename $DEVICE)
 
-echo -n "Write $IMAGE to $DEVICE [y/N]? "
+printf "Write $IMAGE to $DEVICE [y/N]? "
 read RESPONSE
 if [ "$RESPONSE" != "y" ]; then
 	echo "Write aborted"
-- 
1.7.9.5



