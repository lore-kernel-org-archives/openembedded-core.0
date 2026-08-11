Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A724C5CFC1
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 09:19:26 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50453.1786439957386693475
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 02:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=JGPmbHZq;
 spf=pass (domain: ericsson.com, ip: 52.101.69.52, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CtEllEgC3FHxRKIprlWZMTuKe53tkQSWqEcDg28AEWUbsge+RtghkcAJv9SO8w0XUjO0U2lDzRWvDHVj18N+3kPhb/zfnhYO8eDg7YMsUwe2utvuGc7uyMMGGdW8ojM1/Gqf0CbUUKxAHnB7WmYEvQo5yiCMe6LAUzcLZ+ocOpma+dD+iCng9JmZ5dtjCVXlR2ulweKAmZoJwvP1ZKpVlbfKzg6iQ1BULM8nhKzYoaghC+CLNvJ4j46aG3FiiHiwwNKXUSo+p4FHx9mdKNjwv/70sLKT9BihO+mOc2DZGM2rbM/rDrcmCTDpev+uYMzgBAMGdAjaz4Px10qQFH5ayA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=biLmrTdjwUU79S4b2b7WVQqbqZn/iIHJPNDjX+nl21g=;
 b=DDC3dcY4j2dkGpeFMxsrBXFCdRjVc4lx8nkxSdv8HeOl6qUn922NjX2DAfjfYaLgXe3bgZ4qIt/42ttdNOrtYrB6oLO+Ayk0vOW8+r47CszK3IwDPkmRkc/6jWB1bkKPy5ZW2dR9iHfc1w95TsXmIvDTC1ifCgN5Hr6PGZH2ZgY03kUyghJrv+VZwQZnSc0ISNoMZAqBeN93Oft5WgBJKyPZd9o1Zv3rD9Z+VkPe8ugJ3vQFZy0oFkBzsdHD8UJOiBS/8Q/uLPC9tcYFi9/d7/Be8q5tDHSsRFgrMnGmiJeNZ+Fwwb/O3zq4EB5ZrgwASLA6yMv/H7r72XuUXTSweA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=biLmrTdjwUU79S4b2b7WVQqbqZn/iIHJPNDjX+nl21g=;
 b=JGPmbHZqXU6ern+gWx+9qBkEvIZlP0LmdJRu7WsSqSURjyrw+v/tmoX4fxcog40X3iCODIRdG3BPWLzntAr+SCWZi/vAaW26o0yI5j2KdUiwxAK2aZgTE3yYHfgrQxli1LijjY7PaorRUhznIyY/IKPQzUf7rCbWyIJQhvWVaG3lPDXypXAq/MdSgdAwmzr/sOk+CWV148C7AQ+tv4yFORdMISznEz59BDV91lY4dlk21XLIZ7/MI4gVzBGmfbJGRUT/tqxYeXwM8fxKQB76B6XdbrLMUrEblZMrVMI6T7pgNXO2ym8qMMIkl+exYhm1PQu/iS3Y5S22bFNwq4mfBQ==
Received: from DUZP191CA0032.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::10)
 by DU4PR07MB11615.eurprd07.prod.outlook.com (2603:10a6:10:618::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 09:19:12 +0000
Received: from DB1PEPF000509FF.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::14) by DUZP191CA0032.outlook.office365.com
 (2603:10a6:10:4f8::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.11 via Frontend Transport; Tue,
 11 Aug 2026 09:19:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF000509FF.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Tue, 11 Aug 2026 09:19:12 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 11 Aug 2026 11:19:11 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id C5E5C4020ABF;
	Tue, 11 Aug 2026 11:18:54 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 90F25700DBB0; Tue, 11 Aug 2026 11:18:54 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <richard.purdie@linuxfoundation.org>, <paul@pbarker.dev>,
	<Randy.MacLeod@windriver.com>, <alex.kanavin@gmail.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH 0/2] Mark recipes whose point releases are fixes-only (3/3)
