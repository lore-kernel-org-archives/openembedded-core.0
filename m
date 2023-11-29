Return-Path: <Joakim.Tjernlund@infinera.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1233AC4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 12:14:13 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.42])
 by mx.groups.io with SMTP id smtpd.web10.31377.1701260044914350457
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 04:14:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@infinera.com header.s=selector1 header.b=WvdVmFoa;
 spf=pass (domain: infinera.com, ip: 40.107.220.42, mailfrom: joakim.tjernlund@infinera.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IcyX49IxNJP5vG7VmCftNYu8vCf+EypyOzd4Mg9t81WYEZ+GQkp89ckY8kriDV5CRhFqRGgAMr87nlkXlqXcl13qpl7xrX1myErqNv78dXW9nQfAzEGPwlj4VK0uh/bJTHTTxwtzQccz2bUjulonrVURnALSBKtaXwpGnaUJqT7wlWXlFIxxEKIIecptn629/+A3O5x+QNHrwJmna7f5OnWWFXFgmnYZzAoLzyj6KQvjGspbTarTinwN9UtGruVmrNGOa7KatX3jy310E06oWDj3CSvc9Y3w4Hd/Ls798osqyDFFJ4D0MeskuUdwGoyeFcDbIMZ7hayeaXPS/QgDxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8SZUhieYPTp5QNds3q+4TmVMXRHx92TwlmxyeWkJKIM=;
 b=n1zVdrSY2yntTJPOQ4X+TvtwFDLAeEqL9LcjiGK7FTeEovi5Rqow1sFfnYBXLkrT+VkzRc7jS/nNTzMXFsomHBAt3FflqYNII2LwB3EUtxm9bxpsQKOLMWJN4loCdoj7nVFz3puyNhf2+vaI8ZIe4kWjHBOBm1c6y3zFSzPVMxQz5WAD3ljgAQ64bfT9CRTGQktRjv9YEyiwrFMXlp7Y06FGiSARFsP2yA1s2BGcIcaFnHDoMy5fQBuwPnYenV0dmblX1pL4zbL0R0YDZYc6Krwft3chFwsZPRnr8MsVqJNLSFtfulrZdOK1oaOxubzdt5nLDJjmG4eZ9yyaVuPMog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SZUhieYPTp5QNds3q+4TmVMXRHx92TwlmxyeWkJKIM=;
 b=WvdVmFoaj3KT7GaAII8vEXqOUe4yNOs/krFhpefOH4p07HuFkzg0VNvLC1+bh7t6xooth8dsZfV2MmO8C0HWGzLS/V0Ts3rXCA6gkoMkHJVr+55iHIC7IHPnTxBJhp47le1zhV2ycl5k5DM0+K1PSjews1G/h8qh4osj9atP2fc+EawNoLE+tM5R0Dm61F5elUY9Y+AkTDKoW/aNLkDtGCAFni6GBnyubSaVAXbn7HqyK0ZZKtaAZuvDMh95qbyUNVvNTzqkED1SoP/YPAtpoj0wNC4IcrfbNOkXyssGLz+Umjqrjfqk9XzsvEJY2+YYi32zCBNUsepADQx4pPzJMg==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by BLAPR10MB5108.namprd10.prod.outlook.com (2603:10b6:208:330::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Wed, 29 Nov
 2023 12:14:00 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::86e6:23e4:41ae:35c5]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::86e6:23e4:41ae:35c5%7]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 12:14:00 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "Ross.Burton@arm.com" <Ross.Burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 0/3] Add sub dir for passwd files
Thread-Topic: [OE-core] [PATCH 0/3] Add sub dir for passwd files
Thread-Index: AQHaFzo1hG/A2Fu0fEmvv+fYdoDdEbCRR5gAgAAFA4A=
Date: Wed, 29 Nov 2023 12:14:00 +0000
Message-ID: <c93fb36a88d3c0a9a721122a3fc8931b77b60034.camel@infinera.com>
References: <20231114203608.1490318-1-joakim.tjernlund@infinera.com>
	 <C613DFF0-DF29-408F-8D13-F3481AD77F17@arm.com>
