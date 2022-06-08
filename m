Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 688CAC433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Jun 2022 15:26:19 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.40])
 by mx.groups.io with SMTP id smtpd.web08.7932.1654701971473816120
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jun 2022 08:26:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=bU5k20dM;
 spf=permerror,
 err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}:
 invalid domain name (domain: agilent.com, ip: 40.107.244.40,
 mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B+aWRNkOF6RlR1PhmYQt7Qk7fdR8JOdKkUCNUQxrEeRT77UjDLAIzEBdoLj/EX2Q+wzrGK67YwO7n+Vh7tMcksJR48fxcMTnPa9hba8lcim3kEyi3jIj87sujDWjVSaEXDPSsJPeldMwMrQZQvj5GnlH0lFwNH5j2ImW54KGbOWPj6NdPnxgmOMxW0SyJ8PGgwPphMqWAKWXLpPmRYBTcK90Z5/S49d1jUttXD0Uet6iUcOuWb6VA0Er3ED4z5d1gzftgjZKK/nYiILhtUmFfnl23qQTcrvxrThpDs9Ac8n4Tv5088/0nmUWEn/11RNUi5zp3FBoboKfz+ut7l7ASg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FL3gqH/5EEcO2Ovg4ywOWyALJ6v/TuBDMaxWiRI2y6k=;
 b=LrPgjykKPr+8V5I1LwzqK1MnWjdsTTxo/BuNnH8anw7L0HhuQIhn338PfIj2hZeu6V63GZkTo434HV1HOdiXv+PHM3O0v8/01SiuSNiixP1/AZtaXLXtfDiyFmYq0OW6dP6KePDEFMRhkIRV87TCmUAqlxk0XFpEWAmbSO3VZ7mQMX1+oeNdWqxfBvERDMzTfzeWITec6QlX8qZ3LKXVpfaWFa7jQzRoVCwVnhUT0BNMZKjzjUIEekaaaPTbNoMoP4Qo+5ImXHBddgdvkzTnMm+7oAbNND9vonZawjZazCWMaQzehY+O5O3YLQLlf031PSCxJ4flC+KIrZ2lcD4TEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FL3gqH/5EEcO2Ovg4ywOWyALJ6v/TuBDMaxWiRI2y6k=;
 b=bU5k20dMZB6aj2NVeE0eEAPoLPXJcU32khmLQwvOYipi4GcoN3LXlpgyvrvUNWiKcH9ocn1FPjTcIwKsxNWSJkGTAGdQJ2qPDp8HacH/GO9AcbT7/y44HC21X/FFD3pP1Hud+/rggPEW8EIHJrDpra66XdEQWxswIEwrOXiMSpY/O4l+7L8GEskRmujVH+2UWLgSZawh0QCT9S2OxMYo5MP3pMHz+3EQGnlKo6ORmkrPe8per/zCEGMsq6HxvKbk13zz+tuBQ4yRd4BujnrBSzRWF+IodH/VNNbRawDBF2ZOBg7GJ7xd4g90BJytyrSlbkjkFNTFGgHCezWxzEJF9g==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 BN9PR12MB5242.namprd12.prod.outlook.com (2603:10b6:408:11f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Wed, 8 Jun
 2022 15:26:08 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::7db6:3628:91df:cad3]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::7db6:3628:91df:cad3%8]) with mapi id 15.20.5314.019; Wed, 8 Jun 2022
 15:26:08 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: How to use devicetree.bbclass?
Thread-Topic: How to use devicetree.bbclass?
Thread-Index: Adh7SztOnSa/Oc7uS5K+Ag6Q3y6Tcw==
Date: Wed, 8 Jun 2022 15:26:08 +0000
Message-ID: 
 <DM8PR12MB5430CEFBDE0D73FA46EDDE728BA49@DM8PR12MB5430.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25e09e81-387c-42c9-017c-08da4963365a
