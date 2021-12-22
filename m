Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 919D2C433F5
	for <webhook@archiver.kernel.org>; Wed, 22 Dec 2021 14:13:00 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web09.19645.1640182379265913918
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 06:12:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=p1o97KUj;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id r5so2223709pgi.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Dec 2021 06:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=3iAMEIciJvsrU54nXaUECq6ewOfIWB6ZURxNYHclBX4=;
        b=p1o97KUjdS/lleCknBKj6haTOEuXLdZwmLpPrJTf8bj16TlJKWkO8c85JH8lcxwDid
         CxeL1VkfpacWKaVoKTmaSdkAbvLm9TNyr7mKXJh7TaDw6Ri5m/94Bdahb0rJaX+9HIR+
         TS6W0wGThR49qTPY6xzbfekNCkHuzKPmW4syEu6/0DznzlvyfNSZdDcPh9r4vC/S/T6N
         YqGKCgrTdDa2iysFZQhPOJO2KnlvJ1+y7x3jCXF9XdOLexTDOJqp9IfqECIh30S9BYXm
         2EZqMrxzL6qpFsdZVeiZ3wEYvc3NwY9N8z6v68gt11BGrpGW74aHl9lOpJls9qc4hOC7
         1fXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3iAMEIciJvsrU54nXaUECq6ewOfIWB6ZURxNYHclBX4=;
        b=IanOxtATByReVH0pUAhoAu4GVZulirnC5maU2eRExGE/xJqcS5gCzgSix4aoaG/9Cs
         CW09a7uZrHJO7jq29UAgu+uMtvoQjvZOCFLd29nV5wvfvBy/j2Dzql+GXifOTngJsNHg
         f+niOq7U/lr031hweLtC50nBs7GbImn/WvXc3zdrhaYfXdD+JGnxvJkJxfqJh606tG9E
         EE3mq+vpyrP9PjnmCIEI7yhL4I7bsOG6+525pMoccXCQ4zeabHI2RfcPj6ks0V3q03SC
         P3Uq/53iUMya0daHryvw8VzbtWlnhr+EMNDLG3LUFxIUU5l0sv5WgKgQYTRH33sLEUuM
         Varg==
X-Gm-Message-State: AOAM531E1vfaDWf+YF8iA1aYzBEYCXA66J7v1GY42n9fuOoM+IkGInb2
	Rs/EzZrkKgBxiC6xam6N21r2eeEQy1yyiz6E
X-Google-Smtp-Source: 
 ABdhPJwc986FIX5uUMyprRXilBv1GiI4hsj2KUuv1Xd4Cwc48lBHB/1keg7PoQ/PFyBTo58FadMmIA==
X-Received: by 2002:a65:5c88:: with SMTP id a8mr2898954pgt.542.1640182378136;
        Wed, 22 Dec 2021 06:12:58 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id l6sm902849pfu.63.2021.12.22.06.12.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 06:12:57 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/14] bootchart2: remove wait_boot logic
Date: Wed, 22 Dec 2021 04:12:20 -1000
Message-Id: 
 <058d6f5e6186c136c834fdb1303e28c6b9402ccd.1640181998.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1640181998.git.steve@sakoman.com>
References: <cover.1640181998.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Dec 2021 14:13:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159952

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cc34e3bdedc045baf97ebc2258295d9433cb332e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
index d7827939ca..66bd897a9a 100644
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
2.25.1


