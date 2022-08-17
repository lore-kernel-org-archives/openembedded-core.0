Return-Path: <frieder.schrempf@kontron.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A8FAC32772
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 10:38:54 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.118])
 by mx.groups.io with SMTP id smtpd.web12.27184.1660732724823007681
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 03:38:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mysnt.onmicrosoft.com
 header.s=selector2-mysnt-onmicrosoft-com header.b=jZbU+Sq7;
 spf=pass (domain: kontron.de, ip: 40.107.22.118,
 mailfrom: frieder.schrempf@kontron.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B5IjfYiMvPFmJos3FaI2JwM22jW6oDHJTMqSjSWG52lLI557VHKhP1UlZmK/dm6Enezy37BliZwSBaXXmKUfXIAA5JI1SpxTBtnbK4CaIKfzYQ+70aZMjzW0Y25gL7gZLI0l7qNc680F5jUy776khAck6UOViL9UTvVT80kQFL8Mptcgezp0SpHaaycs5jfs+chJQc2DEb05vueXDtU8zI6G4etJxqjYIslwKyL1SGnyzzkIWMDxKBqR2zTJ1MuqoFpfRaw+IOL7gHsXltiea+d+11VKnQzRK7zD5gmZ680j3VaWRlso8KP4jfL/hMUk9H9arCwT7+b05G3+txgGZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZEX25WGYGLBjHVVe2BUd7ySTZf6bLhoVURqd4LVFlA=;
 b=DykBSfxRO+UDcl22zHWyYmqZHyRfPBLTwQ7OrAeq8hqU3jjmqrMak0xMwcuwPzSZ6gbB705PMtOAICH5AfqNvXzufo7ABIMyHgsWgmCLpeY0QWtrXEnXGMliXxpng9wZQK56QjxqtRYGObYSipbOajaG8tgC8tWIk2OT9VZe2yGnIkt2gyVmXBSIzpkVPDVK6C3UPtNY4WXwYtE/rggU4wvQvsLmlj32Lrd15igrtte/47UOrqsX5+14DFoRgAOoHSc9RKjMl5uE9phhhABsrDZDHb38ZJf3qMoDp29J8aI+pexHCMnZVpdFfWsxWyYLKR2wChA1lwTQxAONUSr4BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com;
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZEX25WGYGLBjHVVe2BUd7ySTZf6bLhoVURqd4LVFlA=;
 b=jZbU+Sq7WFpZdK1rdVkL1cEt7W4ndIg3uTaWz6PpBZhRheM+zotI+QXQfChkj3VSNhS0cbYS1vxRtkI1tFCPCT0MUQ/H0/A9cxHamaON7APBaA2Au5WgIwF1RgUyEo4yfPDDOk4kkNJGkVc7i4owZpS4JSAdQTTpHDaBv8/lBDI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AS8PR10MB4376.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:2b6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19; Wed, 17 Aug
 2022 10:38:41 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e8c2:f87d:c1c9:c637]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::e8c2:f87d:c1c9:c637%4]) with mapi id 15.20.5525.019; Wed, 17 Aug 2022
 10:38:41 +0000
Message-ID: <d00ff147-dc27-d124-8334-ea0848870908@kontron.de>
Date: Wed, 17 Aug 2022 12:38:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [OE-core] [PATCH] siteinfo/autotools: Ensure task checksums
 reflect site files
Content-Language: en-US
From: Frieder Schrempf <frieder.schrempf@kontron.de>
To: Steve Sakoman <steve@sakoman.com>
Cc: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
References: <20210921121537.1611646-1-richard.purdie@linuxfoundation.org>
 <c09410c6-2b55-497d-97b2-e05484f9a4a4@kontron.de>
