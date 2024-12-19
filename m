Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C06F0E7718B
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 20:26:05 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web11.138079.1734639963866026237
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 12:26:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=NveDKFuX;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202412192026011b4719e1703d74e2df-mi40qy@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202412192026011b4719e1703d74e2df
        for <openembedded-core@lists.openembedded.org>;
        Thu, 19 Dec 2024 21:26:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=WnsI+jvsU+NMy6iuJe3KmFnclv3g3xVF0hc31cN9oJY=;
 b=NveDKFuXhD/9bfHqjtTY/FSm6Vedj3xZJKRMGU6xqFypig68sz6UaYPMCZnPGZSOWUdO3c
 +moqmGp5DYOyJViyADscA2pFqDbJU1whOnwT9lz0ZttvD+fzvkSttIlDCqxsoCOdsy9EEg3g
 I3sS6c4DiDYzybL7sMZCTkJ4sy08hMEfCDCY9j2RISSJa1rakqS5wwBIV15AdAnAgE99pKfd
 bjZbnQgqFLViys47AxaLowPuteuC5wIwQk+6CoR9QjujPDb5AUAbEsJEXxNCnip728j47fjJ
 mnu7LCElnvAYbBpo4+OYMw401RlYjTelxcMv1fOcL48LLUZ2gKqkMW6Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 09/12] apache2: ignore disputed CVE CVE-2007-0086
Date: Thu, 19 Dec 2024 21:24:20 +0100
Message-Id: <20241219202423.346033-10-peter.marko@siemens.com>
In-Reply-To: <20241219202423.346033-1-peter.marko@siemens.com>
References: <20241219202423.346033-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 20:26:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208942

From: Peter Marko <peter.marko@siemens.com>

This CVE is officially disputed by Redhat with official statement in
https://nvd.nist.gov/vuln/detail/CVE-2007-0086

Red Hat does not consider this issue to be a security vulnerability.
The pottential attacker has to send acknowledgement packets periodically
to make server generate traffic. Exactly the same effect could be
achieved by simply downloading the file. The statement that setting the
TCP window size to arbitrarily high value would permit the attacker to
disconnect and stop sending ACKs is false, because Red Hat Enterprise
Linux limits the size of the TCP send buffer to 4MB by default.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
index 3a988f2494..bba00fb95c 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
@@ -40,6 +40,7 @@ CVE_PRODUCT = "apache:http_server"
 CVE_STATUS[CVE-1999-0289] = "not-applicable-platform: The current version is not affected. It only applies for Windows"
 CVE_STATUS[CVE-1999-0678] = "not-applicable-platform: this CVE is for Debian packaging configuration"
 CVE_STATUS[CVE-1999-1412] = "not-applicable-platform: this CVE is for MAC OS X specific problem"
+CVE_STATUS[CVE-2007-0086] = "disputed: this CVE is officially disputed by Redhat"
 CVE_STATUS[CVE-2007-0450] = "not-applicable-platform: The current version is not affected. It only applies for Windows."
 CVE_STATUS[CVE-2007-6421] = "cpe-incorrect: The current version is not affected by the CVE which affects versions from 2.2 (incl.) to 2.2.8 (excl.)"
 CVE_STATUS[CVE-2007-6422] = "cpe-incorrect: The current version is not affected by the CVE which affects versions from 2.2 (incl.) to 2.2.8 (excl.)"
-- 
2.30.2


