Return-Path: <brian.avery@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5430471C90
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 22:19:59 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 04 Apr 2017 15:20:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,276,1486454400"; d="scan'208";a="73618119"
Received: from bavery-ws-desk.jf.intel.com ([10.54.74.5])
	by orsmga004.jf.intel.com with ESMTP; 04 Apr 2017 15:20:01 -0700
From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Apr 2017 15:22:10 -0700
Message-Id: <c9e2f951c2e2bc367fa6bff0daf039f00503c846.1491344268.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1491344268.git.brian.avery@intel.com>
References: <cover.1491344268.git.brian.avery@intel.com>
Subject: [PATCH 1/2] scripts: change way we find native tools (pseudo)
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
X-List-Received-Date: Tue, 04 Apr 2017 22:20:00 -0000

oe-find-native-sysroot: Recipe Specific Sysroots have eliminated the
large STAGING_DIR_NATIVE. Now, we will rely on the meta-ide-support
sysroot that is what was populating the large STAGING_DIR_NATIVE in
previous versions anyway. We now look for RECIPE_SYSROOT_NATIVE.

[YOCTO #11119]

Signed-off-by: brian avery <brian.avery@intel.com>
---
 scripts/oe-find-native-sysroot | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/oe-find-native-sysroot b/scripts/oe-find-native-sysroot
index 13a5c46..3f4c29d 100755
--- a/scripts/oe-find-native-sysroot
+++ b/scripts/oe-find-native-sysroot
@@ -2,7 +2,7 @@
 #
 # Find a native sysroot to use - either from an in-tree OE build or
 # from a toolchain installation. It then ensures the variable
-# $OECORE_NATIVE_SYSROOT is set to the sysroot's base directory, and sets 
+# $OECORE_NATIVE_SYSROOT is set to the sysroot's base directory, and sets
 # $PSEUDO to the path of the pseudo binary.
 #
 # This script is intended to be run within other scripts by source'ing
@@ -54,10 +54,10 @@ if [ "x$OECORE_NATIVE_SYSROOT" = "x" ]; then
                 exit 1
             fi
             touch conf/sanity.conf
-            OECORE_NATIVE_SYSROOT=`bitbake -e | grep ^STAGING_DIR_NATIVE | cut -d '"' -f2`
+            OECORE_NATIVE_SYSROOT=`bitbake -e meta-ide-support | grep ^RECIPE_SYSROOT_NATIVE | cut -d '"' -f2`
             rm -f conf/sanity.conf
         else
-            OECORE_NATIVE_SYSROOT=`bitbake -e | grep ^STAGING_DIR_NATIVE | cut -d '"' -f2`
+            OECORE_NATIVE_SYSROOT=`bitbake -e meta-ide-support | grep ^RECIPE_SYSROOT_NATIVE | cut -d '"' -f2`
         fi
     else
         echo "Error: Unable to locate bitbake command."
@@ -72,7 +72,7 @@ fi
 if [ "x$OECORE_NATIVE_SYSROOT" = "x" ]; then
     # This indicates that there was an error running bitbake -e that
     # the user needs to be informed of
-    echo "There was an error running bitbake to determine STAGING_DIR_NATIVE"
+    echo "There was an error running bitbake to determine RECIPE_SYSROOT_NATIVE"
     echo "Here is the output from bitbake -e"
     bitbake -e
     exit 1
-- 
1.9.1


