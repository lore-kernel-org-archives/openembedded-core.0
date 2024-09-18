Return-Path: <benjamin.grossschartner@urbanandmainlines.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBE20C3600F
	for <webhook@archiver.kernel.org>; Wed, 18 Sep 2024 05:45:45 +0000 (UTC)
Received: from PA5P264CU001.outbound.protection.outlook.com (PA5P264CU001.outbound.protection.outlook.com [52.101.167.5])
 by mx.groups.io with SMTP id smtpd.web11.9035.1726638339580551562
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Sep 2024 22:45:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@urbanandmainlines.com header.s=selector1 header.b=RiZlGNbH;
 spf=pass (domain: urbanandmainlines.com, ip: 52.101.167.5, mailfrom: benjamin.grossschartner@urbanandmainlines.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cuq8pvRNy3YcSWBsX9tqwEvleeQnW/AuM2PL4TwmlUpnA+Yp7RuGEaLH6LGy7HKDbmBntgx2tINF8vPWkvebH0GXEgBAFZgChayXexyPevpB0g5Hun/xuBihNFu3Jm49ztMkwvCk3rN+Kcp0nMBptSTEFGk8pcdohABeRxaKmL/iu7kupRCUHu+Cp9lumR9/23lLceHG4OJOnIgCtEYvM/9Z4AtCxR4m48BUDE9HlV5kVKKjOAVa9DiekRjfKAIwJOm4QnNs8G4ZsYcUkxUm2za32gzQBleW8ZZPZeBzddbKl063xHXCMKB4kvmiFSF6RqRTrMWB0QbOn+yiRvb6jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFCldrQhDVa7lpzK980ilnoNJIaNwIF3aVll+oLznT8=;
 b=e2WAwFoA6YDOB/xfu95peR7P6UxrUTiqELTWfyQDyp6Uq72hvtKTncS7Uqw3QUq5UqI3QI+W35BTcDdHVjcZB0Mow3Wf95ypxkWzn1uMD2uraABuxXWHkl15flzE9y4UBOGi2fR2YQGCLWJVMcFDHEps+OdIr+yWGGaK5SWyoQPklpewbse+fwahzrxG/Acq29uaMxbr2TdVMqCKZCmCoGpXuWwbPbU/FCTEhRnxq9enBGsFLfeSiwL/Dre34cv1hLumnwhpwY4xXy8aphvfW5AE6eDjtSKtCN2KjizLDblb1n/VsS73uC+VeRFnMUYK/MQWZuuCBC5xyPmH//CI/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=urbanandmainlines.com; dmarc=pass action=none
 header.from=urbanandmainlines.com; dkim=pass header.d=urbanandmainlines.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=urbanandmainlines.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFCldrQhDVa7lpzK980ilnoNJIaNwIF3aVll+oLznT8=;
 b=RiZlGNbH3tkyhRS/pMZh1ng38KfjEyd3DWWMaZUfkSC941ul23zsuCWbG8T8mf1MI6NZv21698MBXZ9XV3kGerYx+7bAQLQXCrBkEd+/S/T0b1MV/Ik+1y2/6hWRKjeydO3AtMktTTV1HOeDPBToxrOGJkqto1KYmDTXKXGOY8HbkVMFBcj/GT206CDIqmIeP568u37BIe7sEaMb84YkhOJg8t57qvEkM92afUZTIudfOIG+iKYAyJupVsVDPaNuyiF10zLf3GdqH0JfFYmIq91DxRHzYzBqW+3cLdr0hJ3Aw2bKqYYYMDYS8C9EWEih4GuI/0W02rAG5oOBoyH47g==
Received: from PR0P264MB3595.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:164::7)
 by MR1P264MB2499.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:34::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.25; Wed, 18 Sep
 2024 05:45:35 +0000
