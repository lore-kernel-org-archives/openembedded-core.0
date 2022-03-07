Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B947C433F5
	for <webhook@archiver.kernel.org>; Mon,  7 Mar 2022 11:51:32 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.43])
 by mx.groups.io with SMTP id smtpd.web12.25327.1646653889219432299
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Mar 2022 03:51:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=Y3Ftqmwu;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.6.43,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJgkG4fPumhZ5dExKtxY8FjfmUZ4GQcog0cvLgaLgkpU6skRNf5cVht3A73RuLJkeAUFj7OMusSSKBkjkpejF8tp25kvFQVIfSzu160BWK1l7VU/FWiT65aCOUzF+X8W23KiLwV/KZaSjaVIma3eWWpaJPLxn6co133lzeq3/rJ4dAi5GDEb0ilGZ66Gta94YfQ7oD8jyJPJJiJPKMjSa9V0RCdyK4fLAwceeUMte4pqjabZdAyUrsSsav80L5q/zptsEA5sy1dopp1tyQg5h9lruMHD1jvN31U76ZgLgsATGtJLoYc4vMRJ9I5ifvGIJo86HiIJdYd+9JKZYIwC8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=szmxjd0IwNrvmCunMNglJ2y4dkiZ7S9nKVKHXPykZhM=;
 b=E5bpm5+6CXisVD0Sg/Q3ZKKNw4TjRbvogC04gIy0Fg9yR3erzGIWJz7aGKkiHO4qCV73XoFcr2XvAW28Mvz8Fei79/rzcmdRM2gD9Dl6hLJ4u+kCNWDgvRtJQfwBkryz/sqOQ5D01Ztnxnp3rDc+aoEraM/+/kgyI+V7RnoYvaJO3khiyKAF4sSdIDaVl7PuNI2UKqx9+AaGuQFufZZ9DNYEGfu4ZiD8dO/CgHPaQ/zLZu1F/GyvbEGm+WOB5wkLjo8chC+d6ccv2yO3XbdqpOOzikVt5NrBOUfr/ot+mQLiD3G+UzndRy6tA4wINBp4H26u5zGVA1pScaC6NUz+Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=szmxjd0IwNrvmCunMNglJ2y4dkiZ7S9nKVKHXPykZhM=;
 b=Y3Ftqmwu0UUaNNemVZa5T9KicOaPcnGJ7M1On9Pu3Rf+HO9POXabLbFuHm5Kgc8w9mP3rWU7r+pSL1z6a3BX9dSJCB0eAS/43ezkds/leIr5KNXiIspYxq7EGkcZIISoBOgO+ul6O+7IbcTGepy6V3XPFi5XGwM5LNxXTU07324=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by AM0PR04MB6434.eurprd04.prod.outlook.com (2603:10a6:208:174::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.17; Mon, 7 Mar
 2022 11:51:24 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::ecac:a35b:6947:e7f3]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::ecac:a35b:6947:e7f3%9]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 11:51:24 +0000
Message-ID: <8e250ef4-2cbc-a004-903f-57309b7ebacd@theobroma-systems.com>
Date: Mon, 7 Mar 2022 12:51:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [honister][PATCH 2/2] util-linux: upgrade 2.37.3 ->
 2.37.4
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, anuj.mittal@intel.com,
 Alexander Kanavin <alex.kanavin@gmail.com>
References: <20220307112127.21538-1-quentin.schulz@theobroma-systems.com>
 <20220307112127.21538-2-quentin.schulz@theobroma-systems.com>
 <62fd97c4-b5e5-42d5-cc13-ae0883184210@theobroma-systems.com>
 <cdbe8623d35c2ebf943806de4fd4400a8636f4f0.camel@linuxfoundation.org>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: 
 <cdbe8623d35c2ebf943806de4fd4400a8636f4f0.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0305.eurprd07.prod.outlook.com
 (2603:10a6:800:130::33) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 325dbe8b-e7b8-4f90-cbff-08da0030ce3f
