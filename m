Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 968CEC6FA83
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 13:50:25 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.4408.1662472214868014223
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 06:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=LnttluWq;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1662472215;
  x=1694008215;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OhpaIzPiv2UWhZ9H9EGzoy8h2bHrCCmxmoyDTxUDCAI=;
  b=LnttluWqC5wgM5VMUEkee3rCjDhUmgh9SFiVMDjXlRp052XZX7uTue3n
   N0jeBBZdoQ0tx+V0qrF9zOWTuMFeFmIDARpBjUDblQ4GWs0PPacZbQHJ2
   kTJgUTVKVrsYPfIz5Lp4jE4WhdKpfK4wuAlIcqj6ruSccdS4IMfONgQP1
   qW9wmoP9+8WWEbicZWtRVHdoTCkfSND23NlG+qizBe7lZ1DucnYPtZ5s7
   lOH2oGm4aAMW4r+Gtn1gI5Mbh2n9qaqrnoDCgHM6KKhW4tdiDU5WSEe6U
   kRhCAvKrFp8qEdNYeZE6tLUWhBa/V02yfCZ1rSp3Uw5tvQ6jnbV7SKx17
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/3] oe-setup-builddir: Correct when validation of the
 templates dir is run
Date: Tue, 6 Sep 2022 15:50:08 +0200
Message-ID: <20220906135010.2610775-1-pkj@axis.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Sep 2022 13:50:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170354

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
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

