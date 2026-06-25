Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3167CDB479
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 15:43:38 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.55])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14641.1782402209450961599
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 08:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=Jz/NpvX3;
 spf=pass (domain: ericsson.com, ip: 52.101.65.55, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rEtyTUx3RACDnma6JxuKBjhI7qsTNRCXN9SWHTwGIhwsn8PaSdBfHSQ6FkOiNhBWSlEDL7eNhYEcFagrOYiSunIcJ1RXTDv7ZGDQiyIRtfUKBceMUADjzjZcHUcKgejHrcY+1FdUJV2yEvRJGrqRMVaIw1ZiruCf+hBux1N26Yh43S3IE3zl0yNeS+h4DSSUK0LvBgPgnCUkfiTxfyWHOgGqI7X8379uVjQ6gv7qf20kqjRMvU5CL4FvDZAIlznvOUA3NnGJQmOtQkkajUBR5NQ+aiYuRJcPa524IkS/M0tlS6yNFAMhN0RnM5F10He9IlBGwd3+0AlKmKsfvxVorw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cZazs14wQQf0aw8OGvb3iU5KsVC9JgOyaa3HA3Qo/l0=;
 b=ntQLDGeIoPn30HTVtMhweIc2q+aFqvrGpb9hVTiodiR/AzHrtLTEy4eZML4UosHaizYh5RVfxJKA5yQ+PP0a68lnOzasZWd5h+WFCBQK2WqLYICrBBiqneJCJC+y1gc8DXXyKgI1ItHzDRHRbkd5aKedP5O3x8alsC/JYJ/kW1U8V6+rcX+TQUzJeo07Z4C2NjR6NvHTWOrm8jvnmtgTBWzQwNRK88r+HazBtzi2kexQyjlAUtBSjwwZSjSsOdp2jALzQQrk59sigXaNYEfjjemGwGdqsUYL/R1tfoHINml9nbVpnEtc7uFfn/Da5lMcO9N3I/tRrr8qsTKoiWRDMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cZazs14wQQf0aw8OGvb3iU5KsVC9JgOyaa3HA3Qo/l0=;
 b=Jz/NpvX3C4mZuFu2bX7ACdAYbRKdzXUMLyDrFL3Dkro837+APV6FySXSVU+Rk8NC2BSx4SXnCDVstFIXTwFO9d8Yk8vAPRRm+JQz5IuS4qC+W0GTCXr+OVw5jOKYW28rqmLXxZ/duSs8jhbDqMkgwHvtqanQsg/fCmmOyGxHsiyAp0jpdMX8kKxWoR4q+GL4M6+JALPZPRrifFTEXQ3YiljEU+6+2l2DQKUHZccgpUHu2tO79EItyCnThzbbnNfeDFZFktyU19AwNf9gC3XxPoNlUBgK09lk7I0ZNbOQAS2hUYkjVVVt7tNGfgKnp9B3fH/sXG1SWG1yow7i0une5w==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by PR3PR07MB6812.eurprd07.prod.outlook.com (2603:10a6:102:79::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Thu, 25 Jun
 2026 15:43:25 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%7]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 15:43:25 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "anders.heimer@est.tech"
	<anders.heimer@est.tech>, "qi.chen@windriver.com" <qi.chen@windriver.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 2/3] systemd: upgrade to 261
Thread-Topic: [PATCH 2/3] systemd: upgrade to 261
Thread-Index: AQHdBKh8qpSGMSqasEqKNBU1HbkVvLZPZsaAgAAB1mU=
Date: Thu, 25 Jun 2026 15:43:25 +0000
Message-ID: 
 <PA3PR07MB10721D0B5720F489999AF31FE8AEC2@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: <20260625134210.4046622-1-daniel.turull@ericsson.com>
 <20260625134210.4046622-3-daniel.turull@ericsson.com>
 <CANNYZj-YEH6Nbk5A+ste7RNa0MyATwFZHO91Q1iC-+Qaf50JYA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-YEH6Nbk5A+ste7RNa0MyATwFZHO91Q1iC-+Qaf50JYA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|PR3PR07MB6812:EE_
