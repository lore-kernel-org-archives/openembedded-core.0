Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF8AFA0C5E
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 08:57:48 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13889.1776240958754505550
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 01:15:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@est.tech header.s=selector1 header.b=WYjCohIw;
 spf=pass (domain: est.tech, ip: 52.101.70.11, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jSGHpndmmMbxMkgjpUXUSrnTPOCK3WXw+LlIiK1CtQhufMoJ3tPg2DNjqDgnDK+j8F0StpoCsjCkw8YJCwnnwKU8+sI27eTU0DhJAJTxatLVV0R/5SFBaFnmDjFkvpD6yXPdP73La/n8LFMzM7eWPtFQ8TAwvigrlc/On18YTOonP+3fFHfBapWsIcVqzJbVWCIEVXxArn+nSBMhFDJbstpJq+P4zZksomwX80G06yzehbIdHAxeCRuvY/it93eFvcMnu8t4sEiNzHO01rIwDe7leY/YNNbn2uL9HZQj4QY0RWA6P66fpZJIglEd04QKG6/u0gPDggX3ajF6Ai2d+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S2Pc+ZEpDEgvSnEZTZ1CneKfYKf/g8lg/Hu9sJAJwvs=;
 b=I0j6TwbqHQJ7NrRjZQ7k8XInZ8rWQ9Sbu7w6x38XCydcVJHK66kp3HhiJRJjcw8cX644/wT/YxGtKhntxFaxdpdpMQM6iwdeMOe6HwSKpYiFAH5fh2tz2MeXTFP1wG+KQFPVZrlKVgnMoD2RTiHaKBoNsO+IrODqs48zabOSEjDj2/KjGeTyCK1OUW7dkiSPrawfmk3cOLzeCVCpkmS2mD70rqXII2lsC5BIbABiki62dlhChW5PR0Fmzbjq/0hh4rpYo60UL1OeNVtFFD9UdbgE7tRPDPKX2Yi0P0OWJBmfJ7H2rcR0IUUN7Qzsr1WOffKzY4M9Nhy0CYfDb0cjnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S2Pc+ZEpDEgvSnEZTZ1CneKfYKf/g8lg/Hu9sJAJwvs=;
 b=WYjCohIwN0x7LZ5ZG3mCRRF7L672Wjlefx+dOtfGKTM50tgVCcLz+0qm952vQw0lVsnpiubN/3DcjLMV777gP/UN+kcEfJUZjavEYedodQSB/1J88wNl3Q2I1C9TDTF8/KCUcYT9AL0EMID5qLdXoU9Ju7oAdl7DXfu7Vu73PlxrGV+TPUUlstsqyK7uNv1TU8zZry4Z1UfVbjlBvmDjgB+VLKwJaG1rtoK1Q4SoSxTrqhflWi0gZBP6M28YBWq1sYEsgd7iC1lkIJZr/4huNZnZ3R/Lay63m70GnaX1T7R7om8KNVqQHh1h2hxhkYxTRc8LRcp+LaG5+5e2urj6dg==
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by GV4P189MB3678.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2b8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 08:15:52 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%6]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 08:15:51 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][master][PATCH] vim: minor update to 9.2.0340 to fix CVEs
Thread-Topic: [OE-core][master][PATCH] vim: minor update to 9.2.0340 to fix
 CVEs
Thread-Index: AQHcy+PpB+UHT6e8Q0yEZE+aUZny6bXeuJWAgAEPnTg=
Date: Wed, 15 Apr 2026 08:15:51 +0000
Message-ID: 
 <AS8P189MB1672C416E88B1CBCDB78D39FB3222@AS8P189MB1672.EURP189.PROD.OUTLOOK.COM>
References: <20260414075421.604401-1-adarsh.jagadish.kamini@est.tech>
 <DHT06GASNSNY.PWPM4R9918KA@bootlin.com>
