Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web12.10003.1616401969222518581
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 01:32:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 12M8WbX0028558
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Mar 2021 01:32:42 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 22 Mar 2021 01:32:30 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Mon, 22 Mar 2021 01:32:29 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] scripts: add oe-time-dd-test.sh
Date: Mon, 22 Mar 2021 04:32:24 -0400
Message-ID: <20210322083224.17311-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

oe-time-dd-test records how much time it takes to
write <count> number of kilobytes to the filesystem.
It also records the number of processes that are in
running (R), uninterruptible sleep (D) and interruptible
sleep (S) state from the output of "top" command.
The purporse of this script is to find which part of
the build system puts stress on the filesystem io and
log all the processes.

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 scripts/oe-time-dd-test.sh | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 scripts/oe-time-dd-test.sh

diff --git a/scripts/oe-time-dd-test.sh b/scripts/oe-time-dd-test.sh
new file mode 100644
index 0000000000..970a86dff0
--- /dev/null
+++ b/scripts/oe-time-dd-test.sh
@@ -0,0 +1,23 @@
+#!/bin/sh
+#
+# oe-time-dd-test records how much time it takes to 
+# write <count> number of kilobytes to the filesystem.
+# It also records the number of processes that are in
+# running (R), uninterruptible sleep (D) and interruptible
+# sleep (S) state from the output of "top" command.
+# The purporse of this script is to find which part of
+# the build system puts stress on the filesystem io and
+# log all the processes.
+
+usage() {
+        echo "Usage: $0 <count>"
+}
+
+if [ $# -ne 1 ]; then
+        usage
+        exit 1
+fi
+
+uptime
+/usr/bin/time -f "%e" dd if=/dev/zero of=foo bs=1024 count=$1 conv=fsync
+top -b -n 1 | grep -v "0      0      0" | grep -E ' [RSD] ' | cut -c 46-47 | sort | uniq -c
-- 
2.29.2

