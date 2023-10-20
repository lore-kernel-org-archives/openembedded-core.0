Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AADD6CDB47E
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 11:19:27 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.127])
 by mx.groups.io with SMTP id smtpd.web11.51959.1697800756551529778
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 04:19:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=QiojRKG5;
 spf=pass (domain: prevas.dk, ip: 40.107.8.127, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KP47J2w9O6UMQW0C2foMraH/J+NFp9nC8GV8jhuSKX0fdAhSlEQu/W/gFY7Em6z528j4MlquimtUHVlYxrXPPYpQQXPv0Qy7b5CJSIxbDfF57dr42rPIG4K7BpCbkUg2RSgFM7tFsOviBiyVnVXo6qGQruRwc9Ikn0E1gPQa/YtjjtTnm5fWiuH+EijvK/X4mhsJyXX1fmx3PZgzGy0pRZl49bksj2uh79RLt1xI+4IG3+Djkp5i59HNAjobKDUXo+sciJOytNQ117Y223b165NTZqfL1SRGMhDeNtQiwpqc7UlKja80sRbfAaOE0psu/C+12GuwQmNU357jmuqEKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x4QQ6xfST7LsoyaypgeBKad5IcalAYT/J24Gyjho0fk=;
 b=I/WMSEsfXHaH68CWZibJsh1AeH6bPJ7sXjYIrkH5m0ZkQwPy+jPV7jd+PkMP641G5/RSPNukfxHf9o7mkjqQysfVxN7+7Q7zpvZvyh09I0+914Oh88kdsWMe1D84CfyPep8LkAUczavjdjx7YbXsVRfJGqi6UObMCfz909WvoaTeskGs7WzPo8Kgbvmhvb6oNlpRvg2h+vG1A6O/FOhCHHgTMWSSSBUyMMMhdeqFyi/GAWdGAsQdqfXrGXI8dSrPFa4d1WD5IeWD23BkoZ8YBK5zduGLn5SA+ZTsROEQoCWN/VnsmcTUxFrcEJ3qYAlYjd5Y6OGQOT9IQRY4REhpfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x4QQ6xfST7LsoyaypgeBKad5IcalAYT/J24Gyjho0fk=;
 b=QiojRKG5hTWDZqlGJTS1zeS+swJvf0jqP3SGaFx+gbCQIXFyRZPbcOCBlHdsXdZCCEHq6/TI3U7LLaBjzuZvsDjwXrzHHRC7oT9ZcCGv8KkKCj197pF4al+lisjUlkyX3a3zNe5hKiSfLA1W9+9NL32sAfye9pdL/bvGarH8IoU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by DB9PR10MB5503.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:306::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 11:19:13 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::52ba:4d74:6ab:aa5]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::52ba:4d74:6ab:aa5%7]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 11:19:12 +0000
Message-ID: <ea0f9ae6-a9bd-400e-ae08-953055f4e927@prevas.dk>
Date: Fri, 20 Oct 2023 13:19:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] perf: lift TARGET_CC_ARCH modification out of
 security_flags.inc
Content-Language: en-US, da
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20231019123202.2195576-1-rasmus.villemoes@prevas.dk>
 <a56768bd90877ba40e6856e1324e2ded90b62201.camel@linuxfoundation.org>
 <1603003d-f5a4-4293-88f0-4b1ea006404b@prevas.dk>
 <64a231dc3d22dfd4eb33ac10f107997dfc7477f6.camel@linuxfoundation.org>
 <ed261cdd-e97f-446a-97ee-f19e16d54aa2@prevas.dk>
 <c7ac9c5d66b59e6dfac098ae236847dd7d625a1c.camel@linuxfoundation.org>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <c7ac9c5d66b59e6dfac098ae236847dd7d625a1c.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0056.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::29) To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|DB9PR10MB5503:EE_
