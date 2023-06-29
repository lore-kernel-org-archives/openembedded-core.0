Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0307EB64D9
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 13:44:45 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.8596.1688046281542934467
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 06:44:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=MoVfaXyj;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202306291344378c588a4663f1297727-azonbs@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202306291344378c588a4663f1297727
        for <openembedded-core@lists.openembedded.org>;
        Thu, 29 Jun 2023 15:44:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=8nEnAZLU/tUs+moW2r3qJVJp8B4ZfQ2wv95P+crIaL4=;
 b=MoVfaXyjMIGjpU90AtRaDsA40fNfb+cqMbWfYdZnF0FmyVPK9KxTB2Fyx5ZKHfdy90kIof
 kV/V0D3r4NVZrRhLEUfk+cXRV0BoI1dpf/oemKdU2wXM7wlvtV2Z5cENm2A9SEYnhOznnel/
 QL0xJhrQEN+Qyje/YSKnJ95pkGiwI=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][master][mickledore][kirkstone][dunfell][PATCH]  cve-update-nvd2-native: fix cvssV3 metrics
Date: Thu, 29 Jun 2023 15:43:12 +0200
Message-Id: <20230629134312.732919-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 13:44:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183626

From: Peter Marko <peter.marko@siemens.com>

After upgrade to soon-to-be-released kirkstone 4.0.11
CVE annotations got broken.
Anything which has only cvssV3 did not resolve properly.
Fix the API fields used to extract it.
Number of CVEs with score 0.0 is still not at 1.1 API level,
but that is probably NVD API difference issue.

NVD API 1.1:
sqlite> select vector, count(vector) from nvd group by vector;
ADJACENT_NETWORK|4776
LOCAL|32146
NETWORK|167746
PHYSICAL|185
sqlite> select scorev3, count(scorev3) from nvd group by scorev3;
0.0|73331
1.8|7
1.9|3
...

NVD API 2.0 (broken):
sqlite> select vector, count(vector) from nvd group by vector;
ADJACENT_NETWORK|4587
LOCAL|26273
NETWORK|150421
UNKNOWN|24644
sqlite> select scorev3, count(scorev3) from nvd group by scorev3;
0.0|205925

NVD API 2.0 (fixed):
sqlite> select vector, count(vector) from nvd group by vector;
ADJACENT_NETWORK|4998
LOCAL|32226
NETWORK|167877
PHYSICAL|185
sqlite> select scorev3, count(scorev3) from nvd group by scorev3;
0.0|115460
1.8|4
1.9|1
...

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 2b585983ac..cb03fe730c 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -313,8 +313,8 @@ def update_db(conn, elt):
     except KeyError:
         cvssv2 = 0.0
     try:
-        accessVector = accessVector or elt['impact']['baseMetricV3']['cvssV3']['attackVector']
-        cvssv3 = elt['impact']['baseMetricV3']['cvssV3']['baseScore']
+        accessVector = accessVector or elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['attackVector']
+        cvssv3 = elt['cve']['metrics']['cvssMetricV31'][0]['cvssData']['baseScore']
     except KeyError:
         accessVector = accessVector or "UNKNOWN"
         cvssv3 = 0.0
-- 
2.30.2


