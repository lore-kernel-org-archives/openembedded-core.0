Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D8FBC2BA1A
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 08:36:08 +0000 (UTC)
Received: from esa17.fujitsucc.c3s2.iphmx.com (esa17.fujitsucc.c3s2.iphmx.com [216.71.158.34])
 by mx.groups.io with SMTP id smtpd.web11.68337.1718958963104458248
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jun 2024 01:36:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=g+XA/hpj;
 spf=neutral (domain: fujitsu.com, ip: 216.71.158.34, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1718958964; x=1750494964;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=gf1ZETkLG0BoJTUQLWXedD4Ms33x+zhXj5tQIWadYyY=;
  b=g+XA/hpjbVvPlNIo1NoHCGvxiNzqhgFIzMxcyFXbN77k+MFplSjpFBh+
   2LRXnj6o0N84S159VCFxbkIqAYFPHgHDUfsSIOqjBCuCQMJrQTOh3caYS
   DfAWP+Ry+nJg1ergaVS1NmFzd9B4YqZhOdKG30L8UQxtBs+jrFFj3reRN
   B7WDtn3/QHU2TMOVyCRjn0xHFTCKZaNXp5OUW5CnUvsOJaH0projjY/5Y
   URpWZB6qj0J+ihZNlkRLrOtOrj8p6MNGOa/pn7ks4gU8T7sc7ups1MN3t
   oMCoBMQw7m2sNmV7Q2viqKOKb42Z7TDRrgZ4iFejXxS94G/tJWj9tc9na
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="122924848"
X-IronPort-AV: E=Sophos;i="6.08,254,1712588400"; 
   d="scan'208";a="122924848"
Received: from mail-os0jpn01lp2109.outbound.protection.outlook.com (HELO JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.109])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 17:36:00 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/Qe3WRqmKeS6OyjJAZV54XNzE7ACo3adm8N3eYbYiA5AQV6VncAeZHv09AN6Oa7iLIH3ToTlhTajBr4QcUCJOK8WX1xqufXGYWOi1U0fXLW3p42bHl2DmZvvIxuor0a3Xlp/sXkZns96XhuMsIMMy6kf0VUKI0fuX2Cfy0lmaHRr60FJYhsD/rtCiP4VQ6vYgYUVm/H1lqbQJT5PNkidBSjCuN8toYqCU6XCHh00/IYCvXb/Cs8zBn8uHOp+EULh4rdNTHGNFlZntoiaISlusEFg+tZGK5w345g3i2qBD+arpbXF2PEAyyrGpthPvRDYnXCbg4K7ZRTwwHhHyYUeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gf1ZETkLG0BoJTUQLWXedD4Ms33x+zhXj5tQIWadYyY=;
 b=X4VWd5xrMgRwZ7tD6uIT2b+VEexJcySYrERTqJJWKHzVhui4SI0VLg2gG1Dir2ZG1P9/gJkUETmhKSsmSWn/pwSWbrgiu/dV7SDAEM12ztKs2u+o0FKKF+rXbiGAziQdV194MHY2o8/mcpakbrj3mwfq0EsWm0wkXnu/bDEx3VOi5PqAaRkkiaOdsQB8qC9gJ9DG7HIcWrZdIDIYbljc1NLJ4KQfb0pPXnLYM4eBvRmeipA9tyjRdW9XzjZ0Tb+uxNgIeW0Tsp3ZPzPdLVVmHcU7aBWGtSV2oVgMelO8qHe/cAMi3AlXjxYZHeF62SjVxJdyuCrWMox4oGj6a0sM/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by TY3PR01MB11368.jpnprd01.prod.outlook.com
 (2603:1096:400:3d0::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Fri, 21 Jun
 2024 08:35:56 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342%7]) with mapi id 15.20.7677.030; Fri, 21 Jun 2024
 08:35:56 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: =?utf-8?B?TWFydGluIEh1bmRlYsO4bGw=?= <martin@geanix.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 19/22] ofono: upgrade 2.7 -> 2.8
