Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A68FC6FA82
	for <webhook@archiver.kernel.org>; Thu, 22 Sep 2022 12:47:26 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web09.6682.1663850836788760181
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Sep 2022 05:47:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=fcUHkUuS;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1663850837;
  x=1695386837;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=uSwxU77Lay4aNxxeVQfIOC/+ODX8fddY5EmOD5ai7+s=;
  b=fcUHkUuSbY5obxBkl2IlOs5A2JVgGGrnYYXdo1MBDyN7HLIl4DgpRnL7
   pOAzae5DLYfYCp62YhVn97YpSLexbjfJeJECfow4dCmJrf0T4YmTJOUIp
   L/USyd+8euVb6kFglhco7KTnUud1vaUdlPrY+1EclKSTUgKMdsYRKT8s/
   IrCYWK/JPQSJ455ozpbAGFDibsx1QpY0HZII0Qbic819sAkOFSA6s6JPk
   SIWscm+E7jdzbEQfcbiIHN6nhnTNHU77d4BN7zINqq9MVDwjR+XTHEquZ
   d4JKKKiCSsgCsZ5wBdn1ee3etM1DFM7A9s67b/e1HXQ5WAYi/soIyvRew
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] oe-setup-builddir: Do not hardcode invalid paths for
 templates
Date: Thu, 22 Sep 2022 14:47:08 +0200
Message-ID: <20220922124708.2218995-2-pkj@axis.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922124708.2218995-1-pkj@axis.com>
References: <20220922124708.2218995-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Sep 2022 12:47:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170977

Previously, the paths "meta/conf" and "meta-poky/conf" were hardcoded
as invalid paths for templates. However, this is suboptimal for other
distros that are setup similarly to Poky. Instead, add support for a
new variable INVALID_TEMPLATECONFS, which takes a list of invalid
paths.  It is expected that this variable is set in the .templateconf
file together with the default value for TEMPLATECONF, typically at
the same time that TEMPLATECONF is updated to match the new
requirements.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/oe-setup-builddir | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 225919be92..c1148daf4f 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -34,14 +34,19 @@ chmod -st "$BUILDDIR/conf" 2>/dev/null || echo "WARNING: unable to chmod $BUILDD
 
 cd "$BUILDDIR" || die "Failed to change directory to $BUILDDIR!"
 
-if [ -z "$TEMPLATECONF" ] && [ -f "$BUILDDIR/conf/templateconf.cfg" ]; then
-    TEMPLATECONF=$(cat "$BUILDDIR/conf/templateconf.cfg")
-    # The following two are no longer valid; unsetting them will automatically get them replaced
-    # with correct ones.
-    if [ "$TEMPLATECONF" = meta/conf ] || [ "$TEMPLATECONF" = meta-poky/conf ]; then
-        unset TEMPLATECONF
-        rm "$BUILDDIR/conf/templateconf.cfg"
-    fi
+TEMPLATECONF_CFG="$BUILDDIR/conf/templateconf.cfg"
+if [ -z "$TEMPLATECONF" ] && [ -f "$TEMPLATECONF_CFG" ]; then
+    TEMPLATECONF=$(cat "$TEMPLATECONF_CFG")
+    # Unset TEMPLATECONF if it is set to a known invalid value to have it
+    # automatically replaced with a correct one.
+    for dir in $INVALID_TEMPLATECONFS; do
+        if [ "$TEMPLATECONF" = "$dir" ]; then
+           echo "WARNING: Removing $TEMPLATECONF_CFG as it contained the invalid value '$TEMPLATECONF'"
+           unset TEMPLATECONF
+           rm "$TEMPLATECONF_CFG"
+	   break;
+        fi
+    done
 fi
 
 . "$OEROOT/.templateconf"

