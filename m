Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DCB6CA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 11:53:43 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.0])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11389.1791806013218714454
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 04:53:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=SVDLism9;
 spf=pass (domain: ericsson.com, ip: 52.101.84.0, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DeJy6qzTNL79P86QgQVQblvP9ZUQzqoUMcuYchDeE8ijv2uZbC7+36PU1XXkiv2Aru0xvKpj+mAjmlD8ZK8qcpeUrKjPiVtSnpeRAsEJhW8t2DVGikLjWIeQmb5+6QDx8e6QNlmgp/bHAa80Q8NVLUmP5Kjc2ZOWVV2NAG2kskBxJG5Sb/Q/QGU4Mw3/EBahgw7fi8OBCdDLxKobb5QKERczU3OAGidMLq/Qi5d4WU9sqi5AZjEtvvbAuPVoZJeLRUY9v+1K1CsThULu40ydFrtgPvnZAPYaXDlcO49NFefRv0gj4fkEH1i1y+LsHmtPWcAxWZzN2VFGeGcCzqD8Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5RoS3n7P1mfLSv7Et4qOuiPdUe/RZqVraIz3kDMDJLs=;
 b=gTfpxMHbghNxZtRkMeiL+aFVYlsYE/josy/E5hu7IsRwUffQJBUvNCUtz6202kzIGVV1kYkGjfA43POFlgFM1RzeKmZK0ZaLdB02IXJbjMATS7dPTH1ARshBUSzgqXmw34zenGhZbwCZO+HbV562y04ugx08LW/7LIDCl6WeSkq7wocqVzkrUS1RXNbApzV9oz1XD/xKrF2KO3vyeaFwZiIupccdlUM9EjbfPK6KRrwhbftoFIQDWHUb3+pohOLw6LjVHM8jxm4FiJUz9dh0myFRJ5ftvXA8v7+cWn7g7CvmLks01Tt84DncguboCDh3P56xaWSrvy//EO3rCHR5Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5RoS3n7P1mfLSv7Et4qOuiPdUe/RZqVraIz3kDMDJLs=;
 b=SVDLism9bM4eXbvTcN1p3ylQkExC9pV0sgcfo48WRvHrg8fslcKx6RVa+xZm1UOyIYliSFmZrc0HSYx58B8PNAygwM/z9c2BROB1HJak3wGHOMIBFK6bTOH8VbEJtTdsK8nSqMUU7NbzfFJdw5Uv0F5woat1se6pl+k8tDnXK+r0HvpVaVwj/HB6vS6rZeeVQsIlxM+k1YahCT9zF1Hs030zzmFu9OqcoKc21RjZuONujcX138Wpzx+urxuv4N2GgbMfrz4gdsfFAkYbtsmx5OLmTtTZFXCxcFdpuNu96FA12KvaB7V230HcEttzgc02JrPWoqnVo8vKzKvPDDNH3Q==
Received: from AM0PR10CA0017.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::27)
 by PA4PR07MB7631.eurprd07.prod.outlook.com (2603:10a6:102:c6::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 11:53:27 +0000
Received: from AMS1EPF00000094.eurprd05.prod.outlook.com
 (2603:10a6:208:17c:cafe::9e) by AM0PR10CA0017.outlook.office365.com
 (2603:10a6:208:17c::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 12
 Oct 2026 11:53:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.176.1.74) smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS1EPF00000094.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 11:53:26 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 12 Oct 2026 13:53:26 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 40EC295805;
	Mon, 12 Oct 2026 13:53:24 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 14CE2700CF34; Mon, 12 Oct 2026 13:53:24 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <JPEWhacker@gmail.com>, <mathieu.dubois-briand@bootlin.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH v5 0/3] spdx: add support to include releaseTime
