Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D205FC433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 23:33:43 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (EUR01-VE1-obe.outbound.protection.outlook.com [40.92.66.16])
 by mx.groups.io with SMTP id smtpd.web09.4967.1646264021911135041
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 15:33:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=C5AEJjNa;
 spf=pass (domain: outlook.com, ip: 40.92.66.16,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HYk4M6oABdzUNcFllyu2Ko86YmnvvegUZDwApzx3z+7pSlUe7gVv/sM7X6Srmgyjhkfk9APw+1E4XtYHtCmQPBLMVPzqld2PJLieEzLsTEsX/2qERCM8c5ZWLlGNQNe2rjwZlNUhvqb3LwIB2TPnBgJNACLJvcC0asaeL4kxghsk1Exgjtf7TXDqpHUVwwFxLeE1ADu/6CLGZeU6xAG4WLIxIL+3MMPy6vmqqo9d9JjR+TQ9UmOGFVqnGKQZqpyDYn6xlujvOB/w5eoRZzeqIlRndh46Szw7c/0BQc9HX39SHN27tvyI1wcN/dFum3JNiDuowwwUNoWixK6K8Zt4dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qkM2aU4vmoMTkrmKlnFoXwsOTVrCZkXXGDU5nDGNFDU=;
 b=GcxR6y2p8vesNP3NoO+lmoha4yaL1pYrrQ8SdRkw603vXFsdw2+kYKTJ2vhC2WoNbHaCVjuVDVRXxfKrY/5TRzZWaiE9lneI2f3gMb4olSQmy0yNYoqsIfVmyo7dFrttDZvoIHz+ZNUdRiEfcnqz9bDYc3/J/bwCqUS491VBh63R4sjA7YTQA4fWJeZiTPj0YBu1CWZEb2RhDK80GBw+dW23zvP4vYgIoWXivjERol55TFzzVR8KUSOZSeooAB4QC6lS4qv96RiLxDSuz7nKsmtrHUmatlutL6D8OSKXooZBUvpTA/M0uXVltDwZTZ69LxMI91RTN4qDuQG/9VBdzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qkM2aU4vmoMTkrmKlnFoXwsOTVrCZkXXGDU5nDGNFDU=;
 b=C5AEJjNaKAD8BcboPXecPPG90ymOE18GqacWu0ZPCN2szLjQHzEIenJ61zBfYfN7cHNZJj4iuaT6k0Y83NbOJC3mMQNB1CZD2aDAV/hsrDCYilwAfLmQRWO5ncg/DMbBrrxcE5sbF+Cptf4302QQ7h01sOy8yU3ApnzlBc4QPDd1njYP5e+Tvyb2IyfbkXfpoBFXqsi746XdLsdZ2zY7demJzoLmlwMesVxXfA/ZClANRxvTnMR5b2he2Z9pDeDwbrUhPKFD8ez70vpgSBTknA3VvyYPLNlUGa9Y/Cjxv50NKXWIIJHB1gUpXzIUcq7ebInZUGgdFt8GdtR+wwIQgA==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM6PR09MB3025.eurprd09.prod.outlook.com (2603:10a6:20b:c5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Wed, 2 Mar
 2022 23:33:38 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b%8]) with mapi id 15.20.5038.014; Wed, 2 Mar 2022
 23:33:38 +0000
Message-ID: 
 <AM9PR09MB46424AF57D3DAE4DA462EA14A8039@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 3 Mar 2022 00:33:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] staging: FileExistsError
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core <openembedded-core@lists.openembedded.org>
References: 
 <AM9PR09MB464217F0B4A5828BA8092D4AA8039@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <997e00f33cb607ad96e0c9607dab46a4872ce98f.camel@linuxfoundation.org>
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: 
 <997e00f33cb607ad96e0c9607dab46a4872ce98f.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [tik7rRAbruhGBQ0FO4xRVUo76x54LXMpMG8i+RZFx8zfN61Qe62a8eqSpYm+cxc0]
