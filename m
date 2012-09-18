Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TDuCS-0003Nd-UH
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 11:34:37 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Sep 2012 02:21:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,441,1344236400"; d="scan'208";a="223464669"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.41])
	by fmsmga002.fm.intel.com with ESMTP; 18 Sep 2012 02:21:53 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2012 12:21:43 +0300
Message-Id: <8ac4de1571d9862bb5cbf558b72b9cecc4751fc4.1347959838.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1347959838.git.laurentiu.palcu@intel.com>
References: <cover.1347959838.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1347959838.git.laurentiu.palcu@intel.com>
References: <cover.1347959838.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/4] adt-installer: fix package installation issue
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
X-List-Received-Date: Tue, 18 Sep 2012 09:34:37 -0000

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



