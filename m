Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0CC6C19F28
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 20:21:40 +0000 (UTC)
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (NAM10-MW2-obe.outbound.protection.outlook.com [40.107.94.43])
 by mx.groups.io with SMTP id smtpd.web10.381.1659558087026369326
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 13:21:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=H+X8hTBD;
 spf=permerror,
 err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}:
 invalid domain name (domain: agilent.com, ip: 40.107.94.43,
 mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cJZXZ/p2uSdWrmSWOZ8N4oftqJMFRAdBMuL/NBsuUfPjdgMfccdqZBYTB1YvwQOsKTxuNafhYRRv81Qu81Rr5oRwuOPqXMJe6STOyyH1GJrw6Ngqo63Lz4KWqbmvBjbmzqfXKuPUPzcLHdvACauhYDtOzuRuzEZENEPRRoyhwDwljZpYLEqjrRs0/THxfij0BtxbX96tn9csmbWLmGKwZf14BX7Dce3MWlPZwj/IzO+IXKKlruMVaxcMW4l0qzYRhVsD4ELxpcDx8GvDg5iJI5X0qDfC7gMfngJnDmZa3a9q+yAw4SCsdNd1LKYhe0gurT5npHk1o0Xwg5BRnWZ64g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XMo5GOh3kz3ghxZ47jYGRNiF3P1GWoBdkQVYpZqVHhk=;
 b=XHGio4T2/tCKXO4boxN1xWW3xk5SRDNXGbfTNfnRxzO5Fn/9xlC82/t3qjLdoPmKZ7nRT7qSA4rZNg9k8yallTamyCH/YyAux+YC0O0GDQpXECnoxlTmZW5GD7ADTrA9pgDqmNp4mDOoHjK6JYTLZU0h3hgStOOzWDW4IgzlQI3eqC/qpqQL0Q1DTNt3Qm+kPy2TEkHUgjaPhHDgiGN37ChD31S6W0Cyn6LYZIVgy4BEpqYeb0uqsngMCOP24TV25Rf16ulnNH8V7ccY6OCPnbDcpqL3YQDpx803UKKuDmG6aXoFOrlVJeWcp1SuaN+b8q5jtuMLI1qSOqpv9KeRAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XMo5GOh3kz3ghxZ47jYGRNiF3P1GWoBdkQVYpZqVHhk=;
 b=H+X8hTBDEBF5UxW4Ylo4jh6uNFatj8a8aMW8+rTlPVDKvR+34Fr5jV0gnaVhCaPXGRuNlitqjhUu965smMrlQw+8MxUXD/aFiQdYWKVrFnduNxjKH65FYv1tX/ZJ1h3i5YXUBNIH6EHmmFLLlgc0fATAjvwaQXFZ4tNvK6SLvAf5yO5dm6BnglddYgu8rFKnm48ZQg4z4lfMr5W1paMc0OcnkE6KVZKBvUiTCtB9qRsRb1HSGj8faInX3FjQScDbo7+3RjnDvMAi9jb4isyU4/e+AWnBSn11c43eGUbsYMQgJrrtAmZBJTl6Ygn8f+HoI/jNALffgsLCNPIHQZoLww==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 PH7PR12MB6954.namprd12.prod.outlook.com (2603:10b6:510:1b7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.15; Wed, 3 Aug
 2022 20:21:21 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::a588:9ba:3cdb:7324]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::a588:9ba:3cdb:7324%3]) with mapi id 15.20.5504.014; Wed, 3 Aug 2022
 20:21:21 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: "Openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Introducing yb - a new tool for Yocto environment setup/management
Thread-Topic: Introducing yb - a new tool for Yocto environment
 setup/management
Thread-Index: AdinQOzDt2w3R+XrRs2owi5G2reWzQ==
Date: Wed, 3 Aug 2022 20:21:21 +0000
Message-ID: 
 <DM8PR12MB54305682E3F7A0E3C8D480DB8B9C9@DM8PR12MB5430.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 19be4c58-b2c1-4e38-0bb0-08da758dbacb
