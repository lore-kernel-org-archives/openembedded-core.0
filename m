Return-Path: <stefanx.stanacar@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 4536C6B201
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 11:43:39 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Jul 2013 04:43:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,676,1367996400"; d="scan'208";a="268942865"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Jul 2013 04:43:39 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 63EC96A4093;
	Tue, 16 Jul 2013 04:43:37 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jul 2013 14:42:35 +0300
Message-Id: <1373974955-29897-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] populate_sdk_base.bbclass: use new perm option for find
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Jul 2013 11:43:39 -0000

Old way find -perm +mode is no longer supported in newer
versions of find (Fedora 19). Man page says:
-perm +mode
       This  is  no  longer  supported  (and  has been deprecated since
       2005).  Use -perm /mode instead.

[YOCTO #4853]

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/classes/populate_sdk_base.bbclass                                  | 2 +-
 .../installer/adt-installer/scripts/adt_installer_internal              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 30c1d29..aa3c2fa 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -254,7 +254,7 @@ if [ "$dl_path" = "" ] ; then
 	echo "SDK could not be set up. Relocate script unable to find ld-linux.so. Abort!"
 	exit 1
 fi
-executable_files=$($SUDO_EXEC find $native_sysroot -type f -perm +111)
+executable_files=$($SUDO_EXEC find $native_sysroot -type f -perm /111)
 
 tdir=`mktemp -d`
 if [ x$tdir = x ] ; then
diff --git a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
index 175d285..065bcc7 100755
--- a/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
+++ b/meta/recipes-devtools/installer/adt-installer/scripts/adt_installer_internal
@@ -203,7 +203,7 @@ $SUDO sh -c "sed -e '"s:##DEFAULT_INSTALL_DIR##:$escaped_sdkpath:"' scripts/relo
 $SUDO chmod +x scripts/relocate_sdk_tmp.py
 
 dl_path=$(find $OECORE_NATIVE_SYSROOT/lib -name "ld-linux*")
-executable_files=$(find $OECORE_NATIVE_SYSROOT -type f -perm +111)
+executable_files=$(find $OECORE_NATIVE_SYSROOT -type f -perm /111)
 
 $SUDO scripts/relocate_sdk_tmp.py $INSTALL_FOLDER $dl_path $executable_files
 check_result
-- 
1.8.3.1


