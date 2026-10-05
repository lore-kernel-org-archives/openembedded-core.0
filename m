Return-Path: <Suresh.HA@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 184C4CA5FCE
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 08:46:23 +0000 (UTC)
Received: from MA0PR01CU009.outbound.protection.outlook.com (MA0PR01CU009.outbound.protection.outlook.com [52.101.227.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15769.1791189981896425168
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 01:46:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmwtechworks.in header.s=selector1 header.b=XXghlrNx;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.227.18, mailfrom: suresh.ha@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o12BeBMsdJJEJ6CjHMMAqhkrJiwmapqRDQBFX00Sgbdd8zzs/egytZo8swrhcbOO/kMngV/TREJJZXZm143slvetyvICWinYFVmJKrwj0aVwF94+KRF3ZEslXXK2Q1jP1OGtcvtq6/tQtklJYmwgHSAEG0RsJa8JKszNFwy4DCc496AWVSFYAT18IEMQMo1wkFbKm8FSlNbbvXU/N+rk0Lyt8ihOaK4Im8QsQE4XByskMdCeTJ070pfjqaBrYl4SwBvKK0PRhGGpe8doE58rN3NNZ/+tbs6THyDUqAdq0WGzurx+ObCfpzLwud1MCXLk85MsoH+iik+uGVSaHlR+5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dR92DP/IG5ABekxH7SFS/BdowPgkWBfZ7YfAicF1T4M=;
 b=PkdOdrP3PrfT7Ce9byDcocMHggWcpoLirAqVGH4l8sqmI1rNTgFCpxgHK1/CjBFW0wvQb2kShQ5MuSk8kutyoC18L5+wayX2Eg8EjRIb++zPeFYaTcKsK9B1vFpFa+p3k57wtmUSibYIZ9Wu5lp8mCu8ahchB2jmORFTWZDb+kuP/nvR5MowQba1YWr7v6+0db0q9UHiuKMTEE/9Kz1+Rtt8fUcNyozJ+9RoZfT+SVC187JOsc1BemCedXpgpPQKU9inKBGE3ZAKBqC7q+GbpSA2EuXoVyxZcE5cymMmjR8D/jq4sHd4ZtVAG2PRVY8ia8eSw+n+wmfeyz3pqISaQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dR92DP/IG5ABekxH7SFS/BdowPgkWBfZ7YfAicF1T4M=;
 b=XXghlrNxzUfi+rViGkM8NVmpXPOPcVwSb184rlFbV3Lk01umjzzgDd1JMO7vTHsSqaOHekFL5hqF8xk0p9fIUvkweHQDoMcp72wFEgY36DBGjpBuY7/jITdIds24+YiwgfKp4SYM6IUaCmbB9+RWRBZbcUxZaO7by8LihOixl4RnRYxGBXLlZqjU4oBImG9QkkiJdJXBITxEsRKlPs7k3jm+qw9MgmrbX5nabqBcAtwGd66fhijJ3Wh6qWtMas87QjMw2OrDPzFu5AiLxTdfR2itlfEBEwWgJ0HVe3udQhIptUWaRQzmyZ3e8rK48fnAp6XaJlMtxGWQ8hhvAbAX4A==
Received: from MAXP287MB4240.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:15e::13)
 by PN6P287MB5149.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:302::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 08:46:13 +0000
Received: from MAXP287MB4240.INDP287.PROD.OUTLOOK.COM
 ([fe80::a6de:34f0:e60c:2ebc]) by MAXP287MB4240.INDP287.PROD.OUTLOOK.COM
 ([fe80::a6de:34f0:e60c:2ebc%3]) with mapi id 15.21.0472.016; Mon, 5 Oct 2026
 08:46:13 +0000
From: Suresh H A <Suresh.HA@bmwtechworks.in>
To: Yoann Congal <yoann.congal@smile.fr>, Suresh H A - UpStream
	<UpStream_IP-SH@bmwtechworks.in>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [poky][scarthgap][PATCH] systemd: replace a bunch of
 assert() with friendlier checks
Thread-Topic: [OE-core] [poky][scarthgap][PATCH] systemd: replace a bunch of
 assert() with friendlier checks
Thread-Index: AQHdOrOISbL/ZA06ekac92vLZs9Ci7bqMJwAgAL1zQGAAa80FQ==
Date: Mon, 5 Oct 2026 08:46:13 +0000
Message-ID: 
 <MAXP287MB424000780CE847B23E55EB65EE962@MAXP287MB4240.INDP287.PROD.OUTLOOK.COM>
References: <20260902081733.3136152-1-UpStream_IP-SH@bmwtechworks.in>
 <DLU99U4S7591.5BVIYWG6DZTE@smile.fr>
 <18DB4190C650705C.1795410@lists.openembedded.org>
In-Reply-To: <18DB4190C650705C.1795410@lists.openembedded.org>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-Mentions: yoann.congal@smile.fr
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MAXP287MB4240:EE_|PN6P287MB5149:EE_
x-ms-office365-filtering-correlation-id: 45fe8df8-fe65-4b9a-ad02-08df22bd1cd8
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|23010399003|31052699007|39142699007|1800799024|10067099003|3023799007|56012099006|6133799003|4143699003|11063799006|8096899003|55112099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info: 
 vRvoruv3WbAFZalO5TwkxD7Fli0bN5wFXBgjqjNA2bCAA1vnnc0qNSb+MfyY8dtuuvEdv3iHpJdKYtcFKzd96h7l0OD2abVm88z5ImRD5X98C0TGy+Q5OYjgP/iPxuPDTxEtGwotIq8PO3+DL1dWuta11zJB88aK1/LRcSm1JG5xjHcgp0I9++Ne6WUKsHEWVuGEtY30LJxWDhXf5WU9+AKxfXs76W2BbiqiUj7MG/ET3PMvzdseawfcp5hV9RoQ29s9GxWp1ggyrBFbyawuVCaBD8EIe8m9Gm02fOdPGJ6ebzFWQPwMKhbqIdNV3N1z7cqhKwjtQbuZI7rpN3l4f++jjpUswAbJooE/4scjU4U6sYtqVe5fVg0X6RAL2ZFOM/UZDhnyKxWfGW2+v7nTuB+uQKrQLqSNVw96fjWK9BRytmUILzZxKoCaapfkOaFR2GzVdKEIVx9xTtmrgNhLxZR9X6TuvBrOIW+UyVd5VGanoEB/nzw7zv6i9QSBLL5e9cO5vDOncl2mXNIXjwymFVnic+xFVCZtgg+YjO5KwZ0NbsF/jEBkQtKqSAsinkjCgUmQjdxy+EUFR7D2IPBhJ/DGN+/ShFiPXfTVfxD1XurNXGv2jLwj+w4Zh/BsIApeSBQTEn4qskG6KINt+hyY0qUwv4Hzpe7xP2B9UOtmsZ4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MAXP287MB4240.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(31052699007)(39142699007)(1800799024)(10067099003)(3023799007)(56012099006)(6133799003)(4143699003)(11063799006)(8096899003)(55112099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?TcD11Qv4jB3Z2PCGIWOzbE+T2Smt2ZAzebOVhIm3wq0dleFEZ+M44CKg+Cmr?=
 =?us-ascii?Q?BHDvD2TGCH06NJiDLpOVhp80UwwA+1QigLaHKVK3ozZyV/0qKoA46C3AbXFu?=
 =?us-ascii?Q?giNUpI2aGPMIrm/0eM3pojC0is80DSOJBJImrXVidNvHpTNl4EGmn1H/hXsB?=
 =?us-ascii?Q?D5L0Lh5ycA3v7bzR/ucPuzQV2hDGG0JphHKSDwEG9vDVw9Tmez2UzGuwmYZ6?=
 =?us-ascii?Q?5iLiyT6aIg2LulBnIK4IL6ej1WTK/teUOhNQjRoYeQDg0DSUlzmCJveifwzX?=
 =?us-ascii?Q?1NVjvnvpHve+eLbdsbMs/J3l6wa0Za7QZgIMEUgxeG1XJ0CLBnEFbTybt940?=
 =?us-ascii?Q?3FJndTzN4fDwzSl7CZYJUr/8+XDPHlalHVwqqeWUL6HVVpRsXU24Qb4fe7gY?=
 =?us-ascii?Q?umAGi7SPukE23jJ79zoJJZb3klohPhnOe1pmeYJeZf9cUHowlq15KXerkPtg?=
 =?us-ascii?Q?gOydkTeXPeGghxS6JtI/8YoyE9vkIbxd1h7oAFpABvVud1s1lcIZFw+RdCvP?=
 =?us-ascii?Q?568jkf8opZObBy2Q4I0PcU/cWZ+f+SWD1Rp4WwDc1RQXwOhRcEFXD6VtIBLq?=
 =?us-ascii?Q?swmx712GbUbNuLZm7bZch4PP1WS9jeoIbdGa0Dc3kKlB5PynPEANAwswrnK0?=
 =?us-ascii?Q?qzrXYb+Hcv0gxTlze7hqGaqKaWIfLJJEhdGns58DNR2wy4ECP9u/zCb1e/5r?=
 =?us-ascii?Q?QWLLMcamYb3J5TeJlljgn7/N2ZfhBwUAkuXNbYFFd9MhNK+oR/jHuT/ArEfc?=
 =?us-ascii?Q?WyCVeaDM9SrxmMKrqOKcD003u6t2Yo16gPbn9jtUKQ+TB6613jCj/3fNfwre?=
 =?us-ascii?Q?gdl3dQjoahZZggfPeCYhD+1wOq1oxMiwnxIhTsGRz/alBaTK0RXG0LsFSNjg?=
 =?us-ascii?Q?5XlsuDTb3uZWdiHEaZ0ofg4NhGpJD3rMBEP+SB5JOsbfBSnvKTiw5HLDhF4N?=
 =?us-ascii?Q?azRUgxSegz3rIdxahEBb2tAp80KdTRlNcw4V0M2wPh6CbXDcO2I2qNi2Nbgr?=
 =?us-ascii?Q?+iyegJTPbOQ6nW2kbh7DpvC3B9uZe7flgLme9rmlkOg2pGu26pWwUlwHjJJ/?=
 =?us-ascii?Q?U4KmrMtmKtP77tliD7H2DuvzhXI85S/tsRtcCTgmiwBI6XwRyNi6aearqzyP?=
 =?us-ascii?Q?pNKvrERXNWaeaxdc6eAMWf4eS3VTyQSay5AorhVHadUmnvswk7qGRqw5KTtb?=
 =?us-ascii?Q?pRTa9rURFDxg+i9bGVdBWQ9l47DPuOM6sPHF0aO0BFO72G2lDAr3ZAU1GkFD?=
 =?us-ascii?Q?thkRWDGBBOyG4f3EbQ14+DgCwJeh1kteDSwaSF40S50khHjcEpOEWr2vWBUF?=
 =?us-ascii?Q?+WR9QCbA5f7kJF7x9FF/YV+WLpHTucL3m1TQnb5WL316jm4XHK6iCKZnLi8g?=
 =?us-ascii?Q?0CBleoqWms9AbsyBkxuPC5vM0rTyN3y+t43YvyM0qLYUnmcjd48L79gjG4c1?=
 =?us-ascii?Q?6D1m+LscvOFrfLraqapdIilHIKBKxGaH29GlipulUHaSnHy+fGkiEw/thNkI?=
 =?us-ascii?Q?cwOUhUgZ64IqAKMkaqxtqgwEoEeiFrRE/4oxZVaaj1cuRltbidFJHm/WtA/3?=
 =?us-ascii?Q?6KKWlmhnIzozvfMA250T5q/wjp9rvIhQpUcDXP+uzrOg2l6g9CTX6xhPYxUn?=
 =?us-ascii?Q?bl63OW7oaeV2XUsZ6Iv5S0wRrMGSz7muSLD5Ti6TM0smSz4b2cOFaoHC++/4?=
 =?us-ascii?Q?d4e19stRMHElAScxjt8LBY1fcQDbLY3Ew9lanKPyKcQAMDr0zAw41T6ZeewG?=
 =?us-ascii?Q?Vhbpf8ZGqQ=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MAXP287MB424000780CE847B23E55EB65EE962MAXP287MB4240INDP_"
MIME-Version: 1.0
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MAXP287MB4240.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 45fe8df8-fe65-4b9a-ad02-08df22bd1cd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Oct 2026 08:46:13.7615
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7VAPlQMYq8dlUVbAMLfU4jGbBL39Lh7Cum/FpIFJqirWWi3zILDGSbWB+b3AWy0wFExhsIHbNFF95/g4Sav0ImUDIawZ6v/lmY7SovY/79A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN6P287MB5149
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 08:46:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247224

--_000_MAXP287MB424000780CE847B23E55EB65EE962MAXP287MB4240INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello @Yoann Congal<mailto:yoann.congal@smile.fr>,

I've sent v2 with additional context on the issue we observed in the platfo=
rm and the rationale for the backport.
Patchwork link: openembedded-core@lists.openembedded.org | [poky][scarthgap=
][PATCH v2] systemd: replace a bunch of assert() with friendlier checks<htt=
ps://lists.openembedded.org/g/openembedded-core/topic/poky_scarthgap_patch_=
v2/121588045>
The updated commit message now includes the observed failure where dlt-syst=
em-journal reported Bad message and subsequently hit the assertion in gener=
ic_array_bisect_for_data(), which is addressed by this upstream fix.
Thanks,
Suresh H A
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Suresh H A via lists.openembedded.org <Suresh.H=
A=3Dbmwtechworks.in@lists.openembedded.org>
Sent: 04 October 2026 12:32
To: Yoann Congal <yoann.congal@smile.fr>; Suresh H A - UpStream <UpStream_I=
P-SH@bmwtechworks.in>; openembedded-core@lists.openembedded.org <openembedd=
ed-core@lists.openembedded.org>
Subject: Re: [OE-core] [poky][scarthgap][PATCH] systemd: replace a bunch of=
 assert() with friendlier checks

Caution: "External email, be cautious especially with link(s), attachment(s=
) or QR code(s)".
Hi @Yoann Congal<mailto:yoann.congal@smile.fr>,

Yes, we hit this on our scarthgap platform (systemd 255.21). dlt-system abo=
rted inside sd-journal:

dlt-system[1284]: Assertion 'd->object.type =3D=3D OBJECT_DATA' failed at
src/libsystemd/sd-journal/journal-file.c:3237, function generic_array_bisec=
t_for_data(). Aborting.

The crash is the assert in generic_array_bisect_for_data(). The function re=
ceived a data object 'd' whose object.type was not OBJECT_DATA, so the on-d=
isk journal contents were not what the reader expected. The assert aborted =
the whole process.

The patch replaces the assert with:

if (d->object.type !=3D OBJECT_DATA)
        return -EBADMSG;

A corrupted or changed object is then reported as an error to the caller, a=
nd dlt-system is not aborted. The other hunks make the same change in bump_=
entry_array() and the journal_file_move_to_entry_*_for_data() functions.

The fix is upstream commit 5ee8b3edb385 (v258-rc1) and applies cleanly to 2=
55.21. I'll send a v2 with this explanation added to the commit message.

Thanks,
Suresh H A
________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: 02 October 2026 15:17
To: Suresh H A - UpStream <UpStream_IP-SH@bmwtechworks.in>; openembedded-co=
re@lists.openembedded.org <openembedded-core@lists.openembedded.org>; Sures=
h H A <Suresh.HA@bmwtechworks.in>
Cc: Suresh H A <Suresh.HA@bmwtechworks.in>
Subject: Re: [OE-core] [poky][scarthgap][PATCH] systemd: replace a bunch of=
 assert() with friendlier checks

Caution: "External email, be cautious especially with link(s), attachment(s=
) or QR code(s)".

