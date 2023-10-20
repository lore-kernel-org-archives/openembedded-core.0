Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B049FC001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 08:10:26 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.129])
 by mx.groups.io with SMTP id smtpd.web11.49908.1697789424016206862
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 01:10:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=NgIZ991T;
 spf=pass (domain: prevas.dk, ip: 40.107.7.129, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cx+7KDJ165yOVkAE6jRW4bKqy42FRBTMagSWhG8rYQzFV240igVcMqqZ4PwZbPuPCmgQ26vwLuR0K0WJK24KEQ3a8OZHuCceLzbJZeX+e8CtfbJL1DTMQNW/iK4UrB1PSjiVLj2zFrGnjaSZuCD5/HdZJgDCu74pPX2HcAab+Y9nSbxoJkSwI0tF5bYn87rP0WS03ceVe7IRNMC74JyYNyjEgoRBGzTLtx0RNWdpYAWuKWrp96iBlUgykeHf9D4A1LN6Fa25c2GRhDj05PNs/Tin5/WjNvbo5zBbpKP/apLUkXn5u+q/N67caA8RAb8F74TDTr/a1W1ADeEr14yAbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zsVi6NcsNup8/j28FWls/S0ShxlCMSvsY2KbQOOTNKQ=;
 b=EVIfOyO4E+VY+T0KWiIFzKTdpNj/TBZh2ZwLEF6onm4WEHnk+/jMrJ8eKOITFIhjIFV0mlgmF8809hhYOnT7Dhg+YRimcwRJdwmobpWLWvLNMN08+/HzmeG9YlbokZMenPoOairCEVtPHfSGRnmZuOiNs53mSioTNNSaSGpNSDn2Wbz1orqNpwjtdYkyfO6wVQXkyPqPtFN4GwmSRxkJRk1fE8XdUA1GMID4nXhmXXwQHzWe9POirfoOTF1ReiTWTFWAXBrcNjLhtdcZpHsdp4No2g9iXjlQyjsZClbXEPiUVILGGb7m3WJEieqU9LqzSuho0Da2iLZW0zbgPJw1XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zsVi6NcsNup8/j28FWls/S0ShxlCMSvsY2KbQOOTNKQ=;
 b=NgIZ991TCgzjduC6BZEbZjj2RGartpElw5Rb36HLWaD0rqm5CXDkydu6/VgMai/q2QvsCnEBPX/ugoY02V/9BGQMZZks9oXy8fTtdcWFdoZDsPZ14ToSX/dl1EElBJlDafIZlf3WGKJ1Y5zKgh4wGrBDHqM3jM61Bep2XPe+5vk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:45a::14)
 by GV1PR10MB6266.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:92::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Fri, 20 Oct
 2023 08:10:16 +0000
Received: from DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::52ba:4d74:6ab:aa5]) by DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::52ba:4d74:6ab:aa5%7]) with mapi id 15.20.6907.022; Fri, 20 Oct 2023
 08:10:16 +0000
Message-ID: <1603003d-f5a4-4293-88f0-4b1ea006404b@prevas.dk>
Date: Fri, 20 Oct 2023 10:10:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] perf: lift TARGET_CC_ARCH modification out of
 security_flags.inc
Content-Language: en-US, da
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20231019123202.2195576-1-rasmus.villemoes@prevas.dk>
 <a56768bd90877ba40e6856e1324e2ded90b62201.camel@linuxfoundation.org>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <a56768bd90877ba40e6856e1324e2ded90b62201.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0044.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:b::12) To DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:45a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR10MB7100:EE_|GV1PR10MB6266:EE_
