Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95929C6FA83
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 16:43:48 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.1522.1662482620312008177
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 09:43:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=cQv24y0r;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1662482622;
  x=1694018622;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=puIL8bIxzQA7vAGh6ZGoYStPBnVEaEoXjLaq4MPGZHY=;
  b=cQv24y0rlfRkdMb5X/pGKCIMaIWQKMk2DLCIBzzRQbgQR37xpby4J3WV
   6unjRxHniLj82eCC93VevfFVaXAFxQUD0KGmyHwjC2my/2WabbTOrcPei
   lwF4sCENO5vgPbUhCNLBwvcOc8VF3kD7gUtn0/eVw2FDH/FqjAEEQzhcT
   GlzpnZsc3oasLlR117m0GeCPxs7JMi3lrd5x2nIW4qk5bVWZ4jVzYs8Yj
   clcrHy/B8AW6flBNMBp1NLCVQDTfb5pvmAMrNlmqVWfrlHJX6R0tJ7ipq
   /A7o2T70jqBrXCHcsyFmiSdS3jxY19RzQY6ypTt9a5xsnafbLYwGlFtrL
   A==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] oe-setup-builddir: Always update templateconf.cfg
Date: Tue, 6 Sep 2022 18:43:35 +0200
Message-ID: <20220906164335.2629721-2-pkj@axis.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220906164335.2629721-1-pkj@axis.com>
References: <20220906164335.2629721-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Sep 2022 16:43:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170364

The intent of the templateconf.cfg file is to cache the value of
$TEMPLATECONF. To do this, it needs to be updated in case TEMPLATECONF
is manually specified.

Before, the following commands:

  TEMPLATECONF=foo . oe-init-build-env
  TEMPLATECONF=bar . oe-init-build-env
  . oe-init-build-env

would cause the templates in foo to be used for the last source of
oe-init-build-env, while afterwards, bar is used as expected.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

Of course, re-sourcing oe-init-build-env with different values for
TEMPLATECONF only has a real effect if any of the generated files have
been removed, but that is a different story.

 scripts/oe-setup-builddir | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 201cea30bf..72113c37b8 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -133,6 +133,4 @@ fi
 [ ! -r "$OECORENOTESCONF" ] || cat "$OECORENOTESCONF"
 unset OECORENOTESCONF
 
-if [ ! -f "$BUILDDIR/conf/templateconf.cfg" ]; then
-    echo "$ORG_TEMPLATECONF" >"$BUILDDIR/conf/templateconf.cfg"
-fi
+echo "$ORG_TEMPLATECONF" >"$BUILDDIR/conf/templateconf.cfg"

