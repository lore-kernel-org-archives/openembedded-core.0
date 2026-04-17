Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8519EF436AC
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 14:07:13 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45895.1776434825859049373
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2026 07:07:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=qlKLjYRz;
 spf=pass (domain: siemens.com, ip: 52.101.66.57, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=juucLzokI806DJTN/8t36UnQBlr9n8Pm3NLPHxVCBa5ZofWD3rrNMr1pFM+Q6M9IToQ5onL6bV3wqM2HeFwtwBAfusmCp2i4AopslsCn2RXfPvWBtJkuKFdqnHGzusPuP5bdCXja3KVTL+cDCOyyW5Tq0u8PG2Lpda9Y2OCkfZMMjhLbHRZgh1PRDUROoE48OMT5Lu9GG+mvyeThr1SObuci/efWIflYu8AGgYO3FnJ7pGvRUQKpgrMm7QgvNGtdfeM/El+faXt1H+r+xJwuTxGfpy9a8UPfX8j4wts2kZKKFXlzDy+8Wdw+em5aFT4r1UjCjQQfzw4lqtwdlT81jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXn0nKRocZS53Bh1c/sGqX5fjk5KZd19vKc1BK71nSs=;
 b=REtr30NfnjUteOt9b63ezpwW6aprwDV4hRwJz2ZKKkC6/5Fl40ql91HroauYFqS2pNeuePpKM9woTbK8Ij9/PnUeqp6mFJon9K7wM6NitkeYq8yDDCbOHcQvzIrWLBmIu1qPpJn8UI9jcJ6WFKj6CTnUYCiemvq04hIwGfBOsZa7F1G5IS3BOe1ezzx1AJGKnI0lBtCy+yLFabMo/K2dKILXh9dkd9z0nVorRDoVuvjEv4oc2oe5OllJgplUaVP5Gm7BH5qwLZwAEkz+X2O9MMflJbVdljYnYohbBkUkWE7WaoMPIIIIR7E828W3dfcdh5PycMbFHqdPp0ANIhaOxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXn0nKRocZS53Bh1c/sGqX5fjk5KZd19vKc1BK71nSs=;
 b=qlKLjYRz7w3xm2kNGk0Tjj+4aRkx266rZvGpolT4EWey8kebAsqnC664M36jsEJ6PFPG9jYXZPVX+NZwLj9mtRkhZP5ndS06t36ksKj0TWVePeZKGYh3iXrcGRjj0vzOHf2mcWqB6m9wtHQ/5749uphU7prWhPG297ZSZFAtB5bm2TBvMPzqLMrO33cPeL4VmOfMlrkYwZGGL8Kj+/x1nsApF+hgUyXpfH4sR4uGiZbxGqzYl8CE8wk+squkIiPLPOzLJTEuaxojWVtxUasMARmlQy34LLTkaQmCvpHaGOjYtCWD9P2g2+T4p7l7TYePiasL4VCtGXI5KrRnlDQv7w==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by AS1PR10MB5390.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:48f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 14:07:02 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::b54d:255a:1abf:2dc7%5]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 14:07:02 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Joshua Watt <jpewhacker@gmail.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] create-spdx-3.0: rerun do_create_recipe_spdx on
 patch changes
Thread-Topic: [OE-core] [PATCH] create-spdx-3.0: rerun do_create_recipe_spdx
 on patch changes
Thread-Index: AQHczkSFynLD3P4WJU+nWKjctRa5kbXjJ/SAgAAgvgCAAAFR4A==
Date: Fri, 17 Apr 2026 14:07:02 +0000
Message-ID: 
 <AS1PR10MB569738C96CD3D3A348421039FD202@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20260417083025.95554-1-peter.marko@siemens.com>
 <3b0b8c914e99882168b9415dba9d001a4381e150.camel@linuxfoundation.org>
 <CAJdd5GYRTgTiwX=pFpe71t1hS3zZiNfSvtbG3tgKuWjSkSuZYg@mail.gmail.com>
