Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C654CD98CC
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 22:55:30 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33650.1781132122556898808
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 15:55:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=tXCkEekx;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45eecb8bf67so5522830f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 15:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1781132121; x=1781736921; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=biOOKaSpP1axSAEHd4Rouxb3Y67H0yYor+yDdR1BZcM=;
        b=tXCkEekxTQP9yYMOi41HqPotwFZK4OsghlcJojKRukOmtlTqoQ6LM3BKTErrLiFMz/
         Q5jYqslnS9oZSw2Pzq61bClTB9lDi+E7HyoHjdYNHyUc20bzOXxCHWgtfvmxMYgBwhRX
         MkGKKjrq9X4BGk7m+BM4f6vW8VXwCyHbK/+Yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781132121; x=1781736921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=biOOKaSpP1axSAEHd4Rouxb3Y67H0yYor+yDdR1BZcM=;
        b=flz+JXVRjj3sviDTg4UwHOoTX7ecUlMWxIxC5HC1tv/QE5beh3a0ycDZhNANfILugC
         HzXIREzKz/3PNgHvWmfuugFvUJydIAHhJglgv0XWBB8Dhco51IF3dU1clIpajNhbC6P7
         Cdv3qugSz3IY7Sh7pmHY4AHLH9SbpzVkNki8/PBsShWh4mbDMJ0hgELvi7lSUEob9Zjq
         cDddLZN23bje8AcOfjjyqTFnlbC0bjtexeZQ4m5MM88eQnf7wRxJKCKSLxG5SxO71p9S
         jMThalb3Z55fTTDZImw3QENjiNXNaAwgOUoUoGXwetuK29hZheakK/BWngPr149NDqXi
         yqzw==
X-Gm-Message-State: AOJu0YyW7hjpdXQah4P9AIxfQmHl5hSyoSagNVLXel/IsL9QeAIngEIS
	lXSidnAk7gHLth9yo3TaQPWwhzaXSsZ2zRKGctGrA1NGceYoErWmQ7BSHNM9z8x6hZg1MVUQ6pb
	QqQAX
X-Gm-Gg: Acq92OGB2+WgBJj68Z3tNMPF1Ep8sVKR2WFvWH6NEnnqgFnItSxsHLnhZJ5UzdWS1OJ
	luI2P2a8d9mP46p6dA2eJu+0RLJD50z0q5RebNoPHsx1PjS7yVxi9D9VKJMxdw5aTs+PMf8P2Tr
	0xWLp4HjTK6UzeRRolkSO2gb2+S0FhMSbTrMjnQZDpNQyCIdfFZY52Hld2zB/2BlaHf9b9a32ql
	l1ZxB3MxuOraYC5EqQILFi12oR4ABTav5Fzbxlbye4m/1vgdpxtzEP7tDCNnCeNbUEvFr+XQOOP
	1WRDYDGpFVB4uHG9mhuYbpTR9w7mtabaHW0KKHorCacTkJ3glBWbqNZ0bbrxHdYCPJ+qjPRpCNZ
	MlI06mtvB02budWUDnZIJbHkry0J3gVXP+9WyKGI9lfCj7TOovolR4R1VMT6W5vCkJ3XDeDQ5Zy
	3Ko3plT1SsJ4O2Lzn7GxYDCvtqx5aopYaxK4aqUTUknVd9s04XC8rFwJvolaRnyE2HeWZznib5w
	Bl5gvoq9W37DHFnZ4ILv4VhOfC/hwwWvHo9wxQ=
X-Received: by 2002:a05:6000:2409:b0:460:18cc:dcfe with SMTP id ffacd0b85a97d-460677dadfdmr252486f8f.34.1781132120979;
        Wed, 10 Jun 2026 15:55:20 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00bb749f54eeb85d7b.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:bb74:9f54:eeb8:5d7b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm71599304f8f.19.2026.06.10.15.55.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 15:55:20 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 09/21] cups: fix CVE-2026-39316
Date: Thu, 11 Jun 2026 00:55:00 +0200
Message-ID: <edbd628efd14cbc829d3176e908f1bb97f213e81.1781132051.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1781132051.git.yoann.congal@smile.fr>
References: <cover.1781132051.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 22:55:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238405

From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>

In CUPS versions 2.4.16 and prior, a use-after-free
vulnerability exists in the scheduler when temporary
printers are automatically deleted. The function
cupsdDeleteTemporaryPrinters() in scheduler/printers.c
calls cupsdDeletePrinter() without first expiring
subscriptions that reference the printer, leaving
cupsd_subscription_t.dest as a dangling pointer to freed
heap memory. The dangling pointer is subsequently
dereferenced at multiple code sites, causing a crash
(denial of service) of the cupsd daemon. With heap
grooming, this issue can be leveraged for code execution.

Apply upstream fix to expire subscriptions before
deleting printers, preventing dangling pointers and
use-after-free conditions.

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2026-39316.patch            | 42 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-39316.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index a12965bb6e5..194b9c2638f 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -20,6 +20,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-34980.patch \
            file://CVE-2026-34990.patch \
            file://CVE-2026-39314.patch \
+           file://CVE-2026-39316.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-39316.patch b/meta/recipes-extended/cups/cups/CVE-2026-39316.patch
new file mode 100644
index 00000000000..c8d7e10ac2e
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-39316.patch
@@ -0,0 +1,42 @@
+From 0142eeb58e0d718b7d2e1f0d5dd214bd2192cc7f Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Sun, 5 Apr 2026 11:33:23 -0400
+Subject: [PATCH] Expire per-printer subscriptions before deleting.
+
+OpenPrinting CUPS is an open source printing system for Linux and other
+Unix-like operating systems. In versions 2.4.16 and prior, a
+use-after-free vulnerability exists in the CUPS scheduler (cupsd) when
+temporary printers are automatically deleted.
+cupsdDeleteTemporaryPrinters() in scheduler/printers.c calls
+cupsdDeletePrinter() without first expiring subscriptions that reference
+the printer, leaving cupsd_subscription_t.dest as a dangling pointer to
+freed heap memory. The dangling pointer is subsequently dereferenced at
+multiple code sites, causing a crash (denial of service) of the cupsd
+daemon. With heap grooming, this can be leveraged for code execution.
+
+CVE: CVE-2026-39316
+
+Upstream-Status: Backport [ https://github.com/OpenPrinting/cups/commit/0142eeb58e0d718b7d2e1f0d5dd214bd2192cc7f ]
+
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+---
+ scheduler/printers.c | 6 ++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/scheduler/printers.c b/scheduler/printers.c
+index 4aba6241c..50778b89a 100644
+--- a/scheduler/printers.c
++++ b/scheduler/printers.c
+@@ -644,6 +644,12 @@ cupsdDeletePrinter(
+                      update ? "Job stopped due to printer being deleted." :
+ 		              "Job stopped.");
+ 
++ /*
++  * Expire subscriptions on the printer...
++  */
++
++  cupsdExpireSubscriptions(p, /*job*/NULL);
++
+  /*
+   * Remove the printer from the list...
+   */

