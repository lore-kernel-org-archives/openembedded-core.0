Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A867FC83F09
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 09:35:13 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.12])
 by mx.groups.io with SMTP id smtpd.web10.11486.1752053711475028987
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 02:35:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=uz/pwb6k;
 spf=pass (domain: siemens.com, ip: 40.107.130.12, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X2ZveTfc4jGMedXuEF1nuf4bexf2xh8vXLz7eX9mWfy5CGQov4HCeML5dw6ruKF9napxu627zRBriB2BmxVJqdgvCxQijYZiBC6CkqQ9+hUG/1YN+OULzq66hk/7XkoatcnIwVlEO1Ti/fsNItXMFX4/YaZJCDaD9O8h2ePEcKGa6pN3u5Mw6Xmz6nSrVngHtPH8yPFC9z9FjTBJc4GXRjfYyJDhAuJAgcA7focBUNIGyi7pF/J40DBav4LQvQlV3VceR/arHfatPjC22qpt8Q9E3SKhNXVa7xutGfHScK4u71HT5Sgt8gv4zWujueddqRwTl8ul2mr68JNhW1Cc1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0S4QICzb1Iz5q50QgLu+1Z79jeE3/w8WAAyGNu9W4Ts=;
 b=c84fseoQ674CiHRSNKe+yEqXxa3YaLn5F6YeAeehDQmxj3qwBIzGtcgILoV3wsMktyZDrWzQVYn/G/K+nn7vM4wDNgMTU2sjLvBqVLfs1iKzskzINKYQwhUbXBoJVGFTtjIigw0tt5DbjJ4tNuNrpPRcXImf5VdhgjbiEgxUyDo6DRF5KBwTOgN3NfFXUn9PXG4qPHnxA0VBbSu32r495GUueHBrpcXb7MzfuSQCpk6B2+FnL2cyjXmifiTP/8VARxNDeT8okIBzNHz8IS7bHGZMwXkj83/5MGxDtrfX9qBOEVM66N/6zBkQfT/tDvmGM84oX65dK7HalQjnw3OL6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0S4QICzb1Iz5q50QgLu+1Z79jeE3/w8WAAyGNu9W4Ts=;
 b=uz/pwb6k6hcPAs9KuvmrviKmthdBx/peySNIZNgA56sOHP+cy1sukMkKblr4e1FYDhT1JfSFtTR91ZokiPg4//t+joXyoClwTwGqarLfu0I6sroS6l4+Qb9qoFjNcUrQsuxFvU49X3K17nDlf6Z4OpaXDifpgQ+1rTyQpW1yR1UmLwjGL2mGzj+E7XcJ/1wCSJN1LqiPXdSXCxj6v+87gXXHz8YW8P8mw0SGz0jl/UZ4QSlUuBnEm6U+KBFfgxmIbgfL0oXogGJ0C0RI8hEmsYM3FtsbwiInAZ+yfcLFt/jkMMOTLwfmlGmClWKqsV7YOdJg/StQLC+x0TDXXqLZSg==
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::17)
 by GV1PR10MB6051.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:9d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Wed, 9 Jul
 2025 09:35:07 +0000
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda]) by DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda%5]) with mapi id 15.20.8901.023; Wed, 9 Jul 2025
 09:35:07 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: Tom Rini <trini@konsulko.com>, Fabio Estevam <festevam@gmail.com>
CC: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Quentin Schulz
	<quentin.schulz@cherry.de>, Marek Vasut <marek.vasut@mailbox.org>
Subject: Re: [OE-core] [PATCH] u-boot: upgrade 2025.04 -> 2025.07
Thread-Topic: [OE-core] [PATCH] u-boot: upgrade 2025.04 -> 2025.07
Thread-Index: AQHb76fmbTkb6JVq3kaeBpOhyyL+n7QoKt8AgABKfICAAA7jAIABBfWA
Date: Wed, 9 Jul 2025 09:35:07 +0000
Message-ID: <1f8e0a60d20bfcec5de5ef82584849358b1bc6ea.camel@siemens.com>
References: <20250708012959.77522-1-festevam@gmail.com>
	 <DB6OGLNWBEVN.2V2F24LHIZ4C4@bootlin.com>
	 <CAOMZO5BJBc0E0EfejEPmVdGBZiQrrvRWsHhy0Bxgi+jx6WiYRQ@mail.gmail.com>
	 <20250708175732.GU6424@bill-the-cat>
