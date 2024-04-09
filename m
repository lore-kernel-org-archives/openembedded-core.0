Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 766FACD1284
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 09:57:19 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.133])
 by mx.groups.io with SMTP id smtpd.web11.132822.1712656633427894391
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Apr 2024 02:57:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=oIpM55Ko;
 spf=pass (domain: siemens.com, ip: 40.107.8.133, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=axxS10gXPKnQcXfrFMEVfC9PktTqhVwsFvLsjekzQUZUXKk9DTNgKC5eMju6pOL6jrDlCElUPba2ge65l/Hr9lgMVX7Z8woC101Zr9B0Bdl9XF3YhgbtfQrMBMuVvjhpu2n4A/AwVY1lZf++f3hf1KvWFDVhtj0bVH07FrLSulr6gQi0AshYPI6A4sucTmeOnVuOpWwIsD5/oDKsinus/Gt80ueWA6EYiTHLCVhAKSIlspWhtCw4vpSGqheuTT2lTH7aQumx3UUZBN1eICyZIx4H50ntoVg7h4muPwBbIkjzUtfO4/z+2lAtT/K9hjmdv93UglBD7L5/p+dY2uVDQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXsZf3GltxFSpF2EdUDE6HzIJ+uh9WCityK5zSOb2D0=;
 b=SmZP04J9OY5+mKtmIlYSzzbhE1FwpPq2OiI0ogBl+e+tZOn03BVapavgawHjRxEwmNcSVZVYAlBe3TGItXp2Joq6nY7nzsLjC8lzEJUuEWx2e2YSrHuv5ix5uVvBWSgSuyxdo8jH7kyaItZHINSABSVgkOOlkDpyT8r4c9MquAE/oE0pqnGiSnwJlf9ekJR3dr9gmzkiJHJ7byulXrGkoqJ4itkFcwuFOO0NeQYkjZyJeizRaCEF8Bq5kgHezuWdVCHhvMVi55iFmsnfUi0Jn9kRyk2T3grTR6tvpo6RRzsDqdK9Bh+dfiEH2SQYMLn9a8hgJFhc9sHBnsX+Kqs5ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXsZf3GltxFSpF2EdUDE6HzIJ+uh9WCityK5zSOb2D0=;
 b=oIpM55KoyED9rGjYK1LNiEuLfaug01kCxXyVGrm3rxaIySW29v+YikvhvVpXlMdTj0h//5QnK5W3Tv6oNwW5VU36ziWecz9T/cdwVWAGFuLAmQhWX2cGvEOZVY47RQwpOlxjOD+TwPUud/jRMKmqMe/jeDLYWa8Tms4k0XX4bjOt+8IQoHuUHYvTMdRutT+0WCo6h0zORjEaSkkrpLwRKHzfHfvoQbVUvHwOI0PQ72xdH/NOoSBRXxGz3SZ9bLo2vf1ryidins3Sq5I1gBrGJWns3T5LKY+t/GrliI0oMDmidhqK8K54lZNqZh4L4jbj09CyLi0LgsLbcfhNHLiuEg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PRAPR10MB5323.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:298::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Tue, 9 Apr
 2024 09:57:10 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fd78:3502:7564:1891]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::fd78:3502:7564:1891%4]) with mapi id 15.20.7409.053; Tue, 9 Apr 2024
 09:57:08 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] systemd: make predictable name mac policy
 opt-out
Thread-Topic: [OE-core][PATCH] systemd: make predictable name mac policy
 opt-out
