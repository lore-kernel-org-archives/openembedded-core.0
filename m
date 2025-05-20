Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9087BC3ABDD
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 10:06:21 +0000 (UTC)
Received: from TYDPR03CU002.outbound.protection.outlook.com (TYDPR03CU002.outbound.protection.outlook.com [52.101.127.140])
 by mx.groups.io with SMTP id smtpd.web11.17391.1747735572732490591
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 03:06:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=cE8BnNav;
 spf=pass (domain: aspeedtech.com, ip: 52.101.127.140, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p486L59Y+2p+dKqDooN7unUePle+sUZyfMfyJLQI57xlYuBFEwtfMTgN/J6jjPGClEeNsQgOfPtG6uOExi7bbdwk3cquEJWQy8WTRM/r8XP+WI3YMhDOk/Idj6+anRgbRVn5MildQtoiH1ZHZfFT8hNfaVXq7M7mqNePzE8bmNgbRrRcSQ9+N3ndbt1SMt4Y7PuBBlvCWVYVrNmhJ71wk/fjozKUvlIHQ7etoEj9DyeDGYmMlyVgiHgGaax2rg7XZ0YZx9EtTJrwEOkeYrDTasMHUoPRopL3R+X840NHTZYnGnCEHrDZlFzlFnvRtnkc+43SZ19OzBttcyFmdMsxXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZrcTOrgPMvT3ytdO+zBhrk5sI/S+ulklacsUm+Sj3/g=;
 b=WJKXVN0kHa25MIWatejQ15/XK8zxYfpY553FscBx4c18cUitcoHvWyikqTKyRRBBfYlOrsuQBoLcj7ps/kJKfTNqM+Uvxa9QgCtEbz1L0SPAkV4jsUgcUBWsJLyp/sUtqzi8E0fNTkOLZN0izr7ACv/5egqRCd6BdJFWDKS4gAlAnDb0UVyit4koYtJSDVReIE4Yl0luU0I3E3agf1KNfr6SXV0GRsS8T5a+dKudHajrX8AsimIb90HInI+ZMKEKq97yJzHcCKYdzkuIoG2diIICMoev5hqUNSUlcO7iWVNuiBPHfgKblOmraTom0L1RVyUYWB/GUxFrmfKyk9kw9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZrcTOrgPMvT3ytdO+zBhrk5sI/S+ulklacsUm+Sj3/g=;
 b=cE8BnNavLtMIF6KsH4RBSnWsL7/59z/ozGuiIb/sxckI+ZXwsoke+oAqpWMUtZg8UIaY/npuAyHs6CoB4y8HEFRjA/DVxGOo2gc0SiiuRebr3v6YWELYbP4bXWzj5Fn+PkwptcVNsXxB7dcYVzsFJMv7A0991iR0YrvXXDEWydBaAPLyLHA/mifWQhyVD6QmbGpITIqNbkjqMpmTYjXWagil71e17XRs/MnjDFkgbS61dOvQQYDpNoSGtyqjH55iUyC4GxzW9vMyToUVLeurRsTeWE/sqhoCC24mAn4bWbpKakbGopnpGquck3rA3eL+KcM4XiMsXiR2EBpkMuMOGQ==
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com (2603:1096:4:1a4::6) by
 TYZPR06MB7253.apcprd06.prod.outlook.com (2603:1096:405:ad::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.30; Tue, 20 May 2025 10:06:05 +0000
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::705a:352a:7564:8e56]) by SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::705a:352a:7564:8e56%4]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 10:06:05 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Quentin Schulz <quentin.schulz@cherry.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Troy Lee <troy_lee@aspeedtech.com>, Vince Chang
	<vince_chang@aspeedtech.com>
Subject: RE: [OE-core] [PATCH v1 2/2] uboot-sign: Add support for setting
 firmware property in FIT configuration
