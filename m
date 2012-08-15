Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T1fgD-0001d0-C4
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 17:38:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7FFQkM4014594
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 08:26:47 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.124) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 15 Aug 2012 08:26:46 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Aug 2012 23:32:18 +0800
Message-ID: <520fd5fd5b910a65ddc91a9e747b092050fd0dbf.1345044352.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1345044352.git.liezhi.yang@windriver.com>
References: <cover.1345044352.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 2/3] ipk: install external binary packages
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
X-List-Received-Date: Wed, 15 Aug 2012 15:38:46 -0000
Content-Type: text/plain

Please see the commit message for the rpm one, most of the contents are
similar, except that add an function "add_external_debipk" which are
used by both deb and ipk, the add_external_ipk is just a wrapper.

[YOCTO #2948]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/external_package.bbclass | 44 +++++++++++++++++++++++++++++++++++
 meta/classes/package_ipk.bbclass      | 21 ++++++++++++++++-
 meta/classes/rootfs_ipk.bbclass       |  2 +-
 3 files changed, 65 insertions(+), 2 deletions(-)

diff --git a/meta/classes/external_package.bbclass b/meta/classes/external_package.bbclass
index c6d87bb..1587363 100644
--- a/meta/classes/external_package.bbclass
+++ b/meta/classes/external_package.bbclass
@@ -39,3 +39,47 @@ add_external_rpm () {
     fi
 }
 
+#
+# Add the external binary ipk/deb into the repo, copy the binary files
+# from EXTERNAL_PACKAGE_DIR to ${DEPLOY_DIR_IPK}/external, and put them
+# to the relevant arch dir.
+#
+# $1: EXTERNAL_DIR_IPK or EXTERNAL_DIR_DEB
+# $2, $3, $4...: supported archs
+#
+add_external_debipk () {
+    dir="$1"
+
+    if [ "$dir" != "${EXTERNAL_DIR_DEB}" -a "$dir" != "${EXTERNAL_DIR_IPK}" ]; then
+        echo "Unsupported dir $1"
+        return
+    fi
+
+    shift
+    local supported_archs="$@"
+
+    # Clean the dir and re-copy
+    [ ! -d "$dir" ] || rm -fr $dir
+
+    if [ -n "${EXTERNAL_PACKAGE_DIR}" -a -n "${EXTERNAL_INSTALL_PACKAGE}" ]; then
+        echo "Adding external binary ${IMAGE_PKGTYPE} to the repo ..."
+        for f in `find ${EXTERNAL_PACKAGE_DIR} -type f  -name "*.${IMAGE_PKGTYPE}"`; do
+            arch="`echo $f | sed 's/.*_\(.*\)\.'"${IMAGE_PKGTYPE}"'$/\1/'`"
+            found=""
+            for archvar in $supported_archs; do
+                # Only pick up the supported arch
+                if [ "$arch" == "$archvar" ]; then
+                    [ -d "$dir/$arch" ] || mkdir -p $dir/$arch
+                    cp -f $f $dir/$arch/
+                    found="1"
+                    break
+                fi
+            done
+            [ -n "$found" ] || echo "Uknown arch $arch"
+        done
+    fi
+}
+
+add_external_ipk () {
+	add_external_debipk $@
+}
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index a297a1f..12e493d 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -6,6 +6,7 @@ IPKGCONF_TARGET = "${WORKDIR}/opkg.conf"
 IPKGCONF_SDK =  "${WORKDIR}/opkg-sdk.conf"
 
 PKGWRITEDIRIPK = "${WORKDIR}/deploy-ipks"
+EXTERNAL_DIR_IPK = "${DEPLOY_DIR_IPK}/external"
 
 # Program to be used to build opkg packages
 OPKGBUILDCMD ??= "opkg-build"
@@ -203,7 +204,7 @@ package_update_index_ipk () {
 		return
 	fi
 
-	packagedirs="${DEPLOY_DIR_IPK}"
+	packagedirs="${DEPLOY_DIR_IPK} ${EXTERNAL_DIR_IPK}"
 	for arch in $ipkgarchs; do
 		packagedirs="$packagedirs ${DEPLOY_DIR_IPK}/$arch"
 	done
@@ -213,6 +214,12 @@ package_update_index_ipk () {
 		packagedirs="$packagedirs ${DEPLOY_DIR_IPK}/$arch"
 	done
 
+	all_archs="$ipkgarchs $multilib_archs"
+	add_external_ipk "${EXTERNAL_DIR_IPK}" $all_archs
+	for arch in $all_archs; do
+		packagedirs="$packagedirs ${EXTERNAL_DIR_IPK}/$arch"
+	done
+
 	for pkgdir in $packagedirs; do
 		if [ -e $pkgdir/ ]; then
 			touch $pkgdir/Packages
@@ -229,19 +236,31 @@ package_update_index_ipk () {
 package_generate_ipkg_conf () {
 	package_generate_archlist
 	echo "src oe file:${DEPLOY_DIR_IPK}" >> ${IPKGCONF_SDK}
+	if [ -e ${EXTERNAL_DIR_IPK} ]; then
+		echo "src external file:${EXTERNAL_DIR_IPK}" >> ${IPKGCONF_SDK}
+	fi
 	ipkgarchs="${SDK_PACKAGE_ARCHS}"
 	for arch in $ipkgarchs; do
 		if [ -e ${DEPLOY_DIR_IPK}/$arch/Packages ] ; then
 		        echo "src oe-$arch file:${DEPLOY_DIR_IPK}/$arch" >> ${IPKGCONF_SDK}
 		fi
+		if [ -e ${EXTERNAL_DIR_IPK}/$arch/Packages ] ; then
+		        echo "src external-$arch file:${EXTERNAL_DIR_IPK}/$arch" >> ${IPKGCONF_SDK}
+		fi
 	done
 
 	echo "src oe file:${DEPLOY_DIR_IPK}" >> ${IPKGCONF_TARGET}
+	if [ -e ${EXTERNAL_DIR_IPK} ]; then
+		echo "src external file:${EXTERNAL_DIR_IPK}" >> ${IPKGCONF_TARGET}
+	fi
 	ipkgarchs="${ALL_MULTILIB_PACKAGE_ARCHS}"
 	for arch in $ipkgarchs; do
 		if [ -e ${DEPLOY_DIR_IPK}/$arch/Packages ] ; then
 		        echo "src oe-$arch file:${DEPLOY_DIR_IPK}/$arch" >> ${IPKGCONF_TARGET}
 		fi
+		if [ -e ${EXTERNAL_DIR_IPK}/$arch/Packages ] ; then
+		        echo "src external-$arch file:${EXTERNAL_DIR_IPK}/$arch" >> ${IPKGCONF_TARGET}
+		fi
 	done
 }
 
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 6cdd8f6..edea67f 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -62,7 +62,7 @@ fakeroot rootfs_ipk_do_rootfs () {
 
 	export INSTALL_ROOTFS_IPK="${IMAGE_ROOTFS}"
 	export INSTALL_CONF_IPK="${IPKGCONF_TARGET}"
-	export INSTALL_PACKAGES_IPK="${PACKAGE_INSTALL}"
+	export INSTALL_PACKAGES_IPK="${PACKAGE_INSTALL} ${EXTERNAL_INSTALL_PACKAGE}"
 
 	#post install
 	export D=${IMAGE_ROOTFS}
-- 
1.7.11.2



