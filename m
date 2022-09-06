Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23032C6FA83
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 14:59:08 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.131.1662476339152728964
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 07:58:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=bDfHHC9f;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1662476339;
  x=1694012339;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7udof6kn7zQFf+JhHXXkRSUFXzQ06PnYrNnQY+nFPwo=;
  b=bDfHHC9fgup4nvAJgvgjicbMAI+fm7XIsjXjaZQKOoOJDFmXj5WMWuX/
   xTftVZtwil9MQBcqXlwhGFFXJvIXiTHjenC3t6tb+c5l3BysJZlbxu3LG
   AVBauLxm4K7cQpb6+t32ucd3cwUPnioA83j3oF5EbFivgRZJ25NUylUMf
   5bbaKnQcrOkR0vyYMuZ2PdD2ppJvOfziGG/j0cXSFMKqwpVen07tifa/T
   EsF2q7uFx6oDmjVvgfl1m7s9mqu6qJyx7n36b9kUO3FggbcgjgRJ+x8uA
   /MwVQGW8gChfKFAvOwLAZjThfwftdFPpqjwkJGV6tDUcz0s48Oq8qD1ui
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 1/3] oe-setup-builddir: Correct when validation of the
 templates dir is run
Date: Tue, 6 Sep 2022 16:58:51 +0200
Message-ID: <20220906145853.2617826-1-pkj@axis.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Sep 2022 14:59:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170359

The validation of the templates directory is supposed to be run as long
as $TEMPLATECONF is defined, but it was only done if the directory did
not exist.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Added a commit description.

 scripts/oe-setup-builddir | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index d3c7f943e7..70f2245b16 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -63,11 +63,11 @@ if [ -n "$TEMPLATECONF" ]; then
             echo >&2 "Error: TEMPLATECONF value points to nonexistent directory '$TEMPLATECONF'"
             exit 1
         fi
-        templatesdir=$(python3 -c "import sys; print(sys.argv[1].strip('/').split('/')[-2])" $TEMPLATECONF)
-        if [ ! -f "$TEMPLATECONF/../../layer.conf" -o $templatesdir != "templates" ]; then
-            echo >&2 "Error: TEMPLATECONF value (which is $TEMPLATECONF) must point to meta-some-layer/conf/templates/template-name"
-            exit 1
-        fi
+    fi
+    templatesdir=$(python3 -c "import sys; print(sys.argv[1].strip('/').split('/')[-2])" $TEMPLATECONF)
+    if [ ! -f "$TEMPLATECONF/../../layer.conf" -o $templatesdir != "templates" ]; then
+        echo >&2 "Error: TEMPLATECONF value (which is $TEMPLATECONF) must point to meta-some-layer/conf/templates/template-name"
+        exit 1
     fi
     OECORELAYERCONF="$TEMPLATECONF/bblayers.conf.sample"
     OECORELOCALCONF="$TEMPLATECONF/local.conf.sample"

