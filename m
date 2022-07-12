Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06197C43334
	for <webhook@archiver.kernel.org>; Tue, 12 Jul 2022 04:07:07 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.5141.1657598821476083295
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Jul 2022 21:07:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=T8px7Zwy;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id DE8FC204CB5D; Mon, 11 Jul 2022 21:07:00 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com DE8FC204CB5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1657598820;
	bh=WtU20DXjIZTxFYkuj8+zfUBWypZtQIfT4akeqFlG8wc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=T8px7ZwyTzrroZDxEY801F5a2TNZt9UlQ/xSH2utcdpDAK7miZW9YH177U4WpAcWS
	 PDmuD7+EXl3zPMIxzSaQJLh18Tq1vbV9A6+G9QB5dGR+hM47h/jdtc6RhjlyEcWHIz
	 5iwXydKhU47oUNpexWFzgPNuqHimR5wDvfUaBr9o=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] devtool: ignore pn- overrides when determining SRC_URI
 overrides
Date: Mon, 11 Jul 2022 21:06:56 -0700
Message-Id: 
 <79aa08d8f5cfb8be62b4d5b9392522d28cbadc22.1657597513.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1657597513.git.paul.eggleton@linux.microsoft.com>
References: <cover.1657597513.git.paul.eggleton@linux.microsoft.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Jul 2022 04:07:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167893

From: Paul Eggleton <paul.eggleton@microsoft.com>

If (perhaps foolishly) at your configuration level you have e.g.

  SRC_URI_append_pn-recipename = " file://patchname.patch"

and then run devtool modify on a different recipe, an error occurs:

  INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
  ...
  ERROR: [Errno 2] No such file or directory: '/path/to/downloads/patchname.patch'

pn- overrides would not constitute an alternative configuration that we
should handle in this context, so just ignore them to avoid the issue.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 scripts/lib/devtool/standard.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index a942ef3..b0b484e 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -520,7 +520,9 @@ def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath, works
         for event in history:
             if not 'flag' in event:
                 if event['op'].startswith((':append[', ':prepend[')):
-                    extra_overrides.append(event['op'].split('[')[1].split(']')[0])
+                    override = event['op'].split('[')[1].split(']')[0]
+                    if not override.startswith('pn-'):
+                        extra_overrides.append(override)
         # We want to remove duplicate overrides. If a recipe had multiple
         # SRC_URI_override += values it would cause mulitple instances of
         # overrides. This doesn't play nicely with things like creating a
-- 
1.8.3.1