x-ms-traffictypediagnostic: BN9PR12MB5242:EE_
x-microsoft-antispam-prvs: 
 <BN9PR12MB5242B4F31BED74EB5D91B6308BA49@BN9PR12MB5242.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ohDhvG5NEP/pRFvS8YgPzPpVv3jldqo3SIVRaeU1dv2oMtercng9CEpCqN4tns2t2K5X/99oXfJvHnG8huPqRIMb7gjjb6nhmYfZUfuyGK7iKBX5aknasJFOvSnggU75FPD8PzFz+VvgbRJmlaOwveIMi/swKChqPGFfXaZ6oeb89GdrqMRNWj6oFYR1b22iMZSrVR4IKRgMa5Z452KfsIVjkGGSHkIEdp8dNEQqX5FQoWTiQ3j7sPvSjdmRZmUDOBUD39QjMJmqJd3nKZ0mB0HEOsJHG0KzwPpTmzH0OEIo/m57I+gqHapnZG8hXx54LV9lchcHAJAZ9hm00g4l4Mzl3tCmpsBWND8n/CuFR6UkWF+z5C2UdP1MX4JRvb0Rml7tK1gPKctngTIxmlWh5C14shRiH0aP+I6QjQgGgea7nx69X0LIetiedhFMakbEwWVHAYWK9iRCo8ZnOwEMXYJYfHoFiRro2QJ0Oee31YVlxgGtoD0CcSp1NOcszIy2o6HFfgkKXcWw6p02RkLffhuT6evm3cn06uNsjM6flus34c5OXzWqXwWjh8fiuUn2Y20KjN1VaW3x4qwUTpHrvB0rH44f97RgFQdikVhjW2qurFJ6J86EGiTnAy4qPWl2Ic+NMjGNaJ8oSsdU+VKjsbEkZXa4nTvRo6P11bbmkNb/Lv5H/0E6Bub7+MI+KdnyMgJsVigpvjssCMIkr6hWsw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(29502001)(26005)(55016003)(2906002)(38100700002)(6916009)(122000001)(33656002)(6506007)(9686003)(316002)(86362001)(8936002)(38070700005)(71200400001)(7696005)(66476007)(66446008)(8676002)(66946007)(64756008)(76116006)(186003)(508600001)(9326002)(52536014)(66556008)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?I6w7LKNWGBaY44CmdNzjpInPDfwSg0KnLgyLPsyNBeewyzqYDP30pqRY+cwB?=
 =?us-ascii?Q?IQ8yJDYiMKspxGIuynePuHVwvD07YBDW+iDQEJM9njVN/ytFJ7htJU74he7f?=
 =?us-ascii?Q?+8MlEXAkpOCtw/USX5x02gojdnyyVUPpCw2o/Ilv+XiSxPlmdSgmBaXZxKIg?=
 =?us-ascii?Q?QTm7MPaAqmSPmmGEElxjtWsRx3kOwow/SaHWkDB+5M8t2+BrCVs/NB5bKMqn?=
 =?us-ascii?Q?sERq7ykMwFE6VKsJ55TkmHwt1MQYmbjbGByDS5oHkIcozgJtqNK8mzDrv1z0?=
 =?us-ascii?Q?3ju5yBasBr297Gz7tCeUFCC1My8cn3HgKp0oYA1TILe6ypZ1aEiCSvmRV99i?=
 =?us-ascii?Q?SJncoT8VxYidea0ZSKRy/kxQv3Wz3dryN0sm8M0lXIbtwkrM20N5i6y4++y6?=
 =?us-ascii?Q?h3TUuHfDAT4q75j1jVuMdkyEotALNDOjLK6X3l1KujwsAZXFYs1W6W0NSt/U?=
 =?us-ascii?Q?sBZMyxmFOKjLj9TS1HSuTRna3nGFVJuvEvvu1cSF2jsQNjYsc7iK5Z5CZJWm?=
 =?us-ascii?Q?KDESmzpAzUebxcMPhBwWsZWCiTxNSkglb6z5vmT5HvI1RAB/vH14MLgXHna8?=
 =?us-ascii?Q?3ik6DJKy+qxDmZ3vbDtOQHNIdfUuhPHsmYIcgHaSkZtdZVryJnS8uuO9fCt7?=
 =?us-ascii?Q?Ib5rQwdrP4vXs/uA6vsyn5Ruh/M9vq3KluGn2HOibvI36hCF2B6J1dg+o6vD?=
 =?us-ascii?Q?3BsEOtmlPjL6n+SsnPF5vtyFRTbUgLEng3jyb8DR3YKo25S8mAoF4Nme1yyt?=
 =?us-ascii?Q?i6F5HV85WntxRSheKSbascj6s4YhnOxvw3Q3X4nXli7RK7EFKgUPo1vjTqZi?=
 =?us-ascii?Q?4rtWDeaIewDM/UcMlDLcWbb6g/pumXv1TQcLuO/LcQedhwS7aylL0WNx/NSj?=
 =?us-ascii?Q?zcJ2xCQM1SkMUsW9odOqkaZLNHYGfaQSSxMa09tvFFj0GxU+7hNp9Ju70fNi?=
 =?us-ascii?Q?kQO9i3FS/bBBpOZJjAcWCmpX5w15qGc+o2zpXyofum7fZxMwR17BSS1jBIL6?=
 =?us-ascii?Q?0UsbJZ3wh78dvNLi3T2RIyzRKMBoZDVqvBog5zdwqOfoUsSXEcRmUiF2fr8e?=
 =?us-ascii?Q?VjXoSKIr0dujp6Lz3wFyhta6J9BZwoz1MApKhQsUwfJy1IpEpnLUzjxt5MuY?=
 =?us-ascii?Q?rhVQwJAvK74NGGav4KTrY3kb/bt7c58PvcbX5L8nkoT6/qCkp8zTeC9oODCf?=
 =?us-ascii?Q?gYfQzu47UsSSKm3TbNXzFsQRHqMiMhtT23fn5xUmG3aQnfyAHy2vF2n+48IU?=
 =?us-ascii?Q?3gzQdqincD8qmwr05QVrDtpFtruSfR8Ekd0t6w5hH5TAc0vTw80IN4y8VrQl?=
 =?us-ascii?Q?audbfObMNWq2hzSwtcLw8NZASqa9T14esyis7ItQdPnqwSFyMkdFP5Yuopzm?=
 =?us-ascii?Q?1Ttnjs2+gl4yWD3e4EQKJY8/CgpdOxjtUXNCwpa19q9dQEdU2xLIyYrI62im?=
 =?us-ascii?Q?f6+YU7J1xjQlWxyJlbr37K2x3N1492P03nSjXSkdizWPLJQJn13ihMu7wUV+?=
 =?us-ascii?Q?XhACMM8u0aAagN1e9Z/7wzwjdX2+0j0nYFEPQWwHrWljUkV2+7L4V45YZy9G?=
 =?us-ascii?Q?jP7LvDBDGUP7xa/ZyQ4fn09f4m22JV1E4DMYkrm2LsnFdQlwsK8DEYgh+cwd?=
 =?us-ascii?Q?cwxdRwk61QDKran2QXlbzcnt5Xxk3Zm3aT8i2Cf/5ssx0EPDF4QyCsvBUNF9?=
 =?us-ascii?Q?gA1AUaJXv25VM5FwLibDV3rlnS7cFRzX0LlplpfwsQcLLJLQhDoR3yrJVh5C?=
 =?us-ascii?Q?lD19cHK996KYzPS7uRCMTVdNJTYW0WE=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DM8PR12MB5430CEFBDE0D73FA46EDDE728BA49DM8PR12MB5430namp_"
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 25e09e81-387c-42c9-017c-08da4963365a
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2022 15:26:08.8179
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 k8Y9/Q6BlGrgix/Rf61n+i1HiOZ8le/J+um509x++bZdU999QQ7bd2M8tXVovdftccFdsIRVNnhG4jfUS0v+BQdLEfRtAWDjsZvz2vtZeVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5242
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jun 2022 15:26:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166753

