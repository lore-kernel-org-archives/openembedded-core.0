Return-Path: <pedro.silva.ferreira@criticaltechworks.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F9EDC52D71
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 15:54:41 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.70])
 by mx.groups.io with SMTP id smtpd.web11.10894.1722959671084645172
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Aug 2024 08:54:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticaltechworks.com header.s=selector1 header.b=RwhSsNrx;
 spf=pass (domain: criticaltechworks.com, ip: 40.107.103.70, mailfrom: pedro.silva.ferreira@criticaltechworks.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wwU7v/7PUDgBwhQ6pvMVk6ESpwsrUMQAkeX/YvzZDfwGGLSd48fpx/85s8JB4He4drMgx6d86+dRLAN9kETImMsnnmXtp66azoKFNQdFkRGV/1vvuTv0qJwmYYePzDmqe4d9+0Lhe4I1My6Iwe1RIAxwBK73Hf6fWfN1WzBaCKj7B8+3tcbC3TIJ22Zc42K5/peUz0Byr0ZrbEyrhZGzoPDJp2ChOp4r0M0iBl1qxAp/eseUP1tvLyHHrHSUzjbWyDkQVOaHy41aIcgtJZMI28KheQ44I9EbUgZ97pPYR/EpW1eZkAGGUF9SXutsOLHfNb1usyvnu6ClagOWVlCQaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CAMLzH6xd/WgZ1ixUSjY68FOcp7yUpMLFwK1kBEbIKQ=;
 b=dM3ss0xmwU9ZDvPhv3mC3z+f5pECj80S5Nu8EC6NO4NpW/NHGaru+njGCpkCAZn8PmAHKehdqUHhsix04yOHpfET3//K67YlFf0Ku7JNmOyvUWVMuqCmxwRYb1wyRKfi5WMJk7P4Ui5OvhDAeAxxBubJvfkxSBYmjGIO6pyHGUEdXJL8AVUIaxHXDxnGsUXd6elHNCjcDQScsIcgJhiaT0HXK0jAwXVUIMF5YhD66j1/c9PD9FY9waXDy8Hp0TKQPwwlCmncHBO9WZrZAFTtYG/HhDV7TeEIbGCx7ihRRRJL7M3WAr+rH/euLYaY7S6juEjnzbe2gkRADJPUdNj40w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=criticaltechworks.com; dmarc=pass action=none
 header.from=criticaltechworks.com; dkim=pass header.d=criticaltechworks.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=criticaltechworks.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CAMLzH6xd/WgZ1ixUSjY68FOcp7yUpMLFwK1kBEbIKQ=;
 b=RwhSsNrxHGHduIHOxw+bK9r7oKx4WK9HMyfdB4HcAOPFrU3/jNmQ+EoD9z3nJ4NpJ0k8ug2Ozed8WoHw/jzXDbdegxdPbuaGTi2YafMsISin0B01cFEG8IWlUSYPzVXybp1ERElJQRVm/DIr45RYbgRWO7RqK3RQJsGJYpofwgBmeV47YPlO4fjScW8ojVCnPRE34lbENKbGBwIN1T42jEdwscUelcsYTTD3vBWeI58YzbfFiQ+NcopDUHOOEmmUjaABKTSJtywrGMMmoVP3pgqE9Sof93GJVWCzXfiGZrnfYpdw+/Pk4/97y4+et3+NSEhuN/RnTUlbtpNedk/RfA==
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:1ed::9)
 by AS8P193MB2335.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:446::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Tue, 6 Aug
 2024 15:54:26 +0000
