Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC1DC433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 05:48:59 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web12.7915.1639374539070085357
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Dec 2021 21:48:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1BD5mtJp026900
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Sun, 12 Dec 2021 21:48:55 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1BD5mtUB002177
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 12 Dec 2021 21:48:55 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 12 Dec 2021 21:48:54 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 12 Dec 2021 21:48:53 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <alex.kanavin@gmail.com>
Subject: [PATCH v2] bootchart2: remove wait_boot logic
Date: Mon, 13 Dec 2021 13:45:28 +0800
Message-ID: <20211213054528.36886-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: 
 <CANNYZj-fLHHvP1HmHTr00Gfp7TF5S=5DnUfCUZ07P9cC0E0=OA@mail.gmail.com>
References: 
 <CANNYZj-fLHHvP1HmHTr00Gfp7TF5S=5DnUfCUZ07P9cC0E0=OA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 05:48:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159611

From: Mingli Yu <mingli.yu@windriver.com>

When boot with "init=/sbin/bootchartd" as below:
 # runqemu qemux86 bootparams="init=/sbin/bootchartd"

There are two bootchartd process after boot [1].
 # ps -ef | grep bootchart
root       101     1  0 03:27 ?        00:00:00 /bin/sh /sbin/bootchartd
root       103   101  8 03:27 ?        00:00:02 /lib64/bootchart/bootchart-collector 50
root       106     1  0 03:27 ?        00:00:00 /bin/sh /sbin/bootchartd
root       792   106  0 03:27 ?        00:00:00 /lib64/bootchart/bootchart-collector --usleep 1000000
root       794   725  0 03:27 ttyS0    00:00:00 grep bootchart

 # /sbin/bootchartd stop
[bootchart] bootchart-collector started as pid 596 with 2 args:
[bootchart] '--dump'
[bootchart] '/tmp/bootchart.3lXpVDAq3v'
[bootchart] Extracting profile data from pid 204
[bootchart] map 0xbed9a000 -> 0xbedbb000 size: 132k from 'bed9a000' 'bedbb000'
[bootchart] read 135168 bytes of 135168
[bootchart] reading 150 chunks (of 150) ...
[bootchart] wrote 18760 kbB
[bootchart] bootchart-collector pid: 596 unmounted proc / clean exit

But there still one process exist after the above stop command finish.
 # ps -ef | grep bootchartd
root 202 1 0 09:09 ? 00:00:00 /bin/sh /sbin/bootchartd
root 629 516 0 09:10 ? 00:00:00 grep bootchartd

Remove the wait_boot which used to wait the boot process to finish to
make sure only one bootchartd process and meanwhile we don't need the
wait_boot logic because we either use "/sbin/bootchartd stop" to stop
the bootchartd manually or install package bootchartd-stop-initscript
altogether with bootchart2 to stop bootchartd automatically after boot.

After patch:
 # ps -ef | grep bootchart
 root       101     1  0 03:36 ?        00:00:00 /bin/sh /sbin/bootchartd
 root       103   101  6 03:36 ?        00:00:04 /lib64/bootchart/bootchart-collector 50
 root       596   592  0 03:37 ttyS0    00:00:00 grep bootchart

[1] https://github.com/xrmx/bootchart/issues/94

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...ake-sure-only-one-bootchartd-process.patch | 68 +++++++++++++++++++
 .../bootchart2/bootchart2_0.14.9.bb           |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-devtools/bootchart2/bootchart2/0001-bootchartd.in-make-sure-only-one-bootchartd-process.patch

