Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFDE5D0C5EB
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 08:47:26 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.88])
 by mx.groups.io with SMTP id smtpd.web10.7614.1729846043505679977
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 01:47:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=K+jVMBgW;
 spf=pass (domain: cherry.de, ip: 40.107.247.88, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E3q6+UHWJLEvfB9qzjSrjSAuz4IR1A4+g1u4XaINEc0dEentLu4czNTY93wa/dY4PQR3FiGUH9ZKrykOpoB+mNP8/WjRVxc/E4xQrW0McegV6VTRK4HwpOjR5Bwe5P9uMD7Qjw+3N6OEo8uzpiosJB0hx9E1WRLlpjFYVwoonoTkET1PR8LC1PCMQ4m109af3eiPdQ2hlPEEhx6o69k79UVVCXmoiC1NBYgTp8XgAD+VMoJ+Wcn4T1ee0WG8+npUw8ToSV/ML28RUQVYFpGqluoWcqJh1H4WFXG6PWf8/iIyjJ56eCX7lX2MEc+hqfxVjzCYxr5o6Ywxsn0XLI5AmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78VprFWcOFmuOsm0d9g1LaJXklGLZsk5gYkYZ8mquKU=;
 b=wJyqDAtRXUHGhqn0xTiwVipcgjPckroluOXU5bzfusEsKY5CmmNIxBqm5Yeekv3lkmozvay6Sp7Xvs8aHRjaFdsa4iTzLFjaaJdjlXEDvZOfAYeJSJLaN1VH9h35e0noFp/Fpf5b/qGJiI9rLJUbVQZ+8IhOMyURbxF5BJWODpNi1E9u4TArzFzDFc0KZz6XQP8BSnLVMcLUrsqcCb6QmsY/FWRW+0a1fTIAvZNgfrlDR1Ttr35N8CECG5FVlVX1WGaKyARn9lPmKe1cEtLpaxXFUW0Rduznm7cE1xqMwU6MVv1wd7fJ9uDbbS+P9qUYC9MBdiufU1B41aLiPai+dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78VprFWcOFmuOsm0d9g1LaJXklGLZsk5gYkYZ8mquKU=;
 b=K+jVMBgW28hviBMJumHGDuTznEwubidx0tKtkLcgmQ0VHLjRsS107NRXkH10z0bCtGsDnq0Psr8rd9XX5te8Yl5qFqq0QjBSYQZRXQHPv9zht7N1A5Rq4kd6Zkyan6Vd8KgLy9OGCZKteOC0m9AB8pNu0T8EdD96CIa0NwT3gio=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB8473.eurprd04.prod.outlook.com (2603:10a6:102:1dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Fri, 25 Oct
 2024 08:47:19 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8093.021; Fri, 25 Oct 2024
 08:47:19 +0000
Message-ID: <e496e639-2061-499f-966f-eaff6421d62f@cherry.de>
Date: Fri, 25 Oct 2024 10:47:18 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] linux-firmware: Add
 qcom-qcm6490-{audio,compute} firmware packages
To: quic_vpuar@quicinc.com, openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org
References: <1800D628AEFC88B9.4900@lists.openembedded.org>
 <de14a6e6-6f61-46bc-84fe-c8c198cbc857@quicinc.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <de14a6e6-6f61-46bc-84fe-c8c198cbc857@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P190CA0001.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::14) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB8473:EE_