Date: Tue, 11 Aug 2026 11:18:41 +0200
Message-ID: <20260811091843.3420858-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FF:EE_|DU4PR07MB11615:EE_
X-MS-Office365-Filtering-Correlation-Id: 065d827b-256f-4f56-bd56-08def7899b6c
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|23010399003|11063799006|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	+f3jLSfatrFuuSjDO443q3hAX5PtJRCWBBQgDybRWvEDy2FCcw32NJNICItkQWEotZaoDuVdtzyAGBD+BFnNZdM6bUYeuoo5jR/VTgP2d0ckhniCf0MbzZWANOID9ppuDjiYbLw7mOgMVKo6IZz8vaiuQsne5Ncina7hdCtHXNwL6XvcW+kcNu3Qmn1HIIYmIZTzA7vTR4Hj7bl03lu+pPWdK0P7FEADQ0AHBgCldYXzJXb7WTptZ4ylGVfYztobgLmKzjCGyUzOwy3nfjJMNTbQTUHGDraPLSsTgRvuK08BMRNV6xReAvLzU+NC0iWu+ybriO7C0lsDt+Puf77nricUhP0cRzXIMXS4zQzV52kI+N0ApJDEyjQUhWlLm8TBAu+ibYK3TP+lnmf0k60bb3nUD0q5l++GOz7hj3Kdq/o4wYr93fP++OCX02+huoolrSZFC/Dh51hxthZJuyXtZ73oRSvAOnus82mC/12B/ujtKWjc6x0rIuDseuekGvp9dIvwJUKfNqrf4OMUGxRgSI4UmCOJ5jcswpbDC8J6ukhAjkV+/Kt0eWAizRh2gDZUOTvx0z8FVpYUj4nYCgOXBCqgl1fb3mFsueGE0K5bxKSasMgidttlImDlOAqPVE1GApr/GMJvqg0l4g0xXF7wSXqlEQRn5QNSqATRzNs++pTP+JM+ts42JBOuJ5Zdfm6YE8nt8xbzgzwEfS+ea5EPug==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(23010399003)(11063799006)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	CzSaDlMjChAAlvk9aL/kbNyIpmOAuZmhr4t6EDRcZIX7RIf1pcHRb3Y7eMwTwFClPNmry3RGBhSjZCCMhHl4SSmkDEfLCBy16UMZv1Wnllu9xbFCgSazHvsaYTwguOgWVUsb6SyAH6nkS1mEjPNS/lOmAannSjiFVQ1omoRRcH+L79yfBX5jRx/w4M6JqPr15rhE/B+SZql+Ch/leSlMUOXWL/gdM7NnT+DBOmdvJHKiCLzUk6Y7TYYvZLELkBSyUW4KPZanBW1SElZl1wdDP4sW7G8bCs00HQys3M6/6GuaF9V1+TFX1N/ajeAAQGZ+QnKsV1q6iAvEEZlYk1b0W0Psc1+029RatoSOT8pjdMKOZZv0mbhwbAcYwzL8Az0o3MWfKzizPNe7WkRXc85KjUfY6QrfgQflfz1ub1IetZsSTEkaAtE7jIf7I4HLqcst
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 09:19:12.2538
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 065d827b-256f-4f56-bd56-08def7899b6c
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR07MB11615
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Aug 2026 09:19:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243175

From: Daniel Turull <daniel.turull@ericsson.com>

Last of three series opting recipes into UPSTREAM_STABLE_RELEASE_REGEX. The
first covered recipes whose upstream publishes a written stable-branch poli=
cy
and is merged; the second covered recipes qualifying on branch structure an=
d
changelog evidence. This one covers the remaining smaller components, which
have lower CVE exposure but the same kind of evidence behind them.

Daniel Turull (2):
  lttng-ust: inherit upstream-stable-release-point
  babeltrace2: inherit upstream-stable-release-point

 meta/recipes-kernel/lttng/babeltrace2_2.1.2.bb | 4 +++-
 meta/recipes-kernel/lttng/lttng-ust_2.15.1.bb  | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)


