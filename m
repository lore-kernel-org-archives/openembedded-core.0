Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F5EBC44512
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 06:42:34 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.83])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6976.1784184147164096571
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 23:42:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=yH3IlI1F;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=3BN/lMpp;
 spf=pass (domain: navimatix.de, ip: 40.107.159.83, mailfrom: joerg.sommer@navimatix.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lq6y3MRZMEqPWun1U74tqvc949sD6KnDYs0k4nJdSE=;
 b=yH3IlI1FERvBxIissSP1IDa95eI227tyQHnE+zhu89N2uZarDBEekZLYrgcSRDzAOfUrlovBljY044v7fBnX9Np39SgTBOV3AORBe5R7RPKy5gF/vbsSO1tI6t8FbvrXXWK5ITygtdxS/HLodcu7U1mhsJQG2P99l4DCedpOSNU=
Authentication-Results: dkim=error (no key for signature)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by DB8PR01MB6518.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:15c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Thu, 16 Jul
 2026 06:42:24 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0223.011; Thu, 16 Jul 2026 06:42:24 +0000
Resent-From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Resent-Date: Thu, 16 Jul 2026 08:42:22 +0200
Resent-Message-ID: <alh9Tr-DZFTGrB3u@navimatix.de>
Resent-To: openembedded-core@lists.openembedded.org
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dZeox2oo+3BN6M24yn3DfkKMFGnsZy5Ek46ZWtzuxE3QxDJ8PKHJsJyd8gOO3Ge0S3fxd6BW4buyLnwy0Mm+OndJwotRb1A6x/M9qKECf5DvAE9ssN4SCUm4aV3n3y+mFYZEatGnQJKX0umCjlsAX+XbdPdiYpp3TIgZyKAIzC8qqx+1zBj7C771f3Q5PO+dxj38AB5GZXji+x5up83vJG6CnJ7tlbZAB7AOzm9QZKKq/eqb7G1JHgC6269Beu55H0WAvdMjCniRt931c1DBtOeiV/zQlH5bGb9bjDLeKFX6U4hCA5uCgygMq8PDG7k7TsXAZ8wWjMpJgVY0kCmxLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZYMMUXcq12SiLs7jj50eYqS4m+olwOxVDELpHoZBDUU=;
 b=HemxPQ6KxF3Z7DpP9x9XhiV1VzLdfyLhaP92MqSYgp2SeeKXalZAtAzEbkwPN1RFracoOJnrUMVVtl6K4sd5JpJDnCD1RLUNCG4Rou6kWBJeEQqO57L8VzMEBe8n9V5et7HQ+YPBs10rL5N24zVhvFl/qmUHddTZvReO/C76bnI6MtW4Kni5DoAmUQzYI22XdD5ptlqKb7/8ouBkHJIhJ2qLLetKNN9FjFjbsr9UvAkMB/Y6PDAhiZTXlBSMbnTa8VF8Tl1/1oCv1KRzcuapXgcUX153QetJZkMdKPNBDDpBbEuJW3kg/rJ35jHVGSbsEQdtqOYYFI4wxLCOnLn1Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYMMUXcq12SiLs7jj50eYqS4m+olwOxVDELpHoZBDUU=;
 b=3BN/lMppgHQq8RbrGO2rkKE4WHDhJFwvuZlXtD9IRHTT0W5nzrbClbxj/7KJclXZp+UxqpG3xElSVT6Pchl+bsAE7echZJkIgl1QMjuDQPfoST8QA66Bo29lZ7xavbKdyUglSr9pJcvJrDGK2ZWHUVa+MgrKTM5lrXzxDIQmKLA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Date: Tue, 14 Jul 2026 16:41:45 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: <openembedded-core@lists.openembedded.org>, <joerg.sommer@navimatix.de>
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 6/6] sudo: Enable PACKAGECONFIG[audit selinux] by
 DISTRO_FEATURES
Message-ID: <85ff39877d962404dcfda04c18a70cb40db6942c.1784039919.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
References: <4fb61a12d8843e728054e9c46c6bc09c50aa2957.1784039919.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4fb61a12d8843e728054e9c46c6bc09c50aa2957.1784039919.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:23::11) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
X-MS-TrafficTypeDiagnostic: 
	GV2PR01MB11835:EE_|PAXPR01MB8872:EE_|AS1PR01MB10055:EE_|DU2PR01MB8624:EE_|AM0PR01MB6291:EE_|GV2PR01MB11835:EE_|DB8PR01MB6518:EE_
