Return-Path: <yanxk.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C45C54EE9
	for <webhook@archiver.kernel.org>; Mon, 19 Sep 2022 06:44:46 +0000 (UTC)
Received: from esa3.fujitsucc.c3s2.iphmx.com (esa3.fujitsucc.c3s2.iphmx.com
 [68.232.151.212])
 by mx.groups.io with SMTP id smtpd.web11.17022.1663569875961438623
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Sep 2022 23:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=gFKC79+z;
 spf=pass (domain: fujitsu.com, ip: 68.232.151.212,
 mailfrom: yanxk.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1663569876; x=1695105876;
  h=from:to:subject:date:message-id:mime-version;
  bh=8Ce1QD/IxrtLSpBgOrM2enpngeQa1BfYNXdizb73GMQ=;
  b=gFKC79+z4cM5cSvOhp8PYvlJs5ea3zKDsL2ga4rWPWEMeGVpB3j3LRMk
   4CreTYV2qTJQocOJ99mRdU4L29ZpmkWZMo2UIev8GsSMalYysZYi10b8k
   thSc7odnWa0aWFU6UAFdxnIGtGZk5ptAQhDMd5/Gm/6A9iD0t3qzXGcT8
   /UFPR62lmMSpcfm/I/rIaFmhT1BM2Q7+LQHLoBM2J77W4j4nF9+35cOin
   hxaIzjZ7HMMFrS8Bj4GUbI7RqozbH7v0nn9oHawo4vwPhTFzMbMIAU9b6
   pRRqaaP7JCWjnNsqmbtyXOkaf9kNkpCgUUbATDiKtbpN+P2mSCePaPEba
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="73548830"
X-IronPort-AV: E=Sophos;i="5.93,327,1654527600";
   d="scan'208,217";a="73548830"
Received: from mail-os0jpn01lp2111.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.111])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 15:44:33 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m53tqsicD0TFQRizuf6wbGNBWyFN542zxUmsngz4EUC06ygxIf6VRo8sYRoYWwzSI4LuR/SZXdP2r5R2D/q3xcU9pQxwCVRVKcfw9I+r/WgAWpLyKCPYscMbcDo14OyqPB5KVV245WJhUtMnWCnylThuSHczFuLABGpOKSAQbX/MZeDol2JaFng/IbMVZOulsoT8Aj5nDHJPy1JB7ZUCXrlDwuuS+7+Lq6rKDhtDSF4GEDSReXA6ucj5FnNBGMRDrYpNKX+YvsDZrcgxpzXD2u11kAWRyELGJj4SOPGkx+2rWnAg1bZMLQtmA60/4UWaOoDw6rLFJppHATjCGGQB1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9CrIAN5A0nsKFIfaYByBQKNlv02dIV94KnPhjJWuLTc=;
 b=YIJC0D0/gl97OuIfHx4pDANg7omoLvsCNh76ZBYZ9dnqesqrvaIFmhX/QCMDS1ftrARyVSXIIWhmxik/8baWKqIPXiAnZ2S5aVPTlf1ZdAtDP4B+vsePBCPZ6s70rqiAI3olyeAjIgS9Ll5wueBGZGA9D4UszF51P2Lq3AeoaIQt53VVI6GKzSJvOJNqlFfdq4B0yPO1e/p3xADPzTceEPNhhVu5XvoqMuONIOmKkoCUC47FW9zEvRQkAw4LYxVa4XjL9vLCpK1dnTlw4HbQM1Ryr1/pD+4hYeJ/ila4kyOSpQt0mDUtrI9fYU1GTp6WuAXeAGECXN6JLEG1ZjOfvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TY2PR01MB4155.jpnprd01.prod.outlook.com (2603:1096:404:d8::17)
 by TYWPR01MB10756.jpnprd01.prod.outlook.com (2603:1096:400:2a4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.17; Mon, 19 Sep
 2022 06:44:30 +0000
Received: from TY2PR01MB4155.jpnprd01.prod.outlook.com
 ([fe80::1145:ce20:3134:68f0]) by TY2PR01MB4155.jpnprd01.prod.outlook.com
 ([fe80::1145:ce20:3134:68f0%2]) with mapi id 15.20.5632.019; Mon, 19 Sep 2022
 06:44:30 +0000
From: "yanxk.fnst@fujitsu.com" <yanxk.fnst@fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: [oe] [meta-oe][PATCH] bc: Add ptest.
Thread-Topic: [oe] [meta-oe][PATCH] bc: Add ptest.
Thread-Index: AdjL8n5h1xMUHd76QfiRwMiTlufDHQ==
Date: Mon, 19 Sep 2022 06:44:29 +0000
Message-ID: 
 <TY2PR01MB415557D074E6D1FF5A605BC8934D9@TY2PR01MB4155.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?gb2312?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?gb2312?B?NTBfQWN0aW9uSWQ9MGVjMDEyZmEtYjk3NC00M2ZhLWE1ZTgtMDIxMjdmYTVm?=
 =?gb2312?B?N2YyO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?gb2312?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?gb2312?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?gb2312?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?gb2312?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?gb2312?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFRKlWPz87TVNJ?=
 =?gb2312?B?UF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBf?=
 =?gb2312?B?U2V0RGF0ZT0yMDIyLTA5LTE5VDA2OjM4OjAyWjtNU0lQX0xhYmVsX2E3Mjk1?=
 =?gb2312?B?Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9TaXRlSWQ9YTE5ZjEy?=
 =?gb2312?Q?1d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR01MB4155:EE_|TYWPR01MB10756:EE_
x-ms-office365-filtering-correlation-id: 9b4aee65-1cb5-476b-5daf-08da9a0a673e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 o7v1vCKB4T66Yu1wVToZJYjo6XJP/4b0EhxKeYE4VS9ScWlc9dqTpfrEk+1o4cvSRKj5cvI9PUy9cE8iSLQ54oNLDfc9ZzLZ80udoiu865PaxcZ2goM/Ua7Vlzt/OxBWF1i8jvKUaEgViHBULVxSv2Uz1CyzYephqh+F/xOCmweK/IMmrTxfPjQg52+cX+GGy+1cIppR8k8CE7lmfI5dLpHoQQad8HCHFM3hKg4JQeQ8ynnsnaXpEVQ1SMj47ouHaoIDZ7ti17rKHqspSiIpUGUo/IxC+7lMWTnYSnvzlf/bJbocZJqOxU3WRstb2UEzbircBZh+lqHUWO2QWdIA2yc6tZ2YGWlpBT4HcbwBorYj9+oHEr7bVG8U89ITfEh7eRgVnVXFO50KhusrBJwue5/iFBuQhEwzC1jncowBU6D4h/hy9ELPjtf15ryMPJzabzAtuodb+PMJ0u3jvfgsImSBR1mt4dglPWhUwp4kl/SGUOj5dTdn9rPweLz5LR5udr1wcPEEosige/Y7lLL53nnS7lXVdZvqjQdELTErScM4pTS6aEL3mR5IQCKB/EE8v6BDylPYpHxuQNWqawnHZF/9uPBN9c1PmIwTqYVuVIbWyplMtOc0iaDHmZMZOgzJP83IgctJjuEYqbBUw1BCmm2MY327AqXmolYFEKdx0dhfEpR4hBFPrhYrCcjRohqfpzs+z0UTIb9UApkqE8t6vFgvlYftdyQYPvlQPj+e9IqRQJL6UC8sO/DQG9BTsNwOadkpi5jI3cIfWQnfcOl4WZY6J0ZIo4UiDa+9tPUjL4c=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB4155.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(366004)(396003)(136003)(376002)(39860400002)(1590799012)(451199015)(66476007)(86362001)(7696005)(64756008)(8676002)(6506007)(8936002)(26005)(66556008)(52536014)(66446008)(38070700005)(41300700001)(85182001)(33656002)(71200400001)(6916009)(76116006)(66946007)(478600001)(186003)(2906002)(316002)(9686003)(83380400001)(5660300002)(122000001)(82960400001)(38100700002)(55016003)(1580799009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?gb2312?B?cTdYYVhhTUFJekJZNjc4RGNPdTdiMEl1Q3R0c1liSVJHdXM5TUtudGs0bkda?=
 =?gb2312?B?RWNCb2M4ekJwNUdONitaS0tLRTkxUUh4L0tRSU1NcHYzVEhNYy9DSFRUNWxK?=
 =?gb2312?B?UTBlQ3RHOExtNzB6SUJuSUN5bFhrdUVoRGJSN2ZnQVZ1TnFZbnlmV2Q1cUdD?=
 =?gb2312?B?WnBIZXhSaGJhNlV2aFNPcjNobk5kS0JHVzRzb3lFSTd1UTVkWE9yRXJIZkw2?=
 =?gb2312?B?WmFjVWRNMnpGLzZCVU14NGx6WlExdEhrTFlibGhmeGdheE1lak1tMG5nbDJW?=
 =?gb2312?B?cDNoY2luQk1TSnlIMmJ6V0U2Uy9Wd0M0VDJ0dE5wRmVZK0pJSThXOXdUaVh1?=
 =?gb2312?B?dWdYZ2dmNGdFY2xVbEV0SE1mTFVNaG1zdGVpY1NEOCtuWlZMK0pFYXFEL0Jv?=
 =?gb2312?B?RDVmeXlFclFydDQ5bXZoMVVSRnJpaXcwZi9tcC9GM1B1dEw4OXI2VlA0SHVN?=
 =?gb2312?B?dnhrelZnZG9lVGs0K0NBaVA3QmlMdVk4SDZ1WUZ5L3lGMTFYalB5eTBDeVN2?=
 =?gb2312?B?cEIzY3pBRldTaXEvZEM4NHl0ZUNjQVNwcTR4SGkxS2w2WEc1ZVdSRWdJcW56?=
 =?gb2312?B?QXhoRzdZTTJ3bCtXUkhxMFZWeGJFMUZ0WXpCdFMwTkJxOXdrSHNSWGw2SXN5?=
 =?gb2312?B?UVorNXRUMDVZOGpxUFNhUlJycG5WYVVIcUV1Q0UvQ1NpMm5USVVOWkQ2V2x2?=
 =?gb2312?B?SE9RbnFGYWd6YjFpWW15RHBoQkFYOG1vNzB6ZENlSU9nMWoydTBoc2U4dUp5?=
 =?gb2312?B?MHl6ekcvQ1gveHlCL295RldFZnlzRWJZdjEzSmFIV0JYTDNsaEVoU3daZHBY?=
 =?gb2312?B?M0Vrb0E5N1BUUVBtZVpTaVdNSDhCaG9qUk9iaHA2MHNBVTIvRHkwNHN3Zjhp?=
 =?gb2312?B?QmkvTE1tYWwzemZVL0d6VWR4L0FkVGpzRzdKejA2Qjl2RjJ1MUp6MWZEU0VU?=
 =?gb2312?B?TUZPK0JJMHVwbE5UUXBxbU50RzBLZit1VXdmNnIvN0RYeEdVeDhTQ1FFZG84?=
 =?gb2312?B?WlFjWkpXVWhyS2YrRUZzVEFiSDVVQ284Mm5SdXBJREYzM2JURytJeHYwQTRs?=
 =?gb2312?B?SXphTUNWS2RONHRWdllSZEM5M2dBZEZScU9rZGk2cmZxaWpON0FRVUp4ZlM3?=
 =?gb2312?B?YU9kMmkyVWdYNXhseER6eWZSNjEzNzNRc2k0TVFzdDhVVGRBOG55bnVDd0FZ?=
 =?gb2312?B?dDFWbFM2L1Q4SEFHWURUUm0rcjFhSjNEVVlFd3MweE5oNW5ONEVkMkszMXdK?=
 =?gb2312?B?Y2NKVlV1ciszYTlkMTZTbmlkWmhzT0lRWXlHcGpNdGVXNldydHlLNVlGK2tH?=
 =?gb2312?B?R2ZuUzJGTjFTV1VuWnhXZlNCRnYyVGN0dUlNcW9tUGZhVGIvYi91RTg3WWZv?=
 =?gb2312?B?YllmNDNVTTBLcDc3Nlo3eVlzeGVpR1hDbnZ2NVdzVXFWT29CYm0yb0lPWVRw?=
 =?gb2312?B?bVlqeWtoalRMYXIrdE1lZnV5VU1TTHJlRFY4aVphL1MrOGw4SGxuTXM1bE9x?=
 =?gb2312?B?U3VGVzFuUG8zVWwzUXlUMlpqWDBxN3VBZVpqdks2bmc4OE9xbEF2Vk1EQUZn?=
 =?gb2312?B?NnlGZXRYcDQrQXhyOTFzTmJ3cFZDRVp1a3NGaDdiNENEV3NPVTh3aEc2bG9M?=
 =?gb2312?B?VmtxRGdWbnRyN3g3cENoZ1hHK1VFRXhWZG4yS2VUR2xnOEc1Q0N6ZW9HSkNT?=
 =?gb2312?B?NDRqaXhaT1Ztc0VNdWJQTm40T2VxMFFxaXdyTWRCWmRpVVlQL1lRMFBtc3Nq?=
 =?gb2312?B?bDNBb3JHNGN6WmZLVlJ1cmpEWGlwaEdqb3dpNGJGODR4UThiKytJeUVsQVRW?=
 =?gb2312?B?dzViTEhNN1kyNUViTlZqWUxWd2E3eTd6R1pHUXExYldESE9WMWZlcU1RRHNO?=
 =?gb2312?B?a1BDZHJwOWZPUk1mUythK0tLcVRudUcvS0UzNFdMbElqbVdEeG5EaG5WZGpm?=
 =?gb2312?B?ekRSb3d4NVY3SlB3Z2tya0FyVFlKUDMveG9tQ0lFVzMwZzZyK1lUcEpxS2JQ?=
 =?gb2312?B?bFZsV2JsdjBIbHVoWDViMkZvWlhsYXB1SURSaVFHTDYxV2FGUHdIY0grcEdN?=
 =?gb2312?B?NzdJMFRuck1nMVZBWkFCQ2t0K255SzI3emt4TWlROE1aeEppK25rNHp5RHNX?=
 =?gb2312?Q?o6zz2/C7NATUpAEUtz79LrEp5?=
Content-Type: multipart/alternative;
	boundary="_000_TY2PR01MB415557D074E6D1FF5A605BC8934D9TY2PR01MB4155jpnp_"
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB4155.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9b4aee65-1cb5-476b-5daf-08da9a0a673e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2022 06:44:29.8212
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 97tVvl1DWKIB7ADwvy/XBfaxOJlHvibkmyqcUi5P8qilX6uG+nsbhhVDAhUwSbM40A+gTtLCPHwWXSvxf6pxzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10756
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Sep 2022 06:44:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170857

--_000_TY2PR01MB415557D074E6D1FF5A605BC8934D9TY2PR01MB4155jpnp_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

UHJvdmlkZSBhIHBhdGNoIHRvIGVuYWJsZSB0aGUgcHRlc3QgZnVuY3Rpb24gb2YNCnRoZSBPU1Mg
J2JjJyBieSByZXVzaW5nIHRoZSBvcmlnaW5hbCB0ZXN0IG9mIHRoZSBPU1MNCml0c2VsZiB3aXRo
IHNtYWxsIGFkanVzdG1lbnQgaW4gdGhlICd0aW1ldGVzdCcgc2NyaXB0Lg0KDQpUaGlzIHB0ZXN0
IHdhcyBwbGFjZWQgaW4gdGhlIFBURVNUX1NMT1cgcXVldWUgc2luY2UgaXQNCnRha2VzIHVwdG8g
NDhzIHRvIGV4ZWN1dGUgb24gdGhlIHFlbXVhcm0uDQoNClNpZ25lZC1vZmYtYnk6IFlhbiBYaW5r
dWFuIDx5YW54ay5mbnN0QGZ1aml0c3UuY29tPg0KLS0tDQouLi4vZGlzdHJvL2luY2x1ZGUvcHRl
c3QtcGFja2FnZWxpc3RzLmluYyAgICAgfCAgMSArDQptZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYmMv
YmMvcnVuLXB0ZXN0ICAgICAgICAgfCAgOCArKysrKysNCm1ldGEvcmVjaXBlcy1leHRlbmRlZC9i
Yy9iY18xLjA3LjEuYmIgICAgICAgICB8IDI4ICsrKysrKysrKysrKysrKysrLS0NCjMgZmlsZXMg
Y2hhbmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCmNyZWF0ZSBtb2RlIDEw
MDY0NCBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYmMvYmMvcnVuLXB0ZXN0DQoNCmRpZmYgLS1naXQg
YS9tZXRhL2NvbmYvZGlzdHJvL2luY2x1ZGUvcHRlc3QtcGFja2FnZWxpc3RzLmluYyBiL21ldGEv
Y29uZi9kaXN0cm8vaW5jbHVkZS9wdGVzdC1wYWNrYWdlbGlzdHMuaW5jDQppbmRleCA1NjA4OGU0
ZTY2Li41Y2JlZDU0Y2M1IDEwMDY0NA0KLS0tIGEvbWV0YS9jb25mL2Rpc3Ryby9pbmNsdWRlL3B0
ZXN0LXBhY2thZ2VsaXN0cy5pbmMNCisrKyBiL21ldGEvY29uZi9kaXN0cm8vaW5jbHVkZS9wdGVz
dC1wYWNrYWdlbGlzdHMuaW5jDQpAQCAtMTAwLDYgKzEwMCw3IEBAIFBURVNUU19TTE9XID0gIlwN
CiAgICAgdGNsLXB0ZXN0IFwNCiAgICAgdXRpbC1saW51eC1wdGVzdCBcDQogICAgIHZhbGdyaW5k
LXB0ZXN0IFwNCisgICAgYmMtcHRlc3QgXA0KIg0KIFBURVNUU19TTE9XOnJlbW92ZTpyaXNjdjY0
ID0gInZhbGdyaW5kLXB0ZXN0Ig0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9i
Yy9iYy9ydW4tcHRlc3QgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYmMvYmMvcnVuLXB0ZXN0DQpu
ZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAwMDAwMC4uN2UzN2U5ZWYwMQ0KLS0tIC9k
ZXYvbnVsbA0KKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2JjL2JjL3J1bi1wdGVzdA0KQEAg
LTAsMCArMSw4IEBADQorIyEvYmluL2Jhc2gNCitjZCAuL2JjX3Rlc3QNCitpZiAuL3RpbWV0ZXN0
OyB0aGVuDQorICAgICBlY2hvICJQQVNTOiBiYy90aW1ldGVzdCINCitlbHNlDQorICAgICBlY2hv
ICJGQUlMOiBiYy90aW1ldGVzdCINCitmaQ0KKw0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1l
eHRlbmRlZC9iYy9iY18xLjA3LjEuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvYmMvYmNfMS4w
Ny4xLmJiDQppbmRleCAxYmVjNzZiYjJhLi45ZDQzOWQ5MzEyIDEwMDY0NA0KLS0tIGEvbWV0YS9y
ZWNpcGVzLWV4dGVuZGVkL2JjL2JjXzEuMDcuMS5iYg0KKysrIGIvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2JjL2JjXzEuMDcuMS5iYg0KQEAgLTE1LDExICsxNSwxMiBAQCBERVBFTkRTID0gImZsZXgt
bmF0aXZlIg0KU1JDX1VSSSA9ICIke0dOVV9NSVJST1J9LyR7QlBOfS8ke0JQfS50YXIuZ3ogXA0K
ICAgICAgICAgICAgZmlsZTovL25vLWdlbi1saWJtYXRoLnBhdGNoIFwNCiAgICAgICAgICAgIGZp
bGU6Ly9saWJtYXRoLmggXA0KLSAgICAgICAgICAgZmlsZTovLzAwMDEtZGMtZml4LWV4aXQtY29k
ZS1vZi1xLWNvbW1hbmQucGF0Y2giDQorICAgICAgICAgICBmaWxlOi8vMDAwMS1kYy1maXgtZXhp
dC1jb2RlLW9mLXEtY29tbWFuZC5wYXRjaCBcDQorICAgICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0
Ig0KU1JDX1VSSVttZDVzdW1dID0gImNkYTkzODU3NDE4NjU1ZWE0MzU5MDczNmZjM2NhOWZjIg0K
U1JDX1VSSVtzaGEyNTZzdW1dID0gIjYyYWRmY2E4OWIwYTFjMDE2NGMyY2RjYTU5Y2EyMTBjMWQ0
NGMzZmZjNDZkYWY5OTMxY2Y0OTQyNjY0Y2IwMmEiDQotaW5oZXJpdCBhdXRvdG9vbHMgdGV4aW5m
byB1cGRhdGUtYWx0ZXJuYXRpdmVzDQoraW5oZXJpdCBhdXRvdG9vbHMgdGV4aW5mbyB1cGRhdGUt
YWx0ZXJuYXRpdmVzIHB0ZXN0DQogUEFDS0FHRUNPTkZJRyA/Pz0gInJlYWRsaW5lIg0KUEFDS0FH
RUNPTkZJR1tyZWFkbGluZV0gPSAiLS13aXRoLXJlYWRsaW5lLC0td2l0aG91dC1yZWFkbGluZSxy
ZWFkbGluZSINCkBAIC0yOSw2ICszMCwyOSBAQCBkb19jb21waWxlOnByZXBlbmQoKSB7DQogICAg
IGNwIC1mICR7V09SS0RJUn0vbGlibWF0aC5oICR7Qn0vYmMvbGlibWF0aC5oDQp9DQorUkRFUEVO
RFM6JHtQTn0tcHRlc3QgKz0gImJhc2giDQorDQorZG9fY29tcGlsZV9wdGVzdCgpIHsNCisgICAg
IGluc3RhbGwgLWQgJHtCfS9UZXN0Lw0KKyAgICAgaW5zdGFsbCAke1N9L1Rlc3QvdGltZXRlc3Qg
JHtCfS9UZXN0L3RpbWV0ZXN0DQorICAgICBzZWQgLWkgIjYsOGQiICR7Qn0vVGVzdC90aW1ldGVz
dA0KK30NCisNCitkb19pbnN0YWxsX3B0ZXN0KCkgew0KKyAgICAgaW5zdGFsbCAtZCAke0R9JHtQ
VEVTVF9QQVRIfS9iY190ZXN0Lw0KKyAgICAgaW5zdGFsbCAke1N9L1Rlc3QvYXRhbi5iICR7RH0k
e1BURVNUX1BBVEh9L2JjX3Rlc3QvDQorICAgICBpbnN0YWxsICR7U30vVGVzdC9kaXYuYiAke0R9
JHtQVEVTVF9QQVRIfS9iY190ZXN0Lw0KKyAgICAgaW5zdGFsbCAke1N9L1Rlc3QvZXhwLmIgJHtE
fSR7UFRFU1RfUEFUSH0vYmNfdGVzdC8NCisgICAgIGluc3RhbGwgJHtTfS9UZXN0L2ZhY3QuYiAk
e0R9JHtQVEVTVF9QQVRIfS9iY190ZXN0Lw0KKyAgICAgaW5zdGFsbCAke1N9L1Rlc3Qvam4uYiAk
e0R9JHtQVEVTVF9QQVRIfS9iY190ZXN0Lw0KKyAgICAgaW5zdGFsbCAke1N9L1Rlc3QvbG4uYiAk
e0R9JHtQVEVTVF9QQVRIfS9iY190ZXN0Lw0KKyAgICAgaW5zdGFsbCAke1N9L1Rlc3QvbXVsLmIg
JHtEfSR7UFRFU1RfUEFUSH0vYmNfdGVzdC8NCisgICAgIGluc3RhbGwgJHtTfS9UZXN0L3JhaXNl
LmIgJHtEfSR7UFRFU1RfUEFUSH0vYmNfdGVzdC8NCisgICAgIGluc3RhbGwgJHtTfS9UZXN0L3Np
bmUuYiAke0R9JHtQVEVTVF9QQVRIfS9iY190ZXN0Lw0KKyAgICAgaW5zdGFsbCAke1N9L1Rlc3Qv
c3FydC5iICR7RH0ke1BURVNUX1BBVEh9L2JjX3Rlc3QvDQorICAgICBpbnN0YWxsICR7Qn0vVGVz
dC90aW1ldGVzdCAke0R9JHtQVEVTVF9QQVRIfS9iY190ZXN0Lw0KK30NCisNCkFMVEVSTkFUSVZF
OiR7UE59ID0gImJjIGRjIg0KQUxURVJOQVRJVkVfUFJJT1JJVFkgPSAiMTAwIg0KLS0NCjIuMjUu
MQ0KDQo=

--_000_TY2PR01MB415557D074E6D1FF5A605BC8934D9TY2PR01MB4155jpnp_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:=B5=C8=CF=DF;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"\@=B5=C8=CF=DF";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
	font-family:=B5=C8=CF=DF;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:=B5=C8=CF=DF;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:=B5=C8=CF=DF;}
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word;text-justify-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Provide a patch to enable the p=
test function of<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">the OSS 'bc' by reusing the ori=
ginal test of the OSS<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">itself with small adjustment in=
 the 'timetest' script.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">This ptest was placed in the PT=
EST_SLOW queue since it<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">takes upto 48s to execute on th=
e qemuarm.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Signed-off-by: Yan Xinkuan &lt;=
yanxk.fnst@fujitsu.com&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">---<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">.../distro/include/ptest-packag=
elists.inc&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 1 +<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">meta/recipes-extended/bc/bc/run=
-ptest&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 8 ++++++<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">meta/recipes-extended/bc/bc_1.0=
7.1.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 28 +++++++++++++++=
++--<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">3 files changed, 35 insertions(=
+), 2 deletions(-)<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">create mode 100644 meta/recipes=
-extended/bc/bc/run-ptest<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">diff --git a/meta/conf/distro/i=
nclude/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists=
.inc<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">index 56088e4e66..5cbed54cc5 10=
0644<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">--- a/meta/conf/distro/include/=
ptest-packagelists.inc<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+++ b/meta/conf/distro/include/=
ptest-packagelists.inc<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">@@ -100,6 +100,7 @@ PTESTS_SLOW=
 =3D &quot;\<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; tcl-pt=
