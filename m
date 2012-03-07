Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1S56Tc-0005yq-P3
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Mar 2012 03:19:40 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Mar 2012 18:10:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="118446894"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.62])
	by orsmga002.jf.intel.com with ESMTP; 06 Mar 2012 18:10:56 -0800
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Mar 2012 10:06:47 +0800
Message-Id: <324c375ed3e7c0fb061b52c9dd6a57afdfe4f5fa.1331085934.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1331085934.git.lianhao.lu@intel.com>
References: <cover.1331085934.git.lianhao.lu@intel.com>
Subject: [PATCH 1/1] adt-installer: Corrected wrong environment file names.
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
X-List-Received-Date: Wed, 07 Mar 2012 02:19:41 -0000

[YOCTO #2055]
1. Corrected the wrong environment file name for powerpc.

2. Removed unnecessary variables in adt_installer.conf.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 .../adt-installer/scripts/adt_installer_internal   |    2 ++
 .../installer/adt-installer_1.0.bb                 |    5 +----
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index 6201095..684dc88 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -175,6 +175,8 @@ check_result
 echo_info "Updating environment script with target sysroot location."
 if [ "$1" == "x86"  ]; then
   env_filename=`ls $INSTALL_FOLDER/environment-setup-i586*`
+elif [ "$1" == "ppc" ]; then
+  env_filename=`ls $INSTALL_FOLDER/environment-setup-powerpc*`
 else
   env_filename=`ls $INSTALL_FOLDER/environment-setup-$1*`
 fi
diff --git a/meta/recipes-devtools/installer/adt-installer_1.0.bb b/meta/recipes-devtools/installer/adt-installer_1.0.bb
index 340349d..27937d9 100644
--- a/meta/recipes-devtools/installer/adt-installer_1.0.bb
+++ b/meta/recipes-devtools/installer/adt-installer_1.0.bb
@@ -30,7 +30,7 @@ ALLOW_EMPTY = "1"
 
 PACKAGES = ""
 
-PR = "r6"
+PR = "r7"
 
 ADT_DEPLOY = "${TMPDIR}/deploy/sdk/"
 ADT_DIR = "${WORKDIR}/adt-installer/"
@@ -68,9 +68,6 @@ fakeroot do_populate_adt () {
 	cp -r scripts ${ADT_DIR}/
 	cp adt_installer ${ADT_DIR}
 	cp adt_installer.conf ${ADT_DIR}
-	echo 'YOCTOADT_VERSION=${SDK_VERSION}' > ${ADT_DIR}/temp.conf
-        cat ${ADT_DIR}/adt_installer.conf >> ${ADT_DIR}/temp.conf
-        mv ${ADT_DIR}/temp.conf ${ADT_DIR}/adt_installer.conf
 	sed -i -e 's#YOCTOADT_VERSION#${SDK_VERSION}#' ${ADT_DIR}/adt_installer.conf
         echo 'SDK_VENDOR=${SDK_VENDOR}' >> ${ADT_DIR}/scripts/data_define
         echo 'INSTALL_FOLDER=${SDKPATH}' >> ${ADT_DIR}/scripts/data_define
-- 
1.7.0.4



