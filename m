Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T3TwR-0001O7-Rd
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 17:31:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7KFIupJ027833
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 08:18:56 -0700 (PDT)
Received: from fc17-64.corp.ad.wrs.com (128.224.163.124) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Mon, 20 Aug 2012 08:18:55 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Aug 2012 23:24:43 +0800
Message-ID: <aa9dffc2d2e9bce3310f8a066f9deed03d2dd9e7.1345471555.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1345471555.git.liezhi.yang@windriver.com>
References: <cover.1345471555.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/3 V3] rpm: install external binary packages
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
X-List-Received-Date: Mon, 20 Aug 2012 15:31:00 -0000
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
    to deploy/rpm/external/<arch>.

    Use an "external" directory since we don't want the "internal" pkgs
    to be mixed, and it would be easy to remove them.

  - package_rpm.bbclass:
    Create repo for deploy/rpm/external

  - rootfs_rpm.bbclass
    Add the package that would be installed to INSTALL_PACKAGES_RPM, so
    that it would be installed.

[YOCTO #1592]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/external_package.bbclass | 42 +++++++++++++++++++++++++++++++++++
 meta/classes/package_rpm.bbclass      | 13 ++++++++---
 meta/classes/rootfs_rpm.bbclass       |  2 +-
 3 files changed, 53 insertions(+), 4 deletions(-)
 create mode 100644 meta/classes/external_package.bbclass

diff --git a/meta/classes/external_package.bbclass b/meta/classes/external_package.bbclass
new file mode 100644
index 0000000..e032bec
--- /dev/null
+++ b/meta/classes/external_package.bbclass
@@ -0,0 +1,42 @@
+#
+# ex:ts=4:sw=4:sts=4:et
+# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
+#
+# Add external binary pkg to the repo and install them:
+#
+# Specify where are the external binary pkg dir
+#EXTERNAL_PACKAGE_DIR = "<path1> <path2> ..."
+# Specify which pkg will be installed
+#EXTERNAL_INSTALL_PACKAGE = "<pkg1> <pkg2> ..."
+
+#
+# Add the external binary rpm into the repo, copy the binary rpm files
+# from EXTERNAL_PACKAGE_DIR to ${DEPLOY_DIR_RPM}/external, and put them
+# to the relevant arch dir.
+#
+add_external_rpm () {
+    local supported_archs
+    supported_archs="$@"
+
+    # Clean the EXTERNAL_DIR_RPM dir and re-copy
+    [ ! -d "${EXTERNAL_DIR_RPM}" ] || rm -fr ${EXTERNAL_DIR_RPM}
+
+    if [ -n "${EXTERNAL_PACKAGE_DIR}" -a -n "${EXTERNAL_INSTALL_PACKAGE}" ]; then
+        echo "Adding external binary rpms to the repo ..."
+        for f in `find ${EXTERNAL_PACKAGE_DIR} -type f  -name '*.rpm'`; do
+            arch="`echo $f | awk -F\. '{print $(NF-1)}'`"
+            found=""
+            for archvar in $supported_archs; do
+                # Only pick up the supported arch's rpm
+                if [ "$arch" == "$archvar" ]; then
+                    [ -d "${EXTERNAL_DIR_RPM}/$arch" ] || mkdir -p ${EXTERNAL_DIR_RPM}/$arch
+                    cp -f $f ${EXTERNAL_DIR_RPM}/$arch/
+                    found="1"
+                    break
+                fi
+            done
+            [ -n "$found" ] || echo "Uknown arch $arch"
+        done
+    fi
+}
+
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 4b18cc6..662a589 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -1,4 +1,5 @@
 inherit package
+inherit external_package
 
 IMAGE_PKGTYPE ?= "rpm"
 
@@ -7,6 +8,7 @@ RPMBUILD="rpmbuild"
 
 PKGWRITEDIRRPM = "${WORKDIR}/deploy-rpms"
 PKGWRITEDIRSRPM = "${DEPLOY_DIR}/sources/deploy-srpm"
+EXTERNAL_DIR_RPM = "${DEPLOY_DIR_RPM}/external"
 
 python package_rpm_fn () {
     d.setVar('PKGFN', d.getVar('PKG'))
@@ -26,6 +28,9 @@ package_update_index_rpm () {
 		return
 	fi
 
+	# Add external binary pkgs
+	add_external_rpm ${PACKAGE_ARCHS} ${MULTILIB_PACKAGE_ARCHS} ${SDK_PACKAGE_ARCHS}
+
 	# Update target packages
 	base_archs="${PACKAGE_ARCHS}"
 	ml_archs="${MULTILIB_PACKAGE_ARCHS}"
@@ -44,9 +49,11 @@ package_update_index_rpm_common () {
 	for archvar in "$@"; do
 		eval archs=\${${archvar}}
 		packagedirs=""
-		for arch in $archs; do
-			packagedirs="${DEPLOY_DIR_RPM}/$arch $packagedirs"
-			rm -rf ${DEPLOY_DIR_RPM}/$arch/solvedb.done
+		for d in ${DEPLOY_DIR_RPM} ${EXTERNAL_DIR_RPM}; do
+			for arch in $archs; do
+				packagedirs="$d/$arch $packagedirs"
+				rm -rf $d/$arch/solvedb.done
+			done
 		done
 
 		cat /dev/null > ${rpmconf_base}-${archvar}.conf
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index c0207d8..7ce694c 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -51,7 +51,7 @@ fakeroot rootfs_rpm_do_rootfs () {
 	export INSTALL_ROOTFS_RPM="${IMAGE_ROOTFS}"
 	export INSTALL_PLATFORM_RPM="${TARGET_ARCH}"
 	export INSTALL_CONFBASE_RPM="${RPMCONF_TARGET_BASE}"
-	export INSTALL_PACKAGES_RPM="${PACKAGE_INSTALL}"
+	export INSTALL_PACKAGES_RPM="${PACKAGE_INSTALL} ${EXTERNAL_INSTALL_PACKAGE}"
 	export INSTALL_PACKAGES_ATTEMPTONLY_RPM="${PACKAGE_INSTALL_ATTEMPTONLY}"
 	export INSTALL_PACKAGES_LINGUAS_RPM="${LINGUAS_INSTALL}"
 	export INSTALL_PROVIDENAME_RPM=""
-- 
1.7.11.2



