Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14CBBEB270E
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 20:05:02 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23987.1770741174308099008
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 08:32:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=aHatqKbt;
 spf=pass (domain: est.tech, ip: 40.107.130.39, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T71QiANg9a6H0E9RnHizKwaau5CSqiLXAmmNdHytylPfUFYbA1mOWbVybpiasmR9D2ZL2pb2ZCcXdOtZW4gJz3PFyI5QLyzrLSdfiZFN+Pdy2kzJ4jmi5BkXvvDX1Ub5LLON0tTb5fvlZQrjBs5JKvxy23KNmPtmOGTzwc0neVIZ/v3FdMKRUpuvcVpvi3UhE2k61bHxKU+5LSLyHbZ23hz4XtMk0CuPaYobS82jJa5Dn1sJ9VuD5fMI9+yendKit/9O/hqOcMmCar1DQGsp92Y0SxOHVrW/5WnNA3/6zMo/6HMLnz9exUzn3KATYoTac6mQJoXZzXpcWrJWmshYTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TiS/sKUpcEwFJWHi6sDWeYh0qnJqQmDujAuzz0H13BY=;
 b=Zol1kM3hylvsTxQAGMGwSEoIQubi7Rz55s62cy75IKSb4m6vMq4kckr+Pl3iUqnMDneK7syYWAneoJsyOaKqvgnNMUES0DLMyhVc1VZEug8a65zMSexOsSJl85KeCZzD08LBzCMD8+ijbnZSkSmpHrzk1KFICa+nMXkep6XhD65WToNGdAcjt+wkcf9+7VcVPbatSdS5bHKx+d9+eJM9/w4WCQeQIhhE9Fk1ep+lI2HP815zFQQwaP2OJZ0DORbZ6NisMhYVj4F8YxLE80t7/caZuHWrcO1SgJx2okzJTPBsJHFP7fvUC/CifpmZEO4NloMDcHt+UMTW4GJf6gW8KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TiS/sKUpcEwFJWHi6sDWeYh0qnJqQmDujAuzz0H13BY=;
 b=aHatqKbt+S0z/Fr/Mn5VkF3HvVoYhNPwWiV5Zq3z9xZaRlnABw0Fn8t6FPm82AsZtCow4E+FbCI1CaoT3o3FCittgkD4/cyqNdLXxs7wHZV0sG6qkXViwdXCH4f3evQUI/JxtevMFNs4FDmHdTmw6d8KDgIHtTZ53I0gpRWdusYNMiXo6UNIWJCjbNlTvvHP2Zdx+/GMzNvihlNogCc5Seh6LrLhf1y6xkg2NC13zkLRvMsJlNSLm3ZryB/laShfer3YoPqYs4DDwfTsp97g75FUQuW0e7Yk64KyvFRtLgpKkWmK9pfp5Lgyi8pXChlWkU+ZiZbevy5GgowSNlht9w==
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DU2PPF839CF08BF.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::a97) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Tue, 10 Feb
 2026 16:32:51 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%5]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 16:32:51 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][master][PATCH] python3-pip: Backport fix CVE-2026-1703
Thread-Topic: [OE-core][master][PATCH] python3-pip: Backport fix CVE-2026-1703
Thread-Index: AQHcmgqRiSgnvWNBP0OirbV3D7pXqbV74cqAgAA/zYY=
Date: Tue, 10 Feb 2026 16:32:51 +0000
Message-ID: 
 <AS8P189MB1672295C785417812D1A10D3B362A@AS8P189MB1672.EURP189.PROD.OUTLOOK.COM>
References: <20260209212506.51439-1-adarsh.jagadish.kamini@est.tech>
 <DGBAHPIIQHXZ.1LY6EAM6X7Y2P@bootlin.com>
