Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E6C8C52D6F
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 12:19:47 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.17])
 by mx.groups.io with SMTP id smtpd.web10.58536.1723119585564898767
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Aug 2024 05:19:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=JVvq0IAA;
 spf=pass (domain: axis.com, ip: 52.101.66.17, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mxBzPac62Zk7vqurURux1g5AJdhM2jqdLd7O0QxWhaurqw9F/bEcUOa+uF+temeesIt1LcxZhOJzF9I7l/eibxlDNHlLUI0iwB1VekPieT2LGHXjpW3ICvrKZVgv7f15loodG3IFKIDTWlYEbs+HjWozxkrQSLz5jzUuxJBZ8FdV5vgbeFboOFbXno0rJwTBJIUKfWQLD1oG78FCKPawvPibYFREiftMWrxYtxda19y7MJJbWJeJ/hZ8gKEQzzmYSs4Ty8+vAeKauVcjNU9vJQt0fe45bF0hq0AU4yr7K8k3Jai57bllfhWlek5Q6zQiga7F0CDcLFyJN8/iVqYZxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKiBTSIq8gpmpim4FK5+y7rQ1PKEOff3QGBxoyolcn4=;
 b=eaeN5F3c/x4y1MB0U8yUX4ShnTpnsmkIN8XKkJCrmiCKMswj4Qg/UpI8YCCK0vrpzUR993HoVgzsTyldmc1q1G5Tneo8o6HSZzQy3nwWHPZjafZeopXfg8q9Gsd/OE71v1FT6Y1osogECbRNDFMiFfxIop28IVmhQtDMRYzrUydzlRISgqmp45oNbx7EBAugLcdHsN1wzyvfCsa3LvMXlT39MnyCmcWBN9lbnrqoWjV+Kuzn5bNB84P8ZdCovn9MMAKXnr/L1064cd5nuZ0P1rb8OW1OZoGCFtSo+bKh5b6uZDQ0nmPipKIOboT20eNqcL4KGQp218dtxlWPiZZFQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKiBTSIq8gpmpim4FK5+y7rQ1PKEOff3QGBxoyolcn4=;
 b=JVvq0IAAoWD3ULfbO+mklRsXW1hMwwKnySYTDcKl0GOY8rkAk3ZttCEzmWCSMxfmppNZAmw7X9OW0X6M48aK75gRx/L/ryJF1uTJ2g/dgqA5wDLUtcG90dmyb2ijp8MxlFvYD+NKQB33+nZqXjvGWt0mXgbbhIyv6NkzRTqReng=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AM7PR02MB6402.eurprd02.prod.outlook.com (2603:10a6:20b:1b8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.13; Thu, 8 Aug
 2024 12:19:41 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%2]) with mapi id 15.20.7849.013; Thu, 8 Aug 2024
 12:19:41 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"pedro.silva.ferreira@criticaltechworks.com"
	<pedro.silva.ferreira@criticaltechworks.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2 1/2] buildhistory: fix package output folder
 creation
Thread-Topic: [OE-core] [PATCH v2 1/2] buildhistory: fix package output folder
 creation
Thread-Index: AQHa6ACaXLhB9mra0EKTWtFmcG3ESbIb9HuAgAANigCAAUfU4A==
Date: Thu, 8 Aug 2024 12:19:41 +0000
Message-ID: 
 <DB5PR02MB102134BCF0AE6781134BE0CD2EFB92@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: 
 <20240806125955.160835-1-pedro.silva.ferreira@criticaltechworks.com>
	 <2024080715553757b6284c@mail.local>
 <ebbbb5b1cfa0dc87360a1d72db7bf009c7264dfb.camel@linuxfoundation.org>
In-Reply-To: 
 <ebbbb5b1cfa0dc87360a1d72db7bf009c7264dfb.camel@linuxfoundation.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AM7PR02MB6402:EE_
