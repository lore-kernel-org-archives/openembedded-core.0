Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9497CCAC5A7
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 09:37:08 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.60])
 by mx.groups.io with SMTP id smtpd.web10.47755.1758533826862070262
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 02:37:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=lK8gufhL;
 spf=pass (domain: cherry.de, ip: 52.101.66.60, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZcunHkHG3ll5nWy/4tWXDG2Vmitzq8zWclSalOgcw+U6towGR/WCG3ystdgYY7O/twVc2K1ORRXGIS3nwYWTplitB9plP0gSEHXAYS34iZ0dXZCax0rky82ewgpq/mL5pZu8MwZ1jX/I++JjDhXa9f1/QCXPSpEGwtUgclLC8kbHG+hh3S8lSdHMlY+I2LDk/FCy5dp1y/pQt8aARTPN3mlVAXZpwAHrRJhDaLH5nvxx7gB6nfPNAojAwep9mTbgplfSvMwoyuB67kRaC4sAmRmlXdLnkz5yYukEQgL6X9mq/YK77GpJtEuRO+1tQiIHFy/e2abjm7EBQHwnS/J8fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RCCdcvtfohPQqVQHjzCr2xck7rOHGa4W484P/kE1gas=;
 b=QTunt3PpU49vXPlKKiN07wWErd4PI9FzSh14WLkMUpZ1iUFldMWyTOaWVCQEk6f67PTLAWc9ULqjHPfkNL8k2mytpQr/sEbQKiKyLUq31EXxREkg0O/Kn0TfLeNOS1G7Z9tb2Y3sqP9eoRwooPzC84RJX9nT/cgM0CJXX/UuoW3SulBGSmLA+hGrTgvP1rNt7+HG/seoIkdysYsb67IjKEbyIbVTMtReb1707ELKNyKuwI3u1q31jWYF7eSLE8DmwN2EtjnDrrodUeYIvhH/xADC8syGD84PfCdSYi++0L8NEPAra1ZuPrrNMxol9b4kxOSD0Cle/cA46GyCtwfocg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RCCdcvtfohPQqVQHjzCr2xck7rOHGa4W484P/kE1gas=;
 b=lK8gufhLwQLK0ExtDi2ELlsFMfbFrgjKVeGv3SixfP3fAEuVFeeYG4vinC195SDrX9gBp//EP3xLWhMufwpWxIHOcW76BsXZom3fTBg43sAsG+uxYyPY4DK/eP5kV2HduLTxCuLX9mbu/Ua0axa11aeA4hWocTDzvvJsczdE38M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU4PR04MB11845.eurprd04.prod.outlook.com (2603:10a6:10:621::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Mon, 22 Sep
 2025 09:37:03 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9160.008; Mon, 22 Sep 2025
 09:37:02 +0000
Message-ID: <f6a19aeb-9a05-4e14-8933-0ab10ec9e569@cherry.de>
Date: Mon, 22 Sep 2025 11:37:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v6 00/14] mesa: lighten up target's libclc
 dependencies and fix panfrost support
To: dmitry.baryshkov@oss.qualcomm.com
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Quentin Schulz <foss@0leil.net>, openembedded-core@lists.openembedded.org,
 Markus Volk <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>,
 Ross Burton <ross.burton@arm.com>,
 Otavio Salvador <otavio.salvador@ossystems.com.br>,
 Khem Raj <raj.khem@gmail.com>
References: <20250822-mesa-libclc-panfrost-v6-0-393cf47e2fa2@cherry.de>
 <DCA05S64WG23.38E7E260MAS7S@bootlin.com>
 <07cd1d3c-4d67-4e60-b3d3-75953784f70f@cherry.de>
 <njiio3x6gcmkr2l66ik2bdcdo5lp65zwc4tdknnredmbtgd6uv@566hczdxilc6>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <njiio3x6gcmkr2l66ik2bdcdo5lp65zwc4tdknnredmbtgd6uv@566hczdxilc6>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: WA1P291CA0009.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::20) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU4PR04MB11845:EE_
