Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF9DCDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 15:41:10 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10270.1782315666611256497
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 08:41:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Wwj2iZLs;
 spf=pass (domain: cherry.de, ip: 52.101.66.52, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x3DzLn9ePC5BYD4jNg4j9livgRR1+jhHxhHoKTDFDPDKqEPPA4kJ3RoJF0ScKgoI12DwY2thAf6pH5HSYKlVZ6ljJ/k1MzERQUv0zDOf9L4j3eoydZRgzXFMiEmAqOlZDMx6P7zTZNo2LI6o6Vo4CZGgRhB6ccKXJEig9uBeORsvQXfy1znjZuT0vmAJDzxU0QPO9JK4xPJRjfkOct67ORZh5O30o8NWNdaiAgOPrD2fYIyxLY89ulSX0ryTX9vhOVsn0IwiL/5yP4zJBNzpyWfZuc/dCdiQ8u7GEZ39No4YKLbxA0+b7WHfMSp4MfHoQn5NbU/lK6zQOUKAjy7gOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+/OG2/CkPRjp8F4pEYHlzFPN67xlUo7ojRvPL1vYGRw=;
 b=BctrQEAs8sXYK3iLAownmVGv66q17lt0iI9yddwtti/SqJ7RU8KauDeNCDthhQkCvbq1NULeg3Et9Z0zTjgktyfiv6UtIEHNfOgFvltSZ0fnzDacD+oaucizzfX/LRN5s8GmMBDqSlRck5UIZuIVNhHQwBvDDR7A9n4DEVb+o5cXo2TqX2zy7WJ7klAMOi8zSlW3g9F95S7sCnRlpM+SVCqU3+DBzQH8ZrJ7JSer9GIFW7HmWFM0n8Pw5eot1/cII5XGBNlet2aO25p43Z8mARDtW8cTys85MWKjQcOzhKeEKmL4pl1uAWN6oAN+X+zo8YvB3jt3cLTcrMJuyMSFfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+/OG2/CkPRjp8F4pEYHlzFPN67xlUo7ojRvPL1vYGRw=;
 b=Wwj2iZLsBv9ZiGHAr+F6NZjZa6jmnp4YWlF1Xx7paB8Ucx84Kt6To9eXB4PBmGMLh5nho95cJ7tBhn/eZmzI1eSLgpYclxCVyEAvgrkYxlL5fpbS+fwQIZVg1Li3tpmQZLZdYPMxsYlgg6FtRbDPNhSfK2JqvQ1/6nbbmpA3Gt4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com (2603:10a6:10:1e5::22)
 by GV2PR04MB11448.eurprd04.prod.outlook.com (2603:10a6:150:2a3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 24 Jun
 2026 15:40:58 +0000
Received: from DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00]) by DBBPR04MB7737.eurprd04.prod.outlook.com
 ([fe80::5960:fb4b:9313:2b00%5]) with mapi id 15.21.0139.018; Wed, 24 Jun 2026
 15:40:58 +0000
Message-ID: <ea81a634-06f6-4ea0-b636-1346b2bbf7e6@cherry.de>
Date: Wed, 24 Jun 2026 17:40:57 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] devtool: provide explicit error for missing
 "script" command
