Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QPNwK-0007VI-G1
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 01:56:36 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 25 May 2011 16:53:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,270,1304319600"; 
   d="scan'208";a="8864856"
Received: from unknown (HELO localhost) ([10.255.12.181])
	by fmsmga001.fm.intel.com with ESMTP; 25 May 2011 16:53:32 -0700
From: Darren Hart <darren@dvhart.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 May 2011 16:53:21 -0700
Message-Id: <221f6e6c12374764f75f4aae16086bfe25d9a477.1306367601.git.darren@dvhart.com>
X-Mailer: git-send-email 1.7.1
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: [PATCH V2] oe-setup-builddir: remove unreachable code, update comments
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
X-List-Received-Date: Wed, 25 May 2011 23:56:36 -0000

From: Darren Hart <dvhart@linux.intel.com>

The script forces TEMPLATECONF to be non-empty with:

    TEMPLATECONF=${TEMPLATECONF:-meta/conf}

This ensures that OELOCALCONF and OELAYERSCONF will be non-empty as well. Remove
all the empty checks for these variables.

While this patch doesn't change behavior, all this code was unreachable, it does
bring up a point of intent. It appears as though OE*CONF was intended to be
configurable by the user via the environment, the code only allows for the user
to set TEMPLATECONF. This means that in order to use something other than the
sample default configs, the user must specify both a local.conf.sample and a
bblayers.conf.sample in their TEMPLATECONF directory.

Update the comments to correctly identify the required files as local.conf.sample
and bblayers.conf.sample.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/oe-setup-builddir |   32 +++++++++++++-------------------
 1 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 87e7710..4298a1c 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -37,29 +37,26 @@ fi
 
 cd "$BUILDDIR"
 
-TEMPLATECONF=${TEMPLATECONF:-meta/conf}
 
 # 
-# $TEMPLATECONF can point to a directory for the template local.conf & bblayers.conf
+# $TEMPLATECONF can point to a directory for the template local.conf &
+# bblayers.conf. If the user hasn't specified a path, default to
+# meta/conf.
 #
-if [ "x" != "x$TEMPLATECONF" ]; then
+TEMPLATECONF=${TEMPLATECONF:-meta/conf}
+if ! (test -d "$TEMPLATECONF"); then
+    # Allow TEMPLATECONF=meta-xyz/conf as a shortcut
+    if [ -d "$OEROOT/$TEMPLATECONF" ]; then
+        TEMPLATECONF="$OEROOT/$TEMPLATECONF"
+    fi
     if ! (test -d "$TEMPLATECONF"); then
-	# Allow TEMPLATECONF=meta-xyz/conf as a shortcut
-	if [ -d "$OEROOT/$TEMPLATECONF" ]; then
-	    TEMPLATECONF="$OEROOT/$TEMPLATECONF"
-	fi
-	if ! (test -d "$TEMPLATECONF"); then
-	    echo >&2 "Error: '$TEMPLATECONF' must be a directory containing local.conf & bblayers.conf"
-	    return
-	fi
+        echo >&2 "Error: '$TEMPLATECONF' must be a directory containing local.conf.sample & bblayers.conf.sample"
+        return
     fi
-    OECORELAYERCONF="$TEMPLATECONF/bblayers.conf.sample"
-    OECORELOCALCONF="$TEMPLATECONF/local.conf.sample"
 fi
+OECORELAYERCONF="$TEMPLATECONF/bblayers.conf.sample"
+OECORELOCALCONF="$TEMPLATECONF/local.conf.sample"
 
-if [ "x" = "x$OECORELOCALCONF" ]; then
-    OECORELOCALCONF="$OEROOT/meta/conf/local.conf.sample"
-fi
 if ! (test -r "$BUILDDIR/conf/local.conf"); then
 cat <<EOM
 You had no conf/local.conf file. This configuration file has therefore been
@@ -79,9 +76,6 @@ EOM
     cp -f $OECORELOCALCONF $BUILDDIR/conf/local.conf
 fi
 
-if [ "x" = "x$OECORELAYERCONF" ]; then
-    OECORELAYERCONF="$OEROOT/meta/conf/bblayers.conf.sample"
-fi
 if ! (test -r "$BUILDDIR/conf/bblayers.conf"); then
 cat <<EOM
 You had no conf/bblayers.conf file. The configuration file has been created for
-- 
1.7.1



