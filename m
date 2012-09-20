Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TEhJY-0004Kw-3U
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Sep 2012 16:01:12 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Sep 2012 06:48:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,453,1344236400"; d="scan'208";a="208702979"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by orsmga002.jf.intel.com with ESMTP; 20 Sep 2012 06:48:14 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Sep 2012 16:48:02 +0300
Message-Id: <a10d0e1b4dc0667b04f1cfa906378ce9094449ae.1348148406.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1348148406.git.laurentiu.palcu@intel.com>
References: <cover.1348148406.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1348148406.git.laurentiu.palcu@intel.com>
References: <cover.1348148406.git.laurentiu.palcu@intel.com>
Subject: [PATCH v2 5/6] SDK: relocate symlinks too
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
X-List-Received-Date: Thu, 20 Sep 2012 14:01:12 -0000

The directory usr/libexec/ in the SDK sysroot contains the default
symlinks to the toolchain binaries and these, too, need to point to the
correct toolchain path.

[YOCTO #3090]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/populate_sdk_base.bbclass             |    5 +++++
 .../adt-installer/scripts/adt_installer_internal   |    5 +++++
 2 files changed, 10 insertions(+)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index f20a6ac..52bae53 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -174,6 +174,11 @@ fi
 # replace ${SDKPATH} with the new prefix in all text files: configs/scripts/etc
 find $native_sysroot -type f -exec file '{}' \;|grep ":.*ASCII.*text"|cut -d':' -f1|xargs sed -i -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g"
 
+# change all symlinks pointing to ${SDKPATH}
+for l in $(find $native_sysroot -type l); do
+	ln -sf $(readlink $l|sed -e "s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:") $l
+done
+
 echo done
 
 # delete the relocating script, so that user is forced to re-run the installer
diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index fbcd2ce..63fcf60 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -215,6 +215,11 @@ $SUDO sed -i -e "s:$DEFAULT_INSTALL_FOLDER:$NATIVE_INSTALL_DIR:g" $env_setup_scr
 find $OECORE_NATIVE_SYSROOT -type f -exec file '{}' \;|grep ":.*ASCII.*text"|cut -d':' -f1|\
     xargs $SUDO sed -i -e "s:$DEFAULT_INSTALL_FOLDER:$NATIVE_INSTALL_DIR:g"
 
+# change all symlinks pointing to /opt/${DISTRO}/${SDK_VERSION}
+for l in $(find $NATIVE_INSTALL_DIR -type l); do
+	ln -sf $(readlink $l|sed -e "s:$DEFAULT_INSTALL_FOLDER:$NATIVE_INSTALL_DIR:") $l
+done
+
 echo_info "\nSuccessfully installed selected native ADT!"
 }
 
-- 
1.7.9.5



