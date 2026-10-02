Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7346CCA5FC4
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 07:54:28 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6379.1790927664884663544
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 00:54:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=aj/VBoS3;
 spf=pass (domain: ericsson.com, ip: 40.107.130.21, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+YJbZAMlsTqOHnRJAVh5y9i7X6P7e5jDJrcrwWhvdyWWBT/094xF6IQkB4LC4qsujhLF7QySUemhi5FItdn68oYqvRYKvbSsrqMRDDyhPdPNxrnrnrnP4g2jEZRJZ9PLTnvQ57SxvF8KTJdBs+side4LD8Hwjrl6eUFcvMPyXh7lXBizNIml7nqrMME+gNJfugcg0E8iI/HupZMWQ0FlLNRpZGQpsQ3jXjcnxmDSRiTsg5L3vcS1Y2SEhHLP1um36MwE+g0IUcXIH8E4H6Xs//50TT9AVF6BgGRPn0wn2tBEQERN7eFrmggtjA2GlCsuYyAhJFHn+xGhZtBR5JG8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LjVgT06eKoJ4W9LUXPbbgGT8xWG6pKs1xrpLyTQxamA=;
 b=h3funZAuifZXOBSYwxzZ+QSrmIaZGMQzqY/Lf1sH2a0oh1Kqq90KyNXNX/qmQzW2fIGp382SylfH44Qrg8hECqOHY/yO2SR+7v6tMi7zVArav8KvY920pomF08BTWTi1KySzHESPD8pOIrNm/5crNhBoILiqZtbFy1KFjeAFqdtyC8HFPr1Kiv1C2vjhEX21bTk4NOSRHAgVNPSypOiKEv0X9lu1ZtCc5yFX2rzGTJ7OISxURB1ZG9fd0KQCBGACDffP/EviQ53uHy+ZeVpJF3HwLeuBw/ZVuhHiMPZO+80NtD/n+kBxN+LS3bEudWz9OSnwvBOE5Upp+iv2FyFKCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LjVgT06eKoJ4W9LUXPbbgGT8xWG6pKs1xrpLyTQxamA=;
 b=aj/VBoS3DbLdbN+FBgc7chcAB4J8fUUGQ93PW+HPUvEdGlCrRj0LPFIcIcHa1rdMLLgL6bMBs3MXApl5UGK5idVbsNY7i4bVpD3WwClbLMBYZTVZ5+P4h4f6HEm0oGKK12nD1mihc7BwM3xMz1mCNeu2bkun47+kFxgnkRier+H7U8RXLSk4ACmqc0W+PS+cWaUPflc3aM8TBLq9gAuS8kTI/JFT0KaAdNHxHBM4UhWjGA4MuTKjCb5Triw5OpGUNGzV49LPIPuY/OW4jwCZdKvYUkUlTiwXsXJFPuRVAn+hUb8sFZ2aYFTaZrYZf6CwhCuXLRoY5v2DyEgAlWtzzA==
Received: from PA7P264CA0066.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2de::11)
 by AM7PR07MB6994.eurprd07.prod.outlook.com (2603:10a6:20b:1b2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.21; Fri, 2 Oct
 2026 07:54:19 +0000
Received: from MI3PEPF00008555.eurprd05.prod.outlook.com
 (2603:10a6:102:2de:cafe::9c) by PA7P264CA0066.outlook.office365.com
 (2603:10a6:102:2de::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Fri, 2
 Oct 2026 07:54:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.176.1.74) smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 MI3PEPF00008555.mail.protection.outlook.com (10.167.240.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Fri, 2 Oct 2026 07:54:19 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 2 Oct 2026 09:54:18 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 6632F4020C02;
	Fri,  2 Oct 2026 09:54:18 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 39E3E700CF25; Fri,  2 Oct 2026 09:54:18 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <JPEWhacker@gmail.com>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v4 0/3] spdx: add support to include releaseTime
Date: Fri, 2 Oct 2026 09:54:11 +0200
Message-ID: <20261002075414.2311840-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF00008555:EE_|AM7PR07MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ac40e66-a878-402f-8c98-08df205a5d4d
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|36860700016|1800799024|82310400026|3023799007|11063799006|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	NHzFPwOwpy9ueo6OJudnes8LYwug1UTdB3m18OSQpXQEChxjRb60G+fbJNzuH/6cRttiC6heUqdHZnjiAkprpFB+ev8OtjBtpxXW/YeBaFwmNFPIdurHX3ZR5CRtMo12Ok6nx39OXb/BvxqLf1z/1ZxlrCyuwTCTguGAWz/BUI51uQpDebtSBLDhBAc4E+u7G3HVKTMPRxYKSsyVGlYC8OxqxBBbE6GLXUupOsxjVGFUGvil2Jh1ZRkmCu7VOD5NWfCRDapp2ZNUDw0NxPUIW+h97CneACQlwzZidGYEYzBKvEw4yXKeAroshURpzTZcDmuTD08AiPx1crcwFFqC9b3uvyfQiURlWeuOKISMt5tIfVVlxAy9T7Bcrs3hvJhPFrBwBQE8ZMCLr8GW/UvqpSMUa7nDzgWeiVR7qCTCzHGRY0Zy9X/CQA1/b1B7RlLW8sfHv2DoSPn0X3bI1a21CmUZq1/HHzKPZrtoNBlnFjAuQlQlLvRElKPv8l46aGL1Onf5oLX1pceJzSEq/w97X9sTNdsUvb3gXFQzc0RVsEyGCe1d9pV8v5R9pRuFXwag4BWuG3SEXfCcDkxF5Zpc4ZanW24nea7o/k9FcrYjFBNgkBWcbvwx4SWolUi+YgIKFaFwifPW1sbwT+at5qmK0ZS5t5pnN9TJCZqpIdP3PqM=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(23010399003)(36860700016)(1800799024)(82310400026)(3023799007)(11063799006)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0x4L3zEeaEyQLfGOFsE4qTxdLG44IWeuKyi3zW79JtBIPbTQG0mF4joTpJYu3Jp5EtUBWtNbS+GyCG8DDyDfeBd+fJLcywRSKgFtY9aWD/r3KF50e9odnxPJQdNjvD6PP67+yZMchdqEYt0PBZfEDuP39R9OqxTZpzJ419t3aKsFV4QGemp+dvJ7TdLpvP0R9qimQiABPY2aW3AMY0iK6/JLm1N4kj+HJl10nXCIgpaa60YX2qVP+ew4MwiLaVDyYiyq7ZVlXP1q01tcpb+E8OKHhtF2X2hbqdZCYcDVM326JrUrOltmTqcROj3dlM0JL3hKk9jUd50tcoGfbqsa5Ep7VT+s1pRIhwGo07uDrtv3Z7BKANqz6uAdrJyJM0wUCj6gS7dPcjs7kBCrGwUwWqXFVJY4yGCvheYIGMKDfQks16bMwQ5q3McObDu1H7eq
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 07:54:19.3572
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ac40e66-a878-402f-8c98-08df205a5d4d
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MI3PEPF00008555.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR07MB6994
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 07:54:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247084

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
 meta/lib/oeqa/selftest/cases/spdx.py        |  41 +++++
 scripts/contrib/spdx-release-date-report.py | 191 ++++++++++++++++++++
 4 files changed, 258 insertions(+)
 create mode 100755 scripts/contrib/spdx-release-date-report.py


