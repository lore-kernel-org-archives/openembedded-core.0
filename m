Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F9BFC5AD49
	for <webhook@archiver.kernel.org>; Tue,  3 Jun 2025 13:35:59 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.13])
 by mx.groups.io with SMTP id smtpd.web10.11751.1748957754469658000
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jun 2025 06:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=HeoPNxBj;
 spf=pass (domain: siemens.com, ip: 40.107.130.13, mailfrom: adrian.freihofer@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KmhbjvV4FVbXeTtqkQbnitVXV4azcDT7uKEbPlbuJD4NEe+ZIdk+VTsx8r9tpD4H8x1fMp4zepfg5MBMu0mBDDoMmrqxAH80VMsdeAxItcV/GZtfPNWssDgIDCT+37Aze7Sx8WmJmpvR9Qhqg8wV09NKgaray391BWjZp2nNXnu7jJJkAK/X9AlWTCcweJ1wbldqQ9S5ZtrpUE3V/O2TVwQKKYVSxG6xo3rwzG692jTc3L8SbIo1iuI/EUTIP5Crogio9jImcGEjCwsqye8V3NKz5WJow2mZGvGzl26aBKOXyOVVYcpFg3SNLlB0OVyZ327EvpmWAzYYJxP4bZ31JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=riGwhohrPM7rxfiq1iFDSe+MXnf1kdPn4m639kKMs4U=;
 b=a0QEJhQZqUA4Ssz8tvri7TmfgGSPJi5f6rwmfgHIFBRmJk+EkkWXt3xQwc+WKA3x4pkox4/EjINUXKBumMxy3OBk6bjMhNJLV1ZrMTJ4Ht5jabqP8+jwJxFr75gvOzq+hVvbnCztbfHlK87gIoofjwfUu9c9rC3E2f9UlG2bhAUMtGObNdv5jeY43F/EY173jPaMCjSpPpT97UlS2/ePpa5fwQwVY1Oo5z5y0SheTrizp0Ex3FQBiVV1g+3SA7x4kFQL8lHBD8jfga/M1R7XnofqsTeLG8eLKsEvHM7oU4xoba1kmZVP3MDiXlMdBZkBpKHJ3wL4KnJUfZ0RPR9DXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=riGwhohrPM7rxfiq1iFDSe+MXnf1kdPn4m639kKMs4U=;
 b=HeoPNxBjw9AKeXwAMJreb9mVYxzOO/8idNR0WnhwWrfUNGW/GEgg9OZcuQXmDmXmtHOWcb6zqGqFPcaidTQUUbVzdyKFhLv7ajRO/UMUEJ5FZo9n6lO/zww9jFLt8/qsK9yVE5PA3oEaRpXrXDXQXauEvcL4Zpp5OKe3HUAEIGhE+uSAUmzT/uLLV5QpMFqUPDd3uVZg8Z3s9UojSJUhA6jO2eOnK5IXpN0CLzvjZjEHWiV0Rfq9agPt5doCJgRO2M8YX4ogvEkngRzlj7cTGmR/r35Hvtj0Ivvodp4WZVAlXd+9/hx9bP5Pv5m6vGt7tbbIPN8qtvW/1Q+kEFIQ+A==
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13e::17)
 by VI1PR10MB7755.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1cd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 13:35:49 +0000
Received: from DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda]) by DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e586:9cf8:7696:cbda%6]) with mapi id 15.20.8813.018; Tue, 3 Jun 2025
 13:35:49 +0000
From: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v7 00/20] FIT image improvements
Thread-Topic: [OE-core] [PATCH v7 00/20] FIT image improvements
Thread-Index: AQHb1GDs5szeaGrcPUqPWcSZpgkA3rPxQVWAgAAukYA=
Date: Tue, 3 Jun 2025 13:35:48 +0000
Message-ID: <3338cd8105d0f0832f01bb0f8b705e26f91c50d2.camel@siemens.com>
References: <20250603082419.409564-1-adrian.freihofer@siemens.com>
	 <dd27e615bd3ea965dee284352c90794d77854cf0.camel@linuxfoundation.org>
