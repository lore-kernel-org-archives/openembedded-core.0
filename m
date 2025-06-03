Return-Path: <Sana.Kazi@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2732CC5AD49
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 10:50:48 +0000 (UTC)
Received: from MA0PR01CU012.outbound.protection.outlook.com (MA0PR01CU012.outbound.protection.outlook.com [40.107.57.131])
 by mx.groups.io with SMTP id smtpd.web11.8345.1748947837706860380
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 03:50:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=iN0PxFHH;
 spf=pass (domain: kpit.com, ip: 40.107.57.131, mailfrom: sana.kazi@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BoQHOL0PeoGTFSVpPrx/ZB8+WrCoe9I0hU04W4nPxowuZ4BBb/n56BCq66X4RZU+MwwHhKzwgCDPDaykoOT9eK7iIYju3HOEIr4Pib/vD9jYPG5E8xmwDnnOKFraqmiyKD1vgJTyxeFUv7qS+o99S5yE1F8IKaPtXNFaVrRl9gLAJlwv1ZIlDj8K3VO8i9H0HNhTehtN4xRPDY/luydP/q6yyQ8oWdOzwzykg98ff/d8RqiVaTL3+pgHyl83pr/6eBfeMPZBD4Q6ufqoEisdc1jwiQTgFmk2uHzzvzm+PEYLvsIdX1jd1qrzfl4XFYHXTrHU0P24ImPi7TohUoP3Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2etlq8fpjCnKIw+QauvwEzsDg4nusozGw9vM09n7HBI=;
 b=J7Q6QiMpUGRpfq7WxZ152xD5rpGKdoMHqLg3jOmBYn+mrxfaZTlTCW4Q6NIStqt/T7TkX9hIHlEgJ3ar1dxPOw/Zi1lwsuTkUY8hlEnmUM0W/q0HfIQd1qA1Cd56l4D2uRqpADcGMZFxq7wRu3ZyvkjGFIl9hEiNRqyBS/pRLbYlkJIXUF3S15RzfQEEliMmOXRvkXhxKMOr1IYRGd4kGo9ui2aUEwyBsVCnYptcbm6rIN9mdU4PhIvU5YfmF3avScYploEBKKGcTlXg6V7mf7tuBfbkfXN4diJPlYYhrDelZRQQetFE/hCrPZyu/O+fNDAmatTmUqYVOTOFPGIbTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2etlq8fpjCnKIw+QauvwEzsDg4nusozGw9vM09n7HBI=;
 b=iN0PxFHH5ULBFdT098JZfWgOb81IqrRgfsLznvlyWmB1GTo9dDwuLwPmhKSg9/kNaLnRJX5YzyDoL51OG1SffeINYB9L0Nafz+2Py9KDSt0CpgqsWkFn7Er0Tir34qAKLUzWHy0PvEr6SBEAp6e+cPZSgroFc1C8OS+BB46x5fY=
Received: from PN3PPFC40C8B4CB.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c04:1::50)
 by PN0PR01MB6349.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:6b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 10:50:31 +0000
Received: from PN3PPFC40C8B4CB.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::94:44ab:2118:27a1]) by PN3PPFC40C8B4CB.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::94:44ab:2118:27a1%8]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 10:50:31 +0000
From: Sana Kazi <Sana.Kazi@kpit.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: "Mitra Saptarshi, JD-81" <saptarshi.mitra@bmw.de>, Akash Hadke
	<Akash.Hadke@kpit.com>, "Parrakat Nisha, JD-81" <nisha.m.parrakat@bmw.de>
Subject: Inspecting combined source of bb and bbappends for debugging
Thread-Topic: Inspecting combined source of bb and bbappends for debugging
Thread-Index: AQHb1HRAoEFDARwhfUiMvgF6ODRfOw==
Date: Tue, 3 Jun 2025 10:50:31 +0000
Message-ID: 
 <PN3PPFC40C8B4CBFDA62100893C455CF3DE996DA@PN3PPFC40C8B4CB.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PPFC40C8B4CB:EE_|PN0PR01MB6349:EE_