In-Reply-To: <c09410c6-2b55-497d-97b2-e05484f9a4a4@kontron.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P190CA0026.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::31) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71326b65-d062-46d0-e045-08da803ca6d4
X-MS-TrafficTypeDiagnostic: AS8PR10MB4376:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	f01X3RXCiD1mcCQ5vXtAXCL5OYmjjVSAi3yWqAkbQ91VN9yR5tL29DI9EUnqD7M8QwcgxOYtR59+uTcYguigyJ/UJ5JqL8TikHfzPpi+R4Rbt7j0lgfWKlPwyJts+MBtz7BtBZMveV3RqPpaJo7CCtS6CulpB1ZX9HHF7N0A3+McRdfbTW5HmJUSsiZZyqy5MPmMMjobjfw4bkb6h3f48YMVi3+7Ie1DJKKu+78jfQ8PO3yDvWXEe+sDDtjIZkj7boXH1RCVHZ9XHwb+pct84HgIRaa46qjaaIAGXqxjsk4xoc7sXFxswXX5iSRhSnLKSNQNKBhM6wHw5ocVLZ98/bJOmb4QyoBjJAt4LuCT+BjZ4Ve3JvTMclAcyDBDrNOWjifMFtEhq96TokEd1ameHAqhA3DYKpkqiMd7tQgdfnqYmYQjXFiAXnSr7j0Tm/CBebrBI1d3DiIRuroZ//CcpizmY8Jpfx6nLmIsTUsFt+zcy0873JQcMe0cwdtwwQmU3dfH9EAmfMUWDpN6WXbiFf15kAui4anyybRL79VBFLWwkC5jKMvq5LZ6CyiLUkCAG0ThLpIBeQLYAm9aSVJH6ucrHDbdJi4dUDhyaK6TezrK1jJAUUp1xOd4wGT2U0KqLyFPCV6c8uXIGnBwOg+pDYJLVAhTg5FCzxSE8WhppqodEHSk8woAay11Hhm48jjZexlt/8nwvx8slDeMrBMmh1+L577upWviTx1E11nNr0c/grs6jPp+50ntVoTFpjjv3xe5Wy7z9T5kgR3gyXqTOt3XAIaCtVKkDtnFcHledNeBDeAwFRGmhQm/sdH+vrh9qcYl8w6SNLY1lvrWp5zxvA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(396003)(366004)(39860400002)(136003)(5660300002)(478600001)(44832011)(36756003)(41300700001)(316002)(6916009)(66946007)(6486002)(66556008)(2906002)(8936002)(31686004)(66476007)(4326008)(8676002)(31696002)(186003)(6512007)(2616005)(6506007)(86362001)(83380400001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cEdNU0dBRG8zRXg0VktmTjlMOTZEdXlpNUlsMnZzNVl5dzdTU2NneEd1Zm9B?=
 =?utf-8?B?UHlUN0tTbXZ0QXpiTE80blp0ejZVdkxtMnU0MHA2ZG5wNi9xN1RwT3JXZlJp?=
 =?utf-8?B?bTRscTBUS0lFalJqRGxHSkd2Yk1xbW5xVytqZWVGbnJFTFNmMmwxR0tLRVl3?=
 =?utf-8?B?MmdmSW80N3FYTjhJcjl4REQrU0JBcmJjME5BT2xZVksrek1HTEVZUWtkcW1n?=
 =?utf-8?B?MFJWb0J0b001YmVLTEFTdzc2Q3E0TnUyTmFycnJCNkREem8xMDJ4bGZTRmZL?=
 =?utf-8?B?TTNMSFU0UHA4Lzh6c1ZSYVBnTUhyY1grWDFySytxLytVQWhMbGNNSndWMzhR?=
 =?utf-8?B?MzcwenFpT2xNNUlKam1YbkFpZHFPdEIrL2NUODZhVjh2eThua0dJQTdET3pC?=
 =?utf-8?B?SG5kNmU2TDJoU0pNcytRMzcvRmRDSTVvNjB2d1ZyL1VFaEtjamcwWC9ROXQ2?=
 =?utf-8?B?SlpVZVBKTzByd29TZjFCVi8zR2xJQVpESzI3S2ZuanBYNVg1UEFmVCtXWWcw?=
 =?utf-8?B?cnlGOWtsRjZNeC9aQXVXeWdPdEQrdUVLamZTa29ycjlPUEk5RThJeVIyTmhx?=
 =?utf-8?B?VCt3ZFF5MzcyUnUwOVNScWFUOUJaTEpEMjd1Y2I3VkQ2S3V5andYUmUrdlAy?=
 =?utf-8?B?bXg4U3ZpNkoxaE5HaHZOQ2NuWnlGVWs1T2prVjBtVkdJRUdWL0YrRFJNWm13?=
 =?utf-8?B?elZ0Vnp0a2N5eDdqYkZFcVFOM2VzdHJUN2UvaVU2QTN6UTg2T3IzdUxpb053?=
 =?utf-8?B?TVMvVHc4WDVQY3UyQmZ6enQxazl6NGVNNEJWaTl2UVZ6cCttTlloY3NqNnNV?=
 =?utf-8?B?T1JlaTVpKzdiRVBQUEhLNHFRdnU1QjZ0emJzcTJ3U29uTjNZekFqajZsU1N0?=
 =?utf-8?B?bVE4cnhHN1RocG4zdGNkdnU0TDZCc0ttbGN0MktnSE8vaG1LeWdsdlM4dnhw?=
 =?utf-8?B?UDU5ZkhLdnE4cWl1Skw0YUJJRGp4SWo2TWt1NXRnbjkvb3BqOHYzY3ZDQmly?=
 =?utf-8?B?aG5DNXFGTEdGWHlzSnBnNEFBdnNPd3ZMSkNucVVwM0tUMjRSTVNuK1Z0NDYr?=
 =?utf-8?B?Y01OWWF2bDZlaGFqYWo3UzBhUjNUVmgwQ3lrdm5tL3JPcVFTMnRwd1FRRVRG?=
 =?utf-8?B?UXA0ekc5cVVWK2V5OGZSQUxpWUNTNFd5a3RLVFZIOHVlQjlaQ2tYaVJnaFh2?=
 =?utf-8?B?WU9kNlFQNC9tbSt6Zkp2dE15UWZMeFhDN3M5cEpZNnlJaXpycis1UU9PRmNn?=
 =?utf-8?B?Rm5UNU0rSkNEbFVZV0g0OE9UMXdGNWQ2U0RMT2ZadUk3emphRjA1Z1V4RXhp?=
 =?utf-8?B?ejRtdTkzNldCQjdmQWFkd0hmcTBiVXZObEhvTlIwWFN4VGtKMGZHcCtqTnU2?=
 =?utf-8?B?amNIMmhES0QycXcxMHlIVFVaNWNpWUJZWXFnTjRJN0RhTEJNZ25PSUUyZCta?=
 =?utf-8?B?NGNSbk9mQkMvd3QyQ29tZkQ5QVY3djNqZHRFcmNpNjdnUFhHUGlNVFI0MjZZ?=
 =?utf-8?B?am1TaHhQT3Q5Qk0zWm5ueE1sNStpNU5uMWJDWUdTMVZUbFNyMkhyY0RvTnA5?=
 =?utf-8?B?YW43dHZVNklzU1pEakk0NjBGUHNJUXNEQTNEdGJHdXRkblhWakRtTnNOa0lr?=
 =?utf-8?B?N1hpR1hnTkFSZjNZNnh4Wi9WN3J3aGovTjBZRFpxWm5ZUmhnV1JHS0pua0Ny?=
 =?utf-8?B?OXk5elZjd2R4RFJ5dHZLaXpYNFYvS2JHemdnNUZoNGxDYTQwU0t4dTdpeDNo?=
 =?utf-8?B?eUE1V0s0cDQwTW5hSVI4b0RnOGliZDA2VHFjZ1d4Ti9uZzRVdlc1V3A0RUMr?=
 =?utf-8?B?THFXK0w1d091VTZmRjMrZWg1cnBQS1lCbVVCUmNDcnFkczBhVDZCaFp6THlO?=
 =?utf-8?B?bnAxSHVsak96R3J5NmRTdFFxS2xWNmRpTzRvNERXc3paMjlVVlBPaS9qYllJ?=
 =?utf-8?B?ejNCSzZ0emx3STBrQ3RMSm1ZMTVXcURrMVlrSnFJeVVkNEJqaEd2TlQvd0Vr?=
 =?utf-8?B?VHdhMm1zUXZIYytzN2txbHJtZHlkVjlUYnZDY0ZpbUNLQjBydjRjRVo2TWdq?=
 =?utf-8?B?ZjI1WW9nVGNUYkE2K1NtSUdENWUvbktSbGhidEJ1a1RXZk1IUm9wblJibVlQ?=
 =?utf-8?B?RndqWFlPMy84RWhSZ1dHaUROVXAxV0hjZStiekdadEJCSFlKeUR6SGhPSnlU?=
 =?utf-8?B?c1RmZVFtcFcyOUg1cWR6SGx0TDNLTnlIQVF5MnJWbXorMWIvOVZXMUF4cGFQ?=
 =?utf-8?B?UjI3Q3ZkTDRFZFhYS3pOdy9ud0dRPT0=?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 71326b65-d062-46d0-e045-08da803ca6d4
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 10:38:41.3114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 lRR1VKoE5XwWu6HVJ7tLUqm3xILKRpC8SH+lF/xbOBfR+13tyA6/xP4KbV0EEwCloq7mtBGWgBdNJpvM5/jofU0pO4/HJ5ytNyStpy4vmS0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB4376
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 10:38:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169476

