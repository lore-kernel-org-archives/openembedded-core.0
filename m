Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B249CC6B38
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 10:56:57 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.6])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18973.1792148207482022562
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 03:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=bD5hrPzI;
 spf=pass (domain: ericsson.com, ip: 52.101.84.6, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lxnT1AB7QyE8mJEyMKRcNz6GTfARpJ3q4DYdtlkdyXhOpKtD+WNZQCxaJUD+hoJx0RuKddgRbIkqhELt4tHssApXdEvFTDhgM7+KuR8V4lpODSHcydxmDtjJUtS2P5WJabtpZVisjVi5ueXOwdDMqa8NNfVYrIwQix4jqdLWQFl5hrOQKyGRNtmkXCyR0MnLIZXbja5eB5LL8tENRx79wrUWzdN7eSnnAu/f6j5+2D2McV0g9cUWRnzv8yhXf70tLw2oJzPMqjEdUyn9oYLveUBih71E7ChZPfdUuJ84JWz4fwUpoP3Og9aaPyg7YBHVo0DMF4a9D7qr6tchb7IDGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/GgacvKTT3WGMa1X4Z7KvEEwPXNHjSRy3xymlanM+HU=;
 b=oIyJlu5cNkUrTRrZWQg7gvmFKx++2+hX+N9XKLw1Q4TV1a0m6Z5ziY6avuseDd1UD/B5e2MpsSSThMM4aRuV8IwEN1lTKoDRNPDwKEhZVWxPB6sW4JJrPQvmWLsVgt6mGXiMfzc7ccmrJBfXfYc3nvLAl05dxNELROlyMr1dqfv+VzbNzhEql/8BjwOH07XcOjaj+OM9Tg0IqNgTRBb5Z7/pUDblHZq9Rj/lFMar7Xp2INtcIM4kZDTAlphpXbX2a8jmsuFC1ZvtC2Pz/72qPrvqDKCRpfjuzuz5gXygRehEmSstnOxV1aGi26kZbiXjMO5JPvcjng2jVVSq6LFzyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/GgacvKTT3WGMa1X4Z7KvEEwPXNHjSRy3xymlanM+HU=;
 b=bD5hrPzIiKA/us9xsgKFbfmLqpqKg+wJvgAKzdf27eyPW8uJ3lZ5QByPd5+2pTNYMU3tgSxXBDWwzIVMIsIVSVf8ZJbQfjpy43un/GZ3p0mATFUVw6/h3DAvyrK8YyKHWS4rwWWDEUtR3fmk3RcbBL2rfartHlyuToJQCCuNqCGKIkBEagQT33LMeoFuCcvg06DXAV3K5q2yuJmTwSP39cTWhFv/oiLhiHlZUpv/Y9DleKWygbnrGSZyex/tOZbgNkR20uFm/ftG8678nQ2SuaoToZn1ASQl0ee6eB1bGKgcp8ErOytPE01g1pZJUmlWcsaS3Gi7TYzq2JYu8sBRlQ==
Received: from DU2PR04CA0037.eurprd04.prod.outlook.com (2603:10a6:10:234::12)
 by DBBPR07MB7514.eurprd07.prod.outlook.com (2603:10a6:10:1e7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 10:56:41 +0000
Received: from DB1PEPF000509FA.eurprd03.prod.outlook.com
 (2603:10a6:10:234:cafe::f) by DU2PR04CA0037.outlook.office365.com
 (2603:10a6:10:234::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.4 via Frontend Transport; Fri, 16
 Oct 2026 10:56:41 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.176.1.74) smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF000509FA.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 10:56:40 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 16 Oct 2026 12:56:17 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 3E82295805;
	Fri, 16 Oct 2026 12:56:16 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 10E2B700CF34; Fri, 16 Oct 2026 12:56:16 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <JPEWhacker@gmail.com>, <mathieu.dubois-briand@bootlin.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH v6 0/3] spdx: add support to include releaseTime
Date: Fri, 16 Oct 2026 12:56:08 +0200
Message-ID: <20261016105611.330514-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FA:EE_|DBBPR07MB7514:EE_
X-MS-Office365-Filtering-Correlation-Id: aced01dc-0905-42ec-370a-08df2b7428c1
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|10067099003|18002099003|3023799007|13003099007|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	YALhFfI7La7lVDCECKnnXZ1qc+vC0stg5fxSSR11bzDa0z0BRZb5hFxQcjCM65ygts2hsjZnXJtoN0y4lfBLeYRPb9gfwSP0EN3zJKSrpt+0CGnlFz3YnJ8IBVIv4nQKEHMEDxaOQL5fvu4AJWDV402YI13qcgMc1lhwEysFSdzkF7g8EY8xaWhwOoHO+Zc09GbIrPgNuKsQ6eeOp3iPiU9Ve2OknC+PCfomoVs04RgEGRbJpkFM3c6XsEAj8ynsIhH6U/58n2Jf4Nace7h+XWRFD/5XCz+zAATVTaYhck5qcd1NTll5IHwh0LVGRQMvLskaIND7rRHJbOkntLXQs4NTSVdKzeKIqIGS1kye51qg/vrnHPwFzjXXOUjtycV38wr6WxCkkDCCWg6uuZi8Eo3pKjrSNJlomf/oxiUTk5Ozn5X8CJ6gkJu9EFpHdWiuvWsnkXMAW7TmcwqgO2vCyS9CGj8ABtvzibTqCW5uIQGETlW6+rJxZZY/8I8O9jKDzcbgNRBmtjbPVHwD/TK/5XAmqDm5KKasJRjqmcFj/irK6TzM9a355dDcxLR2EVJwGOdwj14FOGWiuarQ6wCCSA0amEi8jeZV2OEfUxaHIh0xl/pp9f7NF0KC0S9zh3LHW0ub2Hz/sosP5kv4xZM7+Ugw1RSWaErVizMn4fGC9Yk=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(10067099003)(18002099003)(3023799007)(13003099007)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	hKkmLH1BYP2/oFFNrtYmsIzTdEWQtgQe5Ixxs5Wrl1ssjlSZ8tFf8up/Sywzoga3WDQfK4Mbe4k/87+X2NKu+ln30R5/yK+sGWfPsw7zy3n+XZ+tixvwFmOUiv/Fz3JR67IUZitQmP3U94YfA0sne5adU7WfNiD9ZQmVPWlYZ/fFNJSBvj+rrN9aw6CXv9XSpkNyNEOqAck4qTTksp0gAwl7j4P+db7M7ge+w4SV7u/aPaSPEo1RtCDkUz8MP61DHUyplHPERh+LkyKY/K3JWAGn8rq0PYfcjCc/gD84j7t3/51/vxWvyZlVZxatJp1mVMEFpRKV0zurOTB+m0v+7P8JEYFEfMsW0963uH2muNpkpy7HOAQqDyfjfA2r29tu43/FbZwzex470Q2HQ1HKQ8zCfqqFFtcFYVkfIc+q0qzJHryJeN5IoiCNPmV3GDox
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 10:56:40.9014
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aced01dc-0905-42ec-370a-08df2b7428c1
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FA.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR07MB7514
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 10:56:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248012

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

v6: fix first commit for __CACHED_SOURCE_DATE_EPOCH and use same
function for getting epoch as SOURCE_DATE_EPOCH uses.

Daniel Turull (3):
  oe/reproducible: exclude __CACHED_SOURCE_DATE_EPOCH from task hash
  create-spdx-3.0: record component release date in SPDX output
  scripts/contrib: add spdx-release-date-report.py

 meta/lib/oe/reproducible.py                 |   3 +
 meta/lib/oe/spdx30_tasks.py                 |  25 +++
 meta/lib/oeqa/selftest/cases/spdx.py        |  42 +++++
 scripts/contrib/spdx-release-date-report.py | 191 ++++++++++++++++++++
 4 files changed, 261 insertions(+)
 create mode 100755 scripts/contrib/spdx-release-date-report.py


