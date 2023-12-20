Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2FEBC3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 18:30:52 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.40])
 by mx.groups.io with SMTP id smtpd.web10.29104.1703097050174088981
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Dec 2023 10:30:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=sHciC2TY;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.236.40, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hLVU9W2F2Hm3ryBhqruvL85dNjVqO4CqvKcET3vNsFZzNo/SxqZHg0tWzyz1U3z509OK+aSITX7MjZ/2JEIE2ridexC2N+mocCIqjYePrD3Ii3HwEXoxyGCm5yDuMeXPosgi620FrCfRCjrlR7Y1zWD/hejS+JhKSAKRqKaF7Nj6Wnd/0i3WgXVchRuQSL0hyHgv/je+eq683FQIf48+41OG0Q6x/0mHAFP8hAKmPgtW+KoENaLPlC1ALZ9miQpsad1o4X2eaQ4uMhxCVpvpXRCL0gG7yb6OZpDD6sEIZzh0fkamgOkX8LKDXw/cMQtWWaYmQaj+tJBvjf7h0NPHUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RU3tUJgiQ0QQwgLSgL8IJihGq7HarqUpdHrMg38mkkE=;
 b=MuleRo5AXzd8i0MOxOUtR2ZifNWEUG6jyIkV3Zbz6EgdhXPTWTYm4a9V5Eabfu1hvL8RVVSvD9ImwY/8q9Tuwps1lxb+QI7OspyY9k7zjAouacgfPXMtWBcgRM5IfV0ca26g/Hu7HuFldEe6c6Kaf5+3iV8at/C+G7ft9sb4Ycy9tJD88eziApgoHCGexOHYIrKmheHwtvBgRuVtYiyWGSDtTq8vbKj/qu77GfIVeijfcl/19EbePoPT7S0UnvrnMa083VVPAlyCCwAW1wZUT4iAjdagReOeBUJM2LN+LNQhzeEB05XBNuKy4/tVZCzcs4yuxMyXJgkH6FvyvOCueg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RU3tUJgiQ0QQwgLSgL8IJihGq7HarqUpdHrMg38mkkE=;
 b=sHciC2TYVxgCQWMvkoAJxr4iqnrAMSuMx7FQth+19Ux3GDKKpKfbJ/Qpy4zZjyD2q5/eqqq2OpSxBhN793tbpBaY4/IbQUq8hwZ7EZ4o0e2+E8++Vvn9h0ThaoOXt5ONosT1ScFkgoInt8uJTT+RAMqAN9F6tsMcnyojW8f8mhrNLYwCSzfcTbOVp+ha57Vk73QrnTfA9NtfN15PYjiCPGep+jcBy+gzzEpE1jVJdLr5K/Njat0xouej9yHD+SSav72npNvvUT0naBT3ww6VdNgs89N7OBOGSPR/QLbHJNwa8rvFJt/m5dF6W+Q/MIvTRowsgv1/I2qXdTJ9yTjiSg==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 IA1PR12MB6020.namprd12.prod.outlook.com (2603:10b6:208:3d4::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.38; Wed, 20 Dec 2023 18:30:47 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::1960:79e2:3161:e4fd]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::1960:79e2:3161:e4fd%4]) with mapi id 15.20.7113.016; Wed, 20 Dec 2023
 18:30:46 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Alexander Kanavin <alex@linutronix.de>
Subject: weston/wayland: OpenGL vs GLES2
Thread-Topic: weston/wayland: OpenGL vs GLES2
Thread-Index: AdozZP5WMHobe4W9QDSDtyodXZD1XA==
Date: Wed, 20 Dec 2023 18:30:46 +0000
Message-ID: 
 <DM8PR12MB5430E9851E7C72F05623C0148B96A@DM8PR12MB5430.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ActionId=af697fdd-230f-428c-9b32-6de82fac3334;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ContentBits=0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Enabled=true;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Method=Standard;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Name=General;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SetDate=2023-12-20T16:52:33Z;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SiteId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5430:EE_|IA1PR12MB6020:EE_