x-ms-office365-filtering-correlation-id: 7375b71f-be40-488a-7030-08dcb7a46179
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?TkhnbWp5d29WR3pkMUl0YzRXRmRmUFVHT25xam1INEpvZ0hKelRSMWM2d1Iv?=
 =?utf-8?B?TWxhNW5BMnpMd3A3RThNNlNNWVhWNEsvZ0xNQ0hCcTJWQmJRUnJVZ1NKeGRW?=
 =?utf-8?B?MXFITzlQNFRvQTBDdEtBOU5WdkJLbWIrSUVRYW9xaEdrRGJ5cG9oUFFsSTBj?=
 =?utf-8?B?RmpIOW5HNTE1d1VIb1RnVWdheFZ2MXpaeFNLSzF6T2xvQ201ZVA2UU1lWC9K?=
 =?utf-8?B?UVMyZ2lnSVpWdGFSU3BpaUNLbStUclV0UmRQT05KZnJoUjRuVXRsY1RVcjhO?=
 =?utf-8?B?TXp4NFpvd0V0VENuU0VFb2pXeVNCczNmS3lYbDVVK0N3NWNCd1lYQ05IbEFx?=
 =?utf-8?B?V3Z6UDBUSVJqR2Z6UjNXUjZUTVZJMHJRclRnRFhNKzJONGp5SmNGYk44eW1D?=
 =?utf-8?B?VmQycDFlMjFmaVNCcjlydks3RVBsNlNjSE1mV3Zib3ZQYk9KVk1zb2RlQ3lR?=
 =?utf-8?B?WXNRSW11eC9iendqbmZhcXdjWTJ6SllzQU12Wm9LWkxIUGZQOUpsV3BHdTJt?=
 =?utf-8?B?Vm9lRHFnMWVmemZWMjBVaDdpNklMdWFqUWRLT2drcnhvR3N2YzFDWFlLWWlS?=
 =?utf-8?B?eGVKWjEvVmp6Y2ZZRUplZzlmQVdoUEFOWjd5WGI5d3Ntc2tFNWlsZUFMMGxy?=
 =?utf-8?B?QU5YV0FLV3J4VTdkOHltdWJUekFpUmwrZmFxeTFORUFXenN0OVRXSVdsa0JW?=
 =?utf-8?B?WDlsMHRUZE9uOTZNQ3lETXJrblMzRkRFMHBQa1hab3hRUDlkWWpOR1IxSEhh?=
 =?utf-8?B?eXB3RmpydU9lYTl0aFRHMTBKVnI0V0xXbzJVZ1BGRm5Qc09EdjM1RU55aDZx?=
 =?utf-8?B?d1FQc2hDTGlmNmx5VjVOR1cvUFZrQUxLUm5mUVUyZVNaaW1xSlRIK3A1NkpD?=
 =?utf-8?B?d251YnV2blgweTMraVNvVzliQTFvYkUzY1I0R2hzYUpla2w2WG1XdjdSNXNI?=
 =?utf-8?B?QWkyOHdhK0dXb01vbzEzNG5rNWJYWldxc1ZRSGxvNlNmRzBKOEloaWQzUU5k?=
 =?utf-8?B?bnJta05ZYndYbmpVTHdDTnVBakZlMlVjMTgzQWpwd3dTWm1KWVlmTmp0cGlM?=
 =?utf-8?B?S1dXM3dGYjRrajFDenplVTNFTmFjN1AwSXBZTUxoMFNrejYzOTU0bU96VkVU?=
 =?utf-8?B?bkNqNUhxNVMreVQrZS8zYTgwdTRRVnFKK0NsNmY2bWlWQlVuaFpZOXphUDZS?=
 =?utf-8?B?S2loTW8zdlhMRUZSc2lWY1oxaGRjb29KSXNDdVJxUHcvVHZiOU5FVDdHS0xW?=
 =?utf-8?B?Z3Bzcm5pMmU2ckpHS2xTeG5kYTBRM1k3cGpmeW9rd2ZibUpaMnQ0VStibmRU?=
 =?utf-8?B?cE1UaTZaQ2FsM2kxVDJLeXdqdTJTVmdYTklPM0VyaW9WN0toMWRrWXNPanE3?=
 =?utf-8?B?WVNqaTZoeE5RNmFxdWM4SElYVWpQcVo3VVQzMDczdmVOSE1ROTZvSjFyNWZ3?=
 =?utf-8?B?a1QzM1BtN0VpTXludkFBQlp5SFYraHZoK2pDWXRVL3F4eE1IMFZQN1NZMDZ0?=
 =?utf-8?B?Yk04ZkpMc0c0OVE4WE5maWR2czcwSmM5MXpRNTg1VDd2MXBGbVFXd016Vk9T?=
 =?utf-8?B?Tm9FeW9HM0dIWjh3QkFUMXdoMkNHUXF4Q2tlOVJ3cnV1ck1PRlVQTy84dW5y?=
 =?utf-8?B?UjY3TUZMdmVYYTVZdENRM3pFR3NNQW00WFY2b1BSeDdxUncwVmJGU3dycXY5?=
 =?utf-8?B?ZklzVjk1SlpXblNseTJaQ25TdkN4YUw0SHAzU1VaZ1hyR2lvdnhPU0dodWJN?=
 =?utf-8?B?OTNOU3Jja1dEajZTditYcDF4SFBlM0xUb2hZOUJTQ3pKWFFOb0c3Q0lRRUNL?=
 =?utf-8?B?SzhhT0sxeWlFcjQ3WTRRQT09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dzkySWxxWWhXZ1lwY1FYVGhRS1dvWG5EY3FsWmJvOHBZbWlpejkzK3dKWlVh?=
 =?utf-8?B?aU1wZjVNUnRIcUZSTjRlMkpJa1R2cEFudXUxY0k3Y0tHU0pBVFI4b0NXWUw5?=
 =?utf-8?B?ZVQwL2tNQmdybEdiUVVFVVJjSzJKTndNMjhWcmZGTjVmODgzWkFpdWVzaVNY?=
 =?utf-8?B?a1BPOXVYYS9IS0VUQjZhSXRpaFVLVjB6TnE0SWI4aklGUG1EdENkL0hRaUhG?=
 =?utf-8?B?d2VzY0l0SVZvQ1pGczZRVmRWRGhFYjJRV0tVOFJTQWwyQnVPZ2lIb0hlbmxD?=
 =?utf-8?B?SUU2S2l0WitVNWdzRzJNWDZ4c0RPSzdsSlpTWU9MMzlZb0ZmQ3NMTjNPb29G?=
 =?utf-8?B?MllYeHVZY1NINzhvUVRmejBWdlB2cndwMXdiWGUrQVpkYzYyaXI5UGdlYkNi?=
 =?utf-8?B?WE5naVllWXZlbDdsK2lFQTdmd2JLb0ZmYzJwaVh1R25BS2xxckxBTEtTemg3?=
 =?utf-8?B?bStCaHlRL1R2Z0J5Y0kxS0dGc2V1cHVKVTlnWTlKV3pZTUhieGI4dWZCSjFD?=
 =?utf-8?B?YlluRC8yRk9vdGJNSXRLalhaNEtJUkRMaWtPT1BlcWxkNys1SE9qVHRLOVRx?=
 =?utf-8?B?ZzdPQ2R3Wk85YitRemFzZXVVTVgySmU0WkZEakFNK1ZaWExyMWR5R1VoVWxm?=
 =?utf-8?B?QXJvZG9Mc3hjMXBZL3NmUFJiUXdsVnkxTHY5OEJEVlhpR2R5Zy9FbmdQbVhh?=
 =?utf-8?B?cTVXN25IbXY1T1RuM3J1OTdLTHpHN283bENGMm1UbXVEOS9GajIvMExMdHAv?=
 =?utf-8?B?cXY4RE9semlNZ25uVUZTZ1pnSStVcEp6Z2doNGZmMTVFTXdPa29wZlhUaGhY?=
 =?utf-8?B?VFVFQ0hxdmlySDBnTHBTSTBFL1B3bGRvcEVka0pKZUlNaFZ3TWNBYXNLUzVE?=
 =?utf-8?B?VWtzWHQ0dm9zQUdsSDI0cWh0TVh2UWpmeGdKVThJQ3l0eVYxUU12Ykk4TnFB?=
 =?utf-8?B?aTY5ZUxHQnB6SE9sdFNwNFViZUJqWjdIOVpCWldqcEl5N3hzV1VIQklQQWhD?=
 =?utf-8?B?QUhWNmFqSmcwaUJJZnRDZ3FKSFhmU3hodlkraEIvQTRhOGZlaWRJZmhkV0V4?=
 =?utf-8?B?RHgyc0tHTmxpSkg3eEJwWWsrckVndkM5aFNxeGVEUllTYUh5WTI5b2kyU3lM?=
 =?utf-8?B?Tk04bXV0dkFQKzZiMWFRQmZrSFYwenNROWRkdjRHMkIrT00wZEdweDRYd2Fq?=
 =?utf-8?B?RjVMcGlwNGpsSzRpUCtrWnhENU9tblYvbUVTWDBzWEZHTzAzWmc1eUVhcFYx?=
 =?utf-8?B?bzM4RnBjaktFSlUwSE1EY2l1NVFGZ084QTBXM3lLZGJGMmFPQkllQXZmaGNu?=
 =?utf-8?B?ZlJvRlZYY0l4US91Z3hKQ0l5RXlKdXowOHlLbmIzRkZNNXZVcXc1bmVvRjJX?=
 =?utf-8?B?cGFlZU5oblI2aEMxZ0RrZ2h6YlZ6YnhTVktJNTVZRHpPZVhDRHVOd2Y5bmNq?=
 =?utf-8?B?VnhBSmx4SnVXVnVyOXhQOHUyUUtYRklWVnp1TkVOOWFUQy94V0hlajRCbEt1?=
 =?utf-8?B?QWI5bjlIQU1HK0RqdGRlRFl4K1hKaGtnZnBiaDRZV1Fpc05lc1RzQWVRcWk5?=
 =?utf-8?B?K1ZRTWdEQzJ6ai9sQkY0RlpXZmo2aHpyVHFkSXA0aXMvSTFIeXN6cEZsSDhi?=
 =?utf-8?B?UWc3VXo3RkhwVWx6TFJZTXZZdTdkNTFOQjI3M0VYblJnSHQwbTVjbnQ3U3U2?=
 =?utf-8?B?c1RLcmpjQldxbkZzTGsyN0dOUTNLTjg2VHBGL0lpc2lKdFdCbjIwL2cyc2g5?=
 =?utf-8?B?WXFlVXQ1cXVzMHB1RnJic2gwcFVGbFFtdy84azVrcFRxdjVUZ0ZiYnhyTWVG?=
 =?utf-8?B?TW9HWldUWFBFaTZWQllOQ2Q3WDRVd1RIU0JyTkRHbGJYQ255cXBSelpsOVdm?=
 =?utf-8?B?cmNOdlFKaGJRcmJxd2FMRmV4ZnRJak1peUlUejRxNU9VZTJvRFRZRTB0Umta?=
 =?utf-8?B?MzVPcU0zWTkrNXlkWW13bTAwTEIzUFdXK2hzMHNlTDZTY3pBSXR0Y1pUV1Mw?=
 =?utf-8?B?em4xTVg2ODdsSTRPUFR0c3Rqa1FkRDJUUWF3ODNub2hqREh2MjUrcngxakhM?=
 =?utf-8?B?bEEraGRUZHlFRENSZ2NwcDNIaG10N2FlRmlQSkxCR2dZSlgvanpKVk5BV2w2?=
 =?utf-8?Q?/dSo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7375b71f-be40-488a-7030-08dcb7a46179
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2024 12:19:41.7427
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v+78YURdYO+TO++5EABL4VNWjvzAGqWVyktPL/F7EFueanBYjsLYz2fs9+slQvVT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR02MB6402
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 12:19:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203137

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIFJpY2hhcmQgUHVyZGllDQo+IFNlbnQ6IGRlbiA3IGF1
Z3VzdGkgMjAyNCAxODo0NA0KPiBUbzogYWxleGFuZHJlLmJlbGxvbmlAYm9vdGxpbi5jb207DQo+
IHBlZHJvLnNpbHZhLmZlcnJlaXJhQGNyaXRpY2FsdGVjaHdvcmtzLmNvbQ0KPiBDYzogb3BlbmVt
YmVkZGVkLWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW09FLWNv
cmVdIFtQQVRDSCB2MiAxLzJdIGJ1aWxkaGlzdG9yeTogZml4IHBhY2thZ2Ugb3V0cHV0DQo+IGZv
bGRlciBjcmVhdGlvbg0KPiANCj4gT24gV2VkLCAyMDI0LTA4LTA3IGF0IDE3OjU1ICswMjAwLCBB
bGV4YW5kcmUgQmVsbG9uaSB2aWENCj4gbGlzdHMub3BlbmVtYmVkZGVkLm9yZyB3cm90ZToNCj4g
PiBIZWxsbywNCj4gPg0KPiA+IEJlY2F1c2Ugb2YgRE1BUkMsIHlvdSByZWFsbHkgbmVlZCB0byBh
ZGQgeW91ciBGcm9tOiBoZXJlDQo+ID4NCj4gPiBBbHNvLCB0aGUgcGF0Y2ggaXMgc3RpbGwgbWFu
Z2xlZCBhbmQgZG9lc24ndCBhcHBseS4NCj4gDQo+IEkgbWFudWFsbHkgZml4ZWQgaXQgdXAgd2hl
biBJIHRlc3RlZCBpdCBhbmQgSSBkaWQgbWVyZ2UgaXQgZWFybGllciBhcw0KPiB0aGUgaW5pdGlh
bCB0ZXN0IHJ1biB3YXMgZm9uZS4NCj4gDQo+IFRoZSBwYXRjaCBoYXMgc2luY2UgY2F1c2VkIGJy
ZWFrYWdlIHVuZm9ydHVuYXRlbHk6DQo+IA0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJv
amVjdC5vcmcvdHlwaG9vbi8jL2J1aWxkZXJzLzEwMi9idWlsZHMvNjM4OQ0KPiBodHRwczovL2F1
dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdHlwaG9vbi8jL2J1aWxkZXJzLzEwNy9idWlsZHMv
NjQ0MQ0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVjdC5vcmcvdHlwaG9vbi8jL2J1
aWxkZXJzLzExMC9idWlsZHMvODIwMw0KPiBodHRwczovL2F1dG9idWlsZGVyLnlvY3RvcHJvamVj
dC5vcmcvdHlwaG9vbi8jL2J1aWxkZXJzLzEyMC9idWlsZHMvNDU3Ng0KPiANCj4gYW5kIG1vcmUu
IFRoZXkncmUgYWxsIGdsaWItaW5pdGlhbCBicmVha2luZyBhcyBpdCBkb2Vzbid0IGhhdmUNCj4g
cGFja2FnZXMuDQo+IA0KPiBJJ3ZlIHNlbnQgYSBwYXRjaCB0byBmaXggdGhhdCByZWNpcGUsIEkn
bSBub3Qgc3VyZSBob3cgbWFueSBtb3JlDQo+IHJlY2lwZXMgd2lsbCBiZSBhZmZlY3RlZCBvdmVy
YWxsIHRob3VnaC4NCj4gDQo+IENoZWVycywNCj4gDQo+IFJpY2hhcmQNCg0KSSBqdXN0IHNlbnQg
YSBjb3JyZXNwb25kaW5nIHBhdGNoIGZvciBsaWJkZXZtYXBwZXIgaW4gbWV0YS1vZS4NCg0KV291
bGQgaXQgbWFrZSBzZW5zZSB0byBtYWtlIHRoZSBidWlsZGhpc3RvcnkgY29kZSBhY3R1YWxseSBo
YW5kbGUgcmVjaXBlcyANCnRoYXQgZG8gbm90IHByb2R1Y2UgcGFja2FnZXMgaW5zdGVhZD8gT3Ig
YXQgbGVhc3QgcHJvZHVjZSBhIG1lYW5pbmdmdWwgDQplcnJvciBpbiB0aGlzIGNhc2UuDQoNCi8v
UGV0ZXINCg0K

