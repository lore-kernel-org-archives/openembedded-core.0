Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 875FDC02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 17:40:38 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web10.22340.1739382036951757720
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 09:40:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=co3VEKMW;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-2025021217403568789547270b72caec-lp1u2n@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 2025021217403568789547270b72caec
        for <openembedded-core@lists.openembedded.org>;
        Wed, 12 Feb 2025 18:40:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=Tp1Z+6glvC2whNaDd2URbLKqu2SJdhelbtCF43DCXF4=;
 b=co3VEKMWsgt0wPTSmCGhSyrjv69EVaK4WsRNM33qznU/vMNkmp3TyewJJkxdxmGSlVFKau
 vIWLRQqf4hNxJxd7cTPi4T2tomR0w52xZPNNiYs2GgM1lwezDLes4gLeWQT+DYWBHM+oKQbR
 c7wnH5befJwWq7FcIm8egNgFsfWIUN6o4OvMs54wclY1tnEIOxiCIj4G259Ggvl9a3Rh8BSI
 0FIjV1hNX2b88sqQ/WdvHIlUYdfmyjK531TqJd4/9G5IbOZY0+GY01CNI+fJwtoDzMdxx5+S
 wr3d4KzhfGMwUqWfDc/bMcjtmHe/f2huQsIo1ct2SaEohyMcvRsUYv+Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][kirkstone][PATCH] subversion: ignore CVE-2024-45720
Date: Wed, 12 Feb 2025 18:39:46 +0100
Message-Id: <20250212173946.9983-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 17:40:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211265

From: Peter Marko <peter.marko@siemens.com>

Reference: https://nvd.nist.gov/vuln/detail/CVE-2024-45720

This CVE is relevant only for subversion running on Windows.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-devtools/subversion/subversion_1.14.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/subversion/subversion_1.14.2.bb b/meta/recipes-devtools/subversion/subversion_1.14.2.bb
index 35da95f39d..a979e63c60 100644
--- a/meta/recipes-devtools/subversion/subversion_1.14.2.bb
+++ b/meta/recipes-devtools/subversion/subversion_1.14.2.bb
@@ -19,6 +19,9 @@ inherit autotools pkgconfig gettext python3native
 
 CVE_PRODUCT = "apache:subversion"
 
+# not-applicable-platform: Issue only applies on Windows
+CVE_CHECK_IGNORE += "CVE-2024-45720"
+
 PACKAGECONFIG ?= ""
 
 PACKAGECONFIG[boost] = "--with-boost=${RECIPE_SYSROOT}${exec_prefix},--without-boost,boost"

