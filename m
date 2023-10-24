Return-Path: <lukas.funke-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D9EBC07545
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 06:19:57 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.84])
 by mx.groups.io with SMTP id smtpd.web11.12073.1698128391322464865
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Oct 2023 23:19:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com header.s=selector1-weidmueller-onmicrosoft-com header.b=3xLzn4Hy;
 spf=pass (domain: weidmueller.com, ip: 40.107.22.84, mailfrom: lukas.funke-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ANCyakqsNhKmc37zfvlkfhRx2nupNGBYQW/3xgiZo8EppbzonSNabnsTtS1+ugZICF4Gn+motC4FWe9iT8VQlbu/DPOZJBLJUa0zpQiKXvtG6NnlcH82yRjtYX+fBqq8KFIVEctvmDqeHA/6atH/EOknXKK5fzDF948/siiIlLS1gBEUxo7a+vnr/lrCrGagQg6vMt+LndRLBE9L4Jdn/fmTRdOrF7qiEjqXKsSPJBq5bfBZ+52v/LCpwCDfvKYNhPs8ybEqqrK/+i3HBdZgc0LFJYlH5Oh4JtZAp5pG208GCrKpRAVxg9+9aYyqYahdPdTGXE61XKL5Jto5xAJkQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=McHUvSLVRR19Q5PsUiBHz8Hx6rVuwS/dbZOIX6/NREI=;
 b=NivcBK00pnS/LXIHLHY1QPt2v8Lr5CvsJ7cwH/ZZ54rBko3CMIYTbexI6vRrwWKAgJjU27LVl0s/ef5yaNFuMhs2L4RxVSoex8M6XnzDw1iKqVhcwvsaPSqL1R+mnYWQnqK0pFFJ43tmVdQJRES7LDNDRhbnkjJW8rSDp437ZygCIJlHk3UgKIsNH3syiLB7mDCViJsJOK/9e7+QYz/jwL6oDcdHEesX9iHx7Ggp4mG6nXrPJMmuATyKjqwZl32F4g4hj49bq9Yb4c/A+sWBntQiyY8JuNwHiMqbgWmCGgEtxVUEDYgy8pJ7QnukQY6xy8kXCGTcArEcVC41IZOuwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=McHUvSLVRR19Q5PsUiBHz8Hx6rVuwS/dbZOIX6/NREI=;
 b=3xLzn4HyHIMBMathdaanS39UV7H7wt8PrB1UIc2kVL0QsE7WIxRxH0etNC9Cx8zYRbcLYpw3G9cgA81P1IkB4PzVvO1evJRXnnnJZcSpURkgva7lm3K7S41brJ6pUbQSk73BQ4GCJYZDwsMGVnu08wZnm4qNKwwnJ5ksT1YhrI4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com (2603:10a6:20b:55a::18)
 by DU0PR08MB8561.eurprd08.prod.outlook.com (2603:10a6:10:406::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.33; Tue, 24 Oct
 2023 06:19:46 +0000
Received: from AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::c337:aad3:ff97:b20c]) by AS2PR08MB8431.eurprd08.prod.outlook.com
 ([fe80::c337:aad3:ff97:b20c%6]) with mapi id 15.20.6907.032; Tue, 24 Oct 2023
 06:19:46 +0000
Message-ID: <31a2b61c-ae3d-4726-88ae-8b2cd2bf21d3@weidmueller.com>
Date: Tue, 24 Oct 2023 08:19:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-Core][PATCH v2 0/4] recipetool: Add handler to create go
 recipes
To: Vyacheslav Yurkov <uvv.mail@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>,
 Martin Jansa <martin.jansa@gmail.com>,
 Lukas Funke <lukas.funke@weidmueller.com>
References: <20231017132647.352938-1-lukas.funke-oss@weidmueller.com>
 <a9389814-affd-4bce-85b9-e3a4555a684e@gmail.com>
 <3ab8f8ee-ce9d-48c1-b802-177f4bec9e3c@weidmueller.com>
 <201d71f6-835e-4079-8c75-bce3d59504e9@gmail.com>
