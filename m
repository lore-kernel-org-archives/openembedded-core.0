Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4A1FC433F5
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 15:33:18 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.88])
 by mx.groups.io with SMTP id smtpd.web11.13855.1633620796014230439
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 08:33:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=BnNZJKSE;
 spf=pass (domain: weidmueller.com, ip: 40.107.4.88,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nHMpbwe1nPf9d3cCbjrOB/OdWzJ//W6XqghcXsdyfkhE07atPbzQGmjH7vfgNJxeBFdaQFpi1RFvZHib0TPK4cCci3PJaqVcLyvPk7CC2FEBDbof7q3OgI8PEP2w87zdf1LXSoITzREeoDCkVdOmPEDafUi2vB+8zveRNOIf/NGdXDtW7KDQcSI73tX5sUO8OfOwo11vtJvIZohHjKISmyBzjUEUbXfQ+3DFxFjZYe8JGQ9QtPvrpm8D9lvh1ICwlDCHUZyDE/tkpMAlLkFb20voP5/z0EPSwUB0r+r0y1UkNGrYjC4vPsNRPi+MWSm2TtYl8b7rsbPnHM0Bgx5sCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YkCMHBuvGzJdOzJHuN3hzfiU2OzR8AaHNxm5OKdovOc=;
 b=LLCwMDP+mUBS6KvcNEZkmwc/WhjRsFtEgzoRpo1HA7Dlu/uvgnv5r59XvZaqjMTGjx6u670lfEH46lxW+Pp3MoxtfCxnX/5Wpq2EwiVyS13N7VaKVgfK6YG5yST3cNc6uf2dsU5Fw0Fug8yOrRzc/rqN48zJqBkyFiI7WZWBfrJcYljV3oyErQd9v/U3cXLAtPr0GWnJ69Epe/k5iN+GQLLIXlgzCor1o7awW33N9WVv7HzYlA8b3Qxgzk2La8gUpoDFzFwC/L/9OKXsApcQbRZHJP6b/vLvt4bT7c1lm3in+7HaEhjpJb0i5hg3K+fyQwdzRjbqnb8d1SbLbLc4YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YkCMHBuvGzJdOzJHuN3hzfiU2OzR8AaHNxm5OKdovOc=;
 b=BnNZJKSEXMnObr92Rp/BphQ6xSdilblVBchE36db3TMccFcOSTa/ozWmoc2+VSdAlki0MnwBcWVQ2KLtz8RqUrdTtNOQXS/vmZvUhcArXDZ81ALcWsieliosRrki79ANQsZteok2S/jsxq75tOedYOlHI15F4ps6hAmttEv1UFk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by PR3PR08MB5644.eurprd08.prod.outlook.com (2603:10a6:102:86::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Thu, 7 Oct
 2021 15:33:14 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::8034:af5f:f101:d1f0%4]) with mapi id 15.20.4566.022; Thu, 7 Oct 2021
 15:33:14 +0000
Subject: Re: [OE-core] [PATCH 03/12] recipetool: Add optional licfiles
 parameter to guess_license
To: openembedded-core@lists.openembedded.org
References: 
 <20211007101326.11075-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <16ABB8087E3F11F0.3789@lists.openembedded.org>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Message-ID: <64073230-71ee-7039-5980-fbb50d9e6931@weidmueller.com>
Date: Thu, 7 Oct 2021 17:33:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <16ABB8087E3F11F0.3789@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0701CA0009.eurprd07.prod.outlook.com
 (2603:10a6:203:51::19) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
