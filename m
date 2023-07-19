Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2178C001B0
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 19:49:06 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.80])
 by mx.groups.io with SMTP id smtpd.web11.4916.1689796140404663736
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jul 2023 12:49:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@welotec.com header.s=selector2 header.b=nz07f+B2;
 spf=pass (domain: welotec.com, ip: 40.107.22.80, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7BL9Pfi2FffE8K9+WRqRD0I9FLtuAEo0S5m+v8Tf3TFg+qG0yCvzPptniNQejjM8U2Ebhvn5VZeYAaJNUEnxruTi/ye05L3MBKgyKMjqd1Sp9lwi//RfgVDeQvtRrng6G9Q/w0fQGubEptWqYUqIAsHtMhz9S8pr/qXiHUZQBI2TxD8HJRDqzHYhJgoLlfuWq8lrfsq85sGp4XnbeBctisGv/KONhlKC5gcctLZ5CLRHnyMJVcWGpAYV3fQq68RCICooK4eJHTLlODfJcVDdPnK8CSLTwm6t1sKbzrtbhHEW5e3AO/+kilQNWoIxXJjjpLvvX358KoPmW6kFnEBfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X2ZV6Y7oDIyu6JsDrEUq6/cNti1xzxCqlbDT3Z1eKls=;
 b=bfrK+Sd6Th+s8dAsYMGy0YxuCO+Keq1ZNUZLLxilVjQYZIUmtloAe7aucaRfUTGrwhgrduham1WC/lSzIPXX3aIM/YMVz2mdjaxEpENDaJDcsM9iN2IIpunBTNkp+tW/GgMf6aXo0SWJNxoikFKgrMvTA/nnmQv0DAg+bLmRVGj7VSR5pRmHQF5rmIIfc4G7X87AhC4RH2KAvc9MXrRatju/76WJar3pk2laE1x4Zh8YooetKz+c3AoNsYwKhpGLthOcCRsmjYBmsWuyPdwB1DDTY4GIhkKVKtoTUpS9eCrZSWdYv6w0IuE08Dekbl71qCGQPZ/EFE1oUvQByIGWSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2ZV6Y7oDIyu6JsDrEUq6/cNti1xzxCqlbDT3Z1eKls=;
 b=nz07f+B2jIriOWfcJDJ9uZswjoRTi7Jyc45JtOPtsJOIomd8KnjiGxcj8HxehKqrNxJwN0nSK4/HmWezCxf+5GIKfLq58SjzlWkGF9nmrinOwxikuCeOkR8udvCwyOGhckPXCjQgwsZnB9fXMMgzjMs03f0liCxmU4icvW/K17o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by PAXPR04MB9107.eurprd04.prod.outlook.com (2603:10a6:102:229::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Wed, 19 Jul
 2023 19:48:56 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::461b:ecc5:5b8c:7cc7%5]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 19:48:56 +0000
From: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
To: openembedded-core@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v6 1/6] bitbake.conf: add acl and xattr distro native features support
Date: Wed, 19 Jul 2023 21:48:38 +0200
Message-ID: <20230719194843.330741-1-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR3P281CA0003.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::22) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|PAXPR04MB9107:EE_
X-MS-Office365-Filtering-Correlation-Id: b5c7dd31-89b9-4aaf-0c4b-08db88912fec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	stz+EDJkH0IDcUBKWIzjVmHfS/GE4Ky/aeKymSuCAqdsoZzRjSERsPjXGshh0lZgF+ByRAmoW9avBy+7/efssjLJaaDapDGlgCRmRURh67X5lOAUfvvveyDOLwirUC7DyNp9Nr0hD3YN+kInq+tqIDsQBfX7QX2n+JME66ENUGr5RxeSYR5uTOrLOWriba2eIe+LSTShAh4dcOG8t32NCKf49LV3Z+zDg19vyNNecI2mzFeIvup7P0+qG15I1kfFhltnj62ur80tBt0S4xitNXmxEJb7vivF9aNq0zk+LZSeHY25A2BhjEXo+m2QsjC/j9eFOFUut93Nr9ISiwZjr50vlHQ2jSEVcDWXcWUwimVD7nmFTgzJseRIr3SFckg3C6/3YWt9CCdvaZa352bEba7EmO71S8C9jizQgNZhu1XZGnSilxV6fDsPZtLcVM6v6eJxRvZpVuVOQgRwp9Fj+HAP2FWzA7LUkOQQwC0KuXsTgeGDHaBhPgRb9a2RMLbGK5aDDSN0vwVMiV3T2YNYgfmYFeLpBB5dY4nVKYwXc91CLurvdunT+Gyqd3B8baHGnzLDgnTNkJ+E2zNVd9/aaC+Mpvxov56/OQjU8KdM0rMfmhwgwPSQ1J5QRJpNjcyM
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(136003)(39840400004)(396003)(376002)(346002)(451199021)(66556008)(5660300002)(66946007)(66476007)(4326008)(6916009)(316002)(8676002)(8936002)(4744005)(41300700001)(2906002)(6666004)(478600001)(6486002)(107886003)(52116002)(6506007)(1076003)(26005)(186003)(6512007)(83380400001)(66574015)(36756003)(38100700002)(86362001)(38350700002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GDqXpOXhRqtbONuYq9P/+hHJThmpZgSBVSmSkrH0hrAV21utpmMKcRE6D3Ux?=
 =?us-ascii?Q?u4wdqjDoVi6i1i65KLzNZLFIZSB+1ENY7XbQt7spqPQkjxK7PbBfOLpT/Xg9?=
 =?us-ascii?Q?1h+GGaYRMlbwnFyykSlXMrKLkxuS72/PMPJ02c9i4/8mQ6GsAyBYeq3R9h2L?=
 =?us-ascii?Q?ySYGWzG7VNwECHb6N+Du/A4UCn+7VVvh2C53WBrsS542+BiTQbtXI6NnraHv?=
 =?us-ascii?Q?iZ3NUUKK8BNNj1vFZXZI/dQGIrPxoxqcbST+v5YFXybvvvshWOzuJrG/xgd5?=
 =?us-ascii?Q?eRSeYjS+BkWWUb6EW+WvyHhcg3T+XoIp56nn18iYij/uKFYyRjDmaiIw5HkK?=
 =?us-ascii?Q?j/7tCxTz00R5yX1tTgDySI/2L0/Jg3KWyyV0uXzEbILzruQwt8FIVCJ1+hl0?=
 =?us-ascii?Q?mBgmcqmeTJbkoFp3a/FC/JfjmAGpVngndSQnPt3X3BCig4aATDaAiqHr3RYy?=
 =?us-ascii?Q?MMuDACcfq7lIUydZ0+HW0VIrBAQpIWb1solnmUgxRE7BrXAGBGLV+wya4AV3?=
 =?us-ascii?Q?RpnxRmoLZIeHhJYmS+FfIYU9yb8JuiKVAtQTMzW31CXatRECtjciTFnnplJD?=
 =?us-ascii?Q?w6e2sHDM9cHTNFEn3uUVYaVvzfwZi8rsGLapkJNtm95CurxjzXAt0e0R6c1P?=
 =?us-ascii?Q?WDlHy5I43NN+sSaWurk8Rbox4P+ir7dn7gyJXruz8x6NnesQpy1wDzUzmwwQ?=
 =?us-ascii?Q?TBh4pPdY/76EnD4X4CU6VPPldvpTQmL/IMahw4ZJPtS81fkNQv4bucXbOPzA?=
 =?us-ascii?Q?CI5Gk7thua917NfO3mZDMXTl4rjGvYf2534g7867MJErSM7bnyqrODMLZK8z?=
 =?us-ascii?Q?/b6Gyfu/C1z6zeDB0GlMCQwSHKWk69Zw26pSB+iQjQ9ZgPPKh+GnZ5dne43o?=
 =?us-ascii?Q?XjQWw14dLb7YEHc3qrc7yHwEhEJ8Lq2eo6t5AFVnz8X0190ALBlTbx4F2KTL?=
 =?us-ascii?Q?0LaE7wzv5v4sPhIGWDxN9kvD4N2Ldi0mapkitJuoLpUJ3nOCMgUJeFOmF+ah?=
 =?us-ascii?Q?9wbSJ++O7Olp48VNM2k00w8eNn1gLiL5bYGUq89FaUXA1EcNZMIwh6dCd0Zv?=
 =?us-ascii?Q?488ktEfWeVk4wogtcF4PU0DrOai5kGiKTuo6wCQoPeM9R8/b7Jh6qrJ/WCKI?=
 =?us-ascii?Q?8gGLdqh1g5I5uLIsVWl2BgG8+nLpvmaYft9JFJUXXJGXEgHroRooQckaI54h?=
 =?us-ascii?Q?HwyJGPv4PUAk09YC+HoEe4roWMIDOGwIaaFJeiMRJQKBdR1Kj9G3HQtDunjU?=
 =?us-ascii?Q?2odwSVl9H5qfq09kCkGv7FLL2K4jxTRDFZ6fT2zV1+f+TJIIEXW0Wyd1Sslz?=
 =?us-ascii?Q?Yb7eH363t2IYRQEOZxjSeaKA9RNcIBb+Z7eVe7mT+LAUkMGsE60Cjd5OmBvJ?=
 =?us-ascii?Q?g1mNhmp+4GEJszJBJD7p5n93dCwiojCEIn3A89f8g/+F7YMjg4eF7dsM93mU?=
 =?us-ascii?Q?/m3dNuG5NBFgwmdhAZdSMCxuu8DiDqWjJq9ymtEGjxT8bsj5CW1qMRJGUkSG?=
 =?us-ascii?Q?ZgFprZo/Ewd/mF2+cPrkcR1CRvLCKl9yDfa3C/M3Ts5yNmdUM2YWktpfSoFF?=
 =?us-ascii?Q?YAZOVzw6XVEDP2i+LOnTQw9JQPhZ0jiGfg0isUKo?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c7dd31-89b9-4aaf-0c4b-08db88912fec
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 19:48:56.0947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /K3Huv6NxifRy9xaBzz0u1649wXIf7AEY6UbcHHd69q0A35iSV/pY8dWAOzGbh/6axEBU2Zxl3y07xaAn8kzaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jul 2023 19:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184594

Include support for ACLs and extended file attributes for native
builds, by default.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9625a6fef4..8daaaad615 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -904,7 +904,7 @@ IMAGE_FEATURES +=3D "${EXTRA_IMAGE_FEATURES}"
=20
 # Native distro features (will always be used for -native, even if they
 # are not enabled for target)
-DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 xattr"
+DISTRO_FEATURES_NATIVE ?=3D "acl x11 ipv6 xattr"
 DISTRO_FEATURES_NATIVESDK ?=3D "x11"
=20
 # Normally target distro features will not be applied to native builds:
--=20
2.34.1


