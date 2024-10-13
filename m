Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B95CBCF2579
	for <webhook@archiver.kernel.org>; Sun, 13 Oct 2024 12:57:36 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.31049.1728824253930343689
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Oct 2024 05:57:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=b8eehPzR;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2024101312573022f6849eeb31916d32-n8ejw_@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2024101312573022f6849eeb31916d32
        for <openembedded-core@lists.openembedded.org>;
        Sun, 13 Oct 2024 14:57:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=hmfkfrGBGp8KdczoS6oCiMcAJ7HB6+rAuX7XlJH3dAQ=;
 b=b8eehPzRVeLx0AfDwpGBQ5N5KdSXvxgBwzOisT4aXitqss5PdUGeX5SkUbNQQAe2fnwZVh
 rvpNl4/ANfE3/puAqoxlG6Ngr8IKvfh1eKyQfxbJ1BlYdjjbM2q1Rfhct/k5P4soCwDZ5UbN
 6S9azCSFteKVv++J1OY9PWXe9ApyiDx6YmH+bu2acCWB8Dq/xRP7bPODXDQSoEb7wZ50Pzkb
 g9PyNGbmb5V8u1jEoWMRtw8Thc42tQglyhKT+mT5F2iwL7oGQ2p56jQjkjOeHywHL+fh6VzF
 pI04ZQOLJzABxNyxPOeFQvrK5RKuS5fH/USN82Z/M0H/HL/Z5VCfZPqQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] gcc: ignore CVE-2023-4039
Date: Sun, 13 Oct 2024 14:56:42 +0200
Message-Id: <20241013125642.8737-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Oct 2024 12:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205721

From: Peter Marko <peter.marko@siemens.com>

Last version bump removed patch for this CVE because it was integrated
in new release. This has caused the CVE to reappear in reports because
2023-09-12 is "higher" than 11.5...

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/gcc/gcc-11.5.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-11.5.inc b/meta/recipes-devtools/gcc/gcc-11.5.inc
index c316d2a9a0..5d29b8e61e 100644
--- a/meta/recipes-devtools/gcc/gcc-11.5.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.5.inc
@@ -121,3 +121,6 @@ EXTRA_OECONF_PATHS = "\
 
 # Is a binutils 2.26 issue, not gcc
 CVE_CHECK_IGNORE += "CVE-2021-37322"
+
+# This is fixed by commit 75c37e0314, nvd uses arm versioning (2023-09-12) which will alway be higher than 11.x
+CVE_CHECK_IGNORE += "CVE-2023-4039"
-- 
2.30.2


