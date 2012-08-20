Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T3TwS-0001O8-Cd
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 17:31:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7KFIvAn005736
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 08:18:57 -0700 (PDT)
Received: from fc17-64.corp.ad.wrs.com (128.224.163.124) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Mon, 20 Aug 2012 08:18:57 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Aug 2012 23:24:44 +0800
Message-ID: <0d2b09319324c3b458d09b42fc59ca418aa6ed39.1345471555.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1345471555.git.liezhi.yang@windriver.com>
References: <cover.1345471555.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 2/3 V3] ipk: install external binary packages
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
X-List-Received-Date: Mon, 20 Aug 2012 15:31:01 -0000
Content-Type: text/plain

It's been suggested that it would be a useful feature to be able to
easily take a binary from a 3rd party software vendor and integrate
it into an image created by the build system.

* The user can easily use this by:
  # Specify where is the external binary pkg dir
  #EXTERNAL_PACKAGE_DIR = "<path1> <path2> ..."
  # Specify which pkg will be installed
  #EXTERNAL_INSTALL_PACKAGE = "<pkg1> <pkg2> ..."

  Then the pkg1, pkg2 ... would be installed.

  Add an "EXTERNAL_INSTALL_PACKAGE"here since we can't use the existence
  variable (for example, IMAGE_INSTALL), if we add the pkg to the IMAGE_INSTALL,
  it would check whether the pkg is in the PROVIDES, and this is an external
  pkg, it is not in the PROVIDES.

* Main changes:
  - Add external_package.bbclass:
    Add the external package to the repo, the package would be copied
    to deploy/ipk/external/<arch>, the add_external_debipk is used by
    ipk and deb, the add_external_ipk is just a wrapper.

    Use an "external" directory since we don't want the "internal" pkgs
    to be mixed, and it would be easy to remove them.

  - package_ipk.bbclass:
    Create repo for deploy/ipk/external

  - rootfs_ipk.bbclass
    Add the package that would be installed to INSTALL_PACKAGES_IPK, so
    that it would be installed.

[YOCTO #2948]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/external_package.bbclass | 45 +++++++++++++++++++++++++++++++++++
 meta/classes/package_ipk.bbclass      | 22 ++++++++++++++++-
 meta/classes/rootfs_ipk.bbclass       |  2 +-
 3 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/meta/classes/external_package.bbclass b/meta/classes/external_package.bbclass
index e032bec..c21a5c6 100644
--- a/meta/classes/external_package.bbclass
+++ b/meta/classes/external_package.bbclass
@@ -40,3 +40,48 @@ add_external_rpm () {
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
+    local supported_archs
+    supported_archs="$@"
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
index a297a1f..0dee1d1 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -1,4 +1,5 @@
 inherit package
+inherit external_package
 
 IMAGE_PKGTYPE ?= "ipk"
 
@@ -6,6 +7,7 @@ IPKGCONF_TARGET = "${WORKDIR}/opkg.conf"
 IPKGCONF_SDK =  "${WORKDIR}/opkg-sdk.conf"
 
 PKGWRITEDIRIPK = "${WORKDIR}/deploy-ipks"
+EXTERNAL_DIR_IPK = "${DEPLOY_DIR_IPK}/external"
 
 # Program to be used to build opkg packages
 OPKGBUILDCMD ??= "opkg-build"
@@ -203,7 +205,7 @@ package_update_index_ipk () {
 		return
 	fi
 
-	packagedirs="${DEPLOY_DIR_IPK}"
+	packagedirs="${DEPLOY_DIR_IPK} ${EXTERNAL_DIR_IPK}"
 	for arch in $ipkgarchs; do
 		packagedirs="$packagedirs ${DEPLOY_DIR_IPK}/$arch"
 	done
@@ -213,6 +215,12 @@ package_update_index_ipk () {
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
@@ -229,19 +237,31 @@ package_update_index_ipk () {
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