x-ms-office365-filtering-correlation-id: e7c9bbea-a29f-42c5-cdbc-08dda28c75d9
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|39142699007|31052699007|1800799024|376014|38070700018|8096899003;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?rUOLBv1c0nAEgWdPP77ta5VlBg6dXn8qTAPu/hQSdoRvsH0CibibhHSJ?=
 =?Windows-1252?Q?+BWXBT29bL3lMZDlTdy6HSMuZ8JfuNMFhanLi3ATwiT9HcBEaJDd70LV?=
 =?Windows-1252?Q?7Un4DFNzGD3JX70RdXEG7RCDS7fTEzMKDpG1n7EUfiplaX0qKYY0/ahS?=
 =?Windows-1252?Q?edKVzlj3ZifEQQbT/A94MuxjFhhamdMnoO3V9/cem2X2TzSwnfexT19K?=
 =?Windows-1252?Q?6fXk+XqUaL/n6REbl8KjY0kC8w0NV1NmvdjxTXJ26pnUPKL1IZVWYgwy?=
 =?Windows-1252?Q?ybl8+aSdZyHPVDDQPLxiSc9XdSU3ECj+aCAXkFDvkmUVH5uEGQGkXtjl?=
 =?Windows-1252?Q?Z+yhq3hUw6U1HjUaPAbV8oHiXeuACu51+tZ3aYk5wn1nX8T10XC2+0D7?=
 =?Windows-1252?Q?yqLmWqWnt3IIHhA8oLe0jyaUAY9esaUYykXFM4erD3f6bGkMfQMfDwy9?=
 =?Windows-1252?Q?iBOUWXj6udnUBbg9dOGRMXf53w7h8hWXiKpBI+E3Vntbs+fCgPSonzWp?=
 =?Windows-1252?Q?UNHU3dzUkuBIMa4nNJ+2/3f4H3BJbod8SYLauhtqMnhoPlmvbYQvR7oO?=
 =?Windows-1252?Q?UTZfnmbdgkFLDzoIVX0bQyv/i1q3TwXzmjkA/4l3RJEqUjXoAsuoEhrI?=
 =?Windows-1252?Q?V5+uiES1q881OT+RcxZ2DgP9PcS0N82J1Ro6jeD2eOVsVO2H6eU9YbdC?=
 =?Windows-1252?Q?L8du852oONozJFr1ZwSySIxnfhxvofzVvGHrVN3uPscRUvsR3L9HGfWL?=
 =?Windows-1252?Q?pEj+EVUQNmT4J6is3T1NwUX3aPb/C4xRHPmEKYZFCJpWUbP4oeDuj8uJ?=
 =?Windows-1252?Q?RP8tAK3PQnP4/14z32CFriRoqKiU7jlERQqtaoCRnQZFEeq3QV3bTzvA?=
 =?Windows-1252?Q?8VmtJZfiYZ/gnmaoCAgZU8XiYhXFd3rwpxasoBN8G6P1t7uZ+KUPLqSL?=
 =?Windows-1252?Q?AiJgbbjQrNp3KvGL61vf9ltnIAnfEX9qHDi/csxC0pq9O+GvGAfBm46i?=
 =?Windows-1252?Q?ZHjMKl9VD9KUAvyYgZbc8l+hCa0FWufiS8MJp56i4Tm5hsgA4gbyiJwr?=
 =?Windows-1252?Q?RDaR/ygrVP+PhCvUZxBcLoA760XpEy1MGPxyhPR6y8jadtV2VneDiS5+?=
 =?Windows-1252?Q?Dndee/p74JrjFAGd3WIEVY22RttC6P+lBJB/BghZAhjFcISUxn2SFsQv?=
 =?Windows-1252?Q?Ht8R/sAJhyEqfg+4wb8PoaV+zPMjhUd7iphLKa7cZuGDFSEljpnGFYYj?=
 =?Windows-1252?Q?nTrDdgpylMdOAkik2S/cFDI45FacWzNLIsPwW1Jgc3zbg5aHzVZuRY4b?=
 =?Windows-1252?Q?Sqd2q59T8RIbxSN2Z2W/7WNsiD/mPvGT68wKSwJvPb6sTpe57DznLUwL?=
 =?Windows-1252?Q?C87lHJbc93KJlpw0WvCG/ocZfJbyxTlR3YEIp1UboGOhY0zNL0DZqpWs?=
 =?Windows-1252?Q?i5VISUyzpzjTiYJAnlEa+H9Z1Jqp83zDKELHI53tRqfp3TegPx7QeWNC?=
 =?Windows-1252?Q?GW2LqSTIft2iyud83biXkgGZ+Er2BmwNEZbtsvwmLZBqJFkV9k53eQNF?=
 =?Windows-1252?Q?w7ZhT9CGmhrBQhIzV555H+3oxPehVaiZSChWfjtguMOF3prtpyfyKdhG?=
 =?Windows-1252?Q?WJ0=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN3PPFC40C8B4CB.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(39142699007)(31052699007)(1800799024)(376014)(38070700018)(8096899003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?u0IdGwhlYFjZeiyZXJuTwS4RAMqv6yD2p7me/Ws7JJ+v6jeZBKFojngZ?=
 =?Windows-1252?Q?UVMazSwXKxKuQ3ONyXPDEolFGOqszhT1VwZKgjrL5ad4a3qsmmsL5fWu?=
 =?Windows-1252?Q?9myJbfffvcX8yZufAqstENmaeJTGaDYpTRtVp7Ml6FOcWg08yTz8AARU?=
 =?Windows-1252?Q?BSOc1624Rn8Oc+EedTrGsGkgpO9phd2RHzYKCc2DRC5Li/69+OKzYHnR?=
 =?Windows-1252?Q?YkMIGwvTNwlS7IL55pw5Fr0mfcNelEfpBv1EldzeVNKKyDxjyFCc5u3i?=
 =?Windows-1252?Q?VgYSvYtrAk7GMVRJkBWM7DBhN7q+88Emo0Anuho1LEVSZkkNSaV9Y3FF?=
 =?Windows-1252?Q?rq//6lZ8PZVts6RUcgl2/VylEa6laULtLcdnLwgCNMQgu56qYjYHs2I1?=
 =?Windows-1252?Q?+bZb7YODSYlYeNPuJg305iiChg4Ojc9zzkkGdpdbunLr3PpOfc7im8D+?=
 =?Windows-1252?Q?6qe9aIT2ilk1Q8AxP6lyVAnCkX7A7d1GGu495N2c/+SxVHhB7ba/OnWu?=
 =?Windows-1252?Q?A+0smiaE4ZFYOc9pQfhWm5vlAh0a7YvgRJv4/HVtVfQ4O8nnD0HwMw2b?=
 =?Windows-1252?Q?0KP4PaVBjXOmqvVURaJsonmbam1HKfmpH4pGtppgE/7zjqSTQGcegylA?=
 =?Windows-1252?Q?Vx2yyyvpoEpChssjl1y4iz1zyO0jo9sbM9wBRgmzr5asny0UV+PLGztt?=
 =?Windows-1252?Q?94KdSgfKb/Mk5rKmuDrJgapXL6dYTqpzAdLr125NohQAOuDp3gzHZaoy?=
 =?Windows-1252?Q?wGHzGQExV14rL8SX14fkgHhSyMkZec9kQ6LIc7AaZC7Pr8LoZZRIYtP3?=
 =?Windows-1252?Q?OekEqSdpoww8wkgIQ3zhjclUXI5YAGM42O2Rm5Wi0eQlye336RyzlpXA?=
 =?Windows-1252?Q?SRlVZaY3Xnn6YPNl0MNZfLpwP9eJmYbN4EOJ0Gzc9Cv08dAChlur4v2Q?=
 =?Windows-1252?Q?tZkfnlKz4somRTlo7RKKskr6r58+KV+kZx/rnqqly/it3bHBzYnhHCYP?=
 =?Windows-1252?Q?keCgQHQ/7yGPlBmFImbqU8PiJAmgis2ZvYQ/LlNfKCogYegIcBrGvNuu?=
 =?Windows-1252?Q?mjuR2mv0bdyL9mYJlP8IviUs6iDqtfJuczW/VHe0mfTtn7l/Wk0tvlAs?=
 =?Windows-1252?Q?kHATBOjCBrSwQ8zUFQ/wL9nopFd4e3678wxeRXxaH1AiFJCPwqQymvld?=
 =?Windows-1252?Q?fVVcVdREsu2FmSh1F1VePU5n8/mExX4T5bXMtZHgRkydbPBzbxwrruRm?=
 =?Windows-1252?Q?5vcvIZFFUW1k7axvktzvakvXVU+3Q1umiABPUh5CGmNHQBvPIkXPXEBR?=
 =?Windows-1252?Q?WDG+tPMY+k/PRjiiPUtDPs6kZ66JK1hBEqudsyUNx60LXquVXEBbYX9r?=
 =?Windows-1252?Q?QaqLAUkVElIMfRNsSfryntZBBnbTJUwqG84WOKPMI0GpANlW9HjQcyDv?=
 =?Windows-1252?Q?3LMcTKV6ydMko6TKOml6kd1N7uF1mxOGtH88ov1/u+njHnVUZSy4jQKa?=
 =?Windows-1252?Q?6GtyU5yoLKD7djavWIHjZMyGYBAesNKSJ97RLYso+6WZfqxbqpBUYq8/?=
 =?Windows-1252?Q?Tb4wInHD+XG22s4NhEgsinpPmK7PTcAakwAS+eI9EXVwSaCz4gdDNEgd?=
 =?Windows-1252?Q?gZw9Zx4015waTpTOFV1zaMvzmUcNAKKiLHaV0HMWpUWzclkwrwAhEq2n?=
 =?Windows-1252?Q?r9nQu1p5G04=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PN3PPFC40C8B4CBFDA62100893C455CF3DE996DAPN3PPFC40C8B4CB_"
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PPFC40C8B4CB.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c9bbea-a29f-42c5-cdbc-08dda28c75d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 10:50:31.2562
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jxS8TBXZ+chIRRWm50OWE9gdrM4WIkcowZVehErRlzykbEip0YcPMBiy3SQLZfBb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB6349
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 10:50:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217803

--_000_PN3PPFC40C8B4CBFDA62100893C455CF3DE996DAPN3PPFC40C8B4CB_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi

I=92m working with the Yocto Project and would like to know is there a way =
to get the fully parsed or merged contents from both the .bb and any matchi=
ng .bbappend files of a recipe into a single file for debugging or inspecti=
on purposes?
I'm aware of using 'bitbake -e <recipe>' and 'bitbake-getvar' to inspect fi=
nal variable values, but I=92m looking for something that shows how the act=
ual source lines from the bb and bbappends come together ideally as a singl=
e, readable output.
Any suggestions, tools, or internal APIs that can help with this would be a=
ppreciated.
Regards,
Sana Kazi
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_PN3PPFC40C8B4CBFDA62100893C455CF3DE996DAPN3PPFC40C8B4CB_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Constantia, &quot;Hoefl=
er Text&quot;, serif; font-size: 11pt; color: rgb(0, 0, 0);">
Hi&nbsp;</div>
<div id=3D"Signature">
<div style=3D"font-family: Constantia, &quot;Hoefler Text&quot;, serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Constantia, &quot;Hoefler Text&quot;, serif; fon=
t-size: 11pt; color: rgb(0, 0, 0);">
I=92m working with the Yocto Project and would like to know is there a way =
to get the fully parsed or merged contents from both the .bb and any matchi=
ng .bbappend files of a recipe into a single file for debugging or inspecti=
on purposes?</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Constantia,=
 &quot;Hoefler Text&quot;, serif; font-size: 11pt; color: rgb(0, 0, 0);">
I'm aware of using 'bitbake -e &lt;recipe&gt;' and 'bitbake-getvar'&nbsp;to=
 inspect final variable values, but I=92m looking for something that shows =
how the actual source lines from the bb and bbappends come together&nbsp;id=
eally as a single, readable output.&nbsp;</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Constantia,=
 &quot;Hoefler Text&quot;, serif; font-size: 11pt; color: rgb(0, 0, 0);">
Any suggestions, tools, or internal APIs that can help with this would be a=
ppreciated.</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Constantia,=
 &quot;Hoefler Text&quot;, serif; font-size: 11pt; color: rgb(0, 0, 0);">
Regards,</div>
<div style=3D"margin-top: 1em; margin-bottom: 1em; font-family: Constantia,=
 &quot;Hoefler Text&quot;, serif; font-size: 11pt; color: rgb(0, 0, 0);">
Sana Kazi</div>
<div style=3D"background-color: rgb(255, 255, 255); margin: 0px;"></div>
</div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_PN3PPFC40C8B4CBFDA62100893C455CF3DE996DAPN3PPFC40C8B4CB_--

