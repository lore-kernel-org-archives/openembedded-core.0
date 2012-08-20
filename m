Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T3TwT-0001OF-NP
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 17:31:03 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7KFIwAk027839
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 08:18:58 -0700 (PDT)
Received: from fc17-64.corp.ad.wrs.com (128.224.163.124) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Mon, 20 Aug 2012 08:18:58 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Aug 2012 23:24:45 +0800
Message-ID: <fb0324e6510278f283f41e6a490e00ef3983dfda.1345471555.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1345471555.git.liezhi.yang@windriver.com>
References: <cover.1345471555.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 3/3 V3] deb: install external binary packages
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
X-List-Received-Date: Mon, 20 Aug 2012 15:31:03 -0000
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
    to deploy/deb/external/<arch>, the add_external_debipk is used by
    ipk and deb, the add_external_deb is just a wrapper.

    Use an "external" directory since we don't want the "internal" pkgs
    to be mixed, and it would be easy to remove them.

  - package_deb.bbclass:
    Create repo for deploy/deb/external

  - rootfs_deb.bbclass
    Add the package that would be installed to INSTALL_PACKAGES_DEB, so
    that it would be installed.

[YOCTO #2949]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/external_package.bbclass |  4 ++++
 meta/classes/package_deb.bbclass      | 44 +++++++++++++++++++++--------------
 meta/classes/rootfs_deb.bbclass       |  2 +-
 3 files changed, 32 insertions(+), 18 deletions(-)

diff --git a/meta/classes/external_package.bbclass b/meta/classes/external_package.bbclass
index c21a5c6..d971384 100644
--- a/meta/classes/external_package.bbclass
+++ b/meta/classes/external_package.bbclass
@@ -85,3 +85,7 @@ add_external_debipk () {
 add_external_ipk () {
 	add_external_debipk $@
 }
+
+add_external_deb () {
+	add_external_debipk $@
+}
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 48511df..df2a418 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -3,12 +3,14 @@
 #
 
 inherit package
+inherit external_package
 
 IMAGE_PKGTYPE ?= "deb"
 
 DPKG_ARCH ?= "${TARGET_ARCH}" 
 
 PKGWRITEDIRDEB = "${WORKDIR}/deploy-debs"
+EXTERNAL_DIR_DEB = "${DEPLOY_DIR_DEB}/external"
 
 python package_deb_fn () {
     d.setVar('PKGFN', d.getVar('PKG'))
@@ -72,19 +74,25 @@ package_update_index_deb () {
 		return
 	fi
 
-	for arch in ${PACKAGE_ARCHS} ${SDK_PACKAGE_ARCHS}; do
-		if [ -e ${DEPLOY_DIR_DEB}/$arch ]; then
+	all_archs="${PACKAGE_ARCHS} ${SDK_PACKAGE_ARCHS}"
+
+	[ ! -d ${EXTERNAL_INSTALL_DIRS} ] || add_external_deb ${EXTERNAL_DIR_DEB} $all_archs
+
+	for arch in $all_archs; do
+		if [ -e ${DEPLOY_DIR_DEB}/$arch -o -e ${EXTERNAL_DIR_DEB}/$arch ]; then
 			debarchs="$debarchs $arch"
 		fi
 	done
 
 	for arch in $debarchs; do
-		if [ ! -d ${DEPLOY_DIR_DEB}/$arch ]; then
-			continue;
-		fi
-		cd ${DEPLOY_DIR_DEB}/$arch
-		dpkg-scanpackages . | gzip > Packages.gz
-		echo "Label: $arch" > Release
+		for d in ${DEPLOY_DIR_DEB} ${EXTERNAL_DIR_DEB}; do
+			if [ ! -d $d/$arch ]; then
+				continue;
+			fi
+			cd $d/$arch
+			dpkg-scanpackages . | gzip > Packages.gz
+			echo "Label: $arch" > Release
+		done
 	done
 }
 
@@ -114,16 +122,18 @@ package_install_internal_deb () {
 
 	priority=1
 	for arch in $archs; do
-		if [ ! -d ${DEPLOY_DIR_DEB}/$arch ]; then
-			continue;
-		fi
+		for d in ${DEPLOY_DIR_DEB} ${EXTERNAL_DIR_DEB}; do
+			if [ ! -d $d/$arch ]; then
+				continue;
+			fi
 
-		echo "deb file:${DEPLOY_DIR_DEB}/$arch/ ./" >> ${STAGING_ETCDIR_NATIVE}/apt/sources.list.rev
-		(echo "Package: *"
-		echo "Pin: release l=$arch"
-		echo "Pin-Priority: $(expr 800 + $priority)"
-		echo) >> ${STAGING_ETCDIR_NATIVE}/apt/preferences
-		priority=$(expr $priority + 5)
+			echo "deb file:$d/$arch/ ./" >> ${STAGING_ETCDIR_NATIVE}/apt/sources.list.rev
+			(echo "Package: *"
+			echo "Pin: release l=$arch"
+			echo "Pin-Priority: $(expr 800 + $priority)"
+			echo) >> ${STAGING_ETCDIR_NATIVE}/apt/preferences
+			priority=$(expr $priority + 5)
+		done
 	done
 
 	tac ${STAGING_ETCDIR_NATIVE}/apt/sources.list.rev > ${STAGING_ETCDIR_NATIVE}/apt/sources.list
diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index 881fdbd..35196df 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -34,7 +34,7 @@ fakeroot rootfs_deb_do_rootfs () {
 	export INSTALL_ROOTFS_DEB="${IMAGE_ROOTFS}"
 	export INSTALL_BASEARCH_DEB="${DPKG_ARCH}"
 	export INSTALL_ARCHS_DEB="${PACKAGE_ARCHS}"
-	export INSTALL_PACKAGES_NORMAL_DEB="${PACKAGE_INSTALL}"
+	export INSTALL_PACKAGES_NORMAL_DEB="${PACKAGE_INSTALL} ${EXTERNAL_INSTALL_PACKAGE}"
 	export INSTALL_PACKAGES_ATTEMPTONLY_DEB="${PACKAGE_INSTALL_ATTEMPTONLY}"
 	export INSTALL_PACKAGES_LINGUAS_DEB="${LINGUAS_INSTALL}"
 	export INSTALL_TASK_DEB="rootfs"
-- 
1.7.11.2