Thread-Topic: [OE-core] [PATCH v1 2/2] uboot-sign: Add support for setting
 firmware property in FIT configuration
Thread-Index: AQHbyGyTMGQxtbl3tUyPwmmW7L6pAbPZu3GAgAGQDjA=
Date: Tue, 20 May 2025 10:06:05 +0000
Message-ID: 
 <SI2PR06MB50418A033ED26FFEF76E0A28FC9FA@SI2PR06MB5041.apcprd06.prod.outlook.com>
References: <20250519031732.1338100-1-jamin_lin@aspeedtech.com>
 <20250519031732.1338100-3-jamin_lin@aspeedtech.com>
 <ef31d362-0a1e-4005-823c-9eb092a86701@cherry.de>
In-Reply-To: <ef31d362-0a1e-4005-823c-9eb092a86701@cherry.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5041:EE_|TYZPR06MB7253:EE_
x-ms-office365-filtering-correlation-id: 83c70e2b-d321-4f4a-5682-08dd9785eef3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?RzV2SGJVZTNVRVNreUxET3kySkJGbWxJYm5tVXZmeG8waEdJK0R2Z3FMWkpT?=
 =?utf-8?B?aXV6T2R0TTJ6QlFjRGVheFhXT1ZiZ3B4cjJyYXJ4dElkRTA0Ymk0V3RoZW1s?=
 =?utf-8?B?aFkwUWxacmIxRGl4UVlFWHhIbnhuQk80V3dYZ2hRSUNPR0tBQklYdWhiV2h0?=
 =?utf-8?B?TDRXeDNwTjRWb2diUkRDeFlTdGhUVHFPUUFQY1pzQWttQi81NHRwR25taGpa?=
 =?utf-8?B?YU52V29hUUkxTzF3ME9UdVduZEhpOTdSL0V1MHh2bGFXenFEUXV2RkQ4ckFk?=
 =?utf-8?B?NmNrRHgwMTVjMldXTExRb3p1RFpUam1SR0JvdDNmRVZ4c1ZqMVM5QWQ5UTRX?=
 =?utf-8?B?U20yWm81dTBVNzhsQmMvcHhVUElMdWxadE04M2dIcGp0ZUxEZjNFQkU2TjVk?=
 =?utf-8?B?Y2JyNVdqUG9heFdZWDZyekFpR05iak5EY0NEeWxZMC9nNUxDYlR0WkVETkdv?=
 =?utf-8?B?RW9pWjFTT0REUHZXRGtxcnFCSWdtVTMwc2NuSEpsYUUzT3MvbHcrTTBGc1Fm?=
 =?utf-8?B?WHl4dnh1WWNRWGgrMkJpb2NBMW1pYTBIODJ4WXRzOVN4U1lSeXJ4bFpwQ0w1?=
 =?utf-8?B?VGpFM1gvaUFEQVpjbnp5dlBwU3U0UHNXVkNNOVdxQmJYWThieGJXc0o1Mjdr?=
 =?utf-8?B?dzhkaWRFZnYxbHl6RGVnTUdpT3N3N2hRR2VtVDBlbkxXV3lpSUNqL2t6UWFR?=
 =?utf-8?B?YUlKcm9rYVE2b0RvTWlzcnR1NTI3RjE4VU8rUUxCVUMxSU9ZVDBERHhIQ3Zo?=
 =?utf-8?B?bDl4eXpkdnU2VFAycGVqTXlpUXQvY1pyQnFHdERIaFdwMkN4YjVpS3M0TWtw?=
 =?utf-8?B?b0FJTW1pcjlvTm5EVW9PL3FIdGdCZzFrV2MvM2lxTFRscllsMXRZcFhxZ055?=
 =?utf-8?B?MW5vbmZHK3F0b2pmWTRGSXFiNmxlUzZNSGZzakNSSktSRnllZHZDNlVIRmdo?=
 =?utf-8?B?eFZPTCtmU085U3lDMldOSThTMU5xMzJrdkxRVk5ITFNMdVdQekZMTEtRVzFH?=
 =?utf-8?B?RXYvV2wyMVBaUitwT1IxRUQ4NU9zVUhITERWdmpVY1ZiWnkrZnNTdTZjMy9H?=
 =?utf-8?B?SzVmM1ZmZ0Vjb1FpNmt4bEdFY21qcXV6eUlLb2thL1hhVjltUndkZ0dxcXhl?=
 =?utf-8?B?d285Q2dETGQzbWZYcWUycVlERG0xVTg4TlZSNk9VOTJrdzhUM2pZRGZRZWg3?=
 =?utf-8?B?UDZrYXBBNXNMN0pKd2w3aCsrazN2MWd1TzNPcjFocDV4YVR1OFVQUzkwUk9o?=
 =?utf-8?B?MitZUU8zSzRiN0plVCt6NE5IeUovWTJjZXV4bndiSWk4VEhmVHE5bEIrTDJY?=
 =?utf-8?B?WElhM1orckFBZldxemw0ZVVSV1d5Um12Q205Rzg1SDVvTWgxWXNJRHppYlNq?=
 =?utf-8?B?TWZ6bisrMHdVZnBjZlBPOWhPaXZ2bEtxWlBRUlZBTjhxNUQ5K0FEdkxtZFFv?=
 =?utf-8?B?WVRvZ0RrSFBGQTBNWXlDdTVwZTB5dHlQd05NdSs1T1pkS240RUV2L25ZWXVX?=
 =?utf-8?B?NUE0dXBYQzIxcElNU2RlUDBQbzFSSlg4N3Q3MmxScjVxY0RKbituNDBhV3lG?=
 =?utf-8?B?WDN2aHAwcDAzVGlOaWxiSzkyMU1BQUFQZUg5TUNpTG43MUZSRHJTWm1DRHI4?=
 =?utf-8?B?cHNmdUVwSmRrdU1VUTFSN0swWTNaZjVUTGgzSjJUTXd4UEcwMCtWSFVrY3dz?=
 =?utf-8?B?OFBOT1dUejlpQWVDVzZ6TFBTaUE2V3VlSEVaZWUrNHVjQlh3MTRDTE1iNWNn?=
 =?utf-8?B?Z1lNeHhFVEs4UlYwYmFOVXVpaGQ2RmVJY3l3bjhmd2hqb0JjMXFIY0hCNkI1?=
 =?utf-8?B?enl5NUdISTBGMFMyTzFpWEFVY29IVUxwelRMbnJ6UGJpa3NRK1IxQnVzU0ZL?=
 =?utf-8?B?Njh1WUtjOW1UNHhFTytZcS80ZnVBcDZBdnVWcWNYUVA1NTdFaUc2LzlhVEZG?=
 =?utf-8?Q?WN+IvGywHAg=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5041.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TTJ2UGdvNXNveWNScXVSTGN0NnpVakMzR3BWUXY3NGJIakVReXdRSUIwOE9S?=
 =?utf-8?B?OTRJcVdEbkNaZ1VCSm5iNmsvM0pTbnY5TVUrQlNIL3U1aUlkdXBoYllTRGNw?=
 =?utf-8?B?RmV2M0lCam9XV1lDTFI0YXdvbkRjdWVXMlA2MHp3ZHRid2lUVFk3NldEM2o2?=
 =?utf-8?B?VUhmUHp3SExjZ20yRXBodVhBdHhLNWlmTDJlV1RjMlkyZkhpRE0zenJvcGFr?=
 =?utf-8?B?cmpUWCtheHpvMXZOWFZuTzkzSWZBR3ppeGE4aStzTVRiVWhXN3RGN1lRallp?=
 =?utf-8?B?cEIwVTlOeDVIVmE5ZjJtQWtJZ3NqYXl5angvUG4rRHMrRVFvV2xWWWFiMEE4?=
 =?utf-8?B?YjRyUVhJS2tmUGUzeXpzUGRibGpIbmoyek82VVR6blNCRVlnb1dNREx4Q1U3?=
 =?utf-8?B?MEF6WFRFQzdWd1BGbkVqOXhBdjQwWW5HT0FhN2FZQi9pZTRTanBVeW1HUElQ?=
 =?utf-8?B?bGtpWkxjckF3S3NYM2YzRUU3bmFGaW1CT0x5cnpLRDFvVG5hc1pLaVZZeFlD?=
 =?utf-8?B?MmZ0YWFiOUMxTm9vT1Blb3p0TE5rY0dkdmx6eDNsbVRxcFlJNVMxcG5MYnl4?=
 =?utf-8?B?SEQvZVRSdGE1Mmx2NzB0UnVCdGQ3eUhNbkRJSTJ1b2FDcDFlNUpSd1VISGxy?=
 =?utf-8?B?LzJZQVZvN1lVLzJQdkhoZDZDemtDVVpGbHpUd05yUXBDK0RVUkRtVWd0V2Fr?=
 =?utf-8?B?MGZ3QnlhNFBmTGtCTGVQREkvMXViM0FRTG9zejVaUG5sdnJPYjlnTDNXMWJk?=
 =?utf-8?B?aDlWUG9DK3djaW95YjB2a2N5SmwxUUZ1VnoyWXJOZ0lqdEM0Uks3NzB4ajlV?=
 =?utf-8?B?bE01ck1zUlBXaGNWNzJ4V3hQOGZxWGFiUHVDUDhZYkNRRkVhSExtMUtQQkhs?=
 =?utf-8?B?TkU0QTZaM2NRTHk5Q1Q1MmtLc1RrTFFJOUNVTllFYmFTZmFNak02OW4vOFFm?=
 =?utf-8?B?WC9XSHI1UFFmRlZzSnYvSXQ4Rkp6Nm1HS2xZZnFHYk0xU1hVczYyRG1SaTda?=
 =?utf-8?B?YkFldDkwTWY4eWRvTUJ1d0xObTlWbW8rakw5YVU4M3dJSVMvZElBTnpxekdC?=
 =?utf-8?B?ZXRCTVhHZDRaajFXRnVZOVpvdHNJVGdDTE83a2h1TFZxNit6amtVOU9mUkxn?=
 =?utf-8?B?Y2Yrdk44WWJjTjZZOXBMM3F0eTA5QXhjMWdZSWFNQUpTclFDenZHaGlrMmJm?=
 =?utf-8?B?L3BlbEFFR1FKSXZWY0IyRVhyS25ITm5YNGZ1L0dDRDFUNm80bmY4SnNzNGNF?=
 =?utf-8?B?Z0RFYnowZGdMMmROcTBsTFRGbU9pTGdNQ0ZYSUllYTlFNlN6bHN1QmVtNmk1?=
 =?utf-8?B?MTBOWDVpdjlWZnBSeEd2SUgwd0N1RWRKeEZRbExFTXlWZXBOcnlMZkluS2k3?=
 =?utf-8?B?aXJ2L2o2VTNlWW1NdDhPNHNxM1RxUi8zTG9FanhSY0xnbDJsNDVSWitwekRI?=
 =?utf-8?B?UmZ2bjZlZ01yQkRyeW54R3R2TEpraXpkWDJxaVZDbVVnWE9FNnJZMGYzR3dH?=
 =?utf-8?B?TVowbmhIZmliRnRFNXFiQlJNTHh6VkRMMWpIOUdrbS9UamVzTWdFNllYcTdt?=
 =?utf-8?B?YkJuK2hQWDJ3ZjJGWEdtaWhsaGdHVFdjREV6eW94dlZZSEZmaGhqY2JxdFk5?=
 =?utf-8?B?cTdNUEZvQWw2RnFGeWdjT0JVSjdXNVM0QUNVWFpuZTRRV3c0WFNiRE5xbVZP?=
 =?utf-8?B?NDNRMUN3UXhWcmRaNWUvYmYyZktlVlFhTHZzWUNoMHdnb21mait4ZFhMbDZU?=
 =?utf-8?B?Vk9uRE41M2Z4K3lRcjVtQ04xcFQ1M3dBTUhPNHVxMUd5U3h4N3F6UHZ2OUNa?=
 =?utf-8?B?UVhiSXZ0K0J1bjVGWHpIMlRHc2RxOXVJNE1oR21sQk1BWThreGpIYXM4cXRq?=
 =?utf-8?B?dW4zM2dZdWR6TkZQQlFaMHV0U0o0MUtaR1l3ZFRHa3RUemc0VFpWWVl1S1dD?=
 =?utf-8?B?V0ZNZVJ4ZWk0UGRwZ0NWS0M3ZFFXaitabUZmaUFQQ0RFVTFWcUMrYUgwdnhB?=
 =?utf-8?B?eUNtTFg5U1lEWHdiYTR3YjFKOEkwQzBIR3lJTzhqRFU1UDFTUlA3Nld1S3hM?=
 =?utf-8?B?MkJIYXRTWTEwT1hTRCtqYUF2czZQWFJZaVhQZ2xsKzBLRnZXUzRXd0dpWEQr?=
 =?utf-8?Q?1SeoxBumy68wPwhiM0ywY9vxU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5041.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83c70e2b-d321-4f4a-5682-08dd9785eef3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2025 10:06:05.1463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8lwR53QJkA7WrPUnwMojn/6iH5uUaT+IWIyqU0tevirokIjpCe2ui6poS1Kx+PwLooUFvQZnvQWb6Pcj64d5paIh1T/5wJr7rKdiLm+6g0Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7253
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 10:06:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216899

