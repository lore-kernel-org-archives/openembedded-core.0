Return-Path: <jamin_lin@aspeedtech.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02524D4979F
	for <webhook@archiver.kernel.org>; Mon,  2 Dec 2024 05:39:27 +0000 (UTC)
Received: from HK3PR03CU002.outbound.protection.outlook.com (HK3PR03CU002.outbound.protection.outlook.com [52.101.129.101])
 by mx.groups.io with SMTP id smtpd.web10.167026.1733117960717445965
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Dec 2024 21:39:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aspeedtech.com header.s=selector2 header.b=ZPcWQIwq;
 spf=pass (domain: aspeedtech.com, ip: 52.101.129.101, mailfrom: jamin_lin@aspeedtech.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bpj0cPrZ46fmrXy2YSBdxMdtSLtnkrwZqhFkEPyK+c9zYorg3O9E6/X+Hdd+9P5By/9svAY3BwltsvKOsGZdcfiffo3Uu7HEOLHjFBcCmQ0DYA9XiAQM8zSjP5Xt5cxJMGyFiCxko1jgtismHcxNAFTSVPZA46Oxc+efGmk+iPbtk74Nmi2yPZutPgtTWNJN/e4c+h56clFWpnNNQJvQZmRMAYuT50rdzrN0P0CK7jl0XVgOMkv5iT4XH5UyK3KdB+N902YlAulKKL74tnU44E2QLtHqZiKfqpk6MsblxEsyjwR7eY2oKIzfzeODc1tzJSCKxRcW8Uk4fbt4ihQ79A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YAYf9nMd7CngkmbN/pPeNcuLRGcZt7/vDtmkgv5vF0c=;
 b=SgLZ0n43y5qSB0Y1DrTkKW7ozCw6CdBWPdJ1Rth6bkMk/v7woIX2+RKEY3Rdcxs7ijOdlGxUAOMx8mCEeHFeJtGvfYSaYmzlBymlEYlfl20Xe6Q3dDLfNvFIK3ttaz6c1g6S0jJj3kKuSQRBoul72U5SWkDEAeBptsAo1og4M7tMpj0hDiBtGWPoDADc9e2A01FHE/JG8pxXY1zA4VNZaXrfaLASIH4asXWl778IGsn7ugN0by7lvcNLCECN8ItOtl5lErSiAB1lFo/bn+E0PPWiLWk8Af1Ywc4yYnZ1gsnUuxtfkTeWpDaQx+XJ1HqDrt9+X0sNjg2SZiI30aI6Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YAYf9nMd7CngkmbN/pPeNcuLRGcZt7/vDtmkgv5vF0c=;
 b=ZPcWQIwq0SSzmztR2z5iz3FN16q2YAWjlGD1GfDUBwb23RezdvyOSgKUgzIOlSaxM8/h49ipzl9+eYeIs/BJMZ33VuDmUCh1zIyCsh6Tzse+QZKu0cEN7trbobSgnmZPUc+3D2q2bm1YfpLIec7wmNggfALgWRxNAwoH378Bm4FSD+TqSIrqs/40PRK44kSwfbIgycOyA8rPCyQZiZat2jT50xQTcXc0qBG7oTRAR+rJcBR6VnRKlMi/cpWAYGfXG6F06DRZOzGTMIoP0LLg7hgThOptRPnBZMSS39GKJJ5C9mvJeApc9+XW4Zzgbqa6KB0+OSAIdHme8RgaaF5C2A==
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com (2603:1096:4:1a4::6) by
 SI2PR06MB5018.apcprd06.prod.outlook.com (2603:1096:4:1a2::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.6; Mon, 2 Dec 2024 05:39:13 +0000
Received: from SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::705a:352a:7564:8e56]) by SI2PR06MB5041.apcprd06.prod.outlook.com
 ([fe80::705a:352a:7564:8e56%7]) with mapi id 15.20.8230.000; Mon, 2 Dec 2024
 05:39:13 +0000
From: Jamin Lin <jamin_lin@aspeedtech.com>
To: "ross.burton@arm.com" <ross.burton@arm.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Troy Lee
	<troy_lee@aspeedtech.com>
