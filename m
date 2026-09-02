Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D2D5C624D0
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 12:10:04 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.27])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9641.1788344658471707437
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=J/zspAsm;
 spf=pass (domain: bmwtechworks.in, ip: 40.107.57.27, mailfrom: upstream_ip-sh@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xat5LZZOCToKvRE8URZKWmghAv4+l6wap8+cpiaoycGwyjlcwLQhBpWVK7tIsUAhQhPTBFpxa9Uj9MLnb1mTOsZEzBIj5y7ZALzb7B7BTXfd2THz+QtW2DAsOC1pEAd2tb39+AOnR/0IFLLPbJz4v5VImCyYgA4yNZqh+nsUoS+1Oz4y/cjzv96pDtRVa5fdEAxEJdNuoprKiwjBdp4aqbJU8mk3F6CHt53wPqodm9yF/xe5H/+tIyJvSQm7TNA+7jNhjdia+a/YREk9t+Lri5hXzCrVVGf0RNNSkGhDMiT2TSmH6r/hQboeY+HTHgKTcAgcYoY2lp2QndjKeAwwhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xtueBCOgixeyn0D6IEsjz5EFAr0Ou2zHmEpyLlhUhxI=;
 b=FPsVbmWFcdauJh9+aAziNrLhrBU7HvJCr8pBJIjivK7Stk/Bor3uUDUBXI8gr6ecXOqMDHHForJAu9UKrDxKC5rV/moobPggZIfjk4f3qumE0/1xBgxgbCWuZUqS9PQUBU6BZBGvA6RfUGVycsLK4T5025qR1RgAaIVhAGfIdJKVPK8U7gCK+48UBuTxTUEDdD8pkKLUbHq02EPpzv8/zhAImpBkpM2+wQ9UcBBhkFSjRXG9Rj5wAFKSYAdCt6EyWhmdv2Z1IdRSVtWOx/rSu8PHD/2TLuXcIUnnL52X+lb0D18QDLEDbsiZgOG+llh/TZufA+2C3nd657snV6o5Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xtueBCOgixeyn0D6IEsjz5EFAr0Ou2zHmEpyLlhUhxI=;
 b=J/zspAsmSompKurK+oEnEa686+tZHnG9WWpgFBqHQZI6LopI5pJ+gFL2r0/bKQZASfYzmn9J5hU9k8JvWkK+3w/XrIalLSV+C+a5TpiYNMcSZ0/qHq850zLe8uyCtbJ4MznzYWpxLawg17+Vz3JjenVj6o8+SKrq8p30T3ZShgadeBq65sZ/y2lG55AMt64mghOzq/3jdY1HM/rKMLRyk71We9nLd+Dfj+snm3nGqFd2CBa3491C8m6OZcC1nkZFQMOnlyYH/wC3TaaJDTX3ZPQmzsnU58gKh7kEXoi646aTmPYC/ehrjU1gBqDAXNpgKZ2UDLrDp2mh/eUHoqQkSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from MAUP287MB4780.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:1a3::20)
 by PNXP287MB5405.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:291::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Wed, 2 Sep
 2026 10:24:11 +0000
Received: from MAUP287MB4780.INDP287.PROD.OUTLOOK.COM
 ([fe80::bfdd:13d0:6cd2:f14]) by MAUP287MB4780.INDP287.PROD.OUTLOOK.COM
 ([fe80::bfdd:13d0:6cd2:f14%4]) with mapi id 15.21.0382.007; Wed, 2 Sep 2026
 10:24:10 +0000
From: Suresh H A <UpStream_IP-SH@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org,
	suresh.ha@bmwtechworks.in
