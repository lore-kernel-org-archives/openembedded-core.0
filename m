Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C3CCD4F54
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 06:28:32 +0000 (UTC)
Received: from MA0PR01CU009.outbound.protection.outlook.com (MA0PR01CU009.outbound.protection.outlook.com [52.101.227.16])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15351.1779169880988916886
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 May 2026 22:51:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmwtechworks.in header.s=selector1 header.b=XaSBJ9F7;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.227.16, mailfrom: aditya.gs@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G6mDD5D/Hgug1Wjtn0+8chHHcQyrY9J1N3lS9AGZJoxg166TVJo0mylV3lgWVsEJiMwWFHLgQX9gTF2sUZAMgKdVQEo48lskGmLWxNXltUmjBTyXM7W9je/TaD1YN9hYU1L/gKtEl41tanKgN2YCUgvl3QHb0fcMlx7LkAkHqRR5EAu8Y0Xsl+zSRvOxJ/NLx2Q6cpHVGsINwjaa+GS98z+OJz28Wh7YgA64Uw8mT+zdaUTYMxvaCyh62tqcHEIYNC2IuIoFVEfIBrWNkxgeuuIEswDXushevfBUcrYawzimpLSzuNa2rjzVVC4caIsfIItFjdCYGlL2ggZuyRRhfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHJr4tiRNo2pwbu94mwbv56z+vV+cvnoNWGr8qsGOII=;
 b=yuaNDDe7X0j74yTdaYmgyJ3775/9DBMT5wi/5ZXZURMH9m6XdZybwFFIn4Oy3S5hjbx7fg4T7XplrtQ6TSMYLQJzwhZ3r8mKZvVmSUU4p/KDBomDHDaTAWp4KdUrDImvTZx/FQgjrgYSX7uxxkcEbja+NgshjCOgxHTS6WNc5TpKW3C0Tz28hGRU0NqNFsViBbuxabowR+Hf+0bo7C23Pb1aZFYatV7ovTtJOWwFZ/XUJ+MqH7d33d9m/gB7JanUuLHzVebmTuiPA0GHFopicMEQqGC5H3Dv4+aq1I3wRYfU/8nhHN8ufq6dJzXonBudD6c27mrcrWhTPj865IxPjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHJr4tiRNo2pwbu94mwbv56z+vV+cvnoNWGr8qsGOII=;
 b=XaSBJ9F7tIxjczncP7B/Zh1Ymw8j8jJgjuBfzq8rXtLOoG1tYiL0cj7UAa1MtY5gb+uyH+wMthiW7q9jcf3KhKuS2tN9bv5qiFCdCyhUPON90IZ2IAh1SXcP7gu8HgYETQR/3akzdGl+b10WU7pgGVfGIE6e8vZIiReSjz51Cg37x4jsqN1KzPhkQRjhnkOIYa8LGrrAeixQhkXH2LrT0gqe9bQrkWhpfRPkZ9Kf4KSQUB3X+IN5IjAvdzWGAziGCyPlzKuqmUpMfeb6ylL9oODBLcWw3u9TxxcBSKJUJaFFUO+x6eEnTqflw3UUNPIwJ+2RZzxcR+PQQreC1LVWWQ==
Received: from PN0P287MB1221.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:190::13)
 by PNYP287MB3989.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:280::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 05:36:22 +0000
