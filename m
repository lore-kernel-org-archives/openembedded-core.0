Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93D37C6FD18
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 21:50:52 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.51905.1681941048067177354
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Apr 2023 14:50:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Nc2E6x/B;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202304192150456e48eb9ca2568f690f-5_yl4z@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202304192150456e48eb9ca2568f690f
        for <openembedded-core@lists.openembedded.org>;
        Wed, 19 Apr 2023 23:50:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=pXNjO8zNghC93pPtd9OT2lvl+IILKnS4IDzfxSqOQ9I=;
 b=Nc2E6x/B7vgZq2XCDMQIkviN1epKbgm/t1sqp1tWxdYc7EEKGDgUm1MiOil8S0Kz2dLx84
 0MSDbz7jQM6DNMnjEzWZFjSnb3c7mKGVeQWS1EsAkfS31tnLSl2PPfv0y9ZGb+oSxKvozMTI
 z7SrXIm94BIP929xWKTImYqt99BxE=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] go: ignore CVE-2022-41716
Date: Wed, 19 Apr 2023 23:49:55 +0200
Message-Id: <20230419214956.7670-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 21:50:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180227

This CVE is specific to Microsoft Windows, ignore it.

Patch fixing it (https://go-review.googlesource.com/c/go/+/446916)
also adds a redundant check to generic os/exec which
could be backported but it should not be necessary as
backport always takes a small risk to break old code.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 14d58932dc..e0cda75da0 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -30,3 +30,6 @@ SRC_URI[main.sha256sum] = "a1a48b23afb206f95e7bbaa9b898d965f90826f6f1d1fc0c1d784
 # fix in 1.17 onwards where we can drop this.
 # https://github.com/golang/go/issues/30999#issuecomment-910470358
 CVE_CHECK_IGNORE += "CVE-2021-29923"
+
+# This is specific to Microsoft Windows
+CVE_CHECK_IGNORE += "CVE-2022-41716"
-- 
2.30.2