Subject: RE: [OE-core] [PATCH v4 0/3] uboot-sign: support ATF and TFE ITS
 generation
Thread-Topic: [OE-core] [PATCH v4 0/3] uboot-sign: support ATF and TFE ITS
 generation
Thread-Index: AQHbOYOscRgtxl75AkC5qc3dm++B17LMxhgAgAW88yA=
Date: Mon, 2 Dec 2024 05:39:12 +0000
Message-ID: 
 <SI2PR06MB5041CADD5A098C99FAAD77E3FC352@SI2PR06MB5041.apcprd06.prod.outlook.com>
References: <20241118063233.698679-1-jamin_lin@aspeedtech.com>
 <1762D5D7-817A-4852-920F-C6B57DAFD599@arm.com>
In-Reply-To: <1762D5D7-817A-4852-920F-C6B57DAFD599@arm.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SI2PR06MB5041:EE_|SI2PR06MB5018:EE_
x-ms-office365-filtering-correlation-id: c645c2f1-bf97-4a92-972b-08dd1293a729
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?cm56V2N4R1ZuMDc4RTUrejVUaXJUMHFHTkFVc3BQQktrZmdseWl5NFhjbWV3?=
 =?utf-8?B?NS9TRm9vVnl0clNjS1RtcVZ5QWlEUmo3aDVLOVJrV3l1dEpFWS83M3VQbkVZ?=
 =?utf-8?B?SzZYbHJSVWI4ZkduaVcyVGxVeVZZODNZdUlOc2pMaGQ4NmFwSmVLcDhwLzJk?=
 =?utf-8?B?SDUyTGg1OVJvbldOYkM2RWpDeG1EK3d2YTlkekgweTBIWUZHNXNtQ24wcmg4?=
 =?utf-8?B?RGZZQTdBZ2pvallRUVVsbVh4NXAwYktpZG8vRHVLVkp4ZnhBdFRqa3ArbkY1?=
 =?utf-8?B?QnExeFcybEN2R2RSUi9PMzk1TXI0cjA2UkY1dGRHVi94UWVJNnB3L0pvUGxF?=
 =?utf-8?B?a1VWbndUVDI4NUZsS3Y5ZUFoeEJqLytxUmh6R1pXTmltdVlHUWlLcDlSQS9F?=
 =?utf-8?B?b3FQb1Z5RjRkaHdGUWVQcDZCOExhZ1FIMUVKTUtNWFhVZ2hWVDgrNXRvVXJn?=
 =?utf-8?B?aDQwV214WjVRd1BHdG1DWFlBMkxVWUI2bDBrOXRjK2gvblYrWHFVS1ltdWp1?=
 =?utf-8?B?RmtJUTNhV2NRYXd4dUJMeFRqZEpYNnA1YlA4Q1M3M3IyMDhoQXJaY2VobzYv?=
 =?utf-8?B?NllOL3lmZEF1aGZqZGJ0TVJxb2tuWmhYNlU0SkNJUStYOGNPbzc5Kzk5bExi?=
 =?utf-8?B?cVkvR05JVzNldkJxZW1mZzAxVmlpNExTZHdmelpZQ2t0U3BsQzNRcTRHOFNu?=
 =?utf-8?B?QVp0UkxxUkVkc1IxdzVWcG9HWmlWR0V0THBEQTZGSzl5YmJFTEhPZ2Yra1FO?=
 =?utf-8?B?TC9mL1RLTjdWYWtvZGhJK0tyYlhNRU1Jbm5JMVlCaEhjbDhiWE5LT3l6Q2pk?=
 =?utf-8?B?MGRuY0lSeU5zRTRyOGltT2UxN2hrUmV0R3JxcDEvYTZqdDQ1Z2lqd0RkT2ox?=
 =?utf-8?B?NDMrQ2lrNk9YeHltZ0JxUGVjM0ZFOWp6eiswanVNcUV6Mnc3UzNHWEJzWFJi?=
 =?utf-8?B?aFd3ZE85TFdweGZtNFR1a2IzZkozMzlFY1FEdzdkRTRydDN2am0yVmpSVzc3?=
 =?utf-8?B?MFU1VnZmZTNqWC9Zekg4N0pXWjNnRGtJNTRQYUJic1grM3dQUHF1cGxlTms3?=
 =?utf-8?B?U0RxUk5MTFVlaTdxSDBidjVIcTg0WStPc3hmUGtZck1Kei83cDdXdElIci8v?=
 =?utf-8?B?aDExZDFKUmJzVU9hWHRGWUF4STYySTVMby82TTRYT014WG1WRDdIeFJISjMw?=
 =?utf-8?B?ZnAvV0JiQ0o5WDNZb2VmVHAxazdSeWpxWXJwR0gwVnN4VndDL2tYd21rY1lm?=
 =?utf-8?B?ZEk3N3lIZHh1bll0TkNlSUxCSXBTbjFrWEJNc29PR3BGRUtoblgvL2kxb2NF?=
 =?utf-8?B?dnRNK2dBeVI1UWFzQW1HcmMweVc2NnBjYTVhdEZGQ3hnNHYvbTh6U3pGVUp5?=
 =?utf-8?B?UGZCUFBZNUJLNkhYZWlwQ0c5b3A5Rm9HL2lXdmg4cmpDMWROeTBLd3lLYlhu?=
 =?utf-8?B?dktrcitvL2tBbE9yWnpyUDMrNEFmU1plM1l3eHEvWjlWS3NQcC9CT3NrZEJZ?=
 =?utf-8?B?WURaQWdYdTBTSXB1a2xQU1RmL0w2RFlSb2FzNEN0amJaQWM3MVNSVEhRMGF6?=
 =?utf-8?B?ZE1sQXRaK3FMcVBGQTFKVThSOTJTamZPL0VKamVIREdkb0JaQjIyS0F4QzBB?=
 =?utf-8?B?MDZzWjIyOGI1U215clY1MUFIZXZvTzIrM05BOU9mR1pnN0p5ZlpYV0FiT290?=
 =?utf-8?B?alIxcVRXN3M3SEtVR3RpSXpnSGxzN0doZGpYTmxpbXE4SU9BM1BvbEZnUmx6?=
 =?utf-8?B?blpYSWFWbVhGdXRId1FHWHZUZGlKSUw5WFFaQ0VyN05QbGNjdHlUdjNhNXZT?=
 =?utf-8?Q?D9kdUXf0Z6FEXVO/9dRv2PxrlYBxpHWW4VE1s=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5041.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?M3ZCOHpsQzNQNXlMbEVTKzdaOExWbXZwVElFVlJTOFBSV3lSVWJndnVXMndI?=
 =?utf-8?B?WmdIWklKS215a0toRE4yb0hhd0RYT041YzJaaHdadVoxZmNPL1dlYmhHQkdY?=
 =?utf-8?B?YUExK3FlR0FGMjI0UUhnb1pkWE10bWRzOHhmVm5jK0g4d1luRDFyWlZKcVc2?=
 =?utf-8?B?d1lZRE1qVUM0SVJnSjdkcXhTSUZ5ank5azNUQlVvMDZyUC9kSERVaGxLbkpJ?=
 =?utf-8?B?SnBTWUhpKzRLTXp6WS9ZbkFGV0RualpMdFFuVkVQNkVPNTNXaGQ4TllpMHRG?=
 =?utf-8?B?QXlSaTZVZ1d5bUFERi8rbnRhMm0reGlCTlJRL0JCZERzbytzWjUzK3M2WlVR?=
 =?utf-8?B?V0FLcnJiaENSUFhYcnorbXFObVExRDYwdjRXQll0V280WkNxWDZPZTAvL0tP?=
 =?utf-8?B?d29QNEJyc2xaWHIzTHJZdDRLNzRobFlmeXllZjRGWmI2aG5YV1FHOXhHWkdV?=
 =?utf-8?B?d1V1YXM1VmVKdHBPTEphb2ZZc1NSWlpSTEhyZXltTWM4bUc0MjVzWmdIbXVQ?=
 =?utf-8?B?am15dmxjWElhNjVhMGh3b0o5TVhCcXRFVGFCYk9aQnh4aHVVYkhHQ2E2OGNL?=
 =?utf-8?B?MkRJUzZNZ3ZXbmZsRzM4ME5Fb2ZydjZlbmVCUnhqMVdGalRKcnF0OTNUczNK?=
 =?utf-8?B?K2h6bFh2MncveWhYRy9Rdjc4VDFpa2h1RFNBZ3E4NGFCbjNDSVpkRU0wM2tj?=
 =?utf-8?B?VFEvU21xejFIeWJIMS9oaSthYXNXempwRGt4aS9mcnJqRWhMajZaVzBtdGZV?=
 =?utf-8?B?VTlremtvbE1kRSt0MmxiWjVGOXRmQVFjR2pESGZCb3hLWTU0OGYxTmxmdTc0?=
 =?utf-8?B?ZnF1aHUzWEZaWGVLeFI3U0lOUnpBMEVqV3NVakpuZHArVE1vWERac2pJdmho?=
 =?utf-8?B?TS9vYU5uZldZWXo1NExqZUYrMmJnNEQ5WWJpS1RnNEY1bkVDdG9HaDIzSWVr?=
 =?utf-8?B?YW4wTXd0Z3pzRkw0Mk5VRi9DeWJ1STdVa29UYy80V3BrdkpzU28xbVYxVXRW?=
 =?utf-8?B?RnE2SVJrUU9iYUhQV3BRUllQaVlPdEs4dEo1QzlVUG9zdTBISVhNOGlsR216?=
 =?utf-8?B?ZHB0Zkp4aXZiWm9ZQS92SVVxOEFWQk9sc3JkcmhIZTgzbjJMRHZTNmxHSG9S?=
 =?utf-8?B?Z2EwZittUldpR3plYlg4TWxSTWljOVJLOWo5M2tuZGQ0YTNndE53dDhCU3lq?=
 =?utf-8?B?dkh5cFMvQ2UzaFBwT2VqcjFEdTRRNmRGdmxPcmp5QUhBYk9LaG1LZit5Z0dp?=
 =?utf-8?B?MG5JY04wOGxTUkpqT2N1NHJWaEowT1d3WFdLUEYzclZ4WVlBVlppYlZBc2ZC?=
 =?utf-8?B?VHdXYU9keXcyei9MdmdYWmtLK0Vka0g2TUZNYjhBazA5ODdqTUhQbTlNR0FV?=
 =?utf-8?B?a2dZWEZmMHhiOWs0WVlKRUFvYWYvaWc1UEVwSDdWWmFBbWIrMmF3UEtEYm42?=
 =?utf-8?B?Q2YwcksvSGw2ZFJCSTdFTTd5S2hudzV1MDU2OEl5Z2prV0Vpd25nTjJSVmkz?=
 =?utf-8?B?YmFqZlRWckRaanNVbWtYcm1HZVhLL1pENG1TdmRLV3N3cnBza3NiWE1QSmdv?=
 =?utf-8?B?RXM2UmxuaXYrRHpib3VxdkRPR1RnaThWVmZuNVM5OGxvYzRvNVdrdnlxTVc5?=
 =?utf-8?B?M0x5SmFxeHUzU29xUmZSSGdoWTZHbG5KMFh0YlZzV2tVSXd2eXpNMmx0RHcv?=
 =?utf-8?B?ZTFvaDBMUU1BbEQrOWJlTWcyL1plMUpWdDQxdFpVNG5KTU1teERBc0V5cXRQ?=
 =?utf-8?B?SzNZN2M5RTVpUlh1T21UYTd3V2UxNGx3RWF6eGFVYzZxaDF5WXo2ZnJxem9J?=
 =?utf-8?B?QnMzNzJUZUtYK3Jpb2Q5c3NsVXYwMHdCL1hiVG1IV0dYcVlmSWdScm91cE5w?=
 =?utf-8?B?YjBDcm1BUTBvVjl4K0FLN2hOS0JpRGNxQ3FXQXJxeU52MVg4VFVoWU03cHJB?=
 =?utf-8?B?d0FzN3o4MkhFSTd6cXhsVlhXN3VZZGdhM29KWmtkclhHNVVUVTVOQ3FkVHRL?=
 =?utf-8?B?bjI1NmhSakpSVldDOHY0RVJ1RnRrT0RRN0ZWZEFYMGI3aDJ6MUJ5d1lGZlgy?=
 =?utf-8?B?SjR3aTZobGNHZDNPUVRBMDQ0VEc4NVh3dGVqa1dKQ00rNS9ySFJyTWhzYnNu?=
 =?utf-8?Q?NSomoJLowsEgR/cdYot0d1KBU?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5041.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c645c2f1-bf97-4a92-972b-08dd1293a729
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2024 05:39:13.0022
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CvaKqEnRs4Nc9J0l8ek9O1LyBwrPOldMK2NdYiZ+nzOaThYh9Lw/V1bp8kcRVSUFU7yXJwU63mxVoP9j9mufMKI78dXZIe7fjU8py/t4ZbI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Dec 2024 05:39:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208124