Date: Mon, 12 Oct 2026 13:53:16 +0200
Message-ID: <20261012115319.1704048-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000094:EE_|PA4PR07MB7631:EE_
X-MS-Office365-Filtering-Correlation-Id: af3a2394-85ba-49d8-65aa-08df28576d26
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|56012099006|11063799006|261009223027099003|10067099003|18002099003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: 
	yc7s7WD9vmYHtaqCbY4j9ttaqVYXxuVMwK4XMH3jQVvFB+71OLEYisPemk3GMYGJncUN3g6zH7GNMVNkD5cYp+5jpvfZ2LYeJqnx/AB5s7x/eSHxIOb8py8DOZmE4OtVbE+9xvEvbQGBJvgjsD3+Nyzvis6sFH0uHG97JzUF/QZwJY9z6F8R/DePqtnCpasvLallJRluWubt3w2HGu5KC7852JubNQ+WIW3tWaHvHcsB9x1+UJp//w7NXE1wJB1FoOW5u5w1ZXXfWoFUnSAzjfSYcM60rJ7d9toGO4gHMNlqBzJhqpvTNpmo7nbKH0GFiMM+KWxRjoNUEz+pI3S73l5i4x6Efx1aC+PG4/Bc7Y6u0HZhG3ZOkRz4tcraDcvH/G+pmvXQ986C9HTrdV2DOMGpcscTFyWFl6aQflwhdliugD7FDtLg2W3dK/olwoEh59yD9/z8pCMP+upax/OEUP4l6Vb7vkGJsKZKVYIwVwvz7TvMV1sMvzzpuz12epgy/VFWfDxk/ljORc8/X2QcRzXpkYcIHC8nTETUxYM2TDa1Z6ScxEcWp5N7CfQFu4u7OvPMElCH7weU2W5jBao0MQWfUd8fm4RL4ykmCXLprTfLRD84covpu8I3bWxejdMFVctLPp3V4g7PLaKE4o8IPcA+eOpuRuYv6bfIrMbPPtA=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	P2+LW2K7pl3dYD/R1kn4lLHT63JNVPUi8EkH3b+0MS4s9D2DfBLjfMZFN5/Q/cRJdFVZsu815CXaT1JWprMC1EeD22Q3RJirqYTPDoa6TSLSonhitPEgc/1eg+Xnxj1WOfk0OFTHgqD/TGBcPS50YQpowsvKP9bQyhMYAAm2H/zjMKOk+KEKmG5j8O09tdTP4U3wz0DT+iLFRzKWmgbfv545rgRknpXZz6WyUvej0zfrLOF5tzKsDRSxHga3ctPtSbThXnfpXJ7nxOlxKF3T1yDW2ty2rom9SApU7kkFIrvg4Zg4iHDgi6rJKoF7IRhKF3joo7+ECRU4qWV13meIByeO54q5UhNh+3D1vqkTWNgYtZcs4SshaXl8GzasRy+Ps9YlVA2r8KRpuY2jiiAby2dufrLFUMLYuY5Zu+1WKCOEiGsFgEJCcPbu9nX80mC+
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 11:53:26.7731
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af3a2394-85ba-49d8-65aa-08df28576d26
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000094.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB7631
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 11:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247640

From: Daniel Turull <daniel.turull@ericsson.com>

We have a requirements to include release time of open source components
in the SBOM. There is a field specific for that in spdx 3 spec.

https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Properties/releaseTime/

This can also be used to evaluate how old are some of the core
components and decide if they need replacement.

The previous 2 versions did not have cover letter.

In v4 I kept the simpler logic to just check for the epoch date, even if
we have multiple sources with different release dates. It was getting
complicated and adding more code for git and tarfiles. I can do a follow
up patch after this simpler version gets in, so we can fine tune it.

Tested with oe-selftest -r spdx

Daniel Turull (3):
  classes/base: exclude __CACHED_SOURCE_DATE_EPOCH from task hash
  create-spdx-3.0: record component release date in SPDX output
  scripts/contrib: add spdx-release-date-report.py

 meta/classes-global/base.bbclass            |   4 +
 meta/lib/oe/spdx30_tasks.py                 |  22 +++
 meta/lib/oeqa/selftest/cases/spdx.py        |  44 +++++
 scripts/contrib/spdx-release-date-report.py | 191 ++++++++++++++++++++
 4 files changed, 261 insertions(+)
 create mode 100755 scripts/contrib/spdx-release-date-report.py