X-MS-Office365-Filtering-Correlation-Id: bb4d0e3d-e631-4399-b4cf-08ddf9bb95fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YWlKRUpISlRRM283QUU4S2o3RTJQUHhQRDFlUlgwckVjV2loMUxWb2ExWnBY?=
 =?utf-8?B?cHpRWU92R3Fuc29PSzF5Szc1SU1Rdlc4SVhaQTJYdFNBb1FqUXdaMDgvdEg0?=
 =?utf-8?B?RVpLOUY3UXp0cDY1bGhnRjl4M2wyNWtRVUl4SjdQZ0lreVhVK0VhOG1QcnJK?=
 =?utf-8?B?Y0JNRUltNXI2TWhCdlMyTk9aMkVRZW5kZ3M5K21WREVjUEt2eUFZMmFrZWli?=
 =?utf-8?B?MjBoNVp4SjVrVjV6NVRMVjRsa0tpbHFuVEp5Q2RkeDhscTFlQkl6cVJweXFD?=
 =?utf-8?B?cWtiY3RRRk1GOG9EdlpON2RNV1ExR0pLakhlZ2lTdFFabkJXbVhBakptZ3Rj?=
 =?utf-8?B?S01hZEhudC96cm40a3BjeXZkT3phajYvbFlXM0srRXMzY0tDd05BeitSQkxv?=
 =?utf-8?B?Q3BJWHN2Q1VwUm9aVlE2OHE4SWFUUHd4VWxUamk2Ly8xVFpRMGpEU0d4eDdy?=
 =?utf-8?B?ZUZiM3kxZmkzNEx2VHdGRWplcm9HcWhxZjlaQmMvOThUWnBtbnM1SGo2M3Ir?=
 =?utf-8?B?YmJFRkxVdWlTcndyZUkyS2lKNG1lV0JzbzYxcTNtR3hnUDRhSGpXczVqaXNB?=
 =?utf-8?B?TVJHSW5HN0RWLzFWaCtpdk5OaWs5d0xrMTVobXNRVWwraVozT2lQK2hkSDdz?=
 =?utf-8?B?V3JQZVBHRmVsVWVTQnJBUWpwTDJJMXYrNTMxQ2NsbTJGaUZnQm82M2ZlZWlm?=
 =?utf-8?B?UzdQMzU5S29RMnhFV1ZWa0U5ellnK1hOR2xEUWRidGlNaUpJNEUzRUdOejJr?=
 =?utf-8?B?djZ1QTZET3BVNkF3dlZDTDRZZGQ3ZUxlK0pTbHJ0Rm5VSlNGbWE1b1hBRXZP?=
 =?utf-8?B?SDVaMDY0d1pPcW1HWnlQd1JTRW1jaU8xZkVrelA5U0VhVFRrdDhFY1JTN0xJ?=
 =?utf-8?B?eDdPc1BhN1JGeHA5UG1jMzNEZUhDcG1DYVBwTU5zN2t3ajVGN00xUHpHWXRu?=
 =?utf-8?B?MnBvMERPZVNyNVdpaDZDbkhTUUs4SXNUcUxreExHaUtRVEJ1OUdSVUlFcWxC?=
 =?utf-8?B?RFNYbzBUWG1sTWtSeTllWkVaN2NtWGRCZnlQOUdDdE1CL0N0QXBJNnRlbTJu?=
 =?utf-8?B?cE9jc2k4MmRVRCtYY2laZWRFaVQ5TG9oNllEaWdTNWszNWlVMzRNRUtzY1NF?=
 =?utf-8?B?bDVvZisweVdLazZRNDlCN1dZOE5jcVFhU2dyMG9KcW9UYi9aM3dvaVhSb1FZ?=
 =?utf-8?B?M0s3clJmcFBiL3psYVNuSW13VGp0eTFYZFNnbTB4WU5BUWt2aGJXVFZHQjBQ?=
 =?utf-8?B?dktXVEU5OGEyOXRWN3NEck5XaXRuSjA2ZWdXNmxWZjMvaXJmK0ZCUVJUcUtj?=
 =?utf-8?B?cm9STGxoSjNhVnRCN21LaVFtbjVxVUNLeFpiakh5YkdCbVE0bWlodUlPei85?=
 =?utf-8?B?RU1TOFRWdEliSkVjNGROK3BhNW90K1E5OWsyUzNseDI2VkEvcHFrVVZZemw5?=
 =?utf-8?B?Ym5BVWNubnBYQ0RHU1dGVjNheDBWMU9jcHhSS3pRMThITWVWbzJqUVBSZVpk?=
 =?utf-8?B?TDZadCt6MjBsTFBRRkNRdnZSaUFNeE01Qkt6dEFqZWk2QW5JVWVjTUgvVVpK?=
 =?utf-8?B?OHk2bEJVRW1LcVkyRDlEMExlb1AzMUNSUUc5Z0s3b2o3UEFwc0wvYzhNZ0JW?=
 =?utf-8?B?VTkyb0lCWm1xNVE2WGorV0RMUlJxekwzMWxuUlBrS1R5WGtzVEphaldKRmw3?=
 =?utf-8?B?akdCVGRYMER4cURSbHpEa2ZTd1VnREloc0EvL1VyZ2RZQnJqRDhGRlhkakdM?=
 =?utf-8?B?cFlSZGgrejU2ZWw0TDJ6WHBoaGlqZmxHemhsL3l6bU5KbFRoemhaNEZUNFk3?=
 =?utf-8?Q?vBW40pN4bzNu/QZLS1E5l2bF1U4r8WW0mmql4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UGNMZWtwSk0zZFBmSk9tbjgyNHc3V1J5aDA0QlpBeXBOOWZ0TGZNWXAzbVN6?=
 =?utf-8?B?NDJlWVYrN29WYlQvS21MK2dLSlE1UFovYlRZVzczWENPRU5uTXhwcmNZSS9Q?=
 =?utf-8?B?RjVDY1FXL3U0UkcrNzRVd2YwNCtlOFpHY290Q3hUaGc0a01MaFQzcU1zUzl3?=
 =?utf-8?B?WFV3T1ZVa2pRa0FPY0VJakJjZFFYQjlMejFiU0NxeVJkeFllSmNNZDVVZ3Mr?=
 =?utf-8?B?cERkYjhCM0k1Sm1HSlgxS0dqYktra1d3cVBlODVVSjVmOGIvQjZCekt4RVoy?=
 =?utf-8?B?UlJhZmJsMTVMUUc0NHR1V3Era0I3MEI1VHNiU1UvZXU3KzRNYzJERjMweVd2?=
 =?utf-8?B?dUw1ZkgvT3pzb2hDNzFZcU9wR0tUR2QyZk03aTdJTnhlb3d3ekpCSG5TbjBF?=
 =?utf-8?B?Z1RXYnU1Y2s3YUtFNVgzZVJMa2tmK0hsVWh3bXhQZVVzUWt0dXFLZVBlbXNF?=
 =?utf-8?B?VmdWdUN6SFFEZUdWTzRLM0ZLRFM4SlVMQzdRWGdQZXozVFJwSDZiZHc3VDNO?=
 =?utf-8?B?dngvTUtlSE03TWRVYzZpOXMxclZVbnpwa0R6VTAvZkViWDZadHU5dUR4cWZK?=
 =?utf-8?B?RW5RcTNjSnNvSUtIZ0Y1aFAxbklkcUJxd0QrcDYvVGxXOXZLdGc5ZTdIcWRD?=
 =?utf-8?B?T3BHRmN1UE5CMUtaK29kLzBSci94dHFRUkU5WEhVdVQyek1Wdkl6VmwrSm93?=
 =?utf-8?B?eFVxTDljR1BRMDlDbllJMEpkYXRXNlVUZHNqZGVvM0V2VTBGemV1UFA3SlB0?=
 =?utf-8?B?NGpCK3A0cEJ6Um9TQ1BXZVN1RXowS2N0aDk2a0NQanJEb3hUR1UzeXFaTUtI?=
 =?utf-8?B?YjRCYXBZUHd0aWdQY3FaS2huMjdxRW1QRE4wZ3VMTm1rOWdqTUphNmd1TVB3?=
 =?utf-8?B?eTZYd1pwUFhxTER2bW9TbUg5ckNQWmMrQ3BuYWFsTE1VcWVqVVNHMEhQdkEw?=
 =?utf-8?B?cWpVY0xhOUFYRmNHdFJJT2V6cFN4THpETzdrTDRjRDlPUFVxMFh6M3dpS3ho?=
 =?utf-8?B?VEhoOWkvN092QlY3dnFlbHFWSjBHRXJvLzRSM3B4eEJlQm82OG0ySy9aNmNL?=
 =?utf-8?B?K1FaZWMzb3hCbFZYdklNUGcrdW85cHNYajdsZUNrMXpVdERsN05hRlFMOW1q?=
 =?utf-8?B?U2lIZEJzaUZFQjZlZU5WTzZlbk9SRGlaN2tRR2lJeFI4MGxaZlY1VEk4dTdm?=
 =?utf-8?B?cktpTHBnc0FNYVJOdTFXVEhocy9oVnhpQXVpVk5LdlhMREVFV2YxZ0REUXV6?=
 =?utf-8?B?eStoV21CSk83eDd3SEJxYmZ3R2JVbFc0dUs5MTBtczFWMG9wQmFFc3JFUTYr?=
 =?utf-8?B?UnJIamVUVDQ2ajdFcFlibFZmNFZYZzM1V2pTU0wraHZ5QXlmakFkSURwc0JG?=
 =?utf-8?B?VGRhbEo0ZFpHTjhYdjczM1lRWGNUb3VqTnQ2RC85Q09kUjhtY0VwdVo3cEp4?=
 =?utf-8?B?RlNhTUtrTnF3RUVoYXdFNjdYeVRQNElZbUdpK1JRMTM2OExUQnkxclNBTldS?=
 =?utf-8?B?dkNQUVRiNGFKbGNzYmJYMllvRkJwbjMxK0VBdThNZ1AxTjNJK28vRkJMTnJz?=
 =?utf-8?B?M2E1Yitjd2hYUkVoaTdKMktSQkM5RGowUzVXQkRUMlR3OHUwV09LcjZFR1dZ?=
 =?utf-8?B?Rkg1S3RzNThaeHVPNXFOR3N2eUJidVdOWG9jS0NEY3NiYUwrZDlyTXIrcjlw?=
 =?utf-8?B?a0Y3R0dNWVpqVnV5czl2NTFxam1qR1A5ODFxUjZ6a3ZrbU1iWHFIS1VocW9P?=
 =?utf-8?B?enl2MGlmQjJxK0lReUFSbElmTVVCV0l1NjlhMXJNN2FvS0R3b3hvQjJxSmwx?=
 =?utf-8?B?V3pNVUtOYmhFMDBKRXI3MWlFQy8ycWkvN2N0aEI1QVZZYm44aFZxcVlpTzlV?=
 =?utf-8?B?cng5VG5zdnFCRUFjekpEWTZRMGdSODh0cHZJWnN6UHY3Zk9YWTRuaVU1bTNM?=
 =?utf-8?B?N1NHRnRYMERyeWZIZTAzaStzbmYvUVhFNXlFM2pvdmpFbTFrS2NlSzFHMTlh?=
 =?utf-8?B?Y1M2bzZVMGhocUVGUEl6WTRVRXhVVVMvMEl1MFVCOUR6eU5nZWZhWHpPRGN2?=
 =?utf-8?B?SmQ0NGlPYlA3eW1iaGlteWNHOW5wazFpZ1VNazVUR1pCU09mMGpoam5NTjR5?=
 =?utf-8?B?QXpHTDF2VWVCQnFyQWZjd09WeEcxZEIvdnZGcFAvb1pZaUw4eE9NZVJpajB6?=
 =?utf-8?B?aEE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: bb4d0e3d-e631-4399-b4cf-08ddf9bb95fb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 09:37:02.8924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PP7NHAKrvaA1BXyGP4L0CW+6RBDaz/aIiqZGzNydpG5ZjKRzRl9SD/p9qfwBPIRK5DeKWn4f0N7eHHk97/Mnu0/3yQ+LGS0DkTrOqtzuevU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11845
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 09:37:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223814

