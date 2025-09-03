Return-Path: <christian.lindeberg@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E372DCA100B
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 06:28:18 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.23])
 by mx.groups.io with SMTP id smtpd.web10.6123.1756880891328881518
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 23:28:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=PG/5amXd;
 spf=pass (domain: axis.com, ip: 52.101.70.23, mailfrom: christian.lindeberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BvX0tdaiHmQATqSt/bxCgrYOFdhfRYApSBhGXbApzOogKejGikb5ftIq1rmbGKN5kcO8flHcnJ8oRvzsyEI2/lp7p3+KWyw8UdLn1U/6jrZRgtPOJQc7eqYOZXBIROCD+t4HXkkgHynC+DS/G9w+szr05JX1P5xq5VpqUug6ALv0V76Co95Xan74W9geVL0Dd9XBidorTvhz5vRkAMkz7O2iORPxfLqght2u58LuwoLhF0MxJ1jr372i4UP/TflQ5pvlREw1bzrZX5MFITGmlvsIAIVrpF73luinaIZMq0jT98EkzLMFyahgHRaqP3JFhyM0hR2uo4dzmHq5cjAfsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PvljVgKpuh12MGwRs9NkIeOGHUiPrC6PTWMoe6vvM4M=;
 b=mvFKCGPl7TGjairNUvDRwY243ls0nxKZp9zXhN+XV9zC7FmMcoADpRIr4Ew6yyrJyRkOh+4TvB3th+3c8UPvHW8sLYDk+CRH1Ls0tuOOaA6i7/oFOz8ae9RyVLl370s3krFlg7aj1zlxWTYhCo5CGgQHh0OMyo4YZ4LNnM2VO/628FZsjyGtgvay1LdknPmYKT9KAMNP8xtTlJkFXWHHG0YypBhYKE9MligSc6mnYfRtvznZ+EpvPOieiQazt5UtesKyyvROOWxT9Jmk7onOSP+m2ZFwCK4+0ankIuU/QYU3AGkYnWUwPH0pVOiAmO9DDZ3RuHwqZ28Tdp8Wo+dlBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PvljVgKpuh12MGwRs9NkIeOGHUiPrC6PTWMoe6vvM4M=;
 b=PG/5amXd47nw08MCTqPcPWdjRlPYukRV8SQtCBtwfvXk8kPcUFZ/wRylAoRJYHEj92y4ReU10tte/PtOFLvQfIq//8cUEgl5BGIQgcx9zLnt8ouP+h3GNUUzQG3idFkt2LNmydvtDFJ5F3RVn8N7aTULaoUhCG/FTcJknoJJIIg=
Received: from DUZPR01CA0134.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::9) by VI6PPF7108BCD20.eurprd02.prod.outlook.com
 (2603:10a6:808:1::30e) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 06:28:05 +0000
