Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2AC5C2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 11:13:13 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.40])
 by mx.groups.io with SMTP id smtpd.web11.48672.1747653190838362465
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 May 2025 04:13:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=SkNE2Nzd;
 spf=pass (domain: siemens.com, ip: 40.107.247.40, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NlpBpi9hjp7T46bpIGvHHm66KvGwRFuxE+Hgp8tBrTB7epUbmUuP3NlecPLG0hlglZPakdfg0V82VZ3DTkucy+wqAcCpCUE7I9CRbglpqAVoiUL2tg02iiNFkjoXh6yv4CXeP2adQ4I9hkJcMiok3mFMs+ytMJe1LMTmvW48GhHAImMUGOuUxNFCoMn5UEfAcpDkypP0s7uX8mNeXDy2oTQMdVRTyOpsy9vOlp7AAJ+9lBGwg3EESvOWvTKdZDqocQv/TooPza874zio9Oj5Jn97Hch/FyolD++/D8BJ08s+SPivjnhsaFJT0QVS7Oo0Rmg5iTEd1PYnmNwl4H771g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJ91B72PSClspxzMkGIvjz5kMIL7+5hGP7aK3Iwpd1Q=;
 b=EDxcnZ8s7ZpESOKN9rnltJoLXs0tZMINQ/MHiqHVI+AeFgMj4zl3yyTIYih0pyWnn1nYHNDMKmg2AD9vnx4CMhIweqAFQ2ol3bnJYVBmbi/5XjwIFZI3qO3Y+2E9rKpllidm9U2nFUluZB/w6lof4vsUQTvuQh7BW4BJM1hxVL2B759R4YK9bmBCtnf0rwRR7BDqiyL+mpdMT4B9NfTosXAmQJaIPwIaZ/AxtILQiArRvLI2oeag47HByBjtV3k37jV7fSlAbCXm0Mwjf502XYG1K60l5r1n6AAR5hNR9qLxovCXPITrnQolVjIt37JpMN8eGrX44fZUCnK+9zOG8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJ91B72PSClspxzMkGIvjz5kMIL7+5hGP7aK3Iwpd1Q=;
 b=SkNE2NzdfRAVOdJ+BDg45roy16xKii5NB941QuopcLYIZRVg+vsrweefYW+dtoLwmshf3+6dWamUmVzMH2jPLxI/Usq79V/LbsunPBSf7wM5JF+28/njf01XmY0V9gUP4T9tweIma40Yf27Lpv62GAZJGGKh8fC2InPKj1veUiN/JCLcjNXTPYDyG5hCLdr8RmxCuHehSJL+NltAqcUfZEnqTtiJzNaroGBHdGRwEHyu8wSVMTikpLudJYezrUbP2FVNwNtKhpdgKAU7CcdHPTxJaRg8MLtS0V0Qs1YlXl4y67+A4rHJSPcSe2bWSvIBjT9Vrbe/tRQfMa5Ztj5LIg==
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::17)
 by PA2PR10MB8963.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:414::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 11:13:07 +0000
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda]) by DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 11:13:07 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: Quentin Schulz <quentin.schulz@cherry.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v3 04/22] kernel-devicetree: export dtbs to
 sysroot
Thread-Topic: [OE-core] [PATCH v3 04/22] kernel-devicetree: export dtbs to
 sysroot
Thread-Index: AQHbxQF8yRr+gtKaS0u22mEUhL3fH7PTpHMAgAYvhwA=
Date: Mon, 19 May 2025 11:13:07 +0000
Message-ID: <e1d34a9327cc85395d780ee785d80e134f2341d6.camel@siemens.com>
References: <20250514185225.162998-1-adrian.freihofer@siemens.com>
	 <20250514185225.162998-5-adrian.freihofer@siemens.com>
	 <b3bbb9fb-458d-4718-a19a-b188b274a794@cherry.de>
