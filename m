Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE8BC369B2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 08:56:36 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.55])
 by mx.groups.io with SMTP id smtpd.web11.4322.1744880192118175221
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 01:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=v8C29xyP;
 spf=pass (domain: siemens.com, ip: 40.107.20.55, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jbdBKqOoNkkaDCap39BDq6e9IDAHpK6iXhxosrpXTxbI8rNvEu4fCfz/Ui4hEQbb778kdPzcLO91rg81AhhEGLczJJpP8mwpmF9u3Q4uSBGMPCd+aI/IKsWg2rIHg6YpYS983qfrIjlh8KQqEU4LozMFccq/rPQgZDd1k4XqYKFhPZpwiKNTz/7MZAWtRNSTF99Gl4y4gaurZ3ya5CjajIpwRH7VeVruQjBuNls1oYf7ZPuZqbrVQsfr2K53ChAvd1M+yLYp7Tf93SgGY8kcYjeiCBbigN6Z2vCGpcHb5ja4DVNp82hyJlSOU5+GkGbrnOdw0JzYd9e+bc+MyJJwuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=syOKFuhpw/NKv533RDhTWkNDXghv87AF7dGFS02kn28=;
 b=yvoRsDkMTjPQQlBYOIy3m01n3JWqSQRid7LHm4+vKKwj/kBmVLf7a2TkA2ViJILENUG5+pqHBag2NFTcHudFpSW8Zpb0Us81hDOORgktU83HWRW518COPypZdeYUViRH1moyiVG8iS0dESLMd0stvq3PC5m8BC0ffDqJM+uU3eBkHHc8v/Xsdg5SV0RX/xM0u/K6CHj3J9cnTbm9LELo/0PheAXmQlOYUHbxu4kj5UMGQrCPr3Uwex5knOnnR6YZmGHNxOaFQKYKc+6mO4IUOVlnTbAF2UI7Z+Ld21OgfRugImFdsaV87I2uhhHmbWnWKPCel9XCneAFDZ2ubaK4YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=syOKFuhpw/NKv533RDhTWkNDXghv87AF7dGFS02kn28=;
 b=v8C29xyPXufg19FI+757vln1wk3hpHa8vxlnuiQo440YSymLuwUozZfL+UJe3IaJUu+UFFuN6rXuB4FL6pwvYOYyc/oD2MwIzbVtd/CZvAYs1lq/6koDwx1tZAWuhjY9XPXY8jWbqixOl1hdvfJh0ZYMG3CL5Sxa9onVdoZepWVnkRf4pjPzIPk/4aFdDLTu2qbmr4cCGrQv+OBkPx7SWjJq8Puwyh0gpUirHxyTvOCyr0iUFk66sKYSW3U4ZjEmvTspsXSpI6KiMkk9e3HE0QdW6kI4NbZ58qCn5NXcNAiq5/3yuugdpEJmQ+nbb7nY6IZ5KeuPxdQ2tRO73byYRw==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS8PR10MB7428.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5ac::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 08:56:29 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%4]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 08:56:29 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "daniel.turull@ericsson.com" <daniel.turull@ericsson.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "rybczynska@gmail.com" <rybczynska@gmail.com>, "steve@sakoman.com"
	<steve@sakoman.com>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>, "ross.burton@arm.com"
	<ross.burton@arm.com>
Subject: RE: [PATCH 2/2] cve-check-kernel: verify kernel CVEs using
 programFile from kernel.org CNA
Thread-Topic: [PATCH 2/2] cve-check-kernel: verify kernel CVEs using
 programFile from kernel.org CNA
Thread-Index: AQHbrtv0xupgj9+cZkitgA7IZUbMR7OnjxPQ
Date: Thu, 17 Apr 2025 08:56:29 +0000
Message-ID: 
 <AS1PR10MB5697E2E5ED8FC68ABAD0011CFDBC2@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20250416142859.909037-1-daniel.turull@ericsson.com>
 <20250416142859.909037-3-daniel.turull@ericsson.com>
