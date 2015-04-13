Return-Path: <joshua.lock@collabora.co.uk>
X-Greylist: delayed 356 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 13 Apr 2015 15:36:30 UTC
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 0A45C73D3A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 15:36:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 1F5796004F2
From: Joshua Lock <joshua.lock@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Apr 2015 16:30:02 +0100
Message-Id: <1428939002-21170-1-git-send-email-joshua.lock@collabora.co.uk>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] oe-init-build-env: fix for build dirs that have spaces in their path
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
X-List-Received-Date: Mon, 13 Apr 2015 15:36:31 -0000

Enclose expansions of BUILDDIR in quotes in order to correctly handle paths
which include spaces.

Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
---
 oe-init-build-env         |  2 +-
 scripts/oe-setup-builddir | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/oe-init-build-env b/oe-init-build-env
index 5249513..6fee5f7 100755
--- a/oe-init-build-env
+++ b/oe-init-build-env
@@ -46,7 +46,7 @@ OEROOT=`readlink -f "$OEROOT"`
 export OEROOT
 . $OEROOT/scripts/oe-buildenv-internal && \
      $OEROOT/scripts/oe-setup-builddir && \
-     [ -n "$BUILDDIR" ] && cd $BUILDDIR
+     [ -n "$BUILDDIR" ] && cd "$BUILDDIR"
 unset OEROOT
 unset BBPATH
 unset THIS_SCRIPT
diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index f73aa34..add0b50 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -23,7 +23,7 @@ if [ -z "$BUILDDIR" ]; then
     exit 1
 fi
 
-mkdir -p $BUILDDIR/conf
+mkdir -p "$BUILDDIR/conf"
 
 if [ ! -d "$BUILDDIR" ]; then
     echo >&2 "Error: The builddir ($BUILDDIR) does not exist!"
@@ -38,13 +38,13 @@ fi
 cd "$BUILDDIR"
 
 if [ -f "$BUILDDIR/conf/templateconf.cfg" ]; then
-    TEMPLATECONF=$(cat $BUILDDIR/conf/templateconf.cfg)
+    TEMPLATECONF=$(cat "$BUILDDIR/conf/templateconf.cfg")
 fi
 
 . $OEROOT/.templateconf
 
 if [ ! -f "$BUILDDIR/conf/templateconf.cfg" ]; then
-    echo "$TEMPLATECONF" >$BUILDDIR/conf/templateconf.cfg
+    echo "$TEMPLATECONF" >"$BUILDDIR/conf/templateconf.cfg"
 fi
 
 # 
@@ -79,7 +79,7 @@ advantage of multiple cores for example. See the file for more information as
 common configuration options are commented.
 
 EOM
-    cp -f $OECORELOCALCONF $BUILDDIR/conf/local.conf
+    cp -f $OECORELOCALCONF "$BUILDDIR/conf/local.conf"
     SHOWYPDOC=yes
 fi
 
@@ -100,7 +100,7 @@ EOM
     # to replace it for compatibility.
     sed -e "s|##OEROOT##|$OEROOT|g" \
         -e "s|##COREBASE##|$OEROOT|g" \
-        $OECORELAYERCONF > $BUILDDIR/conf/bblayers.conf
+        $OECORELAYERCONF > "$BUILDDIR/conf/bblayers.conf"
     SHOWYPDOC=yes
 fi
 
-- 
2.1.0


