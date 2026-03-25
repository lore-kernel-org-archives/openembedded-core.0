Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6844C106B538
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 13:27:06 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22572.1774445224037732678
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 06:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=v3rlyAQA;
 spf=pass (domain: ericsson.com, ip: 52.101.66.53, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E9vdJAKmddDRtFG1ZpfAY+NfLK9Cls+CYCDweOAM1p8iYR0PXLG8Fx7akEzgkJ54OK8n/r49t0lA8uQ9PHZqcndOvmIOCZbEjTVXpEEhRbeu7cXkRwt+0bB4hk6wE4CrRYRhj6RIhcLXED0eIhhcW4wLoCd8HBD3nrgi9wKFnSpH4wHfuaeTMHeNQn2NbXiwyMkh8SPj3GG8bnILe/2PkuqEVk+nUQYHbdebqnXdVWkoI5BFwCB9nhT9AaWJE3EIGvTpVM2SgmkP2KJGSokZFgd2UlK5Y0+kl4ZFCduwyB+pqoeJxMrPK1yOLPD6PujLtkf8V6AL98W3AuHtPOe0rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BVBiQvCY83BNiYvEYgyCallw+wndYBMC3rquPgmjRo0=;
 b=LR7LVKjLrOh33hmlTysiKI01B3LGlSp86+VZE9Nka0CRZx+DCXomJgPlOV34+lcqjXal1rc+z6GKmEAIsEOiNbMiMQ0pfo861wkD3fbWV1Q8KyJdsWn9F2p8YS8FN9W0Y2BkE1b5xtUb4UD6EofK9Qy04FINlaKXRfZ9bERu8rQ4bekPVjVH4/0mqpsGNwxwcwAviD4NsSeKo5uISMaqIDxPiZCHADzofxcdAHASDiHSp71doVJykNVRgX78KzGSqhizATaC01EmMLP54EN7nXmYWgxfC7zMK8NnuLy0NxRsrXg6mPAwAnw4I5fEJ7OmnatiN5v8jFSymnFCsZgQTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BVBiQvCY83BNiYvEYgyCallw+wndYBMC3rquPgmjRo0=;
 b=v3rlyAQAWJU6JHo23Tjyj17OUEFhgQta9TQN7UZPV+T64n/LJTTec9jwebQHmcVEXi690BkZAD4hG5pRjF1paogaY7ASSFxKm/a8b7Y6OLFL9SgfQCXkmm8NZKgQfPsZlnh7ledvr9nmzk/vbOQcPmaPuF/81AK1Eba62dboFqiqM2Jj/DvAnwIaEAcj3mW+mn37k3OH9jiQf4dDQ4mZgJ/3ymIagVpoPwpnXTwMnicCr2lsi4EImbXnElYcqrJJ/QOTKGrLgJ6RjCEArkbZqZZGYGHr1Cbw3dfyAU+cO2cuGVpZcxreiOJu6DzU6ofCZEMjW+xGq7vTf4Fw4Krihw==
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com (2603:10a6:102:4af::6)
 by DU0PR07MB8883.eurprd07.prod.outlook.com (2603:10a6:10:31a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 13:26:59 +0000
Received: from PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7]) by PA3PR07MB10721.eurprd07.prod.outlook.com
 ([fe80::afd3:17e5:1663:7ce7%6]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 13:26:59 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "pratik.farkase@est.tech"
	<pratik.farkase@est.tech>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>
Subject: RE: [OE-core] [PATCH 1/2] python3-kirk: Add version 4.0.0
Thread-Topic: [OE-core] [PATCH 1/2] python3-kirk: Add version 4.0.0
Thread-Index: AQHcvFBzXesVo6Ev5k6yFV5vi+0K1rW/Lt+AgAAOcWA=
Date: Wed, 25 Mar 2026 13:26:59 +0000
Message-ID: 
 <PA3PR07MB107217582CEBAD8080A067C1A8A49A@PA3PR07MB10721.eurprd07.prod.outlook.com>
References: <20260325084021.3915804-1-daniel.turull@ericsson.com>
 <CANNYZj8MsmLxQwwZCFMoH1Jfre_-UTFVZjP011AiaQk-x-pWQw@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8MsmLxQwwZCFMoH1Jfre_-UTFVZjP011AiaQk-x-pWQw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA3PR07MB10721:EE_|DU0PR07MB8883:EE_
x-ms-office365-filtering-correlation-id: 167b6805-3bcc-4889-6faa-08de8a723165
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|376014|1800799024|38070700021|56012099003|7053199007|18002099003|22082099003;
x-microsoft-antispam-message-info: 
 RjX/KRchooVWPqzHhDCl6wtLe11q2L/hsdV3rUPkAqg+HFwy9E0lmq/N7jDJUPyINZR73PhTVkcDUmL1YnkVnYbK6eSEfYqHwtz78+zB28r/KsoeNwDpdetqjAG7V9wyTPH6nazXQLJQmYuFvM+PX4FUcfPjQMRDoKCDOZRSQuPoyi7UM+YWRo93cGsupXKbwV1z7UUa+brKf0W38muz4/pPvKrU4L91SAvJCfFl53exRssf9ru6anoJLRPnogH0ChzvNYPbIDybyDWbtExshw4PK/DW4b6A9bO0M02gu1ebcy6aPRDz4X1ca67eRo1JuIk3oBUzfvQux5/sSyxh1S8i9xSHqxlfp+B0VQRiaURqi2xu20yqNthS1ifnDfpykrcAA/SFkAw5FguO+Et+WjvsM7IZnwkCcs9MWgPxs6SRGbshw0xpD08XxBkL4VQPtgSSCs6mvqtdHSrd8Eri2DOoPGeow5WIZOMzrl8xOEaFQ1oz4LzkhEXL0aX6ItVKRMCLRqw4VT1FrmU8KXLmwqtJF2PcQaU8VmhjedclAA3sV/EaKwu/1FXcxSR7YVbEQljCeEoiq4SEfQ9itzk57bfd1i0SrUDj2oh2XRWGCE/+88tjTAnUynwk8TiszHetfUjA2Xs8oUbjsIPP57NO+aWZuHzdDAUbn6Mf2XcZD684AQbqUwhJQFQT6wH0uWEWcpUAEk4ONDj//vZwFoClZYXpNzu5WqbtDBQGpnP+saBPIqC4NIcvTxGV/XKFGEPU
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR07MB10721.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(56012099003)(7053199007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MDdzV3VhUG5iTlJiNFhOYmcyYldKN3VkZ2xFakZQczlmbWJmWXBjaWdMNkRW?=
 =?utf-8?B?VktrWktsdmYrS1JXSzc3SWRuYzZJTEVFNU56V2tLaW1Rd3pYK0U0bHJxMWhR?=
 =?utf-8?B?bFhlQm94WVlpd2FEd2ovWlNKYWZsVkxGL2lsZ3FBNEZocGowaGQxT2xhOG9E?=
 =?utf-8?B?VHZVMVFNUko1ZVNJSkFrWWJzL05uRFNBU1M2VWQwZzBIZDk0VHIyMUg1RHJt?=
 =?utf-8?B?Nm9FbWpjajhDdEI0THB0emtZTlg3cEdjNjJFTlNzdWIvMnZYWXYwVGdvT24y?=
 =?utf-8?B?UEFWdDV2NjVUYTg3bWZ0N25aakR4RElxaStUSjgxQURYRFluemJ3Tlg1bE5q?=
 =?utf-8?B?RVB3eS9rRGpnN2JxZU9GWkxoWGd6aTJtOTUxWGRWckFVT0h1STZGVVlmR3hx?=
 =?utf-8?B?QlEzY0JlSnAyOGdMb1Y5MWV3OXpzQzNBZ2E0NzIzTGl3eXdYNnJ3cXh1Zk9D?=
 =?utf-8?B?R045M2FOaWgydi83RFNFNHF5bENtZndWLytYTGxUUUdXa1Y3SnJ6U1lKdEV1?=
 =?utf-8?B?QnRBNGdBTVZpbkNGbHMvNklEaXhqTEpmdjBDam1GRW5rU0M2UEhEU214eGZJ?=
 =?utf-8?B?ZnlxNFFJTlRsSE1xWGZJZVdDY3lJQUVtcStRR2NpZnVKYStDYUcxa3hSS1JS?=
 =?utf-8?B?MERPUnROUDFjeGhoVVMwUGt6RUhUekJUZDIxbHMzUUI5Q2g3Q20xWStVOHYr?=
 =?utf-8?B?VGgwcnFpY212MW41bWIzbmZoVTVqcitUTzZScEJhclp0TWJLZ2pReGpiWGxP?=
 =?utf-8?B?c0N0eTVObWxwbUZRT2N5ZElzYlgyNVNXbnM0eFJrQmlrZVRSclhnam9QcHgr?=
 =?utf-8?B?MFhNL2U0V1ZQNkZwRUNRVnJRNFNCLzFYdndrMXpNOG8vZytxSVdLQXBtQmlu?=
 =?utf-8?B?SjBEVktuRUxkK1ZJcUg0cDB5V1RqdUQxdnNCZjkvYnBNVnFZMERmVmZlUy9I?=
 =?utf-8?B?TlVPeVZGalV4YiswUVdCQ25WQXdPVC9qaXZQNHdvMGNtSHEvU0drUEwzT2s5?=
 =?utf-8?B?OEtHZXBYbXZKaUloaFNQS0ViR3RXdHVKb0pud1NKbnUzRkVMRHBXU016RHNR?=
 =?utf-8?B?S3grOFo1UVFCOUFxVXpYNjlOWm8zNW84cXVPeEZ0YUpLbHJ1Uk04SWFCbzhn?=
 =?utf-8?B?dUtnU1RwMElHVm8raE1YYmcxS1kxRUowSU9GbTlDNGlqWHFOQnNtVFNuTGs4?=
 =?utf-8?B?QllzdU9mRzVpajJYSENMUFhrYWpvZUw1cUJSWFlCSUlKRldvY1JVd3ZkVUtE?=
 =?utf-8?B?NU1WL3U3c1lWeS9KWUxsT25JTStBcVRZNnVIY2VCdTdtTkU1RmFFNUhyYkdi?=
 =?utf-8?B?bzQ2dEtTZHY5OENHWHcyTnF5bEZUcjh4UTBrcmhXa1pnZTlCWjJzRzNWekV2?=
 =?utf-8?B?QStQTmFIMG9tNmhMWkZZWU85NGFvaE5VOUw0NFNEZ0duZ3JhMDNnREt0NzI5?=
 =?utf-8?B?K1d6MEx5WlB6QTNJaHZvdlJ3eXduNFIwSmZneG9LaEVoN1NBbFR2Y2k2aTho?=
 =?utf-8?B?MVkxTlRmTmE4My9lWHF5L0dZOENzVnlDc09ickdiYmxaaEdHazFIMFE4dWl5?=
 =?utf-8?B?T1hWM2Zlek9zczdmcHNkbFpBbGFxRVp5Slh6cWlWV1dUcjVCR1RpZTh0NVBY?=
 =?utf-8?B?MUlsMmRUdW04bjgyb2VOZEtuQ0dKdy90YVJ6d09wU2NNQTBTYnlsT0RqSGYx?=
 =?utf-8?B?NXZvUmFSOC8rSnFnZW9MTnEyRnUvYU0rL05rU1JKNnAxSGM2cHY4QVc1di85?=
 =?utf-8?B?azRTV25LcmNXNU5RUWcxVHhFbHVkU2hnUmFXd043Sk9DejR2SVZqRlN0RkhR?=
 =?utf-8?B?L3dlNURpOFA2cWlQVCtBMmxvdTVxY0tXNy9Ucm55RVpiNSs5Y1BXK0E0SWpG?=
 =?utf-8?B?QkN1SC9vU09jL2t5aGl6RGlQOFkwZXVGM0hrOUNqdi9PeWlZZmxRKzVZSWdW?=
 =?utf-8?B?WFB6RldHb2paNHpQTXUyVEFQcWUzUFJWNnhPOEc0c3JXdkkwbS9uVGJPR1kw?=
 =?utf-8?B?WXNWRVBlcjRSaXpLKzhtV2NzeGlDUzZPQ0p0QzVjc3VCZE5sYStVZUNMZTRk?=
 =?utf-8?B?WERhSHloOWpIOWVyOGVZd2FwNUJsemIwc3VheGpJUjR5VFB3TkdkdEtEU0Na?=
 =?utf-8?B?QWY5dXg3RDFZYld2d1lERm4weExaYlZ3VWRjY1hzdHdBa2p5VTJmblp0cVpC?=
 =?utf-8?B?eWdpN3ErQmM5SklLY1JLa1c4SURvL1dDVXIzV3lLQVNYRnZndzNWaExTbW1K?=
 =?utf-8?B?aEp5OUxiZzdPcXZ2cXAremJEWldSTGt4SlZUdmxsR3kwSVFqeFlxZ2dsZ0FO?=
 =?utf-8?B?RUJJSU0raS82S3lDV3RQdW9xVGVId3FrQ1ZvL1E5R3YvOVFZTjVpZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA3PR07MB10721.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 167b6805-3bcc-4889-6faa-08de8a723165
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2026 13:26:59.2401
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0/XEKDBaPZoZEI7pmIAvdLhlv/2w0AgMDLF6wROTHjkB2D7+DQ3zrkVBE5+jw7kILo+Zwztu/9u+jTTVt1uQMbBSjjBQDf0WpNpk6UxnUJI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR07MB8883
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 13:27:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233912

SGksDQoNCkknbGwgdXBkYXRlIHRoZSByZWNpcGUgdG8gdXNlIHB5cGkgaW5zdGVhZC4NCg0KRGFu
aWVsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleGFuZGVyIEth
bmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+DQo+IFNlbnQ6IFdlZG5lc2RheSwgMjUgTWFy
Y2ggMjAyNiAxMzozNQ0KPiBUbzogRGFuaWVsIFR1cnVsbCA8ZGFuaWVsLnR1cnVsbEBlcmljc3Nv
bi5jb20+DQo+IENjOiBvcGVuZW1iZWRkZWQtY29yZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnOyBw
cmF0aWsuZmFya2FzZUBlc3QudGVjaDsNCj4gcmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9u
Lm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNvcmVdIFtQQVRDSCAxLzJdIHB5dGhvbjMta2lyazog
QWRkIHZlcnNpb24gNC4wLjANCj4gDQo+IFtZb3UgZG9uJ3Qgb2Z0ZW4gZ2V0IGVtYWlsIGZyb20g
YWxleC5rYW5hdmluQGdtYWlsLmNvbS4gTGVhcm4gd2h5IHRoaXMgaXMNCj4gaW1wb3J0YW50IGF0
IGh0dHBzOi8vYWthLm1zL0xlYXJuQWJvdXRTZW5kZXJJZGVudGlmaWNhdGlvbiBdDQo+IA0KPiBP
biBXZWQsIDI1IE1hciAyMDI2IGF0IDEzOjEwLCBEYW5pZWwgVHVydWxsIHZpYSBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IDxkYW5pZWwudHVydWxsPWVyaWNzc29uLmNvbUBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPiB3cm90ZToNCj4gPiArU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2xpbnV4
LXRlc3QtDQo+IHByb2plY3Qva2lyaztwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyIg0KPiAN
Cj4gV2UgcHJvYmFibHkgc2hvdWxkIHRha2Uga2lyayBmcm9tIHB5cGkgdmlhIHB5cGkuYmJjbGFz
cz8NCj4gDQo+IGh0dHBzOi8vZXVyMDIuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20v
P3VybD1odHRwcyUzQSUyRiUyRnB5cGkub3JnJQ0KPiAyRnByb2plY3QlMkZraXJrJTJGJmRhdGE9
MDUlN0MwMiU3Q2RhbmllbC50dXJ1bGwlNDBlcmljc3Nvbi5jb20lN0M0OThhDQo+IDg3MjY5NmNj
NGY4YmUyNmEwOGRlOGE2YWViNTMlN0M5MmU4NGNlYmZiZmQ0N2FiYmU1MjA4MGM2Yjg3OTUzZiU3
Qw0KPiAwJTdDMCU3QzYzOTEwMDM4ODk3ODcyNjQ4MiU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhl
eUpGYlhCMGVVMQ0KPiBoY0draU9uUnlkV1VzSWxZaU9pSXdMakF1TURBd01DSXNJbEFpT2lKWGFX
NHpNaUlzSWtGT0lqb2lUV0ZwYkNJc0lsZFVJag0KPiBveWZRJTNEJTNEJTdDNjAwMDAlN0MlN0Ml
N0Mmc2RhdGE9bFhzOUN4MFl4aXJDbllzdGdRUkpVSjNqJTJGcll2Z3oNCj4gQzJMa1owT2dUYnNh
byUzRCZyZXNlcnZlZD0wDQo+IA0KPiBBbGV4DQo=