From: Lukas Funke <lukas.funke-oss@weidmueller.com>
In-Reply-To: <201d71f6-835e-4079-8c75-bce3d59504e9@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0023.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c9::9) To AS2PR08MB8431.eurprd08.prod.outlook.com
 (2603:10a6:20b:55a::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS2PR08MB8431:EE_|DU0PR08MB8561:EE_
X-MS-Office365-Filtering-Correlation-Id: 36cc1197-b9a1-4131-7381-08dbd459383b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	afnsaBBvTHWPsxKfhfHECCwVpSqX7nYFkQi0BE21D21Dpwd+3AMSF5w7VTqSk5eLkuVA3DX1VSzsu7kyjpSUNY9IWEaRyUtLVR60xUsDeS02TLAxJcw1NUhhnNdONLeldiArjm6Uoyw+Hk/mVyEe0TfF8anUFhkpoeA1BV6rivSfWjc030YrS8M7A8Edqw78DzxBqbxOv0Ld+G7UBQC6wfRhYEbA0NAdMAam8gobWKuwbkHGdyiJl2KjADFfhxg8DpiXMZ2w+HJGb85pGtz9RTgBDiHIxZZ+8irHH/OWP6i5a41p5tr19Vyv47DcvbTMqCGEPxHeJGaoZRGb8+Mo9Y9EXOoKZANvRwgNTn7+bKeqydNLgVNPQ4Cr4WEYMaU59D6xzSUx/43wOgFWQqW74Z0fZ0vc2zuu69ujTcuiW4cD1GxPG05LwwjpIUVa35NYtaS3wNo9FVotOjCLLOQSkLiGFcqxrOYXipOlrWKNRRpHm39hZwl+fABS/ujEU8KmnVG5Qxu2z5SUJHtVAM5oqppgvi/u3D1MuPPbOkomUQfRCBy5+6hqRgCqOAWleEn/4EYMJu0Lh6UBKh9CaIzzEVBJiFOOgZBcqj4r3jXamWIkkCH/VwMHvQHfjpgWXxyXRSI0ZWoxJ8kRPKDJn8R+uw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR08MB8431.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(136003)(376002)(346002)(230922051799003)(451199024)(1800799009)(64100799003)(186009)(2906002)(41300700001)(38100700002)(66946007)(54906003)(66476007)(316002)(66556008)(6506007)(2616005)(107886003)(478600001)(6486002)(53546011)(6512007)(83380400001)(86362001)(31696002)(5660300002)(36756003)(4326008)(8936002)(8676002)(26005)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QmtQdzNCZ3RiQ2dkVHVGTzh6V2xmdUVhWDY0WmlrOEU0RDh1RGRmbUUxTHlr?=
 =?utf-8?B?OCtadVpWK1d3YURpWnFvNUdvSmN3TEJOTzFnOG1ENG5sbFpnaUZFdkw1THRq?=
 =?utf-8?B?L0tnVHMyYS82anBLdlhjd21JcW5iYm1nWjJkQ0F1M1NWQk5qOW53S1RabFpI?=
 =?utf-8?B?bUxLOGFMQzI4d0VRVDUwSzlieUMvaGRteVZCWGpPbERNTDVmVUErNlNZcm1I?=
 =?utf-8?B?SFMzMytTNFpOQzRsd2ZNbzcrcUhUOEY5TjRVNGR2dFc4QzUxUXhuVGRLdW9S?=
 =?utf-8?B?QXFvYmNSYU95VnhXK1luVkp4K2R5bWxDL3BvbTZFL21OVUpTamFEZ3Y1Z3Ja?=
 =?utf-8?B?TzZzMFM0aWxRT0V4eDZMczZDS3dqVHJVcWhGbWlpN1hteDVvZlpKVDN4ME1E?=
 =?utf-8?B?elY2NjNhT0UwZEhoSjdET2RlUmZzL01WTHhUTlZXdXBxd2p2TmYxcStkUXV4?=
 =?utf-8?B?c3FWZVE1WFg3Zk5Lak5kOE4wRENaQzk5YitYSENYWWZCQkMzZUxDbmZZZzkz?=
 =?utf-8?B?bUlHT1F6U3R4dm1QY3dzMXZWYVVvUElIZ01jcTk5TG5ob0dSZlZYdmtzelNZ?=
 =?utf-8?B?Zko1TGVqME42R2l3cU1aRExNZ2tNaXN1L2dkTjNkTDRKc0dmYWhoZFB3R0pD?=
 =?utf-8?B?dkh5TUF1bXo3L2RiVFlJRHFTTGE5clNVbVNsWkxuQ0NCbzBKM3czYTRtQXV0?=
 =?utf-8?B?dlJiRnp2S3JTckRFcnRsczlNaXRjMWFOZmt6RnQ4Q21JbjBRVTFCNFAwMlRt?=
 =?utf-8?B?a2VoQUF4YUZCUVd6bWJKbG56bFRFR3htcTQ3SFltVVhCbVNTb1kwcVd0UVVS?=
 =?utf-8?B?dHo3YjJsbnc3U2Q0ZkVVQU1LaVhPMkpxMUtYSFoxY1hPdjB2NUxNVFFtQ05O?=
 =?utf-8?B?YzN2cGJhSDNHd0NPTE5NUzNJS2w3cUsvL1E2cXdDRjlsQlVOUEJuNmg3UW91?=
 =?utf-8?B?bzJaWnZnejh1WGQ0MEN0S2wvdnVQdHRObm1lYXRkVEwza1hKSGxGa2pvZ0wz?=
 =?utf-8?B?Vmg1S3dQVUxFTHl5eE8rT1VBWkFnbmRkc3B2bzYzcldmaC9QQ0pRdmJIWWJp?=
 =?utf-8?B?elFPL0xESkdsdWJvWit6aXMzVytEMUF5ZnV3bjEvV0NTSGVJb2xHdVFwamNZ?=
 =?utf-8?B?N1VqNUNrK0tHeFQvTEtWV1FCcVhSczFkK1pMOElGYk9sUThSZ1NUaVN0dlV1?=
 =?utf-8?B?Tm1xeDlYekxnb0YrRkQ2VnZtNnZadS8xdDlyTU5RWExZMFFzZmVuM3A3UG9I?=
 =?utf-8?B?bm9Wd0s2ZG04TlViM2pCcHdqdmFkN2x1a3RXZTAweGtCeFF5dGhtUmJXcnkr?=
 =?utf-8?B?V01jWWowNUlBQ1FRL3dBRUhpNzQ1ZVZ5LzN4eGR1eTBTekcyWUJyN1pIQnNk?=
 =?utf-8?B?N3E5SkU0US9TWW9ZL3hSY1o3RGw2SlFTaTBsV3NGb1ZrMEVrMzlaTWIwOU1l?=
 =?utf-8?B?VURMeGk2ZG0yQkZlZEx6UTZFQ3hmTGhjQm5pZlVQeFpYeklBQkF1WjNZU056?=
 =?utf-8?B?SmJ6SThFTFRmbWx6cHNia2FBMVRVT0Q2bThtcVk1dzlvdUNGcDJINm9PY21w?=
 =?utf-8?B?MTQ4T3dMak5XV3BDRk1Cb0pnVkxVTDlFb21BZldLY2ZOK1NFOVZNN2V0Vm14?=
 =?utf-8?B?bzhaR0kvUTF2Z2RHOGZhdURjSG4zQ3BXYktnUVd1ZUdBY0FQWlRSL1RseWY2?=
 =?utf-8?B?MHNRNFB4b0dldkkvcE85V0FQMFNIVjczRGVPeWNXWHNmM1FIY3lsdjVYcXI1?=
 =?utf-8?B?aGhQMTBvRmgwdGE1eFJzM0dYd1ZOckRPSTVOUE4rMjV2Wjc0WTVYdUhCbFc2?=
 =?utf-8?B?dnN5c2xjaXlSa1orb3hublE4SmdCaHUyeW4vSlpVSEdGZHhrd2x2RE5wUXdE?=
 =?utf-8?B?b0lCQWZ5ekJvNllialhPR25vQ3BZMm1lczBLYUk3b2dET1VPZkxrS01ES1Bi?=
 =?utf-8?B?MU5RRFlHOHV0RnZ2OUtHVUZNeW9kTmEwZVBtUW9Qb3BTdGlCQlB0MkxxK2RG?=
 =?utf-8?B?OG91ejJMU0tQOU5EWEFmQmlkTTdySmtlMVdXK2ZWZXNZNUhYd0xZZFZTRGNL?=
 =?utf-8?B?S3V2TlhGMEl3ODl5VFJCTDhlSHVWVHF6Sitnc0VUczA3RmJvaGpTMW83QnBh?=
 =?utf-8?B?clRCNjJtQjVlVGlYOUlLaTJacFJtN2MxbUFTcWRiVEVaYXJ1dXhDTzBWU0hh?=
 =?utf-8?B?Z0E9PQ==?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36cc1197-b9a1-4131-7381-08dbd459383b
X-MS-Exchange-CrossTenant-AuthSource: AS2PR08MB8431.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 06:19:46.5588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oiewPdDFnpzW3acCOkQJdw5Pjfsr1LeT5IOUaycU8YzWEl6Ss/JzFckIqzdqFZ+Y0Z/XmmH13ZyWgBflbq9dwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8561
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 06:19:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189636

Hi Slava,

On 23.10.2023 19:05, Vyacheslav Yurkov wrote:
> On 23.10.2023 14:18, Lukas Funke wrote:
>> Hi Slava,
>>
>> On 22.10.2023 20:34, Vyacheslav Yurkov wrote:
>>> Hey Lukas,
>>> Thanks a lot for the patch. A few questions/comments from my initial 
>>> test below.
>>>
>>> - I tried it with a go-based backend I have by providing ssh URL to 
>>> github. It seems like the GO_IMPORT is set to a module name from 
>>> go.mod of my project, which of course fails to fetch it like that, 
>>> because it's not a valid URL. How is it supposed to be used?
>>
>> Your assumption is correct: the GO_IMPORT is taken from the go.mod file.
>>
>> I've not considered the case where the repo URL is unequal to the 
>> module path. This may require manual rework of the recipe. Another 
>> solution would be to take the source URL from the recipetool. I think 
>> there is no correct solution to this problem, because probably most 
>> people might want to have the original solution, since they are 
>> creating recipes from oss components (i.e. from github).
> 
> Ah, it could be that module name is not used correctly in our backend. 
> I'll try to put a proper URL there, thanks.
> 
>>
>>
>> The file will explode anyway. Thanks 'go'.
>>
>> Adding more intelligence to the underlying license detection could be 
>> an idea: in your first example, the license file contains actually two 
>> licenses: MIT and Apache. Yocto has no way to detect those cases.
> 
> Yeah, I only mentioned 2 out of 20 in my email to not make it huge ;) 
> There are indeed around 20. I'll try to prepare the list and send the 
> patch to include them.
> 
>>
>>>
>>> - Could please clarify where does the version from go.mod hide? Is it 
>>> taken directly from go.mod? I'm trying to understand what should be 
>>> the workflow when a module version should be bumped up in the go.mod. 
>>> Will that be reflected in the recipe in any way?
>>
>> No, currently the go-version doesn't play a role ATM. Except one case 
>> when you have a go.mod file with go < 1.17. These go.mod files don't 
>> include indirect dependencies.
>>
> 
> Still trying to wrap my head around... When there's no version at 
> parsing stage, how this will affect reproducibility? If it's not known, 
> then whenever the version is bumped up in go.mod, a manual 'clean all' 
> will be required? (It's probably the same as now though).

Maybe I don't understand the problem: Is it required for the go module 
to have the *same* version as the golang package in yocto? In my 
understanding, when the golang version is greater-equal to the go.mod 
version we're good?

> 
> Thanks,
> Slava


