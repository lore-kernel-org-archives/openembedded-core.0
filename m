Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.39.1618333171752396541
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Apr 2021 09:59:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 13DGxVWj016954
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Apr 2021 09:59:31 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Tue, 13 Apr 2021 09:59:31 -0700
Received: from localhost.localdomain (128.224.73.198) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Tue, 13 Apr 2021 09:59:29 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] oe-time-dd-test.sh: provide more information from "top"
Date: Tue, 13 Apr 2021 12:59:15 -0400
Message-ID: <20210413165915.72709-2-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413165915.72709-1-sakib.sajal@windriver.com>
References: <20210413165915.72709-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Improvements:
    - increase width to 512
    - pass -c option to show full command-line

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 scripts/oe-time-dd-test.sh | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-time-dd-test.sh b/scripts/oe-time-dd-test.sh
index 970a86dff08..5b25e6bd974 100755
--- a/scripts/oe-time-dd-test.sh
+++ b/scripts/oe-time-dd-test.sh
@@ -13,11 +13,16 @@ usage() {
         echo "Usage: $0 <count>"
 }
 
+TIMEOUT=5
+
 if [ $# -ne 1 ]; then
         usage
         exit 1
 fi
 
 uptime
-/usr/bin/time -f "%e" dd if=/dev/zero of=foo bs=1024 count=$1 conv=fsync
-top -b -n 1 | grep -v "0      0      0" | grep -E ' [RSD] ' | cut -c 46-47 | sort | uniq -c
+timeout ${TIMEOUT} dd if=/dev/zero of=oe-time-dd-test.dat bs=1024 count=$1 conv=fsync
+if [ $? -ne 0 ]; then
+	echo "Timeout used: ${TIMEOUT}"
+	top -c -b -n1 -w 512
+fi
-- 
2.25.1