diff --git a/meta/recipes-devtools/bootchart2/bootchart2/0001-bootchartd.in-make-sure-only-one-bootchartd-process.patch b/meta/recipes-devtools/bootchart2/bootchart2/0001-bootchartd.in-make-sure-only-one-bootchartd-process.patch
new file mode 100644
index 0000000000..3cb8a3c2a2
--- /dev/null
+++ b/meta/recipes-devtools/bootchart2/bootchart2/0001-bootchartd.in-make-sure-only-one-bootchartd-process.patch
@@ -0,0 +1,68 @@
+From 988ca784d4840c87509e770a21d5d22105af8668 Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Fri, 5 Nov 2021 11:18:07 +0800
+Subject: [PATCH] bootchartd.in: make sure only one bootchartd process
+
+When boot with "init=/sbin/bootchartd" as below:
+ # runqemu qemux86 bootparams="init=/sbin/bootchartd"
+
+There are two bootchartd process after boot [1].
+ # ps -ef | grep bootchart
+root       101     1  0 03:27 ?        00:00:00 /bin/sh /sbin/bootchartd
+root       103   101  8 03:27 ?        00:00:02 /lib64/bootchart/bootchart-collector 50
+root       106     1  0 03:27 ?        00:00:00 /bin/sh /sbin/bootchartd
+root       792   106  0 03:27 ?        00:00:00 /lib64/bootchart/bootchart-collector --usleep 1000000
+root       794   725  0 03:27 ttyS0    00:00:00 grep bootchart
+
+ # /sbin/bootchartd stop
+[bootchart] bootchart-collector started as pid 596 with 2 args:
+[bootchart] '--dump'
+[bootchart] '/tmp/bootchart.3lXpVDAq3v'
+[bootchart] Extracting profile data from pid 204
+[bootchart] map 0xbed9a000 -> 0xbedbb000 size: 132k from 'bed9a000' 'bedbb000'
+[bootchart] read 135168 bytes of 135168
+[bootchart] reading 150 chunks (of 150) ...
+[bootchart] wrote 18760 kbB
+[bootchart] bootchart-collector pid: 596 unmounted proc / clean exit
+
+But there still one process exist after the above stop command finish.
+ # ps -ef | grep bootchartd
+root 202 1 0 09:09 ? 00:00:00 /bin/sh /sbin/bootchartd
+root 629 516 0 09:10 ? 00:00:00 grep bootchartd
+
+Remove the wait_boot which used to wait the boot process to finish to
+make sure only one bootchartd process and meanwhile we don't need the
+wait_boot logic because we either use "/sbin/bootchartd stop" to stop
+the bootchartd manually or install package bootchartd-stop-initscript
+altogether with bootchart2 to stop bootchartd automatically after boot.
+
+After patch:
+ # ps -ef | grep bootchart
+ root       101     1  0 03:36 ?        00:00:00 /bin/sh /sbin/bootchartd
+ root       103   101  6 03:36 ?        00:00:04 /lib64/bootchart/bootchart-collector 50
+ root       596   592  0 03:37 ttyS0    00:00:00 grep bootchart
+
+[1] https://github.com/xrmx/bootchart/issues/94
+
+Upstream-Status: Submitted [https://github.com/xrmx/bootchart/pull/95]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ bootchartd.in | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/bootchartd.in b/bootchartd.in
+index 7979ef9..f0e466d 100755
+--- a/bootchartd.in
++++ b/bootchartd.in
+@@ -183,7 +183,6 @@ if [ $$ -eq 1 ]; then
+ 	else # running inside the main system
+ 		echo "bootchart: no initrd used; starting"
+ 		start &
+-		wait_boot &
+ 		# wait a little, until the collector is going, before allowing
+ 		# the rest of the system to charge ahead, so we catch it
+ 		$USLEEP 250000
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
index 59fcd8c78a..87f7631ddc 100644
--- a/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
+++ b/meta/recipes-devtools/bootchart2/bootchart2_0.14.9.bb
@@ -94,6 +94,7 @@ SRC_URI = "git://github.com/xrmx/bootchart.git;branch=master;protocol=https \
            file://bootchartd_stop.sh \
            file://0001-collector-Allocate-space-on-heap-for-chunks.patch \
            file://0001-bootchart2-support-usrmerge.patch \
+           file://0001-bootchartd.in-make-sure-only-one-bootchartd-process.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.17.1


