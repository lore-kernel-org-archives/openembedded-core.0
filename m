Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8C9EC433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 17:11:30 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (EUR05-AM6-obe.outbound.protection.outlook.com [40.92.91.79])
 by mx.groups.io with SMTP id smtpd.web12.13511.1646327489700709271
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 09:11:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=iFiwK7Fo;
 spf=pass (domain: outlook.com, ip: 40.92.91.79,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C2ESZVlmUKmPiJC6cRPPgMx+14RFMeZ5wkO6UVLnJMEsc/tXDSa8WKOYI7jMJoRgPMrGQFBHntMG+7Sart3j+RKdezYpLSXSvTV9JMZUtsCVufmGIL/zKIEXHJYdHcftIPd00yOeiQMRUn2YmkEfF/0+tWA85ACP9jq6GIVE3M3/A1yJskRHB9snkcuybpe6wNGXPlj5H8IRCA88ARN7NFK6HrFvOwDAeGvYb7EC7wU21Talfkk1EwyBLzNNeCSo1dF50uHvHl5PNELPF2aQPZuDHIfLPbmJxC0qsL5xbxooJCBd5fmOJLBa7/o0tNrx+PwvIuDr8nqTwUvf/uu86w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TwFTFooTf17Aqs9iDK3TJ3Ip9bhjmRVawx2QNn2BLEE=;
 b=Gl/yQTOKAf/GTxsYBU5AkxQtJXnFeTC1BaEMRjPi7vTxYelfzyBa28S65GO6G10vClOoOc24jXKYvzR+FYr33A89vbvm4ZwVd9NsLFXEqlD8+9ItRKXLM8LnwFgO5pR+/e6GlxxJ2J1CbJ4Z6hphFSBwcGckD2q7SACVl6wEg8oSW6B3OR7eUhm+AtHx4d1CbBw2gx+j1Qz96r1nW2U6I4qGiYT7PvTVhhxPgxJUvW2LO4L0hJY7RA+JMS+rv+Gv0t6qws6RhieIniZXnw1Tz4WRBgNJsprV+1fxP2dzmcIYwHKRmCoFs7UsjGqhVqg67FHhd9Lz8pJ6Cd8XGvh/Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TwFTFooTf17Aqs9iDK3TJ3Ip9bhjmRVawx2QNn2BLEE=;
 b=iFiwK7FoBQR4AbnIeEBQX20Z19uR1dy5ccVmQRiAt43j0FWnSYeOt+PThzmSQ3Ny5pogycdv3XZUdpLwoSL+r9fqmCzjubAvapRa8RozeYwvI0mV9HvzfKCpm3v5+Kukc1f3nFPY2QSgXhE2MawGR6WF5RPw1qad5pVCvJqf3bJeRYgOmyw7NpcikiZ3NjPL5hGowQyVQ3EgVlmtbr3iUbXJgyj79NH4xeUoWBw7ye8roeyG7SJEEUp2xnqrbQOjanDqxb2hkK1a+pbKAWfvDUpts/CJTUodCPMplWpojhluEK+oAGAALksHuG+14yIdXDw5z8XYGLj+HPdC/NhyIA==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM7PR09MB4230.eurprd09.prod.outlook.com (2603:10a6:20b:11c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Thu, 3 Mar
 2022 17:11:26 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::e8ae:b245:b019:195b%8]) with mapi id 15.20.5038.015; Thu, 3 Mar 2022
 17:11:26 +0000
