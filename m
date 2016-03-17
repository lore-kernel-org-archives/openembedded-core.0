Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id A798873166
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 11:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 8BFA82E232
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:17 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id DrOWtlxVMuD7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:16 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id D3F262E231
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:16 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id BDE2A140D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:16 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id B333A140B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:16 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id B1A8E10D1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:16 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u2HBEGXb026157
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 12:14:16 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u2HBEGs5026156
	for openembedded-core@lists.openembedded.org;
	Thu, 17 Mar 2016 12:14:16 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 12:14:08 +0100
Message-Id: <df49ca92506871be740de46b4d248ef92f3669f9.1458213205.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1458213205.git.pkj@axis.com>
References: <cover.1458213205.git.pkj@axis.com>
In-Reply-To: <cover.1458213205.git.pkj@axis.com>
References: <cover.1458213205.git.pkj@axis.com>
Subject: [PATCHv2 1/7] oe-init-build-env*: Allow $OEROOT to be predefined
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
X-List-Received-Date: Thu, 17 Mar 2016 11:14:18 -0000

The current implementation of oe-init-build-env and
oe-init-build-env-memres requires that they are sourced from the
directory that will be known as $OEROOT. This makes it hard to write a
wrapper script with the same name as the original OE script which,
e.g., sources the original OE script from a sub-directory.

With this change, $OEROOT can be predefined when oe-init-build-env or
oe-init-build-env-memres is sourced, allowing the original OE scripts
to be anywhere.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 oe-init-build-env        | 16 +++++++++-------
 oe-init-build-env-memres | 16 +++++++++-------
 2 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/oe-init-build-env b/oe-init-build-env
index b7e2918..7b922b3 100755
--- a/oe-init-build-env
+++ b/oe-init-build-env
@@ -26,30 +26,32 @@
 # to sourcing this script.
 #
 if [ -n "$BASH_SOURCE" ]; then
-   OEROOT="`dirname $BASH_SOURCE`"
+    THIS_SCRIPT=$BASH_SOURCE
 elif [ -n "$ZSH_NAME" ]; then
-   OEROOT="`dirname $0`"
+    THIS_SCRIPT=$0
 else
-   OEROOT="`pwd`"
+    THIS_SCRIPT="$(pwd)/oe-init-build-env"
 fi
 if [ -n "$BBSERVER" ]; then
    unset BBSERVER
 fi
-THIS_SCRIPT=$OEROOT/oe-init-build-env
 
 if [ -z "$ZSH_NAME" ] && [ "$0" = "$THIS_SCRIPT" ]; then
    echo "Error: This script needs to be sourced. Please run as '. $THIS_SCRIPT'"
    exit 1
 fi
 
-OEROOT=`readlink -f "$OEROOT"`
+if [ -z "$OEROOT" ]; then
+    OEROOT=$(dirname "$THIS_SCRIPT")
+    OEROOT=$(readlink -f "$OEROOT")
+fi
+unset THIS_SCRIPT
+
 export OEROOT
 . $OEROOT/scripts/oe-buildenv-internal && \
      TEMPLATECONF="$TEMPLATECONF" $OEROOT/scripts/oe-setup-builddir && \
      [ -n "$BUILDDIR" ] && cd "$BUILDDIR"
 unset OEROOT
-unset BBPATH
-unset THIS_SCRIPT
 
 # Shutdown any bitbake server if the BBSERVER variable is not set
 if [ -z "$BBSERVER" ] && [ -f bitbake.lock ] ; then
diff --git a/oe-init-build-env-memres b/oe-init-build-env-memres
index c1dc4fe..092d4fe 100755
--- a/oe-init-build-env-memres
+++ b/oe-init-build-env-memres
@@ -34,30 +34,32 @@ else
 fi
 
 if [ -n "$BASH_SOURCE" ]; then
-  OEROOT="`dirname $BASH_SOURCE`"
+    THIS_SCRIPT=$BASH_SOURCE
 elif [ -n "$ZSH_NAME" ]; then
-  OEROOT="`dirname $0`"
+    THIS_SCRIPT=$0
 else
-  OEROOT="`pwd`"
+    THIS_SCRIPT="$(pwd)/oe-init-build-env"
 fi
 if [ -n "$BBSERVER" ]; then
   unset BBSERVER
 fi
 
-THIS_SCRIPT=$OEROOT/oe-init-build-env-memres
 if [ -z "$ZSH_NAME" ] && [ "x$0" = "x$THIS_SCRIPT" ]; then
    echo "Error: This script needs to be sourced. Please run as '. $THIS_SCRIPT'"
    exit 1
 fi
 
-OEROOT=`readlink -f "$OEROOT"`
+if [ -z "$OEROOT" ]; then
+    OEROOT=$(dirname "$THIS_SCRIPT")
+    OEROOT=$(readlink -f "$OEROOT")
+fi
+unset THIS_SCRIPT
+
 export OEROOT
 . $OEROOT/scripts/oe-buildenv-internal && \
     $OEROOT/scripts/oe-setup-builddir && \
     [ -n "$BUILDDIR" ] && cd $BUILDDIR
 unset OEROOT
-unset BBPATH
-unset THIS_SCRIPT
 
 res=1
 if [ -e bitbake.lock ] && grep : bitbake.lock > /dev/null ; then
-- 
2.1.0


