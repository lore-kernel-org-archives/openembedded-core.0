Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D8FC76F469
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 12:15:48 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Mar 2014 04:15:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,599,1389772800"; d="scan'208";a="467688624"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 06 Mar 2014 04:15:48 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Mar 2014 14:15:41 +0200
Message-Id: <6ab69a72dfabb209e97b6215ff3ac9022d3e8261.1394099850.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1394099850.git.laurentiu.palcu@intel.com>
References: <cover.1394099850.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1394099850.git.laurentiu.palcu@intel.com>
References: <cover.1394099850.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/2] run-postinsts: use it for opkg/dpkg too
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
X-List-Received-Date: Thu, 06 Mar 2014 12:15:49 -0000

Currently, opkg/dpkg have their own postinstalls that create a
run-postinsts script which is run at first boot.

This commit prepares the run-postinsts recipe/script to be used by
opkg/dpkg when DISTRO_FEATURES includes package-management.

[YOCTO #5666]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../run-postinsts/run-postinsts/run-postinsts      |   63 +++++++++++++-------
 .../run-postinsts/run-postinsts_1.0.bb             |    2 +
 2 files changed, 42 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
index 11141ec..08cfa9e 100755
--- a/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts/run-postinsts
@@ -8,13 +8,9 @@
 # The following script will run all the scriptlets found in #SYSCONFDIR#/deb-postinsts,
 # #SYSCONFDIR#/ipk-postinsts or #SYSCONFDIR#/rpm-posinsts.
 
-pi_dir=""
-for pm in rpm deb ipk; do
-	if [ -d "#SYSCONFDIR#/${pm}-postinsts" ]; then
-		pi_dir=#SYSCONFDIR#/${pm}-postinsts
-		break
-	fi
-done
+pm=#IMAGE_PKGTYPE#
+pm_installed=#PM_INSTALLED#
+pi_dir=#SYSCONFDIR#/${pm}-postinsts
 
 remove_rcsd_link () {
 	if [ -n "`which update-rc.d`" ]; then
@@ -29,24 +25,45 @@ fi
 
 [ -e #SYSCONFDIR#/default/postinst ] && . #SYSCONFDIR#/default/postinst
 
-remove_pi_dir=1
-for i in `ls $pi_dir`; do
-	i=$pi_dir/$i
-	echo "Running postinst $i..."
-	[ "$POSTINST_LOGGING" = "1" ] && echo "Running postinst $i..." >> $LOGFILE
-	if [ -x $i ]; then
-		if [ "$POSTINST_LOGGING" = "1" ]; then
-			sh -c $i >>$LOGFILE 2>&1
+if [ "$POSTINST_LOGGING" = "1" ]; then
+	rm -f $LOGFILE
+	append_log=">>$LOGFILE 2>&1"
+fi
+
+exec_postinst_scriptlets() {
+	for i in `ls $pi_dir`; do
+		i=$pi_dir/$i
+		echo "Running postinst $i..."
+		[ "$POSTINST_LOGGING" = "1" ] && eval echo "Running postinst $i..." $append_log
+		if [ -x $i ]; then
+			eval sh -c $i $append_log
+			rm $i
 		else
-			sh -c $i
+			echo "ERROR: postinst $i failed."
+			[ "$POSTINST_LOGGING" = "1" ] && eval echo "ERROR: postinst $i failed." $append_log
+			remove_pi_dir=0
 		fi
-		rm $i
-	else
-		echo "ERROR: postinst $i failed."
-		[ "$POSTINST_LOGGING" = "1" ] && echo "ERROR: postinst $i failed." >> $LOGFILE
-		remove_pi_dir=0
-	fi
-done
+	done
+}
+
+remove_pi_dir=1
+if $pm_installed; then
+	case $pm in
+		"ipk")
+			eval opkg-cl configure $append_log
+			;;
+
+		"deb")
+			eval dpkg --configure -a $append_log
+			;;
+
+		"rpm")
+			exec_postinst_scriptlets
+			;;
+	esac
+else
+	exec_postinst_scriptlets
+fi
 
 # since all postinstalls executed successfully, remove the postinstalls directory
 # and the rcS.d link
diff --git a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
index 64f85c2..e990c67 100644
--- a/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
+++ b/meta/recipes-devtools/run-postinsts/run-postinsts_1.0.bb
@@ -37,6 +37,8 @@ do_install() {
 	sed -i -e 's:#SYSCONFDIR#:${sysconfdir}:g' \
                -e 's:#SBINDIR#:${sbindir}:g' \
                -e 's:#BASE_BINDIR#:${base_bindir}:g' \
+               -e 's:#IMAGE_PKGTYPE#:${IMAGE_PKGTYPE}:g' \
+               -e 's:#PM_INSTALLED#:${@base_contains("IMAGE_FEATURES", "package-management", "true", "false", d)}:g' \
                ${D}${sbindir}/run-postinsts \
                ${D}${systemd_unitdir}/system/run-postinsts.service
 }
-- 
1.7.9.5


