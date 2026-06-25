Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E6DBCDE001
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 15:53:31 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.22])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14889.1782402808540210070
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 08:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector2 header.b=ChzAHb23;
 spf=pass (domain: ericsson.com, ip: 40.107.159.22, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQk7s833eLYZUXJ0Br/Op2eWGJUA8ppT010Go2hYNZG0prDpWpU67umxCRDWvw2AEeYRSa2vQNRlwPIoWgIhpLrdYJwWQYoay49b8kLKy2AKzB4EgTLA5WKXAWgJck/7yXBO4xE5F+2WICP1XbIrUhngQDnU5QbrhR18Y9MUKEeIQYjUJCO4ZpHB9a73L5oMAeB+q2u0vAqZnlEjzxlHczUTMRCgsVKVep3AWlQviRqqeimDTJga3zbdmJ1KSN950olLNblA+cmLWlHahMnX2Kn/Wv7w1emB1vG2uZC9/yoAykniXyyxzaUpZoNCau60JGCmAGZRA89XJlH1k4grdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1WGE18Z4EIJZKEOdWxT3bpScOQNRGKFwCa3OVzjeFx4=;
 b=rxVXyEziJxvAYzeYW3H47pAokdPIUKxNeGTB7TlXJYb+ovR+0itPq3xA0TDNrKHW5SFC7KAK948wlmVg0uwlEazi9foFrapDXxMKgXv1ehd2Z5qFY5uVKjocomtLQ5odx3VaaQeNvwpxlULnIJAXmMXOvabJUKty9d0Bu79TKAGQlkeDB0U669K8+xqnJo7gNWV+QWWiJFFx+fKf0P6DKQzfVYdAzWY1/Qrt0ZLruYzm6VMBgBhPCNJrHnt1T0A5ZVs6S3bugzMEfVKP4GteSbrtrL18lIUpz38QXVEvvF5hZ+g1Mo17B759E+uXI/bzx/e8GO/l71umDXumwyCxDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1WGE18Z4EIJZKEOdWxT3bpScOQNRGKFwCa3OVzjeFx4=;
 b=ChzAHb23Og1U6eNhEXK/3iTq4SpicnBjyZy+9mgFr/oe7kTqos9RpL1ptPwXXtWV8gP7RN82ypu0gLm/ELTotPXRydXxXnFI38ICnfGxubNPEzn/pekCTD/jixpVgAUb9HuA4kVSlono7JROmjaXi29/DNubipW541q4E7BoFLikoRvdYmtDCemjiwGvQjKlGBIVJfkzHlE0zPKI/IJqYDwdLwSNCuD1eO7lYUvy3tuFVRtyekSEZnG3WMPobrql08D7EhbqIZpN/0bMrR3uo6f5RDb/IEYtV3UkIDuF1sjpW9C1V/BHFA/RsXhElcmZpm3SFO6aVRbNZ940/GKE/w==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by GVUPR07MB11804.eurprd07.prod.outlook.com (2603:10a6:150:32e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Thu, 25 Jun
 2026 15:53:24 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%7]) with mapi id 15.21.0159.015; Thu, 25 Jun 2026
 15:53:24 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "anders.heimer@est.tech"
	<anders.heimer@est.tech>, "qi.chen@windriver.com" <qi.chen@windriver.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 2/3] systemd: upgrade to 261
Thread-Topic: [PATCH 2/3] systemd: upgrade to 261
Thread-Index: AQHdBKh8qpSGMSqasEqKNBU1HbkVvLZPZsaAgAAB1mWAAAMDIg==
Date: Thu, 25 Jun 2026 15:53:24 +0000
Message-ID: 
 <PA3PR07MB10721EC942E3A6F2418A9953F8AEC2@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: <20260625134210.4046622-1-daniel.turull@ericsson.com>
 <20260625134210.4046622-3-daniel.turull@ericsson.com>
 <CANNYZj-YEH6Nbk5A+ste7RNa0MyATwFZHO91Q1iC-+Qaf50JYA@mail.gmail.com>
 <PA3PR07MB10721D0B5720F489999AF31FE8AEC2@PA3PR07MB10721.eurprd07.prod.outlook.com>
