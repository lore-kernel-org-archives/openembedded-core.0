Return-Path: <aplanas@suse.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15030EB64DC
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 11:23:29 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.57])
 by mx.groups.io with SMTP id smtpd.web11.5211.1689074606017195820
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 04:23:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@suse.com header.s=selector1 header.b=gLRO6uRd;
 spf=none, err=SPF record not found (domain: suse.com, ip: 40.107.104.57, mailfrom: aplanas@suse.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJX7vkmHPoWCUU6vu+dpkpDWTxQ3Ck/AIuQgnw+SJq7HMbDKp9+hfE71ueFRycbzXpw+qqgNQocswHYfXva2OKC/CqHdFBthaI5x5v3HPbaXE+Gn2eWUh7NWDtbUDujK/EMrvsB8tkcHoqMBIDTrP8CWxqr0oW1GtNtTKqmK5aZqFxwDvrAwrM02ktXg0GtiLnsa1QnYZ5wI81q5Rup99MXzsPUC3GKQpkTEaLP7ICcuLVive8CSr0I0GzJT1jK+DjtC5nvxCHSaEvJFl6KL6V1s482pBFz011wP7XTP6tHSVrZEtlQdvMkcPkL3BosgSoyT5EyFCawSVqIIvy2vXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EoVYcGHYlV2OWmjftutJihdIxdx5zTUm6vaYLKZx1z0=;
 b=KpoxrEeEdvP3rmqz4bQ1mi1psXTE14JoEOekXn7n9kyaOLBZlzvRCL0EFdDidatf0uAGZON6/Xdo9Np115FM87OdXDMSK4ke/f+SkpiaI1zB8kjVGac89Iv87XX1jsCSG9sSIioWFD6AThjjCkqW+m0SHILDP/GTxrWgWhr8iiZKaLARDXx85t6kLxY5coA4SwHy2Vsp6iwo5MlSFbVgh9U8lNDQrzrFxt/7vLOMZCHTLvOLjnEuc20jaqCPoe++L9LVJy13CQkaWB2X1RGNeNv/SFTKV7knyWX0pFdfltZ2RWCHZtIRjWDH4yU4EwWfByWJSytNh+D6KM1zZa1pNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EoVYcGHYlV2OWmjftutJihdIxdx5zTUm6vaYLKZx1z0=;
 b=gLRO6uRd9udKrsmFAVILUuUaLK2W0yT9RUVbdA0VhXRUMDMjewJN1dCv55TKCJ0u54rE82D+YfUAopGbvmL3xkyjgZVemJNssrgm4eFA26TY93t+5wtHFISJeYMTlq7ezcoPWnyq7jBsWTwDPs6GYhld/u2olzgOBaqZ0NSTLXB4LZhHTrF1742zKEiheLy8RcTlbHqOuTn5Ov7nD9yPBAKsoggAgdI8VBg/2w82ZRqcfXHI/e+IYGo8A7UtJfBGJ7qblxTVf7oLvUONLrV+m9/D4p+UtiG4DO3pB3+ol+PQdQDDCdQCprFxgZtYlqtixaLpxOMM0lPX1b7BKEJujg==
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com (2603:10a6:5:2b::14) by
 AM9PR04MB7681.eurprd04.prod.outlook.com (2603:10a6:20b:286::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Tue, 11 Jul
 2023 11:23:22 +0000
Received: from DB7PR04MB4666.eurprd04.prod.outlook.com
 ([fe80::e9f4:d451:24dd:e433]) by DB7PR04MB4666.eurprd04.prod.outlook.com
 ([fe80::e9f4:d451:24dd:e433%4]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 11:23:22 +0000
From: Alberto Planas Dominguez <aplanas@suse.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Merge process?
Thread-Topic: Merge process?
Thread-Index: AQHZs+kuRtWu9E1UFUKY7mEPFkz33Q==
Date: Tue, 11 Jul 2023 11:23:22 +0000
Message-ID: 
 <DB7PR04MB4666B31ACC5187EEB96B8940C531A@DB7PR04MB4666.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4666:EE_|AM9PR04MB7681:EE_
x-ms-office365-filtering-correlation-id: 925b0572-44c7-442c-9a1b-08db82013c77
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ajDsstpKOSQXYvT8OpLXJgLNoEf/dHYIJ0Uuks8PrfbFaP/B7PnfIzqBBpYSPVh343MDrjALinX05nB4bpbuB7sFCdpamuAW/dvoP5WBugqil705fA25/VnSR9/yBlDu1yjGqlPub8OdlJVtwtEwOv2zhX53r+hR8H3ws0yBGDaSwoPuPiV+UeIsnV5Pw8oMrdnUKqeuUE5z/aPbAdGlqCD7E20PXsn7+43hFx653Uxc4Zd5dqHiALoQAxSdpLTxsZecPzfbOzSbqGavtZnz65MLZPttma7RcbCykvjRvynB0ZgHET1CKH3d2UFCWdi55q45xLwDwaJ/8XX6MJtn2bErLBBMbCOcqCqmGJdceN/o9RB9mFKr+6qVGNk2myINWWDyYsg7j6RATsm0/tsxKNbbAvSX6SD/65TbK3TpPq8paBtPBMI3r4vQJK1HW7WWPBhkm3qj0H6wPQp/SobH7coYszENW3+7M8WeiXYH+ZNx3dnqEEbwU8C00p1dgg8+WgQqdQ8+NrN6Y998Wigz8q4N4T/RYDbeiztidsC/+Z0DFcSNDu+L6h2GiHCRJJUXLZMZ2d0MHFqSZ0aNhmQRO6DL1qnpBi0MXv6w3vOJCMI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4666.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(346002)(396003)(376002)(136003)(451199021)(122000001)(71200400001)(166002)(7696005)(478600001)(7116003)(52536014)(8676002)(5660300002)(8936002)(2906002)(4744005)(86362001)(33656002)(38070700005)(6916009)(316002)(76116006)(55016003)(38100700002)(64756008)(66476007)(66556008)(66446008)(91956017)(66946007)(41300700001)(83380400001)(3480700007)(186003)(26005)(6506007)(9686003)(966005)(19627405001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?5xQKznXLeV5d5a9cgJiXLnAjkefchKR4UpDKbuWywzMG27EfPjXFOtnNbK?=
 =?iso-8859-1?Q?PH4vXiijg7fFhy4YHIfozUTygWPPuPFxsHqAS3NYXBbFPXqC1+CIjr9bPx?=
 =?iso-8859-1?Q?KAhRC4DFRO/0mwBIGWAvEqTmCz8bLnMULL2fZS+CATe58xj6VeCCj24xpd?=
 =?iso-8859-1?Q?k7CK3dYURVGVy0UlGn0mZoo0B0qeKwhk2SFF8l1jrnDZQP+zj0gEHumw3c?=
 =?iso-8859-1?Q?RtaG11L/cZHpLo+RWxw941LSv+LoxbBH0UDhQX+xyeayJ5L4Vjpb8plx77?=
 =?iso-8859-1?Q?qKXIzYkkDRPTmvEibJIj9N4ZbzdXi01dm1Eua2wuqRO2hPRuUyz50qTLxq?=
 =?iso-8859-1?Q?8T0psrgv+BlHHlbvAWw9r7eTDnDXhDb7Xx+Ec73q9MJeWgvYW1SyHKF5R6?=
 =?iso-8859-1?Q?YL8Rb21czgGPYgjpzY62kV1DWbS0rWDG5ugjWVyc7cFFFp4zpPLWyLUn6T?=
 =?iso-8859-1?Q?cVPThOmXImeaXzxBK9NcXUZxwrTCmwF/nTeDXIyjKBY0l6fbwHaoUveRBM?=
 =?iso-8859-1?Q?aUY3GgMPpH0ByVPBd8PDz6lWwjmVFiHCIbk5tnPXic1M3L/kwr7kSVyQfM?=
 =?iso-8859-1?Q?keRae31agJMjYyDaQtqIzE54bgOLVe3DbQqAqV7IRgUdlQSgZDNmUnKMfA?=
 =?iso-8859-1?Q?xKTHAikEVSsav2KXHTvwKpJw73uS1SpjQny6T5cP6QcPhOJceBqvWgbXJm?=
 =?iso-8859-1?Q?A9dWrpXJNOXSrtK9D8KcpOTYvXUh1RmT4X3WlYopSIjt+v/Fb9MhWgKcoN?=
 =?iso-8859-1?Q?s4RuMnxiRUgjenM3rJUStbc2AZijuvZy0a8mlg2lli1mPLkym5WbjlcMHo?=
 =?iso-8859-1?Q?kXJruuAPyDH+RS7ICeoSf/JUdDpbjNzoTyFGvgeBGk3hXzPmL3vKbgWI6x?=
 =?iso-8859-1?Q?isGvyQQHm1ll+9C5g2Khav1ILnlgNefVcGDTLJdza/0BQHFjw+KAycvKZ2?=
 =?iso-8859-1?Q?sDr2sU4b6g4gGaxoKBD5YVP94ozWlyQqcxw0bDIehZQiZ1j/jAi4ztI7dZ?=
 =?iso-8859-1?Q?9s6ujd0BIO45tU0L5siKVDIcg+INk4nZdlTdurTpo5c9yWG0dhD23Em50O?=
 =?iso-8859-1?Q?oApFsoKE1xYUbR61aOLA3vwr05ksR1XeSjEaGQRSWx4QW/aaKYnnVYpXd7?=
 =?iso-8859-1?Q?EpK54qxypMNWoyc9Tg+5kt4f4ot5Z8a0+NhAzBUHtozJcHfkSQOD9jcwFM?=
 =?iso-8859-1?Q?xE6lRPO/WnImsaeDXc0yQlALtXGKxlCdrA3a5cUiU2v2EWSYS7rH3uVhaK?=
 =?iso-8859-1?Q?BrPkc5iP2EHXQ0Hfqhz9qyMZU4QOJOj4D/Ag67LJOdti5v4+IVW1K0rGDr?=
 =?iso-8859-1?Q?412g0aoSV7SUkegBwIbBeExkcclGTGKVEBMamkEWa2jLYWlaPKJKbFX/xE?=
 =?iso-8859-1?Q?Qu86AZQGcMDZFsOo9L/S8XqrBweAThNgAxz7gxzDP5e/pz9R2/hzVyyaI5?=
 =?iso-8859-1?Q?2cGgKjVXHE434GFeF9z79jw0XqEG4wNyDWcViqQBTmoMdoCQO4Y4YLPYQI?=
 =?iso-8859-1?Q?tl3IYwT9OeaLqpw6Z42FjnkxlR58WHi6ZUn2hesMlHNY7Dqv8QlzDLilLq?=
 =?iso-8859-1?Q?JGYxJTj3UBnXNLBtP0hQEnMdnYgkywRjq61DBPCKqtvP+Y1+1+IM7CPFWk?=
 =?iso-8859-1?Q?qq7BxxzQmMm98=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DB7PR04MB4666B31ACC5187EEB96B8940C531ADB7PR04MB4666eurp_"
MIME-Version: 1.0
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4666.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 925b0572-44c7-442c-9a1b-08db82013c77
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2023 11:23:22.3671
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8we6nRAJoebTHa37ZAkurom2SQ5AlcZ32caKLpx2Y2YgERLsijfs2NJT5we3JDcuChBIrrHVI+VOFLVs0KqlZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7681
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 11:23:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184131

--_000_DB7PR04MB4666B31ACC5187EEB96B8940C531ADB7PR04MB4666eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

(Sorry if this is not the correct mailing list for this question)

Some time ago I submitted 2 patches here:

https://lists.openembedded.org/g/openembedded-core/message/183090<https://l=
ists.openembedded.org/g/openembedded-core/message/183090?p=3D%2C%2C%2C20%2C=
0%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2Crpm2cpio.sh%2C20%2C2%2C0%2C9961=
8665>
https://lists.openembedded.org/g/openembedded-core/message/183091<https://l=
ists.openembedded.org/g/openembedded-core/message/183091?p=3D%2C%2C%2C20%2C=
0%2C0%2C0%3A%3Arecentpostdate%2Fsticky%2C%2Crpm2cpio.sh%2C20%2C2%2C0%2C9961=
8666>

The first one was merged but the second one still is not in master (for Yoc=
to at least). Other versions of this second patch to rpm2cpio.sh has been b=
roken (and successfully detected and reported here in the mailing list), bu=
t this version should be OK (I think)

What should be the correct step to do in this case? Maybe re-send this seco=
nd patch alone, or wait a bit more time?

Thanks!

--_000_DB7PR04MB4666B31ACC5187EEB96B8940C531ADB7PR04MB4666eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
(Sorry if this is not the correct mailing list for this question)</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Some time ago I submitted 2 patches here:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<span style=3D"font-size: 12pt; color: rgb(0, 0, 0);" class=3D"ContentPaste=
d0 ContentPasted1"><a href=3D"https://lists.openembedded.org/g/openembedded=
-core/message/183090?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Arecentpostdate%2Fstic=
ky%2C%2Crpm2cpio.sh%2C20%2C2%2C0%2C99618665" class=3D"" data-loopstyle=3D"l=
inkonly">https://lists.openembedded.org/g/openembedded-core/message/183090<=
/a></span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<span style=3D"font-size: 12pt; color: rgb(0, 0, 0);" class=3D"ContentPaste=
d0 ContentPasted1"></span><a href=3D"https://lists.openembedded.org/g/opene=
mbedded-core/message/183091?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3Arecentpostdate=
%2Fsticky%2C%2Crpm2cpio.sh%2C20%2C2%2C0%2C99618666">https://lists.openembed=
ded.org/g/openembedded-core/message/183091</a></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1">
The first one was merged but the second&nbsp;one still is not in master (fo=
r Yocto at least). Other versions of this second patch to rpm2cpio.sh has b=
een broken (and successfully detected and reported here in the mailing list=
), but this version should be OK (I think)<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1">
What should be the correct step to do in this case? Maybe re-send this seco=
nd patch alone, or wait a bit more time?</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1">
Thanks!<br>
</div>
</body>
</html>

--_000_DB7PR04MB4666B31ACC5187EEB96B8940C531ADB7PR04MB4666eurp_--

