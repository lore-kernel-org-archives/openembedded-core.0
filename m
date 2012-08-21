Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1T3iWW-0006T9-QF
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 09:05:13 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7L6r9x9018770
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2012 23:53:09 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Mon, 20 Aug 2012 23:53:07 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Aug 2012 14:48:48 +0800
Message-ID: <deb08e39c57fb74bba8ed261aa9c56d3c9bcdd69.1345519167.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1345519167.git.liezhi.yang@windriver.com>
References: <cover.1345519167.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] package_rpm.bbclass: fix and enhance the incremental rpm generation
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
X-List-Received-Date: Tue, 21 Aug 2012 07:05:13 -0000
Content-Type: text/plain

The incremental rpm generation usually broke when package_rpm.bbclass
changed, change its implementation to make it more stable:

* It depended on the previous and current saved manifest files in
  the past, it would break when the manifest changed. Now query the
  previous and current installed pkgs from rootfs/var/lib and
  rootfs/install/, this would be more reliable, the manifest's change
  would not affect it any more.

* Add explanations before package_install_internal_rpm to explain what
  does the function do.

* Remove an unwanted "awk '{print $1}'".

[YOCTO #2906]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/package_rpm.bbclass |   68 ++++++++++++++++++++++++--------------
 1 files changed, 43 insertions(+), 25 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 4b18cc6..2d44727 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -158,38 +158,41 @@ rpm_common_comand () {
 rpm_update_pkg () {
 
     manifest=$1
-    btmanifest=$manifest.bt.manifest
-    pre_btmanifest=${T}/${btmanifest##/*/}
+    # The manifest filename, e.g. total_solution.manifest
+    m_name=${manifest##/*/}
     local target_rootfs="${INSTALL_ROOTFS_RPM}"
-
-    # Save the rpm's build time for incremental image generation, and the file
-    # would be moved to ${T}
-    for i in `cat $manifest`; do
-        # Use "rpm" rather than "${RPM}" here, since we don't need the
-        # '--dbpath' option
-        echo "$i `rpm -qp --qf '%{BUILDTIME}\n' $i`"
-    done | sort -u > $btmanifest
-
-    # Only install the different pkgs if incremental image generation is set
-    if [ "${INC_RPM_IMAGE_GEN}" = "1" -a -f "$pre_btmanifest" -a \
-        "${IMAGE_PKGTYPE}" = "rpm" ]; then
-        comm -1 -3 $btmanifest $pre_btmanifest | sed 's#.*/\(.*\)\.rpm .*#\1#' > \
-            ${target_rootfs}/install/remove.manifest
-        comm -2 -3 $btmanifest $pre_btmanifest | awk '{print $1}' > \
-            ${target_rootfs}/install/incremental.manifest
+    installdir=$target_rootfs/install
+    pre_btmanifest=$installdir/pre_bt.manifest
+    cur_btmanifest=$installdir/cur_bt.manifest
+
+    # Install/remove the different pkgs when total_solution.manifest is
+    # comming and incremental image generation is enabled.
+    if [ "${INC_RPM_IMAGE_GEN}" = "1" -a -d "${target_rootfs}${rpmlibdir}" \
+        -a "$m_name" = "total_solution.manifest" \
+        -a "${INSTALL_COMPLEMENTARY_RPM}" != "1" ]; then
+        # Get the previous installed list
+        rpm --root $target_rootfs --dbpath ${rpmlibdir} \
+            -qa --qf '%{PACKAGEORIGIN} %{BUILDTIME}\n' | sort -u -o $pre_btmanifest
+        # Get the current installed list (based on install/var/lib/rpm)
+        rpm --root $installdir -D "_dbpath $installdir" \
+            -qa --qf '%{PACKAGEORIGIN} %{BUILDTIME}\n' | sort -u -o $cur_btmanifest
+        comm -1 -3 $cur_btmanifest $pre_btmanifest | sed 's#.*/\(.*\)\.rpm .*#\1#' > \
+            $installdir/remove.manifest
+        comm -2 -3 $cur_btmanifest $pre_btmanifest | awk '{print $1}' > \
+            $installdir/incremental.manifest
 
         # Attempt to remove unwanted pkgs, the scripts(pre, post, etc.) has not
         # been run by now, so don't have to run them(preun, postun, etc.) when
         # erase the pkg
-        if [ -s ${target_rootfs}/install/remove.manifest ]; then
+        if [ -s $installdir/remove.manifest ]; then
             rpm_common_comand --noscripts --nodeps \
-                -e `cat ${target_rootfs}/install/remove.manifest`
+                -e `cat $installdir/remove.manifest`
         fi
 
         # Attempt to install the incremental pkgs
-        if [ -s ${target_rootfs}/install/incremental.manifest ]; then
+        if [ -s $installdir/incremental.manifest ]; then
             rpm_common_comand --nodeps --replacefiles --replacepkgs \
-               -Uvh ${target_rootfs}/install/incremental.manifest
+               -Uvh $installdir/incremental.manifest
         fi
     else
         # Attempt to install
@@ -242,7 +245,22 @@ process_pkg_list_rpm() {
 }
 
 #
-# install a bunch of packages using rpm
+# Install a bunch of packages using rpm.
+# There are 3 solutions in an image's FRESH generation:
+# 1) initial_solution
+# 2) total_solution
+# 3) COMPLEMENTARY solution
+#
+# It is different when incremental image generation is enabled in the
+# SECOND generation:
+# 1) The initial_solution is skipped.
+# 2) The incremental image generation takes action during the total_solution
+#    installation, the previous installed COMPLEMENTARY pkgs usually would be
+#    removed here, the new COMPLEMENTARY ones would be installed in the next
+#    step.
+# 3) The COMPLEMENTARY would always be installed since it is
+#    generated based on the second step's image.
+#
 # the following shell variables needs to be set before calling this func:
 # INSTALL_ROOTFS_RPM - install root dir
 # INSTALL_PLATFORM_RPM - main platform
@@ -496,10 +514,10 @@ EOF
 		sort ${target_rootfs}/install/original_solution.manifest > ${target_rootfs}/install/original_solution_sorted.manifest
 		sort ${target_rootfs}/install/total_solution.manifest > ${target_rootfs}/install/total_solution_sorted.manifest
 		comm -2 -3 ${target_rootfs}/install/total_solution_sorted.manifest \
-			${target_rootfs}/install/original_solution_sorted.manifest | awk '{print $1}' > \
+			${target_rootfs}/install/original_solution_sorted.manifest > \
 			${target_rootfs}/install/diff.manifest
 		mv ${target_rootfs}/install/diff.manifest ${target_rootfs}/install/total_solution.manifest
-	elif [ "${INC_RPM_IMAGE_GEN}" = "1" -a -f "$pre_btmanifest" ]; then
+	elif [ "${INC_RPM_IMAGE_GEN}" = "1" -a -d "${target_rootfs}${rpmlibdir}" ]; then
 		echo "Skipping pre install due to existing image"
 	else
 		# RPM is special. It can't handle dependencies and preinstall scripts correctly. Its
-- 
1.7.1



