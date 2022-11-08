Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD728C433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 11:48:39 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.73])
 by mx.groups.io with SMTP id smtpd.web11.6855.1667908117878982734
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 03:48:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=mf/+4FdL;
 spf=pass (domain: vaisala.com, ip: 40.107.14.73, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L7dXMJyNSFTM80QhhoQ0tUH6LdA3Ftgvs53rmOywWBqvo5VpJAMPlyUOrlkPc69or6XT/vp/ru/JQitKki0wByj2BA3Q+/+GGRuISKLOA58f6E/wpPvGYQfYi5zsSrU0cqEZeKROg4x08kvHe8AkDK2IvesXTy14bRWl30+XzpwyvpZf+JoILSxCgfX7IRhDkGYO89KTYntU6H+zOSguzsLTc/O6TxbvXMtab57iUY0gYyh0UsubV2K94lYyTjr/JCUdHCFuaBPuTSMC7AkVqEhnOpL01u4Sh53l88Le9ciiK0FYdFsV6nq3h8GmHej9xzyBEHDIz9NBs5FnDWJDuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e8QOwZfuFL+0f8EtrieCB2Tizs/EBY2dElckyu9mdwQ=;
 b=NR8LXaFYWTyM8h3k7QLMbwhOcbSxGgaA8G9iU0lEzOe0dmEmeZB4oBWVMd3wDjx0W2bIss3FsTuLXVD4UaNFYbiF8Jq+JTxAH45zBEU7c586jlkeFGZT6rFdN1IZIvaMb8f4pJCQ7/263K6+yCr9d8rIXVyPDrUCiVI0/4AZbfkg5pq2oCDY8Z2/SzTaRoaLix07cKh5Rh3aO7O0x0ZWlOXFn3JJ/ur4eiQkauqy6xLLhRx3MPn5E8bTODjPKY3dAxXgaeH+FaTlOrofV1/plbG0ALKEvMPI7uS/Eq9pRO7/281GoCHnW0nZuVckF2K7ADBzIeKlzg4C4ey5M2Ybxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e8QOwZfuFL+0f8EtrieCB2Tizs/EBY2dElckyu9mdwQ=;
 b=mf/+4FdL2lGQzURUc6sQ3gkYGkp49insEq/nhYcV8AaSCgCw0l/i0r+LGPXqSIVPpfe81PBQ4LvVwXJNA6hfxCpKKEQkN2UyVZFgxswwcq+nARuwFLzKzPJ2WAkg+hinUG48g2K83lkGDpfzDO/5uepYP17kK8hXGMHOsRxu9cvAdXU4kag6EAaLZhuMeRmyzmJdlFtXN6ZoAOJRGjteo5V72QI85npYc/iUCw2RBGvVKQgmFFQLeXtdCdEYgoCNAqbcb0yWhfRPAmLS+1WH6FrfiuXDkLiYB/y3giuJTdSoOVV2JDvvAluQM544TrZmf/Avn2H64fV3440yFPjwLQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com (2603:10a6:102:2b3::22)
 by PR3PR06MB6953.eurprd06.prod.outlook.com (2603:10a6:102:82::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Tue, 8 Nov
 2022 11:48:34 +0000
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::a2ad:443:3e3e:7baa]) by PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::a2ad:443:3e3e:7baa%5]) with mapi id 15.20.5791.025; Tue, 8 Nov 2022
 11:48:34 +0000
