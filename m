Return-Path: <randy.li@synaptics.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A908C433EF
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 02:46:01 +0000 (UTC)
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.67])
 by mx.groups.io with SMTP id smtpd.web08.1561.1639709159998268725
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Dec 2021 18:46:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@synaptics.onmicrosoft.com
 header.s=selector2-synaptics-onmicrosoft-com header.b=EVUTpf2K;
 spf=pass (domain: synaptics.com, ip: 40.107.220.67,
 mailfrom: randy.li@synaptics.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AxwmTvJldjfg76YSuK42gOcKIJMYiG21BykIwmBfDLQc1IlPp/NRii6NksL59aVVFNdYVJWMb7fNXoJdntuNE8vkXC8t4HPuC/jrQXonFBkutRQir2erSJuTGBbL2Mp3IyWjty75vhw1oraC9MWN+n3wCEu3Ho/1d15nKjAcfFvw6J2UdYPdWDtlQShROfKV5J3oXgPncZdE7VpWEtWCLV3Y2QaKNjqLkKA8myBGWz3Iq0094bJSGHGemq08/hCoTni5TPufQN1zY1SkIYeJvXDMriEel9TwKaUoO+Rejvg3/yFxw+x7fiJl+QZ7a/qg+UuQHt5Z7d5s7zVrESyE6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fVerDomfbJA2HXXbpKwDGTvQHR57B+eJugP/Z+mUOGE=;
 b=igdMM0GltuJ0DB3RBez1R3SbeeQTzy3udgGthNHOaamhxUusezQ9az8DIkS57eH5fNABoAu8DTNB0X1TqU/ReLeVWYBtVcOHdRxPXNlrVCZFfxhE9LNYvRAOcxVFrSDUI9jTsvwQExUVGnxuNMSqfZVy7dzh8ZU2wLDw+BN9GuwyGMw28Q8PaU0hyMMeVu2Tt30+iJ5VWVY9o8oVNVR9Ahdw2jW4L+MnZmRTbkmYqUECLOKETWtmT1AWuGlJiTYlWka+Sb3dn96SO9X93DDIwgPVVt1u4C8nbTAxeEhwDnzUm/IEv0pJO3rEBG8L575PVHV++qqjIqmWb7zm3BSG7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fVerDomfbJA2HXXbpKwDGTvQHR57B+eJugP/Z+mUOGE=;
 b=EVUTpf2Keoza+DvUCLE9Ql7R4404R/zDCTZzZuvQp+TkwNLR/Umk6gemFpEcmwP9ncW7QHH6Bxqdw9EZfKnfn6SYLpcmDjye1msMka1a0ODxGnG1vdeoLz5NH1XP+XfWvF4i97/tSb5ga3n0sIap/0wigSvBWPMrJyXM/gSR6kI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synaptics.com;
Received: from DM6PR03MB5196.namprd03.prod.outlook.com (2603:10b6:5:24a::19)
 by DM6PR03MB4940.namprd03.prod.outlook.com (2603:10b6:5:1e3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Fri, 17 Dec
 2021 02:45:57 +0000
Received: from DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::6cc3:f8bc:aff3:f665]) by DM6PR03MB5196.namprd03.prod.outlook.com
 ([fe80::6cc3:f8bc:aff3:f665%3]) with mapi id 15.20.4778.018; Fri, 17 Dec 2021
 02:45:57 +0000
Message-ID: <e88ef3e0-fbef-56a8-c6ee-e41c42368ac2@synaptics.com>
Date: Fri, 17 Dec 2021 10:44:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [OE-core] [PATCH 0/3] support Android target in all build system
Content-Language: en-US
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20211216103846.718910-1-randy.li@synaptics.com>
 <2ffcdc396e21ae39e5cb0e9f55b7a887ed97ce36.camel@linuxfoundation.org>
