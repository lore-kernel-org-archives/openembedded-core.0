Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33751D44C56
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 14:27:24 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36827.1768487232275601990
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 06:27:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=nNv0a8UZ;
 spf=pass (domain: cherry.de, ip: 40.107.162.21, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PiM+MkJJuxEFU432ve65Ujp9RL5QfPMCCdLVA6qavTucdmJ9gZS8JJk5wsXL5dXyMi947eaB+UeWVN0u8LHX4gpmVmZJf9SzV/lxuTAkBqRvyNcEtq7SBqw8PTkHmqEM6yxR+zCk3DzWheG5Tbzqs8HKSuUXm774jAZsdWk+swp3qnwgAvfbQGSzzLw5/Y1uCUNm6jQ/iOM0tRiQG9kKSghZ/+d3F1WgKZ9kt8jLIokcPptJgakSnH8JZjNQMh4L/kS/DxRWVNVFoqGLnOxixZN4CyvyD+pwjh+X+jsYM52ye+MJaJVuv5usnrc1culxTbroLDg2IU5w1bLv8Ggtjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mi2Ahqq6AGL6UkkBmqFcyZBR3CgNbUPHkYkNv/Muc9I=;
 b=WpOZK0cmxHB/RJIQstZXZnZvypzVp2TImJ954ytedR4aWWPup6egQJI/afIQRon0orF6IPOYY0Mserln/ovIowCo4z2giwzZ1jQ/DEQxnMcBf9zKzKSA4+JNmIo6X+b3dmjKNe144AXv5wVwXFWZnE9JcM0HgLDm9GJhyO962g6BVA5oWJb0KS5v19MPsHYS7uzwODfosZ3VJKnvRosFvuuUzDfEihedMGfUl5nHj10kBFiCo/4/Hea57Ks/w4XSic3fj0hAoAeZn84cQUyjFohAzO2LEA8m5S2VVkQA3VkmReN33RIy5BFST2pV5UvkfjUcJJ08wGXnVp4D8YEc4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mi2Ahqq6AGL6UkkBmqFcyZBR3CgNbUPHkYkNv/Muc9I=;
 b=nNv0a8UZBNwXDPJsQrP/YHeAH9fn9gzwAu/xtrjRBv8PJyd6bpfDbYQsSnit1XJaWRluhNjexnJyVydWjbF7clZggddgKz7qMOon7HehSHUAVG99w5Pi7trtlaKt3bwqroG6O/Ex4lEyrJzRT/4lmvwJoMKJW6Dlthk+QF0jPek=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DBBPR04MB7612.eurprd04.prod.outlook.com (2603:10a6:10:202::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 14:27:08 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 14:27:08 +0000
Message-ID: <342c13bd-6596-4275-957c-ff260f98586f@cherry.de>
Date: Thu, 15 Jan 2026 15:27:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/2] mesa: drop VDPAU remnants
To: dmitry.baryshkov@oss.qualcomm.com,
 openembedded-core@lists.openembedded.org
References: <20260115032458.2775110-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20260115032458.2775110-1-dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::12) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DBBPR04MB7612:EE_
X-MS-Office365-Filtering-Correlation-Id: 40c2387f-5ef5-499c-83b4-08de544229ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?VFhyODk0WDBHa0pOUUNmTFN2U1hLc2xuNVpvNEI3T3d3MzFHUzBRZjlQUVNW?=
 =?utf-8?B?Z3crZmNrT0o1b2tibTh5SElzd0VPQ201YkpCWjc0bmJ4Skhma014eEFIU044?=
 =?utf-8?B?Q1VKZ25FMm5QUkJRZG1vM2gzSWFBUTlRaTcvY0VrRm1IbzFIZTlIK2kyRWlT?=
 =?utf-8?B?NXpNSzVPY3k5TmVJR2xUUXFmYjREVEVuUWhjRFJnRG1lcVl1NzNXVjlWcmpX?=
 =?utf-8?B?MzQ3ODlDQjFseTA2MUFuQnAzMlNPVG5VZ0QzN2FRaUZoSE5hR3paMU1kSjlx?=
 =?utf-8?B?V1lXNndvUmxQOEMxOW04b2NqVkxFNUtPcm9HY1FiRkNnbXBjV3J0MjlrSFg4?=
 =?utf-8?B?UzZ5NTN2UGcrczA4VFFJdHdPTCtGczJuYVBEYzdmWHNwMlF4WVNaR1FnZVZH?=
 =?utf-8?B?TWlHYmZnMWFBQUw1N1IxTFJJOTdtczhqK2VXLzFHK2w1YjVxbkNjenFMK2ZI?=
 =?utf-8?B?MFpDWElkSHZMbXFhditRMGFmb1BYUFpFOUJZWmptbzVtZS9nbjAyTlRxSGRz?=
 =?utf-8?B?N01pR3ZINWc5ZHgzR3Evemc4ZUxsN01HTFdwMWd2SWE1V3JGd0FsL2pnSkM5?=
 =?utf-8?B?dWxsUUtFd0hWYmNjNm1JVFNHWk9SL1hZRnNCNkN0MFRYSjhHcjJiS00ycnZx?=
 =?utf-8?B?ays0Tyt4VDN2V3o3NHJYTUdTa2NHajNJa05LVzcrS3RXbmdYanJjeFRzRUVn?=
 =?utf-8?B?OWk4TUZpamRLaWdhd0VNZmNwelhBSWlvK0hsaVozWXNNYXFHU2p2TWRUckF3?=
 =?utf-8?B?WlRwVUdYVnJJTnV2cWVxa0FzSDh2aE9VS21SZUY5N0tqNUtjNWdNcTVxM0lk?=
 =?utf-8?B?bTY4QUJnM3k5RjZjSUdiSmlhTnFIZjdacEh3MDZzKzVrTWVVTEpsekdUU3dI?=
 =?utf-8?B?emtTdXluWXRVV0dyb21iT3lGNXZaSUVZdGtMUWhrZEh1eEFuWS84ZEJYVUc2?=
 =?utf-8?B?UmZnNkFTUXluOTlLQVpaYlJBeWtXZVlXV3R2b291VXNFNmZieXFiTTFqTUhQ?=
 =?utf-8?B?MWM4NjJxZHpmM3REM1BEc241b3VzTVAwR1poaFFlOTlBVWx5TC9mc0NwdXMz?=
 =?utf-8?B?NFcwVS9LRnFpZzdDV3hQanhIR055V0xTSkhNbVJ2UXlldVkxNHpKUHd3MGNt?=
 =?utf-8?B?bVZWRDltSEl1d0IweXRJSU5Pc0RoVHBiT2VsVVJmMnBWTXBjb2thSDh3ajh4?=
 =?utf-8?B?a1RwbnUxVjdieG1LVWJTQkVLNDhTbUdLdDNDU3pxelVtbW45NTJDSkpJYTBK?=
 =?utf-8?B?TWsvbGFQdEgvN2ZGL0dQWTRpZzNwamFyTWdpcEUzaWxMclU5R09LTW02OFBx?=
 =?utf-8?B?YmRhamE1MjltT25DL3h4cnhlVzNwWGNOZ0lSWUpuWnhiQTVXTWNZcmlld2Z3?=
 =?utf-8?B?RmlTM2VnRlRuNmtQT05ZdVZUWFV6NEJSZ2hPMnptdW1Ja3JTdHRYNHFyeGRP?=
 =?utf-8?B?TUVNZENJYm51elVrV0lWMmtmZ2JWSFJYRDlJQWV0REF1b3VPcUVhNmU1K0JU?=
 =?utf-8?B?UUdnSkhlSzByWE56anFJeWhRM1FqNXVDVy8rYy9iQUswZ1VqMnNXMEJ6RktG?=
 =?utf-8?B?cUMyRmVlZUM0cGY1bzRHWlcvQkJLUGFzb3NXWHp5QTJySDBFUi9pNE9MaC9P?=
 =?utf-8?B?a2tqRjBYMjR3bWFjQ1FrdnlvSGl2S3NNNE9VZ0I1dVhwSDE5a3lZeDIxU0Ry?=
 =?utf-8?B?Zk5icGhlV3FvSzAzcXRQdVVXclNjbEhTN0ExMnZvTGJ5UzRUcm52MHFRck9D?=
 =?utf-8?B?VFVTQ1BkWG9wK2M0ZTB3ZERRaC9YamtTNUhkcWtlNkh6NTdTRk9USklSVGdN?=
 =?utf-8?B?dW5lbmxqZi9wL2ZTK01SUGt2c2w0bkd0cStmdUNBQlNsMU8wR1FZcGNvRllP?=
 =?utf-8?B?R28ySHFMTVByUWh6akxRL2tKT2dmeDNrWHNWNDhuQVpDVXU2bFlRUnFTNUFG?=
 =?utf-8?B?NUNkT3FDa3pWTThVK1U5VmJwQ0svUEk5U21HSDR0ampHWDFmbGhxUTh2RlBY?=
 =?utf-8?B?VWYzOEJ3SHhiYzVEMk9EOUVVWThkbUl1VlRub3RPNEJ3TG5VRGpKbnFEZUVL?=
 =?utf-8?B?WkwxUEhVc0ZDa3A2M3liVXBGKzZLRW40eTQ3bStQbkN4ZjJ5Ukk3TERXYisr?=
 =?utf-8?Q?NKFw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?a1EvWkFGbTUwbHB0cGRKeCs4ZEtpd2hpT0VpMUJMTHJmbi8xMThWcWFsQ1Zu?=
 =?utf-8?B?NnpmL2xTWVJOc00xdUhucjFZM3g3UkoxTTl1V0RlamxaMXhyejZvTEYxcitz?=
 =?utf-8?B?SU4vZ1ZoWTZpemtnNXVSblV6Umx1c0gySmlxcUVES21lZ3lpbDRhOEsycURu?=
 =?utf-8?B?dXhSb2Y3SkRvb0dTS0hrVVExTndpbHZrYmNLa1gvVmFuLzJzSURLY1pkQ1Iy?=
 =?utf-8?B?eUlzSXMwYU5hNEozaE5uQk40ZU4wRGFLNmlucFc5RUZvQi9lU0k5VkxaaG50?=
 =?utf-8?B?MmVCMUVoQm1mS2tJL2xiTzlRejV2b1NpWlBNc29LVWlMblE3NU9aZXZSSU13?=
 =?utf-8?B?M0dmQ05zN2hvdzNDOGZtY3VUR0hSVFFxYVowU3hQN2RsQXIxNStYTFhPUXFh?=
 =?utf-8?B?VGpUZ2RnOCtiODFLR0ZCOHJjdUZFWHJQMXlwV0lic2hDNEZ6WUJLTGlOTnRU?=
 =?utf-8?B?Z0dtSDVGZU9HVDRFSGJ5K1NyVGhlbzQ5T0I5U2podlpCaUFSM0szRmJhM09r?=
 =?utf-8?B?aHlrRnphTzAxRkZlOUxFZmwvZ016V3VZc3NwWUZNbU5TL3RaWTRsakJVYlcw?=
 =?utf-8?B?dGRZbGJZZm8wM055Wk16NWZqWkZrcS93MHpwQ0ZrTnIyelVWUVhHRWwzN2xn?=
 =?utf-8?B?L0xtczR3V05mallpZnNCeExYdG10QUZCY245Q29iOTVIV0ZubVhUN1FXQUlr?=
 =?utf-8?B?UWphU25LL0J4aXhGSmRINGlEU3BIWVQycjgwZTdrRVZRQ0dQSDU1a0NTSGZF?=
 =?utf-8?B?cmVkamgrUHZPU1hVc3l5SzQ5RncwbzZzV1g4NVpGNlZuZkZjRlUzWjNUMjQx?=
 =?utf-8?B?OUF0RWxLakY3ZG1TM2FnZERJbTZ4ZHcvZUY4eXJObStsaVJ2NnhNaXYvRDlt?=
 =?utf-8?B?TkcvVkRZMTFVQVRuR2dQcHgzSUZJWVdUTDRnalhHREpTWWRGYkZObWNBVmZJ?=
 =?utf-8?B?K0hpMFduSXozaXN1YUJlMkhJNWJWdUFhcXZ4M1Znd2pMQ2lWaisycmNyazJl?=
 =?utf-8?B?UkZIM1RBT3ZDc1VxVzBkcWs4NGlwUU43TnNjNmVhVGZoajh6QmRWWG5Rdjc2?=
 =?utf-8?B?dUcrQnR6TXpDZlJrckppRHZVZ2R5N2xNakU2RnZSNVdoWllXajRHaStqSDhM?=
 =?utf-8?B?KzRrakV4QS9Eb2NOVE1ad3E5NnBab1BRZERVYXlGVXpwZVZiZ0tMaTlURkJh?=
 =?utf-8?B?eGw4MDdzTUhSY3hDUjFDUERUV01OditmQlBSY2Nad214UDJpQVZPVFAxc0Ft?=
 =?utf-8?B?ZGJGaGlQeEwyOHl0eHF1UzVCMUVicVZBZnRPcjdKMXZqNEVQM1VuaWxuYjVY?=
 =?utf-8?B?MHJPSWtCSTlMQTlYWWZkeEd4SWtXZXJsODhReExVWFVaMlNhSHZiZ2l5U0c0?=
 =?utf-8?B?VE4rSU5rUWFSSnI5WkZnODU5b1k5MllLejNlYVZZaGswZ2V3U2p5VDFFM2Fn?=
 =?utf-8?B?aVl3YU1hMTJXcGl5dlVpTGhGVXY2R0JCeGU2SURNMy8xWk8xaHZKR2ZMbkYy?=
 =?utf-8?B?dUNNeEIxbUgvdDlJOXRZNWkvK01UaklLak1Fa0pzeUxmZnUwUEtmM1dNTWdZ?=
 =?utf-8?B?OXZaTmlHVklka05INU5SdkF4NCtIM0RuSXFkMnIrdEtDemx4MXFKK2ZjNFc0?=
 =?utf-8?B?dTlTRTNGN2gyWWtIYndnbHRoQjlDNmlvaVdKMjZiTTk3YzF4a044N2tnYi9J?=
 =?utf-8?B?U3N4amZPaE4wU0Jrcm1zZHNYQWZLaXlnZ0liWVN2NW5sMVRwaGcrR2R1dUtL?=
 =?utf-8?B?NFkzLzZTOHRwQ2Z1Sk5qRjZ3K25YL3R3NDBoWVNQcFpZTEp1WEdiTEhkZ2Zv?=
 =?utf-8?B?bXlBOEdIVHdxRUhPdWdpRUNiUkRjcXg0UVB5d21YRU1JdXUzNjBwdGNmZXdO?=
 =?utf-8?B?QTJIVW9zeXRIYS9oby9YRUhhRDFEdGludVJqQVVqMVlaem5Ld1B1aHJ5aGVQ?=
 =?utf-8?B?U3pHaVNTcTZHQXpJZDVoeHdZRlRUOXlFbDJ3TUFzZ0loTGJZdHVNbGZzS01j?=
 =?utf-8?B?L05IdU93ekRLbk5sM2E3Qi93R0xEVUJYTFFJVnRpMTRxR29xK29UYWwxU0pZ?=
 =?utf-8?B?VU9RMUFETFM4dXdqeU56UUZtck8wUW4xdlBtTjVxWTNjWS95TlFpVWpJRUlk?=
 =?utf-8?B?SEZpeDI3b0Q2U0R4RXRuUmtWSDl2YmZVTlVRWGZvSHhEUnd0aWVVQUhGR3Ns?=
 =?utf-8?B?UjVRa3hZWkRnckJ0amQ4bFBLcCtZcS9OeXRjUG8zWGoyUFVNRkxteC9uKzA3?=
 =?utf-8?B?Q3FZUFVCbVVzWFhUZXpQLzZoNzUveUIwd3dQODRJWEtnTldxYzdhZFBZcG1S?=
 =?utf-8?B?QktYZDlVc1cyUWtpWUFnNlVqLzY4elM1VEl1K2JOVUROaGt5SVNUQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c2387f-5ef5-499c-83b4-08de544229ff
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 14:27:08.3943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uguUFzmLAh+fDrGy9u1SKbIVXS9zwZ+icH5Ho9ebIHUFtVJRIRhdeTdb4GdL2YqF2q8KcoOy0Qi0NSwYRL7pKfIPOXY1bmFPLeVK+/1IUoQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7612
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jan 2026 14:27:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229414

Hi Dmitry,

On 1/15/26 4:24 AM, Dmitry Baryshkov via lists.openembedded.org wrote:
> Mesa 25.3.x dropped support for VDPAU. Commit 88e26a937549 ("mesa:
> upgrade 25.2.5 -> 25.3.1") has dropped most of VDPAU-related items,
> but it didn't drop mesa-vdpau-drivers package (nor did it drop VDPAU
> bits from mesa-dev). Drop those remnants.
> 
> Fixes: 88e26a937549 ("mesa: upgrade 25.2.5 -> 25.3.1")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