X-MS-Office365-Filtering-Correlation-Id: 6200ba97-ccc2-481d-dd64-08dee3056525
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|14060799003|1800799024|366016|376014|23010399003|56012099006|6133799003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	N6U69ynR10gFxRZBsTpPoSC7pBFVk0P9IR5Oj6XSie8+dNnpyv2Q0BLEvJOVYM0QKJggevUhGvWzcxjz6YkNcL8f+dE7YfzaALepKvayRnQEvV5YWbBBdTwVvHEO9jC/jweX60jmaHks9826ICexkd10pQW9CVVLVJqXscOWYsL7iroayszMoHBnkatzxZz1s5qaTzC8htkHnHOfhIeTYU92WAoROhJnzYkWA2wYaS9YOgeobu06IBMuBd8s30CYfCZcQAqxHaThiSsOox3YLo7oN8kw2tqN/5g+SmwIdqskeg9PJp42WLTktiSecDrGvrM3P4hqJaBzwTLlEp8og6eLKhJastHmKZFl3ULuAH/N/DHS5FDtUQzw4cz9/4KTq23xcnMgesDcj4lbDkmgJxqbmNXVRiuFjyM/W1CkC+9NmYaKry51/1z7gyNAUSLcJQWz/Ce74h4eGBNHqhVe5rPy92/kXwzSyRLP0UWv9cJf+dbJ8tPfj553q3qa0RQPdvutXlMF724t4o1IShRrtDOa26SAEsmJTklLVZjG1DJeDnZacR9UIj8CF3sW4NDdwsBkyjRtT62wi+tP6+06QdOMGVW1D4kejWq8aXuEB80tz/ery81sDzB4hJ2KqWUEn3e6vv+SY1JzPy4ZgO/jK9Vpq7bDWZCFBM6tvrIfXx8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(1800799024)(366016)(376014)(23010399003)(56012099006)(6133799003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-CrossTenant-Network-Message-Id: b4549e59-ecb8-4037-879c-08dee1b607ac
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 14:41:46.3320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Spk+TY+dVkxZdq6KTu3ke9ZwMwkbqRREsEVVDaD3UD/JVlcCLT1q+nYnrVK4UrZUCP0RfM7kl9KGW5sh+z3ERru2HkQTaBGLw6hz9gtSLrw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB8872
X-ClientProxiedBy: BE1P281CA0221.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:88::14) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	b4549e59-ecb8-4037-879c-08dee1b607ac
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?ZxQb2QcmlyoKqHZmjcz48WyVTun8C7jSqM9KmoR+ehaeN5mwDjmAnURj2B?=
 =?iso-8859-1?Q?mrEq9yKs4CBQ6zDtNFWxLiwYP13JWe4jAU388bI7sxexYm4C3+zRAAKKZh?=
 =?iso-8859-1?Q?n2uhXytbODXGy1iPT9qNIIcJtlzmzw6qkwZ+R8CS/KBctX+McGh5UuzBR0?=
 =?iso-8859-1?Q?tETB7PcmYKqtAXfOCaGy9m8Lh19mFBVisXvY8g3a3Ei2beDsNvnmoCuLwa?=
 =?iso-8859-1?Q?IqjWZDlSE+uueAdnVMfxovzGT/BmqPT5Q2fGilyx+Wcx+FyxrZvjjE0tp4?=
 =?iso-8859-1?Q?WjFcnazIPlFLjZyvtVepwR9roDp7PzoQiHDYdykiMj7gHq2/g/LunD7s3z?=
 =?iso-8859-1?Q?QQ0DchR0Mk6m96ZXynAcOJ8XWrCdgBaTVz5SnS5WhjqKa8NTwpm0LmyGBO?=
 =?iso-8859-1?Q?WggBitIowBDJYCxS9syzbE4jENGHJQ0+sp7n1GllcotxXzGh2rttGPPpim?=
 =?iso-8859-1?Q?5HLNJ75AERBi+n4HO90yMPu2Oomx5pdUdxKvRolH5qLsLkg6beCh7lnBPi?=
 =?iso-8859-1?Q?W0xrbXncs9gna7F1RloCRsNL/wk7piRYPSvBQj6Ed+G+WdpL403AUOtO70?=
 =?iso-8859-1?Q?TQbL96E5a0uzIwdHnmnSJ0onVGPQi4eEmg+M8scmrpr74bp29mMxZPX8ln?=
 =?iso-8859-1?Q?DXuOCBG6Zv8WqBzn/L4mDuHwhfiPcFf0eUF9+PnRmEazNZ5GkBS63qcae1?=
 =?iso-8859-1?Q?YkOS0FUqt2MghCtD5i2xdTddze89Mljf3q3HbfS8SFINmDngPULl7XIptx?=
 =?iso-8859-1?Q?5nivAGREM72KTqhCDafGXGDVllh/GZQU3/x2LgMjz8e6wKx7oxiZTE+I3n?=
 =?iso-8859-1?Q?HjbUhZBYNYm8rN103dK+xMI5JrJf+AB9gvTabRKiV1m4pb/LFpd4/wnIHH?=
 =?iso-8859-1?Q?ZLIPDH6ZD+6feqTG0Bv9GDII2vyki9wLyXJLEq2S7C8wquVJ1Hm7iE1QBW?=
 =?iso-8859-1?Q?kXgC6Ub0AS58CokJA05P1MBFcKjYIhr+wut8GY+vw3IOqf9ANbKV3g7xj6?=
 =?iso-8859-1?Q?TRBDuV+/+JUKmyvqXKt1xqe/3VhbpjRsIs/C0m05HYN1scRHxqotz1I1O1?=
 =?iso-8859-1?Q?vvw/ucrZP0jvYu8TsUO6acJy6o85Vith0VD5TFipV15/ikCGOkwZge0/P0?=
 =?iso-8859-1?Q?Jf9hQAAwLmB/2Cy+uw4NyUhpAV4w+Rm8WOcYUt/ryRFDFAr7cbCelnTegY?=
 =?iso-8859-1?Q?bcPqSIOM2/dD75tQJLUlYqMMpcE8iBIp/SQIArS3QkKVeOh1tWREAAdlSR?=
 =?iso-8859-1?Q?m4eUfmEdahAFQ2c4Sl72RePhMj3aByxkgpfxc/PULOmooSF06ev4Enll9U?=
 =?iso-8859-1?Q?IN7ILZXVYT0OjzyUtC3XyJ0lCVYYPbn1ZDUxTTVk7ud/3GKtSkJveLGc48?=
 =?iso-8859-1?Q?bul8tYZdyomCiQka2lnldcu2+aekB+yuAwJaHGa3BKtS0iuY62ZsnnPppD?=
 =?iso-8859-1?Q?lKIQJCTJWOdMqy+TjVYf5tPH1k76JS1ldgrWMeVIE1mw/sKRbqVs+8yS1I?=
 =?iso-8859-1?Q?4bTopnt/955JG5GIy4uZ/Sc9EUH34dIJUz2sn+X68KULaiD07gCFFPNXaA?=
 =?iso-8859-1?Q?Dym0LbPZTP6J/wZFkvxWdmQDwGTX322MMtwhvGsjfPbob+FLb5cGf5TplF?=
 =?iso-8859-1?Q?ltTCmgSsbAUGm6JTGOIQLsOPoYGJN197lKPNifjoAEKMzzaMK4SWAxKPGU?=
 =?iso-8859-1?Q?ty4B6sXGIhmr6p+VBmGkNxBkzDYr8uWgrUjMbcF4FQeNZjEQtLUWpmU06n?=
 =?iso-8859-1?Q?12/S3vkanAGLaoqlbPYshe4z+sIZnUrr1lwR2C7EoxiAXFXD4XqCEX66rU?=
 =?iso-8859-1?Q?aL5+CMy1H9zWiWiqn+lFh2LRvsUQEgo=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 6200ba97-ccc2-481d-dd64-08dee3056525
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 06:42:24.5905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PX5u0ZarylE1QbAreJoabqMpOVSCJHMAvtPhEbZChsaIFEgwpq42gOu3i1eLiiED7EBX6otY3l97bZd7wNDhmbSlvSR0OsjA5bJk3AEKnOk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR01MB6518
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 06:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241062

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-extended/sudo/sudo.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sudo/sudo.inc b/meta/recipes-extended/su=
do/sudo.inc
index a23de1fcf7..1fe0447e53 100644
--- a/meta/recipes-extended/sudo/sudo.inc
+++ b/meta/recipes-extended/sudo/sudo.inc
@@ -19,7 +19,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D2841c822e58=
7db145364ca95e9be2ffa \
=20
 inherit autotools
=20
-PACKAGECONFIG ??=3D ""
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'audit selinux'=
, d)}"
 PACKAGECONFIG[zlib] =3D "--enable-zlib,--disable-zlib,zlib"
 PACKAGECONFIG[pam-wheel] =3D ",,,pam-plugin-wheel"
 PACKAGECONFIG[audit] =3D "--with-linux-audit,--without-linux-audit,audit"
--=20
2.53.0