In-Reply-To: <20250416142859.909037-3-daniel.turull@ericsson.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=9ebfbd73-dacb-4bcd-8f33-d0cdfe3e3a19;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-04-17T08:54:58Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS8PR10MB7428:EE_
x-ms-office365-filtering-correlation-id: 1c5797bd-c00b-4fd0-42b4-08dd7d8dbe57
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018|13003099007|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?M90GWuLbhtK1yQFwy5vOylq+Dq8UhOnEh/HSFduTVJPR9fzdwQm87oGeejMr?=
 =?us-ascii?Q?WB/A24LsY0G3JHZhBndVs3nCMmvHupMpFeuUJcd4Jz0EDOALAR7IToLhIjv4?=
 =?us-ascii?Q?2m7w4Aa3YesobzoJoz82RS/7Bh903/d5xbx7OuHucGDhkzgrjl2sNn+xCG/B?=
 =?us-ascii?Q?LaEoaPitkeVtfH5pUUlLaPf6jlygXVIp/AuySO+057H5axQoJ4NoLYV7jY8g?=
 =?us-ascii?Q?uSqIWJkf2BDoJL+hYKbk1HBmFHshdW6g8BztprauOxC15fi4OLYkO0lOepL7?=
 =?us-ascii?Q?I6HEXmOj2AvatUgqYe0uSdWn8k8rJh+cUr7BllRitdBZVevCbOPFrfhwl579?=
 =?us-ascii?Q?/KAl6Kmo45QAAFRuMSQ6M14N01+p/FTFb4G8th2UWTMbHtIxiydb0EhZMKPN?=
 =?us-ascii?Q?i6v/OCJkTTNzlECFkaVwIOINIyEcA2hoZZk8+CTHsNqZZGnNbln56pYpiQTj?=
 =?us-ascii?Q?qVnHvdIh9VNz1RZNrQlIHkvPBdFEH/CCpZEI2nUcTjuZfePPxK6dDsAhE+Z7?=
 =?us-ascii?Q?ANa76XTU3RCHU7XalMJ4EfO3dlbB8K/u/zzVcVZiYSXagnOH+7+ZuugQvX9l?=
 =?us-ascii?Q?zFgQ2axSsCkExxTw3savYLlYJSP57FgcL4cA0/tk08u5IQdZnhDD0XfpceMu?=
 =?us-ascii?Q?8lbyYFFrOMna+a/EiPS38pyTCUgzhW+RInaujFaxwhMJICfSFKsK05UTzzZS?=
 =?us-ascii?Q?dM9v+9nqV3CV/vmfyDmptUrkw91SCLZWFXKlB4A5OVWXXvH62Xos1l2O2XLg?=
 =?us-ascii?Q?KUAkNDkHHPIpm1wGQuibflG63TUpURRsNmn57XbH4KjZSXISG7YMmGKGEnhQ?=
 =?us-ascii?Q?iuAyoodQx34cE+FMyAjh3x8YGPQHW7XHEkDLyDezPTH0/acf9bTtV1mQBVwX?=
 =?us-ascii?Q?SPU5cL6UP05s2dw4e5+E3mLIlSjBSU+v+Mssx0ihxAZGuZ4ahsR7I7mLAPQa?=
 =?us-ascii?Q?VO495YyHH4zConeSi/dKLBXT4qtRY4LNa1gnjiBYK59Pf9DlpbCntEdSs1rt?=
 =?us-ascii?Q?OB931Dn0Gyr7xGG0sU9ppSUlEiAm2Mujj0+R+S61QTva3gZwLtRyyZ0y9Zq2?=
 =?us-ascii?Q?QQQg0TFO/qIfxjynGMgLrdY0obOmT9+hVPeYXTen+WcTiMfyolyAj17VyLL1?=
 =?us-ascii?Q?cKr82mSUi96jNnNYGCrTDelyuzf3T2T3SL7sUQB0qB+g4lZAo/fCto/HmVMx?=
 =?us-ascii?Q?HCVgu7ZOYDj3AK/qiMw7S4PIjGs46emoOWBqE2peEKKL4hcXXFiLemg2lt+z?=
 =?us-ascii?Q?25/I7iorNzLyZ0aYr7MDlyChoHj6W86nzfU6BeuhfK5LgV1VsYmtWY8WtjXo?=
 =?us-ascii?Q?mXhQp7/Tsy5LByo9U5f3pJW4AM2U08FRGrYQ8FiIOdfIb5+P1DTQR7k/vaYN?=
 =?us-ascii?Q?weGdOM4tu+1V0a+SQHeNzZDoJ/DHUm+6HYz767x2p8MvSObtiWgZAbict9N6?=
 =?us-ascii?Q?GL6u/IGas9pUz4INyTPwN9ZWstAdOtqLtEZG+PqDfNTHIlziCjbVrE+vWSpd?=
 =?us-ascii?Q?pjGjZDUfuD0qFMA=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(13003099007)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?UUBmXG1bEolwaOU08he3kAy+4VXY6rii8YLPNf6Xj8g8QaFFXieTWVZBpXBx?=
 =?us-ascii?Q?4Yz3b1/XNaEQIDgcQPjmDlpWiDwIz184mk2oGmWmy6ClbxHiOqqEP0f/XcER?=
 =?us-ascii?Q?vDagK+ToXkEK2Y2TEI2yUn7mqM4oTgfPl3Qo9sWGHRJ5ugInQrltmxU/lQUZ?=
 =?us-ascii?Q?Eh9HrHCJSNqpMDlrDT5N5jwRxHJyY+kVtGokGLbYVteZVy8R6kAQoyPuk7Sr?=
 =?us-ascii?Q?N65UR3q73J64oh5ozNfiUKihHLdhZl+6I+jE466Zw4waOj3/pSdLXRewCtod?=
 =?us-ascii?Q?wfuq9CcttOCW+iXZXWQRl8+cpNXtpXnpAw8MQhHPwQgybG+/gLi2xojSw3ue?=
 =?us-ascii?Q?KVhtFL3IFWAn+gk5oFFq7JCezhANmTttMmA1wOoArwhP3NTb5AWEItU/uIv4?=
 =?us-ascii?Q?MBSwBxPRB1AYC6GpmBB8HPKseV1qXs2zau47NoMISu0urR1hsmYMwGcVgtiF?=
 =?us-ascii?Q?3NBl9cV9Sa0qU5EwsaYMssOmp87juUf8/vfp7v9Xjf6T6nqHb91CLlGSkEOK?=
 =?us-ascii?Q?/bQ5ct5mdWO1ICgw/SAgGscyk1r0AlkBDbaZjjAGCxV8Uhq6NOQO4yhjSbyO?=
 =?us-ascii?Q?o+OGJdXvoFTmY24FclsEIVR0LkSbJ7oc7IWs+sSmGE3zyDt/UXfIk3LDkkkd?=
 =?us-ascii?Q?Yqsj9MZhCFH73NfgvcAX1KReLMgB0o+jVJTvD13stGZfL+VC9dBqUTlpOyCP?=
 =?us-ascii?Q?6sHWSEE9f0mXaFQZdby3NTxl4orJvew2NqFeMNFa5Uf464ne2zIWZ/B3fmTl?=
 =?us-ascii?Q?TX+46VHd8/5Q6MxYol5mfkZt5YnfxbrznM7D9K6isrgJfE4FJN6H3Sce/Uzx?=
 =?us-ascii?Q?jQxt3q9K8SYDjeStCmi7Eac9JSk/0YrGI1PYAdPNHgtFHrfu/8XhL2bnwUGA?=
 =?us-ascii?Q?Yi1H/redk2xUgyL5XrRLdhxTn65aVkeLXMIwn0Kn4JhpOJJah1Iqynp0W5FW?=
 =?us-ascii?Q?Mfp50jJ2Vs95bJhqP82CjUY+3mAAt0H594QssmC3MSHYlezyuArUIFKgr9g7?=
 =?us-ascii?Q?yLKS0lqr9jeuQp3pVevWYfwUn90PkOxNFNP9TvF4KAL8liFPR3nI4YwcDijn?=
 =?us-ascii?Q?5kXcwpGTgoGoYPd6Ptr46WRDrYqs+xExKIjKjbmLouKgmdWfO7ebyisjwHRQ?=
 =?us-ascii?Q?/EWSp3aeVtLmwbWi6k5690l2exYxzEMpMhxCOFHezbY7TxppMOWypQ7TO2G2?=
 =?us-ascii?Q?dkX0saqZi9PrvI5lTB05SnKpj9htlzIfbx8qZqoVz/TGdF+gJQvPVdW03k6B?=
 =?us-ascii?Q?2DHVjsKxF0rOpof6Q87qARcV4m9wh/O7QBf5VwHUKKB/iqBtmlL0+c4LyZQt?=
 =?us-ascii?Q?meS5Yng9J/SpXCtiZNqGYPZGzFN3gzOtT8QZQ2DDqhPylfFcPHKPFAzzRgbl?=
 =?us-ascii?Q?3aPcTeCbhtMrzfrE5JOgOgvAMOnpoRCA/F9k5Qn85fUkpYSLyqZkU0OoT4Yu?=
 =?us-ascii?Q?/OaxzH2D2PnoMpkuPbOYB/rQyvhR6+LB50/5IokQlLua+vHogFKq/pyzviRc?=
 =?us-ascii?Q?Mik4t1rlFcniYwiXeqWUgseWS3CF0PT9TDGJO1froeIKywXY3/bIzWp9AKyC?=
 =?us-ascii?Q?C2Xbk7CiJlIMG0CxiWnumJXsyEoFGir2cYUCqQck?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c5797bd-c00b-4fd0-42b4-08dd7d8dbe57
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2025 08:56:29.3371
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ri86zUmJwDoascg7+l8UensC2J4ACjyS27H93gkL1w/V9lgZTQc8jDipkfUC15M/lNFui/fQP1JKasLjOMo/Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7428
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 08:56:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215043

