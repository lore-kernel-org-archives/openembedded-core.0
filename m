Return-Path: <brian.avery@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0991677D41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Apr 2017 21:26:27 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga105.fm.intel.com with ESMTP; 12 Apr 2017 14:26:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,191,1488873600"; d="scan'208";a="76695873"
Received: from bavery-ws-desk.jf.intel.com ([10.54.74.5])
	by orsmga004.jf.intel.com with ESMTP; 12 Apr 2017 14:26:27 -0700
From: brian avery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Apr 2017 14:29:13 -0700
Message-Id: <47f3702b3c5ea08ceb6faf73c42d29a8d991e078.1492031994.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1492031994.git.brian.avery@intel.com>
References: <cover.1492031994.git.brian.avery@intel.com>
Subject: [PATCH 3/4] oe-find-native-sysroot: add appopriate suggestion
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
X-List-Received-Date: Wed, 12 Apr 2017 21:26:28 -0000

right now, if it fails, the script tells the user to run bitbake foo
-caddto_recipe_sysroot. This works for native recipes but not things
like meta-ide. This patch checks whether the recipe is native and gives
out the appopriate warning.

Signed-off-by: brian avery <brian.avery@intel.com>
---
 scripts/oe-find-native-sysroot | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/oe-find-native-sysroot b/scripts/oe-find-native-sysroot
index ad7b2d1..5c8681e 100755
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
@@ -48,7 +48,6 @@ fi
 # Global vars
 BITBAKE_E=""
 OECORE_NATIVE_SYSROOT=""
-
 set_oe_native_sysroot(){
     echo "Running bitbake -e $1"
     BITBAKE_E="`bitbake -e $1`"
@@ -93,7 +92,11 @@ if [ ! -e "$OECORE_NATIVE_SYSROOT/" ]; then
     echo "Error: $OECORE_NATIVE_SYSROOT doesn't exist."
 
     if [ "x$OECORE_DISTRO_VERSION" = "x" ]; then
-        echo "Have you run 'bitbake $1 -caddto_recipe_sysroot'?"
+        if [[ $1 =~ .*native.* ]]; then
+            echo "Have you run 'bitbake $1 -caddto_recipe_sysroot'?"
+        else
+            echo "Have you run 'bitbake $1 '?"
+        fi
     else
         echo "This shouldn't happen - something is wrong with your toolchain installation"
     fi
-- 
1.9.1