Thread-Topic: [OE-core] [PATCH 19/22] ofono: upgrade 2.7 -> 2.8
Thread-Index: AQHaw4Ek+kPZR0u4K02A474lrW+MR7HR2jKAgAAHv8A=
Date: Fri, 21 Jun 2024 08:35:56 +0000
Message-ID: 
 <TYWPR01MB11861A3ED939500A3A23F3051DCC92@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
	 <1718936206-8080-19-git-send-email-wangmy@fujitsu.com>
 <6bb8188e5bcf50c8054cf986d4c7e0ca82fdf460.camel@geanix.com>
In-Reply-To: <6bb8188e5bcf50c8054cf986d4c7e0ca82fdf460.camel@geanix.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2Uw?=
 =?utf-8?B?NTBfQWN0aW9uSWQ9YjA3OTkwZmQtNzRjNy00ZTFkLTk2MGEtZDIyNDY4NjQx?=
 =?utf-8?B?NTk2O01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRm?=
 =?utf-8?B?ZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5?=
 =?utf-8?B?LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX01ldGhv?=
 =?utf-8?B?ZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRk?=
 =?utf-8?B?LTNiMGY0ZmVjZTA1MF9OYW1lPUZVSklUU1UtUkVTVFJJQ1RFROKAiztNU0lQ?=
 =?utf-8?B?X0xhYmVsX2E3Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9T?=
 =?utf-8?B?ZXREYXRlPTIwMjQtMDYtMjFUMDg6MjQ6NDdaO01TSVBfTGFiZWxfYTcyOTVj?=
 =?utf-8?B?YzEtZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?utf-8?Q?d-81e1-4858-a9d8-736e267fd4c7;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|TY3PR01MB11368:EE_
