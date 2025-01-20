Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D2B0C02181
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 12:50:53 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.14])
 by mx.groups.io with SMTP id smtpd.web11.35755.1737377444681992374
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 04:50:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arm.com header.s=selector1 header.b=b0fhF4fr;
 spf=pass (domain: arm.com, ip: 52.101.65.14, mailfrom: ross.burton@arm.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GDxMmkrk2yQugDtB2tFhpb6Kw88EajMPN6MAi0x2dLyL1OINif3dBy3A2Y2ytzYtyLoeH8nQxd2K2Kd9CmqmzNhqzHQbqKgYuCOoCdyESmD15KDRxQnK55WyOZPin9zwJxjwLIvgGNQdfxNN3ChU2TuEq32dhF4ngkGXjyZn6geBTYglkLqVKyArg0k/XLF2rTqmDHCwBDVzxVu1ZNJxNZUaJspLhNhJo8EhRW1xucBp2UVJ7t3DFYzp46EhwZVJbg3NV5/L9ZEEdDysuy1SMrGzqwfYp7UE1HJa5uRTU4rYrrn3QWzH4lg4HwaWE4sNuqhOfkmYp/95KP4qIYXoGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSTVNHfoSV28ujeW1EOf6tGGEXfFornjlZopO558Pa4=;
 b=MNTPdqavSU9O/fhArTOqTb/f4zQXYsTMcuuRj5xKnwz+hh1v705vjJr/8D1skEkPwG1fvmeAkwG8ffasSiYL/nINIerc2z6eeRf59j7wbLVfI00l7x4F7PiiwFupkE/wjzSNWSi41tZb+gslb2haV4KeK3tU5bPDwA8Yb2Yv/22dT8xx8lOA2uciAzTY8aH5l1li2KxzWuY3Aq3v/a2DvggILbqrn6kadDQuemW/6mvryifGdYoFnefkt7gRGP+btsI+uaffu7IZPp73mDtLMVTibdQfR/3i7WMzHNQXOnUFNAfGAkNkmH3MMy/3jWVafsP3HDP4ge9/FZOd9oBJ8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hSTVNHfoSV28ujeW1EOf6tGGEXfFornjlZopO558Pa4=;
 b=b0fhF4frWceJNMJ9MUPCeUT5S8c5ZAbSxr66Tr/6VMSpyC3lYYa0E8aws33q7Dcfayb7oW8y+O8+7KVeofov97qq8QlT9eppgiVruUqPNUEvVdF60O7tt9i0ksO9xPkfECNTD3A1PYKqcpU7QdrTStj4KWLtFoAhM15VdOUXKFg=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB9008.eurprd08.prod.outlook.com (2603:10a6:102:341::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.17; Mon, 20 Jan
 2025 12:50:40 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9206:40ba:ef7e:729e%6]) with mapi id 15.20.8356.014; Mon, 20 Jan 2025
 12:50:40 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "madmarri@cisco.com" <madmarri@cisco.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "xe-linux-external@cisco.com"
	<xe-linux-external@cisco.com>
Subject: Re: [OE-core] [master] [PATCH] strace: add vendor to CVE_PRODUCT to
 exclude false positives
Thread-Topic: [OE-core] [master] [PATCH] strace: add vendor to CVE_PRODUCT to
 exclude false positives