In-Reply-To: <20250708175732.GU6424@bill-the-cat>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3529:EE_|GV1PR10MB6051:EE_
x-ms-office365-filtering-correlation-id: 8774154c-976f-4eba-6283-08ddbecbe459
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?cjRESW9QZnRGZ3VtMmRKczJob3RZeXhQVWxwNjMvaHJkZW1GSXJvWmxrTlpu?=
 =?utf-8?B?MUdBR1VLU09FR3VraWpZTzVwbjVwS0EycEJEUk51VDY0U01RVCtGOGJjUnJv?=
 =?utf-8?B?OTFra0RYcUlPQWRUTlVmbHMrQ0pDM2V0b3hqbXdIMnBZMC9rL21FNDVncE9t?=
 =?utf-8?B?NGV1M2pydlJMdUdCTjFyenJhYXNIVVlReTJtdHVBdko2cFNhWlJMSkNQd3R5?=
 =?utf-8?B?Lzg5N2hNTXl1Q2h6dTdlVDNLM1RxT080a1VYMmhpVklqcVlObitydjFGcXRG?=
 =?utf-8?B?SVdheGZVN1k3VS95aXRRQnhxaFhEblhOblFWS3JkQWVZQXFxSXhKdVRyQnJw?=
 =?utf-8?B?MSt6ejhZenJKSmxxVDR3cVAyaVNZK1JHYVN0YjdFYXFhcktIRUExRjhwZGUy?=
 =?utf-8?B?WlphUTlOci85WHgwM09lbWF4VElwWk5zcTJoeS95c1ZRb2NuWHZ1ZE1hWVVl?=
 =?utf-8?B?MkNrMTB5UUNIT3BPVkcreWUzeVZUenh4SzdHbEdhSk1wUjBXQ0JvUkttalU0?=
 =?utf-8?B?MkxBb3NEcHRzSnd1dmFtUmtsYTJyWS9ucjlYeW9vc1JmYnhYSy9xS2VCUEhB?=
 =?utf-8?B?S1l5YU5IOW8xTi8rSHpmbHQ5b2lOUWJydm51QlBYWjViL3dtYnc1SEVtZTdI?=
 =?utf-8?B?aUEzeGVBWWpSZDJVUC9xU0ZTTFEyQ29Qa1d4eG5mOG5rQ3M1THRMS1dvc0VO?=
 =?utf-8?B?QUhmbituaHI1RTVBQUwxSC9TZmhIRXlNMjFEa3hIS3ZJOVZaMDNKR251emlr?=
 =?utf-8?B?SnpUSFpLZUhhbUt0NVFHYk80TjZNMm0xTFhUZUlhOXM2cXRnYXBHN2xDRHVL?=
 =?utf-8?B?RG13Vk50U1VxOFY4clR6WldxVWd3Umk5L3VNMkVqS3prbGpaa2grOXROdzRD?=
 =?utf-8?B?Y29XQ3ZoQWtzSFU5TFZuRUlxclNIc1kwOWRwZnYvRGtCd2ZVVkh1TUtOYlpZ?=
 =?utf-8?B?MUhxS3IxeVo3dHFMMk9QekxxTU5Bd2RUYVJDUUloVlArQS9ZenN5WGRnMFRQ?=
 =?utf-8?B?WTdFNGlCU3pncFZHRG45Z0wwTmZWTlFTVCsxczFTQXdsTkxQMGtwRGs2Z2ZJ?=
 =?utf-8?B?b0lMSVloTkxra2doMXEyS1JTb0dWQmJVVkZVY3ppeHBTZ2VPTkI3WTBrVFJz?=
 =?utf-8?B?cHdodU1IM1ZSR2ZkVk8vOXpiRkN2MU1DZ2hOL1h6dzNUNDZiLy93WXRBcU42?=
 =?utf-8?B?bW1RblFqVFByREV2WTc1U2RzdWozQ2V1dXMrZk9kajhPWjVDSVNpUThhMDNK?=
 =?utf-8?B?VldLU0w2TGxiMEhXZXM2R2tJSTdmSDRUMDlyanIvVmFHY3ErcHJ2eVBzbTFL?=
 =?utf-8?B?cjlEZmtsQzZlbEh1SHJnczJRekdTeGNBUHpZZkc3YUVycUdDdjdHdjJLbFo5?=
 =?utf-8?B?VXNoRlNoeUpUNjlNV0VwQi9aQTZ1UmtaWU9jNW5KS2V4dW9CcnlpTG9ja2l3?=
 =?utf-8?B?d3NUSk5DVnQyUGxOcWRnUjU4QThiRjZ5amI4NVdhNjl6dlJqdVZxQ2dHL2RS?=
 =?utf-8?B?SzJNV0p4OE1MdUhNTlVtWTd2Ym5JTXREdElIWXNDMm8zZlFLWnUyN01UemtW?=
 =?utf-8?B?REd3cXVkY3BuY25VUXFHS2grVHRRSFozbWY2ZHM5RnBZQmZpT1luVFluSWZG?=
 =?utf-8?B?a1NaZTZUKzFKVkp3MElKVlgxRG5scVpWc25EYldHT2tFRGk4V2pTenpLeWQw?=
 =?utf-8?B?MkRxQUo4b244Y1ZvUEx5RXoxOVBld2xqb1Fwa01wQyt0cE1PRWM5cDRPdWhR?=
 =?utf-8?B?cGpYQjNVQi9jaXZKNk5EUENQZFNHeU96c2s3KzBRcEs4d0JkRXQ4dkExOStu?=
 =?utf-8?B?aW9UK25EN0tjRFZsU2pZZ0ZuNm9TNU90dDQxL2dpVmFBeEJpYkdyZ3hOWC85?=
 =?utf-8?B?VEFGRVc5VUo2WXF3aEtiWThYYmtnTFBEZDZ4SFFYUWZyNHVXVmNLc2VGMjhB?=
 =?utf-8?Q?M5mQFayw7Zs=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Y25EVDljS2lIWElRQlczVHZMcmsrMmptVWVJUlhBeUNpbGZFQnNVOUp2NjB1?=
 =?utf-8?B?blgyanJ2c3dFTzBNelZUckZpdUNRTXNWZjZuUG1sYklVUkxYMlNoMVNiVDdY?=
 =?utf-8?B?aGdRUis2MFQ3enpYYWlPQ2NFMjNMSTR0Y3MvdHdwRVFvVno5OXF4WFhwV25X?=
 =?utf-8?B?UDE5UlZOZk5FZEpCaUc1a0xiNUdBU0lQdjJQWHBRay9sR1VldXY5NnlLTlVt?=
 =?utf-8?B?WWk1VklaUGFBc0ZIZXpJMGVGU1BXMUlWR3RlWnBmTStVazFWeVVkcm9FU2RZ?=
 =?utf-8?B?cG9kdUV5K2t6THljRmw4dE84VHE1VndqMDJWU21naStsdHVHclZwZDZLaHRX?=
 =?utf-8?B?Nlo5OXo4TThRZVUrYW5UMWNNTGNZUlNkWCtzRno3SlcxUXpuYUQydC93N09J?=
 =?utf-8?B?bW9oSmF0SVRXT29lbzdsOFQ5eUo0TDYxNEhyY2VsMUlqUVpPMXUrMTUrWUdi?=
 =?utf-8?B?Mit4eUFNb1FjWFJuaDlxQU1McFlPU2E0YVJFWkcyUSsreGxvVzFFRnVhTnA1?=
 =?utf-8?B?eGRlRURqVFZ6Slo3azBGRzZ1TXRaVERNYWxHQTlzWEl1K0pLRGR6WFRtYnZl?=
 =?utf-8?B?MU02bEFqL3pSNWtaVEZpSHhwSit4c1JnMUEyQ2Z3aERGU1ZmeDR0ZW12Qytm?=
 =?utf-8?B?V29YWlg2T0xwdTdqbDdZL0ljTjJ1L1dKbUpIZVVEM2UwMjFUNUU1czVPaEZs?=
 =?utf-8?B?M1Bjb0lRSnY5aUR5SGFLS0F0eVdJTkpSb0Jxb1NrSDNhSkZxdzQ0eFZiY3JF?=
 =?utf-8?B?M1lkWWx4Tk1CYTNmVFdzN1ovZDc2ZTE0SGlycU02NW1nRmc0bk02WE5heG9Q?=
 =?utf-8?B?c0R6SUEvRmZUeHZPUXZjZmYxclVwZWZtaXFKM0J0S2VjQnVEdW9rWElCSGFV?=
 =?utf-8?B?dithdVhHU0lXVXpYQzk0YUFRMHdqVm9vanh4VUttdzB5emNxelZkS1J1MW9W?=
 =?utf-8?B?eDZJcGpINTl4ZUFWTVFDOHhuZ3pKSDBicEhFYTE5aW9CUWF6MU04WnAweGpO?=
 =?utf-8?B?ejQ2aXZZcDE1a1I4VUYxMXh2N0VkbERGaDJmVjVhM2xGem5obWpSNTlON3Zi?=
 =?utf-8?B?TGc1TXFYbHg3M1BaRlE3WkZnZzdQeUFXRnNjd0Jaei9od2QzSmVrdjlDRjJs?=
 =?utf-8?B?Qms0SDcvcmRnUWFzTC9FanpvVVpBSytMRmZOQ290MDBIcGE4V00xRExLd245?=
 =?utf-8?B?TG1CSWxHQ1dtWU5FejBiZ2VGL1pFcVNNamg1S2N6bXJsTU93clpjKytzMFYw?=
 =?utf-8?B?NnZzRzlmV0kzZUZSc3JHNC9TZVVzYTNYcTNLRTJsMkxqeDk3Q0NFNXQwb2Ft?=
 =?utf-8?B?TmtsTEoyM1ZsemwvRkJjYkNGMjJjanQ1MXM3bmtDN3ZjZlNuYzV2bHJ0Zks5?=
 =?utf-8?B?YW5Fbll5S016QVhXUjh1b2xhcDAzdHFvcE9MMVVJWFMyTHAvN0Vpakc1RUN1?=
 =?utf-8?B?LzhHaGJZQlVzOXF5aG1FWUlXNVp5ZWtGOTR2L2ErWCt3dWRDNFZZc1JLN3hl?=
 =?utf-8?B?amwrYUkxNVArRUxZTFpRWE5xREgrV0tmWE9SakdSQnVwNy96SVVnenlKRlBn?=
 =?utf-8?B?YmdtMXlmNVBCb0xIblBlOGUyS0gvclpmN1gwQ0tjUHV3Vzd3cnNHczFWYjRY?=
 =?utf-8?B?clNOemZnRXZTSmdMSFVzeVpVNWxKajlKc3p4cXJrZWNxTi9XdytVTTIrM2NX?=
 =?utf-8?B?U2VkSTdpQU1weG02dCtmUEhrRExXZHhHcTkxZ084bWtjRDJDaFArWThoMnAy?=
 =?utf-8?B?QmRMblhZd1AxQnlQQUh0b1Vyc1BCS09seW5MSWdqQ3pIeXgxTm5hWkl2NGhk?=
 =?utf-8?B?VGZSUWVIM2tHSFRDRU5xcFQ4R0NCcXk1SVhhVzg1cVJCTXV1UFFEL3BiUlhZ?=
 =?utf-8?B?dU55TlIxLzBJZXhHOVVxR2R0Y21WZVZYVzVOd3ZZcFZGUjlsR3NhTEg2MlZi?=
 =?utf-8?B?SjZsb25MOGgySGp4NkVSYVNoZERGWGNuRlEwVGV2b3NzcTJ6S2l1ajBmSVMz?=
 =?utf-8?B?YlRjV3B4a2VnQlJHUnFmMVBZMmQwbHdhZWZTOVd6TmcyRnRMa05YczZJT2ZE?=
 =?utf-8?B?VnMxaW1xR1lmem9IWnA5QnRVRmVxWmJnR2xabzdFdHk4bW5xcktBYjFDSjhM?=
 =?utf-8?B?Tjhzanh3REF2L2RGek4rV0VLVllkcE1PYVhXTWtvbHpTUG5DbGo0WTNSUFYv?=
 =?utf-8?B?cUE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AAD36958FA63E840B045681348F0A622@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8774154c-976f-4eba-6283-08ddbecbe459
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 09:35:07.4572
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bzkkAFZIsfSgvVej4GCwl7ZdHka3T8knh+Qno7zz+D9d9CO0UnIQab7cH6PQsmmIOobcZiN8yGTcOtegdrr0mIvVzzL+Hn3HKC22IuHj13A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6051
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 09:35:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220085

