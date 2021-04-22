Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.1170.1619113022833588072
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 10:37:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 13MHb1f2005833
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 10:37:02 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 22 Apr 2021 10:37:01 -0700
Received: from localhost.localdomain (128.224.72.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Thu, 22 Apr 2021 10:37:00 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] oe-time-dd-test.sh: collect cooker log when timeout is exceeded
Date: Thu, 22 Apr 2021 13:36:55 -0400
Message-ID: <20210422173655.89313-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Collect the last 30 lines from the cooker.log
whenever the timeout is exceeded.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 scripts/oe-time-dd-test.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/oe-time-dd-test.sh b/scripts/oe-time-dd-test.sh
index 459071e732..2c74b49b3f 100755
--- a/scripts/oe-time-dd-test.sh
+++ b/scripts/oe-time-dd-test.sh
@@ -25,4 +25,5 @@ timeout ${TIMEOUT} dd if=/dev/zero of=oe-time-dd-test.dat bs=1024 count=$1 conv=
 if [ $? -ne 0 ]; then
 	echo "Timeout used: ${TIMEOUT}"
 	top -c -b -n1 -w 512
+	tail -30 tmp/log/cooker/*/console-latest.log
 fi
-- 
2.25.1

