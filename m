Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB5AC021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 11:42:21 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.32])
 by mx.groups.io with SMTP id smtpd.web10.9313.1739446930731201131
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 03:42:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=vBdf4F0y;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.66.32, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YTcYPKPqkFxvAY3HskTSn4R/uM53qHeCdAdvyvLzMigvN5VnvkG0ztZds7rFMJiw2VX3Ol6MXj+nKEudpiO6t+ZZ2LSY422eLrO1FdA0KA/Vz2JF+FacfmiR1kezlwgOhqWtSOVifKpdI4vIqAv8Yi4R/Jc5WCNQF7dkg4d1+ovGTxLlRneJxOTzPUauEVc3S8mLuiTO7lD0mKPMvNWtUyxjU9+PUEWF2KOyG3JNe80FSBtnkYpHYnCatldafZ5DoLQV9yoHm8Q3COwQjYU/EQaWX1LOEAyuNh0zxwuFgEuOq/DMaSfn7N8zCas3uWjYO87i4xtEf5kb97PYe3kx/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kBNbQ1GUVbkTFNCNjQesTboldDXWzv9TwD9+QnZJCEg=;
 b=FQ/h7qTT8LJvyGgABxAJ92O4FSwl98qzPN2DQZ4ZPtSLY+S8J+INCSWKhCXZcHqnINy/CMeRoBvisAqSP8PUD3SDnr6Elw//KCtixoShjTB0psKKLzBjGv5L6wMfgTYNW6qnwS/t37J5kSDtIpBYiSI2H0tGZJpcYZhBMjL1yxQr5SO/3782sJ3mXeR53BmNr2Wi1RXnKpu9JHKDijMllxJqvw0GGvCKxXne504zHzdn23MsBRL+vEQmtQeCQYpL4cpHW0CZhrKoLC0TtvUNKTs+xDZ+PXYt+c+6h+MEJW1GPVjcou39ZrOA1d8b9/yRfP3qhaiPTEh7RqyEWIKlJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kBNbQ1GUVbkTFNCNjQesTboldDXWzv9TwD9+QnZJCEg=;
 b=vBdf4F0y/v3R8bwNbO2STPtxfrm0uwxkUBG93iknw7NT68y7f2x3UdLXej2m9VpcjUJDLi1Pz/iPCZvkrqLQNH1GAXTZCciD+lZoway8nxUqw/yfWIMA2fcZGm8pXj0aa2c8s9V9p0jJYDpFe4KM81l6cAtHg0nPTlSga28fa1k=
