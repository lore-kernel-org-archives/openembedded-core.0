Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1PvHMm-0005gX-Mb
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 23:51:28 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 03 Mar 2011 14:49:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,260,1297065600"; d="scan'208";a="397242172"
Received: from unknown (HELO localhost) ([10.255.12.102])
	by azsmga001.ch.intel.com with ESMTP; 03 Mar 2011 14:49:20 -0800
Message-Id: <c2f0a98f094a34205c807c8d3d796cb39a0d15d9.1299192495.git.sgw@linux.intel.com>
In-Reply-To: <cover.1299192495.git.sgw@linux.intel.com>
References: <cover.1299192495.git.sgw@linux.intel.com>
Old-Date: Thu, 3 Mar 2011 03:18:38 +0800
Date: Thu, 03 Mar 2011 14:49:20 -0800
To: poky@yoctoproject.org,openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 06/10] ADT: Bug fix for Suse Linux
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
X-List-Received-Date: Thu, 03 Mar 2011 22:51:28 -0000

From: Liping Ke <liping.ke@intel.com>

On Suse linux11.2, we found when using sudo, we must add -E opts
to preserver some network proxy environment settings. Otherwise,
opkg-cl can't access files behind firewall. [bug #785]
Also, we need to add absolute path when sourcing files.
Fix for [bug #786]

[sgw: changed eval echo $PWD -> pwd]
Signed-off-by: Liping Ke <liping.ke@intel.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../installer/adt-installer/adt_installer          |    2 +-
 .../adt-installer/scripts/adt_installer_internal   |    2 +-
 .../installer/adt-installer/scripts/data_define    |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/adt_installer b/meta/recipes-devtools/installer/adt-installer/adt_installer
index cca576f..2448d2b 100755
--- a/meta/recipes-devtools/installer/adt-installer/adt_installer
+++ b/meta/recipes-devtools/installer/adt-installer/adt_installer
@@ -152,7 +152,7 @@ if [ ! -x "$LOCAL_OPKG_LOC/bin/opkg-cl" ]; then
     rm -rf $LOCAL_OPKG_LOC
   fi
 
-  parent_folder=`eval echo $PWD`
+  parent_folder=`pwd`
   cd $LOCAL_OPKG_FOLDER
   check_result
 
diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index b5e304d..df142ff 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -81,7 +81,7 @@ else
 fi
 
 #first update repository
-OPKG_CMD="sudo $LOCAL_OPKG_LOC/bin/opkg-cl"
+OPKG_CMD="sudo -E $LOCAL_OPKG_LOC/bin/opkg-cl"
 
 echo_info "Updating opkg..."
 $OPKG_CMD -f $OPKG_CONFIG_FILE -o $NATIVE_INSTALL_DIR update &>> $YOCTOADT_INSTALL_LOG_FILE
diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/data_define b/meta/recipes-devtools/installer/adt-installer/scripts/data_define
index 77f8b38..c7bce6d 100644
--- a/meta/recipes-devtools/installer/adt-installer/scripts/data_define
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/data_define
@@ -23,7 +23,7 @@
 # THE SOFTWARE.
 
 config_file="adt_installer.conf"
-source $config_file
+source `pwd`/$config_file
 
 LOCAL_OPKG_LOC="./opkg/build/opkg"
 LOCAL_OPKG_FOLDER="./opkg/build"
-- 
1.7.1.1



