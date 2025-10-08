Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6752FCAC5BB
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 20:42:29 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.2204.1759956144454168793
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Oct 2025 13:42:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=hhkXN6EA;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-2025100820421977e9abe13200020764-ekbiiu@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 2025100820421977e9abe13200020764
        for <openembedded-core@lists.openembedded.org>;
        Wed, 08 Oct 2025 22:42:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=fgCAGHIvc6TrIuV2JTWQjz81/Sud12t8pWU3z3z6fg8=;
 b=hhkXN6EAwtQKNL8nrIrDnfwV8qXlVPtCiOp9dgJddxWocmcEo/lRJ7GclqmNgvlbhhfOTw
 hi3T5MgJ6dk3hzs1w+ArpYiiiYmpOR6OLzV+vn5ILjD2tGIgIBhrcmw8XP89oAzFuuzDtqwO
 MN19GGZ6QPfYgmMUG1hE7aeRwGor66bagl96u+VVruVTr2klBmFzh99cCZKsXVPaUQWAZ+eW
 TyDbxlUfA25Muhcrr+z5LnhNrpGzb4WTllpUq/GlBABeGT7F7V6i/Ah1pqQcInRsC2Aqg1KZ
 bqXQf44RioPaTd8iv5O3W7qP76YQl/l50qkHdSkc3CEd2FE/jN0uwn3w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][scarthgap][PATCH] tiff: ignore 5 CVEs
Date: Wed,  8 Oct 2025 22:42:16 +0200
Message-Id: <20251008204216.1701887-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Oct 2025 20:42:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224601

From: Peter Marko <peter.marko@siemens.com>

These CVEs are for tools which were removed in v4.6.0 via [1] and
re-introduced again in v4.7.0 via [2].

[1] https://gitlab.com/libtiff/libtiff/-/commit/eab89a627f0a65e9a1a47c4b30b4802c80b1ac45
[2] https://gitlab.com/libtiff/libtiff/-/commit/9ab54a858049bef020d578c71d82669531551c00

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-multimedia/libtiff/tiff_4.6.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
index 6bf7010ba28..c4b0fd96411 100644
--- a/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
+++ b/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb
@@ -27,6 +27,10 @@ UPSTREAM_CHECK_REGEX = "tiff-(?P<pver>\d+(\.\d+)+).tar"
 CVE_STATUS[CVE-2015-7313] = "fixed-version: Tested with check from https://security-tracker.debian.org/tracker/CVE-2015-7313 and already 4.3.0 doesn't have the issue"
 CVE_STATUS[CVE-2023-3164] = "cpe-incorrect: Issue only affects the tiffcrop tool not compiled by default since 4.6.0"
 
+CVE_STATUS_GROUPS += "CVE_STATUS_REMOVED_TOOLS"
+CVE_STATUS_REMOVED_TOOLS = "CVE-2024-13978 CVE-2025-8176 CVE-2025-8177 CVE-2025-8534 CVE-2025-8851"
+CVE_STATUS_REMOVED_TOOLS[status] = "cpe-incorrect: tools affected by these CVEs are not present in this release"
+
 inherit autotools multilib_header
 
 CACHED_CONFIGUREVARS = "ax_cv_check_gl_libgl=no"

