Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4769FC4332F
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 16:55:29 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.72])
 by mx.groups.io with SMTP id smtpd.web10.155244.1669740922582641330
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Nov 2022 08:55:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=ntuokss/;
 spf=pass (domain: arm.com, ip: 40.107.7.72, mailfrom: ross.burton@arm.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DmAxyn2vX+2BYyd/zV4FEDwAd5g79PD/MxLa3r5yuGHNxIPtruOv7M7ZhNe7JXT7X0aNoRv6PqFkJ8gAgVue6JU5EPUYum5revDVmF0HSPmyvuhzilQMrtHN4tgf19XXspU/iCoc+tpXdnEp+7/XCOw8j2pHaFGHA8mvO1elXfr5jANC7Gk8Q/14o9IHIoa/ZwvuucFAA0C5atHKwlCkTqFIqlPZKUWs6DlmN2FFpyYHMMCcXTFNuqgvbIHCpEHJPw945v7A1hqQKKAPICg+spsvfU4J33lmMTPoeC/8HhySPeluE494MOof/DhFHbV+ZVTMSluEHJCgz2IHvXvvtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uu8d3oRc0w/rxR/CuF/+sMKUnrsAbtSIla1y6pkt5Jg=;
 b=IlQxkB91C95PfNHSwqR8nngHFRP5+tWMpxS33WpJG1/aZbvtZfxpDcQpTWUnVq9pmqMeTSRcm8IbiA2nQhtcS332FiZzlf37G9Zqz73GFd8p0mZseNVFfoKTzGkNGgjv92SUprLc6VfNXPKy+tQyDsZX/7+iPWJOT6LR60lboLyt4irvwI/aTR7UA4rEOZMXjLXTCYCS9xOSsITZ4U6JbklO/OVH66FHgwlDTvtsw4PBtgDYC/LGKPBArcvhO+rQoQP42VCFAtFso3TqjBJgkpAN6kaeW/EDhepPlaeHeNotjShZ6WFqc8XNdHnOWf9cm8dYjSkS9t5lgi/gDUM17g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uu8d3oRc0w/rxR/CuF/+sMKUnrsAbtSIla1y6pkt5Jg=;
 b=ntuokss/be+WSrtGcrpyqRFOSRzT1gnX8oUI3olkjYollSk+Ej99sJfgfICeY2Bub5JkK2rDQ39PDo0dfsGNlO6BtXopE6x9/r46REUD5JR1WMj8u3vejwBEZ6YVj/LVZ1z2g0VjQXI0Mh13Q5IacnoZwWCVucDY47oSHnG5ROE=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AM8PR08MB6321.eurprd08.prod.outlook.com (2603:10a6:20b:366::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Tue, 29 Nov
 2022 16:55:18 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1ecf:7fb9:8c0:8119%9]) with mapi id 15.20.5880.008; Tue, 29 Nov 2022
 16:55:18 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Markus Volk <f_l_k@t-online.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][PATCHv7 2/2] gcr: add recipe for gcr-4, needed to build
 with gtk4
Thread-Topic: [oe-core][PATCHv7 2/2] gcr: add recipe for gcr-4, needed to
 build with gtk4
Thread-Index: AQHZA/W0qyx+ytOn+kKn73wneCpvGq5WDIQAgAADYgCAAA7WAA==
Date: Tue, 29 Nov 2022 16:55:18 +0000
Message-ID: <16D4E649-B4FA-4E57-A7F4-853FD7057141@arm.com>
References: <20221129132220.6357-1-f_l_k@t-online.de>
 <20221129132220.6357-2-f_l_k@t-online.de>
 <F7525B10-17D1-43C6-B2AF-DF5BAEE11246@arm.com>
 <CANNYZj9XvDiuZiUgKmEJcvHX_U7Q4KmH93GFGtH-N8FxqEn=GA@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9XvDiuZiUgKmEJcvHX_U7Q4KmH93GFGtH-N8FxqEn=GA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR08MB7411:EE_|AM8PR08MB6321:EE_
