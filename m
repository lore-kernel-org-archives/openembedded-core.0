Return-Path: <gustavo.nihei@espressif.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A57C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 13:01:29 +0000 (UTC)
Received: from OS8PR02CU002.outbound.protection.outlook.com (OS8PR02CU002.outbound.protection.outlook.com [40.107.75.102])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8443.1784552482926518665
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 06:01:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@espressifsystems.onmicrosoft.com header.s=selector1-espressifsystems-onmicrosoft-com header.b=YQmZamqD;
 spf=pass (domain: espressif.com, ip: 40.107.75.102, mailfrom: gustavo.nihei@espressif.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HXiuLPWEO5/gR9duZPOEjd6B5A/On9+8ZnpzQGlYo1Yfr0XdlJ21xN+ePaz2Y1ZPozBpxjfuLlEbyc3karzo5JugL2oMuHOT4vKGSyjgnIIKEUbEhvWmLF7LIvXlU7P42YSkPceqvGyb41YF8YxKEbScGXYe8Qc3R0xR0cTdbfVbOe0UKyPWOcRWiyKowoo6GG0ZSdZFj6vFlgAgJUF/p7LrAgWsnXOuNQUPzhpuDeppfRXRHBQ71HVg5hx15rhGiB1kTgzK50LuP/cc6WPTfHiXYtTm2HhZz7BHPakZgEygQZQYAmMFbUpSMyz0vY9m1Q52EVKFKL2x1J81wwzkLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bOyJStHGXzoQoTqT0nsT5Qt6aPr5qFdLvYLFFIpzwes=;
 b=CGLDsmFpiINEthxvkW+2f7vbLM45GIuzmf0v6qd+l8JwOK+SJUq4H6qge3xuvBJAp2rYm8Y03mZOFhO79Pk5DWkBegZ26jIZJMAtdyD7rDU1o5D2a5TfzClfkbS5VDIODwBhkPS+y4Lwi67JeEZRN1aiyWlaIGXqMOxsj/qeellJ1CasqTDJ5P/3LVc7rRWokArSHku3S9ORr0hiL0/GrLaA61itw/vC9PsEyRD4LMU5hLLI5j7P3z5ZttIWbGSzQOlua3q+YkHVYXIJwlZMSkB/3kDxaaY902wtbRNY0kxLVJ6eVD4VZbOaJsCY/YANFko6EB1znKcq3U6cbi8Deg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=espressif.com; dmarc=pass action=none
 header.from=espressif.com; dkim=pass header.d=espressif.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=espressifsystems.onmicrosoft.com;
 s=selector1-espressifsystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOyJStHGXzoQoTqT0nsT5Qt6aPr5qFdLvYLFFIpzwes=;
 b=YQmZamqDM4C/9Eq2nVFpJ2E3q5DIKunZbiPo6/b6qAgqvyB7acAP92pTrxiEo5gWCEBgKFkP3XspySURztV1PDESVc533Acl2Bxb+XTW0NLkqfV1MfahhOHS1YtvLnExakb4aqHyNcC1kCPeincS5YTZ6d/WIpKoMBE8EBVKcYA=
Received: from PUZPR04MB5419.apcprd04.prod.outlook.com (2603:1096:301:bb::12)
 by KUYPR04MB9510.apcprd04.prod.outlook.com (2603:1096:d10:9c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Mon, 20 Jul
 2026 13:01:15 +0000
Received: from PUZPR04MB5419.apcprd04.prod.outlook.com
 ([fe80::af90:4b51:a7c:3d9e]) by PUZPR04MB5419.apcprd04.prod.outlook.com
 ([fe80::af90:4b51:a7c:3d9e%5]) with mapi id 15.21.0245.009; Mon, 20 Jul 2026
 13:01:15 +0000
From: Gustavo Nihei <gustavo.nihei@espressif.com>
To: Paul Barker <paul@pbarker.dev>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yoann.congal@smile.fr"
	<yoann.congal@smile.fr>
Subject: Re: [OE-core][wrynose 10/17] u-boot: re-enable RISC-V compressed (c)
 ISA extension
Thread-Topic: [OE-core][wrynose 10/17] u-boot: re-enable RISC-V compressed (c)
 ISA extension
Thread-Index: AQHdFpLvJ+EGKHwckESr2uHH/S2327Z2Cz8AgABHI7GAAAFHgIAADZso
Date: Mon, 20 Jul 2026 13:01:15 +0000
Message-ID: 
 <PUZPR04MB5419441342F9C4A473713EE0EBC32@PUZPR04MB5419.apcprd04.prod.outlook.com>
References: <cover.1784364567.git.yoann.congal@smile.fr>
 <c643e2d8af772182167a4ee2a65d5bcdc469934f.1784364567.git.yoann.congal@smile.fr>
 <342a1c637da6f078150b43045fdd48c5ae7a7a98.camel@pbarker.dev>
 <PUZPR04MB54191B12EAA85D1C673596A6EBC32@PUZPR04MB5419.apcprd04.prod.outlook.com>
 <DK3DX9DMRUHU.MCMI4U96CEPJ@smile.fr>
In-Reply-To: <DK3DX9DMRUHU.MCMI4U96CEPJ@smile.fr>
Accept-Language: en-US, pt-BR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=espressif.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR04MB5419:EE_|KUYPR04MB9510:EE_
x-ms-office365-filtering-correlation-id: 8d0ef473-eb7a-498a-6873-08dee65efb87
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|23010399003|1800799024|10070799003|376014|10067099003|8096899003|56012099006|5023799004|4143699003|13003099007|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 
 siTwBVUqoARyjamur/XX5G7XiuS3gMtds73jkrvCfcKchEmB/8YtIo21yG4N7v+OKzCIMQLPYCr4o8S7oynS0eftRQfWn0rRAtqKT4ZdMmXQrmdawpGZmSW/9OQ8NRlf6ym71cRUkb3NzxdgJ7Fj2xegAf/l6BE/j55uUK9j3kULsnK5ICF4jSFmY/l2n2lA0spQjsPqPmObxPRGG8FcHWjQaxjZ3EhOEoP6WwCmBKWDfZAlDTVrk50N7T6ajjLr+uGinbhWyKYSBTYPG4n7OqH1/TW0lJ9wnVtACWrLigSzY2SBop+CQ0zSvb/DZoat9hMDShhAPJZVByqGi37fFfm1I1ZvlUZXEQ1+5mpkJ3cS2gQ4NNBXDaZavDQNzSixP6KQOU6W1gKLD3N4K7R5Cjl00t68WPgyX+yTiAOls8tO8f1yLr3B8wp6Pn2hdYJMw7D3MudfQecGFR3aa027XkF3XGKwXygDxeTPgzF1UGWNChl8SUEhuiougeRFSbdlYzQ3C3atNhfAb3vwFERaj8uJDNFCey4yu6Ki0lLBCItnhVY3rv63TvwSfsRzfrOoZR5jiGU1JzhIz2Y+XIIJABW/aHKTkeAIFa3sjMG/UY4RXqKQNdvN9Mdgznr0DdT6u1UgAHSnPJqL4IRkRSDvpEduAHK190oDQTHw0OGQ0Ns=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR04MB5419.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(10070799003)(376014)(10067099003)(8096899003)(56012099006)(5023799004)(4143699003)(13003099007)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?YN/Z8oLmGBXrjlm43qrbMXsEu3P5rvTa12kGikr/jpzoPCANLRy0A76kj2FO?=
 =?us-ascii?Q?23582EBIqOFg54aBheRfXRztktCY86l48c7Iv4bymcrEzB5EK8fX8PCnlsLv?=
 =?us-ascii?Q?9/w28FRUeQlI9nhcytsiiq1tr3Uymmv5Zh6m9cK0/qiXf5Hq+ZIEIDh3GKSd?=
 =?us-ascii?Q?HjBl/dZFqOXILY0KppHBiAaK02gPdc/U3Ml+9U7H+t+3KgqxxfHLV1ZpA2n0?=
 =?us-ascii?Q?dYHixI1Wh67SiF0zxNiDiNzjBSQk8ZM8lxz7oWUc5OeWOVm9tiI+SXSZeAJe?=
 =?us-ascii?Q?cWYPPtnW6TCmBXLKSoPvrxIhBFQKsp6oLYlgMhtQKgVK4DvJ9Mmo4FexSqcp?=
 =?us-ascii?Q?dT+aNThKxDS8yXfV0UG604C90w3fLrGfnVOSjtVcBcsT9P9hwskOUyk7akBI?=
 =?us-ascii?Q?jiWwJwPoYETBvbQsZnSI3GZPORURn5vXTXW6juFMZw+xsqzwNNzic00Oahvw?=
 =?us-ascii?Q?rXcvhmoibnI7/wg44UPdXVj7oGmuePqqDPytfDMSLyMExpuL00J2VWGMbNkM?=
 =?us-ascii?Q?021rH4styhfbKD5PKMkkIsuRTSM99eE85EJMqLly2RYkyajiXu3tMMXKGd3C?=
 =?us-ascii?Q?pIjyMCckGD0DmSZND0Tn+KohQpxdVl5sHyBylTjGMuQyCxRojkT/wLgWVAzU?=
 =?us-ascii?Q?u70tzKK1DNGpF2NMQC+X5h5pQTXEv91auAm24cWDIYDQuDEqlMcJnackMJX+?=
 =?us-ascii?Q?xNhsTgxmFq5Bj3hHnYFlt8Hhi89gaaTjMZrNp2Mm8+KdHeWuxVbR64O+IZKg?=
 =?us-ascii?Q?NVK1P7GKUbyF99RC6zdJYf53Ip/K3U0P71wrz4chHLb0pn1zgNfL+epGkthR?=
 =?us-ascii?Q?XUvC4IhH95mBwfgE9ayniRB9Nji+rFO2tHUg8KKKvj5suO1ef+xExahEDu9H?=
 =?us-ascii?Q?dqh5RjEXYOA9CxyJtax3x+v8ys6ZDJDEiJL9P5pL5KthMhVQtQ05CdTUvBuh?=
 =?us-ascii?Q?9m01K7AbWsFLVqcnJRCnbdtfyRn5sp86wbB5F9O613hzjguBZNhL6MbZXdok?=
 =?us-ascii?Q?MWZsLvumWNQoQrL1ueQMTtz0I1XR/hvyVYi5LszKilM287UAKdwwUKIjLGHw?=
 =?us-ascii?Q?0GqtP/LbLUz6B/HdqfBO45YTDa+9wkhYuzULhhoMSioMw1Og62xsDIEOFLCL?=
 =?us-ascii?Q?cMPo8KnnprF8+t1LPJ3c54vnec3YU4oO8aA2xy/f0rRcVd/mYBtPwpGtHiNI?=
 =?us-ascii?Q?9dcQfYYgdziwpVk5EnTwXDy4GEpzHWcJfsuBp1NTYqNrfaK65o5HTt4aM1RG?=
 =?us-ascii?Q?jJh1Enj/oBncr7UGdpNd9nKwsIF8HCr50qyy1DKeIIUZO+TgzK5lCCuoDCfU?=
 =?us-ascii?Q?3CVvupwP8A2AxaTtAF+e1HCCqT0egMOL4wbF1bDUrQ8w3BiAr6BknfUPaumd?=
 =?us-ascii?Q?AuoR6GTwkaC7Y5dj5mkrF4IQzZRLm6y49kU8VG+b7FvHINzpQ7ynPCr0U9tM?=
 =?us-ascii?Q?0Z/TwPNtOcnjvF8dtOln8NjIFRtXNrHOy9+X+wqLGVecOiJ+3QoYhBVw74xI?=
 =?us-ascii?Q?dOhLA4V7jmuf45Bi0gFTEjLi9PLoRhqmcAV+qHptrLWra4bIKnegxM7qmbPz?=
 =?us-ascii?Q?7JdIUHhzLi13eNKrx5BUtw4jUgIWd7pKTVsi0wu7dertXVKDAmeewevHXEGD?=
 =?us-ascii?Q?zLp8aGZAeafgrXZYI60tN619Yu4uCE/Frj/XrHDjPZRjlOppjOsnS0vYRwlK?=
 =?us-ascii?Q?8l1qkYmLtmKgIzfAVi7F0XTEB2hqDFuu9t4QADacAoPrmdJcBN8E7OUMCGoI?=
 =?us-ascii?Q?s0RJuB0KVtLOglQPL92/+HnztM7cG3XQww35zl1H+oTLQnOKF0TUtPawTdXX?=
x-ms-exchange-antispam-messagedata-1: Cyv5bycM80kAmg==
Content-Type: multipart/alternative;
	boundary="_000_PUZPR04MB5419441342F9C4A473713EE0EBC32PUZPR04MB5419apcp_"
MIME-Version: 1.0
X-OriginatorOrg: espressif.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR04MB5419.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d0ef473-eb7a-498a-6873-08dee65efb87
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2026 13:01:15.4238
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5faf27fd-3557-4294-9545-8ea74a409f39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RG5j4id1PjAWmHl/6G0o6whu6BefqOIkV7HxLf4CaugB1fRU6CeMv/VK0AwA/dArdZACNsUIbqNJBidVqZedNAZ6w2SWbmbN2/BguvJC0UQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUYPR04MB9510
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 13:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241395

--_000_PUZPR04MB5419441342F9C4A473713EE0EBC32PUZPR04MB5419apcp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Thanks for the quick feedback.
I've just sent a v2 patch: https://lists.openembedded.org/g/openembedded-co=
re/message/241393

Best regards,
Gustavo.
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Yoann Congal via lists.openembedded.org <yoann.=
congal=3Dsmile.fr@lists.openembedded.org>
Sent: Monday, July 20, 2026 09:07
To: Gustavo Nihei <gustavo.nihei@espressif.com>; Paul Barker <paul@pbarker.=
dev>; openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org>
Subject: Re: [OE-core][wrynose 10/17] u-boot: re-enable RISC-V compressed (=
c) ISA extension

[External: This email originated outside Espressif]

On Mon Jul 20, 2026 at 2:05 PM CEST, Gustavo Nihei wrote:
> You're right, that was my mistake.
> Should I send a v2 of this backport with the corrected "Fixes:" tag?

Yes, please, send a v2 for wrynose :)

> The already-merged master commit (fef027f2350c) carries the same wrong ta=
g.
> Let me know if you'd like a follow-up fixup there too, or if it's fine to=
 leave as-is.

We won't be able to change the commit in master so nothing to do there.

>
> Best regards,
> Gustavo.
> ________________________________
> From: Paul Barker <paul@pbarker.dev>
> Sent: Monday, July 20, 2026 04:48
> To: yoann.congal@smile.fr <yoann.congal@smile.fr>; openembedded-core@list=
s.openembedded.org <openembedded-core@lists.openembedded.org>
> Cc: Gustavo Nihei <gustavo.nihei@espressif.com>
> Subject: Re: [OE-core][wrynose 10/17] u-boot: re-enable RISC-V compressed=
 (c) ISA extension
>
> [You don't often get email from paul@pbarker.dev. Learn why this is impor=
tant at https://aka.ms/LearnAboutSenderIdentification ]
>
> [External: This email originated outside Espressif]


--
Yoann Congal
Smile ECS


--_000_PUZPR04MB5419441342F9C4A473713EE0EBC32PUZPR04MB5419apcp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks for the quick feedback.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I've just sent a v2 patch: <a href=3D"https://lists.openembedded.org/g/open=
embedded-core/message/241393">
https://lists.openembedded.org/g/openembedded-core/message/241393</a></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Best regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Gustavo.</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Yoann Congal via lists.openembedded.org &lt;yoann.congal=3Dsmile.fr@=
lists.openembedded.org&gt;<br>
<b>Sent:</b> Monday, July 20, 2026 09:07<br>
<b>To:</b> Gustavo Nihei &lt;gustavo.nihei@espressif.com&gt;; Paul Barker &=
lt;paul@pbarker.dev&gt;; openembedded-core@lists.openembedded.org &lt;opene=
mbedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][wrynose 10/17] u-boot: re-enable RISC-V compr=
essed (c) ISA extension</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">[External: This email originated outside Espressif=
]<br>
<br>
On Mon Jul 20, 2026 at 2:05 PM CEST, Gustavo Nihei wrote:<br>
&gt; You're right, that was my mistake.<br>
&gt; Should I send a v2 of this backport with the corrected &quot;Fixes:&qu=
ot; tag?<br>
<br>
Yes, please, send a v2 for wrynose :)<br>
<br>
&gt; The already-merged master commit (fef027f2350c) carries the same wrong=
 tag.<br>
