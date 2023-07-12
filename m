Return-Path: <p.lobacz@welotec.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B528EB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 11:50:12 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.50])
 by mx.groups.io with SMTP id smtpd.web10.5301.1689162607068558564
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 04:50:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail, err=mail: missing word in phrase: charset not supported: "windows-1250";
 spf=pass (domain: welotec.com, ip: 40.107.14.50, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbHaT5m34LlMtw/6lJeG2sf1CUa9tSB+DVs5sRixNNrUqTdBpGdcI1ffSNVWU71jbQUp6JNe0B0Cd2soJr1HBGqVsePuqDSoT01+HpBMDP1MRXWsILKawWZ62GlWubPf2I9lT5fUZiG9OiUb3GdXCT9Q1m3PU/3lh20CxnpEHz2XZn0TrbS4ClbX/DjCJGB4n+28CyDyN/Z0A+Wzr0KSOLmoUb/zEO/BPqjRxqJd2yGoyl6byFGfWo3gdzVBEh4DgSxgcTl4jqu+pg7YSrOemGGM5JpN6Ffng+XnMG7nV5zYWC2pQa+xOh6zI3tft+JC1Bv3rZz8OvnDN2AEXb++RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pi6y9geYtx53iS2qRq3ORF5ssnwDI8Q1uwm+Xz26BEk=;
 b=Oau8GJBs/0poiVuwW12fYYoAwYe1dNwT8vCyPMtUjFeUA/CPe7HCDm7WY5ZpS5khhI0B+38ACxFfBlp0YjLJ7himQhPX7oSINoHh8uc+qu0QmR5MsAHX+zgWmHFxnpirRkXOO6Akc6GdWSlfz0YwGwY1dXc2QP0xgN6tqPTBEjPztuxE7KeFrlR180LLyFG4F3TCOx1UqJkI3bnCJCkjI7ICWg3JW7ZvRNkP/ZU1m53s+NdqyV4EBT+ZAnAMVRGJLPftZKpXugv8LFEuaaMZVxX3JeUY1TJaS5RuwY4bftTJoinYiEK7D6JGqOVVpoWF3mOq01LOA5cP8IFRR1xUgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pi6y9geYtx53iS2qRq3ORF5ssnwDI8Q1uwm+Xz26BEk=;
 b=gTMXLZp2hvNTzj+8IDcd/E1mliqParYdLiCJ5HRFbfXSgVdLc1L93BLPTMwtJJrligj3c2Yigbjgm1dPd9bBfXSI6AV3it+kf+1E+giqjUjUwVnmB1d/8ThdnXcA3EhQBTL87ALwqw9z2XRC/p7TODsPTEWhs/GI9byb6YfiQ40=
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB8900.eurprd04.prod.outlook.com (2603:10a6:20b:42f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 12 Jul
 2023 11:50:02 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::9b11:6096:b359:6fe4%6]) with mapi id 15.20.6565.028; Wed, 12 Jul 2023
 11:50:01 +0000
From: =?windows-1250?Q?Piotr_=A3obacz?= <p.lobacz@welotec.com>
To: Ross Burton <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: ODP: [OE-Core][PATCH 1/2] opkg-utils: add acl and xattr support
Thread-Topic: [OE-Core][PATCH 1/2] opkg-utils: add acl and xattr support
Thread-Index: AQHZtE40iM9ARyQSgk2FxEXco1C4wq+170wAgAAN7RmAAAeGAIAAAI8N
Date: Wed, 12 Jul 2023 11:50:01 +0000
Message-ID: 
 <VI1PR04MB537300114FBDD25B7C922AB39136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230711231847.2211186-1-p.lobacz@welotec.com>
 <384B4554-E449-490C-888D-FDC111366FF3@arm.com>
 <VI1PR04MB5373335EEE7F848007D4D95B9136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
 <F63C4DC6-7608-4FC3-8F14-979B6BE2C82C@arm.com>
