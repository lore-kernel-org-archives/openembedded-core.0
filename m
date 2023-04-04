Return-Path: <thomas.de_schampheleire@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77FDDC77B6C
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 18:34:33 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.139])
 by mx.groups.io with SMTP id smtpd.web10.110220.1680633262892860774
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 11:34:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@nokia.com header.s=selector2 header.b=mD787Wuf;
 spf=pass (domain: nokia.com, ip: 40.107.6.139, mailfrom: thomas.de_schampheleire@nokia.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zq+7ySmbE6pQ+OASdC6HqLfz0Armi5zWodUm/B+341Ngjkh/TtqDascKosEGrPnB4qRmhwrT/EGOSmUFJo1RxzVfqeSL9bc+R4YnPO7K2T2YponCWYFnVa3dnmWWWvpRmNTFXEAy/LMzbKKUcA+cyEg018BvkE2DVKrIyJKN0HJiLZgZafarNBChw9pgk2x1oWfGWjg7lZzSQ7AuWx8fLkJCKk5w726hVqnHUj1RUUqnGELXXhrll6KEpAdy66xbdW2xiyXrfQuC7yQbf+nz/x0NPWojGHCKsAPHq49o88GT15YNIP7uZ3Kxs1N9wFm9K1oVpfis5iYxtDsNsk931g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKpQbpJhqEJqlFzhDr0Oc2jpwYQx8w5wJCeq5Hwmpuw=;
 b=Tjfaxp+uGHuMBALCAkf0d9GIwJdrNUn9s1iZueiDIvrEt/SCnZa038rxzLYHddKZTaa3UmB2dZdG1fHdaBalc8oqTJ5+Ya707frs40qXaQfeJRuCKZYDC1DS13lYGjBU82LSS0u7TV/bqML72ItlKjzDfpEFnIGmnxyjmw5IaT7xkGNIPGhkWrVviaZwbWQp/agqiwOBaBOrDV9A4dDod96hx+UNk2jYz00krPLXeo/pOXnaE/ypsgRmaFoMCFu9COQqRO6wJNT42WbHwGxSwrtYaMKKkGNvxqUY0AFbG9deRF+xZcQyjBkWu0iJfOEKIBKxolCWhb+Lrp7QlLQcbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nokia.com; dmarc=pass action=none header.from=nokia.com;
 dkim=pass header.d=nokia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nokia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKpQbpJhqEJqlFzhDr0Oc2jpwYQx8w5wJCeq5Hwmpuw=;
 b=mD787WufX9SsZ+o0zMvBebMBH03QTEBgmII3p2LuaYs2/q1dAXNCR+JZsNjfjTWZ9wcV+fjq+haazrdBeoqIymPS9DsA3D+Y2U346TQHZOHO6o2W9bpM5a3AHCy5SSrOH+FVqgw8GcCvArMFX2sOGYkX8K+wSjk0fHOUaQDyjoa48XRWJ1Fb05urfQzldL8+b1mfeU9ZIbAXdi1FCerdTVGnTTJKbkrocIyeNU/bYwCmiPhBe2XWTXM+pmsFoKPZxrARuPeZVbINhOuw1GuxzqxoWFICBZWl+fr0dW30oo/nn5MA8NMlzr+CZKwXSsDegMeTdTzHLJv6WI6EhtT59w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nokia.com;
Received: from AM0PR0702MB3700.eurprd07.prod.outlook.com
 (2603:10a6:208:23::27) by PAWPR07MB9511.eurprd07.prod.outlook.com
 (2603:10a6:102:35d::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 18:34:20 +0000
Received: from AM0PR0702MB3700.eurprd07.prod.outlook.com
 ([fe80::447d:928b:ac32:587e]) by AM0PR0702MB3700.eurprd07.prod.outlook.com
 ([fe80::447d:928b:ac32:587e%5]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 18:34:20 +0000
From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
To: openembedded-core@lists.openembedded.org
CC: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Subject: [PATCH v2 3/3] qemu: rename deprecated --enable-trace-backend configure option
Date: Tue,  4 Apr 2023 20:34:05 +0200
Message-ID: <20230404183405.14769-3-thomas.de_schampheleire@nokia.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404183405.14769-1-thomas.de_schampheleire@nokia.com>
References: <20230404183405.14769-1-thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0902CA0028.eurprd09.prod.outlook.com
 (2603:10a6:7:15::17) To AM0PR0702MB3700.eurprd07.prod.outlook.com
 (2603:10a6:208:23::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR0702MB3700:EE_|PAWPR07MB9511:EE_
X-MS-Office365-Filtering-Correlation-Id: ff8a8f6b-a033-4138-e376-08db353b3477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	StlTYhlOmRUZ5zyjwr2cKb8AMumowmmJQN8bXEh6QxRMkSy8tteQQPGTeRbg1+lHyo3DPleT7Jh069VNH5UpkC0goTx92KLKg27SjxK5k8Yna+rXFbNw8oQ2XVTpPBNaHMSisuyVCIu/01T9BES9GsWvUkY63OnnAg7oP6iXzk8N6nMn2n2+wxktSdxeE+SDic+F0xViqtdZQRkWAjYvgEdTOngRxjzZg8+ibDHjbqh0LkpYP59A9UflLbmX4imn4iXPqkvRCKWtR7PNqWzR36U7w6bQOmH0US3JLSetk+H5joZ5tNrVJPIv4P52228TQcLmxFy9r+60JkLA/V3vqA6fxGbxvsXUMSSYRPTOPqp34sAL78h584L+wX2vffZhiprG+FdMad11ZJcWH6dbpkoZndGSCTetBnYdOngsKBCU6SxAsLZP/PfuVy658UnDLJu8GMH4QHp6hHyK33qhGK8ezR8nxCPjFsoP6LOPTe7YX9pgUNt+KclBa0GBYlvzRibVohYhT48RPJiD2nWnSGnk81ZzKOuzT3a8BcgOho0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0702MB3700.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(366004)(136003)(376002)(39860400002)(451199021)(86362001)(38100700002)(36756003)(6486002)(966005)(2616005)(4326008)(107886003)(6506007)(6512007)(1076003)(186003)(6916009)(6666004)(8676002)(5660300002)(66476007)(66946007)(8936002)(2906002)(478600001)(316002)(41300700001)(66556008)(82960400001)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DldWxv5U7ZD1KQ8hdjDTazvunRlou+CfJ+Ooimj9uaoN/STUGpaZ665xMtov?=
 =?us-ascii?Q?7XG0rOxq2F95KcQhJmG4yur+gl9U3s0SK/3CqF5dcbA6mSW95TCQN3pJ9WUy?=
 =?us-ascii?Q?aP3UZX1bBLEefIdsurqXpTUCsodXojUcOY5W0YCgAxCpASQAW7Ul0Ddus1Mc?=
 =?us-ascii?Q?+mIKflYSRqDIh89arnb4e0OGAhUaCgqc0HYpDzS6RGEyRKV181Sv5vU0Wmtb?=
 =?us-ascii?Q?6gtgfrovubEeZ3uCQoo+K2q1RXKe8WWv5bFBDQ9cTU9shqxo6ETfLilKXDp2?=
 =?us-ascii?Q?aMf0QDEcBsKP+XEbsJLGv6oVWbLyDWuO8tyRlpOPaVucDJuhLvwEPRLlp0UN?=
 =?us-ascii?Q?wL+cxAslUI3FPjeOAZCnXqwr+2UU7xa6uX+LXvH7a+3qGdyLNFb/zhre4jcE?=
 =?us-ascii?Q?whXXLSsdnB90Vnux2QPlI0LvZE6R+uwbauJhUjvmBKTXx/7M5loqPQGWmXwe?=
 =?us-ascii?Q?G40+IgjXB24vjEkommTpx3e5qI+hbokcEXJmHmP+Qbm+dZGzKiaynsaUaJ/c?=
 =?us-ascii?Q?8QfvayjhR2hfdD9RE4mz28bgxY6qNbm1Zm+6h3UL3hlU9UYgaUMdyjei7YYH?=
 =?us-ascii?Q?Lk5z6Uv1X9M9bSIvmOBtOPSs36gF1JDj8UoD1kFcWcqsYykYpO4X4pvndSM2?=
 =?us-ascii?Q?y1gM8X0F5ZFrZaatxeIP3aNIGTrnA27LESjEeBfH6Pm60Cq/qV2sOL8Nou8p?=
 =?us-ascii?Q?0R2lYlLiP07JFOpAfKa7AHIHiaVxkqG2L1SXXiaynkAqgw+wT3vLf9Dipplw?=
 =?us-ascii?Q?zbBQAdeUgjYaHCqgt8KTJuZafpfbPlVkEQ5bzHTOKiHraDdK1r8fdtQylrMV?=
 =?us-ascii?Q?9Cfrh6v8323ijumucdglI9Zul0dj4hCLVSNLnMS4rzHVcg/zJpjmDqzU/JJD?=
 =?us-ascii?Q?GhqHJpB/NA629LSP9yUORwcHDN+8pNzmZ881kouHhzgSZoOngJs8hi9pxrLL?=
 =?us-ascii?Q?3el7F46g8PFY7QkDqf1P2nyAdjXxpT1CL9y+bSthB44O68vOcjT9eJ9P/+Ad?=
 =?us-ascii?Q?cpujwLAf5hpIppxwbhLhgVItRQocoFWyr7sCb9fm/4Exk90lROMGux8kzQaQ?=
 =?us-ascii?Q?TgJmgqgUb/3EPsbUCMOyffhBEuUVh1gnWL/VJMKmdKBV1RJNpxL4Oi5zvv7a?=
 =?us-ascii?Q?FwiHT+LZrZUUC96tpQUUtm6S7aKcM//k5eVekHE3u8IkSX+eU63LIRN4L70R?=
 =?us-ascii?Q?PS73O63InrYtEaJ2txb61opF+WYfhv0YdsDTddTAReE0acxVLvuWj7xfzyiC?=
 =?us-ascii?Q?uiDVygQtAQNi3qBpcKlHEOca/vIX0GYNljvBsOmHmDa2mkoc2nWiNg0mSZrg?=
 =?us-ascii?Q?SS6/wVnhZDcSIJ1GAhNVLY6BjhfNEXwZtQpw2ejec78ztLI7TO/eTTp/MjMe?=
 =?us-ascii?Q?3z6kPCZFDEE2VzbxIvGTtcqWlVkTXcYulTcZ14jOPvzWqzFXTbnNu9FYmxVG?=
 =?us-ascii?Q?EojyfBYMW3dik9O9jWULUeyOwBDTiO54xsE7VVg9HMZCnOaBM94cr39PuD5T?=
 =?us-ascii?Q?i1SaiFHDejH+WLbB6nOMctJx5A1IPTNGMypdpJ980HMpJ6S2KNm4Ohqh47WI?=
 =?us-ascii?Q?fjr6FvSz+MGsbKU6OxqV8h8BWtskFK0xIF91mh88Xl4XUjU7I3GITYq67Cae?=
 =?us-ascii?Q?QadvmBKqPdG39aPC4PZIQ1+y4x44Qg7xgXDkVD0g1rEJBDHa5MXxeCjABlKe?=
 =?us-ascii?Q?BeoNhVaxwGfn+XzPZrAPzOzyeF8=3D?=
X-OriginatorOrg: nokia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff8a8f6b-a033-4138-e376-08db353b3477
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0702MB3700.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 18:34:20.3843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5d471751-9675-428d-917b-70f44f9630b0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MrnhuQPw6O4nNqjEhSkVbKoHharibNaX5v2MgK+WAGni1uWNqidDnWi3+xy8sAN1AGsqw6+8Hytnh/UBetz4JSEABHw2uK4BtdtvNSX1bZZiLL+PjH4x6YVy6a0Dyc4L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR07MB9511
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 18:34:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179707

qemu 6.2 deprecated the configure option '--enable-trace-backend' in favor
of '--enable-trace-backends' [1]

Rename accordingly.

[1] https://wiki.qemu.org/ChangeLog/6.2#Build_Information

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc
index 10001c3e66..e2453dd8bc 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -208,7 +208,7 @@ PACKAGECONFIG[libudev] =3D "--enable-libudev,--disable-=
libudev,eudev"
 PACKAGECONFIG[attr] =3D "--enable-attr,--disable-attr,attr,"
 PACKAGECONFIG[rbd] =3D "--enable-rbd,--disable-rbd,ceph,ceph"
 PACKAGECONFIG[vhost] =3D "--enable-vhost-net,--disable-vhost-net,,"
-PACKAGECONFIG[ust] =3D "--enable-trace-backend=3Dust,,lttng-ust,"
+PACKAGECONFIG[ust] =3D "--enable-trace-backends=3Dust,,lttng-ust,"
 PACKAGECONFIG[pie] =3D "--enable-pie,--disable-pie,,"
 PACKAGECONFIG[seccomp] =3D "--enable-seccomp,--disable-seccomp,libseccomp"
 # libnfs is currently provided by meta-kodi
--=20
2.39.2


