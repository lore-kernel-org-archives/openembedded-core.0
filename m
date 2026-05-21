Return-Path: <tgaige.opensource@witekio.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CD6FCD5BAC
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 10:10:48 +0000 (UTC)
Received: from mx-relay151-hz1-if1.hornetsecurity.com (mx-relay151-hz1-if1.hornetsecurity.com [94.100.128.161])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33231.1779358243993056870
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2026 03:10:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@witekio.com header.s=selector1 header.b=cf2jJ9cA;
 spf=permerror, err=parse error for token &{10 18 spf.hornetsecurity.com}: limit exceeded (domain: witekio.com, ip: 94.100.128.161, mailfrom: tgaige@witekio.com)
Received: from mail-swedencentralazon11023073.outbound.protection.outlook.com ([52.101.83.73]) by mx-gate151-hz1;
 Thu, 21 May 2026 12:10:41 +0200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gl8vPrJD70wSKePAODJkuVeIcSsGN6iAGV/x5e5x2SQVzJaZ397FEgephHetgIP8LlFMmhzBc8MGWCKhf6cIxI/NDX1GMJLw6C0ishhijIv5f9SqNUazfT0o6uAYGCo2CQQM2ClfMjekwesfQvJWJxix8EARPfO2O79A8OAri5Pasz1gun/zMGCNlKK1rGhnq9JRn8PqkXC3dsnErP6GHi3BZEasJ1D2dsKzLLvNLLsbeIswN3ObfD2anAc6jTTekg2FcLHv84tQeeGVo+mD5SVEa8LygpUB1LBUrzoNceO/nfjiCIf5P7dBzLi26v/SyDZmTN8mm6MCN4dtN8inPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZZezxMPqtSKci3R+aM2Py31yeIsHAMtPyLuxQZ1Jy4=;
 b=OTXOnFFB7iobzVZWL4zX4Q+cCO/wK/3WLbNAuXrUidL9hW/XCr51FFZ+5gA454U3VD3a0H5PhDNK/09iPw+brObEqVz2yFJOXKzbNm4X5ULeaKgf8b/LsqRCmSh1aswlkGfi/stwsXBooOuq7DhswjTUeIPjcjiptORR2X1jwdcTZtWmmMbWtKa6WxTo3TZFT/nQ9TM6CQiUvDW0AeKd3kH0HFW2xJhfrYgXNVMCyynplt0882saLXHDj/qCR9066PW8bTpH50qMEXYW3cdk9EuPLWt8zxB6vDs6+s2jD3sQmEwMNMNeT3mc8eMOd9oKTJdk1QCxMQMLVIDtJyFMeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=witekio.com; dmarc=pass action=none header.from=witekio.com;
 dkim=pass header.d=witekio.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=witekio.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZZezxMPqtSKci3R+aM2Py31yeIsHAMtPyLuxQZ1Jy4=;
 b=cf2jJ9cAPPXNgwa0b9jXmAz2jtMcGi+M9Gu5Aq4G6cIUJu1/+AznzXj12xJDLWfP7c1m/00Wh1pszL38L2TOVfKwXXu2x/gHzuNoV6/4p3N8+tVeZYs1xAjP4kdkghA1xfTnT/clCJIrDexMFWlr38wHWjP7aoBEvZfHvrdqQOfhSOPHW9gn8Aigap45bZfMbTbRd22NoOktlcR3EWbDeNci9IlD7XBvhmIGV7f7+IO2w7C15OgAexIQ1z0FvSk95K5O91r5/t6PHrj7UZr2opdrkzrpjBFWxXvcKwzFBPAD4+j9LqFdwogptMOHRnA91k9XIPZjo8h5oMAdnItopg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=witekio.com;
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:3ad::23)
 by AS4P192MB1672.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:507::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 10:10:17 +0000
Received: from AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38]) by AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 ([fe80::25ed:86ef:4d24:3d38%5]) with mapi id 15.21.0025.023; Thu, 21 May 2026
 10:10:17 +0000
From: tgaige.opensource@witekio.com
To: openembedded-core@lists.openembedded.org
Cc: hsimeliere.opensource@witekio.com,
	"Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>
