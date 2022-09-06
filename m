Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24920ECAAA1
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 14:59:08 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.149.1662476341042297024
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 07:59:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Y/niyuxv;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1662476342;
  x=1694012342;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=GhWtpWvFm4JTc2F9U+hJoQ0Fy5MliTLVHWVsKjlUyAU=;
  b=Y/niyuxvKY7J8rPcaxwZ8fKbJNkm5LqVms/hTqWd9WATBX2Z3FYbR+1G
   N8HlKeRjo5YmXrojPZ3jjVfmsdb7QyDC7D8Ex7kLe7evMI6IBMY4TRUfD
   PM/WlVsE7zQ0BzTZMpjUNL1PHBMV8Hg5b//5yho5d+08/PU09Wf542xy+
   O73GXpFBJm5VDwvYUcJq4iY3GwJ4jv/LYM0YZasK8TFBQG75jNizHc16z
   CK3PfIWIeyWDmi7gYz+LBko4mDIkzsrWbz/LyH6hRMdOFL+jDi+rTXJyq
   +JWf2mgvjpdaXihaQhvX709eCuz0pUDtnmrkImsmaXpaXClsOTLDs0xbm
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 3/3] oe-setup-builddir: Avoid shellcheck warnings
Date: Tue, 6 Sep 2022 16:58:53 +0200
Message-ID: <20220906145853.2617826-3-pkj@axis.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220906145853.2617826-1-pkj@axis.com>
References: <20220906145853.2617826-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Sep 2022 14:59:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170361

This avoid the following warnings:

* SC2086: Double quote to prevent globbing and word splitting.
* SC2164: Use 'cd ... || exit' or 'cd ... || return' in case cd fails.
* SC2166: Prefer [ p ] || [ q ] as [ p -o q ] is not well defined.
* SC2236: Use -n instead of ! -z.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: No changes.

 scripts/oe-setup-builddir | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 69c33049c7..b06880c9cb 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -14,7 +14,7 @@ die() {
 
 [ -n "$BUILDDIR" ] || die "The build directory (BUILDDIR) must be set!"
 
-if [ "$1" = '--help' -o "$1" = '-h' ]; then
+if [ "$1" = '--help' ] || [ "$1" = '-h' ]; then
     echo 'Usage: oe-setup-builddir'
     echo ''
     echo "OpenEmbedded setup-builddir - setup build directory $BUILDDIR"
@@ -32,19 +32,19 @@ mkdir -p "$BUILDDIR/conf"
 chmod -st "$BUILDDIR" 2>/dev/null || echo "WARNING: unable to chmod $BUILDDIR"
 chmod -st "$BUILDDIR/conf" 2>/dev/null || echo "WARNING: unable to chmod $BUILDDIR/conf"
 
-cd "$BUILDDIR"
+cd "$BUILDDIR" || die "Failed to change directory to $BUILDDIR!"
 
-if [ -f "$BUILDDIR/conf/templateconf.cfg" -a -z "$TEMPLATECONF" ]; then
+if [ -z "$TEMPLATECONF" ] && [ -f "$BUILDDIR/conf/templateconf.cfg" ]; then
     TEMPLATECONF=$(cat "$BUILDDIR/conf/templateconf.cfg")
     # The following two are no longer valid; unsetting them will automatically get them replaced
     # with correct ones.
-    if [ $TEMPLATECONF = "meta/conf" -o $TEMPLATECONF = "meta-poky/conf" ]; then
+    if [ "$TEMPLATECONF" = meta/conf ] || [ "$TEMPLATECONF" = meta-poky/conf ]; then
         unset TEMPLATECONF
-        rm $BUILDDIR/conf/templateconf.cfg
+        rm "$BUILDDIR/conf/templateconf.cfg"
     fi
 fi
 
-. "$OEROOT"/.templateconf
+. "$OEROOT/.templateconf"
 
 # 
 # $TEMPLATECONF can point to a directory for the template local.conf & bblayers.conf
@@ -58,8 +58,8 @@ if [ -n "$TEMPLATECONF" ]; then
         [ -d "$TEMPLATECONF" ] ||
             die "TEMPLATECONF value points to nonexistent directory '$TEMPLATECONF'"
     fi
-    templatesdir=$(python3 -c "import sys; print(sys.argv[1].strip('/').split('/')[-2])" $TEMPLATECONF)
-    if [ ! -f "$TEMPLATECONF/../../layer.conf" -o $templatesdir != "templates" ]; then
+    templatesdir=$(python3 -c "import sys; print(sys.argv[1].strip('/').split('/')[-2])" "$TEMPLATECONF")
+    if [ "$templatesdir" != templates ] || [ ! -f "$TEMPLATECONF/../../layer.conf" ]; then
         die "TEMPLATECONF value (which is $TEMPLATECONF) must point to meta-some-layer/conf/templates/template-name"
     fi
     OECORELAYERCONF="$TEMPLATECONF/bblayers.conf.sample"
@@ -111,7 +111,7 @@ unset OECORELOCALCONF
 unset OECORELAYERCONF
 
 # Ending the first-time run message. Show the YP Documentation banner.
-if [ ! -z "$SHOWYPDOC" ]; then
+if [ -n "$SHOWYPDOC" ]; then
     cat <<EOM
 The Yocto Project has extensive documentation about OE including a reference
 manual which can be found at:

