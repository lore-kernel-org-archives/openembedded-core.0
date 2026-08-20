Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB8FC5DF82
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 08:19:48 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2487.1787213981875612345
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 01:19:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=o0AHZgJB;
 spf=pass (domain: est.tech, ip: 52.101.84.50, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wdRIyX9SlTS3hEQz1StfDtO/JXvQGg8cKlDSD9BJz1YAYL4+LaLrXMY5KSddaaCGZfqy7cI6sXIL8mJ6m+uVBEbJg8UzHA0E49vWXsKwjYgnkC96ZSyepTGr9UtNmq/g94zue7dyinK2jnohplrMBE+tUWiyqef40Ak5Yi2y/tEFdR+wVTl2Nwlxej7CKc7gznVDfqNZ5tlDu7f0nVclzt++osqM3rUscKCttrT9wK5AzYGVvUOMxd6ZpeAFjsCdG3c/lmmqLzZRDRPUoZJjZvQgv91Cx8N576s6+sDqftX+0D4IlDex/gTfMVFZCmoD5cpflSs1O0WSC1k6BNpOig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PtkIK9a1KXge9UW1JkHLX20maa2Kcm7F3lZKIjD6Tmk=;
 b=RQbcg2yUYbu5egNjVpht64k7EXLIAkCWckphzY/BhjEEedsHTbF3KdyT/Y+11NHZkslJpuubVnSxY1DiPdggsMxwoXUgdqflpq4RoTo71DQ3onKz78XLJmFaYYdnGtuiBizWNO94zPCP3vwdK+UEJuNKzUSOo6cooYGEyaLMX5BxoqazQ5sauuXeKgyXewimxkMO+9k1zHXFB0ahAZAskvAgt4K4fedzLxRba/8Ibm2YiMgr+dM8YDtBdOjVYmN3mOCAaXSmO+9NNmeL4kPSJPpf0YRxye5GUadQ4FNIanpDk73OueCnKEtbfySzdo7MB8KKcN1Ew3ee68gP9rKC8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtkIK9a1KXge9UW1JkHLX20maa2Kcm7F3lZKIjD6Tmk=;
 b=o0AHZgJBzpy3+CnhLqUcEv46t4ckVkbV12expMgEPUnj7N1Kiv8vP1WcXnZXv20x9ZfDS8oEdVOs1JtDIfHqjFfBrSnI1FSLruS3w0FhwyuHEwS6DvwIEJr1BzvVCoxktXWOunsNNaHttKZgcqeeY9XGZDmN5tlC66eA8xGYHrAn0304bCLZodl6DvAFin5ZtTEDLzIqpPiBbZmVjwE+YELD/kdAXkcnFJpRIhc0qDf13FQcZ3ZIcmoeK4UcsaEGpDK8Fj9iSnb6S4YCEUS4DmjVKhln6QFW3y8sLUPpHuTDN7UUGH5cwQsnJgGv/z8KomGOl4rfD28ixr1qCkcN5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DBBP189MB1321.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1f3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.3; Thu, 20 Aug
 2026 08:19:38 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.000; Thu, 20 Aug 2026
 08:19:38 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bind: upgrade 9.20.26 -> 9.20.27
Date: Thu, 20 Aug 2026 10:19:36 +0200
Message-ID: <20260820081936.6040-1-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0327.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18c::8) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DBBP189MB1321:EE_
X-MS-Office365-Filtering-Correlation-Id: 6238d92c-f99c-477d-6faa-08defe93c6a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|12006099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	s9ok4QCK05ov92vQlTcFhsXW9XBYg5hI7e8n9WcJpjlfXYQo5ESuFXOlQk/DgL+XDkyyPKJmR0FTSi8izKyzn5FwPShdIZZRkiXIgqv5jTdvwdfSShJB6SghqCmaR3+2ycUZjOYd917s2Zl3CXZwpF/+Z1g+ylevLMDyBzpt/CTTRjx5RejUPm4d+Q8MyblBJLlQKts/GNFFE51vfzFdUUiDbsSI2TYjvdvKW200hDH+oBm6V6nDl/sXSmrxcBcplcFv4JG2yVwYIuVTUKvQkjK5BEEhlWaoHTLbi7fLe1TQQ6Lz6MQYNj73dqvN7dOh1/zIJhg7yPzMr6VOLY6YpJGjSPIQCYK/nJlIIkoSt00DL22DdLP9cC77JpbFDHphPRwOxcK7YtAYNp7YiGQCfoEFc70acwh1n2SqumVkTEDxu3eUq/TnFyDmNZc9SFgPm95N2D3YJLBw69ssvBImdeFaM7V2PD3zUiPH/JHNSR8upjtevynqNwWUAoUSBYRurIuAIcB27huAHSV5rqCZfJhwGRlvDYPK9BMyiCcaTuF2OWMjF5fZUBPkTsbqWtrwQ0arVx83eueQn6CXZ/fjBikYESp9ZVlc4mujqRs3t+Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(12006099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?whyT/TNrW/WNv6Im94ks0AT+s0tocjznOYjuEIStUIUyQ2ErV85eh8OVHzKf?=
 =?us-ascii?Q?pWIPa8IvCGZQk616dHgvJW+H7D6uBegU0n4PtrGB52lRbSHNftDsjzV182tb?=
 =?us-ascii?Q?lliQoaZfsqa/lowUC4q0U5ZGFksEN6/x5eIcYKji0fayTWQFc6/c+WMKki8O?=
 =?us-ascii?Q?hKT8hRpDLyrnMuP8OCAJ/b9rVleIP41EbA0k2KzwaN/3XyTOZOxOwhYnZ1Fx?=
 =?us-ascii?Q?cTiruVY81ONcqIkcrro8BPy6OrUssJ/XPUaduAw8B4FtG8B9T/i14v8Pj8N+?=
 =?us-ascii?Q?yiEvSXOoSMKLdrcdW2Fp2lLEhF/KVopwgKsqMulN9S5lf2nDMwBg8K80z+1R?=
 =?us-ascii?Q?XQyYPfKIwobk3uq9D6HAU7henlWJQBTuULmxukYbBORjjfhR7KYxbLJSJxV3?=
 =?us-ascii?Q?qpD05M21ZDN/cozdaSz5HPm8yt/zV49KVj6CHcvHPeWP3FHJfOz1xLqrZXvq?=
 =?us-ascii?Q?MpxJU9ytMdOYvapjlSI3HsKgXkAqHchd7TV7/pNdCFqdj/nLEw3QVHB18MyQ?=
 =?us-ascii?Q?93VaNhPRV4DlARhTn/np+X5F9XyAj+YCWxiIXXHT/KJx2oEpHRA0Af0M7DN0?=
 =?us-ascii?Q?uGfCtmtPPzUYacKz4nQ4voLpnXxfy1CnEcR+q9ZcnnQpN0wTL2rmKhe5LYpk?=
 =?us-ascii?Q?02zU+6xM34F7UbrxMexzk8t6mN6ldRx5dKKDyLXYHLJ2si/YMtmKMm/mBLvt?=
 =?us-ascii?Q?UqvFw+Yn+m6ZICY9xD5o/K1cyNgruT8U+Rb8NznxQk+3+TDeDKSWzuTGOWif?=
 =?us-ascii?Q?0wLQ1dWv5MqxSXlWI1f8qG+XZp4yHtIYLGd/DTOjVPYdYrkEZuNuUcm5voBo?=
 =?us-ascii?Q?e2l6kf7Eq2cKHC3r17wwtxw+kaWFkrnDmnm38IcIWEd45X5bDxjg0Xa+ThpK?=
 =?us-ascii?Q?U6tkdZoMKzMrNN2ZqEl3YSEZnHI3G3Fam6Xp0dIUMuo0gou6VFesfo+esKF+?=
 =?us-ascii?Q?+WzJYvz9IiH70fc18nNkrlp2AKXJDZ127hVg/aWc+ZQwL+8BN8emNxcXIWcz?=
 =?us-ascii?Q?pYNfoT0Cq3uX7GOXBEiG1n8pGV+NAYqe/huIsOOm6ewakdgw4GVwawCa9dEh?=
 =?us-ascii?Q?jvxgf1LBwWsRPx6yuNzgyn1SeZY9kCG0c2YqT5FKR0A/csBdjKL1eSjHKpuK?=
 =?us-ascii?Q?QSbUgBCogZ5u+eppwI98ocwthPCAZHjWt+wdO7GKtyKnn4DmAx2gbEhNNMun?=
 =?us-ascii?Q?R3rfuCP0YkROBx2S+764rq1N1CFHcqLRboaK5922WcxKJRyZlZTHNtxu/l2o?=
 =?us-ascii?Q?hf56C/cvtC0M5J46ax+k5nJcEXYlsrKz9KQA7Dcy7028ck0zHReg+0CkRfp6?=
 =?us-ascii?Q?FIHTuOkU4VefMvsQvKcaZ1F4IRO9hVgftCOmLVHxVX4aDKskuyRynkx95eE6?=
 =?us-ascii?Q?FmgWel6w6wn16NcDWMLDLRfihCEM01l6onB7yyx1pdyBh2Nt+c/vy48mVBG0?=
 =?us-ascii?Q?Uwa/VSNbGIEzdz0gEG+MOSPrkV7lCBsPaJkUarGJHlva7u8+4YwRo7GD7ZEw?=
 =?us-ascii?Q?LGHP6OdcRpn4A6HxVSpOo8/dAQcsnLXlrB4JhvSSzd17Gjb5ey8BgZHlfvWQ?=
 =?us-ascii?Q?vITSLl3zsTGxyRlsRagqYfyjx7LwyYfozBse0eIudBXAPZSJ4SAI+wVNXqFa?=
 =?us-ascii?Q?gafgFzH4h37dFeEAJ23AG6nDKmOXzKjt51vhFIe/thme1XExVHr+50Vx/Iwl?=
 =?us-ascii?Q?OiZWFzJqtNuTnDlJy8GGk/VNwWgDKuBECvpnPfH70dT8blewidTOyGpxrPqx?=
 =?us-ascii?Q?Tf5gN9aHLVRzox5TcXnLjkit9Fq1jPo=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6238d92c-f99c-477d-6faa-08defe93c6a0
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 08:19:38.0320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WIIz7+7RHLGSO37GwITd/W47U3HXIN5NfmCLUzDZZEAsjhgPOdQ0LRVI49yqT58HtGgkvtHeNTKHGGZsmgmzdtqlvbP6sImkRD3pjsA7YUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBP189MB1321
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 08:19:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243818

ChangeLog: https://bind9.readthedocs.io/en/stable/changelog.html#bind-9-20-=
27

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../bind/bind/0001-avoid-start-failure-with-bind-user.patch   | 2 +-
 .../0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch     | 2 +-
 ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 4 ++--
 ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 4 ++--
 meta/recipes-connectivity/bind/bind/conf.patch                | 2 +-
 .../bind/bind/init.d-add-support-for-read-only-rootfs.patch   | 2 +-
 .../bind/bind/make-etc-initd-bind-stop-work.patch             | 2 +-
 .../bind/{bind_9.20.26.bb =3D> bind_9.20.27.bb}                 | 2 +-
 8 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-connectivity/bind/{bind_9.20.26.bb =3D> bind_9.20.27.b=
b} (97%)

diff --git a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-w=
ith-bind-user.patch b/meta/recipes-connectivity/bind/bind/0001-avoid-start-=
failure-with-bind-user.patch
index 4bc8b4630c..30da1e9fd3 100644
--- a/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bin=
d-user.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-avoid-start-failure-with-bin=
d-user.patch
@@ -1,4 +1,4 @@
-From cf7537b0ddccefd04dcb82ca470262ce61afb252 Mon Sep 17 00:00:00 2001
+From 7682cbc2fa624fbeeb088736e154090d92c8b524 Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Mon, 15 Oct 2018 16:55:09 +0800
 Subject: [PATCH] avoid start failure with bind user
diff --git a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_c=
c_for_build.m4-macros.patch b/meta/recipes-connectivity/bind/bind/0001-m4-B=
ackport-ax_prog_cc_for_build.m4-macros.patch
index c9dbff3817..f1d8a8e569 100644
--- a/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_b=
uild.m4-macros.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-m4-Backport-ax_prog_cc_for_b=
uild.m4-macros.patch
@@ -1,4 +1,4 @@
-From fa7670386a1643de5b976f6928e42662b968d807 Mon Sep 17 00:00:00 2001
+From a633e336c248ceab41d3182848b65c95e90ef88c Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Fri, 10 Apr 2026 23:33:49 +0000
 Subject: [PATCH] m4: Backport ax_prog_cc_for_build.m4 macros
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-st=
art-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001=
-named-lwresd-V-and-start-log-hide-build-options.patch
index 740d1e98e2..da4057064e 100644
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log=
-hide-build-options.patch
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log=
-hide-build-options.patch
@@ -1,4 +1,4 @@
-From 41901eaecf617abf8f2608e07baa775c75436a15 Mon Sep 17 00:00:00 2001
+From 4b870f60338fe45e036b8a76d47f053338920048 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Mon, 27 Aug 2018 21:24:20 +0800
 Subject: [PATCH] `named/lwresd -V' and start log hide build options
@@ -20,7 +20,7 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/configure.ac b/configure.ac
-index af020f0..f461229 100644
+index 56bca5b..4fd62ed 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -35,7 +35,7 @@ AC_DEFINE([PACKAGE_VERSION_EXTRA], ["][bind_VERSION_EXTR=
A]["], [BIND 9 Extra par
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-=
json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind=
-ensure-searching-for-json-headers-searches-sysr.patch
index 3c7f09d6bd..9adc101247 100644
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-he=
aders-searches-sysr.patch
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-he=
aders-searches-sysr.patch
@@ -1,4 +1,4 @@
-From 6a7536c66832e4d99d7d156256b1a98d9497c7de Mon Sep 17 00:00:00 2001
+From f3736e5535236cf978fd368b6905098ff6e4fd84 Mon Sep 17 00:00:00 2001
 From: Paul Gortmaker <paul.gortmaker@windriver.com>
 Date: Tue, 9 Jun 2015 11:22:00 -0400
 Subject: [PATCH] bind: ensure searching for json headers searches sysroot
@@ -32,7 +32,7 @@ Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.c=
om>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/configure.ac b/configure.ac
-index f47ce7b..af020f0 100644
+index c06a0d7..56bca5b 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -872,7 +872,7 @@ AS_CASE([$with_lmdb],
diff --git a/meta/recipes-connectivity/bind/bind/conf.patch b/meta/recipes-=
connectivity/bind/bind/conf.patch
index 8e82c57035..803456c0b3 100644
--- a/meta/recipes-connectivity/bind/bind/conf.patch
+++ b/meta/recipes-connectivity/bind/bind/conf.patch
@@ -1,4 +1,4 @@
-From 352339af9e6cd9fc03caff09a1b295f26dfadc32 Mon Sep 17 00:00:00 2001
+From 450187e8feac041de02afd4c0c9039cc41e04cb9 Mon Sep 17 00:00:00 2001
 From: Qing He <qing.he@intel.com>
 Date: Tue, 30 Nov 2010 13:35:42 +0800
 Subject: [PATCH] bind: add new recipe
diff --git a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-rea=
d-only-rootfs.patch b/meta/recipes-connectivity/bind/bind/init.d-add-suppor=
t-for-read-only-rootfs.patch
index 73e39002ca..a2c1fbb8f7 100644
--- a/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-=
rootfs.patch
+++ b/meta/recipes-connectivity/bind/bind/init.d-add-support-for-read-only-=
rootfs.patch
@@ -1,4 +1,4 @@
-From 75923521847618392e20fd9abd3245618b77c8f7 Mon Sep 17 00:00:00 2001
+From 582334d31432969be7e10906de7540f1dc64b17e Mon Sep 17 00:00:00 2001
 From: Chen Qi <Qi.Chen@windriver.com>
 Date: Thu, 27 Mar 2014 02:34:41 +0000
 Subject: [PATCH] init.d: add support for read-only rootfs
diff --git a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-w=
ork.patch b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-wo=
rk.patch
index 568e4f2e59..dc1f8f5a9a 100644
--- a/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.pat=
ch
+++ b/meta/recipes-connectivity/bind/bind/make-etc-initd-bind-stop-work.pat=
ch
@@ -1,4 +1,4 @@
-From 0224516d7bd100b6ea7b4fafdd07b42aa96cb0ba Mon Sep 17 00:00:00 2001
+From 50601a7ee8fd19ddbe9a592c57ae6197782d4c2f Mon Sep 17 00:00:00 2001
 From: Roy Li <rongqing.li@windriver.com>
 Date: Thu, 15 Nov 2012 02:27:54 +0000
 Subject: [PATCH] bind: make "/etc/init.d/bind stop" work
diff --git a/meta/recipes-connectivity/bind/bind_9.20.26.bb b/meta/recipes-=
connectivity/bind/bind_9.20.27.bb
similarity index 97%
rename from meta/recipes-connectivity/bind/bind_9.20.26.bb
rename to meta/recipes-connectivity/bind/bind_9.20.27.bb
index 21ffad7bad..e915161d8c 100644
--- a/meta/recipes-connectivity/bind/bind_9.20.26.bb
+++ b/meta/recipes-connectivity/bind/bind_9.20.27.bb
@@ -21,7 +21,7 @@ SRC_URI =3D "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-$=
{PV}.tar.xz \
            file://0001-m4-Backport-ax_prog_cc_for_build.m4-macros.patch \
            "
=20
-SRC_URI[sha256sum] =3D "55248def0f870c4c46b3de72978ea972615131516663188a45=
64dca1d20bf350"
+SRC_URI[sha256sum] =3D "145ab7a50b33a06d9d488b5e668c887e754f42acf8954e2b5d=
c7e238b080e4a0"
=20
 UPSTREAM_CHECK_URI =3D "https://ftp.isc.org/isc/bind9/"
 # follow the ESV versions divisible by 2

