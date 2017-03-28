Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id 7893177A57
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 10:50:54 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20170328105054700_0485
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 10:50:54 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [216.191.234.70] (port=28687 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1csoi8-0003fk-SS for openembedded-core@lists.openembedded.org;
	Tue, 28 Mar 2017 06:50:48 -0400
Date: Tue, 28 Mar 2017 06:50:46 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1703280641380.4243@uk63952.mitel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: [PATCH] classes: Standardize strings tests, and join some if/then/while/do lines
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Mar 2017 10:50:55 -0000
Content-Type: text/plain; charset=US-ASCII


For better or worse, two types of cleanup in meta/classes directory:

* Replace old-style 'x${VAR} = x' tests with -n/-z string tests
* Unsplit lines to keep if/then, while/do on same line

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

  i realize there are two types of tidying here -- if that offends
people, i can split it into two separate submissions. nothing here
should affect execution, but it's always possible i screwed something
up, not sure how to rigourously test these changes.

  also, when i did change a shell string test, i added {} around the
variable name, it's just a standard i like for visual clarity. apply
all or part of what seems useful.

diff --git a/meta/classes/extrausers.bbclass b/meta/classes/extrausers.bbclass
index 7709407..9169061 100644
--- a/meta/classes/extrausers.bbclass
+++ b/meta/classes/extrausers.bbclass
@@ -26,7 +26,7 @@ set_user_group () {
 	export PSEUDO="${FAKEROOTENV} ${STAGING_DIR_NATIVE}${bindir}/pseudo"
 	setting=`echo $user_group_settings | cut -d ';' -f1`
 	remaining=`echo $user_group_settings | cut -d ';' -f2-`
-	while test "x$setting" != "x"; do
+	while [ -n "${setting}" ]; do
 		cmd=`echo $setting | cut -d ' ' -f1`
 		opts=`echo $setting | cut -d ' ' -f2-`
 		# Different from useradd.bbclass, there's no file locking issue here, as
diff --git a/meta/classes/gconf.bbclass b/meta/classes/gconf.bbclass
index 4e0ee2e..e8e3f34 100644
--- a/meta/classes/gconf.bbclass
+++ b/meta/classes/gconf.bbclass
@@ -15,7 +15,7 @@ EXTRA_OECONF += "--disable-schemas-install"
 export GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL = "1"

 gconf_postinst() {
-if [ "x$D" != "x" ]; then
+if [ -n "${D}" ]; then
 	export GCONF_CONFIG_SOURCE="xml::$D${sysconfdir}/gconf/gconf.xml.defaults"
 else
 	export GCONF_CONFIG_SOURCE=`gconftool-2 --get-default-source`
diff --git a/meta/classes/gio-module-cache.bbclass b/meta/classes/gio-module-cache.bbclass
index a8190b7..857422c 100644
--- a/meta/classes/gio-module-cache.bbclass
+++ b/meta/classes/gio-module-cache.bbclass
@@ -4,7 +4,7 @@ inherit qemu
 GIO_MODULE_PACKAGES ??= "${PN}"

 gio_module_cache_common() {
-if [ "x$D" != "x" ]; then
+if [ -n "${D}" ]; then
     $INTERCEPT_DIR/postinst_intercept update_gio_module_cache ${PKG} \
             mlprefix=${MLPREFIX} \
             binprefix=${MLPREFIX} \
diff --git a/meta/classes/gtk-icon-cache.bbclass b/meta/classes/gtk-icon-cache.bbclass
index d87167a..feda0e7 100644
--- a/meta/classes/gtk-icon-cache.bbclass
+++ b/meta/classes/gtk-icon-cache.bbclass
@@ -5,7 +5,7 @@ DEPENDS += "${@['hicolor-icon-theme', '']['${BPN}' == 'hicolor-icon-theme']} gtk
 PACKAGE_WRITE_DEPS += "gtk-icon-utils-native gdk-pixbuf-native"

 gtk_icon_cache_postinst() {
-if [ "x$D" != "x" ]; then
+if [ -n "${D}" ]; then
 	$INTERCEPT_DIR/postinst_intercept update_icon_cache ${PKG} \
 		mlprefix=${MLPREFIX} \
 		libdir_native=${libdir_native}
@@ -23,7 +23,7 @@ fi
 }

 gtk_icon_cache_postrm() {
-if [ "x$D" != "x" ]; then
+if [ -n "${D}" ]; then
 	$INTERCEPT_DIR/postinst_intercept update_icon_cache ${PKG} \
 		mlprefix=${MLPREFIX} \
 		libdir=${libdir}
diff --git a/meta/classes/gtk-immodules-cache.bbclass b/meta/classes/gtk-immodules-cache.bbclass
index 3d82dbe..3302a6b 100644
--- a/meta/classes/gtk-immodules-cache.bbclass
+++ b/meta/classes/gtk-immodules-cache.bbclass
@@ -9,7 +9,7 @@ inherit qemu
 GTKIMMODULES_PACKAGES ?= "${PN}"

 gtk_immodule_cache_postinst() {
-if [ "x$D" != "x" ]; then
+if [ -n "${D}" ]; then
         if [ -x $D${bindir}/gtk-query-immodules-2.0 ]; then
             IMFILES=$(ls $D${libdir}/gtk-2.0/*/immodules/*.so)
             ${@qemu_run_binary(d, '$D', '${bindir}/gtk-query-immodules-2.0')} \
@@ -35,7 +35,7 @@ fi
 }

 gtk_immodule_cache_postrm() {
-if [ "x$D" != "x" ]; then
+if [ -n "${D}" ]; then
         if [ -x $D${bindir}/gtk-query-immodules-2.0 ]; then
             IMFILES=$(ls $D${libdir}/gtk-2.0/*/immodules/*.so)
             ${@qemu_run_binary(d, '$D', '${bindir}/gtk-query-immodules-2.0')} \
diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 8a351cf..0d0ae3a 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -236,11 +236,9 @@ wait_for_file() {
     local TIME_ELAPSED=0
     local FILE_TO_TEST=$1
     local TIMEOUT=$2
-    until [ -f "$FILE_TO_TEST" ]
-    do
+    until [ -f "$FILE_TO_TEST" ]; do
         TIME_ELAPSED=`expr $TIME_ELAPSED + 1`
-        if [ $TIME_ELAPSED -gt $TIMEOUT ]
-        then
+        if [ $TIME_ELAPSED -gt $TIMEOUT ]; then
             return 1
         fi
         sleep 1
@@ -252,20 +250,17 @@ def set_icecc_env():
     return

 set_icecc_env() {
-    if [ "${@use_icecc(bb, d)}" = "no" ]
-    then
+    if [ "${@use_icecc(bb, d)}" = "no" ]; then
         return
     fi
     ICECC_VERSION="${@icecc_version(bb, d)}"
-    if [ "x${ICECC_VERSION}" = "x" ]
-    then
+    if [ -z "${ICECC_VERSION}" ]; then
         bbwarn "Cannot use icecc: could not get ICECC_VERSION"
         return
     fi

     ICE_PATH="${@icecc_path(bb, d)}"
-    if [ "x${ICE_PATH}" = "x" ]
-    then
+    if [ "x${ICE_PATH}" = "x" ]; then
         bbwarn "Cannot use icecc: could not get ICE_PATH"
         return
     fi
@@ -274,16 +269,14 @@ set_icecc_env() {
     ICECC_CXX="${@icecc_get_and_check_tool(bb, d, "g++")}"
     # cannot use icecc_get_and_check_tool here because it assumes as without target_sys prefix
     ICECC_WHICH_AS="${@bb.utils.which(os.getenv('PATH'), 'as')}"
-    if [ ! -x "${ICECC_CC}" -o ! -x "${ICECC_CXX}" ]
-    then
+    if [ ! -x "${ICECC_CC}" -o ! -x "${ICECC_CXX}" ]; then
         bbwarn "Cannot use icecc: could not get ICECC_CC or ICECC_CXX"
         return
     fi

     ICE_VERSION=`$ICECC_CC -dumpversion`
     ICECC_VERSION=`echo ${ICECC_VERSION} | sed -e "s/@VERSION@/$ICE_VERSION/g"`
-    if [ ! -x "${ICECC_ENV_EXEC}" ]
-    then
+    if [ ! -x "${ICECC_ENV_EXEC}" ]; then
         bbwarn "Cannot use icecc: invalid ICECC_ENV_EXEC"
         return
     fi
@@ -292,23 +285,19 @@ set_icecc_env() {
     # for target recipes should return something like:
     # /OE/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/arm920tt-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.8.2/as
     # and just "as" for native, if it returns "as" in current directory (for whatever reason) use "as" from PATH
-    if [ "`dirname "${ICECC_AS}"`" = "." ]
-    then
+    if [ "`dirname "${ICECC_AS}"`" = "." ]; then
         ICECC_AS="${ICECC_WHICH_AS}"
     fi

-    if [ ! -f "${ICECC_VERSION}.done" ]
-    then
+    if [ ! -f "${ICECC_VERSION}.done" ]; then
         mkdir -p "`dirname "${ICECC_VERSION}"`"

         # the ICECC_VERSION generation step must be locked by a mutex
         # in order to prevent race conditions
         if flock -n "${ICECC_VERSION}.lock" \
-            ${ICECC_ENV_EXEC} "${ICECC_CC}" "${ICECC_CXX}" "${ICECC_AS}" "${ICECC_VERSION}"
-        then
+            ${ICECC_ENV_EXEC} "${ICECC_CC}" "${ICECC_CXX}" "${ICECC_AS}" "${ICECC_VERSION}"; then
             touch "${ICECC_VERSION}.done"
-        elif [ ! wait_for_file "${ICECC_VERSION}.done" 30 ]
-        then
+        elif [ ! wait_for_file "${ICECC_VERSION}.done" 30 ]; then
             # locking failed so wait for ${ICECC_VERSION}.done to appear
             bbwarn "Timeout waiting for ${ICECC_VERSION}.done"
             return
diff --git a/meta/classes/image_types_uboot.bbclass b/meta/classes/image_types_uboot.bbclass
index 5dfa392..64ef5e9 100644
--- a/meta/classes/image_types_uboot.bbclass
+++ b/meta/classes/image_types_uboot.bbclass
@@ -3,7 +3,7 @@ inherit image_types kernel-arch
 oe_mkimage () {
     mkimage -A ${UBOOT_ARCH} -O linux -T ramdisk -C $2 -n ${IMAGE_NAME} \
         -d ${IMGDEPLOYDIR}/$1 ${IMGDEPLOYDIR}/$1.u-boot
-    if [ x$3 = x"clean" ]; then
+    if [ "${3}" = "clean" ]; then
         rm $1
     fi
 }
diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 8ae2eb6..cf73bb3 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -367,7 +367,7 @@ fitimage_assemble() {
 	#
 	# Step 4: Prepare a ramdisk section.
 	#
-	if [ "x${ramdiskcount}" = "x1" ] ; then
+	if [ "${ramdiskcount}" = "1" ] ; then
 		# Find and use the first initramfs image archive type we find
 		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz cpio.gz cpio; do
 			initramfs_path="${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE}-${MACHINE}.${img}"
@@ -415,7 +415,7 @@ fitimage_assemble() {
 	#
 	# Step 7: Sign the image and add public key to U-Boot dtb
 	#
-	if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ] ; then
+	if [ "${UBOOT_SIGN_ENABLE}" = "1" ] ; then
 		uboot-mkimage \
 			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
 			-F -k "${UBOOT_SIGN_KEYDIR}" \
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 244087a..a2c850c 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -206,7 +206,7 @@ copy_initramfs() {
 INITRAMFS_BASE_NAME ?= "initramfs-${PV}-${PR}-${MACHINE}-${DATETIME}"
 INITRAMFS_BASE_NAME[vardepsexclude] = "DATETIME"
 do_bundle_initramfs () {
-	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
+	if [ ! -z "${INITRAMFS_IMAGE}" -a "${INITRAMFS_IMAGE_BUNDLE}" = "1" ]; then
 		echo "Creating a kernel image with a bundled initramfs..."
 		copy_initramfs
 		# Backing up kernel image relies on its type(regular file or symbolic link)
@@ -327,7 +327,7 @@ do_install[prefuncs] += "package_get_auto_pr"

 # Must be ran no earlier than after do_kernel_checkout or else Makefile won't be in ${S}/Makefile
 do_kernel_version_sanity_check() {
-	if [ "x${KERNEL_VERSION_SANITY_SKIP}" = "x1" ]; then
+	if [ "${KERNEL_VERSION_SANITY_SKIP}" = "1" ]; then
 		exit 0
 	fi

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 739adce..2e78999 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -52,7 +52,7 @@ OVERRIDES_append = ":${TARGET_ARCH}-${TARGET_OS}"
 locale_base_postinst() {
 #!/bin/sh

-if [ "x$D" != "x" ]; then
+if [ -n "${D}" ]; then
 	exit 1
 fi

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 1bc4f6a..0afab04 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1428,7 +1428,7 @@ python emit_pkgdata() {
 emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime ${PKGDESTWORK}/runtime-reverse ${PKGDESTWORK}/runtime-rprovides"

 ldconfig_postinst_fragment() {
-if [ x"$D" = "x" ]; then
+if [ -z "${D}" ]; then
 	if [ -x /sbin/ldconfig ]; then /sbin/ldconfig ; fi
 fi
 }
diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index aa9815c..885ad38 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -11,7 +11,7 @@ PIXBUF_PACKAGES ??= "${PN}"
 PACKAGE_WRITE_DEPS += "qemu-native gdk-pixbuf-native"

 pixbufcache_common() {
-if [ "x$D" != "x" ]; then
+if [ -n "${D}" ]; then
 	$INTERCEPT_DIR/postinst_intercept update_pixbuf_cache ${PKG} mlprefix=${MLPREFIX} libdir=${libdir} \
 		bindir=${bindir} base_libdir=${base_libdir}
 else
diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-sign.bbclass
index 8ee904e..b1d72ae 100644
--- a/meta/classes/uboot-sign.bbclass
+++ b/meta/classes/uboot-sign.bbclass
@@ -63,8 +63,8 @@ do_deploy_dtb () {
 do_concat_dtb () {
 	# Concatenate U-Boot w/o DTB & DTB with public key
 	# (cf. kernel-fitimage.bbclass for more details)
-	if [ "x${UBOOT_SIGN_ENABLE}" = "x1" ]; then
-		if [ "x${UBOOT_SUFFIX}" = "ximg" -o "x${UBOOT_SUFFIX}" = "xrom" ] && \
+	if [ "${UBOOT_SIGN_ENABLE}" = "1" ]; then
+		if [ "${UBOOT_SUFFIX}" = "img" -o "${UBOOT_SUFFIX}" = "rom" ] && \
 			[ -e "${DEPLOYDIR}/${UBOOT_DTB_IMAGE}" ]; then
 			cd ${B}
 			oe_runmake EXT_DTB=${DEPLOYDIR}/${UBOOT_DTB_IMAGE}
diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
index 1f7afa4..f52cc94 100644
--- a/meta/classes/useradd.bbclass
+++ b/meta/classes/useradd.bbclass
@@ -17,7 +17,7 @@ useradd_preinst () {
 OPT=""
 SYSROOT=""

-if test "x$D" != "x"; then
+if [ -n "${D}" ]; then
 	# Installing into a sysroot
 	SYSROOT="$D"
 	OPT="--root $D"
@@ -37,7 +37,7 @@ fi

 # If we're not doing a special SSTATE/SYSROOT install
 # then set the values, otherwise use the environment
-if test "x$UA_SYSROOT" = "x"; then
+if [ -z "${UA_SYSROOT}" ]; then
 	# Installing onto a target
 	# Add groups and users defined only for this package
 	GROUPADD_PARAM="${GROUPADD_PARAM}"
@@ -53,9 +53,9 @@ if test "x`echo $GROUPADD_PARAM | tr -d '[:space:]'`" != "x"; then
 	# separated by ';'
 	opts=`echo "$GROUPADD_PARAM" | cut -d ';' -f 1 | sed -e 's#[ \t]*$##'`
 	remaining=`echo "$GROUPADD_PARAM" | cut -d ';' -f 2- | sed -e 's#[ \t]*$##'`
-	while test "x$opts" != "x"; do
+	while [ -n "${opts}" ]; do
 		perform_groupadd "$SYSROOT" "$OPT $opts"
-		if test "x$opts" = "x$remaining"; then
+		if [ "${opts}" = "${remaining}" ]; then
 			break
 		fi
 		opts=`echo "$remaining" | cut -d ';' -f 1 | sed -e 's#[ \t]*$##'`
@@ -69,9 +69,9 @@ if test "x`echo $USERADD_PARAM | tr -d '[:space:]'`" != "x"; then
 	# separated by ';'
 	opts=`echo "$USERADD_PARAM" | cut -d ';' -f 1 | sed -e 's#[ \t]*$##'`
 	remaining=`echo "$USERADD_PARAM" | cut -d ';' -f 2- | sed -e 's#[ \t]*$##'`
-	while test "x$opts" != "x"; do
+	while [ -n "${opts}" ]; do
 		perform_useradd "$SYSROOT" "$OPT $opts"
-		if test "x$opts" = "x$remaining"; then
+		if [ "${opts}" = "${remaining}" ]; then
 			break
 		fi
 		opts=`echo "$remaining" | cut -d ';' -f 1 | sed -e 's#[ \t]*$##'`
@@ -85,9 +85,9 @@ if test "x`echo $GROUPMEMS_PARAM | tr -d '[:space:]'`" != "x"; then
 	# separated by ';'
 	opts=`echo "$GROUPMEMS_PARAM" | cut -d ';' -f 1 | sed -e 's#[ \t]*$##'`
 	remaining=`echo "$GROUPMEMS_PARAM" | cut -d ';' -f 2- | sed -e 's#[ \t]*$##'`
-	while test "x$opts" != "x"; do
+	while [ -n "${opts}" ]; do
 		perform_groupmems "$SYSROOT" "$OPT $opts"
-		if test "x$opts" = "x$remaining"; then
+		if [ "${opts}" = "${remaining}" ]; then
 			break
 		fi
 		opts=`echo "$remaining" | cut -d ';' -f 1 | sed -e 's#[ \t]*$##'`
diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_base.bbclass
index 551c82c..91cad67 100644
--- a/meta/classes/useradd_base.bbclass
+++ b/meta/classes/useradd_base.bbclass
@@ -16,10 +16,10 @@ perform_groupadd () {
 	bbnote "${PN}: Performing groupadd with [$opts]"
 	local groupname=`echo "$opts" | awk '{ print $NF }'`
 	local group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
-	if test "x$group_exists" = "x"; then
+	if [ -z "${group_exists}" ]; then
 		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO groupadd \$opts\" || true
 		group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
-		if test "x$group_exists" = "x"; then
+		if [ -z "${group_exists}" ]; then
 			bbfatal "${PN}: groupadd command did not succeed."
 		fi
 	else
@@ -33,10 +33,10 @@ perform_useradd () {
 	bbnote "${PN}: Performing useradd with [$opts]"
 	local username=`echo "$opts" | awk '{ print $NF }'`
 	local user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
-	if test "x$user_exists" = "x"; then
+	if [ -z "${user_exists}" ]; then
 		eval flock -x $rootdir${sysconfdir} -c  \"$PSEUDO useradd \$opts\" || true
 		user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
-		if test "x$user_exists" = "x"; then
+		if [ -z "${user_exists}" ]; then
 			bbfatal "${PN}: useradd command did not succeed."
 		fi
 	else
@@ -52,10 +52,10 @@ perform_groupmems () {
 	local username=`echo "$opts" | awk '{ for (i = 1; i < NF; i++) if ($i == "-a" || $i == "--add") print $(i+1) }'`
 	bbnote "${PN}: Running groupmems command with group $groupname and user $username"
 	local mem_exists="`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*" $rootdir/etc/group || true`"
-	if test "x$mem_exists" = "x"; then
+	if [ -z "${mem_exists}" ]; then
 		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO groupmems \$opts\" || true
 		mem_exists="`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*" $rootdir/etc/group || true`"
-		if test "x$mem_exists" = "x"; then
+		if [ -z "${mem_exists}" ]; then
 			bbfatal "${PN}: groupmems command did not succeed."
 		fi
 	else
@@ -70,16 +70,16 @@ perform_groupdel () {
 	local groupname=`echo "$opts" | awk '{ print $NF }'`
 	local group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"

-	if test "x$group_exists" != "x"; then
+	if [ -n "${group_exists}" ]; then
 		local awk_input='BEGIN {FS=":"}; $1=="'$groupname'" { print $3 }'
 		local groupid=`echo "$awk_input" | awk -f- $rootdir/etc/group`
 		local awk_check_users='BEGIN {FS=":"}; $4=="'$groupid'" {print $1}'
 		local other_users=`echo "$awk_check_users" | awk -f- $rootdir/etc/passwd`

-		if test "x$other_users" = "x"; then
+		if [ -z "${other_users}" ]; then
 			eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO groupdel \$opts\" || true
 			group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
-			if test "x$group_exists" != "x"; then
+			if [ -n "${group_exists}" ]; then
 				bbfatal "${PN}: groupdel command did not succeed."
 			fi
 		else
@@ -96,10 +96,10 @@ perform_userdel () {
 	bbnote "${PN}: Performing userdel with [$opts]"
 	local username=`echo "$opts" | awk '{ print $NF }'`
 	local user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
-	if test "x$user_exists" != "x"; then
+	if [ -n "${user_exists}" ]; then
 		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO userdel \$opts\" || true
 		user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
-		if test "x$user_exists" != "x"; then
+		if [ -n "${user_exists}" ]; then
 			bbfatal "${PN}: userdel command did not succeed."
 		fi
 	else
@@ -116,7 +116,7 @@ perform_groupmod () {
 	bbnote "${PN}: Performing groupmod with [$opts]"
 	local groupname=`echo "$opts" | awk '{ print $NF }'`
 	local group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
-	if test "x$group_exists" != "x"; then
+	if [ -n "${group_exists}" ]; then
 		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO groupmod \$opts\"
 		if test $? != 0; then
 			bbwarn "${PN}: groupmod command did not succeed."
@@ -135,7 +135,7 @@ perform_usermod () {
 	bbnote "${PN}: Performing usermod with [$opts]"
 	local username=`echo "$opts" | awk '{ print $NF }'`
 	local user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
-	if test "x$user_exists" != "x"; then
+	if [ -n "${user_exists}" ]; then
 		eval flock -x $rootdir${sysconfdir} -c \"$PSEUDO usermod \$opts\"
 		if test $? != 0; then
 			bbfatal "${PN}: usermod command did not succeed."

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