X-MS-Office365-Filtering-Correlation-Id: c4dcb8a8-477b-4499-1137-08dbd143fe12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6tjXXdufXcHfHqH5SMsGu/PHmp136fxkwoFLyLZ3O1Wl3uuVZMIHewUn707j8Ozn6v9vasPGnvxv6lEcXXQJSzt80f5KQEOQCRcXm8OSprHMPudrXAhmMcaFQB1GIeGb9T7qk/gNyj7rR1nQBZWw/nOzxabnG3fql5ddqZXIaJhtSB9vAZvjT7JOFuIbp2SJKgH5eqpJP8N6lI1YovGgL6hzjv3Hu3QLcWYG+6f6SYBNbyTPt7vMHwajHKEWAwwkAuFKzJ3iutC4H0WGbsmaZEbM1l2lt4zOKRRfLcs26yWiUc/NU3dgWbZASUWAuULDqfQCMpXt14ES6Ut6c5lAXta6kYjyolv9BOk0FBlt3gFKzCv+ZI9tKf4C7cyQ3KqzwjfXlXfOCBtEmtqR6tObud98fQ5txqXj6vUmWTQlDjygSkMQEortCLg0+k6r7gob+xKNx+7KNU3XBSmw+si95uX0O52AAeGXk4dsJBiH/TGQev4uoyTryKaNjskBi1LxBax4fPEM8mf3DccIx1M9rLI/smYkA7EvicymxVCF2Ai79FISifPMoyS5l7XwwgQk6uqYBalBY9oTsWqbjzvWdh3xUwXR3tJ1fSv9pcIBDGSPeqtfAzf10BsV8l+RELpTy0qQjF59hvqrrxJ0T1QZUw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366004)(39850400004)(136003)(376002)(396003)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(15650500001)(2906002)(4001150100001)(6486002)(478600001)(5660300002)(41300700001)(4326008)(44832011)(8676002)(8936002)(8976002)(316002)(66476007)(66556008)(66946007)(83380400001)(36756003)(31686004)(86362001)(31696002)(2616005)(38100700002)(6506007)(26005)(6512007)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?d2RMckQzOHRreExlRnRJSXp5Y2pJVk5tcFFNcmxGdHVnY1BKYlRXU0dLUk1l?=
 =?utf-8?B?U04zL25tSUdBbncxRkhDcENkY1ByMXFqb0txUWN1SGNFREU1eWdMR2JXcXFJ?=
 =?utf-8?B?NTNXYTNXNGNnYzFOY2RPV1JsamdFSGRBbXYrU1d5TWw5RWk2SEd3VTFzYU1O?=
 =?utf-8?B?eHlKakFGcU16VjM2VDREc0wyVGRjbnVZMnJXYkh5cW5pQjhSRmxVYlUvRElZ?=
 =?utf-8?B?SnlnVytPM0xKL3ZXWXoyeUwrdHQwS3VQNm11SHhRSlIxMGNzalBaZ1EwUVFK?=
 =?utf-8?B?Q0hiT2psZVRmQ1VkSnhPa3h6Rm94NzJpZGhzbGVPM1NOL2E4YzFlclJaU2Fx?=
 =?utf-8?B?MkV0ekhsNWFJeHNaWWhvZGpsYUN4UHdIaTRuYkllbVg0YzNWNjJzMUkxY1pB?=
 =?utf-8?B?SGw0QnFjMi9Nbis2ZWtYK0g2NlRheElyMXZwWnlmMVhEN3o1MStHd3pkRlEw?=
 =?utf-8?B?cGRQZlRKVWpwVC9GdXc1RUtGNnh0c2Y4NlpUeVBoRXNTdHZPaGFocThFOVhV?=
 =?utf-8?B?NnQvYUVTVmVKeW01dTE5RVZYamtKTVRuSkpzaWRuN25PRkxuaVRSWkk2SWNa?=
 =?utf-8?B?NUcxSmhEZnRuQ2RmRGkvTnJmQTQxZDdWOFQ2RWg1aGp1Rlh4R0Q4dmRWK0Zm?=
 =?utf-8?B?Q21mTDZrZXg4STNLTFNUdHpYcVdDbExURUhDNnJEaXdLYWZtRGZIdnNQRmQz?=
 =?utf-8?B?U0JZbkxHWWx3cXViYWh0aXNCMGZyVHI3clp3NHZRK01yU1FYNmxZbm1iRWFi?=
 =?utf-8?B?WHJOZEN5NUdQTUhJK2RUdmdJTmt2cG92RGo3Wi9lc0lVcVljeXM4cVJ1UEE0?=
 =?utf-8?B?WE1YWkZYNDRLNm9NRlFYZmJoM2M0YmN6bU9pUVdLeXJJdTlEOU16cTVYWjR5?=
 =?utf-8?B?Qld3eDlDVmRzVnlXbFltVTBjaU5FeTdnNXJzVHhxL2JIMWppc0E4bnZEdElG?=
 =?utf-8?B?V1BNclozdUhISGc4VkxIdUVib29xblZJbGg0cmtNMVlaU2JyL1NFNXN3RTBM?=
 =?utf-8?B?RkUxZEFFaDdmNUhUOGhzYTNnMnllUWdVZmZNWEZLUy82WWwzc1JPcEJsdTE0?=
 =?utf-8?B?c0tJbExkWTVyT2ZrS0I1MUc2UTBEaVJFU1pYQVN6STBBQjErUUZab2wvNzRq?=
 =?utf-8?B?TTI3a0hMNmJFaTB3ZDhyUXdteHZmU1JqUmEvcENiRU1HaytndlBqdDl2WldB?=
 =?utf-8?B?a0tKbEUrUy83M1NRNVZMMTRhMVhEOUlyYTE4ZG4rcm1hRUZmMmI2bXJYT2xz?=
 =?utf-8?B?Vmp4S293SnIza2tuRzljM0ZlWDFVaC90QUpuNWtzOGZ6UjQrZEFERXB3Rnc0?=
 =?utf-8?B?cXBTbDdpTk5uV0VOK0ZmQW51NFNNUEJ2OUVTN1RiUVdEYWxsNFRxczl6b1J6?=
 =?utf-8?B?K1RwNEpxdHRSY0FMdUIxUyt2SlY2T0FZSEZXL2RDUGJCN01UR2dZQ3FOYzRF?=
 =?utf-8?B?Nk1TeEVDNS9XOWZhSUFxckF3U2xHMWJjaGd0OFZGSC90RTVkK2x0RlpBWWha?=
 =?utf-8?B?VE4rK280ZklXTzM2MHgvelA3M0tRaFhoWUZocVd6MkVXM3ROd3I0aGZ3Wi83?=
 =?utf-8?B?MEd1ZXBVbGY3NVoyRGdibGhSNkcrN2RZS2ZCeDhUNUVBeEJsNzQzRStjR09T?=
 =?utf-8?B?RDdUVW1jSmFLS09RTk1mWlRVWUlCd3JoVlRacmR6bWozNG9yODFFMnU3cWZo?=
 =?utf-8?B?WDg4V3VaRnFXRXNsd1R4d2RDbDJHOU9HTThkcWUwcVJrRkp6eFVodUNzU1dm?=
 =?utf-8?B?WTNmTWxXVUhGVWRLL3FGbE9vdmJkV3l5MWxVbjI0SlJzc1FYR0FKdHhaZGtJ?=
 =?utf-8?B?eW10eDNUMUVKU2lYREJKa0c2NTgzeWQ4azRTTXZ3TDJhMk40OGN2MGN0WVVB?=
 =?utf-8?B?R0loNFpLd050WVhFYUZ2MWp0VlBrZ3lvWmdkanRrSEgvcC9VOGdIQVRtVE45?=
 =?utf-8?B?VXlrbXJ0U3lYZE1wekk0NGdWLyt2U3BWNGdSbzRmcnFQeDJSaHJBQjZqUWNn?=
 =?utf-8?B?KzFnT0wya2cxYnpuTzlpRFQxbTBIUlFzc1BaaHE0ekNIOXhVR3luNElNaTNJ?=
 =?utf-8?B?TE9BM3BDY1hYaktXYkFtZzZJeW5hSFlUUkExWlh6TGJTbm5BMjJzWlA3WHll?=
 =?utf-8?B?RjkvQ0RTZjRrMW1ZT0w2dmFSOHRmenhBMjFHeXluTHNJZFdNbU9DUnJnSFlV?=
 =?utf-8?B?cFE9PQ==?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: c4dcb8a8-477b-4499-1137-08dbd143fe12
