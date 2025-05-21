Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3437C3DA6D
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 01:23:52 +0000 (UTC)
Received: from HK3PR03CU002.outbound.protection.outlook.com (HK3PR03CU002.outbound.protection.outlook.com [52.101.129.117])
 by mx.groups.io with SMTP id smtpd.web10.1162.1747790626736140081
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 18:23:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=fRw2dlkY;
 spf=pass (domain: aspeedtech.com, ip: 52.101.129.117, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fz2njH+ZZRRW8RdLjv/ELn6LgWksr4eY2tI9LrenkbB7DM6Jxf8ViE8c7BGRPrFHoztj5+wlTDIHgzY/UzsAxDocb/AhJ0Yn3dyS4F+Y1Fd6xhHs6wVlwPvCfpqxyqFP86YZKYJ3x+V9p4HiGuxIdIoGzpIOhTSWjqjTcEWiFzZ6t4G3v7IRYiKY9ALdRcZ9oaqwgr3DIyCu6j082DO3K8VtpVNcd+ZeJnKEGJc06H9n6gogeaa+NCnUIamin0ZBNktSQqAHvtYKY4tLKC2Q6Y9dYEuXpKEsz4OIwwQF4wKCNWYzZ9HflnrBPBBfCkkSLPpptLn/V69anTtYNiZTCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YDO3w4uo9NS11saYJih6Hd0Mjh1kHULdNiH8Yu987O4=;
 b=wl/UktAn9KhG/eGw/qDiqltBonNGBfMOuVMza6+frA4J0M9zv3rV6qHj9UT1FVTFSKgDQt8U/fUiS41iLIrB4LVfCamiTPpVb8sBMSOofrsoStXmSyKtUwsLlrhxjEhNoYVl3ovJKnH3xraiDgw/8GmsapubDnRMYXKwz6qIAbS0U1pBvGeiVBg0fXehic2ogxQJtI7vZpGBtKHzhvX3LwOrXA4PwlTe2fSCdvBFHg8xO5EwQLwLSPZ5hzpn5iqkd0P5bMjz9Bz2XGj1Tu8I1YEtQ+TCYPE22FK5v8fNIv0jVURDwJ7yZkKpfWE8+6O1WZqaDXOeECuOptXM3Rg7Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YDO3w4uo9NS11saYJih6Hd0Mjh1kHULdNiH8Yu987O4=;
 b=fRw2dlkYbbui8wACsv4Z9ehk5gpg7K1H3TdGAytiyCoFzHUvxSj5uRewBg5pp/Ylo5klK45rYpO6K76j3DHkHMN3YesObUGeHkCIMQTFxOSzQhusOH/pGGp/z7WdvuvOMINMGsI6Jzkm6mTrIewaGJiXaMvVbtNa5D83aUrvh9WhyNKU8Iv7mkKW56TtT8GgzzRLR7GXm568GUoCIG4x0dCPP+lDOLHP/L1FUlxuxHvhbL5T9Rh71RwZ65V5u8gEyDeWzXTTyc1GgOaNIz4eSxNE/GiXR9LYn/DpJyIDTmXyHQm6t615EES/2CfElBmtSnxKA//UtPT348rjEt12jA==
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com (2603:1096:4:1a4::6) by
 KU2PPF3ABD1D432.apcprd06.prod.outlook.com (2603:1096:d18::48d) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.33; Wed, 21 May 2025 01:23:38 +0000
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::705a:352a:7564:8e56]) by SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::705a:352a:7564:8e56%4]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 01:23:38 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: Jamin Lin <jamin_lin@aspeedtech.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Troy Lee <troy_lee@aspeedtech.com>, Vince Chang
	<vince_chang@aspeedtech.com>
Subject: RE: [OE-core] [PATCH v2 0/2] Add support for setting firmware
 property in FIT configuration
Thread-Topic: [OE-core] [PATCH v2 0/2] Add support for setting firmware
 property in FIT configuration