In-Reply-To: 
 <PA3PR07MB10721D0B5720F489999AF31FE8AEC2@PA3PR07MB10721.eurprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-reactions: allow
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|GVUPR07MB11804:EE_
x-ms-office365-filtering-correlation-id: beae19a5-4aed-4fab-b01b-08ded2d1e3da
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|38070700021|22082099003|18002099003|3023799007|8096899003|56012099006|11063799006|4143699003;
x-microsoft-antispam-message-info: 
 zOq6C+EWl7upAUfTKJn3UpmpBI++7JexwpaRmBKjQAyp4XnxOvBABboY+wTCyv6jBvV9E7RnAT9BaUv7M772kyTdlTuugUrUHh8TYcOeXZs5Y6sd4N+rX8wFabsyiotU4pvESW5Xu82YEzYKizCzMMmLzwXo9JqM2hwzeU8uHvO3X4kNOR+lLrVybPYgLGpD2xAmyfRNBp77hw4K0tRmP+iqNVOo76IcaRmZVOMlCR+zRMHdrzBsTQeJaQ/TUvCko89XUB3bkTGOAkTI7zqzgEYUW1EAjIOz/eUDbiBmDiNnyiDJRrZhwxpe5rqjLH4l2gtP/MnzAloGek6lPKAaVpcWJ8RuCwiTdutoo3+E7w/hdK5MzNwWNjUKd+32P7n1hnDMZg5ixslJVqH/NIk3h7fI9KdKxyq7lZxgNZJPOnUquTIaLL2iUJ2KknkH1XCSvICiQJjSGXG8L6jmw5FqXtEtgb06F3pEfkuJgHNJHTdkAdLjSRjUEhn1aTEGQS7QNvPytQQtFvdYWaYB6JZPmjA+qc2y+rLIGABvPQ3O/uQfla0LE3rqGrYdM2H97rQPQm5cnezUnnkw4+nfnpKZFdm9AHYTbbJbLMvPeZfIFl9YOM9LlBwylJjTQMqDymX4M4IEYkha4FxtzTdgXaFcRgYJZbPaPShOXn3T1XrVz/MCFD4e+XcCXh9nx/EyWQMiUQzOPFT29YHpNxZ6NjJqwORoNOm3m2SxysiFJ04tyR8=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(38070700021)(22082099003)(18002099003)(3023799007)(8096899003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?A9P8+HAmY+nXT/Ynw41I8DP4qSYKzg3oK34QJXRhEdVkTmOUFoHwGxth?=
 =?Windows-1252?Q?xPz266qp+7MkA2vnJoG3iaTEiBfLavQEVZFU9B2gtR46cc3GwnurkpfR?=
 =?Windows-1252?Q?TVMtxdwkTrTZyEqth4qkyMbalxkaMab5ajOPY+CswdC3fCAWU+KJnzaa?=
 =?Windows-1252?Q?IgUeBAxwBrxwQWIRvPQ9LVcCbeJQ+dijpkCDjw8TZ2Ck6JCyAMVL4Arz?=
 =?Windows-1252?Q?laxt08HSzVc6O/MMVlAdAlY0fvPKC8w8aeimkem/unWDsyJHMEumYQzV?=
 =?Windows-1252?Q?kUSi/nUyiZG1KU19NO16REYVoZAJHc9fTPxBP8KzjXBOnwSYfqd3Q6AG?=
 =?Windows-1252?Q?SivH5e7pfAI4dl9krAoW0iEGXeU3SIBgWVwEzfPelso+J+Y49FaBiVs4?=
 =?Windows-1252?Q?bO2/RqxTBE2o/XZfSfu6enE3bNSs9mzh5sBq0qBJjoCTK8cksG9b3bJ7?=
 =?Windows-1252?Q?bXRQrkr2f00rKg+fOXKWvFyVSovSiv/zSvESGmTq5ZNIjr3L/2gOVPa8?=
 =?Windows-1252?Q?UX4FyeYte1Q2hw2p/NcP9lmUbP63H3D0zkDhZzzSwPnK/NN2IsSYC3cx?=
 =?Windows-1252?Q?4jOJfV26dS+2EZ6V/qWE4O/Z5DBYreCJQ0+AWQlzojhvIuhcnFZGgB3g?=
 =?Windows-1252?Q?mrhnD6UP4bzlMMY/+UNlGo0TwZa0DwwhgPBW1v6/PyG25Oafq6YaTUjN?=
 =?Windows-1252?Q?gylQ/tMucFyxRT1ol63WurjrT8HT9shUI4P4GKPtoQfTDpgxmw6hRLpW?=
 =?Windows-1252?Q?r1p7DuPj1Utgr/aQXP4DasyvDgqVND6Snm1+nkD9sD3IZcNzcWHKjpPo?=
 =?Windows-1252?Q?FaMSEvcu0oKXMjLILPw5GgYLZOJp9ZGSXfNFN+JOJyVoSF3+n7kyljwG?=
 =?Windows-1252?Q?oCaup2v8Xtq6S0p1A5uuKtpz2Rm2bttiRNvQbeUEYG6OrKP38j3+SUwX?=
 =?Windows-1252?Q?fDaCUQ8kVfZHtKSFQZiz1goQ7MpLS0vZ8GNAFP7WL1LGSvGJzkWYY8ps?=
 =?Windows-1252?Q?qFhW2TIhVu+DdEWopPnsWNWo+6w4pzGkJlsV6iEoNDlV4H7AkJmRhxcz?=
 =?Windows-1252?Q?jAdPu/2Hej1X47y2OE6xh/+49qHH03NEk+K8JR1oMgY6SK/5cYcp1OlA?=
 =?Windows-1252?Q?D2S4SfAF+auUaUm7pgtJW3iuqxUB91kHLqyyPd5OI4cFn5y7nwNHC3Sl?=
 =?Windows-1252?Q?Tzw6KGg1MZ5/TX1x44/zp9Swb/dcfvbBt2k2+O6HApJdSAZJtjX6Jd/N?=
 =?Windows-1252?Q?OdrycWmsz59AP4oR4SFeoMQ7KVphbBAODNyHGTs2mmUokF6Tm+aD2/1R?=
 =?Windows-1252?Q?Yl1vy0Sy9T+MN8r/ZA4NCU1UcWaAUTK78kYuGW/qrEhW2uoLzE/8Gj7a?=
 =?Windows-1252?Q?H0VmmB/tqyMxKMPLayAZ2nq/t25HxOgOl/bhWXkD+pME5J0sfrKoen7g?=
 =?Windows-1252?Q?6Fjm73trrjy1LDnW6AbaOM90kBfIcvnWiYGjJQ9b4BcFGhJTXZ8nVO0m?=
 =?Windows-1252?Q?7C3L/kWs2oSzCt3igJUNYsQ2lhmg6735IY1Q8aY04RPMA8iamSggUO9a?=
 =?Windows-1252?Q?A60caWDob6ZX8m3DbBDaUEJ0ZbY8u2CeKJFECfRqbdNBfH/qazKBZjt9?=
 =?Windows-1252?Q?Es4oaJgiApgZu8YxZZwemIPYK+6FIK/1PsUT5pzXutUHWL0XrX0rw0Ao?=
 =?Windows-1252?Q?ix3IOxw0/a7baHOU+RoyrUtTw0U2IqHppHb7zrcwNJamokqbqYVxG8yq?=
 =?Windows-1252?Q?MbM2pv60GPqCaBwhSOeOoG2QBf9/kLzusm8RFHnUIL17e0CZelZkyxuT?=
 =?Windows-1252?Q?ted5nVejALdC9dw2Mn6kYeQqbi3qb7wL2+76o3qa55hAjIzLbMP/NFSu?=
 =?Windows-1252?Q?5Ix091gfDuk94f3AD7bHhUKFjL0rfMMy2UQ=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PA3PR07MB10721EC942E3A6F2418A9953F8AEC2PA3PR07MB10721eu_"
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beae19a5-4aed-4fab-b01b-08ded2d1e3da
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2026 15:53:24.5774
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rgwAzfIQHmXrNhpJhlY9BviuNhuejD9K6fTrDLKPwBsUM0/3JEz/wfr0yydQWk3zfJKtTWMLLY/czNj/4hDgWGLz3iutyIBrxXUXowWUymE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVUPR07MB11804
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 15:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239580

--_000_PA3PR07MB10721EC942E3A6F2418A9953F8AEC2PA3PR07MB10721eu_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi, regarding the tag, Should we add the check in the patchtest as well so =
it will be catched there? Or in some qa?

Daniel
________________________________
From: Daniel Turull <daniel.turull@ericsson.com>
Sent: Thursday, 25 June 2026 17:43:25
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; anders.heimer@est.tech <anders.heimer@est.tech>; qi.chen@wind=
river.com <qi.chen@windriver.com>; richard.purdie@linuxfoundation.org <rich=
ard.purdie@linuxfoundation.org>
Subject: Re: [PATCH 2/3] systemd: upgrade to 261

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

--_000_PA3PR07MB10721EC942E3A6F2418A9953F8AEC2PA3PR07MB10721eu_
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
Hi, regarding the tag, Should we add the check in the patchtest as well so =
it will be catched there? Or in some qa?</div>
<div style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robot=
o, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" dir=
=3D"ltr">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_MSFontService, -apple-system, Robot=
o, Arial, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" dir=
=3D"ltr">
Daniel</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Daniel Turull &lt;dan=
iel.turull@ericsson.com&gt;<br>
<b>Sent:</b> Thursday, 25 June 2026 17:43:25<br>
<b>To:</b> Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; anders.heimer@est.tech &lt;anders.heimer@est.tec=
h&gt;; qi.chen@windriver.com &lt;qi.chen@windriver.com&gt;; richard.purdie@=
linuxfoundation.org &lt;richard.purdie@linuxfoundation.org&gt;<br>
<b>Subject:</b> Re: [PATCH 2/3] systemd: upgrade to 261</font>
<div>&nbsp;</div>
</div>
<div>
<div style=3D"font-family:Aptos,Aptos_MSFontService,-apple-system,Roboto,Ar=
ial,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
Ok,</div>
<div dir=3D"ltr" style=3D"font-family:Aptos,Aptos_MSFontService,-apple-syst=
em,Roboto,Arial,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
I=92ll restore it in a v2. I assumed that since it was building and working=
 fine it was not needed. I was not aware of the verification.</div>
<div dir=3D"ltr" style=3D"font-family:Aptos,Aptos_MSFontService,-apple-syst=
em,Roboto,Arial,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div dir=3D"ltr" style=3D"font-family:Aptos,Aptos_MSFontService,-apple-syst=
em,Roboto,Arial,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
Best regards</div>
<div dir=3D"ltr" style=3D"font-family:Aptos,Aptos_MSFontService,-apple-syst=
em,Roboto,Arial,Helvetica,sans-serif; font-size:12pt; color:rgb(0,0,0)">
Daniel</div>
<div id=3D"x_mail-editor-reference-message-container" class=3D"x_ms-outlook=
-mobile-reference-message">
<div id=3D"x_mail-editor-reference-message-container">
<hr style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><span style=3D"font-family:Calibri,=
sans-serif"><b>From:</b>&nbsp;Alexander Kanavin &lt;alex.kanavin@gmail.com&=
gt;<br>
<b>Sent:</b>&nbsp;Thursday, June 25, 2026 5:34 PM<br>
<b>To:</b>&nbsp;Daniel Turull &lt;daniel.turull@ericsson.com&gt;<br>
<b>Cc:</b>&nbsp;openembedded-core@lists.openembedded.org &lt;openembedded-c=
ore@lists.openembedded.org&gt;; anders.heimer@est.tech &lt;anders.heimer@es=
t.tech&gt;; qi.chen@windriver.com &lt;qi.chen@windriver.com&gt;; richard.pu=
rdie@linuxfoundation.org &lt;richard.purdie@linuxfoundation.org&gt;<br>
<b>Subject:</b>&nbsp;Re: [PATCH 2/3] systemd: upgrade to 261</span>
<div style=3D"font-family:Calibri,sans-serif">&nbsp;</div>
</div>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<div class=3D"x_PlainText" style=3D"font-size:11pt">On Thu, 25 Jun 2026 at =
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
</div>
</body>
</html>

--_000_PA3PR07MB10721EC942E3A6F2418A9953F8AEC2PA3PR07MB10721eu_--

