Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Tga1Q-0005O1-Fs for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 12:53:44 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB6BdJJh028362
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Dec 2012 11:39:19 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28027-02 for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Dec 2012 11:39:15 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB6Bd9kt028356
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Dec 2012 11:39:10 GMT
Message-ID: <1354793939.25268.174.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 06 Dec 2012 11:38:59 +0000
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] rootfs_ipk/package_ipk: Simplify opkg commandline option variables
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
X-List-Received-Date: Thu, 06 Dec 2012 11:53:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

The current maze of IPKG_ARGS variables is hard to understand and worse,
not even used in some places. This simplifies the code and specifies the
options in one place.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index f916cf5..b441e86 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -10,6 +10,8 @@ PKGWRITEDIRIPK = "${WORKDIR}/deploy-ipks"
 # Program to be used to build opkg packages
 OPKGBUILDCMD ??= "opkg-build"
 
+OPKG_ARGS = "-f $INSTALL_CONF_IPK -o $INSTALL_ROOTFS_IPK --force_postinstall --prefer-arch-to-version"
+
 python package_ipk_fn () {
     d.setVar('PKGFN', d.getVar('PKG'))
 }
@@ -71,7 +73,7 @@ package_tryout_install_multilib_ipk() {
 	multilib_tryout_dirs=""
 	for item in ${MULTILIB_VARIANTS}; do
 		local target_rootfs="${MULTILIB_TEMP_ROOTFS}/${item}"
-		local ipkg_args="-f ${INSTALL_CONF_IPK} -o ${target_rootfs} --force_overwrite"
+		local ipkg_args="${OPKG_ARGS}"
 		local selected_pkg=""
 		local pkgname_prefix="${item}-"
 		local pkgname_len=${#pkgname_prefix}
@@ -127,7 +129,6 @@ split_multilib_packages() {
 package_install_internal_ipk() {
 
 	local target_rootfs="${INSTALL_ROOTFS_IPK}"
-	local conffile="${INSTALL_CONF_IPK}"
 	local package_attemptonly="${INSTALL_PACKAGES_ATTEMPTONLY_IPK}"
 	local package_linguas="${INSTALL_PACKAGES_LINGUAS_IPK}"
 	local task="${INSTALL_TASK_IPK}"
@@ -139,7 +140,7 @@ package_install_internal_ipk() {
 
 	mkdir -p ${target_rootfs}${localstatedir}/lib/opkg/
 
-	local ipkg_args="-f ${conffile} -o ${target_rootfs} --force_postinstall --prefer-arch-to-version"
+	local ipkg_args="${OPKG_ARGS}"
 
 	opkg-cl ${ipkg_args} update
 
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index fc69b7e..4916879 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -14,10 +14,6 @@ do_rootfs[recrdeptask] += "do_package_write_ipk"
 
 do_rootfs[lockfiles] += "${WORKDIR}/ipk.lock"
 
-IPKG_ARGS = "-f ${IPKGCONF_TARGET} -o ${IMAGE_ROOTFS} --force_postinstall --prefer-arch-to-version"
-# The _POST version also works when constructing the matching SDK
-IPKG_ARGS_POST = "-f ${IPKGCONF_TARGET} -o $INSTALL_ROOTFS_IPK --force_postinstall --prefer-arch-to-version"
-
 OPKG_PREPROCESS_COMMANDS = "package_update_index_ipk; package_generate_ipkg_conf"
 
 OPKG_POSTPROCESS_COMMANDS = "ipk_insert_feed_uris; "
@@ -38,14 +34,16 @@ fakeroot rootfs_ipk_do_rootfs () {
 
 	mkdir -p ${T}/
  
+	export INSTALL_CONF_IPK="${IPKGCONF_TARGET}"
+	export INSTALL_ROOTFS_IPK="${IMAGE_ROOTFS}"
 	STATUS=${IMAGE_ROOTFS}${opkglibdir}/status
 	mkdir -p ${IMAGE_ROOTFS}${opkglibdir}
 
-	opkg-cl ${IPKG_ARGS} update
+	opkg-cl ${OPKG_ARGS} update
 
 	# prime the status file with bits that we don't want
 	for i in ${BAD_RECOMMENDATIONS}; do
-		pkginfo="`opkg-cl ${IPKG_ARGS} info $i`"
+		pkginfo="`opkg-cl ${OPKG_ARGS} info $i`"
 		if [ ! -z "$pkginfo" ]; then
 			echo "$pkginfo" | grep -e '^Package:' -e '^Architecture:' -e '^Version:' >> $STATUS
 			echo "Status: deinstall hold not-installed" >> $STATUS
@@ -60,8 +58,7 @@ fakeroot rootfs_ipk_do_rootfs () {
 	export INSTALL_PACKAGES_LINGUAS_IPK="${LINGUAS_INSTALL}"
 	export INSTALL_TASK_IPK="rootfs"
 
-	export INSTALL_ROOTFS_IPK="${IMAGE_ROOTFS}"
-	export INSTALL_CONF_IPK="${IPKGCONF_TARGET}"
+	
 	export INSTALL_PACKAGES_IPK="${PACKAGE_INSTALL}"
 
 	#post install
@@ -102,7 +99,7 @@ fakeroot rootfs_ipk_do_rootfs () {
 			if [ -e ${IMAGE_ROOTFS}${sysconfdir}/init.d/run-postinsts ]; then
 				remove_run_postinsts=true
 			fi
-			opkg-cl ${IPKG_ARGS} --force-depends remove update-rc.d base-passwd ${ROOTFS_BOOTSTRAP_INSTALL} || true
+			opkg-cl ${OPKG_ARGS} --force-depends remove update-rc.d base-passwd ${ROOTFS_BOOTSTRAP_INSTALL} || true
 
 			# Need to remove rc.d files for run-postinsts by hand since opkg won't
 			# call postrm scripts in offline root mode.
@@ -140,9 +137,9 @@ remove_packaging_data_files() {
 
 list_installed_packages() {
 	if [ "$1" = "arch" ] ; then
-		opkg-cl ${IPKG_ARGS_POST} status | opkg-query-helper.py -a
+		opkg-cl ${OPKG_ARGS} status | opkg-query-helper.py -a
 	elif [ "$1" = "file" ] ; then
-		opkg-cl ${IPKG_ARGS_POST} status | opkg-query-helper.py -f | while read pkg pkgfile
+		opkg-cl ${OPKG_ARGS} status | opkg-query-helper.py -f | while read pkg pkgfile
 		do
 			fullpath=`find ${DEPLOY_DIR_IPK} -name "$pkgfile" || true`
 			if [ "$fullpath" = "" ] ; then
@@ -152,16 +149,16 @@ list_installed_packages() {
 			fi
 		done
 	else
-		opkg-cl ${IPKG_ARGS_POST} list_installed | awk '{ print $1 }'
+		opkg-cl ${OPKG_ARGS} list_installed | awk '{ print $1 }'
 	fi
 }
 
 rootfs_list_installed_depends() {
-	opkg-cl ${IPKG_ARGS_POST} status | opkg-query-helper.py
+	opkg-cl ${OPKG_ARGS} status | opkg-query-helper.py
 }
 
 rootfs_install_packages() {
-	opkg-cl ${IPKG_ARGS_POST} install `cat $1`
+	opkg-cl ${OPKG_ARGS} install `cat $1`
 }
 
 ipk_insert_feed_uris () {




