Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TEhJV-0004Kn-JZ
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Sep 2012 16:01:10 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Sep 2012 06:48:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,453,1344236400"; d="scan'208";a="208702955"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by orsmga002.jf.intel.com with ESMTP; 20 Sep 2012 06:48:09 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Sep 2012 16:47:58 +0300
Message-Id: <8ac4de1571d9862bb5cbf558b72b9cecc4751fc4.1348148406.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1348148406.git.laurentiu.palcu@intel.com>
References: <cover.1348148406.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1348148406.git.laurentiu.palcu@intel.com>
References: <cover.1348148406.git.laurentiu.palcu@intel.com>
Subject: [PATCH v2 1/6] adt-installer: fix package installation issue
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
X-List-Received-Date: Thu, 20 Sep 2012 14:01:10 -0000

When the cross canadian toolchains are installed, for different
architectures, they might contain common files. This leads to
installation failures since the opkg, by default, does not overwrite
files. This issue happens, for example, for binutils packages (that
contain the same locale files) or gdb (which installs some syscalls xml
files). The locale files could be removed from the binutils
cross-canadian package but we cannot do the same for the syscalls GDB
files which are used by GDB to display user friendly names for the
syscall numbers. Hence, the best solution is to force opkg to overwrite
these files.

[YOCTO #3109]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../adt-installer/scripts/adt_installer_internal   |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index 78ea6d0..f113aa4 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -112,7 +112,7 @@ check_result
 
 #install below must sdk-host packages
 OPKG_INSTALL_CMD="$OPKG_CMD "
-OPKG_INSTALL_NATIVE_CMD="$OPKG_INSTALL_CMD  -f $OPKG_CONFIG_FILE -o $NATIVE_INSTALL_DIR install"
+OPKG_INSTALL_NATIVE_CMD="$OPKG_INSTALL_CMD  --force-overwrite -f $OPKG_CONFIG_FILE -o $NATIVE_INSTALL_DIR install"
 
 BASE_HOSTSDK_PKGNAMES="pseudo opkg pkgconfig libtool autoconf automake"
 for pkg in $BASE_HOSTSDK_PKGNAMES; do
-- 
1.7.9.5



