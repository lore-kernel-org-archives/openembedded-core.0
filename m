Return-Path: <shin.matsunaga@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47208C47DDB
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 06:28:16 +0000 (UTC)
Received: from esa10.fujitsucc.c3s2.iphmx.com (esa10.fujitsucc.c3s2.iphmx.com [68.232.159.247])
 by mx.groups.io with SMTP id smtpd.web11.6026.1705991285317598293
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jan 2024 22:28:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=LlRDZHOT;
 spf=neutral (domain: fujitsu.com, ip: 68.232.159.247, mailfrom: shin.matsunaga@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1705991285; x=1737527285;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UX4oaT5aFJQjgxcEJ2sHHHEmTHrvVKYpXE4QnDW10MY=;
  b=LlRDZHOTbWWwkelcDwzVLiyzTeFDrhyKMc4KrxttMY6pz/hSa9hJfBIC
   vNOO+KOUw4AZVzgyCfQT6SZjslQX+RA/EzuxP4aY42yzZMzVkr8COCfUZ
   4c5B/zjivVikD0p3XTgWPU2snrJaz5AdYOq7RG3ejRmvohZuGBeEo0ms5
   ve8d3gw/hRsuICrdW6cQCls2G0GJYdKLdF/GuK9Kdv2Zbvo1nEo8TaSap
   73L5iKKDafTRYAQF1DLnAGCLVOKr/BGgW6alLOp2CDZiWu0LLg9PhIcsk
   o9/oSTXRcOfZYwPv7FGdDvTiiMa8LSScCRsexSITCMpBFpNUXTKv+IjEX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="109072592"
X-IronPort-AV: E=Sophos;i="6.05,213,1701097200"; 
   d="scan'208";a="109072592"
Received: from mail-os0jpn01lp2105.outbound.protection.outlook.com (HELO JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.105])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 15:28:01 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vzcx0xntZpWUgtw8kAjK8W9zVrPRk0nIzBaGorPkp5an55USz30UV6dkPfhwsUl719kzK4CB0L69eICF8AtDnp1CNXVaToYjVHmYLfBq/ZKxkT8P8TYsYpuM9ZwTkziscplaoaeUpG4Ekim92B9S5tzZRrL3UTm4u5qeCaTwApbOJwxrOc4jRmMj2R2vTYhGWxkq7t/Ks7qbi80gg13/WKS4nJAqSv4JbL+UiB4zUvRJOoWht4JtbuQjGQX/DSo+o+3GVSmn6qKpoWoeeLJzsjPgassQRv0Hzk53lcBL2Mb9EGyOD1fMAA5aXAdNBkcg5hmiUGW5EDM4oXOPrTSe1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIQOSfGBehCbpyeLQwOGeSrE1WuSglmLbVc53Bz4c54=;
 b=jjDXpeeyeiBYtYOzHT3/ws7ahjINAFXOP5d7QKyu4uEMqDaW7lHW3iMRHwjpknmyw8JFdHYx/kO78wUTXtKx+D1qY2ITVDeuFN+9RBjklHrRB6/d6UnvdwlDDYrjjdngZaS4TE9cMe0f7JG935BAgnizlbFBVikYUcc6XfnbNlNXmYhhep/7ztxPO8J5HnwNjqKlmuxSB99WYwgInMlOSdHBUMIzOZkVPU5FpuQ+s+QQirrbEsZJTQVb47EXECkFoZX7C/MTRGzOMlrPqGQYQg49Kf3Tf4ZqfbvOMnUbHnPR9W+85/b8Hzh/xjGttJQtdrYW/Lu8ubeRnRh2J8xAQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY3PR01MB11788.jpnprd01.prod.outlook.com (2603:1096:400:407::5)
 by TYWPR01MB8592.jpnprd01.prod.outlook.com (2603:1096:400:179::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.20; Tue, 23 Jan
 2024 06:27:58 +0000
Received: from TY3PR01MB11788.jpnprd01.prod.outlook.com
 ([fe80::24a:5396:b834:469]) by TY3PR01MB11788.jpnprd01.prod.outlook.com
 ([fe80::24a:5396:b834:469%6]) with mapi id 15.20.7228.020; Tue, 23 Jan 2024
 06:27:58 +0000
From: "Shinji Matsunaga (Fujitsu)" <shin.matsunaga@fujitsu.com>
To: "'ross.burton@arm.com'" <ross.burton@arm.com>
CC: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [PATCH] Revert "cve-check: Modify judgment processing using "="
 in version comparison"
Thread-Topic: [PATCH] Revert "cve-check: Modify judgment processing using "="
 in version comparison"
Thread-Index: AQHaJ58f8tlOZjRcwUSIZSE/nUGKxLC+En4ggB3Vv6CAC1IfgA==
Date: Tue, 23 Jan 2024 06:27:58 +0000
Message-ID: 
 <TY3PR01MB1178899FB16948A2A34DEBDBA92742@TY3PR01MB11788.jpnprd01.prod.outlook.com>
References: <20231205171839.1693642-1-ross.burton@arm.com>
 <TY2PR01MB3289D3B71F809070F9056935929EA@TY2PR01MB3289.jpnprd01.prod.outlook.com>
 <TY3PR01MB11788074557F62300C5551E1892732@TY3PR01MB11788.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <TY3PR01MB11788074557F62300C5551E1892732@TY3PR01MB11788.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?iso-2022-jp?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZl?=
 =?iso-2022-jp?B?Y2UwNTBfQWN0aW9uSWQ9M2RjYjIwNDQtZDMxMS00NzEyLWI0OTktZDgw?=
 =?iso-2022-jp?B?ZDJhMGNmOTAzO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFi?=
 =?iso-2022-jp?B?NGQtM2IwZjRmZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9h?=
 =?iso-2022-jp?B?NzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxl?=
 =?iso-2022-jp?B?ZD10cnVlO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQt?=
 =?iso-2022-jp?B?M2IwZjRmZWNlMDUwX01ldGhvZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3?=
 =?iso-2022-jp?B?Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9OYW1lPUZV?=
 =?iso-2022-jp?B?SklUU1UtUkVTVFJJQ1RFRBskQiJMJT8lUhsoQjtNU0lQX0xhYmVsX2E3?=
 =?iso-2022-jp?B?Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9TZXREYXRl?=
 =?iso-2022-jp?B?PTIwMjMtMTItMjhUMDE6NTU6MDFaO01TSVBfTGFiZWxfYTcyOTVjYzEt?=
 =?iso-2022-jp?B?ZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?iso-2022-jp?B?ZC04MWUxLTQ4NTgtYTlkOC03MzZlMjY3ZmQ0Yzc7?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11788:EE_|TYWPR01MB8592:EE_
x-ms-office365-filtering-correlation-id: 3f744ccd-a2f7-49fa-91d8-08dc1bdc70e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 xMuVtfaIk9XOBwZsgNSF3ojBAo9jmGoYPnGgJtAzWiNHOaB2JI4R7t1M/d1UdgrPSJJDMD6+CJhk2MCaWgyKIJ9oOjeoMjgArzKGBpwNpY0p/u/NeRvdWwN4V/TGdeYkzwfY7mP6oHPi2gpSQyfIkbmClm6GRZqQEHTVkjLIU1j1eyXAvw4LVt22qa1iiGN2MuznDdZEAEGGrxEAGpWHPERtOrFzxe8n6w0s/XWqjb4EQr1EpVuwHoGkPb5cdDRkJVirXBQeILR6zKqPSjGrjjVonOQB2wGcLs6nhGdCuzZQh/ABUYClHJyU+kd0v5S2AL1sGIeIrA/MO/1AM6V+05izeLot5KiQUpxamxxDD++AQDwBQtGaxnIDF9OFJk3zCzEDog8E1sHiwC1lMoc47sSv9HrdAN1zcM81XowwP9h1V6cTSaaLNC2yihVTyI6562t5bxpzDlYFArPsqO1F/obA0PbA4Kv/i93UY5tWtFUtiQbfLjRawom/hRw0wUTYE9gdO/DUuhXMFgXc/SJC/oVGkDWd5j3ld4xKqFqOWzjxEx8UZZYcowQ/09XrpHs0mmKtM1DnZ9i+nbyOfOjM6DTCStD+1aMp1sKQ5hytEJdxe9iAAeKhDZWyRibf2Wy/g71UKGKxtj6C3wSGQ/8loaC84R5gOhXLeNsLa7dbmo2HLx8V3mdHri3K0Vnd4H7QiaSeIgGoNzuERoq0bmfxUA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11788.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(136003)(376002)(366004)(396003)(230922051799003)(230173577357003)(230273577357003)(1800799012)(1590799021)(451199024)(186009)(64100799003)(38070700009)(55016003)(83380400001)(1580799018)(41300700001)(85182001)(86362001)(82960400001)(33656002)(38100700002)(122000001)(26005)(9686003)(7696005)(6506007)(66476007)(2906002)(53546011)(6916009)(66556008)(316002)(66946007)(76116006)(66446008)(478600001)(64756008)(71200400001)(52536014)(8936002)(4326008)(8676002)(5660300002)(491001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-2022-jp?B?cE02RGFYTFJjczNkUzV2YjNjSGdwMUVOdmd5dzZLWTYzbEpsQzVLbUpG?=
 =?iso-2022-jp?B?eGswZlZNaDRwTnlMK05rT3d3OEVOY01jTURDUVMwUWxocUU4TmYydURo?=
 =?iso-2022-jp?B?RHlvWXNaakNlZ1NNYW1Pa1N6VGN2VUExQXo4RlZ2MTN5M2dkekdJUnRH?=
 =?iso-2022-jp?B?MWhRa29EMGZZZHRYSXJYVFlKVm1abTd2d2JVVjNMNUsxbVJjdCtjZE85?=
 =?iso-2022-jp?B?eXRaMXN3S1pudjZLZnA1UlRQTUJKY3pLQWZCcFUvVUc5V2VMMXo1Ty9K?=
 =?iso-2022-jp?B?VG4vMkd1NVB1OVVtaXdFUjdKUGlRMTJZa2t4K25PdlJNQU1NRG1KUnkw?=
 =?iso-2022-jp?B?OER6bUhxMDZwcWZkN0Irbld2TFhoWTJOZFQ4V3BYQzV3Y20wNWNOSXYy?=
 =?iso-2022-jp?B?Q3crczloUkV2bFNsRXhMTXdYVUJZOXFXMGVWeWl4ZGxodFVMbzFFV2FN?=
 =?iso-2022-jp?B?WEpLN0QyalpiN0l5RVVuQ0tqL2I2VXB0VHF1ME9YWkc3ZXNvSm8vWlVl?=
 =?iso-2022-jp?B?eDhMYjdVbXhZd1h2U2xtMzRmZ3EzSHhOQW9yT2p6MEVIc1lhUkZUUk1C?=
 =?iso-2022-jp?B?RFh5b2EyWmxNOGJPVkQycE9pM0sxUGlwNkY3Uit5MWpjWW1ZSHplNGVT?=
 =?iso-2022-jp?B?bEFlaEdqci96Z1k3dUNTa21jLzZKRjU5UlJuVUxQRWljUjVVQXAva21i?=
 =?iso-2022-jp?B?RzFaUmVETTZxTUc0TmhDUVFnanlaQ3M4TkNWemV2Ky9ZcHpianRvMHJR?=
 =?iso-2022-jp?B?dWMxOVJnNFp3RkpwdzRKNmFxRHE1RytsYmFBKzk1TzBjRVR2Y0Q4VmdL?=
 =?iso-2022-jp?B?ZEFEQTNvVVZma09TMGxNWFR4ejQ3RlNicFFzT1hBczVSREovbDd6VEdE?=
 =?iso-2022-jp?B?aEVxQk45UjRQY2JnK1V2aFFlMjk5Mkg5a3l4ajY3eGtLYXVMK00yT3Bm?=
 =?iso-2022-jp?B?a1NtOEFNMlo5UEZidyt6VGJVWEVjanBMSkV1T2Rtc1R2OWg2KzZaUkFI?=
 =?iso-2022-jp?B?UytrZXIxTlExNmFreXVGcGF4TXh0WkpYNWNwMERaQVFmdkVEY2N5VEFJ?=
 =?iso-2022-jp?B?SXQ1bUk1VFlWSGk2aUlKYUV3aUc2RDd2MTFRRm9DYWZMRGZIb0p1dlNz?=
 =?iso-2022-jp?B?Vmxpc1RGczdHcW1xNStDcGhnQk83Rk5vWUZiOWxTMWJxcFVnbTgxWEVq?=
 =?iso-2022-jp?B?azhTQnVhRjhad1BEV1g4aG03dTRBQnEydWh2ejR4Uk5hVFpBdFBmd05y?=
 =?iso-2022-jp?B?b0duQXdWYmlUcUhmakNjcllFcnZ3T0tRVEtxMWVSWG1vSmJ5ZUpjT0lQ?=
 =?iso-2022-jp?B?ajRJYlhQUTRqOGF1RVhEMWx2M2lQWUZnQWdaY1lBNTdLUkhVRHdndGJn?=
 =?iso-2022-jp?B?ZWp0OVVHQ0I0Q053RTJZVW1jTFFGL1p3WU04L21NRlZkRE9TMy9yRDZz?=
 =?iso-2022-jp?B?VEwxODdaMEpZa0JIVEpvMGtmVmthQTNpdGl5a2d3UTV3ek5DcFpsMkZP?=
 =?iso-2022-jp?B?Uy94UjNWaVFzOTNlYWFXd1NQVkp4ak5mdUZ1dG1TZlNnSDVxUCt3TUZJ?=
 =?iso-2022-jp?B?MkRNNDZxU1FGSVhoMkx1UFFTTEE2c0xqeVdjYU9DRTFxZE93MCtVazN2?=
 =?iso-2022-jp?B?Z09JK1FVNW1ZZFNlSkEzVjRTbk5Lcy9oaS9pc043QVIyelF2b2szMTBi?=
 =?iso-2022-jp?B?NzUrSERCUnhVNGJITUlwNUVJQWJZNnRZeUc0KzVsSStQSGxDbVdEcW13?=
 =?iso-2022-jp?B?SDlxT0lPSGx4STFkTkszSkZ3cnFrRDBqS1Uzc3lJVjVjbkxWV0hlZC9J?=
 =?iso-2022-jp?B?M21sSTBjKzk5cW1xbmorQ3ZQRitSRnM5akcvbURxS3NjamhHMHhoM0NV?=
 =?iso-2022-jp?B?eitUQ2s4T21CQVVYVld5OUxTZFVheEJUVTh3UXIvMTRZeVJmWWlaY2lB?=
 =?iso-2022-jp?B?UzJUSWZNMy9UT1B3cE9SOEJTTFZ1S2xLdkc2TWpTWUg3Vlcwbk5MVXls?=
 =?iso-2022-jp?B?VjdFalhMWFpOblh0V0o3QjBsYlBCK2N3Mm1pU1dyZUdaaExVZUZQOHFT?=
 =?iso-2022-jp?B?MkZFK3V1U3NXaWQyY1ppQ3dha3JBZDljNGRudFJIRXY1THVEYWVJenZB?=
 =?iso-2022-jp?B?VElkK0NoQlRJSGl0YnhjR3g0ai9uT1duazQ4aVVjRllTY21mdXdkWUtF?=
 =?iso-2022-jp?B?bllYQmFsb3IrTTB3bFovV05hR29pdTJEWGRNQ2RyckE3amxzNWtLZll3?=
 =?iso-2022-jp?B?b3U3ZjhEdEhIcnNwSERESXB5dGE2dXl6S1N4MlBrSDF2UkViWUNReTdI?=
 =?iso-2022-jp?B?Qnd0K3ZndmQ5VjluUmFndEI2Nkx3V05Ma2c9PQ==?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	p7+3DPi5KJLLQi8r2cDUOziUUKKKUoWKIQsGg2UXgfq5HxQ1wdGsgHsdTG1CzC5X4W7+hQoP8N0pIf3drsfE2xAquV9gWXc1XtNFHJxyeu6bUQK2SC5rDkkOwQZMpJMojf3pqZrxGpRYfB8lhLr2sWsEXv12+3lZOouAkO5ntW1b0mse/ieRyOcApQSOiHGyDNaFqEvYgWayv+9ffEk8wBMPPeLbKLiEjZNWJRyPrjyn78ncaLcO/1KbfPWsTlNL6FRHmhu1bRqxOo92PU4WdsI5iYCvhjQNE0o969+0I6UjBzgHg/8Fhr9F9mTM9ftR6Pa7h0WIS9cmQRIXFUNMN3JX3P3u1+Sb5PYGbLYiRqRXZQoT9MmoKwQQoxi1VB+DkpktlUrGFs7SqlAHacmbU91/XjEjP20C2de5LDFME58qxY1hm05zQognELllvWhB9G2XW2gpdBTx/kwWu9P3KLGUaGU+BjAQS/H4dxv3FaIU4vIjyr/3EmrBkTOx35jLNGjNWIYGueuD1yMZf9UqbpH4Hid2QJAb5dny3BEWJsOplu9Jt6DSv6Vp/NYRz0Ci5buarIKExlDJe9acFZDQ0NDCC1qtCENj2b11O9P6glZ2PfXwdvROhbDYF51i8M1O
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11788.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f744ccd-a2f7-49fa-91d8-08dc1bdc70e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2024 06:27:58.0178
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZojfKgEJGcovX5FYY2uONqDKXSqaofufvHCtNgR7ITL0YozASNjqPfiowtuEp2ampTRJ5CeKMsZn8nUA2Vj3fCu2IHX2ZaLEroMOsC8Bjsg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8592
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jan 2024 06:28:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194204

Hi, Ross,

What does "too common an issue" mean?
Is it okay to ignore the misjudgment by the following cases?

e.g. PV =3D "1.2.0" and Vulnerabilities Affected Versions (registered with =
NVD) =3D "1.2"

Regards,
Shinji

-----Original Message-----
From: Matsunaga, Shinji/=1B$B>>1J=1B(B =1B$B?5;J=1B(B=20
Sent: Tuesday, January 16, 2024 10:47 AM
To: 'ross.burton@arm.com' <ross.burton@arm.com>
Cc: 'openembedded-core@lists.openembedded.org' <openembedded-core@lists.ope=
nembedded.org>
Subject: RE: [PATCH] Revert "cve-check: Modify judgment processing using "=
=3D" in version comparison"

Hi, Ross,

What do you think about the following?

Regards,
Shinji

-----Original Message-----
From: Matsunaga, Shinji/=1B$B>>1J=1B(B =1B$B?5;J=1B(B=20
Sent: Thursday, December 28, 2023 10:59 AM
To: 'ross.burton@arm.com' <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: RE: [PATCH] Revert "cve-check: Modify judgment processing using "=
=3D" in version comparison"

Hi, Ross,

What does "too common an issue" mean?
Is it okay to ignore the misjudgment by the following cases?

e.g. PV =3D "1.2.0" and Vulnerabilities Affected Versions (registered with =
NVD) =3D "1.2"

Regards,
Shinji

-----Original Message-----
From: ross.burton@arm.com <ross.burton@arm.com>=20
Sent: Wednesday, December 6, 2023 2:19 AM
To: openembedded-core@lists.openembedded.org
Cc: Matsunaga, Shinji/=1B$B>>1J=1B(B =1B$B?5;J=1B(B <shin.matsunaga@fujitsu=
.com>
Subject: [PATCH] Revert "cve-check: Modify judgment processing using "=3D" =
in version comparison"

From: Ross Burton <ross.burton@arm.com>

This change introduced a warning if version comparisons failed, but this is=
 far too common an issue in data that we don't control, so this shouldn't c=
ause a warning:

WARNING: automake-native-1.16.5-r0 do_cve_check: automake: Failed to compar=
e 1.16.5 =3D branch_1-9 for CVE-2009-4029
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m1 for CVE-2010-4539
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m2 for CVE-2010-4539
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m3 for CVE-2010-4539
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m4\/m5 for CVE-2010-4539
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m1 for CVE-2010-4644
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m2 for CVE-2010-4644
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m3 for CVE-2010-4644
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m4\/m5 for CVE-2010-4644
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m1 for CVE-2011-0715
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m2 for CVE-2011-0715
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m3 for CVE-2011-0715
WARNING: subversion-1.14.2-r0 do_cve_check: subversion: Failed to compare 1=
.14.2 =3D m4\/m5 for CVE-2011-0715
WARNING: automake-1.16.5-r0 do_cve_check: automake: Failed to compare 1.16.=
5 =3D branch_1-9 for CVE-2009-4029
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 =
=3D pre0.59s for CVE-2003-0577
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 =
=3D pre0.59s for CVE-2004-0982
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 =
=3D pre0.59s for CVE-2004-1284
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 =
=3D pre0.59s_r11 for CVE-2006-3355
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 =
=3D pre0.59s for CVE-2007-0578
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 =
=3D pre0.59s_r11 for CVE-2007-0578
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 =
=3D pre0.59s for CVE-2009-1301
WARNING: mpg123-1.32.3-r0 do_cve_check: mpg123: Failed to compare 1.32.3 =
=3D pre0.59s_r11 for CVE-2009-1301

This reverts commit a1989e4197178c2431ceca499e0b4876b233b131.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta/classes/cve-check.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s index 086d87687f4..5191d043030 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -375,7 +375,6 @@ def check_cves(d, patched_cves):
                         try:
                             vulnerable_start =3D  (operator_start =3D=3D '=
>=3D' and Version(pv,suffix) >=3D Version(version_start,suffix))
                             vulnerable_start |=3D (operator_start =3D=3D '=
>' and Version(pv,suffix) > Version(version_start,suffix))
-                            vulnerable_start |=3D (operator_start =3D=3D '=
=3D' and Version(pv,suffix) =3D=3D Version(version_start,suffix))
                         except:
                             bb.warn("%s: Failed to compare %s %s %s for %s=
" %
                                     (product, pv, operator_start, version_=
start, cve))
--
2.34.1


