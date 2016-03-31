Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A037873173
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 08:53:52 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 31 Mar 2016 01:53:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,421,1455004800"; d="scan'208";a="945099295"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.133.74])
	by orsmga002.jf.intel.com with ESMTP; 31 Mar 2016 01:53:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Mar 2016 21:53:33 +1300
Message-Id: <d6f0b022bb6b80e0d0e2a0bb5a3a3756f987a047.1459414389.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1459414389.git.paul.eggleton@linux.intel.com>
References: <cover.1459414389.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1459414389.git.paul.eggleton@linux.intel.com>
References: <cover.1459414389.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/5] oe-publish-sdk: exclude sstate-cache if publishing minimal SDK
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
X-List-Received-Date: Thu, 31 Mar 2016 08:53:52 -0000

If SDK_EXT_TYPE is set to "minimal" then the SDK won't contain many
sstate artifacts, and you're required to set up an sstate mirror in this
case anyway so there's no point publishing the "stub" sstate-cache
directory from within the SDK since it won't be useful for update
purposes and may be confused with the real sstate-cache.

There is however a possibility that people might publish the real
sstate-cache directory under the same output directory provided to
oe-publish-sdk, thus deleting it after extracting (as we were doing with
other files we wanted to clean up at the end) would be problematic,
besides which extracting it and then deleting it is wasteful. Thus,
introduce a "-p" command line option to the SDK installer that we can
use to tell tar not to extract the items we don't want when publishing.
This has the added benefit of mostly keeping references to these in the
place they belong i.e. in populate_sdk_ext.bbclass.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass |  6 ++++++
 meta/files/toolchain-shar-extract.sh  | 11 +++++++++--
 scripts/oe-publish-sdk                |  8 +++-----
 3 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 5e2ebd7..2bbd181 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -365,6 +365,12 @@ sdk_ext_preinst() {
 		exit 1
 	fi
 	SDK_EXTENSIBLE="1"
+	if [ "$publish" = "1" ] ; then
+		EXTRA_TAR_OPTIONS="$EXTRA_TAR_OPTIONS --exclude=ext-sdk-prepare.py"
+		if [ "${SDK_EXT_TYPE}" = "minimal" ] ; then
+			EXTRA_TAR_OPTIONS="$EXTRA_TAR_OPTIONS --exclude=sstate-cache"
+		fi
+	fi
 }
 SDK_PRE_INSTALL_COMMAND_task-populate-sdk-ext = "${sdk_ext_preinst}"
 
diff --git a/meta/files/toolchain-shar-extract.sh b/meta/files/toolchain-shar-extract.sh
index 0295bde..23a86dd 100644
--- a/meta/files/toolchain-shar-extract.sh
+++ b/meta/files/toolchain-shar-extract.sh
@@ -38,12 +38,14 @@ fi
 
 DEFAULT_INSTALL_DIR="@SDKPATH@"
 SUDO_EXEC=""
+EXTRA_TAR_OPTIONS=""
 target_sdk_dir=""
 answer=""
 relocate=1
 savescripts=0
 verbose=0
-while getopts ":yd:nDRS" OPT; do
+publish=0
+while getopts ":yd:npDRS" OPT; do
 	case $OPT in
 	y)
 		answer="Y"
@@ -54,6 +56,10 @@ while getopts ":yd:nDRS" OPT; do
 	n)
 		prepare_buildsystem="no"
 		;;
+	p)
+		prepare_buildsystem="no"
+		publish=1
+		;;
 	D)
 		verbose=1
 		;;
@@ -70,6 +76,7 @@ while getopts ":yd:nDRS" OPT; do
 		echo "  -d <dir>   Install the SDK to <dir>"
 		echo "======== Extensible SDK only options ============"
 		echo "  -n         Do not prepare the build system"
+		echo "  -p         Publish mode (implies -n)"
 		echo "======== Advanced DEBUGGING ONLY OPTIONS ========"
 		echo "  -S         Save relocation scripts"
 		echo "  -R         Do not relocate executables"
@@ -181,7 +188,7 @@ fi
 payload_offset=$(($(grep -na -m1 "^MARKER:$" $0|cut -d':' -f1) + 1))
 
 printf "Extracting SDK..."
-tail -n +$payload_offset $0| $SUDO_EXEC tar xJ -C $target_sdk_dir --checkpoint=.2500 || exit 1
+tail -n +$payload_offset $0| $SUDO_EXEC tar xJ -C $target_sdk_dir --checkpoint=.2500 $EXTRA_TAR_OPTIONS || exit 1
 echo "done"
 
 printf "Setting it up..."
diff --git a/scripts/oe-publish-sdk b/scripts/oe-publish-sdk
index cd912df..71bc972 100755
--- a/scripts/oe-publish-sdk
+++ b/scripts/oe-publish-sdk
@@ -94,19 +94,17 @@ def publish(args):
 
     # Unpack the SDK
     logger.info("Unpacking SDK")
-    cleanupfiles = [dest_sdk, os.path.join(destdir, 'ext-sdk-prepare.py')]
     if not is_remote:
-        cmd = "sh %s -n -y -d %s" % (dest_sdk, destination)
+        cmd = "sh %s -p -y -d %s" % (dest_sdk, destination)
         ret = subprocess.call(cmd, shell=True)
         if ret == 0:
             logger.info('Successfully unpacked %s to %s' % (dest_sdk, destination))
-            for cleanupfile in cleanupfiles:
-                os.remove(cleanupfile)
+            os.remove(dest_sdk)
         else:
             logger.error('Failed to unpack %s to %s' % (dest_sdk, destination))
             return ret
     else:
-        cmd = "ssh %s 'sh %s -n -y -d %s && rm -f %s'" % (host, dest_sdk, destdir, ' '.join(cleanupfiles))
+        cmd = "ssh %s 'sh %s -p -y -d %s && rm -f %s'" % (host, dest_sdk, destdir, dest_sdk)
         ret = subprocess.call(cmd, shell=True)
         if ret == 0:
             logger.info('Successfully unpacked %s to %s' % (dest_sdk, destdir))
-- 
2.5.5