In-Reply-To: <DHT06GASNSNY.PWPM4R9918KA@bootlin.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8P189MB1672:EE_|GV4P189MB3678:EE_
x-ms-office365-filtering-correlation-id: 141d07ad-2908-4a9d-bcc0-08de9ac73543
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003|8096899003|38070700021|13003099007;
x-microsoft-antispam-message-info: 
 l5KPJ4Q7Vhk4FRGOnVw5GBIuK7CdNF0RSsziWa48rjnWLFI2nPiGRHgIQIZiurZ4RPqsKKp57MZoS0e8nAxm+dq+HuHESYodSyg8yHij5Do37Hkbh4NDV5qbt1JMRm7OL17UdAVj7lHp1/ffxyoHK6kZJ/j7DRp98Qhf7BMyaIysDjVhWvMy3N0jUCxY7eIfZUsepgnOhRRCXAmByWS1O8bC6++s5DCcTi3ZCVW4dlNXgj2cMx8aIa1a6Relil0QVS/FOTJNKHdeQ0YichxLCHzUGyiiMVVmz4H+xPMTuQN+SRub5u5UURQTT4tlC38cRDielxubY1hoibjTSERMQWPKoVsntSHJ1EDv6OrVUgwtfqCkKt8Hggi/QeiDc59/Cc8uid7or3W5lgfuxDJUs2m5PxoOnnD+94HJNaplgF1Xrrp2NouetrYUlb6CRh2fxh679RrdIUYNECXYr7dReqQfE+lPs+QCJhca+gKIWQ//9gtGiiAK8lx5OP0tbcguUmfhSMh2HfPgfhM4Psbni8OsHLb3tIodV8VX54M0lUs9dLv82ZOdlgV/6LfAAP9a8eaHUMxBriaLyCfLaz9z5OFxXk5KmLw9m37fGwnvw8Gji4SBkugHbgBMO6SyZ6h3nWJELMAFZivkZcOjjag+wkWwuriDaJda8i1gydg0KRwh4aSx3AnyJ/jsG9YCMWqlYj0OPuiEoDznZJj+x/9I3mi/URRP/RWhyhYXrRy+9k8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003)(8096899003)(38070700021)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?NqWPf3m1W3Lvd3wq6CwuKhersKrsiFasXP2+jCIKK4ibmUDZwt3yY4ZHxE2L?=
 =?us-ascii?Q?U7b1+SLw78erk73E0U/kG9a22NoqKjwQIihHZR2YMSCZ5at5ANJCVd3VjZEJ?=
 =?us-ascii?Q?il9SUCu4Uxf9jY+nolxWESzq+S4eDRCicDXXdIYOVVsBLMIfn+F88DF2LM3p?=
 =?us-ascii?Q?3icvpstSaLuCPS21VyeH6RdZ60YWnXyUUFUOSg1Wv4Z6MZN906wF6gcB5zRz?=
 =?us-ascii?Q?VxVj/UJ5KjOiDXy+xdbvVptuvZkFubx6Up8vXqSWFzaDmI5esfd7Alt3zLdp?=
 =?us-ascii?Q?zFm3ZcoAoBDNr57C/yn5NKqFf5tzHyJzwhAdm3a9aOAVqod7XZyJ3iXRERBl?=
 =?us-ascii?Q?DO+vDwWtHkmHxuhGxKe9snNTNAv/Y4xZ4ypR+mKsQ16XXvqYTFGaABA2HFzT?=
 =?us-ascii?Q?q+J625haWFLZldeKVZrkhCv92clfehOrOJRBv1iHeqJ++mrowc0qoOSDXhTJ?=
 =?us-ascii?Q?H/yT7bSp7jM1JIF8eqyEdaMYkunv2a1fLK11umY6C0woOKqqViJGWH4WBfRo?=
 =?us-ascii?Q?K8Ud1QjeadjaOkgtF1C/qBEwWcfYXDbMDGhi8HsTNO6uC95/tFJ3iEZ+EQSl?=
 =?us-ascii?Q?9StKd69yo31qObJaolSjrstTlsLhaecaXCr2uvtNurpyJrfGmFTllf0vA/v4?=
 =?us-ascii?Q?yo6XHNtybiorpQBF5BhuMyKiFE/Smdcr0I8u9csZkZ/Gk2Hdc51P56Gm7clk?=
 =?us-ascii?Q?q8iZ+hgFW+1iEHjF7td7CO3DfQp/7QitfSR2FCTWSfnPDA/Pq8VS3tjfqx6A?=
 =?us-ascii?Q?DWJ5oIwxh1z/zcHAhnDjfFXfRQlnb63nM9kqj4GQB36nV3LMEKkpd7fau1zt?=
 =?us-ascii?Q?pHddK0FmRma+ao+PgySu+NPH+tqL/bWAIJfhQgw2CpOG1HbujuOuOZde0Uxe?=
 =?us-ascii?Q?Jye40Eqsw715jTY1eNECJIffdZ5tpfZcWcnR+epiWbzV8dlIfYKhhsXwsrQD?=
 =?us-ascii?Q?/NGfocV147uYqwOtZ9LHBNDs4AeQ6ViIYm2RpkYMmYImwpPD3FYwJvl0X6fU?=
 =?us-ascii?Q?D+DcYvZtsHBkK1cbJtJH2HMYdl7NsdAhqR9IIx39jaCZbpO1ds6H8fHQfXSo?=
 =?us-ascii?Q?NRsC/+roO8DNkCoYXBidKRnTItB2WbUfgL4zKLznfkfxVd62b2m9E5my11P2?=
 =?us-ascii?Q?uyd/25wvA9fhoBhrijs929+0gddGnwDVkzixm2pSIODKkIzt1dI/tR5NNjKk?=
 =?us-ascii?Q?LcLTtJHzEGKkRWfF7Y18mEju7iTXf+6ygYMf/wQ6HeIFiTMAYG8vgcaSjLr2?=
 =?us-ascii?Q?ClKQlkRdszZ5rsCEoj0ueoI3bt0LbFZsG8SbBfASNDom5lfKxvJJOfOGpGOL?=
 =?us-ascii?Q?v5/HtrzST/+KhiBJ9Lg+6z+itsa6jNQw+3lDBTe69iblJce+NPtiKED4+KPz?=
 =?us-ascii?Q?YjSvzYgmmlIrdXtov/dEejhNBbO7fs3Yln5rE19SbkWJm2kmMjZkY8auxcvh?=
 =?us-ascii?Q?rycJMocaZL3NbFzGaczPWV6U5PTmipkgjJiy1G0nUydm8+2hnT/iDCqtQF93?=
 =?us-ascii?Q?yvKv5wmTcDCzt1HsBXH/yenZ77g3PUbCALf/gtI6EI9okMzfCy+wRSSRfD/3?=
 =?us-ascii?Q?8PMK2pN3VeylTLDtquLpUlQEK2YaPNkaUwFPO1b5SoZ9A56KguOmrjCACph9?=
 =?us-ascii?Q?D1BzQUi+Ed0lzeuqJ608xuXn4hnLeec0oE2VmiGvOB+f8OhCx5+qadaV3Ze9?=
 =?us-ascii?Q?cMXJhQxuJXHchJJxXhihbiMUr67YRyERPiQi4Nf5jaBAdumVB9SvVS24CWyd?=
 =?us-ascii?Q?bQxM9C8q0mIv11oiiERTgb4SZ6ZASYo=3D?=
