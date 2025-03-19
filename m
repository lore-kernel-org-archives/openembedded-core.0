Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C5EDC36001
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 09:13:50 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.92])
 by mx.groups.io with SMTP id smtpd.web11.3603.1742375625665261312
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 02:13:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=n5YW8CzP;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.92, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gqOQtYlWeKHdapC0S2LGALVZN730fzHJszDxqPQqwK4LcbNewU7Ft+qp7m/IiyoXMKYxPKOVAQVi/YHh6Hcv1bosXsTDrDcZILbgFp7upxJeW3yamVHGsONSL439X5W9su/lg3EtbLPm/fmy3ySdQSAwXSt7YXXbATiDvHAwmmVdkr1TjjOW3KjFu9MDuoAlDiRh0c7Ck3/PpERyLdeozEFKzd6qf7+xergNeFAFSeCBC5LS/f19AGNKdlK7wR0Al8mf5Ca0VnhY0DEOa7GmY85AOU1lQSkEsSADB9ZpSC1H/vAW8zJQIA4uSJQ7ljQYeQhhcRfDm25cAONaHp6Lcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbHcVyMUApIvTv7IlSzIxrJ02GqyBZ9F8QfYb2d9GLI=;
 b=nrSLBP+wRyaQtDECOyql4LmWZBq/pY7f0NEKhmnQLkL8rv8+MakdbQj5pGSWTPsVSVg18kDgEEqOmVF7iOkrSTtjW2Y/6WtL20bHM5S+A2WE3awZMMawgT7xdkdkKDMp7WhZ/6R+DHlwKc2AcjIcqgpLchB4WFILfZ7/GH7ddeQSUHhJkMCTT+WK42vfZg6nivT3e8KMML9pGjNxwrr6YSRykrB+a5bcB6d/9/UA9iQBvbFmmf80ENln17x8KDoVmy2IUQHq375eTfS2YEEKnkvRhUbBCARAOIWcbMna9ixdkxlL9TnNQEqQQEBv2eQ0NYYD763cmT2rhU3SfRgwUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbHcVyMUApIvTv7IlSzIxrJ02GqyBZ9F8QfYb2d9GLI=;
 b=n5YW8CzPhuTz4d4TpqdLBwRdNybxGzsbhJa8f2S86z2mImnYUWdf0NSzXFMkXe4MGOdQ8aZtQFaod3w8JfL2XLc8DFsheWkZFcGcWz9EUADDj3bIoGYbblcOy/a/25CxOSTi0G7d444TR2bs94bsYLxDYXJsGqkOJb6xOj6PJaGEoZBvXT5n7AWDY/M+4GHVqFYna4F+4+66IcSEItN1HROvvj4qALQ1/5WkdzRzDBAFbydn3L7JrPybR/cTMWTm4skz+je3yforcKwK4/4/LXvM+NIwPEM+43idKNVsv8GQQTH58m0cVGlNiGDcnYvNYqOc4qzFQwkdo1iogxXNSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com (2603:10a6:10:371::13)
 by DBAPR06MB6984.eurprd06.prod.outlook.com (2603:10a6:10:1ab::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 19 Mar
 2025 09:13:41 +0000
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522]) by DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522%3]) with mapi id 15.20.8534.031; Wed, 19 Mar 2025
 09:13:41 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: ross.burton@arm.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 1/2] packagegroup-core-x11: Avoid non-ASCII in RDEPENDS
