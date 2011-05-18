Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jessica.zhang@intel.com>) id 1QMYFF-0001DU-1Y
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 06:20:25 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 17 May 2011 21:17:24 -0700
X-ExtLoop1: 1
Received: from jzhang-desktop.jf.intel.com (HELO localhost) ([10.7.201.78])
	by orsmga002.jf.intel.com with ESMTP; 17 May 2011 21:17:24 -0700
Message-Id: <3324059e7e89fed3747cb80f864d019640bb5023.1305693096.git.jessica.zhang@intel.com>
In-Reply-To: <cover.1305693096.git.jessica.zhang@intel.com>
References: <cover.1305693096.git.jessica.zhang@intel.com>
Old-Date: Tue, 17 May 2011 21:23:17 -0700
Date: Tue, 17 May 2011 21:36:25 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Jessica Zhang <jessica.zhang@intel.com>
Subject: [PATCH 2/2] Add adt repo checking
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
X-List-Received-Date: Wed, 18 May 2011 04:20:25 -0000

From: Jessica Zhang <jessica.zhang@intel.com>

Signed-off-by: Jessica Zhang <jessica.zhang@intel.com>
---
 .../installer/adt-installer/adt_installer          |   13 ++++++++++++-
 .../installer/adt-installer/adt_installer.conf     |    2 +-
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer b/meta/recipes-devtools/installer/adt-installer/adt_installer
index 9336b9e..1dd07b7 100755
--- a/meta/recipes-devtools/installer/adt-installer/adt_installer
+++ b/meta/recipes-devtools/installer/adt-installer/adt_installer
@@ -228,7 +228,7 @@ if [ -f "$LOCAL_DOWNLOAD/$filename" ]; then
   fi
 fi
 echo_info "Downloading file: $filename..."
-wget "$YOCTOADT_IPKG_REPO/$1" -P $LOCAL_DOWNLOAD --progress=bar:force 2>&1 | tee -a "$YOCTOADT_INSTALL_LOG_FILE" 
+wget "$YOCTOADT_REPO/rootfs/$1" -P $LOCAL_DOWNLOAD --progress=bar:force 2>&1 | tee -a "$YOCTOADT_INSTALL_LOG_FILE" 
 }
 
 
@@ -339,6 +339,17 @@ user_inst_type="$?"
 
 validate_config
 check_result
+
+#check adt_repo exist
+wget $YOCTOADT_REPO 2>&1 | tee -a "$YOCTOADT_INSTALL_LOG_FILE"
+if grep -q "ERROR 404: Not Found" $YOCTOADT_INSTALL_LOG_FILE; then
+  echo -e "[ADT_INST] Error: YOCTOADT_REPO does not exist: $YOCTOADT_REPO"
+  echo -e "\n#############################################################################"
+  echo -e "# Meet error(s) when installing Yocto ADT! Please check log file for details. "
+  echo -e "#############################################################################\n"
+  exit -1
+fi
+
 #firstly we need to install opkg host
 install_opkg
 
diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer.conf b/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
index b518c53..0c93237 100644
--- a/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
+++ b/meta/recipes-devtools/installer/adt-installer/adt_installer.conf
@@ -23,7 +23,7 @@
 
 # Your yocto distro repository, this should include IPKG based packages and root filesystem files where the installation is based on
 
-YOCTOADT_IPKG_REPO="http://adtrepo.yoctoproject.org/$YOCTOADT_VERSION/rootfs"
+YOCTOADT_REPO="http://adtrepo.yoctoproject.org/$YOCTOADT_VERSION"
 
 # The following are for system wide setup
 # Target architectures that you want to setup host cross dev environment for
-- 
1.7.0.4



