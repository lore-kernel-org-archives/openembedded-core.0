Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F0D6CA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 19:04:20 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66566.1790622254697597902
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 12:04:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=AdDj9EqL;
 spf=pass (domain: ericsson.com, ip: 52.101.84.17, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t3l9mQRsxIs1vH/TeL9r5htUgdycWLlfrprISBwOyq70lShW4O9KR7ascNjMK+P+dCgsnjL0/aRFqqIzwkth4Z+9S/9o9UqgeC7DkauUElBi+nniZv3JE69eYLsaQgSsnA3uZyCEGz8Pzyssuo+D52TccjIOuDQxihl7WDz05Z4dCBsqzqzvbXrq/unyYKZf3VIzyUbqRSND260XDI7SJEmXcekrFvnUfCXecRkScsrniTk10UY8/3ackjThwXNj4Q1n44KZz1hZPSjOY0auYNhVda89fFRZRfTjiUHzMPwgdvF97H6SGnFpcy/X4fZfLlzYvNxHyrnXjL/CEU7jsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PD3XCjl8+1QRZEW+lmpEe+zZ1PT/LULwNniTzfBhecQ=;
 b=LGBbwW4am3mxkoMN51voAz7WOObcJIfN05cR9Omo2U+ib1nXggSQ9wjS1NROIc6DqoxjDoYIIUhdduQF/v2X1bBORddwVAKYRdBRWUWUTfOuIXCAndCm5S8ZIpEeBV1sdf23nV9c+aRo3GvTN/Q14PgC4yCIuffWnuSb2RHcnHMn48VGfzAnLVulgc8QOtW6GrJt/ZSEmtLy71oogIUO5TfoD7fXzK6AHnnKV5pIahA7LRhELt8HARDfDu9r5xQVNKMaHrWg8ZuGY77lwLORgdhrY0+pXPX9NOSlRyqqA3UM3JbCUkAhUko7I0UL5I6ef1KaSP3fElXTApgZSQLAEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PD3XCjl8+1QRZEW+lmpEe+zZ1PT/LULwNniTzfBhecQ=;
 b=AdDj9EqLelYszqJOOsIKBBoKAqDKqkhJYOFR3/zwYJBQB9eBTuTiI5a3Z9ITNy527SNMntg2Ds+3pDTSy47uDHhOdr1TZBd9lwnv2DECggMKz2KPREGu4sqjOSe5eOrPEgVlfrLBGem3NTMJelTcKzpFCdW+y6LQ2JvLb+z/C4q3fqRi38BIFWRExXfdoRQrL9au1efBwaqxP6/Xzux6VcUW/u12zYtPAG44x0Sx5xJn5GzFC8WEpm7fDCE+EE4vuvceGcnxMxiE+6Vh7UFIv+7yBFsW8W1PO51OgWJ6ggJq+hO9rT6Kdzj3UcvmWDTMfwrdi8I+ePM6QyH/I7K3Lw==
Received: from DU7P250CA0019.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::12)
 by AS8PR07MB7221.eurprd07.prod.outlook.com (2603:10a6:20b:258::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 19:04:09 +0000
Received: from DB1PEPF000509F6.eurprd02.prod.outlook.com
 (2603:10a6:10:54f:cafe::7f) by DU7P250CA0019.outlook.office365.com
 (2603:10a6:10:54f::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.23 via Frontend Transport; Mon,
 28 Sep 2026 19:04:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.176.1.74) smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF000509F6.mail.protection.outlook.com (10.167.242.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 19:04:09 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.60) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 28 Sep 2026 21:04:08 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 16C744020B47;
	Mon, 28 Sep 2026 21:04:06 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id AA8D8700CF25; Mon, 28 Sep 2026 21:04:05 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <JPEWhacker@gmail.com>, <mathieu.dubois-briand@bootlin.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH v3 0/3] spdx: add support to include releaseTime
