Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.77])
 by mx.groups.io with SMTP id smtpd.web11.3370.1620266753733319387
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 May 2021 19:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OT+XNAf6;
 spf=pass (domain: windriver.com, ip: 40.107.237.77, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ndR14eYsuusK7zQn97jQjUb0aWrhJ014CiN2F1eHKY9DBN3C6xyxuBJwLX6462T8bDI3WyJUkkGEbY8nbo8lsULJkYBIr0oSTAcd7GjCF5MXVpTKg/S8PAzgXYbwLrZzvDNwz5heIXWwKjWvAyNDxzoT6SDJBeqh8fq1wr7DNRclr1XSXFYETvu0nYbTVXPeFTtxS4sSbe+xmqYS3N+g/vXZPauI0348Jmp/IxguiLZzYNuqdFb+vfOeoazMUoUUJswXzCSEl0ZubwiCkA3G6dLMYs9jglSEGDX5p+zcHiRPdpBfJ6vBLIOQgrvFY4KtxsSPHV0SFJ0Go7tevNwrsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zx79BDU9Mkgv2MjsnI4nYs4Hi9vDLuYRp9P24MVj4Wk=;
 b=X5RwAXZ3uCEndWHKzOluzBDifqQvMRYpc4ZTa7S8xux8kYWQ5TgJpRRCUfR58HCIA0Y94kMs5+hU8+yJC7cMouhhjejRg57B1ppOBDXRiCdwyQnvBg8QYM+LOpyQ4jeQ7Ey/XdG6RmH8LP3I8GRKAB7ggusQZqC05r05IxTJ1fLjUgmN4YcElx3+qzBf3GWThb5jVMjuogX/32ztx846frKjbY2Anba18MfYUdEvu6BvuzZfiKWFdaVpZJMFUb3Xm5BnQjGGESEeQANJMA+6hNFkH4Fda4k+Mk9wEhhluXaG5TpHtu5XRXXJ8cYBMZepF7MbPe5hq73WjQFIrNb8OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zx79BDU9Mkgv2MjsnI4nYs4Hi9vDLuYRp9P24MVj4Wk=;
 b=OT+XNAf6rmiN094UY8zyqZvtQ+0mTUkK8RvHgXVtuBf01xJJEo9vlsj/yzWLdaDxpltKIN4EgcnGtZZCM377vOB7aEoyihnIc8jHSjuMZc8VuokkccQng0HoAReyNWrVSMKoUVGbIFwRpYL1znXgHqg1raevgHmlLzkMQjwWGQQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BY5PR11MB3895.namprd11.prod.outlook.com (2603:10b6:a03:18e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25; Thu, 6 May
 2021 02:05:51 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b%7]) with mapi id 15.20.4108.026; Thu, 6 May 2021
 02:05:51 +0000
Subject: Re: [OE-core][PATCH] oe-pkgdata-util: ignore SIGPIPE
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210420083756.11588-1-Qi.Chen@windriver.com>
 <1340f9b6c44a0c6b62dc2cbb37474e9d0a4b8253.camel@linuxfoundation.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <b70403c9-76aa-9931-1481-844a5a18dc42@windriver.com>