SGkgUXVlbnRpbg0KDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIHYxIDIvMl0gdWJv
b3Qtc2lnbjogQWRkIHN1cHBvcnQgZm9yIHNldHRpbmcNCj4gZmlybXdhcmUgcHJvcGVydHkgaW4g
RklUIGNvbmZpZ3VyYXRpb24NCj4gDQo+IEhpIEphbWluLA0KPiANCj4gT24gNS8xOS8yNSA1OjE3
IEFNLCBKYW1pbiBMaW4gdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+ID4gQWRk
IHRoZSBhYmlsaXR5IHRvIHNldCB0aGUgImZpcm13YXJlIiBwcm9wZXJ0eSBpbiB0aGUgRklUDQo+
ID4gY29uZmlndXJhdGlvbiBub2RlIGJ5IGludHJvZHVjaW5nIHRoZSBVQk9PVF9GSVRfQ09ORl9G
SVJNV0FSRQ0KPiB2YXJpYWJsZS4NCj4gPg0KPiA+IFRoaXMgcHJvcGVydHkgZGVmaW5lcyB0aGUg
cHJpbWFyeSBpbWFnZSB0byBiZSBleGVjdXRlZCBkdXJpbmcgYm9vdC4gSWYNCj4gPiBpdCBpcyBz
ZXQsIGl0cyB2YWx1ZSB3aWxsIGJlIHdyaXR0ZW4gaW50byB0aGUgRklUIGNvbmZpZ3VyYXRpb24g
dW5kZXIgdGhlDQo+ICJmaXJtd2FyZSINCj4gPiBmaWVsZC4gSWYgbm90IHNldCwgdGhlIGJvb3Rs
b2FkZXIgd2lsbCBmYWxsIGJhY2sgdG8gdXNpbmcgdGhlIGZpcnN0DQo+ID4gZW50cnkgaW4gdGhl
ICJsb2FkYWJsZXMiIGxpc3QuDQo+ID4NCj4gPiBVc2luZyB0aGlzIHByb3BlcnR5IGltcHJvdmVz
IGNvbnRyb2wgb3ZlciB0aGUgYm9vdCBzZXF1ZW5jZSwNCj4gPiBlc3BlY2lhbGx5IGluIG11bHRp
LWJpbmFyeSBib290IHNjZW5hcmlvcy4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEphbWluIExp
biA8amFtaW5fbGluQGFzcGVlZHRlY2guY29tPg0KPiA+IC0tLQ0KPiA+ICAgbWV0YS9jbGFzc2Vz
LXJlY2lwZS91Ym9vdC1zaWduLmJiY2xhc3MgfCAxMSArKysrKysrKysrKw0KPiA+ICAgMSBmaWxl
IGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL2Ns
YXNzZXMtcmVjaXBlL3Vib290LXNpZ24uYmJjbGFzcw0KPiA+IGIvbWV0YS9jbGFzc2VzLXJlY2lw
ZS91Ym9vdC1zaWduLmJiY2xhc3MNCj4gPiBpbmRleCBkY2Y5NGI3MTc5Li45MmJkNjIwZjhlIDEw
MDY0NA0KPiA+IC0tLSBhL21ldGEvY2xhc3Nlcy1yZWNpcGUvdWJvb3Qtc2lnbi5iYmNsYXNzDQo+
ID4gKysrIGIvbWV0YS9jbGFzc2VzLXJlY2lwZS91Ym9vdC1zaWduLmJiY2xhc3MNCj4gPiBAQCAt
MTAxLDYgKzEwMSwxMCBAQCBVQk9PVF9GSVRfVEVFX0lNQUdFID89ICJ0ZWUtcmF3LmJpbiINCj4g
PiAgICMgVXNlciBzcGVjaWZpYyBzZXR0aW5ncw0KPiA+ICAgVUJPT1RfRklUX1VTRVJfU0VUVElO
R1MgPz0gIiINCj4gPg0KPiA+ICsjIFNldHMgdGhlIGZpcm13YXJlIHByb3BlcnR5IHRvIHNlbGVj
dCB0aGUgaW1hZ2UgdG8gYm9vdCBmaXJzdC4NCj4gPiArIyBJZiBub3Qgc2V0LCB0aGUgZmlyc3Qg
ZW50cnkgaW4gImxvYWRhYmxlcyIgaXMgdXNlZCBpbnN0ZWFkLg0KPiA+ICtVQk9PVF9GSVRfQ09O
Rl9GSVJNV0FSRSA/PSAiIg0KPiA+ICsNCj4gPiAgICMgVW5pdCBuYW1lIGNvbnRhaW5pbmcgYSBs
aXN0IG9mIHVzZXJzIGFkZGl0aW9uYWwgYmluYXJpZXMgdG8gYmUgbG9hZGVkLg0KPiA+ICAgIyBJ
dCBpcyBhIGNvbW1hLXNlcGFyYXRlZCBsaXN0IG9mIHN0cmluZ3MuDQo+ID4gICBVQk9PVF9GSVRf
Q09ORl9VU0VSX0xPQURBQkxFUyA/PSAnJw0KPiA+IEBAIC00MzksNiArNDQzLDEzIEBAIEVPRg0K
PiA+ICAgICAgICAgICBkZWZhdWx0ID0gImNvbmYiOw0KPiA+ICAgICAgICAgICBjb25mIHsNCj4g
PiAgICAgICAgICAgICAgIGRlc2NyaXB0aW9uID0gIkJvb3Qgd2l0aCBzaWduZWQgVS1Cb290IEZJ
VCI7DQo+ID4gK0VPRg0KPiA+ICsJaWYgWyAtbiAiJHtVQk9PVF9GSVRfQ09ORl9GSVJNV0FSRX0i
IF0gOyB0aGVuDQo+ID4gKwkJY2F0IDw8IEVPRiA+PiAke1VCT09UX0lUU30NCj4gPiArICAgICAg
ICAgICAgZmlybXdhcmUgPSAiJHtVQk9PVF9GSVRfQ09ORl9GSVJNV0FSRX0iOyBFT0YNCj4gPiAr
CWZpDQo+ID4gKwljYXQgPDwgRU9GID4+ICR7VUJPT1RfSVRTfQ0KPiANCj4gTWF5YmUgd2Ugc2hv
dWxkIHJhdGhlciBmb2xsb3cgdGhlIHNhbWUgd2F5IGxvYWRhYmxlcyBpcyBzZXQ/DQo+IA0KPiBl
LmcuDQo+IA0KPiAgICAgICAgICBpZiBbIC1uICIke1VCT09UX0ZJVF9DT05GX0ZJUk1XQVJFfSIg
XSA7IHRoZW4NCj4gICAgICAgICAgICAgIGZpcm13YXJlPSJmaXJtd2FyZSA9IFwiJHtVQk9PVF9G
SVRfQ09ORl9GSVJNV0FSRX1cIjsiDQo+ICAgICAgICAgIGZpDQo+IA0KPiAgICAgICAgICBjYXQg
PDwgRU9GID4+ICR7VUJPT1RfSVRTfQ0KPiAgICAgIH07DQo+IA0KPiAgICAgIGNvbmZpZ3VyYXRp
b25zIHsNCj4gICAgICAgICAgZGVmYXVsdCA9ICJjb25mIjsNCj4gICAgICAgICAgY29uZiB7DQo+
ICAgICAgICAgICAgICBkZXNjcmlwdGlvbiA9ICJCb290IHdpdGggc2lnbmVkIFUtQm9vdCBGSVQi
Ow0KPiAgICAgICAgICAgICAgbG9hZGFibGVzID0gJHtjb25mX2xvYWRhYmxlc307DQo+ICAgICAg
ICAgICAgICAke2Zpcm13YXJlfQ0KPiAgICAgICAgICAgICAgZmR0ID0gImZkdCI7DQo+ICAgICAg
ICAgIH07DQo+ICAgICAgfTsNCj4gfTsNCj4gRU9GDQo+IA0KPiBmb3IgZXhhbXBsZT8NCj4gDQo+
IFRoYXQgc2hvdWxkIG1ha2UgdGhlIGNvbmZpZ3VyYXRpb25zIG5vZGUgZWl0aGVyIHRvIHJlYWQg
aW4tY29kZT8NCj4gDQpUaGFua3MgZm9yIHRoZSByZXZpZXcgYW5kIHN1Z2dlc3Rpb24uDQpJIHJl
c2VuZCB2MiBwYXRjaCBoZXJlLCAgaHR0cHM6Ly9wYXRjaHdvcmsueW9jdG9wcm9qZWN0Lm9yZy9w
cm9qZWN0L29lLWNvcmUvbGlzdC8/c2VyaWVzPTM0NjY2DQoNCj4gUGxlYXNlIGFsc28gY29uc2lk
ZXIgc2VuZGluZyBhIHBhdGNoIHRvIHRoZSB5b2N0by1kb2NzIHByb2plY3QgZm9yIHRoaXMgbmV3
DQo+IHZhcmlhYmxlLg0KDQpJIHNlbnQgdGhlIHYxIHBhdGNoIGhlcmUsIGh0dHBzOi8vcGF0Y2h3
b3JrLnlvY3RvcHJvamVjdC5vcmcvcHJvamVjdC9kb2NzL3BhdGNoLzIwMjUwNTIwMDk1NDU3LjM2
NDIwMTItMS1qYW1pbl9saW5AYXNwZWVkdGVjaC5jb20vIA0KDQpUaGFua3MtSmFtaW4NCj4gDQo+
IENoZWVycywNCj4gUXVlbnRpbg0K

