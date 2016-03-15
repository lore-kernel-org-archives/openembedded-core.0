Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id C26BC73163
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 17:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id E057C1812E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:17 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id BRrdFLzSehGU
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:14 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id E8A251812D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:13 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id D26C11463
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:13 +0100 (CET)
Received: from seth.se.axis.com (seth.se.axis.com [10.0.2.172])
	by boulder.se.axis.com (Postfix) with ESMTP id C78D8145E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:13 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id C63A2106C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:13 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u2FHhDVI014442
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 18:43:13 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u2FHhDEx014441
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Mar 2016 18:43:13 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Mar 2016 18:43:06 +0100
Message-Id: <00ffbe7cb30c2028f343015d87102cf329d9afc0.1458063686.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1458063686.git.pkj@axis.com>
References: <cover.1458063686.git.pkj@axis.com>
In-Reply-To: <cover.1458063686.git.pkj@axis.com>
References: <cover.1458063686.git.pkj@axis.com>
Subject: [PATCH 1/6] oe-init-build-env*: Allow $OEROOT to be predefined
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
X-List-Received-Date: Tue, 15 Mar 2016 17:43:18 -0000

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
 oe-init-build-env        | 16 ++++++++--------
 oe-init-build-env-memres | 16 ++++++++--------
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/oe-init-build-env b/oe-init-build-env
index b7e2918..f511b57 100755
--- a/oe-init-build-env
+++ b/oe-init-build-env
@@ -26,30 +26,30 @@
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
 export OEROOT
 . $OEROOT/scripts/oe-buildenv-internal && \
      TEMPLATECONF="$TEMPLATECONF" $OEROOT/scripts/oe-setup-builddir && \
      [ -n "$BUILDDIR" ] && cd "$BUILDDIR"
-unset OEROOT
-unset BBPATH
-unset THIS_SCRIPT
+unset THIS_SCRIPT OEROOT BBPATH
 
 # Shutdown any bitbake server if the BBSERVER variable is not set
 if [ -z "$BBSERVER" ] && [ -f bitbake.lock ] ; then
diff --git a/oe-init-build-env-memres b/oe-init-build-env-memres
index c1dc4fe..6dd2b13 100755
--- a/oe-init-build-env-memres
+++ b/oe-init-build-env-memres
@@ -34,30 +34,30 @@ else
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
 export OEROOT
 . $OEROOT/scripts/oe-buildenv-internal && \
     $OEROOT/scripts/oe-setup-builddir && \
     [ -n "$BUILDDIR" ] && cd $BUILDDIR
-unset OEROOT
-unset BBPATH
-unset THIS_SCRIPT
+unset THIS_SCRIPT OEROOT BBPATH
 
 res=1
 if [ -e bitbake.lock ] && grep : bitbake.lock > /dev/null ; then
-- 
2.1.0