In-Reply-To: <F63C4DC6-7608-4FC3-8F14-979B6BE2C82C@arm.com>
Accept-Language: pl-PL, en-GB, en-US
Content-Language: pl-PL
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|AS8PR04MB8900:EE_
x-ms-office365-filtering-correlation-id: e824b007-fa48-4415-eebc-08db82ce2038
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 HL8IKVfcz4UUnYkVqOyuluSplh541VHYLQuMCWNzbY+MdHxzBDJ5DF3PvO4CbyOPg5hMjrNm3O+uNqU9OouJ/wGWG6ByRmfrtaMDdBQWjlChd9A4amnAw8V+LzdwXjNUCHzXrAprvNnXzU6zFJGVH7DvORx93od13K76/pS8lyBKdPFZzo5tD+AnmUJ0+55VXtyEkucaIogI1309Rd7cQ3HA3I1tmLtaN7D7kkWmoXPMLrsZi/dyXKVVcJbjdm/zKyOg57aIJuVxe5gbbXq+jvWDvzv9PT3XSz3aBjYXl71Key9cHS47h3PQUbfjk1p953GItI2r+Uw80zHIWxKYjpjwrVy25NTz3HeeM3WZzYZIOMisKT7ihnok8cKYPhLDlAffc3d3mNP6QuY19yRiTE6+lBGry6n+vUtbwcd7bwzF66s5FqL72GMjSeYNs8TyoDXWUMoLzKgqgCJiwhhlsck4uWnDYlMnTDA2qu2VYn04Oqr0i6r4tGypZRVlxGBOAmRgDOw4prTx9MdsyAclZ6mnASBpSw2p4L/rNlPxq9BF8pQUl6rCqGeMDD0j8jDMToTvYTyDFEIr3HDYfat9rKUbWbzHEk31zD5UIgRCdA4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(136003)(39840400004)(376002)(366004)(451199021)(19627405001)(316002)(41300700001)(7696005)(966005)(53546011)(83380400001)(186003)(26005)(6506007)(9686003)(166002)(122000001)(45080400002)(478600001)(71200400001)(6916009)(76116006)(38100700002)(66446008)(66556008)(55016003)(91956017)(33656002)(4326008)(66476007)(66946007)(8936002)(8676002)(5660300002)(64756008)(86362001)(2906002)(38070700005)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?windows-1250?Q?nP6rCAhD6papzwsbJf98zsevLTZ3og6CDlWS/RWvu4n+mUgxKiBb6F8L?=
 =?windows-1250?Q?7lENsY5OojP+mwl4Gg+IongbDuV9OIEgg8UUp5uUJmq6lwaeyKZAeSHN?=
 =?windows-1250?Q?aoqLu88Nn9JWgWDtvJSZpeyj3Dgqe86aJcbIvhG+2K2du+8huC9C2Ihb?=
 =?windows-1250?Q?v/PStnEjhJb/+WX7/jEAGvgYl3NzSJdciPkMIA5qQ+o/7VcGpwgNSVlO?=
 =?windows-1250?Q?FOPLFvVDxJB5q3QHUGIrnxFGMU5F01hCdJqaqNU48HIV0IO4oIHycYw9?=
 =?windows-1250?Q?LlBJcBMvx21X8f60fo9rFiyLwidxDrwXwKdE1UUez71eZ8FWJEdCSOnW?=
 =?windows-1250?Q?dKVTKD1lJftgruW3nsUwybU9hkWxT/jQZ0EO3lwccslBAM0WcAwY5G5K?=
 =?windows-1250?Q?3oBgGn3mp6pxKSvdyE90dzAePSVau2+ycEd93fXGUsAE+luteQKFnyKU?=
 =?windows-1250?Q?SXi1weorowU3AarA2CrtVNHoTFo420WgrJqkj3X3PyfZf6ewQ+UinXiO?=
 =?windows-1250?Q?p/0nXvoK3burdEgi03fjLmcVIlxZD1IHfGpgGUw0O248ySaV/BFDipkP?=
 =?windows-1250?Q?yJxIeMr387c5MyU5BiW6PMLKtNilvzrVwTYGtCLdKs892LwAUj6cbS1I?=
 =?windows-1250?Q?0oOyqTb77xXnwYl/Y3tKVzqbt+3eGER3WCNQv7xKrI3EfGZ2Ecmxlju0?=
 =?windows-1250?Q?3DAhu/fYwYMdCNiHacv7rEVDyTiBuUhi0sZPO/AmGD6746OGEQ5UpGeR?=
 =?windows-1250?Q?9mLRnjFZQ5j0CwPyZtngE6DPIsDTmAJdTNXM+9nfrlQ8dRi4SGf5Vtoh?=
 =?windows-1250?Q?rqhhb/49HToLL2PJI9iDlLiBBKRgRknZMCoFkXstwXaBJHegjolrwRvB?=
 =?windows-1250?Q?5S+lC1SC6ex5JDOY5ArLLqpaodJ0e46RkHwQJ5+H4lZcnARWSd38U3TJ?=
 =?windows-1250?Q?+td+QHoIykQbvXYMC3ucgonWgQ6r2fQBIFvuDYoqHkM+38ZT7QCVkZJY?=
 =?windows-1250?Q?tPZMuNVrsJpNzxXIZSPCRCQfxdPgwERWeOHDD+L6ODuMNuV0394h4lJ6?=
 =?windows-1250?Q?YceXC+9+SWXm/MjBczw7v8S4p32JFV1vn+leNYUJY8iNn7jKOe24jbML?=
 =?windows-1250?Q?5UsA78TlJE226Eug7vi6U3GvXrBd9j7YeFlMoQo4TB9QY1kYEBGt6Dec?=
 =?windows-1250?Q?vPw9hp/vzf08ETy4bBW9SEAKYVwODkT5/U37hkbjIU91rZHQaRNN2ex8?=
 =?windows-1250?Q?mmw91nQirmKneSrGZ8o+fculr0yjJ6XZDT4mQsmZl8UkFPi1WvQu7hXL?=
 =?windows-1250?Q?ikhgxCyVJaja0S8ZPtl31aGkuBzcSndfkrGJ7qz0V34tYyMF4r/jzVVE?=
 =?windows-1250?Q?lGuMU2DuOBep1yHMBqDZ5uC9Ou2V3AL9YfD72YKqM3amdNhDNZCHCOMD?=
 =?windows-1250?Q?nId8ZOMxA2cSKIW72CS0soSSNQWvlIojzLY2a5nUYeiRo9lX+qmqo7OC?=
 =?windows-1250?Q?DXkWR0fJUumt60BYWGBrHxGYBJGnkQGwul1zpfSRQFhvEPYP+b0lHMm4?=
 =?windows-1250?Q?lMGoKD92DGWwqMz/Q+u/g2cOIlxCV48pMYdgTzqnOq/mnWMyezz/ZjjB?=
 =?windows-1250?Q?xowz4VB30qBSGdojFFQjdhZkOcONfdGO90Bxta4jz5iKXEefTVr6dF+r?=
 =?windows-1250?Q?gU8zflktsU7Wran4GOTJAvep+xtm7o3p?=
