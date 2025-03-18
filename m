Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9477CC282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 11:27:54 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.80])
 by mx.groups.io with SMTP id smtpd.web10.9459.1742297272360831452
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 04:27:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=M3RDKpyg;
 spf=pass (domain: cherry.de, ip: 40.107.241.80, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tkJV6EjoPoAEReRgYuHkrYaF/Hy50qApbuenMovrrAaU/4IWZ/FETfIeH/7rBoy8BwYEtlc49d4dFj9JC4dD/DJJi+WNyHJOOYrRESOr7Wewt4dAgERdon0htp7CjRRSkYTcU7D5vJwDwqPOameCsqO5QfKC/IZN5hDgGShLXecwwK4MC2S2FydLLg35fdsGCQcqa9YEOClHqTPvG0B8PxJCY7LSmndhH6d2s5OBFjGNV9weh5d8z0cWtX6TLY+KEKENaWmELcGSXwcEObQOpR9n0z69Sln7xgKjqP0eb531AFWI6ZIhTDgiT4WoQt9yXRxjtzweXS/xkLDBGNcezg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4afdfmEmNkQJCUs4uPjpdDcbC032gaRrZOEWTxHIWnQ=;
 b=uBCwOylaVqHQtHymi+/UapZMcgh03mXDk9mUHnlwCPJMlYaExswfGftJ5lOYo1FpJl7kiA4u+BUhpMFol4rUToIvG8UhGAtL9TpsmufZkpwlfHOtXBG3i8QBA7UG/W5rYMd5DYxefF6TAbktRX7b/0BLT/QSqp7z/3BdmWKDzaoXWtmGAIa5wMoimY6bnNInE4kZDlu2kpfNzWCQCzQfOiXvvkS5b2FWT/nban/Cs0Cxs5LL4DzSGNUU4cRtHPGhwNhVkRIMDd7ihg/VJtMKWOnFlBG8tTgyGRtioDBdO1qEOS5Xxn4Tzov31gG2e+kK414Z6MECYC5+LNP6W4o2VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4afdfmEmNkQJCUs4uPjpdDcbC032gaRrZOEWTxHIWnQ=;
 b=M3RDKpygxqIFztS1vrHZXSeOmut9XgcCCrWHs9IvOtpg8qhnf54S+H/G+Cs+FKi+VgjCob9/ifyS++a/ZmCRplEU3v6CBsjfSn8qj2QdalHvG5Wve5z+L8gW8mlL9WaI0n7E4IHO/dflqKk+kX6Ej3QjJ18fCStexOpHxi2OU+A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PA1PR04MB10357.eurprd04.prod.outlook.com (2603:10a6:102:452::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 11:27:48 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 11:27:48 +0000
Message-ID: <32c23ca9-ac0d-474a-947a-07dc1faad0bf@cherry.de>
Date: Tue, 18 Mar 2025 12:27:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 2/5] libcap: remove redundant FILES:PN-dev
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
References: <20250317170848.4153724-1-ross.burton@arm.com>
 <20250317170848.4153724-2-ross.burton@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250317170848.4153724-2-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PA1PR04MB10357:EE_
X-MS-Office365-Filtering-Correlation-Id: 77f70137-f8ea-4b8f-f3d8-08dd660fe95a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?T1A2MVBEOFg0eEc2Smd1NWZSOHZDTEljUlNtWC81Z3puTEs4d1ZLOU1sSDA0?=
 =?utf-8?B?dWMzSEFMa0dUVGZqZm44czdpRHlUVFBKSzFWUWRGOW9QUkxheTVJRmNESGR5?=
 =?utf-8?B?V3JvdlZubyt2WStnelQ1RFNtMDZGT0w4UmhMUEJuWVVML054VG1mTG0vc1JT?=
 =?utf-8?B?S3RPVTRIbWRHQTZuUHE5QjUwYjI0aGVqWTdERHYxNS9HUmtxTUdxNEVmdWJM?=
 =?utf-8?B?ZE5DRzZUb3JsL1RJSW04SFE3T2hmUHhoRmdpVVovMUVuY3FuU2NmK2FjT1JI?=
 =?utf-8?B?TCs3RCtPMUxpNWgvam9BVjN6QURaVlhFYkF1RTBLaVh6YzJjdU9oamFwMVBI?=
 =?utf-8?B?OGFrL1A4TWpLQnVjSEg0RTdmU1IxUFNhR1ZHVGJsUUZ4MzQrYUoxeW9xT2Zy?=
 =?utf-8?B?SzhpWENiRGFIYlVSYU4yaTVQQ0I4T285d1BXQU9iNnFLaTVnRjZLZnZabFJJ?=
 =?utf-8?B?MmN0aUxUVGMwa1pTUlQrY3N1dDZYblE5OHUzRTg4akQxeVRaZmlrVjRJTWZN?=
 =?utf-8?B?T09WTVJuRHl5Ny9kc0dnYU0vT01wVGpETG0xSjRGQ3Bhb2tLVXk4S2V3Zy9n?=
 =?utf-8?B?OVQ2RENFejc5MXZPQlhERWh1ZjVMTjkrRzNXTEVlZVBtOUg5OVZzR3M5SjVa?=
 =?utf-8?B?dU15WnJiNWVtckhmb2tyTkkvUUtLRlVnQjlubXAwNENlRXdLOG16UVR1TEVO?=
 =?utf-8?B?cC9TcllGS0owUWZnaHMwOXFCbjVrOVd5QmgyOUtjQ21NbldFM2sxVTZXUksy?=
 =?utf-8?B?cytQbFN6ajRrYURnbzFVaW0xd2hzOVg3ZmxOUFBTbjFXUHdvaWpzV2s5ckRJ?=
 =?utf-8?B?YjRrTUFiQTlBRzFhN21CVk9Lako0VXVBeVl6eXJiVUZlU2pTc1QzUFN5YnAz?=
 =?utf-8?B?RU5WMEptYThVdXFIb1RNdnJxbVdvejhzSitSRmNJVFU4ZUZ6dTZxUkxCRENY?=
 =?utf-8?B?K1hySU00QnpZT1REVHNjSkpPLzUvcnU1RklMZFlPSlhzaVY3TUVpVUdCaFFL?=
 =?utf-8?B?WEQ1QkdkWnIzNG1mY1pab2xMUSs1cy9lRmt1QVYwRzRkaXZJWThHVTBGcVRR?=
 =?utf-8?B?d21KZnE5UlZ5dktiWndNRmlJTWo2L3lmRlBEN3JRVVkvZGVtQU1vNE5ZVGcv?=
 =?utf-8?B?bDZ2Q1FtRXBtRE5ZeS9LSjI5djVtdXFia2kyZEplNnBibWR6NjZIbE1KR1Yy?=
 =?utf-8?B?S3RhNWd0emh4T2t0RHdmTU9tRFQvWENsWlRjdDdkM1ZBNms2d3RMMXBKRzg1?=
 =?utf-8?B?TGhQdFRTWXRRQStHS2pPenh4dzJZL1gxbUJwZWFxMkZDa0ExRnBhK2lxVWlF?=
 =?utf-8?B?V2xXK2ZwZWM3SG11MHowNFVObExCL3ZoMEdUUXR2MWl6RUFBK3JhWWNjSHBD?=
 =?utf-8?B?TXZXY3Q2VXZ1YWJkMERldm1aMUt4cmxKbFNLTWgyckc2dW1TUzBQL3Y0UVBM?=
 =?utf-8?B?MWdxWGhBeDNVVUVmV3lJSTBlTFJEcjlLd2d5bGU3SFJ1bjlWRG9BbDJtdW54?=
 =?utf-8?B?UmJpa1FWMnlKbnlvZnU0a2k5Yyt6aUhpNURCU1h1eHI5RUYzeGsxb3ZFcVZL?=
 =?utf-8?B?TGpIN2pRbFFITWV3citxV1FSTXowQ1VBd0c5Y0Y0amM4UDl5WUJ5ZS9pb2Rr?=
 =?utf-8?B?SkJQYldwdDhLWStuWEp4TFgxWW9GUzJyY2p6Tkl1bE92V3BwMnVCYjQyc3Za?=
 =?utf-8?B?QjJYa05ESnR0V3BudmU1RHZOSm1rSVEyeTVlaWpkZTFDejE4bTFScTc0blBh?=
 =?utf-8?B?SDFpRkljeGl2SGVmUnp0d2pDQXhaWWhyWUpuc3lHM1NkeGpsVmtMN2V6cUt2?=
 =?utf-8?B?TmtXOHRFVFduSTNkdmt4cmJvcjhmcEdqSnB2cHBQV2ZXK0ZZMEdBeWtURXMw?=
 =?utf-8?Q?qjMCo8+uNm2IN?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bXVjc0JDME1wTFI5WGVFSWJFV21nSmh2aWprK3Z5NXpuOVVzYXBMN2x0YkM2?=
 =?utf-8?B?ME9EMlJ1Q2JhNkpUSzNPYk5EVllTUUdHRnJ5ZDg2RlpZNUp2akQ3a04rdHla?=
 =?utf-8?B?Yys5QUlOQVdpUTJZVndZcjdYSVMwblU5c2JJSmVYbTVTZ0dtVXJzWHBhMU5D?=
 =?utf-8?B?d21hK1NkWDFkZUwrcHQ1Y1Vpd0NKTGJQU0dDOERpbi9NdG43OTlERnI5UW1t?=
 =?utf-8?B?ZkQ1QnhGS3BJQTRQbVBKSHBBNE1pS1VzNTk5VThxRGRESGNlYTBQYVlyQmVi?=
 =?utf-8?B?eDJwWjFsNFpBWGY3TEtOUVhLQ0o5MWQ0b1podlZXaDBWS2FSUmRaTE5yTkpD?=
 =?utf-8?B?VlpuS3UzTjBCblZ5WjZHZnJSVWRPL05yYlZ3NFRFdUpHWmNzcVVkRHp0WEV1?=
 =?utf-8?B?Sy9OTTZOY21VQUdqcENQRWlia2FPVitVbGlUOXF4cEU5WWZ2VzNKYXBCTDVs?=
 =?utf-8?B?eks3U041ZUl5SzZaTnE3TXFHUVRvNDhVTjZ3cEUvN3dpcGltb3MrY0Y5Sm4v?=
 =?utf-8?B?dndUM1paTGF2V2w2aU5QQmFOcGhMTzhaSGFvMHNxSnFYV3JTMHFxSFh5ZXBW?=
 =?utf-8?B?eGIyNmd2VWw0RUs3VEZNbHpLY3JJL2tSWk5waTl2bC9ZYThaVHl1U0VvUFFq?=
 =?utf-8?B?RnZmeUVkMzN4MmhGZUxMT00wSXVRTVdJYzlxRUczemVFaGlQc21yeWs4R1VQ?=
 =?utf-8?B?alZ3TmRQM09rMjR5ZjkxaW9PU0RIS3BNblV2eld1dFNZeVJYejRtbjBxR1pO?=
 =?utf-8?B?djRjZ2tGZ0VyN0psbWJJNDUvbHN2b0tSdktPOEkwTVdxMkw0STFhQVlCMlpE?=
 =?utf-8?B?KzhUZ2w3OGFxdXN3aFg1Yit2TGJSWkFkazZqTFVEWFZGWk04NXlJQkcrWlU0?=
 =?utf-8?B?amJBaUl4ZUdPM3B0VTFYMEVwNVFEb1BWNjF6K1p0YU02VTZhT2RpczRjNzF4?=
 =?utf-8?B?Ni9Sam5wc3ZwaTVIR0kxMExRams5dFVYMmtuWjdGSDdycWRHdVREaXVPL2lX?=
 =?utf-8?B?TWVaYUJTQnViZGpQMzl6UW9uczdJaHBEUEVBcG1Wb2xubG9qakxTRlRFbHNO?=
 =?utf-8?B?OE1UQ0R0SW1VTTZ3VlJqNDQ4cEdjSStQdzZZdThodHBPUU9Zb2phS1NxTVpz?=
 =?utf-8?B?OVFpcWgzbXp6ZFNpdWhRMmV0NkVCSHBHdmtzR0JpT1QrSnNneXlYM0lCOEZU?=
 =?utf-8?B?eGo0T2N0Y1FKaHl5UVMzNUUzTVpjQmVYWmJsWlBWS1RmRXh1dVRUTmQvOTJ6?=
 =?utf-8?B?QnZoN1Rodmp0VllBb2pHN0lhU2RVYTAydmF4R0pzMjlZQmI3aE02Q1N1azBw?=
 =?utf-8?B?VWtQNW5uRi9uZExrQjJDOTZPZ1dYdkg4S3F6ZnpaZTlvTHpwd090ZGpzWUVZ?=
 =?utf-8?B?QXE2Sk1Tdm5kSVRieWFoalJKVnVVOTk4SisrOEw3bUVLeUNYVnM4K1B2Y1hX?=
 =?utf-8?B?d255dnJKelg3OUdTMnh4UkRjTit6ci81eERYTDZlVDZhT0hmYlY3YTNxZFBX?=
 =?utf-8?B?RUZNNzNDejFYbVVFT1paREFyY1R4QUdtTzdaRUUrTFVvRThRMGNQNTFCc3Jm?=
 =?utf-8?B?UXpxTGxVazE0ck9BQ0orcGd5S1l1UDlGdnMyUlVEcExyZG1ibXRmcTdabStj?=
 =?utf-8?B?aTZzNjd0T3lYRk56Y2JLV2pENnZzeStoYTU5TWpOMk41TjFxRmtqcUVCZDFE?=
 =?utf-8?B?NjhXekxKZzZoNVZ0TkowK0dvM2ZNaTA5cHZyNkpHd2xDTXlJaEErbmh4STVJ?=
 =?utf-8?B?ZFJWY1lOT1AxdGJVSUF5ZUxlR2RDdUJqQlVzR3pBVEFkMk14WnRXWG9qT3hz?=
 =?utf-8?B?a3F6V01XeERyQmNHdUtrNUZZL0JzeldoZWFrUG9wOFFtWlJvMG5KQWRwbmJZ?=
 =?utf-8?B?MHNxRUJ5SU9ydVhOWitKSEtSVjEyS3FvYUNNV29qamo1U2NKNVU2YlFNWFh3?=
 =?utf-8?B?NlFxWUN2SnQxUk5QQXo4VUdJbmhDT0NlR1E3Z3YvcVlVVmVsY2RHcU5vc2k2?=
 =?utf-8?B?dVlndTZ5aUgvdzZNNERETk5EWFhYSkpBaHVWNTcwMzBQbDZpTFRvMDdaaTFO?=
 =?utf-8?B?eEJLOUdwOWtLWUVwS2ZBRE13bnpldk1lL1BWdUQ5aHlha1lGenNnOUU0NVdO?=
 =?utf-8?B?RG1PbkFqN3hVOHdMbkFRcWJ3cTk4cUF2UzU1K0Z4R0kvdzhvdkpVWUZBNy9s?=
 =?utf-8?B?Q0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f70137-f8ea-4b8f-f3d8-08dd660fe95a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2025 11:27:48.4181
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ya0zdnVDD2AuOHaplAsARRuGZkn0TDbofCIAhyJgccxkm05tMPeoNUpE3RIqKlX2qj4XiaqUvucJ4VXdsiSEdTr+UDNzx1oYLwke463OYZQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10357
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 11:27:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213206

Hi Ross,

On 3/17/25 6:08 PM, Ross Burton via lists.openembedded.org wrote:
> base_libdir/*.so is part of the default assignment.
> 

I don't think that's true, base_libdir/lib*.so is, not base_libdir/*.so?

I assume there are only shlibs that start with lib prefix hence why that 
is an appropriate change? If that is the case, can you say that in the 
commit log?

Cheers,
Quentin

