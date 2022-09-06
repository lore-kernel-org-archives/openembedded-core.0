Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC1AC6FA89
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 13:50:25 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.4408.1662472214868014223
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 06:50:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=ibpuY2P7;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1662472216;
  x=1694008216;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=jL6xy7VLbRraMTZTI0NjYggXMGgwnAOgjEncbHCbJO8=;
  b=ibpuY2P7di3MsJwGHhP5t55prruaqMGbNUsPtoPGrLQuPeJn58N9hKnX
   3SJRzWb2706gvaQZg2nn/qQSbkvrbD+P1yba7nFD3XsxQgZdKkMHSOmXj
   fx+NVtEw3qiLNqhZRsriTynFQLScFFTcGJ5HhelkGpfldp3+shORADA4O
   NGDEYOPd6sSK+hrxJpwPDmAGBle/27lkUbtR+QVh+NoGQrGYCOv+/vQnI
   L3omonYMrZ4ANSFTKSgn6tZIpJHGZ4Cz1CutROB1Sr1fiPJx1Mq6JNFTu
   MgLG29cgOQjj2Irq1oNh0R80ppknTdrOvCZv6SEctqRoTHj1CVTn/FPoA
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/3] oe-setup-builddir: Simplify error handling
Date: Tue, 6 Sep 2022 15:50:09 +0200
Message-ID: <20220906135010.2610775-2-pkj@axis.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220906135010.2610775-1-pkj@axis.com>
References: <20220906135010.2610775-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Sep 2022 13:50:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170355

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
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