In-Reply-To: 
 <dd27e615bd3ea965dee284352c90794d77854cf0.camel@linuxfoundation.org>
Accept-Language: en-US, de-CH
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.54.3 (3.54.3-1.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR10MB3529:EE_|VI1PR10MB7755:EE_
x-ms-office365-filtering-correlation-id: f4b1cb35-8a42-4199-770f-08dda2a38d44
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?cnYzcTNvemgwZloycndUdHNoL0JXNGpSWE9RQ1NpYVJTTGNaZFM1RlBZT0tk?=
 =?utf-8?B?S1RFKythV0M3SStTSWdMNWRPS0ovZmI1YnIyY09HY0M0VFBaOFYrb0hXV3Fp?=
 =?utf-8?B?dEdmb05PMVE4VnRFeGloeVlDR1g1SnU0dkZZZ0dYNzAvWERZczRaZjJjejhu?=
 =?utf-8?B?dFQ2NVpISldqaTVTNTEyMmd2dTVFV3Y3ek9MaklKTU96R1AyTk8yNkx5ODFQ?=
 =?utf-8?B?Rm54b1JrNEY3UUR5aTJYcXZmTFVCeVVWclFlUWVxOVUvSVFjUGFodmY5L1JY?=
 =?utf-8?B?cWtFd3RyaTJqemdhUXRNaEZyTHA5anNrMTNRV2VTUm1Cdk14TDRIbUQwamtN?=
 =?utf-8?B?THlaODVXZnRHM3NHZkRuZ3Nhd0NIbXRRM0g0aElJc0IvbWRmRjZZQUt2bWJ6?=
 =?utf-8?B?dFE4QTdhUGd3TFlLendncTVhQ1M1WFAyOWU5T01LTmJTRU5LWDVhYWhocm9R?=
 =?utf-8?B?eldFYVhtanpzOWlab3Q3TFFmNlVDN3JwTlBaeHRsTk9rdE9udnJJd2FHSEd1?=
 =?utf-8?B?blpoQi9wYzM4N0ZsL055cnhqdWg0dkk0NGdUcU5yM3NVVG8yNis1a3RhbTFB?=
 =?utf-8?B?NjBMZ0JhakR5Ky8wREx4UWxFdmJmYmRyV0szUVQ0ZVpiZDl1dkg0T1ArSkZN?=
 =?utf-8?B?WVBJeTlYeGVxcXdtVy9ualFMaitScEhOWm1mRzF4Mzk2M3VMY2liaC9pUEE5?=
 =?utf-8?B?TXlwZWRjSVJLZkJUS0FnMzZKWG9yQXVBdXNZcmJZUEFjSFliSHA3VVVWQVc2?=
 =?utf-8?B?TkpOYXpmNDlkL1hBeXZUWlRiYTNMTS9OVyswcGNCY2xraEpMVnMvOTd5bUNC?=
 =?utf-8?B?ZmRJV0FQQUVMRDZFN3dDeExDY0UvaUp3S3d0Zk00RDdPNUxyelFENk9BWlhH?=
 =?utf-8?B?Uk51a0lIZlp2djZ1cFlQT0t2clBYYkEyQ1JYN1dsUlVNNkZjdzN3R0tybHR1?=
 =?utf-8?B?ZmY0NTF4Slp5WDRCaXo4eFA5WkJsNndIOE9CdXkwWnppTjJhNkFtYXJqME5j?=
 =?utf-8?B?YnFjckE2YUF0Q3p5aHVPV2JlZFNXc0VwOHRWU3VKV1h5T3UydU9meGFqcVhx?=
 =?utf-8?B?bGJhdTRpb0tla2czSWRYdlBuL3FxUWhDRlI5bkh3dEVxZ3VxeVNoNGp4aDFP?=
 =?utf-8?B?Um1tbFk0NTF1WnBJdjlQY2QwZXNOTlhJT3FIOWhzeUE3QjJVNU5TS2huZXBp?=
 =?utf-8?B?VEp2RndCOG9rbGFBQVdaa3l5ZkU1MzJ4UEswOS9UcW5JY2pnZm9iS3FSTU8r?=
 =?utf-8?B?dWdJRlJOYUZreGxPNjhSSEhUeVp0ZlZHRjVrZDNuVzZzS21qblRlTTRjME1j?=
 =?utf-8?B?S1ZIT21RTzB6QjVJR3p3U3hnVThsZ0xjY3FMVHBCSWpkMVNIMlV5T1hSR0VU?=
 =?utf-8?B?TE1Ua1pBc0QwU05WOTZWZVRSMllDVUl0bzR4bHlzV3cwV2VmZFFLSFhMTUNB?=
 =?utf-8?B?SEJSNDg4cDZDTEd5SWFjMGovM29TaWZ2QWM3NEg5K3F0OFMvVFlGdU0vU3Rz?=
 =?utf-8?B?RE0raDd0bWxTeEhjb1J4NzRKTlJmdHRJZElSeXgrMmVmdEtaOUVNRGZmVlRj?=
 =?utf-8?B?TmNicXpaemo4eVk2UmtnbjE2dmd5SzRNT28yOUtpVHcxY0ZMcEliZDJTN0Y0?=
 =?utf-8?B?WHRacWx1NHRKMEUxeGFKMGthdndDM1ZVOGdyc0tPbHcrY3Y2TXRnTmF0T3pC?=
 =?utf-8?B?L0Q2K0M2SE5qTWxQams4UWxEUUpYVGFmZjBYOWtWUUQ4ZFFVRzFScnJCeVpG?=
 =?utf-8?B?N2lWQjdlaTJCZmh1US80N0ZKYlIweFNIdjcyTE9HZDk3eGZxRUx3V3gzak5R?=
 =?utf-8?B?Z1JSV2R1WGJlQ2lvVTBRcjZBWjZrR1JGZzFUbGMzTHV3YzJMQnNJaGhnbEQ0?=
 =?utf-8?B?NmdHSm8wOWU5TEkyOExXT3ZRUWlCK3E2cTA5eFJhYzF1YTExcFcycDZTMjFB?=
 =?utf-8?Q?gluWQxVE3fw=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?R3RZYTMrQXVoK1dJWS9xMVBXODdnRU1TWFdXMkZXYlh0ZkFrRTFsN216MVdV?=
 =?utf-8?B?OHdKMnQ0dHoxTlR1bzZXWWFxaW1YK3VZaVgrMHZ5bVFoNkJDK0FXbGpXc2ti?=
 =?utf-8?B?S0tOS0ZMbVd2SEJROGREMlZEd1dWTTlaZFk0YzlySllVSFJIWHBzdTRwRnNa?=
 =?utf-8?B?NkVVTWl1ODFjcFQ4SG1VTXVYd1ZSRnB6OEN6bTVNS0VJbWdmRHljQkUwQkRO?=
 =?utf-8?B?eS8wS08zVzhpbjJPN0dlenJCRlhQWkd1b21SN1FsKzhnMWs2RGxpTDdsY1M3?=
 =?utf-8?B?eXRvNWZaOURYWlA3QW04STZQM1crSEdqSWtpTEJNdE01dkd4OHp1R3ExZzU2?=
 =?utf-8?B?d3hwMENSdEwvdCs0MmZodjJ5TjNIL0NwcnhJeHFvRjFTTFdKZy9HWHBJaVpG?=
 =?utf-8?B?L1hublJiZ3RZWmVGQy96c2pZeG5tVW90ODZLYjJVUGJEV2hLdDFxbDBVMU14?=
 =?utf-8?B?MUQwaXhQL1NQaWRBVWRLRm43L0lPSjcyTXhQZGp2VHY0Ky9lYk1PSzRxdFFx?=
 =?utf-8?B?MjVnMUxIcW1YSkN6OUJCTkVJQm5seFVZb2ZyeU5PdFlzajM0WmpxNHYzYm5k?=
 =?utf-8?B?eFJIanI5dmdwT2YzaWNQeUdEZzM4a2tLYVNaSU1pRSs3OWJETGFsMzcrejUr?=
 =?utf-8?B?OSt2K3IxZ0ZEL1pNSHYwQ3RneDQ4YlhYZldnY04yNFJla2dnWDVMQ2loRno3?=
 =?utf-8?B?dFFFK3VmR0gyVXR3YlNHQVdPY0FFWUVudkR2S1lna3BPeFNCbnZEaVMvc2sv?=
 =?utf-8?B?em9hTlF5bFZPUlI0MVVjdndHNEpCSUtXeXIybnpFZzF2R1lFV2dYRTJPR21D?=
 =?utf-8?B?cG5ld0pWb05KZjhoUlNMbllOM09iVjVmZk1CU2w2Y2F1L2lEczd6SWtYTmdR?=
 =?utf-8?B?dHdycWdvNTRnRTlGeHhBUXhSN0sveW1YWG0zUkxEQ1BEOU1LRDBnKzhvRDZp?=
 =?utf-8?B?N2FBYTFra0VpR0pzaFZrWUM1Y0Y5Qlp1QlJCeUhydVYrczUxN3RLYXNWM2Vu?=
 =?utf-8?B?Rm11d0FQTWk2bERrazNVYU15N0hPam16d0hERURkQkFaRjhzU2ZCcElvbk93?=
 =?utf-8?B?TWdSSkNvWWNmbVFqUzd2WFdqVjlWM0lBelBySTY2dnVZOXpzNnVzUUN6VUov?=
 =?utf-8?B?Tmp3NDFETlh4TExrVWF5dTNHcGlzdHFMMjlhUVhpT3lKVXRsSDY1b2tMc2JE?=
 =?utf-8?B?OTB0bFJ6OWZ6bWIvaUoyQTQ5ZmRiOGRUczgyWE10ODlkaG1GVlQ2NXlrRVpH?=
 =?utf-8?B?cVhQNFRqWEZkNk5ZbjQ3dlZqSkxZU1YvbWI3VjdQeWRIb3k0UzhjWE51UVFi?=
 =?utf-8?B?SXRheVc5RFMvamNRbjNBNkY3SThrWDhIbFIrYk5ud2VCK3h3VDNnZVpXcUQy?=
 =?utf-8?B?ZGh5Z0JLTXN0b0hnSkxWMFMxNnhZV2d5bjBNeC8rSXRMU2t0dk5sTWdGMzBq?=
 =?utf-8?B?WnMyUVNhYXdpbFFjOVVCQWhJZUR0MWZ6cnpYR3ZsU2J3OUhYWUJ5N1RTWVlk?=
 =?utf-8?B?ejRXMDEzQXJnemZMRXRUWnIwTjdad3ptNGtiTWhIcjdWV2E2QXp1QWpleFJK?=
 =?utf-8?B?RDRaaVB6NDUza3Eyd2U1dUNnMC8xRVpJMjVlTzd1dWkxOWNROVRJM1BQc3hW?=
 =?utf-8?B?ZFdtelRQRVFieGROYUdYODJWaUtOcXlDdWdmVWNLd1lwZXhDLzZXTE5lRTZS?=
 =?utf-8?B?VFB0Z0wwZ1RmQk9DZHZZcW9XOWlQN1dNNnV6MnhNT2ZrdVQ2ODBpQUlLU3Bz?=
 =?utf-8?B?T1lPMDlzMjhiZ20vZzQrVjRoQTJVbVdVa2JtdXYwZVMyVXhTbFRodmdEaTI2?=
 =?utf-8?B?Y3dTV002OXE0ZmZMTHJqWjdyT2tnMVliZVJ4NTU0bXZ5SjBrMEtqL0h5d2Rt?=
 =?utf-8?B?eUV1eVpuNGFhL3JPNWRSOEZSK3RRQ1RJcjhheHUrZmVNRTl2R0tDSko1ZTlw?=
 =?utf-8?B?VUlPRFEvTGkwdWltK1grdVJGQmtCYjkycHJkNXBkTEcvaHBLVTJ4SHJSbW1I?=
 =?utf-8?B?bktndWhnSXhLVjhSNjFZU2JVTkR0ci9oZUM5a2JMTS9IR3VYU1I3OEh1NTZ6?=
 =?utf-8?B?UXpndWw1TjVJS25xYWY5SjUxYVVFbi95cWI0QktpUnNtenRnc2hKSFFSRXpI?=
 =?utf-8?B?aU1XYngzWVc3ajBuK20zSmxxaXhNaS9qUTIvVjZoSEp2YjlRVmVIb2RKM0lL?=
 =?utf-8?B?S3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A57AC7DF8D0CBB4AA067E1F6E2BC7F5C@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3529.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f4b1cb35-8a42-4199-770f-08dda2a38d44
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 13:35:48.9529
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fAN54W8zBUbW2E/zCYXXtbDbUs/t/lG9ZuPRGkb1WCTwd/i5klwnVzSTXSOkOHzuMTbocFgH1BjfYh1wO9NMMLljQJpTjmWRk8kzrjjOXTI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB7755
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jun 2025 13:35:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217814

T24gVHVlLCAyMDI1LTA2LTAzIGF0IDExOjQ4ICswMTAwLCBSaWNoYXJkIFB1cmRpZSB3cm90ZToN
Cj4gT24gVHVlLCAyMDI1LTA2LTAzIGF0IDEwOjIzICswMjAwLCBBZHJpYW4gRnJlaWhvZmVyIHZp
YQ0KPiBsaXN0cy5vcGVuZW1iZWRkZWQub3JnIHdyb3RlOg0KPiA+IEZyb206IEFkcmlhbiBGcmVp
aG9mZXIgPGFkcmlhbi5mcmVpaG9mZXJAc2llbWVucy5jb20+DQo+ID4NCj4gPiBUaGlzIHBhdGNo
IHNlcmllcyByZS13cml0ZXMgdGhlIEZJVCBpbWFnZSByZWxhdGVkIGNvZGUuIFRoZSBnb2FsIGlz
DQo+ID4gdG8NCj4gPiBmaXggW1lPQ1RPICMxMjkxMl0gd2hpY2ggaXMgYSBsb25nIHN0YW5kaW5n
IGlzc3VlLg0KPiA+DQo+ID4gQ2hhbmdlcyBpbiBjb21wYXJpc29uIHRvIHY2DQo+ID4gLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4NCj4gPiAqIE1vdmUgdGhlIGNvZGUgZm9yIGV4cG9y
dGluZyB0aGUgRklUIGltYWdlIHNwZWNpZmljIGtlcm5lbA0KPiA+IGFydGlmYWN0cw0KPiA+IGlu
IGEgbmV3LA0KPiA+ICAgc2VwYXJhdGUga2VybmVsLWZpdC1leHRyYS1hcnRpZmFjdHMuYmJjbGFz
cyByYXRoZXIgdGhhbiBhZGRpbmcgaXQNCj4gPiB0byB0aGUNCj4gPiAgIGV4aXN0aW5nIGtlcm5l
bC11aW1hZ2UuYmJjbGFzcy4NCj4gPiAqIEltcHJvdmUgdGhlIGRldmljZXRyZWUuYmJjbGFzcyB0
byBza2lwIGVycm9yIG1lc3NhZ2VzIG9mIHNoZWxsDQo+ID4gZ2xvYnMNCj4gPiAqIEltcHJvdmUg
dGhlIGVycm9yIG1lc3NhZ2UgaW4gdGhlIGtlcm5lbC5iYmNsYXNzIHRvOiAiZml0SW1hZ2UgaXMN
Cj4gPiBubw0KPiA+IGxvbmdlcg0KPiA+ICAgc3VwcG9ydGVkIGFzIGEgS0VSTkVMX0lNQUdFVFlQ
RShTKS4gRklUIGltYWdlcyBhcmUgYnVpbHQgYnkgdGhlDQo+ID4gICBsaW51eC15b2N0by1maXRp
bWFnZSByZWNpcGUuIg0KPiA+DQo+ID4gUmV2ZXJ0IGEgbm9uIGVzc2VudGlhbCByZWZhY3Rvcmlu
ZyBpbiB0aGUga2VybmVsLmJiY2xhc3MNCj4NCj4gdjcgc2VlbXMgdG8gaGF2ZSBzb21lIG5ldyBm
YWlsdXJlczoNCj4NCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3JnL3ZhbGt5
cmllLyMvYnVpbGRlcnMvMTExL2J1aWxkcy80OTcNCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0
b3Byb2plY3Qub3JnL3ZhbGt5cmllLyMvYnVpbGRlcnMvMy9idWlsZHMvMTgxMA0KPg0KPiBib3Ro
IGluIG11c2wuDQoNCkhpIFJpY2hhcmQNCg0KTXkgY29uY2x1c2lvbiBpcyB0aGF0IHRoZSBjaGFu
Z2UgcmVxdWVzdGVkIGJ5IHRoaXMgZGlzY3Vzc2lvbg0KaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRk
ZWQub3JnL2cvb3BlbmVtYmVkZGVkLWNvcmUvbWVzc2FnZS8yMTc3MzANCm1ha2VzIHRoZSBsaW51
eC15b2N0by1maXRpbWFnZS5iYiBpbmNvbXBhdGlibGUgd2l0aCBiaXRiYWtlIHdvcmxkLg0KSSBn
dWVzcyB0aGF0IGJpdGJha2Ugd29ybGQgd291bGQgbm93IGZhaWwgZm9yIGFsbCBidWlsZCBjb25m
aWd1cmF0aW9ucywNCm5vdCBvbmx5IGZvciBtdXNsLg0KVGhlIGJhY2tncm91bmQgaXMgdGhhdCB0
aGUga2VybmVsIGFydGlmYWN0IChsaW51eC5iaW4pIHdoaWNoIGdldHMNCmluY2x1ZGVkIGludG8g
dGhlIEZpdCBpbWFnZSBpcyBubyBsb25nZXIgYnVpbHQgYnkgZGVmYXVsdC4gSXQgcmVxdWlyZXMN
CktFUk5FTF9DTEFTU0VTICs9ICJrZXJuZWwtZml0LWV4dHJhLWFydGlmYWN0cyIuDQoNCkkgZ3Vl
c3MgdGhhdCB0aGlzICFmaXh1cCBwYXRjaCBpcyB0aGUgc29sdXRpb246DQoNCmRpZmYgLS1naXQg
YS9tZXRhL2NsYXNzZXMtcmVjaXBlL2tlcm5lbC1maXQtaW1hZ2UuYmJjbGFzcw0KYi9tZXRhL2Ns
YXNzZXMtcmVjaXBlL2tlcm5lbC1maXQtaW1hZ2UuYmJjbGFzcw0KaW5kZXggNmQ4MGNkNGJiNDcu
LmQyZWViYjg4YmMyIDEwMDY0NA0KLS0tIGEvbWV0YS9jbGFzc2VzLXJlY2lwZS9rZXJuZWwtZml0
LWltYWdlLmJiY2xhc3MNCisrKyBiL21ldGEvY2xhc3Nlcy1yZWNpcGUva2VybmVsLWZpdC1pbWFn
ZS5iYmNsYXNzDQpAQCAtNyw2ICs3LDkgQEAgVU5QQUNLRElSID0gIiR7U30iDQoNCiBQQUNLQUdF
X0FSQ0ggPSAiJHtNQUNISU5FX0FSQ0h9Ig0KDQorIyBUaGlzIGJiY2xhc3MgcmVxdWlyZXMgS0VS
TkVMX0NMQVNTRVMgKz0gImtlcm5lbC1maXQtZXh0cmEtYXJ0aWZhY3RzIg0KK0VYQ0xVREVfRlJP
TV9XT1JMRCA9ICIxIg0KKw0KIERFUEVORFMgKz0gIlwNCiAgICAgdS1ib290LXRvb2xzLW5hdGl2
ZSBkdGMtbmF0aXZlIFwNCg0KQnV0IEkgbmVlZCB0byB0ZXN0IGl0IGJlZm9yZSBzZW5kaW5nIGEg
bmV3IHZlcnNpb24uIEFuZCB0b2RheSBJIGhhdmUgbm8NCmFjY2VzcyB0byBteSBidWlsZCBtYWNo
aW5lLg0KDQpUaGFuayB5b3UgZm9yIHRlc3RpbmcNCkFkcmlhbg0KDQoNCj4NCj4gQ2hlZXJzLA0K
Pg0KPiBSaWNoYXJkDQoNCg==