Received: from PR0P264MB3595.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c294:6708:a08c:f02a]) by PR0P264MB3595.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c294:6708:a08c:f02a%7]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 05:45:35 +0000
From: GROSSSCHARTNER Benjamin <benjamin.grossschartner@urbanandmainlines.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: GROSSSCHARTNER Benjamin <benjamin.grossschartner@urbanandmainlines.com>
Subject: [PATCH] security-flags: Re-enable pie for power pc
Thread-Topic: [PATCH] security-flags: Re-enable pie for power pc
Thread-Index: AdsJjdLACekEwn2sSIqyHgBwhE4NGw==
Date: Wed, 18 Sep 2024 05:45:35 +0000
Message-ID: 
 <PR0P264MB3595982976989FEC3ED89B43F8622@PR0P264MB3595.FRAP264.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_edd4ef90-adc6-4485-ae6c-ef4966b66c01_Enabled=true;
 MSIP_Label_edd4ef90-adc6-4485-ae6c-ef4966b66c01_SetDate=2024-09-18T05:45:33Z;
 MSIP_Label_edd4ef90-adc6-4485-ae6c-ef4966b66c01_Method=Privileged;
 MSIP_Label_edd4ef90-adc6-4485-ae6c-ef4966b66c01_Name=NEST-CORE-01;
 MSIP_Label_edd4ef90-adc6-4485-ae6c-ef4966b66c01_SiteId=f33c7791-13ed-4c20-878e-518e247895dc;
 MSIP_Label_edd4ef90-adc6-4485-ae6c-ef4966b66c01_ActionId=1f08c3b9-fb75-49ab-8c54-6a5958a542f0;
 MSIP_Label_edd4ef90-adc6-4485-ae6c-ef4966b66c01_ContentBits=3
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=urbanandmainlines.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR0P264MB3595:EE_|MR1P264MB2499:EE_
x-ms-office365-filtering-correlation-id: cdb6e16c-f0f1-4b93-c72f-08dcd7a51df8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?DTo7H1k4ZzCFoIf/mUh5JqGkdnVph8DS0R4gyNEbp2zBmdqc8ydX6jWQVKqI?=
 =?us-ascii?Q?moSF34vxSmEAmJYRMQZ/ARUtKfI6TgAy1SjF/rEyEQjvS3mJ8nVUe7FLaoat?=
 =?us-ascii?Q?E0lkABM8GJNYX0Tt2D6c9/CdyL1DtdySAgRHvOd2zJ+wgnHCUvn8Q/g2Mcpy?=
 =?us-ascii?Q?oJO+5l5O9Rsrc1jnlS9J+WbhY/7raX7xRDfd+aaaQkdGTVm2UFrIgiEXmPwS?=
 =?us-ascii?Q?+fwOJUIzlDy7rNxlJ0nIbde9DCqPdup3Luu5DDxaM85863S1IRJITOA9l5vQ?=
 =?us-ascii?Q?agnWNJcg9JF61gsDR2G9vMYLAoJi4rSCuKVsEjyiXqFkRfzbKAQdXYA+pMhd?=
 =?us-ascii?Q?UPCLRQrm+Q5jpIMYLcxea9hx+9v56bXLMeisQvpABkZe9cpukupAalveh7E5?=
 =?us-ascii?Q?ZyXNCG3WTHPKFmhvRtkbyxdr6TDotcuy8JvJ+GAbYfMh3maER3Ox1p+hiER/?=
 =?us-ascii?Q?WUCroDZb1a0xE7POAic2K85pNVoUaA6FgPtF3hK3lELBFNypTM6q3Apf0zYR?=
 =?us-ascii?Q?dxHAeLxAX6EhSuI1uu76UwwhHnOJIC9UYZxTchYkDIPLJb5yzZwZrOu9zEwe?=
 =?us-ascii?Q?IfXmmfGig2PPwz+Mrs8OUH5QkDdl0V86avjsdI2rmadz3irUvxymKHgby/Rn?=
 =?us-ascii?Q?18LUBZSXscuierdpXQOG3CfIgeiQyY37KvH0gJ7oq9Pz3GB2Z6odgEM7PbIq?=
 =?us-ascii?Q?tILB8p8WCbCeOKgA7AaqG74y3EyfvLM7Nj9Plu3QD1fZL6s8OG8VVRNGhRIA?=
 =?us-ascii?Q?qddUiGJwhGzzJm/OQlIxeZXAGp0l431dFYbAlMYViHqWvqCkQiiZIWVCyvCN?=
 =?us-ascii?Q?LdUe45xVDU1PyW8eDEqYbL74SoPrmUh2QrNpHHFykkYDxWChEWZPk7e05Rs7?=
 =?us-ascii?Q?e3LVI+e3nYLqV9gkBGPaIsMLkHmFEBUlGI8gwzlw2DdKrapukP42w0QfViS7?=
 =?us-ascii?Q?Bktf+axDX9E8qDdIL69QhL0Y0/mYcwbrNB06Fhc3TEQgQ9d1rXxqwKDUcBcX?=
 =?us-ascii?Q?7mFwKXkQFC3Y828EAYSP9jq97+NgMMNdCQu3Y/mMqSBzHPgMVKnEko6AIRN+?=
 =?us-ascii?Q?pDEyvVDaJewb9iZ6FSyqzftIhGsO4QlAlXk0FLUK2yEQ4yaP45anVuON/doM?=
 =?us-ascii?Q?lvYxXwg2g7d4fvJSiSlRQjYK2FJINMiGdtrE7HDLVytfup9fXrfiPSzGIAWh?=
 =?us-ascii?Q?WC5RQwwqB7bFGm+r+h/MYrr3m3VLl8WcrrHWtB3v3EGAcWImSN9tEn0Rmqf/?=
 =?us-ascii?Q?CYqmUqZQyKA2U0kC9OiqT20uyQuy74wwLOGC70TATggculzCscjviNZWATfZ?=
 =?us-ascii?Q?dQAjDAQMOGUlAseQOQDA2fV36jiMgQMg1Gw6bezjqdlwxAuFYLG4M3m0vqj2?=
 =?us-ascii?Q?c93zg9u+MG+nPiDrdbIFj6oGJWJSU29w5JyleoMYVOaiFxPMVw=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR0P264MB3595.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?ZDpaBbbhdPVkw0cxFhQH7xvPl14psrf4PbL7fu28edsg86oYi+ocomD5XyHk?=
 =?us-ascii?Q?AC7/4XJ1rHuMOBkIDJWf4jlcCnEvWawiKDQkotmwSQd0EWcyHUO1+DOBy0Q+?=
 =?us-ascii?Q?hdgid9fLeteetsrTn7d7bCgI+ngXmFfMEH4Ah0jfW61EOwyRZlA6XYtvinde?=
 =?us-ascii?Q?Vt2qGQGC9lr0q/HZvgrinRdSBhes2SDV9uZVxDIPORsHJXS/miQmL6h0zJhG?=
 =?us-ascii?Q?JzYoF7zcZ+ZIdL9pKtVM2uBBaioL1imfrGzylFLP+NLFAH44Nd6r2tffMpwD?=
 =?us-ascii?Q?EoxQO2vaP5hMUojY/Mo0WfW2tP33q5Dm4VQv428XJHaVUyn60Jja9ck9jhhS?=
 =?us-ascii?Q?dtz3F5Pen10Qp7RHQvebC/+VCSf/xamMlVA6lTVjl9dM7zfNDcY3bZTIHLdJ?=
 =?us-ascii?Q?7414mtiU4uaD4MwpgSw46vqsnJjmC9pOYIZ9E5eVeCVkepsEZUvcpg3uItqf?=
 =?us-ascii?Q?W8vtXfW/JKNwV9CVZmMToGnGSD6CtJqAAhQTO2o8lYxIUc8tRR9CwgvE4YCj?=
 =?us-ascii?Q?6vg/iplb+sItc46vXIKGEn8iJAerPOXY3ojQfmoNYQuCiW6w7ZcjdmxfB1EG?=
 =?us-ascii?Q?PBGwN1pDVsybYEI12qdyD6KzOeSeXHiN7+BkI0BWqAt+dOLsHOcRRjzyihpi?=
 =?us-ascii?Q?DyUZQWZDl0ydiSY3Bv481l/LwyfTZtRCZHPbHGipJq1nuxPZIExS34i7y9Cc?=
 =?us-ascii?Q?dLKbelzNgAKX/TzQH3w8PGdd+TW79LGK/b53HAEYXgyi8UNfBJJWs13RqKBL?=
 =?us-ascii?Q?CK++v6kgnnteNZQ4OFFz1kX6NBxU9seFGhT7YZvvlJxdn2CmhIGn0qhkKOMd?=
 =?us-ascii?Q?/Y/MrmOU68FCgD2m2jromE06Fk4r0Sww71N8tlseQMnVMjrw4gFYeQxiCWKQ?=
 =?us-ascii?Q?eOLhGP8lpTrE6NR6W4wcyFWvATbkmKbs4ZRekIimSyt99q277PT+mklVRNKT?=
 =?us-ascii?Q?0tqHR7SqJ+Xs0qodlrMEiGkETb3mZAGCQeh5gag4bOs4eXmMzmvmhNvKBcpA?=
 =?us-ascii?Q?TOBVRFTfZ+cslNEkw8LifrIg+EpDLxu35b28Lzhe9fUkjRekgMTi112KFQFn?=
 =?us-ascii?Q?nWwlFzDI7tcK4zqcmKGjgHlpfTB8aUVDQqcMXWC+03qazqjl1E9plM1ncHwp?=
 =?us-ascii?Q?LME/mkoDsB1UGfjnuHk19el9CGzpU3kGy3kmEQuNxdFfBXKid21X5GsP5S6H?=
 =?us-ascii?Q?4BQK7ttVs606UTvXEHZkrt0K0zKTodjHQ7UbO8rZmXeqLcSqttjkZKexLxxD?=
 =?us-ascii?Q?8ireTF6lTZAmOfxWKnd/H9bTnpb0TINUUU10FIYgyTeEWkHcwZbvb+ZCbaR+?=
 =?us-ascii?Q?b4UB+0xEnJOSAUl4UCfQ9W0mxLEK9hTNNMykjYrEaeMrtJg8WdCjvY9s/ctL?=
 =?us-ascii?Q?2SyC5sJEYRJ6KrWMcs4cU+8/zMyzjWSSClHxu6klTcskkaSRT3zUWo0t+ILf?=
 =?us-ascii?Q?Uyujprq3qLTm46YSlN3PFO3TkD7CNfkJ5aBFFoiQjYDyhfZm/S92ldy+Q+F9?=
 =?us-ascii?Q?GgJ9mltLY1AeavgO08paGnG6LygHLoimkIfhHUju1rfXASGiO9uT86HMSZKY?=
 =?us-ascii?Q?tGEXX03DrF0/dUJ5c1grEQt2yTrA7Cq9BwMZUbsJxKddTeHTT9LaTKACdlAS?=
 =?us-ascii?Q?NdQZ9ruC5Wg/0MOGz59hLfKr9VaA7eKOixGmb23jEj0Q?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: urbanandmainlines.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR0P264MB3595.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb6e16c-f0f1-4b93-c72f-08dcd7a51df8
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2024 05:45:35.1889
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f33c7791-13ed-4c20-878e-518e247895dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aqrR4Jdsme8/vdGkZ0+h35Vy0MLjVlR0uNcodVnPSt6tP8yivQ9rctOTZueHBNmSO331Kz7wxA9kLPvxHqN3lRB/xFmlMNDtPHDl/vDkYLTFJ15/Wvb/XgPmKKxw6GomLXopsx9Bz2PE5yrXQCpIwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2499
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 05:45:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204632

