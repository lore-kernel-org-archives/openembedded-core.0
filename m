Return-Path: <laurentiu.palcu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E08B56F907
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 12:44:20 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Mar 2014 05:44:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,742,1389772800"; d="scan'208";a="508170136"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by fmsmga002.fm.intel.com with ESMTP; 27 Mar 2014 05:44:02 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Mar 2014 14:43:57 +0200
Message-Id: <7a83d94ee1ccccb71d26f074538a09877ea002a0.1395924018.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1395924018.git.laurentiu.palcu@intel.com>
References: <cover.1395924018.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1395924018.git.laurentiu.palcu@intel.com>
References: <cover.1395924018.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/1] run-postinsts: fix issue with checking IMAGE_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Mar 2014 12:44:22 -0000

The old implementation was wrong. It was not very generic and it checked
IMAGE_FEATURES while building the recipe, which led to various issues
with the generation of the final script. That is, the run-postinsts
script was generated once, while building the package for the first
time. Hence, any other changes to IMAGE_FEATURES, like removing/adding
'package-management' did not reflect in the final script.

This commit makes run-postinsts script autodetect the backend used for
creating the image, making it generic.

[YOCTO #5666]
[YOCTO #5972]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../run-postinsts/run-postinsts/run-postinsts      |   30 +++++++++++++++-----
 .../run-postinsts/run-postinsts_1.0.bb             |    2 --
 2 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
index 08cfa9e..f547a7b 100755
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
@@ -8,9 +8,29 @@
 # The following script will run all the scriptlets found in #SYSCONFDIR#/deb-postinsts,
 # #SYSCONFDIR#/ipk-postinsts or #SYSCONFDIR#/rpm-posinsts.
 
-pm=#IMAGE_PKGTYPE#
-pm_installed=#PM_INSTALLED#
-pi_dir=#SYSCONFDIR#/${pm}-postinsts
+# the order of this list is important, do not change!
+backend_list="rpm deb ipk"
+
+pm_installed=false
+
+for pm in $backend_list; do
+	pi_dir="#SYSCONFDIR#/$pm-postinsts"
+
+	[ -d $pi_dir ] && break
+
+	case $pm in
+		"deb")
+			if [ -s "/var/lib/dpkg/status" ]; then
+				pm_installed=true
+				break
+			fi
+			;;
+
+		"ipk")
+			pm_installed=true
+			;;
+	esac
+done
 
 remove_rcsd_link () {
 	if [ -n "`which update-rc.d`" ]; then
@@ -56,10 +76,6 @@ if $pm_installed; then
 		"deb")
 			eval dpkg --configure -a $append_log
 			;;
-
-		"rpm")
-			exec_postinst_scriptlets
-			;;
 	esac
 else
 	exec_postinst_scriptlets
diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
index e990c67..64f85c2 100644
--- a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
@@ -37,8 +37,6 @@ do_install() {
 	sed -i -e 's:#SYSCONFDIR#:${sysconfdir}:g' \
                -e 's:#SBINDIR#:${sbindir}:g' \
                -e 's:#BASE_BINDIR#:${base_bindir}:g' \
-               -e 's:#IMAGE_PKGTYPE#:${IMAGE_PKGTYPE}:g' \
-               -e 's:#PM_INSTALLED#:${@base_contains("IMAGE_FEATURES", "package-management", "true", "false", d)}:g' \
                ${D}${sbindir}/run-postinsts \
                ${D}${systemd_unitdir}/system/run-postinsts.service
 }
-- 
1.7.9.5


