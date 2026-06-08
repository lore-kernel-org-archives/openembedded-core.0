Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B13DECD8C9D
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 14:50:10 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.56415.1780930208439720692
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2026 07:50:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=BPAXGYDJ;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=BPAXGYDJ;
 spf=pass (domain: arm.com, ip: 52.101.72.41, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=j4kfQJfUJFCnGbWAOtnjrDdvT/YTBkkghcl4fSkQu2O7Am6CzM0U3f/15n9in5zAZdF6ZJDA1HNg0QUeKo4sHyHaeTYYfUT1Wdknd58RmaloxMLHqJqb2z8ZZZFiXZDB+b6+9pa5PpFxSx4eTIepRia3f3d6+RVsrsdYjhJd4mvFxZyPEsVse7l905jBMtBradr+6HkTecfdXEQnfI8WoceB9iZ4AQZjiEFf6kUriI6Owx9EJ1SoOP4c6+Tv2l4UO2MP2taDaZTxBmkdZZWJ85IdKjV1mXT0TFH7hcJYe6pZb/YgKxHgzL1omJ+eJIsv56xuMgNSDKowVNMRgyaX/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZncqB3t/+6rxAoqb9nSR7e69ZlZ2hbCBkLtxrsuXI8=;
 b=ODVWAUE+tB8VcTGsqX0duVrEiagR1ZCQy73fXvg+Kchyg06Zls6FYPM6ciWlDwxHw5XDYt9kZKlfhL6NJW+F/fAUVS7q5630wKt+2BekAJEMcxePnF6XV5V/CBxiXMzecUK+CZa3S/BUO5x+Kwri7DUTmsnK64C2n3gzEhPcedM2heDAxqbK4uBgdJsVCYDAkzh87DREKDKv9gfZmrM3RNF93TQLQ3R011tbRT0sdBFf3nzfeXlACIOC66RpuI2edhKfYdaWV/iNjl3Hmuahg/2aFB6Kvfu9EkcHXlvMDwxUnniCPaQZTODXWAyMEga3xWszc3MLX1CqEQWUf+YryQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=est.tech smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZncqB3t/+6rxAoqb9nSR7e69ZlZ2hbCBkLtxrsuXI8=;
 b=BPAXGYDJLrlHmZQ2vHEt7oj4bEi5Ym2D2BEdo5cPLFfXL6oaKC22d1XBEd3tcsybnyRO4jwx0Mf1/vpWQtF4Nxsnii6MTGM6Cw5ApFL+a+JfBBO5vqpmpTAvC3bOULNMQKB8iCrg6RLAoZhau1TeW2Fwsf42alzJm4erZ4L/mgs=
Received: from DU7P250CA0003.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::30)
 by DU0PR08MB8114.eurprd08.prod.outlook.com (2603:10a6:10:3ea::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 14:50:03 +0000
Received: from DB5PEPF00014B8C.eurprd02.prod.outlook.com
 (2603:10a6:10:54f:cafe::45) by DU7P250CA0003.outlook.office365.com
 (2603:10a6:10:54f::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.13 via Frontend Transport; Mon, 8
 Jun 2026 14:50:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B8C.mail.protection.outlook.com (10.167.8.200) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.7
 via Frontend Transport; Mon, 8 Jun 2026 14:50:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GIxzQrHnCoBYef+3B/OOJUqIPhg544Hwn+WlKYIgOEhQjsdNuIc4W4zCzGUsdMw0Q1It7jwiR3nkEnPHZR+OjrNZKSOX1YMXwooLARQZOPZKxJp27EM6wN9Be8YmITbu823WF93abonCvuz7zHKV6pk0YAJYkYLqCfANsxeQCuVU/lmxVMw1Y83G8rwrn+07Zwnqi0ckBoGDQGd6o7uT7cSMddk1tHtdJ4hGvUiis5jZbWQuS7AenUKOmsNY0e4fxlUzxHinpNcdU7P1Hzjl4B9qen438akhSc7EeiMAUtS3+g4P8LFVMndrCgcwfNB6kIn7k1pxiHJUkhB5h+eaoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZncqB3t/+6rxAoqb9nSR7e69ZlZ2hbCBkLtxrsuXI8=;
 b=q/kJ5dp3mSHK9k72LxMAhkl0NtojdA1W/F4t5KkM7zRChFqoRbHDd4d8ewU2jSYb+QyoMOUOmxWIXuhW3JN2U0R81ZnHKo8OHsGFV7tF+e4LiVAtJMZPBkKgyPhVWaV/IP1p6WNxb30YjRfWugyTw7EseAG+FTasE2kG5eKiFqC+dvXKf4hTOGyFSs504ZADSq2nzVPVU4CSt87I0hQUev5pzelDjfwyp1lvXnbqbUs6oIDRF4Wnyn8fzRnlfqNSQET9PdAUHDYphMVjQsUgKcpyKhmHfqikQnuZNmSgtsBZRlKugX9GjwKyZ771v46gI1EUI9Yi5J0wP6wm3WWB6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZncqB3t/+6rxAoqb9nSR7e69ZlZ2hbCBkLtxrsuXI8=;
 b=BPAXGYDJLrlHmZQ2vHEt7oj4bEi5Ym2D2BEdo5cPLFfXL6oaKC22d1XBEd3tcsybnyRO4jwx0Mf1/vpWQtF4Nxsnii6MTGM6Cw5ApFL+a+JfBBO5vqpmpTAvC3bOULNMQKB8iCrg6RLAoZhau1TeW2Fwsf42alzJm4erZ4L/mgs=
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com (2603:10a6:20b:287::19)
 by DB9PR08MB8359.eurprd08.prod.outlook.com (2603:10a6:10:3d9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 14:48:59 +0000
Received: from AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b]) by AM9PR08MB6258.eurprd08.prod.outlook.com
 ([fe80::171d:1f8b:720d:7a1b%6]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 14:48:59 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "pratik.farkase@est.tech" <pratik.farkase@est.tech>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@ericsson.com"
	<pratik.farkase@ericsson.com>
Subject: Re: [OE-core][PATCH v1] liburcu: ptest: add regression test suite
Thread-Topic: [OE-core][PATCH v1] liburcu: ptest: add regression test suite
Thread-Index: AQHc3uzsR6KO8KCc5EqG0VemkmsZ3bY07fqA
Date: Mon, 8 Jun 2026 14:48:59 +0000
Message-ID: <2A353F10-D041-49C7-B173-99AD2BAAD89E@arm.com>
References: <20260508131615.25076-1-pratik.farkase@est.tech>
In-Reply-To: <20260508131615.25076-1-pratik.farkase@est.tech>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.700.81.1.8)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM9PR08MB6258:EE_|DB9PR08MB8359:EE_|DB5PEPF00014B8C:EE_|DU0PR08MB8114:EE_
X-MS-Office365-Filtering-Correlation-Id: 98adfcc4-d97e-451b-5660-08dec56d3942
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: 
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700021|6133799003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info-Original: 
 KnDFksEeOAnwzeYUclrUBfsv8GU4KrKfOJea9U76zDpb4zO8YmZbFim6J0Tl/TyiBDf/prRbiVxwehXayOSWGaHNdNhwgzy+aG3a31EO5ONqmUZUolc/I5YoiO9vJrXejiF2QjJ7juMYnEum/DDWL0DcFs9DxUCLd9B3dEYPFeDVT50BY4lkpqlM7J3Z7ImEpTRBaA6MasHU2Ik2oKo5nHpUsd/OH23E2PVYI2mk9doP8klfBaBstt9TJm/kOpIyW9XOdF89cU+emBCD/HalD/c7p9Jh5+Gx3H89EtiDQFycOgn0NxYFAfU1+GXaGdPMfB1eHZwgTIW53vc63rdIQW6Sq/DbcJSQBgyhlx5BV3pJ4ZHT/c8yd22GKHSrdY8pzkyHc8E416EKFIX91/pL5Yomgs+Bc7He/ie6+ctgZpiyOztFFRKP5vu6Cbn+S9mC4V+mOZ7wrIi06x/NZ/YACpVZ8uUciqs2zCMs7pwQ4Yc+gzvinZJO2iAl7/C/5+J1QHuRr3L3Ttr9QW6nlRxVdE1vNcB8xAAkytmbwv+cuvASf8A74vg52kwgMnvpKnSTjsrYxrMjAaajbsmATaeKdiQZzVambgJ94TW/XkW6oRc0N7J1oE3T8ycm6VRC+SwtAu6ftnR8OizanAkY2qphLcD/cQ2eHIEqG6G1Cd7Rp6dOQLZ5enRC2BHfi53DQocFISuBbb4ivf+E8i/Y5mJGyDlx2muX6jBE0Ei4+4fhxj0iK/afU1NrLPYkldEZI/ev
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR08MB6258.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CC5A765FCB9119479518224CA788A187@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: 
 dq8nd7NXN+GJI2MDBLAAaxRIaAkt7/dUITKg0nw1R58OjIeX2PCxQEdkRgG9lsiCE/HdNPHFqn+e/LXqFx7IrVKs1T8t19uYmaJHNurq8JS/J7Jnm6rL3ZTvNk5N05azmiDBiw2Q8vfF9oA5/IMO4yVCqVPaCW7TtgjysAoZ0YTnOxoo3nbjuhkko+j9npKYiR5Sb3uPr3UAVriuW1hC0Go2R60O1RYhdKeclYqqpZBZE8ahBz3jgUQO8r0hK+aLETNi58dL3+8uZRSTHgbj8tQ3WoYKu/o6vXMFiwfQU13L5PAb+XkDXamJoWjmktA7dU/fNSm/Dw0C2DAYZBcG+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8359
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	c1b24754-b94a-48a4-cfc7-08dec56d1328
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|14060799003|1800799024|376014|82310400026|35042699022|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	cdAcn92tH3GSw9kBq1PPYStU8NAs7rXgPqeI9juWB6Fo5exg7IYSuisbxY7cUsnFSk06BsEdIwsRWue8OiqwhiF1OjQhd47CyEn41FMGFneVZsdPBKgpvhqjcLjQEbxyXRWyf8mdB/gWyQMrFocT5SS2GTplXoHzdzUQVB1ZankUH4+BxejygGxtvqJk6+g5p2wMqJ/T+0qmJw1y6wSNwB2ck791VBHaVPIhKEWE/MUy8DNRzpvwNyAFcsAWwx+gWDCu2EUjKjJ5UswLTk0HNg/WjhkCVv6bFK2ZDdW1Eoeh23vbu30acfk8Xr1XMk98+g2dhWi7mtrx/nLX1FuMvPjuNIuBHbObw32jS42un6NW4apcdRY8vf3YfCYppGnywFIAnmwWj3K37+cb48jPCxaDIk17ldadCcwVfKFMM5vkEeZs3et1V/Owwj3mGU9vtA9s1Zu1c3ymb8XmmmOXfeHurARxToRSjJd1HOzwgvkcShujbNafauzwhEgNuAtB/RAN3PW1enMT1oBnTJYS9JNjlQljGVjgXA32ojayccL2vXN2Khs/MoUvD1E5ZGdPJboKt9M8WCUx51LwOGUBiwpd1EpJDozT8UFSQaZLAXqv616gY/VY/jZZHFxFV0RIqMoA7/opdWCiWNScGifPBOyGSQ9nGIiyd/YZdttC8JcTWgAbTSDJupHq/O/XU3UKxTgQeBocf7pJZxmuL4VS2KVhZrhXkOtAEEgeltItji0=
X-Forefront-Antispam-Report: 
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(14060799003)(1800799024)(376014)(82310400026)(35042699022)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	hJYicDSLER5OzsTlOA5ujukjEC5upli5gs5hmhcCAT0hh4JBkyplW2PghjLeVMgVEJpe3lIVaiyTjN3YD4CVb0exBSt0Wyf2qhFoY2pYckdUs5vcBAJUCZBs7q1t4LoCG2SgbCwi+v4rwG5sfLBMKt3YIJqVVTvo6bJpDOqWj7Ut4qt4HcyCzqSHwvLsU4F3QP9XiAoqKkT7ZitnzoVejwGD4goXMohiwnIMTTWA6iLFi+IUpk7Pug+RAuF/pdhgx/3SCPaKYMLHKBq5vKjscF0RZkK/VArt7a6kjIOE8e4QRRZsDLGgPzFQ0MFPgfwU41LkSaWGBKbhUXS9/Qg1O4uke40mjIU3fGGEAFKxOzicCDnyGM1mx2GymgL1OgG8XFDHJFyTS15wZrxVlnhrApP03Ew0IDugqThlpne5HI8ThdIbsbTXzrC9/R21681O
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 14:50:03.4933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98adfcc4-d97e-451b-5660-08dec56d3942
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8114
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 14:50:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238250

T24gOCBNYXkgMjAyNiwgYXQgMTQ6MTYsIFByYXRpayBGYXJrYXNlIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxwcmF0aWsuZmFya2FzZT1lc3QudGVjaEBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gDQo+IEFkZCB0aGUgdXBzdHJlYW0gcmVncmVzc2lvbiB0ZXN0cyB0byB0aGUg
ZXhpc3RpbmcgcHRlc3QgZm9yIGZ1bGwNCj4gY292ZXJhZ2Ugb2YgYm90aCB1bml0IGFuZCByZWdy
ZXNzaW9uIHN1aXRlczoNCj4gDQo+IC0gcmN1dG9ydHVyZSBzdHJlc3MvcGVyZiB0ZXN0cyBhY3Jv
c3MgYWxsIFJDVSBmbGF2b3JzIChtZW1iYXJyaWVyLA0KPiBtYiwgYnAsIHFzYnIpIHdpdGggZ2xv
YmFsLCBwZXItY3B1LCBhbmQgcGVyLXRocmVhZCBjb25maWd1cmF0aW9ucw0KPiAtIHRlc3RfdXJj
dV9mb3JrIGFuZCB0ZXN0X3VyY3VfZm9ya19jeHggZm9yIGZvcmsrUkNVIGludGVyYWN0aW9uDQo+
IA0KPiBNb3ZlIGxpYnVyY3UgZnJvbSBQVEVTVFNfRkFTVCB0byBQVEVTVFNfU0xPVyBhcyB0aGUg
cmVncmVzc2lvbiB0ZXN0cw0KPiBhZGQgfjYgbWludXRlcyBvZiBydW50aW1lICh0b3RhbCAzNzlz
KS4NCj4gDQo+IFRlc3RlZCBvbiBxZW11eDg2LTY0IHdpdGggcHRlc3QtcnVubmVyOiAxMjIgUEFT
UywgMCBGQUlMICgzNzlzKS4NCg0KSeKAmW0gdW5jb252aW5jZWQgdGhhdCByZWdyZXNzaW9uL3N0
cmVzcyB0ZXN0cyB0aGF0IHRha2Ugc2l4IG1pbnV0ZXMgYXJlIGEgc3VpdGFibGUgdXNlIG9mIHB0
ZXN0Lg0KDQpSb3Nz

