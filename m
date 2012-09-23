Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TFn9R-00087Q-Pd
	for openembedded-core@lists.openembedded.org;
	Sun, 23 Sep 2012 16:27:17 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 23 Sep 2012 07:14:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,470,1344236400"; d="scan'208";a="225477776"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by fmsmga001.fm.intel.com with ESMTP; 23 Sep 2012 07:14:29 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Sep 2012 17:14:27 +0300
Message-Id: <1348409667-15468-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] adt-installer: add sudo when relocating symlinks
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
X-List-Received-Date: Sun, 23 Sep 2012 14:27:18 -0000

This is needed if installation is done in a directory that needs root
privileges.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../adt-installer/scripts/adt_installer_internal   |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index 63fcf60..9a13573 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -217,7 +217,7 @@ find $OECORE_NATIVE_SYSROOT -type f -exec file '{}' \;|grep ":.*ASCII.*text"|cut
 
 # change all symlinks pointing to /opt/${DISTRO}/${SDK_VERSION}
 for l in $(find $NATIVE_INSTALL_DIR -type l); do
-	ln -sf $(readlink $l|sed -e "s:$DEFAULT_INSTALL_FOLDER:$NATIVE_INSTALL_DIR:") $l
+    $SUDO ln -sf $(readlink $l|sed -e "s:$DEFAULT_INSTALL_FOLDER:$NATIVE_INSTALL_DIR:") $l
 done
 
 echo_info "\nSuccessfully installed selected native ADT!"
-- 
1.7.9.5



