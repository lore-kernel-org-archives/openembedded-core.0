Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnoKx-0004ka-7B
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jan 2012 10:31:15 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 19 Jan 2012 01:23:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97472126"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.6])
	by azsmga001.ch.intel.com with ESMTP; 19 Jan 2012 01:23:03 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jan 2012 01:22:44 -0800
Message-Id: <79ab4f6bf5f69b328cbda1482cb531abfcf48fd8.1326964778.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
In-Reply-To: <cover.1326964778.git.sgw@linux.intel.com>
References: <cover.1326964778.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 23/33] adt-installer: install autoconf(/automake)-nativesdk
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
X-List-Received-Date: Thu, 19 Jan 2012 09:31:16 -0000

From: Lianhao Lu <lianhao.lu@intel.com>

[YOCTO #1909]
Install autoconf-nativesdk and automake-nativesdk to host.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 .../adt-installer/scripts/adt_installer_internal   |   18 ++++++------------
 .../installer/adt-installer_1.0.bb                 |    2 +-
 2 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index 870931e..6201095 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -91,18 +91,12 @@ check_result
 OPKG_INSTALL_CMD="$OPKG_CMD "
 OPKG_INSTALL_NATIVE_CMD="$OPKG_INSTALL_CMD  -f $OPKG_CONFIG_FILE -o $NATIVE_INSTALL_DIR install"
 
-echo_info "Installing pseudo nativesdk ...\n"
-$OPKG_INSTALL_NATIVE_CMD pseudo-nativesdk &>> $YOCTOADT_INSTALL_LOG_FILE
-check_result
-echo_info "Installing opkg nativesdk ...\n"
-$OPKG_INSTALL_NATIVE_CMD opkg-nativesdk &>> $YOCTOADT_INSTALL_LOG_FILE
-check_result
-echo_info "Installing pkgconfig nativesdk ...\n"
-$OPKG_INSTALL_NATIVE_CMD pkgconfig-nativesdk &>> $YOCTOADT_INSTALL_LOG_FILE
-check_result
-echo_info "Installing libtool nativesdk ...\n"
-$OPKG_INSTALL_NATIVE_CMD libtool-nativesdk &>> $YOCTOADT_INSTALL_LOG_FILE
-check_result
+BASE_HOSTSDK_PKGNAMES="pseudo opkg pkgconfig libtool autoconf automake"
+for pkg in $BASE_HOSTSDK_PKGNAMES; do
+  echo_info "Installing ${pkg} nativesdk ...\n"
+  $OPKG_INSTALL_NATIVE_CMD ${pkg}-nativesdk &>> $YOCTOADT_INSTALL_LOG_FILE
+  check_result
+done
 
 for native_target_type in $YOCTOADT_TARGETS; do
   native_target_type=`echo "$native_target_type" | sed -e 's/x86_64/x86-64/' -e 's/ppc/powerpc/'  -e 's/x86$/i586/'`
diff --git a/meta/recipes-devtools/installer/adt-installer_1.0.bb b/meta/recipes-devtools/installer/adt-installer_1.0.bb
index 53911b8..39e53c1 100644
--- a/meta/recipes-devtools/installer/adt-installer_1.0.bb
+++ b/meta/recipes-devtools/installer/adt-installer_1.0.bb
@@ -30,7 +30,7 @@ ALLOW_EMPTY = "1"
 
 PACKAGES = ""
 
-PR = "r4"
+PR = "r5"
 
 ADT_DEPLOY = "${TMPDIR}/deploy/sdk/"
 ADT_DIR = "${WORKDIR}/adt-installer/"
-- 
1.7.6.5



