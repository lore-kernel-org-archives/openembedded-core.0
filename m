Return-Path: <dnagodra@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 058A2C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 02:54:10 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.web10.11667.1702004040474260039
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Dec 2023 18:54:00 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=Vn75jwRA;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: dnagodra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1564; q=dns/txt; s=iport;
  t=1702004040; x=1703213640;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5PY19TF4UIdEvo9+Lzeg7Iz3Frff99NawXwMjdAGpro=;
  b=Vn75jwRAKSee5Ur1Cl/mnvSds4V4M7gOuoTeS1+JLkuyq5XPjvOqDdRk
   yzxNqXv6vLWq0/BQAVBpxhmjbDccXOWFBa5Ds4glYVCA+McdkFn8ZlVLs
   yTbcwLr5RYLlyiYRQM5CS79SecQAcTqVfyHZ0IUwoFM/A1SsWS+wxkuQr
   o=;
X-CSE-ConnectionGUID: Y4BJEpJlTMylZOYURiA0Ig==
X-CSE-MsgGUID: U4xS4kzyQgGHwAb4bmWqsg==
X-IronPort-AV: E=Sophos;i="6.04,259,1695686400"; 
   d="scan'208";a="157086290"
Received: from rcdn-core-1.cisco.com ([173.37.93.152])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 02:53:59 +0000
Received: from sjc-ads-6228.cisco.com (sjc-ads-6228.cisco.com [10.28.89.212])
	by rcdn-core-1.cisco.com (8.15.2/8.15.2) with ESMTPS id 3B82rxjf013895
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 8 Dec 2023 02:53:59 GMT
Received: by sjc-ads-6228.cisco.com (Postfix, from userid 1820939)
	id 0B58ECC1251; Thu,  7 Dec 2023 18:53:59 -0800 (PST)
From: Dhairya Nagodra <dnagodra@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, Dhairya Nagodra <dnagodra@cisco.com>
Subject: [master] [PATCH] cve-update-nvd2-native: faster requests with API keys
Date: Thu,  7 Dec 2023 18:53:22 -0800
Message-Id: <20231208025321.418459-1-dnagodra@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.28.89.212, sjc-ads-6228.cisco.com
X-Outbound-Node: rcdn-core-1.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 02:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192008

As per NVD, the public rate limit is 5 requests in 30s (6s delay).
Using an API key increases the limit to 50 requests in 30s (0.6s delay).
However, NVD still recommends sleeping for several seconds so that the
other legitimate requests are serviced without denial or interruption.
Keeping the default sleep at 6 seconds and 2 seconds with an API key.

For failures, the wait time is unchanged (6 seconds).

Reference: https://nvd.nist.gov/developers/start-here#RateLimits

Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 9ab8dc6050..941fca34c6 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -188,6 +188,11 @@ def update_db_file(db_tmp_file, d, database_time):
         api_key = d.getVar("NVDCVE_API_KEY") or None
         attempts = int(d.getVar("CVE_DB_UPDATE_ATTEMPTS"))
 
+        # Recommended by NVD
+        wait_time = 6
+        if api_key:
+            wait_time = 2
+
         while True:
             req_args['startIndex'] = index
             raw_data = nvd_request_next(url, attempts, api_key, req_args)
@@ -210,7 +215,7 @@ def update_db_file(db_tmp_file, d, database_time):
                break
 
             # Recommended by NVD
-            time.sleep(6)
+            time.sleep(wait_time)
 
         # Update success, set the date to cve_check file.
         cve_f.write('CVE database update : %s\n\n' % datetime.date.today())
-- 
2.35.6


