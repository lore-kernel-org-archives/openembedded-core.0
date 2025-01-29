Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79C85C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 16:16:57 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.57])
 by mx.groups.io with SMTP id smtpd.web11.16344.1738167411591764148
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 08:16:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=qAzkv31G;
 spf=pass (domain: siemens.com, ip: 40.107.20.57, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UWIekQs7c71aH9j9b96N2smRvlidDIzsQ9bGFo8GZ6AP+dYEZtVx/joyw4R+GnCrNxeo5/iMPlGilzy3fMaVKZ4bmJNG7SKSaPqI8a7dlIiKpTEmXKTwG6BPMjKvoCHBOb6RQ/qusp0XqC12joDOMO5BYCC2Vv9UYVVyyuxilZMgOVkYYJs0T88+ZCPDw3WzfUIf6N2a+yotDycF4f7zhieuw8/BcEnwjLFiFEXUAC8gIZDbHRLGeuFUwQ+5ogCOICAXjuCRVfECiA4cHtJd8rIC0agdhu1MIDjkv1istxvkgkY+voc3NREao9vFunOIBo20+xFSWTqzwvlXuPz93w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fiud5PybLvGrirufljOTCasMf1NbT1flOHhrjjq6658=;
 b=rk+DdauUjPiHaIB+41GPXlUtf/n+M9PYRpR2gPz1luzj0OTOZT2QJD8eSjcezRWQ8AjAzVd/dSZaMFNf09i0imRSd32h69rYgd6PCczE8KDpyIY4XnFmjcwvVAbmwZ7s1gzn7B5dWHo3euSK2CjSaz6SoqjDKyd2xl4B8i8zZRQ0u5sDSzIFPHJNsiDE3yl9vB5BfsieWmJkKNyaFXk9GIuIMbOylygTchS2FSIXGiibureeVImPwKhY2973sHjD2zyShncSPs+5a+eusQE1P8+2dbWhjBL18ZoAWx1/XFFLjb1WnWMVXxUgHNSqIJ3yg2MS5EHNABRArB323m3TsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fiud5PybLvGrirufljOTCasMf1NbT1flOHhrjjq6658=;
 b=qAzkv31GjYXQmoze+nognHVe+8bTEslKNOWsK8nbd7IiBjnEhMqDx7K7U1Bkv2rrlRrK9kKfFT+l0A0cMNRmqenFxAMd5InzOtKPDi0jhql4wAzv9A6TM2IasEmNFlIYvw2T0HkDQ/KY+6kP0G/hl6WAkblevMIx8bEYyQJCCdTOMPN9Ur7Hlg2YO4QxaBOTBlVfbaIWgv9YdeKSGC8GnyvFs89NW3VS3k3fJ1uYVns4qfqagkfUe3yf5UIXMwv1lN1oFD7cw3JzrVmnrdOBlF8JcA+1uOH2KzMLEWpPTlabb789uKR9343ip/zcy/rNyu1JTfgQqc2/KsxKjWlNJA==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS8PR10MB6200.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:54e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.12; Wed, 29 Jan
 2025 16:16:48 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%3]) with mapi id 15.20.8398.005; Wed, 29 Jan 2025
 16:16:47 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Steve Sakoman <steve@sakoman.com>
Subject: RE: [OE-core][scarthgap][PATCH] openssl: patch CVE-2024-13176
Thread-Topic: [OE-core][scarthgap][PATCH] openssl: patch CVE-2024-13176
Thread-Index: AQHbbQ4znc3wfgN+mEKibJB1UUZfObMt+CCA
Date: Wed, 29 Jan 2025 16:16:47 +0000
Message-ID: 
 <AS1PR10MB5697B7312D1466DA832BA091FDEE2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250122204157.4016363-1-peter.marko@siemens.com>