x-ms-traffictypediagnostic: PH7PR12MB6954:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 nYZlg5HPqnJLkrSykBwos/ov3Ucrzj8VwonRvrtkfVcSMIo/P9XkBkTqM0JvuinfP4m/6oKVH+XbPlc/CxiTIiFXA/UL9Bmf2k5qw2ad2Nbr3Am2H9stNqwD3Q8VQUBPo6PeqdWg0fbx3aZaEb2ATPAJJ0CJ8NoZDXAUcSr211emRnvRZ3kcMenTL3YaPm9Jtf590FwKS3mqHE8+PowFRcrV3miTW3043UnRfwhrKh4hGgGBgwcmvrcnO/9QO4sPJClfmk7twKS8SAREJqH2mor3L2X/v8zI5tveG75oLie9X/xDJmGpgneo1Y4mTFbJylImKV7kp/Z5LctOCHYXjWzHB02VG6VvmWTFx+ZdTy4EETVgZR1weTGOhdiqkrDyYrAsZsj22MzPafNr5mebZ9XQB6PRDXbR9SFgWiMhGzvA1rE1GwmXDLyfFVb3Dktj4rFSgdb8SIAgJ73x24f4NZRkQnK9neBOQtYZbW26C5lefvffxxNL9Z4GFRPY4x9qvzl8H8HW6NLzTWOLqV7FoNnoZgj4uAgjEx7Xf8ZX2wGv0RdeWMtNafsy1BHgqb6Fz4ea0wXV7Jv5AZq/JBygzSNHG54NNH1A/mm3c5247Czc31SiIGl6kOB7/Swbwc5WrInz6zmBIKlZVBIgdkQh+CoUOBdvlag6VJpSuJsWkCq9jLaLHO3JjaYq+Axno9eWcoMb4kXJqzQdaaSZ3fTbVJ3NkUB+mVHNdSkL+B/CB35+3ZI4PfbPjGEbmVCZVFwb8a9Js5zzk7dJB/faMdr8M4OMT8OKmlkCsUGg/67Y1PCpNs8O5WLSmJLy/u961vwZvuxzcTuDj5YIZBDxfAA6FA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(366004)(396003)(136003)(39860400002)(346002)(29502001)(6506007)(8936002)(7696005)(38100700002)(55016003)(9686003)(26005)(450100002)(76116006)(66446008)(86362001)(33656002)(64756008)(186003)(52536014)(8676002)(38070700005)(66946007)(66556008)(316002)(66476007)(71200400001)(478600001)(83380400001)(41300700001)(5660300002)(2906002)(966005)(110136005)(166002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?XIl8dkfVIFKdUYvMfJtiaGMTVnHXeaIs0BYt4wzTme8uHUAWGQ5X9IFHbr3h?=
 =?us-ascii?Q?UrwhDnI9va6WXgPB8/FyQRKhX/FgkZa19ip+mnq1Fay//z3tGMHIvuSmXp9L?=
 =?us-ascii?Q?8tP+0ZwfL7PyQIvHYL6UmBoNrVsmxXXEoOrYvyjQXKrNWvJBr36lXvJL7JD+?=
 =?us-ascii?Q?OHJgnnVsjsngKxjCnFXz8NuZhM1TTUajwm2bMg01pkXMCqBk88M5fobAY15d?=
 =?us-ascii?Q?KePtPv6R9SR6pdKtFvDq6gzyVG4nvctsO80lvLe9k3W2Jg2CeAr354u34+/3?=
 =?us-ascii?Q?lJf943rQzb2BKI6TEHOAsbzaEzf4BSjlaYbfVNpGMFlcv7V5aRlMuz/3Axwq?=
 =?us-ascii?Q?5522EuJ6REbNWWe+mtXBVlwdfsxiwsNMTv6mYH0/Hcdhn6M3oYUYSnvAFzGc?=
 =?us-ascii?Q?Y7nv7pbR/2574AdMkVu2B/DKYh7Pu39pCgBxpeOSIG6zXRqIhWEVXEniK015?=
 =?us-ascii?Q?JOuC3/TlYQ5mAXQCjHcKLDnnp+H0tqQPv6EehxYd3P4NTdEvwYPtAGpMBf1F?=
 =?us-ascii?Q?toU7OFePtanUQ94fKcknAH62FY122Wo9+ONbSf64bYHPEKunsIhAcqMR78lX?=
 =?us-ascii?Q?GJIF8f0MvRa3xDkqQrhq6R1PF48QXyfyMpf9bRISfpbPnFzltoT6wktZuTfu?=
 =?us-ascii?Q?jW9S3IEofxT6o/Ab2yxv0PIOGoKFqO89ajcxF/k3UmyhY035KuUBYllpb82R?=
 =?us-ascii?Q?+u8V7Gn7WVgWpHKtOuNHyPBNSBj7ZKyzE9ihzFAvaGfUvKf2h8i32i4Cur/F?=
 =?us-ascii?Q?sPh7vSb+WtvTYjB/1psg835U/e/SMWNIUfOURo8tgXE2cZVOEoc09ZSNx8Ak?=
 =?us-ascii?Q?ZydqPk7RCE6i3UQwbHcka1iw41+5z53Ix1EsvaKW+JS6g7PARGEYoX5U7uN6?=
 =?us-ascii?Q?6K7YGCvYVOHJu/JP3CFSH2xOxaUPqjTuQY65kot4r81CSWuelp0ca6/eBbur?=
 =?us-ascii?Q?VKaRWq3DthKIXZyy6kIpUmsrYaBxCFZnXx9Gl5AdPdgFIZqsqkQ2M9AkPYms?=
 =?us-ascii?Q?/pyuW2fdoTP60Vg4CFHPr+PK+HgoRNPUuJqRMPk/iTbrOgtiEseSFCJeBydX?=
 =?us-ascii?Q?g8VVlkbOYV/bfb4sl9iuPnaYalCGHYsamMNlMrrWk7swyVDfiCDIoWTinTb6?=
 =?us-ascii?Q?k6K24xEbsLBCMUGqcipOfUm2DFlHt1FuVYnAJAG4o6wz2uXHYzTZ/BAK3uEz?=
 =?us-ascii?Q?/Ds3wpDsyVk7EwaB5pGIYU5ItecEJXX52fbuiYJQugEvzML/lrW9GePgjPf3?=
 =?us-ascii?Q?T6vOlmVrgjRv/FGvWMdQol6KkMnBKdpVlJi6/OuCNyXsi9XUCMfC/mOm+9d8?=
 =?us-ascii?Q?975DwCDFCbYVgVyI28JXaC4/aiBrHZdsQ0VxWXN3jgbLG1Svoir/95tk3VNr?=
 =?us-ascii?Q?IlqhFyTQlFPpvLAkQd3Pb5KcTtsMgb997vmZLzreQDsRR1Jbz2DbVhO9n7oo?=
 =?us-ascii?Q?jClnvBjV/AtrjYpMfxJeSctXPeUc38SwCDBLJFL2RpmiOUQJJh91HEWyBfvQ?=
 =?us-ascii?Q?oK7nJ8vHrcnwYtnFIqkWtVv3MxxcZAm8dLHfM8qoNhq9hgdzo8yChWO/WWv8?=
 =?us-ascii?Q?50IQEVSVe1iHUZGii0G8gRSVPrP9pqZpawrEEQtP?=
Content-Type: multipart/alternative;
	boundary="_000_DM8PR12MB54305682E3F7A0E3C8D480DB8B9C9DM8PR12MB5430namp_"
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 19be4c58-b2c1-4e38-0bb0-08da758dbacb
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2022 20:21:21.0429
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 QnN3QjVJ6qMVnhoY3yGV7DlgzgwS8t9Idp0/1kSdpAWfaxcvR6EREglKpZgjMZt25tHUlxoHszrqivDxgXnRUMd6ZW55nbokXJCHy1ZC0QI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6954
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Aug 2022 20:21:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168825

--_000_DM8PR12MB54305682E3F7A0E3C8D480DB8B9C9DM8PR12MB5430namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Today I'm excited to publish a tool I've been developing internally for abo=
ut a year now. It is called 'yb', and you can think of it like a cross betw=
een kas, Google's repo, and myrepos (mr).

Project page: https://github.com/Agilent/yb
Download it here: https://github.com/Agilent/yb/releases/tag/0.0.11

The tool is written in Rust. It is statically linked, so all you need to do=
 is download the binary and put it somewhere in PATH.

The primary contribution I believe this tool makes is the ability to not on=
ly setup Yocto environments, but keep them in sync with the rest of your te=
am as your product(s) evolve. This is realized via the 'stream' mechanism -=
 a git repo that holds your specs (basically like kas' configuration files)=
. Most operations in yb automatically fetch updates to the active stream be=
fore doing anything. If you need to add or remove a layer from your build, =
just do it in the stream. Anyone using that stream will automatically get t=
he update and be informed to update their environment.

I am also very proud of the 'status' command. It works even with vanilla Yo=
cto environments (i.e. what you're using today) as long as the tool can fin=
d "bitbake" on PATH. The "status" command will automatically do a 'git fetc=
h' on each layer. When used along with streams/specs, it will also first ch=
eck for updates to the stream.

I hope you can give it a try and let me know what you find useful/broken. I=
t is still in relatively early development (in particular the 'yb sync' com=
mand) but it is already helpful for my teams' day-to-day work.

(P.S. Please forgive the multi-mailing list post)

Thanks,
Chris

--_000_DM8PR12MB54305682E3F7A0E3C8D480DB8B9C9DM8PR12MB5430namp_
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
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Today I&#8217;m excited to publish a tool I&#8217;ve=
 been developing internally for about a year now. It is called &#8216;yb&#8=
217;, and you can think of it like a cross between kas, Google&#8217;s repo=
, and myrepos (mr).<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Project page: <a href=3D"https://github.com/Agilent/=
yb">https://github.com/Agilent/yb</a><o:p></o:p></p>
<p class=3D"MsoNormal">Download it here: <a href=3D"https://github.com/Agil=
ent/yb/releases/tag/0.0.11">
https://github.com/Agilent/yb/releases/tag/0.0.11</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The tool is written in Rust. It is statically linked=
, so all you need to do is download the binary and put it somewhere in PATH=
.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The primary contribution I believe this tool makes i=
s the ability to not only setup Yocto environments, but keep them in sync w=
ith the rest of your team as your product(s) evolve. This is realized via t=
he &#8216;stream&#8217; mechanism - a git repo
 that holds your specs (basically like kas&#8217; configuration files). Mos=
t operations in yb automatically fetch updates to the active stream before =
doing anything. If you need to add or remove a layer from your build, just =
do it in the stream. Anyone using that
 stream will automatically get the update and be informed to update their e=
nvironment.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am also very proud of the &#8216;status&#8217; com=
mand. It works even with vanilla Yocto environments (i.e. what you&#8217;re=
 using today) as long as the tool can find &#8220;bitbake&#8221; on PATH. T=
he &#8220;status&#8221; command will automatically do a &#8216;git fetch&#8=
217; on each
 layer. When used along with streams/specs, it will also first check for up=
dates to the stream.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I hope you can give it a try and let me know what yo=
u find useful/broken. It is still in relatively early development (in parti=
cular the &#8216;yb sync&#8217; command) but it is already helpful for my t=
eams&#8217; day-to-day work.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">(P.S. Please forgive the multi-mailing list post) <o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Chris<o:p></o:p></p>
</div>
</body>
</html>

--_000_DM8PR12MB54305682E3F7A0E3C8D480DB8B9C9DM8PR12MB5430namp_--

