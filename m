Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9D9DC369D9
	for <webhook@archiver.kernel.org>; Sun, 27 Apr 2025 09:44:17 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web11.23820.1745747055385689323
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Apr 2025 02:44:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=IGpzfByk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20250427094411bcb8bbbfe65dd5b29c-q8bivz@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250427094411bcb8bbbfe65dd5b29c
        for <openembedded-core@lists.openembedded.org>;
        Sun, 27 Apr 2025 11:44:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=CbSHX5+0lHs8i9zvNjv2WzAjsgYQI257NpZ9YByGo7Y=;
 b=IGpzfBykiB9+pXGLfI30MPpPEk1YbF/j1NNVV0I8XyabmgpCD1QBFF2+AzlSE3iAXnPCvv
 CznXl+2LnJWNSNtypDLOlseY5+u86p8a6yP2QAdym/ZCyYqxkhydoEtohLy86XDUrdhgshLv
 UpQ4OaLldhXDkQh9JmGoiJuWN2hxg4McU4UkP8WiHgkI1qAENSA2K9ZBiTM74WgcWqtF5OPH
 dyYwRZvPgIUwLQglQzIld+5x+w+Edgf3q9nmj2SZdO5iOIvUC3UAaRHgNRJCLyyhk1FutwYi
 9WItvXl+YA0b2E1yUagH6zatSkKMDj4J0tCcwf0e+29a1DEpdbti4ayw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	daniel.turull@ericsson.com
Subject: [PATCH 2/4] linux/cve-exclusion: correct fixed-version calculation
Date: Sun, 27 Apr 2025 11:43:00 +0200
Message-Id: <20250427094302.12064-2-peter.marko@siemens.com>
In-Reply-To: <20250427094302.12064-1-peter.marko@siemens.com>
References: <20250427094302.12064-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Apr 2025 09:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215548

From: Peter Marko <peter.marko@siemens.com>

Current code takes the first version found as "fixed-version".
That is not correct as it is almost always only the oldest backport.
Fix it by unconditionally shift the assigmnet of variable "fixed" so
that we take last instead of first version.

Cc: daniel.turull@ericsson.com
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-kernel/linux/generate-cve-exclusions.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/meta/recipes-kernel/linux/generate-cve-exclusions.py
index 82fb4264e3..5c85c0db88 100755
--- a/meta/recipes-kernel/linux/generate-cve-exclusions.py
+++ b/meta/recipes-kernel/linux/generate-cve-exclusions.py
@@ -67,10 +67,9 @@ def get_fixed_versions(cve_info, base_version):
 
                 if not first_affected:
                     first_affected = v
-                    fixed = less_than
+                fixed = less_than
                 if base_version < v and v < next_version:
                     first_affected = v
-                    fixed = less_than
                     fixed_backport = less_than
 
     return first_affected, fixed, fixed_backport