Hello,

I really like what is this new class trying to do.
Sadly, the kernel repo does not offer kernel config hints for CVEs, but the=
 files should also filter out a lot.

Current implementation seems to only overwrite file generated by cve-check =
for kernel recipe, so it's suitable only for generating cve metrics.
I see a major problem with this as it does not influence VEX and SPDX, whic=
h will become "the thing" very soon when the new regulations become active.
Not sure how difficult it will be, but my recommendation would be to someho=
w get this integrated into oe.get_patched_cves function.

Also, since this class is not enabled by default, there need to be tests im=
plemented to make sure that it does not break.

Peter

> -----Original Message-----
> From: daniel.turull@ericsson.com <daniel.turull@ericsson.com>
> Sent: Wednesday, April 16, 2025 16:29
> To: openembedded-core@lists.openembedded.org
> Cc: rybczynska@gmail.com; steve@sakoman.com; Marko, Peter (FT D EU SK
> BFS1) <Peter.Marko@siemens.com>; richard.purdie@linuxfoundation.org;
> ross.burton@arm.com; Daniel Turull <daniel.turull@ericsson.com>
> Subject: [PATCH 2/2] cve-check-kernel: verify kernel CVEs using programFi=
le from
> kernel.org CNA
>=20
> From: Daniel Turull <daniel.turull@ericsson.com>
>=20
> This class is used to check the CVEs against a specific kernel configurat=
ion.
> Depends on data from the kernel.org CNA
> https://git.kernel.org/pub/scm/linux/security/vulns.git
> The CVE data provided by kernel.org includes the files that are
> affected by a given CVE and are provided as json files
>=20
> It requires the kernel to be compiled to be able to extract which files a=
re used.
> It is created as optional check on top cve-check.
>=20
> To enable add in your local.conf
> INHERIT +=3D cve-check
> INHERIT +=3D cve-check-kernel
>=20
> To test it
> bitbake virtual/kernel -c cve_check_kernel
>=20
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  meta/classes/cve-check-kernel.bbclass | 132 ++++++++++++++++++++++++++
>  1 file changed, 132 insertions(+)
>  create mode 100644 meta/classes/cve-check-kernel.bbclass
>=20
> diff --git a/meta/classes/cve-check-kernel.bbclass b/meta/classes/cve-che=
ck-
> kernel.bbclass
> new file mode 100644
> index 0000000000..c01f0efd1d
> --- /dev/null
> +++ b/meta/classes/cve-check-kernel.bbclass
> @@ -0,0 +1,132 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +# This class is used to check the CVEs against a specific kernel configu=
ration.
> +# Depends on data from the kernel.org CNA
> +# https://git.kernel.org/pub/scm/linux/security/vulns.git
> +# The CVE data provided by kernel.org includes the files that are
> +# affected by a given CVE and are provided as json files
> +#
> +# It requires the kernel to be compiled to be able to extract which file=
s are
> +# used. It is created as optional check on top cve-check.
> +#
> +# To enable add in your local.conf
> +# INHERIT +=3D cve-check
> +# INHERIT +=3D cve-check-kernel
> +#
> +# Then execute
> +# bitbake virtual/kernel -c cve_check_kernel
> +#
> +
> +KERNEL_FILES_DIR ?=3D "${LOG_DIR}/cve/kernel_files"
> +KERNEL_SRC_FILES ?=3D "${KERNEL_FILES_DIR}/compile_commands.json"
> +KERNEL_CNA_REPO ?=3D "${DL_DIR}/CVE_CHECK/vulns"
> +
> +python () {
> +    if not bb.data.inherits_class("cve-check", d):
> +        raise bb.parse.SkipRecipe("Skip cve-check-kernel when cve-check =
class is
> not loaded.")
> +
> +    if d.getVar('PN', True) =3D=3D d.getVar("PREFERRED_PROVIDER_virtual/=
kernel",
> True):
> +        bb.build.addtask('do_save_compiled_files', None,
> 'do_compile_kernelmodules', d)
> +        bb.build.addtask('do_cve_check_kernel', 'do_build', None, d)
> +        d.appendVarFlag('do_cve_check_kernel', 'depends',
> 'virtual/kernel:do_cve_check ')
> +        d.appendVarFlag('do_cve_check_kernel', 'depends',
> 'virtual/kernel:do_compile_kernelmodules ')
> +        d.appendVarFlag('do_cve_check_kernel', 'depends', 'linux-vulns:d=
o_unpack
> ')
> +}
> +
> +do_save_compiled_files() {
> +    bbplain "Fetching compiled files"
> +    mkdir -p ${KERNEL_FILES_DIR}
> +    ${S}/scripts/clang-tools/gen_compile_commands.py -o
> ${KERNEL_SRC_FILES}
> +}
> +
> +def get_files_in_cve(d, cve):
> +    import os
> +    import glob
> +    import json
> +    datadir =3D d.getVar('KERNEL_CNA_REPO', True)
> +    pattern =3D os.path.join(datadir, '**', f"{cve}.json")
> +    cve_files =3D glob.glob(pattern, recursive=3DTrue)
> +    files_affected =3D []
> +    if len(cve_files) =3D=3D 0:
> +        return None
> +    # Assuming one match
> +    with open(cve_files[0]) as f:
> +        k_cve =3D json.load(f)
> +        for item in k_cve['containers']['cna']['affected']:
> +            if item["defaultStatus"] =3D=3D "affected":
> +                if "programFiles" in item:
> +                    files =3D item['programFiles']
> +                    files_affected.extend(files)
> +    if len(files_affected) =3D=3D 0:
> +        return None
> +    return files_affected
> +
> +python do_cve_check_kernel() {
> +    import json
> +    bb.plain("Updating CVEs using compiled files")
> +    kfiles =3D []
> +    cves =3D {}
> +    affected=3D []
> +
> +    with open(d.getVar('KERNEL_SRC_FILES', True), 'r') as file:
> +        for item in json.load(file):
> +            kfiles.append(item['file'].replace(f"{d.getVar('S')}/",""))
> +    bb.debug(1, f"Total used kernel source files: {len(kfiles)}")
> +
> +    # We want to use the file in log directory
> +    deploy_file =3D d.getVar("CVE_CHECK_RECIPE_FILE_JSON")
> +    cvelogpath =3D d.getVar("CVE_CHECK_SUMMARY_DIR")
> +    direct_file =3D d.getVar("CVE_CHECK_LOG_JSON")
> +    fragment_file =3D os.path.basename(deploy_file)
> +    fragment_path =3D os.path.join(cvelogpath, fragment_file)
> +
> +    with open(fragment_path, 'r') as file:
> +        cves =3D json.load(file)
> +
> +    total =3D 0
> +    for cve in cves['package'][0]['issue']:
> +        status =3D cve['status']
> +        id =3D cve['id']
> +
> +        if status =3D=3D 'Unpatched':
> +             is_affected =3D False
> +             total +=3D 1
> +             affected_files =3D get_files_in_cve(d, id)
> +             if affected_files is None:
> +                  bb.debug(1, f"No file information for {id}")
> +                  affected.append(id)
> +                  is_affected =3D True
> +                  continue
> +             for f in affected_files:
> +                 if f in kfiles:
> +                     bb.debug(1, f"File match in {id}: {f}")
> +                     affected.append(id)
> +                     is_affected =3D True
> +                     break
> +             if not is_affected:
> +                  bb.debug(1, f"Changing status. Files in {id} not compi=
led.
> {affected_files}")
> +                  cve["status"] =3D "Ignored"
> +                  cve["detail"] =3D "not-applicable-config"
> +                  cve["description"] =3D f"Source code not compiled by c=
onfig.
> {affected_files}"
> +
> +    # Update cve files generated from cve-check
> +    write_string =3D json.dumps(cves, indent=3D2)
> +    with open(direct_file, 'w') as f:
> +        bb.note("Writing file %s with CVE information" % direct_file)
> +        f.write(write_string)
> +    if d.getVar("CVE_CHECK_COPY_FILES") =3D=3D "1":
> +        with open(deploy_file, "w") as f:
> +            f.write(write_string)
> +    if d.getVar("CVE_CHECK_CREATE_MANIFEST") =3D=3D "1":
> +        with open(fragment_path, "w") as f:
> +            f.write(write_string)
> +
> +    # Summary
> +    bb.warn(f"Before filter we have {total} CVEs")
> +    bb.warn(f"After programFile filter we have {len(affected)}")
> +    bb.warn(f"Affected CVEs after filtering: {affected}")
> +}
> +

