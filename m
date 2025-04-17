Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B90EEC369C7
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 09:35:26 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.4782.1744882515907368505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 02:35:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=T6RLcz4X;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20250417093517c9d3e1a7a21e404a6c-qffd4_@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250417093517c9d3e1a7a21e404a6c
        for <openembedded-core@lists.openembedded.org>;
        Thu, 17 Apr 2025 11:35:17 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=AF28OQo/qIUc4RF8iIj3QQWXFmZ3XFYnSMYwa74pC7U=;
 b=T6RLcz4XjSGXM9uEXwpTS4CeCLLS3RMVUbwaffjpPhft1uPpZQB8o5M2csBfqSymBW/3eJ
 YQrSltgVAFhGUntgkWTyzKtI95rqFOkHdJpO0By9pKfWg5piq+dO6iT+rINZEDXPw+9D0o5v
 TSOPAB7Bd9lC474r+Bd61fvDZKQSi9adO5x/7HR/FWfzH0JgZE0+PaXzWVCtxG1vOGczC6zW
 m9Ka40YL9ozXa6gCWdpR0AG7UcvKDj3hj12x8hgD9oREfLT8FdMMbUh3hF9x9AxLtUiQVM48
 FHDRSG48QgR1bxDuGz7JavjWJbdelrBMlj45qrzauuR6GMMwvZ+ngS8A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: jpewhacker@gmail.com,
	Peter Marko <peter.marko@siemens.com>
Subject: [PATCH 2/2] spdx: extend CVE_STATUS variables
Date: Thu, 17 Apr 2025 11:34:57 +0200
Message-Id: <20250417093457.2091799-2-peter.marko@siemens.com>
In-Reply-To: <20250417093457.2091799-1-peter.marko@siemens.com>
References: <20250417093457.2091799-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 09:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215048

From: Peter Marko <peter.marko@siemens.com>

If spdx is generated without inheriting cve/vex classes (which is poky
default), only explicitly set CVE_STATUS fields are handled.
Calculated ones (e.g. from CVE_STATUS_GROUPS) are ignored.

Fix this by expanding the CVE_STATUS in spdx classes.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes/spdx-common.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/spdx-common.bbclass b/meta/classes/spdx-common.bbclass
index 36feb56807..713a7fc651 100644
--- a/meta/classes/spdx-common.bbclass
+++ b/meta/classes/spdx-common.bbclass
@@ -37,6 +37,11 @@ SPDX_CUSTOM_ANNOTATION_VARS ??= ""
 
 SPDX_MULTILIB_SSTATE_ARCHS ??= "${SSTATE_ARCHS}"
 
+python () {
+    from oe.cve_check import extend_cve_status
+    extend_cve_status(d)
+}
+
 def create_spdx_source_deps(d):
     import oe.spdx_common
 