Am 17.08.22 um 11:10 schrieb Frieder Schrempf:
> Hi Steve,
> 
> Am 21.09.21 um 14:15 schrieb Richard Purdie via lists.openembedded.org:
>> Currently, if you change the site files, nothing rebuilds since they are
>> not accounted for in task checksums. They could/should be through the
>> file-checksums task flag. We need to cache all the files looked for,
>> whether the exist or not so that if they do exist and didn't,
>> the checksum also changes.
>>
>> This gets complicated by the need to clean out hardcoded build
>> paths from the variable and that other layers can have site files.
>>
>> This patch adds this functionality. A new variable, SITEINFO_PATHVARS
>> is added which controls which substitutions to make on the file-checksum
>> values to remove the hardcoded paths. Layers adding site files will need
>> to set this to a variable that has the layer path in it and is excluded
>> from task hashes (COREBASE is the one the core layer uses).
>>
>> This patch will cause yocto-check-layer to fail for some layers
>> where site files are added yet the layer isn't a machine specific layer.
>> This is arguable correct since these additional site files apply to
>> all recipes and things from a layer like core could be changed by such
>> changes so it is right they should rebuild. There is a determinism issue
>> potentially there if not. meta-openembedded does have some such references
>> but looking at them they should move to core or likely just be removed as
>> most look obsolete anyway.
>>
>> [YOCTO #13729]
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> 
> Do you think we could have this patch backported to Dunfell?
> 
> When I'm building the SDK with "bitbake -c populated_sdk image" I'm
> getting errors like below. Cherry-picking this patch solves the issue.

Forget about it. I was too fast with my conclusions. The errors just
reappeared even with the patch applied.