Message-ID: 
 <AM9PR09MB4642FE2683D5983FC6EB579DA8049@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Thu, 3 Mar 2022 18:11:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [OE-core] [PATCH 1/2] python3-native: Remove all pyc files
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20220303163451.336518-1-richard.purdie@linuxfoundation.org>
From: Konrad Weihmann <kweihmann@outlook.com>
In-Reply-To: <20220303163451.336518-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [yf63vTtqGEu+TTgjUEwwZtAj7g3/axp9qy48vA0Hg2dlA0lqINd7nhyQFQybnba2]
X-ClientProxiedBy: AM6P191CA0045.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:209:7f::22) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <11925866-60e2-21b4-a6fe-3647165b1737@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 287efaf4-2a87-4c4e-6b92-08d9fd38d9aa
X-MS-TrafficTypeDiagnostic: AM7PR09MB4230:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	y/wUvsk9EHMbsVX6Fe7BUF0uZRLOItzcZ5xaZz+nfzspU97qccKz13VOWURZjIjQVjno3bIFkNkzrl0xt7hGE1iU8fSC+4sVBBpVdlmS3a1e6WR9eXOOixs93vaF3AO2lo+FwWZFDZeV6f6xNFjZ4tqmhF5iA0eKTpZ0EhoBNfHW0sAzGTKr4Kml+gehcNVMebKIbwL2esuyT8w+G4gkB/oDzJMkhI5AK32rLbPtepTh09n7cRdcPtWQj+4C8YheXesLSM9u/xQYktpO7+rvbx0QYdiiou+kuFMH+PubWHwVIXbHsnbakrNKRg6tY2mX9LqjctmBhSpQYKz/MegZ+RrEGtSuI0BSTTfzalnNgsIn3ltda6aJkd+3TljVcDit5NDidO4/uZLSzpXe5aktbwH60+lTKMU25c2J6FmaW9zGHJGEeEVYC3ifzyaPxD8Rp3fB+mccD7NI4TKLY0GB4AAIt8N+HtoA7ohV4kapN1mB9YaeAlEPzndWoB+jgIJEw4eN09vaPziz8D9LO62AGvAIT2roOn3NOaGM2xKhy3m34kuXJgKIVww36Kdn4uJ26ROk6BIMd9oobdKDmjIS56719T5cpTo/Xr/tcHGmy9/IejH0pGqroxwnjzAKK7ZB3jsPGfdN8Tvim9R8W0/4ocRfzoVY81v+Tezrt9JSLeY=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MjI2OEtpcnhEN0d3dDUzU1dlRGlXUE5WY2Q5N3d1STRaQVN4S1V0d090RFVJ?=
 =?utf-8?B?OFQ4QjVsM0tqMXlQNU9EdWozek5JWUV6ZUg5ZVJDSzJybFdEZ2c3ek11Y01a?=
 =?utf-8?B?NmU4TkxMWG03RHhKVm9JUzBJcFdUOXZLNG5TUzBpNWcxeEdzMGFrdGVMWmlW?=
 =?utf-8?B?NXVTRnVLL2ZPeTAwYkl2eUZNSHpKcG9zZXErbnM3aTFWb3NPV0hvVldnOC9m?=
 =?utf-8?B?N1RwRXk0NDNhMWNvbitDTHJqOUhFSmZtbjQrNkRabjBwbmpSVHhScnFYTTNL?=
 =?utf-8?B?STJ3eWR6YTVobHFpNFhPT2N5NXBoSkZUa2ljKzlVVWgyb1V4RW1kM2o2enB4?=
 =?utf-8?B?UlpEUTE0aGxLTmtVdVcveGc4S0lmRkVSWVB5Z1kvNXp4SlRNRDlsN1lhNGFi?=
 =?utf-8?B?ODFqdDIxRURQYjRsY045OWdOWFIyUFcwYjlqOG81SHdwNk1SRU9ydHkvcmRI?=
 =?utf-8?B?RWh1b3F4K05NQVJHbWVMTVB0VWxCeXFOV3Z1cEFVZHI3U2orME8wdER4cnpL?=
 =?utf-8?B?ZFRBZHowUjJGRFpLR1FFbkhaVm5pc2tGays4RU05djNzSGtPdEVpbTBVamZV?=
 =?utf-8?B?blA3RzZ0TEEwUStoQVptUEZTYU1RWFBFM1cycTl6aElHYk1EN2ZNYTczaUtl?=
 =?utf-8?B?d3R5QW1rNUVyWnYzTE8yaFh6dnI0d1hDaEZxMVhLb0pJTFVaRTNKYUZsbkRt?=
 =?utf-8?B?V1BlTVQwb1hudHlPcDVTTE9RcEJZOTFGSzNOSjBRMGh1UjFkbFVPeFBhYjFP?=
 =?utf-8?B?cldsSS9nMUptWlY3NS8zV1drdzV5SzluVk9PNmh0R1l5ZnZCMm1KZ20xbWhh?=
 =?utf-8?B?RTVwU3BJaEJGcjN4S3NqTHRXNzhnb2RGSTJKZ09Od0FJTEcrdXZKRytRSEJo?=
 =?utf-8?B?UFFsV24wMlplOVhyUWd3ZTFISUdZMDI4T3paeEhJVGhCRXRFSlMvd1l2SWpN?=
 =?utf-8?B?V3phdk9MNE9kMklPdGV4b1dCYzM2ckZ2NFlya0RwWGdvTHZuTnptejV4WFIr?=
 =?utf-8?B?c2RtZTB6VVd0UUF4OGtSMDRxeGI3djRPTzJ3TkhOQ0diY1poWXJqY3dBV29L?=
 =?utf-8?B?V2M1VzF6NW9MRHFGK3B2MEl5MU9HK3hNdXZ4YkV5ck5XRE84UUhVU0V2ejhT?=
 =?utf-8?B?K2Q0WVF5MFhzWW9pcm5sK2EvcDJOREdOakxjM0syNy9lSDBSV3RwZXU4WWlz?=
 =?utf-8?B?alF6UnVyTHJhVEh2RmVYQW95clYxdktJeHlHSnUvSVFsSkJYR2FnUEowc3BT?=
 =?utf-8?B?bU42RXpnM0o0VEplbHNDNE1XZU1QZlhLTnlTYVFYekpubVo0ZUM1RnQ3dXQx?=
 =?utf-8?B?UmhGMkg4bjMra1FVc2RIRjFIeGFzZDZUS3hwRVozV1BuaVYvKzA3UDRuMi9w?=
 =?utf-8?B?eUVNUE5STG9sTlE9PQ==?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 287efaf4-2a87-4c4e-6b92-08d9fd38d9aa
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 17:11:26.6455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR09MB4230
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 17:11:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162666



