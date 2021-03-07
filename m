Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web09.27011.1615150746078436300
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Mar 2021 12:59:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 127Kwnc5011904
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Sun, 7 Mar 2021 12:58:54 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Sun, 7 Mar 2021 12:58:49 -0800
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Sun, 7 Mar 2021 12:58:48 -0800
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] scripts/oe-timeout-dd-test.sh: add script
Date: Sun, 7 Mar 2021 15:58:17 -0500
Message-ID: <20210307205817.5679-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

oe-timeout-dd-test tries to write <count> number of
kilobytes to the filesystem within a specified
<timeout>. The purporse of this script is to find
which part of the build system puts stress on the
filesystem io and log all the processes.

To use and monitor a build, add to local.conf:
BB_HEARTBEAT_EVENT = "<interval to log data>"
BB_LOG_HOST_STAT_ON_INTERVAL = "1"
BB_LOG_HOST_STAT_CMDS = "oe-timeout-dd-test.sh <timeout> <count>"

Log can be found at:
$TMPDIR/buildstats/<build_number>/host_stats file.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 scripts/oe-timeout-dd-test.sh | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 scripts/oe-timeout-dd-test.sh

diff --git a/scripts/oe-timeout-dd-test.sh b/scripts/oe-timeout-dd-test.sh
new file mode 100644
index 0000000000..40b3948c32
--- /dev/null
+++ b/scripts/oe-timeout-dd-test.sh
@@ -0,0 +1,26 @@
+#!/bin/sh
+#
+# oe-timeout-dd-test tries to write <count> number of
+# kilobytes to the filesystem within a specified time
+# constraint. The purporse of this script is to find
+# which part of the build system puts stress on the
+# filesystem io and log all the processes.
+
+usage() {
+        echo "Usage: $0 <timeout> <count>"
+}
+
+if [ $# -ne 2 ]; then
+        usage
+        exit 1
+fi
+
+timeout $1 dd if=/dev/zero of=/tmp/foo bs=1024 count=$2 >/dev/null 2>&1
+
+if [ $? -ne 0 ]
+then
+        top -b -n 1
+else
+        echo "success"
+fi
+
-- 
2.29.2