Received: from DB1PEPF000509E7.eurprd03.prod.outlook.com
 (2603:10a6:10:4bc:cafe::48) by DUZPR01CA0134.outlook.office365.com
 (2603:10a6:10:4bc::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.17 via Frontend Transport; Wed,
 3 Sep 2025 06:28:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509E7.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Wed, 3 Sep 2025 06:28:04 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58; Wed, 3 Sep
 2025 08:28:04 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 3 Sep 2025 08:28:04 +0200
Received: from pc50740-2234.se.axis.com (pc50740-2234.se.axis.com [10.94.131.4])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id CB30CD9C
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Sep 2025 08:28:03 +0200 (CEST)
Received: by pc50740-2234.se.axis.com (Postfix, from userid 21184)
	id 4C52F2426D09; Wed,  3 Sep 2025 08:28:04 +0200 (CEST)
From: Christian Lindeberg <christli@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 4/4] influxdb: Update module cache content
Date: Wed, 3 Sep 2025 08:28:04 +0200
Message-ID: <20250903062804.614744-1-christli@axis.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E7:EE_|VI6PPF7108BCD20:EE_
X-MS-Office365-Filtering-Correlation-Id: 05fa24a7-a5c4-4668-d3e4-08ddeab30a32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LN0WzBWCCoQFH1+pZ0kdVqSragfskw4Xd/GaLr/Y5FVsa61FUCTSWUbZvezZ?=
 =?us-ascii?Q?zeYiRYatOp65ueUBlYjbd8NFKpBVqlJ/ZBiEFU8d+0enuKYPxklq4MAOTAy/?=
 =?us-ascii?Q?ff+fOfND4504Vdwwlfb1WHUgjifXaCssnkKvYRYWMmatKIrHR40GRLtUT2LB?=
 =?us-ascii?Q?WoKsJqZHzSo4tgJi+tBn0nXxtjcCYVq/Dv9QXBK26nMIQvIOhlleO6R113A1?=
 =?us-ascii?Q?09e/QSNZL6sjLN0rFxYJUKXZyxdiFoS3Q7rOT+FBQCUxDgKEJ/w2pwKQ9LsB?=
 =?us-ascii?Q?gM3+HnujwYEPfxmfrYfq4TZrdg+UXal5Dti/ice+Ks93RWc8AHvlTCzp9HTs?=
 =?us-ascii?Q?gJhcFdKdKlNb3UUs9w59YA2G5n0gxu0A4Kr1xvU55azOYHWGhjb1SA2jwuIs?=
 =?us-ascii?Q?untHSFEqXHPjdtD22dvOhbUZlMponwA0i3murNb77Ek5JxWF335yHCKipoPU?=
 =?us-ascii?Q?QvPLL1PWBZgpdURkfRX/O2PMA4kNGcdw2ImPoQ7ZCGGDqG5SNHngkPj88zkv?=
 =?us-ascii?Q?c3AI+XCXx/PtfBKsOc9VK2aU0ugwcrDlU7dMd1UpZHs45x4J/Bue0nczc0sr?=
 =?us-ascii?Q?zqRMMKB/VSypzbQwosug35jd2oJ2g39B8auTRqVFZHK46JiInn6VGHzQ0bEZ?=
 =?us-ascii?Q?datqsg/jeoBZpixCsauE31M9QM9vOYy+OeFzr7EzsOCD3Ixc8u3e3X7s79Hy?=
 =?us-ascii?Q?kgNAzWDKu9DhIwkXprcHpqtq6e3oJ0YHOouo+zxKrltTHvD7XqrBF+gYcsaC?=
 =?us-ascii?Q?b/RKNL6qls3nY7cmve8CVl/zJl1zcLROOqnLmpCAU6aCT2XyGjVBHLrzQJTL?=
 =?us-ascii?Q?ui5CyPz2Y+UTeDFKcCQyq3R4i43vSajCv7ORtAKi002D0S7YKmOBFyPSpxTN?=
 =?us-ascii?Q?Rr5U9NR7dReSFF3xlmUzriN3uEmFhbElYqN8GRbsz8MRL69s9TU+udwEma5T?=
 =?us-ascii?Q?409rSHHu9xtsTYmUEtX1VbIpuB3y6rympQLtCdYAfetVmOIOtVyRStmCF0Jt?=
 =?us-ascii?Q?2TTYa51dOdRy02A7xAv5rBaD22wT1sEqaaHPEoNKjOWTuxBuT/fl91vElimf?=
 =?us-ascii?Q?7ODUT2rFzf3V1GzvI2pFlmOv3GoRjteIEqtfbK/7FxZOKZU//pEs8+Cszg3p?=
 =?us-ascii?Q?5lY4TEiUFYCyRpvWej+hymzd6xwLVvs1ffJiy2nPfR2YPIsfsArAal4rv7lr?=
 =?us-ascii?Q?YJa89X697aYh8bJOzlBhIRJvKG6ExN8J8HYVdwjj84mCpjD5v6NosFTIo2DQ?=
 =?us-ascii?Q?/z8VZASnrtQtQWeUZNMIJLA3ueDHv61stEOD+CHLRzyZMwkboprkvQvGXDaA?=
 =?us-ascii?Q?C9SeH47n3jww83qCHZhkUSNMsnPkOw8nQYjfNf4RPZmdFlE+Rsn2pqgMG40H?=
 =?us-ascii?Q?PcvlX0hBOSV320ZgRJe9EglhvpI3bNJtNdJRQH1w0yhAGQ26WMW0bdN7PxpP?=
 =?us-ascii?Q?ZSrJnb/p0qI21ls3rtmXxDQR/oO+fg2svxwm6yuMfnvgc7YHzfhnaw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 06:28:04.7093
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05fa24a7-a5c4-4668-d3e4-08ddeab30a32
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509E7.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI6PPF7108BCD20
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 06:28:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222846

