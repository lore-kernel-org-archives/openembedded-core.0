Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 036E2C64EC5
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:02 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web08.38841.1650284852585524106
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 05:27:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ikIJD7Tg;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650284850; i=@fujitsu.com;
	bh=bYPk4s041NBhLDLoOcHv48ACoy+5wWZEEoQ04JuowWs=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=ikIJD7TgnCFyl5pM4a65bHGfJ3LXb1ZXhd2zYsa1cXIkLYSoKT7teU1YInXRlgCxH
	 JGZuklt7K+lLd5p+9RodbeepHLlzxUxvDZwuqITxx89dOKid1Q3NArd4ZO5e9dLsRI
	 e16mL62c/UCPknw2cys6upgYoiX+EMiSZVEJ6H4eYg1mEJ2wU3tZ59vXPfI1NcSI4e
	 4fX4Uw/Vu0u7TbEYTS3Ao14zh8jW7OMq/0gKPTDmblUo4EHMrPnd/jZ0r+lqxum9NS
	 hqhE8RdKmN1s4XgFp8X7BLGOxsdh3A93CsvGprerwHH9GZHznIn6Fk+fk+GRwnq/Qv
	 W/SGXuTYC+G7w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRWlGSWpSXmKPExsViZ8ORqGsUGZt
  k8KVXwOLOz3fsDowe5zauYAxgjGLNzEvKr0hgzZg7w6fgkmhFy45rjA2Ml4S6GLk4hAQeM0q8
  +/WWGcI5zyTxZ/sbKOcAo8Slfa9Yuxg5OdgEdCVe/FjM0sXIwSEioCdx9Z8oSFhYwFLiwKouZ
  hCbRUBV4k/fLzYQm1fAXeLY7R0sILaEgILElIfvmSHighInZz4BizMLSEgcfPGCGWSkhICixO
  zp8hDlFRKvD19ihrDVJK6e28Q8gZFvFpLuWUi6FzAyrWK0TSrKTM8oyU3MzNE1NDDQNTQ01TU
  z0TU20Uus0k3USy3VTU7NKylKBMrqJZYX66UWF+sVV+Ym56To5aWWbGIEhl9KsYPSDsazfT/1
  DjFKcjApifL+941NEuJLyk+pzEgszogvKs1JLT7EKMPBoSTBmx8BlBMsSk1PrUjLzAHGAkxag
  oNHSYS3PwQozVtckJhbnJkOkTrFqCglzvs+HCghAJLIKM2Da4PF3yVGWSlhXkYGBgYhnoLUot
  zMElT5V4ziHIxKwrwxIFN4MvNK4Ka/AlrMBLR4+/xIkMUliQgpqQYmTeG4ud911rtnfPW7l7D
  2t4+Xr4iJ797TstM2HOHVSJ87xyPzlqXDqTN6bb1/JPqjvs/+3vW/bZnMtF2m7Vruhfabpzqf
  7Xj7xzp7pZZW5GmO01/qmLpd7K6pOege+3msmz0qydL1jmXpHMm/KxMZDF+qzUvLmNRfeUYx4
  8ul+Ut/qh3WPNx00ybnyX2l9gu6XhPmKXiydu+wsNaZHJQ8h2VC7sK9z4L/SBpZcS1oZvDoLR
  StTH8arcJ7KTexL7V2a8xZL1HRhyUxm1Kiq3Y8Z28qElLlfsETYtXKwXoy/6wi65ZXE6VmPAn
  69uBk9YYAqdT9x6OW6Wc+u/ok/M2ORQ84bvbFfTBYMVmuzl6JpTgj0VCLuag4EQBmWJ6lOgMA
  AA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-528.messagelabs.com!1650284849!237276!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7930 invoked from network); 18 Apr 2022 12:27:30 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-7.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 Apr 2022 12:27:30 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C2E7510018C
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 13:27:29 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id B65F8100180
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 13:27:29 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 18 Apr 2022 13:27:08 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] sysvinit: upgrade 3.01 -> 3.03
Date: Mon, 18 Apr 2022 20:26:54 +0800
Message-ID: <1650284814-2432-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164599

pidof-add-m-option.patch updated for new version.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../sysvinit/sysvinit/pidof-add-m-option.patch         | 10 +++++-----
 .../sysvinit/{sysvinit_3.01.bb => sysvinit_3.03.bb}    |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-core/sysvinit/{sysvinit_3.01.bb => sysvinit_3.03.bb} (98%)

diff --git a/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch b/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
index 4386e6f832..7e9b9e5432 100644
--- a/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
+++ b/meta/recipes-core/sysvinit/sysvinit/pidof-add-m-option.patch
@@ -1,4 +1,4 @@
-From 96fb53ef2ccd2580cf0aa565ef1629cb05eae50a Mon Sep 17 00:00:00 2001
+From 472f4ed4432e616d25e02cd57b74cbbe41c0e60c Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Wed, 24 Jul 2013 17:07:22 +0800
 Subject: [PATCH] pidof: add -m option
@@ -21,10 +21,10 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  2 files changed, 65 insertions(+), 3 deletions(-)
 
 diff --git a/man/pidof.8 b/man/pidof.8
-index 84ed1e4..ac184da 100644
+index 6866cb3..a87d878 100644
 --- a/man/pidof.8
 +++ b/man/pidof.8
-@@ -25,6 +25,7 @@ pidof -- find the process ID of a running program.
+@@ -25,6 +25,7 @@ pidof - find the process ID of a running program
  .RB [ \-n ]
  .RB [ \-x ]
  .RB [ \-z ]
@@ -32,9 +32,9 @@ index 84ed1e4..ac184da 100644
  .RB [ \-o
  .IR omitpid[,omitpid...] ]
  .RB [ \-o
-@@ -79,6 +80,11 @@ is shown. The default separator is a space.
+@@ -77,6 +78,11 @@ is shown. The default separator is a space.
  Tells \fIpidof\fP to omit processes with that process id. The special
- pid \fB%PPID\fP can be used to name the parent process of the \fIpidof\fP
+ pid \fB%PPID\fP can be used to name the parent process of the \fBpidof\fP
  program, in other words the calling shell or shell script.
 +.IP -m
 +When used with -o, will also omit any processes that have the same
diff --git a/meta/recipes-core/sysvinit/sysvinit_3.01.bb b/meta/recipes-core/sysvinit/sysvinit_3.03.bb
similarity index 98%
rename from meta/recipes-core/sysvinit/sysvinit_3.01.bb
rename to meta/recipes-core/sysvinit/sysvinit_3.03.bb
index 844f5f0175..f6547f237a 100644
--- a/meta/recipes-core/sysvinit/sysvinit_3.01.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_3.03.bb
@@ -21,7 +21,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.xz \
            file://bootlogd.init \
            file://01_bootlogd \
            "
-SRC_URI[sha256sum] = "68b11a4772cdacce5fb65a4cbead324a2ce3999d138b4ff61dc2d59e57ef5793"
+SRC_URI[sha256sum] = "a80418c80828558da9e29208ebbe22d91903d047fd5babdd3cd0eb1fea32d6f0"
 
 S = "${WORKDIR}/sysvinit-${PV}"
 
-- 
2.25.1


