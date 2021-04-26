Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web09.12556.1619466740088712387
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Apr 2021 12:52:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 13QJqI18031985
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Apr 2021 12:52:18 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Mon, 26 Apr 2021 12:52:18 -0700
Received: from localhost.localdomain (128.224.72.75) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Mon, 26 Apr 2021 12:52:17 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] oe-time-dd-test.sh: collect cooker log when timeout is exceeded
Date: Mon, 26 Apr 2021 15:51:59 -0400
Message-ID: <20210426195159.154328-1-sakib.sajal@windriver.com>
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
index 459071e732..46b218b76a 100755
--- a/scripts/oe-time-dd-test.sh
+++ b/scripts/oe-time-dd-test.sh
@@ -25,4 +25,5 @@ timeout ${TIMEOUT} dd if=/dev/zero of=oe-time-dd-test.dat bs=1024 count=$1 conv=
 if [ $? -ne 0 ]; then
 	echo "Timeout used: ${TIMEOUT}"
 	top -c -b -n1 -w 512
+	tail -30 tmp*/log/cooker/*/console-latest.log
 fi
-- 
2.25.1