Classified as: {Hitachi Rail - Public}

From f04017bf8bc0a4325de9e51251cd4d6dcdc1ecf0 Mon Sep 17 00:00:00 2001
From: Benjamin Grossschartner <benjamin.grossschartner@urbanandmainlines.co=
m>
Date: Wed, 18 Sep 2024 07:11:16 +0200
Subject: [PATCH] security-flags: Re-enable pie for power pc

pie now works with gcc on powerpc, see:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D81170

Signed-off-by: Benjamin Grossschartner <benjamin.grossschartner@urbanandmai=
nlines.com>
---
 meta/conf/distro/include/security_flags.inc | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro=
/include/security_flags.inc
index d97a6edb0f..f713a99465 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -31,12 +31,6 @@ SECURITY_NO_PIE_CFLAGS ?=3D "${SECURITY_STACK_PROTECTOR}=
 ${lcl_maybe_fortify} ${SE
 SECURITY_LDFLAGS ?=3D "-Wl,-z,relro,-z,now"
 SECURITY_X_LDFLAGS ?=3D "-Wl,-z,relro"
=20
-# powerpc does not get on with pie for reasons not looked into as yet
-GCCPIE:powerpc =3D ""
-GLIBCPIE:powerpc =3D ""
-SECURITY_CFLAGS:remove:powerpc =3D "${SECURITY_PIE_CFLAGS}"
-SECURITY_CFLAGS:pn-libgcc:powerpc =3D ""
-
 SECURITY_CFLAGS:pn-glibc =3D ""
 SECURITY_CFLAGS:pn-glibc-testsuite =3D ""
 SECURITY_CFLAGS:pn-gcc-runtime =3D ""
--=20
2.34.1


{Hitachi Rail - Public}