X-MS-Office365-Filtering-Correlation-Id: 052248cc-cbc7-4244-303e-08dcf4d1a2c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SFhtUnpUZ1ByMmlHRWVST1AxeFV6cWhoMVZoMjlzTzVmZCthQzBwaHY2VFlT?=
 =?utf-8?B?L3JxbUVVblZjUmlLM2t4TE9Wc3ozeURBOWQyVzJBejUwa3BsejlUcUlwOUVZ?=
 =?utf-8?B?TW9EUjJXelJMdzJWNTlTU2U3T2Fjbkl4RVM4S1NTVVJSbW1vNE9yYjVlaWJG?=
 =?utf-8?B?cG5EUEcweUdhUExKZ0I1L01jcGs4NmEyTjlvbStYTExzR3V3c0VFSC92bWxh?=
 =?utf-8?B?MnBXdWtBQm9WRWtEeFlvWGRabC9ZRjFtd2YvQzhTdlN1dTF3R1ZNelhUUlVv?=
 =?utf-8?B?bHcxUXJQM1kxQy95UVJtS2pEZmZPQzZNTjJmK1hZTmQ2Um9IOTYvdlZWWWJL?=
 =?utf-8?B?L3NSbkhLUnY5aEhEdFFRSUtaWnpzWnRsS3JTckNhTzZZSjFoOXQyUDhWVDZu?=
 =?utf-8?B?a1BTcE13UHJlajQ2bXpHNzVTbDRYWk10bnY1b1IxNk9hSkJic3JJR2pvckVs?=
 =?utf-8?B?YmtWM0gra0pNQ1V2RjRMakNNeWdFa1dWbVhXZit6RzBDdm1rM0twK2xteURw?=
 =?utf-8?B?QlVCdzBtTGdsdzZRbFhUOTlCNm1GeEVMUm16OXBtWE9iNXZXcG1LbHhvRVE2?=
 =?utf-8?B?S2JxalBkUDBKQVF3WHZOMlpCVnM3TXFVd1lJNG8wRWphT2VjenlCYk9tTDlG?=
 =?utf-8?B?VERnNkhFNnl1S3pZUXpKb0NKTzA0Wk9aS2lEOTMweDh3UmN0V20rcnZzT3FM?=
 =?utf-8?B?MEJ1V2NFUmZyN1NHMnZpT3NjVXJJSnRaQ082U3g4d2R5TVhkdFN2bHVZMHBj?=
 =?utf-8?B?TEo3Uk8rTjBuTnFVM2Z4bkk0ZlVuSFZuQk56dGdHaElkbHdmVDY5MFJvZ3Vz?=
 =?utf-8?B?bldMazlwaFJSaHpPbG0ycFJuYzR0OFNLZkVqb0RzZExzS1pRTzJtZTBKNG1t?=
 =?utf-8?B?TG1jRGdnTHpxQ05sWFdDeTRILzhSakV2cVRXanpQVVNqOWpweVBYY1c0QVZK?=
 =?utf-8?B?S2NYTUwyY0d3ZXFqVHJscTRadXlrR2o0SGRud084WVRnRTNDSTcxVnhTRERC?=
 =?utf-8?B?MVptMXFjMEpjaUhQUzRmaVlDR3EvSC9zay9Xbm81dmgrYUFkUkcyZkltNFR4?=
 =?utf-8?B?ZHE3cTlZcytqbEV6NExXMkJJUVRKQ1BFZFVtOW11RzlVMnZodEZhd29oNnR0?=
 =?utf-8?B?eU4wWWtleUlaeEp4dU5xdHZyRlFBMGhrVjNqTFludFUweTJVSVFuYjVkN21M?=
 =?utf-8?B?RUp3SVZpSFRQdGNHSUN4QlNqSjE3ZTFLS1pVQ3BTTnRRV2ltc2ZucFpCWHY2?=
 =?utf-8?B?aGhjd2oxbWxkcWF5c1dlY2E5dFRtM0taRmFyTkMvTDFxUE51RzlEUk5wOFIv?=
 =?utf-8?B?TGZCVmtOL3YxdmhVeW9QUFpRZG9QRk1acTlKUHRHeVRycWhaOUJ1L1BXcjhQ?=
 =?utf-8?B?ZjJwbXRHVXZ0cUdVQUo4bTVaL1VBN254WDNQNVRHWnZVdHVHMk52WUh5VU1C?=
 =?utf-8?B?UnRVNXlsb1JnODdEUElhYzNteHVkL0lEcTF1N08xMldac2dRb1AzL1A0NDRs?=
 =?utf-8?B?S20xMFVoOHF3ZlREVE82RmJKNURVK3lvRzlNVFpaLzFFR25LdCtIWGMzTVF0?=
 =?utf-8?B?RE1YTmc4M3p2dCtJa1liR1BRSTlmakhJUFdVMWtZQUUwNkhXR3ZkWWlDMm1s?=
 =?utf-8?B?ZHg5dDVia2x2Q1NTc3IzbWRyV21ZYWVNNlROcE05R0tHMmorc0FONnRlK0E5?=
 =?utf-8?B?VEk0bjJPZDdvemsvV3lzS2lXVjFQeFhpZngvbysyK2R0Q1RrQjhKb0pHMGlm?=
 =?utf-8?Q?AnUxo4nCLakiJHF7rr1ns/eV5Awii9QyZyZ5NN1?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cTR1UmIyN3IvRUVFL284SVlRZTFkNmQxQlVRMnpWbkxCOEFZa1UvMXEzbTFa?=
 =?utf-8?B?QkNkOFdwbzltU0RZMzMya3Bjb3gxOU1YR2ZlNzN5VTFOZXZaUUgxeUZCNmtv?=
 =?utf-8?B?TDZ2aTZLak5ESzRDQVJ0MVBPdDZWTUJKdytPWUM1QVV4aFNvS1M3RHF0b1l1?=
 =?utf-8?B?aFBhSnc0OEZIdUV3NnNiSFR2M0o2TitBK1I2MjR5VGM0VzBiWTRDbDJLb213?=
 =?utf-8?B?Y1hYNTFxUHpldCs4TkxsakJUSjYzTWw0OVJtMFZVMXBPZGU5VHlaNmg2ZW9P?=
 =?utf-8?B?TDh5bTRvdHNnMllwSTJFRGt2dzVzODhDbG9lOS94Rm9aWU1LeVRic2xpSjJE?=
 =?utf-8?B?YzBMNWNlRHozVEJDOFlDbWUwZEdWNEFBWUJNV2thclZlUStnMkwxbW5zRDZx?=
 =?utf-8?B?SGRQU3VtM2NoK1NIMmNyTTQyeWY2dk0xQmVkUmhxSng0R0poc0R0ekRRb25h?=
 =?utf-8?B?Uml1QXVYV281cHF2Rk1xQnFtbnFTU0xyWm1wNEY5ZVoreEU3R3JFbUl4VVF1?=
 =?utf-8?B?MFVnSVc3Zlk3TDRXc1J4Mm1vblUzN2xTSkp6TDJlKzNoVkxJN1pqN3dGTmhM?=
 =?utf-8?B?YzZzRnRkdFQ1VHNFUjR4YmF3NTlwYjNKZDRDZnRRVDVSeHY2TmZqblFSMWpN?=
 =?utf-8?B?djdPV0dOVzdKdGZ0TW53bGw0cmNiejhjOUlWY1phdHVieDgybTlhVGJmOHBR?=
 =?utf-8?B?NjdiWk1sVEppM3d1Zzk5MkVEWitXV1JYd1lIcFJjS2ZhejZnMWQ0bG0zQzk2?=
 =?utf-8?B?MzJlVGh2TWNhZ2tPclZoU2NjeWVzbHFIcUsvbFlJbis2VGlKRlo1Zk5QNmpv?=
 =?utf-8?B?a3BKbThoKzBhaCtKdjNXRXRGVG1MeU93YzE5VGRTUWM1NUwrbk14eWVwSTFO?=
 =?utf-8?B?SmhNSEFYQ1hsamxBN0dUTWhWRmM0clZCTERjdWIwKzRlV3kvMFNNQlFVYSsv?=
 =?utf-8?B?N1NIL1V1TEh6dHVRU09aK21jSXMzNTdmTmwrWlRxWkdsZmVvd2ZCMFJHUkJQ?=
 =?utf-8?B?bnZXUTBOSEZwc0M4bHhza0JBZXFXSDBvMUZsRXl1N0hFZEFNM1JzNWNhTDUy?=
 =?utf-8?B?aEI2WXp6d3NJOWg4eWpGMVloVXJuNTBXWFNyVG4vKzIzdjRMN08wU1JzMWN0?=
 =?utf-8?B?N0RHSjBVYytKNjlGeUFpSjFaQ2daUjJobFU4N2EvVUw0WFRQV0JHeEJrTFFG?=
 =?utf-8?B?SVZMOENXcElzcG0vZ1BDMnlaamNXOGh0ZDVaTzBkWVRJUWtaVFBVUHlUbVR2?=
 =?utf-8?B?YThmL2VPL0YvZWVZanBmdU5teW1jUjY4OEtzSFZnWHlWVkk2L2d4YTA1ZmxG?=
 =?utf-8?B?QllCeVVFTTBnVnp6dGZ5MDN6OWMvaTl3dFJtTGNWYmZsL2tobG5TUXo0M2ky?=
 =?utf-8?B?eEFqUEpwaGtUOHRJeWVpWXZjTlNHTzFoMDZVQXJGU3N0TXpNNDJORTM4UkJX?=
 =?utf-8?B?U2c4QkdqcDhyNVBSKzVlT0xZVXQ1OWp2c0hvcXNrS21HRHd0RGNacjhRamZs?=
 =?utf-8?B?d0tHdWlQOE9FQ01wb3k4cFE2eDE5bmtiRGF4a3VmNGlZdDl4d3hUUXFvaVFB?=
 =?utf-8?B?dFZETFdQMURkSXUxL0U2WG1tR0RVVDU0UnROL0dTZFhtR0tYVGhhS3hQTHFD?=
 =?utf-8?B?OHRLd1BiUGVjeFpKMXEzb0NUYVNJaFpZenBoSTF0RjdpZzZWS1RYdWxaZGNW?=
 =?utf-8?B?U2xWVUdpR3hxVCtoTGhyL1hnbDF1eG1FU1V3SDFkUlkxWk5VM2wyTWNPcGE3?=
 =?utf-8?B?NVV3LzFYV213NGdGblN4RWJ6MEZZejJ5eHEwdTNKK0VsOWlLZmV2N3F3TE9H?=
 =?utf-8?B?bWMyMFlGN1pSQXc5KzJhMit2Y2Z1Z1V0VndQcTZ4TEhJNzJwMlRKZXY5dThK?=
 =?utf-8?B?QXdBQklXQmRXVHgrbndmcGppTE8wYnNYRDFRVTJ0c0NqaUx6N0ZCcmEzSmI0?=
 =?utf-8?B?My96SEo2RWJudVQ5Z1JNZWMwMHlGSVMzeDJuc1l3MFN0YlZRNGlFZk9waFVP?=
 =?utf-8?B?M0NzdXQ1a21wR3NUZ0FmMExFWmlBd0Qrb3hsQ2pGZG11OWl5azR4VVltWnlO?=
 =?utf-8?B?WkpVZ3VsK0hwQUd5SVBSQVJSNDZSWUlyOHVtNDBQTEgrMUlLSS9tRk95ZGlm?=
 =?utf-8?B?Zy92d1FVR1dqS3EwelpCNmNuektITzQ2VkhKM081RERFdlFweXc0c1dwU2o3?=
 =?utf-8?B?elE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 052248cc-cbc7-4244-303e-08dcf4d1a2c3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 08:47:19.8015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4IMuzEt2XyzeDmu4t8V9AnVuCHfm3VSEkiZLiY/tnrDI3IMsFggTyyncdLz89KZ2ZcDdt+5PGn+iTOtflMwSFLgKt+7CRFc3nR7luwLQlWo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8473
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 08:47:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206340

Hi Vivek,

On 10/25/24 8:20 AM, Vivek Puar via lists.openembedded.org wrote:
> Hi Richard,
> 
> Can you please review this?
> 

Please be patient, you literally gave the community one working day (on 
European timezone) to review this. It's a bit fast to ping people, 
especially on non-critical pieces of code like this one (non-critical 
because this could be done in your own layer via a bbappend until it 
gets merged upstream).

Cheers,
Quentin

