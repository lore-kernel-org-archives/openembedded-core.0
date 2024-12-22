Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09CE7E7718E
	for <webhook@archiver.kernel.org>; Sun, 22 Dec 2024 02:38:24 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.76])
 by mx.groups.io with SMTP id smtpd.web10.18612.1734835094324511432
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Dec 2024 18:38:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=JjnWREyJ;
 spf=pass (domain: oss.nxp.com, ip: 40.107.20.76, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=duoJJhzjC0InldUZ1QKn0Kb23xUMJEwkGP3bkUqrdVnrmRORdEm6MiYU5a7xCAF43C8Mkw0Fa26WDg7F4Zc0g/Olz428+Ije84GGpvzE0EjHudF3ZYmgAJtED3Uo1AiiSgChwiNSBtmMVEISdpJ+/8f1QhjhtETb8mHibq0x1lhTNP2ig+9/Fs3NsQEaMjdmqpLZV9d43geP3qGnJHtv7p10IkI3xZlUGOUQSSBFbvOIejDQLKFgHKWSZEeuicYd78y8eQafa8pdiNjUtGZlmJjdwIMUDV9pICZjllmstJ5jJDbDX18lU8djuPqp+jWaMMTuWH0UrKy+T80F9XJiug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/wNdezoNmq2OIUMr7XEZfipMQUw4ZdNjGDErIF4pL8=;
 b=coHAfLNcjlaTlN7puFs6XZTFF7expkVmAzJL05YXLrRqxB+7M1dcwaaWJOTxn55ecSGFXoA9KtV3sv/7UevJfsQxHPphzdrHzn4aHF1OBE7gJ8iky9KDsU48KK5w1o0TWuzw+yXgcxiE+HXspuKgVmvnc1r6Ye022FaWs8AJWoSBac8WftRuKfnywje+kO0Jzy/yldXIhDIibfHlSySuVWgxMMg1b4gY0CgT/u+kPB0P+cSB6IRFUo5Tmtvfs8rH6615HS9QPaLcROgz8bbflhCP19Tsk6RgsJwg5Qq6irT3OUJG/PXy/xRRYyFvaRGkBcvqoJ+Yw7GE0rtBangXwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/wNdezoNmq2OIUMr7XEZfipMQUw4ZdNjGDErIF4pL8=;
 b=JjnWREyJxkg1n/KiE1dunzQgfqTxSWdE76bSyEwhkg/P436YXee1KjgmsapuJzr5VWKqDLDChIAX2EDU4o/Clxpr5xbMWhZFHSxgVMKJOSBQgThabY0BsbosJCgxcn7p0Mm/SUQjBY8h+pmReC1wDMyMSDuxCNyRpb4I8NpK7Lm6CJu1nM9YjzSkgBdEXZf+ONsWq7JKfPCVfhbuCZc2L00vNX4cVU41RZ6yYhif+y4Bs/RU/b7g2GHoIQmjT3S2m81evelzT8Ej0g5xSgAFJZ3+4UuqeNbKU1FiVZhsHOUjNLL18lUcp1436xBYAGI8/vr4YnTVTE8oGFkFcoZLnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by GVXPR04MB10303.eurprd04.prod.outlook.com (2603:10a6:150:1ea::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.18; Sun, 22 Dec
 2024 02:38:07 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8272.013; Sun, 22 Dec 2024
 02:38:07 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v2 2/4] wayland-protocols: Remove inoperative packaging override
Date: Sat, 21 Dec 2024 20:37:07 -0600
Message-ID: <20241222023709.2233470-2-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241222023709.2233470-1-tom.hochstein@oss.nxp.com>
References: <20241222023709.2233470-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0022.namprd11.prod.outlook.com
 (2603:10b6:806:d3::27) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|GVXPR04MB10303:EE_
X-MS-Office365-Filtering-Correlation-Id: bb596068-b7fd-421f-b435-08dd2231aa9d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?pQZgDdq6ZBrN7bEqaYq00dw1nh5UUbSChjA8CD+GYUqearTEjDRSVt7jJx5K?=
 =?us-ascii?Q?/6yzaxPr3nar0XkhFRtkyV5UQYIMWjK6Hoxm+RciJ/sOfTbJvVl1XsumlMAC?=
 =?us-ascii?Q?bfvWB+V++YEM8CZCBtux9uc0C1xAz8OBrtgDuoPmxKOt2f4cbko5UNN+Lg1P?=
 =?us-ascii?Q?K7EL8iNIxIob5tuf3JL2cq/snMgwbYne/F7b5LlZNS7WUJJCfbylKM2M4Kee?=
 =?us-ascii?Q?f+SZyX+6F3DgGKGtt7hGe1O5MxsBcYtBI7Q9rypig3KJC/BHL8QSmarnAcrH?=
 =?us-ascii?Q?RJpQf4U8GtaMnb9g6pf4BIpz+Ks+80P5OFcjN7oXKT3pZpdlnyIp91bTfRe9?=
 =?us-ascii?Q?3XMWi0282ci/69yWTXneUJVQY+beXWsq/grk+mFyeJ9Hr+ivvKTO+kRJoAWk?=
 =?us-ascii?Q?qEXFuDfFTqeuviCLOvlZtewLZwTYf6v2O2Lyisi7KSwhbIq0/5zuID3NQ6kF?=
 =?us-ascii?Q?228Y7yBfU0TQ6ojYe6amL3UtEFI1COEXEScL6R1r/AzMVQg08jkB8nhi3J8P?=
 =?us-ascii?Q?k8abpIwnVQSQobw5/FsKTfhPEsIrzgZ6SjqV/06rqfAo8HJwh//uPyzDpv0Q?=
 =?us-ascii?Q?OAwHctZvc8mqkBC6Vs+en05GBTokdHCdN5lz068mAhMP9o99OzXsVmSGskZP?=
 =?us-ascii?Q?rriTn82Jk36goWtdyO0PO2SDd0Oqfp8Upcg1UYBipkeXNnrDRdjbRUgA2ISn?=
 =?us-ascii?Q?7SzDQqG3TIDxALdiByyeC6yYGHC6yFW3xevXz6/Ygqab6aRBRtAf/3guSPXv?=
 =?us-ascii?Q?+vmuSGCmioD5wQ0K5gsQ7zjqmtWQdBL4kWOVcNRdZhzuEyo6zhMOBW3WsLkd?=
 =?us-ascii?Q?An/zF1jOKoAODobwcUunJD62/a4aPDBexzrLuM7+XqGoaq2WwZgCVJn3KTV6?=
 =?us-ascii?Q?gDkQmsfCGw4ByPSaw07w29JRtY54gE8fJLJJl1hxK1SIWDhduOApmzd7SxWP?=
 =?us-ascii?Q?+kG3cSjT18mrbEkj45OuqAcdnk3gHufCyGdN/bQnmS8v+PWduQbEGAlrVwy0?=
 =?us-ascii?Q?0m/3UUjWbuORw+v2AdOzTttycpSS1k6cnYBQStQAnxvBW7pWUFidFum6fWDT?=
 =?us-ascii?Q?z4NUOp7jEZ8f8iJwpAzZql70EnCLvOavDQKiLQVabi+vlh4KcWM4m8fQjV8m?=
 =?us-ascii?Q?ZNb668rW6b2WUa5traUVO8KNKq8OTRGX5HVo3dsXr7it58XMebDJKtXXFfBO?=
 =?us-ascii?Q?JE81ZXDEFYiF6hHHZK8w4WGkbjTt0i81jChKoHZQBk+fHb9y72p0qq3vu8Om?=
 =?us-ascii?Q?g0rUQuedpMM5D06pCPXVeI2WPwycW0kXYe0cbYgNmXXyzQQeE6eBQ9aON63G?=
 =?us-ascii?Q?9Juwn2maEjFw+eEaC00Ev/YyxJyCCqFmQNZPaGMbbOPhSI7d3e2OBcXLBDDv?=
 =?us-ascii?Q?9qVZfXZrAGHGDVuGo7kJ7r2zzZWg2pVH/DOl6eRK9s/p+ISSbmA7T83Tnv7y?=
 =?us-ascii?Q?K4z/onYAnhfgkPaY7ET9ajcjVMsfDMEM?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5OyIsHY2oypj0yKRF0NMsuIZb845zDfVPlyDMOZlwgh2kusDNPnI7iVUsLQF?=
 =?us-ascii?Q?0J002z/Z1EuQKWmQvQwMMIBviYA02L+2TobOkx4yt4gtCzunPh3tLTE2Of5O?=
 =?us-ascii?Q?cY+2jrAbmWBHNNS75rxaN0SHczKAndF1KJPP9b2JCgm33OKGRRhHT6agrDK6?=
 =?us-ascii?Q?fC+K6MrY8oUqFhq1SzXvKH85T/THNCabikFhE1eAH2f0pJEuJyZlfWkathBt?=
 =?us-ascii?Q?EhlCDb8dWIgqgeX0Q37G2FuIxHI7/BimF5Y/POB1ddLtnQpPip1pnfVUQX62?=
 =?us-ascii?Q?8IlaQF5cqtWFKM8nxIWcVjYI/iN6yB59NeLTygB6umAdeJ1/d9Sw+za2yNak?=
 =?us-ascii?Q?Kr/hpefoGTkOnZFeK/iBWG1dDfRXzLrPFJ4qZcEqsYT768VkhzGeTSc0utfX?=
 =?us-ascii?Q?YiGG+PtNPQvZ3g6kyYwRQmLBwPXgdDTuWo/aYbOcDUBD9ZVgiyUOH/fd+ad2?=
 =?us-ascii?Q?NHwaD+VFlL0RpedkQtZ3owGEXH9rEi9+Rmq0GWmKAmZ+oj0sx7nqSQXBd9tq?=
 =?us-ascii?Q?xRuITMwwRZwyYSG80hQHomDze0mTxJpQ1uliUg+sZlUh1CHNJ5oYIuzXzIpE?=
 =?us-ascii?Q?cKFdoeeRSmY2oFrpdR9cVPWYhQhCcy4E8SgOKlyvpZ6eWOtOs3LA9qnjg8ij?=
 =?us-ascii?Q?mfB74yP2nYIA4rY3pt4P9v74HDQKzAVREdm1qY1Npkq0GRL+xe8uhS26mjuH?=
 =?us-ascii?Q?i80G7j1BUJS2GpVyDUjXycqfjN4x9AP+iH8DZ/t56DI12RLBVm4mfkqBKDjI?=
 =?us-ascii?Q?JCwo8sedeI4vMrLwShidyj7TDZ5vtbdzVjqnZJaPP0QQls6RjXhAUmVA3e6t?=
 =?us-ascii?Q?vCURsyUVaMvliu7uBbS39NK47QjG/prjAJjxbKcST5N0lW/Q5E4doWoFPUd/?=
 =?us-ascii?Q?ka7kv19YshmkTC08cD0r//P3vVHvWgVJySmQ6d5BOaLmKArOBP8Vuv2epNAg?=
 =?us-ascii?Q?47/k6XteZMnYBJBWlCN+0XMyWco3A1kRva3pS04LYsuc4s8G6jt8U83VS/W6?=
 =?us-ascii?Q?bgJRdTYGxgZkVMMdN+AOQw3SZmYCqj86wjciN1RLOZqpT0ywZxOPUqMZBbTv?=
 =?us-ascii?Q?30k2guGvsNfiSzwwjhFi0G04j74VjV6Zlyi3jT3bk7sRIDIdZ8xUUtUKJiSy?=
 =?us-ascii?Q?nRbH7CfbJ6ysI+hZ34J3GiXS4X18iReUrl0EPqvQ7mVq4iWoRU4LBZHeF7jV?=
 =?us-ascii?Q?olw/lyeczoDORpHP/W65eW0EfxNl/kY+cpD24XqoaBt0UP51FneXUAP3UEFe?=
 =?us-ascii?Q?6UubkuqWtiIrUhx7aQ0brObe17Svx+tW66+3Exg5hMTAU/4EbTMiSGp/xbqu?=
 =?us-ascii?Q?zue2vcktI/2jwd1AL1w2wBHBDGKoZjxFxSOMPFrCYTEBukXBfrPGbPWeTkxG?=
 =?us-ascii?Q?RdAf7xIxBChvAnkBbKHdRqOBpTlnVlKiTZZwpDL5hKq/vn8fof95sP2rhC3e?=
 =?us-ascii?Q?VRWmGUpjF6BHyEvM7Xg7lhiLsT6jbVfbwR0VXPZ2L9y0yHJzRg3qGwXWg7Az?=
 =?us-ascii?Q?+9v1HU2shtSU0zBL+zZS2jBP2iUuPXGSq12/zvxQ0rbYmMFACondpn87qgyy?=
 =?us-ascii?Q?2/HPtHDiwFAYD4Z1AHlZwDymdMEejcfKYN0GCzhSNToY7f7ZHxlgWnZmeegu?=
 =?us-ascii?Q?tg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb596068-b7fd-421f-b435-08dd2231aa9d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2024 02:38:06.9902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +g6lvH7tfNsIpFaNMfjXSab7ZKyqOcThSGO56rENo2dAl8ldGYR+TMllWiylEKmCu2bI3JaWAIblMfLrMDKAiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10303
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Dec 2024 02:38:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208996

The upgrade to 1.38 re-enables the dev package [1]. With the dev
package enabled, the file wayland-protocol.pc is filtered by default
into the dev package, and the override adding it to the main package
does nothing and is not needed.

[1] https://github.com/openembedded/openembedded-core/commit/5de187aee675a7=
8fe59620a3fb64a5da5ae662aa

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/recipes-graphics/wayland/wayland-protocols_1.38.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb b/meta=
/recipes-graphics/wayland/wayland-protocols_1.38.bb
index 3e628ab113..be6b732b1a 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.38.bb
@@ -21,7 +21,5 @@ inherit meson pkgconfig allarch
=20
 EXTRA_OEMESON +=3D "-Dtests=3Dfalse"
=20
-FILES:${PN} +=3D "${datadir}/pkgconfig/wayland-protocols.pc"
-
 BBCLASSEXTEND =3D "native nativesdk"
=20
--=20
2.34.1


