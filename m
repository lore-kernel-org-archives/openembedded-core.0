Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADAA0EDE99B
	for <webhook@archiver.kernel.org>; Tue, 10 Sep 2024 15:09:15 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.42])
 by mx.groups.io with SMTP id smtpd.web10.26116.1725980949480220901
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Sep 2024 08:09:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=HdgULufC;
 spf=pass (domain: prevas.dk, ip: 40.107.104.42, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ABtH3XFPWfZ7STVkczmcL9vnfETV+j5o1havi6od087kHTG4ajJZl/ZUz2MXQJVLMCZyvISCCi5nS3Wls9QpiDKEZU3NnCgnBH+xg5n9QiHBHUndeEz0gz8+2C+CqzU+k1sTxYtRbByZT4Kf4TcMaxP1KswqNsiWgJChveiUueKtR2Lx+Fh5GPvQzoDniuqweYsWf55Zw4lp/l/5LhBTWOS7CiCFRpS8zuG7tna0SbfMAIOm6OYT0olHxPibT4gr9AIKT0+AzFAPHVlDfFRKF//tv2BeBB6PP4Nyrvx45K1ejR/RfdlaPXi9tu1m7rjnVnJWIVOtg4731sxRco3AGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=StbfeWza6wc4HoRHOyDVoC5ImwPp6nWGirbWUsDDlIg=;
 b=LOeHzmU/KR2b/ybZWbl8+nHxcwf1B/yQIeyhkTMg5XvH0RBWTdbtUtjvspLC+mbK+89CC2V88xULoEbxKwE3GemDtohdY42DVA3d4OzNLozFbcoL8+rz8cAy4E1BJdZbNtnzAwSPtEyQcQ7KLR+zremB+TmS/48S7rJJ4nqR/Cly0r9jJ/68x2AlLIG/IYg92/rpwpn0HGEn9kwBrjIxXHoDDjwpxXdzHrdV8iLJ8I5xyg/34SqTixGPuvEUKgPdO3UsxKdKuCmqGb1CBdURuTmj9+2gozH5kR2C/GplfxzjyHH73ewlsbdeWATQQ0PYu4f9J3P9cjzUna/OuVooRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=StbfeWza6wc4HoRHOyDVoC5ImwPp6nWGirbWUsDDlIg=;
 b=HdgULufCJbaxTO/cZ1TInNySdnjsHL+VvFthJ3jh4Q2TTNVJWTiXOrEnd/210MwWnyPsvczdHz9PlSoYsWJTPQHZsLFnrbrbjv8jCXvBwrjMe7JL6e8Uh8hKQBcv3T0HrezE+iw4JSKRFiyjRFMyk5dgLxwu79lVAd2BRu+Bs8k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by DBAPR10MB4009.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:1b6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 15:09:05 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9fcc:5df3:197:6691]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9fcc:5df3:197:6691%3]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 15:09:03 +0000
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Alex Kiernan <alex.kiernan@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Subject: [PATCH] systemd: include sysvinit in default PACKAGECONFIG only if in DISTRO_FEATURES
Date: Tue, 10 Sep 2024 17:09:03 +0200
Message-ID: <20240910150903.597409-1-rasmus.villemoes@prevas.dk>
X-Mailer: git-send-email 2.46.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BE1P281CA0378.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:82::11) To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|DBAPR10MB4009:EE_
X-MS-Office365-Filtering-Correlation-Id: ba8790c9-b23c-4483-6273-08dcd1aa81c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vBsogo8wBRHDEMv/Z1lNoOZ5rt5N4V9siRgCx6GLQkEFUhqMpRTo+6UXVHK7?=
 =?us-ascii?Q?N+onH3AZ6GkGc/Hce6bfr1MCne0ILHWUqSMrSK6XVd36OwQVBarQNcxXUURX?=
 =?us-ascii?Q?PvlSJz1M4ICtYL0CvZUHJcpxcPn6x+Z/Z9YIIgPYJ7sPmCbBY5PKH38/gxIh?=
 =?us-ascii?Q?SWISm8Z9wuvPc8lX9Y7ceTUPieROUFWK7HsGW5AZE/eFvMXuPY6tO8GhEWKh?=
 =?us-ascii?Q?EFErgvBBBV/sA0l+TUkaIosWiGrxncRfd3KfOGDPbabVKSaMLAb1gFT7T9ED?=
 =?us-ascii?Q?x7XzmxHFLepsyZMRHMHQGDUnCqwU1vhGGI7AO/MD0ySKGZqy/uuVKFNtdJR2?=
 =?us-ascii?Q?tH3lJEcVDXzbMwxlisVZuR83juoibvSw5PYH2hSvJl1W0mjLiQO0Rn1CJuOk?=
 =?us-ascii?Q?/etxpSjzxX1R+M7Wa61t0g0WBc8pGDUy6/zeU9MQqZqeXq6b45+C8R4NnxEs?=
 =?us-ascii?Q?kgh+VSu9Hi3e/OS1BG5CETXUnMmsxSs+EZ0Er+m3Qs4silqcoUQXrURSuJq7?=
 =?us-ascii?Q?BsM0Mtze5U8/kh7nHskxmGhpgK3jAYAwA6f86CFMjAUuzsL4xUrH9Vp2GPIl?=
 =?us-ascii?Q?DVp8LqpsXYHbTthJWyoP34F8S6MaPx3bQiNB0rfHuHNkh/a+1pST0yOpNtqt?=
 =?us-ascii?Q?YoFjzFVFu9ZetJd30a+8jAOeAficdf/Zaj5ieqhoohtW1xJtOczN4G94bR0i?=
 =?us-ascii?Q?IGI4/nwvLo5k7MFQI/X+qLNwxL5ITzIbYq5+fCyhxu+A0v04+gvBSE8mwJzC?=
 =?us-ascii?Q?UoQTyBWn8ZJP7yPj9lBo+sX5/++WQC2YX23+aRYZoGeONEU4lF1Zin+vi9jr?=
 =?us-ascii?Q?/phOCkAPZODJxU9vnMEd13zYhokDv62xfdN/oUh2nsuY2LOE2oGMCaGQi8Mo?=
 =?us-ascii?Q?fgbeFHyKPGRBjGuSujaa8OK3hJTOP19NFfrWPBNQimSp+iRfx9jpM2TUSN7l?=
 =?us-ascii?Q?Kvsg5cjjpBUXABCKAsgmrN2fMgLBmmVWiFxMAICnzGZWm7uycWY08z/6FGtw?=
 =?us-ascii?Q?lxIF6EOiXaVlAsZrvsEd+Bu2JqJdc61GCydzZcPDoGHdUpiKknTotcvTAt7U?=
 =?us-ascii?Q?RtVdpByutdwEErcc/C1lCmDiHGy+LapT759XqetiIgP3eXky2KvChyAoDsE8?=
 =?us-ascii?Q?oGrte/A4DjyGCUmSe9mAuAIhwOUMWTkTo7rhoBLBJHREEHwfIDaoYkQuSM42?=
 =?us-ascii?Q?HoSwwRHIuCVactWsWVg0n7QVf86pyd3RC7Qs+msAzCIilbwTrruDJGEC6Tg+?=
 =?us-ascii?Q?PnaaaKdpe++RTUbLCcIol8PYU4zgLXDtyBytAQOpMllc1oJmRp95d88OeyQc?=
 =?us-ascii?Q?wRJ2D+RlKhaSeIn69WHoJ5fGIvb54ZpywEnmHT8u4wEtfKo/4RyO68P+lVya?=
 =?us-ascii?Q?1MHFPIoZ3Nw/jwjH1Dj6fw7nrPwMPHRByOH3ipbNB7vs/7dm+g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3hxuy7tCGjoqpksEj9bsK+uOHcXU3OKWzDDKaS/0zVZJA5+ACwSKg/M/z5sO?=
 =?us-ascii?Q?xnQ2X7Jsn2kE2GWn8MnThnEaaiXOf0PyrGHEIs2W+Gql6fTJaKkl1w6E6yha?=
 =?us-ascii?Q?zetR8Y41w4De2Ijfc/pxsao07f2J27D0xTxQhl8P0+0a2/ZPX0AwQ7iBIFGu?=
 =?us-ascii?Q?afc++RDB/I9v7CRB9Up8ZVAxXP7OLLgUcLDUlmR49ibIyPiL148OHvrqTf/c?=
 =?us-ascii?Q?Jz0I9kq2ng9mtXhqMmxTEDP/Uw4Ma4gCd0rIiHm4W14UbWPDw2za1mAWnSh7?=
 =?us-ascii?Q?m1Jmqc0fa4PHe4BcpKtxWqqXtH10BjopDxMNcZNOUBG1MN0W46EhguPtVTU2?=
 =?us-ascii?Q?oNDD3MflMcUeyoXwA0F6BxqYo2VosB/G4m4OmlWUN9LztmNJSDo0P3xvd1CE?=
 =?us-ascii?Q?W/IySnmvd1kHPv9NhYCKGBn5Qs6ZxZKkgJcRt4MhGHhAwfpUqocbh6xiBia5?=
 =?us-ascii?Q?1I7Uhvu3a5bHbOi8eLrlVcZ82IYfGjhDm5vEqPNvoBCGUCMe6xBV8SNGDDan?=
 =?us-ascii?Q?rkPcIRtfTz3XRZbqwRdNfwZOi2Dq7J9+2BCPxWjlMcU/hS8oiEvF2wPP2NZh?=
 =?us-ascii?Q?zfBQSL+oKQ+Y+iYdkLazogAobQuNXp0DTwLlkOcHVXc5NiLM0U7CPt7KmWTT?=
 =?us-ascii?Q?ubVXDboeD1sZRLH1PoxlrtGfxoFtUpKZspeNfZ7qXxO7XwkXl1qWFfxm4/lc?=
 =?us-ascii?Q?vc8091NLR8QrgN84NTae5/ndamGxeD0WO9T/0FOCMeqB4/2g1ftwJF6RFANo?=
 =?us-ascii?Q?FfHmDMViStKdIegJGhH1hUEidgseRXCWMDcdtkQsnhFHcD0C6iQux7BR8a9Z?=
 =?us-ascii?Q?am+G4AsNDNaHPmPqlG60LGaIzae5G9H+n2I3afgNBC0jnqQsJt0KznGCohL3?=
 =?us-ascii?Q?tyey9uss/7vmXyhtR26iT0PJMsPi77Uw+xgaAfNz1KYJG2Qq59r1riuccmQl?=
 =?us-ascii?Q?qoI+vlWLuRUtnrWxxrgQ9Ja4kanYhdV05S1uBvUwgYvpk8RZeVgdLvZC/FNn?=
 =?us-ascii?Q?R9IprBRLciNe21sNcoXXJ5FgKfqJAo4HzdUOXOExSpjx4JqXuVdy0W3hCF7r?=
 =?us-ascii?Q?AHNMBzorZEvqT+YZCdVYDDpc+pxNfSeEbjuSWH/zNeq3wNgpkImhLcXVXliE?=
 =?us-ascii?Q?qlxtMoqbwcrPGXw8AEQwIC4Tq87Oc0iSIKd+vSa7SX3kL9MfGko9pKKV2Mcl?=
 =?us-ascii?Q?f6r9xmn72ruiN5mY7tMchsAcnxmuFWKf1R1NGAbCeDxJYzCxhvNwCvs4cnSy?=
 =?us-ascii?Q?fogXM66Qi4uY0QDEhm3tszDO2KSzNyTPWQ0bjFO33L97i3GW9p5n1d+PCJa1?=
 =?us-ascii?Q?SCGy8CJNqhdFYkqzJkfUWvZH9+bK4li+WKMmM6gPFm2dNj9EBEgB+tOOTldO?=
 =?us-ascii?Q?IL3lneMSrrp3BqFB6u6wmpzmDSgyII6onWWXErv1EUBXYy04lIPHHIHORgXx?=
 =?us-ascii?Q?znO05+89/Iy3G8y36e1OWY53ZzDPYKrNsepFfNp8OnWomAJaq6i0MSSt39OK?=
 =?us-ascii?Q?kqFGQGzMKMe0pjqb9L5wlINLhWYxgaEFBf/2FVB+jbAVBm26w7SrYrvQ1D5p?=
 =?us-ascii?Q?XmPC43b0VJgnCtQFT/is6spt5dRCaCvhgUfafeWELHXqFM5abe5QOx31xeAb?=
 =?us-ascii?Q?WA=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: ba8790c9-b23c-4483-6273-08dcd1aa81c6
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 15:09:03.2564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9x7E49Alk2wA154d5M3Ly3PPQ14+uenIgD805GHN/aX5wb7L2SK5rhSt/rLyP/TYet6eGQRELQN81u/db3yfruI8wZyDFP/d4vloaaNmL4c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR10MB4009
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Sep 2024 15:09:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204357