x-ms-office365-filtering-correlation-id: 148afdd1-db89-4f7f-e9dc-08dc0189c8a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 0BicpK2k8pvSMsh50r/1Dm3nujcgZYdiIGvTZXfhd+QkpVCBn5uQuCjvkQNAT9bVgBPCYUzymup22+7rMG1CnjadWk3CzROS7EsURJUl7LQju86C37bCuTR+Dxxah3Byz/QwiowYcGPlOlwaZ023hzYkvj+W4Z5sktbGLyWi9gDVmlxMz3wmKr/tyL3j5Wn6v5aBJ/8lh4WrKALvXTyRZE8GyxtBCviRWalAIa03peNmZvg2xZ6FK6N0jUX3JnxbwsIFJDMP6W9Qo8VCoDtnovM7KXDU3EAncGbI66n7GN6961ZIa2qGUHUTnKN4P+Mo+23c07dkY/F4233p7Wutg+uuZURNhAraZPQsmwNwIIkxsUqlro/MLksDT/ivgD6WJrN/dKgVslXk8qpwksu9AgqylelWUuSx9aNPH2zWP9MBd3ogpj5I8jgaObGX9bi+mujn6jE+2c50Oj45TpWVcyp6yCOSaL4xd+hhADa4SBvKZFJ5DPjuFG0Y2VtHHPLiXyn4E3hHOcBiK4HhgkgUD+KwzMwVDf5QGcPSIIdj80KZ53ZN13vXl/m7FBshOMCOLmX/xXBpI6+a7mJ4hlFvnGvf63TD0uZuythtjF58hrzZ3hMeW5zV0jit2NCwagFO
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(136003)(396003)(346002)(39860400002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(122000001)(4744005)(8676002)(86362001)(52536014)(55016003)(2906002)(71200400001)(4326008)(8936002)(66946007)(5660300002)(64756008)(66446008)(66556008)(6916009)(316002)(66476007)(76116006)(38100700002)(33656002)(478600001)(9686003)(41300700001)(38070700009)(26005)(6506007)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?XJzBkS8kNcU//RxwG/YFGskmpXCN+QmKiOGfgjJJj4i7vrphaK9taNDRGbwJ?=
 =?us-ascii?Q?ZmwRev32+KmoK53OlF4Mf9IsERbr3ilnaozLvps5RDn3oo9+GKeh2dvurrr4?=
 =?us-ascii?Q?2tQOYxwYgdgntqvF7zavzn+XeyQciaggWCxjX+6t50uFXYpr8nHb4G9k62hM?=
 =?us-ascii?Q?749JtAQWVT2qWajj1AxaQbp6DdtNPEKaGYHOHMUA5FszDIjebXoLT/lMchox?=
 =?us-ascii?Q?Y/0E4afK55T8bomcs7bJ8Iq8dSRvePpmJ377URbmx4ITPxEtkeijhk2YVDOD?=
 =?us-ascii?Q?2zyX4zPfWPpN09vF8vzwRuRQHvizMVHYocRP4n9PNkUZfxRU0GWY6ZbKCxrg?=
 =?us-ascii?Q?XBpPdIKVJZotuYowKPartJwHE5hV5OxVpSiDmrVxd03JcyPFAA2Pvqddh0Rq?=
 =?us-ascii?Q?DyVOqtZA7Um6zAf/dIehktqc/WwWYspD1HRfgIik2zxi0tmJaEwdYD5acSIi?=
 =?us-ascii?Q?279YrDAidqM2s2ghUdm/PwLgyhU7AITpN0xwJO3K74LBtGjmGQ2S+3XR9ZB6?=
 =?us-ascii?Q?5UuwwhNOs7vJZPobwvOzO6dYOyq3BqvlMvXo8Orcyq7vtcCfBQFiB/ITKAEW?=
 =?us-ascii?Q?5alTkD/DCV2nl37i6NmuqvQ41GG6wlTrZW/H41f0wjaVafVjiPjHlPThyo9T?=
 =?us-ascii?Q?+n4U3FMneR2rIriHK5/S0Zy3ZwJmv5wcheq18fjFHhCt2EP3JlRkDJsICw1J?=
 =?us-ascii?Q?J5qwElu5XWVbVo0nNDpM14e0MIc7HJ9lr1iHzkwLOt0hR3def2mXkH1udcqL?=
 =?us-ascii?Q?lG003copf10DgE3XglmhAYfwa0Er27KRt2TtpcqXJ9N0vpDs30ir3me7h1pO?=
 =?us-ascii?Q?bJKIuLbGHzImWQkpCLfBNNn0F3Equ16B1yF9JYnk0Ylfp4hBGN1+QKXT9zY9?=
 =?us-ascii?Q?tyOKuB4elwFNgi4jPWtKN/ZTd5ZOnggrYkDB0JIYuPLFZbpuQ2vduwI6WfDY?=
 =?us-ascii?Q?NxIFcd/WLJcOpqc36NqU/jNxBf726oQsmVccLt21g/3hIOQdtzvg44FNzggO?=
 =?us-ascii?Q?TjU/04o6LoFPn2uOWzxC7Ecoq1MSqkweAaS8Efo8rxmP3j7mn4TlPbTyvd/D?=
 =?us-ascii?Q?8xvIDG9q5PtNKwV2Es96UavaTwEMyozg1/0W36x3V8pVtZyfMAX9AlscsQ+B?=
 =?us-ascii?Q?z1CPnoz3FbRYMgxaNP629K3EokyFOqT/LJR+BTDbBaCBjkSLtwgbaGt4jv4+?=
 =?us-ascii?Q?5VZyJIsfZdnHZHMhiONjh+ohmjbfW5HV3oI3ww7PdZggkOIBHu4QDsrPrGrS?=
 =?us-ascii?Q?hxCPFwSI5ChYhMHXOyfv07hnqpo7TvUcRs6SGyNfjPDiOh9alEm68rQSE/si?=
 =?us-ascii?Q?6nmtVUfA8J9DrYruzBXXm14A3WldgXe7PLopiN0QKubCGrMfDXWgk5KOsxQR?=
 =?us-ascii?Q?ByvV5fXJ98Xhz+jB+KStJrVJlMntD9+piQbls6u09f3ehizHMRyLYC5EQ3D0?=
 =?us-ascii?Q?yK0Qz7mb1e4xQOqcCJc8NiWJjTOYwYIfIXHuCEZxHGBGFnDLK8EJRSNWQ1er?=
 =?us-ascii?Q?BOlCEbwJLodGefXYGhNRrJD/4+ThiCpCBQIyIPJuzy30sq9kpIULjsy4OSUW?=
 =?us-ascii?Q?CFc0OQQsc/k3a8Osol7BBskh536NRYo7/kVc9u4F?=
Content-Type: multipart/alternative;
	boundary="_000_DM8PR12MB5430E9851E7C72F05623C0148B96ADM8PR12MB5430namp_"
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 148afdd1-db89-4f7f-e9dc-08dc0189c8a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2023 18:30:46.8212
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TNXF/DUYe95kVxe0lwG5Sm7+fnrgFLoEpfi2rFyZLsISCWVvysAf0SNouGqv1MYZ49XnKPhS/Iy/1n7Cufk7iUD5094kMf5TaBURXScV0D8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6020
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 18:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192809

--_000_DM8PR12MB5430E9851E7C72F05623C0148B96ADM8PR12MB5430namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Just want to check my understanding on something. It seems to me that the W=
eston having:

REQUIRED_DISTRO_FEATURES =3D "wayland opengl ${@oe.utils.conditional('VIRTU=
AL-RUNTIME_init_manager', 'systemd', 'pam', '', d)}"

...is overly restrictive because 'opengl' implies desktop OpenGL, whereas W=
eston is perfectly capable of running on gles2. At the very least, some oth=
er recipes in the system seem to conflate 'opengl' with desktop OpenGL.

For example, meta-oe/recipes-benchmark/glmark2/glmark2_git.bb.

Is my understanding correct? Am I missing something?

Thanks,
Chris

--_000_DM8PR12MB5430E9851E7C72F05623C0148B96ADM8PR12MB5430namp_
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
<p class=3D"MsoNormal">Hi all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Just want to check my understanding on something. It=
 seems to me that the Weston having:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">REQUIRED_DISTRO_FEATURES =3D &quot;wayland opengl ${=
@oe.utils.conditional('VIRTUAL-RUNTIME_init_manager', 'systemd', 'pam', '',=
 d)}&quot;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">&#8230;is overly restrictive because &#8216;opengl&#=
8217; implies desktop OpenGL, whereas Weston is perfectly capable of runnin=
g on gles2. At the very least, some other recipes in the system seem to con=
flate &#8216;opengl&#8217; with desktop OpenGL.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">For example, meta-oe/recipes-benchmark/glmark2/glmar=
k2_git.bb.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is my understanding correct? Am I missing something?=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Chris<o:p></o:p></p>
</div>
</body>
</html>

--_000_DM8PR12MB5430E9851E7C72F05623C0148B96ADM8PR12MB5430namp_--

