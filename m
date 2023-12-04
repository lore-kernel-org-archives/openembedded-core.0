Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF94DC4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 10:48:50 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.84])
 by mx.groups.io with SMTP id smtpd.web11.65988.1701686926075598620
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 02:48:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=u8/mbUa7;
 spf=pass (domain: weidmueller.com, ip: 40.107.15.84, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ys3Py88D4qyZvcO5KVUwxvFZpH86wrIOgT9ZIy48P6ipaXvS9h6OjXcwkwD93wrNsuVerR996lD/Mtd+1+aC3L/yZQv24U2Z1g2DIp7LMNmb8U4A6+O1WYbBx1hngvxHYYmtPMkZy8Ygr3dIKq0FaLf05t73UWSzmR3uzKs81K/HbzCNavheKb9Es1YKxrED6sFBVofFYxzfNCsFZCHbyjfsWfsyYbMqcQd7CN2BFdXg3WIWWRBEXYxTKhYKm3zn87lqfqmNMzFdCzTaesi0CE6pOj6vXy6PJDIr0HHFTw7PR+X7p+Wj0cZ9tymaDm6UtgrRbqZjfQl/wYChOTdAcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=COdB6UmAZqcGZTCFR1d/4E4JPITRfubd0lBTORYFePw=;
 b=c7qNEG0BpX/H8+HYmTRLDDlRV0x3vIiN+mU827+i3ohkEyANL4zL68Pja8fUs7zUyST8f3Xvz9AKba9shCTUBWMEO6u5pUUt0VKdDG6YLlFUE2sXXv8YBesh9r2qmo7cdycNvl/ttDRM+1tV3wkcMjCit7CqbTk2Jz3BanK4c596Uis3D8nN2j2ErI7IPna7M46ak7AJX2UmjNfY5L5hy+WzGzmA0DErBA+7F8i/zdWdzrayBgKQ+6KPytxEAzVqt0gpvfXM36tIfnrrZ7CnEBYoZGnRGWUd9LyFw812/vYaFkdhZNojfFPSH92NKi6Jar7nfYpTPqapeUPOHlyiIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=COdB6UmAZqcGZTCFR1d/4E4JPITRfubd0lBTORYFePw=;
 b=u8/mbUa7HtwWhNEVlNnwiUVt2G6qdnHVjGPVn+obeYBFp3QgIF+roZQeQ/YwwzDqGqJ4T8tKHgNy8OGZiGHNEOwURR3q3YoXAsAUbOWbGl/lvZfnNUPfEyoRArX84pLmnSHkqk+/88lqzUDttWBWGKR8YbpIQK+z7wQQPKSuJR8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by GV1PR08MB7873.eurprd08.prod.outlook.com (2603:10a6:150:5c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 10:48:39 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::b914:d9b5:6462:13b6%5]) with mapi id 15.20.7025.022; Mon, 4 Dec 2023
 10:48:39 +0000
Message-ID: <8ca92320-0ab3-4679-9de1-74f38ad0f8a7@weidmueller.com>
Date: Mon, 4 Dec 2023 11:48:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 0/2] patch: reduce changes during patch
 refresh
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Lukas Funke <lukas.funke@weidmueller.com>
References: <20231122140811.1021807-1-lukas.funke-oss@weidmueller.com>
 <e784d0eeb3b0232f0df98b385ace92dfc625c191.camel@linuxfoundation.org>
