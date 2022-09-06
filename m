Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22FE2ECAAD5
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 14:59:08 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.131.1662476339152728964
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 07:59:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=FKEGgJn6;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1662476340;
  x=1694012340;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=pANOZBUY4jdudjTbx1JEoIYnceuYfuZFyu3bdS31QBM=;
  b=FKEGgJn6m36sFxSjjB0O+HYxvGC3af2Ao4pslPXkDtddySlpQWW7+PqK
   ugfH2XA4kMyTvXaxVp6uESWAYrG8Y0Pzl5UPH0pExjYcFPgZMALhtS0rG
   GzGgpkHEwxdUSGaU+U1G+0imq6BN9Xgp1i16ik1PhLj3R5583jzYQ9QpQ
   GcOeydRpXHvsFOSQvYFbcpv3Vs0L2u/N3eL9iCcup6PreZfBH4A/SDGLS
   Zgk+9nzHGr2OGoxYMESEkWxHi8yQGyciPhX8sJYqZbZtj1YN50Gmy5w5b
   LUNjky6R2vQwLZwEdkYv3U9gryao2xT2qiAp9fkoRedVAPXUFhPW4Illa
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 2/3] oe-setup-builddir: Simplify error handling
Date: Tue, 6 Sep 2022 16:58:52 +0200
Message-ID: <20220906145853.2617826-2-pkj@axis.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/170360

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: No changes.

 scripts/oe-setup-builddir | 29 +++++++++++------------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 70f2245b16..69c33049c7 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -7,10 +7,12 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 #
 
-if [ -z "$BUILDDIR" ]; then
-    echo >&2 "Error: The build directory (BUILDDIR) must be set!"
+die() {
+    echo Error: "$@" >&2
     exit 1
-fi
+}
+
+[ -n "$BUILDDIR" ] || die "The build directory (BUILDDIR) must be set!"
 
 if [ "$1" = '--help' -o "$1" = '-h' ]; then
     echo 'Usage: oe-setup-builddir'
@@ -22,15 +24,9 @@ fi
 
 mkdir -p "$BUILDDIR/conf"
 
-if [ ! -d "$BUILDDIR" ]; then
-    echo >&2 "Error: The builddir ($BUILDDIR) does not exist!"
-    exit 1
-fi
-
-if [ ! -w "$BUILDDIR" ]; then
-    echo >&2 "Error: Cannot write to $BUILDDIR, perhaps try sourcing with a writable path? i.e. . oe-init-build-env ~/my-build"
-    exit 1
-fi
+[ -d "$BUILDDIR" ] || die "The build directory ($BUILDDIR) does not exist!"
+[ -w "$BUILDDIR" ] ||
+    die "Cannot write to $BUILDDIR, perhaps try sourcing with a writable path? i.e. . oe-init-build-env ~/my-build"
 
 # Attempting removal of sticky,setuid bits from BUILDDIR, BUILDDIR/conf
 chmod -st "$BUILDDIR" 2>/dev/null || echo "WARNING: unable to chmod $BUILDDIR"
@@ -59,15 +55,12 @@ if [ -n "$TEMPLATECONF" ]; then
         if [ -d "$OEROOT/$TEMPLATECONF" ]; then
             TEMPLATECONF="$OEROOT/$TEMPLATECONF"
         fi
-        if [ ! -d "$TEMPLATECONF" ]; then
-            echo >&2 "Error: TEMPLATECONF value points to nonexistent directory '$TEMPLATECONF'"
-            exit 1
-        fi
+        [ -d "$TEMPLATECONF" ] ||
+            die "TEMPLATECONF value points to nonexistent directory '$TEMPLATECONF'"
     fi
     templatesdir=$(python3 -c "import sys; print(sys.argv[1].strip('/').split('/')[-2])" $TEMPLATECONF)
     if [ ! -f "$TEMPLATECONF/../../layer.conf" -o $templatesdir != "templates" ]; then
-        echo >&2 "Error: TEMPLATECONF value (which is $TEMPLATECONF) must point to meta-some-layer/conf/templates/template-name"
-        exit 1
+        die "TEMPLATECONF value (which is $TEMPLATECONF) must point to meta-some-layer/conf/templates/template-name"
     fi
     OECORELAYERCONF="$TEMPLATECONF/bblayers.conf.sample"
     OECORELOCALCONF="$TEMPLATECONF/local.conf.sample"