Content-Type: multipart/alternative;
	boundary="_000_VI1PR04MB537300114FBDD25B7C922AB39136AVI1PR04MB5373eurp_"
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e824b007-fa48-4415-eebc-08db82ce2038
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jul 2023 11:50:01.8175
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oCkkPnrfS0iaUrp1JJ3uwVvfjk8FYR89t4eycBfjUjKNM+qxxzEdvgSR28/2Siokm+zEpVHmt09OBy2Kh+QrNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8900
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 11:50:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184186

--_000_VI1PR04MB537300114FBDD25B7C922AB39136AVI1PR04MB5373eurp_
Content-Type: text/plain; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

Thx Ross

BR
Piotr
________________________________
Od: Ross Burton <Ross.Burton@arm.com>
Wys=B3ane: =9Croda, 12 lipca 2023 13:47
Do: Piotr =A3obacz <p.lobacz@welotec.com>
DW: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Temat: Re: [OE-Core][PATCH 1/2] opkg-utils: add acl and xattr support

On 12 Jul 2023, at 12:23, Piotr =A3obacz <p.lobacz@welotec.com> wrote:
>
> I have added v3 and merged them as one feature/patch change. Additionaly =
how this Upstream-Status should look like? Could you please give me an exam=
ple?

https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.ope=
nembedded.org%2Fwiki%2FCommit_Patch_Message_Guidelines%23Patch_Header_Recom=
mendations%3A_Upstream-Status&data=3D05%7C01%7Cp.lobacz%40welotec.com%7C8ad=
81befd6a74dfdc62708db82cdd6db%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C=
638247592814242852%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2lu=
MzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DtcSUGFwm3kIDRMEU=
vPdGM27ic2fI6P1JDtqP4cGhjJg%3D&reserved=3D0<https://www.openembedded.org/wi=
ki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-S=
tatus>

You can grep oe-core for Upstream-Status and you=92ll find hundreds of exam=
ples.

Cheers,
Ross

--_000_VI1PR04MB537300114FBDD25B7C922AB39136AVI1PR04MB5373eurp_
Content-Type: text/html; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dwindows-1=
250">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Thx Ross</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
BR</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Piotr<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Od:</b> Ross Burton &lt;Ross.Bu=
rton@arm.com&gt;<br>
<b>Wys=B3ane:</b> =9Croda, 12 lipca 2023 13:47<br>
<b>Do:</b> Piotr =A3obacz &lt;p.lobacz@welotec.com&gt;<br>
<b>DW:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Temat:</b> Re: [OE-Core][PATCH 1/2] opkg-utils: add acl and xattr suppor=
t</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 12 Jul 2023, at 12:23, Piotr =A3obacz &lt;p.lob=
acz@welotec.com&gt; wrote:<br>
&gt; <br>
&gt; I have added v3 and merged them as one feature/patch change. Additiona=
ly how this Upstream-Status should look like? Could you please give me an e=
xample?<br>
<br>
<a href=3D"https://www.openembedded.org/wiki/Commit_Patch_Message_Guideline=
s#Patch_Header_Recommendations:_Upstream-Status">https://eur04.safelinks.pr=
otection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.openembedded.org%2Fwiki%2FCom=
mit_Patch_Message_Guidelines%23Patch_Header_Recommendations%3A_Upstream-Sta=
tus&amp;data=3D05%7C01%7Cp.lobacz%40welotec.com%7C8ad81befd6a74dfdc62708db8=
2cdd6db%7C25111a7f1d5a4c51a4ca7f8e44011b39%7C0%7C0%7C638247592814242852%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DtcSUGFwm3kIDRMEUvPdGM27ic2fI6P1JDt=
qP4cGhjJg%3D&amp;reserved=3D0</a><br>
<br>
You can grep oe-core for Upstream-Status and you=92ll find hundreds of exam=
ples.<br>
<br>
Cheers,<br>
Ross</div>
</span></font></div>
</body>
</html>

--_000_VI1PR04MB537300114FBDD25B7C922AB39136AVI1PR04MB5373eurp_--

