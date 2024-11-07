Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C751D43366
	for <webhook@archiver.kernel.org>; Thu,  7 Nov 2024 14:14:55 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.58])
 by mx.groups.io with SMTP id smtpd.web10.73014.1730988887375829622
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Nov 2024 06:14:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=RZJMyEcj;
 spf=pass (domain: cherry.de, ip: 40.107.22.58, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ACcuj2iOLPF3RliS21CmWhqTg6VmGzi1d8cfwGNWKaV5AdZRVdJV9ZAWAQT63SKM/CR3dlOc9HRZPmGnQx88CbxShRrJ0JMgrTdFZSoIUfR+IqP6eH79yIQBnpZFEJeELHhFclWOd/sjHJl0RDRMv2skoQyOYtCsc2bk4Z1nGvmT68nxl3tEmE9yg4P0wY0R7RTzq1RiaFaG7bq+QkLFNHDkvL1X6sTk3pxHipZ5ptThwm11/mnqRoSbPZ70Nk7jmjiU7HQEGWXmypMdCVNYgMdtVBnAzCiS1ladk5NT7wz3CwO33RH8r2SOPUIzgAADC8gjl5mqxCayesu648Qcjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k5ccaoLucKGeWpqteBVhxb28BeoDYnmvi9vRoCghRdU=;
 b=ber3/8U37RGj69A/BQsrBDgmIkPqBwhMbXz2sV3O8a5fRNLgfz/GgMT1l9/PyDJbBQCr/5Os2xn6KqOoR4WfcuZV83bbG6N8IDDw7AU40bAH2BFhbhyXPuwUUq4AFDCC8IT6JixhD+O/af7nF5r8kNbRM74Dlrw2KeiEBYAf6v5XmMG6s3B9QnssHTXysCClGv2CC5qrubGdIShaUWQY9cm85SnYM6aOmJ3FhpWO6Bs37oszwem/MtONfhVSRXCxwgCrHFglNHTwWN7NRL/Gn42DPIJ9Gxpc5MsYQa1LYgzGPhanLQCwUlpXo26UdM8oFktimzebSeOK1YPZVXQiGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k5ccaoLucKGeWpqteBVhxb28BeoDYnmvi9vRoCghRdU=;
 b=RZJMyEcja/7KakP55cWltfPL6h9kix/nJbE12lySLWs8YNXn55HNIs/rQOvnGXLENjo1wmKkwMgiZjtQ7h/O4M24HhgSChaXK8oVSG1a+Y9a+nIv5UbMuBSiSzzhKMe467uVqJkygTHDyjrFWKhu2buIG5yDpmDvsHS3I48TArM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AM7PR04MB6965.eurprd04.prod.outlook.com (2603:10a6:20b:104::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Thu, 7 Nov
 2024 14:14:43 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8137.019; Thu, 7 Nov 2024
 14:14:43 +0000
Message-ID: <c1ef89d4-0762-4011-b6ff-8027b4a0c367@cherry.de>
Date: Thu, 7 Nov 2024 15:14:42 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] classes-recipe/core-image: drop debug-tweaks
 IMAGE_FEATURE
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
References: <20241107134752.2071720-1-ross.burton@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241107134752.2071720-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AM7PR04MB6965:EE_
X-MS-Office365-Filtering-Correlation-Id: b11b2a1b-c08a-44eb-3bfb-08dcff3686bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?SDVPRFVUM1JQL20wc1ZQQnkzMld4YTZLa3FsS1hwZEVCTGhTQjIxZkhtN3pO?=
 =?utf-8?B?dUdxaWVET2tOK0lNajFIcGwwZmtWZkVxaDZ6MEtRcW1uL2lobU1KQks3SWRk?=
 =?utf-8?B?OENRRXdRRnBrczMzcTVkekJCOGp5SFJoMUYrMk5yUE1ORVB0MTVkWHJhVEgz?=
 =?utf-8?B?S2RSVVVaNnYwVHF5UCtlWFF4ZGtoeWJFdkJ3RGZaZTBJeDI2K1dacFRnNHkw?=
 =?utf-8?B?aGNJL3U3Ykk4d3N1NTdwOHlYSThVeXlocmlnY3JRNURPQ0kvZFVJYllqaUhE?=
 =?utf-8?B?LzZRZzNTUWtDV3V4cmcyVDk4NUlPem5WQm04VnFYejYxUEF4cENuWVlHU1BJ?=
 =?utf-8?B?eDVWNmxEbmFobjJvb1lRMDNEckRhMmVWa1JvaUVWZGVSZ0NvYnZYRFJFd2k2?=
 =?utf-8?B?Y3dkdFcyWW9BTzZ0QndzVnlzQTNObVRKWnphZHU5SzRaSzRvcTJZZDFyQ202?=
 =?utf-8?B?a1MzaGhBVGFGUm1FbUxpdjlUai9CQVp6aWxTbjE0bml0NDZIVkxheTVWOHBj?=
 =?utf-8?B?WnIvZ0hXWFJ3bklpc2dFQTlwL1hxN000bDhEaGlSMjdBMmxSa2lLOUkvMXBk?=
 =?utf-8?B?ZE53M3U4elo4V3BuMlFLRHdFVTVsYytEdG5ZNTlUVmFrcVROa2xNUGZGa1hj?=
 =?utf-8?B?RDFoMzlZd0VlSXJZdFFvZGc2dzUzWlRhbGZKSzk3NFlJZTJvQmEwM2YrSm5z?=
 =?utf-8?B?WjVtTDNzbG12TFFxdTFUYUZIckhhK1ZBeGY5b3RPUVNpM3dvZk5NaDBXbVpZ?=
 =?utf-8?B?MXVEUTF5c3oxa1NtYVZ5azF1L0lwZVJ6NDMvR29jTFhmWGJCMHFZZTZqWHc5?=
 =?utf-8?B?dFdaZGlPRkFiMXFVeHVGbHB1SUtZTU9QUExNMFgrM1Fma2JmdE9sa0tXVFJr?=
 =?utf-8?B?QjdyVnVMZDFONm1vLzRCdWxjZjc5MnRhb2t0aUlGemEzd2x6WVVPTDZDalQ3?=
 =?utf-8?B?OFFZK3hLL1VvTUJxMlpZMGZnQTFKaGg5THBVNVpWT1ZaZjR6TGpzTTQrbk1E?=
 =?utf-8?B?YTR3WjJqMXZMMUF5N2V1Tk1qekR3T2ZnUVpVdStETmF5ZGJrTk8vZnd2QWF1?=
 =?utf-8?B?MjJOak5PL2FJN1dBU0ZZNmZ6eWxTekhCZUVsaUlIMkxsL0RObitPbVBBZy9M?=
 =?utf-8?B?WUFrMVhLYnlXZjNOMHN1cmVkejdINGxDSi9sWVNlNS9tMWxOSUJTVXMwSWRU?=
 =?utf-8?B?NUlEUDU1YS9uR0xYZFh4NWRESFJSVkRSZWFRU04ya3ZXeW1kdjA2akZKMlV4?=
 =?utf-8?B?a1BSN01qOEtVVFMxMG5Yei85Ky9jakpKUGF3dzdwaCttbVlWb0lnTVk5alZK?=
 =?utf-8?B?NTVQQTNIZ1AzOEtYQ0VKVUJTMk1RbjQ3ZTM3eEx1VWpKNy82amdLTi9kWVJy?=
 =?utf-8?B?aFBhYmNiQ2Vub3FkbnoxVzVodkdlL3Zad28waTdIOUtSeURzZnpqbnpNeVZi?=
 =?utf-8?B?M2QwQzNyaWJadzIybmNSb0xDbnNWMlgxbWNVK3Z3NUI5b0RLRkJpK3c3UmJB?=
 =?utf-8?B?RU41NlRULzFON1U2b1cwOXhNR2pmS3BsMTVXa2VEbjRkOXJDOUxTVFlJSi9a?=
 =?utf-8?B?THFJYU5HYm9SYXY5RTA4L29tT0lKTGlIOUJndEdKMTV5ejFrUHlZRDRjc1Jq?=
 =?utf-8?B?bGxVYzF1bkFVTVFVMlFNcmp4N2xnWkhwMzRzdU9nbXQwMk1mVllVV3NFRHMx?=
 =?utf-8?B?NGxTYTN6VVNxWWw5U1VnbDJnVXMxMGhNQlcrTXAvWW8xclpleHA3RjJJU3V2?=
 =?utf-8?Q?VTAm0exDNr4fVHOgD8JYQ/KPw5ZXGHKcnK4e7JI?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Vi85L0VOQ001Sy9kTEdUc0VzbDhOR0tmTnFDWldsUyttMlhHdnR5VmFQRFho?=
 =?utf-8?B?eHFOQkgrL1U0ZGZZMkVZLzhDbFlwZ1JaK01tUUxTQi8rYk5teG13Qm1PY1My?=
 =?utf-8?B?akNrQkhZeUhHQktTMkI1RitUQk5HbEx2UWdVaExzZUw5cnN4VDFtY3UwL01z?=
 =?utf-8?B?TlJDWUozK0RnL3Z2N2YyRTBJZ0ptWUIwRnpaK0NqZXZHZnBWS2ZUbUp5QVAr?=
 =?utf-8?B?ZDVNNVdPWU9rQjV0eHNWQW9HUVJjQXFnVEhBUTdiSkpwbDBRdzNhcVI2WjFQ?=
 =?utf-8?B?ZmFFSFRGckxpNSt6UWV1Q2xjbW1pRytXQkYvZXNVOFZKenhFV0FtV2FNQyty?=
 =?utf-8?B?eGRWUUZCODlBcjBVeXJMeVdaZktrZHVyUTJjZnpFVlRSYUFaenBjQTJrN2dT?=
 =?utf-8?B?UVIvd0lBaXcrSnFvUHBXRnZDcldaQ0cydHhIVDdzTkhwdzhsaVpjMGJQV3o4?=
 =?utf-8?B?WXdHbHhLdTlvOXQ3TlZ0TnptclNGVUlROWxwU2phVURIdnkvL3dhQzZOM1FY?=
 =?utf-8?B?b2JBSGl0U3lET0xiajNWZlR2d01OL1A0Z2hrVmRyN2xOOFRYcnZvSDBvcHhl?=
 =?utf-8?B?NEhyRTVreTlIbVYrdXBPeVAweFpiMVlURkZIcGJWSHQ4a1o2MUdtUWFTSWJ0?=
 =?utf-8?B?eDhLdjNSWUFCdTkvbDg0VXlzcDhGV1BBelk4NmxqQVVOanA2QTlqR0drNU5G?=
 =?utf-8?B?Ri94a0xLaS9TL0ppeE5aVEhjRkhnWSt6OHFvZWtZLytuaHp2Z2p4RHA3NVlH?=
 =?utf-8?B?dnFqc0ovV2N0UWxKQlpoMU12RWlMVVRwc2h1YW9INXowS1RiNkFYWVNhcC9T?=
 =?utf-8?B?c01xa3JyM2FkcTN0TW5uOVdPeTh2b0Z4SnNKUGNoMG9ld3Y2MmdjTFdzSlNz?=
 =?utf-8?B?YVBLMGVlN0MyanF0Q3U1OWNjK0NDcUYwZG1VWGtaY1NzeFNQajBIY3NwMDVX?=
 =?utf-8?B?bjc0ZUdnaFlKWURPTU01V2s1dENOeHZiZ29Scm5uaFY2Q1dGQXQ0aUNNbFVq?=
 =?utf-8?B?OTZ4TFNNKy84bTBPQnl2V1VGVWNFSVNkK25kRy83Q2RpMmVnNGpaU3puVmJ6?=
 =?utf-8?B?R1hkemtFUGxKZlYwWVJmRWtvcWdGcVk3TlRjejFEMFF2dW5NNHFSd0E0cC9h?=
 =?utf-8?B?QU1WUkM5aXJlcHRTMkJDNnc2V2hqR05YSEVhU1pheFdWRUtjUVpWbENxM294?=
 =?utf-8?B?N0JqSlhUdDRHbWw4NXR1aktwRDNqWERIUkVqUDdianEwMTdjYVhWQ0Rzbm94?=
 =?utf-8?B?aXc5Y254QWxnYkxoWkJCSy8zV0JVcVIrbmlnbTBqT2pmYzErTmZMTFl2ZEo5?=
 =?utf-8?B?Tlc2bDNEWkN0YzBJaGtsMUJrdGJ3M1VXcjRqNWN3OXNSYzdYRTk4UWtaa1JE?=
 =?utf-8?B?VWNYQUpPcVp3KzNvS2xoQXJnMTdJUDNNOGRGak5CV0dqd0FMWHJmRklndkli?=
 =?utf-8?B?RWlYUFNwOGRkTmtkRmo0aWFKMmw1TTRSdmxuTWluUzh1aTRCTDN0RHFJT0dZ?=
 =?utf-8?B?MXNrT0JSNDRqZ1VDajBMZFhMZTFOWXhnenVXL1VwWmphd3dvNFVMV25WRFVS?=
 =?utf-8?B?cDVGOFlZeXhQUnpETndYeGNXV2pOcXZaZlJjQlp2dUJXclpramxmOU0yc21a?=
 =?utf-8?B?cVhCWHpsMW5ZbGxJcS8wanBQb0Z5T3JiNVRXK1JJbTN3Nyt3bmpRN1dvb3Jt?=
 =?utf-8?B?MmpqWnQ2WFlCTUJ5UEV4TWFTVGZSaXUwaVlXcG8rRERwK1VWOTMyWit5bEM1?=
 =?utf-8?B?YVFJdWVmbW5zU3BGQW4wNDRxUXlLQWlFN3ROZHJ6RVRLTW12bC9TS1Q5aGkz?=
 =?utf-8?B?UGs1azZPM2krOGFHMVJEeU1HU1k0L1duZUF1Kzd4OEE4WkNnbkI2aTlYdG04?=
 =?utf-8?B?bmsxajBNYXozTlprODFZNkk1dGFPSzh1cm1KcjhVb2hXd2lRa2pKWGlyZXJa?=
 =?utf-8?B?b2wreTF2SWN4WlR6bDFxdkZuelV2YzlsNlJaZ08yVThTTnBkZ084Zk5FRkc1?=
 =?utf-8?B?SHVRZmh4R20vTGNTV24wWUE5TkorVjNVSVNBZGo3VGxEUnU4bktvZ3VCTWpP?=
 =?utf-8?B?OVB3MlF6R1lrYWJoYXpxVkhXbUo0VFlUd2dNWmg5WHp6aHhoNTVoVE9EOWlS?=
 =?utf-8?B?NnNNS3QxeU1zS3BLMDNTK25ja05Bb2tGRWVuRTRMV01ZTWpLa0xjMzNjRVA3?=
 =?utf-8?B?eWc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b11b2a1b-c08a-44eb-3bfb-08dcff3686bd
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 14:14:43.6745
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ygEdk6IkGM5S9GEuBTElwUYuiykeHvMKiHTXBSCJeQllnOquS2rBu2Nki6a9cIiDKoTpm+MtJe4HOQX9jfXg58HFD8uMLjKWg+srIJxkvWs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6965
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Nov 2024 14:14:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206834

Hi Ross,

On 11/7/24 2:47 PM, Ross Burton via lists.openembedded.org wrote:
> Remove the 'debug-tweaks' IMAGE_FEATURE. It sounds friendly and kind to
> developers, but it results primarily in an image which root can login
> remotely without a password.  This is incredibly useful for local
> development and testing purposes, but we really want to be explicit that
> this is what is happening instead of hiding it behind a vague "debug
> tweaks" statement.
> 
> To preserve the eixsting behaviour, debug-tweaks should be replaced with

s/eixsting/existing/

> these features:
> 
>    allow-empty-password empty-root-password allow-root-login post-install-logging
> 

Sounds like a good idea! More explicit, more betterererer!

Can I request you at least notify the docs people when this gets merged 
so the community/maintainer can update the docs for that?

Or even better, sending a patch for it :) ?

Cheers,
Quentin