Subject: [scarthgap][PATCH 14/14] go: patch CVE-2026-42507
Date: Thu, 21 May 2026 12:09:47 +0200
Message-ID: <20260521100949.1299757-14-tgaige.opensource@witekio.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521100949.1299757-1-tgaige.opensource@witekio.com>
References: <20260521100949.1299757-1-tgaige.opensource@witekio.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0104.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::19) To AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:3ad::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9P192MB1396:EE_|AS4P192MB1672:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bd37f21-7c7d-4c8c-e1de-08deb7212865
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|13003099007|22082099003|18002099003|56012099003|38350700014|3023799007|5023799004|6133799003;
X-Microsoft-Antispam-Message-Info: 
	N4Zzdtt1fJzAMMsB4hCWKsNJIqGzpv8kCVYgzG3TexXKWsOygglGnXumZZ3WEq2+BCIoTpJon8LWo5qFmZUYTV9Zg8svMkH7AH3GNRg2WszhhHTV7kcrdYkzPFk5/VqxML0xmoSOqn71zqIYCKWo7fyikL2GUMDJyX6fsXbzI6oycHvVdz6qGW3jsFHOTiUvQ/eHW/hcnTkgOo+0DdtDMjU+CgVFh2J3h7GZfnynQAlLZYMSxdLPYnUbSSZjZ2QbZX141XcUl1RAtjMktlnAlVwqEiz71ah6ecjR4/+n2rpYG8fMVPgu6MeFyYxuzM0q3xGALItk/CcRZ5M849GocXrD89UTs+Fih98mHKM8GsJ6JFSh1mb2CzuDTQEMw2Rp3MXPP9m5zSPkXSX5URhmlcQDVKdaRuaSvdpREFacof5VuLtPJlJCY9uXjBYyGY7ALqquu4VH6SlKWm9peb+IyXP+99nr/3SrxXYu0T7geEbKplXFCopJm0OrsUjtkv5Y32CXFNQmGEsBFdeJRK5LgTyn9AStrRUnRyZl1zmHbjXBtL/oa/FqaHDH3Et8FCsYl1rXv3RMn37CWc2PlxZY5oogem3MAa2T7TtNeTS79TcHMrzb8Y1X4tp9EJ8vM3S2YDZlrVyafPyBUkOq6Z7oq9yM2FiZicflhE5wO+j1TOsX6GU+6g5LDglc727BsGoq
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9P192MB1396.EURP192.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(13003099007)(22082099003)(18002099003)(56012099003)(38350700014)(3023799007)(5023799004)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LMIMAK7rqaKdF98KQ+5uLoxLmsmZtjonKjb9JjK4wR5NwFJlY5nCR+MUGZR/?=
 =?us-ascii?Q?yZSr4k0oxv/le6UlJJfUBCEyZRYR3N8wf2qhE/0s7uXblED1k9kBFULgVuiB?=
 =?us-ascii?Q?wqz7a7J0rA5pMo6WKMVofYPVaDBRPrMksooxkn3XI7IciottPGCK9MqmsZqd?=
 =?us-ascii?Q?I4ZankcYeWuKqqu9l6SeIK/7Dzoh3tcMrrXGh6l48LzjgVZBLshGsQh5s4Te?=
 =?us-ascii?Q?TN1hXeeBfGL57+Te1k0HpdJu9KHg/pWBcfa7w+KwqEI2K8ZGLrogq8lrhxVa?=
 =?us-ascii?Q?nE1LZEbDwOCqwNVJ/2mUTA+9832eE2pd9Vw8Mt5Hz0qFPIY0OT95G7t2rBa5?=
 =?us-ascii?Q?Zt4eAVWUcYc3wBye7QzNUSVMwp1ePmqHU8saVCiRTte6fEoQksywdktjWnWN?=
 =?us-ascii?Q?TIF6Ewa5psc3E/S6+b+tHzdgmg9TPmtrqER+i9lvIszYvGkWQmgVtrUHFV9U?=
 =?us-ascii?Q?dnbgimeFzg6Ry6eF8Id1C3QyxPlbxImXJ7S8h0IgRiE/08TS2vwOHCF+FFmT?=
 =?us-ascii?Q?4Rc7EKVc5oSgeGqnw41XZs21tNqnVAgHHut2aHAOz3JagGG+Bxlc/LI7KY1S?=
 =?us-ascii?Q?+LVdeJs7PKQBt6RKhNHqfxGMxENSgsZNsRNwW0T3SkJE2YhNjMuKo3aMmxCN?=
 =?us-ascii?Q?evxIk6J0SQtz3aWNv1bhrAfkdyhfvuMlVXW4pPsFKKIU3R10I2yNyhhqmOQl?=
 =?us-ascii?Q?0gQ1oTyvJiZdnSurvd4sKXqgIc3Rp9jvQVsgIQVUIvHmWvpqnfVbgutx1Pgr?=
 =?us-ascii?Q?WFeWr+d+U0YrdBap10nfy01guNdY8wYhQnKBpJHYVPvdS2Rd9N6H06L1lIoR?=
 =?us-ascii?Q?Htpm64Tq62iWSO37Hyvch5dOHzkbji7qxV9QtmYlwwXjFYkuWVXEqZlFmRy0?=
 =?us-ascii?Q?WXi7otQAohqrLYBGDirlgjKQNMA31KkhbZiQfv1XVP4tLgB/3CU0xTVU7DaD?=
 =?us-ascii?Q?ziO1iQG8LWB7Ej/Ol/DL+ra8E/ee17bBWsBO+Xg+XULFvzab7dUlLg0Ks+eF?=
 =?us-ascii?Q?5m0BGc1KB3muOTqzdvkYxlYxjpRAsFSWG8EwGEEHhQuOcnCZ4NewllxlfRyS?=
 =?us-ascii?Q?QAJST7YG+G1ypeR0CJ0b2bcwjMcouVKpq6rfbVt5Urvbi1iZX6+pTwLbREoX?=
 =?us-ascii?Q?wTpp+Td0K4ACeRr81lhVY6iPoxIe6KXBJB0K58Jd+VQQUHlugZ9zjpV8knPc?=
 =?us-ascii?Q?f0whUk6oTuF3EjXlZmcPWGb6Z3AmZw1vA9ZmSjmvDLbxrvSB2caqjqaa429B?=
 =?us-ascii?Q?j2sXQr/elWbRIf6TspkRau1PEdAW020gCAhuSOajzTFKOJ9kx5/rHbXaRqpG?=
 =?us-ascii?Q?HAqGCQad3nOgXL2/29Hdn7uXCJN84IkLfXfuE8tlDNYxWL21G67GM866qeBj?=
 =?us-ascii?Q?vDtMKI2JmgLapLiP5yYhyI4hmxda9g3sdbwUQPJKK0JeJU1MNWsxDfzsT+AD?=
 =?us-ascii?Q?y336Oq8/VRYSNjVpqKMzECk0cCcAsw/AOHouFHCSMcqYsSQua5/Gll8GvBqN?=
 =?us-ascii?Q?BRwBri0vri1FKzvRlo6wS9iHss8bb7YW520I+0YUE5HFvmAcB2Qj7xSM8Q0v?=
 =?us-ascii?Q?iYmv2ys+NHhhWTF4uZ0Wh5wCFpoyGxcvMvvRxCSDp5FoMivVXFraDoGReKSI?=
 =?us-ascii?Q?bsMnLjKPU45cIuGKhMmU/b8ioxKYvabqjCoYbMbPdxbDTpsVo5pp+rmMZpT/?=
 =?us-ascii?Q?culJaVdloMCoJhztUpVCO6dJAq6G24nwNBKqo5h5DspGER1mddxlGAIseIak?=
 =?us-ascii?Q?EewTzbbHRw=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	kVzXNHI5uuhuExqbSw/Mxy6jG86ssClM+UfnC5sDX8TKfRrBL/06SZ6i7aE8d0pSbaIipUtJVWs23Kdm+Lp8gpTRWQva15laqe1mYDKivNFLW6Br+ButJqaAAM0TOC2iV6NvQOVYxMs6fmftkzd80cjXYwZjjzN63xMVTYFIqnszZaxeFMHaixGybq0xXFfxz849ZOByl8svdIPajvrG+JK9e7N7d+Zm8XQhsqoYpxI9UwrGolBt+iCgUvvVkswKuWgqzz4Q3gUT95RcqYKlz2bjXoXh/ASJAPfQcsDfjKlPhj6p4GKH6IJAQeaTwv0opoDUE1WV/8wTGE1vvz9pBA==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	Uhgp1WdY/3QGgAtAC7DUzEvnXHmy/5qeTVAfVpnL9vEf7jGiaijXAbj/J8WOSZtYK9LYedG2kSLWKkg8xUizlDMon4RJxgCZij3FO0SZKXgLnQ5apaBZFdxH1FB4xvOCP89y7luFZJvoEZL8uPM4upgTGu9JEKB9wNIF3LfGV6/iUddG6OpNLUX0J3D33fAAC6RqVha5WwUsVTo5QM5S+pK1mD9eG64F/XO+N5TumcaF5Fet/hM0hMM0ha7pwWnQWJorwcrbPDK7OudCf6qvgFlHGjuVB6iEJ9kilOIvscuMLucElt7pkMa9jrUeB35xSTrYOhxuPj54rKvGwkQU1A0sO1hVccuXFIZ0qQQXAXHRlg1SSD93brDtc6eUFgl7o/IgMOboalDTyIXLM0vQROKI1q6XLPejCbTLvHvK+2VgefA0doDlDzjBCXgk6HVdc2GhLi6XoVA8fpKoz5hPWRAxNTP646pH0PdZwIhTNQwVsuqoO83B5RXdXCT4UfaxYFF5Ep6IDjgOVa9oi+IP3OvG4LPBm+ROvFi4/zvHbn/EPgwLhUQDjmcq0Ax/5UPTu11Y5TUsegTlXtXO4+gkOLlnFwjBhnEpnGYktpdZHMtAIxVDcKvVEG+qOzHSAGTu