x-ms-office365-filtering-correlation-id: da21f354-6835-46f0-6880-08dad22a7ec3
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 AzS8roDRusjpUisWOUJhFFK0xIxe3TCCAfEy7LKFqun4MR99LvaWFyzyZmGtT5jV77TkqaGY0rNLAjJnGqzXQaAp2WRQoFewIWUzsE1n1c8c5A65lcSN7eKhHOyMwYilGMIh6KqztMHPDWMFiXQaJBmby6ux+OZAJXRdHxMzrngOxvaGOF1GqTF1jKG59/e9LYzzGsSb0xcolA/ALK4Iq90+CmxqcEP+Uldp4velmnOCUqocfrjnBqm4yAPg40yra9RFrSrPeaaHXqkFVtcsaBBD0Y4tMCiw/jw5SfHHXQ9vEDSebNl0Y0pFK32CwPNa08sZkbiqTDdWAHoK4sBLhvOJX9rTX0oS0e0ejZodpGgC+OyHhSDc7AbT5Ga7g+7UDpzRtsu62qqZ+QxYCujUUWK6GAGKB9lcGFvRwVDdKo7cDPJ0vjKEd6R1ql5y2MwCzGHD4Htd2lVKkPWbeKAAfAMHSDtu5c51ExdT7cAP2BY2KpszafFhT08zoQ8eSZApwNwnab73w7UjmGRy3mWC7ahGHoTutguGCw5L8czn/afigBolfVSqEN0H/AtGHFdoLmluUUZtt9tUxIoa8te9wQF3JQpjGvFm8LONcrMwKAX+iquIv/Mlx+bTeFoabCyutlW1pOHX5Ax6QaFHog1SnOez/4vndcaScZHN7o5pRrSDphE8T1qCTz96R6xJe1IcUOqh7Yp/h9z/UX3HwHFQs8S1u9kuq8eKwoPju4FIp4UCp4LEmOEtSe/xCwombr5WNbP81xw6r6HqMZteAzkZKA==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(366004)(39850400004)(396003)(346002)(136003)(451199015)(2616005)(2906002)(86362001)(6506007)(966005)(6512007)(38100700002)(33656002)(66446008)(6486002)(66946007)(66556008)(91956017)(64756008)(41300700001)(76116006)(8676002)(122000001)(53546011)(36756003)(26005)(71200400001)(478600001)(66476007)(5660300002)(8936002)(186003)(316002)(4326008)(6916009)(38070700005)(54906003)(4744005)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?SjY3RURHUXlnN1VQWmlVeUkrb29BaldiOEszRVJaRFUzc2pVelE0S0diRlFL?=
 =?utf-8?B?bmVlN0JhYS9kZ1BYODhzeDVlVVdNN2YzNitacUovSENrYmlKUG94MXVwbGgx?=
 =?utf-8?B?SDFDNWI4OFdzOW80emRzWmZYN3dWU0ZxbDQyTHdaOHRvc1l1YSt4M3REK0hZ?=
 =?utf-8?B?aXR4cVUwK3JJTzdUalFCSjRDbHhRRkdXSmpLTWNnV01rWkNqdk5yTW5tZEla?=
 =?utf-8?B?OE5SRTlOMVhLNVFkMDZtamJ0WVpwV0VmUWxYU1BUVW1uZFBZSWg4dE5uQW8y?=
 =?utf-8?B?UFpHZHM1ZktkaVFob2FscHJyTGJCMXY0ZzNWaWUyOTdUZS9HNUlWdU5ReVNN?=
 =?utf-8?B?TGFEbThYTThvbEFwcDZZc2d1RTBqWENqU2pDTkVpMTh2WVJPaUVlTHhvRE81?=
 =?utf-8?B?T0NreXRRQ0Y5NTZHb2tFMzd1WmlTb2hjZktiTkJlbFE4UTk0bHlxYzBOTDVU?=
 =?utf-8?B?WWhDNWhtbS9kMmFPOU00b2pOTGVkRHVPbC9lZ05lSmozYWJuNS9UK2JHV25a?=
 =?utf-8?B?MVZYRlg3RkVQOUExRkw0T0Z6QTFWK2xhcW0zOEdpL3hqQ0pOUjdyT0NCNkc3?=
 =?utf-8?B?Vjl0RlZKUGU5bXorR3ZnWEM5UjcvU2lTcEI3KzdONGRSd3VsTnFTQ2d2RnRU?=
 =?utf-8?B?WXJudVFOUDZVemhNWkt6OVU4QnQyM0REUHlkSnBNc3hWZm40SkZvVW9SQjQy?=
 =?utf-8?B?TlVOb0x6a1VKSlNJNUJPVlBmUFdyRDh3UDNaM1Q2ZThwNzJnNTRiZEZNQnVn?=
 =?utf-8?B?NFdXQXkxMU1ZbjU2b0RLRXpwUVh1TVNNa3hsSVJHU0VyWTVvVUpiRENNRHUv?=
 =?utf-8?B?RjRoSEtXVmU1dHovL1BTY0hLcUVHdklkODA5T3ZEZ1Q5NDFnTEFnR0NGK2k5?=
 =?utf-8?B?M0pYMXFwTmloaFhwV0V3eGhHVGR2SXJwK28xNGRoc00yOXVCRG55VjQ5a3o4?=
 =?utf-8?B?S3lEZ3JjMGxpbTNjYzREZWgwZU9IczU2TS8xc0E3Y2hwUHRBYTYvc1krN1h2?=
 =?utf-8?B?VkVnMlFGZWQvZEp0T09pZWxhN3pSZWtvaDJjVmhsNDZJaDdldURrcmxlMDdy?=
 =?utf-8?B?d3IvSkc5UEk4alV6Y2pzZURQT1RERTIwN0ZlTXdha0NIOVFQc0pDMFlYNCth?=
 =?utf-8?B?UjlwNDJpMTlXSXFuSW1WbE5ScFRNOWsyOERoNk52cHZrTFFOeXYvakE0RVN6?=
 =?utf-8?B?TXdGOW83b2M0M25SOCt0ZkloU1h5a1YwSUdUejE3aTJyZEp1aVpoTmErbFNh?=
 =?utf-8?B?djdiMFNFYnJMNzFWMXlGbnV5dTNWRVNIZjZzQzdCOStMaEZWdVlQUk5VTFZC?=
 =?utf-8?B?bTF5VnhGTVJFdktOTFBGOGlPaXlNdTJ6WmZaWThnK1k1cVFvNmNPRzQ3QWVL?=
 =?utf-8?B?MHNDaEYxdXQrMVh4NGlYTjVCVGZuQm81eTZGa2hLR2ZqaE1wcmtGZHRYN001?=
 =?utf-8?B?L2VyWSswdDlYUmVkMzhtbGNrQVptWDIzemZtU09JbWs0d2tTZVl5OUdnZ0Er?=
 =?utf-8?B?cjRWeU5hL0ZBSzZ5dmdNaExQWnkrZFVVVm5FWlNFTmo1aVlxYitNY21peE9M?=
 =?utf-8?B?SVppQng5N0E4THNQeWxkdEI4Vlg5aE80ZFhkZEMxMVRHR3dWR1N2RUtvLzdv?=
 =?utf-8?B?cEhsUGZuV25iZ241VHhPQ3djUmhObUtHNUpiUzU1TGhCbGxsdUs2ekpFcHFo?=
 =?utf-8?B?bFR4R0haSG9QQ2UyZ1ZFODBReE0wOURSamhCZGliVWhUcVQ2N2ZXTlpiSUxT?=
 =?utf-8?B?d2ZPckV1ZVZwMDQ5NjQxdWZ5VStjZHhhSWtvT2Y3ckJRZEdCc3N5bUJwQlpa?=
 =?utf-8?B?MmhVU0RNM09lUkRXVEdKU0V5SVlpMTlvSWE4QlMwelpNaDVJbmNYT0pqb0hv?=
 =?utf-8?B?TVBSemRhdUp3em1LMUU5MVh0cWdROUJ5TTBxVXNlOEkrbjh5b0d3WnFMS2Iy?=
 =?utf-8?B?Y1orRkVKaUEwZTVFZHhpMzl5V1FMMGtYRWNET3B0Q0IxSjlCUDRBM1YraGRV?=
 =?utf-8?B?Z1pGKzFlUHJVdzgyVEJOL2U5NmJ4clF2VEZMQjR4ZDV4U2pGT3pQRkJMV3FL?=
 =?utf-8?B?cFV5U1RoaG9JUVQyQkhSRE5ZQWp3cVhCbWZ3ZGRhZWR2TDdVZDRheCtrVk10?=
 =?utf-8?Q?33JX0/w1013t0YNEGt+5bLak3?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <E459949A19D5574C95A2578D8061A313@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da21f354-6835-46f0-6880-08dad22a7ec3
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 16:55:18.3385
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BchClHJFcbeOGyYREIziMHQxlQtMDS+/H5WSaotpgCrufwO3xz1HYrOcmLoY2SleiJNR9FQGPRox62kE/UDEdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6321
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Nov 2022 16:55:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173983

PiBPbiAyOSBOb3YgMjAyMiwgYXQgMTY6MDEsIEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2
aW5AZ21haWwuY29tPiB3cm90ZToNCj4gDQo+IEVwaXBoYW55IGhhcyBtb3ZlZCB0byBndGs0IGlu
IG1hc3Rlci4gVGhpcyBtYWtlcyB1cyBwcmVwYXJlZCBmb3IgdGhhdC4NCj4gaHR0cHM6Ly9naXRo
dWIuY29tL0dOT01FL2VwaXBoYW55L2Jsb2IvbWFzdGVyL21lc29uLmJ1aWxkDQoNCknigJlkIHNh
eSB0aGUgcmVjaXBlIHNob3VsZCBzaXQgaW4gbWV0YS1nbm9tZSB1bnRpbCBpdCBjYW4gYmUgcmVh
c29uYWJseSB0ZXN0ZWQgYXMgcGFydCBvZiBvZS1jb3JlLg0KDQpBZGRpbmcgcmVjaXBlcyB0aGF0
IGRvbuKAmXQgZ2V0IHRlc3RlZCBpbiBhbnkgbWVhbmluZ2Z1bCBzZW5zZSBpc27igJl0IGhlbHBm
dWwuDQoNClJvc3M=

