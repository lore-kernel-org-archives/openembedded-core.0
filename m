Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1TxZKS-0007um-H9
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 09:35:55 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0M8K7oI018404
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2013 00:20:07 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.131) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 22 Jan 2013 00:20:05 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jan 2013 16:19:55 +0800
Message-ID: <36709c1e79a84e4d4dc08682f8901d1733a67523.1358824498.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1358824498.git.hongxu.jia@windriver.com>
References: <cover.1358824498.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] rootfs_deb.bbclass:support incremental deb image generation
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
X-List-Received-Date: Tue, 22 Jan 2013 08:35:57 -0000
Content-Type: text/plain

1. Let shell function "rootfs_install_packages" support incremental deb
   image generation. The following is the design:

   1) If deb incremental generation is supported:
      1) Compare solution manifest with previous installed manifest to dump
         unused package names and remove them.

      2) Compare three manifests to dump updated packages and reinstall them.

   2) Install packages as solution manifest lists.

   3) Change solution manifest to installed manifest for next image session.

   4) Back up dpkg database for next image session.

2. Add checks for the creation of symbolic link "${IMAGE_ROOTFS}${opkgli-
   bdir}/info" and "${IMAGE_ROOTFS}${opkglibdir}/status".

[YOCTO #1893]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/rootfs_deb.bbclass |   58 +++++++++++++++++++++++++++++++++++----
 1 file changed, 52 insertions(+), 6 deletions(-)

diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index 9997996..f61608b 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -26,6 +26,9 @@ deb_package_getflag() {
 fakeroot rootfs_deb_do_rootfs () {
 	set +e
 
+	# Dir could be changed to symbolic link by previous image session.
+	[ -L ${IMAGE_ROOTFS}/var/lib/dpkg/alternatives ] && \
+		rm ${IMAGE_ROOTFS}/var/lib/dpkg/alternatives
 	mkdir -p ${IMAGE_ROOTFS}/var/lib/dpkg/alternatives
 
 	# update index
@@ -85,9 +88,9 @@ fakeroot rootfs_deb_do_rootfs () {
 	if [ -e ${IMAGE_ROOTFS}/var/lib/dpkg/alternatives ]; then
 		rmdir ${IMAGE_ROOTFS}/var/lib/dpkg/alternatives
 	fi
-	ln -s ${opkglibdir}/alternatives ${IMAGE_ROOTFS}/var/lib/dpkg/alternatives
-	ln -s /var/lib/dpkg/info ${IMAGE_ROOTFS}${opkglibdir}/info
-	ln -s /var/lib/dpkg/status ${IMAGE_ROOTFS}${opkglibdir}/status
+	ln -sf ${opkglibdir}/alternatives ${IMAGE_ROOTFS}/var/lib/dpkg/alternatives
+	ln -sfn /var/lib/dpkg/info ${IMAGE_ROOTFS}${opkglibdir}/info
+	ln -sfn /var/lib/dpkg/status ${IMAGE_ROOTFS}${opkglibdir}/status
 
 	${ROOTFS_POSTPROCESS_COMMAND}
 
@@ -126,9 +129,52 @@ rootfs_list_installed_depends() {
 	${DPKG_QUERY_COMMAND} -W -f='Package: ${Package}\nDepends: ${Depends}\nRecommends: ${Recommends}\n\n' | opkg-query-helper.py
 }
 
+
+#
+# Install deb packages
+#
+# $1-- the list of package names that will be installed
 rootfs_install_packages() {
-	${STAGING_BINDIR_NATIVE}/apt-get install `cat $1` --force-yes --allow-unauthenticated
 
-	# Mark all packages installed
-	sed -i -e "s/Status: install ok unpacked/Status: install ok installed/;" $INSTALL_ROOTFS_DEB/var/lib/dpkg/status
+	# The pkgs_installed_manifest is used to list the package's names which
+	# are installed in the previous deb image.
+	local pkgs_installed_manifest="${T}/installed_$(basename $1)"
+
+	# The pkgs_solution_manifest is used to list the package's names which
+	# should be installed just right now.
+	local pkgs_solution_manifest="$1"
+
+	sort -u $pkgs_solution_manifest -o $pkgs_solution_manifest
+
+	# The deb incremental generation base on the previous image
+	if [ "${INC_DEB_IMAGE_GEN}" = "1" -a -e $pkgs_installed_manifest ]; then
+		# Remove unused deb packages by comparing the two manifests.
+		package_remove_unused_deb "$pkgs_solution_manifest" "$pkgs_installed_manifest"
+
+		# Reinstall updated packages by comparing the two manifests.
+		package_reinstall_updated_deb "$pkgs_solution_manifest" "$pkgs_installed_manifest"
+	fi
+
+	# Install packages by the names which pkgs_solution_manifest lists
+	local all_package_list=$(cat $pkgs_solution_manifest)
+	for i in $all_package_list; do
+		echo "NOTE: Installing $i"
+		apt-get install $i --force-yes --allow-unauthenticated
+		if [ $? -ne 0 ]; then
+			echo "ERROR: Install $i failed"
+			exit 1
+		fi
+	done
+
+	# Update installed manifest for next image session.
+	cp $pkgs_solution_manifest $pkgs_installed_manifest
+
+	# Mark all packages installed and remove Config-version
+	sed -i -e "s/Status: install ok unpacked/Status: install ok installed/;" \
+		-e "/^Config-Version:/d" $INSTALL_ROOTFS_DEB/var/lib/dpkg/status
+
+	# Back up dpkg database for the next image session.
+	local dpkg_dir="${T}/dpkg${INSTALL_ROOTFS_DEB}"
+	mkdir -p $dpkg_dir
+	cp -rf ${INSTALL_ROOTFS_DEB}/var/lib/dpkg/* $dpkg_dir
 }
-- 
1.7.10.4



