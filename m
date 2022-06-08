Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A706C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 17:41:37 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.83])
 by mx.groups.io with SMTP id smtpd.web08.394.1654710091512570670
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 10:41:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=0RKhiPs0;
 spf=permerror,
 err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}:
 invalid domain name (domain: agilent.com, ip: 40.107.243.83,
 mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E63NUtQ6T6Liax7eAcdlnwF+ZG20vYOcWrVCixK5c/ycmer3VJrMsm7agNbNZGY/0gIkfGsKnFNU3RIrbZJ2A4IfWzbhOwnC6dr7ENpTvm6iYef4oEadJzKhm0/ZSsVdURL/M0VwlodQuFrhUWxgCiXFmui+Zcr/RT+82B1IbV9vUSHf91wZLI4K6UFg6c9go79LEed/5jKAnvrfB9sVph3y9rK1Db4jDP/SsXqOklYhjkGDJIOZQu0zxP9ve6/33C+j/MHTznq36NyD580HYfVvXLhLFZ61TA5oeMHQBTb7BorPgRpSYMnU/ZpGzew7/ysi4PLK721DrbwqsaNcyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLXfo3Yw2C/0j66wzaDAZwC/1C8z9v0u2Tauigh+35Y=;
 b=K1negkrf94u5C9LB9aoDQZBf5ztFvyhAJQgr0YAJiJQIKujuJ6rqQ1NPqGAlwXxtlZ34s0/KLsZa9mHuy5QrV4f8At6peLLjXr71NSxFYVJz7u+dLpjUhCId1IYXvlxUUyFXlLZdqi70DA7Jf+YiRMrjEsnBQKd7jjHU/Yv7/M2BfuXknOaJ7jzL1SypB9HmhWvecl70EMl//iMXh13ehUY9dA72cJACu6ZZ8EBdBcIzReIQYIC32AyUqAcQTdNdbo8VO3ZWyI+AFjcMYzyoLEUp53wTn178khDg8fd01XNzOdiCHDvIq6NPehOX+nwoF0GZpT7lEaJh/+DtEdhGWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLXfo3Yw2C/0j66wzaDAZwC/1C8z9v0u2Tauigh+35Y=;
 b=0RKhiPs0KL75tVhHEJA1geubG6JTKLC3txqV7ym1vmy/Nrl9xYjg59f50r+5DCW+ZzSk9EirZsH2o+MrwdnqUh6Hnre+uQzKYB36pu6EDQRJZHspLxsFIHV1AEcTelOeobsyGFg6ReCDmR53MOOzCQuUQmXuzVMnpIBNpjtR/ehWl6g3JyljB0Em2fbluVXwIKbGXWLNC8AkN4icY7dcb0DzwtBEZ8FXQpVau+8t+u1vjhkH+oOT/tW7ABP8TkuUyVKZ9gWRFftrVzBccV/bZ5UvNsR1V6f3FvyHwbTOtO7Srfn9ys0N3nDMwGA2SfXxwrACYeOE/Xrnk5v6woZ9rw==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 BL1PR12MB5237.namprd12.prod.outlook.com (2603:10b6:208:30b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 8 Jun
 2022 17:41:29 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::7db6:3628:91df:cad3]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::7db6:3628:91df:cad3%8]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 17:41:29 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: How to use devicetree.bbclass?
Thread-Topic: How to use devicetree.bbclass?
Thread-Index: Adh7SztOnSa/Oc7uS5K+Ag6Q3y6TcwAE5OqA
Date: Wed, 8 Jun 2022 17:41:29 +0000
Message-ID: 
 <DM8PR12MB5430E0D38DFDA6F21DDD8FE78BA49@DM8PR12MB5430.namprd12.prod.outlook.com>
