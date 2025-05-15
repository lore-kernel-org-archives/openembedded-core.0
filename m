Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE90C2D0CD
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 14:04:44 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.77])
 by mx.groups.io with SMTP id smtpd.web10.13652.1747317881881890077
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 07:04:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ericsson.com header.s=selector1 header.b=biQRAH/s;
 spf=pass (domain: ericsson.com, ip: 40.107.20.77, mailfrom: daniel.turull@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cvju+icHg6wDwbEVCFASdk4TKZrQNLPF8oNMCy6XJz+B2uMSaIpo288lqLOhN+vbweOYULuqwBbmRlThr8AAHAbD8RkKdOavIqX3ktBwyA3OtrYmD3A6SZrcCImJJ7MA+keSWGAjkINO3qVWcSUGca6AXIY7/e1bhCGnlcmM0wkUhyuS83nM1ff5dh/avQEWMIIDgJceainMgU3AV0H/S20Mxww675RsZ353RQgE4vydBFw+Sf3g1KIt+By0nV5iK4NNGDd/e9KvdYse5QoiORu+PUk6qfunZYclq2MBU5eEXN4CfHjDvIyG32klQ1BBFw77iUZ42n/1uOBFQ/enmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YsaDTtLtfAbXJYBQg0pkaWqvjcAtkPEIP1CkMhl8iEA=;
 b=VJ5cXrk8c74v7VPlKrKthB+9MqXnI0XYAT4oS2TnptMYEfVJN96e+07EQZlqBniFS28CbPkurjzE6FZREWwiCSNBR2FqLrPnJj9bQi3y+BuRJzQ+5mrbs4W3922SPpm1mH8JCnHAkk6EmiCKViGqGHwKlAozvssXP6KPnmTv6ZxR0khDVp/dL5oJ/d/7j8/vChwyTRu5r4kmwSQtTZ/o0udQcJCdZT0czEGtqWEFBxrHteVssZrTF+CRlc1jIuIgotexU/GB+ukxYQyTDKDz8clfqapJgkrGOYHU4p849n+3B6oPuyLqBPYk2ezdkUrENslzeay5dMUHo9mn+P10OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ericsson.com; dmarc=pass action=none header.from=ericsson.com;
 dkim=pass header.d=ericsson.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsaDTtLtfAbXJYBQg0pkaWqvjcAtkPEIP1CkMhl8iEA=;
 b=biQRAH/sUaH77CBfNrcOHnNRnzgndghNLnDtFKyjZ7zBfxX+51BOjW+v4+TYtS30nDNOJzdFCP1QYkZ8875zPy0luc0y6bFnQcu35YfzSM/rEJApM2Zck19b0EuN8QkOLuiVOWbbh5h0cP/mDjeUH964uU5kvUG6c+/YbbnyE+yJwgbTI/MTBH69mlu0a0fn5oGPET2bsHThvwwJFyr5PY/o0GIEfrHVcEbm+MEM+/FXknmfRNPrxbCsGiuafAEIdBaIaqazQyj48TjFKhHcCSak4hF8rVEuT3bHioUMxqrbgvtesHiZEfVzSZOQ5KybLJxabAHOeLNkVRjRXxotuw==
Received: from PR3PR07MB6666.eurprd07.prod.outlook.com (2603:10a6:102:61::16)
 by DBAPR07MB6856.eurprd07.prod.outlook.com (2603:10a6:10:19c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Thu, 15 May
 2025 14:04:35 +0000
Received: from PR3PR07MB6666.eurprd07.prod.outlook.com
 ([fe80::548a:adf1:280d:283b]) by PR3PR07MB6666.eurprd07.prod.outlook.com
 ([fe80::548a:adf1:280d:283b%7]) with mapi id 15.20.8722.027; Thu, 15 May 2025
 14:04:35 +0000
From: Daniel Turull <daniel.turull@ericsson.com>
To: Quentin Schulz <quentin.schulz@cherry.de>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Joshua Watt <JPEWhacker@gmail.com>, Peter Marko <peter.marko@siemens.com>
Subject: RE: [OE-core] [PATCH v4 1/3] spdx: add option to include only
 compiled sources
Thread-Topic: [OE-core] [PATCH v4 1/3] spdx: add option to include only
 compiled sources
Thread-Index: 
 AQHbxNVCY7B1PC0uk0ynF6zYbWHdwbPTmyoAgAANXoCAAAmFgIAAANNQgAAGdoCAAABcUA==
Date: Thu, 15 May 2025 14:04:35 +0000
Message-ID: 
 <PR3PR07MB6666ABBCB2107DF94EF52E248A90A@PR3PR07MB6666.eurprd07.prod.outlook.com>
References: <20250514125706.495571-1-daniel.turull@ericsson.com>
 <20250514125706.495571-2-daniel.turull@ericsson.com>
 <07ef3a4c-265a-40d2-939b-d3843662df38@cherry.de>
 <PR3PR07MB666678F2C4E5BA67075D490D8A90A@PR3PR07MB6666.eurprd07.prod.outlook.com>
 <50889349-4a1c-4978-a4e2-b7bf1964b881@cherry.de>
 <PR3PR07MB66662659710253B1ED4F50E08A90A@PR3PR07MB6666.eurprd07.prod.outlook.com>
 <11ac48b4-6831-4cf6-a071-9567fbfff2e6@cherry.de>
In-Reply-To: <11ac48b4-6831-4cf6-a071-9567fbfff2e6@cherry.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ericsson.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PR3PR07MB6666:EE_|DBAPR07MB6856:EE_
x-ms-office365-filtering-correlation-id: 084c444d-1fc4-4ac4-9e8b-08dd93b96c43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: 
 =?utf-8?B?NHB5U3JoUExRN3VFZXRKcnVCNC83WVR1MUhjbjUrOFFwK1VqSHFvc2l1VXox?=
 =?utf-8?B?Z2VvdWdha2grUWp0SUVXdHJ5dnd2QWZPckY5SFpldjV2T3F1UlhPdnBGRXo0?=
 =?utf-8?B?TzJ2aStFajk1aFBhMkpXZ2pwQWQ2SE05MTV6ZTA4UU0wajBEeFJyZGRvQzVj?=
 =?utf-8?B?c2p6VUQzWUQ0V0VMekhGZjZyMU1OUlhuOXk1VlhHT1FEV2gra2xPYXptODQ0?=
 =?utf-8?B?b0xhdnZmUjVWcUN5TFlGci9HN3VPbTlTNXI5M0pISVpSVFhwVGkyc3RIVlIr?=
 =?utf-8?B?M2hqSFMvL2dTaGZBelI3YVBHRlRhSGppSiszTkdTZ3ErWWhrVTRPNHplS1Av?=
 =?utf-8?B?S3QrRDZrOWhjOUFwd282eG9wZ2dNS3dVV2J6Ti9GcFFDbVZyYzYwVTVHZnpi?=
 =?utf-8?B?WUwwbUtmc2NCTXo1eGhCTTVRSXdrVVdGcE51WmZ4bE05MGhwQnlUcldadXJx?=
 =?utf-8?B?RzZ4eUJaSVAwNFZMQjhhVXJXSFhJRTJUbEsrUktYVWkzTzhoWUdxdHV2Smd0?=
 =?utf-8?B?ZU9ubSt0M0VPYXJoSkFMZVBjdldFZG5XeVdGOHkyejFFN3YxZG5SZHNPbUpE?=
 =?utf-8?B?SXpDZGJBZzRmbkpIZmhIbVVjOXdYRlZsOGVjQytPNHJ3Tk5RZnF4YzNwa0dx?=
 =?utf-8?B?S09mYmEzNE03VXVId01tWUpiSTUwTmxjTmxqeldVUUdaZTV1alh2Q1pYNXA3?=
 =?utf-8?B?S3RBMnF4U21Cdzd5MTlmK3ZVQ0N5ay9aMng4bUZPby9BeUlEM2lLUE5yd1Zk?=
 =?utf-8?B?MXRkMTgvUXMvWWlZMXdGUXZVdU10bHFDdEFnbkpWTm5WT3VJUCsvclNudGdu?=
 =?utf-8?B?byt1Q3AwdC8vMEJQMUZ0WCtWZFhuNXh1K0Q3WlBIaWF2S0lINDRHSk55bUpa?=
 =?utf-8?B?YjVpeWg1S21tQk5OUlpJNkhGQlVOTFVrS2hTUGJjbFRNRDBGRFcwcW4ycURm?=
 =?utf-8?B?cEsyOTBUeDdJaEZoT3VpODhFbU0raTdxb0dKanpYZCtNaFlsMnJVSHBsYS9p?=
 =?utf-8?B?L2syTXB6WUxYWTRxSk1GZzk2VlJINFhGbS9qQXgxTVpVUmlSKzRMektTejR4?=
 =?utf-8?B?MXRHSmljWXdxTFl3ZzBTMDBxS2FuTXhEbHVFaWh2VWZ1M1FkMHJtM1dpbk4r?=
 =?utf-8?B?K3l5cU4vbTA2UGJjWVRKcFhiVVFLMncxc1YzcXhUaWVJV0JybHZXT0F2cHcr?=
 =?utf-8?B?S054Z2FIMkdtU3lwc0ZCZVNHem4rR2dObVJiL3VjOVBQMHBwK1hEdWNaQUt4?=
 =?utf-8?B?SFhnaWtNaElvNTFzb0RoN1BCaFVpSWkxL1NMWUlJcU5MVTdSMW4ycmJsWXda?=
 =?utf-8?B?dlBXbnlNRTA2dk84dXo2Y2czLzdDNjZEVytWSWZ2YWVnOVRkZVJDNkl1OGVY?=
 =?utf-8?B?TFA4ZEtDT1VPaXFsak1EdlZ2UzlFWlNDbWVDekxuNE5LSzZHZU0xTjMwbkJH?=
 =?utf-8?B?ZXNOamlJSTh2bFRWUm5PMHVEblh4N3RCQisydEh1WUc4MDU2bENWNVRMc215?=
 =?utf-8?B?TmxEZnpaVHk2dFJ5cDkrSW1xVHl3Um9DNjltVVFzbnRya3RnM3VYZVVFK3E0?=
 =?utf-8?B?Vm9qTE5CQ0lLV3NSS1FNdnhIc0kvR3haL3puOG5zZmQ0ZlZnYTJWQUNDZThr?=
 =?utf-8?B?ZmVjaDFMQ1hlUHczdWdLbnE1VHM0UjRML0hkTVZVNXI1OGRGVitiZ1Mzcys4?=
 =?utf-8?B?S0RLcUNmYldBYlhzbE1qbmhySTJ5ZURBZzFCbEI1VzZwTEtrVktFQ2RGejFY?=
 =?utf-8?B?eVBHMjM2TWVGTU5LUU5NMis3bGJwMWJIN0RsN1BEUG4vWjhHbXQwNFUvNVhT?=
 =?utf-8?B?Qml5c1QyVmFML0xXVlA0QzZ6VGJBWDBaTTQ4WlhlZnBiY3BhRHU3d1dncDkv?=
 =?utf-8?B?cG9yVmpaTk9VT1BzWFc4UnJoKzd5M2dLVjg0MWFhVTdiZUtiNU5JY01wV045?=
 =?utf-8?B?UG9kNEdya1lhOXZBS092empSeVJBODd5d3l2bTljY2NZdjR2bEF1bHJqdTho?=
 =?utf-8?Q?bQSXJzcW5L1F6x/v6la7PelVyL7Gm0=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR07MB6666.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?WXNWMnZkNXFnU1Z3OVlZRFZwR1h1L1h4S0wvcGlkd1k3WklvTzFOZ2pCZ3NU?=
 =?utf-8?B?TVljRUVDWUNFMzZIN2xJZVZqa2s4S1UzWGtCWWZUMDExbC9HTmx0YUlyT2Vk?=
 =?utf-8?B?RjNPTzF0Szh0QWRxQVhVZ0xnNjBoRWY1ejNRR25GUllQb0NERXNJL20wVTdY?=
 =?utf-8?B?ckRNWHJiK1VDYW5TOGN1R1JLamNkaVRkQ1FOQmE4RG5wQzVTVWtNK2tJdkRM?=
 =?utf-8?B?VFhlOC90N3h6dmxVWUgyckdlVmNEYlFXZkVtdjZVeE80K0IwdEMyUlR5UHJn?=
 =?utf-8?B?ekJrRnVEd0J5VkJpWTcrUzg2V0dVdm9kL1AzWlNKVmt4UnRwODV3dXEzQnR4?=
 =?utf-8?B?eUVXUGVaRTZheVVaOFRMcWxGUTVsQ3k5YXZtSVZ0MDVVTEpSRmIyNFNIQjlG?=
 =?utf-8?B?bkVkYnY3UUsrNTNtZ0xuM3RKeUNMdlFmN3pNTXB3UXlYUFNZRENqTXhVelJu?=
 =?utf-8?B?d2tjTDNOSGFlWFZEZVN2YUQzb3JMSERSQ2V3ak1LTTRlNngwUC9IbUxPQ2k3?=
 =?utf-8?B?L005c2FvN0FNMGFzQW04TEYyeklPa3phQ2ZsRjNZcUh4cmx1dnozNzY2azBh?=
 =?utf-8?B?MnhobmVpUjc2S3dzKzhOMndEVWY5Ukp0ZDFjK0JYSFRYei9rd0tINkZMQVFv?=
 =?utf-8?B?TDQ5SE52S0xXSWNOV3lTekNVZ2QwVnZLd0I3dlZvai9WVkFTdlpnUzkrWHhQ?=
 =?utf-8?B?d2tHV1Bkam9GT1lqT1lhT1c0T2lsVFJJWCtuTEhucW1GRmowR3Z4bE9TcVE4?=
 =?utf-8?B?OWFYL2NvNTM3RGxVWEdWbVRZeTVkNzZEejhpVGRaVFNINzJQRzBTNG5ORGp4?=
 =?utf-8?B?RTU1aGhqYkZ0Mm9rd2NUcGJweDJMS3VHT01Eb2VKRy9XNkJaK0VQbitXK09J?=
 =?utf-8?B?eDhoaHQzNXJKblYzN1hDZll0VzVQcjVram5VZGdrMlhESDRrYVF3MHpROWtF?=
 =?utf-8?B?NmNxZExxak9Mc1BaaFNPQjhMZU1wVUZMdWdDSDVndE1LVU1FN2dWRVplZERN?=
 =?utf-8?B?SnlyQ2FRWHM3WDdjZ2hYcnhrMHJlS0JEWnBXZS9nYmdHd3I3SlJzSURKdDRh?=
 =?utf-8?B?aU12dmR1dVlsTThXc0pXVHRFd3lzd1ZnbFN0OGRlYmZ6bngxaldjd0ZaWTJy?=
 =?utf-8?B?cU92N3M3WFY5WXJaZ0xVUlJWUWxOVW9GZXhWaDZBSHowTnRkcHNZSDZTT0JF?=
 =?utf-8?B?SlJCQ0dRYW0xZEFQVXUwMUZwWTdtRWUxbDVUaGZjNDkzL1ZCMGRCN2ZlSFNV?=
 =?utf-8?B?cDI2azlwdzA5NUV6M1UxTmN4dFJ4Qkp1VkJlM0hiWXRIeFNKaFh4M3JiZjFQ?=
 =?utf-8?B?R1ZvRFNUdXlGTHoxM3Iya0tyYU1iOGVtQ2NZQVZuK3BsWVZsMnJyalpNRkk1?=
 =?utf-8?B?N25TU2lwY2hHSzVjemFuWUp0bjRQZXR2R0F3YWFmSXJiblcwQ1I0VmJUMTZi?=
 =?utf-8?B?QUdzRTFEaE5mR2FnVU5tMnI2S3NFL2RPbXhMZGEwSFBNd0orK05TZXAvVXVJ?=
 =?utf-8?B?RFhSY3liTjREbkhHbDV2VWhiaFh6R3VxSnpWMkZBR0FGVHU4VWN6OGRzLzh0?=
 =?utf-8?B?dEl6Q2xGOWNlbWJVaVRJYnQ5VHEyVEZXK1ErOEYvRjA0Qis1c2ZTR2tTRjRH?=
 =?utf-8?B?elU0dmFpSUJVcGsxQStkMTNIRG42L0diWVpYeVRrNFB2dFUzV2dUTTVCYmgy?=
 =?utf-8?B?VjRsUkdqdFVONEpoc013ODBvT2RJa1JmbUNDQVpma05ZYTlYNFJtVUFVRXAx?=
 =?utf-8?B?NndITFNFcndnZ0VvKzBONTdaVEhEQjU5L1lPelg5bHBYTFJ1V0VOekZvdzY5?=
 =?utf-8?B?ZzVmTndSTThKeFRkc1RSNU9NYTN2ZmF1UVhUS0hTOHMrVXpkSG5JOUJXR1Zs?=
 =?utf-8?B?ekZobE12dlIxY21IdmJMazlTcG44dERjWUdsc2RadkNSaHRWMTBiN1gwRGlv?=
 =?utf-8?B?SWZKb2VoVUlQa3o5UnJZNG8yR0YzcGtQcUljY0hNNWdacXl0UTI1cnA0RUs2?=
 =?utf-8?B?dDQ1eC9kcnduNXA3QUtNNzdjd0N3dDRmMWU4c1RXbUJoRzdKcElOVEJWcHJG?=
 =?utf-8?B?M2thd3AzenJZSEUwN2I4V2RhME5peFFYZHZsVEQvOXh2azZEV2xoRitvei9v?=
 =?utf-8?Q?/G4Ean389804UMs9hmUlwKm2C?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PR3PR07MB6666.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 084c444d-1fc4-4ac4-9e8b-08dd93b96c43
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2025 14:04:35.0812
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cG08Qqwu9N2KJnBaPrcENkBCRG5QyyMYalFH8PeNiik3ran9FvI9h0EPrBjAJfCPLTJOkBGnAhQuu1irBkbqUXq0wWKYn6AyWFEdr7fckBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR07MB6856
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 14:04:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216684

SGksDQpJJ2xsIGNsYXJpZnkgdGhlIGNvbW1lbnQsIGNsZWFybHkgaXQgd2FzIG5vdCBnb29kIGVu
b3VnaC4NCg0KSSBoYWQgdG8gaW5jbHVkZSB0aGUgLm1vZC5jIHNpbmNlIHRoZSBrZXJuZWwgaW5j
bHVkZWQgc29tZSAubW9kLmMgZmlsZSB0aGF0IHdlcmUgZmlsdGVyIG91dCB3aXRoIG9ubHkgbG9v
a2luZyBmb3IgLmMgZmlsZXMuDQpJIHByb2JhYmx5IG5lZWQgdG8gdXNlIGFub3RoZXIgZnVuY3Rp
b24gb3IgdXNlIGFub3RoZXIgc2VhcmNoIGxvb2tpbmcgYXQgdGhlIHdob2xlIGZpbGVuYW1lIGFu
ZCB0YWtpbmcgdGhlIGV4dGVuc2lvbiBmcm9tIHRoZSBmaXJzdCAiLiINCg0KVGhhbmtzDQpEYW5p
ZWwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBRdWVudGluIFNjaHVs
eiA8cXVlbnRpbi5zY2h1bHpAY2hlcnJ5LmRlPg0KPiBTZW50OiBUaHVyc2RheSwgMTUgTWF5IDIw
MjUgMTU6NTkNCj4gVG86IERhbmllbCBUdXJ1bGwgPGRhbmllbC50dXJ1bGxAZXJpY3Nzb24uY29t
Pjsgb3BlbmVtYmVkZGVkLQ0KPiBjb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gQ2M6IEpv
c2h1YSBXYXR0IDxKUEVXaGFja2VyQGdtYWlsLmNvbT47IFBldGVyIE1hcmtvDQo+IDxwZXRlci5t
YXJrb0BzaWVtZW5zLmNvbT4NCj4gU3ViamVjdDogUmU6IFtPRS1jb3JlXSBbUEFUQ0ggdjQgMS8z
XSBzcGR4OiBhZGQgb3B0aW9uIHRvIGluY2x1ZGUgb25seSBjb21waWxlZA0KPiBzb3VyY2VzDQo+
IA0KPiBIaSBEYW5pZWwsDQo+IA0KPiBPbiA1LzE1LzI1IDM6NDQgUE0sIERhbmllbCBUdXJ1bGwg
d3JvdGU6DQo+ID4gSGkgUXVlbnRpbiwNCj4gPiBUaGFua3MuIEknbGwgZGlnIGEgYml0IG1vcmUg
Zm9yIHRoZSBoZWFkZXIgZmlsZXMgaWYgSSBjYW4gbW9kaWZ5IHRoZQ0KPiA+IDJuZCBwYXRjaCBp
biB0aGUgc2VyaWVzLiBbUEFUQ0ggdjQgMi8zXSBrZXJuZWw6IGFkZCBzdXBwb3J0IHRvIGV4dHJh
Y3QNCj4gPiBjb21waWxlZCBmaWxlcw0KPiA+DQo+ID4gQWJvdXQgb25seSBleGNsdWRpbmcgdGhl
IGMgZmlsZXMsIHRoaXMgaXMgd2hhdCB0aGUgY3VycmVudCBjb2RlIGluIHNwZHggaXMgZG9pbmcN
Cj4gKHVubGVzcyBJIG1hZGUgYSBtaXN0YWtlKSwgYW55dGhpbmcgb3RoZXIgdGhhbiBjIGZpbGUs
IGl0IHJldHVybnMgYWx3YXlzIHRydWUgaW4gdGhlDQo+IGlzX2NvbXBpbGVkX3NvdXJjZSwgc28g
aXQgaXMgaW5jbHVkZWQgaW4gdGhlIHNwZHguDQo+ID4NCj4gDQo+IE15IGFwb2xvZ2llcywgSSBj
bGVhcmx5IG1pc3JlYWQgdGhlIGNvZGUuDQo+IA0KPiBQbGVhc2UgbWFrZSB0aGUgY29tbWVudCBh
IGJpdCBjbGVhcmVyLCBsaWtlIHNheWluZyB0aGF0IHdlIGN1cnJlbnRseSBvbmx5IHN1cHBvcnQN
Cj4gZmlsdGVyaW5nIEMgZmlsZXMsIHNvIHdlIG5lZWQgdG8gYXNzdW1lIG5vbi1DIGZpbGVzIGFy
ZSBjb21waWxlZC4NCj4gDQo+IFJlLXJlYWRpbmcgdGhlIGNvZGUsIEknbSB3b25kZXJpbmcgd2hh
dCB5b3UncmUgYWN0dWFsbHkgdHJ5aW5nIHRvIGZpbHRlciBvdXQgd2l0aA0KPiANCj4gaWYgZmls
ZW5hbWUucmZpbmQoIi5tb2QuYyIpID4gMA0KPiANCj4gPyBJIHNlZSB0aGVyZSBhcmUgaGlkZGVu
IGZpbGVzIGluIG15IGxvY2FsIGJ1aWxkIGRpciBtYXRjaGluZyAqLm1vZC5jbWQuDQo+IFdlcmUg
eW91IHRyeWluZyB0byBjYXRjaCB0aG9zZSBhcyB3ZWxsIGFzICoubW9kLmM/DQo+IA0KPiBPdGhl
cndpc2UsIFlvdSBjb3VsZCBzaW1wbHkgY2hlY2sgd2hldGhlciB0aGUgZmlsZSBlbmRzIHdpdGgg
LmMgd2l0aDoNCj4gDQo+IGZpbGVuYW1lLmVuZHN3aXRoKCIuYyIpDQo+IA0KPiBJZiB5b3Ugd2Fu
dCB0byBjaGVjayBmb3IgbW9kLmNtZCBhcyB3ZWxsOg0KPiANCj4gZmlsZW5hbWUuZW5kc3dpdGgo
KCIuYyIsICJtb2QuY21kIikpDQo+IA0KPiBZb3UgY291bGQgYWxzbyBzaW1wbHkgcmVwbGFjZQ0K
PiANCj4gICAgICBpZiBmaWxlbmFtZSBpbiBjb21waWxlZF9zb3VyY2VzOg0KPiAgICAgICAgICBy
ZXR1cm4gVHJ1ZQ0KPiAgICAgIHJldHVybiBGYWxzZQ0KPiANCj4gd2l0aA0KPiANCj4gICAgICBy
ZXR1cm4gZmlsZW5hbWUgaW4gY29tcGlsZWRfc291cmNlcw0KPiANCj4gQ2hlZXJzLA0KPiBRdWVu
dGluDQo=