In-Reply-To: <b3bbb9fb-458d-4718-a19a-b188b274a794@cherry.de>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3529:EE_|PA2PR10MB8963:EE_
x-ms-office365-filtering-correlation-id: 7a24a668-fc44-43bf-84a6-08dd96c6222c
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?citqUFFqMHhZaWFhMWw2MlZHclZmdHJqSVIzYWk0NVZ0STFZNEI1Vnl5U2lN?=
 =?utf-8?B?VzU4cU5rRHVIKzNEd1VRenROaHF2RmdsSFRNUXZoL3lNSFV1NE1vbkJIaEdB?=
 =?utf-8?B?dWFkUld3d1FpbTJuU0pJcEZGem1kUlJ5dWR1ZGdsb25QY0JkUHo5VWJUUDdT?=
 =?utf-8?B?Z25pVFpUMyt2S2JqNUVUMkNEUEo0enJzZGZvb2lGMm4vdmVJNzZFeHFVQlZI?=
 =?utf-8?B?eXduK1hHdE4zNEt4bktLNWh0L2hzZ3JkSDVaelR2YW50N3pDeUJoNnJDeFJK?=
 =?utf-8?B?ZFUvc2ZNbkxFKzdESFBwSURoQi95dGMxR0JmY0lVdm5od1Y3ZlNla1Z4d2to?=
 =?utf-8?B?MFZYOEQ2L3Fxa1pIaW0ycVQ4RXg3bTBIUmZkL3IzQXloRFR1bFdWRFl2R2lD?=
 =?utf-8?B?Rk95MS9zUmdxWC9iTUIwb3lUczI0aGNQS2QyYnVFZ2xaU2g3djNDWWY1OGpU?=
 =?utf-8?B?OVcxcGdZK3UzemV6d0tLM1R4d2ptVVhNMmFzVVNEdWNlSXlZamgvM1lqY1o5?=
 =?utf-8?B?eUFmVHVDeU1NSGxqRGwrbStOc1JkQ1d1bmpod0NvcEJpZEZmQ0R1VFVNdjl5?=
 =?utf-8?B?SjUzYjQzK3VnQnY2MW90K29WZlV0U3pXQklYTnhJUzF2NTR4OE0xUEhhOWJ4?=
 =?utf-8?B?WW4wWjhXVUZsRTRtaEh1MlhXdjByZzNvUXJ6TVdTRW43U3RVVkdVRE9aZzZX?=
 =?utf-8?B?aGFERnNNY3NUZmhkNlRtd1ZMZFpQSk1FUTM5MmFPWm92ckRqMlNUaDNzM21B?=
 =?utf-8?B?aUp2ZUFrM1BoQktWYWg4RGJEWlhNNnliSVYwYkNZT0VPYVN3SzI5ZzZWVktE?=
 =?utf-8?B?Nk1DeUZ6UVlSVmdmdWgwN21ibFBqMWkrMWo2V1NaSTYxdjdTVkNvZWJFWTBI?=
 =?utf-8?B?ZFErN01pQ2ROdDh1QkJBaG1HYStDNVNhTEtGSGdMSHU0Y0FXeDhSRlUxcmdm?=
 =?utf-8?B?Rmd3RTB1QW9UZ1BLNEdya0REdXljdkg4eGZzWEErQ040T01SWTA1aGZuRlFK?=
 =?utf-8?B?bW5OZkdUbWZVZll2TmpPRVhGNkFIQ2VQd0gzdExxci9hSUZMbXhwWTVhWHJ2?=
 =?utf-8?B?akJZenNQWTNqNkd4U1IrNUhtdXdvRHRuRXJSUVhRVllyTGdtamYwaVNkS2hM?=
 =?utf-8?B?R1FVSU4rTEljTlRSVEQ0eGd4aUhjcmRST2MvbmdWbzQwWnBoaDdIVy9ucEl3?=
 =?utf-8?B?ajczOGQ5azc0RXJPTjN1cFk1MlB6a0gxNGkrLzBRMUlqbmdpSndmZ3h4T1NC?=
 =?utf-8?B?NjhEbnZIZEMraHBSZmQrZ0ZRdVphWnNSQVRwV2JoemdVVDVmdzFkT2JlSStT?=
 =?utf-8?B?Tk5KTDVBQjZ1djZZZ21oei9INzB5dkx4QVFtNnhPZjMxNWsrbW5ZaWUxd3JB?=
 =?utf-8?B?MTZzZlRVcVA1cC9KTmQzbENOZ2FjWFQ5cEdTWkdIcHVyNTZJZmdnS1EzMkEy?=
 =?utf-8?B?R0lqVndzNmdzS21LL3hHNXBlc3J5QmdOaHVnd25NUGx4Sm1mVWdqWHJKOUJC?=
 =?utf-8?B?SkkxOXowZUZFTDZ1RFZsMmd0VWdMYlZnY0EwUVJjdXJsQ2R1R3VCZ3N1QVBr?=
 =?utf-8?B?dHdtMmFQWmhMQjNxZGZiMVE4SlA5dFFKb0pHUkpFUTh4Y2NVOUdwWVlEc0ta?=
 =?utf-8?B?aTNWZlFqSUNyYmczTkZoQ2NhSUZhd0Q1aUwwMFY5cC9BUGRHWHVCUFF1Lyt5?=
 =?utf-8?B?NHhjSTJRN2dhTDZDS0t3NmtrRERUYnZiczlMcmlOemFmaXNzMm43dHhzdE9p?=
 =?utf-8?B?SWZkeTd5aEdyL0ljQXNHM0ZIWVBUakxZWlFSa0E4UkR4eGJuV2xMeG9pTXBl?=
 =?utf-8?B?Mm1UZUtNb09seXFFZ2lrVmUwU0VWYTZLV21qVlBiSDZpOFNKbjJHU0dWOXpD?=
 =?utf-8?B?eEFNb1o0UUUzcmtlRXZHeGJ6ZENGVjZEdUk4R0JyVWc1SDI2elRBVHMzcmp1?=
 =?utf-8?B?bE5rb2NFV0VLaS85WEtuOHUyY2dHT1gvSTd3SWpMOW85QVB6aG9YUkc3YVRj?=
 =?utf-8?B?MVN2anVGZnhnPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?L2VCaFYrdzdpcFBGcENndkErcDNhK0paYXMzajd4VXk1R2JsWTQ2aXc1TFM2?=
 =?utf-8?B?bFJJRnBRa2VjM1ZwVW1CQ096SWk5YjdUR3Nla1Uwa1lKb3c2YnFVdk1ITmNM?=
 =?utf-8?B?Wll6blA5RWtPNEJoYkFJRm5KNDU1VS9KZXE5WjdXTEQxb1VnSVJHb3cvcXdY?=
 =?utf-8?B?Y29uZi9LbTFBZ1ZOeU0vemZCeWpObzNpRmo1UU5LMmJBVHkyenNFV0YwYTkx?=
 =?utf-8?B?eWhzMFdSMUFjeDVQVzJaRG1NR09IUzloWHE0SXRHeXc0Zmd0R0dBVzBYSnFz?=
 =?utf-8?B?RmpqNi9aOVhQWlhWclUvdWRndjFIZTM0bUNEbXJ2cWdzUjZRRXI4RGRublV0?=
 =?utf-8?B?MVZodnNzVVo5MGVkalppZWl6VFZFRlNyM3J4Z0x0SUVVWlN3UERWODg2OWZJ?=
 =?utf-8?B?dllBUkpIUjB3R2pnb0crYzE0bENFaFVYS2RldmdTSW8zdFVSckNOMzZzNFN3?=
 =?utf-8?B?OTlINitKYmZhMGIyWlU5dlFhSEx4R2xFcGxkT01aUzN3cUkybWJjSUo2MlZx?=
 =?utf-8?B?a01sdVlnV2VPNTV4SDIrdEFGbkVGN2JMTUhzOEplUmRjL1RZUi9pUGduOWl0?=
 =?utf-8?B?MmE5bTZJbUoxcVZCZFUxVWJlbFNWenBDVjNka3BpMmk2U2c1akNoRW5tcjFy?=
 =?utf-8?B?a2ZTclFhWVJHSmFUclRDRmxSTTJBQnlkcnpTaEdpU2EzMmxzbG5POFpkMTNx?=
 =?utf-8?B?K1Jka1VrVHZRK0JKTHpjVWVnMjNQeTRRSTllWURFc2tuempSemdFRkd2WUZM?=
 =?utf-8?B?RVEvOXpMZFFkYWdFU3RtTUV1bTFSMUdZa254SDNhUVVzb2NJUTJrbHhnUE1j?=
 =?utf-8?B?TXg4ZjZ5dHNENDdYYUZ2MHphandGeE9wVUVpVFFZeHVZMzFOMDlOT21rdnQw?=
 =?utf-8?B?aWM0VDBoNzlEd2xkUWZxWE83TndTMmd1Y3ZmS25UWm8yb3VWWlpwR2JsSU9w?=
 =?utf-8?B?L1ZoVVZpSWRoTUk3dnBUZXByQXdaV3hNTnFNMjg3QkRSaVp2V2RrSGlEZElk?=
 =?utf-8?B?VkJPK2dDTDUzL3ZjT2NEK0daY1g0V3kyeWc5d2J2RnpaYWwwNUUrVU1XTHcz?=
 =?utf-8?B?RFJtT0ExUlErN1FlUW9jS05BL0toVUgrei82N3NuNkxpclJnRGFLZ2J4UzNi?=
 =?utf-8?B?T29kbVdKY3dJL3dYa3VVblhaQ1dRVDRSbkhUSDhwNUpER2ZWOFJqRmhsa0xL?=
 =?utf-8?B?Umd3WFFFMFpnTkpJUWoycUxxbWxqWFBhTU1CMlBaSFlTWGlXa2Ywb2J2RU5F?=
 =?utf-8?B?MjhGUWN0Ri9ORmlzU05LNXNoN202UGZ5dXRDdmNWMG16bE03YjE2VG9Md0RO?=
 =?utf-8?B?K0QxMFdyL1NwOWhEQ0hhd1NxVXBhenFCNHRTdjZSMkc1TEREWUdjaDBwamM2?=
 =?utf-8?B?cDJhRmxsWmxYQ0dwODl3QnZQYWJWNHJyK2kxaFhMNE1pSGxXVnk4emFXaUl0?=
 =?utf-8?B?Sms3UnJINjFFYlUwSytJamVSV3pVc0lNQitaOHFSN2owT3lvK0xsWDFYb2N5?=
 =?utf-8?B?NlE4UWoxNFFyTktLSVBZOWh6SExiSk5CZkFYMWM4VElrVmt1NjYyN1lnUmEx?=
 =?utf-8?B?VzVZMk1DYlMvVVpESWw2NW5VelNMRzViUUdPaEowZHdFaXhUYmQzbnV0bUVC?=
 =?utf-8?B?RHRqQzRwTGk3MjFpVnRVWW5mZllQMXlRZDRvbzd4TUdSeFp3U281TnNPdlIx?=
 =?utf-8?B?K2F5cWRSVE9wcnpFUjl1WTNNazRrSm11Y1N1bG5sSjR0SGlQV0xIQzRIVEdh?=
 =?utf-8?B?N0dUUlkrQVBlQXBqL21TdURQTUliV3dQb0hMNzNGaDczN0NkeDNHajQ5T251?=
 =?utf-8?B?cDhsQXI3cHdZbVYwMW5JeFZqOGM0VUhuR2NKekZrMitQRXRuYm56Zmw4cHYx?=
 =?utf-8?B?L2VtT3ErT3BNMXg2ZGxpaEIxTFZMRk41TnB3djN4MUxldnBMM2VhdlpBMmxF?=
 =?utf-8?B?cytkb1pHeXEwTUp1aUx0T0k4QS8rcXlzWmx0MW9qcVlyRHl3ZzR4VU9LaVlO?=
 =?utf-8?B?YWV1MFZXT2xBb1VDdTRZMEdBVnRhaEhOTHQ1N09zc1lCN3FwK0tIWWZkTVNS?=
 =?utf-8?B?WXJCelRtQzk0a00za3V2VUxNanB2UlNRQXFjcTM1b2dKdTZ0c09KeG51TURn?=
 =?utf-8?B?TjJ3R3JmNUtscTMyRStzckhibHNQdHhRNEZpZWNLeTVEVmNDYk5jL08rbVhO?=
 =?utf-8?B?Mmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <43DAE7E688994B4FB411D282D0DF2C69@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a24a668-fc44-43bf-84a6-08dd96c6222c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2025 11:13:07.6883
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UPhsfFm3Q14vCCG/rXABtBE8uV+xsTjAKID3giATNMg/XJmuApOwlZlLqS8yAQb1/g8dVbANu7S5w1VCFnXlraPq2GmsmGmKIsEFMnHIKqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8963
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 May 2025 11:13:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216853

