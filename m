Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.78])
 by mx.groups.io with SMTP id smtpd.web09.8777.1631091429603237637
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 01:57:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@cherrycloud.onmicrosoft.com header.s=selector2-cherrycloud-onmicrosoft-com header.b=mY/deIEU;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.15.78, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VQPL+7HMN3eNqzz7TAUaTjauHR3VlKzJZpnRpV6YffSCzwsA5oTaaZdN9VhOzkWtl9ANWwWpS06GgcGX4evW9Q2ctp+xFJmKzC/vsiJXL8XzxE2hWOn43Yy1aCFtlhf6Og1y42bQfUGNAS1IkXTFgV2bwul1ZVxmnOHXU4ubkvnDq6IA1AjG2KfOPZeD1m6dRLLFe94Tm2xfpDpx+pl8Y7KUZSNpgvCsFtoa5dHjQCHGX4n8nFYkIGT6k7v4L3zEU8PilXmXRhhw+ZY+dxbSHLDPKqeDHfcRV2Ui5/u+wGkypjYwtfn37s8rF9Ozck5MJSbCrJaibzmD0JL4lYW80g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=RY82c05PsgyG0EHOKKx1DEvbYHVLMbMCEZdiQ0yflo0=;
 b=X41YBuZECRgmKa0//H8OJ7maUeBeXsS+ecemv1NWfgF4W3qgdQe/w7cG78MRKmalIC5ugIGVHewmkFinoSSIgAe4pI0rCqiZOqIx3jaalTLUqV4T9xv1qd+xqIbEHt3ITtWIXPSL+3uJdGQo2tf583jnF2vgk/g7xjob+RiUSlLPsSN34I8caADpIiGOt2PixM0BY1H8n54bQWUzPPUJeauBbC0cqmQ5Aod9LBbv4vJm6z5S4ZCrbRXf0JS5BnijjxsOHpAjdWYL7gCJyh3ciEk24Fk7fgo0sp4JagZkIQSlOm0dpPbDk9ZaKHO6T2UheKNAepbXIjy1FuuX4sQNzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RY82c05PsgyG0EHOKKx1DEvbYHVLMbMCEZdiQ0yflo0=;
 b=mY/deIEUNkIGsZ0jgCcLe9fizBJrfcldLaRkyOn32OsdEkdnzuK4UX1/zoN2Igvovb65zrZ9RNtFSkyBZ1spqHJe7HA5If4tPxLpJfm172xgQG4Q9RBF2UnCx9/Chlff6uGy/c2PlAGiG0pR/h9AJRhvAIS9y8/2+hKa2SDiAOY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=theobroma-systems.com;
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24) by AM8PR04MB7412.eurprd04.prod.outlook.com
 (2603:10a6:20b:1df::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Wed, 8 Sep
 2021 08:57:07 +0000
Received: from AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::7987:898f:55bd:ec64]) by AM0PR0402MB3348.eurprd04.prod.outlook.com
 ([fe80::7987:898f:55bd:ec64%7]) with mapi id 15.20.4500.014; Wed, 8 Sep 2021
 08:57:07 +0000
From: "Quentin Schulz" <quentin.schulz@theobroma-systems.com>
To: 
CC: openembedded-core@lists.openembedded.org,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>
Subject: [PATCH] conf: mips: mips16e: prepend override to MACHINEOVERRIDES
Date: Wed,  8 Sep 2021 10:56:46 +0200
Message-ID: <20210908085646.966393-1-quentin.schulz@theobroma-systems.com>
X-Mailer: git-send-email 2.31.1
X-ClientProxiedBy: PR3P191CA0018.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::23) To AM0PR0402MB3348.eurprd04.prod.outlook.com
 (2603:10a6:208:24::24)