X-MS-Office365-Filtering-Correlation-Id: d3684b67-27a8-42d7-0818-08dbd15e634e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ij7Zi7wraTTk01QoM3mFaF6NJS4ajTXEwrO2B35zd+VXwwkJh0nhZfU3/3mjZCy/jR2A/BcL8hrz+1ZwM4AHyordgo4HGy93jIyPltSlJW6Fsmpm7QZYnFDN05zfRvcnPDdUcLyBnnowNlBIpfFAlg+8Ga8dEuJYEzsuThi4w/GwPDkW0PFJ9QCHx2PcGEEptgInql1Niv+sRSMQqqNcaAK6wphcv5s4elCuH8KLW5LN9lc9hkKr4LRPrAPXNl/zIzeLlPeVmk6aJrZOQqHmwj+XFWvPUoU1Bz0dmlIIDS+WN5KuAOz4wexCHKAwCIgaj80a1DsOeBdbZvm5ziS7yPhGKlSjoftph7354yEd66nBl+XSQH9fyq5qp2ilXhzY233Ct7PrBzjEl38L+no3WVkhWPrOdFvgRnykbHCLEdn1bdMdF7T4nS/vKXW36F8zgnHJ27sH7AlG+nL6qwVBjONV5yy8psoCufS0R/GnB9ap22+pW3/8RFfhnrnX9veqTGyScJP1v2w9flzZwFA0NtOGU/T5Y/++7kYDpoJqUIAYT6K+/QolZDO2mluv8/DizKH/cYnI7B4Gt3Ge1SuhH0KnU6WXjmjp8wi47wCL+KWfFibu9ZA2dIAqC2dL//Jq7Yzh29bOAQj7y9nbItvdpg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(396003)(366004)(39850400004)(346002)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(31686004)(6666004)(4326008)(5660300002)(15650500001)(8936002)(8976002)(8676002)(44832011)(41300700001)(83380400001)(26005)(6512007)(6506007)(2906002)(38100700002)(2616005)(31696002)(86362001)(36756003)(4001150100001)(66476007)(66556008)(66946007)(6486002)(478600001)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aVl1bEdVNDUxL21zbVdZNUNoOE1XenVZMW5zcUx3VkNIMElGdTdTaHZtRzRq?=
 =?utf-8?B?SXd3dEV3dVpsY3p2dmlXRSs2OGMxMFFLOVZrVmZmVzI5V0UraXViT3BWNnRS?=
 =?utf-8?B?ZTRuc1pDbFQ3bkJlYWdhQU9sZlphNFBHdU0wSFMrc3ExSHlzT05IcWtGVVVC?=
 =?utf-8?B?d0FoMWNiV1hwS2xZVGNidm0wb1pqNDJ3RDRaVVU2ckJweUpZQzB1UkxlRTFQ?=
 =?utf-8?B?VnhRUWxlem1VVkxhK044TG9RaTZmSE9HTkR2Z1cvQzNaTlJBVktVTVdhQzhi?=
 =?utf-8?B?aTRwQ21ZMFF5K1Q1bHg5dHRuaWhiWmtvY1ZGSmV5Lzc2ajV1N1pIWGQwMGpK?=
 =?utf-8?B?Nk5UZ05SN0pIcmJSTVkySW9lWDQvc0FRcDd3Sy9CZk1zUVp6cTdjMkl1RnFM?=
 =?utf-8?B?c2dHTm42MzNJREZiQ21FT0QxaEl3R3NZdmRmUDcvRFpkdDNWUkRrMVVSNEZx?=
 =?utf-8?B?ZytNUEtQTnllcHFDRjR5VTFpRG9EWFhYR2pIYVNEQ3J0NGU0QzJONk5aM0tT?=
 =?utf-8?B?bHlRN2tqR081cGt3ZmE3VE5BZ1J3RUU1RHhFNVFwNHBjbk9WZzhpWHBuQzlz?=
 =?utf-8?B?U0dWUkxTQmxkNG9NQ29TZjM3eE1XRlpxcGxsZFZFWUVqQ0M3Wlh4S25SK1h0?=
 =?utf-8?B?cVhPRjZxQkt1T0loWjNNRG53VDR1Z0lDMjNlWHFTTHhHRW9IcDBiazhPUTJu?=
 =?utf-8?B?M0ZwTHNEWHgwekw2aC94N2ZhQ2tWYTJhNy9mZ3FpMFJ2ZnZJalRnTmtmeFZw?=
 =?utf-8?B?OXZtNGl3T0lBclJoWWVEdE84NDlVUTdwTmV2WGhNRDBZakxiWWk4M0FkRkFG?=
 =?utf-8?B?by92SFg5OTJGa3I3QVczYXpCNzRBQlllNE5aRVo1SmFwdC9NbUxDYk1ZN1FY?=
 =?utf-8?B?UGpwdm53dzNHNExsbjJFbjhIRXo0UnJGZmRPV2dtNjcvYXFQZ0c3ZjljSVVv?=
 =?utf-8?B?OUQ0VWNOVTUyTDJOYWROS01VM014eGZ4eFlIaytJcE9UYzFMcTloa2hiMVlm?=
 =?utf-8?B?NDR4Z0xEdXFKOG1wbEQ2ODI0N1kyNUQvSDFhL3BuQW0rdk1UK0FDeUlnZnBD?=
 =?utf-8?B?b1hxMHd3YUJNcDliWE5lVExOc1dyVGZ4dFY1eC9LbmhndDZKbklQamxxYUZl?=
 =?utf-8?B?NytTSmpCeWtaL0VJSzg3aUgvRjNsVGJqVlZmUkxkRHUrNkpqb09TcExaRG5i?=
 =?utf-8?B?WVdrNVV1Z2d0MUhaclZ3SDZIR3E0Rm9CUS9oZ2dSbDZQSThyQWtXWDZPZ0pI?=
 =?utf-8?B?ak1jN1NTUW5aaXd1V04waXJmSUU5TndXdGNUOUx5cEI0ZGJNY2FocUQvaWlK?=
 =?utf-8?B?aWJhZU12M1FQSEZuUmptYlRiNWdMYWZQMkttWG9Ocmx4TWxYbVpIcEQ2Mk1Z?=
 =?utf-8?B?Q0FadmtLTE44TlRtVitXOFB0aU1ySkgvdXQ3YnJZaVdGOS9wZjFJbjRQWFZs?=
 =?utf-8?B?Qmd6TDBxT3VrWldQMHp5dllCaUV4WWZwWnpNT2o2aDQvRWpxL2NtVU1uN2VO?=
 =?utf-8?B?WW1xZU9GL1FVbnh6blk4SG40SEovRmozVWppN2kyVmpGaXZFS1hNZlNpNDJH?=
 =?utf-8?B?aVNxVTI1Q1Vxa1lRdXdmNHYrNVg2WEVuZnZpaE1IRmhmMVlGY0ljU1B6WGg0?=
 =?utf-8?B?eUhSVExPVVp3NHJvWjY3VTM3NmR4Nzczd25XTzI5VGRZUmprbVA3OUs2aTZH?=
 =?utf-8?B?b1NPaTlHV09YUnQvQVc1Rmh2T1g5UDhSRkZGa2c4azM3Z3dVcG1sUUMwMmI2?=
 =?utf-8?B?MjlzVXVpN1dMMW53VHV3d1V5czU5L3R0MnEwZkZaNHJmRi85Q29STU5IWWNi?=
 =?utf-8?B?SFJTbzMzSWpWQTg0YXo5ejJ0em9lcnlrMFpzbWxKK3ZGVTFrbEg1bWRIZytQ?=
 =?utf-8?B?TWxWellDcm9ZUHVZUTI5SWZWS01DanVBUVkrMjl4dGwzM09vU0cvNDZCZWN4?=
 =?utf-8?B?MVF3UUp1cmxWd0owOHBMU1hoV3dVZWNIdk9OM1Q4S2hadW5RRzMwc1ZkaWlP?=
 =?utf-8?B?L0tCUGl1RDRqRytvR0JWMVdjZ0wvU3JET1U5cjVhWk45UXZ0ZVNKVkVRRjZk?=
 =?utf-8?B?L3A1K3JvWkhqa2RXZzVrOFpOVWFyYWowakgraGNRcUVxNVNDRGFoWmovZXdw?=
 =?utf-8?B?TW5WcEk3b0Z4alBoZkk1MW5TSnhVU1lLS2ErM3ZLVzUvY3JPN0htcWpTZzFC?=
 =?utf-8?B?K0E9PQ==?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: d3684b67-27a8-42d7-0818-08dbd15e634e
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 11:19:12.8047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KUontjJJONNjT8xcbt36Gw+i8lnJzfcvXF99J/bqhrgPf7C4TIFdxBK4Hdxvt00HdCzysGu4XKZmXT5D2FCZE8nTuVjQ2FMisyKG9/lTCwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5503
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 11:19:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189518

