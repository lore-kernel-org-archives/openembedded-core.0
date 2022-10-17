Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D63BC433FE
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 16:12:24 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.66])
 by mx.groups.io with SMTP id smtpd.web09.43122.1666023135743444894
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Oct 2022 09:12:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=duFsFyfx;
 spf=pass (domain: nxp.com, ip: 40.107.105.66, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGa7d38aXItPh0lMvGoyBDz1rE+pnY5ujOKKgeZsE5gau+KPZAhXbGTojVBN+uN5yTyFty1fNKgMgpmMZTEJCAbwtxc43IXkVNBWw53NP8xD00hjeI1PsMurohlCbHvUthI/swFp4ViGqr136cEjp4IhEiGEzVPKKEKrrnF1l9wPiAfjYp/7f1ZjK5rVSXgDDWoedgGujYRPGhiLcApghk+qaICwEJIRnV1fY/q3bF/wAmkMuNkQK+eHt4CTB3beQwkwzxeHKt1qFzZ89uLXa53cQGxmSvza6QphSIpMsaNYGQqlL3QheAhxayEvSUkfMEdkXVp6zKsTQmAskkY13g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5YuoIhsewu+bJkpp+/WXXOn2sJZev/1XKJwjjAIy0XA=;
 b=RqbiXCY++n0ZNw7B7ng6uDk5mqvH6NXbcvPZBlwxfL9ExzVGdXhPH78tKMjs+yoalJsnA/q03wkeQlNiKkBhaPpMDLifZCBkidOH9pq46Ws51jM7SyiEIr4veKSXIE3CjzAu+0UkwI/eVTF0cd3ajdhvWOF6wIbSQqAeOhMx1vovYiz6Qy0GNyhDBHllhbBdqQtqIMHGm2VMsRHiZOov6Xd1O/cP0PXpGeMcrA/5Qr0cFEIxeOiskV/k4unon7cNegRHh3rWmK8DYbHZzQEFjkAs2k/vNq3ZJ1wHJkSVcNvrnbdH3abMJrVPk4QM1a+H9NR85vYa8p3KMMbPfeYbKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5YuoIhsewu+bJkpp+/WXXOn2sJZev/1XKJwjjAIy0XA=;
 b=duFsFyfxoXNkXYixji2cI4zDq5AIZ7pOS9vjbAH9Dvti9Y5scEI/SrA5OHXRwJFzWxFdAovTnfGsE74JTKJ7stqcNPy2QHhLj4x/9P7BreGXj8Pve1vebWh9JizGvP4ZoJX1YSc8+Y3GljZtH02zWJCSs1XC5FqVh5+3hskQ0Yk=
Received: from PR3PR04MB7308.eurprd04.prod.outlook.com (2603:10a6:102:80::21)
 by DB9PR04MB9475.eurprd04.prod.outlook.com (2603:10a6:10:367::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Mon, 17 Oct
 2022 16:12:12 +0000
Received: from PR3PR04MB7308.eurprd04.prod.outlook.com
 ([fe80::2f0c:165b:8713:d1ef]) by PR3PR04MB7308.eurprd04.prod.outlook.com
 ([fe80::2f0c:165b:8713:d1ef%3]) with mapi id 15.20.5723.033; Mon, 17 Oct 2022
 16:12:12 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: Martin Jansa <martin.jansa@gmail.com>, Ross Burton <ross.burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] vulkan-loader: Move libvulkan.so to main
 package
Thread-Topic: [OE-core] [PATCH] vulkan-loader: Move libvulkan.so to main
 package
Thread-Index: AQHY4ahykLPxTkakr0iFyNvx7WeNM64Sf3KAgAAFVoCAAC9ygA==
Date: Mon, 17 Oct 2022 16:12:12 +0000
Message-ID: 
 <PR3PR04MB730871C6334283026EF62346E2299@PR3PR04MB7308.eurprd04.prod.outlook.com>
References: <20221016214357.596913-1-tom.hochstein@nxp.com>
 <8917BE00-005D-4ECE-BAB9-82EFC64F9544@arm.com>
 <CA+chaQewGSyDypShmVYKNBkcEZUHrNPQbmYpNfbn+Ph3g40bcg@mail.gmail.com>
In-Reply-To: 
 <CA+chaQewGSyDypShmVYKNBkcEZUHrNPQbmYpNfbn+Ph3g40bcg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR04MB7308:EE_|DB9PR04MB9475:EE_
x-ms-office365-filtering-correlation-id: 6068088c-bd51-4349-0f6a-08dab05a59c1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 L+fJZqej0PUWfzL65xINzrTPliDPZ2W2KFEcKGUSi7f2wM/trNuitaH875b+gHZh+NlZgNTbXet29eSjsRfp8bVCT/2xFVl6bNaDxK9oc7dwKx5vHI7mQifEGn49/NZLIYMq6nyIlHyt0dRbnp1Toz4ppY0Jn0k5DcJAMfvkO1JEjiFV4/l0u5tkUqtdRBnOHeHVUMrcSVWq/1P54gd9ys07aM0fE9M/yUZqhqgvtOpIe2ogiJNsqyN7Re+arvtz4YwrFLdF3yITfd8v/evEwTklTVBLMusONH938OLLmWusCVMUeRKavw63QLRR8VVn1z4kicJmYbTB4BhY04RMzeJS25Dy2gXloq5dY625WrRSIV8fKLXRR5ckyZeqODz5YvX826KGsWgPdtZsuYEKFIzjp2EeYobOav3RgyD6F22a8GJQ5DWi9DHJncfPLP7nbUygESIspU2W3c3PvXBsbEdp9EZ0ka1OohsQ6cQ657flIBxSKUm8COSNrCpDIuaccOKcbGoCvF4BtQLQ9DRCHhoGiV7S4zVqQJA37Rwq8EapCCfaR2ilCXax89DT5ojrnrt8uD9KUZLX1wNmKWHKPf0k4RxWxqiX8QHro5+keymw30tscvCirePsBQC+rTXitYzudmrfmVQX7SCguSfby4zOpnA7sWqxm9Taoga0IEyCGNasGuqX45CaP7u3pmDc1ZvtrzW4/eVPM3ryfmooenFCDB0whRlYNVQWzcPOqqyz15U6LUl2OzfgBCUJvIQb84UzTa8uyqdU2tcIKbKiNPEWuSs+eCCBQgR10wzWSTnYIn77Q5p/Af/kzua4fINC6INylUkhAFWemVSCTv/ROQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR04MB7308.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(39860400002)(136003)(346002)(396003)(451199015)(38070700005)(166002)(122000001)(55016003)(33656002)(86362001)(38100700002)(83380400001)(66946007)(110136005)(76116006)(64756008)(66476007)(316002)(8676002)(66446008)(44832011)(66556008)(5660300002)(966005)(186003)(2906002)(71200400001)(8936002)(6506007)(7696005)(4326008)(478600001)(9686003)(26005)(53546011)(41300700001)(52536014)(55236004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?b7FYBr9KN7BsISVGIkJRHX+Id8sUf5wCnoRR+KITJJhOmV4J/iSn3GWRHOlG?=
 =?us-ascii?Q?P4SL8cQMiJbSzSO4VXFn0kZt1P9j0TwPS1GwqMQT0V5FKJiU2PsVKdAxPQJZ?=
 =?us-ascii?Q?ACNUZ35N5XdaBSFu0TzHzCfx+mizV7arjEMbgAFARS2cgjJ+UcNtEq0YJKXe?=
 =?us-ascii?Q?EtrNgHFac94SUR5w/P7DeEgLVotKt8le3Xl9rvNlmuDPyTnUv3kIu0WCZmMV?=
 =?us-ascii?Q?6oAF8C46uEOFJqW0oDZMZIPf/VBwuuBdaR5X951onYjXzDpREiZUU5H9Eclr?=
 =?us-ascii?Q?HGPLD64rqhywu8axkXtniWmtnO/LmkL/ttO1jmKefGBTSrqzaxLE+VY+jgcL?=
 =?us-ascii?Q?jsem1NTQal0mApjgeRXR0+F+Oi805tWsyyDjsJ5ZOeFw6JIW0lXu3/NICMOE?=
 =?us-ascii?Q?aPonPF1swWFrnSkTAV+29/rKAqroz/wacY5U5mjHuuvfc2jKmVUKkUXUYKCx?=
 =?us-ascii?Q?3Ic2XczaJaksPv/1RiPN3sJO3gvd7kvB7Bpq/pXa54X/IzDgIa5Y3hvJCB6U?=
 =?us-ascii?Q?qhm4irMXX7uIbmUy86irqt2ND68xg//ytVeFEIoeJiE4CNrOXuPqhZlA+V6W?=
 =?us-ascii?Q?oooa2Sp1CNytPZ/N9sLQnLDQOXPw6eZhXIT4bzzrNhIQ1hqAcMfVsM72xfel?=
 =?us-ascii?Q?wtNWNoiuQJLaWhpFegrvCQrGoEUXTQeXGh73cYP7RlFFmjSkNnU75bhmarWK?=
 =?us-ascii?Q?p22o/A9u4xio0//dVgtOcLa/BsScEWpgDTbIQysrwDHZLuilBayYeP6f7Kvx?=
 =?us-ascii?Q?VLqavUGEqcz11mpomEBw+dXvj4JsHc/sStDNrgQja1sn7xHjra8pICDVMllF?=
 =?us-ascii?Q?qO9JEWZFeIFC8sCue1ZtJxe6qOrYV9UQNzPO7oPjsKUoACLW/wvN4OuFrj8V?=
 =?us-ascii?Q?oQDU9GMP0ZL/nr6WWBzXDVe7m/22jTPE9xMepGeUqKvl5Vr6kQC4yT3ru8U0?=
 =?us-ascii?Q?QT2sDirZ6qWqJP+AtzqG2T4afxTP97+VIyLGHrHgzJUPZhVqyVKlXfQ1SBjp?=
 =?us-ascii?Q?awsvnbKyIhBV1HRF2YjAK7IZeElJe4PXmnq9nyc0WCoip/r8eQKia5SZMe0A?=
 =?us-ascii?Q?QcYdNfxlhBRuWYorfjDTJAqkOVXC/YuZERgJVcOPrZIYluNXxEOQwGNWlUTC?=
 =?us-ascii?Q?wp+emIQubeuaGFIC9zzo48YCqNmoWfTUgVNb/s+eJ3yolE7Y7lVFSYR/gGA5?=
 =?us-ascii?Q?AAhGvaqD3pWFn1thWpsIzTNBZcULglQ9kmj2NDy5fZhgmkO+sAaTVTb5vTiL?=
 =?us-ascii?Q?MByNj6yZ2D+qK3ZIzwTP3wzgsPw19ltzE90EJe+iVm2qZiuhc5U5pthriNai?=
 =?us-ascii?Q?FPcxbphEZVbYCDDU6ycmOkdFfO8AEb5Mt5sZNzQAJArBJYyvxHgPjcxM3B8w?=
 =?us-ascii?Q?Kd0vEF7WayZ2d7YLwSeYm76ChWyaujy+YZrXtJVzj3C2SCIDWUWGm33VjNHd?=
 =?us-ascii?Q?29KrAo8fzNSohJ9M3z5xrfuFNFhM1NBj6UDfiUUoa/UCbgNzJy6jMcrc271u?=
 =?us-ascii?Q?2WsuyW4L8EPNZ7HFupBAy+EEoTPQdZh3Lt1S9OO9Tb3KAudmM5J1ncCC3C2p?=
 =?us-ascii?Q?cjGxwxDN2wrm72+mjAX/YhFrNQcI4vPeiACXbQp3?=
Content-Type: multipart/alternative;
	boundary="_000_PR3PR04MB730871C6334283026EF62346E2299PR3PR04MB7308eurp_"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR04MB7308.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6068088c-bd51-4349-0f6a-08dab05a59c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2022 16:12:12.5247
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EZDvziwTw/c8Ql5Uu9q5bJS/u9e14UGZ6mwU72h+FlC+EnhZYWc/FoukUfLGXqAPHTZH0Xf1XQI0Zynhq4Ulhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9475
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Oct 2022 16:12:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171915

--_000_PR3PR04MB730871C6334283026EF62346E2299PR3PR04MB7308eurp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I found a few examples online for both ways. In SaschaWillems examples, .so=
 is used:

https://github.com/SaschaWillems/Vulkan/blob/master/base/VulkanAndroid.cpp#=
L142

In Vulkan-Tools there's a mix. Here the implementation falls back to .so.1 =
if .so is not found:

https://github.com/KhronosGroup/Vulkan-Tools/blob/master/vulkaninfo/vulkani=
nfo.h#L256-L257

While here only .so is used:

https://github.com/KhronosGroup/Vulkan-Tools/blob/master/common/vulkan_wrap=
per.cpp#L25
https://github.com/KhronosGroup/Vulkan-Tools/blob/master/scripts/generate_v=
ulkan_wrapper.py#L2043

With no consistency or guidance I'm not sure what the right solution is. At=
 first I thought perhaps it is better for the caller to be more specific so=
 that a compatibility problem is detected with a dlopen failure. Complicati=
ng that, though, is that vulkan-loader 1.2 is not compatible with 1.3. Plus=
 why does Vulkan-Tools use .so.1 second? Probably to get around the fact th=
at the .so is in the dev package?

Is it possible and/or reasonable for a binary to load the .so then check th=
e version and handle that at runtime? If so, then including the .so in the =
main package makes sense. Or should the user in this case be expected to us=
e RDEPENDS to install the .so?

From: Martin Jansa <martin.jansa@gmail.com>
Sent: Monday, October 17, 2022 7:29 AM
To: Ross Burton <ross.burton@arm.com>
Cc: Tom Hochstein <tom.hochstein@nxp.com>; openembedded-core@lists.openembe=
dded.org
Subject: Re: [OE-core] [PATCH] vulkan-loader: Move libvulkan.so to main pac=
kage


On Mon, Oct 17, 2022 at 2:10 PM Ross Burton <ross.burton@arm.com<mailto:ros=
s.burton@arm.com>> wrote:
On 16 Oct 2022, at 22:43, Tom Hochstein via lists.openembedded.org<https://=
eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flists.openembedd=
ed.org%2F&data=3D05%7C01%7Ctom.hochstein%40nxp.com%7Cb79ae30157f142e2468e08=
dab03b378b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638016065621027269%=
7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWw=
iLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sdata=3DldUoyzxYOQMI33kzqUh9CJ15MGI2n0YRf8r=
wKopwkJw%3D&reserved=3D0> <tom.hochstein=3Dnxp.com@lists.openembedded.org<m=
ailto:nxp.com@lists.openembedded.org>> wrote:
>
> Since libvulkan.so is commonly loaded dynamically, put it in the main
> package.

Can you give an example?

I'm wondering the same, because e.g.  tensorflow-lite. arm-compute-library =
were also trying to dlopen libOpenCL.so and we've patched them to dlopen li=
bOpenCL.so.1 instead, so why should libvulkan.so be different.

--_000_PR3PR04MB730871C6334283026EF62346E2299PR3PR04MB7308eurp_
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
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle19
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	font-family:"Calibri",sans-serif;}
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
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">I found a few examples online for both ways. In Sasc=
haWillems examples, .so is used:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/SaschaWillems/Vulkan/b=
lob/master/base/VulkanAndroid.cpp#L142">https://github.com/SaschaWillems/Vu=
lkan/blob/master/base/VulkanAndroid.cpp#L142</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In Vulkan-Tools there&#8217;s a mix. Here the implem=
entation falls back to .so.1 if .so is not found:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/KhronosGroup/Vulkan-To=
ols/blob/master/vulkaninfo/vulkaninfo.h#L256-L257">https://github.com/Khron=
osGroup/Vulkan-Tools/blob/master/vulkaninfo/vulkaninfo.h#L256-L257</a><o:p>=
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">While here only .so is used:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/KhronosGroup/Vulkan-To=
ols/blob/master/common/vulkan_wrapper.cpp#L25">https://github.com/KhronosGr=
oup/Vulkan-Tools/blob/master/common/vulkan_wrapper.cpp#L25</a><o:p></o:p></=
p>
<p class=3D"MsoNormal"><a href=3D"https://github.com/KhronosGroup/Vulkan-To=
ols/blob/master/scripts/generate_vulkan_wrapper.py#L2043">https://github.co=
m/KhronosGroup/Vulkan-Tools/blob/master/scripts/generate_vulkan_wrapper.py#=
L2043</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">With no consistency or guidance I&#8217;m not sure w=
hat the right solution is. At first I thought perhaps it is better for the =
caller to be more specific so that a compatibility problem is detected with=
 a dlopen failure. Complicating that, though,
 is that vulkan-loader 1.2 is not compatible with 1.3. Plus why does Vulkan=
-Tools use .so.1 second? Probably to get around the fact that the .so is in=
 the dev package?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is it possible and/or reasonable for a binary to loa=
d the .so then check the version and handle that at runtime? If so, then in=
cluding the .so in the main package makes sense. Or should the user in this=
 case be expected to use RDEPENDS
 to install the .so?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Martin Jansa &lt;martin.jansa@gmail.com=
&gt; <br>
<b>Sent:</b> Monday, October 17, 2022 7:29 AM<br>
<b>To:</b> Ross Burton &lt;ross.burton@arm.com&gt;<br>
<b>Cc:</b> Tom Hochstein &lt;tom.hochstein@nxp.com&gt;; openembedded-core@l=
ists.openembedded.org<br>
<b>Subject:</b> Re: [OE-core] [PATCH] vulkan-loader: Move libvulkan.so to m=
ain package<o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal">On Mon, Oct 17, 2022 at 2:10 PM Ross Burton &lt;<a h=
ref=3D"mailto:ross.burton@arm.com">ross.burton@arm.com</a>&gt; wrote:<o:p><=
/o:p></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0i=
n 0in 0in 6.0pt;margin-left:4.8pt;margin-top:5.0pt;margin-right:0in;margin-=
bottom:5.0pt">
<p class=3D"MsoNormal">On 16 Oct 2022, at 22:43, Tom Hochstein via <a href=
=3D"https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Flist=
s.openembedded.org%2F&amp;data=3D05%7C01%7Ctom.hochstein%40nxp.com%7Cb79ae3=
0157f142e2468e08dab03b378b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C638=
016065621027269%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzI=
iLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3DldUoyzxYOQMI33k=
zqUh9CJ15MGI2n0YRf8rwKopwkJw%3D&amp;reserved=3D0" target=3D"_blank">
lists.openembedded.org</a> &lt;tom.hochstein=3D<a href=3D"mailto:nxp.com@li=
sts.openembedded.org" target=3D"_blank">nxp.com@lists.openembedded.org</a>&=
gt; wrote:<br>
&gt; <br>
&gt; Since libvulkan.so is commonly loaded dynamically, put it in the main<=
br>
&gt; package.<br>
<br>
Can you give an example?<o:p></o:p></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">I'm wondering the same, because e.g.&nbsp;&nbsp;tens=
orflow-lite.&nbsp;arm-compute-library were also trying to dlopen&nbsp;libOp=
enCL.so and we've patched them to dlopen&nbsp;libOpenCL.so.1 instead, so wh=
y should&nbsp;libvulkan.so be different.<o:p></o:p></p>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_PR3PR04MB730871C6334283026EF62346E2299PR3PR04MB7308eurp_--

