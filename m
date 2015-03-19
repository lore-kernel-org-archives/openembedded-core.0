Return-Path: <benjamin.esquivel@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 56D6B6AC3E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2015 17:55:08 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 19 Mar 2015 10:55:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,431,1422950400"; d="scan'208";a="543349858"
Received: from yctb05.ostc.intel.com (HELO yctb05.otcr.jf.intel.com)
	([10.23.219.54])
	by orsmga003.jf.intel.com with ESMTP; 19 Mar 2015 10:55:09 -0700
From: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Mar 2015 09:48:16 +0000
Message-Id: <1426758496-32643-1-git-send-email-benjamin.esquivel@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Cc: richard.purdie@liuxfoundation.org
Subject: [PATCH] oe-init-build-env-memres: Fix source check
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
X-List-Received-Date: Thu, 19 Mar 2015 17:55:08 -0000

The source check was referring to oe-init-build-env instead of the
memres. It could be executed without the proper failure message and the
corresponding exit command out of the script. This commit makes the
memres script look more like the oe-init-build-env with the correct
script name.

[YOCTO #7487]

Signed-off-by: Benjamin Esquivel <benjamin.esquivel@linux.intel.com>
---
 oe-init-build-env-memres | 45 +++++++++++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/oe-init-build-env-memres b/oe-init-build-env-memres
index 9b9e0f4..c1dc4fe 100755
--- a/oe-init-build-env-memres
+++ b/oe-init-build-env-memres
@@ -32,28 +32,33 @@ else
     port=$1
     shift
 fi
-if [ -z "$ZSH_NAME" ] && [ "x$0" = "x./oe-init-build-env" ]; then
-   echo "Error: This script needs to be sourced. Please run as '. ./oe-init-build-env'"
+
+if [ -n "$BASH_SOURCE" ]; then
+  OEROOT="`dirname $BASH_SOURCE`"
+elif [ -n "$ZSH_NAME" ]; then
+  OEROOT="`dirname $0`"
 else
-   if [ -n "$BASH_SOURCE" ]; then
-      OEROOT="`dirname $BASH_SOURCE`"
-   elif [ -n "$ZSH_NAME" ]; then
-      OEROOT="`dirname $0`"
-   else
-      OEROOT="`pwd`"
-   fi
-   if [ -n "$BBSERVER" ]; then
-      unset BBSERVER
-   fi
-            
-   OEROOT=`readlink -f "$OEROOT"`
-   export OEROOT
-   . $OEROOT/scripts/oe-buildenv-internal && \
-        $OEROOT/scripts/oe-setup-builddir && \
-        [ -n "$BUILDDIR" ] && cd $BUILDDIR
-   unset OEROOT
-   unset BBPATH
+  OEROOT="`pwd`"
+fi
+if [ -n "$BBSERVER" ]; then
+  unset BBSERVER
+fi
+
+THIS_SCRIPT=$OEROOT/oe-init-build-env-memres
+if [ -z "$ZSH_NAME" ] && [ "x$0" = "x$THIS_SCRIPT" ]; then
+   echo "Error: This script needs to be sourced. Please run as '. $THIS_SCRIPT'"
+   exit 1
 fi
+
+OEROOT=`readlink -f "$OEROOT"`
+export OEROOT
+. $OEROOT/scripts/oe-buildenv-internal && \
+    $OEROOT/scripts/oe-setup-builddir && \
+    [ -n "$BUILDDIR" ] && cd $BUILDDIR
+unset OEROOT
+unset BBPATH
+unset THIS_SCRIPT
+
 res=1
 if [ -e bitbake.lock ] && grep : bitbake.lock > /dev/null ; then
     BBSERVER=`cat bitbake.lock` bitbake --status-only
-- 
1.8.4.5


