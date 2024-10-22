Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9418CDD0CB
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 18:40:31 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.15])
 by mx.groups.io with SMTP id smtpd.web11.1689.1729622427788895353
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Oct 2024 11:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=la/RaeDH;
 spf=pass (domain: axis.com, ip: 52.101.66.15, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWM+eUBafV2vvoVbdYzqloYV70GhBI73Mb8v4HZaCaIarkRx3hxXAb6v7n8nbZLYkOwd9biQ4F+ly43irehf7+16oGCKKbBvO4K91SgIWmSDTlgpPfSPAWM1mDbWJgDzXUmAjUmqlmdTSWTjiCRqJnfOVnDFbNmlEDY5gL54t+oyGO3SwR9OGsCTbBwOnTkG81g6eZSWeWkCi7uRM1I4UDKIZywLgAXRhwwDyc6AugGuwDFdrjCZLtLA1l0lbSOhpZ5PLyh5DhwFjiLytN3ZSfU52rwqkMpe25fALasHhRoeBKCtdzJhOgPZxi1V6mAeWcswUjdOWZucR7+qXNf+HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8SD333kAot+i+7VQRT5LeyNa7BpToKKwCBFmvBJ/27Y=;
 b=MifrXA8LFSi9f6wQQdgf+s+OhTUzVcLr0xged/7i5p/Q40YxY2rmWXXvp/be8mz4TTs3o/p183T6nXDb6yJLRVaheWMGdyV4Dlu7vISpSr8tMk0z8hl7lCZYnlc+lsl2kx6dP222zlLs+mngdOO0GFn1ivLf9MMSjQlRMk7NQDBxvAmnmmAvwTIYpzPC9HXk5eLgGBYfL9Ka3ENm96D//7AVmo/SE0J8/dARkN/HpERfECbULtGPoXDx+Ckp4iAhYnDpPshpOEKYhVCQKc7J7ugfSzfopmy83J9sEPm21DzAYLMziIrGwCtHs/Tsc48cOwDqFUKyL+mG1q/I+1HcoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SD333kAot+i+7VQRT5LeyNa7BpToKKwCBFmvBJ/27Y=;
 b=la/RaeDHm/okX5q/kKurcvUYWlvSAu5oSLFGODn4VFHJI4Ybpb3cLjCSHtTIE+HaY70+ohfGra2/W/ux81HTgDI1vsCe+bjkJ2tACbHgOFI7SKh8tZ1bVs5is01VXWX/SyIic5vWEIKcyPdKadtF6skiWmBBLiLsd0Imbr2xMIU=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by AS8PR02MB7128.eurprd02.prod.outlook.com (2603:10a6:20b:2e0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 22 Oct
 2024 18:40:23 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1bee:3174:a078:5af9%4]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 18:40:23 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: =?utf-8?B?Ikdhw6tsIFBPUlRBWQ==?= <gael.portay@gmail.com>, Alexander
 Kanavin <alex.kanavin@gmail.com>, "gael.portay+rtone@gmail.com"
	<gael.portay+rtone@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] classes: rootfs-postcommands: set better sane
 time to systemd
Thread-Topic: [OE-core] [PATCH] classes: rootfs-postcommands: set better sane
 time to systemd
Thread-Index: AQHbIc1jiTq8ORJeDk+3ILzVVlGWa7KRA2oAgABu6YCAAawK8A==
Date: Tue, 22 Oct 2024 18:40:23 +0000
Message-ID: 
 <DB5PR02MB1021350D7997973E3054958B8EF4C2@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20241019021935.2105739-1-gael.portay+rtone@gmail.com>
 <CANNYZj-bdtFmFHnK2ppSMY+iXRDX-J5GwWaQjYMwX_t66SnJoQ@mail.gmail.com>
 <D51N9GUUD7NN.KLL01VZA4V8U@gmail.com>