Thread-Index: AQHbZ2JDu2qPamg1VEKWRc3wSbGM97MfpP+A
Date: Mon, 20 Jan 2025 12:50:39 +0000
Message-ID: <BC950F0B-669F-4E2F-87E4-0C176409EFF2@arm.com>
References: <20250115152909.2368573-1-madmarri@cisco.com>
In-Reply-To: <20250115152909.2368573-1-madmarri@cisco.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3826.300.87.4.3)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR08MB7411:EE_|PAWPR08MB9008:EE_
x-ms-office365-filtering-correlation-id: 011ca141-fdaf-490d-db72-08dd39510b3f
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?emJrU2poclBXcDErSSt6ZCt3dnhYK2g5TGJLTy9PdHl1R3ZpUkVTRDlYUFFG?=
 =?utf-8?B?dzZIRWpsclFOS2pZaWo0ZEpVSUw3WURKOVRERXJPc29YUDJFeTRsNFBCZWdk?=
 =?utf-8?B?UGRldlcxczd2Y0Z2aVYxM0lOcEtKRXRMTU1jYTJ2OWRoWE93NWl3dUh1MFdU?=
 =?utf-8?B?WkwxWWgrSTBheFhEZUhwS1V2VXdMUFNWNXlpYmJnaWwxS2hhME8wcURUUlhL?=
 =?utf-8?B?RFJFY3FSKzhyVE9hSURpdWx5QlduTmlFTFRGRmlLeGRLY0ZRQThTVGlacXQy?=
 =?utf-8?B?L0xBVDlQTVU1MGlWdUZON3A4RDJPQzVjTmRDRzdhVFRzN2cxRmgrVGZRYW1D?=
 =?utf-8?B?U0lTT3JzM1dLSGorWkRKSDI2QlN1VXd6YU9lR1l3TnlsN0V3a2J4aC9wempl?=
 =?utf-8?B?c3E3eld3aktHdlJVQzhhajM4dDhuTHlONjdUdHZFQlpCc2FEdExLZTRSMjdU?=
 =?utf-8?B?T3BuVmJVKzdJbHB4MnNQSGd6ZUMwNlFob1pBSm45dWF3ejFTSi9remR4NmxH?=
 =?utf-8?B?bnduR1E4eHBYb3BvZWJLRmYwV1Fpd1pENFZXT3VNbmk5S2hLa1B6WksvMkpW?=
 =?utf-8?B?S2liQWVlbFAzYnczTUc4WnNxWWdFR2Z0dXY0c0Joa1FLOFJWMElhMFpuR3NF?=
 =?utf-8?B?c3ZXa0R5VVZOUWpHZEhJbXQ5YWh5clhGMjRkVTVoQVM1cjlUelVZZXpMNHli?=
 =?utf-8?B?SHNGQWxuR09OcXloaDR6bklZdVNRdnZleW9NUDBRdFo5VUVmRVNjd2hEZmxy?=
 =?utf-8?B?VWZlckt2TlYvb1pDMURjbTVYSlgxU3pBbU8zVE9RbjJjYk1SN0FoUDg5dzhz?=
 =?utf-8?B?WjBtb0lMbTlKNWJLWjhmWnNBbDRjNWMxK01QdHBqOGJVRkMzSGc3UW0zbnhI?=
 =?utf-8?B?OWo0UnJGalF0T0taQlZ2L2MrUW1VN2FRd3Y5amVUT2wrbSsxVmlhRVpqaEwr?=
 =?utf-8?B?UUhmTlcyWktsRDI4RjVVb1lMWXJOWkx1S1NlRS85MlFUeUh0U0syeE1DaU5S?=
 =?utf-8?B?Wll4eHkrMmZldytoaU9hbWVpNFlITkFwYnRGWmV0SFdvb3V6YUdLczBMUkJx?=
 =?utf-8?B?M3ZRK1dxeXNwN21zVmJIbmlyWW4zMzlTRHYzQ1pwRUlvZGY3dm0yc05JMVd5?=
 =?utf-8?B?NVQ2U1NWOTExWGhIS1FCV2FqQXVhcm5lRXZSQkZPaHhKTjkreFhLMWh1c0cz?=
 =?utf-8?B?WWhKbDlSV2tneGVyT291YVMyVE5NdU01b2Q1M01seC80Z0ZyNDBpSVJRV09P?=
 =?utf-8?B?dnRwVGFjR08vUU1qc0JBamdJRmpPMWJQdVdybzhtM2R1dDdoT1p4eEhaNmxo?=
 =?utf-8?B?UVNxcC90THdYeXlLK0RVcHJkQnI5NWhrMDFvMUxnR21kWnhaNU9OcXBCSU1Q?=
 =?utf-8?B?ckxqUnBpK2JpN3BaNFAvQjJCNFJTcm94cE40aHArUXhqbmpOR01ZZXdXU0Fv?=
 =?utf-8?B?R1dndzZYSkg1eXVOTmhYSDBXV2pWWHlhUGhVbCtlT3FnaXgrM2NDSUZSUG5K?=
 =?utf-8?B?aVhXRVppOWZjOFp3ZlZzMFZ3ck5YdlF2NFNwcllzQzVJZnQ4S2Y1MmJxS3J4?=
 =?utf-8?B?T3IxV0dZYmRPVFAwWWJBTnpERmMxR0MrUVFjd2JGb0ozMjZkWnpnSjYveWk1?=
 =?utf-8?B?UXNSeFl3eldJK1pYTmNQMmpMVmVzV2hWeloyaDEzWnFEVDBseXpVY096bmR1?=
 =?utf-8?B?MGVXdDIyVmdYcVhveDhHOSsvNkkvRHk0TUdmV3BFbWU3Z00ybVJkWFRyZ2JC?=
 =?utf-8?B?Q1ZNVWJCRmhXZ2pQUmYxNzBNQk1hNHdtZFlZYnBLY2czMXNyWld4YUJLckFx?=
 =?utf-8?B?Y3pYZXRXcSs1Zmo5U095ay9XNk15NGhUZHY4aTVHYWI1UnZhM1paUjFwYklo?=
 =?utf-8?Q?8yMC82+mWQj+w?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?THFUL25KZXVJWkdpazIraW1UUjhROGxZYjZjcUR5NmZYWUtkblp6Y1ZDRlNr?=
 =?utf-8?B?T1ZkNEo4dTlnUUZxdVpaMGYwTXlyVXR3SzduQm5lREFQUzN0c01sbjhvam54?=
 =?utf-8?B?VjNnTy9SSkRoMUNwVDRRMEpaR0JBYUxrZithL0lDR0h2QnBFckpjRkFEbkVJ?=
 =?utf-8?B?N3JOYTRTYmNMbHorN2Fjbm1LNU5TUGEwT1k2Qzd6dlNYRUFxZDdsUi9JWGFO?=
 =?utf-8?B?eWV4TENpbUhOSDVRUlNxcEY3c2NiQVN6c1VoNnBQWldGbTBuLzBmYlVrdER0?=
 =?utf-8?B?Sk9hbXI5eW1EclQxQy82SGlxUjE0WXcvdFAxWkVtNFRWdzRVTmpCNnRBZDFl?=
 =?utf-8?B?b3p6RDVhUEFBV1U2WUJ6Tmk1bStvaFBHdWRiK3N2V2VmVHJDbGhOOVJnZ2t2?=
 =?utf-8?B?ejJIYzdEUHkzTzg0ZEpMeXNHeUpicW9YaE5VU3ROcEc1WG41Mld3aWd0OE8v?=
 =?utf-8?B?N0Q0ZklqK3BPQUV0YWVRWU9tYlRDYXRQU244NnNnRGNPc2JVMGlrRmp2OGNF?=
 =?utf-8?B?a3llL0h6WVNkSm05WktvSDZabkpZc2oySFBFSE1BcFdKWHpXY2NiZkxkSUdL?=
 =?utf-8?B?TEduTVhjelFITHB0aWtVY1l6ZFZuMkRtNW9QellhU0p0alk4OEZ2aWNLNXJS?=
 =?utf-8?B?RTRCMU95bzd5N3NacnNjeml3cXlXM1l1UXNpWllHV05IL1RJeFh4YkswU1dN?=
 =?utf-8?B?QU9lWmFLclYvU09mUENMaW5lWjM3WUg0RnRFODhPZFRFTnNwdHdoVWp0V0ht?=
 =?utf-8?B?cE9ZbitMQnhsOUhIM2VxbkNPMnZUcWNHSUQ2aUVLTUxNWU81a3FNVk42eGZV?=
 =?utf-8?B?S1dDYTJHK0w4emZuK2N4YlhSUG4yUEY2R1JEUGhNRnptS0ZyQmYwYWZyalhT?=
 =?utf-8?B?U0FvRUVKbzhxSTJtWFp5OFNhcXV3M3pFVWxnWU96RVFpcVhXb0F4Y00rS0hL?=
 =?utf-8?B?V1BnRkJuQkt3TDFSaVpZd2c4SWZCTFoxWkNRcmVZbFdTMkc4a1V3cmFJeVlx?=
 =?utf-8?B?bkdnVGlPT21HbmR4Q0tvd2gvbTdvVWNtcGQ3K29DNFB3SGRMYVJTNEp1Z0Nh?=
 =?utf-8?B?NU12LzcybEZtUmNLc0R5Z1VxZG5BTElma0tacmx3SElXOVVCYXFTbWh5S2w5?=
 =?utf-8?B?YkprOXc3TmdqTCtWdXRnM2ZYT0hOQlFUazRUeVFUNVhvWENzVmFUVTdHTytx?=
 =?utf-8?B?ZGNETWdRdC84bjBpQ01kbWRyMlhRVTZ6eXBLZGxDOWFXdUNjVHNyRjd6UDdB?=
 =?utf-8?B?QXB3MHA2WHUySnNhdktGa3FJbnNrcmdXcHFVb2lZSDBOdnMxQmVybjhxNFVM?=
 =?utf-8?B?R2ZKejN3WURiSGRLSzd5QXk2MVBxNVBpcFU2RURFQU5aaDJDUVBpQzBYSkVV?=
 =?utf-8?B?STJhV0xJVTBiZDcvZmpXNzBTZWFWM1plZlFJY2IvVldVcGl3OXBJVDVUNlNh?=
 =?utf-8?B?UEZoSm8vR1VhUXJCNXNhUHZhU3ovSXRFRUFxSFEwT0lIcFBYTldPZjBZUjVP?=
 =?utf-8?B?dGVFUmxGUFhnT3NDbWtyRkZJbFZmemlEaEpiNkdmdG1IUEl1dFMzZWEvUjY0?=
 =?utf-8?B?M3QzcXJ4Tjl0VTJ0dEY2OExnbVc1cEdvbzd5aGVRamx3K1ltZGxlSndwempT?=
 =?utf-8?B?TTR1dDB4VFY0TU05Q2hQOFl5Ulk0Z1ZCdEljRTJNektUQlY2K0ViWXVaaTJh?=
 =?utf-8?B?UkhQNzlFcEZSN3ZOL1JnT09KSjJldDkweEZ5WEZZZitid3ZlYVozY0ZIeklU?=
 =?utf-8?B?TlV5RnFxRnhsakdwc1dLbnREd2taMUNoZkdsdE5IRGpFaFRaaFZFeE4yQThS?=
 =?utf-8?B?dGlvdXZrbXBEZHgvZ1paWmM5SFZhQnp5b0hGSDc1S3k3ajZkVU02TzdHczdB?=
 =?utf-8?B?ZlBSTHdXUlRsY3JxTm1WS09ETGtzOXAvZVozOUpwbERtd1V0MnRNSXhNaVM1?=
 =?utf-8?B?T29pa2E5ZzdyNUcrVWNwMHNzWFdUZ21pWFFKdWZzd0xYWXVtUE5CUjNsVW1N?=
 =?utf-8?B?NExLVG5ZZUtiakE4WkpDbElaM3ZMaEdSYXVzN2lua3RJc3BXUUQvbUxaQUJ0?=
 =?utf-8?B?cUN3dmhFOXk3WHdzSlFadW1kN2dOUnBEbGZvTzFsZVc3eUR0YnRic013dEVU?=
 =?utf-8?Q?Mxb8FWjEgxtbTzBUAHwUVI+vG?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2F1F3BC5A560874ABA8E99CDD11F0083@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR08MB7411.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 011ca141-fdaf-490d-db72-08dd39510b3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 12:50:39.9768
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tVkEz9IJMRIACFJ6EWgoMI/PqYOQceHgSpI8VTVdBwn1KHuqzy1rFSzAs6G1Z6/hEZIxpHBcqFJYAdflRs5LMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9008
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 12:50:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210027