Return-Path: quentin.schulz@theobroma-systems.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (92.42.140.82) by PR3P191CA0018.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Wed, 8 Sep 2021 08:57:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a56945f-0255-4737-23a6-08d972a6a2ec
X-MS-TrafficTypeDiagnostic: AM8PR04MB7412:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM8PR04MB7412A4C2F323CF726676A8F6C2D49@AM8PR04MB7412.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uvBuqRHSOchUqX04DxV2UxA2WyQmAaQ1sh1uBQibxRtWYhH4V90SoC6WeLEfIJMO3RHabfoHbQUmVkNmnMtwqQM25OSEWr3it5yGG4tkyUquA9W6QLQpIM0i/xGT/eTiy9yjd3gn4d9JKrPRklIb9lCTAuki1r0sLIcyOahBbucxCoiDjVeCRW/yqDENhDjUJhDuYbMohpTYkFzu8W7Vs+3lV4os3Xld98qFT0+oD+Hg0Qb98nk62ky+7KHAwl7rN/dGZMcs2aJmD66W1xW1UFRojGEl1UoEGdW7CfG91Aa3uxCbDaoMcumSkZx/LNJKalxpbyRBDP7QpzO6I/UGFnJt0xbojEI+AXWQyaVZlF5HBz5Au994VIsB1ZNlyDE2toleI1ZCjN9/NUlCt32cybY0K5dzJZS9MxOZxnGBhZK0D4jh0qFKgzG45MgqvUmWVy0yTjph1w/nrBvf80qPDQUOsX9ZphtGLbpFQYlVB778o10/J2dWqO12Lengs0NJ7uXHHjcwtK8pyVo0FklHKNf5WiqTx/dWjdU5Q5BtJyyQLbFHCx/KjH1yZvpVjO0+lEwQnoBtpLIG/GOOnGYPuMWLdFqx1A96C1Udytg5QFx6ZKB9oiPq8WS2VentBQff4pCKUsVWoVZxQgeao1eUUzQMSJH7eIJJWS/ZuB8jYVK9TbTxnoHZDSEzNzZmEqMy2HsgzW5lY1U8LOXuC02Ud3rVc3/AeT/U4bE50o/R4T8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR0402MB3348.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(136003)(396003)(376002)(39840400004)(5660300002)(2906002)(478600001)(6486002)(86362001)(956004)(8676002)(4326008)(26005)(6666004)(316002)(66946007)(44832011)(6512007)(83380400001)(52116002)(66556008)(66476007)(1076003)(107886003)(186003)(8936002)(2616005)(38100700002)(38350700002)(36756003)(6506007)(109986005)(266003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7dgnfXr7mrHI48ZnMhHBP7uwNLip+xzwqn3lmFG33pgUFmty12Gj0SLiPlXA?=
 =?us-ascii?Q?oGDYYNAA09QehRbSWTypkkWKOOW63Eh+f8HI9crQgD4VnqNLIU/g3YvhN018?=
 =?us-ascii?Q?tdaRX/XboVcxZ2qtZAwex98JVI7+emLlN9DzZb74JKw+IcccbBj1317nxMFF?=
 =?us-ascii?Q?+G+UMcmugHTnoMq0e2j0lluO2z62/j7e+zGrHC7pN34X/OEtmeS9xU19gdZb?=
 =?us-ascii?Q?RNyeueBhRkJaBNr/i6vOACsWjf+v2Rv79AX0839EbAqmuNZH8PhsmRkmBKKr?=
 =?us-ascii?Q?G8pk+n8SRzEjxFN6L2DYqI37npb4wZEinxso+YdEXeGmglhymbwSHlI3bspI?=
 =?us-ascii?Q?G3cxlwmPWCgLx4z+/dZQMYRqd50I+xF4Q6xuxJp0jQntbqcG5yr6Ytm/ZOH1?=
 =?us-ascii?Q?0BdhetRgy00y8McWwZlhdvbpg+sK0HD+gVPkosgvZsUfGFN9TiDfxThN4Ir9?=
 =?us-ascii?Q?TZPTgcKK4KvUEsVqD3qE7qM2kKRuW2y38SlnmwI5kjwzy5KZi4GeTIFIexwq?=
 =?us-ascii?Q?JDS46DslM4rnHPR6pRgvFTTC0eA4kiReWg7w6aQczyHjVqWMoqDGk3k5Bq0p?=
 =?us-ascii?Q?hbX7OtNzVH41T+z3kouO8DB1LR45964Cjb3D7LAy1FNJParnyhn1Q8QCy97g?=
 =?us-ascii?Q?DFUTkCXI+3fMFqSxOuScbdp4j8z/VtgTiUB15PzUyrSWKdsPixnt/WxhTmA3?=
 =?us-ascii?Q?t4WV0hk75siVGCBVkRY8XjJRi+1amJ0vVtlqzqIm7TeE1mff7/jnbvGPLMXH?=
 =?us-ascii?Q?WFE8UJk3ZLoxZgIsZyQZvjXt6uhONMbcIFrU3f0G95HtHEPzckzW9ifTZn8P?=
 =?us-ascii?Q?5Ta3jtDBgxL3/qzToVWf9Pd23HO9hlkyZth4+krTorMrYZchOxlSNKMjqocz?=
 =?us-ascii?Q?pa1evj/9OhZaSPIOF1S/CZxp7bSTDSv2C06SJmcXSfCV/OgTf9nTv2bjXFZE?=
 =?us-ascii?Q?w1YpK/ZpWYxGaAtcCrG+TvF5RcG16TqebKp4CgGDgXh69j+zDhD+iL/1T1cD?=
 =?us-ascii?Q?EoW3KkwNeI2l1o3M06co4Knx4Iw1of3T9/5Q40E+5vRMrjDUPcWzrMj/Vsp6?=
 =?us-ascii?Q?E1N9abMQcAy/hpMAStcRKLsEOP60ZP13fm5WmcHYtvhJyo9Q53UhzQYYtZoI?=
 =?us-ascii?Q?88xoYi+PElhzwFdfS/K06ICTa/mdFlLX0vBmukyRPxtDPbeKShgextR+m4af?=
 =?us-ascii?Q?XEBtXuZyuStYKOf/fcYX1NbBTium1qStSi1zHlNC4iMWmNf5yDa5EfFpfjuX?=
 =?us-ascii?Q?mGGOH/priLY3Mc7tIchGWexdwOvFGKmW64UAKmyAqu/fJ7BVG7MjV9kNsgLU?=
 =?us-ascii?Q?HuTPmY8KxMKbJnPH6OWQnwTC?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a56945f-0255-4737-23a6-08d972a6a2ec
X-MS-Exchange-CrossTenant-AuthSource: AM0PR0402MB3348.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 08:57:07.4057
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yUMdDB/eVSUEDGsQySjLocuNmCOenCndZRt48fcrMwiwbOkVyNGM7cbNoJJI56pUC6Jl8sF9zmP8wcHUDcP6A5Ash2vSLIbFKRaYzgDrhPUDeUYZDe9Hf5k+uU1xhabD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7412
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Add the tune specific override to MACHINEOVERRIDES and not OVERRIDES as
is done for all other tune include files.

Also prepend it instead of appending so that it's among the leftmost
overrides in MACHINEOVERRIDES and has a lower precedence compared to
other MACHINEOVERRIDES added later (which usually are added via a =3D.
(prepend)).

Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
---

Note: this has NOT been tested. There is also no machine in
poky/oe-core which makes use of that tune.

 conf/machine/include/mips/feature-mips-mips16e.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/include/mips/feature-mips-mips16e.inc b/conf/mach=
ine/include/mips/feature-mips-mips16e.inc
index 101d5331bc..6fd12fb842 100644
--- a/conf/machine/include/mips/feature-mips-mips16e.inc
+++ b/conf/machine/include/mips/feature-mips-mips16e.inc
@@ -11,7 +11,7 @@ MIPSPKGSFX_MIPS16E .=3D "${@bb.utils.contains('TUNE_FEATU=
RES', 'mips16e', '-m16',
 TUNEVALID[no-interlink-compressed] =3D "Disable mixing of standard and MIP=
S16e code"
 MIPS16_TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'no-interli=
nk-compressed', ' -mno-interlink-compressed', ' -minterlink-compressed', d)=
}"
 TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'mips16e', ' ${MIP=
S16_TUNE_CCARGS}', '', d)}"
-OVERRIDES .=3D "${@bb.utils.contains('TUNE_FEATURES', 'mips16e', ':mips16e=
', '', d)}"
+MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'mips16e', 'm=
ips16e:', '', d)}"
=20
 # show status (if compiling in MIPS16e mode)
 BUILDCFG_VARS +=3D "${@['', 'MIPS_INSTRUCTION_SET'][d.getVar('MIPS_INSTRUC=
TION_SET') =3D=3D 'mips16e']}"
--=20
2.31.1