In-Reply-To: <C613DFF0-DF29-408F-8D13-F3481AD77F17@arm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.50.1 
autocrypt: addr=joakim.tjernlund@infinera.com; prefer-encrypt=mutual;
 keydata=mQENBFp0f28BCADPn4XzN2HEzkY4BZKE6/T/S4M/Qjlf01K6gmECJZi5LQgOt0jOUAdvsXVd8yKYeqCq+eWvlfrLU9OXPGoCqwj95P2YjMsttqaPBEAnf4XyBs67Snz2wHyBDONoRxGoyq2Ondy+TPicWEm0mh404h9EzKxRNxwrRyKhsjWoVeaucuybAiGbJvqQj0CLmuMCl4PUBYDmXFzt3yx0g54z8E9/8ON+z0J7yZbA0aftZAjFLv6nn0Th/2dpD8d3vWtkJw4yBjLX2KFvlzJfQqkd6RI4Cn1OP9sguXDob123dMiMk/5XbjXz+0C21QFxejxt3HGisvKes+8swplyni7KdiDtABEBAAG0MEpvYWtpbSBUamVybmx1bmQgPGpvYWtpbS50amVybmx1bmRAaW5maW5lcmEuY29tPokBVAQTAQgAPhYhBFtMG/jmfqy7x0aBp4VMQ6CbDpcaBQJadH9vAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEIVMQ6CbDpcasFAH/j64dpHpjY55tVoUg5yK8hcmxS/buKQQP9H3e2DdHeYrK0qeQ97AXiWTh63UvzvEXchiKjua6kYhUUkDObaltmwkKgPv0qb9lP6yfFBzvllriS6LrdIMCOLgtnQW2x28m5mC1hYT08jlqEXluYDoj2dTll9HGMsqn0JkhRjBsuzTXq8VyJjjnNLpzsAlTOGEQoAi7SqtDHs9PSNyOAKH5jRjATdNbPAsTKuI1veJf7Zzyc98yG0ya43Hqal1scoa+9GJZXNQPRaMVkyxKGbEEncdtnQl9e/DUMH4SUQ5vbM/+U4WvkX5Cvc+KwI6JAm1PhrAaVHSkDNAU5LqUqEbbHY=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|BLAPR10MB5108:EE_