On 20/10/2023 12.13, Richard Purdie wrote:
> On Fri, 2023-10-20 at 12:03 +0200, Rasmus Villemoes wrote:
>> On 20/10/2023 11.38, Richard Purdie wrote:
>>> On Fri, 2023-10-20 at 10:10 +0200, Rasmus Villemoes wrote:
>>>> On 19/10/2023 14.48, Richard Purdie wrote:
>>
>>>>> The fact this works suggests perf is ignoring TARGET_CFLAGS. Is there
>>>>> anything in the perf build system where we should be passing in cflags
>>>>> we really want used?
>>>>
>>>> Well, IIUC, the normal way TARGET_CFLAGS would take effect is via the
>>>> 'export CFLAGS = "${TARGET_CFLAGS}'. But in the perf recipe, both
>>>> do_compile and do_install start with
>>>>
>>>>         # Linux kernel build system is expected to do the right thing
>>>>         unset CFLAGS
>>>>
>>>> And perf's build system does indeed add lots of flags of its own, at
>>>> least for most TUs, but nowhere is any -f(macro/debug/file)-prefix being
>>>> set.
>>>>
>>>> So I do think that TARGET_CC_ARCH is the best place for flags that we
>>>> really want used. At least as an initial step, because this is known to
>>>> work when using the security_flags.inc file. Maybe there's some cleaner
>>>> way where we don't unset CFLAGS, but that could be a giant can of worms.
>>>>
>>>> And yes, a comment should be added. Is something like
>>>>
>>>> # Perf's build system adds its own optimization flags for most TUs,
>>>> # overriding the flags included here. But for some, perf does not add
>>>> # any -O option, so ensure the distro's chosen optimization gets used
>>>> # for those. Since ${SELECTED_OPTIMIZATION} always includes
>>>> # ${DEBUG_FLAGS} which in turn includes ${DEBUG_PREFIX_MAP}, this also
>>>> # ensures perf is built with appropriate -f*-prefix-map options,
>>>> # avoiding the 'buildpaths' QA warning.
>>>>
>>>> too verbose?
>>>
>>> If it were me I'd probably write:
>>>
>>> # The perf makefile has "unset CFLAGS" as "Linux kernel build system is
>>> # expected to do the right thing". 
>>
>> It's not the perf makefile, it's right there in our recipe itself. I
>> don't think upstream perf is to blame.
> 
> Sorry, I misunderstood. I thought this was the perf environment that
> was doing this so in that case your comment does make much more sense
> than mine.

OK. Bruce, should I resend?

> Out of interest did you see what happens if you allow our CFLAGS in and
> remove that unset? 

I don't think I've tried that, but I've tried a few other things that I
thought would be cleaner but which then exploded, so in the end I
decided that just lifting exactly what the poky distro does should be
safest and have the highest likelyhood of being accepted.

> I also wondered if EXTRA_CFLAGS in EXTRA_OEMAKE
> might be an option?

Based on quick reading of perf build documentation, yes, EXTRA_CFLAGS
seems like a reasonable approach. What I'm a little worried about is the
TUs where perf apparently does not by itself add all its cflags (-O6 and
whatnot), so I'm not sure if they would be built with what is passed via
EXTRA_CFLAGS.

I will experiment sometime next week if I remember and nothing else
preempts that plan.

> I'm a bit worried that the current situation all feels a little
> fragile.

Agree. But the QA checks do help quite a lot here.

Rasmus


