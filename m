Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F06BC54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 14:39:32 +0000 (UTC)
Received: from de-smtp-delivery-113.mimecast.com (de-smtp-delivery-113.mimecast.com [194.104.111.113])
 by mx.groups.io with SMTP id smtpd.web10.18252.1710340095395716076
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 07:28:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@toradex.com header.s=toradex-com header.b=VeqEzxXN;
 spf=pass (domain: toradex.com, ip: 194.104.111.113, mailfrom: marcel.ziswiler@toradex.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com; s=toradex-com;
	t=1710340093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c0GhmULcVg9LLg3+y2ojGetVNc4w6FiINfYajaCP958=;
	b=VeqEzxXN0nKG5YQYQ3Z25nqXRSuSRHWhXorf0FEUZ3mUasl1VuiiaHQLnEq3WGxv2m2K+G
	/v1G+HLKLQYNTSCD256mKdijQ+LT4Rbm1Pf/9a+6GPj9vLdL+ATp4GW2rpX7/h2qcxDYEm
	hiVeowt7QAeuEE8wOpFJUioz1pI+Qzk=
Received: from ZRZP278CU001.outbound.protection.outlook.com
 (mail-switzerlandnorthazlp17011007.outbound.protection.outlook.com
 [40.93.85.7]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-76-jQdojs2bPr6a9tF-7nMp-w-2; Wed, 13 Mar 2024 15:28:12 +0100
X-MC-Unique: jQdojs2bPr6a9tF-7nMp-w-2
Received: from ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:3b::9) by
 ZR0P278MB0169.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:33::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7386.20; Wed, 13 Mar 2024 14:28:08 +0000
Received: from ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
 ([fe80::1a2c:bf89:a76e:a6a3]) by ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
 ([fe80::1a2c:bf89:a76e:a6a3%3]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 14:28:08 +0000
From: "Marcel Ziswiler" <marcel.ziswiler@toradex.com>
To: "alex.kanavin@gmail.com" <alex.kanavin@gmail.com>
CC: "reatmon@ti.com" <reatmon@ti.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "rs@ti.com" <rs@ti.com>, Max
 Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [oe-core][PATCH v1] mesa: enable imagination powervr support
Thread-Topic: [oe-core][PATCH v1] mesa: enable imagination powervr support
Thread-Index: AQHadVINULbuIBE+rkaxnr8soWJK+bE1urIA
Date: Wed, 13 Mar 2024 14:28:08 +0000
Message-ID: <07aa1cc8e623feddfe3aef7b3be00fa15d296955.camel@toradex.com>
References: <20240313141940.146208-1-marcel@ziswiler.com>
	 <CANNYZj8vXvxmqtOGbUfEkGOB814sGmTmCbqiORwUCSgeD0bgbA@mail.gmail.com>
In-Reply-To: <CANNYZj8vXvxmqtOGbUfEkGOB814sGmTmCbqiORwUCSgeD0bgbA@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZR0P278MB0683:EE_|ZR0P278MB0169:EE_
x-ms-office365-filtering-correlation-id: 0ff9c4f2-7547-4e63-234a-08dc4369ce00
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0
x-microsoft-antispam-message-info: r9HZR1ch+1mgDeXVg4KTDCyJJHFx0QeGEd3CsIeWVWnRdzZiqcWKJurt+LEWfUq9WQhqTyxWuPSdyb7ljjKgQZuk7K/HVcbWQq9ScsQSfLnmTXcf7NCqutQyWZ6yK1ej/BwlYrdeXnXbdLT7RqEw8vG+ODb0rUA7WS/l6WfIbvGRZm8Cz+ZrFZnh9UjUqvNGo6buGjYstY8rKUc6UcZ/ucBuoBK/5+s68zjzuG7KJA5Yons6VH1j4U1NS/8O4mgG3ChrC55FpT/4+JbcrH8Uia+vpYHdoRjIwQIDh4yxjBXHP/nx9h4SUCyEHgnvjrzbD/z7kzPAIRuJ26QQLIpMyaqOvAwc1z2/nqB30+1ThefhI5lkCJQRwIbpxbmBKIdYHVE85QSsnnc0dfBVhuS+Gx0eI/WcMLfSGIRX+9t2bEm4AtymauRhP9xYGu+48hGvMOOnTFTEkRPLI9HX/OCfUG8VyDEetNYsd85lm4x/wC6ZB0gmpDYye3+f0zXvPtDhY/lRTTG+2/JtngXx1BoORJ823aF8OY6hFG1QhPQPUcaAm3Ome4LU34pJPzY63Gs4Lmh446L4HuElrYHRAAG+QcApyd3EVv+vKypAd0EGlLB2VLCNyVseTdzM/xbWZXGz3uGOXxsdAKBmpL+3UUEI3j3PwCfzqWmUEwSwkBQKt3itu31FMQBhRzOPvciGoC7V10Ra+X/9vwCX0R8r2JAbMrKp/NYP5ykDtNxHyUCFpks=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1102
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N1VLamltYituekNldW9vSUoyczBLNHV2YlFPUEFjMCt3S2JTbXNnaGlCNkQz?=
 =?utf-8?B?QjVzeUhLV3BhK3RveHFCdWZuYUljS25pa3VZa1ZlT0llWEFKdTdqdzdtMnZw?=
 =?utf-8?B?Znk2Slcyc1BWejI4K1ljRDJtdnJLY2R5Y2NzSDlpK09OT0Y0alJQajNiZWxq?=
 =?utf-8?B?NlNKSHpYZTFHRGZRQVNHaDFuQTJRd1hybWdzbnFWNFNSTmttcnpDUC9WNkJ2?=
 =?utf-8?B?Ri8zNVdTSWNwWVd4N2RsNkNwYWh5Q3FnZkphUlZHOU1BWlBFU0JYZFFmZmQ4?=
 =?utf-8?B?bFdIa3BpclYzUHdINjBiZStjY2tGalk0WUhTcHl0bUliMlFENjQvbGptSG9B?=
 =?utf-8?B?N0hLWWJEZTRBa21qOFR2M096anZJdkZXbENIT28rT2dFVXZFcWM5MUlhdlVn?=
 =?utf-8?B?OFo0ZUpGb2RpTVVIYWF2VDFwbEFXaUFmN0RibEREczdUMmhpc0x6VjFFVDNm?=
 =?utf-8?B?OTh5dHljTzVmd3U5L2FOaUpmWWRvakZFQ3MwbDRmeFVEdDdtZGloNHh0eE9C?=
 =?utf-8?B?T1RHaHpEbzhsQUhSWnVFVEVxZDVvOG9rYVhFTENObHpEd3pLSnJNVTFtMFdN?=
 =?utf-8?B?RUsvMzRDd1l6WE50TXJQYmtZbWY3TG5hRnlTeHFzczkydU53WkFESVplZU5X?=
 =?utf-8?B?NFZZc0JLTDlpN1dSRHFEL0pKd3BQc0NUUkpmd1RnVkxWMDVIMjZRWXV5TTIy?=
 =?utf-8?B?QkxieW56Um13TWVlTVdTdlJ0VDdnZmdxTFV4NkkrV2s5MHV0Y01rU3k3emRO?=
 =?utf-8?B?RkZzS096TUd1S0xOaGtnS2cwTWRMWldlTkQzYmtJaEU3cTFFcjlrRnJlb1Vy?=
 =?utf-8?B?MVVnak5jRmRFazdnV0NtZVc0Yy9oRjNtSXlFQjNuKyt5QkF5b0dBRGpCVkRx?=
 =?utf-8?B?NHl2VXZqQm9HbW45L0tOcXZPYWtrK3BhSVB6dVpTUlBCb0RpUVNHaHI0czBk?=
 =?utf-8?B?TWlnSnpGbHdPeWNKNmEvdWNJSWRmOG85dEc5STIwdndvWmgwYTJzV3RsT1Zy?=
 =?utf-8?B?bXNQb2pSV1FsY2c0cHRNczVwbE9KN3pnbkw4ZEo2ZDNCUTd1ejI2bFFEU04r?=
 =?utf-8?B?SkhSTnhMSjhzb2pLNFpteEVpTkJINEVmSVNVV3g5djkybVlUTEZ4aExaOHdH?=
 =?utf-8?B?NnQzZGRCYjQzMzNoMGFsWlVBNHJQME1TWXlSZlRzcjZ6eDVkRzBqSWpmV00y?=
 =?utf-8?B?UDFGMjFpWGZ4VGhqUWEwTjB6b25kNjRsK1hwcWJuTnZhc0k3WXYvWXFKT21C?=
 =?utf-8?B?My82c0xpZk5ybGk2Q25lNUZGbm1ud2o2NzN5QlBYeTFMQmFsWStSQVVJV0RH?=
 =?utf-8?B?WHRJOGJ5YXZHeVBjYmRRb2cxVjZnVTlxZUVPZVhOcW1TWGkwQTFyU3hJR0w4?=
 =?utf-8?B?SlcrR1BhRVhDQ1NwWG9YZ0xRS0lRZmhJWFh0MWRUcld6Tnl0cUdyRTN2T0tX?=
 =?utf-8?B?ODV1b1NxaUVLb2tvbnM0UUpZSWxnNjJ4OXF6cU90RWlIelBhOWk1WWxieVFD?=
 =?utf-8?B?RkN5UGZ5UUJoMWFGSXdMQW5pcU1Kc1E5RFNHaVZ3bWZUVFBnUXkvS2s0bHdv?=
 =?utf-8?B?aExTdHpEclowbXVlYkxaUFJobzUxanNkRzI4VGx2OWxnWWVsdTVxdUZVbngr?=
 =?utf-8?B?MTFJVlQyTnM3OGM5VXBiU0NXNEdlZnU1WU5QWWszeWVJb0NkS2FHcEJEM242?=
 =?utf-8?B?aEx2VGo0ZVRBdjVyTHFFRzRjVXFIb0YwZjkrZGlaZHdidUJoWFBoekJ1TFd5?=
 =?utf-8?B?UUxJQjkwRkh6ZHFpcW91VnZqcjRTL0ZqbDJqcWZTbkNjM3BiVnFZN3BlcVZ4?=
 =?utf-8?B?b2diQUxESFpteGhDYVNQTndWMWtaMTB5a21EbTZaUHMxWjZNcjBlRlhKS1pk?=
 =?utf-8?B?c2VrU2xYaFZzUlhRTkVVR1pzTjNCR01aaHR6bDhnUHh2WmxRT0lxbldSbDlI?=
 =?utf-8?B?cW9WZXRqdnNzUFpNZTFxMmhlZnAvcEtaRUVVYllYSGx3V3hySFBXbFNyR0tz?=
 =?utf-8?B?Q01UeFdGa0hLUWplUEhVeDZSNnZnWjR4c3QyUkZsbG01OWV3TEhOSE81b09y?=
 =?utf-8?B?YVp4dWZHSG45K2FqTy9zNHgwN0RFb0p6UDB3Q2VkR05JTG16bFRTdExMMlhv?=
 =?utf-8?B?dURjcnYrWVJ0SjNFVVRwdDZoSzZnVFoxcFNuWTlSNjhWZHlYRCtOSTR0emNU?=
 =?utf-8?B?OEE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZR0P278MB0683.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff9c4f2-7547-4e63-234a-08dc4369ce00
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 14:28:08.6216
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h5oZOEHruZQNYBzqwBxRK0QQTKZoZ+u24+xCARCBEPLwCCDHwM6WrW4CUXTnu1PNSEJ6Q3ph+IaxaDtsPep0raZebOIMYLBAcI/e3brlyGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZR0P278MB0169
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: toradex.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-ID: <8C568EDFF2E91845877BB3C31992D1DA@CHEP278.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 14:39:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197043

SGkgQWxleA0KDQpPbiBXZWQsIDIwMjQtMDMtMTMgYXQgMTU6MjMgKzAxMDAsIEFsZXhhbmRlciBL
YW5hdmluIHdyb3RlOg0KPiBPbiBXZWQsIDEzIE1hciAyMDI0IGF0IDE1OjE5LCBNYXJjZWwgWmlz
d2lsZXIgPG1hcmNlbEB6aXN3aWxlci5jb20+IHdyb3RlOg0KPiA+ICtFWFRSQV9PRU1FU09OOmFw
cGVuZDpjbGFzcy10YXJnZXQgPSAiICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdQQUNLQUdFQ09ORklH
JywgJ2ltYWdpbmF0aW9uJywgJy1EaW1hZ2luYXRpb24tDQo+ID4gc3J2PXRydWUnLCAnJywgZCl9
Ig0KPiANCj4gVGhpcyBzaG91bGQgYmUgZGVmaW5lZCBhcyBhIHN0YW5kYXJkIFBBQ0tBR0VDT05G
SUcgc2V0dGluZywgbm8/DQoNClllcywgdHJ1ZS4gTGV0IG1lIHRyeSB0aGF0IGFuZCBzZW5kIGEg
djIgd2l0aCBpdCBhZnRlciBhd2FpdGluZyBhbnkgbW9yZSBmZWVkYmFjayBmb3IgYSBkYXkgb3Ig
dHdvLg0KDQpUaGFua3MhDQoNCj4gQWxleA0KDQpDaGVlcnMNCg0KTWFyY2VsDQo=


