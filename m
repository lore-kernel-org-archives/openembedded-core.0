Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6DDCC369D3
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 09:44:47 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.23538.1745747063998806043
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Apr 2025 02:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=WOGCXWZl;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20250427094421e39ae955e915c48b74-2kqzpw@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250427094421e39ae955e915c48b74
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Apr 2025 11:44:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=k9ktMhThFal2D+DAMMBMcoalTDTRoIhc1D700SzZK5w=;
 b=WOGCXWZlMnBjlmMus1k0xJc2X87gb/H/U577pU+pVOkv8+x+AQWlnHXgNa2R+piUIP/tt6
 GzzxzBJkUxxgRGoYWU7PGFE+ccE0vZqCCKDeaEwD7woVHjLFHa7aUELS30Y5ElHA9ZY7ShXP
 bAmM0lAi7bSVEOErupQhlahKoMNrLEosmVSO5KfWqPY+CNDLXd/sVUip21bFq27P+xYke1R8
 Y1F/TuvhDfu2V+AWYq29m45TautJPsrE1Y50aUWsB4m+SbeG9dx2/0uDXQdVp81+xIEPOqzH
 5dpQmrqu1EFYvx50NY3oQmsxcpbex7m6SqayECDiguSZI4Ae1ju7IXtw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	daniel.turull@ericsson.com
Subject: [PATCH 4/4] linux/cve-exclusion: do not shift first_affected
Date: Sun, 27 Apr 2025 11:43:02 +0200
Message-Id: <20250427094302.12064-4-peter.marko@siemens.com>
In-Reply-To: <20250427094302.12064-1-peter.marko@siemens.com>
References: <20250427094302.12064-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 09:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215550

From: Peter Marko <peter.marko@siemens.com>

Stop shifting first_affected if backport is indicated. This does not
have effect on generated list, but makes the logic cleaner as it will
not shift it to "first affected on our branch" and also make it behave
like in defaultStatus==affected case.

Cc: daniel.turull@ericsson.com
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-kernel/linux/generate-cve-exclusions.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/meta/recipes-kernel/linux/generate-cve-exclusions.py
index 5c85c0db88..302ec8ebc9 100755
--- a/meta/recipes-kernel/linux/generate-cve-exclusions.py
+++ b/meta/recipes-kernel/linux/generate-cve-exclusions.py
@@ -69,7 +69,6 @@ def get_fixed_versions(cve_info, base_version):
                     first_affected = v
                 fixed = less_than
                 if base_version < v and v < next_version:
-                    first_affected = v
                     fixed_backport = less_than
 
     return first_affected, fixed, fixed_backport

