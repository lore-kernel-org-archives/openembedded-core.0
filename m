Return-Path: <ernst.sjostrand@lists.verisure.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB80C433EF
	for <webhook@archiver.kernel.org>; Tue, 21 Dec 2021 13:34:57 +0000 (UTC)
Received: from mx08-00271601.pphosted.com (mx08-00271601.pphosted.com
 [185.132.182.208])
 by mx.groups.io with SMTP id smtpd.web10.5633.1640093696132448659
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 05:34:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@verisure.com header.s=pp16032020 header.b=X/bNSVo6;
 spf=none, err=permanent DNS error (domain: lists.verisure.com,
 ip: 185.132.182.208, mailfrom: ernst.sjostrand@lists.verisure.com)
Received: from pps.filterd (m0107398.ppops.net [127.0.0.1])
	by mx08-00271601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 1BLCXuKt029102
	for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 14:34:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=verisure.com;
 h=from : to : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=pp16032020;
 bh=QOf9BcNAAj6P/BjEtcWdMlVBqensSIL5PPvYWvbkDQI=;
 b=X/bNSVo6sRWMMpqdmjsUlU3tiMDMVtyLIyr/Y4eZEcmiqfI6T49HH77XPBr2oUPJPkMX
 biXdFYQ4T2CmfEH4hCf/XTfC0RCDR7BPeYYy0/2KGrnpXz6s16+X/SMgRrJfnd7nPgoh
 3lVmpMtbWWZogd2D+7hL/XAkwTww70WKGp/Xkw/tjte8/oIMoIhI4ed14xN2CvZgPcNL
 WHaHW7wdL8eSNkca/suZDDz7q2cM3sdCfKX0uruMIXJCv9Be6qn7W5TtxUZMomumVV+y
 NG6FmYTHoSuXeVYZ7QNF2P/euBdZoM+BgFL5nQ3jx5ChtNVYwJnEHJuUmOkGY1u5D58P Ug==
Received: from eur04-db3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58])
	by mx08-00271601.pphosted.com (PPS) with ESMTPS id 3d39wvkt01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Dec 2021 14:34:53 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8rk44tIDUaxu7T2NexcGY0eAFmjfZevEH8nqnxb7ZZZzmIU9y+DJIBKMsovngJxu+knx1Y8Rif0AwxAu6vOszW3G7h+tyYL+i0vhtj7hMD2jba+c2eeUxnMK4HnT1Z8ffWeVcWLCIc6IHtgR7MNPQIUciEDk8r5RzOFGkUbb5dLMvb9sKC5Tg987TdkL03juHoP322dvRnpblOKtp6MaBeG/WaB7TfsCW0ZqpOuqTQmTLZ/QFjVGIp0O7HNtoS6aja4E2Xc2JUu1CNR2WH/K9cW5DZFMkC6yL2Wk8RPs0pkfHwhMMOkdQ+9Iy1Vy371SZ56mFobTym5QP8nvwMeLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOf9BcNAAj6P/BjEtcWdMlVBqensSIL5PPvYWvbkDQI=;
 b=ZTxU+Vw6Cc5Wx/XC3eugB4MdNNPfnX0t5CJ8tnENsHYm+K5VojEAWp/JSQyqbdvMJhvkZz4aYR8YBkCMuDCHaU3IjcFzfxG3A/VmC/L3IadzVNPuJJsn+M48bdQQ6w2/VArpNJuxYV0jxSN8sWU+ne+pGWuWW1u3XldzgbDS9TzB1xviybm1Ca1uOjiIzscmDbFgm3bc2stbIpOrHPadT1DNLt5qo7T/2vrO2rBkt+AqmKf9Fp79TS5PzKQWsfXQ57CQsPlA+65kb9TGYhuJxq6U3vlxzvr2z9mwXVr1X6MuZtRp2Eh4Lj2KsUkTwpuXG9NdtiU6eT0KkEZIfu6LGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=lists.verisure.com; dmarc=pass action=none
 header.from=lists.verisure.com; dkim=pass header.d=lists.verisure.com;
 arc=none
Received: from AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:43b::18)
 by AS4PR10MB5342.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:4ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Tue, 21 Dec
 2021 13:34:52 +0000
Received: from AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::66:11c9:5d2a:e49c]) by AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::66:11c9:5d2a:e49c%4]) with mapi id 15.20.4801.020; Tue, 21 Dec 2021
 13:34:52 +0000
