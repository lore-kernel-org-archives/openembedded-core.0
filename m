Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1604DC433EF
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 06:55:20 +0000 (UTC)
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (EUR02-VE1-obe.outbound.protection.outlook.com [40.107.2.65])
 by mx.groups.io with SMTP id smtpd.web10.8374.1652252095976291149
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 23:55:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=W+zokc53;
 spf=pass (domain: weidmueller.com, ip: 40.107.2.65,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=evWaENlmR9U/UaNYRIXNvGMKQuUhrRWnM5flIzBCuBi6cZPCu64sE49x7dZnVTP2oj0lB12S78OAe7K7UAp+P++UlBk0z6MDpKAV63WVK3E2yuRc12c27t4DQpz9Ay8FGm8+xlBwYdevtygz1FbRWaC6E8V5hbzw6EqnzONz6jrdsN9c6TA6elQCpmybO6DMdzGT2SnCJa4Ngmiwb+43SuV2qUp9/QMY9SVbCQje49C8FMYGVYJ7pC1S6VOZJtG4And4qaQqeJ+6EQpwnLVQf9yHxYQe0GEfK9rxvTYPsyG2q7g70pQ5dMsDAmk9m86MDx6iBZgWigE/yX3RrKgq/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G0d53XgGQwC+e3HSpHl9kpwRxDXat9Uo03bYsGzLgGo=;
 b=ChX0zhpx9QG8Z4vyec1BurvtCpJ45/8r17l9oqeOZfJekEyWjRejDDG5Z51Nss+yYz2T5eKwCQBnkJlKF0Vct0fSEGQSLp3unnbv1pO0nCjuC4rBqRdp6d2wpjb77moofLuFY9R7u2ojfhjUsvAY0HMFne1Gzm7qfAltQe8mfeZX0g+43gFw0LPfmeeIo7UukzXSw6y13MNO4tn3gapAW60XHFSqYj+ezdN/pIVz4akRBwtBHkqpHZDw355yEaiklWp953cSYz1oOELiu2F1H3fWOHfa8QerBKhXyeXW4VhoZLUDlnxS62EuAENWDHeNtPzkauLqwbZI+bH1V0moJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G0d53XgGQwC+e3HSpHl9kpwRxDXat9Uo03bYsGzLgGo=;
 b=W+zokc53LdhJ10+0UcS55wphDVPGgQMC21lvW7+1FSee1VOpoZiTD7GrlyF1PhUxNk3AsYICZEkKM+zLC4hCXl4Xzh9u2Jxr+3pE9qONcxG3P84lB7z3S/bzn4ZyNdx4vhbvFRnjrL1YVKJWuIzPA/shnBWTtXItnViK3vnKR6g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by DB9PR08MB6908.eurprd08.prod.outlook.com (2603:10a6:10:2a0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Wed, 11 May
 2022 06:54:51 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f938:78d7:da4b:8d23]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::f938:78d7:da4b:8d23%8]) with mapi id 15.20.5227.023; Wed, 11 May 2022
 06:54:51 +0000
Message-ID: <b5aee412-5db4-9aac-4422-79e667bfc773@weidmueller.com>
Date: Wed, 11 May 2022 08:54:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
Subject: Re: [OE-core] [PATCH 1/5] recipetool-create: add ensure_native_cmd
 function
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Lukas Funke <lukas.funke@weidmueller.com>
Cc: openembedded-core@lists.openembedded.org,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20220506065917.1375-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20220509234659.74b95a2c@melee>
Content-Language: en-US
In-Reply-To: <20220509234659.74b95a2c@melee>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0230.eurprd06.prod.outlook.com
 (2603:10a6:20b:45e::26) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e3e14fd-01b9-49d4-f0f0-08da331b2564
