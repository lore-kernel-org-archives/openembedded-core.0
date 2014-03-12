Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 2C4EE6F76A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Mar 2014 09:22:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,636,1389740400"; d="scan'208";a="42544544"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 12 Mar 2014 10:22:39 +0100
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	(TLS) id 14.2.318.1; Wed, 12 Mar 2014 10:22:39 +0100
Received: from u85.usr.ingenico.loc (10.23.7.85) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Wed, 12 Mar 2014 10:22:39 +0100
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Mar 2014 10:15:26 +0100
Message-ID: <1394615726-32367-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.8.5.4
In-Reply-To: <1394581224-4752-1-git-send-email-sgw@linux.intel.com>
References: <1394581224-4752-1-git-send-email-sgw@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH] oe-setup-builddir: small rework
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
X-List-Received-Date: Wed, 12 Mar 2014 09:22:55 -0000
Content-Type: text/plain

Changes:
- drop useless subshell creation in test:
if ! (test -r "$BUILDDIR/conf/local.conf"); then$
- replace "source" builtin by "." (bashsism)
- fix indentation 4 spaces (drop some tabs too)
- fix return => exit  (return is not allowed in main)
- drop "sed -i" (doesn't exist in BSD sed)
- for homogeneity, always use [ ] (instead of test)
- replace old [ "x" = "x$VAR" ] by [ -z "$VAR" ]

Signed-off-by: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
---
 scripts/oe-setup-builddir | 47 ++++++++++++++++++++++++-----------------------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index e4356f1..c91e079 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -25,51 +25,51 @@ fi
 
 mkdir -p $BUILDDIR/conf
 
-if ! (test -d "$BUILDDIR"); then
+if [ ! -d "$BUILDDIR" ]; then
     echo >&2 "Error: The builddir ($BUILDDIR) does not exist!"
     exit 1
 fi
 
-if ! (test -w "$BUILDDIR"); then
+if [ ! -w "$BUILDDIR" ]; then
     echo >&2 "Error: Cannot write to $BUILDDIR, perhaps try sourcing with a writable path? i.e. . oe-init-build-env ~/my-build"
     exit 1
 fi
 
 cd "$BUILDDIR"
 
-if (test -f "$BUILDDIR/conf/templateconf.cfg") then
+if [ -f "$BUILDDIR/conf/templateconf.cfg" ]; then
     TEMPLATECONF=$(cat $BUILDDIR/conf/templateconf.cfg)
 fi
 
-source $OEROOT/.templateconf
+. $OEROOT/.templateconf
 
-if ! (test -f "$BUILDDIR/conf/templateconf.cfg") then
+if [ ! -f "$BUILDDIR/conf/templateconf.cfg" ]; then
     echo "$TEMPLATECONF" >$BUILDDIR/conf/templateconf.cfg
 fi
 
 # 
 # $TEMPLATECONF can point to a directory for the template local.conf & bblayers.conf
 #
-if [ "x" != "x$TEMPLATECONF" ]; then
-    if ! (test -d "$TEMPLATECONF"); then
-	# Allow TEMPLATECONF=meta-xyz/conf as a shortcut
-	if [ -d "$OEROOT/$TEMPLATECONF" ]; then
-	    TEMPLATECONF="$OEROOT/$TEMPLATECONF"
-	fi
-	if ! (test -d "$TEMPLATECONF"); then
-	    echo >&2 "Error: '$TEMPLATECONF' must be a directory containing local.conf & bblayers.conf"
-	    return
-	fi
+if [ -n "$TEMPLATECONF" ]; then
+    if [ ! -d "$TEMPLATECONF" ]; then
+        # Allow TEMPLATECONF=meta-xyz/conf as a shortcut
+        if [ -d "$OEROOT/$TEMPLATECONF" ]; then
+            TEMPLATECONF="$OEROOT/$TEMPLATECONF"
+        fi
+        if [ ! -d "$TEMPLATECONF" ]; then
+            echo >&2 "Error: '$TEMPLATECONF' must be a directory containing local.conf & bblayers.conf"
+            exit 1
+        fi
     fi
     OECORELAYERCONF="$TEMPLATECONF/bblayers.conf.sample"
     OECORELOCALCONF="$TEMPLATECONF/local.conf.sample"
     OECORENOTESCONF="$TEMPLATECONF/conf-notes.txt"
 fi
 
-if [ "x" = "x$OECORELOCALCONF" ]; then
+if [ -z "$OECORELOCALCONF" ]; then
     OECORELOCALCONF="$OEROOT/meta/conf/local.conf.sample"
 fi
-if ! (test -r "$BUILDDIR/conf/local.conf"); then
+if [ ! -r "$BUILDDIR/conf/local.conf" ]; then
 cat <<EOM
 You had no conf/local.conf file. This configuration file has therefore been
 created for you with some default values. You may wish to edit it to use a 
@@ -88,11 +88,11 @@ EOM
     cp -f $OECORELOCALCONF $BUILDDIR/conf/local.conf
 fi
 
-if [ "x" = "x$OECORELAYERCONF" ]; then
+if [ -z "$OECORELAYERCONF" ]; then
     OECORELAYERCONF="$OEROOT/meta/conf/bblayers.conf.sample"
 fi
-if ! (test -r "$BUILDDIR/conf/bblayers.conf"); then
-cat <<EOM
+if [ ! -r "$BUILDDIR/conf/bblayers.conf" ]; then
+    cat <<EOM
 You had no conf/bblayers.conf file. The configuration file has been created for
 you with some default values. To add additional metadata layers into your
 configuration please add entries to this file.
@@ -109,10 +109,11 @@ EOM
 
     # Put the abosolute path to the layers in bblayers.conf so we can run
     # bitbake without the init script after the first run
-    sed "s|##OEROOT##|$OEROOT|g" $OECORELAYERCONF > $BUILDDIR/conf/bblayers.conf
     # ##COREBASE## is deprecated as it's meaning was inconsistent, but continue
     # to replace it for compatibility.
-    sed -i -e "s|##COREBASE##|$OEROOT|g" $BUILDDIR/conf/bblayers.conf
+    sed -e "s|##OEROOT##|$OEROOT|g" \
+        -e "s|##COREBASE##|$OEROOT|g" \
+        $OECORELAYERCONF > $BUILDDIR/conf/bblayers.conf
 fi
 
 # Prevent disturbing a new GIT clone in same console
@@ -126,7 +127,7 @@ cat <<EOM
 You can now run 'bitbake <target>'
 
 EOM
-if [ "x" = "x$OECORENOTESCONF" ]; then
+if [ -z "$OECORENOTESCONF" ]; then
     OECORENOTESCONF="$OEROOT/meta/conf/conf-notes.txt"
 fi
 [ ! -r "$OECORENOTESCONF" ] || cat $OECORENOTESCONF
-- 
1.8.5.4


