Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TgqbZ-0001Ln-AS
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Dec 2012 06:36:09 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 8A8A9303EC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Dec 2012 00:02:25 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Dec 2012 21:01:58 -0800
Message-Id: <1f5113ae91ed639cf06fcbb9431b460d7a06bbbc.1354855433.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1354855433.git.scott.a.garman@intel.com>
References: <cover.1354855433.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1354855433.git.scott.a.garman@intel.com>
References: <cover.1354855433.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 8A8A9303EC.9008F
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 05/16] package_rpm.bbclass: Fix incremental rpm image generation
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
X-List-Received-Date: Fri, 07 Dec 2012 05:36:09 -0000

From: Robert Yang <liezhi.yang@windriver.com>

Fix the incremental rpm image generation, it didn't work since the code
has been changed.

The btmanifest should have a ".manifest" suffix, so that it can be moved
to ${T} by rootfs_rpm.bbclass:
mv ${IMAGE_ROOTFS}/install/*.manifest ${T}/

Note: The locale pkgs would always be re-installed.

[YOCTO #2690]

(From OE-Core rev: 5149630746626c6d416f26ab9dd1c7213fcd8c50)

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/package_rpm.bbclass |   20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index ffe3b31..e2bec2d 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -168,28 +168,24 @@ rpm_common_comand () {
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
@@ -472,7 +468,7 @@ EOF
 	# probably a feature. The only way to convince rpm to actually run the preinstall scripts 
 	# for base-passwd and shadow first before installing packages that depend on these packages 
 	# is to do two image installs, installing one set of packages, then the other.
-	if [ "${INC_RPM_IMAGE_GEN}" = "1" -a -f ${T}/total_solution_bt.manifest ]; then
+	if [ "${INC_RPM_IMAGE_GEN}" = "1" -a -f "$pre_btmanifest" ]; then
 		echo "Skipping pre install due to exisitng image"
 	else
 		echo "# Initial Install manifest" > ${target_rootfs}/install/initial_install.manifest
-- 
1.7.9.5