Date: Thu, 6 May 2021 10:14:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <1340f9b6c44a0c6b62dc2cbb37474e9d0a4b8253.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR01CA0057.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::21) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HK0PR01CA0057.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.4108.25 via Frontend Transport; Thu, 6 May 2021 02:05:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84e1c464-701a-4b63-56e0-08d910337963
X-MS-TrafficTypeDiagnostic: BY5PR11MB3895:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB38950DF85CBC53FCAD28D01EED589@BY5PR11MB3895.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KdVeN0Rdr3drRflEeI6KOqv52w6ZIgI4S7B1pPFgcavakI6YeDsKiMzxJ40SG8exnL0ff++uKC74z6xGtykMufXJYYb9P7z9Ix4eYcDs47bnBAaCKoz7nE5D7jOXyYHuxxj61c9C6nzx3gIgg77brNiGZeOnZTQalJRWyKT9Kew9M6iP+L32taEvVjIHDBwb4AZae8mqp2NoG56+sP/5rIVcS0X94lvXvbmRKYzlancnsQtz30ZugoDCLnyOu33Q2V+m6OFp/4bcF1p4Sav5GNB/hkmi+MJSDfnduwnK68ML2kgYrjttT73Ehg292ztAvFPozNA1GiXDHGZ7KlBuhai1ECKDbNEpy73hdB9VXkSE4lzLysMrTM4OBE13tVQyU6foEk4jVvPYiX+aiYElfWvydx4JDI7R7nzftGVdD1FH2Qu4nOngXyGb27c83m4jHWUT+Ou2VlKbf7YLUrijPxJipZ44OV0rIPT89VMv170wYD4eL3dLZ4PtqDYmoU5MHAqOzH8mw25nb3eQ0TMx17byfzdtNOF2eoTKhrAxbGofOIAPZl0chaK+AdzDl+w1TfDuFu8CpJ6OTicxDXmLjXUz6gyTF1cyQO7aFezvYAIsrE9fB85j8LSPqyLbOSLOfNAirSxaSMVXg+8X1NxpgWSEKkj5dMaodch1z2M90FS3Q2E1PeM4u8aib5aw7XwB7smGf0VOSDY4YsVXnVBM78URoFYAREg83PzyZodTAhp3zeXwrodhkKbGDHHAZ6EfN0CeYkBMaMQt153L+kgdMjU185D1qwoejwcH9SwjmHY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(396003)(136003)(39850400004)(376002)(8936002)(6706004)(31696002)(31686004)(5660300002)(52116002)(316002)(478600001)(53546011)(16526019)(2616005)(26005)(6666004)(186003)(6486002)(956004)(36756003)(38350700002)(16576012)(86362001)(2906002)(38100700002)(66556008)(66946007)(966005)(8676002)(66476007)(83380400001)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?UktOeXhGMDZGS3dIUWs3ZnpyRVN2bjNYQlRLMmVlaEZsZ2pyNWZrRlZuUDN2?=
 =?utf-8?B?bDdFTlJXdUhNK3hma3g2dVIzVzV2QnowNjVKZUtzeDFDQ1BSSGp4L2JkTlZq?=
 =?utf-8?B?TEc3NXI0RDRxOGgzMkQwVW5kMjBsZFZWdHNDcFFjZGRhdkdPQ01mbUVrTzlO?=
 =?utf-8?B?Qkt2V0tqODVGUDU3blVKMVJ4ZHJ2eSsyd1hqd01ibTNOY3REUFdwcVVmN0Qw?=
 =?utf-8?B?bnVXZUJQVDNFRklqOWxTWnFyUXV5dWlYVEM1T3JaQjFBdDZIbjdQdkpwV1lL?=
 =?utf-8?B?M3lUb0JLLzg4T3V6dHBCdk1tY201THFqSzZqZjVaa0kveE1wRzNZMnI2QzVF?=
 =?utf-8?B?RFlWcmtPNEhTME54ZVJWSjRET1B0NkVSNVR4ZlJ2UkRrTDBDVjZYZDBGZExh?=
 =?utf-8?B?WjB5aUpiaVk3aVlOUTgvTDQxZjhRSjhWL1RKVjJmOUdzNTUrdzZXQU5ZS2NY?=
 =?utf-8?B?Y3p5UDVRQkVLcXJIbWVlb29PbU1CSFA5ZHpKV01LSTh4dGdwQUVRR25TSjA0?=
 =?utf-8?B?S1RXNXNjV2RLeCtnMGMwazN3K1FaQStnZDhqV0l6bzM5V0I0Uk5uTStnZHB0?=
 =?utf-8?B?ZGROSHpFTHRsZjVTWGthM2YvYVdkcWRTK0RWc2ZMTml3ditaMUZFYjA1c1E5?=
 =?utf-8?B?NWU1ampVaGVUNnZGZnlQajk0ZDhPV0w1bVdEUHVSMnZVLzJCNXBKSzJPWHhm?=
 =?utf-8?B?RUxXNU1TZkxjR2hES0VZTEZlWnFTOTZuNkdBbEQrY3o5aGE0ZmZ4ZmlNQUpT?=
 =?utf-8?B?bzN3TGFKbE0yV3dpTGh6aEZqbDZSczRQSVplZ3BFV3lUNnV3VU05ODIyR2RU?=
 =?utf-8?B?Rjk3NVZJNlBwQlNaUGVGZllHS3lxY1pzcmxMZG5aUGd0SVlsV2l3dEw4TmNY?=
 =?utf-8?B?S2R3ZkV0Zkd4eEtLa3FEWEp3SmpWc0JCS2owampyMjJtRFlyVERFS0hxUHZJ?=
 =?utf-8?B?UXh4b1pnTTJ2Sm5NQVB0Z0w0Vi9mR21jK0JXNHVZVUxuclVXN2pLTlNaanVs?=
 =?utf-8?B?Zm1TVHk2d0lMelJDSXpIL2pvTHA1THJTSnpOdmJMeVRTRitMeExDZ0lyWUpw?=
 =?utf-8?B?OXVCZ09oRVdmUDZxb25pTWc2aUZ0VmtUUjJiVmN1QTRaY1crVzRPSkZzQml3?=
 =?utf-8?B?UE44cE51d0w3NVUzd3NLbG9ILzA3TVJrSUt5ZHNVVUYxU0xkTVFleGQrcXcw?=
 =?utf-8?B?VFpQUlFpN1Naa0NVZlk4VUNjVnkwbHFKZmZuSUl1ckI1QXZHVlBmYitSME94?=
 =?utf-8?B?dElIQnI0ZFBCTkRicDN0ODdPOC9tenh5UUJjZCtSNVJWRmRoSnRZem0zSU1O?=
 =?utf-8?B?eTM4YWtCSmRaSzBZWEpGTGtzL3paM1dPYmhQc0VYbFFYNGRtcm4rWXNSZnZl?=
 =?utf-8?B?R0xJa0Y0eTI3MHMzZVJMTTluTWFSVTNaRkRnNGFtUjkwb1JwN2JCcHhDUGtD?=
 =?utf-8?B?ME5EbXp5MnRhZTk0VUhJaHhaRHcyeEJ0dmt6dkFCSFk4dUZ6Q3JheU5zVkdi?=
 =?utf-8?B?T1FaMFhrODFldzByVXdoYXhIelN2bVU5b1VjRWVhclBsM0ZrcWIvV0lRMVQx?=
 =?utf-8?B?Vlo3VmtmRG8vQmNFQll1ZVFhRHkzSnhDakZxRFljQzY5cU15bmFIMCszdWRk?=
 =?utf-8?B?eE4zSHpDM29PMUEwU2ZvazhPck1YUzZRZThvTmU3a0MxNzRSc0h0NWVkWFZp?=
 =?utf-8?B?eFp6QVNZL2lXTGpDa2Nqb29sV1hXQ2o4MCtyS2pWZm1LOEJ0VWNlWHBhR01n?=
 =?utf-8?Q?JC+Vu1XVDFMRgsAyBVbkNX/qdS19ayqovgSxg0D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84e1c464-701a-4b63-56e0-08d910337963
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2021 02:05:51.7114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9sn90DPPMSlSBg+AsArLwLRrCvLYrq0laoh6R7ZGmml8r/RvYD0qAdeao9zboWdobWxwmDKiDEiRXQ6auDk1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB3895
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/30/2021 09:34 PM, Richard Purdie wrote:
> On Tue, 2021-04-20 at 16:37 +0800, Chen Qi wrote:
>> oe-pkgdata-util sometimes outputs a large amount of data. When used
>> with pipe, it's likely to get the following error.
>>
>>    BrokenPipeError: [Errno 32] Broken pipe
>>
>> The problem could be reproduced by running `oe-pkgdata-util list-pkg | less'.
>> Type 'q' after running the above command, and we get the error.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   scripts/oe-pkgdata-util | 5 +++++
>>   1 file changed, 5 insertions(+)
> This is far from clearcut.
>
> https://mail.python.org/pipermail/python-dev/2018-June/154191.html
>
> Not quite sure what to do about this as there are pros/cons...
>
> Cheers,
>
> Richard

Thanks Richard. I've read the material above and grabbed more knowledge 
on this topic.

At first, I also wanted to use the 'try ... except' clause to handle the 
output of oe-pkgdata-utils. But there are multiple places for the 
output, so I figured it's ugly and not necessary.

People mentioned situations where setting SIG_DFL for SIGPIPE is 
harmful. That's true. But in respect to this oe-pkgutils-data program, 
when setting SIG_DFL for SIGPIPE, what would be the actual problem in 
practice?

So I think https://github.com/python/cpython/pull/6773 is meaningful, 
but it does not apply to all programs.

Anyway, if you think using the 'try...except' clause is better, I could 
do it and send out V2. But I'm still wondering what extra benefit it 
could bring us.

Best Regards,
Chen Qi

>> diff --git a/scripts/oe-pkgdata-util b/scripts/oe-pkgdata-util
>> index 75dd23efa3..4aeb28879d 100755
>> --- a/scripts/oe-pkgdata-util
>> +++ b/scripts/oe-pkgdata-util
>> @@ -17,6 +17,7 @@ import re
>>   import argparse
>>   import logging
>>   from collections import defaultdict, OrderedDict
>> +from signal import signal, SIGPIPE, SIG_DFL
>>   
>>
>>
>>
>>   scripts_path = os.path.dirname(os.path.realpath(__file__))
>>   lib_path = scripts_path + '/lib'
>> @@ -615,6 +616,10 @@ def main():
>>           logger.error('Unable to find pkgdata directory %s' % args.pkgdata_dir)
>>           sys.exit(1)
>>   
>>
>>
>>
>> +    # It's possible that this program will output large contents, and when used with a pipe in command line,
>> +    # we will get a 'BrokenPipeError: [Errno 32] Broken pipe'. Ignore the SIGPIPE to avoid such error.
>> +    signal(SIGPIPE, SIG_DFL)
>> +
>>       ret = args.func(args)
>>   
>>
>>
>>
>>       return ret
>> 
>>
>
>