In-Reply-To: <DGBAHPIIQHXZ.1LY6EAM6X7Y2P@bootlin.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8P189MB1672:EE_|DU2PPF839CF08BF:EE_
x-ms-office365-filtering-correlation-id: 4115a10e-513a-42e7-03b6-08de68c208e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|8096899003|13003099007|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?V9ak+8L0p96c23ryXAAkH2kOlbAs9z0iasOpiXXL/X0AsK9gDOmdrg7hCUEQ?=
 =?us-ascii?Q?wycQZHiY/BQ3bpmM+JT7Ns0fMzl/tP8LuG+x7Xa1aJ+vpmP+a5gwO6rC9JOS?=
 =?us-ascii?Q?NZ5sp9dNFBnK5h0R9E8oiT7j6OjTfKzs531YXN51CI7Vx/RPV+pskt1YFDQ3?=
 =?us-ascii?Q?OrB+9wtlnMG5Y/C12zGdC6gEWxyNVZQlLKfp/vZ1/T81aPnn0v8EuISLjogP?=
 =?us-ascii?Q?VRgMWcu0bVK0UlrO3jvbeHvjLXkMl0yBL4XkS2LXiopUnzaIdQzTf5mPBNME?=
 =?us-ascii?Q?rDpeWnQDWlZaH3kZjW9nFsPVHMbe5XeMW44bHrzMRqPgaFMOfOXvN6KOcaxn?=
 =?us-ascii?Q?jrrL/ExsCjgzXLfQtWIb68ZlVmUPH4Yndf69qgDJA+MSFMIVQ+D6L0j7FuN3?=
 =?us-ascii?Q?qs5rGs0nXVy8TPwxzBmseWwl/8dHg8aGkuP1fgF5a82jNuNPb0xDlzkwrvwn?=
 =?us-ascii?Q?CStu3WeobU2GbGoMlsGRVPmWB5unyLlJFfO7HM0FQjK2ZJPtZ3H6Gq1/ONdi?=
 =?us-ascii?Q?x1hS8r6ll13YYo3u0sT0NkbHir1l90tGnDnqj+ysynIgyRmrg5J3H0Mgmko5?=
 =?us-ascii?Q?PIGxEDYFUpimej6s6AGZPU5JBhI3ey5vYhCpx9VwVMbNrf4MNd5QNnY5DE2O?=
 =?us-ascii?Q?6+s7ba71lOprQVhtZPgyJtI67tbZse5qmCmZxEmgJpGNZ4PuV6+nWR1R6rZp?=
 =?us-ascii?Q?QCC9N7giclDSNeQfRcBzO4N+izXk7cXPOWtVyPGp03geX7KKLN4K5G9giD30?=
 =?us-ascii?Q?Yil2CqlGWEnLf1bVWJTzJOcvGVZHBkjEk9vvMohN00VnEXXOxnb3NPsi/g80?=
 =?us-ascii?Q?YSHk+FAtYc68/5VCMUQz5ow54ODA4C64YcPEuoc3kUCsEKbmeOl3AoIJ0viV?=
 =?us-ascii?Q?TYr0PdSKy+Gch4oTc3xsLde7sK6lH3X2xYoaPn7z4+5EmnoZtl0a2jMfm3Uy?=
 =?us-ascii?Q?9PJ95fW2gtnMt4HZ13FRkJjRbfovsOSYNeMjYWwsD8KyhKUhVAZMt0PMH0nh?=
 =?us-ascii?Q?d1s1BDK2B3q15hu4FSwzS0LwUwh4TgSQJLpKHL84j1JbJF4DMkCfTNxHChoi?=
 =?us-ascii?Q?XWkgZztjmxt35zFiwGqdZdtBVnivW86zLezxkw6yaaWWXZOq+hR4RSL2Gm3i?=
 =?us-ascii?Q?q4xHRr2izs+j1V56WIEhD9SQIg5p2HfiQBBORTJjTQK/VO8Fe1RbqQIpXhXv?=
 =?us-ascii?Q?z8nCajxq7Rq7SGpEt+cpLZBF2CvJVVxkkVPg7B7mJWfbry3z4b3wpsHdkq++?=
 =?us-ascii?Q?KgNpwgpXknOMcutqGgFdpYP9TE3fodhpKFyvYSP4WyoTFfh8hz0P/KdaXVyr?=
 =?us-ascii?Q?aPFioIbgHqFcbfrQ2ymG0+23Um0KT580ygAu0XjO0/MWw3X/8i14p50pL/mS?=
 =?us-ascii?Q?5fOGQ8hUcf04f8ZQrKJsZzTo25amtaoMqKWuGcXjeXmunsNy766q3n/KPiKs?=
 =?us-ascii?Q?ilayE6qv/7h9a8hnXGVfjLmEjIwaJE6izKqZHTYr1Wkb4erGr/oTerUoKRAb?=
 =?us-ascii?Q?1O4u0OFDg+FCn90diBEuf7ZE56A8Kxu7OazCY+GF3xBPtfNDxQS7NTvbG3XI?=
 =?us-ascii?Q?ihv4WlmsVJGsvlMh6DY=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(8096899003)(13003099007)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?yx5nmiFsrHoP8EgS7ux0u7/CUzwv/hlF00xga5VrJ+mOYdARafge9anG2OWI?=
 =?us-ascii?Q?mvc1qF3jV7kAjXE6LVBcmQbhaQSZ7CyJVuYvVsxF6tX/TQ0gZqI1/MpEG3iW?=
 =?us-ascii?Q?u6IGmcUOybDHZdpxtHCXzzEP/uFZJvWYtLQ7gWlFPvvs18G6MjxLTltuHc4q?=
 =?us-ascii?Q?XmM17pBroshcC+dcEMZCMolETNQnpZ+COxgVrt3b1jJhy+E6pfQILN9QlUwP?=
 =?us-ascii?Q?sE7942bubtpFrUQAIb5hrcnF9SUb/XOZ5hlVrsaeStxJasu8OXbAftmVKQlT?=
 =?us-ascii?Q?CFOvpRAd2jOXSciCspLBW0N0mFwmi2YvtfRogJAKhHbecYsnxOeGEvOnlp1G?=
 =?us-ascii?Q?fguNrgPgDxHPMlIjQzC9yySRaP7Y8eiOiOj0vzJq1HYi08A6jBJntQlNQDyL?=
 =?us-ascii?Q?/F0zZTY/QviYkk+vwnTikK78gtky6+RTAvS9KnO96LO637r8bzKe64Ar+bPu?=
 =?us-ascii?Q?VNp+9NE6lXTANE8zPUEoHkQXL4kCishYtyH4LBUvt3KP/BE1XxdZpyfAHUhK?=
 =?us-ascii?Q?/azUcH9q0aEW24sqvmKHLb9Ipw/z47lXmyqLEFzWmyBFABOGyAtUGmwv1jWt?=
 =?us-ascii?Q?TL6Qlzsk6hnGZrKu46Wqj3vATj6TAalB08YOgEC40TS6MLSvYPb39aYKk3/k?=
 =?us-ascii?Q?51JL8kL8V99hNB4kh+tYwJ4QGPMBnhiMF87o0XuhiCauQlB5gUCD8aNuu9I6?=
 =?us-ascii?Q?jlP/ws6rRnQrvrdNebKPRLi8+lIv1GmO59z1986W2N+QTLHa3Qat8qPx1MpR?=
 =?us-ascii?Q?ztVumajGjyeWjKs95cNIK+kK4pPqhkVSJOLTxlcuj4ZhykK/x4dkK/id+2Ye?=
 =?us-ascii?Q?V6v2UZwQASN++4BCngUJsNkaEroCvZ7bBwZwOxlPLc7DyEoyT+Bs3KUTJmb8?=
 =?us-ascii?Q?v91oTOZ5+BuuncPRF4qmRJ3sJiiJEDrAiJBjjMjhbutrPnXGMDwHrAgg94K8?=
 =?us-ascii?Q?4nsBvZIprkpsUZq8gsQptrlfXSjRqp5aKVLAxk3FALRIOXehLRNi4NI+uhri?=
 =?us-ascii?Q?qu+aCdsxcOon8CHE8JrB22MftjGhFa1QVBA+sjVH6Yn0PIwkisZCwbTTzi56?=
 =?us-ascii?Q?f6WPtael6apQkll3vZicUDeiCpU43/Mu+8lwYQfynyWUYceqkVT7JGx6bODH?=
 =?us-ascii?Q?cMTp+at2cNDouvE/cP3oiNKCKJGHJYoQUlK2BuSlqFenoMDJ+/sRM6kZLcvi?=
 =?us-ascii?Q?CZ/Gt2aX4IbTXIwkb+G9WVkf2spZ83Qc2Hnda89jXYHPT6Hzdp09IytI3VFa?=
 =?us-ascii?Q?w1aqR6f5fyquGNsAWzRyjDf0/QNa+wN//msJnp4cW/2NYXM9sNoYQKEnhQew?=
 =?us-ascii?Q?N7rk3baLKxlxuqjBSHq+ZnrJApLVLYatOko+4LcUxqdowaZXQN53hm+c8HZz?=
 =?us-ascii?Q?VQdw/Wx4ux7mLrKv9a29qjaNr748wvRauAULMs0yw+fkT6AlAzuKw7vHw2jb?=
 =?us-ascii?Q?AvzrYL/TObZT28yjIC3XOm+lIBkbIXyIld09Jty8QS32byl5OWzrc/0AIo6d?=
 =?us-ascii?Q?NIzPQ8h+XAK1GLm/e5eI725NzYyBtJd0cKy0hVscUBXuZmCsdfZlHd06+CSV?=
 =?us-ascii?Q?c+Ct5vGtqYPTSYT0npKYbPpvghQMHdFZU+8GXwIHTKV+lasJFMGolZlydgff?=
 =?us-ascii?Q?OK+klJ1NBhpbm0N/WLub2X4CadcFfMqlYWnaYZtBgOWYAD998MAM8obdlZSS?=
 =?us-ascii?Q?6ujKKHEnCfkCJllH5NeyIIod7lsGBtIifbRYw794P84kgqEOPTTYHLTjgHe6?=
 =?us-ascii?Q?LeYSF0l8ui77rfdYE/uECNI9/7mb9fY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 4115a10e-513a-42e7-03b6-08de68c208e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 16:32:51.4929
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zAdXCWRTg4CgAxsJPOOoHqd+men2zoU7/+eWYT1c5l2cb+ERysdmfqxIzTeK2JcYHKdOOpBaQK1XbibzA7fTkrK4ZRWFH5g0jCH/NZYepvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PPF839CF08BF
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AS8P189MB1672295C785417812D1A10D3B362AAS8P189MB1672EURP_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 20:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230933

