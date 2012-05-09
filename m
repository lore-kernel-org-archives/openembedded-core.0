Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SS2KE-0005M6-Uz
	for openembedded-core@lists.openembedded.org;
	Wed, 09 May 2012 10:32:47 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q498Mqbh016917
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 May 2012 01:22:52 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 9 May 2012 01:22:52 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 May 2012 16:20:55 +0800
Message-ID: <14faf252db6f9a5433f17a76807419bdd3459e74.1336547713.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1336547713.git.liezhi.yang@windriver.com>
References: <cover.1336547713.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/2] package_rpm.bbclass: Fix incremental rpm image generation
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
X-List-Received-Date: Wed, 09 May 2012 08:32:47 -0000
Content-Type: text/plain

Fix the incremental rpm image generation, it didn't work since the code
has been changed.

The btmanifest should have a ".manifest" suffix, so that it can be moved
to ${T} by rootfs_rpm.bbclass:
mv ${IMAGE_ROOTFS}/install/*.manifest ${T}/

Note: The locale pkgs would always be re-installed.

[YOCTO #2440]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/package_rpm.bbclass |   20 ++++++++------------
 1 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 623069e..ddac0cc 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -158,28 +158,24 @@ rpm_common_comand () {
 rpm_update_pkg () {
 
     manifest=$1
-    btmanifest=$manifest.bt
+    btmanifest=$manifest.bt.manifest
+    pre_btmanifest=${T}/${btmanifest##/*/}
     local target_rootfs="${INSTALL_ROOTFS_RPM}"
 
     # Save the rpm's build time for incremental image generation, and the file
     # would be moved to ${T}
-    rm -f $btmanifest
     for i in `cat $manifest`; do
         # Use "rpm" rather than "${RPM}" here, since we don't need the
         # '--dbpath' option
-        echo "$i `rpm -qp --qf '%{BUILDTIME}\n' $i`" >> $btmanifest
-    done
+        echo "$i `rpm -qp --qf '%{BUILDTIME}\n' $i`"
+    done | sort -u > $btmanifest
 
     # Only install the different pkgs if incremental image generation is set
-    if [ "${INC_RPM_IMAGE_GEN}" = "1" -a -f ${T}/total_solution_bt.manifest -a \
+    if [ "${INC_RPM_IMAGE_GEN}" = "1" -a -f "$pre_btmanifest" -a \
         "${IMAGE_PKGTYPE}" = "rpm" ]; then
-        cur_list="$btmanifest"
-        pre_list="${T}/total_solution_bt.manifest"
-        sort -u $cur_list -o $cur_list
-        sort -u $pre_list -o $pre_list
-        comm -1 -3 $cur_list $pre_list | sed 's#.*/\(.*\)\.rpm .*#\1#' > \
+        comm -1 -3 $btmanifest $pre_btmanifest | sed 's#.*/\(.*\)\.rpm .*#\1#' > \
             ${target_rootfs}/install/remove.manifest
-        comm -2 -3 $cur_list $pre_list | awk '{print $1}' > \
+        comm -2 -3 $btmanifest $pre_btmanifest | awk '{print $1}' > \
             ${target_rootfs}/install/incremental.manifest
 
         # Attempt to remove unwanted pkgs, the scripts(pre, post, etc.) has not
@@ -462,7 +458,7 @@ EOF
 	# probably a feature. The only way to convince rpm to actually run the preinstall scripts 
 	# for base-passwd and shadow first before installing packages that depend on these packages 
 	# is to do two image installs, installing one set of packages, then the other.
-	if [ "${INC_RPM_IMAGE_GEN}" = "1" -a -f ${T}/total_solution_bt.manifest ]; then
+	if [ "${INC_RPM_IMAGE_GEN}" = "1" -a -f "$pre_btmanifest" ]; then
 		echo "Skipping pre install due to exisitng image"
 	else
 		echo "# Initial Install manifest" > ${target_rootfs}/install/initial_install.manifest
-- 
1.7.1