MIME-Version: 1.0
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 141d07ad-2908-4a9d-bcc0-08de9ac73543
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2026 08:15:51.5954
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8x4PSapNVu5vRvLHCIRbvA3+K/G4k+crIuIFbwYjF5WEZm6CRGcX84Tql9Qieu1Rc35P/mMzGNFF9hYdNhynKLs14ErCgn73gRyshPCSt0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3678
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AS8P189MB1672C416E88B1CBCDB78D39FB3222AS8P189MB1672EURP_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 08:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235185

--_000_AS8P189MB1672C416E88B1CBCDB78D39FB3222AS8P189MB1672EURP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
Thanks for pointing out, I will fix this.

/Adarsh
________________________________
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Sent: Tuesday, April 14, 2026 18:03
To: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>; openembedded-=
core@lists.openembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][master][PATCH] vim: minor update to 9.2.0340 to fix =
CVEs

On Tue Apr 14, 2026 at 9:54 AM CEST, Adarsh Jagadish Kamini wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> CVEs fixed: CVE-2026-34714 and CVE-2026-33412
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---

Hi Adarsh,

Thanks for your patch.

It looks like you will need to drop some vim patches, at least the
CVE-2026-33412.patch one. Right now, vim does not build with your
changes:

ERROR: vim-9.2.0340-r0 do_patch: Applying patch '/srv/pokybuild/yocto-worke=
r/musl-qemux86/build/layers/openembedded-core/meta/recipes-support/vim/file=
s/CVE-2026-33412.patch' on target directory '/srv/pokybuild/yocto-worker/mu=
sl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/vim/9.2.0340/sourc=
es/vim-9.2.0340'
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/musl-qemux86/build/bu=
ild/tmp/work/core2-32-poky-linux-musl/vim/9.2.0340/recipe-sysroot-native/et=
c/quiltrc push', 0, 'stdout: Applying patch CVE-2026-33412.patch
patching file src/os_unix.c
Hunk #1 FAILED at 7106.
1 out of 1 hunk FAILED -- rejects in file src/os_unix.c
Patch CVE-2026-33412.patch can be reverse-applied