Received: from [192.168.178.36] (94.134.103.254) by
 AM5PR0701CA0009.eurprd07.prod.outlook.com (2603:10a6:203:51::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.4 via Frontend
 Transport; Thu, 7 Oct 2021 15:33:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 60d2fbf5-07a5-44b2-fa6d-08d989a7c6ec
X-MS-TrafficTypeDiagnostic: PR3PR08MB5644:
X-Microsoft-Antispam-PRVS: 
	<PR3PR08MB56442F108A9759442213FA1FD7B19@PR3PR08MB5644.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	D0TJgeJBkOMOHQrOHxMuO+4Fv1+8ZUg3yINc6k6hBCq6cO2lKQljyVnydulp0c3A5PSNSRLC/piNuwrwfHYkVpViYK24TBrDafYnxfjYkwqoN+O/d08PQwZtARezlIvO6ev1xoRcOeMYD0p2gKzli6HUx0ClkaBdefsSw3oYeij241YeexrCRLyuHdJEwwTuw5kO7qr33SGpr2swAWZpnHDkL7YvNLlfdpui1XQ5/OhlYm8rXT8a2pJBgq7kL0vw29hyYN1CA4qPtwuRAefcSO+Lhb7urjBQyWb6iVM8sBrVKVQyIws+Jhy27Yc3EtP+YGBbMgkUBjdWjJxZE8ZOi0c+2BAcjydELlMhgpOS79NsCWxdR3v9bdJz+BhLLZunO7VoUm0iuEwRFysKKNJa0R29B3PWKluuNfZPzt9qPDEXMfQuG7r2JqjqekcavMVZHCNU2jlAoT7KFXArQOJX4VzaaSJYynQwXgaZgowpW3qObyD/lxkv8dp3bIZHEbEeYE2eEnsx9WpNDVSkAjUi6eEyCr5xiOq99yYsNiYCTyAQ/CGrPG3m1IGt08zD2Dq96Ls2RagBslz29WnKCPKVsPFMODvzydhg21RAH9CK7+h3whko0MfrdT9KcHU3c0wSM7qZPteMB+KHBbCv6XtaxHgf08XRJtphoIc8P5f2ip4Q06mzCn5bReIlI008GrxR9sNvjzHr58Qi40VYi4yxR+rz2TVR6xfNuDstR3NgcOuvWym/zA3CauvD1t1D7eSa0dva7enQhLlmxM7zj/1Q8dIt+pMHyzuH9bNWmpelO7JlmBXPXIAUMjLhNtinASYtUE89J1lSnpQ5wi95mEprkWnHu2IBcMNN8+C6hJEnl8o=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(52116002)(8936002)(86362001)(8676002)(5660300002)(83380400001)(31686004)(966005)(16576012)(6486002)(6916009)(316002)(2906002)(66556008)(38350700002)(38100700002)(508600001)(26005)(31696002)(186003)(66476007)(36756003)(66946007)(2616005)(956004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S1NKRVJURVBReldyM1pKWVQrQWZXaXd1UE5vUVZsN3NJZXNhRnAzVUpnQUt4?=
 =?utf-8?B?TmxIMC90b2ZSUTU1YXlwT0JER3FiUkNDcjBIZjFNL3FQanFocmgrMUs1RnVG?=
 =?utf-8?B?RUZjWHVTZmFKQmNEVnRmR1pBKzVNejhLeU5UcGNGMmxiRURNb1V4YTBUbDhl?=
 =?utf-8?B?a0xIVGQ1Zk9nUkhONjhOKzVxWVJsRTUwRkJNeVMydkR5aEdUSVpHUnBtOGFP?=
 =?utf-8?B?bm9oQ1F6QW1JV3oxNXZ6UjBCaWtJYmpqSTd5cHlObnJTS0dCMzlHODFPVHFk?=
 =?utf-8?B?R0grRC9wMjBmRU81eGpiQ05FY0UzMFZNNjNMVzBydThKUjVlVWhMeHJnM0x5?=
 =?utf-8?B?aUdJa3FobG5yb0d0dFRPYytsejhhOTV4NGdxL3dVN3pSdWFQbW9MY0V0Tnhs?=
 =?utf-8?B?N3dPbDdZM2kzbitvTUFFUmhpTDE2L2tLU2pibHBCaWFlVWh5dkJIUy96UGV1?=
 =?utf-8?B?anhYUndoMHYrR2dUZFlMaytBRTBOKzBXNGEzZ0M0V3Rqb25KbzlPY2EyczBv?=
 =?utf-8?B?Z1Rtak5SWU15a3FmbEk5QnlFellzVDBtNFZqWkpwR3ZvTFJ1LzJEYzVBVmVP?=
 =?utf-8?B?ZlhrdWExd1prTnd3aHczZkVTQm1OaEowdkhSK0ttcDZsYXltT3p3MlAzYjZO?=
 =?utf-8?B?MGVzSnR3WGkvWkhkYnJUTjIwOGlnMVVKeGdyTUdQMWlYeEtWNFhqNVJaK05i?=
 =?utf-8?B?c0k3NU9ldmc0dnFJS2RtNFA5TnE0WkE0NE5xWmJDanQxcXdNNGx1SW9McHoy?=
 =?utf-8?B?RzFOYVcyWW5kRDFEL1pMazdKNDZiZDljVlczdW1aNnF4S1hTTzEwWU8zL202?=
 =?utf-8?B?M2dkcUlZcFNTWjdQdngyaWNFVWdtTFd6eEtMRmVMaUU0WXJ2MDJFOFQ5KzdE?=
 =?utf-8?B?ZGVxR3BhUWozODREUUZETzkvU011aVZNT21LclhSajhJU0FwTWNla1VoSWdD?=
 =?utf-8?B?UzdNb1o3VXB5cUVSUVphUkJvVE5MdlNmVzRuQ0Ntd0VBK3BabmFCRTJxVDR2?=
 =?utf-8?B?Q1Ntd2Y4Q2FNQk5oaGwzUEk1b3Jjb0NGeDdBV3llN0pWcVhYeFFjZDljNFJh?=
 =?utf-8?B?SXRIdVRJUmhwVzJzVlpRZVJhdXI5UFpIM3FWZC9xcmN5UGg0cHhKV05lYThS?=
 =?utf-8?B?UVFSQjczemtWeXFJb3NaVTB4NDBjalFvU0lFOUVqd29pR1NPVkRmVTRwS3Mx?=
 =?utf-8?B?RFFnaVZyK1gyZkVlc0FmdXBtNjdhT2M3NWNKMUNlOWM0L2Y5RTYxMStTZ25C?=
 =?utf-8?B?enJ0cGt0QWwvMjhaRWdoUlliMTF4WS9GSEd3U0paZmh6djFXNVkySUJ0RUtQ?=
 =?utf-8?B?KzEyZkpxOTJKd1RoaTVWK01lWldwcjZjYzNzUm5yU294ZEkyWGNYZzVsdVZY?=
 =?utf-8?B?K3dtSXowekV5RnlEcW8zMzV2WlRkd2JXRkdQK0UrMHUveklMSHk1dkgwclcw?=
 =?utf-8?B?d2cxaTFhZjFUbXZvUlcybVoyS002elVxYTlqTHFpTCtxRWFhZDVJV0Zra0wz?=
 =?utf-8?B?MUdNQmxDZFhUR250Vk9YN0MwaXlwSUdRWDdIbDN1V2Vwa3pPM3hPei9IVjky?=
 =?utf-8?B?cGZWOGUwMzE0Rk9CRjNsWHBZT3lRU0dzMWM5QXFsNU1HdlNCZVpUNS9XcDJT?=
 =?utf-8?B?Smg2NVVENWEyd09oclVIdWZOVVZReXp6MXJESUNsRnRzdjRQRjZ5TzM5TmhW?=
 =?utf-8?B?Q2tFMUZiZGY0ZTFTRWtZK3dUU0pJTUIxK3M0MFRGalBIdk1zNXZwTGhPSGd1?=
 =?utf-8?Q?LZTBLmq/SiYbqp05S6S1o+0dLhLrb6Bx0t3//hW?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 60d2fbf5-07a5-44b2-fa6d-08d989a7c6ec
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2021 15:33:14.0903
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 TPoY9uFN0skhiJP2Jw3T9OXg1+91dgHdWtYA2R95v8exhIPIWY+7RSDmMd1je2WfHrqquwVKZMAwz6R1mTcmdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5644
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Oct 2021 15:33:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156738



Am 07.10.2021 um 12:13 schrieb Stefan Herbrechtsmeier via 
lists.openembedded.org:
> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> 
> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
> ---
> 
>   scripts/lib/recipetool/create.py | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
> index e88a4253da..3bcae962a8 100644
> --- a/scripts/lib/recipetool/create.py
> +++ b/scripts/lib/recipetool/create.py
> @@ -1105,13 +1105,12 @@ def crunch_license(licfile):
>       license = crunched_md5sums.get(md5val, None)
>       return license, md5val, lictext
>   
> -def guess_license(srctree, d):
> +def guess_license(srctree, d, licfiles = []):
>       import bb
>       md5sums = get_license_md5sums(d)
>   
>       licenses = []
>       licspecs = ['*LICEN[CS]E*', 'COPYING*', '*[Ll]icense*', 'LEGAL*', '[Ll]egal*', '*GPL*', 'README.lic*', 'COPYRIGHT*', '[Cc]opyright*', 'e[dp]l-v10']
> -    licfiles = []
>       for root, dirs, files in os.walk(srctree):
>           for fn in files:
>               for spec in licspecs:
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156712): https://lists.openembedded.org/g/openembedded-core/message/156712
> Mute This Topic: https://lists.openembedded.org/mt/86141412/6374899
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [stefan.herbrechtsmeier-oss@weidmueller.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

Will be dropped in the next version and isn't needed any more.

