Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhxrF-0004Kv-TG
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 07:28:26 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 02 Jan 2012 22:20:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="91752181"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by azsmga001.ch.intel.com with ESMTP; 02 Jan 2012 22:20:54 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 22:19:24 -0800
Message-Id: <c0fc36f8629a6abb9a7b542df8a2857526547a31.1325571069.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
In-Reply-To: <cover.1325571068.git.sgw@linux.intel.com>
References: <cover.1325571068.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 038/113] classes/image: implement generic locale package installation
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
X-List-Received-Date: Tue, 03 Jan 2012 06:29:42 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

Let each package-specific rootfs implementation provide basic functions
to query the existence of a package and install a list of packages and
then have a generic install function so this logic is in one place.

Note: unlike previous versions of this code in OE-Core this uses the
IMAGE_LINGUAS variable and not IMAGE_LOCALES - note that IMAGE_LINGUAS
was what was used in OE-Classic and it is already used in OE-Core in
order to install locale-base-*. This will mean that if IMAGE_LINGUAS is
left at the default you will now get more packages installed. If you
don't want these language support packages then you should set
IMAGE_LINGUAS explicitly.

This restores locale installation to the same state as OE-Classic, only
we now support all the packaging backends.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/image.bbclass      |   37 +++++++++++++++++++++++++++++++++++++
 meta/classes/rootfs_deb.bbclass |   37 +++++++++++++++++++++++++++----------
 meta/classes/rootfs_ipk.bbclass |   30 +++++++++---------------------
 meta/classes/rootfs_rpm.bbclass |   35 +++++++++++------------------------
 4 files changed, 84 insertions(+), 55 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 865d430..275b28f 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -255,6 +255,43 @@ multilib_sanity_check() {
   echo $@ | python ${MULTILIB_CHECK_FILE}
 }
 
