Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 043946098C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 May 2013 13:15:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2013 06:15:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,728,1363158000"; d="scan'208";a="342006818"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2013 06:15:35 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 May 2013 16:15:23 +0300
Message-Id: <fab7098c7b3a81a1ade98561176d376f26becc8c.1369313581.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1369313581.git.laurentiu.palcu@intel.com>
References: <cover.1369313581.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1369313581.git.laurentiu.palcu@intel.com>
References: <cover.1369313581.git.laurentiu.palcu@intel.com>
Subject: [PATCH 5/7] run-postinsts: make it generic
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
X-List-Received-Date: Thu, 23 May 2013 13:15:35 -0000

This recipe is used only when the package manager is not deployed on
target and there still are delayed postinstalls that need to be run on
target. At the moment, run-postinsts is targeted to dpkg/opkg. RPM uses another
recipe, called rpm-postinsts which, in turn, is used even when the rpm
package is deployed.

This patch intends to make run-postinsts generic and deprecate
rpm-postinsts. Here's why:
 * when opkg/dpkg are not deplyed, the meta-data files are useless.
   Hence, the awk script is not needed. The postinstall files are already
   saved in /etc/(deb|ipk)-postinsts directory and we can use the same
   procedure as in rpm's case;

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../dpkg/run-postinsts/run-postinsts               |   59 ++++++++++++--------
 .../dpkg/run-postinsts/run-postinsts.awk           |   30 ----------
 meta/recipes-devtools/dpkg/run-postinsts_1.0.bb    |    7 +--
 3 files changed, 38 insertions(+), 58 deletions(-)
 delete mode 100644 meta/recipes-devtools/dpkg/run-postinsts/run-postinsts.awk

diff --git a/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts b/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts
index 5f6442c..2593066 100755
--- a/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts
+++ b/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts
@@ -5,32 +5,43 @@
 # Author: Richard Purdie <rpurdie@openedhand.com>
 #
 
-PKGSYSTEM=/var/lib/dpkg
+# The following script will run all the scriptlets found in #SYSCONFDIR#/deb-postinsts or
+# #SYSCONFDIR#/ipk-postinsts
 
-if [ ! -e $PKGSYSTEM/status ]; then
-  if [ -e /var/lib/opkg/status ]; then
-    PKGSYSTEM=/var/lib/opkg
-  else
-    echo "No package system found"
-    exit 1
-  fi
-fi
+pi_dir=""
+for pm in rpm deb ipk; do
+	if [ -d "#SYSCONFDIR#/${pm}-postinsts" ]; then
+		pi_dir=#SYSCONFDIR#/${pm}-postinsts
+		break
+	fi
+done
 
-STAMP=$PKGSYSTEM/postinsts-done
-STATFILE=$PKGSYSTEM/status
-STATFILE2=$PKGSYSTEM/status2
+[ -z "$pi_dir" ] && exit 0
 
-if [ -e $STAMP ]; then
-  exit 0
-fi
+[ -e #SYSCONFDIR#/default/postinst ] && . #SYSCONFDIR#/default/postinst
+
+remove_pi_dir=1
+for i in `ls $pi_dir`; do
+	i=$pi_dir/$i
+	echo "Running postinst $i..."
+	if [ -x $i ]; then
+		if [ "$POSTINST_LOGGING" = "1" ]; then
+			sh -c $i >>$LOGFILE 2&>1
+		else
+			sh -c $i
+		fi
+		rm $i
+	else
+		echo "ERROR: postinst $i failed."
+		remove_pi_dir=0
+	fi
+done
 
-awk -f /usr/share/run-postinsts/run-postinsts.awk $STATFILE > $STATFILE2
-if [ $? = 0 ]; then
-  mv $STATFILE2 $STATFILE
-  touch $STAMP
-  exit 0
-else
-  rm -f $STATFILE2
-  rm -f $STAMP
-  exit 1
+# since all postinstalls executed successfully, remove the postinstalls directory
+# and the rcS.d link
+if [ $remove_pi_dir = 1 ]; then
+	rm -rf $pi_dir
+	if [ -n "`which update-rc.d`" ]; then
+		update-rc.d -f run-postinsts remove
+	fi
 fi
diff --git a/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts.awk b/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts.awk
deleted file mode 100644
index cbc8d1a..0000000
--- a/meta/recipes-devtools/dpkg/run-postinsts/run-postinsts.awk
+++ /dev/null
@@ -1,30 +0,0 @@
-#
-# Copyright 2007 Openedhand Ltd.
-#
-# Author: Richard Purdie <rpurdie@openedhand.com>
-#
-# Rather hacky proof of concept
-#
-
-BEGIN {
-  rc=system("test -d /var/lib/dpkg/info/")
-  if (rc==0)
-    pkgdir="/var/lib/dpkg/info"
-  else
-    pkgdir="/var/lib/opkg/info"
-  package=""
-}
-/Package:.*/ {
-  package = substr($0, 10)
-}
-/Status:.*unpacked.*/ {
-  print "Configuring: " package > "/dev/stderr"
-  ret = system(pkgdir "/" package ".postinst 1>&2")
-  if (ret == 0)
-    $0 = gensub("unpacked", "installed", 1)
-  else
-    print "Postinstall failed for " package > "/dev/stderr"
-}
-{
-  print $0
-}
diff --git a/meta/recipes-devtools/dpkg/run-postinsts_1.0.bb b/meta/recipes-devtools/dpkg/run-postinsts_1.0.bb
index 4c9b2fd..5dd1709 100644
--- a/meta/recipes-devtools/dpkg/run-postinsts_1.0.bb
+++ b/meta/recipes-devtools/dpkg/run-postinsts_1.0.bb
@@ -1,11 +1,11 @@
-DESCRIPTION = "Run postinstall scripts on device using awk"
+DESCRIPTION = "Run postinstall scripts on device"
 SECTION = "devel"
 PR = "r9"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-SRC_URI = "file://run-postinsts file://run-postinsts.awk"
+SRC_URI = "file://run-postinsts"
 
 INITSCRIPT_NAME = "run-postinsts"
 INITSCRIPT_PARAMS = "start 98 S ."
@@ -24,6 +24,5 @@ do_install() {
 	install -d ${D}${sysconfdir}/init.d/
 	install -m 0755 ${WORKDIR}/run-postinsts ${D}${sysconfdir}/init.d/
 
-	install -d ${D}${datadir}/${BPN}/
-	install -m 0644 ${WORKDIR}/run-postinsts.awk ${D}${datadir}/${BPN}/
+	sed -i -e 's:#SYSCONFDIR#:${sysconfdir}:g' ${D}${sysconfdir}/init.d/run-postinsts
 }
-- 
1.7.9.5