X-MS-TrafficTypeDiagnostic: AM0PR04MB6434:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR04MB6434E78B9BBBFD80588DE630C2089@AM0PR04MB6434.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SNYTcpVNGbcvQrR5jjkjRmtAfxJWOzc2LkF6SOK928YKphweKgSfLRkdtL+EjSBnL6dOUML33UqetBYf0XmVfsFYmhrzoyE9xj/IltDAMaN2MzLBOVz4r3JhJdbYwudK+Zy5lyX7RUZOG2UWAzSr2BMS58fLH5LdHzBCoV7d2mwEuV+0NI/0tRk3WFtCMlSdT1trJ16JG1ZQbqcYAETYh8ciE3mbW5W9F2ymcoOd+HZK2/wtPrrSehVrnzmxMpPnEiATTjKDCrMuJ1UZzmEPBTDVV6tOFCUis3cU+VycX33uLEehTLS8sszQi/H/w8o3cMfWkm4jewWihhAi3TGrdGGb5SqUHymh9uELKTm+aPW3YjYOobxxlP5maOw8DgSb5AvhezoTSkkyUFbdafRWlzhn9wVN9MxFC5tGqO6c+9JEDewbQjh7QCa5vY9lKZqEKdnuVMT3xrFQ+N0qcjHAn9KoVyJtfKlwglFH7SWe5O7pXHsCNIN891GGUSyV5qc5RTXX/FEebGzT9vAD00f76exVywYKTNbNdwlRLtcPUItVaB1yqriqceRNQsDVzyAiyIVijEs2M8RjpC5RumMyWEy/hX7w0ggJwOVgXUaBKvMZYa9VD2cr3rQaD1QYlDT5dM587osKaixfk1pL5QzSC7P9FtACui6WIh3UOf5rgFiyTNJZh1llR22++ruUvpxqXsps6A2DTDs0ep0MrMilgJVrnpWv3/7NmehgtNFivNmzcPJIoVxXRSSLlIvwR3B5E3mQ+3KQysscOw4hUUw/cYSmXuBiuu73DOqWP1Hx0Y4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(31686004)(31696002)(2906002)(66946007)(5660300002)(44832011)(8676002)(508600001)(66476007)(66556008)(4326008)(6512007)(966005)(6486002)(8936002)(6506007)(6916009)(53546011)(83380400001)(186003)(26005)(36756003)(38100700002)(2616005)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aDQ4L1REWFZ0V1hyRlBDMnpxQkdVRFYxRWFXanB0UDZub05PbStMVk5GYTdF?=
 =?utf-8?B?VXB1UDdGT3B1eFNrL3hCdk1VK3YvQWtSZG5PSEFBZzd4NVFuNm5hRDVzOFFN?=
 =?utf-8?B?dTdGakxFSldHTCtVUjI4aWJJMEhjc3h6OFMwWWFSQ3NaRDZvbVEyRjFQb011?=
 =?utf-8?B?eG1SWVdkVjB3UEtGZ3puM3MzVCtMTlk4bFpPcmNaWklTcHNBZ0JWaEpyWUdS?=
 =?utf-8?B?SlhhcjNMN2pzUmRxbVpZbmJXbXhPaHNSRUxsVE5DS2M1bCs0QnRYZno5K011?=
 =?utf-8?B?KzNuMWQrVWp4OTZwQ0NmVnRqYlNPYXFHNFA1bGQvcUZ5ZWJ3UHRUemJ3VDNo?=
 =?utf-8?B?aXRpMFNLcXpqQ251bnlxdGRjZDE4dUt3Rk5TVVFQeWVrZ3FjZ1VHQzlyQ1Bh?=
 =?utf-8?B?N08zc1F3WWlVcU50ZFZzWjRpc3VQNnBWbktkQWtkWkRxdk1aQU8rZmo5Q0tj?=
 =?utf-8?B?NDEzTDJma2szcnQ2dEJIWnZhSnBaQXRIOUUvOWltak1neC81RDh6NjJhWWt0?=
 =?utf-8?B?UUNqZklBUXQzQUxaZ2NnLzU5UFJpQTlXa3dVY0c4cGhYTDgyaXo1UmxoWCtL?=
 =?utf-8?B?T24yb3hIWDRudDlWNjJpcjlFRHplWmIvL2RyVmhIaktlSjR6Q1R3N3ZvZmRr?=
 =?utf-8?B?TFJUQndOdHRIcCtoR09GVVYzSEE5L0crZzc0NEJwcll5Q3Z2eHY2UCs4eU84?=
 =?utf-8?B?c2lxdnZueTh5VE9Scld1VHNyQ1Z6STZSekYzZzVmaXRpRkxsK29yclgyRHR5?=
 =?utf-8?B?U0ZzcGJIYWJTb0oyYlA3TjhwVG4xaVpHYzk4dXUxZDBYcDB4bFYxenlyS0oy?=
 =?utf-8?B?VDJxN2pncUFJcHFveTd4UThiR3B1NnJycVkrZHpJZ0FnTmJLU2J5TE1mc0Jn?=
 =?utf-8?B?TTB2WTFHbFpId1VXazFna0JCSFJWK2RFb3Zzd29pWXB2NnBaTzBFcGJ4UEtk?=
 =?utf-8?B?V1pBYlZWdDl0YzNEc0pNWXBDOWtVa1NaQjZ4VjBUWXIyUHJKZW9qVkZsK1pQ?=
 =?utf-8?B?d1RrMlVlSjg5Q24rL0FqR1VCcGtNa0xldThPMzJJQjJpdDlDNXN1eHUvYW9J?=
 =?utf-8?B?UFlldXpEQm9lU1VPRDA0VGJyMDhkT1c5UHhHdXJUL0lwUW5MbWJVZnVLVU8v?=
 =?utf-8?B?ZnN5K0ZGT0U5bmJqU2JBTmVBdi95Smx6VlhkSDAxaHYrV0dkb3RuMzJQalM3?=
 =?utf-8?B?dzNVWDA2YlpERGM2eUhpc2szRFgzZ2FYZHJvZUt4SndYWmV2ME13MmkwL1Vj?=
 =?utf-8?B?MWR1SmNLQitlZEtKNGhPR2NoVWhIcDdtbDBWZUpxdmdSUkxXNnEzblJGNVIz?=
 =?utf-8?B?NDU5TzlOTFN2elFiK0xhSGNuYU95TkZxLy82dWZ6cnk5bkdOQ0kweG5UZjlu?=
 =?utf-8?B?b2dsY1puQlYwSi9pNTJ2dVdNaW5jWm5WNnRUY2E3aHZpVEV0cUZCSzM4cE1R?=
 =?utf-8?B?a0xJZjRtbjY2T2pJVUVrVTV2RzlsbEFKMDRxeHR2ME02czFxSmp1MWtmcSt6?=
 =?utf-8?B?Ukd4aWVPQkZDZDVPbk5lb1dTK0JKb2FNcUZ2aDByeHUwMVY1UXlNRXFCY0gy?=
 =?utf-8?B?RkJXRnllbmtUdG1tNTUvaFNYMTlJZXBIVzVVaDRUajJBVGV2VXJoaDI2QTZ1?=
 =?utf-8?B?ckh4b004d3dua1A4c2dOQ1ZxNXB2OWNtRU1nZmN3cVdaY282c2lia1ZsL3VW?=
 =?utf-8?B?RTloQU9HMWdSa2dpZmc5cVRPZklEc3llcWY3TGZ2dHVYVlhsL3Z3Zm13SWw1?=
 =?utf-8?B?RnRNZDNZMExlaDR0eHRYQ2doNVRrWm40MGMzQTFSMTBIdjNodVBoNjJWckZT?=
 =?utf-8?B?VmFqOExLQU1HSDdrUVRMTFpkbFRyM0lzdFN6WlpGa3ZSc1ZyeGRoVW1kS01G?=
 =?utf-8?B?SC9rcEg2OExhd0JoWUhMRTRkVStsY1dEZUFZS0wrc3Jiek16ZlBZdEZ4SG1p?=
 =?utf-8?B?VnpSZ1dRbHlVUUxKZjYvOHIvVFA5K3QrZlRVbTJZcUl6Z1ptYWJXWE56K1hB?=
 =?utf-8?B?cGs4VDQzRHZoWmtoTUJ4QzVsdks0TWQ3bGlRYy90dUpKaG8rZjJZRitva3lM?=
 =?utf-8?B?bGgxTXZxRDBvSGlPM0VXNXNiWGlmK2ZzcmxOZFNHZWVXY1RHTG9xY3UyRzRE?=
 =?utf-8?B?azRHOW1wOEk4Z01kRHFNaStUa2xwVG9WRm5VWjhYd3BnODl0QzVzWjJpRzgy?=
 =?utf-8?B?a1k0SkpJN1BNWjhycXp4eUJ4NC9NakhBQmt3eGtoeTRhKzdzZHBlYmxYb1c4?=
 =?utf-8?B?cFhBK3NMdVJvNUlaRzZ6cDEwVUMvaWpENVo5RU03ZmdvSldPeHdZWTNCN0RX?=
 =?utf-8?B?U255Nk01QnNXcm92KzNOT1ZKdTl4cXNZL1ljOWNFem50OG1tQ0Rvdz09?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 325dbe8b-e7b8-4f90-cbff-08da0030ce3f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 11:51:24.7107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ruEVqqfARCWl88mKnkG/2ojAFK+Ml+wG2FPbtUATZQVhg9ZYhgA0onq65tLmOgvTtCLV4stvsnB98q6HMarwGJP3RC2Gwp0z/9e+UX3KmRHFGJPTjGCKvApGJZ3upe6x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6434
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Mar 2022 11:51:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162812