X-OriginatorOrg: witekio.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd37f21-7c7d-4c8c-e1de-08deb7212865
X-MS-Exchange-CrossTenant-AuthSource: AM9P192MB1396.EURP192.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 10:10:17.3680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 317e086a-301a-49af-9ea4-48a1c458b903
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9MDart5YnlBrAwVzZSAKSE090zNEsgfMdgEckXkP10QCTEfGbGi3Tt9I9x8tWtBeYnalnbBBCPN16t/gQgl6AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P192MB1672
X-cloud-security-sender: tgaige@witekio.com
X-cloud-security-recipient: openembedded-core@lists.openembedded.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: tgaige.opensource@witekio.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-gate151-hz1 with 4gLkgZ1Pttz1g0t8
X-cloud-security-connect: mail-swedencentralazon11023073.outbound.protection.outlook.com[52.101.83.73], TLS=1, IP=52.101.83.73
X-cloud-security-Digest: 6d58408559a3c326a9afc74bd48fcc13
X-cloud-security: scantime:2.811
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 May 2026 10:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237497

From: "Theo Gaige (Schneider Electric)" <tgaige.opensource@witekio.com>

Backport patch from [1]

[1] https://go.dev/cl/777060

Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
---
 meta/recipes-devtools/go/go-1.22.12.inc       |   1 +
 .../go/go/CVE-2026-42507.patch                | 160 ++++++++++++++++++
 2 files changed, 161 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/CVE-2026-42507.patch

