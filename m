Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TcvGG-0004wq-DN
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Nov 2012 10:45:56 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 26 Nov 2012 01:31:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,319,1352102400"; d="scan'208";a="172548371"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Nov 2012 01:31:42 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 26 Nov 2012 11:31:40 +0200
Message-Id: <1353922300-22538-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] populate_sdk_base: tarball installer: SDK overwrite warning
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
X-List-Received-Date: Mon, 26 Nov 2012 09:45:56 -0000

This patch contains two fixes:
  * if the user wants to install the SDK in a directory that already
    contains a SDK for the same architecture, a warning will be shown;
  * when the symbolic links are relocated use -n option. Otherwise,
    symbolic links to existing directories will be created in the
	directory itself;

[YOCTO #3401]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/populate_sdk_base.bbclass |   15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index ac34c32..f1fcde6 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -143,11 +143,20 @@ else
 	target_sdk_dir=$(readlink -m $target_sdk_dir)
 fi
 
-printf "You are about to install the SDK to \"$target_sdk_dir\". Proceed[Y/n]?"
+if [ -e "$target_sdk_dir/environment-setup-${REAL_MULTIMACH_TARGET_SYS}" ]; then
+	echo "The directory \"$target_sdk_dir\" already contains a SDK for this architecture."
+	printf "If you continue, existing files will be overwritten! Proceed[y/N]?"
+
+	default_answer="n"
+else
+	printf "You are about to install the SDK to \"$target_sdk_dir\". Proceed[Y/n]?"
+
+	default_answer="y"
+fi
 read answer
 
 if [ "$answer" = "" ]; then
-	answer="y"
+	answer="$default_answer"
 fi
 
 if [ "$answer" != "Y" -a "$answer" != "y" ]; then
@@ -188,7 +197,7 @@ find $native_sysroot -type f -exec file '{}' \;|grep ":.*ASCII.*text"|cut -d':'
 
 # change all symlinks pointing to ${SDKPATH}
 for l in $(find $native_sysroot -type l); do
-	ln -sf $(readlink $l|sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:") $l
+	ln -sfn $(readlink $l|sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:") $l
 done
 
 echo done
-- 
1.7.9.5