x-ms-office365-filtering-correlation-id: 0e6b2cf1-0b56-43a4-f505-08ded2d07ece
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|10070799003|38070700021|11063799006|56012099006|4143699003|22082099003|18002099003|8096899003|3023799007;
x-microsoft-antispam-message-info: 
 dy/ytVKWf0T2HZoM1/R32GHfRSYobqTUkKQodTffRYyE3euMu8JWek1SPGSYc8n8lAcHQKsUZDCXz1zC55SosruZAZHJ3n1yVnQS3WZsvY+CtfvGVAd0sREo2RqnANSbL2K6EfCnQX9E7lBDjB6E0CgoAkuwWaekefzq283N79bgYyh9U/gGyn1OkekfOR/rPb0EEBHNGXYOxOwO2bs4o/q7oOyGissz8w97zrK6194RaEcJCwk4PaZAIegWhw6jV5YGh7In3ulFX/p4v/BH4YrrOMAa1vY+Ml3QiItiWc+jZK1AGkAT2EI/+UctqNOv9g4YgKOlj8/X2JXgxMYYfa9V5+KYnhNECm+MJjX/JCAlP6OXEK+1ISa8cFVQb+JL+reT4Jx6m2lbp0hkf4+LJDH2u5wVGogaHgHRDhGpyGpoczXGKiWS7XzPyTQTrlqarLb6oi4TK6Hv8WoRIZHRl3W9wHK+HCuzzYDgD2F3TrTBwshiEvOU8BMzcfJCHrfpEGkK2rpxtyG6g09nkHkSfgJWQSqB22+PVXA9mQpGk90Ei9/XJXoubiXxfRv55a5X61LVP7ngTf5ElAqhZobT0tbyGOeEfecAaKfrp5KJIVQ1FlkWKGOHT09u/NTkwdELmRCxga0OjqLO26KddzX3d7zRbOXxQpqVGQbSkgP1YJo3NDypYylBjL//gpl29+Cn4LiNI/7O4ZkUVvYKjL7jESt6wQ5xmI9hy3uZGwZyTgY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10070799003)(38070700021)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003)(8096899003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?GIxtG6xaJlZfkMZclo++TiQVLd8btEBYdusYScx89n2kujoK65RDru/5?=
 =?Windows-1252?Q?WWeiibxVtMgDpEC5YpYvxViF/ExymKAhs9+R+62DtHohWaOtxKmbBi2y?=
 =?Windows-1252?Q?H1Po2WreNSQSmQ+PsYKC9GL7Pe+wYUw6nfQo+Y4xcStCy5vyo4APkmBo?=
 =?Windows-1252?Q?8eYCkknNKUDSm2Dz5alVNeaC54PrtINdZzHgQxSQOrTwlstoZFn+U4e6?=
 =?Windows-1252?Q?tXZcR34U/JYh0NFpLqWIRhgRF98b0QAkaEBe0nw7a4VVEz1rwZnOMPuF?=
 =?Windows-1252?Q?thRpERFqkyDIppcKyVBkYQWG+sZRGk+rur/JJN5HBqatEWTu3QGEL2Uk?=
 =?Windows-1252?Q?CqLkeDyIAZ2bdVIdNKtLInO5EBaSA5le4n15SuL2DFCVssHs/jwOtZRF?=
 =?Windows-1252?Q?nKUg+6JHmhNrCy7Qj9hVX0mLZXHa8dBvz+A7c2ntmbSWVnQLGJPYGzue?=
 =?Windows-1252?Q?ZWcd08ku/alh5pNRJQyq9c9xkolmSJH5KOB3p87xWCTPNhYRThb3ggEZ?=
 =?Windows-1252?Q?7xl6jNxWY2KlUvgd0IOA4cuB3ur1Mo6EKteFwIDP2LZocaUbzNcORJCr?=
 =?Windows-1252?Q?j2/9BrCtWKdcFpliSjELdSD5fbFRAthh52UbMzhiQauFGzpnm+5I1Qb+?=
 =?Windows-1252?Q?AGddUGF2+wdpHeTATQ3FdCoEa0tFHNE25VP/HBJ+/Aa8ngiqcfU8foU8?=
 =?Windows-1252?Q?bJfW2wFi0j8vPiZXBNrI9GMdslmunNTUmhkOuZaA6hi25iEcx38ZkQez?=
 =?Windows-1252?Q?lFI+HqfZUT4TPbplJw9GT6x12jPEb789hPsKEPJjeV/DlGLOuudr4NIP?=
 =?Windows-1252?Q?VC6b2t5lCHYYchtxoDFmstvPFqhV9BJ7oqLSltt27R0hIQYK5RVr4VFl?=
 =?Windows-1252?Q?jPKSiKx1f6sslLZkz6etu7U3OPUA2oSEhoXfpu6y2IK/BSq4Q/tnjnd4?=
 =?Windows-1252?Q?WzETOjL+Vi5Dmw/n5S9zT4G80HDV1Ixb97PyZ/mcGbo4aHDNJ7w0HlyB?=
 =?Windows-1252?Q?I/AZWNo6RpCro4xhKxFaksmE/B27lg4891kLQEb7APufWV0XnYBAEICv?=
 =?Windows-1252?Q?orbnKd2qITmB2I8jPLP6gujwOCyWG09kr09Lu7hrR1QiS+AaWWmSEKDO?=
 =?Windows-1252?Q?HQyY4hjK9vKZePwKc/iOyGdvx/Mi8YtQWYjcFzMKnInpGUw+CcJN07t5?=
 =?Windows-1252?Q?X2Pv1Dz6AO0/EwgndmbD0UdRODYR/5KEFZ0pzCollPrc4cGDVEeW+8Iq?=
 =?Windows-1252?Q?0cY7Hcq1JdkxAhySePSoZk8slJABU86Q6A/lxDMEXXub8o28jiT0e0W9?=
 =?Windows-1252?Q?ZzjMEi5Q7Br3rFlmbdBC9FwAeMSnYIjCaVSCr4+mpRGVn8/cIRFrsj9g?=
 =?Windows-1252?Q?2yiuDIl3RmmoXARGsM84DBdedj6XlqMODyvhJDH0u4IN5psC5xHu3ROd?=
 =?Windows-1252?Q?ravij8nHPBC2IesqfQznxfcPvV90ujD9xAc2l7BGkFZSqfR7dj3V2XbZ?=
 =?Windows-1252?Q?98krhgJj3E1sBARaxx5ffptmJPwhBxTx4HWytyHtZ4AYfCA2iC3DSyrQ?=
 =?Windows-1252?Q?IghCC3nCuS+StgQWkvef1kWZOdhlGLm36n73rFaGaCGXZ0oGRc8IDxYq?=
 =?Windows-1252?Q?U4mxnquV8aQ0DcBbm8n7jNd9Wy3jBlUJ599Gspujn4+Z/7tv7RqIbMz6?=
 =?Windows-1252?Q?3/ygBpzgqP+AtxdTBz3EVAjZtoiizLn4mUvm1tbIYMifGs5OhYSsbcSx?=
 =?Windows-1252?Q?blBEQoJg4llvtfGoyGGi5acrwWV51jvOhkpdZ3T2zcXEkeh2EHvAc3Ur?=
 =?Windows-1252?Q?tLCxuZ69s4pcWLViqh/2EF4x4pUaEwVQ1rO2A2xM9f5EGl5iRp96ElHw?=
 =?Windows-1252?Q?IzHG9wquaP9nFYBTpw1e4sZE+YtMfXaTFBjfI3klwuiaZgPxci64239h?=
 =?Windows-1252?Q?TFUOWsHY?=