diff --git a/meta/recipes-devtools/go/go-1.22.12.inc b/meta/recipes-devtools/go/go-1.22.12.inc
index ba4fe9a734..f67da3e078 100644
--- a/meta/recipes-devtools/go/go-1.22.12.inc
+++ b/meta/recipes-devtools/go/go-1.22.12.inc
@@ -54,6 +54,7 @@ SRC_URI += "\
     file://CVE-2026-42499.patch \
     file://CVE-2026-42501.patch \
     file://CVE-2026-42504.patch \
+    file://CVE-2026-42507.patch \
 "
 SRC_URI[main.sha256sum] = "012a7e1f37f362c0918c1dfa3334458ac2da1628c4b9cf4d9ca02db986e17d71"
 
diff --git a/meta/recipes-devtools/go/go/CVE-2026-42507.patch b/meta/recipes-devtools/go/go/CVE-2026-42507.patch
new file mode 100644
index 0000000000..d48b2b53eb
--- /dev/null
+++ b/meta/recipes-devtools/go/go/CVE-2026-42507.patch
@@ -0,0 +1,160 @@
+From 943e53a7b667a1570648b5f1c4592b9d9d5b4aac Mon Sep 17 00:00:00 2001
+From: "Nicholas S. Husin" <nsh@golang.org>
+Date: Mon, 11 May 2026 18:04:07 -0400
+Subject: [PATCH] net/textproto: escape arbitrary input when including them in
+ errors
+
+When returning errors, functions in the net/textproto package would
+include its input as part of the error, without any escaping. Note that
+said input is often controlled by external parties when using this
+package naturally. For example, a net/http client uses ReadMIMEHeader
+when parsing the headers it receive from a server.
+
+As a result, an attacker could inject arbitrary content into the error.
+Practically, this can result in an attacker injecting misleading
+content, terminal control bytes, etc. into a victim's output or logs.
+
+Fix this issue by making sure that ProtocolError usages within the
+package are properly escaped, and that Error.String will escape its Msg.
+
+Fixes #79346
+Fixes CVE-2026-42507
+
+Change-Id: Ide4c1005d8254f90d95d7a389b8ca3a26a6a6964
+Reviewed-on: https://go-review.googlesource.com/c/go/+/777060
+LUCI-TryBot-Result: golang-scoped@luci-project-accounts.iam.gserviceaccount.com <golang-scoped@luci-project-accounts.iam.gserviceaccount.com>
+Reviewed-by: Roland Shoemaker <roland@golang.org>
+Reviewed-by: Nicholas Husin <husin@google.com>
+Reviewed-by: Damien Neil <dneil@google.com>
+
+CVE: CVE-2026-42507
+Upstream-Status: Backport [https://github.com/golang/go/commit/1a7e601d07b67aec8d795c8182ee7257ba7d1960]
+Signed-off-by: Theo Gaige (Schneider Electric) <tgaige.opensource@witekio.com>
+---
+ src/net/smtp/smtp_test.go        |  6 +++---
+ src/net/textproto/reader.go      | 14 +++++++-------
+ src/net/textproto/reader_test.go |  6 ++++--
+ src/net/textproto/textproto.go   |  2 +-
+ 4 files changed, 15 insertions(+), 13 deletions(-)
+
+diff --git a/src/net/smtp/smtp_test.go b/src/net/smtp/smtp_test.go
+index 259b10b93d..3e03da5208 100644
+--- a/src/net/smtp/smtp_test.go
++++ b/src/net/smtp/smtp_test.go
+@@ -664,7 +664,7 @@ func TestHello(t *testing.T) {
+ 			err = c.Hello("customhost")
+ 		case 1:
+ 			err = c.StartTLS(nil)
+-			if err.Error() == "502 Not implemented" {
++			if err.Error() == `502 "Not implemented"` {
+ 				err = nil
+ 			}
+ 		case 2:
+@@ -922,8 +922,8 @@ func TestAuthFailed(t *testing.T) {
+ 
+ 	if err == nil {
+ 		t.Error("Auth: expected error; got none")
+-	} else if err.Error() != "535 Invalid credentials\nplease see www.example.com" {
+-		t.Errorf("Auth: got error: %v, want: %s", err, "535 Invalid credentials\nplease see www.example.com")
++	} else if err.Error() != `535 "Invalid credentials\nplease see www.example.com"` {
++		t.Errorf("Auth: got error: %v, want: %s", err, `535 "Invalid credentials\nplease see www.example.com"`)
+ 	}
+ 
+ 	bcmdbuf.Flush()
+diff --git a/src/net/textproto/reader.go b/src/net/textproto/reader.go
+index 0027efe3ca..b4cd22a6ed 100644
+--- a/src/net/textproto/reader.go
++++ b/src/net/textproto/reader.go
+@@ -213,13 +213,13 @@ func (r *Reader) readCodeLine(expectCode int) (code int, continued bool, message
+ 
+ func parseCodeLine(line string, expectCode int) (code int, continued bool, message string, err error) {
+ 	if len(line) < 4 || line[3] != ' ' && line[3] != '-' {
+-		err = ProtocolError("short response: " + line)
++		err = ProtocolError(fmt.Sprintf("short response: %q", line))
+ 		return
+ 	}
+ 	continued = line[3] == '-'
+ 	code, err = strconv.Atoi(line[0:3])
+ 	if err != nil || code < 100 {
+-		err = ProtocolError("invalid response code: " + line)
++		err = ProtocolError(fmt.Sprintf("invalid response code: %q", line))
+ 		return
+ 	}
+ 	message = line[4:]
+@@ -251,7 +251,7 @@ func parseCodeLine(line string, expectCode int) (code int, continued bool, messa
+ func (r *Reader) ReadCodeLine(expectCode int) (code int, message string, err error) {
+ 	code, continued, message, err := r.readCodeLine(expectCode)
+ 	if err == nil && continued {
+-		err = ProtocolError("unexpected multi-line response: " + message)
++		err = ProtocolError(fmt.Sprintf("unexpected multi-line response: %q", message))
+ 	}
+ 	return
+ }
+@@ -536,7 +536,7 @@ func readMIMEHeader(r *Reader, maxMemory, maxHeaders int64) (MIMEHeader, error)
+ 		if err != nil {
+ 			return m, err
+ 		}
+-		return m, ProtocolError("malformed MIME header initial line: " + string(line))
++		return m, ProtocolError(fmt.Sprintf("malformed MIME header initial line: %q", line))
+ 	}
+ 
+ 	for {
+@@ -548,15 +548,15 @@ func readMIMEHeader(r *Reader, maxMemory, maxHeaders int64) (MIMEHeader, error)
+ 		// Key ends at first colon.
+ 		k, v, ok := bytes.Cut(kv, colon)
+ 		if !ok {
+-			return m, ProtocolError("malformed MIME header line: " + string(kv))
++			return m, ProtocolError(fmt.Sprintf("malformed MIME header line: %q", kv))
+ 		}
+ 		key, ok := canonicalMIMEHeaderKey(k)
+ 		if !ok {
+-			return m, ProtocolError("malformed MIME header line: " + string(kv))
++			return m, ProtocolError(fmt.Sprintf("malformed MIME header line: %q", kv))
+ 		}
+ 		for _, c := range v {
+ 			if !validHeaderValueByte(c) {
+-				return m, ProtocolError("malformed MIME header line: " + string(kv))
++				return m, ProtocolError(fmt.Sprintf("malformed MIME header line: %q", kv))
+ 			}
+ 		}
+ 
+diff --git a/src/net/textproto/reader_test.go b/src/net/textproto/reader_test.go
+index 26ff617470..844069a4ad 100644
+--- a/src/net/textproto/reader_test.go
++++ b/src/net/textproto/reader_test.go
+@@ -409,6 +409,8 @@ func TestReadMultiLineError(t *testing.T) {
+ 		"Unexpected but legal text!\n" +
+ 		"5.1.1 https://support.google.com/mail/answer/6596 h20si25154304pfd.166 - gsmtp"
+ 
++	wantError := `550 "5.1.1 The email account that you tried to reach does not exist. Please try\n5.1.1 double-checking the recipient's email address for typos or\n5.1.1 unnecessary spaces. Learn more at\nUnexpected but legal text!\n5.1.1 https://support.google.com/mail/answer/6596 h20si25154304pfd.166 - gsmtp"`
++
+ 	code, msg, err := r.ReadResponse(250)
+ 	if err == nil {
+ 		t.Errorf("ReadResponse: no error, want error")
+@@ -419,8 +421,8 @@ func TestReadMultiLineError(t *testing.T) {
+ 	if msg != wantMsg {
+ 		t.Errorf("ReadResponse: msg=%q, want %q", msg, wantMsg)
+ 	}
+-	if err != nil && err.Error() != "550 "+wantMsg {
+-		t.Errorf("ReadResponse: error=%q, want %q", err.Error(), "550 "+wantMsg)
++	if err != nil && err.Error() != wantError {
++		t.Errorf("ReadResponse: error=%q, want %q", err.Error(), wantError)
+ 	}
+ }
+ 
+diff --git a/src/net/textproto/textproto.go b/src/net/textproto/textproto.go
+index 4ae3ecff74..a2291eff2b 100644
+--- a/src/net/textproto/textproto.go
++++ b/src/net/textproto/textproto.go
+@@ -38,7 +38,7 @@ type Error struct {
+ }
+ 
+ func (e *Error) Error() string {
+-	return fmt.Sprintf("%03d %s", e.Code, e.Msg)
++	return fmt.Sprintf("%03d %q", e.Code, e.Msg)
+ }
+ 
+ // A ProtocolError describes a protocol violation such
+-- 
+2.43.0
+
-- 
2.43.0