From: Hsia-Jun Li <Randy.Li@synaptics.com>
In-Reply-To: 
 <2ffcdc396e21ae39e5cb0e9f55b7a887ed97ce36.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0072.namprd17.prod.outlook.com
 (2603:10b6:a03:167::49) To DM6PR03MB5196.namprd03.prod.outlook.com
 (2603:10b6:5:24a::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce575497-a7aa-47b6-0b4f-08d9c1075a68
X-MS-TrafficTypeDiagnostic: DM6PR03MB4940:EE_
X-Microsoft-Antispam-PRVS: 
	<DM6PR03MB49406E1DE7687A97A19E022186789@DM6PR03MB4940.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wo/nWS3WdPvzlSvg6gPZAV0WsKuzpcEEFLkCB8giBfw3rQ/3GgFVxVaranPJyZh2GXKAUsX/yt1cs3VNRV68krLBf0uYTPxPCWDM1YBiRLO9+fP/3YIZcCNuwIXD+dLIyK1SCWgalsGZJ0ccIbrxcX/RNkM7de8NPFrJxjt1o63S21FIf+pcKXW9yalHiFH/RNneS+aPt62hcdiwiKrNZRPjqDQ8Xf2r5/ILTdCyKLjEiRc2R19rg2boUAxm0sPprtzj7GqEf7xqBMYUvzUiXsWa8ASfmxc664jx4CRzH7XJVm+IVv9IqFdFhaIa86T6ICzLSBPqr1uYD+bxj5ClY+mRCoCdvEJ7Plj3hu9Pk57rykdLfg1xzWHdfYjv/UCoOciqFHiAgsX/eDnTOjJ4GTe5w3qcriQ++1aUacufx4hMBtCDMLCstYg699dg3J42E+X4OdVcKb94OvwPqt+Zd8dXIuVMm1JKYsJmro3/g9jPv4XTZFbZfin3rRN74rSXatWqY3nT2XBzB+R7szd6uvDVkj2/ZCa+MKTBNLM113pT49iLDVPR8RWBXfmmLK6IW1Bf7a38puMWkJvnV3ROUMSrBWO2qgtMdRBXvO0ytYkN+HqjFIl8ZgRgRuR5udd34Wd8IktUDlYFdmzuNww5iQ5FgKiIl5OjzZqip3wxXDKTZPGxeM/jC6muiYr8jNjiuI9YpFn6lIXmHbyzP1AjR/ULyDZzXR7xoKcdg4k5m4DYyiB+RwEH1RZ9DNbksPX77IL9Hr3hRedIvENaWEwcyaoxPRktUTOp/bsnVXfb977OqRdYRM3P5Ajv5A94gvhsJUx0RE3nkNzfDXV4t8PK6R53A2DhTED0pl0KxaxQQRiY0HdgtJoAgdtlGiQUYI6XA9MrGYs7noALOa8o7xhMCA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5196.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(36756003)(186003)(6512007)(4001150100001)(86362001)(31696002)(31686004)(52116002)(6506007)(53546011)(2906002)(316002)(26005)(8676002)(6486002)(66946007)(966005)(66556008)(5660300002)(8936002)(66476007)(2616005)(38100700002)(38350700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S0tIbllKdGFCbHRSSXBsWXNkUURsZ3QxK2dOVFY2NkprMlN2Q3dQektSSFZt?=
 =?utf-8?B?NnB5bUVWVU5EZXNuSzM4VXlDMSsybDhXTmY3VElsT296M213VFhBK0lMZ1RE?=
 =?utf-8?B?NzJ1SXg2cjZFMHVyUnVxWGIzWmd1NDJ2cHRjN1lBc1lKYlJvY05oN2hpSDVB?=
 =?utf-8?B?L3lyN2FCL3p3TXk3NVVGWXFZc1RxajYyWjlKODcrNlJmUnlkQ3g1eloxMlVn?=
 =?utf-8?B?YmVzREtRdjh5UTZ2eTBWSW90TGp3NzJDRllra2w4Z1ZKcUJta1VpQXRvSmQ2?=
 =?utf-8?B?a1FQVmhkbW1wM2hQWG1Va1N5R2tBWWREN1N2ejQ4Y1pXdldhblEwL3BKOGp3?=
 =?utf-8?B?dFpUYm1lbVZmMXc3M0VNZ1ljdE56d3drVkJhN2NTQmdrcDRhVDA3c0hZYjVj?=
 =?utf-8?B?VHErVXNFdzNseTltMURCamU3cFBBUmMydFZjSmRlck14emdSZ09pc2xIY3NI?=
 =?utf-8?B?bjN1WmpVekdtaC9yV2ZTSTBVb001cTA4U09TWUw1RGJCS2RmT0FCMUNGMDFv?=
 =?utf-8?B?N1owa1dkUUNXL2VobGZkN1RQTXBkZGFwK0YrZlpTN1pVUWI4UFl5RHVHOXF5?=
 =?utf-8?B?U0pqSlFzclpoajNwM1BxY3NKcXBMTTZid01OSTBUbHptWi8wbDlSVUN1dENN?=
 =?utf-8?B?L1hFZWJxUzl2bXp3OTViMWxHNlVjY1p2WGFCemRRMTZyS3IybnNFakUxL1M3?=
 =?utf-8?B?b0wvQ1o2VzFGK0NnQW9IeEJFUUx5ZkhQdHJPUmovc05ZTm5SUy9xNVNVMmN0?=
 =?utf-8?B?TFFOME1HNXBXZGg5UHBGdDVnQ3FiSXZpbVZCRERkMlNmbkFlRndNeDFUWEZi?=
 =?utf-8?B?SFpRbUR6Z1UyUkpJTFRPVk5meVZsYXR5aUxpc21LaVR0T29rTm5hcWpIU0Vl?=
 =?utf-8?B?OXRrT1FHK0xpNE5jRHhrVEM3MXphMHdTMGh2M29qUHBPR0kyaEgwT0F0Ulpo?=
 =?utf-8?B?QXZ3bGgxU0hYTk1XNVd1RnZVd0phYVl1UTJvNVdYVnN4bE1VZUVUSmNLZ05B?=
 =?utf-8?B?cHVLRldubTRNOEFoeEdFZFAyV2ZwdVFENzEyOXdobWtTSDNtdGRlbUMvSEZC?=
 =?utf-8?B?UytpdTBNTjVvTzZyOUlVckhpSzZtSUlGaHNVdVZKMXgvajh0SEg4M1hxSHBT?=
 =?utf-8?B?SGdYUEs5aDYzRStucnBlTDh1UE9OeHZXQVh2MTludTFRbUpCSVJIcjJFUVlP?=
 =?utf-8?B?eUxBRmQ2c2hSMVhPZjVEZVVtWkJKM042MFJCWmJZNmZNS2ozQzN0cXdzeHdD?=
 =?utf-8?B?cDFnVVROeUNtNUdQSnFaUnNvajZJb05GVkJGU0duZ0tFZC9oTkMwTHk5T1hP?=
 =?utf-8?B?ZGdsS3VXSUNNSWtGeWpSSktuRXIrQjMvTDJKSmhuemVFODV6UVJsTTVjclAr?=
 =?utf-8?B?L3BPSVE2d3ZRK29yWHBXZ1ozdThSZWRKaDEwZ3JkMEFNQnJQcjJmZmFHL3dK?=
 =?utf-8?B?SVlxMWpud0tNTTFkMmY0OWZEaTVOeFhieExrWWJWSTJZOU83YkpEM1pRcnA3?=
 =?utf-8?B?MXN6cUJzRExEM2NCV1lXSWlxckYvejdRQmVxVHJHQ2pRUkZseFl5T0RWRDBa?=
 =?utf-8?B?dVpDcHNEVU1Bb3BWZDZKMVM1YjN5dTI2dmdJMFNiZlcxdi8wNWdtL0hxRmpk?=
 =?utf-8?B?OEFzdWt3SXBHejBwOFJiMlJ6L2tVSHhlTHNHNk01QmF5YkNpdGRNeXpJYmJh?=
 =?utf-8?B?bnk5TnRHaTdZSTJmQUJEQUVKNDBkUk53ejlQVWhGRUNxNTFpZDNGdTFuRHdn?=
 =?utf-8?B?bHVXZG9NTElzM0daK1BaZ0ZpM21OMDhUelNXU2JidXZ3aDJvYlIxTXdQYWNM?=
 =?utf-8?B?cHlhZHRNMUhXRjN3dHNDZlRqUElzVThGcmFBdnRFTkJqYnN1azJoMFRJUWNk?=
 =?utf-8?B?NEUrTzZDMnhocGxLVlBmUVBFV0FEWGM0Rm1ROHNoOUtLcnMwMnNSSDdhSSsz?=
 =?utf-8?B?cHVEZVF3L2RPbmJUNXpZYmI2dG56dEVlMnZ5ajRlTmwzWEVnRWxqVlZFNElz?=
 =?utf-8?B?OTJXR3NxR05SWDl3d1hEY1BjQUtDeW12YUNoUVlBWXRGZFRJT1g1RHYrSnQr?=
 =?utf-8?B?QlZ3ZWRGUWVWM1IwQVRsOUZYSzNUY2NxbFFPQmFyWU5TdWh6T1NDaTQzbU9m?=
 =?utf-8?B?Ti9Eb0pPc2ZSUXI1UUtCakl2RE9BZ0wwYTVhUGVRMUtpU2tYS00xNHBGaWRQ?=
 =?utf-8?Q?7+nApF1wNl5vqD4ihDk7YPY=3D?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ce575497-a7aa-47b6-0b4f-08d9c1075a68
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5196.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 02:45:57.7209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 /B4ykd6RU8iQFS0TjDWfBQQRvtTs+o+GOypNe44yuINPs/cy4F1sJ/y19ZcaYb4C9AiJxw1TXIfH62fqyMJYmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4940
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Dec 2021 02:46:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159816



On 12/16/21 22:56, Richard Purdie wrote:
> CAUTION: Email originated externally, do not click links or open attachments unless you recognize the sender and know the content is safe.
> 
> 
> On Thu, 2021-12-16 at 18:38 +0800, Hsia-Jun Li wrote:
>> From: "Hsia-Jun(Randy) Li" <randy.li@synaptics.com>
>>
>> Both meson and cmake would work fine, left those GNU autotools,
>> customer script projects.
>>
>> The behaviour of meson would become that as the following for
>> the Android target:
>> lib/libfoo.so is the real binary library
>> lib/libfoo.so.x -> libfoo.so
>> lib/libfoo.so.x.y -> libfoo.so
>>
>> But when you tell the autotools the target host is android,
>> it won't make any difference in its output library. I would
>> like to fix that but I am not good at m4 script.
>>
>> Hsia-Jun(Randy) Li (3):
>>    cmake.bbclass: support android os
>>    classes/meson: support Android os
>>    [WIP]: openssl: fix Android target
> 
> The first couple of patches look ok but I'd like to understand whether there is
> real world usable output from the build after applying them? If not, I think we

https://github.com/hizukiayaka/meta-android-ndk
https://github.com/hizukiayaka/meta-android-ndk/blob/master/recipes-core/proxy-libintl/proxy-libintl_git.bb
Which provides the 'virtual/libintl' in Android, that would need meson.
> should probably wait until we can see the bigger picture of what other changes
> would be needed to make this work rather than making tweaks piecemeal.

The target is building a Gstreamer(media service) for Android VNDK(in 
/vendor partition).
Now, I still fight with glib-2.0 and python3, the dependency of python3 
need to be patched, some of them as I said they are using autotools, it 
would still product library links likes

ERROR: ncurses-6.3-r0 do_package: QA Issue: ncurses: Files/directories 
were installed but not shipped in any package:
   /usr/lib/libtic.so
   /usr/lib/libcurses.so
   /usr/lib/libpanel.so
   /usr/lib/libmenu.so
   /usr/lib/libform.so
   /usr/lib/libticw.so
   /usr/lib/libpanelw.so
   /usr/lib/libmenuw.so
   /usr/lib/libformw.so
   /usr/lib/libncurses.so
   /usr/lib/libncursesw.so
   /usr/lib/libtermcap.so
   /usr/lib/libtinfo.so


> 
> Can you describe what level of functionality these patches give to a build?
At lease we could have a few simple applications that would work in 
Android, likes the unit test from libpng.
> 
> Cheers,
> 
> Richard
> 

-- 
Hsia-Jun(Randy) Li