X-MS-TrafficTypeDiagnostic: DB9PR08MB6908:EE_
X-Microsoft-Antispam-PRVS: 
	<DB9PR08MB6908A7F5BFF29D041AD04758D7C89@DB9PR08MB6908.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+EoL9nByqwklxTNd5i91sABupAynvZgmQoeZVc7eBC10tS3+nunilTHmRjzVxkfVm7cnigRA3JXWaMjpSF0xnY31PuzLCdtneZRFANZpCSIV/TMsJSDvfDlro6X34e5Yj5Yp1DM16NotDv2eaIdLi5BLXTtaj8E/g8PiIVOFCt1Tiur4xDS7yo53rjYhy349Du3ZbHCi8izrhX0tpRkLsgXSU+6dugGWwEZcyqnBxOY7PXLkYrisjXF4hy/JSFgPHMxOJuTwVztOe8F3pvE0Fux6qmNdw4xiqBvY8VKlC59alm6CtTlYb+SEpUb9iSdV1SzZePZLHHd4f/AZ9pKNIbWjuw7Q+gG5DgV7QBg3cVfwSFwfrr9LoAgK/3N4eXsRbQ2TC9ZeAoe4dMARSNTev8wl2TnD7fPFI9XrlkjUd9QUcDYDAuI/Ddg1MXhuDL2wRe7OfI7r8k6zQM2Ce5n+cjzcwdfWjXFKcu69MlxUgDXJ7XKoON+UT5R4jZ3bBPJ8oL8Z6KC4mlzOznbR3+eFj5p7pBWEdswS8NtZ2fyg2wiI7dJipoY6WeUiDq8td352ukI4I8ZZ/+NlCUzhYhy5GT5J75JqSzppeOkpU3tk4mD+vv6NqidzQs5tH4NhOGR3SNsM4iUSf1WqfHoKsduyb+58/GUuMqhnPd3a0rpuPNcZJeR+/mjR46H8Vo3CN4fPfGBhouq5sR9KXHd3zR13CMoSSoSfmArU5Ljo1xS34jNdC3cefzmTsK799d4Rqcr1kJXIlGWDInqU+uWo9R6756NcHTabb2HalEFMGrd6ifIP/rJWtRCYKZvorB6jKzV7G8KD3o1Vwu+EPkgZK+ES3exkyDWrnuIewyXW0izyzA8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(36756003)(6636002)(83380400001)(4744005)(110136005)(8936002)(66946007)(66476007)(66556008)(4326008)(8676002)(31686004)(38350700002)(38100700002)(6486002)(6512007)(26005)(966005)(107886003)(316002)(508600001)(2906002)(5660300002)(6506007)(86362001)(186003)(6666004)(52116002)(31696002)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZmExTCtoN0d1cnRHUnpzQXJDQTVrckwxNmx4SmsvZzlmNnhNTFQ3KytzZk1z?=
 =?utf-8?B?M2hOd2xDZndOUENrR2E3QzZaWE04SzkzeEdVYmE4N0p5eFFYWlkwcVZDR2hi?=
 =?utf-8?B?QjJiRUlZazk1Ulp1QnAxMlg5OGZUenJhTnlmdzZuTmozU244clgxVERhaHZz?=
 =?utf-8?B?U1VqYXA1TVVkcHEwdi95d1FqN3VrZHNSa2d4eFQ2Q0dyWDd0VkNrOXNYZjhp?=
 =?utf-8?B?aGhpaldZd092K09NZWFUSEtzdjQwZTZaMzBWdnNQYWZGWkwyZlMycGlEalVq?=
 =?utf-8?B?NGkrZmcrUk93Z1ZBNCtrV3dCa0pxSC9vbTRlWUpHSnBqZTU5VWxacXgrS3dN?=
 =?utf-8?B?bWttTzMraFpKMWxCMTRVOTJodWlINU01anRsN2ZvMjZHblA4T0JBdjVwSFU5?=
 =?utf-8?B?UTNISjBqRnMzbWI0OSt6dC9pREN3UnhQcHdWYXhldDY0V0owdVVlc0ZlV0NP?=
 =?utf-8?B?NG9ISG5URG4wZmlaOGlVdzllQmM4K1dZeFY0MHhmRGhObi9kaS8xMWxtdWJn?=
 =?utf-8?B?Ukgva0NiRFYrc0JCbDkrbVlpRzdaMFhOak1sdURmUUlaQ29lTXorLzMrSllM?=
 =?utf-8?B?YnI2R0VhMWx6Tk02RWNNODQ4K0NOMFE3ckNZSlVEbmovZmdzY3dGeDZWQTZl?=
 =?utf-8?B?eFcyL3RSZFZZK3crUXBBNlBoTE1LemhnQzFQZ3hteHp3MXhyVFBVSEExNVR3?=
 =?utf-8?B?bWhCdXNFODhJVGVyN2x2dkxSWlBvc0dHYVhNWkpwdGFFYlM1WjJuMEd5OC9v?=
 =?utf-8?B?cTQ5eGFKeU9CWnpIOVp2czRZZ05USUZadzQySGlETkZOUEw1eEJTVkx5elJ0?=
 =?utf-8?B?SGdRa0pWcUVzRllSRHNKUHZzYXZObFRGcHpyZzZFTktMQjVtVEQ1OE9keDg5?=
 =?utf-8?B?QldnRTNIdlE5WkJOODBvNURxUFZrTURvUzJ0MUlmYjhiZ2k1aDVjbFVqUGht?=
 =?utf-8?B?eUVybnZSYklURUJ2NzVUVE1ocG1SWGxabk1CdXFwckZOYmRmY2ZDZkY2NXVj?=
 =?utf-8?B?d1Q2bUEyaFJJcWhCWmxudURYUVp0SXEzQVZJeFdEQkx2ZTlwNmNmajRkM3dk?=
 =?utf-8?B?WEU0Sk5uYlBDMzFnU0l5Zng4aXVaVTcrZ2NtdXRPQTNJZURWUjZuNURlOE5z?=
 =?utf-8?B?TG03NGNIQ2RGWWgyK3VoWkxiQnljU1l3WTVGanlnWkpBaE0zR1JVOThja2pQ?=
 =?utf-8?B?WXJwTDNSZVZVYjR1cUdOTFVCUTQ0QTdUQ2JSQ3l4Nlc3Umh0elVIdG93Yk94?=
 =?utf-8?B?S3NqL1BaU1NwN05PNzNxL2NHZTBXSjQ0cnBwaFpTS2tYZ1ZMQUZFcnlIT0R5?=
 =?utf-8?B?UHMvNVJjV0VORXExQnpCR043amwwbWlUM29RM3pmUkdhdnVmczBwa1hiWno4?=
 =?utf-8?B?M09VVzhkYTU0SlV1NThxS2U2QVFEQTFsd0FLN01pMWlLcEV6dkJaMFFxTk5B?=
 =?utf-8?B?Z1ZBdGh2TzArd3RLRVl4VnZNTFVuTTNyV1FnL2xxRHI4eVh2UXNlY1NJSTlh?=
 =?utf-8?B?V0l2L1lkdFIyZjRZM1B6Sk5TMG1vdjZ2NUNQL0xUVVl2NnRYNnZxTmxOVFFZ?=
 =?utf-8?B?dm0yT0VJOGoyeE1yQmY1SEtDWmxXUFdabnpqWG4vSEFqSXFnR2VDSDI2REFn?=
 =?utf-8?B?VlJpQjZ0L0NDcFhEcnhrbk5OSUVOdUY3VzVkb1EwY0VVVk1DUG1ubmFCU1FU?=
 =?utf-8?B?VFhYbWNja2tYL1l1VzhhaTZUZDd0WkZnall5d2dnSkJuM0hWeC9vQkg1NzFm?=
 =?utf-8?B?RXIzRGlhQ1kxbytNeWJnUVR5VktPYVFEWDFTTkJWSHJCa2tKTlNhZUptUERu?=
 =?utf-8?B?ZzdZVVg5YW1PRTZvcXUwMVlIUmhaNGQ3NFZVS0pJaS83SkFwTis0bTllRlRu?=
 =?utf-8?B?anhNckZLTzVxS3JtR0RsZEJOb2s0SXhBSjB4ZGZqYkVJREZUYkZzMXVKWTVq?=
 =?utf-8?B?Z2FiVGdLMm5idXRTZk1kSjg2S0FGVWpuY09qYTBQOUszSVNJSjhFQ21EQzh0?=
 =?utf-8?B?Mng0Wm9mMmdRMFlDZFllMjlkZVNTMDlicDhHNnNHS3J2MjRCbFN1QmpYWWZ3?=
 =?utf-8?B?cHNxOEd3ZzZSeUdXMkVHMFJ1dUN0aWhrT1RnSmZHLytiTHhqVU5kMHdILzNz?=
 =?utf-8?B?ZkFRUkFKRVFLVHhpV3ZsS0lTd0NUaURtcHVCNkpPMXRPbmpMKzVwaUIzWWRs?=
 =?utf-8?B?WERLWmJsRzhyVGQ0VUtncS9yc0U1TkxFUGVIZytzTGY1R3R6WUNadnIxVG0r?=
 =?utf-8?B?MEp3b0ZYTzB6OWtoRXdzeFF1MVhSWmNnSXU5ck5wMG1aUndlb01tdjExbVBz?=
 =?utf-8?B?NERTQVZzdlJpekhGdXdUZE1wL1dnL2NDSGhnc1RXRWdja2dWQVdJOXA3cTds?=
 =?utf-8?Q?rIRg/4R+BeTvaT6w=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9e3e14fd-01b9-49d4-f0f0-08da331b2564
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2022 06:54:51.2427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SS3WWiSfiIZ9/ozWLZxofR6zuj0kOxPBnACnHxdk/GAzJ5vQrV7hxrtlxIdIy1l4vTqmMYbobUnePXRJwvgEyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6908
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 06:55:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165487

Hi Luca,

Lukas will check the logs and fix the problem.

Regards
   Stefan

Am 09.05.2022 um 23:46 schrieb Luca Ceresoli:
> Hello Stefan,
> 
> Il giorno Fri,  6 May 2022 08:59:13 +0200
> "Stefan Herbrechtsmeier" <stefan.herbrechtsmeier-oss@weidmueller.com>
> ha scritto:
> 
>> From: Lukas Funke <lukas.funke@weidmueller.com>
>>
>> Signed-off-by: Lukas Funke <lukas.funke@weidmueller.com>
>> Signed-off-by: Stefan Herbrechtsmeier
>> <stefan.herbrechtsmeier@weidmueller.com>
> 
> Testing builds with your series trigger many build failures related to
> recipetool. Can you check these logs?
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3557/steps/15/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/3506/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/3527/steps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3566/steps/14/logs/stdio
> 
> 
> 