Received: from PN0P287MB1221.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9fe:b41c:e003:e0b1]) by PN0P287MB1221.INDP287.PROD.OUTLOOK.COM
 ([fe80::c9fe:b41c:e003:e0b1%3]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 05:36:22 +0000
From: Aditya GS <Aditya.GS@bmwtechworks.in>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: PATCH gawk: ptest: disable randtest due to nondeterministic behavior
Thread-Topic: PATCH gawk: ptest: disable randtest due to nondeterministic
 behavior
Thread-Index: AQHc51B2sOZPpaxnTkWE5/d2mhg6ow==
Date: Tue, 19 May 2026 05:36:22 +0000
Message-ID: 
 <PN0P287MB12212AB74C67E209174CD01BF9002@PN0P287MB1221.INDP287.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB1221:EE_|PNYP287MB3989:EE_
x-ms-office365-filtering-correlation-id: 2a2c7d0a-8025-470c-36de-08deb5688fcb
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|6049299003|39142699007|376014|31052699007|366016|1800799024|55112099003|38070700021|11063799003|18002099003|56012099003|8096899003|4053099003;
x-microsoft-antispam-message-info: 
 BHKSTfRcuXWyMMwfaOI7rtsjCEZer+TcUyxfFGOxSQ9YlhPNmHwEl+Hvsag4XEdjNocGNGK3RRR6GxEFsV/YPfdYRjNyUm7NGpWeExH5K4MILUPAfUeeWWl6Q2NQ+ci3sUF/2x3wHMWBrh3GrazQEudmMREH/QEKhO+cPBGPHJVcx8EV51UUZEV0n1dQLpe90jx6HChSbyMHd0H9FRlpBHqrDeqJd2TiqDSgzNYZDHk3Mq1CcFaYnvLRaRuiiNVClt2PCAVf1CuJDWyzzkGCPn20MxfY5VeFUvVfLlAcwzeyK3xMizjQ93+7wAZoLqG6Ic52R9bKJFn+jecB4ZuzoF9keunA2hz6mqmyqaarRy05802vuXQUeVCrPtT4gBnvR8LAxTwUWOYxscOjMwYvPZpSfSouiSQDzPdYZnAIvUvCXnAaE9HDWl/XiCaIRKnRj9qoLwYKpgSxkVpROnhrsr4tj2bSdOHS5HeCt3EpSnmUzghCvhQXlMEsyOhLareJOv0wHTtcMKCDl3sZEt6Os0LH0H5mvwmcriXXDX1iVBu6CeRIh2CcjIufrAnIUpvSjdYSloY1sO2b8RpQaOK96a50TavIWam9nWb983HOOKsAhlboj9a7XW9WcvKdUFvfyt34rOcFTuKNhaih7jQEHWwUB2QSRGPp4zfYJRaeh4lhoURY6aIOprlQotTwQ9pOBtgtUv323znFoO/ifKOqn+3mwPWf88a+FuzVklolck7TZ1g6D7g82XtkPxuBGHTJ
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB1221.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(6049299003)(39142699007)(376014)(31052699007)(366016)(1800799024)(55112099003)(38070700021)(11063799003)(18002099003)(56012099003)(8096899003)(4053099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?tNJPIJepYWU9bjcgK+xx3XQsYi8CSzeVRfKDzbmsR3bb9EVXyG5K50kFrH?=
 =?iso-8859-1?Q?yW8Ccj/Ss3/1FStH7ktxzhzVf3AMC4W8VSPhPJQLgdrmsIRxUs/s5T1duv?=
 =?iso-8859-1?Q?XbPB+RMH+8RTypXASKGTiHGLoqn7kF7Gh2524sCBkqj4/eeVtsvWlRF7GW?=
 =?iso-8859-1?Q?BBVCt992YaGkIpcLML/Rdy29XfcG7op0ud/EyTUpxRNZUd7QCd6cBx3PGG?=
 =?iso-8859-1?Q?KhD8DWxVRB645ZCN8EBLFsbonarnlRnKVF/J+RLGo85s0+Mx1d04sy5tq2?=
 =?iso-8859-1?Q?BK3PdjTXnWxCdMpKyqEJraI8hGMipwQp1ga0RWkXejGvoLj+9b7zpoPRcB?=
 =?iso-8859-1?Q?jml9mzBM/Pwo0rYfCbsHMFkZ8Twy0LEVL7j4K86UwX47HxNP0H/8TBeIwf?=
 =?iso-8859-1?Q?AondLFbGslr2s0hyl42ayPD79kAqCwU7eUyAHPO63d9Mtwe0NeVkEK++7Z?=
 =?iso-8859-1?Q?MzdbcaqWQtvxJ/HX1WItZsi2mEs9OQDRMNQBqdfTcwvuNxDMKtGi7kSp9R?=
 =?iso-8859-1?Q?AowU1bnUTfFLyw6IEUk4U1qB9+dXnhRMIWZpFZ4r8J97wz7bYkamFg1/DU?=
 =?iso-8859-1?Q?0cjYNtT+EMh7Vo+kph9a2Lhm2FBj9ugi+5eiZmHLsp/EMDookLePr/69qY?=
 =?iso-8859-1?Q?yh/B5VXx1AL3CanGmB5uxjpjyP+Ajw1CvzRJPbAdm6mqzwNTBV7bFvsP6g?=
 =?iso-8859-1?Q?KdkLFr9nTUsNrD8dtz3SHmdbts3gLteEzdJQoP26EVEr+KbqMcnnd9LKcG?=
 =?iso-8859-1?Q?YmK+1/5gSZiLaN99MLdDDT2iOkDsbD5RFZtFMJXiiibpCIB2JUv6sqtvq2?=
 =?iso-8859-1?Q?G6lrFh9ujo10ZHe8JHlkUvO4R1Kj5wG67rB0xh2pU+9+d1jdX92yq5YLml?=
 =?iso-8859-1?Q?0fWYAIvx2ZUS+w2yyB1NfNyD6tOP9uZH3i9JbdeIXuKSt3VW2qkfVNw28n?=
 =?iso-8859-1?Q?QhWlPC49inYTx2n22bYIv5g+GJy97e3ilOu4VFsXPyUYBAQEvoFtdWNSxs?=
 =?iso-8859-1?Q?+kVfS7bZnFYu8GQa35q94Yq4yw2BRKYaHaGOlN5IIav95bC6f2OoDVkd0b?=
 =?iso-8859-1?Q?iXiT9AnT5in5Zhe3w0spa1UaABd75M+mc0Lt4D2xaC/pXi8bY4CaT/5G6n?=
 =?iso-8859-1?Q?g4CZtdsY7vFnC1s34nq31r0cwP1qtaAAM5Ssk24MoM2Ncg41ZuauPKf2jX?=
 =?iso-8859-1?Q?mB1Gx6fwfQaFl4KUWzOoDwxQOk9X6fp8p6IwyNXNY+fffg56g7XRtNZjms?=
 =?iso-8859-1?Q?ZFJtMQ/t78BwfqQU6wOqeyle0gWL54UQ/AI3hz80GNmCIROISXhexihBra?=
 =?iso-8859-1?Q?Kf6TJGAMLUyDgQHJKMuLMh+XsrskrgixK9GFuo+xSffkJ4rlL3NQUdLm+B?=
 =?iso-8859-1?Q?BtHk98pvkwTn0kAM784QQ6gYk6wgwvYRZzf47JqqVGvOGUnrQzY/QrA+iI?=
 =?iso-8859-1?Q?XSTpJ7BjNP16aR/qkpT1p9C17Nc7WsRsfno0Xv8froRfgYM1pRL/6m2Cd9?=
 =?iso-8859-1?Q?mAR8LAzh4Eoahjak3fGuk6leKLit9se8uqe794HoRBQT+pcF6Rms2emBL9?=
 =?iso-8859-1?Q?53l/yBqJyOAQaA6mpdEPdCheXEL7Mi94pgkHX/1D7vNu1NC92NQQBiB8+E?=
 =?iso-8859-1?Q?WAcyW9ifNlSEFt+lpWnfa15Xsd/mDyy05SV7ktfcS7lEvDIBKK9CW0Srdi?=
 =?iso-8859-1?Q?UFB8PloK4PyVKKEBCi6j3taOp1/n6ZFsuqHaHgxOVAxNaA2N5HrkAWvKJb?=
 =?iso-8859-1?Q?sIMhL+Kk4TMvJ1T0KXeb8RY8PF/4TAurrDUG/BMrDfo7gnBUKnSLkYxwPs?=
 =?iso-8859-1?Q?vq7xyP2XiA=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB1221.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a2c7d0a-8025-470c-36de-08deb5688fcb
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2026 05:36:22.6539
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fhBPAEMbW5TXroLthER3G4tStxRurm+QobaZ4iKpCYgBiDpQYAq7RJHVs+HFhWAfddj9EpAy4or+Y7W5ejQso8jmlQRyCvDvf9J6qLJ/YUU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PNYP287MB3989
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_004_PN0P287MB12212AB74C67E209174CD01BF9002PN0P287MB1221INDP_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 06:28:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237271

--_004_PN0P287MB12212AB74C67E209174CD01BF9002PN0P287MB1221INDP_
Content-Type: multipart/alternative;
	boundary="_000_PN0P287MB12212AB74C67E209174CD01BF9002PN0P287MB1221INDP_"

--_000_PN0P287MB12212AB74C67E209174CD01BF9002PN0P287MB1221INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi, This is a patch for disabling randtest in the gawk ptest suite. This ve=
rsion includes the debugging analysis.

Thanks,
Aditya GS


--_000_PN0P287MB12212AB74C67E209174CD01BF9002PN0P287MB1221INDP_
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
<div class=3D"elementToProof" style=3D"line-height: 20px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
Hi, This is a patch for disabling randtest in the gawk ptest suite. This ve=
rsion includes the debugging analysis.
</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"line-height: 20px; font-family: Apto=
s, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif;=
 font-size: 12pt; color: rgb(0, 0, 0);">
Aditya GS</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_PN0P287MB12212AB74C67E209174CD01BF9002PN0P287MB1221INDP_--

--_004_PN0P287MB12212AB74C67E209174CD01BF9002PN0P287MB1221INDP_
Content-Type: application/octet-stream;
	name="0001-gawk-disable-randtest-in-ptest.patch"
Content-Description: 0001-gawk-disable-randtest-in-ptest.patch
Content-Disposition: attachment;
	filename="0001-gawk-disable-randtest-in-ptest.patch"; size=2128;
	creation-date="Tue, 19 May 2026 05:30:55 GMT";
	modification-date="Tue, 19 May 2026 05:31:19 GMT"
Content-Transfer-Encoding: base64

RnJvbSAxMjg1NmM0MDk2ZDdlODQyMDIxYTZlOWVkMTZhOGU4ZTgyM2ZlMGMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBZGl0eWEgRyBTIDxhZGl0eWFnczIwMDRAZ21haWwuY29tPgpE
YXRlOiBUaHUsIDE0IE1heSAyMDI2IDE0OjAyOjEzICswNTMwClN1YmplY3Q6IFtQQVRDSF0gZ2F3
azogZGlzYWJsZSByYW5kdGVzdCBpbiBwdGVzdAoKZ2F3azogcHRlc3Q6IGRpc2FibGUgcmFuZHRl
c3QgZHVlIHRvIG5vbmRldGVybWluaXN0aWMgYmVoYXZpb3IKCnJhbmR0ZXN0IHBlcmZvcm1zIGEg
c3RhdGlzdGljYWwgdmFsaWRhdGlvbiBvZiByYW5kb21uZXNzIGJ5IGNvbXB1dGluZwphdXRvY29y
cmVsYXRpb24gb2YgZ2VuZXJhdGVkIHNhbXBsZXMgYW5kIHZlcmlmeWluZyB0aGF0IHRoZSByZXN1
bHRzCnJlbWFpbiB3aXRoaW4gYSBkZWZpbmVkIHNpZ21hIHRocmVzaG9sZC4KCkluIHRlc3Rpbmcs
IHRoZSBjb3JyZWxhdGlvbiB2YWx1ZXMgYXJlIGdlbmVyYWxseSBzbWFsbCBhbmQgY29uc2lzdGVu
dAp3aXRoIGV4cGVjdGVkIHJhbmRvbSBiZWhhdmlvci4gSG93ZXZlciwgaW4gc29tZSBydW5zIHRo
ZSBjb25kaXRpb246CgogICAgYWJzKGNvcnJbdGF1XSAvIHNpZ21hKSA+IG1heF9hbGxvd2VkX3Np
Z21hCgppcyB0cmlnZ2VyZWQsIHJlc3VsdGluZyBpbiBpbnRlcm1pdHRlbnQgZmFpbHVyZXMuCgpU
aGlzIGJlaGF2aW9yIGFwcGVhcnMgdG8gYmUgaGlnaGx5IHNlbnNpdGl2ZSB0byBzbWFsbCB2YXJp
YXRpb25zIGluCmZsb2F0aW5nIHBvaW50IGNhbGN1bGF0aW9ucyBhbmQgcnVudGltZSBjb25kaXRp
b25zIHN1Y2ggYXMgQ1BVIHRpbWluZywKZW50cm9weSBzdGF0ZSwgYW5kIGV4ZWN1dGlvbiBlbnZp
cm9ubWVudC4gVGhlIHRlc3QgY2FuIHBhc3Mgb3IgZmFpbAp3aXRob3V0IGFueSBmdW5jdGlvbmFs
IGlzc3VlIGluIHJhbmQoKSBpdHNlbGYuCgpUaGlzIHdhcyByZXByb2R1Y2VkIGJ5IGVuYWJsaW5n
IGRlYnVnIG91dHB1dCBpbiByYW5kdGVzdCBhbmQgcnVubmluZwppdCBtdWx0aXBsZSB0aW1lcywg
d2hlcmUgb2NjYXNpb25hbCBmYWlsdXJlcyB3ZXJlIG9ic2VydmVkIGRlc3BpdGUKbm9ybWFsIHN0
YXRpc3RpY2FsIGNoYXJhY3RlcmlzdGljcyBvZiB0aGUgb3V0cHV0LgoKU2luY2UgdGhlIHVuZGVy
bHlpbmcgZnVuY3Rpb25hbGl0eSBhcHBlYXJzIGNvcnJlY3QgYW5kIHRoZSBmYWlsdXJlIGlzCmVu
dmlyb25tZW50LWRlcGVuZGVudCwgdGhpcyB0ZXN0IGJlaGF2ZXMgc2ltaWxhcmx5IHRvIG90aGVy
Cm5vbmRldGVybWluaXN0aWMgdGVzdHMgKGUuZy4sIHRpbWUsIHRpbWVvdXQpIGFscmVhZHkgc2tp
cHBlZCBpbiB0aGlzIHJlY2lwZS4KCkFzIGEgdGVtcG9yYXJ5IG1lYXN1cmUsIGRpc2FibGUgcmFu
ZHRlc3QgaW4gcHRlc3QgdG8gZW5zdXJlIHN0YWJsZQp0ZXN0IHJlc3VsdHMgaW4gQ0kgZW52aXJv
bm1lbnRzLgoKVXBzdHJlYW0gZGlzY3Vzc2lvbjogKGFkZCBsaW5rIG9uY2UgcmVwb3J0ZWQpCgpT
aWduZWQtb2ZmLWJ5OiBBZGl0eWEgR1MgPGFkaXR5YWdzMjAwNEBnbWFpbC5jb20+Ci0tLQogbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL2dhd2svZ2F3a181LjQuMC5iYiB8IDQgKysrKwogMSBmaWxlIGNo
YW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9nYXdrL2dhd2tfNS40LjAuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvZ2F3ay9nYXdrXzUu
NC4wLmJiCmluZGV4IGQ3MjExZjI4ZjMuLjc5NjJhMWViYWMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1leHRlbmRlZC9nYXdrL2dhd2tfNS40LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2dhd2svZ2F3a181LjQuMC5iYgpAQCAtODMsNiArODMsMTAgQEAgZG9faW5zdGFsbF9wdGVz
dCgpIHsKIAlmb3IgdCBpbiB0aW1lIHRpbWVvdXQ7IGRvCiAJCWVjaG8gJHQgPj4gJHtEfSR7UFRF
U1RfUEFUSH0vdGVzdC9za2lwcGVkLnR4dAogCWRvbmUKKworIHJtIC1mICR7RH0ke1BURVNUX1BB
VEh9L3Rlc3QvcmFuZHRlc3QuKgorIGVjaG8gcmFuZHRlc3QgPj4gJHtEfSR7UFRFU1RfUEFUSH0v
dGVzdC9za2lwcGVkLnR4dAorIAogfQogCiBkb19pbnN0YWxsX3B0ZXN0OmFwcGVuZDpsaWJjLW11
c2woKSB7Ci0tIAoyLjM0LjEKCg==

--_004_PN0P287MB12212AB74C67E209174CD01BF9002PN0P287MB1221INDP_--

