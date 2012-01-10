Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1RkZEv-0003X5-R6
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jan 2012 11:47:38 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0AAe8HO011780
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jan 2012 02:40:08 -0800 (PST)
Received: from build-PowerEdge-T100.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 10 Jan 2012 02:40:08 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jan 2012 18:38:25 +0800
Message-ID: <1fd6cfb489b9fda59aaa47349502026cbf725b1e.1326191431.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1326191431.git.liezhi.yang@windriver.com>
References: <cover.1326191431.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2 ] V3 Incremental rpm image generation
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
X-List-Received-Date: Tue, 10 Jan 2012 10:47:38 -0000
Content-Type: text/plain

Incremental rpm image generation, the rootfs would be totally removed and
re-created in the second generation by default, but with
INC_RPM_IMAGE_GEN = "1", the rpm based rootfs would be kept, and will do
update(remove/add some pkgs) on it.

NOTE: This is not suggested when you want to create a productive rootfs

For example:
  1) Add the follow config option to a conf file:
     INC_RPM_IMAGE_GEN = "1"

  2) bitbake core-image-sato
     modify a package
     bitbake core-image-sato

The rootfs would not be totally removed and re-created in the second
generation, it would be simply updated based on the "package".

Implatation:
1) Figure out the pkg which need to be removed or re-installed, then use
'rpm -e to remove the old one. Use the rpm's BUILDTIME to determine
which pkg has been rebuilt.

2) Figure out the pkg which is newly added, and use 'rpm -U' to install
it.

This only for the rpm based rootfs, the deb and ipk based rootfs would
be done later.