From: Christian Lindeberg <christian.lindeberg@axis.com>

The Go module cache content URIs has been regenerated by listing
dependencies with "${GO_INSTALL}" instead of "${GO_IMPORT}/..." as the
package patterns.

Signed-off-by: Christian Lindeberg <christian.lindeberg@axis.com>
---
Changes in v2:
- Reverted unintended change of github.com/klauspost/cpuid to go.mod
  file only caused by change of GOARCH when listing dependencies.

 meta-oe/recipes-dbs/influxdb/influxdb-go-mods.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-dbs/influxdb/influxdb-go-mods.inc b/meta-oe/re=
cipes-dbs/influxdb/influxdb-go-mods.inc
index e191426431..e151404cbf 100644
--- a/meta-oe/recipes-dbs/influxdb/influxdb-go-mods.inc
+++ b/meta-oe/recipes-dbs/influxdb/influxdb-go-mods.inc
@@ -144,7 +144,7 @@ SRC_URI +=3D "\
     gomod://github.com/mwitkow/go-conntrack;version=3Dv0.0.0-2016112909585=
7-cc309e4a2223;mod=3D1;sha256sum=3D3f15a518f37228f2d08c6b43762d43869a5ab8ae=
7ba3b5124bf961035e71cc18 \
     gomod://github.com/opentracing/opentracing-go;version=3Dv1.0.2;mod=3D1=
;sha256sum=3D5b59c67ddd6e8f240a0008f739d14875c1af800b8e1b23d95c10c8bea49655=
d7 \
     gomod://github.com/opentracing/opentracing-go;version=3Dv1.0.3-0.20180=
606204148-bd9c31933947;sha256sum=3D9f713f45fe865453738633a69f35c8279ecb88f1=
30ca2a140a7b44385656f776 \
-    gomod://github.com/paulbellamy/ratecounter;version=3Dv0.2.0;sha256sum=
=3Dfb012856582335cdac02ee17c08692d75d539158a82eda3a26fb8a51d4ef27e6 \
+    gomod://github.com/paulbellamy/ratecounter;version=3Dv0.2.0;mod=3D1;sh=
a256sum=3D775c317e0e805101aacf9509f43a700e945f81a5348fd963b4db1a47d7c1b3bd =
\
     gomod://github.com/peterh/liner;version=3Dv1.0.1-0.20180619022028-8c12=
71fcf47f;sha256sum=3D0d96c450f9c55a8102f4ae7fd8a583ebfaeba23e3939d6b6284306=
a82a21430f \
     gomod://github.com/philhofer/fwd;version=3Dv1.0.0;sha256sum=3Db4e79b1f=
5fdfe8c44bf6dae3dd593c62862930114411a30968f304084de1d0b3 \
     gomod://github.com/pierrec/lz4;version=3Dv2.0.5+incompatible;mod=3D1;s=
ha256sum=3D2a50cf1993308244414372349e500770dde0671ee259159cf305f4b1f84ebae9=
 \
@@ -161,7 +161,7 @@ SRC_URI +=3D "\
     gomod://github.com/prometheus/common;version=3Dv0.6.0;sha256sum=3D6fb7=