Thread-Index: AQHbyW4terW7Jqyx3kKvk1GDVB7sobPcSo6g
Date: Wed, 21 May 2025 01:23:38 +0000
Message-ID: 
 <SI2PR06MB5041F59EF0BB3556152AC9C8FC9EA@SI2PR06MB5041.apcprd06.prod.outlook.com>
References: <184133FCD9EA9298.30463@lists.openembedded.org>
In-Reply-To: <184133FCD9EA9298.30463@lists.openembedded.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5041:EE_|KU2PPF3ABD1D432:EE_
x-ms-office365-filtering-correlation-id: 49080777-1ef0-4018-ffeb-08dd98061d10
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?Z2pjOHNYNFY5NnNicXdDYVhkcGhDOTYyWmtlTkZiMXJ1Rno5YXRxVGxSU0s5?=
 =?utf-8?B?dWZSeitxT2tUT0RuS2tlUk5VaFluWE9ZbFB0WTYyNm1GYjVlOFRiejA2RG9o?=
 =?utf-8?B?RnZRbHZQY0ZBalMvMUU0aTVpQWtiS25RTTJod0p6dVhtaWlOdnlPeG8zM3Nx?=
 =?utf-8?B?ejc1STc0VVZDUnhmY2NHdzJuUElWWEpwaHhNUXZzOG1yd1IvampPRHNUdy9R?=
 =?utf-8?B?eDNUN0xiVmluWVZjNUc2TEJWWURLblgzb2YrQWVZN21SUzRNNE92ZW0rME1U?=
 =?utf-8?B?Q0lTT052dENzK2JWdzZHeTJ3R1VwZVlLSHJXdmxYWTk1YXE2OWJqYWFtQU5U?=
 =?utf-8?B?cGRab0tmQ1lDMEplaGtJN2wzbkE3eTNOUmY2a0VxUlU0a2lPeXEvamtZMlRS?=
 =?utf-8?B?ckRIaTM1UzViamp2OGFKamVqbEMxTHlFZ21pYzlNMEI5d05BS1VTL1ZsZEJG?=
 =?utf-8?B?ZXExRFczRCt3ZUNJZktHMDZrMGVQV2xRZEJlYWx1RXhCeHZnYzYxS0ljRG16?=
 =?utf-8?B?Qld3a0ZKVU10bnMyRmcwaGUvd1hYVmh2bS9YeHJUR0duUDJ0NHZ3YllrQ21P?=
 =?utf-8?B?N1ZBQkQySlI5YkNBdWN5V05zUE8xZFZFOHdjNGJ3RVlOWEVENHBnZTY2VnBk?=
 =?utf-8?B?NTl3M0RUVFVES2UxMkhDMnRBQnd0NkREZklieXhLMENVSmZmTFZlZEttblNE?=
 =?utf-8?B?ekhlV1dmUVhmK3BFRXV0SWRiWURhZVVTWElXYmlIaU54cDlCblF2bmFTQnl5?=
 =?utf-8?B?T1lTV0hBZ05MYlJvMDZsM3l5S005blArNkd5WlBWUkUwR3JVWmxpa0F3T2ds?=
 =?utf-8?B?UVZZTVhadGduR2NvZTVGWkh1M1AxQUI2VDFKRmJIMzdCUTFNUHZUNmxJc0Fm?=
 =?utf-8?B?aVREaDhRdEViUGdvZmhoUGdzVCtHVUxZd2xsK2xmb3MvWDBKbVNXR1huSnJG?=
 =?utf-8?B?VHg2aXRJWEUxUDFCUFRKKzJZOWkxYklvVzIrNFIyTkM0UTBaSEkvQzl4SjdG?=
 =?utf-8?B?OTlueTNUeUFMcTlWNnZ6U3JxbStFWU9nUC8wQWZTWkwwVVZBNlpkTUFyWXF0?=
 =?utf-8?B?ZjZLaWQ0ekxPMk5DUUhsTlUzdi9KUFJRaGQwMFFOYWs4cG5wK1RYYWZHZlRn?=
 =?utf-8?B?U3NMUlU4SHNDTG5kU2E4cDNuakthOHNvWUVTUzdYRzQ2blV2eVlNRnF4WG03?=
 =?utf-8?B?L3VRQjhPWjVvaTQ5cks1L2tlWjZhYW1wcCsvQ2dTVlBKOVJZcUZwekZqbUNk?=
 =?utf-8?B?VEFDZm9JOG80QjRSMUxQSmFMd255RVFPeGpISlp3ZFFnNUV2ekFIRnpKcjZY?=
 =?utf-8?B?UWFqOVlibFNiV2pBaHVVcXNIT0QzdHN4ckNYV1NuNy8vNEhyN3lvU29PVHJi?=
 =?utf-8?B?K25qa25wN05SaCtYd2s5dkh0ZmUxUnVtMTdTaWNXYUpqL0VPeTYxQTJJYzVG?=
 =?utf-8?B?NXA1R0ZrbVhEa2hIdHBUekREa1NqSzhyTkVMV2RZcG4xWmxmVE9GY0c5UW50?=
 =?utf-8?B?alI1eEk0LzJtQ2R6VWVZSENtUmhUMGpKQ09GSjdvZ1F5MkNxeEh0Y3BLWnll?=
 =?utf-8?B?Rk51ZllMUXJRdnZaNjNzdENHYTR1Q29tejJuRk15MWhLUUJISGdjbUxaRlQ0?=
 =?utf-8?B?dmF0QzJ3blVpc0NpdzFzKzdoV2Y1S0VzVWx5MWlTZGpSbjlXc3J5SjIzZ3cz?=
 =?utf-8?B?dER4UGxQRmwxNzdWRTVMd1dFYW40NE13MVVBYlVkWHo5d3gxV1NBVmZ2VkNV?=
 =?utf-8?B?ZGpWYnVnam9sTURhVDZSeVhlODY5T0ZPZWJCSkl3OWVueTFMcU0zamorMW9J?=
 =?utf-8?B?OWl2VzRwN1lpY0JYZFFwRDZqVmNjdFNWRWVFNE4wNHJPMmFLekJNejc2dWpK?=
 =?utf-8?B?RjA4N0hVaitSV2FpQUtNaHpwYzVMUElXQTVXQW1qR3FMUnhWeVZSVnRlOEJt?=
 =?utf-8?Q?A++wLu2e9Vc=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5041.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?TEE3NnQwc2JYUm1hdUxBOUJXb1daY1NJcnhiSkFvZWozdGlQNGoxQzNhczdB?=
 =?utf-8?B?c1VLZUFxcVM1MmdyZTVBTTJlQ3Bxa1RkbFVGVTFqOHJ6SlpQMTRLUXBEOVda?=
 =?utf-8?B?VXIvZ2lUV0oyLzJOUnRtZGduazZYL2o2NUZ3M2dGMXozd01KNHF4b21hUlJU?=
 =?utf-8?B?RHVWbEFnWWoveFRoeW1ySmpydmxjTUloZnFwNkRJdE5XcUpVUW90dzloQS9Q?=
 =?utf-8?B?b3VJQnhtQnZybW4zMTdpWW9URVFMLzdkaEZ0ZHBiVVpldndpb295ZjJzSDlE?=
 =?utf-8?B?Vk1zY1NjeUNmcEt0UVluci9Zb3FwNis5ZDFGNDdtQjNJS2t1RkFMSGJjc3h5?=
 =?utf-8?B?anlHelV6ZTNLeUJpb1l4bnNnbUhVSVIyZzR2K1VvVHpvZm1leWJMSHBSQ3Qv?=
 =?utf-8?B?ZGUrWWs3dVRYcjFsRzczZjhNZm0zWTVpMlkvQ25xN0ZDdlJ1d2V6bkNNb1VI?=
 =?utf-8?B?TzlrMTdqU2hhN3RQbENwQjlSK0hiRVVrS1BXL1pJNjVnWldnalJmMy93cU9L?=
 =?utf-8?B?TVg5bzVXcDhUUXdGYVdCWVRyRXZObHVaRjZLbXRoRG8rc1g3TzE4amZqUVBW?=
 =?utf-8?B?bUhySGQ0Sk9aUFAxUy9lOHNtZzZqUjVSUjN4TCtOdTNwejBYd0c2aUw1QW5y?=
 =?utf-8?B?YmFYVFgwbUFGUkdlR29LbXljRzVSd3JOQzcwQ2RIb1JxM1hTTkZ0N3NhUmZw?=
 =?utf-8?B?bnlqNFIzczhkRFNtK1ovb0k2cWZKK2tCamVyNmd0L2Z1UWR6Q3EwV3JDeEtp?=
 =?utf-8?B?NGpVZWtMbllNN3M1OGJ2TEpMakIxUFNBQkswRElNZTZhS2FvTm9UN3U5SG9l?=
 =?utf-8?B?ZVBsTU9ML3NQTnF4MFBmUUFKRTVqZkZCT0VaRDUxUmF1THhVZVhEREttNW0r?=
 =?utf-8?B?TkxBZUxWMm5xZmUvUUd6OUJ6a200OUpQa3hFL3ZsQ1pkbmhRQVFxcTZ3N3VO?=
 =?utf-8?B?US9NOUV1U25uaDd0empRZmExQnRQZkZ1djgxZnk3QTJNZDRlM0ZFV1ZpQ2Fp?=
 =?utf-8?B?NE5tUWpoSDEvVCtGTm5vcVN4Q2lWUzczWll4UmxwNHFESWUzUEVYeHdoODFu?=
 =?utf-8?B?VTF3MXpXNDI4T25GQ0hvSkdxWit5SlkwSnE1b0ZFMy9QNUNPMWY4MUhyNXVz?=
 =?utf-8?B?UVhva3ZIUlQ5bWxBRDh1STBJRjRSTlZ3QkhWK2syV3A0ektjWHl0bnBycktk?=
 =?utf-8?B?bzBLUlY3NmdCVkRtQUY2MDRJZnVGVnlMdGM5aDdTTkNHZUx1T1ZPSTRTN3Y1?=
 =?utf-8?B?Q01NbW13N29EV1lCT2JqOStwMXQ3SEtsZ2F2NHA4K2YzZEhMR0VqT1gzbVJ0?=
 =?utf-8?B?aEVCUVp6MlhDRVJpNDArZGYxcitoeHM1THNoa3lWa1pVV0xpcFlBWmNWR0V2?=
 =?utf-8?B?cm85emJ0MFdmZVBpQUVVYkJUeEFyWXpxVVJwZkR0ZmlVVGM2ZmpzZXYrclVM?=
 =?utf-8?B?MUQ5QWNMOVBqZ1RzNW5HVWlpbU9naWZWRmVIMnRuWVBKOUNWcXFBbisxT0NV?=
 =?utf-8?B?a0NSUklZT2FjQVdwZ3pjZUFxR1d6VzhlMDgzVmpRaDFBZGFjY3dxbDVacXpT?=
 =?utf-8?B?VU1LZVhYR2xoMGpZMG5KR3RUbTNDVHVtcU9lRGNmWVRFQTBUc05xRXhTRkFX?=
 =?utf-8?B?d0gyNzNCRXBTN0VNYXhZMzNvV0VDUDh1RGlZOG5CNVRiOXNrRVRHaEw3Yy9p?=
 =?utf-8?B?VExLRmdYbnh2dXJ2Rkl6ZmlWT2FWdEJOdTlvUFlyT2RqUDlOcXd6bnFjZzlj?=
 =?utf-8?B?MEFlbkFlSFBYRk9ZWUFKOWxxYVBFeGtBelY5a2dMWW15dWpscExvZDJueVRR?=
 =?utf-8?B?S3dVTS9TQkc4ZTIwTkpINTUrc1NmR1FwQ1JER3VrRG9pOEdJeWRtNDl0bzZU?=
 =?utf-8?B?dG9FaHgveHU0SFd1N2dNQ0J6SUdsbjNzOFR1Z2hJcFNqYU82cVVUcExXK1F5?=
 =?utf-8?B?djFPRU5WSnExbnNXSlR4bzBTcHZhelJzSENlQjgxcy94ZjlzUnhPekNpMDBm?=
 =?utf-8?B?M01IcHJuM3BKbWpZcW15ZkoxdEowV2Vkb1VLREVRRDFtVm9kOXZiVjZCOHhR?=
 =?utf-8?B?TVBsalplVTRRZm1Vd3h0dUd5M1Zja0pGSVZSY2lzRlg0U0pXOVVWQmVodm12?=
 =?utf-8?Q?nQtuJFQgsP6YgfPJgDCMDWzv1?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5041.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49080777-1ef0-4018-ffeb-08dd98061d10
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 May 2025 01:23:38.1243
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zRyRvodRMyW5xLoC9pOTaKssVy6VRxSkzXirGHDTvPivDonplfsP4pwCE2fdvzAM7WC4nIgfLXA0xq/MeQyC1pWikQGili36sCjU0vI6rNw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPF3ABD1D432
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 01:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216960