To: contact@schnwalter.eu, openembedded-core@lists.openembedded.org
References: <20260613-script-command-not-found-v1-1-5c5f6742a6fa@schnwalter.eu>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260613-script-command-not-found-v1-1-5c5f6742a6fa@schnwalter.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::13) To DBBPR04MB7737.eurprd04.prod.outlook.com
 (2603:10a6:10:1e5::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR04MB7737:EE_|GV2PR04MB11448:EE_
X-MS-Office365-Filtering-Correlation-Id: c98039aa-3576-43bd-ae86-08ded206fcd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|376014|366016|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	74VXF1x+JQmNlOzUsmDTb14hpGNUGO5Bndg1WItwmDeEWsv5/PjYhlKsdy/an7YhjhBNw+HbDdaOIFbU7fAi7/e/oHfxbtTWHsq/GdnRhz9rwYpiyOpXV5La1wy7CBt1fz8YU9i+PEsTZgxxFa0a+6kh1P6qequhviRsVE43NMenuTxOJAqdKU4CN9QwHmBeP8kzH6M4jvhAtTCZXHO/sATxOEtwkp2yzxoNaSvZ67PvnCmneW7FEHAJjNgvl1mC/x4a4HlI2x4gInhxlnX5MvJxWpHCX3XkaDYRjoyYaSamOE4/vxHQUTTYTkMvUXA/g0ZHPgNLT2RIizt6LsnmlkNMN4kBMDzGpXhHSiMVgD7abYmimd3XKNadgl3WB8/hczfXrQuHzD8B2B3rbaj0kS8uZI1rBzK0ZpOTLLdFjYkz7r3s/SYi1fJNo7HWzAOd2Mv50UUqj4bCBH03NpsYXC+nmv5vzPqH5YsRcABT5AJUmJZzsj5Ck0h+IxvoZydZreYvyPO5Wr+F+bch/hLuo8B1mJZUM/XL1X1qd17ydUQOQKGqPBBF1P9qt2uszA8X5Aa9/GxchbQlS9hJBZE2kC3k7nqiKL4DWgwR77FwV8Z9GFtPrDlbW771MpK5AcPD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7737.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QUQ4dGVyWnhWRDhtTXk3UG4vMEY5WGtyT0EzU256NmdobDdjWFRORk44QVdV?=
 =?utf-8?B?ME5TTE8xZVVHMFZEcEZZL0JQcnZwMkh0NHN6OXBFUVRqZ0x3SWRwL2dNdHIw?=
 =?utf-8?B?cGpEOHRlNTJzQ0NnaitkTlBtdDhZbjlHaFRCQnBybXBHbHNCK3l3TTdoVGFr?=
 =?utf-8?B?dm0vSXhyQk1lUnJnZHJqN0UvbmZ0Q2llSWtSajFpRkhQYjBPSEpsN1RkbmxW?=
 =?utf-8?B?UUFsclo2Y1c1RGxwSHJRMUlrMmgvc0JZNmpOYTFIMm40WTlYZEpiVzlqL0px?=
 =?utf-8?B?UDE1NHZCc3lzUmgzeTgvZEJyY2Fpb3gxemJwR0RhRkRiOFBvaEt4cDNQbFND?=
 =?utf-8?B?QjNqZU9PQ09ORVZoTEg3VitrZDZqc0hKM3ZmSjdUWXJLdW1ZUHNhM0xWanNN?=
 =?utf-8?B?V3NaVTdRSmFzdHYyMGZ1ZTdMcnRLL2Mxb1ZGbWhBUTFHeERLU1QwMEoxMURv?=
 =?utf-8?B?WWVIck1IQm4vNlp2aEp2ZkZQNjBkWHovWStqbUtXdndTSlNYdVFnVUYrZ0JJ?=
 =?utf-8?B?eW5jOUlxRWFkYnhMcCtxdVZKSGQ2cENGcDQ1d3VRKzFkNGxjVHBPVE1ZNFJz?=
 =?utf-8?B?bU1Wd21OUlQ0SjJvNEdzT2FtY0dVWlpUZEhRL25vNGpDbnNaWWRDMGdXUVVN?=
 =?utf-8?B?UmFjblF6eGdyajdEMmtYMi8rZGk4NHhtSjMzVmwzVmtJYXl1cjdaWVltdzlu?=
 =?utf-8?B?QVpkeHlFZlNucGpLWnpUTlQ0eTRveUJxU3ZnY0ZRaTNYQU1SdWJJSHNlYU15?=
 =?utf-8?B?eTVxbjVNVEIwcXhITmVLazJQKy9mSHlERXNBYStldTRwRk03T0h0cVJuTjFP?=
 =?utf-8?B?dzMrQWlYdFJaWlI0c0k1a2trV0ZVeDRveW44Si9xY0NTSHJSWW9OcXVGM05T?=
 =?utf-8?B?K2J6RWJOcFQ5dzBRc1dLMXQ2QTRsMHJvR25obWNIYW16dmFCZFM2Rk9SZE03?=
 =?utf-8?B?ZnBaMHNYTEVpV2xYekhlMFU3RjVKZk5jNndmcUgzTFZxU3ZGTktwL1NUb2NU?=
 =?utf-8?B?SXdwT2VhemtZekpMbW1ETUdZQjIwQzZYeXNoYU5tWFJ6dmJ2WGthdE1wOEc3?=
 =?utf-8?B?eUJNc08yQktudkdsUmIyelVvSzNsdU1yUHlXcElaVXZYV0tkZnZCS1h6Mkhm?=
 =?utf-8?B?MldjU29hTFhUd0RveFZzREI1VjBNeWhZRGQrK2xkbk5vOERteFozOHp4S3No?=
 =?utf-8?B?cVZYU0Rrdnl5K2oxc05EU01SNTgwNEIzN0k4SEt1SzZHc20yTWo3Zi9Db0Va?=
 =?utf-8?B?Qm55bFNyaWU4aFQ5VjE2SGlJdzZybUI0N3IrVkdVR1c4NkM5c3RqQ21HaXNt?=
 =?utf-8?B?aXQxa3kxSzhvUktySFowQjlGRWcxYkwyZmdzWXdVVHN3NXR4T1RZSDZsT2xq?=
 =?utf-8?B?eFNvSU9ML1VCTTluV1JCdUVkUzF1TnFTSDRaYkp1Zkp2dTYxZ1hwU1ZxOVRE?=
 =?utf-8?B?NkkwUEtGZHNkNkl2M1NKU0NpYm1FUkpyWG1QTWt0bzNvZlo2QkRUVjdXalEx?=
 =?utf-8?B?a0dvRkVwWUR5aExoOGdPbVkydFA5MDZNbjd3dTdRaStFZFdsTGJhZ3VRSE5Y?=
 =?utf-8?B?R3F0VjV4NXVYcXJLVXVHVnlEWURaVDhid0ZoRXZkbFhGSWZTaHRjc0NkM0ZN?=
 =?utf-8?B?VE1ZeUE4MkpiQ2NFbDdIL0V1MnZkQzJyNW4xdURxLzBkQ1Z1VkU4MndDQnMy?=
 =?utf-8?B?cWJXQ241ZFFuclRObS94Vmc3R2lXMXdtbGpzTFlmSTM0blhBbVFSZmRjbUl1?=
 =?utf-8?B?ZmI0ZVhFUDBtNnIzeC9WSStmbUFoSnh0OEtvV0syV0xFSnc1MWZyck5wMU1l?=
 =?utf-8?B?TVh5VVFKcW0vVlRrcWc2UUcxT05EdHphT1VuWGxPOEk0dlBsb2FFbGRhdHJP?=
 =?utf-8?B?dE5YcFNRK2dZWHVKVDBEMm1rbC8rT2MrdmFBSDQ4d0NHaUtQWk40U0xEb2Vj?=
 =?utf-8?B?encySjJxMWZSTlZXck56cm4rZWN4MjZMMHdUQUVWZHZkRXVzTTRCYjd0UUxI?=
 =?utf-8?B?RlhoZmg1dks5RU5NK3ExNlFXczNPb0tKOTJTNllZVGJBb0R6dXNQRnVFTk94?=
 =?utf-8?B?RVlXdXhBc3B5WFhhUk9FMEtUZEsyclNTYmZNVUpyb3F6OGNzenl3dnd5QUlm?=
 =?utf-8?B?SW1wOEFjNXAvaWNIeW1ISFJzMThUL3ZyRDJrRE1CQ1VwOVpPUGEzRmZTeE9N?=
 =?utf-8?B?OEkySERBcUJacE5JRVROblRPR1JxUFhGV0pMT0MrOWVzYTg2K2swNDg5NWtF?=
 =?utf-8?B?cVlqNDV3ektrS1dXMDVCSDhuNzJWVEZRNE5RM2ZVZFZXWjk3M1VxdmdEUTRy?=
 =?utf-8?B?OVJRZGZHZHBOS3U5UWNVUmFzVFlFN2t0ZENzUFc2Y0lQTGVsOXlsQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c98039aa-3576-43bd-ae86-08ded206fcd8
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7737.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 15:40:58.8543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8EpLx10DR67PhTGdQH+cIr2E7i6StzNQzBaXr+tqjtGPRcgYabLz5Csy3TkL59Ez7fci0P86dc2cRhEsk0eVE4id+HdFYMAVr5b9oOy0AHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11448
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 15:41:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239521

Hi Walter,

On 6/13/26 2:11 PM, Walter Werner SCHNEIDER via lists.openembedded.org 
wrote:
> Without this "script" command, the "devtool build" provides a very
> ambigous error: `/bin/sh: line 1: script: command not found`. With this
> patch we provide a more detailed error.
> 
> On Fedora 43 the "script" command is not present by default, one needs
> to install the "util-linux-script" package. On other systems it's in a
> different package.
> 

Just for reference, note that we have it in the list of required 
packages in the docs, c.f. 
https://docs.yoctoproject.org/ref-manual/system-requirements.html#fedora-packages.

Cheers,
Quentin