Date: Wed, 19 Mar 2025 09:13:28 +0000
Message-ID: <20250319091329.3057329-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV2PEPF00004598.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::443) To DB9PR06MB8439.eurprd06.prod.outlook.com
 (2603:10a6:10:371::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR06MB8439:EE_|DBAPR06MB6984:EE_
X-MS-Office365-Filtering-Correlation-Id: 281e7804-4d5e-4317-2020-08dd66c65764
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nsXXTX21+AZZnPZF9E/dDnbTR/eIG+ucrYf1wJ7WhdvfNFbBSzPQ+xEsDlAD?=
 =?us-ascii?Q?OKN6tKwoK/ZfUP9+GNYaJ1kWjEFrNNFizutyX4iQDiwhKZ0f/bhMRL4ufFu1?=
 =?us-ascii?Q?tqAHwWg9rcT+oPWRgVL0+41qWF9rgagBcYueJps0Pe/B6IuhDxT2Y8WRsogG?=
 =?us-ascii?Q?qKCZspnxbEr/ekDcwB+BdksmKUcxGQQOfJKHDs1627KdAK0ZmDY6VJqlBazg?=
 =?us-ascii?Q?hf5iTi1/vXfDRvLHVTljDvWP2JkzKfKJDT2stQMW0OcOfmAe6GnklSBguuBX?=
 =?us-ascii?Q?YGgB3XQh90d/dAmv/8zxrIE7Xfs2jmxku8KwETO/Ghz3ZAQj6VcmJHXDE1s/?=
 =?us-ascii?Q?BTllgrKYuRBHuHZJWBXu2QaFPaDOhvRBt9cljMvBNsx7DzXPHhnm2wnWkie3?=
 =?us-ascii?Q?nd3AoCk6KBkgOu4zOeZJ9GuP6ZEVEGgHwL1590gllq8hBpRm28jkHLMSlk95?=
 =?us-ascii?Q?on9n7bLQr5GBakP340/LPybabhgWlnewtptXI4fw51BwRG1ToJgj6DgBz6TA?=
 =?us-ascii?Q?VT35468gZzQUSMxZ3RUCpV90eOr+enezWBtTCd43u6uiXiajGcvX03UNmPRh?=
 =?us-ascii?Q?igDuWFnZI3TEBn3aGRrdO78o/T62HH++sRt4E3SBAvDz2oC93c6plFMJSenu?=
 =?us-ascii?Q?nc7saCuT3x9yo8KfhN0qm1QsIZHsaIPitMW76aarE76q2WEDuKu8Or3DK4Ps?=
 =?us-ascii?Q?Eo+meioRO1uju+foQD6DwwE9vtndlMSIbkJKFRDxJYQf5IzOHMc6OTFi55ZZ?=
 =?us-ascii?Q?trkgdDgS+7mIb5mYTyXoROlxJF8LHtyFdPFze6TeexllsXcy5eElQbcSt6ed?=
 =?us-ascii?Q?jInRvi6jyLXbnGraITYNmq2nEOYjzCo5itykvD96MQla1eb13uvoZlVzE/rx?=
 =?us-ascii?Q?yWAr6vggOqY0che3B1769dpnK+V/onlnaZzrpV1BA24rwjpqNLKaWAocvMh3?=
 =?us-ascii?Q?RyjtajJXj3g8I5sIMC6B/YAGuB7Wjd4Vmi9I6EDDu6j50EyweAR+eeZ1cAmZ?=
 =?us-ascii?Q?G8uMr5V8iRo5rPQMRqnl2M0+lGn5SNp0gevNy0wDqfEuqGPJktzmAKb5gpyj?=
 =?us-ascii?Q?0+PGOp0jXsjQfeoHFcbYQSvQNsPtnQhP2cUHfy1Wg8YsQueP6L6PhyAdhgX8?=
 =?us-ascii?Q?yKfVRgUR38SFvcCkZ6EQ9wtTob0ainGl66V9Fr9ifxtTFtE310BQVmUr8n+/?=
 =?us-ascii?Q?G+nn56XLBNEmPo4XtIK2O+GRZiCyoz+jpfiK4ZTdMSVUMStUf7m5yye8/d2r?=
 =?us-ascii?Q?ogPX2OxP6wRnohMikgh8arjg1gvjMyfgzistY9aJAyn7+ewOe891mcFm2zn4?=
 =?us-ascii?Q?nme59CnVxsQdw3Hmd4M6hUnEyQ58DjclJRrfZtmPQdgrQFkn8PHuTK4nIKAB?=
 =?us-ascii?Q?1LsPsV06chg1LB2DGVW7vUkKzBY+sXTPNZE9hW7pmisHTDgxWDRMP5WZWnN3?=
 =?us-ascii?Q?nK8fIOE/rAQ1lywHJmKjL54m5jhMyJ5O?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB8439.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nBWxHCl5ah20gg7zfa2BkkShsIgteX5o4jHm7hoyy95JsSPj+sV+FGHGbCcu?=
 =?us-ascii?Q?LB3b69n6FJrFjgzzJb7YxFkonFbkxWTQlzA8ZhwI7e9YfWACLL0RLkkKnJiS?=
 =?us-ascii?Q?9/7+r1BrLUvvYK10mQBS2OIXMZFXvhyR5De8CFJtZCd36Im0KVGGfbeLZiaQ?=
 =?us-ascii?Q?Ea6l/BHkF9+IfKbXWIz1/ppBPMakopwW6N9tV/xpSCnBrGahFYENOJM8Moai?=
 =?us-ascii?Q?fVmAd2vvlQLf9p2UcZYzIJboZ8C2zpDYEOuHObPjukZG7resu4Vxq02W/R4+?=
 =?us-ascii?Q?PEe83+T8/wyAHGUFQ5liC9vm7ovhvBhewuqBf4n60sdHtKc2bj6dXeGBLjH8?=
 =?us-ascii?Q?m8D51ZpPLXKGO3HCCcYAtoB5VGsuFDeWhNbH7KZuF3TPZXmVQY1z3TDvDa8f?=
 =?us-ascii?Q?EJU+egZXThkN/fkMKb03BnycMwUDD/xHQEDW/g1TcbDSOqErlYnRQtKmBVT3?=
 =?us-ascii?Q?Jt5a/qSJwSgqttSWrfqAAdVHhTinp698+0vRIJbd0EmYP4wlTfLfGCBrJ646?=
 =?us-ascii?Q?C7T9XA/61b+Up/TnUm36Pc3f3KhucVQajoZiT6Fz8c897D4toysTmV3O6TWZ?=
 =?us-ascii?Q?1XSxeBqwCEDiUpLqmaKLls9gXDKN5jLM0yPcD+JjEiZD8xbpkln8/na+yBd2?=
 =?us-ascii?Q?lI4DSDv0vkj+qQm0mkWfFkd4AqVYwzAEFNiLnDiCZrCUFcpGAU8WpIPegC7+?=
 =?us-ascii?Q?mcOcQAgf5gDW72M1rit3Qh9Ri8SWP43dvMrZaJLXgiRfcDYHgul+aS42DAXi?=
 =?us-ascii?Q?vPiXjCPDkxMlxkrNfkP5shFQ38rnB7lIR3MpNpKYgZiTi182YJ+hVr+lGOd+?=
 =?us-ascii?Q?1KKANIBFmEOCcFzceD3V+WdelemPhLes5YFvr5uOAJAZTKHUGMiwzsz8Hhfw?=
 =?us-ascii?Q?gyCydC+VUzNl2+9uArUIP1IgNrsc0zHDKmXeEVzH4gywHsKJT0jZ1b5oIb2b?=
 =?us-ascii?Q?xkDobiF6xxtbgi1xl/+egVj2+gcWIPnjv14PjhCXGLcjfM9+7aI5dQjpSj2k?=
 =?us-ascii?Q?q8jzNk1l6nZ3BwTJW65TWQGXbPGhU5FfeKn+oY5uMiMr+RW7i4vV+vivISvb?=
 =?us-ascii?Q?Ks1NNPcWlgraQYpomIO258OQ9kCOo3M1FwAaqdcT0IQZ3+jVtP3MDr/Mwq0C?=
 =?us-ascii?Q?sJR1sjxgMN/TrpDW6Krqa4AYe3JLgJ2nguPRIJ51gl/87FZYVQEak1syEz7c?=
 =?us-ascii?Q?icYsj+Xpm7F3tLRKYoOka4+xOyMIUu2zD084h+r0gCNRbyUWs5oy3xxtZ5J+?=
 =?us-ascii?Q?+CSgDMWh/jh1J3QgTNacPTOrdocASUV7EUaMYCjFYutLuJ7JxjCczmvpaMFI?=
 =?us-ascii?Q?8E+4Fu0iHO0oXTxqyP5JgoVyL6wVsn1Ihi4w/Rllv3YJBFRWiZVDaJm+6mv9?=
 =?us-ascii?Q?Prue6jgPjSa0foqrcwZcYqHHJcCCqIxQfRYP8KEzcECpgeFXNcQifGGLOQDX?=
 =?us-ascii?Q?D0BCKEYJXm5bAxxRbFSxd5Cf+DQCAv+CLW7N7XZb+c1M+0NJKuL66iviwJjX?=
 =?us-ascii?Q?FG38rJVg/FLG2RQrx6EtQhbnBUsoex/H1thdwM2dUG98KFCKq77oI2jb0+S/?=
 =?us-ascii?Q?CSk8THbDLWX3nJX0zF0xnP0joLiK12Gg/aKEm2+8vMUN5zcN1X6EIFb0Oh2O?=
 =?us-ascii?Q?WA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 281e7804-4d5e-4317-2020-08dd66c65764
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB8439.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2025 09:13:41.4719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QWgj8BKMs4kq+m0BjMiBverY2HXqDtDf5RDV7VtAWRx1ndt31Xu+HIdyqMOOC+hxBQe4RsmRx3cMZhAr8iMpVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR06MB6984
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 09:13:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213312

Replace the UTF8 character for non-breaking space with regular
(ASCII) space in RDEPENDS:${PN}-utils variable.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb b=
/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
index 91db7ed33b..10184f1cf1 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
@@ -30,6 +30,6 @@ RDEPENDS:${PN}-utils =3D "\
     xrandr \
     xmodmap \
     xdpyinfo \
-    xinput-calibrator=C2=A0\
+    xinput-calibrator \
     dbus-x11 \
     "
--=20
2.39.5


