Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1U2Ign-0005xL-A5
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Feb 2013 10:50:17 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r149YPr9009918
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Feb 2013 01:34:25 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.131) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 4 Feb 2013 01:34:23 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Feb 2013 17:34:15 +0800
Message-ID: <b41c017802c1b8864a6d9ccf683c1af0a48f585d.1359968242.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1359968242.git.hongxu.jia@windriver.com>
References: <cover.1359968242.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] rootfs_deb.bbclass:support incremental deb image generation
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
X-List-Received-Date: Mon, 04 Feb 2013 09:50:21 -0000
Content-Type: text/plain

Modify shell function `rootfs_install_packages' to support incremental
generation, here is the design:

1. Sort solution manifest which lists *to be installed* packags.

2. If support incremental ipk image generation
   1) Figure out unused packages, they are in the installed manifest and not in
   the solution manifest.

   2) Remove unused packages.

   3) Figure out existed packages, they are in both the solution manifest and the
   installed manifest.

   4) Figure out updated packages, they belong to both the existed packages
   and newly added packages

   5) Reinstall updated packages.

3. Install packages as the list of solution manifest.

4. Change solution manifest to installed manifest for next image session.

5. Back up dpkg database for next image session.

[YOCTO #1893]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/rootfs_deb.bbclass |   58 +++++++++++++++++++++++++++++++++++----
 1 file changed, 52 insertions(+), 6 deletions(-)

diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index 9997996..24c2c45 100644
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
+# $1 Input, the list of packages that will be installed
 rootfs_install_packages() {
-	${STAGING_BINDIR_NATIVE}/apt-get install `cat $1` --force-yes --allow-unauthenticated
 
-	# Mark all packages installed
-	sed -i -e "s/Status: install ok unpacked/Status: install ok installed/;" $INSTALL_ROOTFS_DEB/var/lib/dpkg/status
+	# The pkgs_installed_manifest is used to list the packages which are
+	# installed in the previous deb image.
+	local pkgs_installed_manifest="${T}/installed_$(basename $1)"
+
+	# The pkgs_solution_manifest is used to list the packages which should
+	# be installed just right now.
+	local pkgs_solution_manifest="$1"
+
+	sort -u $pkgs_solution_manifest -o $pkgs_solution_manifest
+
+	# The deb incremental generation is based on the previous image
+	if [ "${INC_DEB_IMAGE_GEN}" = "1" -a -e $pkgs_installed_manifest ]; then
+		# Remove unused deb packages by comparing the two manifests.
+		package_remove_unused_deb "$pkgs_solution_manifest" "$pkgs_installed_manifest"
+
+		# Reinstall updated packages by comparing the two manifests.
+		package_reinstall_updated_deb "$pkgs_solution_manifest" "$pkgs_installed_manifest"
+	fi
+
+	# Install packages which pkgs_solution_manifest lists
+	all_package_list=`cat $pkgs_solution_manifest | xargs echo`
+	if [ "$all_package_list" != "" ]; then
+		echo "NOTE: Installing $all_package_list"
+		apt-get install --force-yes --allow-unauthenticated $all_package_list
+		if [ $? -ne 0 ]; then
+			echo "ERROR: Install $all_package_list failed"
+			exit 1
+		fi
+	fi
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



