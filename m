Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72FC3E81E05
	for <webhook@archiver.kernel.org>; Fri,  6 Oct 2023 15:04:31 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.44])
 by mx.groups.io with SMTP id smtpd.web11.15244.1696604661565962252
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Oct 2023 08:04:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector1 header.b=vdC2I0+G;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.102.44, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y4oDbKTImMRc6d8xJHjAM6m+ZJui7+LXNS5n7jK28v091RgGLV98lAyTCBuJiZTwTiDAGDq/VzOzdPadUpzBUrDtkNDqw+dwxS3LFNzj6/W+I+hrCTPS2ioJLRGi+YUKMNss2omrEYRTdwDToOYNw6WunJ7m/b8muk/uSadB+0DkkFpUn9lAGhj8jvNd53VzxERru132o6+VCrLH0RhdJ3da1HhImziWQ21RVKNJrU1tIcOI3K4yhi9cDbX6Yy4Ybf58VuiadFyHjBXdPBrNeT/BzyMhwEvP+68Hx8l7LjPjZl7v0xe8K6NRUWjBwo+MvrGJlv0SSB/kJe0ACeBibw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RF2/D+pIXRyKjHFHUG5iqCWX6BWGax/0bv7sbsOaqc8=;
 b=Q+4kXWC3xgr6eG9Vilgoh3J6ySXiZu5bnLkcq7qwafjYF5YpdojR9LFQeNDp3eq60kUDe5w3p1spP0pAC2ErFm/ZEVlItRaSlCXnYSnvkgdwE0QzZ5K1oeWimeelOwLwl2gWfOIA7J+FdF0/q4fVrXglBef1xFEbQfm4amzoST1I/bMcDpD5XRAHlJW/J0mzDpVWxwKgWpkecSm38QU0Y5kje9E+Hn9u7ImOsgk6mbCkM9ZeeyvIc9mjWWRVJngf3OiNfNbRgg7OPn4Ys2Haf0+0qwEab/yregGImnbezoiJWwHyl0ebFum49RvQTcX2s+ubT0DfGRFxb885UINXOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=agilent.com; dmarc=pass action=none header.from=agilent.com;
 dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RF2/D+pIXRyKjHFHUG5iqCWX6BWGax/0bv7sbsOaqc8=;
 b=vdC2I0+GD9L2bTExlPzABmF2f68dVEpervnvFtps/NHXiwpYfJz8mius7Ix2oWhwNZZPsO9I4dkexmBfCcBZW5/LWIDZ4J02y1QgfbRkjLooXkMsoepUSRgt5uDk0segOlHsWiM5bMFRvT/f4kl0GMrI7PHoWEDJ3u6+4u88ZRo4xwNuO24tlsXx9+a25xsORMqKUyceh8ad7J5oBHqh7Z93hgA5aFcY8v8F/c0pSa7lwD6qftjbFGN//BcW6AaPMhRPqHcmlH0f5sDB1xG5LwznwCpXc3vE1RkicArw3whCEmn/el8h1XjYV+OzfIAfXx4VR1gH7XKJ/ZzTm6zgBw==
Received: from DM8PR12MB5430.namprd12.prod.outlook.com (2603:10b6:8:28::6) by
 SJ0PR12MB8140.namprd12.prod.outlook.com (2603:10b6:a03:4e3::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.38; Fri, 6 Oct 2023 15:04:18 +0000
Received: from DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::5c25:f895:7bc2:de11]) by DM8PR12MB5430.namprd12.prod.outlook.com
 ([fe80::5c25:f895:7bc2:de11%3]) with mapi id 15.20.6838.029; Fri, 6 Oct 2023
 15:04:18 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Useful for me to send more Python 3.12 patches?
Thread-Topic: Useful for me to send more Python 3.12 patches?
Thread-Index: Adn4Zjw9rsesiUQrRGu55HonyIB2SQ==
Date: Fri, 6 Oct 2023 15:04:18 +0000
Message-ID: 
 <DM8PR12MB543033AE5F5845070EBDA2EC8BC9A@DM8PR12MB5430.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ActionId=82707778-d94d-44d4-8168-ec49fa13b28a;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_ContentBits=0;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Enabled=true;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Method=Standard;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_Name=General;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SetDate=2023-10-06T14:59:57Z;MSIP_Label_8fcaca1c-04b8-40d7-944e-e72f4105afe1_SiteId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=agilent.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5430:EE_|SJ0PR12MB8140:EE_