--_000_AS8P189MB1672295C785417812D1A10D3B362AAS8P189MB1672EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
Thanks for pointing out.

Fixed in v2


________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Tuesday, February 10, 2026 1:44 PM
To: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>; openembedded-=
core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][master][PATCH] python3-pip: Backport fix CVE-2026-17=
03

On Mon Feb 9, 2026 at 10:24 PM CET, Adarsh Jagadish Kamini wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Include the patch linked in the NVD report: https://github.com/pypa/pip/c=
ommit/8e227a9be4faa9594e05d02ca05a413a2a4e7735
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---

Hi Adarsh,

Thanks for your patch.

> --- a/meta/recipes-devtools/python/python3-pip_24.0.bb
> +++ b/meta/recipes-devtools/python/python3-pip_24.0.bb
> @@ -31,7 +31,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D63ec52ba=
f95163b597008bb46db68030 \
>
>  inherit pypi python_setuptools_build_meta
>
> -SRC_URI +=3D "file://no_shebang_mangling.patch"
> +SRC_URI +=3D "file://no_shebang_mangling.patch \
> +            file://CVE-2026-1703.patch \"

There is an extra backslash before the ending quote.

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


--_000_AS8P189MB1672295C785417812D1A10D3B362AAS8P189MB1672EURP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Hi,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Thanks for pointing out.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Fixed in v2</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Mathieu Dubois-Briand=
 &lt;mathieu.dubois-briand@bootlin.com&gt;<br>
