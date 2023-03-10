Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA442C6FA99
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 07:08:37 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.13908.1678432111305638292
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 23:08:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=O6QAf1kL;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1678432109; i=@fujitsu.com;
	bh=FFcThiCvF5ZZxSwulZcJ2RZOjTY4XKuXwa2kUoLp7fU=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=O6QAf1kLFxI+QbhKTdwBlnQjg2gqe5RIJXo8t6Qcqccizar2L9IX0vr4I6Nh8DUda
	 88IAJBsJLrTJbNveOkMuyVjIZJ4dW8b6usxPThNuVRWO48T4hS0Dc6a0Pwl55bP4l+
	 E+YLbniKwoHcF1krUINPBpr0jYNWx99hWfb9U5q3RrS4oAIXczImtg9aK9MU3W3NmG
	 66wtyEGbM8zKKqXydSf1KDItt9KFRT3pOhWKUtQaMNIsL5UV+h+7+B5EdeZwIX1N7E
	 rEWrJ3xKvLb8+a3TETMB/riIUnG8p+/XdmRwvBy/YhKhC2PHRu3TLbs5Kumjg/nYVl
	 XoYORn1g393nA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRWlGSWpSXmKPExsViZ8ORpJtznSv
  F4Pd5Y4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaPlz3emgmbpikWvT7A0MB4V72Lk5BASeMAo
  savduouRC8i+zCTxe0YnM0RiD6PEocemIDabgJTEjfv/2boYOThEBPQkrv4TBQkzC6hIvPjdw
  w5iCwtESnTPfw7WyiKgKrHkXhsTiM0r4CjR+fYNG4gtIaAgMeXhe2aIuKDEyZlPWCDmSEgcfP
  GCGaJGUWL25WYWCLtConH6ISYIW03i6rlNzBMY+WchaZ+FpH0BI9MqRrPi1KKy1CJdQyO9pKL
  M9IyS3MTMHL3EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK3OScFL281JJNjMBATClmfrGD8Uff
  X71DjJIcTEqivMqpXClCfEn5KZUZicUZ8UWlOanFhxhlODiUJHgnXgXKCRalpqdWpGXmAKMCJ
  i3BwaMkwjvvIlCat7ggMbc4Mx0idYpRUUqcl/U4UEIAJJFRmgfXBovES4yyUsK8jAwMDEI8Ba
  lFuZklqPKvGMU5GJWEed1AtvNk5pXATX8FtJgJaPGuLRwgi0sSEVJSDUyGbc+36vyV0c240jd
  75cwu5a81shNOyS5OevXc3WuBopZDxR2RoJ0KW79arnv++duUawdUs5nuPMj9u09k+YRlRYuZ
  5WMfunkuXTa9mIXrflj6G3PmqLqMp19DMm7N/v7ptVjA12Py305+V2H7/TN/T47PxOLVh1Kin
  iXlnTS68v7167smPeZtOQFzy3a4GNoF+PZPC50pfurcM45lwu58lgdqSzq8K4pd216lc+ldkL
  GYcEnLUu9SidO/vbFNmhd/31Vh0G/PEJnOHDq/7MevGl759t26lxo8ea1e1VV9yVed2H9JUdT
  BQPWV1UxH2dqne9RlJTkF/3CdEfVc6vnbk3n61Z+B++pjk9m/qCmxFGckGmoxFxUnAgBcPPQr
  PwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-587.messagelabs.com!1678432108!609945!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2858 invoked from network); 10 Mar 2023 07:08:28 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-17.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Mar 2023 07:08:28 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 723671B1
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 07:08:28 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 66D281AE
	for <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 07:08:28 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Fri, 10 Mar 2023 07:08:26 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH] [OE-core] [PATCH V3] dhcpcd: Fix install conflict when  enable multilib.
Date: Fri, 10 Mar 2023 15:08:15 +0800
Message-ID: <1678432095-8116-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 07:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178307

From: Wang Mingyu <wangmy@fujitsu.com>

Error: Transaction test error:
   file /usr/share/man/man8/dhcpcd.8 conflicts between attempted installs of dhcpcd-doc-9.4.1-r0.cortexa57 and lib32-dhcpcd-doc-9.4.1-r0.armv7ahf_neon

The differences between the two files are as follows:
@@ -821,7 +821,7 @@
 If you always use the same options, put them here.
 .It Pa /usr/libexec/dhcpcd-run-hooks
 Bourne shell script that is run to configure or de-configure an interface.
-.It Pa /usr/lib64/dhcpcd/dev
+.It Pa /usr/lib/dhcpcd/dev
 Linux
 .Pa /dev
 management modules.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../dhcpcd/dhcpcd_9.4.1.bb                    |  1 +
 ...-conflict-error-when-enable-multilib.patch | 46 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch

diff --git a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
index 39e689d2f6..579fa95df7 100644
--- a/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
+++ b/meta/recipes-connectivity/dhcpcd/dhcpcd_9.4.1.bb
@@ -19,6 +19,7 @@ SRC_URI = "https://roy.marples.name/downloads/${BPN}/${BPN}-${PV}.tar.xz \
            file://0001-privsep-linux-fix-SECCOMP_AUDIT_ARCH-missing-ppc64le.patch \
            file://dhcpcd.service \
            file://dhcpcd@.service \
+           file://0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch \
            "
 
 SRC_URI[sha256sum] = "819357634efed1ea5cf44ec01b24d3d3f8852fec8b4249925dcc5667c54e376c"
diff --git a/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
new file mode 100644
index 0000000000..12998aada4
--- /dev/null
+++ b/meta/recipes-connectivity/dhcpcd/files/0001-dhcpcd.8-Fix-conflict-error-when-enable-multilib.patch
@@ -0,0 +1,46 @@
+From 4915a7e52fcea8fe283a842890a1e726b1e26b10 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@fujitsu.com>
+Date: Fri, 10 Mar 2023 03:48:46 +0000
+Subject: [PATCH] dhcpcd.8: Fix conflict error when enable multilib.
+
+Error: Transaction test error:
+ file /usr/share/man/man8/dhcpcd.8 conflicts between attempted
+ installs of dhcpcd-doc-9.4.1-r0.cortexa57 and
+ lib32-dhcpcd-doc-9.4.1-r0.armv7ahf_neon
+
+The differences between the two files are as follows:
+@@ -821,7 +821,7 @@
+ If you always use the same options, put them here.
+ .It Pa /usr/libexec/dhcpcd-run-hooks
+ Bourne shell script that is run to configure or de-configure an interface.
+-.It Pa /usr/lib64/dhcpcd/dev
++.It Pa /usr/lib/dhcpcd/dev
+ Linux
+ .Pa /dev
+ management modules.
+
+It is just a man file, there is no necessary to manage multiple
+versions.
+
+Upstream-Status: Inappropriate [oe specific]
+Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
+---
+ src/dhcpcd.8.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/dhcpcd.8.in b/src/dhcpcd.8.in
+index bc6b3b5..791f2ba 100644
+--- a/src/dhcpcd.8.in
++++ b/src/dhcpcd.8.in
+@@ -821,7 +821,7 @@ Configuration file for dhcpcd.
+ If you always use the same options, put them here.
+ .It Pa @SCRIPT@
+ Bourne shell script that is run to configure or de-configure an interface.
+-.It Pa @LIBDIR@/dhcpcd/dev
++.It Pa /usr/<libdir>/dhcpcd/dev
+ Linux
+ .Pa /dev
+ management modules.
+-- 
+2.34.1
+
-- 
2.34.1