x-ms-office365-filtering-correlation-id: b9194901-4916-4b36-a9c1-08dbf0d4ab9e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KVMDA2YgcXMkKPospcEZL77NeHRc9Xyre4Ohc+EA7wT6En+2Tjnv2fmWlqdmbwhlTf658CKY0uTdXQuGnZQd8gsAjAlo8OmDffB9TIC++w8HI1A3Ow2X3LTqgINgG1s8wminrj8rVj3kIMpiP7JM7RM77tSGL7H+eEOZOIdVEoc4aB+YPbez2RS01qjFyXzBh/4kxrcIoqJKV658PK2t49kBa4txyeL8eVe0PXLYeM4qOM60qfGnB/6VpTXrQ9Ilg7LBlxGQgQp6afh/b4nE/yqADZtH/eqlWdvkbPaMGFtfdQlbOlrIXDkctex78TlFdPMLFIEPYs1QX+TL1FCtuAZMEuejC8+iJHyOUmvOr7ImFZYGOGMTPGvYiZ0o+P+nMlYt9ZvLHELnmUT1Ce/9lkpqJIDU39AlTMXEAn9mq52JxqmvgZt2VvCXgUBHfLU9VYRqrE0RCHn0kEvOypFQk80e3wx5NFPj6zdl9aW7QW+H58RLAb/MiRUv5i+WJny74HwQbPwjHs1GzEm2z51J30M7FjACzw9RPGQTRqAQnW8iI2ydW7yaTN/oT62PkdhI00tA3NNKQaunX+96ubrEUkPcD5S6hUPpHtGX8zgJVgH3u6334M6UEWJS8y4FRJnM
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(376002)(136003)(396003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(5660300002)(478600001)(6486002)(6512007)(53546011)(36756003)(2616005)(6506007)(38070700009)(122000001)(41300700001)(38100700002)(83380400001)(86362001)(4001150100001)(71200400001)(2906002)(66946007)(316002)(91956017)(76116006)(6916009)(66556008)(66476007)(66446008)(64756008)(8676002)(8936002)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?VjhrQWQ2YUlTVTdhdjdpODBBN1JXNVp5L0x0c2FrNFZvTHdtODdUKzNuNW5H?=
 =?utf-8?B?TXJaU0dkMExta2I2VldxZWkzVm0zb0xFSlEvQWZieDRqcWFxczAxbzVCdjEz?=
 =?utf-8?B?OFppUS9OUG1aU2ZTaVBjNmtFRWRZUVV2YXIzaVVQZUNtVGJiam13dWNXR2Z2?=
 =?utf-8?B?cjlFdHdMN3BXMXlxaVYwODhKc3hoQysrSnluZWo3OHhybCtYYmMvWFoyckl1?=
 =?utf-8?B?VEd1VmNOb1FzSnlBcUpGMGsrSE5BaGQrM1lQVzluTm9xZGVlZ3V5VUNYRmdx?=
 =?utf-8?B?cFFzKzFBdlAwQkJ6V0JoWUZTaEU5amVidkVSOXhKc1NUbjhtbGV4RERpSW1v?=
 =?utf-8?B?WG5NZVZrZ0djN29LUjVVRERzV25iQ0Q2OFNXQ3U4RDZIM1lhTlFib1N0NUJm?=
 =?utf-8?B?QWQwUFpabFlSNVRocVV0Nk5BWTF1OUJMdUROQUlTcHY1OXEzR0NraHBpMUhp?=
 =?utf-8?B?bGRHVVRVbEdwSEg0NUdjSVIrdlgzMkdETTFyT3I0d0xEMzdUSTdTVDFrbGdX?=
 =?utf-8?B?N292eUJ5N0JJRjl4M1BIWndQUVpuR2F2cFdMMjlsbmE5NUMvUWRrYkRrQ3NI?=
 =?utf-8?B?dmhUZVAreEN1NnlQOXBOckhrTXV1MUQyQ0wyVjVVQk9RV1hNNk1tdTlWZDNt?=
 =?utf-8?B?aFFVWi9mTXpUM2hzWWpKUG90TnZRNkxUckhYUllCTDh1dk11czI5MWVEUlBS?=
 =?utf-8?B?UmxvVENuL1B2T2NNOFhtRk1DbTNrVGhZWUpBb2NObkdMRE1TMitmYkZCQzVl?=
 =?utf-8?B?dVVpTXNxZDJieW96MW92bG9CVFJ1QjFRWkR2SEpjTFRnRWN5L3E3RW9lakxp?=
 =?utf-8?B?SjN3TGMvUllmK0I0dzBmY29lTERQbURlbnBRUmNoR21Sb2UrRzVmUHlsK2U0?=
 =?utf-8?B?U0ZURTRoTVZTRDZsRzVrNXFJUzhicmc2RnMxVEoreEFINjJiWW50NnVHSmY3?=
 =?utf-8?B?V2JZTjROVkI4empody9McTRHd1drNzRuTEpaYis1Q0QwT25vYUowb0hBcUJr?=
 =?utf-8?B?SzFySlBTUnRITng0dEFIcWgrVjJxejZJVE9MQzRKTDFoYmEvdk9leEs2L0dm?=
 =?utf-8?B?Mk11UW03RklEeXhHQTNhMWJHT2hsRnpVWmlMTE1CVlNhR1lYMmhZTFUwWXFV?=
 =?utf-8?B?OTIzVWU3bVJPczVvWHB3TWdmSytWTWVpbU56ZmRwOEp1YmJrMVR1WjBEdDVC?=
 =?utf-8?B?WTQrUjB6MStxUkdJR2VHemg2cFJCdTJEUlVWVVJOYmhFdEtHUWxXMEZDMWZa?=
 =?utf-8?B?SDRSMDQweDhOdzVic0YwWmttS2VzdmFwcWR6cks0Y2ZxN1Y0MmZrMkd6aGFx?=
 =?utf-8?B?djkvMHlUbFVMRDFEUzdNbXhuWUhteS9yanhST0tncFJpTWk0dGtLTnhza21C?=
 =?utf-8?B?WmlwMmhvaXJPY25KaDVBeHJjMWNyN0R0aWY3K05TaHlUSDIxckF2TjR1eGpR?=
 =?utf-8?B?c2IvRXlZa0JpNHd5L1QzSkdwNnB5V0JCSVZiREd0SFBTdDBkbVl0T09jcGRN?=
 =?utf-8?B?c1d0OFJGYmwzMFNQcjEvMm1FT3RTUmN3bys5TzlibEN2Ujc4SGlIZjUveVVu?=
 =?utf-8?B?YXYzWXp5SXV5dzhWeGtjcXkvN1JZWVF5Qis4dm5NU1VrK0dqVzFwMk9WaDhm?=
 =?utf-8?B?eWoySVE5NFAybEJ1STZxSXRKT3pldG0rQk1SZlBHNitkS2ErbDZxVGIzaGh1?=
 =?utf-8?B?emFYWG92L1BHaHppWmFBeFZLcVl5UHRKV0lSYmNIZXA5M3pNKzBUSjNjRjRo?=
 =?utf-8?B?TFh1ZTBkNUpCalJYckhaSXdTRUJpTGZHOWk3OEpvNzI1M2dFSDFGbnJXeFJj?=
 =?utf-8?B?Y0pEMHdrY3hrWVhSQS9lYlVCQ0xJQmhuWm16NXBQRnNVZmYxSTVybGJMeUJ6?=
 =?utf-8?B?RmJqbXA3Qzk1eFJOa3poS3UxL1pXVzkwekN4THRGaWRVVTc3LzFzak9vZ1pt?=
 =?utf-8?B?bkR0RlpXdFFqS2ZBZmFNMFAvVlE0WFd2U2wzT0ZBY1ZHZzNtb3BXdWovRFpw?=
 =?utf-8?B?RExSOFFxR3ZUMVpEMkZtZURsUlRqZk5kL3cyL2tJcFlweHJadFBpYm1TR29u?=
 =?utf-8?B?bGdxME5Oenordm9IZndJT1NOVU9GQzhHbTkyM3Z1MVVQUXZBa1diY2ZRUURM?=
 =?utf-8?B?MVFSaFFXcXBmbytISUFyYjh2WklPRHlnSjlvN0FKN2FJdkRsNnN4TEpwV241?=
 =?utf-8?Q?L1yWMlLeU4laBuGrchjsAUuve5ycR3cCa1dgMCJ9LZdZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F973FE1C7745094DBA610C5FE176ADC3@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9194901-4916-4b36-a9c1-08dbf0d4ab9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2023 12:14:00.5750
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YLntN4Hy6iHXrnUJEr0wM832mdCENtOR8PbFmJn9CgUGkiNI85IRwOnO1coYugY3pVI4wlApwownBtLScjvetQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5108
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 12:14:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191448

T24gV2VkLCAyMDIzLTExLTI5IGF0IDExOjU2ICswMDAwLCBSb3NzIEJ1cnRvbiB3cm90ZToNCj4g
T24gMTQgTm92IDIwMjMsIGF0IDIwOjM0LCBKb2FraW0gVGplcm5sdW5kIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnIDxKb2FraW0uVGplcm5sdW5kPWluZmluZXJhLmNvbUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPiB3cm90ZToNCj4gPiANCj4gPiBUaGVzZSBwYXRjaGVzIGFkZHMgdGhlIHBvc3Np
YmlsaXR5IHRvIHN0b3JlIHBhc3N3ZC9zaGFkb3cgZmlsZXMNCj4gPiBpbiBhIHN1YiBkaXIsIGxp
a2UgL2V0Yy9wd2RiDQo+ID4gSW4gYSBSTyBSb290IEZTIG9uZSBjYW4gYmluZCBtb3VudCBhIHdy
aXRlYWJsZSBkaXIgb24gL2V0Yy9wd2RiDQo+ID4gdG8gc3VwcG9ydCBwYXNzd29yZCBjaGFuZ2Vz
IGV0Yy4NCj4gDQo+IFdoYXTigJlzIHNvIHNwZWNpYWwgYWJvdXQgcGFzc3dkL3NoYWRvdyB0aGF0
IHRoZXkgbmVlZCBzcGVjaWFsIHRyZWF0bWVudCBpbiBmb3IgcmVhZC1vbmx5IHJvb3Rmcz8gIFdo
YXQgaGFwcGVucyB3aGVuIHlvdSBuZXh0IHdhbnQgdG8gc3VwcG9ydCBjaGFuZ2VzIHRvIC9ldGMv
Z3JvdXA6IGRvIHdlIGFkZCBhbm90aGVyIHZhcmlhYmxlIGZvciB0aGF0LCBvciByZS11c2UgUFdf
U1VCRElSPyAgV2hhdCBhYm91dCAvZXRjL2hvc3RuYW1lPyAgVGhpcyBoYXMgYSBzY2FsaW5nIHBy
b2JsZW06IGl04oCZcyBzb2x2aW5nIHlvdXIgb25lIHBhcnRpY3VsYXIgcHJvYmxlbSBidXQgbm90
IHRoZSBnZW5lcmFsIHByb2JsZW0uDQo+IA0KWW91IGRvbid0IHRoaW5rIG1vc3QgdXNlcnMgd2Fu
dCB0byBjaGFuZ2UgZGVmYXVsdCBwYXNzd2QgaW4gc3lzdGVtcz8gZ3JvdXAgaXMgaW5jbHVkZWQg
aW4gdGhpcyBwYXRjaCB0b28gc2hvdWxkIHlvdSB3YW50IHRvIGFkZC9jaGFuZ2UgZ3JvdXANCi9l
dGMvaG9zdG5hbWUgY2FuIGJlIGZpeGVkIGJ5IHVzaW5nIGEgc3ltbGluayBidXQgbWFuYWdpbmcg
cGFzc3dkIGNoYW5nZXMgY2FuIG5vdCBhcyBzaGFkb3cgZG9lcyBub3QgZm9sbG93IHN5bWxpbmtz
LiAtLXJvb3QvLS1wcmVmaXggb3B0aW9ucw0KaW4gc2hhZG93IG9ubHkgd29ya3MgZm9yIHJvb3Qg
dXNlcg0KDQo+IEFueXdheSwgaXNu4oCZdCB0aGlzIGEgc29sdmVkIHByb2JsZW0gYnkgdXNpbmcg
b3ZlcmxheWZzPw0KDQpUaGF0IHdvdWxkIGNyZWF0ZSBvdGhlciBwcm9ibGVtcywgdGhlIHVuZGVy
bGF5aW5nIFJPIEZTIG5lZWRzIHRvIHN0YXkgdW5jaGFuZ2VkIG92ZXIgdGltZSBhbmQgYSBTVyB1
cGdyYWRlIHVwZGF0aW5nIFJPIEZTIGNhbiBjaGFuZ2UNCmFueXRoaW5nIGluIC9ldGMuIENvdWxk
IGFsc28gYmUgY29uc2lkZXJlZCBhIHNlY3VyaXR5IGlzc3VlIGFzIG9uZSBjb3VsZCB1cGRhdGUg
YW55IGZpbGUgaW4gL2V0Y8KgDQoNCiBKb2NrZSAgDQoNCj4gDQo+IFJvc3MNCg0K