<b>Sent:</b> Tuesday, February 10, 2026 1:44 PM<br>
<b>To:</b> Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;; =
openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openem=
bedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][master][PATCH] python3-pip: Backport fix CVE-=
2026-1703</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon Feb 9, 2026 at 10:24 PM CET, Adarsh Jagadis=
h Kamini wrote:<br>
&gt; From: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;<b=
r>
&gt;<br>
&gt; Include the patch linked in the NVD report: <a href=3D"https://github.=
com/pypa/pip/commit/8e227a9be4faa9594e05d02ca05a413a2a4e7735">
https://github.com/pypa/pip/commit/8e227a9be4faa9594e05d02ca05a413a2a4e7735=
</a><br>
&gt;<br>
&gt; Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.t=
ech&gt;<br>
&gt; ---<br>
<br>
Hi Adarsh,<br>
<br>
Thanks for your patch.<br>
<br>
&gt; --- a/meta/recipes-devtools/python/python3-pip_24.0.bb<br>
&gt; +++ b/meta/recipes-devtools/python/python3-pip_24.0.bb<br>
&gt; @@ -31,7 +31,8 @@ LIC_FILES_CHKSUM =3D &quot;<a href=3D""></a>file://L=
ICENSE.txt;md5=3D63ec52baf95163b597008bb46db68030 \<br>
&gt;&nbsp; <br>
&gt;&nbsp; inherit pypi python_setuptools_build_meta<br>
&gt;&nbsp; <br>
&gt; -SRC_URI +=3D &quot;<a href=3D"file://no_shebang_mangling.patch">file:=
//no_shebang_mangling.patch</a>&quot;<br>
&gt; +SRC_URI +=3D &quot;<a href=3D""></a>file://no_shebang_mangling.patch =
\<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a=
 href=3D"file://CVE-2026-1703.patch">file://CVE-2026-1703.patch</a> \&quot;=
<br>
<br>
There is an extra backslash before the ending quote.<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com">https://bootlin.com</a><br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AS8P189MB1672295C785417812D1A10D3B362AAS8P189MB1672EURP_--