In-Reply-To: <D51N9GUUD7NN.KLL01VZA4V8U@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|AS8PR02MB7128:EE_
x-ms-office365-filtering-correlation-id: 6e545c41-1d33-4934-4774-08dcf2c8fcfd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NDg1b2VraHpkQU9kUXVNUEp5WnlTd0VIL3ZBZ3pqUzNPSWVWSWV0SnJIZmg2?=
 =?utf-8?B?dGpqRGdlTEFuYmVTUi82bUpWZy8wUjdVaVZFZTRKT3JWQWxlWnBPbVRaSUVo?=
 =?utf-8?B?ckpveWI4dTlUYTcrNVZrUDJoYlAyeUdHNnBFbUNGSi9HOFhnWGc1V3ZuOVVz?=
 =?utf-8?B?OVB3REpkWmdRQldrSTZvMDhHNlI1RmZHVWlpS2tzQXlnekRnWDJzTTVud2Vi?=
 =?utf-8?B?SkVURThXSU1WSmhDdm1sSDFTbTA2M0wyTEUrZTd1d0xLcmFaMHpFN3hNTXBn?=
 =?utf-8?B?MVhaMDF4VHdLQzViRVNaNWhQNkQyeFh0eWVsekM2OVRpeXYzUjNzWXF5ZlZY?=
 =?utf-8?B?dE4vV1prRFVuazlCRnVTWklSRElVN0hac1pITlVzOXF6ZlpWOVpDUzZvWTFM?=
 =?utf-8?B?aTNlUWIrQWNKazhoU05BSm52Z29SSHVBOG11VlJtTnZzSnJWSEp3RzFWcTJT?=
 =?utf-8?B?am45cDhrVTFLWk1JakttWnNCT1dtVm1maFpHdFNEcnNQRGRQK2p2YURBbU1v?=
 =?utf-8?B?TmV1d2QyaVZkMzdySllVZ2wxSlpHSVZiWG43TFZKTTV0dkp4aHlJOGt3S004?=
 =?utf-8?B?WXMveUt1RU92VkNrSVhhM0laVWRrNkorcWhYQTVHZXVhdWJzYjVwdklqd1U5?=
 =?utf-8?B?anhtM08zQlFxWkpaaTdrQ09TY3VaVFdETmxWTXplUjFiRlJ6NG1GNjlrM1lv?=
 =?utf-8?B?aEpnWVNlNUFDMFNnZHczdTlBSFNaUlJEeGl2NW1QWGZiY3ZuSGJUWWpqemNV?=
 =?utf-8?B?WU9HWG5OSENKVkw4N1JWNUFwNCs1N0VxRDQzaFNyS0RFT01EMzcwLzB0eVVI?=
 =?utf-8?B?YklpdzdlaEFqYjJHc2RnV0RmRHBTVmhpSWl6SEtVbUg4Y00zRUNSR3FYa1Vp?=
 =?utf-8?B?TkdlS0VRVnlKaEpLTldoanU2bldyZmNtbnhta3NLSnRRbEdleWlqei81QU4w?=
 =?utf-8?B?bFR2eTdZcVFyL0xnNGJ6VTF0aXVhWHY3Y2JBb1BZWGRJUHRibkVPVGRFUnYy?=
 =?utf-8?B?TFByS3g2MmZKOTRYMW9kdDhBQ2ZDUDdlNWtJdkw5VWhYN21ienNoMy85OEdD?=
 =?utf-8?B?aFB1MnBwckdNa05FL3c5dTkzaE8rQ2N4UlhBSzlCWlV5ampKa21GTDZaaEV2?=
 =?utf-8?B?ai9GOUt2aTFBYlVXSWVZWjRsVFR5MWllRFZaOFpoQ05Ic2FJckxodGFEQ3U0?=
 =?utf-8?B?SjM1eGpoSDl4Sk9qcFVtK0JaeXdyNWZpUkE0eGMyZ2NXTXZyeVlkSmxZdTNB?=
 =?utf-8?B?TkRFSGxEeSs2ZGpDNUdkb2pzSjVuV0hveEJjVEJoKzdLVmxzMGZBRjlWTkFS?=
 =?utf-8?B?YXZ6YnVQQUF6NHUwZnp5d3lnaGpQNUZKaUVXbjljWDJWWXlXbzRhV2V2MmMr?=
 =?utf-8?B?eXhLQmRkVGVUN3pFNDFsOG54YUNWbHhYYTIwSnRwTzJCaCtvUWRWVnc4QXpG?=
 =?utf-8?B?RzVybURzeWtrdENoYm1sK3FqdkNTVVoyUlNTdDJ1amtDRVUwYXhocUxhTlQ5?=
 =?utf-8?B?ZXUrc1dyU3g3dmlROGtlTUFQUzViVHNQaXJYeTRnYXJNTi91M2lsaVBxVkVE?=
 =?utf-8?B?Sy9hQWdtckJINEkydVQwbm13cEdocnd3SFNXbHNTOEE5RWxzbjA2TnJMV0NY?=
 =?utf-8?B?TFc1NWwvL0YyazF5Q3BESDBzemY3M0FtdTNoSmFkdjM4K1NDWFhWRUY1SlVF?=
 =?utf-8?B?bmJqQi9WM3R4eEF4Q2RKbkZHWnppQkVobzVVanBZUkVOenFnMG4vWTluWFFv?=
 =?utf-8?B?WFdQejNXRHFHR2JDL3hJN1ZMemxFSWdBaU9yZDNlSjE0aFVPcGRadVduMFFG?=
 =?utf-8?Q?OWocCtTJZDgI8VQ1hNHp/ocBa6BHehXaEHWvs=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Q2M4c0IzcmticGdKOUlSSkYwNWxrcGU2d2g5T1E0OXNieVgxOHJUNDRwRUxS?=
 =?utf-8?B?MkJuaStzOFBJdU1BdXZVV2FaSTMvVTV6OTVPWUlBa3VrNzc0MUs4NUEvZUxv?=
 =?utf-8?B?S2NzZWhObUE0amdyTWk4c3B2V3VKZkNLTDQvTk44THdBSmZPRnVzQjdsdW1H?=
 =?utf-8?B?V1BSTStPZ2hlV1ZCSXgycEs5TU5tWk5sTlBzeTFud2kwWURUVnF1dFRrUW9q?=
 =?utf-8?B?Y1dOMWRzdDR4YzZyaWtJUDhUMWltRWNpaEpiSHFBU0t1SXU3dDhhRGJHdHd2?=
 =?utf-8?B?ZWlxQXplSGlFVllMWU5NRHpFdEtFNFpxUzgyNzNSR09LVTVCOEFxWE1UOUdR?=
 =?utf-8?B?bG5FT3dhaXpkNTF6ZFJtalV3NmFzSTR3Q0ZlUDdRNVpjTnlYYnBaTnF1aXpD?=
 =?utf-8?B?ZGpiVHJmMVNHTWdlYy94N2t1ODFKZDFTT2tyWmZ2em5BOWlYOTMyYkhrbU5E?=
 =?utf-8?B?dVFzRko1YVJCUS8xNEkxN1VibWJVaW03Zis5SlZ0RXBZdzdEUlc2WWNZUFMy?=
 =?utf-8?B?bGNBb2RuQ0FCZ1kvV2s4Y2ZTbjZwcTFndXdhL21ON2FoRzNjSkRsUU1rSWk5?=
 =?utf-8?B?QlFKOXI3cythSzUwZ0ZKRjlSQncrYmlDWkt5MjNEYmFzQlU2djlMT0N3Y3pI?=
 =?utf-8?B?b2h4dVNEaXdzYXFTVDZqZUlxbGFrcU5tL0RNK216YU1VckNod0RqRWpKNDZk?=
 =?utf-8?B?aURmZTAycG5ZS3NscTdhUm83V1JTWGpuaHkydHhONEhMVzkrTXlYRzVQbitT?=
 =?utf-8?B?YjA0MGtDR2E3UHBvY2hncFBNeTdPQWk0MWlFTm5IK29hend1a1REVWxnNkYy?=
 =?utf-8?B?Y1BlaW82WXBrWGs1dW8vTDJZUXluY0MwS1hReTJYOWZWWE8vUU5CajlYSWlP?=
 =?utf-8?B?N2R6RzYvU0JhWmN0R2tTeXRPL29QTU9JWklOYnNGKy8zakxCZFdoZnY2SUNC?=
 =?utf-8?B?My9HcWUxZjdLWUtTUjFDZXBCU1NRejZFSmRXVE9tdmZ0a0FEcDcvZ0dRMXhT?=
 =?utf-8?B?a1FQU1hkM1ZqMkFpT0x5VkpTWGhLQ2FvcG4reVdvZVdYcnVrWmladVhjeG9F?=
 =?utf-8?B?Zk8rdmZ1UDNmRzJSSTRiZE9xYmlXU05mWVkwL1J6c3l2c2FudFJrNlAvLzhh?=
 =?utf-8?B?dWVaZHkzSlJYbzQ3Y3F6ZWZkb0dDajRKYzRkMUFkYXhkcGpNYTNxN1lXQTBu?=
 =?utf-8?B?SUVKWDFaRld6RXRvUHphRDJFU2oyUTRmODVSM3J1RlZ5YkprQndQR2k2aTdZ?=
 =?utf-8?B?RW90V1FLMDNtYXBJMkhkQmlFZVNiTG1VSnlqMW53RXN0OWlsRGNnenQwOWwv?=
 =?utf-8?B?d2VJUUtiN1pLNVl0SU94UFgyUGdTdjRxNEExbG4zV3N6a2NFb2JmOU9ZM2ts?=
 =?utf-8?B?eXQxUVZWZ2JoVVdJeFFGN0cxR1VYU1JkcXlmZzNqOU42UTlSUzBFT09yQlFq?=
 =?utf-8?B?aVFWWmZGbnU0SlVMZWdGclJjT3dCcnFQVUd2eGljcDV2Wi8yeEl4WUdtWklT?=
 =?utf-8?B?aFV3ZjU1ekYyQkx0Qzk0Mm5FQ3BiYzRXZVR2WjdXT2pWWGRNSHNqQ0d1N29V?=
 =?utf-8?B?bzVHeFpldUloZGFScmVBbG1pc3NjUzhoclQxZzZFQ3BaZEdIdVZOa0xFSlF5?=
 =?utf-8?B?SHRGQ0VXNmhUVGNpTHFVY3krNVRXRWF6N0FEZEZGNU1Tdmc0QzNMWkZyelov?=
 =?utf-8?B?OEtlS2pJV1RkOWJDczF0Vkd5ZHRiSm1qR0ZUa2pvcHVnZE9odEZ6d0dRNGNt?=
 =?utf-8?B?N3hXSjVJVHdnaE4xT0t0UG5oMFBBNm1xYnlOZXJ3akRrQ21MSHk2M3Bkc2hT?=
 =?utf-8?B?OVFVODV3NnB4Q29FSXZVMnlmZm9VdldjVXRwWVNMTnkrbzQ5cXdnb2tLK2o3?=
 =?utf-8?B?N3E4SW5mbzhWOU1CaEZSVmJ6SGFYK09tL3hSM25RRHhTeEY4eUNrT3FNd2g1?=
 =?utf-8?B?OHh5bWJZa3dYYlc4dk1Xb3lHUW9qZGd2Z1JMQ2t0VUJrcU5LZHZwWEFHeFEv?=
 =?utf-8?B?NnA4Y25Sb21yayt0SjY3MU9Jb3RNL2EvRThCRWFDRnJ3eHJmVmJWWWpnNk9V?=
 =?utf-8?B?b09ON0NBTG83VXkyVGM3R3l6YzhBcjM1am5RbUdqTGpHUVp1QkdyQUtNQ3VL?=
 =?utf-8?Q?IHs4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e545c41-1d33-4934-4774-08dcf2c8fcfd
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 18:40:23.1398
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KNDqop11i7Ss7zxhj+wG+wFvvJ2WT3EyEqHPcjm23S4Hwq1620zJYPivbDCwV+7Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB7128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Oct 2024 18:40:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206171

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtY29yZUBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGNvcmVAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mICJHYcOrbCBQT1JUQVkNCj4gU2VudDogZGVuIDIxIG9r
dG9iZXIgMjAyNCAxOTowMg0KPiBUbzogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBn
bWFpbC5jb20+Ow0KPiBnYWVsLnBvcnRheStydG9uZUBnbWFpbC5jb20NCj4gQ2M6IG9wZW5lbWJl
ZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3Jl
XSBbUEFUQ0hdIGNsYXNzZXM6IHJvb3Rmcy1wb3N0Y29tbWFuZHM6IHNldCBiZXR0ZXINCj4gc2Fu
ZSB0aW1lIHRvIHN5c3RlbWQNCj4gDQo+IEhlbGxvIEFsZXgsDQo+IA0KPiBPbiBNb24gT2N0IDIx
LCAyMDI0IGF0IDEyOjI1IFBNIENFU1QsIEFsZXhhbmRlciBLYW5hdmluIHdyb3RlOg0KPiA+IENh
biB0aGlzIGJlIGRvbmUgZnJvbSBzeXN0ZW1kIHJlY2lwZSBpdHNlbGY/IEl0ZW1zIGluDQo+ID4g
cm9vdGZzLXBvc3Rwcm9jZXNzIGxpc3Qgc2hvdWxkIG5vdCBiZSByZWNpcGUtc3BlY2lmaWMuDQo+
ID4NCj4gDQo+IFN1cmUgaXQgY291bGQgYmUgZG9uZSBpbiB0aGUgcmVjaXBlIGl0c2VsZiA7KSBi
dXQuLi4NCj4gDQo+IFRoZSByZWNpcGUgaGFyY29kZXMgYWxyZWFkeSBhIHNhbmUgdmFsdWUgYXQg
Y29uZmlndXJlIHRpbWUgdGhhbmtzIHRvIHRoZQ0KPiBtZXNvbiBvcHRpb24gLUR0aW1lLWVwb2No
IGFuZCB0aGUgZW52aXJvbm1lbnQgdmFyaWFibGUgJFNPVVJDRV9EQVRFX0VQT0MNCj4gKG9yIHRo
ZSBkYXRlIHRoZSBjcmVhdGlvbiBvZiB0aGUgbGF0ZXN0IGdpdC10YWcgb3IgdGhlIG1vZGlmaWNh
dGlvbiB0aW1lDQo+IG9mIHRoZSBORVdTIGZpbGUpLiBzeXN0ZW1kIHNldHMgdGhlIGRhdGUgc29t
ZXdoZXJlIGluIDIwMjIgKGtpcmtzdG9uZSkuDQo+IA0KPiBJIGhhdmUgY3JlYXRlZCBhIHJvb3Rm
cy1wb3N0Y29tbWFuZCB0byBiZSBhYmxlIHRvIHNldCBhIGJldHRlciB0aW1lICoqYXQNCj4gaW1h
Z2UgY3JlYXRpb24qKiB0byBrZWVwIHRoZSBzeXN0ZW1kIHBhY2thZ2UgdW50b3VjaGVkIChub3Qg
cmVidWlsdCkgYnkNCj4gdXBkYXRlaW5nIHRoZSB2YXJpYWJsZSAkUkVQUk9EVUNJQkxFX1RJTUVT
VEFNUF9ST09URlMuDQoNCkNhbid0IHlvdSBhZGQgYSBwa2dfcG9zdGluc3Q6JHtQTn0gZnVuY3Rp
b24gdG8gdGhlIHN5c3RlbWQgcmVjaXBlIGFuZCB0aGF0IA0Kd2F5IGRvIGl0IGluIHRoZSByZWNp
cGUgd2hpbGUgc3RpbGUgZXhlY3V0aW5nIGl0IGF0IGltYWdlIGNyZWF0aW9uIHRpbWU/DQoNCj4g
DQo+IFRoYXQgdmFyaWFibGUgaXMgc3VmZml4ZWQgYnkgX1JPT1RGUzsgYW5kIEkgZ3Vlc3MgdGhh
dCB2YXJpYWJsZSAqKlNIT1VMRA0KPiBOT1QqKiBiZSB1c2VkIGJ5IHBhY2thZ2UgcmVjaXBlcy4N
Cj4gDQo+IFRoZSByb290ZnNfc3lzdGVtZF90aW1lc3RhbXAoKSBpcyBiYXNlZCBvbiByb290ZnNf
dXBkYXRlX3RpbWVzdGFtcCgpOyBpdA0KPiB0b3VjaGVzIHRoZSBmaWxlIGFuZCBpdCBsZWF2ZXMg
dGhlIGZpbGUgZW1wdHkuDQo+IA0KPiBBbHNvLCB0byBkZWNyZWFzZSB0aGUgc3lzdGVtZC1zcGVj
aWZpYyB0aGluZywgSSB3b25kZXIgaWYgdGhpcyBpcw0KPiBhY2NlcHRhYmxlOg0KPiANCj4gCXJv
b3Rmc191cGRhdGVfdGltZXN0YW1wICgpIHsNCj4gCSAgICAgICAgaWYgWyAiJHtSRVBST0RVQ0lC
TEVfVElNRVNUQU1QX1JPT1RGU30iICE9ICIiIF07IHRoZW4NCj4gCSAgICAgICAgICAgICAgICAj
IENvbnZlcnQgVVRDIGludG8gJTRZJTJtJTJkJTJIJTJNJTJTDQo+IAkgICAgICAgICAgICAgICAg
c2Zvcm1hdHRlZD1gZGF0ZSAtdSAtZCBAJHtSRVBST0RVQ0lCTEVfVElNRVNUQU1QX1JPT1RGU30g
KyU0WSUybSUyZCUySCUyTSUyU2ANCj4gCSAgICAgICAgZWxzZQ0KPiAJICAgICAgICAgICAgICAg
IHNmb3JtYXR0ZWQ9YGRhdGUgLXUgKyU0WSUybSUyZCUySCUyTSUyU2ANCj4gCSAgICAgICAgZmkN
Cj4gCSAgICAgICAgZWNobyAkc2Zvcm1hdHRlZCA+ICR7SU1BR0VfUk9PVEZTfS9ldGMvdGltZXN0
YW1wDQo+IAkgICAgICAgIGJibm90ZSAicm9vdGZzX3VwZGF0ZV90aW1lc3RhbXA6IHNldCAvZXRj
L3RpbWVzdGFtcCB0byAkc2Zvcm1hdHRlZCINCj4gCSsNCj4gCSsgICAgICAgaWYgWyAteCAvbGli
L3N5c3RlbWQvc3lzdGVtZCBdOyB0aGVuDQoNClVtbSwgd2h5IGFyZSB5b3UgbG9va2luZyBhdCB0
aGUgaG9zdCdzIGZpbGVzPw0KDQo+IAkrICAgICAgICAgICBpZiBbICIke1JFUFJPRFVDSUJMRV9U
SU1FU1RBTVBfUk9PVEZTfSIgIT0gIiIgXTsgdGhlbg0KPiAJKyAgICAgICAgICAgICAgICAgICAj
IENvbnZlcnQgVVRDIGludG8gJTRZJTJtJTJkJTJIJTJNLiUyUw0KPiAJKyAgICAgICAgICAgICAg
ICAgICBzZm9ybWF0dGVkPWBkYXRlIC11IC1kIEAke1JFUFJPRFVDSUJMRV9USU1FU1RBTVBfUk9P
VEZTfSArJTRZJTJtJTJkJTJIJTJNLiUyU2ANCj4gCSsgICAgICAgICAgIGVsc2UNCj4gCSsgICAg
ICAgICAgICAgICAgICAgc2Zvcm1hdHRlZD1gZGF0ZSAtdSArJTRZJTJtJTJkJTJIJTJNLiUyU2AN
Cj4gCSsgICAgICAgICAgIGZpDQo+IAkrICAgICAgICAgICB0b3VjaCAtbSAtdCAiJHNmb3JtYXR0
ZWQiICR7SU1BR0VfUk9PVEZTfS91c3IvbGliL2Nsb2NrLWVwb2NoDQo+IAkrICAgICAgICAgICBi
Ym5vdGUgInJvb3Rmc19zeXN0ZW1kX3RpbWVzdGFtcDogc2V0IC91c3IvbGliL2Nsb2NrLWVwb2No
IG10aW1lIHRvICRzZm9ybWF0dGVkIg0KPiAJKyAgICAgICB9DQo+IAl9DQo+IA0KPiBPciwgbGlu
a2luZyB0aGUgZmlsZSBpbnN0ZWFkOg0KPiANCj4gCXJvb3Rmc191cGRhdGVfdGltZXN0YW1wICgp
IHsNCj4gCSAgICAgICAgaWYgWyAiJHtSRVBST0RVQ0lCTEVfVElNRVNUQU1QX1JPT1RGU30iICE9
ICIiIF07IHRoZW4NCj4gCSAgICAgICAgICAgICAgICAjIENvbnZlcnQgVVRDIGludG8gJTRZJTJt
JTJkJTJIJTJNJTJTDQo+IAkgICAgICAgICAgICAgICAgc2Zvcm1hdHRlZD1gZGF0ZSAtdSAtZCBA
JHtSRVBST0RVQ0lCTEVfVElNRVNUQU1QX1JPT1RGU30gKyU0WSUybSUyZCUySCUyTSUyU2ANCj4g
CSAgICAgICAgZWxzZQ0KPiAJICAgICAgICAgICAgICAgIHNmb3JtYXR0ZWQ9YGRhdGUgLXUgKyU0
WSUybSUyZCUySCUyTSUyU2ANCj4gCSAgICAgICAgZmkNCj4gCSAgICAgICAgZWNobyAkc2Zvcm1h
dHRlZCA+ICR7SU1BR0VfUk9PVEZTfS9ldGMvdGltZXN0YW1wDQo+IAkgICAgICAgIGJibm90ZSAi
cm9vdGZzX3VwZGF0ZV90aW1lc3RhbXA6IHNldCAvZXRjL3RpbWVzdGFtcCB0byAkc2Zvcm1hdHRl
ZCINCj4gCSsNCj4gCSsgICAgICAgaWYgWyAteCAvbGliL3N5c3RlbWQvc3lzdGVtZCBdOyB0aGVu
DQo+IAkrICAgICAgICAgICBsbiAtc2YgL2V0Yy90aW1lc3RhbXAgL3Vzci9saWIvY2xvY2stZXBv
Y2gNCg0KVGhpcyB0b28gaXMgdHJ5aW5nIHRvIGNyZWF0ZSBhIGxpbmsgaW4gdGhlIGhvc3QncyBm
aWxlc3lzdGVtLg0KDQo+IAkrICAgICAgIH0NCj4gCX0NCj4gDQo+IERvZXMgaXQgbG9vayBiZXR0
ZXIgZm9yIHlvdT8NCj4gDQo+ID4gQWxleA0KPiA+DQo+IA0KPiBSZWdhcmRzLA0KPiBHYcOrbA0K
DQovL1BldGVyDQoNCg==