x-ms-exchange-antispam-messagedata-1: 
 FuPuOM4KbZXFytnDJLh53vvVCXZE9LwsC+EuETpuliy0cOF1uqMceL+o
Content-Type: multipart/alternative;
	boundary="_000_PA3PR07MB10721D0B5720F489999AF31FE8AEC2PA3PR07MB10721eu_"
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e6b2cf1-0b56-43a4-f505-08ded2d07ece
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2026 15:43:25.5294
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5rXo3bqIIzSS40sQinR5CbM3CrPY+RcvAr3OjwE9xsmXldqSSWlX5/6JeLdxanZsdm2Lfk9fPdVYDWRDBUag7egMrdG1apK57aqi6M37hHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB6812
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 15:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239579

--_000_PA3PR07MB10721D0B5720F489999AF31FE8AEC2PA3PR07MB10721eu_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Ok,
I=92ll restore it in a v2. I assumed that since it was building and working=
 fine it was not needed. I was not aware of the verification.

Best regards
Daniel
________________________________
From: Alexander Kanavin <alex.kanavin@gmail.com>
Sent: Thursday, June 25, 2026 5:34 PM
To: Daniel Turull <daniel.turull@ericsson.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; anders.heimer@est.tech <anders.heimer@est.tech>; qi.chen@wind=
river.com <qi.chen@windriver.com>; richard.purdie@linuxfoundation.org <rich=
ard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 2/3] systemd: upgrade to 261

