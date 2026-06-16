Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C72CD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 19:23:30 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5888.1781637807914470153
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 12:23:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=W0C6edWX;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260616192324104f89be6300020740-svpfnj@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260616192324104f89be6300020740
        for <openembedded-core@lists.openembedded.org>;
        Tue, 16 Jun 2026 21:23:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=1AQoykBg6518Nv07KdsrT2jUQvj04hTshLxBzkvfTl0=;
 b=W0C6edWXvFOlaSB0R+TZyi5UIcrFJloWoi1b5wEKMKvmwFYqZvIZo0d4+OtE+R7fjkm6TB
 0bvHN+oHqTVZ5tq6wWscd9x+1H5ebU70Roo7P48ZwLiMW66SwQY2KjSLQHbIblKYjKUpTD/2
 7R8wnh6hvtmzv/VI7Q/2OrJ1MNzwCtJi5ZOXuj6IVJsuuKoLMzHdO1kxtblf9MuF2uNAo0V0
 NHcb4PuQtY8TkjHyXifzdXvyAYcO6nhfBB53nSibyPXVsW7Ke2IFjaIowgioQSXrhg87mzzg
 ot7nN8l6phLB8Ier3wL0HfLe3wgYKKg57cHILJdEDPKSbZsyznRaP5Cg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: rybczynska@gmail.com,
	Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] vex: drop obsolete conflict check with cve-check class
Date: Tue, 16 Jun 2026 21:23:18 +0200
Message-ID: <20260616192318.3747046-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 19:23:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238957

From: Peter Marko <peter.marko@siemens.com>

cve-check class was removed, so this check is obsolete.

From commit message introducing vex class it's not clear why this check
is present, but presumably to not extend the cve status multiple times.
Thas is no longer possible since commit
45e18f4270d084d81c21b1e5a4a601ce975d8a77 introduced sanity check to
prevent that from happening.
Therefore it's also not necessary to rewrite this check to new
sbom-cve-check(-recipe) classes.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes/vex.bbclass | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/classes/vex.bbclass b/meta/classes/vex.bbclass
index 71be705fc1..b3c2aca762 100644
--- a/meta/classes/vex.bbclass
+++ b/meta/classes/vex.bbclass
@@ -73,9 +73,6 @@ CVE_CHECK_LAYER_INCLUDELIST ??= ""
 CVE_VERSION_SUFFIX ??= ""
 
 python () {
-    if bb.data.inherits_class("cve-check", d):
-        raise bb.parse.SkipRecipe("Skipping recipe: found incompatible combination of cve-check and vex enabled at the same time.")
-
     from oe.cve_check import extend_cve_status
     extend_cve_status(d)
 }

