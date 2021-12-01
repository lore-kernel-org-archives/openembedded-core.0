Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCF8FC433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 17:04:41 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.92.65.16])
 by mx.groups.io with SMTP id smtpd.web12.94652.1638378280604896445
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 09:04:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=plO7k3Dw;
 spf=pass (domain: outlook.com, ip: 40.92.65.16,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lys6FfDDSESEKBRB9nlvJyg2Rgdr/NNm22k272rIi4npnlFNJdejayoSN6c5/zzqFjqbMqVGLCH42OsXYuR6aCvgwy1gOOW/4LSsEPsL8Q4hN/bO81o3uudwXmm3ZxfchhJNpTR0RyK8J5mE7C47HLsyHrXkfcXX8/TvuE/bVdFseSALIf5qbro3BSVdPqvbwir6TykGX4jiE+Vc6HLcvHXRVwGVgSbe4AdnUTryYBdYJGrWGkfm0UlZm9M7XzQIHVpGyesNlDjDiAdITtfWOMpsf7DtREDJ/yVZGWJSCxW4oazZahesceMQFN5gHZx14stbQWBx1sQiAHr09P3Wmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9eLlM/fgthNYbJseJK7hNhXOS8yI7uxKnDNx+6XgWE=;
 b=m+A9n7DOQjKwOyT2tHChCVNhixGkEKvWFtv1/HWgqdRUp1zZSVxkUBu6bNQX+Dnbxi5waEtcN7V2ft/eM0FhW6khf0Z5dseBLUnZ84z0kQBGvEerkc8UoZ3ykKeJwju4Il984nR33iHIF13uIVrGsesHPR2JTG31SLpqeugCDkSXw+xI2HlE5kXlxzN9rVCBmDuY0Ygb4ZnzxmvBflHjZ0jv8R/MiKHSRDqGGXJEINx+vqFk0zHUqCPGWGNh/19Xj4sUtRrE1OZQp4ZHUfh/RJcmp0XrkxclUEq02krB/7I/C6+QrtDEcHBRnL2E0yiuNRDQxFzWqURp0BKDts/B5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b9eLlM/fgthNYbJseJK7hNhXOS8yI7uxKnDNx+6XgWE=;
 b=plO7k3Dwf3rTNl+NRx2HWtd3pGxxaOH7IhhkDxai0mdLOcd5+2Y51Sluo7qsBmtEV8lrqWvLnrIrgsmhXUiS+so3gmvREM7fpAeKAA7E3AlwE2PqWxwq5bMv1tCO2Wqt6mOlEGHhUuaPlPAIh7SMCdbMketgmIJlk7hMG7RTxUHI4+6owV3gCIal1u1Il+Kz3ob4E4yQCpIEoxySfz+YskYPxBHId51CmOkGwmUoDdiQxG76MLZNczIwPy++2Tt81mrAmRalGcBvhewl7HV411cO8t9ehRAc2nNoKhxWGGXXy4PPHdY0op8r8xKzFnpMj2ygkmkR52MO65P5tgYLyQ==
Received: from AS8PR09MB4645.eurprd09.prod.outlook.com (2603:10a6:20b:292::8)
 by AM6PR09MB3090.eurprd09.prod.outlook.com (2603:10a6:20b:c7::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Wed, 1 Dec
 2021 17:04:38 +0000
Received: from AS8PR09MB4645.eurprd09.prod.outlook.com
 ([fe80::f0c0:455d:26a8:99ac]) by AS8PR09MB4645.eurprd09.prod.outlook.com
 ([fe80::f0c0:455d:26a8:99ac%9]) with mapi id 15.20.4734.024; Wed, 1 Dec 2021
 17:04:38 +0000
Subject: Re: [OE-core] [PATCH] python: python3-idna: fix non-existent Unicode
 license
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com, Quentin Schulz <foss+yocto@0leil.net>
References: <20211201161335.3110181-1-quentin.schulz@theobroma-systems.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AS8PR09MB464559F9D616EB6583EDD813A8689@AS8PR09MB4645.eurprd09.prod.outlook.com>
Date: Wed, 1 Dec 2021 18:04:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211201161335.3110181-1-quentin.schulz@theobroma-systems.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [6BDG43morendZGxpLE69u+yGitjKF8vo1tvqOAXNf8KeS2S5UwnuBsKh+rJAH8W2]
X-ClientProxiedBy: AM4PR0302CA0019.eurprd03.prod.outlook.com
 (2603:10a6:205:2::32) To AS8PR09MB4645.eurprd09.prod.outlook.com
 (2603:10a6:20b:292::8)
X-Microsoft-Original-Message-ID: 
 <c8eb0fc3-322c-633d-881f-4e20ff664da6@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:3103:205c:200:bed3:df7f:f488:16a2]
 (2a02:3103:205c:200:bed3:df7f:f488:16a2) by
 AM4PR0302CA0019.eurprd03.prod.outlook.com (2603:10a6:205:2::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Wed, 1 Dec 2021 17:04:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab23bc71-5452-46c7-8a35-08d9b4eca830
X-MS-TrafficTypeDiagnostic: AM6PR09MB3090:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	iKEtq53juN5E9reRdUJFpuSf6MxaQj5WadkhskhrRisDwZ7UgsazAsyY9LzqdPlJoxsQZvB5KjKY9mITPq3Gw1ju6ov2e5JGOn84c6vlt87j22W5i8lY+cNgs4OFbtApWuiyKqYMRudIrHbEKfCcygsGFi3YzIOOM1DZNImW25xrEXJCsF5u1m1itVZUAv0PTHTx7CWkNeSi4les1L/BDQSMzJI/vgvvkSvU3MVI5rhASTCEoNbp2YbUP8f+w1OuCDJ/iAvsfRQz2CCXo3JXw4TR8ZFsILJ2w+DxDSHOvWGVzvGOW1uWjwWoJM1Bl2+A9i741EX7fdXgK3a7WqcjgmL4/vhahaBlRCkITw9iwEazSG2nh3FZ9K+URDjwzj3h6TbKCwFpjKBAzObY9eW2oapRSe/kRwZbkkrpHJwdcLacnUp8iqmt9STzhg0gilsOHAaQIfOtedOSzQAqTGt2nxzxCOvE6e75gkv+u2GUcFYai4M8h1sOowYFVh9vXSykR0agtS7m3CYavuP5FpPRZnvv1GDx7pCZzM4sbbl2jt7gi65dAvsD7FLa+rmowshQOWyLLyKHYWydDXAKGHxLDMYMqbg3pNbLSl0UqCoS7S3Mw9xzq4S2ihQN9L37BMq6fMmPRwaYn1vBrdAcegMa1oZswSmRmuAsB9IhBaon5VM=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	TCHV/lAT3CbOa4xEr5j8T9g48miS7ilENE5RVhQT2rpen2hUxvDOCImpbhUwzt9ZxPeCpsFKJTdjIT4YOUeu0n0U3rgbaROxWWC/Bx4ZhtaHtLZ3+xaQli3CkOMXISG+mZN/QCjMwELOyWt5d4ACenixdz4m/KxB/hycjAxt+jwmc6Hrv6TwyPsgtA0e64irIoZPyz0arN1897mWFVMtZziPvp9KGDVf5ll60gqpRywq5ZnyG5DUeePaa1JrG0jZMfwQyDAWJYiTi/p5nTZ5/y0ighLlJdrknNblKacYhAh8IJ5vCYjWYg21Hld78BIxJuKsq8xlqdOwK1/qdia2FZTZ6wqnSDWSMLuGf4wogk+f99Y7Cpn0kPLzosaKciru3SZ0O9SzSkeIUNOeTjJniooyskUrwYqDIwkrvjuE9yXp+iUqG4ilnou6xscfjibO6Fb0QNmeVtH8UYcl6W/7SxOV179IpB/DXPo5hMcQ80Hm9Zom1CT8SXC8vZKRTsGk5YkrJKG+hotwAUEk8yIKkfOWpNgaaYzZgj0yT1nyNBBP2L2c3Qae8yWIlQP9UUsbfpnATSCd3kt7zBv/hRAEazNcrVFxmrW+gNBkaaIda3wWVRQJxdUGfpNdXe4miRmeWTmf4mtdSqqLHS0gefdw4gkDDshvnvT5t4v8FsrKpiqMDKPYPO+wN0JzS2gERxZuG2OUrp26z8fLkYMUEMwq9IkrLrNdqxPhZR1QKoDkFdo9ghwBHhXmu/ko2SC5V+615Ecg4MV+c8NlNG/rpWL2ow==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ab23bc71-5452-46c7-8a35-08d9b4eca830
X-MS-Exchange-CrossTenant-AuthSource: AS8PR09MB4645.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 17:04:38.0105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR09MB3090
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 17:04:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159051

I'm kind of following the argumentation in the commit message, still I 
see differences between the Unicode-DFS-2016 template file and the text 
downloadable from https://www.unicode.org/license.txt.

Not much, but enough to make me think, if we wouldn't instead need a 
Unicode-DFS-2021 file and reference to that.

Anyway I fully support that change

On a different note - I think any unicode license reference would also 
need a copy of https://www.unicode.org/copyright.html, as all the 
downloads point to that (and the license in just a subset of a broader 
scope of rights and regulations) - INAL, but from my limited legal 
understanding we should reference both

On 01.12.21 17:13, Quentin Schulz wrote:
> In addition to not being an SPDX license, Unicode license also isn't
> available in any of the LICENSE_PATH available in openembedded, meaning
> the following warning is printed:
> 
> python3-idna: No generic license file exists for: Unicode in any provider [license-exists]
> 
> Unfortunately the license is not really explicit in the project. After
> looking at the code, it seems that this license gets pulled by
> idna/idnadata.py and idna/uts46data.py which are auto-generated by
> tools/idna-data which downloads data from
> http://www.unicode.org/Public/{version}/ucd/ and
> http://www.unicode.org/Public/idna/ which are covered by
> https://www.unicode.org/license.txt as mentioned in
> https://www.unicode.org/copyright.html.
> 
> Comparing https://www.unicode.org/license.txt to Unicode-DFS-2016
> resulted in a match so let's point to that SPDX license instead.
> 
> Cc: Quentin Schulz <foss+yocto@0leil.net>
> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> ---
>   meta/recipes-devtools/python/python3-idna_3.3.bb | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/python/python3-idna_3.3.bb b/meta/recipes-devtools/python/python3-idna_3.3.bb
> index a0e6b79a56..f3c53a8717 100644
> --- a/meta/recipes-devtools/python/python3-idna_3.3.bb
> +++ b/meta/recipes-devtools/python/python3-idna_3.3.bb
> @@ -1,6 +1,11 @@
>   SUMMARY = "Internationalised Domain Names in Applications"
>   HOMEPAGE = "https://github.com/kjd/idna"
> -LICENSE = "BSD-3-Clause & Python-2.0 & Unicode"
> +# Note: Unicode license is pulled in by idna/idnadata.py and idna/uts46data.py
> +# files auto-generated by tools/idna-data which downloads data from
> +# http://www.unicode.org/Public/{version}/ucd/ and http://www.unicode.org/Public/idna/
> +# which are covered by https://www.unicode.org/license.txt as mentioned by
> +# https://www.unicode.org/copyright.html
> +LICENSE = "BSD-3-Clause & Python-2.0 & Unicode-DFS-2016"
>   LIC_FILES_CHKSUM = "file://LICENSE.md;md5=239668a7c6066d9e0c5382e9c8c6c0e1"
>   
>   SRC_URI[sha256sum] = "9d643ff0a55b762d5cdb124b8eaa99c66322e2157b69160bc32796e824360e6d"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159041): https://lists.openembedded.org/g/openembedded-core/message/159041
> Mute This Topic: https://lists.openembedded.org/mt/87431709/3647476
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [kweihmann@outlook.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