Date: Mon, 28 Sep 2026 21:03:57 +0200
Message-ID: <20260928190400.3908822-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F6:EE_|AS8PR07MB7221:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bb6bd4d-17fa-4f48-4fca-08df1d9346e4
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|23010399003|1800799024|10067099003|56012099006|11063799006|3023799007|13003099007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	7oeYpNCKbEykZQiJxmMHrKXGnNrjX7AvN4tR9uln8ERyjGuTove7EUC7E2w7NA61FwlIDySkYsn/qOMnCroy7k2W9BsK7IDd8AGviHn7CVyy5Mlx+Duv6nGqyawmuYZjJZTcVRDwhxrwSCaLvxWHeAkX80nv7tQxHGhaFw+OMEvNnol4HVs4CsXi9PQbMf/x8voQAXVzihDfstBKsGA3mQw61OMaG6BnSSIW1grSEkc6zJx+XWfX63q7NVLiBsuDIqM/GyG+H2rl6azZosfHUwBmHceQl+YuLlJ5AmxB9X6WH3jXNX9e7SEC9mu9ZffB3+K1oq/Tjwpc65yzr0Qd+sm+6Ta33PhzHTweVgVC2UqrqjZVE+yIeBnGBAbmDRPlabl4BxUHdddEr4hmF0m4t4yUH4ZQjImIfPRhLa5fNLpEm4Nc7Vz+PIhrx31xud06sNszpSoN7YxcoydYMqy0vij0iJmCie1qMfZ/W8I4QBd3SHpSr8DD8H6M//ztAo9PVHq033X645SY11oClcF2bDvaG9vDdAE4rGaHuJaxkhcj0jG/hyX8MdDc/JjnsBGh+yTqNwXyz6Fqjmd1/FhTyhmXfnhytjoZvTxBrPp/FMWfkcFh5CPYmqS6PDp4r8wP8Sf4c0dUk08lyLlAPEVbFKwZxyd4Z0IblZFuiO8ysq0=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(3023799007)(13003099007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	/UDuk/YAcfzcoGw6gfJGKKD+WEoWd3KseDFwsHFAt3Vi8u8LTscbLCbjDDnK9y7OTsEe9NY4/Dzg+mTVx/qr1GzUEVDl766ODDoDJZWkyI05LLf5XOFYXI6c20as0E2GxOyAjfGflijUUq+TgoB4xwACERB4UGFLoz9kkOzIppjtc8guXwvaH0tiIYyvWlXrOGYG1z0u12vejbT18tyIuElXheUGnqdsLVxpHz0SHDtIxaBprBaaQ33mMknw6KNiV6s3MH2R6en7gTsSuZhx6YwFxtdAJdz9htS6OuoD/T4u2PzzxRgM9V/3fA++/uRdc2+R4LD607DHhLXm20mB/7nLXKsXGANlHPTVWH2fGOMR280moW3z4nYBDwASzIzYwym6ktBzNOEcHdthzkaDNlYLwKCm7LYhI72XcAT1yFeeiH+VIw1grbSlujUm2tho
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 19:04:09.5780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bb6bd4d-17fa-4f48-4fca-08df1d9346e4
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509F6.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR07MB7221
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 19:04:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246788

From: Daniel Turull <daniel.turull@ericsson.com>

We have a requirements to include release time of open source components
in the SBOM. There is a field specific for that in spdx 3 spec.

https://spdx.github.io/spdx-spec/v3.0.1/model/Core/Properties/releaseTime/

This can also be used to evaluate how old are some of the core
components and decide if they need replacement.

The previous 2 versions did not have cover letter.

Tested with oe-selftest -r spdx

Daniel Turull (3):
  classes/base: exclude __CACHED_SOURCE_DATE_EPOCH from task hash
  create-spdx-3.0: record component release date in SPDX output
  scripts/contrib: add spdx-release-date-report.py

 meta/classes-global/base.bbclass            |   4 +
 meta/classes/create-spdx-3.0.bbclass        |   2 +-
 meta/lib/oe/spdx30_tasks.py                 |  19 ++
 meta/lib/oeqa/selftest/cases/spdx.py        |  39 ++++
 scripts/contrib/spdx-release-date-report.py | 193 ++++++++++++++++++++
 5 files changed, 256 insertions(+), 1 deletion(-)
 create mode 100755 scripts/contrib/spdx-release-date-report.py


