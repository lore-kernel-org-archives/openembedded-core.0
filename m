Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 05AF06F16E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 17:11:45 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 6298BF811F8; Mon, 24 Feb 2014 10:11:46 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from zeus.chez-thomas.org (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id A3BADF811F2;
	Mon, 24 Feb 2014 10:11:44 -0700 (MST)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Feb 2014 10:11:47 -0700
Message-Id: <1393261909-14802-2-git-send-email-gary@mlbassoc.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1393261909-14802-1-git-send-email-gary@mlbassoc.com>
References: <1393261909-14802-1-git-send-email-gary@mlbassoc.com>
Cc: Gary Thomas <gary@mlbassoc.com>
Subject: [PATCH 1/3 v2] oe-init-build-env: Improve script sourcing detection.
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
X-List-Received-Date: Mon, 24 Feb 2014 17:11:51 -0000

This script is only useful when sourced into a shell. 
These changes improve the detection of this operation,
no matter how the script is referenced.

Signed-off-by: Gary Thomas <gary@mlbassoc.com>
---
 oe-init-build-env |   42 +++++++++++++++++++++++-------------------
 1 file changed, 23 insertions(+), 19 deletions(-)

diff --git a/oe-init-build-env b/oe-init-build-env
index 8ef32f3..5249513 100755
--- a/oe-init-build-env
+++ b/oe-init-build-env
@@ -25,27 +25,31 @@
 # being sourced.   To workaround the shell limitation use "set arg1" prior 
 # to sourcing this script.
 #
-if [ -z "$ZSH_NAME" ] && [ "x$0" = "x./oe-init-build-env" ]; then
-   echo "Error: This script needs to be sourced. Please run as '. ./oe-init-build-env'"
+if [ -n "$BASH_SOURCE" ]; then
+   OEROOT="`dirname $BASH_SOURCE`"
+elif [ -n "$ZSH_NAME" ]; then
+   OEROOT="`dirname $0`"
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
-    OEROOT=`readlink -f "$OEROOT"`
-   export OEROOT
-   . $OEROOT/scripts/oe-buildenv-internal && \
-        $OEROOT/scripts/oe-setup-builddir && \
-        [ -n "$BUILDDIR" ] && cd $BUILDDIR
-   unset OEROOT
-   unset BBPATH
+   OEROOT="`pwd`"
 fi
+if [ -n "$BBSERVER" ]; then
+   unset BBSERVER
+fi
+THIS_SCRIPT=$OEROOT/oe-init-build-env
+
+if [ -z "$ZSH_NAME" ] && [ "$0" = "$THIS_SCRIPT" ]; then
+   echo "Error: This script needs to be sourced. Please run as '. $THIS_SCRIPT'"
+   exit 1
+fi
+
+OEROOT=`readlink -f "$OEROOT"`
+export OEROOT
+. $OEROOT/scripts/oe-buildenv-internal && \
+     $OEROOT/scripts/oe-setup-builddir && \
+     [ -n "$BUILDDIR" ] && cd $BUILDDIR
+unset OEROOT
+unset BBPATH
+unset THIS_SCRIPT
 
 # Shutdown any bitbake server if the BBSERVER variable is not set
 if [ -z "$BBSERVER" ] && [ -f bitbake.lock ] ; then
-- 
1.7.9.5