From: Lukas Funke <lukas.funke-oss@weidmueller.com>
In-Reply-To: <e784d0eeb3b0232f0df98b385ace92dfc625c191.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::8) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|GV1PR08MB7873:EE_
X-MS-Office365-Filtering-Correlation-Id: ebb05579-5ff2-4b63-4248-08dbf4b69322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Op56FKVFIia7FcgiPrbv7jOUXNcaB8RB7ZvYDrydmAGFcVaAkUZbLNp8yniZkT2ikiH1E9WcJr/T159k/D1HHDxK8YJbyak1wdokD9TZ6BULzlecMAD59F7G2el4NG5cLD5+mVPY6NK6mF9DxlEqjlMczXciynTuv2ac8PsUc+4489DqKmfBUiViECPcRnBGHehRM/1i7jT22e+zV8MMrOWcpNw7SnCCDrp/DxKbDWjVGUwphkXdyHfGMA3nL4g9TRuyM1dFDGtf/WLveRUkk5918p7Zs+5JwAyR7NKG0L6bPrUMmR3cGDNgG1WFtoqc7Vm1oNsy426g1m+0f0eSgQSWt3YUQM5MSCPfhK8cQBCrHmLs8825yUsQ1WP+51vrnK5v9Cx/BcBJRveS2cqNSDjthCAa0R4RQ/QPf4ve5kjNwlgQGPWMKag+qNV39WR1cpZ1sG/uogz/zoU39wJP2HmXjVENlND0mHbOmw/d1Ki1RyA0nFg+SaRZUAukN/tIFs65nVTonVl589Mqus+T0f+hOWXUyrH93krvsW6V5pQu6KCk24u5+iDyOxgvz0nvg2f4bXWhbDNsxgEGR5jkg+z3v6EhLaR+Cm1YwT2yAoWLmUyR4w4aJ7o+YlaI+C2IkhMJ6aoCch8yvEuVv96amg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(376002)(346002)(136003)(396003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(478600001)(6512007)(2616005)(107886003)(8936002)(8676002)(4326008)(38100700002)(66946007)(54906003)(66476007)(66556008)(316002)(31686004)(26005)(83380400001)(6486002)(966005)(6506007)(53546011)(31696002)(86362001)(5660300002)(2906002)(4001150100001)(41300700001)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dlJrandldkg3M0NFYlpGVUoyNG9LaFVOcy9LdC9WSVN1RGJ1S1RiQldULzZs?=
 =?utf-8?B?L0RIQUkzNG5iNHFlRW1mNVBCNXViTXRza1orQytqem95a0YrVXFOQ2pUNjlF?=
 =?utf-8?B?K3JuRC92UTVXZEZhSG1idWdnQlZ1cW03M0d6c253STZFQXV1YXhVZ1VBU2dW?=
 =?utf-8?B?Z3JVSmd2WEY2VXdISmRtc0VBdE13TDU3amVybHI2aENYL0pmVGJ0V2U3NWdx?=
 =?utf-8?B?d3pVdTZ0T0tTSSttNHBtWGo4Wk9SSS8wc1RyMXNuTVhGYTRvSUpQL1ZGUGhk?=
 =?utf-8?B?aGQrNDVOQk44a3pCaDIvRlBldTZTWVpabmtGYlpZVFVqVmc1ajd2djRZdlc0?=
 =?utf-8?B?VWVaamdhWDExU0xVYWJzU3BUd0pOT05OcjM4VVFVemsvcWJhck1hMFcxTlIw?=
 =?utf-8?B?ZnpBMjFlRS96aThBYm51Ly8xY0QrVXpqSGdTTVFUVjdzTmJ0SkNXelM5TUJS?=
 =?utf-8?B?OStWUXRWb21JN1JCNWpsMC80ajlZZGRTQmNMTXRlUlE2SHJWaVpLTGpKV1Bt?=
 =?utf-8?B?OEZ5Q0VKSFd6ZDI5bU4yR3ZBT2hGSWhtWVZRbFEwNmZqbkpiNjBSVE04RGpM?=
 =?utf-8?B?REdCQkl0TkdhQUZhQVBaek9vbzFNVmRCK0RlOTlqWTBuRXhPSURpVDNJRTFX?=
 =?utf-8?B?RXUrd3B5aHg3enJoN1BMWmxMUkprdGg4dUFzOWMzaG5vLy9wSFFNNnJVU2NS?=
 =?utf-8?B?TlpxbVVBNE9TdU5vdFkzOTRVMGxZWVhpOGxHNDF2NE9pZ0l2d1JHR2s0M1BG?=
 =?utf-8?B?M3hBMmZvV2ZUQkkwRkl5OXFTVzA2VVRoQnZQb2lnL2I5MTJDOGN5bUcxcTN3?=
 =?utf-8?B?T0ZlSDE2SGVzZkRkRTIrV1dzaXhZS1QyZHF0SVBBRS9yWXpiaGlsOXI5L096?=
 =?utf-8?B?RzY3UFJVbm9TazJqQzZESStUWlhQdkJGSVlMWlZZOEwyMVZyTUNDWkxIWnlO?=
 =?utf-8?B?bzRuL21hUDdKbCs0V09iSUpHUjJWUGlKcGRZcE5RQlR4S2RET3lRcVlPTHhL?=
 =?utf-8?B?ZkdZTldOVUZ0OUNoenJoUUNReDVULzNXZWlLNk9yRHE1aG90UzVLdVBGdHdT?=
 =?utf-8?B?VURYSk5IbUxBdFFybU8vRjE4UFRodGN3eTI1SUdqcVNtTmdVWnoxSTFQV3B1?=
 =?utf-8?B?OVhpelI0Ti9oV2RZREZFSC9MSlhXdDBCNzQvbE5EbnBWd2E1Yk1DTmRYMUFC?=
 =?utf-8?B?N211WC8wNGtETjd5citGVFU4V3NZZlM0MytPOThnL21lcUJQSXZOMFYrYTNY?=
 =?utf-8?B?eVBTNEwxdXdUaHhvNGlpaDhmU25MWm4zb1ZXSTJObHpyeUhaakNGK2ZZVU9h?=
 =?utf-8?B?UWRWRUNQaHVuMjNJSVFOS2VPUFIxamhWbVJ0dlF5WnpZdXJwZ05pRXEyOFZz?=
 =?utf-8?B?bSsrUjRQN2Y0dU9JNmhoS2c1am9Uamt1SWtGOTlpQnlTVGlySUhGbG1HZXpX?=
 =?utf-8?B?ZmsyZVdTc2QyQnI5cnc0UDJtUnk5eS85T01HUDM4b253anNhWXZOSDhteU1P?=
 =?utf-8?B?Zk5ydGRmQzZVZksyT1NnNjNML01EY0pPaTh4aURFVEw1cXVGZk9TYkJXdXJX?=
 =?utf-8?B?bXNrVmNib0Z1Q2FWeWNtYjJCMUZHZldrZ1lERlIzaEJMY3Zva1BuOEFERkw2?=
 =?utf-8?B?WW1zQkxzQURmSjBGMG9HbG85ZDJkdGVtcTB3NXN1RGJnQ2dYd3BsSDBBNUVR?=
 =?utf-8?B?aUdGUkdYMmtaZ1pmc28wc0FaLzk1VWZTUVN4c2ZpNERTTlhXamFGOEUwQ1Zr?=
 =?utf-8?B?U1RYa01TcGUwZUVWRmFpR2VjWU9WcElvdHZ2S2Rvc0N1b1YxMW81Mnh6SS9J?=
 =?utf-8?B?NWd0RS9iZlVyVnpKbEVYNHJ2MVhhZ2RHQ3JnMG04bFV2SllCNHJrY052Wnls?=
 =?utf-8?B?SjdIa0s3Rmt3ZUlZSVJiVmVHWWJIeHhLbm1na05FMGkxUUdjc01NU0FhcE1l?=
 =?utf-8?B?MWNUdjU2MkNTNU04ZTJjcU1JZTFOTisrWjVWVHErUS8rUEE5dURiS1FCMUFG?=
 =?utf-8?B?cmVkeXU2MlZISTJkUHpIY3Z2VGx5ZjlBQUdaamJmT1hQS25ESTRjcDB3Sm43?=
 =?utf-8?B?anZNMklqY2ZOTWYzQWZHZkk5TWdFT0FrMFlPcFB1eU94TGFacjNtZkhHaUYv?=
 =?utf-8?B?S1NQNlhoOTk2Q0Fybm5tUS9rcC9CcGdRQXU3ZHFyVTloTzJvbnY0bStLcFZn?=
 =?utf-8?B?d0E9PQ==?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebb05579-5ff2-4b63-4248-08dbf4b69322
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 10:48:39.3914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AtyvKZ8l68FLuVz+mJmbwumpKBFOx65BCRzR29xEB4VTP91sPNqR6PcOA5t6Ag0Dza9wgLCW7j87gxdek1iJBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7873
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Dec 2023 10:48:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191732

Hi Richard,

On 27.11.2023 14:45, Richard Purdie wrote:
> On Wed, 2023-11-22 at 15:08 +0100, Lukas Funke wrote:
>> From: Lukas Funke <lukas.funke@weidmueller.com>
>>
>> The patch series aims to reduce the noise in patches created by devtools. Some
>> diffs are just introduced due to an update in the hash or in the diffstats.
>> These changes are not important to a reviewer.
>>
>> Stefan Herbrechtsmeier (2):
>>    patch: extract patches without diffstats
>>    patch: extract patches with all-zero hash
>>
>>   meta/lib/oe/patch.py | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> I'm fairly sure but haven't conclusively proven this causes these
> failures:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6095/steps/14/logs/stdio
> 
> 2023-11-23 23:31:16,216 - oe-selftest - INFO - RESULTS - devtool.DevtoolUpdateTests.test_devtool_update_recipe_local_patch_gz: FAILED (65.60s)
> 2023-11-23 23:31:16,216 - oe-selftest - INFO - RESULTS - devtool.DevtoolUpdateTests.test_devtool_update_recipe_long_filename: FAILED (53.35s)
> 2023-11-23 23:31:16,216 - oe-selftest - INFO - RESULTS - devtool.DevtoolUpdateTests.test_devtool_update_recipe_with_gitignore: FAILED (44.11s)

Unfortunately, the patch indeed causes the tests to fail. The 
problamatic lines are in the 'lib\devtool\standard.py':

if len(firstlineitems) > 1 and len(firstlineitems[1]) == 40:
	if not firstlineitems[1] in changed_revs:
         	continue

When the commit-hash becomes all zero, there is no way for devtools to 
detect the change. I'm a little puzzled how to handle this situation. 
However, I still think the all zero hash is usefull since it will reduce 
the noise when developers review their changed in git(lab|hub). Maybe it 
would be for the best to remove the check?

Best regards
Lukas

> 
> Cheers,
> 
> Richard