--_000_DM8PR12MB5430CEFBDE0D73FA46EDDE728BA49DM8PR12MB5430namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

We're using honister. We have a recipe that generates a device tree using d=
evicetree.bbclass. It doesn't do anything special:

    SRC_URI =3D file://system-top.dts
    DT_INCLUDE:append =3D " ${THISDIR}/files"
    COMPATIBLE_MACHINE:zynq =3D "zynq"
    inherit devicetree


It's unclear to me how this is actually supposed to work, however. There ar=
e no examples of using the class in poky or meta-openembedded that I can fi=
nd.

In my MACHINE conf, I tried to set:

    KERNEL_DEVICETREE =3D "system-top.dtb"

but then Yocto thinks you're talking about a system-top.dtb that lives in t=
he kernel source arch/arm/boot/dtb.

I see in kernel-fitimage.bbclass there is something to do with EXTERNAL_KER=
NEL_DEVICETREE, but as far as I can tell that has to do with packaging the =
dtb as part of the fitimage. Which maybe is what I want? But then how do I =
tell Yocto not to bundle the dtb with the kernel?

It is a shame that there is no documentation in the kernel dev manual about=
 how to deal with device trees. I'd offer to write it, but then of course f=
irst I'd need to understand what I'm doing :(


Thanks,
Chris

--_000_DM8PR12MB5430CEFBDE0D73FA46EDDE728BA49DM8PR12MB5430namp_
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
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
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
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In my MACHINE conf, I tried to set:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; KERNEL_DEVICETREE =3D &quot;syste=
m-top.dtb&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">but then Yocto thinks you&#8217;re talking about a s=
ystem-top.dtb that lives in the kernel source arch/arm/boot/dtb.<o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I see in kernel-fitimage.bbclass there is something =
to do with EXTERNAL_KERNEL_DEVICETREE, but as far as I can tell that has to=
 do with packaging the dtb as part of the fitimage. Which maybe is what I w=
ant? But then how do I tell Yocto
 not to bundle the dtb with the kernel?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">It is a shame that there is no documentation in the =
kernel dev manual about how to deal with device trees. I&#8217;d offer to w=
rite it, but then of course first I&#8217;d need to understand what I&#8217=
;m doing :(<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Chris<o:p></o:p></p>
</div>
</body>
</html>

--_000_DM8PR12MB5430CEFBDE0D73FA46EDDE728BA49DM8PR12MB5430namp_--

