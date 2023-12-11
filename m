Return-Path: <dnagodra@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F2E2C4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 10:05:22 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.web11.5132.1702289115992602422
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 02:05:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=lMKxngWW;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: dnagodra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=1610; q=dns/txt; s=iport;
  t=1702289116; x=1703498716;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6uh9rtXLjx/JuEuY7nkR8vDa66JO+S2cBqwV5AdeObU=;
  b=lMKxngWWJQiyPkpoL/rSTxx25jiOS4Wfhz5Uykd+OY8LchX/1O1D0+DO
   V0daMEkix/8GXBFbb9xBYx59+/EeAZRB/pScbHAEk6FZyC2ukZhqFbW48
   +DMaSQR/w6WwTjdRobIlfHFfQgkKiVFoGTvCv61d5QwuXlokTJahwI5uZ
   s=;
X-CSE-ConnectionGUID: zNInTDgNSkKqn6b7dls/Gg==
X-CSE-MsgGUID: NfZwbS8uR9Gd8ZhOMwoRyQ==
X-IronPort-AV: E=Sophos;i="6.04,267,1695686400"; 
   d="scan'208";a="193757185"
Received: from rcdn-core-4.cisco.com ([173.37.93.155])
  by alln-iport-4.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 10:05:15 +0000
Received: from sjc-ads-6228.cisco.com (sjc-ads-6228.cisco.com [10.28.89.212])
	by rcdn-core-4.cisco.com (8.15.2/8.15.2) with ESMTPS id 3BBA5EWK011641
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 11 Dec 2023 10:05:15 GMT
Received: by sjc-ads-6228.cisco.com (Postfix, from userid 1820939)
	id A5E0BCC1251; Mon, 11 Dec 2023 02:05:14 -0800 (PST)
From: dnagodra@cisco.com
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, alexandre.belloni@bootlin.com,
        Dhairya Nagodra <dnagodra@cisco.com>
Subject: [PATCH v2 1/2] cve-update-nvd2-native: faster requests with API keys
Date: Mon, 11 Dec 2023 02:04:59 -0800
Message-Id: <20231211100500.1979776-1-dnagodra@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.28.89.212, sjc-ads-6228.cisco.com
X-Outbound-Node: rcdn-core-4.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 10:05:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192155

From: Dhairya Nagodra <dnagodra@cisco.com>

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