Received: from DU6P191CA0028.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::14)
 by VE1PR06MB7133.eurprd06.prod.outlook.com (2603:10a6:800:1a3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 11:42:07 +0000
Received: from DU2PEPF00028D0E.eurprd03.prod.outlook.com
 (2603:10a6:10:53f:cafe::3) by DU6P191CA0028.outlook.office365.com
 (2603:10a6:10:53f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.14 via Frontend Transport; Thu,
 13 Feb 2025 11:42:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DU2PEPF00028D0E.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8445.10 via Frontend Transport; Thu, 13 Feb 2025 11:42:05 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 13 Feb 2025 12:42:05 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [OE-core][scarthgap][PATCH v1] ppp: Revert lock path to /var/lock
Date: Thu, 13 Feb 2025 12:42:03 +0100
Message-ID: <20250213114203.2056946-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 13 Feb 2025 11:42:05.0369 (UTC) FILETIME=[4E2AB290:01DB7E0C]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0E:EE_|VE1PR06MB7133:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 956b796e-d25d-4439-0ecf-08dd4c2370d8
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Nojc2DBhHWghK6sOGXEZsTgv8QYFnCBBg4/UXSaHBB3Rjqc2ToVw1idN19RV?=
 =?us-ascii?Q?16NXYQxqj/dN4MnaqLLGInXGD9mKAxOpys559ETPGdooo/EhAbHgbQYES3nl?=
 =?us-ascii?Q?sW6iebD5WeE4Lqfan6/lQMPEDaUazGOzixOHX+AOFlDAqnvzFXRytLP5hPXp?=
 =?us-ascii?Q?Kgc79JjLvk+dvqVihb5FLKzbvMzEEudiL3JeVs2viyhYFVIMt2QXH32SZZqo?=
 =?us-ascii?Q?6rc16aTJivud9L42UOCQ42nos+xNZ0tIn9UsS3vLMrK9uEwewEGiGJQklLV2?=
 =?us-ascii?Q?g9RJ0FA65UVX9b79bdFzaVzHtMPgx86H7oIPUdXsmqDKVslWDG2E4ESm1K9r?=
 =?us-ascii?Q?yH3IozqtSmpxZy6mnjKhr+zCoX+B0IFamIOfC45PKb1/z6qGkQrJFvy6l5J+?=
 =?us-ascii?Q?dqGyG3MzevFArpr4xrMhCmC7lU6+uu6Et+mLN7DvM+cofC6Gtj3ilTA/tIiD?=
 =?us-ascii?Q?0gNhANal7Jl5t/dwnTpu7NMnjwFOuX0ILO2nB6TCNRGfDBEdD7iK/vdUtcCE?=
 =?us-ascii?Q?Jd76/bcC0na5J3M+57PlVxahxH0GsDH7TSe4rluWUQaa0cZwEBgBBq/172h/?=
 =?us-ascii?Q?VPZhhE1u77UQ2XCeeo1HE1EBU3Ho5vX1ykgKBPTuHkmXjQo/J9aVwCbizdIy?=
 =?us-ascii?Q?Oym2eYBh3nDK3K/PXczvc6FB0zsStNxZGNF5lS023ZfF7UyKc7GMSDFNcjJi?=
 =?us-ascii?Q?nqhrH/sl58SifbyIYQIk4TCFIW3BFRqWaxhEZYhcUu4nwvOcmpdbr0AnkrTs?=
 =?us-ascii?Q?/X+yfqBOJatqal1LYHaHhTQ9lSLnrsQK1teXotJjeNrd3pcaOa3+uNNRFy6U?=
 =?us-ascii?Q?aETvTER8tz3cyMC0ef4aa7WOAvPbzM0NMZyNOB6HVMiJZ+Vj6gLwPviMGpMM?=
 =?us-ascii?Q?1xqdnodRQDtfGw/1qsWygISPrxeJPMckv8GQ+tfpEOQU748zuiznm7gTG0gz?=
 =?us-ascii?Q?5+WrU+6Zk/QEIKjVFGJ+Ym/HFwM2WPGyB+ohZpn4KkxWQRmgHFfVIXK8a7pB?=
 =?us-ascii?Q?wFI/8iNqeZJUsvnovSAGM9GQEIeZFddQcF5lDnXQvhoaoRgYXQw5F+qMh+Tl?=
 =?us-ascii?Q?p6QVVAr6CyZhEqjQFaUI1W5bmc1hKgJyIq49VH9uzI29e3nVYIOnsZJ7rqC7?=
 =?us-ascii?Q?1uUUTo7q68P0f/9EOx2zufd4AUMDgx/dfJ4aosFOJQ9BP+HJBnBMMBWGv+Fe?=
 =?us-ascii?Q?609tiJ2rd6SnBoLVDks29EQbsc0fC2TUYkuHfLybEQuyclUyxCzZ65aQg6RK?=
 =?us-ascii?Q?48CRp5t3nuUB2rZhMPwTlE6YaGMswrUs4+vd+J8AwWizf4H34PefTYE4iFHc?=
 =?us-ascii?Q?MFlzedLT5ZxUkF3R4hgGlagkbHBy7mErCJm7EAlX+8fyqcPFXZ+fvvFwQYxy?=
 =?us-ascii?Q?laK08hB6RZsSpood3TRX0LlpsuFzcF9Gpy/2AoXxFFNOB+K4i4FWVIaQQt+8?=
 =?us-ascii?Q?9Pwznc8vMs0oTAEVxYauCRe5wGhONoNJ?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 11:42:05.6627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 956b796e-d25d-4439-0ecf-08dd4c2370d8
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR06MB7133
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 11:42:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211326

ppp version 2.5.0 fails to run properly if an expected /run/pppd/lock
directory does not exist, which is not usually created in a yocto
built OS.

Backport the patch from upstream version 2.5.1 that fixes the issue by
reverting back to /var/lock.

The related github issue upstream was:
"lock directory moved in ppp-2.5.0 #419" [1]

Link: https://github.com/ppp-project/ppp/issues/419
Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 ...001-Revert-lock-path-to-var-lock-435.patch | 63 +++++++++++++++++++
 meta/recipes-connectivity/ppp/ppp_2.5.0.bb    |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-connectivity/ppp/ppp/0001-Revert-lock-path=
-to-var-lock-435.patch

diff --git a/meta/recipes-connectivity/ppp/ppp/0001-Revert-lock-path-to-var=
-lock-435.patch b/meta/recipes-connectivity/ppp/ppp/0001-Revert-lock-path-t=
o-var-lock-435.patch
new file mode 100644
index 0000000000..573eb413b0
--- /dev/null
+++ b/meta/recipes-connectivity/ppp/ppp/0001-Revert-lock-path-to-var-lock-4=
35.patch
@@ -0,0 +1,63 @@
+From 99cbf5e269994482edaf64624be8b1c806f9587c Mon Sep 17 00:00:00 2001
+From: Dominique Martinet <asmadeus@codewreck.org>
+Date: Tue, 10 Oct 2023 10:05:50 +0900
+Subject: [PATCH] Revert lock path to /var/lock (#435)
+
+lock dir changed on linux from /var/lock to /run/pppd/lock with
+pppd-2.5.0, which makes pppd fail to start if the distribution does not
+pre-create the directory.
+
+This reverts it back to /var/lock.
+
+The paths for other OS should be identical as LOCALSTATEDIR should be
+/var, but also revert them back as well just in case.
+Since the variable is no longer used remove it from makefiles.
+
+Fixes: 66a8c74c3f73 ("Let ./configure control the paths for pppd")
+Fixes: #419
+
+Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
+Co-authored-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
+
+Upstream-Status: Backport [https://github.com/ppp-project/ppp/commit/99cbf=
5e269994482edaf64624be8b1c806f9587c]
+---
+ pppd/Makefile.am | 2 +-
+ pppd/pathnames.h | 6 +++---
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/pppd/Makefile.am b/pppd/Makefile.am
+index e5bedf2..7cb3005 100644
+--- a/pppd/Makefile.am
++++ b/pppd/Makefile.am
+@@ -83,7 +83,7 @@ pppd_SOURCES =3D \
+     upap.c \
+     utils.c
+=20
+-pppd_CPPFLAGS =3D -DSYSCONFDIR=3D\"${sysconfdir}\" -DLOCALSTATEDIR=3D\"${=
localstatedir}\" -DPPPD_RUNTIME_DIR=3D'"@PPPD_RUNTIME_DIR@"' -DPPPD_LOGFILE=
_DIR=3D'"@PPPD_LOGFILE_DIR@"'
++pppd_CPPFLAGS =3D -DSYSCONFDIR=3D\"${sysconfdir}\" -DPPPD_RUNTIME_DIR=3D'=
"@PPPD_RUNTIME_DIR@"' -DPPPD_LOGFILE_DIR=3D'"@PPPD_LOGFILE_DIR@"'
+ pppd_LDFLAGS =3D
+ pppd_LIBS =3D
+=20
+diff --git a/pppd/pathnames.h b/pppd/pathnames.h
+index de2fb68..12609a9 100644
+--- a/pppd/pathnames.h
++++ b/pppd/pathnames.h
+@@ -120,12 +120,12 @@
+ #define PPP_PATH_PPPDB          PPP_PATH_VARRUN  "/pppd2.tdb"
+=20
+ #ifdef __linux__
+-#define PPP_PATH_LOCKDIR        PPP_PATH_VARRUN  "/lock"
++#define PPP_PATH_LOCKDIR        "/var/lock"
+ #else
+ #ifdef SVR4
+-#define PPP_PATH_LOCKDIR        LOCALSTATEDIR "/spool/locks"
++#define PPP_PATH_LOCKDIR        "/var/spool/locks"
+ #else
+-#define PPP_PATH_LOCKDIR        LOCALSTATEDIR "/spool/lock"
++#define PPP_PATH_LOCKDIR        "/var/spool/lock"
+ #endif
+ #endif
+=20
+--=20
+2.43.0
+
diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.0.bb b/meta/recipes-conn=
ectivity/ppp/ppp_2.5.0.bb
index 5f0c75de83..badf22db97 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.0.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.0.bb
@@ -23,6 +23,7 @@ SRC_URI =3D "https://download.samba.org/pub/${BPN}/${BP}.=
tar.gz \
            file://ppp_on_boot \
            file://provider \
            file://ppp@.service \
+           file://0001-Revert-lock-path-to-var-lock-435.patch \
            "
=20
 SRC_URI[sha256sum] =3D "5cae0e8075f8a1755f16ca290eb44e6b3545d3f292af4da65e=
cffe897de636ff"
--=20
2.34.1


