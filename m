Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UGXLR-00086g-61
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Mar 2013 17:19:02 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 15 Mar 2013 09:02:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,850,1355126400"; d="scan'208";a="280057862"
Received: from lpalcu-linux.rb.intel.com (HELO localhost.localdomain)
	([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 15 Mar 2013 09:01:58 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Mar 2013 18:01:53 +0200
Message-Id: <1363363314-12326-3-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1363363314-12326-1-git-send-email-laurentiu.palcu@intel.com>
References: <1363363314-12326-1-git-send-email-laurentiu.palcu@intel.com>
Subject: [PATCH 2/2] populate_sdk_base: search for perl scripts after symlinks are relocated
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
X-List-Received-Date: Fri, 15 Mar 2013 16:19:57 -0000

grep will throw "No such file or directory" errors for all invalid
symlinks. To overcome this, move the search after the symlinks have been
changed to point to the new location.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/populate_sdk_base.bbclass |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 7af2d2e..4015030 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -269,6 +269,11 @@ fi
 # replace ${SDKPATH} with the new prefix in all text files: configs/scripts/etc
 $SUDO_EXEC find $native_sysroot -type f -exec file '{}' \;|grep ":.*\(ASCII\|script\|source\).*text"|cut -d':' -f1|$SUDO_EXEC xargs sed -i -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g"
 
+# change all symlinks pointing to ${SDKPATH}
+for l in $($SUDO_EXEC find $native_sysroot -type l); do
+	$SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:") $l
+done
+
 # find out all perl scripts in $native_sysroot and modify them replacing the
 # host perl with SDK perl.
 for perl_script in $($SUDO_EXEC grep "^#!.*perl" -rl $native_sysroot); do
@@ -276,11 +281,6 @@ for perl_script in $($SUDO_EXEC grep "^#!.*perl" -rl $native_sysroot); do
 		"s: /usr/bin/perl: /usr/bin/env perl:g" $perl_script
 done
 
-# change all symlinks pointing to ${SDKPATH}
-for l in $($SUDO_EXEC find $native_sysroot -type l); do
-	$SUDO_EXEC ln -sfn $(readlink $l|$SUDO_EXEC sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:") $l
-done
-
 echo done
 
 # delete the relocating script, so that user is forced to re-run the installer
-- 
1.7.9.5



