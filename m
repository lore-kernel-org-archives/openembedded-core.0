Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R6JMP-0008DE-9n
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 11:44:57 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 21 Sep 2011 02:39:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="51195246"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.170])
	by orsmga002.jf.intel.com with ESMTP; 21 Sep 2011 02:39:36 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Sep 2011 02:39:18 -0700
Message-Id: <3db765782fcb548fd9efde5f925c5418f8c9baf9.1316597628.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1316597628.git.sgw@linux.intel.com>
References: <cover.1316597628.git.sgw@linux.intel.com>
In-Reply-To: <cover.1316597628.git.sgw@linux.intel.com>
References: <cover.1316597628.git.sgw@linux.intel.com>
Subject: [RC Fixes 02/19] deb packages support: switch from /var/dpkg to /var/lib/dpkg
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
X-List-Received-Date: Wed, 21 Sep 2011 09:44:58 -0000

From: Dexuan Cui <dexuan.cui@intel.com>

[YOCTO #1086]

The pach was backported from OE:
http://git.openembedded.net/cgit.cgi/openembedded/commit/?id=41e0fbf792037f249d1b8d283b3de81718887c9f

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 meta/classes/package_deb.bbclass                   |   10 +++++-----
 meta/classes/populate_sdk_deb.bbclass              |    4 ++--
 meta/classes/rootfs_deb.bbclass                    |   20 ++++++++++----------
 meta/recipes-devtools/apt/apt-native_0.7.14.bb     |    2 +-
 meta/recipes-devtools/apt/apt_0.7.14.bb            |    2 +-
 meta/recipes-devtools/apt/files/apt.conf           |    4 ++--
 .../dpkg/run-postinsts/run-postinsts               |    2 +-
 .../dpkg/run-postinsts/run-postinsts.awk           |    2 +-
 meta/recipes-devtools/dpkg/run-postinsts_1.0.bb    |    2 +-
 .../update-alternatives-dpkg.inc                   |    6 +++---
 10 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 5a32047..6733e64 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -135,11 +135,11 @@ package_install_internal_deb () {
 
 	export APT_CONFIG="${STAGING_ETCDIR_NATIVE}/apt/apt-${task}.conf"
 
-	mkdir -p ${target_rootfs}/var/dpkg/info
-	mkdir -p ${target_rootfs}/var/dpkg/updates
+	mkdir -p ${target_rootfs}/var/lib/dpkg/info
+	mkdir -p ${target_rootfs}/var/lib/dpkg/updates
 
-	> ${target_rootfs}/var/dpkg/status
-	> ${target_rootfs}/var/dpkg/available
+	> ${target_rootfs}/var/lib/dpkg/status
+	> ${target_rootfs}/var/lib/dpkg/available
 
 	apt-get update
 
@@ -179,7 +179,7 @@ package_install_internal_deb () {
 	done
 
 	# Mark all packages installed
-	sed -i -e "s/Status: install ok unpacked/Status: install ok installed/;" ${target_rootfs}/var/dpkg/status
+	sed -i -e "s/Status: install ok unpacked/Status: install ok installed/;" ${target_rootfs}/var/lib/dpkg/status
 }
 
 deb_log_check() {
diff --git a/meta/classes/populate_sdk_deb.bbclass b/meta/classes/populate_sdk_deb.bbclass
index 2cff69e..be7b552 100644
--- a/meta/classes/populate_sdk_deb.bbclass
+++ b/meta/classes/populate_sdk_deb.bbclass
@@ -52,8 +52,8 @@ fakeroot populate_sdk_deb () {
 	populate_sdk_post_deb ${SDK_OUTPUT}/${SDKPATHNATIVE}
 
 	#move remainings
-	install -d ${SDK_OUTPUT}/${SDKPATHNATIVE}/var/dpkg
-	mv ${SDK_OUTPUT}/var/dpkg/* ${SDK_OUTPUT}/${SDKPATHNATIVE}/var/dpkg
+	install -d ${SDK_OUTPUT}/${SDKPATHNATIVE}/var/lib/dpkg
+	mv ${SDK_OUTPUT}/var/lib/dpkg/* ${SDK_OUTPUT}/${SDKPATHNATIVE}/var/lib/dpkg
 	rm -rf ${SDK_OUTPUT}/var
 
 	populate_sdk_log_check populate_sdk
diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index e03e80b..bab8e1e 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -13,7 +13,7 @@ opkglibdir = "${localstatedir}/lib/opkg"
 fakeroot rootfs_deb_do_rootfs () {
 	set +e
 
-	mkdir -p ${IMAGE_ROOTFS}/var/dpkg/alternatives
+	mkdir -p ${IMAGE_ROOTFS}/var/lib/dpkg/alternatives
 
 	# update index
 	package_update_index_deb
@@ -36,15 +36,15 @@ fakeroot rootfs_deb_do_rootfs () {
 	export OPKG_OFFLINE_ROOT=${IMAGE_ROOTFS}
 
 	_flag () {
-		sed -i -e "/^Package: $2\$/{n; s/Status: install ok .*/Status: install ok $1/;}" ${IMAGE_ROOTFS}/var/dpkg/status
+		sed -i -e "/^Package: $2\$/{n; s/Status: install ok .*/Status: install ok $1/;}" ${IMAGE_ROOTFS}/var/lib/dpkg/status
 	}
 	_getflag () {
-		cat ${IMAGE_ROOTFS}/var/dpkg/status | sed -n -e "/^Package: $2\$/{n; s/Status: install ok .*/$1/; p}"
+		cat ${IMAGE_ROOTFS}/var/lib/dpkg/status | sed -n -e "/^Package: $2\$/{n; s/Status: install ok .*/$1/; p}"
 	}
 
 	# Attempt to run preinsts
 	# Mark packages with preinst failures as unpacked
-	for i in ${IMAGE_ROOTFS}/var/dpkg/info/*.preinst; do
+	for i in ${IMAGE_ROOTFS}/var/lib/dpkg/info/*.preinst; do
 		if [ -f $i ] && ! sh $i; then
 			_flag unpacked `basename $i .preinst`
 		fi
@@ -52,7 +52,7 @@ fakeroot rootfs_deb_do_rootfs () {
 
 	# Attempt to run postinsts
 	# Mark packages with postinst failures as unpacked
-	for i in ${IMAGE_ROOTFS}/var/dpkg/info/*.postinst; do
+	for i in ${IMAGE_ROOTFS}/var/lib/dpkg/info/*.postinst; do
 		if [ -f $i ] && ! sh $i configure; then
 			_flag unpacked `basename $i .postinst`
 		fi
@@ -65,12 +65,12 @@ fakeroot rootfs_deb_do_rootfs () {
 
 	# Hacks to allow opkg's update-alternatives and opkg to coexist for now
 	mkdir -p ${IMAGE_ROOTFS}${opkglibdir}
-	if [ -e ${IMAGE_ROOTFS}/var/dpkg/alternatives ]; then
-		rmdir ${IMAGE_ROOTFS}/var/dpkg/alternatives
+	if [ -e ${IMAGE_ROOTFS}/var/lib/dpkg/alternatives ]; then
+		rmdir ${IMAGE_ROOTFS}/var/lib/dpkg/alternatives
 	fi
-	ln -s ${opkglibdir}/alternatives ${IMAGE_ROOTFS}/var/dpkg/alternatives
-	ln -s /var/dpkg/info ${IMAGE_ROOTFS}${opkglibdir}/info
-	ln -s /var/dpkg/status ${IMAGE_ROOTFS}${opkglibdir}/status
+	ln -s ${opkglibdir}/alternatives ${IMAGE_ROOTFS}/var/lib/dpkg/alternatives
+	ln -s /var/lib/dpkg/info ${IMAGE_ROOTFS}${opkglibdir}/info
+	ln -s /var/lib/dpkg/status ${IMAGE_ROOTFS}${opkglibdir}/status
 
 	${ROOTFS_POSTPROCESS_COMMAND}
 
diff --git a/meta/recipes-devtools/apt/apt-native_0.7.14.bb b/meta/recipes-devtools/apt/apt-native_0.7.14.bb
index b1bd55b..c82d606 100644
--- a/meta/recipes-devtools/apt/apt-native_0.7.14.bb
+++ b/meta/recipes-devtools/apt/apt-native_0.7.14.bb
@@ -1,6 +1,6 @@
 require apt-native.inc
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI += "file://nodoc.patch \
             file://noconfigure.patch \
diff --git a/meta/recipes-devtools/apt/apt_0.7.14.bb b/meta/recipes-devtools/apt/apt_0.7.14.bb
index 1335c16..93eebe9 100644
--- a/meta/recipes-devtools/apt/apt_0.7.14.bb
+++ b/meta/recipes-devtools/apt/apt_0.7.14.bb
@@ -3,7 +3,7 @@ RDEPENDS_${PN} = "dpkg"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
 require apt.inc
 
-PR = "r7"
+PR = "r8"
 
 SRC_URI += "file://nodoc.patch \
             file://includes-fix.patch "
diff --git a/meta/recipes-devtools/apt/files/apt.conf b/meta/recipes-devtools/apt/files/apt.conf
index 5732137..ab7a5db 100644
--- a/meta/recipes-devtools/apt/files/apt.conf
+++ b/meta/recipes-devtools/apt/files/apt.conf
@@ -3,7 +3,7 @@ Dir "${STAGING_DIR_NATIVE}/"
    State "var/lib/apt/"
    {
       Lists "lists/";
-      status "#ROOTFS#/var/dpkg/status";
+      status "#ROOTFS#/var/lib/dpkg/status";
    };
    Cache "var/cache/apt/"
    {
@@ -39,5 +39,5 @@ APT
   };
 };
 
-DPkg::Options {"--root=#ROOTFS#";"--admindir=#ROOTFS#/var/dpkg";"--force-all";"--no-debsig"};
+DPkg::Options {"--root=#ROOTFS#";"--admindir=#ROOTFS#/var/lib/dpkg";"--force-all";"--no-debsig"};
 };
diff --git a/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts b/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts
index f632d1c..584a92e 100755
--- a/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts
+++ b/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts
@@ -5,7 +5,7 @@
 # Author: Richard Purdie <rpurdie@openedhand.com>
 #
 
-PKGSYSTEM=/var/dpkg
+PKGSYSTEM=/var/lib/dpkg
 
 if [ ! -e $PKGSYSTEM/status ]; then
   if [ -e /usr/lib/opkg/status ]; then
diff --git a/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts.awk b/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts.awk
index 09a1400..d92200b 100644
--- a/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts.awk
+++ b/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts.awk
@@ -9,7 +9,7 @@
 BEGIN {
   rc=system("test -d /usr/dpkg/info/")
   if (rc==0)
-    pkgdir="/var/dpkg/info"
+    pkgdir="/var/lib/dpkg/info"
   else
     pkgdir="/usr/lib/opkg/info"
   package=""
diff --git a/meta/recipes-devtools/dpkg/run-postinsts_1.0.bb b/meta/recipes-devtools/dpkg/run-postinsts_1.0.bb
index f15243b..f8f3368 100644
--- a/meta/recipes-devtools/dpkg/run-postinsts_1.0.bb
+++ b/meta/recipes-devtools/dpkg/run-postinsts_1.0.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Run postinstall scripts on device using awk"
 SECTION = "devel"
-PR = "r6"
+PR = "r7"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
diff --git a/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg.inc b/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg.inc
index f7f9ae9..c881ae0 100644
--- a/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg.inc
+++ b/meta/recipes-devtools/update-alternatives/update-alternatives-dpkg.inc
@@ -8,7 +8,7 @@ SECTION = "base"
 SRC_URI = "${DEBIAN_MIRROR}/main/d/dpkg/dpkg_${PV}.tar.bz2"
 S = "${WORKDIR}/dpkg-${PV}"
 PACKAGE_ARCH = "all"
-INC_PR = "r2"
+INC_PR = "r3"
 
 inherit gettext
 
@@ -20,7 +20,7 @@ do_patch () {
         s/^.*$/$D=$ENV{"D"} || ""\;/;
         p;
         x;
-        s,^\$admindir=.*staging.*$,$admindir="$D${localstatedir}/dpkg"\;,;
+        s,^\$admindir=.*staging.*$,$admindir="$D${localstatedir}/lib/dpkg"\;,;
     };
     s,^\$altdir=.*$,$altdir="$D${sysconfdir}/alternatives"\;,;
     p;' > ${S}/scripts/update-alternatives
@@ -28,7 +28,7 @@ do_patch () {
 
 do_install () {
     install -d ${D}${sbindir} \
-               ${D}${localstatedir}/dpkg/alternatives \
+               ${D}${localstatedir}/lib/dpkg/alternatives \
                ${D}${sysconfdir}/alternatives
 
     install -m 0755 scripts/update-alternatives ${D}${sbindir}/update-alternatives
-- 
1.7.6



