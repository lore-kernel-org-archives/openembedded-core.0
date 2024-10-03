Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D722ACF34CF
	for <webhook@archiver.kernel.org>; Thu,  3 Oct 2024 22:15:09 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.44])
 by mx.groups.io with SMTP id smtpd.web10.9123.1727993701506603880
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Oct 2024 15:15:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=OPzESOqc;
 spf=pass (domain: axis.com, ip: 52.101.65.44, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TcfcPB3YnNVnzWGtcadl4bKAyGj0EzdBgXEcXDr2ofY9py4M+M6SrWPTty6xSmTGk/DP2E8UGDhT5NXzL1hu1sCJ+LNTXYwmDjbRxL/3J1dOO57tryNIbC3o22RSjL1Cm5NHP8LvRki/JAeGYxoQo/Fzw2QdF7P0pf0knTCEBGf13dry9hNrmIH7UDkS2TFHJ7rhRJ38P3UCXnxwsvbvuIyt6wQn1yL2Byprla2gkS6WjttfvsqAXdsNZeV529MXxbHS0v72esS68wjkWzYtdbparbYPg+0/WvliqEC0eljUr/4dCdmcE5pYTkNMmWZU9EpwT/yMSdCuYD953JQUeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wYzR6jujlkMHmgvJh/NtvJfUO79/YHT6DTpc20iWf6w=;
 b=tYHOUiX782ihwTj7tzwzpcM23arbxjtAZYcGIRYEX8Rve27vB9pQwfkWCDy/e5V+fACXjPntyVVT9Tq3L1emfBBfdpsrzhIxDefK8h0TBwhg4m9lFAsZC74GqqUc7fxuMmAbe9LhQN+Q60Nu8L3I4C08F+VahYxeuwUnbVBAdWKCd4zrzTftXMRG/mPnRUox6pobgPP6gZ0UuXgUdOj+ZOzFYhj0tXikwRtBV+DzfGayTs30ga4PIZR0dZ13PRG6jkx4fpd9sYRtPB5PNZkbfxa/esbEwckJwDs/HAjGjMUf9oF2QaSr1/fC0JteO/DfDC+gkRXcPrPJvdiwa631Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYzR6jujlkMHmgvJh/NtvJfUO79/YHT6DTpc20iWf6w=;
 b=OPzESOqc7xKQodoXZhCMENziTWkcj/JSZyHKoF6qcjhPUVuTYKLl0HwvP1Crm+1sUWtmgvA9R2BXQ31VpWWLuEXThBbhBZCn6fuDgZfhtjeve7/wDPxPmenJFsjQ4uuJlpyaaj1s6yyRYtgD87NVMPk6GOHsPlWGbDW12h105i4=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DU5PR02MB10870.eurprd02.prod.outlook.com (2603:10a6:10:526::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.18; Thu, 3 Oct
 2024 22:14:57 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8026.016; Thu, 3 Oct 2024
 22:14:57 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"chris.laplante@agilent.com" <chris.laplante@agilent.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] oeqa/selftest: automatically unset
 SANITY_TESTED_DISTROS
Thread-Topic: [OE-core] [PATCH] oeqa/selftest: automatically unset
 SANITY_TESTED_DISTROS
Thread-Index: AQHbFdyJ7Yc2vwqmJE+7l15iWPeCmLJ1j6kAgAAD1+A=
Date: Thu, 3 Oct 2024 22:14:57 +0000
Message-ID: 
 <DB5PR02MB102134F975E0170DE53FC6F0AEF712@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20241003213726.2518832-1-chris.laplante@agilent.com>
 <9182e8a9fe4467a84a2c611d84c8999dbde27826.camel@linuxfoundation.org>
In-Reply-To: 
 <9182e8a9fe4467a84a2c611d84c8999dbde27826.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU5PR02MB10870:EE_
x-ms-office365-filtering-correlation-id: 4d8a502f-d6ca-4799-421a-08dce3f8d0a8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?OGlYcUtoVUlwM1BWd0VZMlRNaUxsd0d1NEtobGx6ODI2dVNHUFY2aFNpa2l5?=
 =?utf-8?B?OUJPeHhqNkkrNEdHTmk2anBic2VNVVVEZGo1N2NBQ0VXa2tyb0xGcjJ0Ukhi?=
 =?utf-8?B?ZHJzTHIvbncvVVpreGIrR0doNEdLcnhuYmlFRk45bGFud2hnTHBLZ2hpTnVG?=
 =?utf-8?B?K2I1RXV6aGlxNGcrUnhaSXhUaHo2cmFzM0dwSEQ1L25IdVB0dElWb0FVVDhp?=
 =?utf-8?B?RzQxZzJCZnpEQXpSWHRSMFJxYnhadnlUSUNRaVc2TGEyRHFacXZHUGhhYXUz?=
 =?utf-8?B?L3cyaE9RamdQK2RZR05lckFtL2c1TldFZERjUWhJQ2t3dklJeXhWNktkNVRh?=
 =?utf-8?B?V3ZqOVVpbmlQT3NQcm0yUVd6WXFTK0tTTldwOUMxMitHYi9weVdtbk5VYmtV?=
 =?utf-8?B?MklmK0R1TFhneUJEcDZ4akJZS0pRemgybUIyem5qRE5CblJtY2laaHRRVTIx?=
 =?utf-8?B?UXQ2VmorOTFRZCs5dXhVaGFsbWNPV3NUZ0VIZUwrU0Jad1JHNVpTWUpUSExU?=
 =?utf-8?B?RCtTTWxNZ0xnendJY1FsZnZaY3pIcE1MVTA5Ny96QWRxVHkzb3duZnhqSUhn?=
 =?utf-8?B?Q3ErK3d0eTcyNU1ianAxMG45SHlkV1FaSnUzSE55ZkpnOW0xVnJ2cnV4aStP?=
 =?utf-8?B?dXdaL1Rwd04wZGdoV3Z0YWF3MkVLOGRHSzNIM2hjU2FEdHZ5ZmNoaVZWc05J?=
 =?utf-8?B?eW9oL2I1Rm14K2o5M1o5WDFXazhDMkFOaXMxQVAxM001c3VINUVqZndEZ3JS?=
 =?utf-8?B?RVlXQzVpWmE0bWRFK2I4dm04cXNxbnJzcGRncHVBNWp1cmNEQS9GRXhnUllB?=
 =?utf-8?B?OXRMbzVrNy9PbFZ6d1kySkRzcTVXcWdXYmRpeWttY1laZlVkRUVDNFlwNmlM?=
 =?utf-8?B?WXJNYnFkclNBNFVxMGFBQkErQjE0RFQ1K1dZdDVodzlDNHc4TDArbzhHbzF3?=
 =?utf-8?B?STFYTjgvbnZoL1BMck14eExUZWpwamxxRHFqRmZTa1Z6VWlOQ0drVUlkUU1N?=
 =?utf-8?B?SlhOUnBaMDk5ZkVBcEwxMk9LYWRlRkhqQ283Y2swRzM5ZkhkYWdRcnpTcmJo?=
 =?utf-8?B?M3JvaHloRW9PdGdUNWtLd1hUSEc1T2JxWS9sL08wV1IraWU0M1lwQWVTblNO?=
 =?utf-8?B?dE1FeU1nbDNnVnRZNTE4Kyt3WDFuYWUranB0dkZEenpwR01KcVRTemd2bzkw?=
 =?utf-8?B?Q3NaQjRKOHF1TFNqN3RaczE5S1MxYzlzZ3ZrUHhuakNWYzFIci9SYXZIM0dL?=
 =?utf-8?B?ejYxREpLcE1oRzhZdllNbHpNMys3Y25ueDFReEh0Q1E3c3R5eHk5aVQwTHdn?=
 =?utf-8?B?UDByM3F2WFJMLzkrS3lrSWFiSERUV01iMENieTVNRDZtVUNSbXVtY1VVS01L?=
 =?utf-8?B?ZEJ0eHo1WmNmakl3dEJaZHdSK0d2UDJGWVlpNmVoS2pKeGdYRE51ejBpelNH?=
 =?utf-8?B?RlRlbnZyS0R1YlJRYnFROXdBMGdYdVh3ZWpXTndXR21aaW1rUWhxMlJzMDND?=
 =?utf-8?B?ZCt0YUNNRnpnLzArakxrNDIyZTl1QnpiUUc0d0FBd0MvakFTYWZGZGRoSEVP?=
 =?utf-8?B?Z3hIN3BTMFdEY0x6L0ZseCtGSmJvT2o0cy80MElYM05xdVNFTi81eXNhYWdV?=
 =?utf-8?B?Q1pua0puYVNXNVBUOHArNWNYZ2lhZ05Sa3BxV3hibUdHVXBMN2hzdWJlaVR2?=
 =?utf-8?B?UjIxaThGTEh3bndORU5WbUd1cE9kUUt1MFNNalgwek8vYllCWUNNN2V4UnpK?=
 =?utf-8?B?UnBzZy9zV05WK2Nra1krWHlXQ3E0eDAvNnRWRFVueUdVSTlDYUpIdWdwQ0Rn?=
 =?utf-8?B?RmdPNTA3S3RPbXRLaFZzUT09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MzgrVW5DNnZjL1FjellhQ1VJaHlvaGRVS1FFaFVFd0d4TUF3dTlVQldZUklP?=
 =?utf-8?B?bVNqUjkvQWc1Rzc4N0xGR1V5bTM4UXpsakpvRk1DR1Zmc2JmWmZZOEdpQ2l2?=
 =?utf-8?B?YkViOEtuTHVyUzJvNDZhKzJ1T3diZ1NhVDk0SndCbHJoTzZya21SeFJRc0xk?=
 =?utf-8?B?elJkc21IUUdjanBmUzFrUnlHblJZZmdXR0xHaXRvQUtOSmwzNlJlUDkxL1VC?=
 =?utf-8?B?NlF5RUtkQnFJelJWWUI3cEV6RDFaMXoydHkrQy9Sc2ZGTUR0MXoxREFpZlNs?=
 =?utf-8?B?OEtCVnNFOVlhaGNQUG5ZVmYvZ3V0MFZ2blNKajd4YjFCbFBKRWF5Zkh1ZTZK?=
 =?utf-8?B?VFNmUmVqb1BaYzE5WXhIbTU0bXEzeUwxc2RDUi8zMDQxVWFvU2RQR0kyU2p3?=
 =?utf-8?B?alNJTm53Vi9sc3Zxbk1WRHZPdFpSWUNCcXdBOW03b015Z3hFRWxsaThHYVRI?=
 =?utf-8?B?N2ZjY1RKbzRHZk9aVTR5TTdoaHhxbHdsR20xamhDQTRvSHZ6SXpEb0hUZEZ5?=
 =?utf-8?B?blpWMWpDSzJSNldWSTY0OEMyc3NhMGs2NUZFUnd2eGp4RDV0T2VVTnp0SmI2?=
 =?utf-8?B?d0dXVkp6dXdXdDlnQVlzMnlDc3d6VGlSZzZCbDhVLytLQ21CaFZ6U0JXbUxm?=
 =?utf-8?B?MnZoMEVwcGQ0YXR6VVArUVJKYzc5S3lDWFZXS2U3SXNYcitoakM3T1BVNjlh?=
 =?utf-8?B?YXlHOEdna2U2VG5aREJkdjVJVHRTblZYMWhQQjRuemFzd1pzZnozUDFjd1Np?=
 =?utf-8?B?V3JpcWVDenNqMktXWXNueHVqR2tEMDVvR3l2aktWMnpwRG1pQzJQb1lsNEdI?=
 =?utf-8?B?ZUhHbE1IQk5lMks3MEtQMmtUTlRLM0FJQ3BLd1UwT2FiNExFRGJ5MmhRb05W?=
 =?utf-8?B?RTBkeVJlNmFvcGNNdE5mdWNSRFdpY0U3SFo0WW9iTUQ4WW5zTmpQeVJtYkYy?=
 =?utf-8?B?RTV6dHIwaFNabTNMeGt5cW4wVVhNT0syaXBnOTB4Y1VNT1BXL0ZLS2F1NCsy?=
 =?utf-8?B?UXRsdU4zOXFZOTZzc1diNkFzc252OENPMmpxa2l3SldhNjMwRkNPbW5GRFJz?=
 =?utf-8?B?MHgrTjJHMDlLTXFXcDBoaGR4OUQ3UytLbmhsWktBd2U1bUJwdWVSUVc3aXBU?=
 =?utf-8?B?d2xaNEJKb2tBRVZuVWhVektVOUx1dmdqajdXRHE5U3BTSzA0Z1M3ZWNlTnhj?=
 =?utf-8?B?NVBIazJFSWx0eEdycmtrRVNvb05iK2Nwd2VneWxuYUlRSzRyM25VaDZZekln?=
 =?utf-8?B?TnFuZVFGUXg2UzhkZU94RjRaRmF2cmZPbzgvdXVvQlhCekRCQllCNmhkNEo2?=
 =?utf-8?B?SkRGTUZya0lydlIrK3ZUNmtlU0pWWjYvditjZG5HOWhtdnU4Rmo2UHgzRFZu?=
 =?utf-8?B?S2RsNGQ3NzhaZzZxMUZ4OThXdFRHMDBJVDZvY3FlM0l2NXpaTlFLMEtURWNu?=
 =?utf-8?B?U0hGenlLN0owQkZlcFA0elcvaW9VcENJZlFvR3ZjTzdrSDNXN2ZpOC83Y0l3?=
 =?utf-8?B?V1ZhYWEzbm1hbmpOdExvdWY5RThyaE9sS1RjUFdBdnRLMC9FdFJDVzlHSGt6?=
 =?utf-8?B?VFVxeWswS2VXVktsdGhhM3FWU01HRytQaHVUVWRCUVNzd1YxMFg0RVJsVUhr?=
 =?utf-8?B?U1ozNjFmL1IvN2FIUDEwbXcrb3VhbDkzMy95bGJpSWdMVGdKa3VodFlzelh4?=
 =?utf-8?B?QTE4TkJ3ZzRxb25PVzRLZnN4eHB5VUUxNTNxWmlpNlNsWml6SEI3blVYRFky?=
 =?utf-8?B?V2VIZDdram95b1dIalVpendQazc1QkdMOU1pTkMzRDNIdDFoN0JZK2FEZTNn?=
 =?utf-8?B?UVB3eDcvb3d5eDVKWXhpZ0FzYSs4ZTh3OE92c09LTnpnbTlzcW5qS05lampI?=
 =?utf-8?B?Ty8zN0sreTI4aGNWSmNVWm93VmxrVzlmbnloRWNyVG9Vc2hhblRUQmVvTWdw?=
 =?utf-8?B?dmtGMzhDemlaSW1obUhkdXJyT3liUlozVklxSDFkSG1jQzdxSmJxK3BYQWJy?=
 =?utf-8?B?L1lobnRVbkpHS2pXQVZJY3RLS3BSa1pURVFFL0E3Z2VMeUNUSFBkSTZsNUIv?=
 =?utf-8?B?dUpaby82aTlZbUpzSXM1dEJJdktvME1DZFZLQzAzZVZDcWtFTmdsbjM0Q0Jn?=
 =?utf-8?Q?WYSY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d8a502f-d6ca-4799-421a-08dce3f8d0a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2024 22:14:57.1722
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XUTUIQ7iRDzzIJRGNOoGOh3PIPaY/NHHZDw70XlJ1nUT1rg2IRwc0n1rg1XWFxBO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR02MB10870
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Oct 2024 22:15:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205218

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiBPbiBCZWhhbGYgT2YgUmljaGFyZCBQdXJkaWUNCj4gU2VudDogZGVuIDMgb2t0b2Jl
ciAyMDI0IDIzOjQ2DQo+IFRvOiBjaHJpcy5sYXBsYW50ZUBhZ2lsZW50LmNvbTsgb3BlbmVtYmVk
ZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVd
IFtQQVRDSF0gb2VxYS9zZWxmdGVzdDogYXV0b21hdGljYWxseSB1bnNldCBTQU5JVFlfVEVTVEVE
X0RJU1RST1MNCj4gDQo+IE9uIFRodSwgMjAyNC0xMC0wMyBhdCAxNzozNyAtMDQwMCwgQ2hyaXMg
TGFwbGFudGUgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+ID4gRnJvbTogQ2hy
aXMgTGFwbGFudGUgPGNocmlzLmxhcGxhbnRlQGFnaWxlbnQuY29tPg0KPiA+DQo+ID4gSXQgYWx3
YXlzIGhhcyB0byBiZSBkb25lLCBzbyBqdXN0IGRvIGl0Lg0KPiA+DQo+ID4gW1lPQ1RPICMxMTkz
M10NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IENocmlzIExhcGxhbnRlIDxjaHJpcy5sYXBsYW50
ZUBhZ2lsZW50LmNvbT4NCj4gPiAtLS0NCj4gPiDCoG1ldGEvbGliL29lcWEvc2VsZnRlc3QvY29u
dGV4dC5weSB8IDcgKysrLS0tLQ0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL2xpYi9vZXFhL3Nl
bGZ0ZXN0L2NvbnRleHQucHkgYi9tZXRhL2xpYi9vZXFhL3NlbGZ0ZXN0L2NvbnRleHQucHkNCj4g
PiBpbmRleCBhY2MzYjA3M2JkLi4zYjUwN2Q3NDdlIDEwMDY0NA0KPiA+IC0tLSBhL21ldGEvbGli
L29lcWEvc2VsZnRlc3QvY29udGV4dC5weQ0KPiA+ICsrKyBiL21ldGEvbGliL29lcWEvc2VsZnRl
c3QvY29udGV4dC5weQ0KPiA+IEBAIC0xMjksNiArMTI5LDkgQEAgY2xhc3MgT0VTZWxmdGVzdFRl
c3RDb250ZXh0KE9FVGVzdENvbnRleHQpOg0KPiA+IMKgwqDCoMKgwqDCoMKgwqAgIyBTZXQgU1NU
QVRFX0RJUiB0byBtYXRjaCB0aGUgcGFyZW50IFNTVEFURV9ESVINCj4gPiDCoMKgwqDCoMKgwqDC
oMKgIHN1YnByb2Nlc3MuY2hlY2tfb3V0cHV0KCJlY2hvICdTU1RBVEVfRElSID89IFwiJXNcIicg
Pj4gJXMvY29uZi9sb2NhbC5jb25mIiAlIChzc3RhdGVkaXIsIG5ld2J1aWxkZGlyKSwgY3dkPW5l
d2J1aWxkZGlyLCBzaGVsbD1UcnVlKQ0KPiA+DQo+ID4gK8KgwqDCoMKgwqDCoMKgICMgVW5zZXQg
U0FOSVRZX1RFU1RFRF9ESVNUUk9TDQo+ID4gK8KgwqDCoMKgwqDCoMKgIHN1YnByb2Nlc3MuY2hl
Y2tfb3V0cHV0KGYiZWNobyAnU0FOSVRZX1RFU1RFRF9ESVNUUk9TID0gXCJcIicgPj4ge25ld2J1
aWxkZGlyfS9jb25mL2xvY2FsLmNvbmYiLCBjd2Q9bmV3YnVpbGRkaXIsIHNoZWxsPVRydWUpDQo+
ID4gKw0KPiA+IMKgwqDCoMKgwqDCoMKgwqAgb3MuY2hkaXIobmV3YnVpbGRkaXIpDQo+ID4NCj4g
PiDCoMKgwqDCoMKgwqDCoMKgIGRlZiBwYXRjaF90ZXN0KHQpOg0KPiA+IEBAIC0zMzcsMTAgKzM0
MCw2IEBAIGNsYXNzIE9FU2VsZnRlc3RUZXN0Q29udGV4dEV4ZWN1dG9yKE9FVGVzdENvbnRleHRF
eGVjdXRvcik6DQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNlbGYudGMubG9nZ2VyLmVy
cm9yKCJQbGVhc2UgdW5zZXQgUFJTRVJWX0hPU1QgaW4gb3JkZXIgdG8gcnVuIG9lLXNlbGZ0ZXN0
IikNCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmFpc2UgT0VRQVByZVJ1bg0KPiA+DQo+
ID4gLcKgwqDCoMKgwqDCoMKgIGlmICJTQU5JVFlfVEVTVEVEX0RJU1RST1MiIGluIHNlbGYudGMu
dGQ6DQo+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2VsZi50Yy5sb2dnZXIuZXJyb3IoIlBs
ZWFzZSB1bnNldCBTQU5JVFlfVEVTVEVEX0RJU1RST1MgaW4gb3JkZXIgdG8gcnVuIG9lLXNlbGZ0
ZXN0IikNCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByYWlzZSBPRVFBUHJlUnVuDQo+ID4g
LQ0KPiA+IMKgwqDCoMKgwqDCoMKgwqAgX2FkZF9sYXllcl9saWJzKCkNCj4gPg0KPiA+IMKgwqDC
oMKgwqDCoMKgwqAgc2VsZi50Yy5sb2dnZXIuaW5mbygiQ2hlY2tpbmcgYmFzZSBjb25maWd1cmF0
aW9uIGlzIHZhbGlkL3BhcnNhYmxlIikNCj4gPg0KPiANCj4gWW91IG1pZ2h0IHdhbnQgdG8gbGVh
dmUgdGhlIHRlc3Qgc2luY2UgdGhlcmUgYXJlIHdheXMgeW91IGNvdWxkIHNldA0KPiB0aGlzIHdo
aWNoIHdpbGwgbWFrZSBpdCBoYXJkIHRvIGRpc2FibGUgOigNCj4gDQo+IEEgc2ltcGxlIGV4YW1w
bGUgd291bGQgYmU6DQo+IA0KPiBTQU5JVFlfVEVTVEVTX0RJU1RST1M6cG9reSA9ICJ4IHkgeiIN
Cj4gDQo+IHdoaWNoIGlzIHdoeSB0aGlzIHdhc24ndCBhdXRvbWF0ZWQuDQo+IA0KPiBDaGVlcnMs
DQo+IA0KPiBSaWNoYXJkDQoNCldvdWxkbid0DQoNClNBTklUWV9URVNURURfRElTVFJPUzpmb3Jj
ZXZhcmlhYmxlID0gIiINCg0KZ2V0IHlvdSBjbG9zZSB0byBhbHdheXMgd29yayBmb3IgYWxsIHBy
YWN0aWNhbCBwdXJwb3Nlcz8gDQpUaG91Z2ggSSBndWVzcyBpZiB5b3UgcmVhbGx5IHdhbnQgeW91
IGNhbiBjaXJjdW12ZW50IHRoYXQgYXMgd2VsbC4NCg0KLy9QZXRlcg0KDQo=