In-Reply-To: 
 <CAJdd5GYRTgTiwX=pFpe71t1hS3zZiNfSvtbG3tgKuWjSkSuZYg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=7081f8bb-0548-4c40-a556-18b846b3e7cc;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2026-04-17T14:05:41Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|AS1PR10MB5390:EE_
x-ms-office365-filtering-correlation-id: b90c13d6-2b59-4c24-9241-08de9c8a9920
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|22082099003|56012099003|55112099003|38070700021;
x-microsoft-antispam-message-info: 
 yDoKbgV4ItIZSwdqFUIic55PjB5T52s9b7Bio07nut37g2xUdmGqwqFdqo4sTBz9O3CX89O3xdAr7bp3oDa/emgMMbyGMKVdf+SJgjtfcua1heicfU/KO7dgcwRjBQc5LOdAPwbBwXDKjRAkWy5/5mTjnVk1JeWfOXDrfntNH4wMf0ihTr8dklxzCzf4pJvvPvt6iFpLjn60GOBKKE2jKg9ZgD6nItyxME1+4bzyJzj/FEPYj85eZTdKJHakIlWENDkxK0gl6E1Pc9hiuR+fM71zKKFSrOkDEDl9Mk0aRcXw6707k3iDAuNn9ZOg8O2jiouUyUZ4LnZN5keM1XQWkH3zmn99QOcKIM8kJbzlFo46f+BEPM+AZWNkIvfJXpVtKI0t3RNAVtcJw1UR/+dL8MoK8vFqb5qMnWUTLdH5J7K0WvL5gIohTEKd7/Bxk+mx53YSqDjS72TqbaSai2wj/5Eq2c4a62E0muq1hfpgLI3vKPls4uQbbceIqLoDwk1TE1T9CSf3ooP2HWlfD6L7F1tHZ/ObTRp+G3y1w8Y0OmGPkXulZBgO3XsdKEoSdPTJw7dQOhmmvLQ8x3zOiwNeUfRY8x5wkp494XJBg7pEyGGNHL1IfNVv167GVcMXc83KN/N+m+qB7kBAfLtUt1Jq+Rr8DaY/w8M0OBtJAVEE5bMZWmAHhLRQRlGEqbNL0z6mSB8HynGfucHAHj4aIqXSxJWWNfa+gmfKwr8ri2pHawf6sTFOrISrNKyUvH8qxxkmb4lQ4m/qdqezGFPU8udlVu0KLcBSIqt7MYk9OpzWDyU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099003)(55112099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?elNHMmwzTzM4T0JGT1k3YkNibktNTkROb01FbER0c2wwNmlYUk4rNHpRa3cw?=
 =?utf-8?B?eHF2Mzd3MFF6aktlVDVCMGRBOEljYUhYRHNkVFB5OVdWcEhTQm1veXc3Rmpx?=
 =?utf-8?B?QkdxWlQzb1Q3REhJU3ZrTjlJT1NNS0w2UUp2ZzVrN1MwNzdIQzJPZ2c3SS9t?=
 =?utf-8?B?QnhYUnVORDZxMFlpcnNwRFdEWTJ6aGNpWEgzdzVWaE1IM3EzQ3MxYUtldmMr?=
 =?utf-8?B?RHlKdXFWVWhsdGF3eFE0ZDFOUkhtTC9mV0FNeC9nVjlXTDhoVGFpNk1aMU1Z?=
 =?utf-8?B?c2ZiVTFiZm4yQWd4K0FMMEI4VXEvaXZmZ0V4ZWZHcjBHeXFpbWEzV3Njbkx3?=
 =?utf-8?B?Q1VHSVRYMGFmZCt6WXJnWjhZallvYkRoeFNnUy9ZbitaZzI0MG1wVUhOQkp3?=
 =?utf-8?B?Q0s2VkpwQTM3cEl6ZHJWd1VmQ2I2ZWdRbml3c2tSaFlaVHFLQmNRSktldFd4?=
 =?utf-8?B?bWFVRDhlbTVjQmRhMC9FQ0k1ZVVtbHBmNUlWQnFSYTNaeTM5MW1BcXhlQ1Fi?=
 =?utf-8?B?T1pmTmpzaWJveEFKM2RZbTlKb3U2bjMwWGlLQmJWK2loN2cwb0pRVUdGSjQy?=
 =?utf-8?B?ZWlEUUQ2TzRKMmxtcEw2WTNSWmc0SlZCVkVHK0orV0czblpPZllkR1JIc3U3?=
 =?utf-8?B?anpUVFcvUTBJdWtjczBwYkxZeUl6aFJRVUR1T3NPRzlwNHJrd0w2WDBuZnRB?=
 =?utf-8?B?WTl6bXM5SnQyY2gxTjhOdWRkekZ4WDhJbUMzNXJoS0lZMjVZTCtmMkdSd3U4?=
 =?utf-8?B?MHdHMUJneTEwOW5ySkxxZmNkZVo0NTZhZUE3b2Z2WWVwVzdFSkg1OXgyb0Yy?=
 =?utf-8?B?SEZSbkZxYS9FWEZHZ1kvVkhpajFxZCtnbnh2NXhreVhkS2tRQWJLaEtmNVZV?=
 =?utf-8?B?cnB2RTVEYm1CZmdpNWpTc3dON0dQMHhxVnFzUWtPMXlMZ01CTnJOaWZHdWgw?=
 =?utf-8?B?Y1JFZVdmQ25CcE1XWlJqZTRyOGpYb09VYnpZZW4yWFh0UExEZlZyN2NGc0Zt?=
 =?utf-8?B?Nm5WUE1KK1pPWkxXZlk0bFVoRTJFRURITUtjcUFYMHV1UHg1Y05FVTBlRkV5?=
 =?utf-8?B?Y09YTGp3NCt4QjFCWHpFMGlJK1hDQlNSRjNhZVlLZ3ZqclNKYjBkQTZxMG9n?=
 =?utf-8?B?T0lrRGJnMDJIUUlqVUFtN0F0dnQvSFBxb3VZMkVZZVlpS2N5TzRqK1RPRitC?=
 =?utf-8?B?YzVOQ25PWmlCUm9tQmtBS0pVZUZjQktmd2RxSjQ1dDNGUlB5dHlDZTM5SGdC?=
 =?utf-8?B?OGx0QWp0dEQyRFlPeGkxbDhKVm5ibnFUOEpiRnFnYzFhZ1lrTnI5enN0LzU4?=
 =?utf-8?B?UlVUSWp1eCtIT1JVZjFGMDNZajczdUpUT01DV05iN1dCSHR5QlkxUUdrUW5s?=
 =?utf-8?B?YjEyaEgzaUMrQ0tHOEVJMFIyVVJnTUhiWHZuVU1Wck9WaHMvM2pWMWYzWkVF?=
 =?utf-8?B?c210cXVuS0VIblpaa2xqMGpBTHY2NW9BWXZCYUROZWxuYzFUTU5ZaWZnK0kr?=
 =?utf-8?B?ZEQ4eVgxT0I5aWVYbXNhR25aTkNMSnZvRE5UZkhsa0Y4OVdKTHFRRE5BWVJt?=
 =?utf-8?B?NDdyOFVRT0NSRVo5YW1BZ1lQTU1rbUJNSWtGa2cyN0JwVlZjMkJNckV5Qkhp?=
 =?utf-8?B?Q0F4cVZRZTg0WDQvNUxLTmtZcnpTMTZkMHpLTDN2WmtrYlV0RFZHRDQ4aEUx?=
 =?utf-8?B?OU1aK2dVTG9ObkJiMFN1cDhuc2lsbmZaQm1MRDJ5MEpoN2N4M2RVTjBWN3Yx?=
 =?utf-8?B?djdiQzFMNHZxR0YzbkhZUGRJR0tMTExvNGJkK2FuUFZTbGJFR1MvZHprT2sx?=
 =?utf-8?B?WUVBSkdOQjhFM092Y0dwVFpUKzBjWitiS2YyaDVJclc5d0NqYVltOFE0NWMv?=
 =?utf-8?B?YnZyT2hQa2NwSHZFczI0MHhva1lUYWREM0FUclNLYldWNmt4bHJYL0FqVGEr?=
 =?utf-8?B?MCtGWGtQbGphS1lHeFFDaENuWlczOXl4S0lwNGY1Y3E1a2NIVDNzekxjOFFo?=
 =?utf-8?B?VTR0YW9ubWNSdzUzWjZiekplRFIyZDdmbVYzRUFtQ0JibUpkangvWE1XNDhi?=
 =?utf-8?B?UEQ5TFBRS1Vkb0ZOTVBsWkJ2YThGMXhHMEpiY2htdnVJTVR1OGZRTDNaNTV3?=
 =?utf-8?B?QW40NlFXOTF6eHcxMDZYeGdLOGZOZWpkRGlZcS9ILzJtejdTNlRSeHVPT0tO?=
 =?utf-8?B?eEFLU0l6TWQ4ZmUrOFNGU2d3QjBXQ1hXMGhRNWMyaFpyUlNYOWV3Q292SG9y?=
 =?utf-8?B?WTZ0NFhzMzlMZ1RGektjbnpZcmp6K1VZcjNZRENmbkJ6UFEzamhmZ0d6b2R4?=
 =?utf-8?B?SVptc1d0alRqbUc4UFJzaHdnUVhObEk1OW9rWDZpUFQwWlJmVEVJZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b90c13d6-2b59-4c24-9241-08de9c8a9920
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Apr 2026 14:07:02.1039
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kvxIYIYFut2F26WB4K/GWShIAD2HAw0zdZxNAjYYXT9Q9bSEvFAQVUv4JbLvAVlKoH/6mUt+4PgbP0oixNBbrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5390
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 14:07:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235504

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSm9zaHVhIFdhdHQgPGpw
ZXdoYWNrZXJAZ21haWwuY29tPg0KPiBTZW50OiBGcmlkYXksIEFwcmlsIDE3LCAyMDI2IDQ6MDEg
UE0NCj4gVG86IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24u
b3JnPg0KPiBDYzogTWFya28sIFBldGVyIChGVCBEIEVVIFNLIEJGUzEpIDxQZXRlci5NYXJrb0Bz
aWVtZW5zLmNvbT47DQo+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcN
Cj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0hdIGNyZWF0ZS1zcGR4LTMuMDogcmVydW4g
ZG9fY3JlYXRlX3JlY2lwZV9zcGR4IG9uDQo+IHBhdGNoIGNoYW5nZXMNCj4gDQo+IE9uIEZyaSwg
QXByIDE3LCAyMDI2IGF0IDY6MDPigK9BTSBSaWNoYXJkIFB1cmRpZQ0KPiA8cmljaGFyZC5wdXJk
aWVAbGludXhmb3VuZGF0aW9uLm9yZz4gd3JvdGU6DQo+ID4NCj4gPiBPbiBGcmksIDIwMjYtMDQt
MTcgYXQgMTA6MzAgKzAyMDAsIFBldGVyIE1hcmtvIHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQo+IHdyb3RlOg0KPiA+ID4gRnJvbTogUGV0ZXIgTWFya28gPHBldGVyLm1hcmtvQHNpZW1lbnMu
Y29tPg0KPiA+ID4NCj4gPiA+IFZhbGt5cmllIHBhdGNobWV0cmljcyBmcm9tIDIwMjYtMDQtMTcg
aXMgc2hvd2luZyB0d28gQ1ZFcyB3aGVyZSBwYXRjaGVzDQo+ID4gPiB3ZXJlIG1lcmdlZCB0aGUg
ZGF5IGJlZm9yZSAoMjAyNi0wNC0xNikgLSBpbmV0dXRpbHMvQ1ZFLTIwMjYtMzI3NDYgYW5kDQo+
ID4gPiByZTJjL0NWRS0yMDI2LTI5MDMuDQo+ID4gPiBSb290LWNhdXNlIGlzIHRoYXQgdGhlIENW
RSBwYXRjaGVzIGFyZSBldmFsdWF0ZWQgaW4gdGFzaw0KPiA+ID4gZG9fY3JlYXRlX3JlY2lwZV9z
cGR4IHdoaWNoIGRvZXMgbm90IGhhdmUgYW55IGRlcGVuZGVuY3kgb24gU1JDX1VSSQ0KPiBub3IN
Cj4gPiA+IGNvbnRlbnQgb2YgdGhlIHBhdGNoZXMsIHNvIGl0IGlzIHRha2VuIGZyb20gc3N0YXRl
LWNhY2hlIHdoaWNoIGNvbnRhaW5zDQo+ID4gPiBvbGQgKHN0YWxlKSBkYXRhLg0KPiA+ID4NCj4g
PiA+IE5vdGUgdGhhdCB0aGlzIHdpbGwgbWVhbiB0aGF0IHJ1bm5pbmcgc2JvbS1jdmUtY2hlY2sg
d2lsbCBydW4gZG9fZmV0Y2gNCj4gPiA+IHRhc2sgZm9yIGFsbCBldmFsdWF0ZWQgcmVjaXBlcywg
aG93ZXZlciB0aGF0IGlzIG5lY2Vzc2FyeSB0byBjYXRjaCBhbHNvDQo+ID4gPiBjaGFuZ2VzIHdp
dGhpbiBwYXRjaCBjb250ZW50IChlLmcuIGFkZGluZyBhZGRpdGlvbmFsIENWRTogdGFncykgaW4N
Cj4gPiA+IGFkZGl0aW9uIHRvIHJlLXJ1bm5pbmcgd2hlbiBhZGRpbmcgbmV3IHBhdGNoZXMgaWYg
d2Ugd291bGQgb25seSBhZGQNCj4gPiA+IGRlcGVuZGVuY3kgb24gU1JDX1VSSSB2YXJpYWJsZS4N
Cj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBNYXJrbyA8cGV0ZXIubWFya29Ac2ll
bWVucy5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICBtZXRhL2NsYXNzZXMvY3JlYXRlLXNwZHgtMy4w
LmJiY2xhc3MgfCAyICstDQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy9jcmVh
dGUtc3BkeC0zLjAuYmJjbGFzcyBiL21ldGEvY2xhc3Nlcy9jcmVhdGUtc3BkeC0NCj4gMy4wLmJi
Y2xhc3MNCj4gPiA+IGluZGV4IDQzMmFkYjE0Y2QuLmRiMWNjYzBjODEgMTAwNjQ0DQo+ID4gPiAt
LS0gYS9tZXRhL2NsYXNzZXMvY3JlYXRlLXNwZHgtMy4wLmJiY2xhc3MNCj4gPiA+ICsrKyBiL21l
dGEvY2xhc3Nlcy9jcmVhdGUtc3BkeC0zLjAuYmJjbGFzcw0KPiA+ID4gQEAgLTE5Miw3ICsxOTIs
NyBAQCBweXRob24gZG9fY3JlYXRlX3JlY2lwZV9zcGR4KCkgew0KPiA+ID4gICAgICBpbXBvcnQg
b2Uuc3BkeDMwX3Rhc2tzDQo+ID4gPiAgICAgIG9lLnNwZHgzMF90YXNrcy5jcmVhdGVfcmVjaXBl
X3NwZHgoZCkNCj4gPiA+ICB9DQo+ID4gPiAtYWRkdGFzayBkb19jcmVhdGVfcmVjaXBlX3NwZHgN
Cj4gPiA+ICthZGR0YXNrIGRvX2NyZWF0ZV9yZWNpcGVfc3BkeCBhZnRlciBkb19mZXRjaA0KPiA+
ID4NCj4gPiA+ICBTU1RBVEVUQVNLUyArPSAiZG9fY3JlYXRlX3JlY2lwZV9zcGR4Ig0KPiA+ID4g
IGRvX2NyZWF0ZV9yZWNpcGVfc3BkeFtzc3RhdGUtaW5wdXRkaXJzXSA9ICIke1NQRFhSRUNJUEVE
RVBMT1l9Ig0KPiA+DQo+ID4gV2hhdCBkYXRhIGRvZXMgZG9fY3JlYXRlX3JlY2lwZV9zcGR4IGFj
dHVhbGx5IG5lZWQ/DQo+ID4NCj4gPiBEb2VzIGl0IGp1c3QgbmVlZCBTUkNfVVJJLCBvciBkb2Vz
IGl0IG5lZWQgdG8gcmUtcnVuIGlmIGFueSBvZiB0aGUNCj4gPiBjb250ZW50cyBvZiBpdGVtcyBp
biBTUkNfVVJJIGNoYW5nZXM/IE9yIGRvZXMgaXQgYWN0dWFsbHkgbmVlZCB0aGUNCj4gPiBwYXRj
aCBjb250ZW50cz8NCj4gPg0KPiA+IElmIGl0IG5lZWRzIHRvIGRlcGVuZCBvbiBtb3JlIHRoYW4g
dGhlIGNvbnRlbnRzIG9mIFNSQ19VUkksIGl0IHNob3VsZA0KPiA+IGhhdmUgYSBkZXBlbmRlbmN5
IGJ1dCBJIHRoaW5rIEpvc2h1YSB3YXMgdHJ5aW5nIHRvIGF2b2lkIHRoYXQuIFRoZQ0KPiA+IGRl
cGVuZGVuY3kgd291bGQgYmUgb24gdW5wYWNrIG9yIHBhdGNoLCBub3QgZmV0Y2ggYXMgaXQgc2hv
dWxkbid0IGJlDQo+ID4gcG9raW5nIGludG8gRExfRElSLg0KPiANCj4gQ29ycmVjdCwgd2UgZG8g
bm90IHdhbnQgYSBkZXBlbmRlbmN5IG9uIGRvX2ZldGNoIGFzIHRoYXQgd291bGQgbWFrZQ0KPiB0
aGUgImZhc3QiIENWRSBjaGVjayB2ZXJ5IHNsb3cuIEknbSBjdXJpb3VzIGlmIHRoaXMgaXMgYSBw
cm9ibGVtIHdpdGgNCj4gdGhlIG9sZCBjdmVfY2hlY2suYmJjbGFzcyBhbHNvLCBvciBpZiBub3Qg
aG93IGl0IHNvbHZlZCB0aGUgcHJvYmxlbQ0KDQpUaGUgb2xkIGN2ZS1jaGVjayBkaWQgdGhhdCBp
biBzaW5nbGUgbm9zdGFtcCB0YXNrLCBzbyB0aGVyZSB3YXMgbm8gZGVwZW5kZW5jeSBvbiBzc3Rh
dGUtY2FjaGVkIG9iamVjdHMuDQpQZXRlcg0KDQo+IA0KPiA+DQo+ID4gRldJVywgdGhlIHdheSBk
b19mZXRjaCBydW5zIG9ubHkgaWYgaXQgbmVlZHMgdG8gaXM6DQo+ID4NCj4gPiBkb19mZXRjaFtm
aWxlLWNoZWNrc3Vtc10gPSAiJHtAYmIuZmV0Y2guZ2V0X2NoZWNrc3VtX2ZpbGVfbGlzdChkKX0i
DQo+ID4gZG9fZmV0Y2hbZmlsZS1jaGVja3N1bXNdICs9ICIgJHtAZ2V0X2xpY19jaGVja3N1bV9m
aWxlX2xpc3QoZCl9Ig0KPiA+DQo+ID4gQ2hlZXJzLA0KPiA+DQo+ID4gUmljaGFyZA0KPiA+DQo+
ID4NCg==