In-Reply-To: <20250122204157.4016363-1-peter.marko@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=4f6ede17-55c3-43a1-b13d-77ec31d81036;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-01-29T16:16:14Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS8PR10MB6200:EE_
x-ms-office365-filtering-correlation-id: 80f2afca-7d82-418d-1688-08dd40805475
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?tO91CDbejmw83r3V7Iq5be6EXUp+I+EdeY23/OWeFQd5ywkhUSBsYcKiO49p?=
 =?us-ascii?Q?ZzmNPSclvbF2+hMeo3aZUPUp3kuZzz/mJ+P2skItWujMHqoiFUmSKBpPdwoy?=
 =?us-ascii?Q?AUx7qY99d/AzxbkBNsMZ4Ub9kpnfv5iibyRF5reVpsRPAvIW+AVRwBUR5WeP?=
 =?us-ascii?Q?iLlngl94wox/6rZZzuPGMIxHzYZVpFWIJmsxvQBDqMlDGs+BgObkZrUiVF2b?=
 =?us-ascii?Q?m8YsOFLHYrwmyJlHCet+kj98X4b0UxIvdMDdl3fermy4Xvh1620pazZ3Ok99?=
 =?us-ascii?Q?uP4soZDgjR0Ky/FY3CRema6KRi006qi6gOzUATeFc/LhJgRYnPl97yCvYnbS?=
 =?us-ascii?Q?RJZZ5fMfwAYWRkVrmRgTOoLJMhr3XeHyretlPmKDFOpuBOkYzxjxq/zSiCqU?=
 =?us-ascii?Q?Y7Ryw4scAE+Kh79au5pTEL54MwKu7KCBHpP7QMYV4wXOaew1wZ/DhmhXMyxy?=
 =?us-ascii?Q?Qz3D+jq5mzlVnlJfEaJbcTzu5e8pDOpgd/eOAEkNXkNbmfE1Eu/1nm+1Sp+W?=
 =?us-ascii?Q?+8je3Q59h3drM/ma6kANuELklEzFG6fS8O1xA8AZ3uc+TPuGeS8uoN89jEGP?=
 =?us-ascii?Q?YSscbJy/ThCdsa/sHyWlujeEZ92sKEH7gk5KXbFya4asbpY0FQolYlpzVOGS?=
 =?us-ascii?Q?ghpTNcCNdZE0WeMrSlGN2vnA5pFd/Xw62WWKZJBut+1b3em4wHfhV1Ezruot?=
 =?us-ascii?Q?6XAd6tyecFAgBt7ReMFuX6RC3qvg+IyCLMnrIIHaNJPOUn5OGJXpRvYNJoi5?=
 =?us-ascii?Q?1pywD0BrdgZbyYEQqoXkAIOu8OuQeAWUZO+0cG/6bZIxdQQQBBbe4Wz9MgxE?=
 =?us-ascii?Q?JGPeIIv2nIy8IvWhTDWGOzfcOJi+aCOzChHoBE7K1U2bHIW32z+dvXtzThfP?=
 =?us-ascii?Q?Esl//SmvCwKLQmKAL7kA/shMAP9L6Kx/ZCq14ppaLZvBlqjjfE/yHAFVilz2?=
 =?us-ascii?Q?POXCCP8GJaqsK+p3Z05Xr5x0qFeTTI+Y5pCg3m1lCSHQ4PjsRNKsNDaioO2x?=
 =?us-ascii?Q?nge19IEkS20kGzzTAv5rmvg6eZ/bW553uopEW2hNdOHVg3nJZ8y6BHDUIvV4?=
 =?us-ascii?Q?0M8a86iB/qD0yTkKYn6gw7XFcI7xm+/HcfqvM2zG2cYihYEJENXphXjU3msE?=
 =?us-ascii?Q?eQL5wZuoGb4kdEvfotfeHRM/gB1MyiO4NHhgA+TVJP04Lm/KHLtKPfHHJ+gQ?=
 =?us-ascii?Q?eCHokIZTUMF+LARKqMBN+88pVwqJNJ48+mjMGpS19D7opgkr75GySPjiqU6Z?=
 =?us-ascii?Q?1kbNj51Qwtz8EMDG7Je4+/OGEcKiGLx2widHOUX3Lgw4V8sP9ECwOsYfZZzP?=
 =?us-ascii?Q?B0OBR1YKo73sZyk4v+6UjUBhjv7KWn8oJekEq6q2UkE8QHPeX4e9QaHtOWZR?=
 =?us-ascii?Q?WHASxxlyDgIIegHwGhu6d97GfS1A?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?oAjlQhnWCh996Dsd+mb0L9ElG3PQhPP0S1uvXVcc2a90I0hd82FjyjhY+D01?=
 =?us-ascii?Q?QAxA6LdQb6QIDQyvjkiaacIXi/gycbxFqXOu6MQ+y7ttDVSnZCxiUkiH+3EL?=
 =?us-ascii?Q?v5TPDpsVWBObMSFc+/uxxaKscX0O+ZyImGfj4tKbkk93OkAtXcXNGEJyLyhG?=
 =?us-ascii?Q?3/GGYhq909FVSWh82eNvmKurVnj5Mtb+JUYxizeBGwtTn5It+8P+w0b5FxF9?=
 =?us-ascii?Q?lonfxlDfMQteGNaVsPvTBsFlDeN8AlZG7Zgi+hWVEmmvkbKT8g9QGN/UUtMi?=
 =?us-ascii?Q?bYFBrDoGL3zpwMsaw4UkKYpIyF2tZ2r33jK/shvrjSOJ2YKiyloRR3NdIJKS?=
 =?us-ascii?Q?eAiRVfqSqJQX8/tmLGPJdFCBYnz7FcQ5xvt5/ym6IfedahdV/fl70YSoo8mW?=
 =?us-ascii?Q?JTThAI5FFZf4m7VD2atxKn/9Sk/KtWOwZqjZxS6nOCy5HqA5wwYWiPsO6NRD?=
 =?us-ascii?Q?ZtlAQV/zgND4c9WgXq/BGSpCtnIyNJrrkoTpt+sT7YGQ8rpUCCkYtLogpO+P?=
 =?us-ascii?Q?5bK9DJvgz+zD8QIYZ+oz90fq6mK8Ob42suA2bCk4t7gdsMIiXSDigC1WRevZ?=
 =?us-ascii?Q?sr26kPRxIPyAlpbXmSDrn8htWft1A1bIcw3ILa9ebVumR/aewxMTHicznaXP?=
 =?us-ascii?Q?4RSs75Afe2WwLShCBU9LR0dICqMP10YYs5CAWHlMBIxT9W1Ab1Q6dkPXhwDD?=
 =?us-ascii?Q?wj/msszkarFb804Ke3J2pV/TpPA61Gdls5jahDBG25I65W9/2xp3SA5h3moz?=
 =?us-ascii?Q?Z1y1bBTJaXtwrAQbo5kPrfPzxvB+V1x1P5gfPs0EAboVVSF1+pel6SO638JE?=
 =?us-ascii?Q?DftDhzgJa56WrZrYiIrhQy4eyVvyu4XKRHDFnMX4rk+OtVEz47Qcvv8qmORg?=
 =?us-ascii?Q?FO09a2O0sFA8Vx7Vl5FAs57boNKym7dZaUmbSCc/H4ETRk2Tkyl+prCck50u?=
 =?us-ascii?Q?A5bYb16hZUJzRraKJVpKo22BT2Chc889j7UgSaSeRSIYedvIUbMgb4rjKz72?=
 =?us-ascii?Q?xFBIp+qz98ZO1ypdaDQh2cCrVOw374koKst2Z6GGV20DDoSDFcHj7YcDYVbB?=
 =?us-ascii?Q?URM1fzJQhe1DQ7Y0FORmCOM0SqEykpHx/KbjlK/7UKuhfTCKmD2m4+zusmxa?=
 =?us-ascii?Q?MGoCJjAmWOtBxoRy800dK0xylU37iAW2iYwUCjdRLZLhaZwNMwY+vaIA5F35?=
 =?us-ascii?Q?Gqd6EdrFyhSe9h+704kmZObmO+3/+TqYK/1gftAxpfHLichjeipmLqRM1EUS?=
 =?us-ascii?Q?qaqkR6+mPzGL8Rr/gARDg+lnK9Qi+NGeSRGD7LO2dKz09ZWykYcCp4MpuvaB?=
 =?us-ascii?Q?kvYHmVzPUkeqhRwGdLOCjXXegLhAVD5AFUsemFsQ6qvAR7n1C3M/qR0o6o4D?=
 =?us-ascii?Q?NQRf17PhEnI8+gGdJAYKBwspsQfiWZx6vYxRqD+BSKcEO1T3MHXd1Cr8ZLzA?=
 =?us-ascii?Q?0O16pgWCeTQ0kNk+JyIG+dkGcBKkQjj9BdvQ3FosWd8ssr+wyyJnMv0xpSt4?=
 =?us-ascii?Q?t2o0jzDJkGNeTqoBAwsTTZXIPgOdtg7+J82XMw0QQbuF9Sn1n36jC6v28ziM?=
 =?us-ascii?Q?2trmIYizUYB6wIYU4xZK+5AHGslQTpNhWDZ22fXl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f2afca-7d82-418d-1688-08dd40805475
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2025 16:16:47.3142
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uIDx8HgM56uQwu8dK2hzMp49GHhGL44eCCG5S4OW2UsbaPoScYLK/T8wW889dYfbPXuKyEEGj8Q2McrjciqUHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6200
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 16:16:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210388