Message-ID: <5e84a23b-1111-470c-11fa-a8cc9d32dcf0@vaisala.com>
Date: Tue, 8 Nov 2022 13:48:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [OE-core] [RFC PATCH 2/3] kbd: Disable 64 bit time with 32 bit
 glibc
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20221108000828.42824-1-niko.mauno@vaisala.com>
 <20221108000828.42824-2-niko.mauno@vaisala.com>
 <CANNYZj9f2nfRbwU1MXn2a7ruKHhkw318F92Lqp9xYd8acvubwQ@mail.gmail.com>
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <CANNYZj9f2nfRbwU1MXn2a7ruKHhkw318F92Lqp9xYd8acvubwQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GV3P280CA0096.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::35) To PAXPR06MB8579.eurprd06.prod.outlook.com
 (2603:10a6:102:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR06MB8579:EE_|PR3PR06MB6953:EE_
X-MS-Office365-Filtering-Correlation-Id: b2ad54f0-fb58-4d78-ce53-08dac17f2a6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	V3FgH+Ixzg1giRi/Zj2sxvur9ZEKOmZEsOps3NFjzV5NJtAE6YTlD319OzvZm7JmdYfV623kL2gis/k/0FQk6iaMnuaCgwtnk5yT8ANUZJCZ5kb2AJchzieqnvilsZELcHfOzDdyfL5DSQsrYiW4j1DRAEzbj2o4Jr4zb8Xs1UM1ah56NNzwNr1lID0kw8qzNJ3MzpIcrGVOihSazu2h/v2R4Alq77tw+NsAkJAh8s09xPmirOUIQMDjdCe3WDm/csSynTOwibumTP5QgXye3kkxNzrtgUZikuqJNwPIG7Y/Uz93EgysGk6CBwXUuFHZlL6C+Jfm3oUyfGXB/kuAg0VrMKx9xNaFu+4oB/TFZxDUOMUS3aVUkHLBigZMKMhCLEuhtuA5Ka3nFnF9TOFBYKIYz49CTlAcICgrJoQnmB04pgx8fw77WVZ0CeVKXNFyqI8u3HdInJDOIiP5UVayweH28oj70gj+sBMCnyLVy+Ef27pxCbTIeVJWs2jPZYOG+53soa31O3cWyqpLQ0ZK8Ubyc1h8G1ZaMCBBZ7sQqBejmAMoUIu8kkZz6pLxfQcfl3lvP8nbmrEhqrhLgzjKSPetFWROPGLa6Xo9Wbf0uE2Gy0x8eJ1ELhT2w5kAdYufmWev7cyMMM8gmztJFoEpufIzxq5vbheoqYQb2SlhBhrp9wFlKziTzf++a2A8MouRj3rypMrxH/G936yRO34Fk5wXVCUlT8iaHjrp2F2+ws0Nk4V8Fljq52KL2q45R6jN9EcNXrHxEk/3bMlSS7KJP8KW8rIcC2Hc9Gf0o8ZW04b0uXbht5imDcnafE8i6Kw/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR06MB8579.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(366004)(346002)(136003)(39850400004)(451199015)(6506007)(186003)(38100700002)(2616005)(83380400001)(6512007)(44832011)(26005)(2906002)(316002)(66946007)(478600001)(41300700001)(966005)(5660300002)(6486002)(4326008)(8936002)(66556008)(66476007)(8676002)(6916009)(36756003)(66899015)(86362001)(31696002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NnNlSURXQzR1N05kd0x4bC83OW1waDFwZlpZQTRsTUlQdDZPMmk3OU1xMWsw?=
 =?utf-8?B?L0UxMnJSdlFaYTJSVFZ5Q0swKzM3a1hFbG41Tk90OVNzRTVqZnVvSmhIeG9P?=
 =?utf-8?B?dmdmcjNvWFFPTzdpWjA3dEJucUhGL1ZnMUJiaGE0cWdVbUdDUDBhQWRvVXFH?=
 =?utf-8?B?RVNIZ3dhUElhaU1nVHcvbFF5eTBnQUJSbFdBMzVjQnpCWVRwQ3dlUCtYcUFI?=
 =?utf-8?B?Z091dTZJOWgraTFBWGtqQjRGYmZQTThXTEc4c3NyNk5heTZ6Ty9FSDRLV1dS?=
 =?utf-8?B?b2xHSVdOdWYvVTFDRU1qY1JkdHNGT3NPRHFnTldHU1llY0F4QWVGTzlDY1BV?=
 =?utf-8?B?Q1ZuNjRBS3ZraTVBREF2ZHBMZHJrZ0xvbkVEbVlPenpxVTNGNndxWGRoM29I?=
 =?utf-8?B?SmRyQWpTSGt5ZjVGMHc3WllJSk1EL2d2L1FWb1I0YXptb2w2TlVOTUgzWmo4?=
 =?utf-8?B?cjNFbnZZSjVJUlFWcE8zUzl2TjhDOWc4Y0NiSWRIaERadnBrSGIyTE83ZURo?=
 =?utf-8?B?SDlkbW1hOC9ua2xwVmVZKzBvbWpXazVOc2xwdHdoUzFVZU5GSktxZ3lLQTZW?=
 =?utf-8?B?WmxhemoxK1pyc3JQMHVsZjBtYzV6ZzI4RTVYMVdDazI0ZGFnTnlWTEN4dkh6?=
 =?utf-8?B?em5YbnpwRWFvS2lkRDA0R1RlT3V0MkJOa1dVdXdKYzluMGRzNGNsK3QxVjI0?=
 =?utf-8?B?aC9FVlozNjlaQ1FUdzhDQ04zVVNtYnU3Z2c5MVBTcFRqNFRvSm01RWEwVmo4?=
 =?utf-8?B?R2N5Ti9VZ0RxYk0vY3phZ0wrOHhYKytseDRqblhBQWpHMVcrMUYzQUgwZWl2?=
 =?utf-8?B?eFpSbTFrQVhoNEhSTmpiYWZ6OS9MYnlQQ0N2c1c0bXJHcEZsVnludGc5NVZC?=
 =?utf-8?B?aWw1Z1AyQXhaRUJGWFRKMWpRVjIzQ2p1NTQ4N28vc3pOUWMwVkVJNmFLeXRB?=
 =?utf-8?B?NG9RQVpGQ1A5aTAyNGg1QnVrYUwrSXFseUVWVXhTUE4yd2F0SE9rQllnNE96?=
 =?utf-8?B?N3ZjWisrY0JNVVFOL3dXQ1ZvdHIxYlp6dE9oR0gyTTlSbTNBMDYwQWp4TjZs?=
 =?utf-8?B?N1hMS0EyQm1acWR4dTZ2SGcyS3pJb25tWFcwaUYxN0M3M0Q1STJhanlNdWF0?=
 =?utf-8?B?QWZ5K0RSb3NBakh2SWdBNXNKdEJFdXFiblo4dytZU0RiZmN4bGRKU0hpVDJP?=
 =?utf-8?B?QTljK0RKb1RvU1dXNTZwMHBUV05oWkFJeXFEZy9WY1FRVCtYRUsyc3UyMnZL?=
 =?utf-8?B?Yk5Ba0FJaERTaytQeVFjaUw5K0NyNU4ycWd2d3k4d0xTVmdFZmlRM1MwT0x0?=
 =?utf-8?B?WU12RDRJcmJ0TjV4Ri81ZkREQzA5MlUyUnlONXBwMXpEdnB4Nm1oVThBVS9K?=
 =?utf-8?B?akh6R1pZOGxFY1kvMUt2TVQxM283Qjd6YXlOOFBYMkNFR1BvQkpZZ1E3NzNQ?=
 =?utf-8?B?aU02M05KU0syS3p1RndJU0NndHI3SHNzOHJ1aXpSMlIzQk02YU1xY25EOTB4?=
 =?utf-8?B?Zm5vbWRhWXh4SE55dnBGZFdaNzRvUjVqTU9ZbE9ndG9WSW1WMVQyeDhrMnlI?=
 =?utf-8?B?K3gwcVFZUlk4T1NnbjBjNmdtSjMxZ0ZKUk5vVHJEaS9RdXBhNHhTL1grQzUv?=
 =?utf-8?B?MXM4bGJaaENLQ2dXNjkxUllvWG9TZHZtblY2YUJpRC9PSDYyTGphNjBJaDVP?=
 =?utf-8?B?SjcvTFUxbWFRUFJjK2xyQUZrZkF0R3o0cUNaWGVBSGdHSGZNTW5jNlMvdTBy?=
 =?utf-8?B?dit3dUZPSlptRURGV3pCdCtINUxpWkwxMXZyRVMvbGtmcldKdnF5YjhKU3Vh?=
 =?utf-8?B?Qkg2aUx5ekV3aWdZVElua2Q2OEwwQ2ptdUdQeEVDclBNZUlza05GRERJU3Nz?=
 =?utf-8?B?UVRuS2JWbkJ2UHJTYm1pYWhJSnlSL2ZESk5OeXRTenJvNjZSOWZtbUFQYlgz?=
 =?utf-8?B?Y3hLem5IbE5PZW04WWF0Y1RLdVo0Z0o1ZTFXV3c2bDkwM2VEQ052c2RtK3Ex?=
 =?utf-8?B?Tk50cXlieS9tcXplQW01d1JtNm9LdlllYlNQODB3a0lrR0JLSStQbFFJUCt3?=
 =?utf-8?B?dTBPazBrcldJMkJnUlp1NDBMUldML1VpaitQL3c2eUtvdHZVTWowRWlvUU5U?=
 =?utf-8?B?UWZJc3FmcmVraENOZld1b0JnRUJTQnA5N2JuaU9qb25NRlBUNHBxdXBDTEJE?=
 =?utf-8?B?U2c9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2ad54f0-fb58-4d78-ce53-08dac17f2a6f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB8579.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 11:48:34.7386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PhAW5PTRkdnIYx4ctOJOml6Cwbr2rwI9niqARZTL4Yh2sm3B0anCDlMEkmtAOATePGhaWfJqKzst+GOCTU8FPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB6953
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 11:48:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172961

I have not studied the issue, but in order to reproduce this error I add 
'MACHINE = "qemuarm"' to local.conf then issue 'bitbake kbd' against 
current master while TARGET_CPPFLAGS value is set to "-D_TIME_BITS=64 
-D_FILE_OFFSET_BITS=64".

-Niko

On 8.11.2022 11.14, Alexander Kanavin wrote:
> We do build for 32 bit arm targets, so is this seen only in specific
> circumstances? What are they?
> 
> Alex
> 
> On Tue, 8 Nov 2022 at 01:09, Niko Mauno via lists.openembedded.org
> <niko.mauno=vaisala.com@lists.openembedded.org> wrote:
>>
>> For now add exemption in order to avoid following failure during
>> do_compile()
>>
>>    | .../build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/kbd/2.5.1-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/12.2.0/ld:.libs/libtswrap.ver:2: syntax error in VERSION script
>>    | collect2: error: ld returned 1 exit status
>>
>> Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
>> ---
>>   meta/recipes-core/kbd/kbd_2.5.1.bb | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/meta/recipes-core/kbd/kbd_2.5.1.bb b/meta/recipes-core/kbd/kbd_2.5.1.bb
>> index aa3ab6e121..b623aecd36 100644
>> --- a/meta/recipes-core/kbd/kbd_2.5.1.bb
>> +++ b/meta/recipes-core/kbd/kbd_2.5.1.bb
>> @@ -18,6 +18,9 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
>>
>>   SRC_URI[sha256sum] = "ccdf452387a6380973d2927363e9cbb939fa2068915a6f937ff9d24522024683"
>>
>> +# Compiling 64 bit time for 32 bit host is broken
>> +GLIBC_64BIT_TIME_CPPFLAGS = ""
>> +
>>   PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
>>                     "
>>
>> --
>> 2.36.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#172940): https://lists.openembedded.org/g/openembedded-core/message/172940
>> Mute This Topic: https://lists.openembedded.org/mt/94880633/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

