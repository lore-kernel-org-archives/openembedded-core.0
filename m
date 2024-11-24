Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98673E6780A
	for <webhook@archiver.kernel.org>; Sun, 24 Nov 2024 20:15:38 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.3874.1732479338002903501
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Nov 2024 12:15:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=BYpsChK1;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20241124201535e459e01ad90e949d2e-72siab@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20241124201535e459e01ad90e949d2e
        for <openembedded-core@lists.openembedded.org>;
        Sun, 24 Nov 2024 21:15:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=pzch2tmlNLHOIO6EK0Mhh2zBfvwl0Ia0dI7O+YITBSk=;
 b=BYpsChK1gsc4LKTX+TDKGQWZtcjP5ahCoTi3lzZgrbAnrh5SLkyBrROe/VlYnHyXsewwkT
 poO5335YGKVhYSLkynwW+ZOw5oDWp4WTYrnlNuZzd/wlAjDHB41Krj/ljJ6fsjjIefgsjIIF
 7Z8USoLyVvnNAnIAbgoyD7OqvSyEZLBcvWKXB26TkPGGDM9nQ40Sj7m7DxyNHMGqaDCgA1d+
 JGImvZxoQZ6phtIeyrVvtpyz763ABIks2JjFGAOVFt7uKUsCd+PJjvlwdKpGBhHk9IhKD3LN
 8aSYgTJ8sXjpaFiGzJvBlaFFM5DqNnx4VrJY/3q3m3a5/ErjuGa/u3Vg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 2/2] cve-check: fix cvesInRecord
Date: Sun, 24 Nov 2024 21:13:42 +0100
Message-Id: <20241124201342.27405-2-peter.marko@siemens.com>
In-Reply-To: <20241124201342.27405-1-peter.marko@siemens.com>
References: <20241124201342.27405-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Nov 2024 20:15:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207716

From: Peter Marko <peter.marko@siemens.com>

Currently flag cvesInRecord is set to false if all CVEs are ignored or
patched. This is inconsistent as it shows false if a CVE was fixed via
patch and true if this CVE was fixed by upgrade. In both cases the CVE
is valid and was fixed.

As I understand this flag, it should say if any CVE exists for
particular component's product (regardless of how this CVE is handled)
and can be used to validate if a product is correctly set.

Note that skipping ignored CVEs may make sense in some cases, as ignored
may mean that NVD DB is wrong, but in many cases it is ignored for other
reasons. Further patch can be done to evaluate ignore subtype but that
would be against my understanding of this flag as described above.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes/cve-check.bbclass | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 33d41b912d..6e10dd915a 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -343,18 +343,19 @@ def check_cves(d, cve_data):
         for cverow in cve_cursor:
             cve = cverow[0]
 
-            if cve_is_ignored(d, cve_data, cve):
-                bb.note("%s-%s ignores %s" % (product, pv, cve))
-                continue
-            elif cve_is_patched(d, cve_data, cve):
-                bb.note("%s has been patched" % (cve))
-                continue
             # Write status once only for each product
             if not cves_in_product:
                 cves_status.append([product, True])
                 cves_in_product = True
                 cves_in_recipe = True
 
+            if cve_is_ignored(d, cve_data, cve):
+                bb.note("%s-%s ignores %s" % (product, pv, cve))
+                continue
+            elif cve_is_patched(d, cve_data, cve):
+                bb.note("%s has been patched" % (cve))
+                continue
+
             vulnerable = False
             ignored = False
 
-- 
2.30.2