From: =?utf-8?B?RXJuc3QgU2rDtnN0cmFuZA==?=
	<ernst.sjostrand@lists.verisure.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [dunfell][PATCH v2] dropbear: Fix CVE-2020-36254
Thread-Topic: [OE-core] [dunfell][PATCH v2] dropbear: Fix CVE-2020-36254
Thread-Index: AQHX9msQgqOd1PvRhkKPZhedkdQ3T6w86reAgAAHgoA=
Date: Tue, 21 Dec 2021 13:34:52 +0000
Message-ID: 
 <c266b479d7567aabc0560d355ee407504d5ef62e.camel@lists.verisure.com>
References: <16C2B9B88AD918F7.22520@lists.openembedded.org>
	 <0ab160933ee8b84b5d5b0e648a2a20f8ed3367d3.camel@lists.verisure.com>
	 <AM9PR09MB4642921897485601CE80186EA87C9@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB4642921897485601CE80186EA87C9@AM9PR09MB4642.eurprd09.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2bc91908-030d-4606-7281-08d9c486ab1f
x-ms-traffictypediagnostic: AS4PR10MB5342:EE_
x-microsoft-antispam-prvs: 
 <AS4PR10MB534236D083C30A5F1CB81F98CB7C9@AS4PR10MB5342.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:849;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 T6s5OYM/DuCdfbpQRzA5xi1ekjPB4lQGsc6dCQ7BgelfBFtkiKgRXRYzMRuHYcrF0Hxkghdkxxdw21JasVtQlEXHWCarFlvXnw0Vkso32fVPWniIaB7daLCNxJ+7AtdM0rOK1fgj1R3ngY9OyiiFW+8zFJ527/zf4ulaFV4OmhDzKf9kc3V5IGARWZIOK25OYsmiMbekCKjwntPMYOhG8tPXr+jfAG9DKYgKYwsVWVReiBiNPmW0K9eg/DxKRW3ZrgCJKk/hM8EGzW6y6CVzKrTXAlXmi7fJsaIrA/Sw7uhtTWVoICqUJ8Qj9xCU1qwm34IQM06+N5+QTLfKlSr9AzmuAR6295Rj2YZuhH+BI5SV4JGJfKMf9/l9rw31WvAoVKLCY65rhqb8/tXqbxPHYQ44iZEH7Ly3G/owgNNz2plmEbzxw+1ZvqzOy7YCPbAjNxN2c6FapTxWQy9yG3DZXWYFKl1aPrknI6kfdgOyh3WKMIp++6APDKxiFqVtKPrx84F0Wq3sc5GlB+3n6S0ve2++c2qKM3XKc4jNmPZGoM0bZSNhrteN8HB2CO9UX9EIPGg8a0fAP1fY0BaqxIpAxsRMwpaQt/MyDjdA/Ojc2KcictOHsQyOxcpKg1wyyYhi3Q/6iew55PR2Yig35OkfbPUi921TZ2baOFtB3ksftPOf3tW35Bdm1k2RAN2UUHl0l+BXCAfl9wZo6NbCLKd82ldmppHmALkVghdh3unYKMzU/KSM6mPehgcWP6UmMqmjCLm1YxEC1GnAh4jN0BNUhRkR06XCQE0lHPe4N881BAY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(85202003)(66556008)(91956017)(8676002)(6506007)(26005)(76116006)(64756008)(66946007)(966005)(71200400001)(316002)(122000001)(38100700002)(85182001)(186003)(4001150100001)(6486002)(8936002)(6916009)(2906002)(508600001)(4744005)(66446008)(5660300002)(66574015)(53546011)(66476007)(38070700005)(83380400001)(86362001)(2616005)(6512007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MGlxa0JwUno5ZDlEeE9ZYUROb1VEUkNkSWxpc0h4VXVWc1h2ZWFqVmx2UEpD?=
 =?utf-8?B?ZE02NXFsVStWV3lDenRZaWxYTzVCTzh6MW5FQUFjOXlHTE1FRE9rRkE3cVFM?=
 =?utf-8?B?MTNTZ3BnR2FNWFpGcUQvRGdTNnYraC9LOVljTkpWVmhvTGtpUUlPYVVJUjN2?=
 =?utf-8?B?Rm0xSWZrc3c5MW9oMUNMV2JlaDFlNUk4SXB1aGFLSlBPMjk4RTI5UWdHL2No?=
 =?utf-8?B?MDBRMXA5V0I3Ti9CbGRsSk9UZG40K05RK2hmbjM2aVhScXJKQUh4UXptcDBR?=
 =?utf-8?B?L2hwNFMwbm4wb0xsS1d4MXBjZDM0aXNSd3BBYWdmc0NyeDV5NEZNNW9ERFZh?=
 =?utf-8?B?RmRVQm16bXk2WEsrZnp5aFZCZURmQ3d0ZWZmTkV1dzNNZExRU2xmOERuVzV5?=
 =?utf-8?B?UDV5d3huZkNEWHhGN2dudFV2WlFtWVZKR0hZaXNHQ1N1RkNqa1lZL1I1a2FB?=
 =?utf-8?B?aC9TZEo3N3pNVVd1Y0V3NitpT3l2SUFxUi9kTlQ5SVVhWTlaZGUzVmlKbnNM?=
 =?utf-8?B?cWJFYmQ5RjFNd2RKemVCeWFnbFVSdXcvSUZ0ZG9GTy9hcXRXNUprMXovMVJK?=
 =?utf-8?B?UDdrQVY0QkNpTUYzdE82b2hrNDNFL1huYUhnZjBWTzhBQ2p2dEw3clhWY0Ix?=
 =?utf-8?B?SkFXcXBTVjJkbGFTQUQvYjMvYm1jcmQ2ai85VlJ6dzdMN1lMRnFoTjJhU0Vq?=
 =?utf-8?B?M002SWYyVkM1bC9wMDFIUitRb1orejlYK1FmQlRrWVlvR05QcWphS0VEdjVP?=
 =?utf-8?B?dk5IbVlkekFnNFpwVGpRYkNFcWwzY3c2SGo5UkhTRzhURzZEYWplNUF3bUM1?=
 =?utf-8?B?cWtlMzdnd0NHbUVXMEdEc0dycnhLdXhsSktjeXJEbGYxaG9kN1NXV1VDZzA2?=
 =?utf-8?B?SVVjU2REekppOVZpTlk1K3FiUlI3NzhaemVnZTAwYWZxQktpYjdzVW5JU3hT?=
 =?utf-8?B?VGp6NmNwSW5LMlB5YnFoZUdTVGZhVjV1YzhlQ05KVndYanNZRW0rTWVZb3hl?=
 =?utf-8?B?KzNJVklwSVNSSGZhc0VnVThNUC9GWjg4c0ZYZlB3WDRXTlcxLzh5bU1Hd0ZH?=
 =?utf-8?B?bVpiZ2NNZlNoYkE3R3VCWGdBWExxNlJjd3I0NzZCb3Z3Ry9aV3JCR0RGbG5J?=
 =?utf-8?B?MDB5RTFlYVRYR2JXbllBQ3FsUHlLM0dMNloyZGR4WWRQWitCVEpZYm1QUDBY?=
 =?utf-8?B?ZDRVTkRjd3MrOEpsdGRHNnBmUzNDWDVxa1BhNTh4bDFtQWxiVFAwODV3enhr?=
 =?utf-8?B?T1dlTEV3cC93V0lCeHZYdHJPSkJCY2U1UTZhM2tHVWdvNjRRMkIrL1JJWEYv?=
 =?utf-8?B?QzUveFQwMldZUVdIWUlJNUkraGhrRURSREdZT2twWnJUZ0VQRkhId0tMY1JX?=
 =?utf-8?B?cDNYL1Y5Vlp0eUQ3Q01xcEFOOXhZMnRWazBrNjJDSnhPZTc4UXZIRHl2VjRD?=
 =?utf-8?B?aVhvTmtuYjByVEN5cHNVR2lSRzJ5cE93dmcvZGluMjdmekJQUmNuMmdSQmhm?=
 =?utf-8?B?WGFUandpNXQzRi9PM0xIdkVEaUI2Z3JaeUJ6OVhCMXJFbmJMdFdSV1Z5ZUc3?=
 =?utf-8?B?SzBORHJ2UUVuYTF3ZWJwNENSWWlNbVhuTm1lZzkxZjJsMDl0eU5rWWtLZWla?=
 =?utf-8?B?UlBLWURKQXAyS2x1ZjBBcVEyTUY0YVNDT1dUbDI1TFFGSFNCVzB5cTRLQnFx?=
 =?utf-8?B?b21mcFpGUElRd1RHbTlkMkEwTVlUbDVLWmthUmNNenZuMFhNUUtIRCtFR0lX?=
 =?utf-8?B?b0xyT1VCRzRVSmp0K1o5aTlzclVWVXFUVFQ2cjNtWDB1Zlg0VzByeVk5QkhU?=
 =?utf-8?B?bkFsNXpWNWgzNnZLckpxbEdGMnJleVFUdnk4SG9SNHlISUNlL0VHbktOMnFD?=
 =?utf-8?B?ZVFsMm11VEZJNldjQ21RVXROWWxoSHVIVFdseTlPaFA5dUx5RE5uUzRxWGd1?=
 =?utf-8?B?MkpmM1F2MU1naUJCem5TSC9Ebk1Yem1kcFN2bGlwQjMxWE9YckdjemJ1MkVR?=
 =?utf-8?B?RndOZFpPcXh1bElnbnNzUDhLMlQ1SUQ1bzZsOXJKSjlTeDJIRzRaT3lnUTBJ?=
 =?utf-8?B?b1ErRHhvNDZrV1ErM0llV0NacC9pSVBIOHVUaU5Tcm5MdUZrZ1BDSUNmU3Uv?=
 =?utf-8?B?MGpXdEcyV2FOYy9qMEx3ZHMrUUVGbnhWcmZwbmp3bldPMnNOalNQUllmc01x?=
 =?utf-8?B?NmFyMkcxRVFFMkVIbDdDZDA4UzdoclMwTWxtOU1IV3V3M2dReGFKSjZIM2lD?=
 =?utf-8?Q?b/6/I97iXOYF/xo1RgJjiC/pbOTzTTFy7OTLZ6smGE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <29D6CE450B61554F94A3699F7935753D@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: lists.verisure.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB5132.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2bc91908-030d-4606-7281-08d9c486ab1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Dec 2021 13:34:52.4490
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3055fa7f-a944-4927-801e-a62b63119e43
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 dniXChmLDGjIMxEOzkBNrsAVhZjPKi24ppR9dy6AGxBbNHJOayu0dpYHc/DjWgf8qlr7bui/qWNPNTfTqUKQlVCQkx/yD3KYhyUUgoELc2Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB5342
X-Proofpoint-GUID: cLZ6kikdyzNhsBi-AkH9S9OTX6-ow8r8
X-Proofpoint-ORIG-GUID: cLZ6kikdyzNhsBi-AkH9S9OTX6-ow8r8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-21_04,2021-12-21_01,2021-12-02_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Dec 2021 13:34:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159918

T24gVHVlLCAyMDIxLTEyLTIxIGF0IDE0OjA3ICswMTAwLCBLb25yYWQgV2VpaG1hbm4gd3JvdGU6
DQo+IA0KPiBPbiAyMS4xMi4yMSAxNDowMiwgRXJuc3QgU2rDtnN0cmFuZCB3cm90ZToNCj4gPiBE
cm9wYmVhciBzaGFyZXMgYSBsb3Qgb2YgY29kZSB3aXRoIG90aGVyIFNTSCBpbXBsZW1lbnRhdGlv
bnMsIHNvIHRoaXMgaXMNCj4gPiBhIHBvcnQgb2YgQ1ZFLTIwMTgtMjA2ODUgdG8gZHJvcGJlYXIu
DQo+ID4gDQo+ID4gUmVmZXJlbmNlOg0KPiA+IGh0dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19o
dHRwczovL2dpdGh1Yi5jb20vbWtqL2Ryb3BiZWFyL2NvbW1pdC84ZjhhM2RmZjcwNWZhZDc3NGEx
MDg2NGEyZTNkYmNmYTk3NzljZWZmX187ISFCRkNMblJERGJNM0ZPbXchcWU5VVlyQklQRWM2blBJ
ZU91VFcwZTBoVzZfWHdMMFhFNHZXRkZVZy1VZVFjeGl4WU1SUV9fUWxsUlREOUl3ODhIMWsyT1dt
MGckIA0KPiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IEVybnN0IFNqw7ZzdHJhbmQgPGVybnN0LnNq
b3N0cmFuZEB2ZXJpc3VyZS5jb20+DQo+IA0KPiBUaGlzIGlzIG1pc3NpbmcgYW4gVXBzdHJlYW0t
U3RhdHVzIGVudHJ5IC0gaW4gdGhpcyBjYXNlIHRoYXQgc2hvdWxkIGJlIA0KPiAiVXBzdHJlYW0t
U3RhdHVzOiBCYWNrcG9ydCINCg0KU2hvdWxkIHRoYXQgbGluZSBnbyBpbiB0aGUgLnBhdGNoIGZp
bGUsIHRoZSBjb21taXQgbWVzc2FnZSBvciBib3RoPw0KSSBndWVzcyBib3RoPw0KDQo=

