Return-Path: <florian.miedniak@de.abb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95C4BC433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 10:55:52 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.71])
 by mx.groups.io with SMTP id smtpd.web12.8078.1634640947477654269
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 03:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@de.abb.com header.s=selector2 header.b=gJXJoe/I;
 spf=pass (domain: de.abb.com, ip: 40.107.22.71,
 mailfrom: florian.miedniak@de.abb.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=alSZCOAJoNdgicZJM88geFR2hJLApPEGJ1y2d3q2rehynbhV5/o1Gfva7FyiTL72vCzxCfIeoTZBHWif4jxqyvhfjEzb+qaTFv6rQYgC7kyT+JpLFJvTm56iV5Qiawe3P1RvSLSfOU1w6mt1a4RQ8hrUbLcvLa6SD94hshvGsQ8Ml8qoj4DMxMwAYkxfnAK/DtcC8e9ZDjSNNKDhxfOOE68/6veafvC8AxQmg4NJvm+4/EqO+2NxcdEi9oxfGcrQ3FgBh8Nz1A0ghM07W9q/uQR3YcWYh+rhhgK0cWAixKTVWYh7/aDpofl0HIWWFF4sCuVGEmIUfSmULCcDCIfq5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6k1o5hHg/zkY8IUp9Z7i3sTdJlpFNKmm1FRXSwzZwxM=;
 b=BtgGwFlqx2+HzS1HIXZLTsBwvIvPYnppLi8gDKirHqjSqic80YihrGrHIbXpSh2yglSUKQb4I3mzemMPMM+l4mIxyZ2faiiZvOSXAjn2qCv5L8bU5S4TBPowjwU30qgYwBz2ktrIdUHsw/7ZbTW78T9oqxHfVd/PL3kMQCOUTduJhd0fnI2n+Q3u/rs6iOMRKWUfL4JLC8nFMPBj9mphYkFppHdEU+yBb5WOQrr15WmQUJZLJb0qgzgcfaz1Jw//RThTsK89CENQm6LOjru0p+l7Fh73BvIDzDmmH1BRHJhRnfxNLccvUCbj/mZ5JyWIIssXrJ42XHkK6p1fo5QjWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=de.abb.com; dmarc=pass action=none header.from=de.abb.com;
 dkim=pass header.d=de.abb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.abb.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6k1o5hHg/zkY8IUp9Z7i3sTdJlpFNKmm1FRXSwzZwxM=;
 b=gJXJoe/IPOIzMF8oXnV/Iw5l1i+YqvQ4SA82J648lwhTxDdsHaUw/kFOQQP5OSWuIPE4Yr71HMBVEjs1+6T6vLqFSTB9YHAvX0J1zlDyFb7TgbBylcOGv6nueb6ZYwK8b+n6SvFCRHgt6bg8Bx99rWVjI0V42N2vtoaAyBf7WCUIpFuIZ4NyRgaApK3Z1eKcXAhhRswgDL620hvBSUmavxwCYQZqwnSFGyGXt71T2BhJkD5AR58lynF7LGd/gmy584l/6zOUZuD2KvLQZFmGLLHIwXIj7RvjnnmHdIWqWiAWEAppNqgHBUzuajwbfAGVNHQOzvb/daea2IeYt3+JWA==
Received: from DB9PR06MB7932.eurprd06.prod.outlook.com (2603:10a6:10:297::8)
 by DB7PR06MB4457.eurprd06.prod.outlook.com (2603:10a6:10:1d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Tue, 19 Oct
 2021 10:55:43 +0000
Received: from DB9PR06MB7932.eurprd06.prod.outlook.com
 ([fe80::97:e2d6:502e:b587]) by DB9PR06MB7932.eurprd06.prod.outlook.com
 ([fe80::97:e2d6:502e:b587%9]) with mapi id 15.20.4587.031; Tue, 19 Oct 2021
 10:55:43 +0000
From: Florian Miedniak <florian.miedniak@de.abb.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Mikko Rapeli <mikko.rapeli@bmw.de>
Subject: OpenSSL 1.1.1k: Rationale for deprecated_crypto_flags in
 hardknott-next
Thread-Topic: OpenSSL 1.1.1k: Rationale for deprecated_crypto_flags in
 hardknott-next
Thread-Index: AdfE17Ong3n5IV1IT4Ow0DlPBEPKjQ==
Date: Tue, 19 Oct 2021 10:55:43 +0000
Message-ID: 
 <DB9PR06MB7932CEB962AE403349272E12ACBD9@DB9PR06MB7932.eurprd06.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=de.abb.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ca45799-0827-45a5-5eef-08d992eeff39
x-ms-traffictypediagnostic: DB7PR06MB4457:
x-microsoft-antispam-prvs: 
 <DB7PR06MB4457CC938943E3E895A431D4ACBD9@DB7PR06MB4457.eurprd06.prod.outlook.com>
x-abb-o365-outbound: ABBOUTBOUND1
x-ms-oob-tlc-oobclassifiers: OLM:46;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 xK0qO7mqLOSESQpU8pmCbeGhW7QBU4Xwoc1DNe5x7ATtPKTyNp1Xt4kXCXhAoYx8P79NNCYlvjFVr0uHYzMwYzR88E1ipvGX1tdA/YLzZCLjkvOsDDSYmBnm4aDnKmuprdOFli1tfMELCF9D5LI0E47Z3FloQCSR9yrSF4JvIyq5rFDF6df8e9GZcUFr0f2VQNQGO1Hudr7a6CTFl9OjaFu4aiXo6fa3xwml3dEeN59MDpeYWwcUQ6NENpMxA/906OP9sMbcwcWNZq1Re3s0EjzUfD10HO7aj3/nmIaOQhME3KuFscDtqCaphP7myUSNiNvBtqJHwqYI+Dm0d9f4rEuhQMzk7VduEtLT0n+4Ke2cP6rCNG4VufhCM3ITBo/xQj2j2AzSbzz1w80MHB4Ujcsi+5PtRuJtuvvxfvcb7kbpdcXrDBZsSeGCQG7aTLVFP9O3tbkYbClYEQ/ixZjuKVCoumyDAtIOFS/11L2cuzui8lgQHKWAYLcFJsN/XBQLMZqQ1p6N2tKiAzRJe6AXOlXMfey+lMnte7ju5EC51GMIy8uhiuMHkVrYPGIBnn3Zm8jFbWwCvzw+iefM5SEpyDk+bpSHvOFqzsjuZ6HlNFYiExL3N006cAjyHl+WSDXp10vDZ6+BzGzLbgofz8DgvBSG6xAc6BQ5T1BHsVBOVSdfXCAXuQxHnUg9EmVjGKJkVrwl9U8GdA8DF7D9tf48wMZ0Bs0iQS+8tSU3QW7TQNiG8X6rneyZNl52nrWDHLhgMmzInNNb9IY5xwQ7tSrPziQechft8PMdnKmAhvnsmX0Pa3Q2Gh+Tj2vaofrpwjZvOjfroY9VyQ5ojaOg++vlFg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB7932.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66574015)(316002)(8676002)(26005)(99936003)(5660300002)(86362001)(2906002)(52536014)(508600001)(166002)(44832011)(186003)(33656002)(6916009)(38100700002)(66556008)(66446008)(8936002)(6506007)(83380400001)(64756008)(55016002)(76116006)(4326008)(66946007)(82960400001)(66476007)(122000001)(38070700005)(9686003)(71200400001)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?7rNuN1ZBIC7YJYJfbHMm0kJ26GhTf3bvio0hv9Yl4V6sJe70oN4BAVTQ0i?=
 =?iso-8859-1?Q?YAAU5jQDIKyti2aHLmF48bMtwW235q+A1bndl9d7/juhiN6eDjNZzYzIGg?=
 =?iso-8859-1?Q?PNCNgz5QpL1ZZLskOvi+mBp24uz5VZ5fujTY6dUdQWE4zITenVeXYdyiJV?=
 =?iso-8859-1?Q?0VdeloLTW2/6iJoHTI9lU2kKus0wDHXYIdWHGun2PTMPbZ5Esy1FvDJJ/d?=
 =?iso-8859-1?Q?qcF5ikRZ/J8SF71rBwlcQzOqyzu+H7dtq0W6BhxvPuyfDZNDk/MoM8rpM8?=
 =?iso-8859-1?Q?c8M++JvG88AmMAKUX0LXQMsxtIipObraUHq6gmQxmhj0tM+4//UFZZY5Rc?=
 =?iso-8859-1?Q?KOESAqd0TfusDM2hSrHzVWv2PuEIMPbOWOhah/BwvouI7fKFi2OxHeMefR?=
 =?iso-8859-1?Q?j22liaYu2yvP2nRrf/bFKtd5/ZyHnHJf7TZA5om3Tb77J9RkOFfdKJojaF?=
 =?iso-8859-1?Q?NM5P29mz1rp0j7dxFi5vf87Xrjnw1w8+RzHtLSzNmddJVQ+y/sY+S3ZPD+?=
 =?iso-8859-1?Q?1fHraM3hzPlU2utHV2Qdmp/mTDonGYG7pbJhxduAV4xNhVx2cDsaYZTE7J?=
 =?iso-8859-1?Q?gnspd3XdEbBLx0uIfqYlg5OuiKG7dQY1WesM4rfdbV7o8MeqdQl1k5hvfe?=
 =?iso-8859-1?Q?41tuzUQiP5j5n4DeY58xGE5uSQ6pw2V7SgNYBIlw9S8O+x7a7ry3OgCmDq?=
 =?iso-8859-1?Q?03m8ZuiOaD/uzSZ/Od8vpg1zrn740xWCnRBcVkYoNj1LeWGbC/32Oy2/kq?=
 =?iso-8859-1?Q?pVzPrAmljrcSho1NdCCrjm2ifswE3ppgeLtubfeK+cgBsm3kgweGy7ba2m?=
 =?iso-8859-1?Q?rrAtsa7uyKqg0HnP3thuOgcIIUv4v51aB9q9f9RS3gVFgygivBBybGxK/0?=
 =?iso-8859-1?Q?VgHwvGwacSdiFZTVJu8tzskrvonZTKAjTWP+yvOKMaxZqFNlOBEjfvu+L/?=
 =?iso-8859-1?Q?OhaPyt0cIyFh1MEqrZSS3kHvdckshmhnc3UmHpiqWQN6jrMTy1uEUb2QzQ?=
 =?iso-8859-1?Q?ch2yX8aCGu0wEVTNsm+HGH/v/tc04q6DNSq5Vpc+dAkghGYdnf5iwxhW3+?=
 =?iso-8859-1?Q?Q8+0y5y2EIAfBdCU/5beiiSHYQH9cW+p3YY05kh9lmrRp6neDppROZuVBf?=
 =?iso-8859-1?Q?RZ5PHRSNDhFqs90ZM0kRC78OTm4YEdOt+JBgIwLunbw5/KfrATHguoY63U?=
 =?iso-8859-1?Q?JsxemkFJicUGKRB9S+STeTvmii+Ku/HMuemvcXAssopGXx16bsMryoC+Q+?=
 =?iso-8859-1?Q?wn8YsybaydALgdpgLhwYnysZfnQy/a+fUuz5vEYZ/IoycdZ/KgifvlR0fg?=
 =?iso-8859-1?Q?bNKW3ryz9UB1EovUkmuaQtjGyo+X7aOV2lqjnjgj9mD4ulMT5LiQSoq4gb?=
 =?iso-8859-1?Q?QnCWQv9HuI?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/related;
	boundary="_004_DB9PR06MB7932CEB962AE403349272E12ACBD9DB9PR06MB7932eurp_";
	type="multipart/alternative"
MIME-Version: 1.0
X-OriginatorOrg: de.abb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB7932.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7ca45799-0827-45a5-5eef-08d992eeff39
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2021 10:55:43.0332
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 372ee9e0-9ce0-4033-a64a-c07073a91ecd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 d/pMivccUeAWajA1zxSc7I2WGkxnI4eZnTLRnUcM6p/VtMd5RaPk3ZOSq+6HtnPlPg3m3d+MMtKGEIrZd1hKGMSaUQqXztxx3sos+q45/4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR06MB4457
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 10:55:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157107

--_004_DB9PR06MB7932CEB962AE403349272E12ACBD9DB9PR06MB7932eurp_
Content-Type: multipart/alternative;
	boundary="_000_DB9PR06MB7932CEB962AE403349272E12ACBD9DB9PR06MB7932eurp_"

--_000_DB9PR06MB7932CEB962AE403349272E12ACBD9DB9PR06MB7932eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

is there a rationale, why Configure is called with a bunch of deprecated_cr=
ypto_flags in hardknott-next <https://git.openembedded.org/openembedded-cor=
e/commit/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb?h=3Dhardknott-=
next&id=3D557d956743ecf5e1d002ae0b2135b1307736b7c8> while this is not done =
e.g. in dunfell<https://git.openembedded.org/openembedded-core/commit/meta/=
recipes-connectivity/openssl/openssl_1.1.1k.bb?h=3Ddunfell&id=3D0826a41940d=
a14631043e2a496854dbb5da9a15f> ? Just had a look at openSSL release notes a=
nd the CVEs as referenced by commit messages, but found no rationale there,=
 too.
We stumbled upon this, since it deactivates SCRYPT algorithm.

Best regards,

-Florian


[cid:image001.png@01D7C4E8.9F7FD250]


-
Florian Miedniak

ABB AG
Eppelheimer Str. 82
69123 Heidelberg, Germany
Phone: +4962217011254
Mobile:
abb.com<http://www.abb.com>

ABB AG
Sitz/Head Office: Mannheim
Registergericht/Registry Court: Mannheim
Handelsregisternummer/Commercial Register No.: HRB 4664
Vorstand/Managing Board: Markus Ochsner (Vorsitzender/Chairman), Alexander =
Zumkeller
Vorsitzender des Aufsichtsrats/ Chairman of Supervisory Board: Klaus Eble

Diese E-mail enth=E4lt vertrauliche und/oder rechtlich gesch=FCtzte Informa=
tionen. Wenn Sie nicht der richtige Adressat sind oder diese E-mail irrt=FC=
mlich erhalten haben, informieren Sie bitte sofort den Absender und vernich=
ten Sie diese Mail. Das unerlaubte Kopieren sowie die unbefugte Weitergabe =
dieser Mail ist nicht gestattet.
Bitte beachten Sie auch unsere Datenschutzerkl=E4rung f=FCr Gesch=E4ftspart=
ner, die Sie =FCber unsere Webseite<https://new.abb.com/privacy-policy/de/d=
atenschutz> oder direkt unter diesem Link<https://new.abb.com/docs/librarie=
sprovider30/default-document-library/datenschutzerkl=E4rung-gesch=E4ftspart=
ner-abb-ag_de832794ecc1f463c09537ff0000433538.pdf> finden.

This E-mail may contain confidential and/or privileged information. If you =
are not the intended recipient (or have received this E-mail in error) plea=
se notify the sender immediately and destroy this E-mail. Any unauthorized =
copying, disclosure or distribution of the material in this E-mail is stric=
tly forbidden.
Please also take note of our data protection notice for business partners, =
which you can find on our web page<https://new.abb.com/privacy-policy/de/da=
tenschutz> or directly under the following link<https://new.abb.com/docs/li=
brariesprovider30/default-document-library/data-protection-notice-business-=
partners-abb-ag_de762794ecc1f463c09537ff0000433538.pdf>.

--_000_DB9PR06MB7932CEB962AE403349272E12ACBD9DB9PR06MB7932eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:Helvetica;
	panose-1:2 11 5 4 2 2 2 2 2 4;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Verdana;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 2.0cm 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"DE" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-=
family:&quot;Helvetica&quot;,sans-serif;color:#333333;background:white">Hi,=
</span><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Hel=
vetica&quot;,sans-serif;color:#333333"><br>
<br>
<span style=3D"background:white">is there a rationale, why Configure is cal=
led with a bunch of deprecated_crypto_flags in&nbsp;</span></span><a href=
=3D"https://git.openembedded.org/openembedded-core/commit/meta/recipes-conn=
ectivity/openssl/openssl_1.1.1k.bb?h=3Dhardknott-next&amp;id=3D557d956743ec=
f5e1d002ae0b2135b1307736b7c8" target=3D"_blank"><span lang=3D"EN-US" style=
=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#33=
7AB7;text-decoration:none">hardknott-next</span><span lang=3D"EN-US" style=
=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-serif;color:#33=
3333;background:white;text-decoration:none">&nbsp;</span></a><span lang=3D"=
EN-US" style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-ser=
if;color:#333333;background:white">while
 this is&nbsp;</span><strong><span lang=3D"EN-US" style=3D"font-size:10.5pt=
;font-family:&quot;Helvetica&quot;,sans-serif;color:#333333">not</span></st=
rong><span lang=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Helve=
tica&quot;,sans-serif;color:#333333;background:white">&nbsp;done e.g.
 in&nbsp;</span><a href=3D"https://git.openembedded.org/openembedded-core/c=
ommit/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb?h=3Ddunfell&amp;i=
d=3D0826a41940da14631043e2a496854dbb5da9a15f" target=3D"_blank"><span lang=
=3D"EN-US" style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans=
-serif;color:#337AB7;text-decoration:none">dunfell</span></a><span lang=3D"=
EN-US" style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-ser=
if;color:#333333;background:white">&nbsp;?
 Just had a look at openSSL release notes and the CVEs as referenced&nbsp;b=
y commit messages, but found no rationale there, too.</span><span lang=3D"E=
N-US" style=3D"font-size:10.5pt;font-family:&quot;Helvetica&quot;,sans-seri=
f;color:#333333"><br>
<span style=3D"background:white">We stumbled upon this, since it deactivate=
s SCRYPT algorithm.</span><br>
<br>
<span style=3D"background:white">Best regards,</span><br>
<br>
<span style=3D"background:white">-Florian</span><br style=3D"box-sizing: bo=
rder-box;font-variant-ligatures: normal;font-variant-caps: normal;orphans: =
2;text-align:start;widows: 2;-webkit-text-stroke-width: 0px;text-decoration=
-thickness: initial;text-decoration-style: initial;text-decoration-color: i=
nitial;word-spacing:0px">
<br>
</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;color:black;mso-farea=
st-language:DE"><br>
</span><span style=3D"font-size:9.0pt;mso-fareast-language:DE"><img border=
=3D"0" width=3D"90" height=3D"34" style=3D"width:.9333in;height:.35in" id=
=3D"Picture_x0020_1" src=3D"cid:image001.png@01D7C4E8.9F7FD250"><br>
<br>
<br>
</span><b><span style=3D"font-size:9.0pt;font-family:&quot;Verdana&quot;,sa=
ns-serif;color:#FF000F;mso-fareast-language:DE">&#8212;</span></b><span sty=
le=3D"font-size:9.0pt;mso-fareast-language:DE">
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"page-break-after:avoid;text-autospace:none"=
><b><span style=3D"font-size:9.0pt;font-family:&quot;Verdana&quot;,sans-ser=
if;color:black;mso-fareast-language:DE">Florian Miedniak</span></b><span st=
yle=3D"mso-fareast-language:DE">
<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;mso-fareast-language:=
DE"><br>
</span><b><span style=3D"font-size:9.0pt;font-family:&quot;Verdana&quot;,sa=
ns-serif;color:black;mso-fareast-language:DE">ABB AG</span></b><span style=
=3D"font-size:9.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:black;=
mso-fareast-language:DE"><br>
Eppelheimer Str. 82<br>
69123 Heidelberg, Germany<br>
Phone: +4962217011254<br>
Mobile: <br>
</span><span style=3D"font-size:9.0pt;font-family:&quot;Verdana&quot;,sans-=
serif;color:blue;mso-fareast-language:DE"><a href=3D"http://www.abb.com"><s=
pan style=3D"color:blue">abb.com</span></a></span><span style=3D"font-size:=
9.0pt;mso-fareast-language:DE"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;mso-fareast-language:=
DE"><br>
</span><span style=3D"font-size:8.0pt;font-family:&quot;Verdana&quot;,sans-=
serif;color:gray;mso-fareast-language:DE">ABB AG<br>
Sitz/Head Office: Mannheim <br>
Registergericht/Registry Court: Mannheim <br>
Handelsregisternummer/Commercial Register No.: HRB 4664 <br>
Vorstand/Managing Board: Markus Ochsner (Vorsitzender/Chairman), Alexander =
Zumkeller<br>
Vorsitzender des Aufsichtsrats/ Chairman of Supervisory Board: Klaus Eble<b=
r>
<br>
Diese E-mail enth=E4lt vertrauliche und/oder rechtlich gesch=FCtzte Informa=
tionen. Wenn Sie nicht der richtige Adressat sind oder diese E-mail irrt=FC=
mlich erhalten haben, informieren Sie bitte sofort den Absender und vernich=
ten Sie diese Mail. Das unerlaubte Kopieren
 sowie die unbefugte Weitergabe dieser Mail ist nicht gestattet. <br>
Bitte beachten Sie auch unsere Datenschutzerkl=E4rung f=FCr Gesch=E4ftspart=
ner, die Sie =FCber unsere
<a href=3D"https://new.abb.com/privacy-policy/de/datenschutz" target=3D"_bl=
ank"><span style=3D"color:blue">Webseite</span></a> oder direkt unter diese=
m
<a href=3D"https://new.abb.com/docs/librariesprovider30/default-document-li=
brary/datenschutzerkl=E4rung-gesch=E4ftspartner-abb-ag_de832794ecc1f463c095=
37ff0000433538.pdf" target=3D"_blank">
<span style=3D"color:blue">Link</span></a> finden.<br>
<br>
This E-mail may contain confidential and/or privileged information. If you =
are not the intended recipient (or have received this E-mail in error) plea=
se notify the sender immediately and destroy this E-mail. Any unauthorized =
copying, disclosure or distribution
 of the material in this E-mail is strictly forbidden.<br>
</span><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-family:&quot;Verd=
ana&quot;,sans-serif;color:gray;mso-fareast-language:DE">Please also take n=
ote of our data protection notice for business partners, which you can find=
 on our
</span><span style=3D"font-size:8.0pt;font-family:&quot;Verdana&quot;,sans-=
serif;color:gray;mso-fareast-language:DE"><a href=3D"https://new.abb.com/pr=
ivacy-policy/de/datenschutz" target=3D"_blank"><span lang=3D"EN-US" style=
=3D"color:blue">web page</span></a></span><span lang=3D"EN-US" style=3D"fon=
t-size:8.0pt;font-family:&quot;Verdana&quot;,sans-serif;color:gray;mso-fare=
ast-language:DE">
 or directly under the following </span><span style=3D"font-size:8.0pt;font=
-family:&quot;Verdana&quot;,sans-serif;color:gray;mso-fareast-language:DE">=
<a href=3D"https://new.abb.com/docs/librariesprovider30/default-document-li=
brary/data-protection-notice-business-partners-abb-ag_de762794ecc1f463c0953=
7ff0000433538.pdf" target=3D"_blank"><span lang=3D"EN-US" style=3D"color:bl=
ue">link</span></a></span><span lang=3D"EN-US" style=3D"font-size:8.0pt;fon=
t-family:&quot;Verdana&quot;,sans-serif;color:gray;mso-fareast-language:DE"=
>.</span><span lang=3D"EN-US"><o:p></o:p></span></p>
</div>
</body>
</html>

--_000_DB9PR06MB7932CEB962AE403349272E12ACBD9DB9PR06MB7932eurp_--

--_004_DB9PR06MB7932CEB962AE403349272E12ACBD9DB9PR06MB7932eurp_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=2694;
	creation-date="Tue, 19 Oct 2021 10:55:42 GMT";
	modification-date="Tue, 19 Oct 2021 10:55:42 GMT"
Content-ID: <image001.png@01D7C4E8.9F7FD250>
Content-Transfer-Encoding: base64

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
q3/OAAAAAElFTkSuQmCC

--_004_DB9PR06MB7932CEB962AE403349272E12ACBD9DB9PR06MB7932eurp_--