CC: Suresh H A <Suresh.HA@bmwtechworks.in>
Subject: [scarthgap][PATCH] fs-util: try AT_EMPTY_PATH for access_fd() first
Date: Wed,  2 Sep 2026 15:54:03 +0530
Message-ID: <20260902102403.4010166-1-UpStream_IP-SH@bmwtechworks.in>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: PN4PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:2af::6) To MAUP287MB4780.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1a3::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAUP287MB4780:EE_|PNXP287MB5405:EE_
X-MS-Office365-Filtering-Correlation-Id: f9e8d807-d143-43ce-8e5c-08df08dc542e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|52116014|366016|23010399003|38350700014|10067099003|56012099006|11063799006|55112099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	tsntk1TaLnGON6KprKCbbtjMaiZD0QYSDJa7EGG1k/ggTBpyEG+s/OxzW26J5mTbhMPDtbVtb6N8HQMxxaumLqyLmLlCgSgX9mzXIIMk94OaJXVyy3TPEwO4OXN2FxUArxKxwIC5kClgPCFUsjr6aksACqCYxbc5/E3HbLey0TORNN8kTG6lTQx4pEzdQBE2Vi4nNfih+9MwurXKPz00XQbh90UBsdfmh0H9wmipPqNX+b13tNrTIM4M00TTLr1bd69oBQiX2hn7bCpdqdZIxHn9dq3toZefeteKa9kga+AGE+mULRyKpQg5A2dViLpOC0d7F5cOfX+/lMCbJZhxMgzSFtTWwHFyv5ju9NBjhSmxqSv8NWjZeAD1sGcvOT6CG2tWtoJ/dM3Vnj8InDdT+d/NIC4EA8dmzQwkTzHxXr9mj6iGMZZrQ+SqAD+RDVaqIHz9G2lT7XWXF/92LP18dTcHTV4HaYqr0oWSY0SLZoEzy7IsZ5036HR4jyGTrzNzZsCWoZzfHWMTOmEUzY487Vje9cgeWaknHtq1FuWfeAMCHMKnLFYTr86G90Q5Td/JJczTNfMzObXCCC2CvG8AhAkg9HaOjzSthExMhyc8ifz7O6+Y0ZeTZTKzDU4qL3jb2YUeU6HFEHKLdNJ1k/vW24DkYjObsG7+vy0RBrB3/aY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAUP287MB4780.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(366016)(23010399003)(38350700014)(10067099003)(56012099006)(11063799006)(55112099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SUd60WWOsiAksh0ii5cefED+BGGEc5uSWTbJII0fTXxJS1cIeyTJ9MTcqvW1?=
 =?us-ascii?Q?lF1lFoU8mixDrgVmNi6lxZtzQpeiSsMxsrqHrmp4hqwJKlfIwTBZPVNIB66h?=
 =?us-ascii?Q?iwqFXqes6qNJl4ff7fVE4bCVqH7s6Nlq8pktEPkwTGIaN1u5iAQ/BPCLeWQV?=
 =?us-ascii?Q?eEqYX2bRPUOR5zo7vQvOYSyXqF0Bp5yn6Gbzc+zRgd7Zy3BtzV4zTVahkUA5?=
 =?us-ascii?Q?dcRevfUBxsxd2zcRRbb19gXySPRcGb8qCLozKZPc3XHzewLMyvBriT9Gykg9?=
 =?us-ascii?Q?uf2SbNNTzGAiHthh/wydKpnQhxnRhQxjewHXGgmfduVU6NKm7vf5/lmOv1PF?=
 =?us-ascii?Q?Z6y/VRBmUfogHDilx67qw8SQ5H8TW++3UUR+kH9NQRUMFa3Tt6SRsRkoVM9v?=
 =?us-ascii?Q?IZGL+Xlt8TXqTve5y6KAz+wlm3B2Ka+DcPJSFzPnIYqviEJKCG+BuKDe/0in?=
 =?us-ascii?Q?QXcdy/fk/8ZzIc4ScwyjMWEn+mmOgZTO1QzJsESIlvVz3zBqqg+o/vyL1OE8?=
 =?us-ascii?Q?m+df0y7upe+f8Vor/GipddFf+cixkOPlJDfedbRaTm1I1Mfu7uU6nym0yW3a?=
 =?us-ascii?Q?YpYjNs0pmBt6X+sBppZ35YOq9vCwoIsXP4vLS4aiRGxcXwbymceYkOOvG9UN?=
 =?us-ascii?Q?N1oBDuFIvtAybH3kKCN+bEgoHlF2vhzp4pJMOVmJFdCo6PQjUGHnDtYVSt58?=
 =?us-ascii?Q?fAPqrMvPU/7ke/Uv3sEQjwE68XCAlwHVud/GiDmF6QB6WpL1OfQIaeZAJy2G?=
 =?us-ascii?Q?UbjQaCdfrB1kXTMSyK7QxXzh1wbwkQefT05I4utL0IGXupZYETtLBOxZbIwV?=
 =?us-ascii?Q?PTYK2fqmX7DrkdPV0VOjlhUg+3/PJPV6X7aFb7ZMCbInjcfIivFQ6yfa3IQS?=
 =?us-ascii?Q?nMfaap5qVFl+UQAZkOR8LQaLDxwH0UidoWzOGsdmOOIpy4cT/y0v8tsqu88c?=
 =?us-ascii?Q?vx5ygyvcFTt/n95KJJFrFo1+aEofBHeT8ObXLqc/jIVxBCAfEKLZhoaXzBKq?=
 =?us-ascii?Q?pAr1soVKUocIX1djtIMJmg//bfhXqlpVvY/18cmPigXbRPWrSYrH8IB4rHk/?=
 =?us-ascii?Q?Q9kW6xUOCtfO14HJKjO9++6rjS4HxWPCTXA74XjZOKTgbvumW5ug21z5gzW+?=
 =?us-ascii?Q?fRKmS8CeSOz+bzKYJqj0yqwLBQ3Vg/mVu2h/q9Rn3Uvi8ydyvzDh1FpA3G02?=
 =?us-ascii?Q?K0fp5jYoTBm/ta7YF+NMMag/JjITdVgXFZsDzNmPhho8gCjnoHQ9HLb8Gc4Q?=
 =?us-ascii?Q?fIAlGp6XRfcD0egiEeA1P2ctwdTRz88NQsnHHLLXUk9ruC+SSnGcab+kRjbK?=
 =?us-ascii?Q?PsAlX31/ohCF2YIMcM8mKzDltMsVvVxqe0ikSS0q1L5n0wbixklql+JRuBaG?=
 =?us-ascii?Q?hZmGwb+aTZsyOt6hhVrimuRL1B+lR28A1qFpK62kldaS3z5Wr09Ha5XNWD1y?=
 =?us-ascii?Q?9Gy94ot59rDGfDQ5qgAW3LcsFHeQ3kA9Ik3mJkf7uNTBnVTuU9B2WZtU3UlZ?=
 =?us-ascii?Q?rmapkoqaTGpbBaQrg5v/fyMAeCs0KNr6g1GtVmm8twmnhpAOI00MD5zwfk1A?=
 =?us-ascii?Q?x5jzFPZ5bkAmvPtvVHA1SNSKHZv8/oOBHhHFi2+usXQPcBhrv0pUaKAd5pRR?=
 =?us-ascii?Q?M4XjVAM9VcXUbxgV78RSHJqtyhVxF07in2qQlVxnDQbRTRXdX0QZPIDVkaqh?=
 =?us-ascii?Q?ya4wnRAHvnCbGc56amxB5XSIbl9bKwnv7bM5w+hsOxIMoQpjNq7JT2yxyLtC?=
 =?us-ascii?Q?eKmqN/QNFxuNCPFELZ2zrW8NCDaPx8c=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e8d807-d143-43ce-8e5c-08df08dc542e
X-MS-Exchange-CrossTenant-AuthSource: MAUP287MB4780.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 10:24:10.8959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G/1roCeIfbFp4vb4/boGg8R68Bs4d0JjEmaXq0TGz75x2u5Q7FSNzuqZOPq+Lc2iajLd/bnjaJaa+lOv5mTzEAsckUC0LBVmqjHFbazA4HE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNXP287MB5405
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2026 12:10:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244939

From: Suresh H A <Suresh.HA@bmwtechworks.in>

Backport a fix to try AT_EMPTY_PATH for access_fd() first
Fix is already available since systemd v257-rc1.

Signed-off-by: Suresh H A <Suresh.HA@bmwtechworks.in>
---
 ...ry-AT_EMPTY_PATH-for-access_fd-first.patch | 37 +++++++++++++++++++
 meta/recipes-core/systemd/systemd_255.21.bb   |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0023-fs-util-try-AT_E=
MPTY_PATH-for-access_fd-first.patch

diff --git a/meta/recipes-core/systemd/systemd/0023-fs-util-try-AT_EMPTY_PA=
TH-for-access_fd-first.patch b/meta/recipes-core/systemd/systemd/0023-fs-ut=
il-try-AT_EMPTY_PATH-for-access_fd-first.patch
new file mode 100644
index 0000000000..29dd86c850
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0023-fs-util-try-AT_EMPTY_PATH-for-=
access_fd-first.patch
@@ -0,0 +1,37 @@
+From 55453c9671934fc7ee369788eb0a1a9c8c850e8f Mon Sep 17 00:00:00 2001
+From: Mike Yuan <me@yhndnzj.com>
+Date: Mon, 20 May 2024 19:33:26 +0800
+Subject: [PATCH] fs-util: try AT_EMPTY_PATH for access_fd() first
+
+Upstream-Status: Backport
+[https://github.com/systemd/systemd/pull/32933/commits/c675851d5fd503c1ae5=
d244f041d43ae9e3ab79b]
+
+Comment: Patch is refreshed as per codebase of v255
+
+Signed-off-by: Suresh H A <Suresh.HA@bmwtechworks.in>
+---
+ src/basic/fs-util.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/src/basic/fs-util.c b/src/basic/fs-util.c
+index ee38e0266a..0f65af1a07 100644
+--- a/src/basic/fs-util.c
++++ b/src/basic/fs-util.c
+@@ -664,6 +664,14 @@ int unlink_or_warn(const char *filename) {
+ int access_fd(int fd, int mode) {
+         /* Like access() but operates on an already open fd */
+=20
++        if (faccessat(fd, "", mode, AT_EMPTY_PATH) >=3D 0)
++                return 0;
++        if (errno !=3D EINVAL)
++                return -errno;
++
++        /* Support for AT_EMPTY_PATH is added rather late (kernel 5.8), s=
o fall back to going through /proc/
++         * if unavailable. */
++
+         if (access(FORMAT_PROC_FD_PATH(fd), mode) < 0) {
+                 if (errno !=3D ENOENT)
+                         return -errno;
+--=20
+2.43.0
+
diff --git a/meta/recipes-core/systemd/systemd_255.21.bb b/meta/recipes-cor=
e/systemd/systemd_255.21.bb
index 9c5f8af240..b6e75d42b0 100644
--- a/meta/recipes-core/systemd/systemd_255.21.bb
+++ b/meta/recipes-core/systemd/systemd_255.21.bb
@@ -33,6 +33,7 @@ SRC_URI +=3D " \
            file://CVE-2026-40225-02.patch \
            file://CVE-2026-40226-01.patch \
            file://CVE-2026-40226-02.patch \
+           file://0023-fs-util-try-AT_EMPTY_PATH-for-access_fd-first.patch=
 \
            "
=20
 # patches needed by musl
--=20
2.43.0


