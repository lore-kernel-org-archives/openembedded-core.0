Return-Path: <dnagodra@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248ACC4167B
	for <webhook@archiver.kernel.org>; Mon, 11 Dec 2023 10:05:32 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.web10.5189.1702289122406250199
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Dec 2023 02:05:22 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=NF0t0Egf;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: dnagodra@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2191; q=dns/txt; s=iport;
  t=1702289122; x=1703498722;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8qpUqr7WMUefjbwOnOsnJHG8NcS9m/bNz9bgVt33Z1U=;
  b=NF0t0EgfLCDZpyMpgxqDuI8Lsxj+gKQVz1PMja3LUqQToj/QkgUD8Fq2
   mIFhlr+Mnb9R+olkDswTh2jUihTh7qBi/GPyDAQwOt/WGywT7mZinNbFo
   gc2J1STpc+5jjyS0+A8e0odNnhg7oob84ODDQXwyERjMFSLsulrJX4uG+
   c=;
X-CSE-ConnectionGUID: La1+WfVWSaGTx/hBjARj2A==
X-CSE-MsgGUID: lnxgbYSYR8OIbSgXTHDqng==
X-IronPort-AV: E=Sophos;i="6.04,267,1695686400"; 
   d="scan'208";a="199359357"
Received: from rcdn-core-2.cisco.com ([173.37.93.153])
  by alln-iport-1.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2023 10:05:21 +0000
Received: from sjc-ads-6228.cisco.com (sjc-ads-6228.cisco.com [10.28.89.212])
	by rcdn-core-2.cisco.com (8.15.2/8.15.2) with ESMTPS id 3BBA5L7c018564
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 11 Dec 2023 10:05:21 GMT
Received: by sjc-ads-6228.cisco.com (Postfix, from userid 1820939)
	id 0B123CC1251; Mon, 11 Dec 2023 02:05:21 -0800 (PST)
From: dnagodra@cisco.com
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com, alexandre.belloni@bootlin.com,
        Dhairya Nagodra <dnagodra@cisco.com>
Subject: [PATCH v2 2/2] cve-update-nvd2-native: increase the delay between subsequent request failures
Date: Mon, 11 Dec 2023 02:05:00 -0800
Message-Id: <20231211100500.1979776-2-dnagodra@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20231211100500.1979776-1-dnagodra@cisco.com>
References: <20231211100500.1979776-1-dnagodra@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-SMTP-Client: 10.28.89.212, sjc-ads-6228.cisco.com
X-Outbound-Node: rcdn-core-2.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Dec 2023 10:05:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192156

From: Dhairya Nagodra <dnagodra@cisco.com>

Sometimes NVD servers are unstable and return too many errors.
There is an option to have higher fetch attempts to increase the chances
of successfully fetching the CVE data.

Additionally, it also makes sense to progressively increase the delay
after a failed request to an already unstable or busy server.
The increase in delay is reset after every successful request and
the maximum delay is limited to 30 seconds.

Also, the logs are improved to give more clarity.

Signed-off-by: Dhairya Nagodra <dnagodra@cisco.com>
---
 meta/recipes-core/meta/cve-update-nvd2-native.bb | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/meta/cve-update-nvd2-native.bb b/meta/recipes-core/meta/cve-update-nvd2-native.bb
index 941fca34c6..bfe48b27e7 100644
--- a/meta/recipes-core/meta/cve-update-nvd2-native.bb
+++ b/meta/recipes-core/meta/cve-update-nvd2-native.bb
@@ -114,7 +114,10 @@ def cleanup_db_download(db_file, db_tmp_file):
     if os.path.exists(db_tmp_file):
         os.remove(db_tmp_file)
 
-def nvd_request_next(url, attempts, api_key, args):
+def nvd_request_wait(attempt, min_wait):
+    return min ( ( (2 * attempt) + min_wait ) , 30)
+
+def nvd_request_next(url, attempts, api_key, args, min_wait):
     """
     Request next part of the NVD dabase
     """
@@ -143,8 +146,10 @@ def nvd_request_next(url, attempts, api_key, args):
             r.close()
 
         except Exception as e:
-            bb.note("CVE database: received error (%s), retrying" % (e))
-            time.sleep(6)
+            wait_time = nvd_request_wait(attempt, min_wait)
+            bb.note("CVE database: received error (%s)" % (e))
+            bb.note("CVE database: retrying download after %d seconds. attempted (%d/%d)" % (wait_time, attempt+1, attempts))
+            time.sleep(wait_time)
             pass
         else:
             return raw_data
@@ -195,7 +200,7 @@ def update_db_file(db_tmp_file, d, database_time):
 
         while True:
             req_args['startIndex'] = index
-            raw_data = nvd_request_next(url, attempts, api_key, req_args)
+            raw_data = nvd_request_next(url, attempts, api_key, req_args, wait_time)
             if raw_data is None:
                 # We haven't managed to download data
                 return False
-- 
2.35.6


