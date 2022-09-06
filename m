Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94DF6ECAAD5
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 16:43:48 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.1522.1662482620312008177
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 09:43:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=hasztKHZ;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1662482621;
  x=1694018621;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=1vfXyR2msyW3SWQGgliT+F09jhZ0GgKVjXSZBotCFFY=;
  b=hasztKHZklO25DU9d3gSJER5wBxbTxp98fCGRZAd2SWYeJy8HFxGqSf0
   QEoFPmTuOQP7kHuownoTKXHFE75g3Z/L/lMncGk2F8OarKJJUVupxpYdI
   mLO/odg3Dhi/Gvk4rWpy4r5DmQ5P5WCG2DNzhaBxWQ+Q1jVH/7seh6Orl
   lOAYnHF8SiRfK8g9GiBBohfSbzC3khqiJd7f5ezuECnpmBOf/eshKWwUW
   FseteB1oILoGBkpqzQeZGEXrR+yMhd2Jq5l/68WAF74cTB8L4IfLTHK0g
   KJjgrwdFJIHT6trn/xkbdXsSczO1d0aRiiGqFZFoSmJj90gUH5S9bJFA9
   g==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] oe-setup-builddir: Keep templateconf.cfg relative if
 $TEMPLATECONF is
Date: Tue, 6 Sep 2022 18:43:34 +0200
Message-ID: <20220906164335.2629721-1-pkj@axis.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Sep 2022 16:43:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170363

Before commit 7b96dc80 (scripts/oe-setup-builddir: write to
conf/templateconf.cfg after the build is set up), the path written to
templateconf.cfg was relative if $TEMPLATECONF was relative, but
afterwards it became absolute.

Restore the original behavior of saving the relative path to
templateconf.cfg.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

These two patches are intended to be applied on top of the three I
sent earlier today.

And in case anyone wonders, yes, I occasionally move entire build
trees (typically from my SSD to my HDD) so I would prefer the path in
templateconf.cfg to remain relative.

 scripts/oe-setup-builddir | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index b06880c9cb..201cea30bf 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -46,7 +46,10 @@ fi
 
 . "$OEROOT/.templateconf"
 
-# 
+# Keep the original TEMPLATECONF before possibly prefixing it with $OEROOT below.
+ORG_TEMPLATECONF=$TEMPLATECONF
+
+#
 # $TEMPLATECONF can point to a directory for the template local.conf & bblayers.conf
 #
 if [ -n "$TEMPLATECONF" ]; then
@@ -131,5 +134,5 @@ fi
 unset OECORENOTESCONF
 
 if [ ! -f "$BUILDDIR/conf/templateconf.cfg" ]; then
-    echo "$TEMPLATECONF" >"$BUILDDIR/conf/templateconf.cfg"
+    echo "$ORG_TEMPLATECONF" >"$BUILDDIR/conf/templateconf.cfg"
 fi