On Thu, 25 Jun 2026 at 15:42, <daniel.turull@ericsson.com> wrote:
> - Drop redundant tag=3D from SRC_URI (SRCREV already pins the commit)
> AI-Generated: Claude-opus-4.6
> -SRC_URI =3D "git://github.com/systemd/systemd.git;protocol=3Dhttps;branc=
h=3D${SRCBRANCH};tag=3Dv${PV}"
> +SRC_URI =3D "git://github.com/systemd/systemd.git;protocol=3Dhttps;branc=
h=3D${SRCBRANCH}"

I can only assume AI is using outdated knowledge in what tag=3D is used
for, and you didn't double check that. Please restore it. It's used to
verify that SRCREV matches the tag, and the recipe isn't accidentally
(or deliberately) fetching a random unrelated commit.

Alex

--_000_PA3PR07MB10721D0B5720F489999AF31FE8AEC2PA3PR07MB10721eu_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
</head>
<body>
<div style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robot=
o, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Ok,</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
I=92ll restore it in a v2. I assumed that since it was building and working=
 fine it was not needed. I was not aware of the verification.</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
Best regards</div>
<div dir=3D"ltr" style=3D"font-family: Aptos, Aptos_MSFontService, -apple-s=
ystem, Roboto, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0,=
 0, 0);">
Daniel</div>
<div id=3D"mail-editor-reference-message-container" class=3D"ms-outlook-mob=
ile-reference-message">
<div id=3D"mail-editor-reference-message-container">
<hr style=3D"display: inline-block; width: 98%;">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family: Calibri, =
sans-serif;"><b>From:</b>&nbsp;Alexander Kanavin &lt;alex.kanavin@gmail.com=
&gt;<br>
<b>Sent:</b>&nbsp;Thursday, June 25, 2026 5:34 PM<br>
<b>To:</b>&nbsp;Daniel Turull &lt;daniel.turull@ericsson.com&gt;<br>
<b>Cc:</b>&nbsp;openembedded-core@lists.openembedded.org &lt;openembedded-c=
ore@lists.openembedded.org&gt;; anders.heimer@est.tech &lt;anders.heimer@es=
t.tech&gt;; qi.chen@windriver.com &lt;qi.chen@windriver.com&gt;; richard.pu=
rdie@linuxfoundation.org &lt;richard.purdie@linuxfoundation.org&gt;<br>
<b>Subject:</b>&nbsp;Re: [PATCH 2/3] systemd: upgrade to 261</span>
<div style=3D"font-family: Calibri, sans-serif;">&nbsp;</div>
</div>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<div class=3D"PlainText" style=3D"font-size: 11pt;">On Thu, 25 Jun 2026 at =
15:42, &lt;daniel.turull@ericsson.com&gt; wrote:<br>
&gt; - Drop redundant tag=3D from SRC_URI (SRCREV already pins the commit)<=
br>
&gt; AI-Generated: Claude-opus-4.6<br>
&gt; -SRC_URI =3D &quot;git://github.com/systemd/systemd.git;protocol=3Dhtt=
ps;branch=3D${SRCBRANCH};tag=3Dv${PV}&quot;<br>
&gt; +SRC_URI =3D &quot;git://github.com/systemd/systemd.git;protocol=3Dhtt=
ps;branch=3D${SRCBRANCH}&quot;<br>
<br>
I can only assume AI is using outdated knowledge in what tag=3D is used<br>
for, and you didn't double check that. Please restore it. It's used to<br>
verify that SRCREV matches the tag, and the recipe isn't accidentally<br>
(or deliberately) fetching a random unrelated commit.<br>
<br>
Alex<br>
</div>
</div>
</div>
</body>
</html>

--_000_PA3PR07MB10721D0B5720F489999AF31FE8AEC2PA3PR07MB10721eu_--