X-ClientProxiedBy: AM5PR1001CA0033.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::46) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <7c28ed37-37d0-5c2a-9bb8-c0fc706ca3c3@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc03da53-5b83-4b5f-42af-08d9fca513ee
X-MS-TrafficTypeDiagnostic: AM6PR09MB3025:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NMpsIMPsNO//rW0tvP7CQZnbGzN7nHvOYu/qpk8ezppOqD4ke1iIwnVP0A8ERPBqv4iWVZd4Qj+s/JpBUnB59Vvq7008xYwAHRCEytsAYWy0xWjT7Q9Dgt9yPPmFZbBFBDiIBwHzzQllcqE06AGLM2Lr/+x9cMeLr/VOnJAfkkizGGvZEA+4XO637rLPt/eDBoWOUeSHBz1/QGKPr6mxZWpHBXxzut2XpIIA5XRzk5yrIQozBifNK8nSq5tSHlhUaFnBxbqMzh63qiVqjC7xG/X9TsA8I0ZFSmISimbGFC9N6/Hw0O3o5vATJx2F/dIlOdhtnlITKeHxKMoRmW7cdVyX0cIBKVZtYo6mi2SXKZ0cqNjliCVvXMjtya5n4xDFfA41DxAVOoZ4UZjE9S7/2SSNuashqtQxLuV67bglk1O6JU8ihIklTLqDbUw59otGADAeUBARqW6p/B/Oe1Y8teg3ZABjgS/guPUduZigXK7G+Q4hvD9H1TseAMpwEsQXu4LkEO04IL/Rxa5Fd3DRap4r0LriU2PU5ti+tx709E3EyO7tVeq5SEzhKTpBmsNP49fHK6DPbz03t1S6IUj8Sg==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SzllREZPekYxMTJkajBjV1h6K2owVGtQcTcrNTNQK1Zla0p1Ni85NDBnZHR2?=
 =?utf-8?B?djUrQnNaTm5FVXdmQnNsaXpqdms0dWNSeU42UTNkWVJja0lIbVlPN09Ra3Yz?=
 =?utf-8?B?K0JZZk55a2dtMHE1OGdQV21FOXVsZHE3dFpnbWdHVllZcldiZ2E1SlQzd2lx?=
 =?utf-8?B?TVZyOE1jbUIzK2dNS2tUY1ptdWJ4ZTRwVUE5bHFRaldxblJaWGpobWQvOFdq?=
 =?utf-8?B?UWh6MHhyWFQzS2p3bG9hbDdyU0RQT3NIdUtPZE5ZNzVieUdrUVdPNFlkZk0r?=
 =?utf-8?B?R245eFlxdXB5UjZFMTE5S2xGK09YK1BHTys1elV1K0NVcWFYdmtJeUlwTGxX?=
 =?utf-8?B?WU9pbDVVSlNMdnBza1g0UEpiT3hHeTVDcC9WalFCOTRMMlZ1N28xdFhTZXQ3?=
 =?utf-8?B?YTJRNzR6eFdobXZMUEtQMjlRbDVtYTdlbWhxbEFUSWhyVk5wVGJBdjRqZ21V?=
 =?utf-8?B?aDE4MVZseWZ6Z0pnUk5iZllXZ0VERVIrT1hWaitDQ21wVmFQaXg4S3dVcjZo?=
 =?utf-8?B?NEFCd2RNUThyTGZyVFJhdE5iVzAzU0RjSDNnK3lBRHIyQkVXNy9UK0lPbDdy?=
 =?utf-8?B?MVJLT2dCZ3Y1MWZseWowSHdCbjgvbTZZNkozOERMc3Y5UXhuK3cxK0dnT3NF?=
 =?utf-8?B?d0NNcVVORjF6Zk9QcTlaQTh5czNicko4dWhlMnVJeW5mMmRHb1ZDN05KQjc5?=
 =?utf-8?B?emQ0cHh0aHQ0V08xS2trQ1NKV21GRFhUYThiZ1dBZmRkdFU4RVBUZ0Q1TzMy?=
 =?utf-8?B?SEhrOThCa0t1dnNiMlBHRUpwa2xqOUpSMmk3Nmp5dGdxL1JyOWNiVXZpVDZO?=
 =?utf-8?B?T0RuR3I0QnBhRVlRVHRGMGxPQVJ2MUIzc0lZMUU0M3ZyeVhYVkYzWm93aTAz?=
 =?utf-8?B?cWMrNkZhd0tkM1Y2VE9taTBNdzM5VlE3WlJwQmNvZndQNjdoWDZJSUZjL1k4?=
 =?utf-8?B?UmhWN0oyamt6SnNSemxYVXdmTTdwTURrMy9lRGV3VlNBNXZLWlY3OVhHMlVX?=
 =?utf-8?B?TUFacElscEN5alNoSUtaK2pVVmZHQlI1YmlNTVNSREtGWXRReElSQW5MR2xs?=
 =?utf-8?B?WUpRaHVuOXpOdWlmdlY0UWluZ2RkZUhPUC9ERFRndCtMUElSQ2t3bkc5emxh?=
 =?utf-8?B?TWxqUkhtY2I3andCVW5yQVIyY1MwRnYvNWVzMVN4MGM4MytJcDYzOEpSRlJV?=
 =?utf-8?B?WHpUSE1jWFNZMTZ5M2dnUHl1QXZyWDh2SXJNSHBCWkxQQm9Lc1BGZWJvamcz?=
 =?utf-8?B?aXBDWjEyTS9EOS9ja3l6ZkMwYlVucVBxZWRqNE1kdnRrSmNLemtldGFEcDJj?=
 =?utf-8?B?VHI0MnIrZzhsWDkzR0R5MUZTWXk5NEQzUW9ScTJlVmRDd2UxWXAyUkVsbXBN?=
 =?utf-8?B?MzhXcWUvdzhsMlE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bc03da53-5b83-4b5f-42af-08d9fca513ee
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2022 23:33:38.6022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR09MB3025
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 23:33:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162630