x-ms-office365-filtering-correlation-id: abd6216c-da05-4298-6303-08dc91cd2b8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230037|376011|366013|4022899006|1800799021|1580799024|38070700015;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NXZ4ZUdINE8vYVplODg4UFdoQkxrUWxhNkxMNUdIN1JMZEdmUmtIYUpWMVpX?=
 =?utf-8?B?ZXhNc2dOeEs1a3JYVXEwVFFTWU13NERmTHNiM21qYnZ4SWRYNG9ka2NwQU9I?=
 =?utf-8?B?ZFgrL2I1MVBmNjVEVlVmN1pYRi94UUhRY21xOEhjMUVpa0J6K3NYZ0JqYmY1?=
 =?utf-8?B?TGN4ck40L1ZuOVZEQ2VQdGxqNzAxWW96V3BQbi8zRS8rbnpycEo5eWJzMWpB?=
 =?utf-8?B?OVdQOVUwTG5UbGVsVTJYcDd2cks5cmVhcjhta0V1M1ROMFd3dU0wMnlRcTRw?=
 =?utf-8?B?R3Q4aVloZGVVbU5xMHY5TFlXaElTenFOTGt3SE1PdHMvck1wU1NEWTVTdDdu?=
 =?utf-8?B?NnpURXhBVW1VOTZkVzdleUZxalVSUTZGRW5SREZIQTUyVmdaeUo2NU1WY0Ez?=
 =?utf-8?B?RkVHb0NXaldIRHU4M0lVeUdoNURySEVtYzhQMXk3M3RMVElLeEdJQi8yUVhU?=
 =?utf-8?B?Q1ZXSFhWMmUvZktTbzdjdDZwUzRvcFQxUFlyKy9ZZTl6M2s5ZkZRMC94d3Bt?=
 =?utf-8?B?alJQVWREZkFyNGpHRFJEL3IrRWk1VmlGdTRIa09tN0NhdjZzZTFVVXdTOGdt?=
 =?utf-8?B?ajFwdjZOaXJFWUdOWkZrLzF4UlpTMHdNU2RWNmxhckJOUjZTUDVRRXBhS3hs?=
 =?utf-8?B?MG1UZzlxZWF4VzJvWFNVN0lqWWluU0FsdmE5c2t2K1RZcy9NM2t0MzQrRkx6?=
 =?utf-8?B?djJyaDJzaDdjMWpTak53bmZhWHRsRDR6Y0RCYUFTaHNQUjBHaTJONVFERDZ3?=
 =?utf-8?B?RkZDamEveXVqdjMyVmRlVUFJVDEzc3FwSWFUc2hEOStUZGdwV2xYRlE5WWlK?=
 =?utf-8?B?RXpuVDcyQmtXTTlCMERxVkdMNHJPdStQcFFrRGtxN1o1SWlSbi81MUxpS0xJ?=
 =?utf-8?B?alBhNUY4RHZJN29mYXNhQnNGKzdZRUJaQzhVTEphb2dKU0k0dkFkeTFxQ1hs?=
 =?utf-8?B?aXgvY0piRVNnWjd4RTdtZTFENUhUcW9wditHVVFuTlpsWXVpdGl1clRkVUdj?=
 =?utf-8?B?WnR0T2RsNzdUOHhuNU5IZUdWOTBnRDVHZDM1RHhCd3pCS05WQ3NVZ3RaWHpE?=
 =?utf-8?B?Qkh5Rkx2RlFnNVl0c1VVczd0RmdBMC9kc1N4TFJmN3Arakk3SE5pdHBOdVJK?=
 =?utf-8?B?NGlibVVpNFMrUGFacGdzYlh3c3ZpaW9mUTQ3VFAzNjQ5NHE5WWdqN3BvN0hu?=
 =?utf-8?B?L0Vaak5mZlFZcEZORkM1N1ZPUytVd0FrY0ZBODRTV2RVaEJrb0Y4UEt6MzVL?=
 =?utf-8?B?SFBSTmlseThBT0tyNUJzMDB3eXVNL0N4VkNQRzRQQWpGcFRyMlpVWkhvUkg0?=
 =?utf-8?B?QmNtdVZzZE5ncEhOQUw2UytUL29Jdk5OcnlWUS9LM0xOVEhqbzM3bHp5SXZI?=
 =?utf-8?B?aUM2WEhsTlFHVnd3OWh4NXRnWFVBeDU2RzM5NFk0bFV6WTBsMHI1T092SmVB?=
 =?utf-8?B?cHJOQUJSTE9McXNTNTl4YW1FaHdSTnNOcHJ3Z2lHcWgwUGpHeEdsNCtNVlI0?=
 =?utf-8?B?Y21BVVQ1ZlJ2QVM2eTdtU2Jhc0l3aXE1akhiUisrTEwyY1ZtTXpVc3NmVFJY?=
 =?utf-8?B?KzVmeU42QkdPdjJaM1MrTUdqeHlIU21rcWsybVZ6WVZnZ0xabnduL2RTYUhv?=
 =?utf-8?B?TjhxeU4wbVVVWDlJK0NUcnpxRXhrY0NKNjdSelpWWWI1U0c4L2h6eHkwa05L?=
 =?utf-8?B?TFdSSldpKzIzUDh2aHZTbk5uR05sYmRkN3Avb1RvTm55VW1sb255VWN6K3Vp?=
 =?utf-8?B?LysyRGxlM2FkSEhiZC8vZFN0ZTNnMUhYdW11UENld1dwMVBISFQxT1FSK3cz?=
 =?utf-8?B?cDA5VytNYjR6S2JTS1Mydz09?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(366013)(4022899006)(1800799021)(1580799024)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?bUFISXRkSDJZY2IzOEh4ZmlQMGhhL21ieXZ3Qm02TGswZ0xSc3hTYldET1p5?=
 =?utf-8?B?QzAwQ2FkU2JaSE9aS0EyeTNRR0lvcDAzVDdocXh3bXpJRmYyYkNoRFNrTFh4?=
 =?utf-8?B?YnlJeDR0OVFUU0VNK2lRNmVZdUZ5VGxWZFZGeVUxU29lMldWL1A3anA1U2xC?=
 =?utf-8?B?UjB2ajFta2xjTUJPb29sL0ovOHVJZDFJb1Zjdlc2U1ZnQ2krN241UUFVSUpE?=
 =?utf-8?B?R1dvc0MzcUNrRzJBOFFLQU1hUzZ5WStWOGhNck1nTFdrUzYyWCs0T000L1RC?=
 =?utf-8?B?YnArUTRmOW9QMVJCQXF6SlNoZDFIeDg5YjludkNhUU9FcklJbmdVbnpabVNM?=
 =?utf-8?B?b1VLZGtnbjZ6c0hkaTArQ3R3RGhqNlJ3UXBYd2RKRmhOUkxXL0VERU9WT1p5?=
 =?utf-8?B?TUJmRk5DanpjbVgyTVdZTURRZm9ub3VuZmVWeTRpK3lCWjdrSTlqRVBqTjZz?=
 =?utf-8?B?dGlPa0cvcjc4YmhFOVZPcWdMVVBmVXRZWGUrdStWQlcwckpxQWRjcW5oT2ll?=
 =?utf-8?B?MW1qMzdsQTNtQVBzZWNRbXhNVkhPK1MyZllWajRZRmFXZVZ5V0lHRm1FMXJ4?=
 =?utf-8?B?alV6R0RQY1JsaFJYaFVpb01sdXQwTmxqYUNPQ1JaMHQvV1FsYmllR0g5RXAy?=
 =?utf-8?B?djJTWFpaWDlrRzJ2S0EvWFpVYkZ1ZC9zeGZWaXhGZG1mS0JEWFIwZWpSWE5C?=
 =?utf-8?B?UGt1Nmg0aWw1MmFtUkN3eE5na2VGWXp0S1c0ZXF4OWdVKzFwaXdSWUpaRDhR?=
 =?utf-8?B?ZkZmenM2VzlDVk1ZOThKaFFyRXF6YnBBWGl1RmlOcTVyM1U2SGlvb2locmIw?=
 =?utf-8?B?N0ZuYUlwMkhSaWl4NW5vSTV5bVhBUHhvYkNoM0NMUE9hcFBtRHdPVjBFZUFx?=
 =?utf-8?B?c08reVNmZ0VLemd1MDM5U0VUdDhaaUxrMnBTNHhicFhJd3NkNkkxZnhNQXdL?=
 =?utf-8?B?MnBwMFgxNFVhbWR3SlVneW5Ka2xyM2FrNkdmemw1eWFGMDhFTzVmSUhsSytF?=
 =?utf-8?B?cERDWHZVMm5CclE4QWQ3aTduc1B4VE41ZkxUckIwRlVWQklENGJjQnRyc2dR?=
 =?utf-8?B?VCt2WHUvaFZCc1FDT1lBUlc4UkxVeHgzcno4K04vQ1FUOW5VVkpsNFZ3VHlj?=
 =?utf-8?B?OEQzRXR0a2pWWEVreCtxYkhuTS9qUVhFVThGOWlhRGN3SnlIeHU5cWRlT3BW?=
 =?utf-8?B?UzMyckVHYUZTRERjY1A0a2dsQXJHNW52eFYxZm02OFFZb2plNzBobkVNd1U2?=
 =?utf-8?B?dzc4V3p0VWlqWW9sUkV6MjdpWEUxZlZIeUpnZWRoUHozV1lqWHFZNEVScG5y?=
 =?utf-8?B?OGdoQi9raG1KRms4TWVtWUpISVdiVHlYUDhGMU1qYTFpbmhvemNDWWRqZFdF?=
 =?utf-8?B?QjMzekMveUxmY0pjR0MvUWJ1eVh0MmJYTnFkVXkzUFJQSHdoWXB1Mm45alhk?=
 =?utf-8?B?YVBqWXlPUlJRaU4ycDl6Sk1jWjFjQlZDODQ3cFFJRVJHUFZjTmVTSFlGdlB6?=
 =?utf-8?B?bnkzNTNUbG5sNW55R1Z1K2laTWYzZ0JJQXRiZEN5TjRQTmdYd0RoZjJHdTlE?=
 =?utf-8?B?WEx0THhJUDg5V1k3QjUwcFhCZmFrLzhkdVM2cWVKSDVwMVJPSld0dUpuMUVL?=
 =?utf-8?B?VlVnMzhySFpMNmdaczVnR1llUWpBNHhpWXpCQ0JDb1p2Mms0cSsxaTN1TUpm?=
 =?utf-8?B?TjdFck9jaXYxQ1BwYmpCT04yclZDZ3p3aFZzbk5wZjdtb3doLytnMnRTQWVC?=
 =?utf-8?B?L1NOUWl3T2g4VGl2RjMrQjhVczNzZVREWDBoV3gwakNrRlF0TW1yWkVIaHpG?=
 =?utf-8?B?WHlxTXYzV3dYOWpKSHhXM0tKZWFuaHpQK3JJR21MK2VtaXRtb2ZCMXRQMVM1?=
 =?utf-8?B?cHBxaUZ3UHdBdEpFc2tBSzhnM2k1dWt0S0xncWcvb2xFWC9qMG5XZkR6eGNI?=
 =?utf-8?B?MXlwVlNGQjZoa2RicDRyd1RuaE51ZzJzWXhqWjdWWllUeTJHZDVNVjVZVzFF?=
 =?utf-8?B?MDVrWjJ1VE5rek9UdTJtQVpJQ3Jwbm5aSlkwY09qcm40SHhmTjUxYmYzSHVi?=
 =?utf-8?B?MUhMQk9PQnkzU1ZRT0lDMXhHU28xMzRMQTBkUDNBOUVNYTZrRnFRdlVaMXhh?=
 =?utf-8?Q?NYDw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	KpccN8qEUgWMxuF/yj6a0XTuPU2MgReLmeqPjQs3ThAYu7PBEjRVr9INVs51JN6meoQz2LS3bpkuIM7nuFTplhT/i44aFUxirWvpY9BXh4ekkbssGFlJIleohs7CnM8qAng/KkC/FQ9AV6rtDhepEaNnSkzw+6jRH1dSazL18TID7VeTI4xcXFhQRaS5og2w5/9gbBgmSaD0w1x9oP0qQGeGlEJ7oW+MGREDmEMR/RXfQLBxms6iforBuo3pAmTHKpleQqtPEABcUKkeTMd6hzygfFKvnGI6hnpuNHMMgslZkv4LM7hOPicl9cIxHkITsv9FC+McRezqTLjPOoWHHwADevZvkr9HWpwzwaA5ezgPpMCnjelGjiI5SDvYOu0pQTOFT/KVPexJzZ9w6ZHfr7ZXlqAC+POPEqRx92UMakDWraiU4KaSBQruY4vGpF6AGUy9Eq5+LXGMPc5rAnK2f0yZ2YliieNGAT9Lhp6ZKVH/J1vISM2y9katbulm5tSGQ6e25I2kQ8wowlhH9gVjT1Qh8UBuFq5G1wiOsgs2F1jyYqneSlxeY+GbBPiPGLbTIZPkI2n3FYUzY80QJKxOzgPFvwcR6wFxSGhgDMF/89+3xJJexqHAjpJu01+91WxF
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abd6216c-da05-4298-6303-08dc91cd2b8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2024 08:35:56.4093
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ih75ikvHvNgkqX6+3HTKcJRIr3WFT134szZEKmD4AKHf93dQI6vx34HTXFH7EiCl5fr0vkYByUWkjk6vkoeghw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11368
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 08:36:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201002