T24gVGh1LCAyMDI1LTA1LTE1IGF0IDE0OjQ1ICswMjAwLCBRdWVudGluIFNjaHVseiB3cm90ZToK
PiBIaSBBZHJpYW4sCj4gCj4gT24gNS8xNC8yNSA4OjUwIFBNLCBBZHJpYW4gRnJlaWhvZmVyIHZp
YSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnCj4gd3JvdGU6Cj4gPiBGcm9tOiBBZHJpYW4gRnJlaWhv
ZmVyIDxhZHJpYW4uZnJlaWhvZmVyQHNpZW1lbnMuY29tPgo+ID4gCj4gPiBGb3J3YXJkIHRoZSBk
ZXZpY2V0cmVlIGJsb2JzIHZpYSBzc3RhdGUtY2FjaGVkIHN5c3Jvb3QgZGlyZWN0b3J5IHRvCj4g
PiBvdGhlciByZWNpcGVzLiBUaGUgaW50ZW50aW9uIGlzIHRvIGNyZWF0ZSBGSVQgaW1hZ2VzIGlu
ZGVwZW5kZW50bHkKPiA+IGZyb20KPiA+IHRoZSBrZXJuZWwgYnVpbGQgZm9sZGVyIHN0cnVjdHVy
ZSBsYXRlciBvbi4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQWRyaWFuIEZyZWlob2ZlciA8YWRy
aWFuLmZyZWlob2ZlckBzaWVtZW5zLmNvbT4KPiA+IC0tLQo+ID4gwqAgbWV0YS9jbGFzc2VzLXJl
Y2lwZS9rZXJuZWwtZGV2aWNldHJlZS5iYmNsYXNzIHwgNCArKysrCj4gPiDCoCAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9tZXRhL2NsYXNzZXMt
cmVjaXBlL2tlcm5lbC1kZXZpY2V0cmVlLmJiY2xhc3MKPiA+IGIvbWV0YS9jbGFzc2VzLXJlY2lw
ZS9rZXJuZWwtZGV2aWNldHJlZS5iYmNsYXNzCj4gPiBpbmRleCBlZmYwNTJiNDAyOS4uNzVlMzk0
YzU4MjYgMTAwNjQ0Cj4gPiAtLS0gYS9tZXRhL2NsYXNzZXMtcmVjaXBlL2tlcm5lbC1kZXZpY2V0
cmVlLmJiY2xhc3MKPiA+ICsrKyBiL21ldGEvY2xhc3Nlcy1yZWNpcGUva2VybmVsLWRldmljZXRy
ZWUuYmJjbGFzcwo+ID4gQEAgLTg4LDYgKzg4LDEwIEBAIGRvX2luc3RhbGw6YXBwZW5kKCkgewo+
ID4gwqDCoAkJCWR0Yj0kZHRiX2Jhc2VfbmFtZS4kZHRiX2V4dAo+ID4gwqDCoAkJZmkKPiA+IMKg
wqAJCWluc3RhbGwgLURtIDA2NDQgJGR0Yl9wYXRoCj4gPiAke0R9LyR7S0VSTkVMX0RUQkRFU1R9
LyRkdGIKPiA+ICsKPiA+ICsJCSMgUHJvdmlkZSB0aGUgRFRCcyBhbHNvIHRvIG90aGVyIHJlY2lw
ZXMKPiA+ICsJCWluc3RhbGwgLWQgJHtEfS9zeXNyb290LW9ubHkKPiA+ICsJCWluc3RhbGwgLURt
IDA2NDQgJGR0Yl9wYXRoICR7RH0vc3lzcm9vdC1vbmx5LyRkdGIKPiAKPiBBcmVuJ3QgdGhleSBh
bHJlYWR5IGluICR7RH0vJHtLRVJORUxfRFRCREVTVH0vPwo+IAo+IFdoeSB0aGUgbmVlZCB0byBk
dXBsaWNhdGU/CgpUaGVyZSB3YXMgYSBkaXNjdXNzaW9uIHNvbWUgdGltZSBhZ28gdGhhdCBhcnRp
ZmFjdHMgc2hvdWxkIGJlIHBhc3NlZAp2aWEgc3lzcm9vdCBmcm9tIHJlY2lwZSB0byBvdGhlciBy
ZWNpcGVzLiBXaGlsZSB0aGUgc3lzcm9vdCBhcHByb2FjaApjYW4gc2ltcGxpZnkgdGhlIHRhc2sg
ZGVwZW5kZW5jaWVzIGl0IHJlcXVpcmVzIHRvIGFkZCBzb21lIGFydGlmYWN0cwphZGRpdGlvbmFs
bHkgdG8gdGhlIHN5c3Jvb3QgYXMgd2VsbC4gU28gdGhlcmUgYXJlIHByb3MgYW5kIGNvbnMuCnY0
IHdoaWNoIEkganVzdCBzZW50IHdpbGwgdGFrZSB0aGUga2VybmVsIGFydGlmYWN0cyBmcm9tIHRo
ZSBkZXBsb3kKZGlyZWN0b3J5LiBBcyBhIHJlc3VsdCB0aGlzIGNoYW5nZSBpcyBubyBsb25nZXIg
bmVlZGVkLgoKVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3IQpBZHJpYW4KCj4gCj4gQ2hlZXJzLAo+
IFF1ZW50aW4KCg==

