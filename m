Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UXCM6-0003n7-4f
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Apr 2013 17:21:33 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 30 Apr 2013 08:02:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,582,1363158000"; d="scan'208";a="234837372"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by AZSMGA002.ch.intel.com with ESMTP; 30 Apr 2013 08:02:11 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Apr 2013 18:02:10 +0300
Message-Id: <1367334130-8919-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] adt-installer: do not dereference symlinks when relocating
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
X-List-Received-Date: Tue, 30 Apr 2013 15:21:42 -0000

This was already fixed for meta-toolchain.

[YOCTO #4157]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../adt-installer/scripts/adt_installer_internal   |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index b80a7ed..4322964 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -217,7 +217,7 @@ find $OECORE_NATIVE_SYSROOT -type f -exec file '{}' \;|grep ":.*\(ASCII\|script\
 
 # change all symlinks pointing to /opt/${DISTRO}/${SDK_VERSION}
 for l in $(find $NATIVE_INSTALL_DIR -type l); do
-    $SUDO ln -sf $(readlink $l|sed -e "s:$DEFAULT_INSTALL_FOLDER:$NATIVE_INSTALL_DIR:") $l
+    $SUDO ln -sfn $(readlink $l|sed -e "s:$DEFAULT_INSTALL_FOLDER:$NATIVE_INSTALL_DIR:") $l
 done
 
 echo_info "\nSuccessfully installed selected native ADT!"
-- 
1.7.9.5