On Wed Sep 2, 2026 at 10:17 AM CEST, Suresh H A via lists.openembedded.org =
wrote:
> From: Suresh H A <Suresh.HA@bmwtechworks.in>
>
> Backport a patch that replaces a bunch of assert() with friendlier checks
> Fix is already available since systemd v258-rc1.
>
> Signed-off-by: Suresh H A <Suresh.HA@bmwtechworks.in>
> ---
>  ...a-bunch-of-assert-with-friendlier-ch.patch | 108 ++++++++++++++++++
>  meta/recipes-core/systemd/systemd_255.21.bb   |   1 +
>  2 files changed, 109 insertions(+)
>  create mode 100644 meta/recipes-core/systemd/systemd/0023-journal-replac=
e-a-bunch-of-assert-with-friendlier-ch.patch

Hello,

What problem is this trying to fix? Did you triggered those assert() in
a project?

In itself, the patch looks fine but I have to make sure there is a real
reason for merging it. Can you send a v2 with a little more information
about that?

Thanks!
--
Yoann Congal
Smile ECS


--_000_MAXP287MB424000780CE847B23E55EB65EE962MAXP287MB4240INDP_
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
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
Hello <a href=3D"mailto:yoann.congal@smile.fr" id=3D"OWAAM127304" class=3D"=
tWKOu mention ms-bgc-nlr ms-fcl-b">
@Yoann Congal</a>,</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
I've sent v2 with additional context on the issue we observed in the platfo=
rm and the rationale for the backport.</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (=
West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 11=
pt; color: rgb(0, 0, 0);">
Patchwork link: <a href=3D"https://lists.openembedded.org/g/openembedded-co=
re/topic/poky_scarthgap_patch_v2/121588045" id=3D"OWAcdabc72c-bdda-6a01-a71=
b-d3faef8ece35" class=3D"OWAAutoLink">
openembedded-core@lists.openembedded.org | [poky][scarthgap][PATCH v2] syst=
emd: replace a bunch of assert() with friendlier checks</a></div>
<div class=3D"elementToProof" style=3D"line-height: 20px; margin-top: 1em; =
margin-bottom: 1em; font-family: &quot;Segoe UI&quot;, &quot;Segoe UI Web (=
West European)&quot;, &quot;Helvetica Neue&quot;, sans-serif; font-size: 11=
pt; color: rgb(0, 0, 0);">
The updated commit message now includes the observed failure where dlt-syst=
em-journal reported Bad message and subsequently hit the assertion in gener=
ic_array_bisect_for_data(), which is addressed by this upstream fix.</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: &quot;Segoe UI&quot;, &=
quot;Segoe UI Web (West European)&quot;, &quot;Helvetica Neue&quot;, sans-s=
erif; font-size: 11pt; color: rgb(0, 0, 0);">
Suresh H A</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Suresh H A via lists.openembedded.org &lt;Suresh.HA=3Dbmwtechworks.i=
n@lists.openembedded.org&gt;<br>
<b>Sent:</b> 04 October 2026 12:32<br>
<b>To:</b> Yoann Congal &lt;yoann.congal@smile.fr&gt;; Suresh H A - UpStrea=
m &lt;UpStream_IP-SH@bmwtechworks.in&gt;; openembedded-core@lists.openembed=
ded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Subject:</b> Re: [OE-core] [poky][scarthgap][PATCH] systemd: replace a b=
unch of assert() with friendlier checks</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr"><span style=3D"color:red"><i>Caution: &quot;External email=
, be cautious especially with link(s), attachment(s) or QR code(s)&quot;.</=
i></span>
<div>
<div class=3D"x_elementToProof" style=3D"font-family:&quot;Segoe UI&quot;,&=
quot;Segoe UI Web (West European)&quot;,&quot;Helvetica Neue&quot;,sans-ser=
if; font-size:11pt; color:rgb(0,0,0)">
Hi <a href=3D"mailto:yoann.congal@smile.fr" id=3D"OWAAM960346" class=3D"x_t=
WKOu x_mention x_ms-bgc-nlr x_ms-fcl-b">
@Yoann Congal</a>,</div>
<div class=3D"x_elementToProof" style=3D"font-family:&quot;Segoe UI&quot;,&=
quot;Segoe UI Web (West European)&quot;,&quot;Helvetica Neue&quot;,sans-ser=
if; font-size:11pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:&quot;Segoe UI&quot;,&=
quot;Segoe UI Web (West European)&quot;,&quot;Helvetica Neue&quot;,sans-ser=
if; font-size:11pt; color:rgb(0,0,0)">
Yes, we hit this on our scarthgap platform (systemd 255.21). dlt-system abo=
rted inside sd-journal:</div>
<div class=3D"x_elementToProof" style=3D"font-family:&quot;Segoe UI&quot;,&=
quot;Segoe UI Web (West European)&quot;,&quot;Helvetica Neue&quot;,sans-ser=
if; font-size:11pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:&quot;Segoe UI&quot;,&=
quot;Segoe UI Web (West European)&quot;,&quot;Helvetica Neue&quot;,sans-ser=
if; font-size:11pt; color:rgb(0,0,0)">
dlt-system[1284]: Assertion 'd-&gt;object.type =3D=3D OBJECT_DATA' failed a=
t</div>
<div class=3D"x_elementToProof" style=3D"font-family:&quot;Segoe UI&quot;,&=
quot;Segoe UI Web (West European)&quot;,&quot;Helvetica Neue&quot;,sans-ser=
if; font-size:11pt; color:rgb(0,0,0)">
src/libsystemd/sd-journal/journal-file.c:3237, function generic_array_bisec=
t_for_data(). Aborting.</div>
<div class=3D"x_elementToProof" style=3D"font-family:&quot;Segoe UI&quot;,&=
quot;Segoe UI Web (West European)&quot;,&quot;Helvetica Neue&quot;,sans-ser=
if; font-size:11pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:&quot;Segoe UI&quot;,&=
quot;Segoe UI Web (West European)&quot;,&quot;Helvetica Neue&quot;,sans-ser=
if; font-size:11pt; color:rgb(0,0,0)">
The crash is the assert in generic_array_bisect_for_data(). The function re=
ceived a data object 'd' whose object.type was not OBJECT_DATA, so the on-d=
isk journal contents were not what the reader expected. The assert aborted =
the whole process.</div>
<div class=3D"x_elementToProof" style=3D"font-family:&quot;Segoe UI&quot;,&=
quot;Segoe UI Web (West European)&quot;,&quot;Helvetica Neue&quot;,sans-ser=
if; font-size:11pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:&quot;Segoe UI&quot;,&=
quot;Segoe UI Web (West European)&quot;,&quot;Helvetica Neue&quot;,sans-ser=
if; font-size:11pt; color:rgb(0,0,0)">
The patch replaces the assert with:</div>
<div class=3D"x_elementToProof" style=3D"font-family:&quot;Segoe UI&quot;,&=
quot;Segoe UI Web (West European)&quot;,&quot;Helvetica Neue&quot;,sans-ser=
if; font-size:11pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:&quot;Segoe UI&quot;,&=
quot;Segoe UI Web (West European)&quot;,&quot;Helvetica Neue&quot;,sans-ser=
if; font-size:11pt; color:rgb(0,0,0)">
if (d-&gt;object.type !=3D OBJECT_DATA)</div>
<div class=3D"x_elementToProof" style=3D"font-family:&quot;Segoe UI&quot;,&=
quot;Segoe UI Web (West European)&quot;,&quot;Helvetica Neue&quot;,sans-ser=
if; font-size:11pt; color:rgb(0,0,0)">
&nbsp; &nbsp; &nbsp; &nbsp; return -EBADMSG;</div>
<div class=3D"x_elementToProof" style=3D"font-family:&quot;Segoe UI&quot;,&=
quot;Segoe UI Web (West European)&quot;,&quot;Helvetica Neue&quot;,sans-ser=
if; font-size:11pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:&quot;Segoe UI&quot;,&=
quot;Segoe UI Web (West European)&quot;,&quot;Helvetica Neue&quot;,sans-ser=
if; font-size:11pt; color:rgb(0,0,0)">
A corrupted or changed object is then reported as an error to the caller, a=
nd dlt-system is not aborted. The other hunks make the same change in bump_=
entry_array() and the journal_file_move_to_entry_*_for_data() functions.</d=
iv>
<div class=3D"x_elementToProof" style=3D"font-family:&quot;Segoe UI&quot;,&=
quot;Segoe UI Web (West European)&quot;,&quot;Helvetica Neue&quot;,sans-ser=
if; font-size:11pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:&quot;Segoe UI&quot;,&=
quot;Segoe UI Web (West European)&quot;,&quot;Helvetica Neue&quot;,sans-ser=
if; font-size:11pt; color:rgb(0,0,0)">
The fix is upstream commit 5ee8b3edb385 (v258-rc1) and applies cleanly to 2=
55.21. I'll send a v2 with this explanation added to the commit message.</d=
iv>
<div class=3D"x_elementToProof" style=3D"font-family:&quot;Segoe UI&quot;,&=
quot;Segoe UI Web (West European)&quot;,&quot;Helvetica Neue&quot;,sans-ser=
if; font-size:11pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:&quot;Segoe UI&quot;,&=
quot;Segoe UI Web (West European)&quot;,&quot;Helvetica Neue&quot;,sans-ser=
if; font-size:11pt; color:rgb(0,0,0)">
Thanks,</div>
<div style=3D"font-family:&quot;Segoe UI&quot;,&quot;Segoe UI Web (West Eur=
opean)&quot;,&quot;Helvetica Neue&quot;,sans-serif; font-size:11pt; color:r=
gb(0,0,0)">
Suresh H A</div>
<div id=3D"x_appendonsend"></div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Yoann Congal &lt;yo=
ann.congal@smile.fr&gt;<br>
<b>Sent:</b> 02 October 2026 15:17<br>
<b>To:</b> Suresh H A - UpStream &lt;UpStream_IP-SH@bmwtechworks.in&gt;; op=
enembedded-core@lists.openembedded.org &lt;openembedded-core@lists.openembe=
dded.org&gt;; Suresh H A &lt;Suresh.HA@bmwtechworks.in&gt;<br>
<b>Cc:</b> Suresh H A &lt;Suresh.HA@bmwtechworks.in&gt;<br>
<b>Subject:</b> Re: [OE-core] [poky][scarthgap][PATCH] systemd: replace a b=
unch of assert() with friendlier checks</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">Caution: &quot;External email, be cautious espec=
ially with link(s), attachment(s) or QR code(s)&quot;.<br>
<br>
On Wed Sep 2, 2026 at 10:17 AM CEST, Suresh H A via lists.openembedded.org =
wrote:<br>
&gt; From: Suresh H A &lt;Suresh.HA@bmwtechworks.in&gt;<br>
&gt;<br>
&gt; Backport a patch that replaces a bunch of assert() with friendlier che=
cks<br>
&gt; Fix is already available since systemd v258-rc1.<br>
&gt;<br>
&gt; Signed-off-by: Suresh H A &lt;Suresh.HA@bmwtechworks.in&gt;<br>
&gt; ---<br>
&gt;&nbsp; ...a-bunch-of-assert-with-friendlier-ch.patch | 108 ++++++++++++=
++++++<br>
&gt;&nbsp; meta/recipes-core/systemd/systemd_255.21.bb&nbsp;&nbsp; |&nbsp;&=
nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 109 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-core/systemd/systemd/0023-journa=
l-replace-a-bunch-of-assert-with-friendlier-ch.patch<br>
<br>
Hello,<br>
<br>
What problem is this trying to fix? Did you triggered those assert() in<br>
a project?<br>
<br>
In itself, the patch looks fine but I have to make sure there is a real<br>
reason for merging it. Can you send a v2 with a little more information<br>
about that?<br>
<br>
Thanks!<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</div>
</div>
</body>
</html>

--_000_MAXP287MB424000780CE847B23E55EB65EE962MAXP287MB4240INDP_--