est \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; util-l=
inux-ptest \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; valgri=
nd-ptest \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp; bc-ptest \<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;PTESTS_SLOW:remove:riscv6=
4 =3D &quot;valgrind-ptest&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">diff --git a/meta/recipes-exten=
ded/bc/bc/run-ptest b/meta/recipes-extended/bc/bc/run-ptest<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">new file mode 100644<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">index 0000000000..7e37e9ef01<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">--- /dev/null<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+++ b/meta/recipes-extended/bc/=
bc/run-ptest<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">@@ -0,0 +1,8 @@<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+#!/bin/bash<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+cd ./bc_test<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+if ./timetest; then<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp; echo =
&quot;PASS: bc/timetest&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+else<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp; echo =
&quot;FAIL: bc/timetest&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+fi<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">diff --git a/meta/recipes-exten=
ded/bc/bc_1.07.1.bb b/meta/recipes-extended/bc/bc_1.07.1.bb<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">index 1bec76bb2a..9d439d9312 10=
0644<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">--- a/meta/recipes-extended/bc/=
bc_1.07.1.bb<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+++ b/meta/recipes-extended/bc/=
bc_1.07.1.bb<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">@@ -15,11 +15,12 @@ DEPENDS =3D=
 &quot;flex-native&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">SRC_URI =3D &quot;${GNU_MIRROR}=
