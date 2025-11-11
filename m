Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE84CCF9E3
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 07:58:16 +0000 (UTC)
Received: from OS0P286CU010.outbound.protection.outlook.com (OS0P286CU010.outbound.protection.outlook.com [40.107.74.34])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12788.1762847893246032046
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Nov 2025 23:58:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=selector1 header.b=cRisoDdP;
 spf=pass (domain: fujitsu.com, ip: 40.107.74.34, mailfrom: wangmy@fujitsu.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P+xLVyygUEuywLHNn2FQjMmK9p1ogI2wd7GQ8ztWUvu9ydfjDLslaDzSHEDBy50fSTCow/T5a9vwhsR7tlviesaDCbnWSONb+aZL4DYNxWGUB1o00ksDOhGtWQga8m2mfnkBWzvWR9Ty6G33ukQvUma7kzI2vnM3LSaHiUKF1W6DRxCU2PbXm6hRy7Rrff0JZhcIcGMZB2jJnaT1om8KyudHSa3MFu/NuS8FsJRC65h3+v+3uOaUNozyamTCOHjcOCTu/o/9Gx6caQcwYXF6R1HxUsbeoM6r81z0p6tobyjy6xJdKSqnnMe8kkQMd2uaGQnq9bpohuxS3J2lztzu+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=63YGOmquz7ZAWHNEIM7GujXQuMLS0zGhnG5zgXK4tpE=;
 b=xZJX/gVxYwFUgg86vAtbXQ4pXdDhjSXK36VXbLnXHopgzZT8N86BWo8OhmvBgiBTmE7H6GIQfS/+GYSdHJh+e3VdBuP5Os8lVJYfU8ddu3iY9jWy0z2HSSRPGseoSTtUwOxf6k/NsEeXJvVpJzgJVHfZGC4e1nB+Bfq/J/G0jOAilOKHYPHlgrMozA3Ll0r07nyk40nFdGQodcEz1ih/pT94NcC5cD5U3NQoZB4CT/RDFJyZBeWvXQvbG4gabzrY0ownRrLskVsQhBORSoq1N1ZGR3zXUxe9G/hTPfVaCqc8gIqkWkBe7TmCCVZiubDfHprggKuQ2E9pOqczbdNb4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63YGOmquz7ZAWHNEIM7GujXQuMLS0zGhnG5zgXK4tpE=;
 b=cRisoDdPsmWkyddrwmAbwJDk7bZuXf58ZhLwCbe1c0PkL1Pq7JiSODyfQrqR+ml2EjNDdI1UqazMB5VEXyvcuIe8wydlEQORRfxNhf3wE95atVrCbatVfMaOs1/eaoFRxpEL6ZO6vs2iVBzBSNjFGD1K+UUm3xfWmVXmJ0rgsnnFTJcPzpt1q2YSwHC2VsyGETnECePrEGAxmwDJMzWxslV1rNd+iAFpTEA8tFG9ATvewyoMA9sYx754S+iY4zoOTeMDEG9hO5pF7UV6SnYUmUhu1sVC9XRrtHDxbTlD32tokk7LeIjKEj4LejHfdi5lGHzXLxDRLO17bzDti7emow==
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 (2603:1096:400:3fb::13) by TY4PR01MB15030.jpnprd01.prod.outlook.com
 (2603:1096:405:23b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 07:58:09 +0000
Received: from TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342]) by TYWPR01MB11861.jpnprd01.prod.outlook.com
 ([fe80::e0dd:28e5:6a6e:2342%6]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 07:58:09 +0000
From: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 06/29] dnf: upgrade 4.23.0 -> 4.24.0
Thread-Topic: [OE-core] [PATCH 06/29] dnf: upgrade 4.23.0 -> 4.24.0
Thread-Index: AQHcTq6NcBhxTmuGzUWq4l07JLoXGrTnHFWAgAYH/pA=
Date: Tue, 11 Nov 2025 07:58:09 +0000
Message-ID: 
 <TYWPR01MB118613201C933BF42FC3B5C1EDCCFA@TYWPR01MB11861.jpnprd01.prod.outlook.com>
