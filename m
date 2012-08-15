Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T1fgD-0001d2-P4
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 17:38:46 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7FFQmY2028661
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 08:26:48 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.124) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Wed, 15 Aug 2012 08:26:48 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Aug 2012 23:32:19 +0800
Message-ID: <3ad930a52318b868ba8453caddd197ec953a663a.1345044352.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
In-Reply-To: <cover.1345044352.git.liezhi.yang@windriver.com>
References: <cover.1345044352.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 3/3] deb: install external binary packages
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
similar.

[YOCTO #2949]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/external_package.bbclass |  4 ++++
 meta/classes/package_deb.bbclass      | 43 +++++++++++++++++++++--------------
 meta/classes/rootfs_deb.bbclass       |  2 +-
 3 files changed, 31 insertions(+), 18 deletions(-)

diff --git a/meta/classes/external_package.bbclass b/meta/classes/external_package.bbclass
index 1587363..618ae72 100644
--- a/meta/classes/external_package.bbclass
+++ b/meta/classes/external_package.bbclass
@@ -83,3 +83,7 @@ add_external_debipk () {
 add_external_ipk () {
 	add_external_debipk $@
 }
+
+add_external_deb () {
+	add_external_debipk $@
+}
diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 48511df..477b90c 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -9,6 +9,7 @@ IMAGE_PKGTYPE ?= "deb"
 DPKG_ARCH ?= "${TARGET_ARCH}" 
 
 PKGWRITEDIRDEB = "${WORKDIR}/deploy-debs"
+EXTERNAL_DIR_DEB = "${DEPLOY_DIR_DEB}/external"
 
 python package_deb_fn () {
     d.setVar('PKGFN', d.getVar('PKG'))
@@ -72,19 +73,25 @@ package_update_index_deb () {
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
 
@@ -114,16 +121,18 @@ package_install_internal_deb () {
 
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
index 750a8ca..0c7f5f2 100644
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