QWxsLCANCg0KPiBTdWJqZWN0OiBbT0UtY29yZV0gW1BBVENIIHYyIDAvMl0gQWRkIHN1cHBvcnQg
Zm9yIHNldHRpbmcgZmlybXdhcmUgcHJvcGVydHkgaW4NCj4gRklUIGNvbmZpZ3VyYXRpb24NCj4g
DQo+IHYxOg0KPiAgMS4gRml4IHVuaW50ZW5kZWQgIi1lIiB3cml0dGVuIGludG8gSVRTICAyLiBB
ZGQgc3VwcG9ydCBmb3Igc2V0dGluZyBmaXJtd2FyZQ0KPiBwcm9wZXJ0eSBpbiBGSVQNCj4gICAg
IGNvbmZpZ3VyYXRpb24NCj4gDQo+IHYyOg0KPiAgIEZpeCByZXZpZXcgaXNzdWUNCj4gDQoNClBs
ZWFzZSBkaXNyZWdhcmQgdGhpcyBwYXRjaC4NCkkgcmUtc2VuZCB2MyB3aXRoIGEgZml4IGZvciB0
aGUgYWxpZ25tZW50IGlzc3VlLg0KQXBvbG9naWVzIGZvciB0aGUgaW5jb252ZW5pZW5jZS4NCg0K
VGhhbmtzLUphbWluDQoNCj4gDQo+IGRvY3VtZW50YXRpb246DQo+IGh0dHBzOi8vcGF0Y2h3b3Jr
LnlvY3RvcHJvamVjdC5vcmcvcHJvamVjdC9kb2NzL3BhdGNoLzIwMjUwNTIwMDk1NDU3LjM2NDIN
Cj4gMDEyLTEtamFtaW5fbGluQGFzcGVlZHRlY2guY29tLw0KPiANCj4gSmFtaW4gTGluICgyKToN
Cj4gICB1Ym9vdC1zaWduOiBGaXggdW5pbnRlbmRlZCAiLWUiIHdyaXR0ZW4gaW50byBJVFMNCj4g
ICB1Ym9vdC1zaWduOiBBZGQgc3VwcG9ydCBmb3Igc2V0dGluZyBmaXJtd2FyZSBwcm9wZXJ0eSBp
biBGSVQNCj4gICAgIGNvbmZpZ3VyYXRpb24NCj4gDQo+ICBtZXRhL2NsYXNzZXMtcmVjaXBlL3Vi
b290LXNpZ24uYmJjbGFzcyB8IDEyICsrKysrKysrKysrLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEx
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IC0tDQo+IDIuNDMuMA0KDQo=