References: <20251105234712.446-1-wangmy@fujitsu.com>
 <20251105234712.446-6-wangmy@fujitsu.com>
 <DE2FVODBMUDF.2XW0SJDUUG1HA@bootlin.com>
In-Reply-To: <DE2FVODBMUDF.2XW0SJDUUG1HA@bootlin.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 =?utf-8?B?TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5Njgw?=
 =?utf-8?B?MmZfQWN0aW9uSWQ9MzI1ODJjNzMtMTY3MC00Njg5LWJmODctZTlkMzI5YmVm?=
 =?utf-8?B?MTA0O01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMz?=
 =?utf-8?B?OTY4MDJmX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF8xZTkyZWY3My0wYWQx?=
 =?utf-8?B?LTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfRW5hYmxlZD10cnVlO01TSVBfTGFi?=
 =?utf-8?B?ZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX01ldGhv?=
 =?utf-8?B?ZD1Qcml2aWxlZ2VkO01TSVBfTGFiZWxfMWU5MmVmNzMtMGFkMS00MGM1LWFk?=
 =?utf-8?B?NTUtNDZkZTMzOTY4MDJmX05hbWU9RlVKSVRTVS1QVUJMSUPigIs7TVNJUF9M?=
 =?utf-8?B?YWJlbF8xZTkyZWY3My0wYWQxLTQwYzUtYWQ1NS00NmRlMzM5NjgwMmZfU2V0?=
 =?utf-8?B?RGF0ZT0yMDI1LTExLTExVDA3OjU3OjQxWjtNU0lQX0xhYmVsXzFlOTJlZjcz?=
 =?utf-8?B?LTBhZDEtNDBjNS1hZDU1LTQ2ZGUzMzk2ODAyZl9TaXRlSWQ9YTE5ZjEyMWQt?=
 =?utf-8?B?ODFlMS00ODU4LWE5ZDgtNzM2ZTI2N2ZkNGM3O01TSVBfTGFiZWxfMWU5MmVm?=
 =?utf-8?B?NzMtMGFkMS00MGM1LWFkNTUtNDZkZTMzOTY4MDJmX1RhZz0xMCwgMCwgMSwg?=
 =?utf-8?Q?1;?=
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYWPR01MB11861:EE_|TY4PR01MB15030:EE_
x-ms-office365-filtering-correlation-id: 08472602-6afe-494d-3c27-08de20f80dfb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|366016|1800799024|376014|1580799027|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?YXIyL0FrY0FYYnN0R2tLNXRGaGlZSmlBMGVlMkJMeGE1QjhQKzR4MVVnbk1D?=
 =?utf-8?B?OHBqZDZPNXNZUFVWem9TbE02UjF3WThXdzlCb0g4NS9vY2p0MHVuaU4yVHRS?=
 =?utf-8?B?cUJFbjYyYmJzUGFKdjJoZVI4SnJtWFdGM3dXUDdpR09tbmdTUWlrVGxmdjBH?=
 =?utf-8?B?VitaeUxGeEpUWEZpUy81QVdXY1BWTGVuTEFBTXNVM1pqTkpFVXBOaFpVOXZa?=
 =?utf-8?B?c0NGQ2xOSGNDeFhhM3RYeFo5eCswdnZkcEY5UEV3Q2t3a3VDUzNIMGtpSHlu?=
 =?utf-8?B?K1RPbVNwSTE3TUVFQ244bHB3T1IrNTRBaVU0Q2YxOXhPRkR4Y0ZLL3NhNDU3?=
 =?utf-8?B?MndJSHRCSHIzbnRkeERlRHpTcmpKRitOK212UDF5bDZpOW5wQnoybURWN1U4?=
 =?utf-8?B?ZVhjOXlVeXcxN1Zqb1JEQStQUVhCS0VzWm8yc2NCajhXM3pBdHJzVk8xU0tt?=
 =?utf-8?B?Q0Ntd0dVUkhEK2NCQWtKOXVQaEM3endLNmF2Vm1Ub2VtcEROWDRkbC9YaHhr?=
 =?utf-8?B?N2RSU3VxNG1rTGYzRk5CblVHUk5zRGVpUXk4eTZkWjlVOTI1MTR3RkJmQTc1?=
 =?utf-8?B?dmpqdlYwTTF3MWFzR2xERDh3R3hpMjYvV1FkS3Q2RlQwSXRPT3ZpSTRTUjVn?=
 =?utf-8?B?UUNONmdQWHYvcEVhL2RIeDBGL3o5WU1qQ2ZyUXpvWDlXVG41UjJSV1hpZkxa?=
 =?utf-8?B?dThaNGFKVHV3YU8wY1Z3ay9IcWZic3R3U1AwdkhPUTRVeUEydVV4SGFHMVpV?=
 =?utf-8?B?R21GWjBIVXQycTF1TjZyc2pkMFB1Qno0dDVpNXRCNWhVSmx6M1FLVjNFMEZl?=
 =?utf-8?B?RDBUUEJIeUhPcmJ1dTFyVDN5dnlGYjdjU042RXM2bVoxMnIrQndsNGp3N1NZ?=
 =?utf-8?B?N3J5aWFWazdTZ1RlekdnVUFCMFc3YjczK3VuZ25zaS9ZemRsbFBaWFMyWUg0?=
 =?utf-8?B?b1BIVDNWNVR6clZiQnljK0wvM2ovaDRJVlFYOStpUkV6Mm5qK21SRzVyL25o?=
 =?utf-8?B?WnVZNjM0TlBSRWRFaEpMSDJlVzJWbU1oVTU4NnMzRjgyOWZkUVBUdC9zQjhR?=
 =?utf-8?B?c1lkNkVWMFZWUHV5RWR1MXE5U2krZ0RyRzZpQjJjZkRFMjA1bGtvek82MlFs?=
 =?utf-8?B?dVk0OElWclNpc1ZDNFh4elhNR29MeXgzTWtLbWtlK0YrMWdhdVhDL21wZ3ND?=
 =?utf-8?B?WVh1WW96cnNNZmN2KzF6UUI0Mk9sTFNOdGF0dUNMVlNqOGs0RTEyN2h2ZHVZ?=
 =?utf-8?B?SVZwaVlPUmZ5c09tNWc3SldFYmlKTmw3azRBdDBsSTkrbEZEWk9YRXFPOENK?=
 =?utf-8?B?Vkt1ZEVxRW9lYkVsQ2RrSFY4TlMzVmlFU2VJdUwxVGdBY1RHcUhrMXBKZHQy?=
 =?utf-8?B?Q2VxY29nK2M0blZzTStnSlJqV010UXpaREZxMElGM3BwYmF3WFY3VUhBMFdY?=
 =?utf-8?B?QjdWYlovZnkxeGJ3Vm04K3N5NG1lN3czckJuelBWUC9nMmZ6ZGVwYjhHVmhT?=
 =?utf-8?B?OWNVRGp3Y2dra3lVOWlRSnl6cUo4NFBiUXA1djcrU2Y4MEd4aVY1S3JKN0p5?=
 =?utf-8?B?bmpybHNhR0JwOENiOFkvMlo0QVZqQ1RUZlBDeTl3RmxXUnE0QzhWaE0rbmQ2?=
 =?utf-8?B?dm9lZEY1bW5sM3dmMFMwUEFiRW5iMTQvSkxYWGJ0MVk4d0szUWhxelRPa20y?=
 =?utf-8?B?TXRkZnpZRzlrQ1FFQllLcFE0QUx5U2NHSTArWjVvcFVxb0swcTJmMTVDNmJj?=
 =?utf-8?B?bXgwZy9NOGtEWjhMdHlMbmpoSkxlb05UMmQ3a2xUU3JrWjRSRXRDdGlCbnF0?=
 =?utf-8?B?MW1XamdWUGpaLzZGZkZFcm9OYWpKQ3hMNGtBQXdXcHBMcUd0dUZnd3ZtYkZG?=
 =?utf-8?B?OUlpaEdVQ016ZkpMK0tqaTN6d3ZFRHl0bGxibXFmVkdxVzlUTEJod25KSVlH?=
 =?utf-8?B?Q1VrRnF6OTRYRTdadnh5K0RhMnVSOG85MGZMY2ZWTHNYR3QzOXZRckIzK3h1?=
 =?utf-8?B?R0hTb3o1QmNRPT0=?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYWPR01MB11861.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(1580799027)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WVJ1QmVRMTF0aGVhckZjUlIvMzQ2VSt6THdUZG9ZalFlVDNQWjhIa0ZLd2tr?=
 =?utf-8?B?M0hDTzMvUUpMbDRDOHlKSWhMQ3lBZG5YQVkxRnhWRHJlTkVvRWpUUVJxRHg3?=
 =?utf-8?B?V3hpdjhTTTFBZjBuTEVWVFcrRHlvVVFVb3J1bUY1V1NNellkUytxdFJLeXNG?=
 =?utf-8?B?cXF5Zy9YYW1ocnNxVHJnWmZqbGN4eUh1aHlNVzd5VlpDQThWMnJPd0FFMkRr?=
 =?utf-8?B?U3dyQWdSSms2ZlZyWXlNYTJzVk9KQ3hudmFwcTgxWkNGL3Q1ajQwRExab052?=
 =?utf-8?B?akRnQ3NoTE5pYjFZVlczeG5iem1ud0FFc1YvSFZ1c0ZOUW9VMXNGNDQ2WVpa?=
 =?utf-8?B?U2QyTW9VSG1rN3dETi9hZUQzL2wrdDBHekZKMUVLdlFIQmc3bFIyY3U0YkJ6?=
 =?utf-8?B?RGNIUG5mL0FMb0x4NEUvMGRaMTA4VHhGR1Y1Qk94OU1Yc296SGd6Vkdwc1pi?=
 =?utf-8?B?SHRlcnFMYlVoaWJTOFFGL09YTXZYSG8xSE1DRHZiYXcvbWh2aHNxTzFwYWFC?=
 =?utf-8?B?dEVMaFFVczJFVUd2VVFnVU80UlBCNTg3SmtndCt6a3VhVUdqOTgraGJaZ0tz?=
 =?utf-8?B?c1J6U3pVYnJwTTdrSGNNS3RzZ0t6cThPeU02b3orVWE1NVRDREhML0kxOGx0?=
 =?utf-8?B?OUFrSGREVm5ROURseFc5WERaK3VTcFhaSDB5U3VIbkgwQnE0b2luckJGbUJM?=
 =?utf-8?B?ME5vMkJ1WVhSRDFUcUc5Z0xmU1BnZWdwTzJPdmEzclhxdkxRalhjYm1SWGZ2?=
 =?utf-8?B?eVpLOERoaWRBa1Y4M0VNTzcwTGhxVGlIR3ZCSmpwVG16Vk1odUtabWFJalVJ?=
 =?utf-8?B?a00vd2NFN09QZXhnYW03ZUhQS2lZSUpHUFY1UmxTdWlvQzl4U0VjbFdpQXdr?=
 =?utf-8?B?UXV6NVJySzN2cjlwYnpxQ1o5YTVyMEpkbkJLVDB0R3lCdXBNU1RuM1o5OWtt?=
 =?utf-8?B?Q0dFUURTNkZHL29oeHM5S0U4cEJEUXN2YVBZWXUwTVRzc0xkbWprT3hlSUFT?=
 =?utf-8?B?NjErdUQ3K1JLOTY3MitiRnlIZ3RCSnlOTy96NzVNZk5KN0M2aldpSndKdng2?=
 =?utf-8?B?M3lpWGpZeDk3SjdVMEwvRmExMTZXclNseEFKb3ZSejlHeGdSdkoyaVVxV2R4?=
 =?utf-8?B?a3dLNWdZRThDODFjWjI0eDhqNWNUTHpBZ1diRWNuQ25uSVhtMnIyOE9peUk4?=
 =?utf-8?B?aW5EcVpSUGdIbjNwcVRWNDBZT0Z5eWd5ZmpTYWZwU3lqUnVESGJkVms1djRR?=
 =?utf-8?B?MngvWlIrNUtxS3grR0YzT0lidUFaUHJmZDQ3Z0Zsc3UxYW9lZUtvYXRORVRo?=
 =?utf-8?B?MXdMQ21vV3VIc2ZoNmFHekNiUjJpTXBtZlFqY24xdFVzZ2pXdnZRSHlJcGhk?=
 =?utf-8?B?ZncvQ2xpNnZxZXlMbEUrQ2dUS2dVMkEwUTBEUkFPbUVQY0grajNjenhzbS93?=
 =?utf-8?B?cE04VFpoemFremZhcDgvdXVLY01NRXVJTFF0NDh2WW9KNk1MaHBJTVhURnA0?=
 =?utf-8?B?ZDhkT0tkZVJqQSsrdmVCSE1KWkdyTkxwQWlvN3R3UlQrTVAvcVZkRnJBUUZ2?=
 =?utf-8?B?ZDZjSlRUdDNFZXAwT3hlUEd5Wm5WM1I1Y0UxSGtCL0dGTzlNWVZqd0N2dVM1?=
 =?utf-8?B?ak9LNXN6Um9Qd0RsVzQyTzhIcXl6VkZhb21UaitOcHg4VTF0VDFySFVvUkJj?=
 =?utf-8?B?eHNmRzVQMmN5d3laYlAxRzlUZEc5V1ZLL203Szl2OGFHTld2U24yd0Exb01W?=
 =?utf-8?B?VnMzSGVlY25rOWUwSFBJVEhZZTFXQ1lSS1dGMUR2bVpuM25WT2VtQ1pobE81?=
 =?utf-8?B?T1A5MXNIOU5ocmRXM1VGOXBIbmlmUUJFbnNxdlI2S2w4QmZEK1F3U3lpaXVZ?=
 =?utf-8?B?OTNCNWEvdlVMemhKZ3lVRzZEZlZzcTVQZzNRQjJPdmlqdFNvTC9UeTJqd04w?=
 =?utf-8?B?WlJDSm5VQ2cwcnZ2MXFKQjJydE1TRlJDMk9aTlRpSDNHbHhIWlNMSjZmOWhU?=
 =?utf-8?B?emc1cjJZY0FmRFp2Y2g4TEJJRzEzcjRQTTRUNCtaNGJOaE1odVNqR1BJdEVq?=
 =?utf-8?B?b3FmNENuTldNTkovVWFWcnlWSWYyMndJV2d6bDk4N0VXWTRsRzU3WXFITHpL?=
 =?utf-8?Q?Oc6oOykNg3v03zg/n/FpcQvml?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYWPR01MB11861.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08472602-6afe-494d-3c27-08de20f80dfb
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 07:58:09.1461
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tQa69LydQ1RSxeHnZsLvMLBNm1+JgnZ5Z9/ZoK2r8YY4pR9Alz1ievP5F2GVLjWTkUXqOm3r7rjWEJLiQT83Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Nov 2025 07:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226150