On 03.03.22 00:05, Richard Purdie wrote:
> On Wed, 2022-03-02 at 21:55 +0100, Konrad Weihmann wrote:
>> An interesting behavior struck me once more after a long long time.
>>
>>    *** 0002:extend_recipe_sysroot(d)
>>        0003:
>> File: '/layer/layer/poky/meta/classes/staging.bbclass', lineno: 584,
>> function: extend_recipe_sysroot
>>        0580:                    if "/bin/" in l or "/sbin/" in l:
>>        0581:                        # defer /*bin/* files until last in
>> case they need libs
>>        0582:                        binfiles[l] = (targetdir, dest)
>>        0583:                    else:
>>    *** 0584:                        staging_copyfile(l, targetdir, dest,
>> postinsts, seendirs)
>>        0585:
>>        0586:    # Handle deferred binfiles
>>        0587:    for l in binfiles:
>>        0588:        (targetdir, dest) = binfiles[l]
>> File: '/layer/layer/poky/meta/classes/staging.bbclass', lineno: 158,
>> function: staging_copyfile
>>        0154:        os.symlink(linkto, dest)
>>        0155:        #bb.warn(c)
>>        0156:    else:
>>        0157:        try:
>>    *** 0158:            os.link(c, dest)
>>        0159:        except OSError as err:
>>        0160:            if err.errno == errno.EXDEV:
>>        0161:                bb.utils.copyfile(c, dest)
>>        0162:            else:
>> Exception: FileExistsError: [Errno 17] File exists:
>> '/build/tmp/sysroots-components/x86_64/some/path/to/some/deeply/nested/file'
>> ->
>> '/build/tmp/work/x86_64-linux/some-recipe/1.0-r0/recipe-sysroot-native/some/path/to/some/deeply/nested/file'
>>
>> This happens in rare case when doing a differential build o a recipe
>> with hundreds or thousands of native dependencies.
>>
>> The file mentioned is pretty much random and it's unique (no duplicates
>> among all the dependencies when it comes to filename+path).
>>
>> So far I helped myself with ignoring this error by adding
>>
>>           except FileExistsError:
>>               pass
>>
>> to staging - I wonder if anyone else ever seen this behavior and what's
>> the best way to deal with it
>>
>> What comes to my mind is
>>
>> - ignoring it - but then no one can be sure it's the right file
>> - falling back to the OSError/EXDEV path and copying over the file requested
>> - a 3rd option
>>
>> Any thoughts?
>>
>> (Just to be sure, this happens like once in a thousand builds and only
>> on differential builds)
> 
> My initial thought is that is a horrible work around and we need to get to the
> real issue.
> 
> The question is where is the duplicate file coming from and why.
> 
> Also, is this dunfell or master or something else? There were issues that were
> fixed in these codepaths after dunfell.
> 
> Is there anything significant about the kinds of files this is being hit with.
> For example are they generated pyc files? We have see that issue before. Is
> there anything significant about the path lengths involved? It is hard to tell
> from the information provided.

To shed some light on it - no it's current master (head of yesterday) 
and it's no regarding some pyc, as I normally remove them by a different 
class in my builds.
As I said, the error hits on pretty random file, one time it's a code 
file, one time it a LICENSE file - I don't see any pattern in there.

And I agree one need to get to the bottom of it, which indeed difficult 
as this hits me like once in every 3-4 months and usually a sstate clean 
fixes it for me.

TBH I have no idea how to get into this state, but once you're in there 
it can be reproduced with a 100% certainty.

The only thing I see is, that the more build time dependencies one 
injects the more likely it's going to hit.
In today incident I rebuild npm-native, which cause the rebuild of like 
~5000 dependencies to be setup for a particular workspace.
Anyway just to assure you it's not about npm, I encountered the very 
same on a recipe that had like ~250 python dependencies.

My question is, what should I do, next time this hits me.
What kind of trace and/or info you would need to analyze this, as I have 
admit this is beyond my understanding of bitbake/OE

> 
> Cheers,
> 
> Richard
> 
> 
> 
> 
> 