[YOCTO #1651]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/image.bbclass       |   11 +++++-
 meta/classes/package_rpm.bbclass |   73 ++++++++++++++++++++++++++++++++-----
 meta/classes/rootfs_rpm.bbclass  |    6 +++-
 3 files changed, 77 insertions(+), 13 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 295b653..3034725 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -134,15 +134,22 @@ do_rootfs[umask] = 022
 
 fakeroot do_rootfs () {
 	#set -x
-	rm -rf ${IMAGE_ROOTFS}
+    # When use the rpm incremental image generation, don't remove the rootfs
+    if [ "${INC_RPM_IMAGE_GEN}" != "1" -o "${IMAGE_PKGTYPE}" != "rpm" ]; then
+        rm -rf ${IMAGE_ROOTFS}
+    fi
 	rm -rf ${MULTILIB_TEMP_ROOTFS}
 	mkdir -p ${IMAGE_ROOTFS}
 	mkdir -p ${DEPLOY_DIR_IMAGE}
 
 	cp ${COREBASE}/meta/files/deploydir_readme.txt ${DEPLOY_DIR_IMAGE}/README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
 
-	if [ "${USE_DEVFS}" != "1" ]; then
+    # If "${IMAGE_ROOTFS}/dev" exists, then the device had been made by
+    # the previous build
+	if [ "${USE_DEVFS}" != "1" -a ! -r "${IMAGE_ROOTFS}/dev" ]; then
 		for devtable in ${@get_devtable_list(d)}; do
+            # Always return ture since there maybe already one when use the
+            # incremental image generation
 			makedevs -r ${IMAGE_ROOTFS} -D $devtable
 		done
 	fi
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index d03dc3f..2d92efe 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -147,6 +147,67 @@ resolve_package_rpm () {
 	echo $pkg_name
 }
 
+# rpm common command and options
+rpm_common_comand () {
+
+    local target_rootfs="${INSTALL_ROOTFS_RPM}"
+    local extra_args="$@"
+
+    ${RPM} --root ${target_rootfs} \
+        --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
+        --predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
+        -D "_var ${localstatedir}" \
+        -D "_dbpath ${rpmlibdir}" \
+        --noparentdirs --nolinktos \
+        -D "__dbi_txn create nofsync private" \
+        -D "_cross_scriptlet_wrapper ${WORKDIR}/scriptlet_wrapper" $extra_args
+}
+
+# install or remove the pkg
+rpm_update_pkg () {
+
+    local target_rootfs="${INSTALL_ROOTFS_RPM}"
+
+    # Save the rpm's build time for incremental image generation, and the file
+    # would be moved to ${T}
+    rm -f ${target_rootfs}/install/total_solution_bt.manifest
+    for i in `cat ${target_rootfs}/install/total_solution.manifest`; do
+        # Use "rpm" rather than "${RPM}" here, since we don't need the
+        # '--dbpath' option
+        echo "$i `rpm -qp --qf '%{BUILDTIME}\n' $i`" >> \
+            ${target_rootfs}/install/total_solution_bt.manifest
+    done
+
+    # Only install the different pkgs if incremental image generation is set
+    if [ "${INC_RPM_IMAGE_GEN}" = "1" -a -f ${T}/total_solution_bt.manifest -a \
+        "${IMAGE_PKGTYPE}" = "rpm" ]; then
+        cur_list="${target_rootfs}/install/total_solution_bt.manifest"
+        pre_list="${T}/total_solution_bt.manifest"
+        sort -u $cur_list -o $cur_list
+        sort -u $pre_list -o $pre_list
+        comm -1 -3 $cur_list $pre_list | sed 's#.*/\(.*\)\.rpm .*#\1#' > \
+            ${target_rootfs}/install/remove.manifest
+        comm -2 -3 $cur_list $pre_list | awk '{print $1}' > \
+            ${target_rootfs}/install/incremental.manifest
+
+        # Attempt to remove unwanted pkgs, the scripts(pre, post, etc.) has not
+        # been run by now, so don't have to run them(preun, postun, etc.) when
+        # erase the pkg
+        if [ -s ${target_rootfs}/install/remove.manifest ]; then
+            rpm_common_comand --noscripts --nodeps \
+                -e `cat ${target_rootfs}/install/remove.manifest`
+        fi
+
+        # Attempt to install the incremental pkgs
+        rpm_common_comand --nodeps --replacefiles --replacepkgs \
+            -Uvh ${target_rootfs}/install/incremental.manifest
+    else
+        # Attempt to install
+        rpm_common_comand --replacepkgs \
+            -Uhv ${target_rootfs}/install/total_solution.manifest
+    fi
+}
+
 #
 # install a bunch of packages using rpm
 # the following shell variables needs to be set before calling this func:
@@ -406,16 +467,8 @@ EOF
 
 	chmod 0755 ${WORKDIR}/scriptlet_wrapper
 
-	# Attempt install
-	${RPM} --root ${target_rootfs} \
-		--predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
-		--predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
-		-D "_var ${localstatedir}" \
-		-D "_dbpath ${rpmlibdir}" \
-		--noparentdirs --nolinktos --replacepkgs \
-		-D "__dbi_txn create nofsync private" \
-		-D "_cross_scriptlet_wrapper ${WORKDIR}/scriptlet_wrapper" \
-		-Uhv ${target_rootfs}/install/total_solution.manifest
+    rpm_update_pkg
+
 }
 
 python write_specfile () {
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 999b8a6..48133f0 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -201,11 +201,15 @@ rootfs_check_package_exists() {
 }
 
 rootfs_install_packages() {
+    # The pkg to be installed here is not controlled by the
+    # package_install_internal_rpm, so it may have already been
+    # installed(e.g, installed in the first time when generate the
+    # rootfs), use '--replacepkgs' to always install them
 	for pkg in $@; do
 		${RPM} --root ${IMAGE_ROOTFS} -D "_dbpath ${rpmlibdir}" \
 			-D "__dbi_txn create nofsync private" \
 			--noscripts --notriggers --noparentdirs --nolinktos \
-			-Uhv $pkg || true
+			--replacepkgs -Uhv $pkg || true
 	done
 }
 
-- 
1.7.4.1



