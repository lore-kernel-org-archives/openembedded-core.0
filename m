Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D291D77807
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Mar 2017 20:12:17 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Mar 2017 12:12:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,258,1486454400"; d="scan'208";a="832039567"
Received: from swold-mobl2.amr.corp.intel.com ([10.252.196.145])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Mar 2017 12:12:18 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Tue,  7 Mar 2017 12:12:10 -0800
Message-Id: <1488917530-26968-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1488917530-26968-1-git-send-email-sgw@linux.intel.com>
References: <1488917530-26968-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/2] crosstap: Changes to support Recipe specific sysroot
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
X-List-Received-Date: Tue, 07 Mar 2017 20:12:18 -0000

The crosstap script needed to be updated for recipe specific sysroot
changes including adding support for finding the systemtap binaries.

[YOCTO #10990]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 scripts/crosstap | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/scripts/crosstap b/scripts/crosstap
index 58317cf..39739bb 100755
--- a/scripts/crosstap
+++ b/scripts/crosstap
@@ -104,13 +104,19 @@ STAGING_BINDIR_TOOLCHAIN=$(echo "$BITBAKE_VARS" | grep ^STAGING_BINDIR_TOOLCHAIN
   | cut -d '=' -f2 | cut -d '"' -f2)
 STAGING_BINDIR_TOOLPREFIX=$(echo "$BITBAKE_VARS" | grep ^TARGET_PREFIX \
   | cut -d '=' -f2 | cut -d '"' -f2)
-SYSTEMTAP_HOST_INSTALLDIR=$(echo "$BITBAKE_VARS" | grep ^STAGING_DIR_NATIVE \
-  | cut -d '=' -f2 | cut -d '"' -f2)
 TARGET_ARCH=$(echo "$BITBAKE_VARS" | grep ^TRANSLATED_TARGET_ARCH \
   | cut -d '=' -f2 | cut -d '"' -f2)
 TARGET_KERNEL_BUILDDIR=$(echo "$BITBAKE_VARS" | grep ^B= \
   | cut -d '=' -f2 | cut -d '"' -f2)
 
+# Build and populate the recipe-sysroot-native with systemtap-native
+pushd $PWD
+cd $BUILDDIR
+BITBAKE_VARS=`bitbake -e systemtap-native`
+popd
+SYSTEMTAP_HOST_INSTALLDIR=$(echo "$BITBAKE_VARS" | grep ^STAGING_DIR_NATIVE \
+  | cut -d '=' -f2 | cut -d '"' -f2)
+
 systemtap_target_arch "$TARGET_ARCH"
 
 if [ ! -d $TARGET_KERNEL_BUILDDIR ] ||
@@ -125,6 +131,7 @@ if [ ! -f $SYSTEMTAP_HOST_INSTALLDIR/usr/bin/stap ]; then
     echo -e "\nError: Native (host) systemtap not found."
     echo -e "Did you accidentally build a local non-sdk image? (or forget to"
     echo -e "add 'tools-profile' to EXTRA_IMAGE_FEATURES in your local.conf)?"
+    echo -e "You can also: bitbake -c addto_recipe_sysroot systemtap-native"
     setup_usage
     exit 1
 fi
-- 
2.7.4