T24gMTUgSmFuIDIwMjUsIGF0IDE1OjI5LCBNYWRodSBNYXJyaSB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8bWFkbWFycmk9Y2lzY28uY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3Rl
Og0KPiANCj4gLSBUbyBhdm9pZCBmYWxzZSBwb3NpdGl2ZXMgc3VjaCBhcyBDVkUtMjAwMC0wMDA2
LCBhZGQgdGhlIENWRV9QUk9EVUNUDQo+IHZhbHVlIHdpdGggdGhlIHZlbmRvci4NCg0KQnV0IENW
RS0yMDAwLTAwMDYgaXMgc3BlY2lmaWMgdG8gdGhpcyBzdHJhY2UsIG5vdCBhbm90aGVyIHN0cmFj
ZS4NCg0KUXVvdGluZyBmcm9tIHRoZSBvcmlnaW5hbCByZWZlcmVuY2UgKGh0dHBzOi8vd2ViLmFy
Y2hpdmUub3JnL3dlYi8yMDAzMDcxMDIxNDk0Ny9odHRwOi8vd3d3LnNlY3VyaXR5Zm9jdXMuY29t
L2FyY2hpdmUvMS8zOTgzMSk6DQoNCuKAnOKAneKAnQ0KV2hlbiB5b3Ugc2VlIHNuaXBwZXQgZnJv
bSBzdHJhY2UsIHRoYXQgc2F5czoNCg0Kb3BlbigiL2V0Yy9wYXNzd2QiLCBPX1JET05MWSkgPSAz
DQoNCkRvIHlvdSB0cnVzdCBpdD8gWW91IHNob3VsZCBub3QuDQrigJzigJ3igJ0NCg0KWW91IG1h
eSBkaXNhZ3JlZSB3aXRoIHRoZSBwcmVtaXNlIG9mIHRoZSBDVkUgYW5kIG1hcmsgaXQgYXMgbm90
IGFuIGlzc3VlLCBidXQgaXQgX2lzXyBhIHN0cmFjZSBDVkUuDQoNClJvc3M=