+get_split_linguas() {
+    for translation in ${IMAGE_LINGUAS}; do
+        translation_split=$(echo ${translation} | awk -F '-' '{print $1}')
+        echo ${translation}
+        echo ${translation_split}
+    done | sort | uniq
+}
+
+rootfs_install_all_locales() {
+    # Generate list of installed packages for which additional locale packages might be available
+    INSTALLED_PACKAGES=`list_installed_packages | egrep -v -- "(-locale-|^locale-base-|-dev$|-doc$|^kernel|^glibc|^ttf|^task|^perl|^python)"`
+
+    # Generate a list of locale packages that exist
+    SPLIT_LINGUAS=`get_split_linguas`
+    PACKAGES_TO_INSTALL=""
+    for lang in $SPLIT_LINGUAS; do
+        for pkg in $INSTALLED_PACKAGES; do
+            existing_pkg=`rootfs_check_package_exists $pkg-locale-$lang`
+            if [ "$existing_pkg" != "" ]; then
+                PACKAGES_TO_INSTALL="$PACKAGES_TO_INSTALL $existing_pkg"
+            fi
+        done
+    done
+
+    # Install the packages, if any
+    if [ "$PACKAGES_TO_INSTALL" != "" ]; then
+        rootfs_install_packages $PACKAGES_TO_INSTALL
+    fi
+
+    # Workaround for broken shell function dependencies
+    if false ; then
+        get_split_linguas
+        list_installed_packages
+        rootfs_check_package_exists
+    fi
+}
+
 # set '*' as the root password so the images
 # can decide if they want it or not
 zap_root_password () {
diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index bef055c..b6c706c 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -8,8 +8,18 @@ ROOTFS_PKGMANAGE_BOOTSTRAP  = "run-postinsts"
 do_rootfs[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot"
 do_rootfs[recrdeptask] += "do_package_write_deb"
 
+DEB_POSTPROCESS_COMMANDS = "rootfs_install_all_locales; "
+
 opkglibdir = "${localstatedir}/lib/opkg"
 
+deb_package_setflag() {
+	sed -i -e "/^Package: $2\$/{n; s/Status: install ok .*/Status: install ok $1/;}" ${IMAGE_ROOTFS}/var/lib/dpkg/status
+}
+
+deb_package_getflag() {
+	cat ${IMAGE_ROOTFS}/var/lib/dpkg/status | sed -n -e "/^Package: $2\$/{n; s/Status: install ok .*/$1/; p}"
+}
+
 fakeroot rootfs_deb_do_rootfs () {
 	set +e
 
@@ -28,25 +38,18 @@ fakeroot rootfs_deb_do_rootfs () {
 	export INSTALL_TASK_DEB="rootfs"
 
 	package_install_internal_deb
-
+	${DEB_POSTPROCESS_COMMANDS}
 
 	export D=${IMAGE_ROOTFS}
 	export OFFLINE_ROOT=${IMAGE_ROOTFS}
 	export IPKG_OFFLINE_ROOT=${IMAGE_ROOTFS}
 	export OPKG_OFFLINE_ROOT=${IMAGE_ROOTFS}
 
-	_flag () {
-		sed -i -e "/^Package: $2\$/{n; s/Status: install ok .*/Status: install ok $1/;}" ${IMAGE_ROOTFS}/var/lib/dpkg/status
-	}
-	_getflag () {
-		cat ${IMAGE_ROOTFS}/var/lib/dpkg/status | sed -n -e "/^Package: $2\$/{n; s/Status: install ok .*/$1/; p}"
-	}
-
 	# Attempt to run preinsts
 	# Mark packages with preinst failures as unpacked
 	for i in ${IMAGE_ROOTFS}/var/lib/dpkg/info/*.preinst; do
 		if [ -f $i ] && ! sh $i; then
-			_flag unpacked `basename $i .preinst`
+			deb_package_setflag unpacked `basename $i .preinst`
 		fi
 	done
 
@@ -54,7 +57,7 @@ fakeroot rootfs_deb_do_rootfs () {
 	# Mark packages with postinst failures as unpacked
 	for i in ${IMAGE_ROOTFS}/var/lib/dpkg/info/*.postinst; do
 		if [ -f $i ] && ! sh $i configure; then
-			_flag unpacked `basename $i .postinst`
+			deb_package_setflag unpacked `basename $i .postinst`
 		fi
 	done
 
@@ -104,3 +107,17 @@ list_package_depends() {
 list_package_recommends() {
 	${DPKG_QUERY_COMMAND} -s $1 | grep ^Recommends | sed -e 's/^Recommends: //' -e 's/,//g' -e 's:([=<>]* [0-9a-zA-Z.~\-]*)::g'
 }
+
+rootfs_check_package_exists() {
+	if [ `apt-cache showpkg $1 | wc -l` -gt 2 ]; then
+		echo $1
+	fi
+}
+
+rootfs_install_packages() {
+	${STAGING_BINDIR_NATIVE}/apt-get install $@ --force-yes --allow-unauthenticated
+
+	for pkg in $@ ; do
+		deb_package_setflag installed $pkg
+	done
+}
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index b5556fa..48fb2fb 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -16,7 +16,7 @@ IPKG_ARGS = "-f ${IPKGCONF_TARGET} -o ${IMAGE_ROOTFS} --force-overwrite"
 
 OPKG_PREPROCESS_COMMANDS = "package_update_index_ipk; package_generate_ipkg_conf"
 
-OPKG_POSTPROCESS_COMMANDS = "ipk_insert_feed_uris"
+OPKG_POSTPROCESS_COMMANDS = "ipk_insert_feed_uris; rootfs_install_all_locales; "
 
 opkglibdir = "${localstatedir}/lib/opkg"
 
@@ -148,26 +148,14 @@ list_package_recommends() {
 	opkg-cl ${IPKG_ARGS} info $1 | grep ^Recommends | sed -e 's/^Recommends: //' -e 's/,//g' -e 's:([=<>]* [0-9a-zA-Z.~\-]*)::g'
 }
 
-install_all_locales() {
-
-    PACKAGES_TO_INSTALL=""
-
-    INSTALLED_PACKAGES=`list_installed_packages | egrep -v -- "(-locale-|-dev$|-doc$|^kernel|^glibc|^ttf|^task|^perl|^python)"`
-
-    for pkg in $INSTALLED_PACKAGES
-    do
-        for lang in ${IMAGE_LOCALES}
-        do
-            if [ `opkg-cl ${IPKG_ARGS} info $pkg-locale-$lang | wc -l` -gt 2 ]
-            then
-                    PACKAGES_TO_INSTALL="$PACKAGES_TO_INSTALL $pkg-locale-$lang"
-            fi
-        done
-    done
-    if [ "$PACKAGES_TO_INSTALL" != "" ]
-    then
-        opkg-cl ${IPKG_ARGS} install $PACKAGES_TO_INSTALL
-    fi
+rootfs_check_package_exists() {
+	if [ `opkg-cl ${IPKG_ARGS} info $1 | wc -l` -gt 2 ]; then
+		echo $1
+	fi
+}
+
+rootfs_install_packages() {
+	opkg-cl ${IPKG_ARGS} install $PACKAGES_TO_INSTALL
 }
 
 ipk_insert_feed_uris () {
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 966b074..30f3783 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -21,12 +21,7 @@ do_rootfs[depends] += "opkg-native:do_populate_sysroot"
 do_rootfs[recrdeptask] += "do_package_write_rpm"
 
 RPM_PREPROCESS_COMMANDS = "package_update_index_rpm; package_generate_rpm_conf; "
-RPM_POSTPROCESS_COMMANDS = ""
-
-# To test the install_all_locales.. enable the following...
-#RPM_POSTPROCESS_COMMANDS = "install_all_locales; "
-#
-#IMAGE_LOCALES="en-gb"
+RPM_POSTPROCESS_COMMANDS = "rootfs_install_all_locales; "
 
 # 
 # Allow distributions to alter when [postponed] package install scripts are run
@@ -198,24 +193,16 @@ list_package_recommends() {
 	${RPM_QUERY_CMD} -q --suggests $1
 }
 
-install_all_locales() {
-	PACKAGES_TO_INSTALL=""
-
-	# Generate list of installed packages...
-	INSTALLED_PACKAGES=`list_installed_packages | egrep -v -- "(-locale-|-dev$|-doc$|^kernel|^glibc|^ttf|^task|^perl|^python)"`
-
-	# This would likely be faster if we did it in one transaction
-	# but this should be good enough for the few users of this function...
-	for pkg in $INSTALLED_PACKAGES; do
-		for lang in ${IMAGE_LOCALES}; do
-			pkg_name=$(resolve_package_rpm $pkg-locale-$lang ${RPMCONF_TARGET_BASE}.conf)
-			if [ -n "$pkg_name" ]; then
-				${RPM} --root ${IMAGE_ROOTFS} -D "_dbpath ${rpmlibdir}" \
-					-D "__dbi_txn create nofsync private" \
-					--noscripts --notriggers --noparentdirs --nolinktos \
-					-Uhv $pkg_name || true
-			fi
-		done
+rootfs_check_package_exists() {
+	resolve_package_rpm ${RPMCONF_TARGET_BASE}-base_archs.conf $1
+}
+
+rootfs_install_packages() {
+	for pkg in $@; do
+		${RPM} --root ${IMAGE_ROOTFS} -D "_dbpath ${rpmlibdir}" \
+			-D "__dbi_txn create nofsync private" \
+			--noscripts --notriggers --noparentdirs --nolinktos \
+			-Uhv $pkg || true
 	done
 }
 
-- 
1.7.6.4



