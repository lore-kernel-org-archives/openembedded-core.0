Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B89C2D75E5D
	for <webhook@archiver.kernel.org>; Sun, 24 Nov 2024 20:14:48 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.3857.1732479277066243642
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Nov 2024 12:14:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=CmPzX1Lc;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20241124201432249e2bccc6e58ce9ef-bprmfi@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20241124201432249e2bccc6e58ce9ef
        for <openembedded-core@lists.openembedded.org>;
        Sun, 24 Nov 2024 21:14:33 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=ALZNxHHOayt5JDbYw5cy0zYmR8CZeK4+fdivJnaJqdg=;
 b=CmPzX1LcnIUN37gA21S2koZSTPoKYM2yzTQQlwV2uoK9dffXWCbA3olpv1q+OTMZ4jLLcb
 qW/gsPHHgzUXTrAdN59YDhpsQKLv16NS3ouj3epczhQYeZGn1jaAf8UJcbahysTrr8yf0lCz
 vmHgLtnF+7mjSE+thcnvGCaWYiiOWyggfTYcBvIWflzjKQ7zEphUsIpSA905QG9exgmfqp8j
 T4bvtbs19T/GpfOleCC8iSzMfRQaw0znPq4OhG8LNsQWEpsTgddFvUQrkxxiZxS1250xscB2
 54dXC1O0YuNzLWcMS26SFIiZWOPPu86V9R6jJClcEsRLSHXR/49//rEA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Marta Rybczynska <marta.rybczynska@ygreky.com>
Subject: [OE-core][PATCH 1/2] cve-check: restore CVE_CHECK_SHOW_WARNINGS functionality
Date: Sun, 24 Nov 2024 21:13:41 +0100
Message-Id: <20241124201342.27405-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Nov 2024 20:14:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207715

From: Peter Marko <peter.marko@siemens.com>

Commit 05ef4f2a7b225c8d230eaca8d333ffb921729d79 removed this
functionality by accident. It was implemented in text exporter, while it
should have been a global feature independent on exporter type to avoid
such accidental deletion.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Cc: Marta Rybczynska <marta.rybczynska@ygreky.com>
---
 meta/classes/cve-check.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 0c92b87f52..33d41b912d 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -422,6 +422,11 @@ def check_cves(d, cve_data):
     if not cves_in_recipe:
         bb.note("No CVE records for products in recipe %s" % (pn))
 
+    if d.getVar("CVE_CHECK_SHOW_WARNINGS") == "1":
+        unpatched_cves = [cve for cve in cve_data if cve_data[cve]["abbrev-status"] == "Unpatched"]
+        if unpatched_cves:
+            bb.warn("Found unpatched CVE (%s)" % " ".join(unpatched_cves))
+
     return (cve_data, cves_status)
 
 def get_cve_info(d, cve_data):
-- 
2.30.2


