Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D749FD711BB
	for <webhook@archiver.kernel.org>; Wed, 20 Nov 2024 15:47:05 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.65])
 by mx.groups.io with SMTP id smtpd.web10.16832.1732117616103348733
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Nov 2024 07:46:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=nV81WDcG;
 spf=pass (domain: cherry.de, ip: 40.107.105.65, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AHxB/IFyac5dEMbrcGzSwFhuro1nNgIkJISaDFj9cDTifu8Q7HpxLbogaaisixu1DAu4rKjMnAWKOCfIOerCkOUhgQlPYNp4ApCJ24jRQghFVo8En+iQbe81x5iKQUIgRT8Y8Yb/MmEbDnagBz879Gdg3JxIMxlmwamuT5fyGkHB7XyzUEQqgJcVt8XHYJsA5jOInjnbb08qZFQfnn4RQJ5sKoaqOtFvct/doMnZuN+125MhjBTFr46DmvtgbkRrHKMZXgTI1TyPrTzEExF+f7iUGS2Yzlp4ZYsRJCGoUqaI+FwzDTmFWUBfZ5RNS7u5EhI0Z5L13cGogOOyU5rjlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAla68z0QmJjLCEGZPWPKiqNSAHPukEV5f9p2GnBLD8=;
 b=HQVs4ee8shwVrolvWt7jO7RgTxs25kq51sUnmS/Fdts04hkHdEYeLMEgnOFhoKG/SkX2YIsY0woVz24sZWpZLDPNzBHQVh/BH7D7UR3ST7DfaIz3+tRBmRHoLOiD3Yf+aFMa3Clp6hBQVbpHsN+h6C2mQxVELYFWQBTa6TOBXPBVzv+fhVUiHpbf3RUAshjVDo7c0wZywysXghRRIgl30XlSAYBKNXcA0lZkkTBlU/k3qcVqoDFjma5wY0FtYo7V+c2esNDnANgaw57kMAGU/P7b0vWPM4hHQTQMTfmAZ7PT/9ti7P+nyclx1nl1Dx3brX03PoDVmtVnk5tO6MhHPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAla68z0QmJjLCEGZPWPKiqNSAHPukEV5f9p2GnBLD8=;
 b=nV81WDcGcR2UEwFTIRAuxO8CCm/Oem1+y+Vd7g3L9g7Dzg9AdjqlMATmt2fUyPtwYQt3FhsEu76+Jog0YUQRSXu44fZYpGLDLruOL/meJuKgCuSYaN6P4OF0yW/0pW6OD7XIuh8O0ABn4Zji11+bOf8TlMqOAk5mobTHB/b5Qe8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV1PR04MB10453.eurprd04.prod.outlook.com (2603:10a6:150:1d2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Wed, 20 Nov
 2024 15:46:31 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8158.023; Wed, 20 Nov 2024
 15:46:31 +0000
Message-ID: <69a649d6-857c-4de2-83c7-bac02b9ae593@cherry.de>
Date: Wed, 20 Nov 2024 16:46:29 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 2/3] package_rpm: use zstd's default
 compression level
To: alex.kanavin@gmail.com, openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
References: <20241120153205.2525735-1-alex.kanavin@gmail.com>
 <20241120153205.2525735-2-alex.kanavin@gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241120153205.2525735-2-alex.kanavin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0251.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::24) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV1PR04MB10453:EE_