Received: from AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1]) by AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
 ([fe80::c359:f497:ed59:65a1%7]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 15:54:26 +0000
From: Pedro Silva Ferreira <Pedro.Silva.Ferreira@criticaltechworks.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Pedro Ferreira <pmi183@gmail.com>
Subject: RE: [OE-core] [PATCH 1/2] buildhistory: fix package output folder
 creation
Thread-Topic: [OE-core] [PATCH 1/2] buildhistory: fix package output folder
 creation
Thread-Index: AQHa5ORNBqNcNeVwKk+w6N9sXWYXnrIUB9oAgASqh8CAAYN0AIAALFWw
Date: Tue, 6 Aug 2024 15:54:26 +0000
Message-ID: 
 <AM8P193MB0900232A2583C0EDB8A17334C7BF2@AM8P193MB0900.EURP193.PROD.OUTLOOK.COM>
References: 
 <20240802140008.497492-1-pedro.silva.ferreira@criticaltechworks.com>
	 <6185d36c7da8c96430a9a1c51d83ed9afedeee1e.camel@linuxfoundation.org>
	 <AM8P193MB0900B95FF9A6569D089C600DC7BE2@AM8P193MB0900.EURP193.PROD.OUTLOOK.COM>
 <2c9b758a87799f4307164a24a7cecb2bb3e710c4.camel@linuxfoundation.org>
In-Reply-To: 
 <2c9b758a87799f4307164a24a7cecb2bb3e710c4.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=criticaltechworks.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM8P193MB0900:EE_|AS8P193MB2335:EE_
x-ms-office365-filtering-correlation-id: 02234ee2-455f-46e8-47f4-08dcb6300c70
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?REZUSDNRSzB2R1ZmdVJOeXZtY3hvYUdzeEJ2Smh4dmZCRUJ2NUQ5eE1pQ1BO?=
 =?utf-8?B?amw4OTg0d2VLakYrK2REU1NvUFJaSFkvWDJUQ280U0k2K0ZBOGRCREZTenI0?=
 =?utf-8?B?dXlMYnZoQTd4YUxxa2FJVlBGMXI3Wk15UmYvc29weFlwY2RadnFsTFVtc3lE?=
 =?utf-8?B?ZzVxUEVhY05zc3FVNm9JZVVjb2x6WlAyS2hjcGRSd2JpUXNSRWYxbFRhS3d6?=
 =?utf-8?B?OE4xN2ZZa3YvaUtxMGJSQ2tqNFdBclVvTTZlNFBBT2ZTTGpHYURnM3hjSkhE?=
 =?utf-8?B?VWg0MWZEK29PVEh5SENIOXd6UWlQY1o0ZzcxWXYxYzFNM3BTQnYvUEk5bXBq?=
 =?utf-8?B?eWp6QnMzMDlwcVFuTFlXcUtwTFVMUTVsSWZHME9SWjRwWjZrT3NyeXNhZlVQ?=
 =?utf-8?B?TjZGRXJjY1lYcFFLZEJlQXA2bG1XbENaeW5LM3BlYWVzaHh0VzE5NENmV29k?=
 =?utf-8?B?ZlliZ0pXai9HQ0s2ZzJqTWpXRHlLeWxnTjVsWmpqbEs4U2sxelBIUmUwY0FI?=
 =?utf-8?B?RlVTSzhwQVl5TXJza0s0N2pOcFk3UXlabnZTUTlQY3NTdWxZVmxqeGhlbHdh?=
 =?utf-8?B?N2M4UGI0NWdhaGhNTmhBb2ZzeTZTY0twMDdWK1VYZ2NQY2RaclBiZkZ4am1T?=
 =?utf-8?B?QUkzc0VGYUFZbjJSc2RvS0hHNi81ZWw3emdwTTRnQjZhVk9WQzBPY2NHbEhj?=
 =?utf-8?B?c2s4dG9jakNKcmJnN05BSDMycDN1Y2xVeG1GQldkMTkwaVpMallDUjlPNkxS?=
 =?utf-8?B?TXVXNFAyWDdOdDU5RS9oMk1sSkt0ZFBYczJFQlNQR0VOZSs3TGw3aWsxaVV0?=
 =?utf-8?B?OStPRXNrZks3dFc2OUg0M2hLTTFiU0hNTHk3eHc3RTkyU0dxdFdxOGVCdENl?=
 =?utf-8?B?V1JmbE1ISEJRdkR3VWZFQmFaYUNSU09RaEFMTmpKb01KY25VWXlDUUJpTWMz?=
 =?utf-8?B?SE5mckF5ZEh2MGFCRytHeVhxZXhzMTJQN3JrQlJJc3Z2M0VoeWxIZnA1bVVl?=
 =?utf-8?B?NE5vL3RzN3Erd0JjZjhZYlduNm8vTEFkWmxlUDJGaU5NMTNNM1l2bmRQNmp2?=
 =?utf-8?B?SitJZU04R3ovNTVUWkg4NzF3VHc4dGFXbkVMWUhhQ1laVGdDY1g4NHFEZWNX?=
 =?utf-8?B?bHpaL0tyQ2R6Y3NuclJQRExMTVVtNitwQ1RZZmM5cHNnaW4yWXVZc1Z2dEhG?=
 =?utf-8?B?NlZjamoxcWdoNmJMc1dmQ3RuQ3ZjanFJV3RZbVpVN3FvTXZWNnZZbCtMK3dG?=
 =?utf-8?B?eklZSEhkTm52aXBFMmlya3Y0RTVZaUZPdmZwd2R3M2pkaVcrWFJSaFh2cEZh?=
 =?utf-8?B?ZTBpampiTFR1NHVpMnhkVVk0TW0xMFVPbDBPUWtHYzJjQTJqM0JrZmkvWU15?=
 =?utf-8?B?VkpKVkMwOWpEY0kvbDArMzUwOFpCblhPRmQ2YlUycDF1NlhhbkptRXRha2lr?=
 =?utf-8?B?TDZKcUlUMmZmQm1POExwR3dJZXZyWkFRY3RJOHFmQWhKZUxGcitILytQZFpZ?=
 =?utf-8?B?UEhISzFLTlVISURXU2MzbkxTMW5FeXg5ZGx0UnpjZlo2SWg4MTdHaFFQZmUx?=
 =?utf-8?B?ZnlvQmhuak1LYnpjNXhxNkptRGhGa29BOTd1R05tbnhFdzkybCtKekYzdnlN?=
 =?utf-8?B?a1JqMklvQmxUa2R4NEhSTTRVNWlvQlRhNWx4UmhNcTdyUEQ2THFmT3dFRTJI?=
 =?utf-8?B?bkJ3THFpNHB2enI4c1k3eGZDcW05a3B1Z3hzbG9RcklOd3F3a3lselBJYzkx?=
 =?utf-8?B?aG5YOW9yQXA5ZDBJc3hHUFVWbXU5UytMcXJoSG1Mc0g3TEsrNE0wUEJGbzhC?=
 =?utf-8?Q?QcFlGvmjFHWRpNNcvvnnCI8A66igwoI04blnQ=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8P193MB0900.EURP193.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MExoUTZpRyszWFpBbkdFNnFtWnFyRUVKdDNkZExkeFRRcXAvdytKSU92OW5u?=
 =?utf-8?B?RW8rcWR6QmRHSms1SXhZOTA4QmVqUFpaelliWnQwSklFUmdSMTZDTHE5WVVv?=
 =?utf-8?B?aUdaWFo4WThJUTRuS243YjB5VjhhU0IvaXJNZVIrWHkyMkFHdGQxNjZsOU5D?=
 =?utf-8?B?WkZ6dzlwdE00alVSeHVIcS9JUTJ1Q09zMmZUN3hRQ3ZnOVc0cEFLY0dRZGxB?=
 =?utf-8?B?ZUlnaUtoeEtiTVgrVWJKNFU4ZmtES0NVMjBaSDNhN3Fxd0V4ZUtKekNUZVRF?=
 =?utf-8?B?VnBvRVpLQ3VJUmFod05YZFJjcGhJdXJEZnZiL0pPZzBuU1Z4bkdWSkxEd0lW?=
 =?utf-8?B?VmRYVGx3SWRDRi9HOUlrek5pNmkzU0FOeXplQVpyNVl0S3YwdEsrRE50N3Rr?=
 =?utf-8?B?czJhbHVSRTNDaXhLTlJKNG5hMGRtTnBaS0NKUUx1dCtOVE9MdkVhNjV0TG8r?=
 =?utf-8?B?SXNUcE1hVGhFQmlOcDJUQ29JYitVN2RNRFJ3Y3BhOWZSUmI1T1lHRFVsdVBp?=
 =?utf-8?B?Mnd4OWkybzM1VXZ4UEUrWGV4dklWS21YY3UyejRhUkhIUWhPSDBad0pFZTZu?=
 =?utf-8?B?VHBOTHZSc1VxODJjVjZnNmVRc2Q2Q0l2WCtoc2FWcWxBcmZ4YnNEc2hDVWdR?=
 =?utf-8?B?eTFLeXJyVnZDNnRxL2VPekVRU0U4bzBWQWZ1T0t0VHh6bzlmY0ZEOU12NXMx?=
 =?utf-8?B?c1c5dlh0THY5QVcxQ3JKVGRPbml2aDNOdk91dm9vYllhN3NCYzBnMmtlVjFj?=
 =?utf-8?B?bUp6MjkwTEdlZmFvYldkUG5KSERWekcxRExFNlVGZElEWld0QklTVURwSEE4?=
 =?utf-8?B?V1hoZ1ovTk5BTjhCdjVhLzNVa2EvWFQydkxRRFNpS2g4bFZBcm80bTY3Wkt6?=
 =?utf-8?B?RzhzS3h5a2Q3ZENGbjJyak9MTkxUbFNrdGpYMDNwS0R6eTFkSXZKNmJuYjVZ?=
 =?utf-8?B?a3daMzBlYnpQTzZxQnhJam9veFQzOEd6eU0wWlEvL3MxWFhvTHB1U3VZRTBX?=
 =?utf-8?B?YW1sanA2dUEwZDNxRTEwNFUvNlUxWEQrcEhWb1RtWGVnd1NxR3RGdEtyUHRC?=
 =?utf-8?B?N3lSK2VIYlp0NGJoekh2bjc4MUxRbjNBeUVDQlB5YjVMUFU4WlRnZFNtVU9R?=
 =?utf-8?B?UXhWNVJIR3dPOFBTUEEvSTh0cUlWR1RWTWRhalR4U0VTZ25sZzRvOG0yZmJi?=
 =?utf-8?B?eldRQ2VCMlprMG4xR1FRRzI1OFc1SHY0aFFNSjlIYlZWUG85YmlDeXVWWlIz?=
 =?utf-8?B?N0lHY3J3a0Q1THczdy9GcUtmVjFMZnB2cWtJK0o3SW1LMFZDWlZmRnhvaDN0?=
 =?utf-8?B?MDU0TUtNSkkyTzhzeTJZb3RTaENkS3phMklyQWc2SHpuaTJnY0I4ZTlkUU9p?=
 =?utf-8?B?YTgySVNwWC9qa204ZFJ0cld4bkd4bDRuYm81blg0bXVOanNpeTB0N2ViRk11?=
 =?utf-8?B?RDJYT0c4MTAvSG0vc1JRdEE3cXh2bHNpRDNPb05hVEJVUzk5N0xCbC9QVzNz?=
 =?utf-8?B?amNlc28zSmVvTzNPaUx4eDVWVnVJMHJ4RnJ1NXltZ1g3K1IwSnlmYW1YRUg3?=
 =?utf-8?B?VXpEVTd3dlhpb0I5cjZjbnJRWEdSRU9GRjJHTkZrMEVidkljbktGRHFtTWRS?=
 =?utf-8?B?VUpySmlYZElKbSt3UWZiSldlQUVJT2E1ZndZUFUzemhhKzB0L0NsRDR2d2lU?=
 =?utf-8?B?MXovcitQdjhDRVV1UEZreHJwL0pKVVZNTHlwSHpRVnIxV3VUVmppa3o3VmNC?=
 =?utf-8?B?U2hueVlSQUlRaGUwOFpPWGdQZmlmTFlNYUFTdFRjaEcvUld6Q0loZHlJMUlx?=
 =?utf-8?B?VlQvOGNYajVyTGtMRWxkcXFxeXk3U09JQWlwTjlVTkgvam5GaDQ2aElvendU?=
 =?utf-8?B?UzVNV2RKMTFQenpiNmdQeTFpQWdJOWx0THRPVXdaRHdELzQ5Ykxxd2szQWsw?=
 =?utf-8?B?L21LYmk4cy81c0trOXBxdFcxbTBvWFg0Z3dBLzlxVENzMGNWRFFlaXhvaUZn?=
 =?utf-8?B?TlVoME5ZcGd3NGljWHNLM2RhNVFxbk83cTdjRDlqWkpwRE5xN1ZHcnR3VjNZ?=
 =?utf-8?B?Um9ZNTlrb3V3QjNWUnhDcGxjSTJVYjdKdysvRjMySkRoUzA3NHY5YVE1U2oz?=
 =?utf-8?B?OW9rL05GcXBwcERvSUhWWnp1a3I2cjdGR3dyQ20xbGR5VkFtUWFZeUhtd0dz?=
 =?utf-8?B?N0E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: criticaltechworks.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8P193MB0900.EURP193.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 02234ee2-455f-46e8-47f4-08dcb6300c70
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2024 15:54:26.3011
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 61f30b8e-4f6b-44fe-9bc2-041e3a9f7346
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: l1Q6xSgR9UfUPDY6Qpv4v5xZyzWPsYZa7iVOJRb8szR56/WzzORq26VixHAB4yo/Ks+YXaYzYFKiOEdZInm2U9JfYlUNYLkfCqPQYuvS7TA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8P193MB2335
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Aug 2024 15:54:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203030

SGksDQoNClllcyBJIGNhbiBzZWUgdGhlIGlzc3VlIHVzaW5nIHBva3lbbWFzdGVyXSBvbiBjb21t
aXQgYGRiODdjYTA3MGM1YTQ3OTBkY2RiOTYwMWJjYjM1MDM3NjAzZjZkN2ZgLg0KRm9yIGVhY2gg
cGFja2FnZSBpbnNpZGUgcmVjaXBlX3BhY2thZ2UgSSBjYW4gb25seSBzZWUgbGF0ZXN0IGFuZCBs
YXRlc3QucGtnX3Bvc3RpbnN0L3ByZWluc3QgaWYgYXBwbGljYWJsZS4gVGhlcmUgc2hvdWxkIGJl
IGEgZmlsZXMtaW4tcGFja2FnZS50eHQgZm9yIGVhY2ggcGFja2FnZSwgYnV0IGFzIEkgbWVudGlv
bmVkLCB0aGUgYHJlY2lwZV9wYWNrYWdlYCBmb2xkZXIgZXhpc3RzIGJ1dCBub3QgYHJlY2lwZV9w
YWNrYWdlL3BhY2thZ2VgIGZvbGRlciBkdXJpbmcgYHBhY2thZ2VgIHRhc2sgYW5kIG9ubHkgb24g
dGhlIG5leHQgdGFzayB3aGljaCBpcyBjcmVhdGluZyBgbGF0ZXN0YCBmaWxlLCB0aGlzIGZvbGRl
ciBhcmUgY3JlYXRlZChleDogYmFzZS1wYXNzd2QtZGJnLCBiYXNlLXBhc3N3ZC1kZXYsLi4uKS4N
CkZZSTogSSB1cGRhdGVkIHRoZSBwYXRjaGVzLCBTaWduZWQtb2ZmLWJ5IHdhcyBwb2ludGluZyB0
byB0aGUgd3JvbmcgZW1haWwuDQoNCk15IGJlc3QgcmVnYXJkcywNCg0KUGVkcm8gRmVycmVpcmEN
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNo
YXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPg0KU2VudDogVHVlc2RheSwgQXVndXN0IDYs
IDIwMjQgMTo1NSBQTQ0KVG86IFBlZHJvIFNpbHZhIEZlcnJlaXJhIDxQZWRyby5TaWx2YS5GZXJy
ZWlyYUBjcml0aWNhbHRlY2h3b3Jrcy5jb20+OyBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQpDYzogUGVkcm8gRmVycmVpcmEgPHBtaTE4M0BnbWFpbC5jb20+DQpTdWJq
ZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAxLzJdIGJ1aWxkaGlzdG9yeTogZml4IHBhY2thZ2Ug
b3V0cHV0IGZvbGRlciBjcmVhdGlvbg0KDQpOb3RpY2U6IFRoaXMgZS1tYWlsIGhhcyBvcmlnaW5h
dGVkIGZyb20gYW4gZXh0ZXJuYWwgZW1haWwgc2VydmljZSwgc28gZG8gbm90IGNsaWNrIG9uIGFu
eSBsaW5rcywgbm9yIG9wZW4gYW55IGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB3aG8gdGhl
IHNlbmRlciBpcyBhbmQgYXJlIHN1cmUgdGhlIGNvbnRlbnQgaXMgc2VjdXJlLg0KDQoNCg0KT24g
TW9uLCAyMDI0LTA4LTA1IGF0IDE0OjUyICswMDAwLCBQZWRybyBTaWx2YSBGZXJyZWlyYSB3cm90
ZToNCj4gV2l0aG91dCB0aGUgZml4IHlvdSBjYW4gY2hlY2sgdGhhdCB3aXRoOg0KPiBTZXQgb24g
bG9jYWwuY29uZiA6IElOSEVSSVQgKz0gImJ1aWxkaGlzdG9yeSINCj4gUnVuOiBiaXRiYWtlIC1j
IGNsZWFuc3N0YXRlIGJhc2UtcGFzc3dkICYmIGJpdGJha2UgYmFzZS1wYXNzd2QNCj4NCj4gVGFr
aW5nIGEgbG9vayBvbiBidWlsZGhpc3RvcnkgeW91IHdpbGwgc2VlIHRoYXQgZm9yIGJhc2UtcGFz
c3dkDQo+IHBhY2thZ2VzIHRoZXJlIGlzIG5vIGZpbGVzLWluLXBhY2thZ2UudHh0DQo+DQo+IFJl
YXNvbjoNCj4gT24gbG9nLmRvX3BhY2thZ2UsIHRoZXJlcyBhIGxvZywiREVCVUc6IFNoZWxsIGZ1
bmN0aW9uDQo+IGJ1aWxkaGlzdG9yeV9saXN0X3BrZ19maWxlcyBmaW5pc2hlZCIsIHdoaWNoIGlu
ZGljYXRlcyB0aGF0IHRoZSBtYWluDQo+IHNoZWxsIGZ1bmN0aW9uIGZvciB0aGUgYGZpbGVzLWlu
LXBhY2thZ2UudHh0YCB3YXMgdHJpZ2dlcmVkIGFuIHNvIHRoZQ0KPiBmdW5jdGlvbiBleHBlY3Rz
IHRoYXQgdGhlIHJlY2lwZSBwYWNrYWdlIGZvbGRlciBleGlzdHMgaXQgd2lsbCBza2lwDQo+IGBm
aWxlcy1pbi1wYWNrYWdlLnR4dGAgY3JlYXRpb24uDQo+DQo+IE9uIGBwYWNrYWdlRGF0YWAgdGFz
aywgdGhlcmUgYSBweXRob24gZnVuY3Rpb24gYHdyaXRlX3BrZ2hpc3RvcnlgIHRoYXQNCj4gcnVu
cyBmb3IgYWxsIHBhY2thZ2VzIGZyb20gYSByZWNpcGUgcGFja2FnZSBhbmQgdGhpcyBmdW5jdGlv
biBpcw0KPiBwcm90ZWN0ZWQgdG8gY3JlYXRlIHRoZSBmb2xkZXIgaWYgdGhpcyBkb2VzbuKAmXQg
ZXhpc3RzLg0KPiBXaGVuIHdyaXRpbmcgYGxhdGVzdGAgd2UgYXJlIHByb3RlY3RpbmcgaXQgZnJv
bSBmYWlsaW5nIHRvIHdyaXRlIGRvd24NCj4gdGhlIGZpbGUgYnV0IGZvciBgZmlsZXMtaW4tcGFj
a2FnZS50eHRgIHdlIGRvbuKAmXQuDQoNClRoYW5rcyBmb3IgdGhlIGRldGFpbHMuIENhbiB5b3Ug
Y29uZmlybSB0aGlzIGhhcHBlbnMgd2l0aCBjdXJyZW50IG1hc3RlciBwbGVhc2U/IEkgdGVzdGVk
IGl0IGFuZCBjb3VsZG4ndCByZXByb2R1Y2UuDQoNCkknbSB3b25kZXJpbmcgaWYgdGhpcyB3YXMg
Zml4ZWQgYnk6DQoNCmh0dHBzOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcvcG9reS9jb21taXQvP2lk
PTJmZWI5ZTIwZTQ2NDA4OGMzNzdmYWRiOTM0NGRhMjgxMDA2NjIxMzANCg0KQ2hlZXJzLA0KDQpS
aWNoYXJkDQpUaGUgaW5mb3JtYXRpb24gaW4gdGhpcyBjb21tdW5pY2F0aW9uIG1heSBjb250YWlu
IGNvbmZpZGVudGlhbCBvciBsZWdhbGx5IHByaXZpbGVnZWQgaW5mb3JtYXRpb24uIEl0IGlzIGlu
dGVuZGVkIHNvbGVseSBmb3IgdGhlIHVzZSBvZiB0aGUgaW5kaXZpZHVhbCBvciBlbnRpdHkgaXQg
YWRkcmVzc2VzIGFuZCBvdGhlcnMgYXV0aG9yaXplZCB0byByZWNlaXZlIGl0LiBJZiB5b3UgYXJl
IG5vdCBhbiBpbnRlbmRlZCByZWNpcGllbnQsIHlvdSBhcmUgaGVyZWJ5IG5vdGlmaWVkIHRoYXQg
YW55IGRpc2Nsb3N1cmUsIGNvcHlpbmcsIGRpc3RyaWJ1dGlvbiBvciBhY3Rpb24gaW4gcmVsaWFu
Y2Ugb24gdGhlIGNvbnRlbnRzIG9mIHRoaXMgaW5mb3JtYXRpb24gaXMgc3RyaWN0bHkgcHJvaGli
aXRlZCBhbmQgbWF5IGJlIHVubGF3ZnVsLiBJZiB5b3UgaGF2ZSByZWNlaXZlZCB0aGlzIGNvbW11
bmljYXRpb24gYnkgZXJyb3IsIHBsZWFzZSBub3RpZnkgdXMgaW1tZWRpYXRlbHkgYnkgcmVzcG9u
ZGluZyB0byB0aGlzIGUtbWFpbCBhbmQgdGhlbiBkZWxldGUgaXQgZnJvbSB5b3VyIHN5c3RlbS4g
Q3JpdGljYWwgVGVjaFdvcmtzIGlzIG5vdCBsaWFibGUgZm9yIHRoZSBwcm9wZXIgYW5kIGNvbXBs
ZXRlIHRyYW5zbWlzc2lvbiBvZiB0aGUgaW5mb3JtYXRpb24gaW4gdGhpcyBjb21tdW5pY2F0aW9u
IG5vciBmb3IgYW55IGRlbGF5IGluIGl0cyByZWNlaXB0DQoNClRoaXMgZS1tYWlsIGlzIGVudmly
b25tZW50YWxseSBmcmllbmRseSwganVzdCBsaWtlIENyaXRpY2FsIFRlY2hXb3Jrcywgd2hpY2gg
bGl2ZXMgaW4gYSBwYXBlci1mcmVlIGF0bW9zcGhlcmUuIFRoZXJlZm9yZSwgcGxlYXNlIGNvbnNp
ZGVyIHRoZSBlbnZpcm9ubWVudCBiZWZvcmUgcHJpbnRpbmcgaXQhDQo=

