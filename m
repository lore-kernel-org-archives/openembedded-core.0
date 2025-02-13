Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DAD7C0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 12:45:41 +0000 (UTC)
Received: from AS8PR03CU001.outbound.protection.outlook.com (AS8PR03CU001.outbound.protection.outlook.com [52.101.71.130])
 by mx.groups.io with SMTP id smtpd.web10.10238.1739450738332174980
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 04:45:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.com header.s=selector2 header.b=zaIikU8/;
 spf=pass (domain: weidmueller.com, ip: 52.101.71.130, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gFJlrhQ5oYQXcN/FdMEAxbnpaxqA74sjJs7UD/u0auRPp8ItBAoujHVrFcUF7GzF1dFMRygvkWEdoHUrnkaDQcTzzu+qjNUcodTXExpiir/oGJqf1tmZ8U2zQruKGlIYggjj+lP3eFzccch/VXxbQXHLQpqg8+cbqMUu6FAhZWvLHZ28TWynkJYlLsvS+YuqjOJETD7/lyx/KFs5J9YBL2I17v5QoyXwa+oKbXX6Ps5bNtmoz4O3TrSoHTNjosyuOhqn5Hr83drk8Am75uA0Y6pNbXaOW6sGa4XKagtfR3faohCqrMEEN7YAaMC/KuYNA01FlEeY8/b6lKvCKf1w5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V6Zh1YvUbsAISYrSBy/6C91rcSMi7g7HLP0HuyhYsDI=;
 b=Q6UnSC/rATmamoG0inOh6bufSdVvjMZmAbpdoIw+IkTTsvpLfnaAxCQEqg6GXEX1QlVm2EzSTMRumXOAg6AKOL4CSrZKVcX5ka2+IKjFJQviNyGEm9WxsY5J9LGHKde6+974uUwBtHPyT/aH3Dy4UX/o3Ys/bTHp/2TGrowWOQccl2SQsNVeiLlcMKwz0OUAwoy7JRd19vCO7leQGaS5NGpm6fcc9UbFAZmexZwrgCOKHX4NvUZn8PGhTLjUoK+6JvHfWnzfkVcDgjAFQyAeTaTUJM+mcm1HFi37UhAP/8C2E6x4//GhplEZHao7cR09vBvhLv3aVvEYDf6a1oMUEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V6Zh1YvUbsAISYrSBy/6C91rcSMi7g7HLP0HuyhYsDI=;
 b=zaIikU8/7/T4BxRcpHmtF8zsnqQahg+7Q6SixcCwuU6pfxayOZ5dGocj83eX/iROUVz9STSg/hlrbevV+9KDn5CoNhY+NlwOV1UkFA7PTg3ha3SndKhUHTjRTy5frlaf1aq9UHfiUi0Lvwjqr9bM6bDBzKjY3266sH49LwbUVVo+S1DADdUBK9yZHKoQdNPIeqmYDxMTvs24J0H9oqTuem+K24n5K/k6Oo2F2gOtGEF6dIQfS7tIRrQF0e93TlC7/tHTFAJYwmNz69Zy7BKaV1pWEyk8yDBIFw0wQzzOHD9f6ZSO/uCZsOqgtRPv+3IEZoXETgLIFEwyMGrcRAHq5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by PR3PR08MB5690.eurprd08.prod.outlook.com (2603:10a6:102:86::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 12:45:35 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Thu, 13 Feb 2025
 12:45:34 +0000
Content-Type: multipart/alternative;
 boundary="------------vOgSSo1RdpjjH4QhV7l6fpzs"
Message-ID: <ee106ec7-e74c-4c7d-b233-17f8dc0719f9@weidmueller.com>
Date: Thu, 13 Feb 2025 13:45:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH 21/30] python3-bcrypt: mirgrate to vendor
 cargo class
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20250211150034.18696-21-stefan.herbrechtsmeier-oss@weidmueller.com>
 <d933e37f2be3e98c72f99191b504efe607d50c96.camel@linuxfoundation.org>
 <f2a970ab-14da-4108-a050-04851a7bd480@weidmueller.com>
 <CADkTA4MZozK1oBwM6-=FShj2N-kke4w9=FDkTrd668XkvjsTbw@mail.gmail.com>
 <7848a428-7193-4597-9b85-84e7dd4d3b32@weidmueller.com>
 <CADkTA4MtM9ZbakC-u0Qk8bQjcOk6uYuYYhFagWR3fmNqC7gWrw@mail.gmail.com>
Content-Language: en-US
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <CADkTA4MtM9ZbakC-u0Qk8bQjcOk6uYuYYhFagWR3fmNqC7gWrw@mail.gmail.com>
X-ClientProxiedBy: FR4P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::9) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|PR3PR08MB5690:EE_
X-MS-Office365-Filtering-Correlation-Id: 240dfd32-326a-4514-3a48-08dd4c2c4f1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZFVBZFczRWxNeWMxYThib0xSenEzUEF5azl1bFRvM29SZlk4ZGcwTDUrcU4r?=
 =?utf-8?B?cVNQL2Y0OVdDSXZLRjZRc0dRZDRYeFBGeVRMZ1FhTDZUdGpHbWZ2SEc3WEJV?=
 =?utf-8?B?L2tsUTYwVGc3aWN3dmYwVkNVaGtUQVZ2RU1mRTZrSlVkOVgrNXIzd0VyK3BS?=
 =?utf-8?B?UVI1L2RLM0RVbmZXUGpFdWtsTGE0SFNPRUNNVndhMHR5Vlh5Vmo4ckZYM3JE?=
 =?utf-8?B?Q0VkVTY3aklLVG16VEtIUDhFL1p2dGZrSUw2UmdkZXhMMG1ZSkxhT1ZudHBL?=
 =?utf-8?B?YnFuRnJ5NmxGYkNPSDBmTHJ0WFNieVMyWldpS1gvVGsweEk2MUpROUVOaWpQ?=
 =?utf-8?B?dlN3RTZrek1td250RnJISGFiUXlGbWhQVHMvQXhtcXRuMmIwQ0NxSGQ2Ti9F?=
 =?utf-8?B?aTR2Y3pubndzNEoyOVZKcmhyc2lwVk5pSWZZK3Z5STRvdldsV3BOUEU4UWdv?=
 =?utf-8?B?aGJ3OUw0ZzR2TllwempmUHBVZ3RxZ20yUkkwY2tyVFY4cWI2V3dkKzRIQk5I?=
 =?utf-8?B?eTZ3L2YvUUsydnptMjJBdmFFaEJESExJMTFuVlRIM0RJVVc5N2ZlVnAycVdT?=
 =?utf-8?B?RGV6RUx5cFRMeG0vUWI5cHNrWGhDd25oL3VpOThxc1NDVTVOMnZMRmp2c2dn?=
 =?utf-8?B?b1MrRXJWcTlHc3d3dmFMdXRwKytTbWdFSFBSM0VoUjAzVm43ckd0cm9YYUlG?=
 =?utf-8?B?VGhyVC9TZCs5VzVqbFgveTZtcHRCKzRFUS9rbkJTdHY3K0FYTDJqNEIvL2R6?=
 =?utf-8?B?bEtCcTBHMlc5VHJ6WlBVc3Axd3plUEdBREw5R0tVQlp6UElTMnJsN2x4ZGhP?=
 =?utf-8?B?RUlHaHdXTnVxUEwxZjB6UjFlMjh5WUw2N3BUaGx1bDJSanRYS1dEcWRDcFVC?=
 =?utf-8?B?OHlveWZvNHl2dkkvYjIxY1BQTUVMUTdUSlZJZFY5VlFxQkthMEtwL3orSDJO?=
 =?utf-8?B?U0NMWUNPR2gzZlhiRGg1VzUxWmt0anE5Uit6MjM0dU5NaXA4Qjc2NGZ1NGxF?=
 =?utf-8?B?cDFjNTFLd290eExnbXpGQncya3c4NFRzZGQyK3ltR2FFZHozZU1pc08xejRu?=
 =?utf-8?B?YkllakZocHRTY093NXUxVU1aN2U4S3BSZENrL0NSRVJtN0xFbmZJTUNOQ2JG?=
 =?utf-8?B?OWRsMER2QWdDdGFBWmt6dEFvOWczakJMTG14cVFFWFpsSGRqem1XbHNFdXo5?=
 =?utf-8?B?OXZnVkdmRHVhV1I0cTlqTWU0UTdPRHZPQndtM0cvWUhHMWRjSk82bktMVUlL?=
 =?utf-8?B?cmYwSS9pR1d1ampqeUVvQ3pwN3NydTZHb3I3TjdmSFh3SFcyUmJCcFBZL0t3?=
 =?utf-8?B?TlY4VXl6a0VSV3JFUy9wcEU4WUNPN1JZeHhmelg0K2x5Y1FzUVVrdFdBY3hs?=
 =?utf-8?B?aDJiQnUwREhzZnFqRC9VcmdTcGxYVjJmeERQOFB4QUtZWXZnRlNPRmpXWGFU?=
 =?utf-8?B?VkJHRlpRdXkvRTRwN1oveitLWlUrWlhpTU01Y21jc2psNFdiUkY5UmRvVkpW?=
 =?utf-8?B?S1hORG14QkhuU1crU0FiZDErbVFUVDZwL2IwVW5SZHR2azdSMTBaTU5kcEZo?=
 =?utf-8?B?YWo5WThhdWd6U09ORmFoZzVBMmZMWVhaSXRYWTBDbzZaZmREeUtvT053ODZO?=
 =?utf-8?B?OWdGbDZwQ2xMSW1jS2VXL0I0clk3OVhWcWtmUExPNDNOMkF1MGJIZHlMNm9Y?=
 =?utf-8?B?WVRiZjFkTG9ZSWpSd2ZkTVBhZGhKSmZtcG5saUhBVHIzamRvSkxub2t6UnhT?=
 =?utf-8?Q?AUfw4S/t6NfM0EHdJQO4aH771qnoLGTbVvyu+2J?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(13003099007)(8096899003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZFQ5R3UwNVl2Slp0SUl0dlFRUEFLc2swbUFDa2x0aU1OWUlCRDlTcmhqN3hF?=
 =?utf-8?B?c3ZJZ2NmVFhvbzhsS251bmxvVVJsV2VuOWJRZFo4N29aVmg4SEhRbE1waUc1?=
 =?utf-8?B?MjR2a2FTNUVwaW45VFpheEMydUw4UkhXU3hVK3hSNitrWE0wZFI5QVRCM3Bi?=
 =?utf-8?B?VEFvMUtQOWRsVlMvWmRyMTYvVlVYcnEvL2lCM1VRYllabGwzMWRvTU5icFlI?=
 =?utf-8?B?RkVzaXo3UkpLT2NxSmVwYnRmc3hKOXVwWnE4b2lMZElUSHBlTjN6eG53am9G?=
 =?utf-8?B?QzZJVUp0SFR2NkJTL3hVWCtRR2h4OG1RYUwrK3VyQk9LdWtMUkVsT0crai9s?=
 =?utf-8?B?R3R3c1QrZUliOWhmazBYWDlMak9tN1BBNDRVL281eFc1L2NpWFNrekN4SjBY?=
 =?utf-8?B?MExyODgwTS9nQUpYTmRLblJJbjJOaTczVWJEV3YraGdqZGMrQUIyLzJHWmhN?=
 =?utf-8?B?aXdBSFhMSkVaUTVpWCtRRW5YcmFGallDRE1ySk5HT05kN0I1ODdYQXdQenA0?=
 =?utf-8?B?bi9objgydXZUVlVRY1YwM1hIVWljelFldUFOM3FvVlpXOVBrdE9DUVo0aVBG?=
 =?utf-8?B?eGhaMFpnSUV3VnVpd0txYU41b3oybjRxbmh3anhsMklUSlRhZGZDSDhTZm5H?=
 =?utf-8?B?Wm82VE8yU0ZwQ0h2bFlpRmRidklzeVFTMzdZQnpjMW1Vd3ROdlpJVFE2RDJk?=
 =?utf-8?B?d1J3c09Dc1VUWU9EK1J3aUFGYXcwWmZFaHRwdWZXVERmVGVCUUNodjFCV2do?=
 =?utf-8?B?VGtIcDUrOHhwM2s5N0VLWkdOZTlHV3ZuRjkvSlMvNEhsRHBEdnd6VjAya25G?=
 =?utf-8?B?b0ltWVRXRSt3ak02UjFadEdYUWxKYjZxa3krdDhSakZLWkRyMENlSU11djVN?=
 =?utf-8?B?U2lkRkJyU2VnWExzY1RNeEF0eU5Rdi91dk9La2lnUWVoYjNxV1VyMk42QU9S?=
 =?utf-8?B?cjl6SW9aL3M0N2NLZUJHU2Rsek1nNWc0ZmhCa0ltSGQyN0EzVmRKazlWdUJ6?=
 =?utf-8?B?SG9TSk9icW9IM0lVRzBkbGQ2MTNMa2IyNHdyb0xZMmkzazZBSGtUOE1yZXJj?=
 =?utf-8?B?WEtJeEJ2M0dEa05lQnAxSWl1cStuZXNxTk51eHAxdCtnU2srYzI2dmY1NVdh?=
 =?utf-8?B?UWg4QXZWTUN3VnN0RUR2RjZwbG05dnFBSVp2VDlZQUpUWVdaTXdRbndzcjZ4?=
 =?utf-8?B?YklJQnozVlhBQ2FlZ253TGdwU0JTWTF4TWJoYWx5Q2VBRFVpNk83OVpucGdR?=
 =?utf-8?B?aTJVQ0RvbkZDVzEzM25uVmI5VlVBM3A5b0IrdEpsNS9NWEkyaWcweW9rTDJl?=
 =?utf-8?B?aFZWSXZpWlAwZVJCSlp2ODRML2dMeWJSWGU2OXlaODlpckgzV1MwcVNUbW9x?=
 =?utf-8?B?bVVjWnJoSm1FdDVhdFdZT0lvQ0VMVGczSjdYcFk1aUJLRjI2MSs2aHYxR3Z4?=
 =?utf-8?B?Qk82VXZDL1lsTkx2cUlERjBnOU5BZy9CcnpWTm5mcFhXSHIvS0pFM0RLb1cr?=
 =?utf-8?B?Ty92UkF6K09DSkNldWZXWEJLR0NzN0xTd1RXd2JJMWJyRFIzWWVBSitRQkx5?=
 =?utf-8?B?cDVnQmdmV1lWNWg5dklhS1owdCs1WU5WaU5LOGtGQTdKdFJMMk85Q2RIRloz?=
 =?utf-8?B?SzZRYXUyUGJpM0todms2SVhBUVRCWWRvV0RjQ0JCOW1OTUY2U1NVNGxCa01s?=
 =?utf-8?B?TW5iZ21zZ3dvTGNoRzdvaFo2d1VDMmk3dWZIWWRPUUlNZ1NsZEFBTzNNVWJL?=
 =?utf-8?B?OW52YmtUc0Z1cENSaWs4WEJ5cHNxZVJnd2NvQ3F1MjZUbS9aSGd4ZkgvVGN2?=
 =?utf-8?B?TjkwSmdia0s1VUVzYmVydDdWVG9FY3VnMFJtV0dnOG5pUUlldXFFTUIrd2hq?=
 =?utf-8?B?VHVjck1vWkRvSVM3VURTa1V1ME5BdEFxWGs1dFRWL3d5Rk4vTlhBemZVdmgx?=
 =?utf-8?B?VUExSDFJamxXWTRITW5WTXIxc1FsMzdvM0Z3TnNMM09sZ2FKMEI5WCtpKzI2?=
 =?utf-8?B?VC85NUpHcWN5L3U2czR4OFp5eDlTUFhkQlhNS1RQOGd5ODJDeXlZMDBjbHV2?=
 =?utf-8?B?MFFTRzMyTjZiMU80ancvZ0ZYSmhISEgxMXcyYlcrai94WkNhR2traHZ3OUNj?=
 =?utf-8?B?MzBVbnh1clV3eFozVXBtazFSU082K3VaUWg4N254enhYOFFhZHMxRmttVjRj?=
 =?utf-8?B?Mnc9PQ==?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 240dfd32-326a-4514-3a48-08dd4c2c4f1c
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 12:45:34.7679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PLoGHcAofG0B3saueHCH9VDxdWqhgB2pCLMTqI70xjC2K2f0glTPqz3FibWYKu0+CUJdApCGi/rcrlbdWHrCfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5690
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 12:45:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211328

--------------vOgSSo1RdpjjH4QhV7l6fpzs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 12.02.2025 um 18:45 schrieb Bruce Ashfield:
>
>
> On Wed, Feb 12, 2025 at 12:24 PM Stefan Herbrechtsmeier 
> <stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
>
>     Am 12.02.2025 um 16:07 schrieb Bruce Ashfield:
>>     On Wed, Feb 12, 2025 at 9:36 AM Stefan Herbrechtsmeier via
>>     lists.openembedded.org <http://lists.openembedded.org>
>>     <stefan.herbrechtsmeier-oss=weidmueller.com@lists.openembedded.org>
>>     wrote:
>>
>>         Am 11.02.2025 um 22:46 schrieb Richard Purdie:
>>>         On Tue, 2025-02-11 at 16:00 +0100, Stefan Herbrechtsmeier vialists.openembedded.org <http://lists.openembedded.org> wrote:
>>>>         From: Stefan Herbrechtsmeier<stefan.herbrechtsmeier@weidmueller.com> <mailto:stefan.herbrechtsmeier@weidmueller.com>
>>>>
>>>>         Signed-off-by: Stefan Herbrechtsmeier<stefan.herbrechtsmeier@weidmueller.com> <mailto:stefan.herbrechtsmeier@weidmueller.com>
>>>>         ---
>>>>
>>>>           .../python/python3-bcrypt-crates.inc          | 84 -------------------
>>>>           .../python/python3-bcrypt_4.2.1.bb <http://python3-bcrypt_4.2.1.bb>            |  4 +-
>>>>           2 files changed, 1 insertion(+), 87 deletions(-)
>>>>           delete mode 100644 meta/recipes-devtools/python/python3-bcrypt-crates.inc
>>>         So let me as the silly question. This removes the crates.inc file and
>>>         doesn't appear to add any kind of new list of locked down modules.
>>         The list is generated on the fly like gitsm and doesn't
>>         require an extra step.
>>
>>>         This means that inspection tools just using the metadata can't see
>>>         "into" this recipe any longer for component information.
>>
>>         We support and use python code inside the variables and
>>         thereby need a preprocessing of the metadata in any case.
>>
>>         What do you mean by "component information"?
>>
>>>         This was
>>>         something that some people felt strongly that was a necessary part of
>>>         recipe metadata, for license, security and other manifest activities.
>>
>>         Why can't they use the SBOM for this?
>>
>>>         Are we basically saying that information is now only available after
>>>         the build takes place?
>>         They are only available after a special task run.
>>
>>>         I'm very worried that the previous discussions didn't reach a
>>>         conclusion and this is moving the "magic" out of bitbake and into some
>>>         vendor classes without addressing the concerns previously raised about
>>>         transparency into the manifests of what is going on behind the scenes.
>>
>>         I try to address the concerns but don't realize that the
>>         missing information in the recipe is a blocker.
>>
>>         This version gives the user the possibility to influence the
>>         dependencies via patches or alternative lock file. It creates
>>         a vendor folder for easy patch and debug. It integrates the
>>         dependencies into the SBOM for security tracking.
>>
>>         I skipped the license topic for now because the package
>>         managers don't handle license integrity. We have to keep the
>>         information in the recipe but hopefully the license
>>         information doesn't change with each update.
>>
>>         I don't understand the requirement for the plain inspection.
>>         In my opinion external tools should always use a defined
>>         output and shouldn't depend on the project internal details.
>>         I adapt the existing users of the SRC_URI to include the
>>         dynamic SRC_URIs.
>>
>>>         I appreciate some of the requirements are conflicting.
>>>
>>>         For the record in some recent meetings, I was promised that help would
>>>         be forthcoming in helping guide this discussion. I therefore left
>>>         things alone in the hope that would happen. It simply hasn't, probably
>>>         due to time/work issues, which I can sympathise with but it does mean
>>>         I'm left doing a bad job of trying to respond to your patches whilst
>>>         trying to do too many other things badly too. That leaves us both very
>>>         frustrated.
>>>
>>>         I really want to see you succeed in reworking this and I appreciate the
>>>         time and effort put into the patches. To make this successful, I know
>>>         there are key stakeholders who need to buy into it and right now,
>>>         they're more likely just to keep doing their own things as it is easier
>>>         since this isn't going the direction they want. A key piece of making
>>>         this successful is negotiating something which can work for a
>>>         significant portion of them. I'm spelling all this out since I do at
>>>         least want to make the situation clear.
>>>
>>>         Yes, I'm very upset the OE community is putting me in this position
>>>         despite me repeatedly asking for help and that isn't your fault, which
>>>         just frustrates me more.
>>
>>         My problem is the double standards. We support a fetcher
>>         which dynamic resolve dependencies and without manual update
>>         step since years. Nobody suggests to make the gitsm fetcher
>>         obsolete and requests the users to run an update task after a
>>         SRC_URI change to create a .inc file with the SRC_URIs of all
>>         the recursive submodules. Nobody complains about the missing
>>         components in the recipe.
>>
>>     There's no double standard, I'd simply say that design decisions
>>     of the past doesn't mean that there aren't better ways to do
>>     something new.
>>
>>     Richard went out of his way to explain the status and what sort
>>     of review needs to happen, I'll add that while getting frustrated
>>     with it is natural, pushing back on people doing reviews isn't
>>     going to help get things merged, it will do the opposite.
>>
>>     There have been plenty of complaints and issues with the gitsm
>>     fetcher, but the reality is that if someone wants to get at the
>>     base components of what it is doing, they can do so. I've had to
>>     take several of my maintained recipes out of gitsm and back to
>>     the base git fetches. The submodules were simply fetching code
>>     that didn't build and there was no way to fetch it.  The gitsm
>>     fetcher is also relatively lightly used, much less complicated
>>     and doesn't need much extra in infrastructure to support it.
>
>     Thanks for your insides. There a two main solutions for the
>     problem. Add patch support to gitsm so that you could use the git
>     submodule command and create a patch or generate a .inc file and
>     manipulate the SRCREVs. I assume you would prefer a .inc file.
>     What do you think is the downside of a patch?
>
>
> It is much easier to get a complete view of the file with a drop-in, 
> versus a patch (depending on the size of the file). You need to know 
> the base directory, the depth, put in an upstream-status, create it, 
> copy it to your layer, etc. With a drop-in lock file, I copy it out, 
> edit it, and add it to my SRC_URI.  Not much difference in the end, 
> but I prefer the drop-in approach on pretty much any configuration 
> file in my builds, not just this example.

Is a drop-in lock file okay for you or do you require a support to 
generate .inc files?

>
>>
>>         Whether we have hard requirements and introduce a git
>>         submodule support which satisfy the requirements or we accept
>>         the advantages of a simple user interface and minimize the
>>         disadvantages.
>>
>>     Unfortunately in my experience the simple interfaces hiding
>>     complexity don't help when things go wrong. That's how I ended up
>>     where I am with my go recipes, and why I ended up tearing my
>>     gitsm recipe back into its components. There was no way to
>>     influence / fix the build otherwise, and they didn't support
>>     bleeding edge development very well.
>     Do you have a good example for a problematic go recipe to test my
>     approach?
>
>
> Not right now, the current state is relatively stable as I'm working 
> towards the LTS release. These have just popped up repeatedly over the 
> maybe 5+ years (I can't remember how long it has been!) in maintaining 
> meta-virtualization. I have no doubts (and am not implying) that your 
> series could adapt my recipes and use all of the go mod infrastructure 
> .. just with all of the vendoring and go mod efforts over the years, 
> going all the way back to the actual source code gave a lot more 
> visibility into the vendor dependencies (and not just what was 
> released for them) and I've used it many times while debugging runtime 
> issues of the container stacks.
>
>
>>     I'm definitely one of the people Richard is mentioning as a
>>     stakeholder, and one that could likely just ignore all of this ..
>>     but I'm attempting to wade into it again.
>
>     I am very grateful for that.
>
>>
>>     None of us have the hands on, daily experience with the
>>     components at play as you do right now, so patience on your part
>>     will be needed as we ask many not-so-intelligent questions.
>
>     That's no problem.
>
>>
>>         It doesn't matter if we run the resolve function inside a
>>         resolve, fetch or update task. The questions is do we want to
>>         support dynamic SRC_URIs or do we want an manual update task.
>>         The task needs to be manual run after a SRC_URI change and
>>         can produces a lot of noise in the update commit. In any case
>>         the manual editing of the SRC_URI isn't practical and the
>>         users will use the package manager to update dependencies and
>>         its recursive dependencies.
>>
>>     I don't understand the series quite enough yet to say "why can't
>>     we do both", if there was a way to abstract / componentize what
>>     is generating those dynamic SCR_URIS in such a way that an
>>     external tool or update task could generate them, and if they
>>     were already in place the dynamic generation wouldn't run at
>>     build time, that should keep both modes working.
>     If it is desired I can add both variants.
>
>
> Forcing one approach over the other isn't really going to make it 
> mergeable (or maybe I should say make it adopted by all).
>
> We need to help developers as well as people just doing "load build" 
> for distros (that should be in a steady state).  I'm under no illusion 
> that the way I handle the go recipes won't work for everyone either, 
> so I definitely wouldn't propose it as such.
The disadvantage of two approach is that you double the issues. It is 
much simpler if we always depend on the lock file and only support 
embedded and drop-in lock files. I can optimize the generated SRC_URIs 
but wouldn't support the manipulation of the SRC_URI because of it 
unforeseeable consequences. We didn't know which commands of the package 
manager depends on the lock file and I would avoid the regeneration of 
the lock file.

>>     I admit to not understanding why we'd be overly concerned about
>>     noise in the commits (for the dependencies) if they are split
>>     into separate files in the recipe. More information is always
>>     better when I'm dealing with the updates. I just scroll past it
>>     if I'm not interested and filter it if I am.
>     The problem is to identify the relevant parts. Lets say you update
>     a dependency because of an security issue. Afterwards you update
>     the project with a lot of dependency changes. You have to review
>     the complete noise to determine if your updated dependency doesn't
>     go backward in its version. It is much easier to use a patch.
>     After the project update the patch will fail or not. If it fails
>     you have a direct focus on the affected dependency. If you back
>     port the patch from the project you could simple drop it with the
>     next update.
>
>
> I prefer all of the extra information, but maybe that's my kernel 
> background. It's the same reason why all my recipe / version updates 
> contain all the short logs between the releases. I can just skip / 
> ignore the information most of the time, but it comes in handy when 
> looking for a security issue, etc.
Maybe we could add the dynamic dependencies to the buildhistory.

> In my go recipes, I have a look at the dependency SRCREVS between 
> updates. In particular if I'm debugging a runtime issue, that helps me 
> quickly see if a dependency changed and by how much it changed.
>
> I could do the same with a drop-in lockfile that was in my recipe, 
> since I'd have the delta readily available and could see the source 
> revisions, etc.
>
> Of course if a drop-in file was used, we'd want some sort of hash for 
> the original file it was clobbering, since that indicates an update 
> would be required (or dropping it, etc).
>
>
>
>>     I feel the pain (and your pain) of this after supporting
>>     complicated go/mixed language recipes through multiple major
>>     releases (and through go's changing dependency model + bleeding
>>     edge code, etc) and needing to track what has changed, so I
>>     definitely encourage you to keep working on this.
>>
>>         As a compromise we could add a new feature to generate .inc
>>         cache files before the main bitbake run. This would eliminate
>>         the manual update run and the commit noise as well as special
>>         fetch, unpack and patch task.
>>
>>     Can you elaborate on what you mean by before the main bitbake run
>>     ? Would it be still under a single bitbake invokation or would it
>>     be multiple runs (I support multiple runs, so don't take that as
>>     a leading question).
>
>     I can't answer this questions and need Richard guidance to
>     implement such a feature. I would assume that bitbake already
>     track file changes and can update its state. The behavior should
>     be similar to a change in the .inc file. Bitbake will detect that
>     a "include_cache" file is missing and run an update_cache task on
>     the recipe. Afterwards bitbake detect a file change on the
>     "include_cache" file and parse it. We need a possibility to mark
>     patches which shouldn't be applied if the "include_cache" file is
>     missing because the dependencies are missing. We need to run the
>     fetch, unpack and patch task before the update_cache task to
>     generate the .inc file.
>
> Aha. Maybe Richard will comment later. I was thinking more about 
> something that was in two distinct phases, but with some more thinking 
> and explanation, maybe this is workable as well.

This is only needed if we need the dynamic SRC_URIs outside of bitbake 
in the common bitbake format (SRC_URI += "..."). Otherwise we could save 
the information inside the WORKDIR and depend on the sstate cache.

--------------vOgSSo1RdpjjH4QhV7l6fpzs
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Am 12.02.2025 um 18:45 schrieb Bruce
      Ashfield:<br>
    </div>
    <blockquote type="cite" cite="mid:CADkTA4MtM9ZbakC-u0Qk8bQjcOk6uYuYYhFagWR3fmNqC7gWrw@mail.gmail.com">
      
      <div dir="ltr">
        <div dir="ltr">
          <div class="gmail_default" style="font-size:small"><br>
          </div>
        </div>
        <br>
        <div class="gmail_quote gmail_quote_container">
          <div dir="ltr" class="gmail_attr">On Wed, Feb 12, 2025 at
            12:24 PM Stefan Herbrechtsmeier &lt;<a href="mailto:stefan.herbrechtsmeier-oss@weidmueller.com" moz-do-not-send="true" class="moz-txt-link-freetext">stefan.herbrechtsmeier-oss@weidmueller.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <div>Am 12.02.2025 um 16:07 schrieb Bruce Ashfield:<br>
              </div>
              <blockquote type="cite">
                <div dir="ltr">
                  <div class="gmail_quote">
                    <div dir="ltr" class="gmail_attr">On Wed, Feb 12,
                      2025 at 9:36 AM Stefan Herbrechtsmeier via <a href="http://lists.openembedded.org" target="_blank" moz-do-not-send="true">lists.openembedded.org</a>
                      &lt;stefan.herbrechtsmeier-oss=<a href="mailto:weidmueller.com@lists.openembedded.org" target="_blank" moz-do-not-send="true" class="moz-txt-link-freetext">weidmueller.com@lists.openembedded.org</a>&gt;
                      wrote:<br>
                    </div>
                    <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                      <div>
                        <div>Am 11.02.2025 um 22:46 schrieb Richard
                          Purdie:<br>
                        </div>
                        <blockquote type="cite">
                          <pre>On Tue, 2025-02-11 at 16:00 +0100, Stefan Herbrechtsmeier via <a href="http://lists.openembedded.org" target="_blank" moz-do-not-send="true">lists.openembedded.org</a> wrote:
</pre>
                          <blockquote type="cite">
                            <pre>From: Stefan Herbrechtsmeier <a href="mailto:stefan.herbrechtsmeier@weidmueller.com" target="_blank" moz-do-not-send="true">&lt;stefan.herbrechtsmeier@weidmueller.com&gt;</a>

Signed-off-by: Stefan Herbrechtsmeier <a href="mailto:stefan.herbrechtsmeier@weidmueller.com" target="_blank" moz-do-not-send="true">&lt;stefan.herbrechtsmeier@weidmueller.com&gt;</a>
---

&nbsp;.../python/python3-bcrypt-crates.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 84 -------------------
&nbsp;.../python/<a href="http://python3-bcrypt_4.2.1.bb" target="_blank" moz-do-not-send="true">python3-bcrypt_4.2.1.bb</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 4 +-
&nbsp;2 files changed, 1 insertion(+), 87 deletions(-)
&nbsp;delete mode 100644 meta/recipes-devtools/python/python3-bcrypt-crates.inc
</pre>
                          </blockquote>
                          <pre>So let me as the silly question. This removes the crates.inc file and
doesn't appear to add any kind of new list of locked down modules.
</pre>
                        </blockquote>
                        The list is generated on the fly like gitsm and
                        doesn't require an extra step.<br>
                        <br>
                        <blockquote type="cite">
                          <pre>This means that inspection tools just using the metadata can't see
&quot;into&quot; this recipe any longer for component information.
</pre>
                        </blockquote>
                        <p>We support and use python code inside the
                          variables and thereby need a preprocessing of
                          the metadata in any case.<br>
                          <br>
                          What do you mean by &quot;component information&quot;?<br>
                          <br>
                        </p>
                        <blockquote type="cite">
                          <pre>This was
something that some people felt strongly that was a necessary part of
recipe metadata, for license, security and other manifest activities.</pre>
                        </blockquote>
                        <p>Why can't they use the SBOM for this?<br>
                          <span style="white-space:pre-wrap">

</span></p>
                        <blockquote type="cite">
                          <pre>Are we basically saying that information is now only available after
the build takes place?
</pre>
                        </blockquote>
                        They are only available after a special task
                        run.<br>
                        <br>
                        <blockquote type="cite">
                          <pre>I'm very worried that the previous discussions didn't reach a
conclusion and this is moving the &quot;magic&quot; out of bitbake and into some
vendor classes without addressing the concerns previously raised about
transparency into the manifests of what is going on behind the scenes.
</pre>
                        </blockquote>
                        <p>I try to address the concerns but don't
                          realize that the missing information in the
                          recipe is a blocker.<br>
                          <br>
                          This version gives the user the possibility to
                          influence the dependencies via patches or
                          alternative lock file. It creates a vendor
                          folder for easy patch and debug. It integrates
                          the dependencies into the SBOM for security
                          tracking.<br>
                          <br>
                          I skipped the license topic for now because
                          the package managers don't handle license
                          integrity. We have to keep the information in
                          the recipe but hopefully the license
                          information doesn't change with each update.<br>
                          <br>
                          I don't understand the requirement for the
                          plain inspection. In my opinion external tools
                          should always use a defined output and
                          shouldn't depend on the project internal
                          details. I adapt the existing users of the
                          SRC_URI to include the dynamic SRC_URIs. <br>
                          <br>
                        </p>
                        <blockquote type="cite">
                          <pre>I appreciate some of the requirements are conflicting.

For the record in some recent meetings, I was promised that help would
be forthcoming in helping guide this discussion. I therefore left
things alone in the hope that would happen. It simply hasn't, probably
due to time/work issues, which I can sympathise with but it does mean
I'm left doing a bad job of trying to respond to your patches whilst
trying to do too many other things badly too. That leaves us both very
frustrated.

I really want to see you succeed in reworking this and I appreciate the
time and effort put into the patches. To make this successful, I know
there are key stakeholders who need to buy into it and right now,
they're more likely just to keep doing their own things as it is easier
since this isn't going the direction they want. A key piece of making
this successful is negotiating something which can work for a
significant portion of them. I'm spelling all this out since I do at
least want to make the situation clear.

Yes, I'm very upset the OE community is putting me in this position
despite me repeatedly asking for help and that isn't your fault, which
just frustrates me more.
</pre>
                        </blockquote>
                        <p>My problem is the double standards. We
                          support a fetcher which dynamic resolve
                          dependencies and without manual update step
                          since years. Nobody suggests to make the gitsm
                          fetcher obsolete and requests the users to run
                          an update task after a SRC_URI change to
                          create a .inc file with the SRC_URIs of all
                          the recursive submodules. Nobody&nbsp;complains
                          about the missing components in the recipe.<br>
                        </p>
                      </div>
                    </blockquote>
                    <div>
                      <div style="font-size:small">There's no double
                        standard, I'd simply say that design decisions
                        of the past doesn't mean that there aren't
                        better ways to do something new.</div>
                      <div style="font-size:small"><br>
                      </div>
                      <div style="font-size:small">Richard went out of
                        his way to explain the status and what sort of
                        review needs to happen, I'll add that while
                        getting frustrated with it is natural, pushing
                        back on people doing reviews isn't going to help
                        get things merged, it will do the opposite.</div>
                      <div style="font-size:small"><br>
                      </div>
                      <div style="font-size:small">There have been
                        plenty of complaints and issues with the gitsm
                        fetcher, but the reality is that if someone
                        wants to get at the base components of what it
                        is doing, they can do so. I've had to take
                        several of my maintained recipes out of gitsm
                        and back to the base git fetches. The submodules
                        were simply fetching code that didn't build and
                        there was no way to fetch it.&nbsp; The gitsm fetcher
                        is also relatively lightly used, much less
                        complicated and doesn't need much extra in
                        infrastructure to support it.<br>
                      </div>
                    </div>
                  </div>
                </div>
              </blockquote>
              <p>Thanks for your insides. There a two main solutions for
                the problem. Add patch support to gitsm so that you
                could use the git submodule command and create a patch
                or generate a .inc file and manipulate the SRCREVs. I
                assume you would prefer a .inc file. What do you think
                is the downside of a patch?<br>
              </p>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class="gmail_default" style="font-size:small">It is
              much easier to get a complete view of the file with a
              drop-in, versus a patch (depending on the size of the
              file). You need to know the base directory, the depth, put
              in an upstream-status, create it, copy it to your layer,
              etc. With a drop-in lock file, I copy it out, edit it, and
              add it to my SRC_URI.&nbsp; Not much difference in the end, but
              I prefer the drop-in approach on pretty much any
              configuration file in my builds, not just this example. <br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <p>Is a drop-in lock file okay for you or do you require a support
      to generate .inc files?<br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:CADkTA4MtM9ZbakC-u0Qk8bQjcOk6uYuYYhFagWR3fmNqC7gWrw@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote gmail_quote_container">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <p> <br>
              </p>
              <blockquote type="cite">
                <div dir="ltr">
                  <div class="gmail_quote">
                    <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                      <div>
                        <p> <br>
                          Whether we have hard requirements and
                          introduce a git submodule support which
                          satisfy the requirements or we accept the
                          advantages of a simple user interface and
                          minimize the disadvantages.<br>
                        </p>
                      </div>
                    </blockquote>
                    <div>
                      <div style="font-size:small">Unfortunately in my
                        experience the simple interfaces hiding
                        complexity don't help when things go wrong.
                        That's how I ended up where I am with my go
                        recipes, and why I ended up tearing my gitsm
                        recipe back into its components. There was no
                        way to influence / fix the build otherwise, and
                        they didn't support bleeding edge development
                        very well.<br>
                      </div>
                    </div>
                  </div>
                </div>
              </blockquote>
              Do you have a good example for a problematic go recipe to
              test my approach?<br>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class="gmail_default" style="font-size:small">Not right
              now, the current state is relatively stable as I'm working
              towards the LTS release. These have just popped up
              repeatedly over the maybe 5+ years (I can't remember how
              long it has been!) in maintaining meta-virtualization. I
              have no doubts (and am not implying) that your series
              could adapt my recipes and use all of the go mod
              infrastructure .. just with all of the vendoring and go
              mod efforts over the years, going all the way back to the
              actual source code gave a lot more visibility into the
              vendor dependencies (and not just what was released for
              them) and I've used it many times while debugging runtime
              issues of the container stacks.</div>
          </div>
          <div><br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div> <br>
              <blockquote type="cite">
                <div dir="ltr">
                  <div class="gmail_quote">
                    <div>
                      <div style="font-size:small">I'm definitely one of
                        the people Richard is mentioning as a
                        stakeholder, and one that could likely just
                        ignore all of this .. but I'm attempting to wade
                        into it again.</div>
                    </div>
                  </div>
                </div>
              </blockquote>
              <p>I am very grateful for that.<br>
                <br>
              </p>
              <blockquote type="cite">
                <div dir="ltr">
                  <div class="gmail_quote">
                    <div style="font-size:small"><br>
                    </div>
                    <div style="font-size:small">None of us have the
                      hands on, daily experience with the components at
                      play as you do right now, so patience on your part
                      will be needed as we ask many not-so-intelligent
                      questions.<br>
                    </div>
                  </div>
                </div>
              </blockquote>
              <p>That's no problem.<br>
                <br>
              </p>
              <blockquote type="cite">
                <div dir="ltr">
                  <div class="gmail_quote">
                    <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                      <div>
                        <p> <br>
                          It doesn't matter if we run the resolve
                          function inside a resolve, fetch or&nbsp;update
                          task. The questions is do we want to support
                          dynamic SRC_URIs or do we want an manual
                          update task. The task needs to be manual run
                          after a SRC_URI change and can produces a lot
                          of noise in the update commit. In any case the
                          manual editing of the SRC_URI isn't practical
                          and the users will use the package manager to
                          update dependencies and its recursive
                          dependencies.<br>
                        </p>
                      </div>
                    </blockquote>
                    <div>
                      <div style="font-size:small">I don't understand
                        the series quite enough yet to say &quot;why can't we
                        do both&quot;, if there was a way to abstract /
                        componentize&nbsp;what is generating those
                        dynamic&nbsp;SCR_URIS in such a way that an external
                        tool or update task could generate them, and if
                        they were already in place the dynamic
                        generation wouldn't run at build time, that
                        should keep both modes working.<br>
                      </div>
                    </div>
                  </div>
                </div>
              </blockquote>
              If it is desired I can add both variants.</div>
          </blockquote>
          <div><br>
          </div>
          <div class="gmail_default" style="font-size:small">Forcing one
            approach over the other isn't really going to make it
            mergeable (or maybe I should say make it adopted by all).&nbsp;</div>
          <div class="gmail_default" style="font-size:small"><br>
          </div>
          <div class="gmail_default" style="font-size:small">We need to
            help developers as well as people just doing &quot;load build&quot;
            for distros (that should be in a steady state).&nbsp; I'm under
            no illusion that the way I handle the go recipes won't work
            for everyone either, so I definitely wouldn't propose it as
            such.<br>
          </div>
        </div>
      </div>
    </blockquote>
    The disadvantage of two approach is that you double the issues. It
    is much simpler if we always depend on the lock file and only
    support embedded and drop-in lock files. I can optimize the
    generated SRC_URIs but wouldn't support the manipulation of the
    SRC_URI because of it unforeseeable consequences. We didn't know
    which commands of the package manager depends on the lock file and I
    would avoid the regeneration of the lock file.<br>
    <br>
    <blockquote type="cite" cite="mid:CADkTA4MtM9ZbakC-u0Qk8bQjcOk6uYuYYhFagWR3fmNqC7gWrw@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote gmail_quote_container">
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <blockquote type="cite">
                <div dir="ltr">
                  <div class="gmail_quote">
                    <div>
                      <div style="font-size:small">I admit to not
                        understanding why we'd be overly concerned about
                        noise in the commits (for the dependencies) if
                        they are split into separate files in the
                        recipe. More information is always better when
                        I'm dealing with the updates. I just scroll past
                        it if I'm not interested and filter it if I am.<br>
                      </div>
                    </div>
                  </div>
                </div>
              </blockquote>
              The problem is to identify the relevant parts. Lets say
              you update a dependency because of an security issue.
              Afterwards you update the project with a lot of dependency
              changes. You have to review the complete noise to
              determine if your updated dependency doesn't go backward
              in its version. It is much easier to use a patch. After
              the project update the patch will fail or not. If it fails
              you have a direct focus on the affected dependency. If you
              back port the patch from the project you could simple drop
              it with the next update.</div>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class="gmail_default" style="font-size:small">I prefer
              all of the extra information, but maybe that's my kernel
              background. It's the same reason why all my recipe /
              version updates contain all the short logs between the
              releases. I can just skip / ignore the information most of
              the time, but it comes in handy when looking for a
              security issue, etc.<br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    Maybe we could add the dynamic dependencies to the buildhistory.<br>
    <br>
    <blockquote type="cite" cite="mid:CADkTA4MtM9ZbakC-u0Qk8bQjcOk6uYuYYhFagWR3fmNqC7gWrw@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote gmail_quote_container">
          <div>
            <div class="gmail_default" style="font-size:small">In my go
              recipes, I have a look at the dependency SRCREVS between
              updates. In particular if I'm debugging a runtime issue,
              that helps me quickly see if a dependency changed and by
              how much it changed.&nbsp;</div>
            <div class="gmail_default" style="font-size:small"><br>
            </div>
            <div class="gmail_default" style="font-size:small">I could
              do the same with a drop-in lockfile that was in my recipe,
              since I'd have the delta readily available and could see
              the source revisions, etc.&nbsp;</div>
            <div class="gmail_default" style="font-size:small"><br>
            </div>
            <div class="gmail_default" style="font-size:small">Of course
              if a drop-in file was used, we'd want some sort of hash
              for the original file it was clobbering, since that
              indicates an update would be required (or dropping it,
              etc).</div>
          </div>
          <div><br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div> <br>
              <br>
              <blockquote type="cite">
                <div dir="ltr">
                  <div class="gmail_quote">
                    <div style="font-size:small">I feel the pain (and
                      your pain) of this after supporting complicated
                      go/mixed language recipes through multiple&nbsp;major
                      releases (and through go's changing dependency
                      model + bleeding edge code, etc) and needing to
                      track what has changed, so I definitely encourage
                      you to keep working on this.</div>
                    <div style="font-size:small"><br>
                    </div>
                    <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
                      <div>
                        <p> </p>
                        <p>As a compromise we could add a new feature to
                          generate .inc cache files before the main
                          bitbake run. This would eliminate the manual
                          update run and the commit noise as well as
                          special fetch, unpack and patch task.<br>
                          <br>
                        </p>
                      </div>
                    </blockquote>
                    <div style="font-size:small">Can you elaborate on
                      what you mean by before the main bitbake run ?
                      Would it be still under a single bitbake
                      invokation or would it be multiple runs (I support
                      multiple runs, so don't take that as a leading
                      question).<br>
                    </div>
                  </div>
                </div>
              </blockquote>
              <p>I can't answer this questions and need Richard guidance
                to implement such a feature. I would assume that bitbake
                already track file changes and can update its state. The
                behavior should be similar to a change in the .inc file.
                Bitbake will detect that a &quot;include_cache&quot; file is
                missing and run an update_cache task on the recipe.
                Afterwards bitbake detect a file change on the
                &quot;include_cache&quot; file and parse it. We need a possibility
                to mark patches which shouldn't be applied if the
                &quot;include_cache&quot; file is missing because the dependencies
                are missing. We need to run the fetch, unpack and patch
                task before the update_cache task to generate the .inc
                file.</p>
            </div>
          </blockquote>
        </div>
        <div>
          <div class="gmail_default" style="font-size:small">Aha. Maybe
            Richard will comment later. I was thinking more about
            something that was in two distinct phases, but with some
            more thinking and explanation, maybe this is workable as
            well.<br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>This is only needed if we need the dynamic SRC_URIs outside of
      bitbake in the common bitbake format (SRC_URI += &quot;...&quot;). Otherwise
      we could save the information inside the WORKDIR and depend on the
      sstate cache.<br>
      <br>
    </p>
  </body>
</html>

--------------vOgSSo1RdpjjH4QhV7l6fpzs--

