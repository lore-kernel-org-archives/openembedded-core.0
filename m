Return-Path: <christian.lindeberg@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F41FA3724
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 07:30:18 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.51])
 by mx.groups.io with SMTP id smtpd.web11.68237.1726212608454312027
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Sep 2024 00:30:09 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=IjBMcob2;
 spf=pass (domain: axis.com, ip: 40.107.21.51, mailfrom: christian.lindeberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W/I8jaD6+lOiZfaWEcoOp/1zIqa9ChJV/RQdTbzUgsiph5boCjLnTYaL64K68aVxfI6EUnnAiMrNLAqU3bzcAcSqfyhIGt9WYTMALdAIDQO8GfiIICIg5RaJKKPK1VT1cClTwGxlX+g6BUS1APvNR73TJ9u9//eznU3GILCP21KMNjhmy1xgiJwA7UTDbkBbKyzCIRpv+1sth8WCFjMwejNm+jeq3TJpyTjmzoGnYcxpF1zUxKFxMm1/GO9zIt2fPvYHY+1XWKPiPATq6JU7YXbf/Mfgg4Pr9CDUVL2nrgFdbJwLT8oVmbmjkkdU9leqDGj807R6SATx5C8t2MVbIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IkhIMp8DqNpK42G6mecG0bPCEdYzz7QnfUJ6SxEBbMo=;
 b=qWN9wXnsQmv9zYRxdPbt29xMlCdKfU70IQcifQtvq6jA9v+w3t33CV7GvVmDXE+HLM2l7bc/zpTA2HcbVww0amex75Bi9gGmrzPsFNdEobP9ZPoi7ZW6UxKj3qFlD4xxcBdH1gic6YOpdmxZ6e/4Erxe8Q6o/G8s5vI8TvfxSypgzJra4RFR5MnPN9D3wApSK3tlmZh7/Snz8BGPYAeKyO1e2sZs9ewgnulsTvX2+I6m8yVvV/0gdYFMKOJSMeUgP+RLOujZUcOkTQdK5wLPbI3EMKWQ7B8FmFQamFtcK98dZoW6nqwAgB8SxBIuNgh76aGcm5a0fxQXMNm5AKw/ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkhIMp8DqNpK42G6mecG0bPCEdYzz7QnfUJ6SxEBbMo=;
 b=IjBMcob2Wx0Cm/yrWX/UrDLSfD2S9kO9ugFcfByNTIacvY6LwRRvynFpzvj8gwEn5INA/8vPuOxL3LUVevYHqdbUW4wOeLh4I60/JUsq3gc9rV2Xr+O+Ke7FqHXIqcCXLqc/2qISlfZv9JjmrwfrHXhCEB288qUhEkJinU+yrwY=
Received: from AS9PR05CA0226.eurprd05.prod.outlook.com (2603:10a6:20b:494::28)
 by PAVPR02MB9675.eurprd02.prod.outlook.com (2603:10a6:102:317::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.19; Fri, 13 Sep
 2024 07:29:59 +0000
Received: from AM1PEPF000252E0.eurprd07.prod.outlook.com
 (2603:10a6:20b:494:cafe::9a) by AS9PR05CA0226.outlook.office365.com
 (2603:10a6:20b:494::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.27 via Frontend
 Transport; Fri, 13 Sep 2024 07:29:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM1PEPF000252E0.mail.protection.outlook.com (10.167.16.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 13 Sep 2024 07:29:59 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Sep
 2024 09:29:58 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Sep
 2024 09:29:58 +0200
Received: from se-intmail02x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 13 Sep 2024 09:29:58 +0200
Received: from pc50740-2234.se.axis.com (pc50740-2234.se.axis.com [10.94.131.4])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id BA6FE1F8
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 09:29:58 +0200 (CEST)
Received: by pc50740-2234.se.axis.com (Postfix, from userid 21184)
	id B611A26B985E; Fri, 13 Sep 2024 09:29:58 +0200 (CEST)
From: Christian Lindeberg <christli@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2] go-mod.bbclass: Set GO_MOD_CACHE_DIR
Date: Fri, 13 Sep 2024 09:29:58 +0200
Message-ID: <20240913072958.2099199-1-christli@axis.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252E0:EE_|PAVPR02MB9675:EE_
X-MS-Office365-Filtering-Correlation-Id: d654462d-4432-44fe-8d36-08dcd3c5dfa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/Ve+cniaRBDBlR2ARJlnl/UkBik8kshTTncgWPtg11ynvsgZgGbplsnVrCsh?=
 =?us-ascii?Q?bVxCFL6LINZpxlKU5J0bmb9vLvUcqfB58TiQv39MC8qVTBNGH6lnqkIlv+w3?=
 =?us-ascii?Q?ydFKXOS9jULgMNnOIJjvbdkvnxTaq4s25wGiCqrw6T/7MrP9GmVAiyVgtahY?=
 =?us-ascii?Q?JRjB9KNszYmVr1hVGF/9H8r2BIis9dRILa6wkrFYiDl31v+RtKaBi7MmdEzZ?=
 =?us-ascii?Q?S/HFjFfN3tHF/ygDQgHSPpezB0wzwSSNPcQEwwMmY52i9DmcDCxml7kyuYBn?=
 =?us-ascii?Q?cfKpH0iG3KuZgV5B2W+X6J8f0urTLJNzu7JFpw0DdMTADfcEozIRvX73sNO1?=
 =?us-ascii?Q?Sv11hUJWuh7getZW7x7pATzXgMtcdRN5KlJgkVvXwWkJxqYhKYtDBFJp8Xa7?=
 =?us-ascii?Q?nI9XmRG+IqSwplIpdKSEeNG5WoTe5NlMMeEw4kHCEn5WCBP5rhoxctNamwaU?=
 =?us-ascii?Q?qBeP+FTetapoxmD5et/C42NRiljUCvsQ2MzPWAJ1e/R7x5qzX8Q02Ac+YtH/?=
 =?us-ascii?Q?luM/g8WFoqvYrkN67sS2+CXEqL39z03h1oabZmJIKdKB7y5v5xOvoqQQ2SQC?=
 =?us-ascii?Q?Ioiog/4k63KTY5TnfHPEOd3uPooJiPsehqWqFFiLoPnyI6XyBfe5zWqs3jnT?=
 =?us-ascii?Q?W0cwgJo50iROT0YBSqdr6+0xb+rugB1P10S+aBZOQ+wSaYyAjxAjjjlXTGxU?=
 =?us-ascii?Q?slaB2tu8sr9ncWEGyPeKpTLwHKYUDSqgaRFNMinXIWQaa6sfo1+qt0FMVlEY?=
 =?us-ascii?Q?lZAj+aD+5iGSkHyEHq7CcwyTyeauA6BNUqdmby/Q13KnAymPoo6kP5i0VQuj?=
 =?us-ascii?Q?/qau5P/wZN8L4pUGqCuibeTL3TCxZr+nAUtXugYuQQeHHUn5X1FzepCfB0Fd?=
 =?us-ascii?Q?Ff7Wp0890YpHvnCtTnOtMI/lWq0K6WHWr8ZS0hc8IFln8LtGACwznaEE6mMu?=
 =?us-ascii?Q?FY5DVNO2BXmAMXnkLmCNVGClnCbY23TwKCNQB9urRE8NkUR4dRZKTZdSkt7X?=
 =?us-ascii?Q?BBIA8C7vAZnhbSZ0CzolVdhKMFgwwGhc7Gwif1ZKGayumCYwCn1mDep/+nKS?=
 =?us-ascii?Q?Bnfn4U6sIdqBU2AlbCQGYqgr2ItCzd6cVP9ah2SCsG/aHJ3AXupBMZMFhcI/?=
 =?us-ascii?Q?A59prc2ZiIfuHuTiMYiOEqol9rKfzHOnK/QP6nJStB4aoreRwwU0vZUKNb9s?=
 =?us-ascii?Q?M5SjyDGmlS0PLQwIbEnVCTS9GLqlSu0WGR1Gd029N6gb2mGmfpIKtmhuYb+H?=
 =?us-ascii?Q?LcSRrWjuR5aqQFpuCXWtHjJvDttZB1PlF85bkjSYBVKyQmWM6Az5d7N9+Blf?=
 =?us-ascii?Q?MEOKzdqhwSoTvzjJ3V7xXjkvw6Ogz5j++47e4hMFbMQf45w2OJs82H/uNWeP?=
 =?us-ascii?Q?eKo93jtlwgXyduZ/BtuhGDg4+SyD74OtEUw3SI+rVkjDrRe1qg8pSkymWUrY?=
 =?us-ascii?Q?zsfkAfxIzS07PJ9UpFUUZ1pVozQmMJOi?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 07:29:59.3158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d654462d-4432-44fe-8d36-08dcd3c5dfa0
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252E0.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR02MB9675
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 07:30:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204472

From: Christian Lindeberg <christian.lindeberg@axis.com>

Set the GO_MOD_CACHE_DIR variable and move the location of the module
cache to enable the use of the go module fetchers for downloading and
unpacking module dependencies to the module cache.
Also, clean out the module cache before unpacking.

Signed-off-by: Christian Lindeberg <christian.lindeberg@axis.com>
---

Changes in V2:
- Fix assumption on S regarding the number of directory levels below
  WORKDIR. Suggested by Peter Kjellerstedt.

 meta/classes-recipe/go-mod.bbclass | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/classes-recipe/go-mod.bbclass b/meta/classes-recipe/go-mo=
d.bbclass
index ca3a690d05..2083d7f2d1 100644
--- a/meta/classes-recipe/go-mod.bbclass
+++ b/meta/classes-recipe/go-mod.bbclass
@@ -22,9 +22,9 @@ GOBUILDFLAGS:append =3D " -modcacherw"
=20
 inherit go
=20
+export GOMODCACHE =3D "${S}/pkg/mod"
+GO_MOD_CACHE_DIR =3D "${@os.path.relpath(d.getVar('GOMODCACHE'), d.getVar(=
'WORKDIR'))}"
+do_unpack[cleandirs] +=3D "${GOMODCACHE}"
+
 GO_WORKDIR ?=3D "${GO_IMPORT}"
 do_compile[dirs] +=3D "${B}/src/${GO_WORKDIR}"
-
-export GOMODCACHE =3D "${B}/.mod"
-
-do_compile[cleandirs] +=3D "${B}/.mod"
--=20
2.39.2