X-MS-Office365-Filtering-Correlation-Id: d4c8ab87-d8ea-4f3b-f474-08dd097a80c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?a09NWDI0Q2crUG95L3YweHVhNktVcXZNVGJoZXRObi90eVV0QnZRL1Q2emZl?=
 =?utf-8?B?L1NpZVdRbksrM28vc0tBR014VUQ3RE5nTVk3bUxBL3EyQXpCaDRLV24vTjRV?=
 =?utf-8?B?ZDFZM0F6RW1PWURJZVd6OTV0cmhQZ01vejFYVCtnbWNoYlVXTE4wUGNjUWlx?=
 =?utf-8?B?TEpNbUpQZ3JOZHZOK0xYY3JOYlN3YjNrQVMxQTBEMW4zcnhyRjJoUWZiYnda?=
 =?utf-8?B?ZVF1QnBYOTRCalIrcStuQ1VMTGxVTzYyaUhaL3ZLVnJqelZGUkZQTlJaRElV?=
 =?utf-8?B?VG4zUFEzdElpZ2dIR2p2SW5CdmhnTkt5NDMrT2QvbGk2eWhoUFZMeDk5dEh4?=
 =?utf-8?B?VU1FZXIzNk1rbk9YaEJoNkllZ1lkbUVLRkJuYS9XQTJWQmp0V29teHJjdjhs?=
 =?utf-8?B?MHhHem8xZTB1TnI5Yk05NEpURWY3ZmphQnF6bVhKdE1QeUQxYy9CbUZzN2lk?=
 =?utf-8?B?OW5weWtmWDB0Y3BFaUp5STZOajRrNEhNK0lWNzFlSXdIcnBzZnFUdTYraFZN?=
 =?utf-8?B?aCtXVDVrWDdKV0JJdjlLTEJvazU2T1lqemIxazBkVHhVYkFDNnZDS3dHZUU3?=
 =?utf-8?B?M3NEbHFBQjI2dGtPcEZOSWdlSGVWTUxJV2k3QU9hcUVHS2U2bSt3d0FDOG1T?=
 =?utf-8?B?WTNYeGloTGF1MUFxcSs1SE5YL1V2OTlCd01hajN0Q0xGTmZoc29XTkxlV1BJ?=
 =?utf-8?B?Vys4aEJkOXBrVjd4K2VPMFR4RlNNWkFOS1pkOERUQTlBa3NHYlJiTXpaMmtu?=
 =?utf-8?B?em5GTTBTSHNYUFBmbjFSclYvNEl1V0VRclRzN0VPS0JoV29LY0FCVW51b2ND?=
 =?utf-8?B?MVUzLys1aGttZFRCTFVCSDl3Nmh6SDF1MW55Mm4zdG4vYWhOeWI5aURUU3dv?=
 =?utf-8?B?ZjRTcjhsQUtFU3VBa1BGM1c2T24yN2pldk1udVp6S1YzdEt1Z0RTa0dTU2Q3?=
 =?utf-8?B?aEFmaXZNVUQ0M2JKaHF1MTFFL2JsYVNEdTlYVkVPZFF0c2JmYXVrYnRUam5F?=
 =?utf-8?B?Q25IZm1nLytFck4xVnhndkZEdEZsMHNKbGZsK2szTVJKUXR0QW5kNC9iNHc3?=
 =?utf-8?B?US9TalBST3FvYnBFSWl5aHhMdE51a1g5WWROZmI3VEVUZ25raWNZWGRsS0Fr?=
 =?utf-8?B?NjkzUHpCcHRSekxKN0RuLzczMEQ0SVBTa0twbTk4SEVBalg1Rk1jYmdsTVFN?=
 =?utf-8?B?U0lGVVVQZWVhZVZqR0hiMVR6c0dYZFcveFpSbkQzUENRODc4UmpaSzBMZnM5?=
 =?utf-8?B?Wnp3TlZBU3UwajFCYXAwWUYzSWxlOEN6blFXcGhseHhTaitpYldJNk1yZjRG?=
 =?utf-8?B?Z1pBa00yeURyUGRXcExQZlNFeitvT3NOVzV0R0QzWjhrVDFzdUduMnlmeENU?=
 =?utf-8?B?WHNlTEFib1QwUk8vUmgzVlRMMEhGUWpZeUV3d2tldk84TXFsMWx0dDl4cHhr?=
 =?utf-8?B?dWozM1FiZWg0YmhXWFJFTWtTVXlDbnp3NkMvQ0NJcGM3VldMQkxVdzFkS0V0?=
 =?utf-8?B?T3h5ZlVwemowNS9nZkpaTXFLZXVSOFh3bmZ4dzgxNDl4T1doeTBTaGJFdHNE?=
 =?utf-8?B?K1lTYi81WGpEVjdvY09wa2NRd05BTlQwN2NUUVZNQmU2Rko2Yyt3QUdzbi84?=
 =?utf-8?B?dFZaNVd5Mnk2eC9OdlRyY2RxSnVsQkYxY3FRdDV0S2labHdnMW1mbm5VdTlx?=
 =?utf-8?Q?zjUyg3lHwf7Iev2OGl+f?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UWN0bjRVZThqd3IwZUY0WHJ0UHlNYmFzSHBIbTc0Szl2cjNwWDRWNXB3Y1Bn?=
 =?utf-8?B?cFVOcjIzQ1ZKamg2VG1HaVlzMmlSNkFKWXlmdW5xYVdmeTF2dzBNYnpxOVRs?=
 =?utf-8?B?L1pHSUppV055blkxMmpCSzlBVFBVZDhYd05JMkZQT0g1UFA2ZG9hUVB4MkJ4?=
 =?utf-8?B?Q0VrUXZVK2xlL2k2Q2kvc1g4TTNRN3FCbWVaZGptTFA0TjVuODVuYTAxWHlm?=
 =?utf-8?B?SjFrVE5jY1NtYk1RUzVLK2RBeVhLVEhza2poU01LeUx1RzlFWFduLzR6Si92?=
 =?utf-8?B?QmJ6TWQ4TVBwQXJIZ09FSTFSem9BeHhMUFlaMEE4S3dDZCtQemlaNmFqUmd2?=
 =?utf-8?B?bjRwYi9STllleGtCdzRRUytQMXNhcXN0aE5VMEEyL2tnN1kxRXltdDV6Nmdj?=
 =?utf-8?B?NWVjUnUrQko1WHpoVWh6TGtmWHR1Z084NTQ0VkJSRU1uT0k1NUVHSEd4a2lQ?=
 =?utf-8?B?UnpaTW1XTklsK1NnUFNRSjhCUHJ1eW5FM2U0QUZneGd3YkVXTUF0cUtFa0RM?=
 =?utf-8?B?b3oyZHh0amwwcy82Mko3NCt2U2s0S2ZIcGM0RGhzTUhmTnJ6MmcxckR3WE1K?=
 =?utf-8?B?NWN3b3ExT0tSaHgxRnZxQkdrdVg2Y3hnWUJNNkQxMnpYdmd3c0dwenp4N3FK?=
 =?utf-8?B?MnZxSlJoTHhXTmt5ZFZodFRFMG41dVYrVGp0YTc5MnRlZzdFTDgzd0wwaHhU?=
 =?utf-8?B?WXJVanVHV3dyeGVpc0k2Mi9TSWRyRVFyV1czV1JhU1FRZW1nbTZhSktJOVF0?=
 =?utf-8?B?TXBUQnRUSXN2djAydkxDNDdQcWpWNXBncmJGYThEMmcvMzFWN3V2aVhDOXFR?=
 =?utf-8?B?VHc1SXBsRFFEYkpKTDNFMlRyRndyemIyZHJxbFpBM2xQbGFOVHF6dFM1RG96?=
 =?utf-8?B?bDBXb0xSbDB0NWJTTFNCV0lrL1FwckMvY0dkL2lOOGZNNWpHNGhtQUkvMjU0?=
 =?utf-8?B?K3hnbTdBRWE3UVF6aXNSdlFjdit0SFVEMy93Y21nazNmMjhUVTdQSkNEL3Q5?=
 =?utf-8?B?ZmMxWlM4eEwrK2pKWmJPYVEyUW5jOU1JRDRXMlladmcxYTdyNDNpRUV3TTl0?=
 =?utf-8?B?a1UweUNYWlkrQTV3ZWF0elFlcnRaRzBWbCtzalhoMWNDOWFBdER0dU1nWFZl?=
 =?utf-8?B?VURmcC9QaEszaDA1a0pDaWE1TS9VcUZNczZaSERJSzRUS1cvclg0bTRCRVJJ?=
 =?utf-8?B?RWZiVDVFUEZDUFBVcml1NnE1bS9GK0hhSVZxZ0RXZnFmczFQWmtwREYzcmY3?=
 =?utf-8?B?NTFRcG5xT3M4NmxsUUUxNWZHdTBkaDFZZS8yY0RmZmxYRTJ5RjhHRXNZakYy?=
 =?utf-8?B?U0dMS2lEUmNBSkw0VVQwelBxMlNLKzFtVUNtNU1RdTkxWG1HY0lIa0ZObkxK?=
 =?utf-8?B?OUZ0MlEzZ050SmlObUVmZURPK1ovOEdjUW5FQmpkTDc0VnRMWVUwWGlpaDZO?=
 =?utf-8?B?SVpFZmVQZjJXd2xZTUZSWWRnaU9palFKMUxmYmtlUlJTQ2JRbWNxU01RUFlq?=
 =?utf-8?B?aGJqbmFZS2FuOTl5VDYzRDI3cEoxQk1UUE5YSTgyR2Q1WkZMNDJEdjRZblhE?=
 =?utf-8?B?Qlp0eGdkU1Q4MnF2aGxySHhheUV3NHZoU0tQaHhlOWNTdEJpSnUzdzY1Nnhs?=
 =?utf-8?B?d1pMRkZIVFJOdGZKWUxnTityWE9oUTA4V3BMcXNoT2x1dEgzeVgvMnFsUU1F?=
 =?utf-8?B?Uk52cXc2VjU5TGpwZHpQQWg1TnZ0aHRKNzZyZ1BhdG93NDM0Q2JHZnNMS0VW?=
 =?utf-8?B?NVozYVZTWDFZVTlpZ1UzNExsQ1VWV3RCd01RWXdXUTdpa2ErSGQ1dE0zQk4x?=
 =?utf-8?B?MjJ0Kzl1RzVVVjV3VVBiaDlFZnk4OE9BWStmYW5TT2JVV2RSZWttN1pvbGUy?=
 =?utf-8?B?VGVMdC81aHlLOUpRM0VsQWlzVWxaRUkxNGVpT01pK2FsVW16QzA5SlB4ZlU2?=
 =?utf-8?B?YU1xWmxOZzFJT29lRWF0Y0MwM0R5blNLekhUckMrS2dwVU1uUGlqMjJ6TE5C?=
 =?utf-8?B?L1djdUdpT0p6dXhyMWMwNXljYzdHbzArTi95ZGJNYTdMZ09LWkgyZEpld0Jv?=
 =?utf-8?B?ZUpQNkUrN0FpOUxzVXlGVExZRGZMUnZ3ZUp2UC9QU3lOcC9CUCtrNTZIZ1lw?=
 =?utf-8?B?WnhTUFNkTDU1cUhpMnpxQXgyMG1jY01GMkZOZkVSa210ZVdUWU04WU1XYllX?=
 =?utf-8?Q?A31dPXL2eIyyo/uKiliWcIA=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c8ab87-d8ea-4f3b-f474-08dd097a80c4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2024 15:46:30.9720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N1jxhyFe1stGZRWbCSDR/etlps8yUZrxYgsMfBk5m5EjD2+7u3KSrI3o3gFJ63OiZklcDQaKY2Uo/TSDDhtFmyWRuN0lpfcGFglpW4OO/Us=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10453
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Nov 2024 15:47:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207464

Hi Alex,

On 11/20/24 4:32 PM, Alexander Kanavin via lists.openembedded.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
> 
> zstd uses 3 by default (and ZSTD_COMPRESSION_LEVEL is set to that),
> while 19 is the highest and slowest.
> 
> It's not clear why 19 was picked to begin with, possibly
> I copy-pasted it from rpm's examples without thinking:
> https://git.yoctoproject.org/poky/commit/?h=master-next&id=4a4d5f78a6962dda5f63e9891825c80a8a87bf66
> 
> This brings significant speedups in rpm's compression step:
> for example compressing webkitgtk takes 11s instead of 36s.
> 
> The rpm size increases from 175648k to 234860k. I think it's
> a worthy default tradeoff.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> 
> zstd fixup
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>

Small oopsie there :)

Looks ok to me otherwise,

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

