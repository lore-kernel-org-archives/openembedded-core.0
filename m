Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13540F419A2
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 12:43:24 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17971.1776256998351718161
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 05:43:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=WbpSUEcP;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20260415124315aa1131e8f8000207ff-fc99ao@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260415124315aa1131e8f8000207ff
        for <openembedded-core@lists.openembedded.org>;
        Wed, 15 Apr 2026 14:43:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=KGXH/PCzFBq53YSmufPdLXLQT3+2mVe/EoBd1+PNOQw=;
 b=WbpSUEcPDUwo8yLkBJ7pL7gb+1g7S+V7JjonanSLvW5eDcf6QYj2EA0vGAN9JInWjgW2ox
 EuGClmKyZODKTRg0uo1OIndMni/KVYX/urUr/TySwvKT84speGgCvl+TH+9ijOG+6HBGacV8
 JDs79KDw108fsLdnDz3YlcFNiICapXx1WMVnoFhXrq9JbOZIL0NcJF5hvrC0sNhbi07nyO9E
 cr5TaREhk73zD6UUWEJIGnEo7B66An3pRcnHqQrm9MEucWLtTNuU1IStuQ31rP1OTtQlu6Mw
 n6PmcY6p2mi9O0JCacA5AYNhA1/o8u2ELydQBVzQcA5tJTMSQvvVqY3g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] go: skip recipe instead of throwing fatal error on unknown architectures
Date: Wed, 15 Apr 2026 14:43:06 +0200
Message-ID: <20260415124306.575029-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 12:43:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235198

From: Peter Marko <peter.marko@siemens.com>

Current code means that layer which contains a golang recipe cannot be
even parsed for machine which is not in supported golang architectures.

Skipping the golang recipes instead of throwing fatal error is much
friendlier and let machines without golang support co-exist in a layer
with golang recipes.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/lib/oe/go.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/go.py b/meta/lib/oe/go.py
index 4559dc63b2..cbcf80f0b1 100644
--- a/meta/lib/oe/go.py
+++ b/meta/lib/oe/go.py
@@ -35,4 +35,4 @@ def map_arch(a):
         return 'riscv64'
     elif a == 'loongarch64':
         return 'loong64'
-    raise KeyError(f"Cannot map architecture {a}")
+    raise bb.parse.SkipRecipe(f"Cannot map architecture {a}")