stderr: ')

https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3620

Can you send a new version fixing this?

Thanks,
Mathieu

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


--_000_AS8P189MB1672C416E88B1CBCDB78D39FB3222AS8P189MB1672EURP_
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
Hi,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks for pointing out, I will fix this.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
/Adarsh</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Mathieu Dubois-Briand=
 &lt;mathieu.dubois-briand@bootlin.com&gt;<br>
<b>Sent:</b> Tuesday, April 14, 2026 18:03<br>
<b>To:</b> Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;; =
openembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openem=
bedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core][master][PATCH] vim: minor update to 9.2.0340 =
to fix CVEs</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Tue Apr 14, 2026 at 9:54 AM CEST, Adarsh Jagadi=
sh Kamini wrote:<br>
&gt; From: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.tech&gt;<b=
r>
&gt;<br>
&gt; CVEs fixed: CVE-2026-34714 and CVE-2026-33412<br>
&gt; Signed-off-by: Adarsh Jagadish Kamini &lt;adarsh.jagadish.kamini@est.t=
ech&gt;<br>
&gt; ---<br>
<br>
Hi Adarsh,<br>
<br>
Thanks for your patch.<br>
<br>
It looks like you will need to drop some vim patches, at least the<br>
CVE-2026-33412.patch one. Right now, vim does not build with your<br>
changes:<br>
<br>
ERROR: vim-9.2.0340-r0 do_patch: Applying patch '/srv/pokybuild/yocto-worke=
r/musl-qemux86/build/layers/openembedded-core/meta/recipes-support/vim/file=
s/CVE-2026-33412.patch' on target directory '/srv/pokybuild/yocto-worker/mu=
sl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/vim/9.2.0340/sourc=
es/vim-9.2.0340'<br>
CmdError('quilt --quiltrc /srv/pokybuild/yocto-worker/musl-qemux86/build/bu=
ild/tmp/work/core2-32-poky-linux-musl/vim/9.2.0340/recipe-sysroot-native/et=
c/quiltrc push', 0, 'stdout: Applying patch CVE-2026-33412.patch<br>
patching file src/os_unix.c<br>
Hunk #1 FAILED at 7106.<br>
1 out of 1 hunk FAILED -- rejects in file src/os_unix.c<br>
Patch CVE-2026-33412.patch can be reverse-applied<br>
<br>
stderr: ')<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/build=
s/3620">https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/3=
620</a><br>
<br>
Can you send a new version fixing this?<br>
<br>
Thanks,<br>
Mathieu<br>
<br>
-- <br>
Mathieu Dubois-Briand, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com">https://bootlin.com</a><br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_AS8P189MB1672C416E88B1CBCDB78D39FB3222AS8P189MB1672EURP_--