Hi Richard,

On 3/7/22 12:44, Richard Purdie wrote:
> On Mon, 2022-03-07 at 12:26 +0100, Quentin Schulz wrote:
>> Hi all,
>>
>> On 3/7/22 12:21, Quentin Schulz wrote:
>>> From: Alexander Kanavin <alex.kanavin@gmail.com>
>>>
>>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> (cherry picked from commit 6a3289c4786c4d278e2bf0ec1a5e04363772d8bc)
>>> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>>> ---
>>
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__www.spinics.net_lists_util-2Dlinux-2Dng_msg17037.html&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=U4eCQXCHnTmgAB4bLm1IJBHGUvY0OlzZwRhwZUecFxMBJMnqgAgrTpTz0IrWUJTR&s=Z_Fk9dO_TkdYJYl46pu81nr28SBx_F4uwjA-u2QRndg&e=  2.37.3 fixes
>> two CVEs (not listed on nvdist database for some reason).
>>
>> https://urldefense.proofpoint.com/v2/url?u=https-3A__www.spinics.net_lists_util-2Dlinux-2Dng_msg17087.html&d=DwICaQ&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=U4eCQXCHnTmgAB4bLm1IJBHGUvY0OlzZwRhwZUecFxMBJMnqgAgrTpTz0IrWUJTR&s=FoMkkE5_1EdZcBKwKLGT1JehXLRN8KwCdyEAunBBJIw&e=  2.37.4 fixes
>> one CVE (not listed on bvdist for some reason).
>>
>> I think it might be useful for release maintainer(s) if we mention in
>> the commit log or commit title if it's a security bump or not when
>> sending patches for version bumps to master? What do you think? (FYI,
>> Buildroot seems to do it regularly and it helps me with keeping my
>> vendor tree somewhat up-to-date security wise).
> 
> I'm happy if people do mention it (I did for expat recently) but I'm not going
> to block upgrades on the information being missing (how would I tell?).
> 
> We're struggling to get people to submit upgrades so I'm reluctant to make it
> harder for them.
> 

Impossible to enforce anyway, as you just mentioned. But making people 
aware that it's a nice thing to do should be doable, e.g. adding a few 
words in 
https://docs.yoctoproject.org/dev-manual/common-tasks.html#submitting-a-change-to-the-yocto-project 
and 
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded ?

It was not my intention to suggest add additional rules, sorry if it 
came across this way.

Cheers,
Quentin

