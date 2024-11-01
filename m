Return-Path: <vince_chang@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9464E67493
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 01:04:31 +0000 (UTC)
Received: from APC01-PSA-obe.outbound.protection.outlook.com (APC01-PSA-obe.outbound.protection.outlook.com [40.107.255.116])
 by mx.groups.io with SMTP id smtpd.web11.27387.1730423067172593733
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Oct 2024 18:04:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=HeHusHA/;
 spf=pass (domain: aspeedtech.com, ip: 40.107.255.116, mailfrom: vince_chang@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RjpTwBCJC6fgBfg51qwCHMS5b0MFxqqt0QV9sBTIk0v7ll2Hi2c5Gk/VzBmm8oRbO306ed7d+5w2TwsB1xdiyM8IOasTARENrJBSt7ADoz3d3TIZSzF2224ssdTeEzMuyTMlVdQlFFONi5XkUWSNCLoOchkUdP85acgGDCYlmJOyofjHDsnnUzb2gy/BZBlUmsv/6l6r1Tw2i2rHL2HKIFKB2q+JiQ9D58L/iIKkArqwRakN1LPpXZkUqYR40E+6Gz/mHvLIj4z8F9pXk4U55TtL9aDWGYG1blNt7X8nQDb6x+8gyJ8vQiUHl7/vWAfcVAsLbHGskFUsYtfvATBaig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mi8Elg0jhYOQrOa6aKpfy430dkDJOAmrJm2Y+upVRgw=;
 b=nf6+MhGjvDDLs7vakNuA4KV5aE8Cd4a+X4XBviVcczRdy+X2CBFmNKOuKkg6UMF9sy5AosJEgQ1f6yRZkrRnSzZ85qTH1OjjrwrhWp4NKHCmhzTB5q4SWxI3wLhyeB6FmEtID3VwmRaMBK6fazTQoaaniiE9lK+WJKfvjpAkP2qQ/ssez36q+wE3yn3sNiDyBj6ac99qtX62z2dmZX49Un9G+tSCtI0ElIab/ARB/Ln8OipkB+iy9opQT5QY7r5My8puHjjf6RNFz6nN104Ewh4HuSVzm1ykAdhPShGgXLx/R93KVTKU1Gz3o0NE09e7OdY1LTildkwryV/vxSIS8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mi8Elg0jhYOQrOa6aKpfy430dkDJOAmrJm2Y+upVRgw=;
 b=HeHusHA/1/g+8ivnXvSKDya//uJq9XWH6VWfKnUcE6UveuVzeopkfuahwd/6lJmd8S0w1/n+p4D6Dn11zy5tqCrDsSxORo28Q2IAsxHnFUygLWpfcSTxRr2UEz4EbAjAJvdqtWFnw02XVsOPlJdwso9SyfJbBEMoEsnmJuQK1D+l7wmhZY4Ddb97xT3hxvokLVi2p/7Hk+8WIKy/GdVFwom4J2zfRFU9ZrfwnWYfhxukSCMfKmS9f+YlCghBuSBWIlJjMIcABe5bBTYi0dH5WTa/ls4YBFVDTl/nlg16Q+gF9Mmy/G9ePUE7lvA7ax3lcZOvX25w1UHlbP1pZhAGNw==
Received: from TY0PR06MB5707.apcprd06.prod.outlook.com (2603:1096:400:271::10)
 by SI2PR06MB5066.apcprd06.prod.outlook.com (2603:1096:4:1a6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Fri, 1 Nov
 2024 01:04:21 +0000
Received: from TY0PR06MB5707.apcprd06.prod.outlook.com
 ([fe80::7918:f902:3ec1:4e7b]) by TY0PR06MB5707.apcprd06.prod.outlook.com
 ([fe80::7918:f902:3ec1:4e7b%4]) with mapi id 15.20.8114.011; Fri, 1 Nov 2024
 01:04:21 +0000
From: Vince Chang <vince_chang@aspeedtech.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Jamin Lin
	<jamin_lin@aspeedtech.com>, Troy Lee <troy_lee@aspeedtech.com>, Khem Raj
	<raj.khem@gmail.com>
Subject: RE: [OE-core] [PATCH v2 0/2] wic support different sector size
Thread-Topic: [OE-core] [PATCH v2 0/2] wic support different sector size
Thread-Index: AQHbKsvcoIRhmSl0kE+pCMCxVX5HWLKgHE0sgAAMCgCAAG2SAIABBg1g
Date: Fri, 1 Nov 2024 01:04:21 +0000
Message-ID: 
 <TY0PR06MB570732A6C54A787FB10C50B6E2562@TY0PR06MB5707.apcprd06.prod.outlook.com>
References: <20241028034618.1504830-1-vince_chang@aspeedtech.com>
 <CANNYZj_KF41W10duL5u0mDDbv1aFUxdcGAmUtO2fEc0EtZ4ymg@mail.gmail.com>
 <TY0PR06MB5707BE94581CC7F425214A2EE2552@TY0PR06MB5707.apcprd06.prod.outlook.com>
 <CAMKF1srdKcP7HMPkQF+iCqOkCfpGv6oB0M8R7=qbO3C216xgmw@mail.gmail.com>
 <CANNYZj8v9LUJFDXqBms6Yg7F0t=xQZAcCg417x00zJxqeYqtog@mail.gmail.com>
In-Reply-To: 
 <CANNYZj8v9LUJFDXqBms6Yg7F0t=xQZAcCg417x00zJxqeYqtog@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY0PR06MB5707:EE_|SI2PR06MB5066:EE_
x-ms-office365-filtering-correlation-id: 939ffcf4-9dc1-40de-355d-08dcfa111e73
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?ZXp3YXVPRHhuTmU4SHp3ZDA4bzRiWTlxeEMzdEluWTZ5Y1BHNjhhT0pCUjY0?=
 =?utf-8?B?WjJOZlJxWm5PUkk1T1VlRWdldlFwRjE1cDVSVjlVT0tNL2g3RldxaVZGUWVX?=
 =?utf-8?B?Y0lrNEJ4Yzh0alJjTlJUN2lhajdaU3V3aTlyVzhuVUxNQklJN3BpQ1JqdHZD?=
 =?utf-8?B?a3lSOUtzL2dZK0ZTRFp5c09NRG1FMWJOR2xGUmFoUzl5N2pya3hwY0QwNkZs?=
 =?utf-8?B?TmswRHZEaDlEb3BacnFnQkxRell0bVBpV092d1gvWVplRURKa09JRHcxc1dF?=
 =?utf-8?B?elNDa0pPM05DQVlwZE9xaFcvdTZkVE5TMG50bVE2T2orN2tpUzB1WUpZL1Nr?=
 =?utf-8?B?ZGNqdW9UZThWa2VMNmhEUEZ4VXMwQ0lrbEp4LzdWUkdZaUN3WllvMWRJajNG?=
 =?utf-8?B?STlRZnNUSGg1VUplK0l1KzNKQ1V0SzllR1FoWUJmdEtlOEo4K212MzB2YXZ0?=
 =?utf-8?B?Y3NHQTVKWE5YZEQyNFUzTU90STNacjVVeFRqaUxrYWdJdmI3Qm1qc1pJUHEr?=
 =?utf-8?B?bU9SUHQ4c1o2Y29Db1EyeDZoYS9oaUJxWDQ3TVpkYU93QlRWcG96QWdScWpx?=
 =?utf-8?B?S013b3VtbzluVHo1Y1Z3YlN4YkR6RzlvM1JxYlA5aXcwM2lTQkpyN3UxWTgv?=
 =?utf-8?B?dFdRV0hGTWZlekg4NlZ3Ylp1dEFhSGhrSk84QnBQYnZuNGJRT0Rqbi90SFhO?=
 =?utf-8?B?YlI4SXQwU2hNaXdhZWI4RHFUT25mMzRHMHFERUNUMm93Q1ZiWnU1RXhpMHdY?=
 =?utf-8?B?MzgydDhjTEdYZDBjUkxidExuSUttNmJBbmo2OXNVZDF4aUZUV1U4RWE5R0RO?=
 =?utf-8?B?YXNkRjlWYzVGMklpU1dTTlhmakdyQjhrOGJlUHhUd1lZdmVrdmQrUGpkbkM4?=
 =?utf-8?B?cUdmQW9Pb0x6dnMrZWVNdXZ4elI2b0Y3TUdyUGlmNWwrSGZDOFJQOXZRQW52?=
 =?utf-8?B?MUtsRWwzRHBwMVk3ZEFWbFdyK2U0K0ZQR3pQZmpGZmE3T0Fueng4eXdGdnFl?=
 =?utf-8?B?SWtFclA2OThQZU44WDVlVnRPdkJBN3ZqdVljUHVKZ3NmMWh0M0hVb3JnbG9R?=
 =?utf-8?B?Uzc1TjJhdlRwS2huc0pjR1VFVXBjMmpoZ2VEeDR4Uk5DallQbjd0ZzhoSHJL?=
 =?utf-8?B?THE3dHJhUjBhUjFxS1NpME4wTWV2b1A5cDVJY2Z0WkEvWWhJZVhEUVgwMVM1?=
 =?utf-8?B?WmxnYkdXWVBYVGVTTjl6MTNHaFF0M3dMWU9pemFxYitTYzArbHFJVmhoT3Ey?=
 =?utf-8?B?R3lFd0dRekJOUHBvNGIvR1RPSUJkTENIeWdydUZvTU9aeXdsNE9Zcm5TRzll?=
 =?utf-8?B?cEU4bGs2d1pDZnluRUFQdFdYUEpZUERtZkQ0dkVHRVNtMzJmNjlGK1J3Y3RI?=
 =?utf-8?B?dUpDTGdGM3JubEIwM1JuY3Avc2xuTlc4YjVCRkJUNTd6dFltWFdLNXltcnBo?=
 =?utf-8?B?UEFtY0lDeURKeUpVYmEybUV5ZTNVSXpBK1hIM3BKY3h5UDNKby9td1VGTyta?=
 =?utf-8?B?UHJkcjNtR0pQeksycG5INUJpMWpjVmgzKzcycWI0U0NrRG13UnFYeHF4N3gw?=
 =?utf-8?B?RDhESk1WS2lleDd1ait4ZHU3L0lRWGFWQkFlM2UzN0hTaEkvQVlqYVJrOENQ?=
 =?utf-8?B?dGtsQ1cwMjJ0S1RDYS9LaXFadThrSVdDeDZjelpUNit4K3NyRE03b3NFemJQ?=
 =?utf-8?B?Z3Z5UDFBUHNtZHJ4RkdId3phWTlPWHJwL3BrV2JDL2MvRFFmOXQrVDZONitw?=
 =?utf-8?B?dldhTUdWT1lYQm9HQUU2a2xWblMyMTdPY1EwQkVGMWpTVkZzQmlXYjhmYUlG?=
 =?utf-8?Q?TLNSa86rRKMgJ1qIEDo586/pxGqbz2KV8jiHw=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY0PR06MB5707.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?ZDNTTEdwR1F1dU1jWFo3bmJ1czRTRTlxTlMwNEtyN3lXMUlCdStSMGZyS1hB?=
 =?utf-8?B?NTVsY21iWXB3UzdLaFErT2lsTTkwcjRVeUIramRBSWRhWTBTRlNYYitjOHdW?=
 =?utf-8?B?cU56UjRuS1M0dkdIbVY3VGhXdnpmeVYwczdzV0pUWnV5T21RaUVPWitWL01n?=
 =?utf-8?B?cDU2TTVDZjJWbXE1WGQxS2M5SU5DSThFYUh0RDZZdklHMzRmV1ErU1R4b1BJ?=
 =?utf-8?B?UWJReG45ZVFweGpwdS9YTUpidHhSeFY1SmhkS3I3eWMwM3o0YTgzcFQzL0Zm?=
 =?utf-8?B?d2NydXIxd3hvak8xanhEYnJmYUxBLzJ4RXo0eStOK001UlQ0Q2hzUnBIUnpL?=
 =?utf-8?B?R0pYMWFRVHdiRzdXUEs5d05HbmFGaHJ3Q0czVTY3Z0lScDVoSEwxYjhvZHBy?=
 =?utf-8?B?b1pGU2lETG5PMjg5Z3A0RGJUS09mbEE1Uzd2SnJrR291a3UvNGVkWGZNYXVJ?=
 =?utf-8?B?M2tTaC9hZmpXQ2YvMUduRmtLdGlRckVmUDRTcW9zNlBQOWdEaTNIQTZNeTNY?=
 =?utf-8?B?eGovWlQzN2plU3d4YUdHYkozZzNacnpvdjJENk96V3pad1FPUVJxR1d3QXVU?=
 =?utf-8?B?bkIvbzhPcisxN3VzL1dmb0dGK2dUMCt5dncxODVtc1ZaTFpiSmhLVFpxVUU1?=
 =?utf-8?B?YzVWU1JIMWk5eCtYRU5mbXVwL1M2Nytrb0RBVUk4eVRidDBhSHlNYVI1Rk5F?=
 =?utf-8?B?STZsbE1hbEVzM25WQkVmY21maXhtTEMvVEN0QWV4VUZsZlp3ZTVaQ2pJaHla?=
 =?utf-8?B?M1pJaTh5ZUdYOHRNR1JQaEhXbnlCVXZLR0VSODdSNjFKay9USjR0QjZiUUgw?=
 =?utf-8?B?anFXa2J1UXc0YmtKc2EwcHBPY3dXd0lkOUdRYlNKUXZ4eWR4WDN1WjRodVFL?=
 =?utf-8?B?bldLcU1uNFBSSjJWYkpQQytFdHpQT0NSdms1a2hkbjBaY2o4TWhyOGJjdHVJ?=
 =?utf-8?B?U04xWUlVV2tML3EyRjlZTi8zNno4b0srMSt4Z0xZZStOTmlrMUlGZXRndVV5?=
 =?utf-8?B?SlpPbklKZnJOUXNZblNVVXJ3RmRIRmdXdzFieWJ5NU5vMElheTg1eFZNOGcx?=
 =?utf-8?B?Z2F2MzNCbkM4MHhZZVhISUxDWEEwU1RyQXJXbkMySUpOM0lrYXpiOEoycnZo?=
 =?utf-8?B?RElHOU1Gd2lUZHJNNTFwcnlMSVMxR2xrbCt6T0ZTZFZtNDN4YjFiZGFWcmpR?=
 =?utf-8?B?UVRYZFlJaVl1VFV6MEswM1RHaVFnaXFCTnhyTkVFTi9TeUcrTDNDcUJ6WVhG?=
 =?utf-8?B?YVpES2JBU1pUcWJMU05TSWlLaWV6NXV0aEpjem12T0Jrb2R6d1hhUEUwZlJF?=
 =?utf-8?B?ZG9YM295VkN1bFM2alNheHFLSnRiVGFQQW9aKzhOK2R5VDdSaWxTYkdhNVFD?=
 =?utf-8?B?TmFoUld0UkZieFJGa3BhREZOWDk1a09xdGtnM0c2R3lhRk9ITnpJazdkV1o2?=
 =?utf-8?B?WE0ySjNiV0dic0loN1RySndvbWVwUlNwYXMrbjdtQjI0QVpqSlVJUTUvaWsr?=
 =?utf-8?B?ZFRodE1sZnJremJ1bDBTY08vbGR5VHFTUXc3YUpRTjVPcHA0MEN5cWdEdnZJ?=
 =?utf-8?B?Q3NZOE5wUXUyVDFnY2tvaWZvOTUxSFVpRk40Tm5FdjBxYjFsUXo0QVc3Ujd5?=
 =?utf-8?B?ZWJEcHRWOVVVaU1uTzZYNGdzd2hmQktTUDl4SEROS1NBNHhUTnYwTlNEbzg1?=
 =?utf-8?B?RkcwbFlMYTVoNkRncHlqd1VKTGJFQjQ3TVRrVUQyU0ZWRXZUNFlVb3lwR2pv?=
 =?utf-8?B?NFpnejBXcmNHODA1Z2U4aXFVbjd3NktES1pjT1M0QnhZNlViUWVBZ216Q1Mz?=
 =?utf-8?B?aHV1Nmt0SS9IblU1ZjluL25DRU9tUUZYQkVPTVlyZWIzK0IrSGJ6eFFiTXpl?=
 =?utf-8?B?UFVTNWcrNXg4VzJXRURQSHhKL1hNVGlmdDZJektYbStxREZPN2taNXRqQ2JZ?=
 =?utf-8?B?NnN1cUJDMEg4cEk3dzc2UEp5SmM0RGgwYjAzQnVpZHYzc2dZOUVUYjVsa3Fa?=
 =?utf-8?B?VDlWTnNyb05xS2NPZ1k4bGVXQzlhQkxlajRCamxYb2ozSnI4d1FKVTNMOExw?=
 =?utf-8?B?U0phRk84WFhjc09XTElzUWJKdUhreG9xTEkrSlc2NDdnVlM4OVdIMldVWGw5?=
 =?utf-8?B?YmEvem04OUFmK2NQYTRtY1orMXNzbkc1U1lOTnUvN3YzME5EQUFEUVZXYldh?=
 =?utf-8?B?SEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY0PR06MB5707.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 939ffcf4-9dc1-40de-355d-08dcfa111e73
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2024 01:04:21.1889
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hrSe1c+C52R+PaVGZUtiRodH+e9LVfih4+mvorwu1t5ZNryXslbm08y/BmD5lJ2f9nXByRiPg/sN3Ux6x8rZKIov5d07irxwusdPcSbtawU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 01:04:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206597

SGkgQWxleCwNCg0KT24gVGh1LCAzMSBPY3QgMjAyNCBhdCA1OjE4IFBNLCBBbGV4YW5kZXIgS2Fu
YXZpbiB3cm90ZToNCg0KPiBBbHNvIGlmIHlvdSBjYW4gKGluIGEgc2VwYXJhdGUgY29tbWl0KSBk
cm9wIGFsbCB1c2FnZSBvZiB0aGlzDQo+ICIyPi9kZXYvbnVsbCIgcGF0dGVybiBpbiB3aWMgdGVz
dHMgdGhhdCBvbmx5IGhhcm1zIGZhaWwgZGlhZ25vc3RpY3MsDQo+IHRoYXQgd291bGQgYmUgaGVs
cGZ1bC4NCg0KSSB3aWxsIHNlbmQgYSBzZXBhcmF0ZSBjb21taXQgdG8gcmVtb3ZlICIyPi9kZXYv
bnVsbCIgaW4gdGhlIHdpYyB0ZXN0IGNhc2VzLg0KDQpUaGFua3MsDQpWaW5jZQ0KDQo=