X-MS-Exchange-CrossTenant-AuthSource: DB9PR10MB7100.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2023 08:10:16.0618
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9XrdQSstn0BZqmkdCE7RtmWQh2zai2vtKKm4f5G8MaTUwwW5dQGpn/JmDh2u1SAETowCP5Cfp/eTi8UIP674D3aRhMy8htLUd4DTsMlYPqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR10MB6266
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 08:10:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189508

On 19/10/2023 14.48, Richard Purdie wrote:
> On Thu, 2023-10-19 at 14:32 +0200, Rasmus Villemoes via
> lists.openembedded.org wrote:
>> From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
>>
>> Building perf without security_flags.inc being included in one's
>> distro results in the buildpaths warning
>>
>> WARNING: perf-1.0-r9 do_package_qa: QA Issue: File /usr/bin/trace in
>> package perf contains reference to TMPDIR
>>
>> because the ${DEBUG_PREFIX_MAP} does not get used. Most recipes get
>> that from CFLAGS, but the perf recipe explicitly unsets that.
>>
>> Now ${SELECTED_OPTIMIZATION} of course contains more than just
>> ${DEBUG_FLAGS}/${DEBUG_PREFIX_MAP}. For most TUs, perf's build system
>> adds its own optimization flags (-O6 for odd reasons), so for those
>> including the -O2 or -Og doesn't change anything. But looking at the
>> .o.cmd files show that there are some TUs which currently get built
>> without any -O flag. So for those adding the distro's
>> SELECTED_OPTIMIZATION seem to be the right thing to do.
>>
>> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
>> ---
>>  meta/conf/distro/include/security_flags.inc | 1 -
>>  meta/recipes-kernel/perf/perf.bb            | 1 +
>>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> The fact this works suggests perf is ignoring TARGET_CFLAGS. Is there
> anything in the perf build system where we should be passing in cflags
> we really want used?

Well, IIUC, the normal way TARGET_CFLAGS would take effect is via the
'export CFLAGS = "${TARGET_CFLAGS}'. But in the perf recipe, both
do_compile and do_install start with

        # Linux kernel build system is expected to do the right thing
        unset CFLAGS

And perf's build system does indeed add lots of flags of its own, at
least for most TUs, but nowhere is any -f(macro/debug/file)-prefix being
set.

So I do think that TARGET_CC_ARCH is the best place for flags that we
really want used. At least as an initial step, because this is known to
work when using the security_flags.inc file. Maybe there's some cleaner
way where we don't unset CFLAGS, but that could be a giant can of worms.

And yes, a comment should be added. Is something like

# Perf's build system adds its own optimization flags for most TUs,
# overriding the flags included here. But for some, perf does not add
# any -O option, so ensure the distro's chosen optimization gets used
# for those. Since ${SELECTED_OPTIMIZATION} always includes
# ${DEBUG_FLAGS} which in turn includes ${DEBUG_PREFIX_MAP}, this also
# ensures perf is built with appropriate -f*-prefix-map options,
# avoiding the 'buildpaths' QA warning.

too verbose?

Rasmus