T24gVHVlLCAyMDI1LTA3LTA4IGF0IDExOjU3IC0wNjAwLCBUb20gUmluaSB3cm90ZToKPiBPbiBU
dWUsIEp1bCAwOCwgMjAyNSBhdCAwMjowNDoxNVBNIC0wMzAwLCBGYWJpbyBFc3RldmFtIHdyb3Rl
Ogo+ID4gSGkgTWF0aGlldSwKPiA+IAo+ID4gT24gVHVlLCBKdWwgOCwgMjAyNSBhdCA5OjM34oCv
QU0gTWF0aGlldSBEdWJvaXMtQnJpYW5kCj4gPiA8bWF0aGlldS5kdWJvaXMtYnJpYW5kQGJvb3Rs
aW4uY29tPiB3cm90ZToKPiA+ID4gCj4gPiA+IE9uIFR1ZSBKdWwgOCwgMjAyNSBhdCAzOjI5IEFN
IENFU1QsIEZhYmlvIEVzdGV2YW0gdmlhCj4gPiA+IGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3Jv
dGU6Cj4gPiA+ID4gVXBncmFkZSB0byBVLUJvb3QgMjAyNS4wNy4KPiA+ID4gPiAKPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+Cj4gPiA+ID4g
LS0tCj4gPiA+IAo+ID4gPiBIaSBGYWJpbywKPiA+ID4gCj4gPiA+IFRoYW5rcyBmb3IgeW91ciBw
YXRjaC4KPiA+ID4gCj4gPiA+IEl0IGxvb2tzIGxpa2UgdGhpcyBpcyBicmVha2luZyBzZWxmdGVz
dHMgb24gdGhlIGF1dG9idWlsZGVyOgo+ID4gPiAKPiA+ID4gMjAyNS0wNy0wOCAwNzo0Mzo1Miwx
MTYgLSBvZS1zZWxmdGVzdCAtIElORk8gLQo+ID4gPiBmaXRpbWFnZS5VQm9vdEZpdEltYWdlVGVz
dHMudGVzdF9zaWduX2Nhc2NhZGVkX3Vib290X2ZpdF9pbWFnZQo+ID4gPiAoc3VidW5pdC5SZW1v
dGVkVGVzdENhc2UpCj4gPiA+IDIwMjUtMDctMDggMDc6NDM6NTIsMTE4IC0gb2Utc2VsZnRlc3Qg
LSBJTkZPIC3CoCAuLi4gRkFJTAo+ID4gPiAuLi4KPiA+ID4gRVJST1I6IHUtYm9vdC0xXzIwMjUu
MDctcjAgZG9fY29tcGlsZTogb2VfcnVubWFrZSBmYWlsZWQKPiA+ID4gLi4uCj4gPiA+ID4gYXJt
LXBva3ktbGludXgtZ251ZWFiaS1sZC5iZmQ6IGNhbm5vdCBmaW5kIGFyY2gvYXJtL2xpYi9saWIu
YToKPiA+ID4gPiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cj4gPiA+IAo+ID4gPiAKPiA+ID4g
Qm90aCBvbiBkZWJpYW4gYW5kIGFybWhvc3Q6Cj4gPiA+IAo+ID4gPiBodHRwczovL2F1dG9idWls
ZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy8zNS9idWlsZHMvMTkyMwo+
ID4gPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWls
ZGVycy8yMy9idWlsZHMvMjA3Nwo+ID4gPiAKPiA+ID4gQ2FuIHlvdSBoYXZlIGEgbG9vayBhdCB0
aGVzZSBmYWlsdXJlcyBwbGVhc2U/Cj4gPiAKPiA+IFRoYW5rcyBmb3IgdGhlIHJlcG9ydC4KPiA+
IAo+ID4gSSBhbSBhZGRpbmcgc29tZSBmb2xrcyBvbiBDQyBpbiBjYXNlIHRoZXkgaGF2ZSBzb21l
IGlkZWFzLgo+IAo+IEludGVyZXN0aW5nLiBIb3cgY2FuIHdlIHRyaWdnZXIgdGhhdCBvdXRzaWRl
IG9mIHRoZSBhdXRvYnVpbGRlcj8KPiAKClByb2JhYmx5IHRoaXMgaXMgbm90IHJlbGF0ZWQgdG8g
dGhlIGZpdCBpbWFnZSB0ZXN0cyBhcyBzdWNoLiBJdCdzCnByb2JhYmx5IGp1c3QgdS1ib290IGl0
IHNlbGYgd2hpY2ggZG9lcyBubyBsb25nZXIgY29tcGlsZS4KClRoZSB0ZXN0IGdlbmVyYXRlcyBh
IGxvY2FsLmNvbmYgZmlsZSBsaWtlIHRoaXM6Cmh0dHBzOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcv
cG9reS90cmVlL21ldGEvbGliL29lcWEvc2VsZnRlc3QvY2FzZXMvZml0aW1hZ2UucHkjbjE0MTQK
CmFuZCB0aGVuIGl0IHJ1bnM6CgpiaXRiYWtlIHUtYm9vdAoKCgoKUnVubmluZyB0aGUgdGVzdCBh
cyBpdCBydW5zIG9uIHRoZSBBQiBzaG91bGQgYmUgcG9zc2libGUgbGlrZSB0aGlzOgoKIyBTdGFy
dCB3aXRoIGEgY2xlYW4sIGRlZmF1bHQgbG9jYWwuY29uZgpnaXQgY2xvbmUgaHR0cHM6Ly9naXQu
eW9jdG9wcm9qZWN0Lm9yZy9wb2t5CmNkIHBva3kKLiBvZS1pbml0LWJ1aWxkLWVudgoKY2F0IDw8
IEVPRiA+PiAkQlVJTERESVIvY29uZi9sb2NhbC5jb25mCiMgb2Utc2VsZnRlc3QgcmVxdWllcyB0
aGF0ClNBTklUWV9URVNURURfRElTVFJPUyA9ICIiCgojIFVzZSBZb2N0bydzIHB1YmxpYyBzc3Rh
dGUtY2FjaGUKQkJfSEFTSFNFUlZFX1VQU1RSRUFNID0gJ3dzczovL2hhc2hzZXJ2LnlvY3RvcHJv
amVjdC5vcmcvd3MnClNTVEFURV9NSVJST1JTID89ICJmaWxlOi8vLioKaHR0cDovL3NzdGF0ZS55
b2N0b3Byb2plY3Qub3JnL2FsbC9QQVRIO2Rvd25sb2FkZmlsZW5hbWU9UEFUSCIKRU9GCgpvZS1z
ZWxmdGVzdCAtdiAtSyAtciBmaXRpbWFnZS5VQm9vdEZpdEltYWdlVGVzdHMudGVzdF91Ym9vdF9m
aXRfaW1hZ2UKClRoZSBkZXRhaWxlZCBsb2cgZmlsZSBpcyBoZXJlOgokQlVJTERESVIvdG1wL2xv
Zy9vZS1zZWxmdGVzdC1yZXN1bHRzLmxvZwoKCgpBZHJpYW4K