SSBnb3QgaXQsIHRoYW5rIHlvdSBmb3IgZXhwbGFpbmluZy4NCkkgd2lsbCBrbm93IGhvdyB0byBk
ZWFsIHdpdGggdGhlIHNpbWlsaWEgc2l0dWF0aW9uLg0KDQogIC0tDQpCZXN0IFJlZ2FyZHMNCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KV2FuZyBN
aW5neXUNCkZVSklUU1UgTkFOSklORyBTT0ZUV0FSRSBURUNITk9MT0dZIENPLiwgTFRELiAoRk5T
VCkNCk5vLjYgV2Vuemh1IFJvYWQsIE5hbmppbmcsIDIxMDAxMiwgQ2hpbmENClRFTO+8mis4Nisy
NS04NjYzMDU2Ni0tODU2OA0KQ09JTlM6IDc5OTg4NTQ4DQpGQVg6ICs4NisyNS04MzMxNzY4NQ0K
TUFJTDogd2FuZ215QGZ1aml0c3UuY29tDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0N
Cj4gRnJvbTogTWFydGluIEh1bmRlYsO4bGwgPG1hcnRpbkBnZWFuaXguY29tPg0KPiBTZW50OiBG
cmlkYXksIEp1bmUgMjEsIDIwMjQgMzo1NyBQTQ0KPiBUbzogV2FuZywgTWluZ3l1L+eOiyDpuKPn
kZwgPHdhbmdteUBmdWppdHN1LmNvbT47DQo+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMTkvMjJdIG9mb25v
OiB1cGdyYWRlIDIuNyAtPiAyLjgNCj4gDQo+IE9uIEZyaSwgMjAyNC0wNi0yMSBhdCAxMDoxNiAr
MDgwMCwgd2FuZ215IHZpYSBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IHdyb3RlOg0KPiA+IEZy
b206IFdhbmcgTWluZ3l1IDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+ID4NCj4gPiBDaGFuZ2Vsb2c6
DQo+ID4gPT09PT09PT09PQ0KPiA+IC0gRml4IGlzc3VlIHdpdGggaGFuZGxpbmcgVVNCIFRUWSBk
ZXZpY2UgZGV0ZWN0aW9uLg0KPiA+IC0gRml4IGlzc3VlIHdpdGggaGFuZGxpbmcgR09CSSB2ZXJz
dXMgUVJUUiBkZXRlY3Rpb24uDQo+ID4gLSBGaXggaXNzdWUgd2l0aCBoYW5kbGluZyBRTUkgYmFz
ZWQgUENJZSBkZXZpY2VzLg0KPiA+IC0gRml4IGlzc3VlIHdpdGggaGFuZGxpbmcgQ1JTTSByZXN1
bHQgcGFyYW1ldGVycy4NCj4gPiAtIEZpeCBpc3N1ZSB3aXRoIGhhbmRsaW5nIFBQUCBBQ0NNIGZv
ciBRdWVjdGVsIG1vZGVtcy4NCj4gPg0KPiA+IExpY2Vuc2UtVXBkYXRlOiB1c2UgU1BEWC1MaWNl
bnNlLUlkZW50aWZpZXIgdG8gc3BlY2lmeSBsaWNlbnNlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1i
eTogV2FuZyBNaW5neXUgPHdhbmdteUBmdWppdHN1LmNvbT4NCj4gPiAtLS0NCj4gPiDCoC4uLi9v
Zm9uby97b2Zvbm9fMi43LmJiID0+IG9mb25vXzIuOC5iYn3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHwgNQ0KPiA+ICsrKy0tDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+IMKgcmVuYW1lIG1ldGEvcmVjaXBl
cy1jb25uZWN0aXZpdHkvb2Zvbm8ve29mb25vXzIuNy5iYiA9PiBvZm9ub18yLjguYmJ9DQo+ID4g
KDkxJSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L29m
b25vL29mb25vXzIuNy5iYg0KPiA+IGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9vZm9uby9v
Zm9ub18yLjguYmINCj4gPiBzaW1pbGFyaXR5IGluZGV4IDkxJQ0KPiA+IHJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm9fMi43LmJiDQo+ID4gcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvb2Zvbm8vb2Zvbm9fMi44LmJiDQo+ID4gaW5kZXgg
YmMxZjNlZmQwNC4uMmFlZDAyY2RjMCAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhL3JlY2lwZXMtY29u
bmVjdGl2aXR5L29mb25vL29mb25vXzIuNy5iYg0KPiA+ICsrKyBiL21ldGEvcmVjaXBlcy1jb25u
ZWN0aXZpdHkvb2Zvbm8vb2Zvbm9fMi44LmJiDQo+ID4gQEAgLTQsMTQgKzQsMTUgQEAgSE9NRVBB
R0UgPSAiaHR0cDovL3d3dy5vZm9uby5vcmciDQo+ID4gwqBCVUdUUkFDS0VSID0gImh0dHBzOi8v
MDEub3JnL2ppcmEvYnJvd3NlL09GIg0KPiA+IMKgTElDRU5TRSA9ICJHUEwtMi4wLW9ubHkiDQo+
ID4gwqBMSUNfRklMRVNfQ0hLU1VNID0NCj4gPiAiZmlsZTovL0NPUFlJTkc7bWQ1PWViNzIzYjYx
NTM5ZmVlZjAxM2RlNDc2ZTY4YjVjNTBhwqBcDQo+ID4gLQ0KPiA+IGZpbGU6Ly9zcmMvb2Zvbm8u
aDtiZWdpbmxpbmU9MTtlbmRsaW5lPTIwO21kNT0zY2UxN2Q1OTc4ZWYzNDQ1ZGVmMjY1YjkNCj4g
PiA4ODk5YzJlZQ0KPiA+ICINCj4gPiArDQo+ID4gZmlsZTovL3NyYy9vZm9uby5oO2JlZ2lubGlu
ZT0xO2VuZGxpbmU9MjA7bWQ1PTVlZGQyMTI2NTM3ODUxODQyNDUzYzYxZg0KPiA+IGJmNTUxODUx
DQo+ID4gwqBcDQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICIN
Cj4gDQo+IFRoaXMgc2hvdWxkIGJlICJlbmRsaW5lPTYiIHRvIGF2b2lkIHVzaW5nIHJlZ3VsYXIg
Y29kZSBhcyBsaWNlbnNlLiBTZWUNCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb3BlbmVtYmVk
ZGVkLWNvcmUvMjAyNDA2MTgwNzM0MzkuMjA2ODk0NC0xLW1hcnQNCj4gaW5AZ2Vhbml4LmNvbS8N
Cj4gDQo+IC8vIE1hcnRpbg0KPiANCj4gPiDCoERFUEVORFMgPSAiZGJ1cyBnbGliLTIuMCB1ZGV2
IG1vYmlsZS1icm9hZGJhbmQtcHJvdmlkZXItaW5mbyBlbGwiDQo+ID4NCj4gPiDCoFNSQ19VUkkg
PSAiXA0KPiA+IMKgwqDCoMKgICR7S0VSTkVMT1JHX01JUlJPUn0vbGludXgvbmV0d29yay8ke0JQ
Tn0vJHtCUH0udGFyLnh6IFwNCj4gPiDCoMKgwqDCoCBmaWxlOi8vb2Zvbm/CoFwNCj4gPiDCoCIN
Cj4gPiAtU1JDX1VSSVtzaGEyNTZzdW1dID0NCj4gPg0KPiAiZGFiZjZlZjA2Yjk0YmVhYWQ2NTI1
MzIwMGFiZTM4ODcwNDZhNGU3MjJmNGZlMzczYzQyNjRmMzU3YWU0N2FkMyINCj4gPiArU1JDX1VS
SVtzaGEyNTZzdW1dID0NCj4gPg0KPiAiYjVhZWY0NTViM2EzNzRjZTQzYmFkNDNjMmFkZTlkMDQz
MGQ5YzBkMjg5NTIzODVjNDRhYzdkMGRjOTMzYmJiOA0KPiAiDQo+ID4NCj4gPiDCoGluaGVyaXQg
YXV0b3Rvb2xzIHBrZ2NvbmZpZyB1cGRhdGUtcmMuZCBzeXN0ZW1kIGdvYmplY3QtDQo+ID4gaW50
cm9zcGVjdGlvbi1kYXRhDQo+ID4NCj4gPg0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+
ID4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+
ID4gVmlldy9SZXBseSBPbmxpbmUgKCMyMDA5ODQpOg0KPiA+IGh0dHBzOi8vbGlzdHMub3BlbmVt
YmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL21lc3NhZ2UvMjAwOTg0DQo+ID4gTXV0ZSBU
aGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvMTA2NzkyNTgyLzM2
MTg0MTQNCj4gPiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWNvcmUrb3duZXJAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZw0KPiA+IFVuc3Vic2NyaWJlOg0KPiA+IGh0dHBzOi8vbGlzdHMub3BlbmVt
YmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1jb3JlL3Vuc3ViwqBbDQo+ID4gbWFydGluQGdlYW5p
eC5jb21dDQo+ID4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4gPg0KDQo=