Hi Dmitry,

On 9/21/25 3:49 AM, Dmitry Baryshkov via lists.openembedded.org wrote:
> On Mon, Sep 01, 2025 at 04:51:49PM +0200, Quentin Schulz wrote:
>> Hi Mathieu, all,
>>
>> On 8/23/25 8:01 PM, Mathieu Dubois-Briand wrote:
>>> On Fri Aug 22, 2025 at 2:53 PM CEST, Quentin Schulz wrote:
>>>> @Otavio, can I add the new mesa-tools-native recipe under your
>>>> maintainership in meta/conf/distro/include/maintainers.inc, it is after
>>>> all still mesa?
>>>>
>>>> Panfrost support has been broken for a while already because it now
>>>> requires libclc which isn't enforced by default. This fixes this
>>>> oversight.
>>>>
>>>> While re-adding support for panfrost, the build time for libclc were a
>>>> bit too much to my taste and I tried to figure out if we could lighten
>>>> up the dependencies for the target recipe and it seems to be the case.
>>>>
>>>> libclc brings very expensive dependencies such as llvm and clang.
>>>> Building clang and llvm for each target architecture is very expensive,
>>>> but mesa allows to depend on prebuilt host binaries (mesa-clc and
>>>> precomp-compiler). Those are built by mesa as well, but can be compiled
>>>> in mesa-native instead of mesa, making the dependency expensive but only
>>>> once regardless of the number of target architectures to build for.
>>>> Ideally the mesa-clc and precomp-compiler would only be compiled in
>>>> mesa-native if target mesa requires libclc support, however this is not
>>>> possible as a target recipe cannot impact or depend on a native recipe's
>>>> configuration. We thus have two choices, always build libclc in
>>>> mesa-native with its heavy dependencies and impact every build or force
>>>> the user to modify the mesa-native recipe in a custom layer (as a native
>>>> recipe cannot use target's OVERRIDES). The latter is unacceptable so the
>>>> former seems to be the only option. Another big downside is that
>>>> mesa-native currently builds drivers (amd, nouveau, svga) which we may
>>>> have absolutely no interest in building, increasing the build time and
>>>> possibly dependencies list).
>>>>
>>>> A third choice is to spin-off the native mesa recipe with libclc support
>>>> into a new recipe without drivers and only what's necessary to build
>>>> mesa-clc and precomp-compiler binaries.
>>>> This allows to keep a "clean" mesa-native recipe for whoever needs those
>>>> drivers built-in (e.g. for testing, for qemu-native, or whatever else)
>>>> and only bring the libclc dependency when required by the target recipe.
>>>>
>>>> Because libclc is now only built for the host, opencl support now needs
>>>> to explicitly bring libclc and others to build as libclc won't bring it
>>>> in the build environment anymore.
>>>>
>>>> Note that this was essentially only build tested (run tested on RK3588
>>>> with panfrost though).
>>>>
>>>> Note that building gallium-llvm support on big.LITTLE architecture with
>>>> TOOLCHAIN = "gcc" (the default) currently doesn't work as llvm doesn't
>>>> support big.LITTLE architecture in -mcpu/-march which is passed to the
>>>> CFLAGS/CXXFLAGS/LDFLAGS via the TUNE_CCARGS. I haven't investigated
>>>> further than that but that prevents us from building opencl support for
>>>> Rockchip most popular and powerful SoCs right now. One option could be
>>>> to force this recipe to be built with clang toolchain only whenever
>>>> gallium-llvm is specified in PACKAGECONFIG (not tested). Though that may
>>>> be not straightforward seeing the comment in libclc recipe related to
>>>> forcing the toolchain to clang.
>>>> I'm also not sure mesa has a way to specify different args to LLVM-only
>>>> drivers but that could be another option.
>>>>
>>>> Runtime tested on RK3588 and PX30 with kmscube.
>>>> Partially runtime tested on PX30 with opencl-cts (and rusticl; it fails
>>>> after some time but could be kernel related as it starts failing after
>>>> [  968.625506] panfrost ff400000.gpu: gpu sched timeout, js=1, config=0x7b00, status=0x8, head=0xa68d200, tail=0xa68d200, sched_job=0000000019e6f20d
>>>>
>>>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>>>> ---
>>>
>>> Hi Quentin,
>>>
>>> Thanks for the new version.
>>>
>>> It looks like we have a build issue for riscv platforms:
>>>
>>> ERROR: mesa-tools-native-2_25.2.1-r0 do_prepare_recipe_sysroot: The sstate manifest for task 'expat:populate_sysroot' (multilib variant '') could not be found.
>>> The pkgarchs considered were: qemuriscv64, allarch, x86_64_x86_64-nativesdk.
>>> But none of these manifests exists:
>>>       /srv/pokybuild/yocto-worker/qemuriscv64/build/build/tmp/sstate-control/manifest-qemuriscv64-expat.populate_sysroot
>>>       /srv/pokybuild/yocto-worker/qemuriscv64/build/build/tmp/sstate-control/manifest-allarch-expat.populate_sysroot
>>>       /srv/pokybuild/yocto-worker/qemuriscv64/build/build/tmp/sstate-control/manifest-x86_64_x86_64-nativesdk-expat.populate_sysroot
>>>
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/45/builds/379
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/396
>>> https://autobuilder.yoctoproject.org/valkyrie/#/builders/58/builds/362
>>>
>>> Can you have a look at these, please?
>>>
>>
>> Ok so I believe this is because mesa-tools-native uses a different mechanism
>> from other mesa recipes to be a native recipe.
>>
>> mesa-tools-native inherits native + -native in the recipe filename.
>> mesa-gl/mesa simply adds native to BBCLASSEXTEND.
>>
>> The issue I believe is that mesa.inc has a DEPENDS with expat (and zlib) in
>> it. In the case of BBCLASSEXTEND, non-native dependencies are suffixed with
>> -native to be native when building the native recipe. But in the case of
>> inherit native + -native in filename, it doesn't.
>>
>> To validate this, I did a simple
>>
>> DEPENDS:remove = "expat zlib"
>> DEPENDS += "expat-native zlib-native"
> 
> I took a glance. I think it would be more idiomatic to write something
> like:
> 
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index ddcf3b774a37..5a303538d7be 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -41,7 +41,10 @@ do_install:append() {
>     fi
>   }
> 
> -DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native python3-pyyaml-native"
> +DEPENDS = "makedepend-native flex-native bison-native libxml2-native chrpath-replacement-native python3-mako-native gettext-native python3-pyyaml-native"
> +DEPENDS:append:class-target = " expat zlib"
> +DEPENDS:append:class-native = " expat-native zlib-native"
> +DEPENDS:append:class-nativesdk = " nativesdk-expat nativesdk-zlib"
>   EXTRANATIVEPATH += "chrpath-native"
> 
>   inherit meson pkgconfig python3native gettext features_check rust
> 

I would prefer to have a PACKAGECONFIG option for expat and another for 
zlib since it seems from my reading of mesa various meson files that 
both are optional.

But we could start with this to move forward and revisit this later on 
once someone has time and motivation.

What bothers me is that both suggestions rely on the fact that DEPENDS 
will never get a non-native recipe as dependency, which is kind of 
implementing a ticking bomb.

Another option I thought of is to move mesa-tools package from mesa 
recipe to a new mesa-tools recipe and thus make mesa-tools recipe both 
target and native (and likely nativesdk as well). This eliminates the 
need for a new PACKAGECONFIG or fixing DEPENDS like suggested here, but 
this likely involves the user changing PACKAGECONFIG for both mesa-tools 
and mesa recipes to include whatever they need and keeping them in sync 
if they want the tools for the driver they are building. I'm also not 
entirely sure it is possible to build all tools from mesa for drivers 
while not enabling the drivers themselves.

Cheers,
Quentin

