Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D30C5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 19:17:31 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com (BL2PR02CU003.outbound.protection.outlook.com [52.101.52.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49906.1786130243703267798
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2026 12:17:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=pWpzaiP6;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 52.101.52.39, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xdhFH45j9OkAuYzZ3zvvv5ePkJltW/eGNLVKTc0QDtf8eFFdhN5avTjA8syUZ7LFKjGi+7b1NDd9kZyk/VWlfb+88RHJIkMtsxP3/sVE8/m+gQxv2R1EDoZmPw5DGzS0Mq5yvGcUckmlwIB9tYlQLGI78FqEOY5WbV8+VJHm86YipBh/AC53n57styUucCFsmYB5IBQR/Ney0edY/eMluLLl+i8Ef0SniLQF+09aDcCGYU0Rk2cc87Eg+FRLHVputSWSLsucoEvU674el+qxrNNlhTTSn/Zmv9N9aS2osoBDxUpzzXN5wcVF7354cYRnakQjPtpRjs0TpLsa9yLILA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xg8v09/LwFwuFcCJYELcblydzBxAqXORZ3C6X7076L8=;
 b=VRrbjJoTQrQH2PBb2/kWAeu1PoY6flAGouudRQTtPQV4GlzRyM31M4W+YfhrYb59yC7ZbkEbQ3JzE4sPQN7dWFT9oFkKepteujp+zI/X6p1CG+AyktVhZht+02P2ya0EJ1AG5FCGa1L1hAP+XueZKQ2D9FlzVdNMXLC4wJkWTU4u9eTcylrr2WAQs+tk7kHODbbj6ZqWi6oyYsHVnuF4Va/t1AyWbceRlpqTxgIT1AEDhJslQe/uyMK01r6n2WH202/VdumhSkiOj5uX8v8g6XsA8TwYiiSvgc2k5yE3lV2A0at17MrXYSo+qDwyaDSwDgzDzUrm8w3vnQXEiK+xoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xg8v09/LwFwuFcCJYELcblydzBxAqXORZ3C6X7076L8=;
 b=pWpzaiP61/anfAvNBi1QQy2HbK9YzIX2Oex5tIMqSmD9Pvw41x6U0Eumh9Pc8EObNQv/7iYX++30tj0Si33zrCWEkHyp9O585Jj405nwhaeKaGd4bRD+eyvRLCGOZCOldAMn/6SJ33oyLIk/bKLH0sNhAp/N6MfQpERze544fBVgGM8JSKgHtCB1wj/SY0um/k9YYcQby9ctw22laVCmiZ8jx4rBilP8+fMlGUutruT6LxaxN4F/C55X8jObd11Ki8LTMxF7aN3ivtJXSjirbxZJxcGwIh+EA8fdsjMhRRhuLRR6cWh9XM9oBOdwEQxJrmpMwyxAv9O1R6AKu7KTDg==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 CY8PR12MB7705.namprd12.prod.outlook.com (2603:10b6:930:84::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.24; Fri, 7 Aug 2026 19:17:19 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::152b:7346:321d:4a2]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::152b:7346:321d:4a2%6]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 19:17:18 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: "Checking sstate mirror object availability" progress bars
Thread-Topic: "Checking sstate mirror object availability" progress bars
Thread-Index: Ad0moIqENvNpiy4/SdClFe5zENmSsA==
Date: Fri, 7 Aug 2026 19:17:17 +0000
Message-ID: 
 <DM8PR12MB5430689E7FD5CCD1E6FF60AB8BD12@DM8PR12MB5430.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ActionId=160354d4-bd73-4553-ad41-4a2d620afda9;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ContentBits=0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Enabled=true;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Method=Standard;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Name=General;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SetDate=2026-08-07T19:09:42Z;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SiteId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5430:EE_|CY8PR12MB7705:EE_
x-ms-office365-filtering-correlation-id: 6fd3658b-6c17-4272-a58f-08def4b87f58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|23010399003|366016|376014|11063799006|56012099006|10067099003|18002099003|8096899003|38070700021;
x-microsoft-antispam-message-info: 
 wBmBSysdYPZius+1ZcY5IgHXHieUKSs8HlaaaUV0Vy2vQQnQUMRVgDpvKQLW/H0ZWgOEZeIDKFChmrSLoX1XW7wbR+gFRPAZFtvGoeLXdr9ajxCSDpvnwY3CpQjPrNZQ6URE4posuk1nvQ3EotGNvFAzZ7SQnyLNqprJrFQj57MHB2NXCDKDNYFqStsnoeXatXDCUxrM8qZg1GjuO7yrIzPlT0J7neQ/XJ/GzsfPpjcLhirYEAWQrHH4jnQdsJd9evgtlkLohgLqlQSY0uXrWzI+SoIRQxCB8Yix2aO3PGt3uganYxrA2JmWOkstNpU8IwK2zUctPQbMx0hIX1Wgum97ldB5z3cAbuk0AC1jaxGLjFobNxKyKkcPDJgxE67AebvA5VAQXHgE+86Av0Z0KC9FJMw+iGswbkmID/WdWHEN7jK6eoIO4AxzCGdVG8/hiUovl+s4kVijo6bvKp8LSz6WRZfUdDcKAbnETAGJR9u9Zrh35nSgaf6x473g/63B+r8KI1EwX3C77wHxA6zNMf7/1H76oxMVgmKryiH7xyLh+XSpbp1HFO2ODlCuN65mE+sW7g3q5w9TD/CnBbhnpGsY/DBpG54+7mF30n/bAJAv55a+yQStO3qU/6xb9xDaQQG2OiLOIGXDdM0UKVfPk9udN8quF0pQaomaS51wjLDySUWGAByTV8mblp9+R2p2D2XlPXv21ZeqZDw2VCsa4nNdjmW3k2sHt1een5ihOds=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(376014)(11063799006)(56012099006)(10067099003)(18002099003)(8096899003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?4Lu0d4YDiVbDvuoKSZ5PLSDR9oa7s5O02x4kelY1bCrwhiGqvj8yjnM6YJfi?=
 =?us-ascii?Q?wr3Ckgo484vg93bmnwBqSOw07kMZTqe5RIEO0vg0fafzZD6b15C3ghWf4TPi?=
 =?us-ascii?Q?0OK6zlJ0lwpU7Y9BYKR5lKgM+l/vH6wtd9wFNQa7cHpc2TF0OvI2hTgjVRbg?=
 =?us-ascii?Q?Of/4m4SClxI1mlwSic/3qtXGivhoKv3rREm7x+ytpFUD1dr3Fjz4XoUKp5JN?=
 =?us-ascii?Q?vHZK0J76+lcXaNv5j2YE8gNX/z0YaxHu2EGxuLgwa8UH5IREb5iCrSR8n7YW?=
 =?us-ascii?Q?iqFdQlb0qGXMHO8FvCcWMiwVRevJdKVd+5hyKtwASbyIiMSMLyy+GOEPnSh7?=
 =?us-ascii?Q?T3SDewzKoamcWu/35P6hPYIRhn2NEvzndYusydt8rX6aqkaM0HArcnvmFt2p?=
 =?us-ascii?Q?fHPTCHuVgdg6g2U3z9h164nYGiwB5j/hrWDOMkn0L9DoHVjIOdVw34IU+B1S?=
 =?us-ascii?Q?vivVehzJhmgnlv1G7KxDC2BthgiMqfK6NYTghx4VtqXCjaBEjZGHMa5pBBsp?=
 =?us-ascii?Q?n2UW5pblbKhv8slkj7XPyaJ8gPIQtRA1TT8t/l4i+EBpxuKlRWm8gDeXoNp/?=
 =?us-ascii?Q?+5bKh7h4Ql19Ed9Y95zfXt6q1Iw+cD+sXcWChs2hOiGdM7JhmbmHBuoHEMA3?=
 =?us-ascii?Q?1YjyBJvVLKm47vV7QdTucVnwg8zOS6yDJ4F2PI9eNCFLHydxvTVWA9PobGk7?=
 =?us-ascii?Q?TP5WX7xRKgl058/Jp2aSB50/IkxjQI/8Lqt5JFLty+cf9GgrEAuxzNzh3xbR?=
 =?us-ascii?Q?zQMwo85V0z22qaS26UcCfT1sOkwYyjcBhDB/ivpkzLCdCFcIE4hoLx6LaPTd?=
 =?us-ascii?Q?8lq3KhjBJ+9obfEnm1rBmlkOox4Gt5SXcAsevlK+c/sVYjKI30Xf6V1BDyjn?=
 =?us-ascii?Q?1K5JZ1nZlLp4Rividjj+a75CmscO8CrAe2mOvTWZK4MJT95lm4HJoSMJt+hd?=
 =?us-ascii?Q?JJLY53RazBNCQaJEOoiuFonmKBO+8h0ImrDq9HNnU6aR0s9O6rML7fl2Po8i?=
 =?us-ascii?Q?WmAdxxfFb7MjrP6oiMlxW2vym5Vd2U970Qv5ExhGLYb/I2x2Qhv4oEvaBepy?=
 =?us-ascii?Q?Zul8EnApM64USwA8mup/7bA2AfocySodh+83i2bA8DkJrdiiGXePmt3dBUxC?=
 =?us-ascii?Q?8O2yh1LP4pY41wiWm8jD2EhgyXVeagw0OzMv9z6yzC5K9nlVyfLbBQvl9fkq?=
 =?us-ascii?Q?REcW/WmntGIBChOLjrkYjD4DHE4mA5Vaji0rgOv2MhyiCyblPj6PILkVCmpB?=
 =?us-ascii?Q?Gib+eeZxZv76BSab9rrHvBrOMMXs4jMi9l3DxS09NYgNcUdrNUuvG9zMFYwN?=
 =?us-ascii?Q?WSjr2BjPGJafHnjmqaOLpToZF0J9dYn+MVCOoffShG7ieAGszkSTheQqmWOU?=
 =?us-ascii?Q?HXQ+kKUpMb7giQn3ZVnD5ckSoHmU2gfsYWDDwi/TXidrb9wMnUqPCHWQ2ihl?=
 =?us-ascii?Q?hCt7Lribm+bWtSpdw8RYEKgTPkeKstscoEWXF6d8AwYyLHQoiWKE024g9yYM?=
 =?us-ascii?Q?7QgS+zbymoVVSnYi3D3DHh0b03RhnJOTC2PEoGlyfKIUQVIHEUQoyusRFPgY?=
 =?us-ascii?Q?I8B745qTMcrfuC9ELAGDa1MDZKpNXns6Nvr7a3GpW9wtmd4Zm961ElYG/aEa?=
 =?us-ascii?Q?AwHud2QDK2tJ0ep2/1Uky/CCvnDj5jbrlHiUBot1P0hwrqCk3V9h88VYT1CZ?=
 =?us-ascii?Q?faOtLAW6M8Ga5cOcsGzHtTD7cQ3CxxXoCcP3+feRhGGsO++bbDjho4MRuiv0?=
 =?us-ascii?Q?X3YFVv6pOw=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM8PR12MB5430689E7FD5CCD1E6FF60AB8BD12DM8PR12MB5430namp_"
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd3658b-6c17-4272-a58f-08def4b87f58
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2026 19:17:18.0309
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iKX2W+7533rQ780SiWIpXJ5OFJZmvzIGwrKIjWUIIbe/kR1GKN5AQPWaxarF08KAjojSjUU55+3qmMx3zMKPOv7cmJuQoDzwt369FmicGNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7705
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Aug 2026 19:17:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243027

--_000_DM8PR12MB5430689E7FD5CCD1E6FF60AB8BD12DM8PR12MB5430namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

I have noticed that some builds cause an avalanche of "Checking sstate mirr=
or object availability" messages to fill the screen, one after another, pre=
venting me from seeing the more useful per-task progress bars. It also hide=
s the "Currently n running tasks" progress bar.

This tends to happen a lot with builds that heavily utilize multiconfigs.

My screen ends up looking like this:

Checking sstate mirror object availability: 100% |#########################=
############################################################| Time: 0:00:47
Checking sstate mirror object availability: 100% |#########################=
############################################################| Time: 0:00:07
Checking sstate mirror object availability: 100% |#########################=
############################################################| Time: 0:00:07
Checking sstate mirror object availability: 100% |#########################=
############################################################| Time: 0:00:05
Checking sstate mirror object availability: 100% |#########################=
############################################################| Time: 0:00:08
Checking sstate mirror object availability: 100% |#########################=
############################################################| Time: 0:00:16
Checking sstate mirror object availability: 100% |#########################=
############################################################| Time: 0:00:08
Checking sstate mirror object availability: 100% |#########################=
############################################################| Time: 0:00:06
Checking sstate mirror object availability: 100% |#########################=
############################################################| Time: 0:00:13
Checking sstate mirror object availability: 100% |#########################=
############################################################| Time: 0:00:05
...

Does anyone actually find this particular progress bar useful? I wonder if =
we can be more selective about when we show it. Alternatively, maybe we can=
 just tack it onto the end of the per-task progress bar list?

Thanks,
Chris

--_000_DM8PR12MB5430689E7FD5CCD1E6FF60AB8BD12DM8PR12MB5430namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have noticed that some builds cause an avalanche o=
f &#8220;Checking sstate mirror object availability&#8221; messages to fill=
 the screen, one after another, preventing me from seeing the more useful p=
er-task progress bars. It also hides the &#8220;Currently
 n running tasks&#8221; progress bar.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This tends to happen a lot with builds that heavily =
utilize multiconfigs.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">My screen ends up looking like this: <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Checking sstate mirror object availability: 100% |##=
###########################################################################=
########| Time: 0:00:47<o:p></o:p></p>
<p class=3D"MsoNormal">Checking sstate mirror object availability: 100% |##=
###########################################################################=
########| Time: 0:00:07<o:p></o:p></p>
<p class=3D"MsoNormal">Checking sstate mirror object availability: 100% |##=
###########################################################################=
########| Time: 0:00:07<o:p></o:p></p>
<p class=3D"MsoNormal">Checking sstate mirror object availability: 100% |##=
###########################################################################=
########| Time: 0:00:05<o:p></o:p></p>
<p class=3D"MsoNormal">Checking sstate mirror object availability: 100% |##=
###########################################################################=
########| Time: 0:00:08<o:p></o:p></p>
<p class=3D"MsoNormal">Checking sstate mirror object availability: 100% |##=
###########################################################################=
########| Time: 0:00:16<o:p></o:p></p>
<p class=3D"MsoNormal">Checking sstate mirror object availability: 100% |##=
###########################################################################=
########| Time: 0:00:08<o:p></o:p></p>
<p class=3D"MsoNormal">Checking sstate mirror object availability: 100% |##=
###########################################################################=
########| Time: 0:00:06<o:p></o:p></p>
<p class=3D"MsoNormal">Checking sstate mirror object availability: 100% |##=
###########################################################################=
########| Time: 0:00:13<o:p></o:p></p>
<p class=3D"MsoNormal">Checking sstate mirror object availability: 100% |##=
###########################################################################=
########| Time: 0:00:05<o:p></o:p></p>
<p class=3D"MsoNormal">&#8230;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Does anyone actually find this particular progress b=
ar useful? I wonder if we can be more selective about when we show it. Alte=
rnatively, maybe we can just tack it onto the end of the per-task progress =
bar list?
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Chris<o:p></o:p></p>
</div>
</body>
</html>

--_000_DM8PR12MB5430689E7FD5CCD1E6FF60AB8BD12DM8PR12MB5430namp_--