From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>

The sysvinit PACKAGECONFIG knob enables various legacy/compatibility
code that may not be needed or even desired. If DISTRO_FEATURES
includes systemd (as it must for this recipe to build) but not
sysvinit, there is no point building and installing that legacy
support.

As most other changes, this can cause breakage, but given that
sysvinit not being in DISTRO_FEATURES requires explicit opt-out (due
to backfill), I think the risk is low. Moreover, it is generally
easier to add to than to remove from PACKAGECONFIG.

Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
---
 meta/recipes-core/systemd/systemd_256.5.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_256.5.bb b/meta/recipes-core=
/systemd/systemd_256.5.bb
index db053b4542..85c7fc743d 100644
--- a/meta/recipes-core/systemd/systemd_256.5.bb
+++ b/meta/recipes-core/systemd/systemd_256.5.bb
@@ -73,7 +73,7 @@ PACKAGECONFIG ??=3D " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'minidebuginfo', 'coredump elf=
utils', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wifi', 'rfkill', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xkbcommon', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '', 'link-udev-sha=
red', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'sysvinit', 'link-=
udev-shared', d)} \
     backlight \
     binfmt \
     gshadow \
@@ -95,7 +95,6 @@ PACKAGECONFIG ??=3D " \
     resolved \
     set-time-epoch \
     sysusers \
-    sysvinit \
     timedated \
     timesyncd \
     userdb \
--=20
2.46.0