References: <16F6AEAD4EA350FD.31089@lists.openembedded.org>
In-Reply-To: <16F6AEAD4EA350FD.31089@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc08a63d-a1f7-4005-80f7-08da49761eb1
x-ms-traffictypediagnostic: BL1PR12MB5237:EE_
x-microsoft-antispam-prvs: 
 <BL1PR12MB5237C6349C7DAF500C2CA6C48BA49@BL1PR12MB5237.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Uos+p832fXED4/t8UIaueKZXLhkn23XT3HftDgBpJ99O30QKv+73m439ON7rqvlbLmIPNtic/JTEqoPmPGiSK9I9evEil1CsvPZL70GP+w8IhH2VwKsrfM0mP+rDnxWPOmY6X/F/aRDMJsukey335xrEr2z7sRuP0goJZUEL5vh6fZdOrEhEZzx5wlrtm4Tgeq+lovvXX9TtDwU7ikAHO2kP1kFEBlu7Z2GRYQ+Dgdw0F3pJncC9tKGX+4kCVSvwepTGqVNrXAniqDEkZyweDu8rVBJIaju7ixwTHyp+DzujHPrC/KKji7m1IanBsxDAvJwNjeBSsDAIPRYxmpF7jDF8aJ3B+K3LgNk6CPHGIaJox7cwbJNkncZSjGavhmRKL6VIDQ6P679d0hZZ9ObOmqGFz+nn6za5WRG+tv7W7+20bs4Lnlxwfgt5noXMSYDWVp3aCB2L1azDqzp5oJZ57SPhnpPMhVmqQ8hqKYnxy3zjX3U/HQfRKuf40beaTArCMbnGjrQrVLUKqtz0qUITjmk1DcpKQFZsfsrbuSy/E79dC4cIkVYrIJ9iS5rEhxxvv7ts2Ca8P8PsJV1o5UujCQeh25ZICMQ2BzezarugLtv0xMpzXa2epA8zRy0hZJze5lo7X3iE31pFpd/ZMiTKjXJ78tgdIySxXWIP7IR72LAz25j8o0ufjYLcaKENdj46TTlwt94VewgMxxhmsmwgZQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(29502001)(5660300002)(66476007)(76116006)(4744005)(66946007)(8676002)(52536014)(71200400001)(122000001)(83380400001)(66556008)(9686003)(26005)(7696005)(508600001)(6916009)(33656002)(38100700002)(64756008)(66446008)(316002)(8936002)(186003)(38070700005)(2906002)(6506007)(86362001)(55016003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?LAbOWy+0ESxbzHcz5iH5ZRLcjQnLn89SdoQwST++qrZ+CEwC9OLGeDNtql11?=
 =?us-ascii?Q?IvhL4EOWUr0d5r1bfGA7OWuFfPD++C5HvHaX37Pqb4MbwrWjvd1Xs6K3X36k?=
 =?us-ascii?Q?m2J2nxJ3Fhq9uwmVdEGjlOdK7HfvTEqW72zyu9vL6eoO4eKXIsaBhMJwMfXa?=
 =?us-ascii?Q?KSZQEjKjBRY791emFwUIZt++GYDdQrVCFVbJHkbzG/Siy2mJZZBRwwXzIsup?=
 =?us-ascii?Q?2n6J/vSY5KN3xlgfThvovZt9BQVHAX5SBBFNOOkIa6KIm40hHkhrMcm5btvC?=
 =?us-ascii?Q?ZYEKhCgAjzz5+XXRBheBeu9OjV0MyEW64dteQPw3W+jYrLRctke/doRh3M8S?=
 =?us-ascii?Q?pV8JSSgoY4rXkVV7JGg5SJWJX1AzMuot1K6TVeJFFcoWyGTDyar/T0AVE1Mj?=
 =?us-ascii?Q?7XEUnJFwGZcTrYV+LPH+NXcwdiEHKcm8yin531n7GmFvcK3vMCChsz4gq8Q5?=
 =?us-ascii?Q?QNExAFWXet5e5aCChdJhMcg7BsvSh5iCG93Fb3XBdx3ar8iozD2hx6HSj3l+?=
 =?us-ascii?Q?khA2hK+wnoNUrFCwXfG13rp/U9+3Ra9vu/AvMKyaUp8n8Dy4HT8B4QbrRD6a?=
 =?us-ascii?Q?QFy1DaIn/5itWDVr1ovP/ThWA/g4MRfScwQZrjSk/RFrlGwgFijFQ4TdcFes?=
 =?us-ascii?Q?VHt6CjHMtDpRTJy5amKup+655PNvmsElmDF1yecC8hQJVfTr6pTm84GHJ67c?=
 =?us-ascii?Q?5Qt1FGe0K35QNeXe3olOEfkvGtZqepEkC7asHGvl89BjQzoNFPIhDznN108r?=
 =?us-ascii?Q?UAhqcUblv5Uvcv1MXOYU5axeEG3lylxaOqTBz2fPUyWzBIDqgfJeCBkuIiQj?=
 =?us-ascii?Q?Ml8w1Bi9PpR+WCS2hp5BLI83fTGTCrUA3b0pz6e/bTY4ko9DbM4Av41tga4J?=
 =?us-ascii?Q?fyxEn+YyBgDDvC/wMlSeVvbMmkvKdAscFL3rMGJ4JUqr8Ly5ETj+hnpBmur0?=
 =?us-ascii?Q?NTyED7Fc0qDBge31ImkBXSQ5MXdCdyr7wXM+W45kAi9Fk2+g/1MJYd4vL0ba?=
 =?us-ascii?Q?ZK41dl+HUMvgRRhNS5CAAfANC3AcQM9wtRUJUXTbagJW50ZerhVXoSVYEIq7?=
 =?us-ascii?Q?pvnuckHjYTh3OWTO67CFMMayQ5bzGCdhBkNdsWuxKHOIqu/0CPYWNTrPSjkQ?=
 =?us-ascii?Q?Tm8aKXZ6/RAGcT2VU5dsUa5YdBxw3jGXRD/VGNCBq3Lr7zbFfRwE03aH2tV4?=
 =?us-ascii?Q?gRWt8Yhv2dBc800ImwAMRvr9sp7aJFRLw1ELNw0xpW6m3bUX1pipybXkM2nr?=
 =?us-ascii?Q?SZPd0hLIfM0tzWC4b+BwpQ+h+sFGHV9guTdVfgI+MwwX3kd0Wpbuzo8bUTnG?=
 =?us-ascii?Q?XbGLzA0IC1sOHsHUYh7/59FnjYXPEobETNAEUCR4268xat8C+wx4AnKRlciN?=
 =?us-ascii?Q?ik6cRLAIAXXeI/hd2TgZQ5GyzL/PkcdEpg8+vE3YMijmjJtuI6qgKBgE0+I6?=
 =?us-ascii?Q?aX8gDsHRyN0d552B+U3UuTxZWi4kPfpvdehtJ/X6xZNqiWaJtmLJ9Ib+BEZg?=
 =?us-ascii?Q?xy2pqZjOSBn6fP6/zQ6Q4x28GiKu/PYM3O229ozJ+H1Dz/ylalDNK4TwYAlv?=
 =?us-ascii?Q?yWk2wBB0AaXbpHM9OYAmbmK2s3PQAtebpFuybwXaBiI65VHbHqPRbrbPeow+?=
 =?us-ascii?Q?gHBMc0OWQh94MfN23KQpI63czOnVIv5+HvcUUIF1bVjVqgTHFZTifr8ZHp39?=
 =?us-ascii?Q?kQ3ZfeNWMfwba0DKc815SBGEiTD9fEYbRr25D3O00FDSduH37eRDraQ6f4BG?=
 =?us-ascii?Q?YC/zzgrPNA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM8PR12MB5430E0D38DFDA6F21DDD8FE78BA49DM8PR12MB5430namp_"
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dc08a63d-a1f7-4005-80f7-08da49761eb1
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2022 17:41:29.6108
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 CT8O2yWRsbYI1wBhh9KIOU2pkpbad2ni/rFGctWZ0SATVk6cAcE7F+bHQOlxozvqvlQTBKghDyBnuf0Qlcuk4a5yiTKzfxUlzjPxGtk8mZ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5237
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 17:41:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166754

--_000_DM8PR12MB5430E0D38DFDA6F21DDD8FE78BA49DM8PR12MB5430namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

We're using honister. We have a recipe that generates a device tree using d=
evicetree.bbclass. It doesn't do anything special:

    SRC_URI =3D file://system-top.dts
    DT_INCLUDE:append =3D " ${THISDIR}/files"
    COMPATIBLE_MACHINE:zynq =3D "zynq"
    inherit devicetree


It's unclear to me how this is actually supposed to work, however. There ar=
e no examples of using the class in poky or meta-openembedded that I can fi=
nd.

What I'm leaning towards now is creating a bbappend for the kernel recipe t=
hat just installs the generated device tree into arch/arm/boot/dts. But if =
anyone has a better way I'd be glad to hear it.

Thanks,
Chris

--_000_DM8PR12MB5430E0D38DFDA6F21DDD8FE78BA49DM8PR12MB5430namp_
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
span.EmailStyle19
	{mso-style-type:personal-reply;
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
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<p class=3D"MsoNormal">We&#8217;re using honister. We have a recipe that ge=
nerates a device tree using devicetree.bbclass. It doesn&#8217;t do anythin=
g special:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; SRC_URI =3D <a href=3D"file://sys=
tem-top.dts">file://system-top.dts</a><o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; DT_INCLUDE:append =3D &quot; ${TH=
ISDIR}/files&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; COMPATIBLE_MACHINE:zynq =3D &quot=
;zynq&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; inherit devicetree<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">It&#8217;s unclear to me how this is actually suppos=
ed to work, however. There are no examples of using the class in poky or me=
ta-openembedded that I can find.<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><br>
What I&#8217;m leaning towards now is creating a bbappend for the kernel re=
cipe that just installs the generated device tree into arch/arm/boot/dts. B=
ut if anyone has a better way I&#8217;d be glad to hear it.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Chris<o:p></o:p></p>
</div>
</body>
</html>

--_000_DM8PR12MB5430E0D38DFDA6F21DDD8FE78BA49DM8PR12MB5430namp_--

