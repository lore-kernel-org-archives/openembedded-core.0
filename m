Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.17003.1625864039169889879
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jul 2021 13:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: sakib.sajal@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 169KrvW4010714
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 9 Jul 2021 13:53:58 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 169KrvLE011340
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 9 Jul 2021 13:53:57 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Fri, 9 Jul 2021 13:53:57 -0700
Received: from localhost.localdomain (128.224.72.142) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Fri, 9 Jul 2021 13:53:55 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] oe-time-dd-test.sh: add options and refactor
Date: Fri, 9 Jul 2021 16:53:44 -0400
Message-ID: <20210709205344.233257-2-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210709205344.233257-1-sakib.sajal@windriver.com>
References: <20210709205344.233257-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Options:
-c | --count <amount>           dd (transfer) <amount> KiB of data within specified timeout to detect latency.
                                Must enable -t option.
-t | --timeout <time>           timeout in seconds for the <count> amount of data to be transferred.
-l | --log-only                 run the commands without performing the data transfer.
-h | --help                     show help

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 scripts/oe-time-dd-test.sh | 95 ++++++++++++++++++++++++++++++++------
 1 file changed, 80 insertions(+), 15 deletions(-)

diff --git a/scripts/oe-time-dd-test.sh b/scripts/oe-time-dd-test.sh
index ccdd55e66e4..df36c0b297e 100755
--- a/scripts/oe-time-dd-test.sh
+++ b/scripts/oe-time-dd-test.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 #
 # oe-time-dd-test records how much time it takes to 
 # write <count> number of kilobytes to the filesystem.
@@ -8,23 +8,25 @@
 # The purporse of this script is to find which part of
 # the build system puts stress on the filesystem io and
 # log all the processes.
-
 usage() {
-        echo "Usage: $0 <count>"
-}
-
-TIMEOUT=15
+	echo "$0 is used to detect i/o latency and runs commands to display host information."
+	echo "The following commands are run in order:"
+	echo "1) top -c -b -n1 -w 512"
+	echo "2) iostat -y -z -x 5 1"
+	echo "3) tail -30 tmp*/log/cooker/*/console-latest.log to gather cooker log."
+	echo " "
+	echo "Options:"
+	echo "-c | --count <amount>		dd (transfer) <amount> KiB of data within specified timeout to detect latency."
+	echo "				Must enable -t option."
+	echo "-t | --timeout <time>		timeout in seconds for the <count> amount of data to be transferred."
+	echo "-l | --log-only			run the commands without performing the data transfer."
+	echo "-h | --help			show help"
 
-if [ $# -ne 1 ]; then
-        usage
-        exit 1
-fi
+}
 
-uptime
-timeout ${TIMEOUT} dd if=/dev/zero of=oe-time-dd-test.dat bs=1024 count=$1 conv=fsync
-if [ $? -ne 0 ]; then
-	echo "Timeout used: ${TIMEOUT}"
-	echo "start: top output"
+run_cmds() {
+    uptime
+    echo "start: top output"
 	top -c -b -n1 -w 512
 	echo "end: top output"
 	echo "start: iostat"
@@ -33,4 +35,67 @@ if [ $? -ne 0 ]; then
 	echo "start: cooker log"
 	tail -30 tmp*/log/cooker/*/console-latest.log
 	echo "end: cooker log"
+}
+
+if [ $# -lt 1 ]; then
+	usage
+	exit 1
+fi
+
+re_c='^[0-9]+$'
+#re_t='^[0-9]+([.][0-9]+)?$'
+
+while [[ $# -gt 0 ]]; do
+	key="$1"
+
+	case $key in
+		-c|--count)
+			COUNT=$2
+			shift
+			shift
+			if ! [[ $COUNT =~ $re_c ]] || [[ $COUNT -le 0 ]] ; then
+				usage
+				exit 1
+			fi
+			;;
+		-t|--timeout)
+			TIMEOUT=$2
+			shift
+			shift
+			if ! [[ $TIMEOUT =~ $re_c ]] || [[ $TIMEOUT -le 0 ]] ; then
+				usage
+				exit 1
+			fi
+			;;
+		-l|--log-only)
+			LOG_ONLY="true"
+			shift
+			shift
+			;;
+		-h|--help)
+			usage
+			exit 0
+			;;
+		*)
+			usage
+			exit 1
+			;;
+	esac
+done
+
+
+if [ "$LOG_ONLY" = "true" ] ; then
+    run_cmds
+    exit
+fi
+
+if [ -z ${TIMEOUT+x} ] || [ -z ${COUNT+x} ] ; then
+    usage
+    exit 1
+fi
+
+echo "Timeout used: ${TIMEOUT}"
+timeout ${TIMEOUT} dd if=/dev/zero of=oe-time-dd-test.dat bs=1024 count=${COUNT} conv=fsync
+if [ $? -ne 0 ]; then
+    run_cmds
 fi
-- 
2.25.1