SSBoYXZlIHN1bW1pdGVkIGFub3RoZXIgcGF0Y2ggb2YgbGliZG5mIHRvIHNvbHZlIHRoaXMgcHJv
YmxlbS4NCg0KICAtLQ0KQmVzdCBSZWdhcmRzDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCldhbmcgTWluZ3l1DQpGVUpJVFNVIE5BTkpJTkcgU09G
VFdBUkUgVEVDSE5PTE9HWSBDTy4sIExURC4gKEZOU1QpDQpOby42IFdlbnpodSBSb2FkLCBOYW5q
aW5nLCAyMTAwMTIsIENoaW5hDQpURUzvvJorODYrMjUtODY2MzA1NjYtLTg1NjgNCkNPSU5TOiA3
OTk4ODU0OA0KRkFYOiArODYrMjUtODMzMTc2ODUNCk1BSUw6IHdhbmdteUBmdWppdHN1LmNvbQ0K
DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1hdGhpZXUgRHVib2lzLUJy
aWFuZCA8bWF0aGlldS5kdWJvaXMtYnJpYW5kQGJvb3RsaW4uY29tPg0KPiBTZW50OiBGcmlkYXks
IE5vdmVtYmVyIDcsIDIwMjUgNzo1MSBQTQ0KPiBUbzogV2FuZywgTWluZ3l1L+eOiyDpuKPnkZwg
PHdhbmdteUBmdWppdHN1LmNvbT47DQo+IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggMDYvMjldIGRuZjogdXBn
cmFkZSA0LjIzLjAgLT4gNC4yNC4wDQo+IA0KPiBPbiBUaHUgTm92IDYsIDIwMjUgYXQgMTI6NDYg
QU0gQ0VULCB3YW5nbXkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gd3JvdGU6DQo+ID4g
RnJvbTogV2FuZyBNaW5neXUgPHdhbmdteUBmdWppdHN1LmNvbT4NCj4gPg0KPiA+IDAwMDEtRG8t
bm90LWhhcmRjb2RlLWV0Yy1hbmQtc3lzdGVtZC11bml0LWRpcmVjdG9yaWVzLnBhdGNoDQo+ID4g
cmVmcmVzaGVkIGZvciA0LjI0LjANCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFdhbmcgTWluZ3l1
IDx3YW5nbXlAZnVqaXRzdS5jb20+DQo+ID4gLS0tDQo+IA0KPiBIaSBXYW5nLA0KPiANCj4gVGhh
bmtzIGZvciB0aGUgdXBkYXRlLg0KPiANCj4gSXQgbG9vayBsaWtlcyB0aGlzIGlzIGJyZWFraW5n
IGRuZiB3aGlsZSBnZW5lcmF0aW5nIGltYWdlczoNCj4gDQo+IEVSUk9SOiBjb3JlLWltYWdlLW1p
bmltYWwtMS4wLXIwIGRvX3Jvb3RmczogQ291bGQgbm90IGludm9rZSBkbmYuIENvbW1hbmQNCj4g
Jy9zcnYvcG9reWJ1aWxkL3lvY3RvLXdvcmtlci9nZW5lcmljeDg2LTY0L2J1aWxkL2J1aWxkL3Rt
cC93b3JrL2dlbmVyaWN4ODZfDQo+IDY0LXBva3ktbGludXgvY29yZS1pbWFnZS1taW5pbWFsLzEu
MC9yZWNpcGUtc3lzcm9vdC1uYXRpdmUvdXNyL2Jpbi9kbmYgLXYNCj4gLS1ycG12ZXJib3NpdHk9
aW5mbyAteSAtYw0KPiAvc3J2L3Bva3lidWlsZC95b2N0by13b3JrZXIvZ2VuZXJpY3g4Ni02NC9i
dWlsZC9idWlsZC90bXAvd29yay9nZW5lcmljeDg2XzYNCj4gNC1wb2t5LWxpbnV4L2NvcmUtaW1h
Z2UtbWluaW1hbC8xLjAvcm9vdGZzL2V0Yy9kbmYvZG5mLmNvbmYNCj4gLS1zZXRvcHQ9cmVwb3Nk
aXI9L3Nydi9wb2t5YnVpbGQveW9jdG8td29ya2VyL2dlbmVyaWN4ODYtNjQvYnVpbGQvYnVpbGQv
dG1wLw0KPiB3b3JrL2dlbmVyaWN4ODZfNjQtcG9reS1saW51eC9jb3JlLWltYWdlLW1pbmltYWwv
MS4wL3Jvb3Rmcy9ldGMveXVtLnJlcG9zLg0KPiBkDQo+IC0taW5zdGFsbHJvb3Q9L3Nydi9wb2t5
YnVpbGQveW9jdG8td29ya2VyL2dlbmVyaWN4ODYtNjQvYnVpbGQvYnVpbGQvdG1wL3dvcmsvDQo+
IGdlbmVyaWN4ODZfNjQtcG9reS1saW51eC9jb3JlLWltYWdlLW1pbmltYWwvMS4wL3Jvb3Rmcw0K
PiAtLXNldG9wdD1sb2dkaXI9L3Nydi9wb2t5YnVpbGQveW9jdG8td29ya2VyL2dlbmVyaWN4ODYt
NjQvYnVpbGQvYnVpbGQvdG1wL3dvDQo+IHJrL2dlbmVyaWN4ODZfNjQtcG9reS1saW51eC9jb3Jl
LWltYWdlLW1pbmltYWwvMS4wL3RlbXANCj4gLS1yZXBvZnJvbXBhdGg9b2UtcmVwbywvc3J2L3Bv
a3lidWlsZC95b2N0by13b3JrZXIvZ2VuZXJpY3g4Ni02NC9idWlsZC9idWlsZA0KPiAvdG1wL3dv
cmsvZ2VuZXJpY3g4Nl82NC1wb2t5LWxpbnV4L2NvcmUtaW1hZ2UtbWluaW1hbC8xLjAvb2Utcm9v
dGZzLXJlcG8NCj4gbWFrZWNhY2hlIC0tcmVmcmVzaCcgcmV0dXJuZWQgMToNCj4gVHJhY2ViYWNr
IChtb3N0IHJlY2VudCBjYWxsIGxhc3QpOg0KPiAgIEZpbGUNCj4gIi9zcnYvcG9reWJ1aWxkL3lv
Y3RvLXdvcmtlci9nZW5lcmljeDg2LTY0L2J1aWxkL2J1aWxkL3RtcC93b3JrL2dlbmVyaWN4ODZf
DQo+IDY0LXBva3ktbGludXgvY29yZS1pbWFnZS1taW5pbWFsLzEuMC9yZWNpcGUtc3lzcm9vdC1u
YXRpdmUvdXNyL2Jpbi9kbmYucmVhbCIsDQo+IGxpbmUgNTYsIGluIDxtb2R1bGU+DQo+ICAgICBm
cm9tIGRuZi5jbGkgaW1wb3J0IG1haW4NCj4gICBGaWxlDQo+ICIvc3J2L3Bva3lidWlsZC95b2N0
by13b3JrZXIvZ2VuZXJpY3g4Ni02NC9idWlsZC9idWlsZC90bXAvd29yay9nZW5lcmljeDg2Xw0K
PiA2NC1wb2t5LWxpbnV4L2NvcmUtaW1hZ2UtbWluaW1hbC8xLjAvcmVjaXBlLXN5c3Jvb3QtbmF0
aXZlL3Vzci9saWIvcHl0aG9uMy4xMw0KPiAvc2l0ZS1wYWNrYWdlcy9kbmYvX19pbml0X18ucHki
LCBsaW5lIDMwLCBpbiA8bW9kdWxlPg0KPiAgICAgaW1wb3J0IGRuZi5iYXNlDQo+ICAgRmlsZQ0K
PiAiL3Nydi9wb2t5YnVpbGQveW9jdG8td29ya2VyL2dlbmVyaWN4ODYtNjQvYnVpbGQvYnVpbGQv
dG1wL3dvcmsvZ2VuZXJpY3g4Nl8NCj4gNjQtcG9reS1saW51eC9jb3JlLWltYWdlLW1pbmltYWwv
MS4wL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvbGliL3B5dGhvbjMuMTMNCj4gL3NpdGUtcGFj
a2FnZXMvZG5mL2Jhc2UucHkiLCBsaW5lIDM1LCBpbiA8bW9kdWxlPg0KPiAgICAgZnJvbSBkbmYu
ZGIuaGlzdG9yeSBpbXBvcnQgU3dkYkludGVyZmFjZQ0KPiAgIEZpbGUNCj4gIi9zcnYvcG9reWJ1
aWxkL3lvY3RvLXdvcmtlci9nZW5lcmljeDg2LTY0L2J1aWxkL2J1aWxkL3RtcC93b3JrL2dlbmVy
aWN4ODZfDQo+IDY0LXBva3ktbGludXgvY29yZS1pbWFnZS1taW5pbWFsLzEuMC9yZWNpcGUtc3lz
cm9vdC1uYXRpdmUvdXNyL2xpYi9weXRob24zLjEzDQo+IC9zaXRlLXBhY2thZ2VzL2RuZi9kYi9o
aXN0b3J5LnB5IiwgbGluZSAyODcsIGluIDxtb2R1bGU+DQo+ICAgICBjbGFzcyBTd2RiSW50ZXJm
YWNlKG9iamVjdCk6DQo+ICAgICAuLi48MjQzIGxpbmVzPi4uLg0KPiAgICAgICAgICAgICByZXR1
cm4gcmVzdWx0DQo+ICAgRmlsZQ0KPiAiL3Nydi9wb2t5YnVpbGQveW9jdG8td29ya2VyL2dlbmVy
aWN4ODYtNjQvYnVpbGQvYnVpbGQvdG1wL3dvcmsvZ2VuZXJpY3g4Nl8NCj4gNjQtcG9reS1saW51
eC9jb3JlLWltYWdlLW1pbmltYWwvMS4wL3JlY2lwZS1zeXNyb290LW5hdGl2ZS91c3IvbGliL3B5
dGhvbjMuMTMNCj4gL3NpdGUtcGFja2FnZXMvZG5mL2RiL2hpc3RvcnkucHkiLCBsaW5lIDQzMCwg
aW4gU3dkYkludGVyZmFjZQ0KPiAgICAgcGVyc2lzdGVuY2U9bGliZG5mLnRyYW5zYWN0aW9uLlRy
YW5zYWN0aW9uUGVyc2lzdGVuY2VfVU5LTk9XTik6DQo+IA0KPiBeXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eDQo+IEF0dHJpYnV0ZUVycm9yOiBtb2R1bGUg
J2xpYmRuZi50cmFuc2FjdGlvbicgaGFzIG5vIGF0dHJpYnV0ZQ0KPiAnVHJhbnNhY3Rpb25QZXJz
aXN0ZW5jZV9VTktOT1dOJy4gRGlkIHlvdSBtZWFuOg0KPiAnVHJhbnNhY3Rpb25JdGVtU3RhdGVf
VU5LTk9XTic/DQo+IA0KPiANCj4gaHR0cHM6Ly9hdXRvYnVpbGRlci55b2N0b3Byb2plY3Qub3Jn
L3ZhbGt5cmllLyMvYnVpbGRlcnMvNC9idWlsZHMvMjY5OQ0KPiBodHRwczovL2F1dG9idWlsZGVy
LnlvY3RvcHJvamVjdC5vcmcvdmFsa3lyaWUvIy9idWlsZGVycy8zL2J1aWxkcy8yNzQ1DQo+IA0K
PiBDYW4geW91IGhhdmUgYSBsb29rIGF0IHRoaXMgZXJyb3I/DQo+IA0KPiBUaGFua3MsDQo+IE1h
dGhpZXUNCj4gDQo+IC0tDQo+IE1hdGhpZXUgRHVib2lzLUJyaWFuZCwgQm9vdGxpbg0KPiBFbWJl
ZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nDQo+IGh0dHBzOi8vYm9vdGxpbi5jb20N
Cg0K