SGkgUm9zcw0KDQo+IFN1YmplY3Q6IFJlOiBbT0UtY29yZV0gW1BBVENIIHY0IDAvM10gdWJvb3Qt
c2lnbjogc3VwcG9ydCBBVEYgYW5kIFRGRSBJVFMNCj4gZ2VuZXJhdGlvbg0KPiANCj4gSGkgSmFt
aW4sDQo+IA0KPiBUaGFua3MgZm9yIHRoZSBwYXRjaGVzLg0KPiANCj4gSG93ZXZlciwgSeKAmW0g
Z2V0dGluZyBtb3JlIGNvbnZpbmNlZCB0aGF0IGFzIG91ciBGSVQgZ2VuZXJhdGlvbiBpcyBzcHJl
YWQNCj4gYmV0d2VlbiB1Ym9vdC1zaWduIGFuZCBrZXJuZWwtZml0aW1hZ2UsIG1heWJlIHdlIHNo
b3VsZCBqdXN0IGNyZWF0ZSBhIG5ldw0KPiBjbGFzcyB0aGF0IGlzIGRlZGljYXRlZCB0byBjcmVh
dGluZyBhIEZJVCBpbWFnZSBmcm9tIGFyYml0cmFyeSBpbnB1dHMsIHNvIGluIHRoaXMNCj4gY2Fz
ZSB5b3XigJlkIGhhdmUgZGVwZW5kZW5jaWVzIG9uIHRmLWEvdWJvb3Qva2VybmVsIGFuZCB3cml0
ZSBhIGR0cyB0aGF0DQo+IGRlc2NyaWJlcyB0aGUgbGF5b3V0LiAgSeKAmW0gdW5jb252aW5jZWQg
dGhhdCB0aGUgY29tcGxleGl0eSBvZiB0aGVzZSBjbGFzc2VzIGlzDQo+IHN1c3RhaW5hYmxlIGFu
ZCBhIHRydWx5IGdlbmVyaWMgY2xhc3MgbWlnaHQgYmUgYSBtb3JlIG1haW50YWluYWJsZQ0KPiBh
bHRlcm5hdGl2ZS4NCj4gDQo+IFdoYXTigJlzIHlvdXIgb3BpbmlvbiBvbiB0aGlzPyAgVGhlIGZh
Y3QgdGhhdCB5b3UgaGFkIHRvIGFkZCBjdXN0b20gaG9va3MgaW4NCj4gMi8zIHNlZW1zIHRvIGlu
ZGljYXRlIHRoYXQgYSBtb3JlIGluaGVyZW50bHkgZmxleGlibGUgY2xhc3Mgd291bGQgYmUgdGhl
IHJpZ2h0DQo+IGFwcHJvYWNoLg0KPiANClRoYW5rcyBmb3IgeW91ciByZXZpZXcgYW5kIHN1Z2dl
c3Rpb24uDQoNCkkgYWdyZWUgdG8gY3JlYXRlIGEgbmV3IGJiY2xhc3MgdG8gZ2VuZXJhdGUgdGhl
IElUUyB3aXRoIHVzZXJzIGFyYml0cmFyeSBpbnB1dHMuDQpDb3VsZCB5b3UgcGxlYXNlIGdpdmUg
bWUgdGhlIGZvbGxvd2luZyBjb21tZW50cz8NCg0KMS4JV2hhdCBpcyB0aGUgbmFtZSBvZiB0aGlz
IGJiY2xhc3M/DQoyLglUaGlzIG5ldyBiYmNsYXNzIHNob3VsZCBiZSBwbGFjZWQgaW4gd2hpY2gg
ZGlyZWN0b3J5IGFuZCBtZXRhIGxheWVyPw0KMy4JTXkgYnJpZWZseSBwcm9wb3NhbCBvZiB0aGlz
IG5ldyBiYmNsYXNzIGFzIGZvbGxvd2luZywgY291bGQgeW91IHBsZWFzZSBnaXZlIG1lIGFueSBz
dWdnZXN0aW9uPw0KDQpjcmVhdGVfaXRzKCkgew0KCWNhdCA8PCBFT0YgPj4gJHtVQk9PVF9JVFN9
DQogICAgJHtVU0VSX0ZJUk1XQVJFfSB7DQogICAgICAgICAgICBkZXNjcmlwdGlvbiA9ICR7VVNF
Ul9ERVNDUklQVElPTn07DQogICAgICAgICAgICBkYXRhID0gL2luY2Jpbi8oIiR7VUJPT1RfRklU
X1NTUF9JTUFHRX0iKTsNCiAgICAgICAgICAgIHR5cGUgPSAke1VTRVJfRklSTVdBUkV9Ow0KICAg
ICAgICAgICAgYXJjaCA9ICIke1VTRVJfQVJDSH0iOw0KICAgICAgICAgICAgb3MgPSAiJHtVU0VS
X09TfSI7DQogICAgICAgICAgICBsb2FkID0gPCR7VVNFUl9MT0FEQUREUkVTU30+Ow0KICAgICAg
ICAgICAgZW50cnkgPSA8JHtVU0VSX0VOVFJZUE9JTlR9PjsNCiAgICAgICAgICAgIGNvbXByZXNz
aW9uID0gJHtVU0VSX0NPTVBSRVNTfTsNCkVPRg0KCWlmIFsgIiR7U1BMX1NJR05fRU5BQkxFfSIg
PSAiMSIgXSA7IHRoZW4NCgkJY2F0IDw8IEVPRiA+PiAke1VCT09UX0lUU30NCiAgICAgICAgICAg
IHNpZ25hdHVyZSB7DQogICAgICAgICAgICAgICAgYWxnbyA9ICIke1VCT09UX0ZJVF9IQVNIX0FM
R30sJHtVQk9PVF9GSVRfU0lHTl9BTEd9IjsNCiAgICAgICAgICAgICAgICBrZXktbmFtZS1oaW50
ID0gIiR7U1BMX1NJR05fS0VZTkFNRX0iOw0KICAgICAgICAgICAgfTsNCkVPRg0KCWZpDQoJY2F0
IDw8IEVPRiA+PiAke1VCT09UX0lUU30NCiAgICB9Ow0KRU9GDQp9DQoNClRoZW4sIHVzZXJzIHNl
dCDigJxVU0VSX1hYWOKAnSB2YXJpYWJsZXMgdG8gY3JlYXRlIHRoZWlyIG93biBJVFMgZmlsZSBm
b3IgdS1ib290L2tlcm5lbCBGSVQgaW1hZ2UgZ2VuZXJhdGlvbi4NCk9yIGNhbiB5b3UgZ2l2ZSBt
ZSBhbnkgc3VnZ2VzdGlvbiBhYm91dCB5b3VyIGdvYWwgYW5kIElUUyBpbXByb3ZlbWVudD8NCg0K
VGhhbmtzLUphbWluDQoNCj4gQ2hlZXJzLA0KPiBSb3NzDQo+IA0KPiANCj4gPiBPbiAxOCBOb3Yg
MjAyNCwgYXQgMDY6MzIsIEphbWluIExpbiB2aWEgbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA8
amFtaW5fbGluPWFzcGVlZHRlY2guY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+IHdyb3RlOg0K
PiA+DQo+ID4gdjA6DQo+ID4gIDEuIGFkZCB2YXJpYWJsZSB0byBzZXQgbG9hZCBhZGRyZXNzIGFu
ZCBlbnRyeXBvaW50Lg0KPiA+ICAyLiBGaXggdG8gaW5zdGFsbCBub25leGlzdGVudCBkdGIgZmls
ZS4NCj4gPiAgMy4gc3VwcG9ydCB0byB2ZXJpZnkgc2lnbmVkIEZJVA0KPiA+ICA0LiBzdXBwb3J0
IHRvIGxvYWQgb3B0ZWUtb3MgYW5kIFRGQSBpbWFnZXMNCj4gPiB2MToNCj4gPiAgRml4IHBhdGNo
IGZvciBjb2RlIHJldmlldw0KPiA+IHYyOg0KPiA+ICBjcmVhdGVkIGEgc2VyaWVzIHBhdGNoDQo+
ID4gdjM6DQo+ID4gIGFkZCBjb3ZlciBsZXR0ZXINCj4gPiB2NDoNCj4gPiAgQWRkIG9lLXNlbGYg
dGVzdGNhc2VzIGZvciByZXZpZXdlciBzdWdnZXN0aW9uICBBZGQgZG9jdW1lbnRhdGlvbiBmb3IN
Cj4gPiByZXZpZXdlciBzdWdnZXN0aW9uLg0KPiA+ICBMaW5rOg0KPiA+IGh0dHBzOi8vcGF0Y2h3
b3JrLnlvY3RvcHJvamVjdC5vcmcvcHJvamVjdC9kb2NzL3BhdGNoLzIwMjQxMTE4MDYyMTEzLjIN
Cj4gPiA2OTI1My0xLWphbWluX2xpbkBhc3BlZWR0ZWNoLmNvbS8NCj4gPg0KPiA+ICBUaGUgZm9s
bG93aW5nIHBhdGNoZXMgaGFkIGJlZW4gYXBwbGllZCBmcm9tIHYwIGNoYW5nZXMuDQo+ID4gIGEu
IEZpeCB0byBpbnN0YWxsIG5vbmV4aXN0ZW50IGR0YiBmaWxlICBiLiBzdXBwb3J0IHRvIHZlcmlm
eSBzaWduZWQNCj4gPiBGSVQgIGMuIGFkZCB2YXJpYWJsZSB0byBzZXQgbG9hZCBhZGRyZXNzIGFu
ZCBlbnRyeXBvaW50Lg0KPiA+DQo+ID4gSmFtaW4gTGluICgzKToNCj4gPiAgdWJvb3Qtc2lnbjog
c3VwcG9ydCB0byBjcmVhdGUgVEVFIGFuZCBBVEYgaW1hZ2UgdHJlZSBzb3VyY2UNCj4gPiAgdWJv
b3Qtc2lnbjogc3VwcG9ydCB0byBjcmVhdGUgdXNlcnMgc3BlY2lmaWMgaW1hZ2UgdHJlZSBzb3Vy
Y2UNCj4gPiAgb2Utc2VsZnRlc3Q6IGZpdGltYWdlOiBhZGQgdGVzdGNhc2VzIHRvIHRlc3QgQVRG
IGFuZCBURUUNCj4gPg0KPiA+IG1ldGEvY2xhc3Nlcy1yZWNpcGUvdWJvb3Qtc2lnbi5iYmNsYXNz
ICAgfCAxMDAgKysrKysrKy0NCj4gPiBtZXRhL2xpYi9vZXFhL3NlbGZ0ZXN0L2Nhc2VzL2ZpdGlt
YWdlLnB5IHwgMjg4ICsrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gMiBmaWxlcyBjaGFuZ2Vk
LCAzODcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gLS0NCj4gPiAyLjI1
LjENCj4gPg0KPiA+DQo+ID4NCj4gPg0KDQo=