Thread-Index: AQHaiYMz9L+lb5XHbEKUptuivabAZrFfqiYAgAAKyRA=
Date: Tue, 9 Apr 2024 09:57:08 +0000
Message-ID: 
 <AS1PR10MB569732EB0A58FF2C515A9B25FD072@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <20240408070450.27686-1-peter.marko@siemens.com>
 <CANNYZj-HosUT6unGOohfRA22x9MWbUgYDn5N=mWjELVkTjBQsg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj-HosUT6unGOohfRA22x9MWbUgYDn5N=mWjELVkTjBQsg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=93fe0907-fe99-4b52-b335-8c2a138edb17;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2024-04-09T09:54:57Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PRAPR10MB5323:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 jBbmbtMJ4QY5NaBYVeUArqFKo3PfB5hQRIVqv8fe+zqf5BLHqU2cvln83+hzzHpn804OjHcocONvcy8W2FjcOhvEITBl1Ntd2DGz3OuRbKq5qlKEV/F7SupRNGY4r/AIAn4a1w9p+GPHEDiPioMXovDhKQrHTDZJZm4EjPGV3AZay8MrfEZQ+F3ao+jjm6z0tchLKSK7VGlUQQ0xCjSpg7kAYiIsoeZ2BRz/gxmfsCX5M+904D9c9eQxN94PGkDb8ClWqpgX/mN+2tAR5kv9Cq2YpRY/sK1nLkbgQlAq3MMiyagzuBzDPM8XIgaGm5M1K9O+NHcg2VtX8E9d6DGJiePkhK/v25umZb5Lf0GdK/NIAPnlCcRM37MygRoKbH/AiNDKNAwLzqCBwS2fbupsLazgbe1GdKNd7QrxQ4e+y3m3wtzQgp+J1xi3BCIUCTejLx8IFfuBNe6S0Y1VGAEiyCpUnOwDRW6MI7T32FyEyH8Q6q3k7mbn3rAxTdakURNDytEdu//DjPjRotVVDX+DDSksvYyUuQrbhAtHyMLliQB0DQv6Jzh3+mU1ykWP1j3NLsjwqQWkKPXDU5E9WNXnapAUfRA9G8jvFPIlzAqBlQAFsPSqIxx5kEfmlCSphLrhO9b0J1WgaQ3/o5BONfW+fqffbLLmKmbvgQ6WBXEyshg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?d1pTVlg5a3pBZ0xpb1ZJaU5DKzJVZWdWeXVudktsN08zVFA0MkExdVJCbXlI?=
 =?utf-8?B?SGM3MUZCYnoxbHo4eEpNUmtKUmEwU2ZmdFUyNHd3cUtPQjRCUlZ0cXdKRklK?=
 =?utf-8?B?clErZThnMHdMcWJwWkY1MXVHVlUrQUhMUGI0TmhQUTVKdGZta1prZWpTNnNq?=
 =?utf-8?B?bW1YR2szeTZMQ29JbG11allrekhaMXZxTlY2a2NhdHBVeGtaa3NTbFliNlNk?=
 =?utf-8?B?V2djTlp4dit2TXY1aFRlcGREOTlaS09rSjNUZWE5dmpSeXlpMWoyNzdpdDNt?=
 =?utf-8?B?ZDN1bWJwb3hQTUMzaFZCdWZZa3YxR21hSUpPalRMRXI2SnUwUkFwSllhS1Uw?=
 =?utf-8?B?UVljMHVFbm0reGMwVkZOVmR4SzYvckgrZ21xL2E5VzVYSlROa2dTQmg0amQw?=
 =?utf-8?B?VDNqN3p2VE9SZlFhUk00Z2hoeTl6bXc1Q1gyMXQ0bFQxTXlSV3dMdDgxWjIw?=
 =?utf-8?B?c21aY1JWOSt6YnY3RDhEbVRlQ2lwQlIvQmdaYUl0S09vOHBoZGFFamFrVkhQ?=
 =?utf-8?B?c2lZWmU2akZhTFh6Wld2ZnIzeGR5NHlBZ21CV2dpV3h4eGFJeFlyYi9WL3hF?=
 =?utf-8?B?akhlLytab1JjSXNhZWZXWjkySmdNZCtSdGxIZXF2ZzZreUl3Vmdrci9KYUZJ?=
 =?utf-8?B?bWNpRGRnY3RYdTA1eVF4Si9SeEY4RlBidjk4eC84T3JVcnFLN1BVUjVaOWlU?=
 =?utf-8?B?bEVUbDhYSHdXd1U1aEZtRElDRWwvUTBzbGVtV3MyVENuRXZPSzRJZllGTGVu?=
 =?utf-8?B?azE4TFZFd1BFQkJkeUgwTnlsTWFiQWlrMThQeGQ0Ry95cWx5L3RtbFJCVCtK?=
 =?utf-8?B?YnJoZDFKM0RwTU9HYVpXSGJDWW9FYXl2ZE5xWGdlN05uY2hINzZ5SXNhWk5X?=
 =?utf-8?B?REtUSE0vNlNraUMyZnFMOUhvMVdsazV5S0ZwT1RkMzZ6b29pdXdSNm1QZGwr?=
 =?utf-8?B?b1pqUXhnSC83ZXF1Z1IvdDNkRCtGdkxGaSs1TUhib3lSa1doZXIxRnpXWmoz?=
 =?utf-8?B?RTlNMVJqcFFtNG5jUU1BRHMwSXRDa1lMMFJKV3FhVEpQTDE0VC9lRFlMTjBH?=
 =?utf-8?B?cG1QS0RER0U1Mkt5UnNldmhBOXJpWlE3Q1FUSFUwQmx5b1U1TWExdGR6eDJH?=
 =?utf-8?B?VFduNkdjK0x1YngvWjRPY0hDUGRKOGdDMEJlMWhHdFFzUXZ4eG5NQng0eFRm?=
 =?utf-8?B?WnMxUWtRdFdUUytIYW9rVmh4Z2dLdExmVFRzZFZobk1uTHg0UTZsdnRwc2Vi?=
 =?utf-8?B?MnZYNUlPVVUyN2ROYkk2ZmI1STVWMTdWcjB3dlY4MFBYS1JOeUFEKzlFMHVr?=
 =?utf-8?B?cGMxTzdBcGhQRi9zTlUzT1kyT2xTMi81OG5oOFZMYUJDZ0FpWmtjTHBaNmow?=
 =?utf-8?B?S1ZDdGpQNSs1MEVjVlZUUjhjWU5oRi9BTFpJS0xLV0xzVXo3d0pyWW5sbzBn?=
 =?utf-8?B?blNUakRCQVQ3SkV3OTQ1K0hwTDVxaW1mNUh6c3l3ZHRSdUtpTXBLUFRXTDZB?=
 =?utf-8?B?dFFYZG1Ed2R3ZFR1VGExNUhmdkpVUDdBV3l3VUFvRlZoZHdNY1FvTnZRZC8r?=
 =?utf-8?B?OERWTTF3UkFLVTRKTE9BMFBMUG80bXd5dUJTeUFsLzd6dzdicWhBRjhHWjd4?=
 =?utf-8?B?WHFVQjdLa1JDb05mSXA4ZGN2TUpyWVNuMUh3c3oyTUdINk5ORHoxQ25QU05N?=
 =?utf-8?B?Yksyd1YxYjRLRjlJcndSZXpVVm9YdnNKVmE5TVdvL043enRHaHBabGZ6L3hu?=
 =?utf-8?B?Qk5SYnUwTndDblJtYlBhbmVuZVNFWFlKU3NYdFV5NFVidWpkRFVyYUVXbFNM?=
 =?utf-8?B?WTdUdjdNOFI2VXJWcnhmM2pRVVJzbFFxMHBvY00xK1JCVEFuVnBkbzlTZmRD?=
 =?utf-8?B?a2pMa2gxdFV0YkRaZmlzMGRoYXlzZlBvcTF1UEZyd3paeWVITElmdVQ2dmgv?=
 =?utf-8?B?RW5RaUMrNzgzdmd2Rm1xcXBjZ0tFYUh0V01rYXhyOFJqM1lhTXdSdWkxK1JQ?=
 =?utf-8?B?VVdydVl2UTVPaWtIa3U0WDFLMzdob2IvUFpid1RNUHpZblRHTEswVGZpa3lr?=
 =?utf-8?B?NjZBTVVrUE44MnRvSFRHVWRWVjMwcjQ3TTU1aDU1WndLVDhvWCsxNUJ3OEFa?=
 =?utf-8?Q?luA3/JsNU+cuO8kG4pV3OM9DH?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 325ddfd2-a3a6-4ebe-e110-08dc587b6b8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2024 09:57:08.7810
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fcU+GmbCYpOwl9FF35qxn2m4OhO395n+PHwSFP0zDlpN7js94uNQWBHV7KdK6/QM1CFzNzCJMgpv0qNFiCgqzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAPR10MB5323
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Apr 2024 09:57:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198061

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4
LmthbmF2aW5AZ21haWwuY29tPiANClNlbnQ6IFR1ZXNkYXksIEFwcmlsIDksIDIwMjQgMTE6MTYN
ClRvOiBNYXJrbywgUGV0ZXIgKEFEViBEIEVVIFNLIEJGUzEpIDxQZXRlci5NYXJrb0BzaWVtZW5z
LmNvbT4NCkNjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJq
ZWN0OiBSZTogW09FLWNvcmVdW1BBVENIXSBzeXN0ZW1kOiBtYWtlIHByZWRpY3RhYmxlIG5hbWUg
bWFjIHBvbGljeSBvcHQtb3V0DQoNCj4gT24gTW9uLCA4IEFwciAyMDI0IGF0IDA5OjA2LCBQZXRl
ciBNYXJrbyB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8cGV0ZXIubWFya289c2llbWVucy5j
b21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+ID4gLSAgICAgICAgICAgZmlsZTov
LzAwMDEtTmFtZVBvbGljeS5wYXRjaCBcDQo+ID4gKyAgICAgICAgICAgJHtAYmIudXRpbHMuY29u
dGFpbnMoJ1BBQ0tBR0VDT05GSUcnLCANCj4gPiArICdwcmVkaWN0YWJsZS1pZi1tYWMnLCAnZmls
ZTovLzAwMDEtTmFtZVBvbGljeS5wYXRjaCcsICcnLCBkKX0gXA0KPg0KPiBDb25kaXRpb25hbCBw
YXRjaGVzIGFyZSB0ZXJyaWJsZSBmb3IgbWFpbnRhaW5hYmlsaXR5LiBQbGVhc2UgbWFrZSBpdCBh
IHByb3BlciBtZXNvbiBvcHRpb24sIGFuZCBzdWJtaXQgdXBzdHJlYW0uDQo+DQo+IEFsZXgNCg0K
VGhpcyBwYXRjaCBoYXMgc3RhdHVzIHVwc3RyZWFtIGluYXBwcm9wcmlhdGUuDQpQdXNoaW5nIHNv
bWV0aGluZyBsaWtlIHRoYXQgdG8gdXBzdHJlYW0gZG9lc24ndCBzb3VuZCBsaWtlIGEgZ29vZCBw
bGFuLg0KDQpXaGF0IGFib3V0IHJldmVydGluZyB0aGUgaW5hcHByb3ByaWF0ZSBwYXRjaCBjb21w
bGV0ZWx5IGluc3RlYWQ/DQoNClBldGVyDQo=