On 03.03.22 17:34, Richard Purdie wrote:
> This removes a further 1600 files from sstate handling and lets python
> create the ones it wants at runtime which is likely much better overall
> for performance.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/recipes-devtools/python/python3_3.10.2.bb | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/python/python3_3.10.2.bb b/meta/recipes-devtools/python/python3_3.10.2.bb
> index b28aa6505a0..7ec443a531f 100644
> --- a/meta/recipes-devtools/python/python3_3.10.2.bb
> +++ b/meta/recipes-devtools/python/python3_3.10.2.bb
> @@ -156,7 +156,12 @@ do_install:append:class-native() {
>           # Remove the opt-1.pyc and opt-2.pyc files. There are over 3,000 of them
>           # and the overhead in each recipe-sysroot-native isn't worth it, particularly
>           # when they're only used for python called with -O or -OO.
> -        find ${D} -name *opt-*.pyc -delete
> +        #find ${D} -name *opt-*.pyc -delete

This here looks like a leftover - guess that could be removed.

Thx for finally making that happen (I've done the same for quite a while 
in an extension in my setup) - I remember there was a bug about pyc 
leading to weird staging issues, I opened up like a year or two.
Guess that one could be closed when this is merged

> +        # Remove all pyc files. There are a ton of them and it is probably faster to let
> +        # python create the ones it wants at runtime rather than manage in the sstate
> +        # tarballs and sysroot creation.
> +        find ${D} -name *.pyc -delete
> +
>   }
>   
>   do_install:append() {
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162663): https://lists.openembedded.org/g/openembedded-core/message/162663
> Mute This Topic: https://lists.openembedded.org/mt/89528765/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