Gentle ping

> -----Original Message-----
> From: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Sent: Wednesday, January 22, 2025 21:42
> To: openembedded-core@lists.openembedded.org
> Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
> Subject: [OE-core][scarthgap][PATCH] openssl: patch CVE-2024-13176
>=20
> From: Peter Marko <peter.marko@siemens.com>
>=20
> Picked [1] per link in [2]
>=20
> [1]
> https://github.com/openssl/openssl/commit/4b1cb94a734a7d4ec363ac0a215a2
> 5c181e11f65
> [2] https://nvd.nist.gov/vuln/detail/CVE-2024-13176
>=20
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  .../openssl/openssl/CVE-2024-13176.patch      | 126 ++++++++++++++++++
>  .../openssl/openssl_3.2.3.bb                  |   1 +
>  2 files changed, 127 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-
> 13176.patch
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2024-13176.pat=
ch
> b/meta/recipes-connectivity/openssl/openssl/CVE-2024-13176.patch
> new file mode 100644
> index 00000000000..28d4dd706a8
> --- /dev/null
> +++ b/meta/recipes-connectivity/openssl/openssl/CVE-2024-13176.patch
> @@ -0,0 +1,126 @@
> +From 4b1cb94a734a7d4ec363ac0a215a25c181e11f65 Mon Sep 17 00:00:00
> 2001
> +From: Tomas Mraz <tomas@openssl.org>
> +Date: Wed, 15 Jan 2025 18:27:02 +0100
> +Subject: [PATCH] Fix timing side-channel in ECDSA signature computation
> +
> +There is a timing signal of around 300 nanoseconds when the top word of
> +the inverted ECDSA nonce value is zero. This can happen with significant
> +probability only for some of the supported elliptic curves. In particula=
r
> +the NIST P-521 curve is affected. To be able to measure this leak, the
> +attacker process must either be located in the same physical computer or
> +must have a very fast network connection with low latency.
> +
> +Attacks on ECDSA nonce are also known as Minerva attack.
> +
> +Fixes CVE-2024-13176
> +
> +Reviewed-by: Tim Hudson <tjh@openssl.org>
> +Reviewed-by: Neil Horman <nhorman@openssl.org>
> +Reviewed-by: Paul Dale <ppzgs1@gmail.com>
> +(Merged from https://github.com/openssl/openssl/pull/26429)
> +
> +(cherry picked from commit 63c40a66c5dc287485705d06122d3a6e74a6a203)
> +(cherry picked from commit 392dcb336405a0c94486aa6655057f59fd3a0902)
> +
> +CVE: CVE-2024-13176
> +Upstream-Status: Backport
> [https://github.com/openssl/openssl/commit/4b1cb94a734a7d4ec363ac0a215a
> 25c181e11f65]
> +Signed-off-by: Peter Marko <peter.marko@siemens.com>
> +---
> + crypto/bn/bn_exp.c  | 21 +++++++++++++++------
> + crypto/ec/ec_lib.c  |  7 ++++---
> + include/crypto/bn.h |  3 +++
> + 3 files changed, 22 insertions(+), 9 deletions(-)
> +
> +diff --git a/crypto/bn/bn_exp.c b/crypto/bn/bn_exp.c
> +index b876edbfac36e..af52e2ced6914 100644
> +--- a/crypto/bn/bn_exp.c
> ++++ b/crypto/bn/bn_exp.c
> +@@ -606,7 +606,7 @@ static int
> MOD_EXP_CTIME_COPY_FROM_PREBUF(BIGNUM *b, int top,
> +  * out by Colin Percival,
> +  * http://www.daemonology.net/hyperthreading-considered-harmful/)
> +  */
> +-int BN_mod_exp_mont_consttime(BIGNUM *rr, const BIGNUM *a, const
> BIGNUM *p,
> ++int bn_mod_exp_mont_fixed_top(BIGNUM *rr, const BIGNUM *a, const
> BIGNUM *p,
> +                               const BIGNUM *m, BN_CTX *ctx,
> +                               BN_MONT_CTX *in_mont)
> + {
> +@@ -623,10 +623,6 @@ int BN_mod_exp_mont_consttime(BIGNUM *rr, const
> BIGNUM *a, const BIGNUM *p,
> +     unsigned int t4 =3D 0;
> + #endif
> +
> +-    bn_check_top(a);
> +-    bn_check_top(p);
> +-    bn_check_top(m);
> +-
> +     if (!BN_is_odd(m)) {
> +         ERR_raise(ERR_LIB_BN, BN_R_CALLED_WITH_EVEN_MODULUS);
> +         return 0;
> +@@ -1146,7 +1142,7 @@ int BN_mod_exp_mont_consttime(BIGNUM *rr,
> const BIGNUM *a, const BIGNUM *p,
> +             goto err;
> +     } else
> + #endif
> +-    if (!BN_from_montgomery(rr, &tmp, mont, ctx))
> ++    if (!bn_from_mont_fixed_top(rr, &tmp, mont, ctx))
> +         goto err;
> +     ret =3D 1;
> +  err:
> +@@ -1160,6 +1156,19 @@ int BN_mod_exp_mont_consttime(BIGNUM *rr,
> const BIGNUM *a, const BIGNUM *p,
> +     return ret;
> + }
> +
> ++int BN_mod_exp_mont_consttime(BIGNUM *rr, const BIGNUM *a, const
> BIGNUM *p,
> ++                              const BIGNUM *m, BN_CTX *ctx,
> ++                              BN_MONT_CTX *in_mont)
> ++{
> ++    bn_check_top(a);
> ++    bn_check_top(p);
> ++    bn_check_top(m);
> ++    if (!bn_mod_exp_mont_fixed_top(rr, a, p, m, ctx, in_mont))
> ++        return 0;
> ++    bn_correct_top(rr);
> ++    return 1;
> ++}
> ++
> + int BN_mod_exp_mont_word(BIGNUM *rr, BN_ULONG a, const BIGNUM *p,
> +                          const BIGNUM *m, BN_CTX *ctx, BN_MONT_CTX *in_=
mont)
> + {
> +diff --git a/crypto/ec/ec_lib.c b/crypto/ec/ec_lib.c
> +index c92b4dcb0ac45..a79fbb98cf6fa 100644
> +--- a/crypto/ec/ec_lib.c
> ++++ b/crypto/ec/ec_lib.c
> +@@ -21,6 +21,7 @@
> + #include <openssl/opensslv.h>
> + #include <openssl/param_build.h>
> + #include "crypto/ec.h"
> ++#include "crypto/bn.h"
> + #include "internal/nelem.h"
> + #include "ec_local.h"
> +
> +@@ -1261,10 +1262,10 @@ static int ec_field_inverse_mod_ord(const
> EC_GROUP *group, BIGNUM *r,
> +     if (!BN_sub(e, group->order, e))
> +         goto err;
> +     /*-
> +-     * Exponent e is public.
> +-     * No need for scatter-gather or BN_FLG_CONSTTIME.
> ++     * Although the exponent is public we want the result to be
> ++     * fixed top.
> +      */
> +-    if (!BN_mod_exp_mont(r, x, e, group->order, ctx, group->mont_data))
> ++    if (!bn_mod_exp_mont_fixed_top(r, x, e, group->order, ctx, group-
> >mont_data))
> +         goto err;
> +
> +     ret =3D 1;
> +diff --git a/include/crypto/bn.h b/include/crypto/bn.h
> +index 302f031c2ff1d..499e1d10efab0 100644
> +--- a/include/crypto/bn.h
> ++++ b/include/crypto/bn.h
> +@@ -73,6 +73,9 @@ int bn_set_words(BIGNUM *a, const BN_ULONG *words,
> int num_words);
> +  */
> + int bn_mul_mont_fixed_top(BIGNUM *r, const BIGNUM *a, const BIGNUM *b,
> +                           BN_MONT_CTX *mont, BN_CTX *ctx);
> ++int bn_mod_exp_mont_fixed_top(BIGNUM *rr, const BIGNUM *a, const
> BIGNUM *p,
> ++                              const BIGNUM *m, BN_CTX *ctx,
> ++                              BN_MONT_CTX *in_mont);
> + int bn_to_mont_fixed_top(BIGNUM *r, const BIGNUM *a, BN_MONT_CTX
> *mont,
> +                          BN_CTX *ctx);
> + int bn_from_mont_fixed_top(BIGNUM *r, const BIGNUM *a, BN_MONT_CTX
> *mont,
> diff --git a/meta/recipes-connectivity/openssl/openssl_3.2.3.bb b/meta/re=
cipes-
> connectivity/openssl/openssl_3.2.3.bb
> index 2c30dbd47ab..0b47bab5507 100644
> --- a/meta/recipes-connectivity/openssl/openssl_3.2.3.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_3.2.3.bb
> @@ -13,6 +13,7 @@ SRC_URI =3D
> "https://github.com/openssl/openssl/releases/download/openssl-${PV}/op
>             file://0001-Configure-do-not-tweak-mips-cflags.patch \
>             file://0001-Added-handshake-history-reporting-when-test-fails=
.patch \
>             file://CVE-2024-9143.patch \
> +           file://CVE-2024-13176.patch \
>             "
>=20
>  SRC_URI:append:class-nativesdk =3D " \
> --
> 2.30.2