/${BPN}/${BP}.tar.gz \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://no-gen-libmath.patch \<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://libmath.h \<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span lang=3D"EN-US">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://0001-dc-fix-exit-code-of-q-command.pa=
tch&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://0001-dc-fix-exit-code-of-q-command.pa=
tch \<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; file://run-ptest&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">SRC_URI[md5sum] =3D &quot;cda93=
857418655ea43590736fc3ca9fc&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">SRC_URI[sha256sum] =3D &quot;62=
adfca89b0a1c0164c2cdca59ca210c1d44c3ffc46daf9931cf4942664cb02a&quot;<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">-inherit autotools texinfo upda=
te-alternatives<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+inherit autotools texinfo upda=
te-alternatives ptest<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;PACKAGECONFIG ??=3D &quot=
;readline&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">PACKAGECONFIG[readline] =3D &qu=
ot;--with-readline,--without-readline,readline&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">@@ -29,6 +30,29 @@ do_compile:p=
repend() {<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp; cp -f =
${WORKDIR}/libmath.h ${B}/bc/libmath.h<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">}<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+RDEPENDS:${PN}-ptest +=3D &quo=
t;bash&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+do_compile_ptest() {<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp; insta=
ll -d ${B}/Test/<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp; insta=
ll ${S}/Test/timetest ${B}/Test/timetest<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp; sed -=
i &quot;6,8d&quot; ${B}/Test/timetest<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+}<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+do_install_ptest() {<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp; insta=
ll -d ${D}${PTEST_PATH}/bc_test/<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp; insta=
ll ${S}/Test/atan.b ${D}${PTEST_PATH}/bc_test/<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp; insta=
ll ${S}/Test/div.b ${D}${PTEST_PATH}/bc_test/<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp; insta=
ll ${S}/Test/exp.b ${D}${PTEST_PATH}/bc_test/<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp; insta=
ll ${S}/Test/fact.b ${D}${PTEST_PATH}/bc_test/<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp; insta=
ll ${S}/Test/jn.b ${D}${PTEST_PATH}/bc_test/<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp; insta=
ll ${S}/Test/ln.b ${D}${PTEST_PATH}/bc_test/<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp; insta=
ll ${S}/Test/mul.b ${D}${PTEST_PATH}/bc_test/<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp; insta=
ll ${S}/Test/raise.b ${D}${PTEST_PATH}/bc_test/<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp; insta=
ll ${S}/Test/sine.b ${D}${PTEST_PATH}/bc_test/<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp; insta=
ll ${S}/Test/sqrt.b ${D}${PTEST_PATH}/bc_test/<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+&nbsp;&nbsp;&nbsp;&nbsp; insta=
ll ${B}/Test/timetest ${D}${PTEST_PATH}/bc_test/<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+}<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">+<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ALTERNATIVE:${PN} =3D &quot;bc =
dc&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">ALTERNATIVE_PRIORITY =3D &quot;=
100&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">-- <o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">2.25.1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_TY2PR01MB415557D074E6D1FF5A605BC8934D9TY2PR01MB4155jpnp_--