4cce1a5bd84cf36954493d6157b1bd2231b20ba2587c224df9737b579314 \
     gomod://github.com/prometheus/procfs;version=3Dv0.0.0-20181005140218-1=
85b4288413d;mod=3D1;sha256sum=3D52ded709607588200eff4bcfbd61fce32bb0c3f0efd=
d32d846e3ea150b196352 \
     gomod://github.com/prometheus/procfs;version=3Dv0.0.2;sha256sum=3Dd5e9=
430b0a3209ccd75569f7c6f9c9fcfc48f554557f44562352adab9c617464 \
-    gomod://github.com/retailnext/hllpp;version=3Dv1.0.1-0.20180308014038-=
101a6d2f8b52;sha256sum=3D7863938cb01dfe9d4495df3c6608bedceec2d1195da05612f3=
c1b0e27d37729d \
+    gomod://github.com/retailnext/hllpp;version=3Dv1.0.1-0.20180308014038-=
101a6d2f8b52;mod=3D1;sha256sum=3D57ec187307e4b0d0457a8a28a6a32f683e4cfa374d=
2449fa72838a18b1230e2e \
     gomod://github.com/rogpeppe/go-internal;version=3Dv1.3.0;mod=3D1;sha25=
6sum=3D33b55e839b0754283c3eeec1f33e16cc66432dffb8b8a96d24f536d01e51495b \
     gomod://github.com/segmentio/kafka-go;version=3Dv0.1.0;mod=3D1;sha256s=
um=3D02ca00937516b509446c5eb0bd0a4e613b76388af2a65e58f9669434ca0668b6 \
     gomod://github.com/segmentio/kafka-go;version=3Dv0.2.0;sha256sum=3Db2a=
88eb5b65fbb75dac0ba5e721cd2cb8e39275d1702a0f97e3c4807d78e8b48 \
@@ -170,7 +170,7 @@ SRC_URI +=3D "\
     gomod://github.com/smartystreets/assertions;version=3Dv0.0.0-201809271=
80507-b2de0cb4f26d;mod=3D1;sha256sum=3D75ccd8771f23a04379e7631044c4fb70b49b=
27a09650299752ee712f08a6add7 \
     gomod://github.com/smartystreets/goconvey;version=3Dv1.6.4;mod=3D1;sha=
256sum=3D37e964c8dc1be33116055227dc75838037c5b5cbbe1b7923d6c6270d0eeafd05 \
     gomod://github.com/spaolacci/murmur3;version=3Dv0.0.0-20180118202830-f=
09979ecbc72;mod=3D1;sha256sum=3D55565ffdc59d315a952774815afa98668ab9011e8cc=
11e35be5243e63a23260d \
-    gomod://github.com/spf13/cast;version=3Dv1.3.0;sha256sum=3D001ed519a3e=
c007e76e639f72bd9560be70497d499acbf1a32ccf32dc4647d91 \
+    gomod://github.com/spf13/cast;version=3Dv1.3.0;mod=3D1;sha256sum=3Db98=
f2c1774e0b7c0c5747531a6a0c6c8c25a37cf397ff05f1971bbdd97d52fae \
     gomod://github.com/spf13/cobra;version=3Dv0.0.3;mod=3D1;sha256sum=3D41=
ec7f1a12f7934ac349ac6b87d99bc43a8ec4405ef968f3bf0bd0a32625d76a \
     gomod://github.com/spf13/pflag;version=3Dv1.0.3;mod=3D1;sha256sum=3Dc0=
119b5dfbbf3c0cb02b168ce0fcc19e7edefa73c9844c4609ebcb57f4394d14 \
     gomod://github.com/stretchr/objx;version=3Dv0.1.0;mod=3D1;sha256sum=3D=
1350354d52d2287a62336ecc0d56232d4c47699af9bba49c67c2b48254da98f1 \
--=20
2.39.5