&gt; Let me know if you'd like a follow-up fixup there too, or if it's fine=
 to leave as-is.<br>
<br>
We won't be able to change the commit in master so nothing to do there.<br>
<br>
&gt;<br>
&gt; Best regards,<br>
&gt; Gustavo.<br>
&gt; ________________________________<br>
&gt; From: Paul Barker &lt;paul@pbarker.dev&gt;<br>
&gt; Sent: Monday, July 20, 2026 04:48<br>
&gt; To: yoann.congal@smile.fr &lt;yoann.congal@smile.fr&gt;; openembedded-=
core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt=
;<br>
&gt; Cc: Gustavo Nihei &lt;gustavo.nihei@espressif.com&gt;<br>
&gt; Subject: Re: [OE-core][wrynose 10/17] u-boot: re-enable RISC-V compres=
sed (c) ISA extension<br>
&gt;<br>
&gt; [You don't often get email from paul@pbarker.dev. Learn why this is im=
portant at
<a href=3D"https://aka.ms/LearnAboutSenderIdentification">https://aka.ms/Le=
arnAboutSenderIdentification</a> ]<br>
&gt;<br>
&gt; [External: This email originated outside Espressif]<br>
<br>
<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_PUZPR04MB5419441342F9C4A473713EE0EBC32PUZPR04MB5419apcp_--

