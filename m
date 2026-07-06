Return-Path: <gustavo.nihei@espressif.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8434C44500
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 19:03:54 +0000 (UTC)
Received: from TYDPR03CU002.outbound.protection.outlook.com (TYDPR03CU002.outbound.protection.outlook.com [52.101.127.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.157624.1783364630416767617
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jul 2026 12:03:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@espressifsystems.onmicrosoft.com header.s=selector1-espressifsystems-onmicrosoft-com header.b=kwcIDJHY;
 spf=pass (domain: espressif.com, ip: 52.101.127.73, mailfrom: gustavo.nihei@espressif.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VWvPTzYrzEeHGAhIMqS/GpZ2RP+MOjG1L7TiyqoRQvioTcWP9CVuNWljXAKw1ISfAw0rg6lRt1fI/6PAVz7L8mOO1XhC3ydPu5uLQUgft+IqY55uf+fb3ANwlOO7GLUghJmqbUqnppcDqZ5ejN8aEqQaaBfxtHTtV6rYg97OqtZPPNcNaRuJ7e+eWKMGFAkJRDz9mNvpl5igBMkat0COXy4mPrbGqF6yN2khmleG0VHo8B6S4/I/8Gl8yQ/csWJbb0RFKjr3gYJs+Q4UTgc6n1qnvB2v2EiWubAWqJ2GJEgy36Be5OmGh+Nf819RVOVbu6E8sh5gtGx1Gqy9xsKcpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N2hrjLhrp3DVgxSkIP+XrZ0wq0FTYxD4kRc/SZdNmvo=;
 b=FxTU6cqWT+qrqNconBcj+lQxwPeB4d0GpIG9UiH2BH1oWxYMfHbnPj2lfkYVP/wyi8h3XxydG8XuMgTfUy8XoUPO6vsCFfS3R9Vqihltaxnud0dOKLmBA7GWQFrLDChtbyAL/Cf/t3jbt5S5JcG4lFv0T563vX84yXFahPIwO01pb31XTe7thvAIIF07w9J/ZiWvSwMxn9W+yKjPiVTOHPBhIxiih4kyI5DLV0ShJievujSHVNa4VBhTIq+uJe0lZ701g/fbisQjBBfU00r5NranvuaEIWfUqjRP5YgBfTG94JCmAVpsri8vmhLLWpeBV8RRLOPukV6FnL7VbFVQww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=espressif.com; dmarc=pass action=none
 header.from=espressif.com; dkim=pass header.d=espressif.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=espressifsystems.onmicrosoft.com;
 s=selector1-espressifsystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N2hrjLhrp3DVgxSkIP+XrZ0wq0FTYxD4kRc/SZdNmvo=;
 b=kwcIDJHY1pFAs+yt6dk+Wmk4Y9rmteBufHKJtCsjFKyIdVCs3y2mbwbdtEPRXBqP4k3kz9XK444ZnmmV3bQhFNXcHH9iOzlgx3ldra/jysoBpM3vpeR6fw+beLGernRQd78GxhnCr35c669bELZ42xnNOMCucgpNzVl7kHUjHtc=
Received: from PUZPR04MB5419.apcprd04.prod.outlook.com (2603:1096:301:bb::12)
 by TY0PR04MB6472.apcprd04.prod.outlook.com (2603:1096:400:272::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 19:03:42 +0000
Received: from PUZPR04MB5419.apcprd04.prod.outlook.com
 ([fe80::af90:4b51:a7c:3d9e]) by PUZPR04MB5419.apcprd04.prod.outlook.com
 ([fe80::af90:4b51:a7c:3d9e%5]) with mapi id 15.21.0202.007; Mon, 6 Jul 2026
 19:03:42 +0000
From: Gustavo Nihei <gustavo.nihei@espressif.com>
To: Yoann Congal <yoann.congal@smile.fr>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [wrynose] Backport request: opensbi ELFFLAGS fix
Thread-Topic: [wrynose] Backport request: opensbi ELFFLAGS fix
Thread-Index: AQHdDXkINwO7dpOpO0+c/x0U3JksGQ==
Date: Mon, 6 Jul 2026 19:03:42 +0000
Message-ID: 
 <PUZPR04MB5419066CE4B576BF812F3F23EBF12@PUZPR04MB5419.apcprd04.prod.outlook.com>
Accept-Language: en-US, pt-BR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=espressif.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR04MB5419:EE_|TY0PR04MB6472:EE_
x-ms-office365-filtering-correlation-id: 6cba9254-7475-44f4-3917-08dedb914c19
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|23010399003|366016|10070799003|376014|13003099007|38070700021|3023799007|56012099006|18002099003|8096899003;
x-microsoft-antispam-message-info: 
 GU1Kz1T8WQoxhLmJl4dg7L/vLZbDPFrLR4uxR5pTDeIdOhCn4+v6c/S8MkQ6L3CF+DRkrjh/X8RAM8GILG9pOCC7jVLbesYKmtqJ+qoi1j9xuFCWziCSEKvT8JSnh0hnHIOaK8QWuE4ycvP9YnBHQvbPIPQAwauiKd2UJH2ykccjLO73qR9Cg1UvskFfb7il+N9FtPxoHwciUC0+9mPs1jcHiCgtSkaDYCju2ZIs0HLn3keMtSY3viNjuTl3B/C5RF9iFZUcaoKRhw8tW/1aCPBJiePm6jLWoxgwrAieVRBURzu+ssH6dmwCiYxMbFT12nnWu2OkAh8w1MZNWz8J888Md7jCeDZIAAHPMSeETY8Vp+CkYM+i5n/EAaaiCmxSvb+y7NW5v+TulxYH0HoUX6W82Axoot5s2a/C0UTzdaoMeuw9hwEn2f36CBjmKyO5wT/qy5P+CYYwY8lb8kt40X1SNdgknzj2aTv78Epgx3XLxf3bEdslLjFw7dgdD22SpMeOCmPPgrvDl44PdcNsTU70gPcW9nk9sawrLzUbuR7Isz6Ue712i4/UBo7wJeA6SSGlGQzfUb+6EBecJU3wfRWz+y8KAfW4aP4a5T6Z8gm7KoaJDRX9AoQ+AImK4M+dyT2Lk4ZSPUYWf76EIiU+DQr9Dl3JZ7wB97haC/Mo290=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR04MB5419.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(10070799003)(376014)(13003099007)(38070700021)(3023799007)(56012099006)(18002099003)(8096899003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?BodwQ/Jw+VCxg6JyhPuUSajxuOmEgqzhuiUiBQXm5AWpw8ThDERr+ZgQgA?=
 =?iso-8859-1?Q?70QCjdQDBjZEW02NnjyF+7tRTMDbqFfSOwFuj9EHQhVRhpHkyTdslY1Cfz?=
 =?iso-8859-1?Q?j/sV6vofAbaxzQX51Z39kIUwtsmEEWl1KFxr3JkAYkYfuafXgR7/UT+wqr?=
 =?iso-8859-1?Q?WSDmTJU28WvMXJy8dH78cxo2/5pOAcjhX/z88YajwbfAVgMiu4Ihw4fpZz?=
 =?iso-8859-1?Q?i/6uRlPvvxvaj0xzCHv2Lx/vmHXZdmqcnr81VIEzbIXyFwjKj9WqmJaUzD?=
 =?iso-8859-1?Q?UaVoX+tlNRuAMNfoYHLk94tDCcSK519RmU+zpPUZA9josOGxR6JoulzYnR?=
 =?iso-8859-1?Q?Sa1EPozJr9LnrKPzkbC2qEQeeBXy5JBVwIsBIV9BBMnO8ePYk5FaZkcrkD?=
 =?iso-8859-1?Q?wf9ZGKjX1ONEWFooWatBE7JUwZeIPYHLUKmgckOBI+rJPUB9crrruMHPzO?=
 =?iso-8859-1?Q?Ynfg2XNkj76Dh6kZy7U9rxBbiE0AJY1XZ0MLG9Ig4yUpIln0Im5ZKtKDW2?=
 =?iso-8859-1?Q?ur8fFM6pcX9xDGLeLL7dWwap53iDzqfigQdHtfqCyN7wpG+rkiegupuHij?=
 =?iso-8859-1?Q?j5dKYAstYfuA+nuTCpIUbVJY/q074Yw1GLAmDLzItXqeQIn8SyZIGKswwy?=
 =?iso-8859-1?Q?nXeiTxNJ01R/ApKsaHQKc7CF3Lumkm3lBYR5/ItOVrnYluEK91nUzz2dCl?=
 =?iso-8859-1?Q?mbdBl0bIwGffnTccgiGZvH/WFKMx/Op9iT2azqIPcJKgP2RzCyB7kXos0V?=
 =?iso-8859-1?Q?C0Wjh/vQUojWU85wDu/PhPs0D9zlrrPVfGaudYaGaMGAwTW68aQfSPPfxz?=
 =?iso-8859-1?Q?61SnxgpFOoL8G+Fnzc2QgLCoYeniGmbce6WZzho9xoecEzS/3wg+bj9lGP?=
 =?iso-8859-1?Q?4KDtALEenGS0u/nKTWuRTruXNZB/NGaONise0hjzyHpKX9cmPl8vuZ2Erj?=
 =?iso-8859-1?Q?mO1E5K4DhPLsr/KqzbuzHYJ2oOevMy8q+7LN96rw1w9J2Uep20ezQqcyLr?=
 =?iso-8859-1?Q?q9drl8UBZkoGZRXuWeWdKeezqB5y4eFXALEXvbd1jJ+Qqgks1Sljo3dewz?=
 =?iso-8859-1?Q?S/pcxSPUB7ccp1f4zrBZKm/U1Jlk/MtqbkH10F8XuliiVovFvgYARLVO9k?=
 =?iso-8859-1?Q?Seim2Fw5IuI92XoQoYrUnEd7tkCr88kw6lNK0Y0n+x7MvOnchFiw59bOYE?=
 =?iso-8859-1?Q?S2k82b77cS3lb1NGW60Zb5Q91nzy4bQYKpANSZsn0RleL94QUJN+GgQ2um?=
 =?iso-8859-1?Q?eM4knvz1CVSzSdABRv4YJ6RID6QYvzSX0offl6fmsZ2/UTUOYtvWnQ3iHJ?=
 =?iso-8859-1?Q?x5FYHMll67rkeYTffVeHlNnFN2vNtnFJh5tFon/pHxHBF+yInNg+0M8TPm?=
 =?iso-8859-1?Q?KTH01W1stkgvsZ3JjWTkSjkuXvqFHvUczmkpHGshefnNmkHX/VTlLArEtK?=
 =?iso-8859-1?Q?ObL4aRMgtNQw/kW2uqFpECfwJMzVXZNOlfQ+1CPA/IO4DYHxd9P6CfHZw9?=
 =?iso-8859-1?Q?gI+HbYLHQ9b36nFXd3fDH6aSUQfY6bihVC8YixUa34PRLkMiIjCY+hB1bg?=
 =?iso-8859-1?Q?Rym5HZiQaMTsXyk47oguQj1UH/T6X+8bhSwNdIClI5k3kFpEUpH7k9+cua?=
 =?iso-8859-1?Q?IgmUapP8we0o4/Nrz594cPsdQc7uamCrlzlkgMbzaRsNIsT/OB9edxGuBP?=
 =?iso-8859-1?Q?3w6Nh9tiAMb2E+8AYSnwufJ/5lo8Tcdc/j3DqY/rOf6ZGsB+yhgdW1HHRU?=
 =?iso-8859-1?Q?o7jGil90qrf8wT3SIwO9j4zAUvjA1/xfsOxVJ11VIdhCUE1fjJWkwFtMVK?=
 =?iso-8859-1?Q?hWOlBSI22B9jyQJrP4gclFcLGF/1S9LKTaaVheDJm1a7Jj/IkxSA3T5h4D?=
 =?iso-8859-1?Q?ps?=
x-ms-exchange-antispam-messagedata-1: SEE0pK8NLjGpIg==
Content-Type: multipart/alternative;
	boundary="_000_PUZPR04MB5419066CE4B576BF812F3F23EBF12PUZPR04MB5419apcp_"
MIME-Version: 1.0
X-OriginatorOrg: espressif.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR04MB5419.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cba9254-7475-44f4-3917-08dedb914c19
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2026 19:03:42.6584
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5faf27fd-3557-4294-9545-8ea74a409f39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jeaid5NaK94vCZBvSy5O6qrVwwWkUYZhWL1MFYAyS19Dei9KfcwNOiwMvCMo/D0kVuousaZUX4NGmjgsni0x6gKMcek55814ZFG1tj96cWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR04MB6472
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jul 2026 19:03:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240339

--_000_PUZPR04MB5419066CE4B576BF812F3F23EBF12PUZPR04MB5419apcp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Please consider backporting the following master commit to the wrynose stab=
le branch:

  9bf56df6decf3b0a07e5a0814f4ad2d6317568f9
  "opensbi: don't override ELFFLAGS, silence ldflags QA for bare-metal ELFs=
"
  https://git.openembedded.org/openembedded-core/commit/?id=3D9bf56df6decf3=
b0a07e5a0814f4ad2d6317568f9

It fixes opensbi_1.8.1.bb clobbering OpenSBI's mandatory firmware link flag=
s (notably -Wl,--gc-sections), which bloats the firmware and drops the M-mo=
de hardening. wrynose ships the same opensbi_1.8.1.bb and the commit cherry=
-picks cleanly.

Target stable branch: wrynose

Thanks,
Gustavo

--_000_PUZPR04MB5419066CE4B576BF812F3F23EBF12PUZPR04MB5419apcp_
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
Please consider backporting the following master commit to the wrynose stab=
le branch:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; 9bf56df6decf3b0a07e5a0814f4ad2d6317568f9</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &quot;opensbi: don't override ELFFLAGS, silence ldflags QA for bare-=
metal ELFs&quot;</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; <a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=
=3D9bf56df6decf3b0a07e5a0814f4ad2d6317568f9">
https://git.openembedded.org/openembedded-core/commit/?id=3D9bf56df6decf3b0=
a07e5a0814f4ad2d6317568f9</a></div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
It fixes opensbi_1.8.1.bb clobbering OpenSBI's mandatory firmware link flag=
s (notably -Wl,--gc-sections), which bloats the firmware and drops the M-mo=
de hardening. wrynose ships the same opensbi_1.8.1.bb and the commit cherry=
-picks cleanly.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Target stable branch: wrynose</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Gustavo</div>
</body>
</html>

--_000_PUZPR04MB5419066CE4B576BF812F3F23EBF12PUZPR04MB5419apcp_--

