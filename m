Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE36D3F283
	for <webhook@archiver.kernel.org>; Fri, 18 Oct 2024 19:57:04 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.46])
 by mx.groups.io with SMTP id smtpd.web11.30966.1729281413883070793
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Oct 2024 12:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=ArhB2Iug;
 spf=pass (domain: axis.com, ip: 40.107.20.46, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T1cEPArfzBTxd/67jxbMkNbZSWed+Qkaq73jzHOXcQSGSDIptNLXfULiO336MzNQrM3fEOFWDCM1Lmy2kMX8hSpQGkh/jUn9Xquj8oH5jZtn5qJ5UmR0vlWPg0NYgFBgeZlLei24aCd89c2ZNkI4HLqF+gjfMFizfZQ7vJAal/0y7DmQ42cYxJ31ctlYwGAXJcTQgx1hIQ1kooFYjlfXY6sokC/Eey5RflDaBESlnO8Lk+/APRrsYjvbtJGHXo7Vq6NG2S4DEv5AJw45htKZbvGPILOd/klUcAu6rN1i5UZ1RKjy399SJTCuT+kTqP0S7laDCWWNIzu7EWLfE1LeUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2Q29UGmn9Wg6yShz2Q6AWjdMazbVvPBClanNWrVBXc=;
 b=QjjyEHb3HBvkCrFRqjZfqR4udxi4YX/2/c78Hzaz3SiibveCbOW9JawB9EDMOYRngLeE42o5TDDRzHaJZKD6tK3aniYL3S80/QtjU7qnlrnCbfGdvtja24FXlu7MKJM295O553IC827rwjoGPOrofjyY2ZeV5otBah9As+MAqtIWVqBbzU+IBqIdx5ElRjK2+d4hIkIPQCckj1+MTtFIbs7x2ztlNjKqcEcUkreD7awwwAy/rDuksstW570ddxFYtcEVwxTQHxoAgCulljIqg0bavJSbyZwi0lUfGHan2sNX4zzcFU7YeVfXc8ieyiOEPx8lzXaZp46JaTnqQfLZSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2Q29UGmn9Wg6yShz2Q6AWjdMazbVvPBClanNWrVBXc=;
 b=ArhB2Iug51mTioZMO31Xut4aptf16F9sIxuAHXpmnWRah0gJJ+PYnJM5nIA4I973+C6ZrCtTkKHWF9JiwRjwPF5R0GenAomInlxZwlwhnsGKym4mSB6719B77rSCkiJsQjvEvKbKhqBW5bub9wH+hE5I/WIZYciWzZmL965CZPs=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DU0PR02MB9659.eurprd02.prod.outlook.com (2603:10a6:10:422::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.25; Fri, 18 Oct
 2024 19:56:50 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8069.016; Fri, 18 Oct 2024
 19:56:50 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Steve Sakoman <steve@sakoman.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][scarthgap 17/18] image_qa: fix error handling
Thread-Topic: [OE-core][scarthgap 17/18] image_qa: fix error handling
Thread-Index: AQHbHzORBRQ2PndZlUWL3uOIAdA0ILKIaHEAgAD3QgCAA47vQA==
Date: Fri, 18 Oct 2024 19:56:50 +0000
Message-ID: 
 <DB5PR02MB10213F358C4369372C5047B1EEF402@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <cover.1729018153.git.steve@sakoman.com>
 <8fe7aef17eefa70e3f7c07077b8c695e5c00ed5e.1729018153.git.steve@sakoman.com>
 <a8af25be04be39c3f91344858ed95a6ebc936f48.camel@linuxfoundation.org>
 <CAOSpxdYwqNEs5dDd3jDrGmeUfT07J09X+WoFtpkaioX99x72QQ@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdYwqNEs5dDd3jDrGmeUfT07J09X+WoFtpkaioX99x72QQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU0PR02MB9659:EE_
x-ms-office365-filtering-correlation-id: a0e9d5f9-abde-4789-b914-08dcefaf019a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?L2NkYTBCd1pseThPQmJDQkI3OFdPNXlvcmxxamoyUFRuZ0twVHI1RGlLQytG?=
 =?utf-8?B?ZndUMkxaTVZQSlZCWFZnZStUbEdBNHdXME0zRmpodGpwY1krVjBCa1Vhd0ZD?=
 =?utf-8?B?dmFZL2RSR0l1VHRrZnh3YU9jV0s4WTJJSjNWSnFpNCtldXJLdTJCa0E4bFBt?=
 =?utf-8?B?QkVlQThPVWoyaVVKTmJrZ09XS3pwK1Rjem1RQytDZGJnWFlkN1Q2MDEzcjRM?=
 =?utf-8?B?dU9HMkhNZ1dSSktoZzJaVEJpMXlMT0JZS2hWZHprbjhtbzRWS3hUQWJiaUZJ?=
 =?utf-8?B?Q1RBS3NvZTZUZ2cweHF3dGRZUVMvSmRldmRmcGFleFY4eTNGR0Y5UkxSUUE3?=
 =?utf-8?B?VTYxcWxUSXRQTHZBQjdPZ21WcW5sb3c1dklJK3V6Q0hKM3ROVTFSSjk3VlR5?=
 =?utf-8?B?ME9jZHl6VzZsVkoxR1NManB1ZTJiT015Z3lGVVEvclRxNWNVaGZaVWdtOExN?=
 =?utf-8?B?L0VzeEEwbHNaTXBOVVg5bk1BMFJsdVpNbkhjYzlvdGsvVHBXWG1adkZ3d05H?=
 =?utf-8?B?R2lDN1IzMnJrQ2VNZkNnWm9SZmpkMEtUNWVibDZxelhjanpYbDBRaGRqOE84?=
 =?utf-8?B?Sm44dHdJUFVXM1lEYUV0dTlvT3VwNTJ2QWtLQlZaVWJFdWl0Um5QdHh5SmVQ?=
 =?utf-8?B?aEhwWVFOTUpoYnFOUlpBemVsV01Ld3ZOUkxvWmUyR2YrVWlTNEw0UUowR0M0?=
 =?utf-8?B?WFNIVEUzMHgrVHFvMEFGVms3QU5oYnZaRTRKYmNBQjRPTTB3ZmFhd0tmTlMy?=
 =?utf-8?B?cWhPUVA4eDYyYlp2Q2tyYisvbkhZUTZIM3lkRW80SXFpRXUvTFA2WE9pNzFx?=
 =?utf-8?B?dUNzWDJPNi9QZWJGMVp0QU5KUXpJUkh4b3Q5TUE5TGdUOHRpc0dDcTJWaGhH?=
 =?utf-8?B?TDNqS1hFVXVPMVdUTVNERXcyR3UyL0ZzM0k5SXEvRVcwaHpHeTFWRXRkUVlM?=
 =?utf-8?B?ZlBKUDJGUCtNajVqQXdaYTcwZGRJb3lXdkloSE5CZ28vZUtvdTJaSlBST3Y3?=
 =?utf-8?B?ZHd1NmxNeFVHN0JYY1VpbEZEV3lPQVppbVpvN3FNNlY1MUZDcnJKb2hOcW5Y?=
 =?utf-8?B?NTRPYTRQVDRCYUZoU0t2YmUvS20zNk1oLzVHV1hlNlhxV0ZGMEM1bmRzaUVZ?=
 =?utf-8?B?VmZFWWVYSDAzTXY0UFZoMUxtMGJXVEhLRlFHVFBQNVJUMk51aWxCcG40WnFr?=
 =?utf-8?B?K2IrTk96V2FMTkxTaWhOU294RWY3OThmS3BWNEN1VjhwZ2pua1hlamhyL0ZS?=
 =?utf-8?B?c2ZKY2x4Z2RQRnVGMGg1QkFJMWdaUFBhVTJsZ3JCNCtSWFlTRzlSOVIyaXRF?=
 =?utf-8?B?djNCZVM4cEg5bGJoSnBIeWdYN2k4YWRLS05FNHkxTy9FWXhWdmZZa09jSXNs?=
 =?utf-8?B?SXIxL0RpZllMWVB1TzBvVTQ4ZjNLMUFVamwvd1o3Z0hrWURoVTU4Q0lnOUp1?=
 =?utf-8?B?aTRkczJUblFReFg0b3JleC9QTGtKYmlrM004UUllb1VwWEFCN0FCNmlINTcx?=
 =?utf-8?B?YWY4WDRRUmkrcHQ5UC9jZGV6ZjB4eWF2NVdDWTQzWjZBak1EQTdQWC9Dclds?=
 =?utf-8?B?WS9iRmZ2TmVhUUNMZEtIRVVURmxoaWZlaGlmZzhUdTRza0lINVhlK2NnSjlG?=
 =?utf-8?B?V0lVbDN2TmR1Z3VmbElEY2o3TjhJSUIweVdIQS9OQ2J2eTNES3VabW1FU2hG?=
 =?utf-8?B?TzVPdHFzTzVSRTlsWTRPMDJpUkJzMHl3WXVwS3lSNlUyRVZQUDRmc3MyS2RX?=
 =?utf-8?Q?K67Q9QqXV4ZGludfBo+/bIVrxEnux0XhFovg+6m?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?N2NWajFtWE5wRm1ZNlBsMk91RWdOWkxnVnZ4dUFkUXhpR0I4aGVIM0NIcFVu?=
 =?utf-8?B?MVVrQklxeDF1ajErcFJBOXhmTmc1azhwckRmZlBTdC9mWlRReHJicHp3L0gy?=
 =?utf-8?B?Zy95RjV4cGNSMW5URElxelVFUC95Q2tRTWZ0L25JYXlkV3krTDF3RWhMS01H?=
 =?utf-8?B?enFDNlJ5M3dSbHdFVEdIcGowMFJTU1VRdDhMcks0dVkrNEl4SElFYUFrTDRZ?=
 =?utf-8?B?aFppWGxqZVpHeU9tNlpQSno2YXVwUG9tdk9XMnNlam0xNXNLTDlWZXFkaS9r?=
 =?utf-8?B?WEY4QlBKdFJ5QjhwQjBrdVd6R0RWM1VZdVlOeU1hbzY3dlBGWlpoTWZubnZN?=
 =?utf-8?B?TWE4RXo3Zy8rMkJ2NGtGblFpc0creE5wREFncCtkdEQrcmNkTkczdnAzMVBU?=
 =?utf-8?B?K294TngwSkRSNjloSWgyT2tSRkZDZGhBVHA2VUMxNXNSRU5SODJpSWE1SHFX?=
 =?utf-8?B?eUZDRi9PL2ZNcmRndkM5R2VBbXE2eHN2NklJOXFBM1QzdnpxVmNCY1hqMFZr?=
 =?utf-8?B?VzJ2TGRmSExEZGExWUR1Zlo5K1VueTV4a2dmRUM3K2JKb3Q5ZTRvdUZkM2pM?=
 =?utf-8?B?Tjd1SHRzYUlnaVRtdm00U1U5bXM4K3UrbmovQU41c296SGZwSG5aZ0RrR0tH?=
 =?utf-8?B?RS9vZXN5WVY3dy9nVVZ3ZGUwcy9GM2lpYmNOUGRUeFJITmhzNnNXcDEzVVRZ?=
 =?utf-8?B?a21xUlY2eXFNNGU3cjkwVGZwRjBPVVc4UERVc3J1TEJtVkZnVTNiWlVxRTJK?=
 =?utf-8?B?M2FoMks2di94MmZ1M1Z2eUhxN25iSkU2dGxaRVFOcTZwTlE1YXR0Yy9wOGQ3?=
 =?utf-8?B?Q2prdm80UmF1bTJBL0tnT0hSbzd2Y2w0YUw0VjluQnZNWFdZZXNZSTVjOVQ3?=
 =?utf-8?B?dm91Sm81SFBIMGNzY1NaQ2tTdEZPUzRoajJmWXhUSENJQm9ML1hScE1JRjRQ?=
 =?utf-8?B?YzAxaVdTTUtOYXd0Wm4rUjMxVFNRZXpQckFxQzIwdzRYZVB2ZytGUEFvYWFN?=
 =?utf-8?B?VjFiZGV0K2FoNGVxZ29VM0wwTVlQd2JrWEZiZTJBS0RKOXNlSHBsRVFBSlRs?=
 =?utf-8?B?SmdtUWpPK093K3M4RzUzQVR1djdRbmc2RlcwS2FvazJFSWVHMUhWY2Z0M1V1?=
 =?utf-8?B?YmJ5bVV5c0pTOHZFSE4vNlA1ZjhPY2U3OWU1ZTYvVW5GalNWSVA1aHc5YnFn?=
 =?utf-8?B?VHRWVE8wSnRFNk1Gb1BYUXZpNERXd1VmOXViSDRVbHlOUmZSOXhleXNkL0Ro?=
 =?utf-8?B?L3N6cmt1cExrRjFqeTNrVFlkV09pVEM3Z1poM0NjM3VUQzhWM28rYlg3d2ZB?=
 =?utf-8?B?bThPZWora0gxcXlOVHUrYXBXelhiSjFxNDNtT3E2YkViR2YyK2pQTlhwa3BT?=
 =?utf-8?B?c2J1WlNBLzJldk1rY3dGMkhTaTRGbWJ0VVAyMjlIdDRSbWJkbVdxUTQ1cWdB?=
 =?utf-8?B?bjNIODV0K2V2YXNUaUx1ZW1tcWJaSnZQSldwQ1BxaFJWdENPR2d0K3ZsSDAz?=
 =?utf-8?B?NStzeEhzNGpLZWdOSVhqMndOTWtFMHlEZXBZS1ptM1pXNEl6OUc1L3I0V1BQ?=
 =?utf-8?B?LytiWDJvWXJBek1vQndTVVgwejF2c0Nva1VRK3l5ek03MlJ6STdybFpCUkMy?=
 =?utf-8?B?RTcyZDhKU21LU3J3SVJHMDFRZysyYW1DTmNCbTFwUEJ0cFVGOUt0Yk5vV2J1?=
 =?utf-8?B?eTJCODNFNk9YWlV6TmFpbnZZWGYxNGdRMWZiVXVuNzJPcWFFbHdVOW9Fd29n?=
 =?utf-8?B?YTZSMXEzMXlKWFpCMGpTelBZYzlYQjdOSWdKYTh4UzJ0YWQxMG1mdXpwWjZY?=
 =?utf-8?B?eFdaektFZXRZV25TUnlBMkVrVThlUGNvZTB5VXk5UHFMY09kOFZlUENUSURF?=
 =?utf-8?B?MVMvZHJ2U2ZKS1F2UWZqRXN4ZGFpRTVZM2QzZjMxS1ZwQ2xrcG5rZ0xuYlhx?=
 =?utf-8?B?dW1hcWw2VVlwWUpDdCs4d2pQa29hbUE3endwZGQxOTRFM2dPcFlreEdhVHFh?=
 =?utf-8?B?ZldZWE1Mak11d1JFd3RFMjJLbDQ3ZTQ4MnpaejE2eFdCWWNWRDk1RWJta0w3?=
 =?utf-8?B?YjZsWTJXY3dTR2dVV1NNL3V2WjlvdjVnbkl1RHExRXljbWlzaEVvOGNja1h3?=
 =?utf-8?Q?oOm8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0e9d5f9-abde-4789-b914-08dcefaf019a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Oct 2024 19:56:50.4653
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D6nlJLGRn8AruvHHevf/XSeKiY6zBZIwoDHX+4UH66/qJcp2tDD25wlq0BCcwL4Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB9659
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Oct 2024 19:57:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206068

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgU3RldmUgU2Frb21hbg0KPiBTZW50OiBkZW4gMTYgb2t0b2Jl
ciAyMDI0IDE1OjI3DQo+IFRvOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhm
b3VuZGF0aW9uLm9yZz4NCj4gQ2M6IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXVtzY2FydGhnYXAgMTcvMThdIGltYWdlX3Fh
OiBmaXggZXJyb3IgaGFuZGxpbmcNCj4gDQo+IE9uIFR1ZSwgT2N0IDE1LCAyMDI0IGF0IDM6NDHi
gK9QTSBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4g
d3JvdGU6DQo+ID4NCj4gPiBPbiBUdWUsIDIwMjQtMTAtMTUgYXQgMTE6NTAgLTA3MDAsIFN0ZXZl
IFNha29tYW4gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+ID4gPiBGcm9tOiBM
b3VpcyBSYW5ub3UgPGxvdWlzLnJhbm5vdUBub24uc2UuY29tPg0KPiA+ID4NCj4gPiA+IE1ha2Ug
SW1hZ2VRQUZhaWxlZCBpbmhlcml0IEJCSGFuZGxlZEV4Y2VwdGlvbiBzbyBleGNlcHRpb25zIHJh
aXNlZCBpbiB0ZXN0cyBhcmUNCj4gPiA+IGNhdGNoZWQgd2hlbiB0aGUgYWN0dWFsIHRlc3QgZnVu
Y3Rpb24gaXMgZXhlY3V0ZWQgYnkgYmIudXRpbHMuYmV0dGVyX2V4ZWMuDQo+ID4gPg0KPiA+ID4g
Q2hhbmdlIHRoZSBkb19pbWFnZV9xYSB0YXNrcyBzbyBlcnJvcnMgYXJlIGhhbmRsZWQgd2l0aCBv
ZS5xYS5oYW5kbGVfZXJyb3IuIEFkZA0KPiA+ID4gc29tZSBjb21tZW50IHRvIGV4cGxhaW4gdGhp
cyByZXF1aXJlcyB0byBsaXN0IHRoZSB0ZXN0IGluIEVSUk9SX1FBIG9yIFdBUk5fUUEuDQo+ID4g
Pg0KPiA+ID4gW1lPQ1RPICMxNDgwN10NCj4gPiA+IGh0dHBzOi8vYnVnemlsbGEueW9jdG9wcm9q
ZWN0Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTQ4MDcNCj4gPiA+DQo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBMb3VpcyBSYW5ub3UgPGxvdWlzLnJhbm5vdUBub24uc2UuY29tPg0KPiA+ID4gU2lnbmVkLW9m
Zi1ieTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+
DQo+ID4gPiAoY2hlcnJ5IHBpY2tlZCBmcm9tIGNvbW1pdCA5MDVlMjI0ODQ5ZmJiZWQxNzE5ZTBh
ZGQyMzFiMDBlMmQ1NzBiM2I0KQ0KPiA+ID4gU2lnbmVkLW9mZi1ieTogU3RldmUgU2Frb21hbiA8
c3RldmVAc2Frb21hbi5jb20+DQo+ID4gPiAtLS0NCj4gPiA+ICBtZXRhL2NsYXNzZXMtcmVjaXBl
L2ltYWdlLmJiY2xhc3MgfCAxMSArKysrKystLS0tLQ0KPiA+ID4gIG1ldGEvbGliL29lL3V0aWxz
LnB5ICAgICAgICAgICAgICB8ICAyICstDQo+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCA3IGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+ID4gPg0KPiA+ID4gZGlmZiAtLWdpdCBhL21ldGEv
Y2xhc3Nlcy1yZWNpcGUvaW1hZ2UuYmJjbGFzcyBiL21ldGEvY2xhc3Nlcy1yZWNpcGUvaW1hZ2Uu
YmJjbGFzcw0KPiA+ID4gaW5kZXggMjhiZTZjNjM2Mi4uYTY4MmI1ZjNiMiAxMDA2NDQNCj4gPiA+
IC0tLSBhL21ldGEvY2xhc3Nlcy1yZWNpcGUvaW1hZ2UuYmJjbGFzcw0KPiA+ID4gKysrIGIvbWV0
YS9jbGFzc2VzLXJlY2lwZS9pbWFnZS5iYmNsYXNzDQo+ID4gPiBAQCAtMzA4LDIzICszMDgsMjQg
QEAgYWRkdGFzayBkb19pbWFnZV9jb21wbGV0ZV9zZXRzY2VuZQ0KPiA+ID4gICMNCj4gPiA+ICAj
IFRoZSBmdW5jdGlvbnMgc2hvdWxkIHVzZSAke0lNQUdFX1JPT1RGU30gdG8gZmluZCB0aGUgdW5w
YWNrZWQgcm9vdGZzDQo+ID4gPiAgIyBkaXJlY3RvcnksIHdoaWNoIGlmIFFBIHBhc3NlcyB3aWxs
IGJlIHRoZSBiYXNpcyBmb3IgdGhlIGltYWdlcy4NCj4gPiA+ICsjDQo+ID4gPiArIyBUaGUgZnVu
Y3Rpb25zIHNob3VsZCB1c2Ugb2UudXRpbHMuSW1hZ2VRQUZhaWxlZChkZXNjcmlwdGlvbiwgbmFt
ZSkgdG8gcmFpc2UNCj4gPiA+ICsjIGVycm9ycy4gVGhlIG5hbWUgbXVzdCBiZSBsaXN0ZWQgaW4g
RVJST1JfUUEgb3IgV0FSTl9RQSB0byBwcm9tcHQuDQo+ID4gPiAgZmFrZXJvb3QgcHl0aG9uIGRv
X2ltYWdlX3FhICgpIHsNCj4gPiA+ICAgICAgZnJvbSBvZS51dGlscyBpbXBvcnQgSW1hZ2VRQUZh
aWxlZA0KPiA+ID4NCj4gPiA+ICAgICAgcWFfY21kcyA9IChkLmdldFZhcignSU1BR0VfUUFfQ09N
TUFORFMnKSBvciAnJykuc3BsaXQoKQ0KPiA+ID4gLSAgICBxYW1zZyA9ICIiDQo+ID4gPg0KPiA+
ID4gICAgICBmb3IgY21kIGluIHFhX2NtZHM6DQo+ID4gPiAgICAgICAgICB0cnk6DQo+ID4gPiAg
ICAgICAgICAgICAgYmIuYnVpbGQuZXhlY19mdW5jKGNtZCwgZCkNCj4gPiA+ICAgICAgICAgIGV4
Y2VwdCBvZS51dGlscy5JbWFnZVFBRmFpbGVkIGFzIGU6DQo+ID4gPiAtICAgICAgICAgICAgcWFt
c2cgPSBxYW1zZyArICdcdEltYWdlIFFBIGZ1bmN0aW9uICVzIGZhaWxlZDogJXNcbicgJSAoZS5u
YW1lLCBlLmRlc2NyaXB0aW9uKQ0KPiA+ID4gKyAgICAgICAgICAgIHFhbXNnID0gJ0ltYWdlIFFB
IGZ1bmN0aW9uICVzIGZhaWxlZDogJXNcbicgJSAoZS5uYW1lLCBlLmRlc2NyaXB0aW9uKQ0KPiA+
ID4gKyAgICAgICAgICAgIG9lLnFhLmhhbmRsZV9lcnJvcihlLm5hbWUsIHFhbXNnLCBkKQ0KPiA+
ID4gICAgICAgICAgZXhjZXB0IEV4Y2VwdGlvbiBhcyBlOg0KPiA+ID4gICAgICAgICAgICAgIHFh
bXNnID0gcWFtc2cgKyAnXHRJbWFnZSBRQSBmdW5jdGlvbiAlcyBmYWlsZWQ6ICVzXG4nICUgKGNt
ZCwgZSkNCj4gPiA+DQo+ID4gPiAtICAgIGlmIHFhbXNnOg0KPiA+ID4gLSAgICAgICAgaW1nbmFt
ZSA9IGQuZ2V0VmFyKCdJTUFHRV9OQU1FJykNCj4gPiA+IC0gICAgICAgIGJiLmZhdGFsKCJRQSBl
cnJvcnMgZm91bmQgd2hpbHN0IHZhbGlkYXRpbmcgaW1hZ2U6ICVzXG4lcyIgJSAoaW1nbmFtZSwg
cWFtc2cpKQ0KPiA+ID4gKyAgICBvZS5xYS5leGl0X2lmX2Vycm9ycyhkKQ0KPiA+ID4gIH0NCj4g
PiA+ICBhZGR0YXNrIGRvX2ltYWdlX3FhIGFmdGVyIGRvX3Jvb3RmcyBiZWZvcmUgZG9faW1hZ2UN
Cj4gPiA+DQo+ID4gPiBkaWZmIC0tZ2l0IGEvbWV0YS9saWIvb2UvdXRpbHMucHkgYi9tZXRhL2xp
Yi9vZS91dGlscy5weQ0KPiA+ID4gaW5kZXggMTRhN2QwN2VmMC4uODNmMTQ0MDg4NyAxMDA2NDQN
Cj4gPiA+IC0tLSBhL21ldGEvbGliL29lL3V0aWxzLnB5DQo+ID4gPiArKysgYi9tZXRhL2xpYi9v
ZS91dGlscy5weQ0KPiA+ID4gQEAgLTQ4Miw3ICs0ODIsNyBAQCBkZWYgZ2V0X211bHRpbGliX2Rh
dGFzdG9yZSh2YXJpYW50LCBkKToNCj4gPiA+ICAgICAgICAgIGxvY2FsZGF0YS5zZXRWYXIoIk1M
UFJFRklYIiwgIiIpDQo+ID4gPiAgICAgIHJldHVybiBsb2NhbGRhdGENCj4gPiA+DQo+ID4gPiAt
Y2xhc3MgSW1hZ2VRQUZhaWxlZChFeGNlcHRpb24pOg0KPiA+ID4gK2NsYXNzIEltYWdlUUFGYWls
ZWQoYmIuQkJIYW5kbGVkRXhjZXB0aW9uKToNCj4gPiA+ICAgICAgZGVmIF9faW5pdF9fKHNlbGYs
IGRlc2NyaXB0aW9uLCBuYW1lPU5vbmUsIGxvZ2ZpbGU9Tm9uZSk6DQo+ID4gPiAgICAgICAgICBz
ZWxmLmRlc2NyaXB0aW9uID0gZGVzY3JpcHRpb24NCj4gPiA+ICAgICAgICAgIHNlbGYubmFtZSA9
IG5hbWUNCj4gPiA+DQo+ID4NCj4gPiBUaGlzIGNhdXNlZCBmdXJ0aGVyIGlzc3VlcyBpZiBJIHJl
bWVtYmVyIGNvcnJlY3RseS4NCj4gPg0KPiA+IGh0dHBzOi8vZ2l0LnlvY3RvcHJvamVjdC5vcmcv
cG9reS9jb21taXQvP2lkPWIwZWIyYjliMzY2MGRmZGExYzRjNDNjZmNjYTZhMmM0YTg0ZDZkYzgN
Cj4gPg0KPiA+IGZvciBleGFtcGxlLg0KPiANCj4gVGhhbmtzIGZvciByZXZpZXdpbmchICBJJ3Zl
IGdvdCB0aGF0IG9uZSBub3cgYW5kIHdpbGwgYWxzbyB0YWtlIGl0IGZvcg0KPiBzdHloZWFkLg0K
PiANCj4gU3RldmUNCg0KRG8gbm90ZSB0aGF0IEkgc2VudCBhbiBhbHRlcm5hdGl2ZSBwYXRjaCBm
b3IgU3R5aGVhZCB0aGF0IGRvZXMgbm90IA0KcmVtb3ZlIHRoZSBJbWFnZVFBRmFpbGVkIGV4Y2Vw
dGlvbi4gV2hpbGUgSSB3b3VsZCBiZSBoYXBweSB0byBzZWUgdGhlIA0KdmVyc2lvbiB0aGF0IHdl
bnQgaW50byBtYXN0ZXIgYmFja3BvcnRlZCwgSSBhc3N1bWVkIHRoYXQgcmVtb3ZpbmcgdGhlIA0K
SW1hZ2VRQUZhaWxlZCBleGNlcHRpb24gd291bGQgYmUgY29uc2lkZXJlZCBhcyBhIGNoYW5nZSBp
biBiZWhhdmlvciANCmFuZCB0aHVzIG5vdCBlbGlnaWJsZSBmb3IgYmFja3BvcnRpbmcuDQoNClRo
ZSBhbHRlcm5hdGl2ZSB2ZXJzaW9uIEkgY3JlYXRlZCBmb3IgU3R5aGVhZCBjYW4gYmUgZm91bmQg
aGVyZToNCg0KaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNv
cmUvbWVzc2FnZS8yMDQ5ODINCg0KLy9QZXRlcg0KDQo=