x-ms-office365-filtering-correlation-id: bc17801b-2ce5-4cf1-a502-08dbc67d83c8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 aHIctONVmE5Gz9yG8/x9EzlYPFk6OlKT08VupZLrp0SRJIqbkVtenQ73bAj4Ge0LkPzd0pFlAcHZfexWNtGLWAf3exUE0o9QI9SQuMLbheFfu71YZ4bmp3MRdRbTDeeaR4pXQINc7pny6D0cZd8xIZ552R7j6o7Z3CaWe5/nBe2ci2gaeYKkXhmruUvB4juX2Xeo4j0qMJqSyyEHEzixyOKS/u1gL0IfJ7MrKm+a2dD5dB1DnL4TXFCB4tNaYLNbvooQKqdzciIlHTfB4p1idrDysy2f36VAJ7PjxJ0ewnHMH8TknnSc9GBXJPWOE8oA8mr44Rgwfh5sqdP/S4EU2efrq9OirqCgRSn51JKrpWBN1DrtP8pmQYgs0i5xDhRzMUAFxtrj6NmLkzxvkeaPOAR2Y5bZiwQ9kscm1863nA2qfeyT390Ai3LtZhHuuSKJo2PShqN9jtM8g36o8T8sqD37N4M+GDGfY3Heqq/qfhwSth/iRxlI6wvRSFZwtF9lTLkXcz0ZasLndaQJMushtAm/WiZzrOefvieaHD3JxQRXs3djyYv0sMSxVoIGwhpMwY9q/c9taCV1Hrbpbs95Nd1mSho2gYs7fAMV8/+zeDwmwpMYX0wAK43e9qY/tQYV
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5430.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39860400002)(396003)(376002)(366004)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(83380400001)(316002)(8676002)(8936002)(71200400001)(2906002)(7696005)(6506007)(478600001)(76116006)(66476007)(66556008)(9326002)(66946007)(66446008)(110136005)(64756008)(9686003)(26005)(55016003)(4744005)(86362001)(38070700005)(33656002)(38100700002)(122000001)(5660300002)(52536014)(41300700001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?n0XEvPn6fiHyE+LnL7pMlme5GKUoi1BMP2qsgg3qnxp4X1b4pP6lwIUXQQZ8?=
 =?us-ascii?Q?DakZsstOQY4IEzCQPLexAMr9f/EIDNi1CygLFOfcawvLVlN5/UNQ8yxNUOfj?=
 =?us-ascii?Q?AhBNNdOw34BS6OV7Ab2L02wGK5kHX5QIRxL/IetZHdD0riBtqdMmtZ7OvTTD?=
 =?us-ascii?Q?2xPcGcmGq6SaXP+D26o7nTRH5yrx3v8T4gJHfzFWLkd7C9tgEvOPEKcfqmCu?=
 =?us-ascii?Q?jS+IQ8kqOKpThDQAYSu/etwYdd25NEly4MS4aQ8Gmaiqy+8UA8L8ObWZQxjS?=
 =?us-ascii?Q?CA+nnPTHHRF/J9SpgafSx7MEqRSJMegl+eB5B257Ckh4/9V94TAJxk2Znb4e?=
 =?us-ascii?Q?c1Uk8x3dd0dDDdTVACONMODVRv3iactah4VgIimBqvIhizRZQWo/Qwo/rIZ2?=
 =?us-ascii?Q?U6sVKnbHXfLtB9H1S92Lawmp+8l95HfTnRqed0p53i1J+BmK0aA7YZLwdVgN?=
 =?us-ascii?Q?iZiJT//UukA36/px4cGrIZbkJRe4YTI7EAT2QBSJnj6TxMLxdVd3LQkc2lwZ?=
 =?us-ascii?Q?aYuXlTzqEjxV6EnFJ7M/hHQvjia1bH8Pxrq3Sb9FfmrndZbXAJnU6pLkCm2y?=
 =?us-ascii?Q?cgfiAAP7hOSfyooLAk9m/mnYQ6T/2Xs+5QmZ+NgVnESazPzdEd6FUpPMPvz9?=
 =?us-ascii?Q?V8xn3yJQVuLRgaUOh1U6NYaykVYnT4HDlu4+H3CQS8yAqAfVeD1T1qul4EUb?=
 =?us-ascii?Q?bW5kmmp3U9ild+UY5QTD3tZzeh0e1AkO6f7HmMlDV6Dh+bRI0aLrlu/Wy8TX?=
 =?us-ascii?Q?RUySj8GkpRAVSj5IBXEV2Zl9tii61BqPJvmsI4M/mdJjJSzIdolFJgF+BXWz?=
 =?us-ascii?Q?johUCsiVarRyvCxthwunkJwvjWaAl0kwTTq34ckZ8ugmgz5OeVtp+Brsd5FF?=
 =?us-ascii?Q?9wD5QGLn8uwpTrRysI1pU23zc3VZ49r9yGD9F21CmoQ6tEBaidnbIA5O9LQX?=
 =?us-ascii?Q?0OOgaQkCKShelzEES1HjDc8m6CNV49RTUZf7Ucf0+mw3sxGvBJRD0RVGljKt?=
 =?us-ascii?Q?Nnnuks4y8qGyoPhrjvjg9VL03cA0+TOl0vf4Lb8/YKtqdtn8myvG8NkwPRax?=
 =?us-ascii?Q?KHDm6brUxAHyMDRAJYN8qctOSahPRLYkwJ9mIFmHSxMf9zoACQZwF///qgPL?=
 =?us-ascii?Q?YGUFs0eQIjvHyXHCPPWSSAfOd4QNTqztWZSOczzPac24MDiMtK3o0OwiTzdR?=
 =?us-ascii?Q?P7PFGREBIoqJ3pm0HRPDhBCFHrkhq4jwlxXFkBqW0/Q4pG2vKo1yOdssJLxN?=
 =?us-ascii?Q?22pyV6tYncDe8n+qzAyz7V1Q5ijREUbSp+skkOH69udwNcr99vl6a10AjSFp?=
 =?us-ascii?Q?qwJY6GOa9DF87zYQBC96B7TjluUlpS2FvaXxo8k9IvIE9qGQDdBFGfdw8BWp?=
 =?us-ascii?Q?dInjSLqVojaZqPoCY3wx32XW1chwxuGP1zmEMKU60411fcwHdSOFjQjYgbuY?=
 =?us-ascii?Q?SCv4cxqjUUUdqsaciGIb6SBLAmVzViC1AouzaaDL+QiBYDqnfUktAgU/K5Le?=
 =?us-ascii?Q?j74gTzKN57pVvWrsyHcW1MzvuSRAdHephUtKjJvUuz+9InuS7F8fAgE4srjz?=
 =?us-ascii?Q?oL8gejdlN38r5A0B/XB/Umf0vOeZ2u2XFNQM2Uv3?=
Content-Type: multipart/alternative;
	boundary="_000_DM8PR12MB543033AE5F5845070EBDA2EC8BC9ADM8PR12MB5430namp_"
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5430.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc17801b-2ce5-4cf1-a502-08dbc67d83c8
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2023 15:04:18.6647
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ud96DMVA4P5Kwjta2/u6A+ozbb3KKjvOCxXmIw1MEyogX6gf+TRB3tahWOUxO02g5Tf61Eyjqh5ppA2yX/Wi02L0LRcjTvdW4zsf94gslz0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8140
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Oct 2023 15:04:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188774

--_000_DM8PR12MB543033AE5F5845070EBDA2EC8BC9ADM8PR12MB5430namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Richard,

Thanks for accepting my patch from a few days ago :). Just wanted to check =
if you would like me to send more Python 3.12 compatibility patches. If the=
re are bigger fish to fry I will hold off, otherwise I'm happy to help with=
 making everything compatible.

P.S. I ask because I didn't realize that Python 3.12 released on the same d=
ay as when I sent the patch. The tool I use to maintain Python envs (rye) d=
utifully updated to the latest Python version on the day I started some wor=
k on poky.

Thanks,
Chris

--_000_DM8PR12MB543033AE5F5845070EBDA2EC8BC9ADM8PR12MB5430namp_
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
<p class=3D"MsoNormal">Hi Richard,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks for accepting my patch from a few days ago :)=
. Just wanted to check if you would like me to send more Python 3.12 compat=
ibility patches. If there are bigger fish to fry I will hold off, otherwise=
 I&#8217;m happy to help with making everything
 compatible. <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">P.S. I ask because I didn&#8217;t realize that Pytho=
n 3.12 released on the same day as when I sent the patch. The tool I use to=
 maintain Python envs (rye) dutifully updated to the latest Python version =
on the day I started some work on poky.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Chris<o:p></o:p></p>
</div>
</body>
</html>

--_000_DM8PR12MB543033AE5F5845070EBDA2EC8BC9ADM8PR12MB5430namp_--

