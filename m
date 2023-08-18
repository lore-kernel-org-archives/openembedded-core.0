Return-Path: <charlie.johnston@ni.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D000EE498D
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 17:51:30 +0000 (UTC)
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (NAM04-MW2-obe.outbound.protection.outlook.com [40.107.101.121])
 by mx.groups.io with SMTP id smtpd.web11.990.1692381085894856646
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 10:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=selector1 header.b=e2jAbiWI;
 spf=pass (domain: ni.com, ip: 40.107.101.121, mailfrom: charlie.johnston@ni.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jva0GLJ/LdpX6W6f0A1irBoULJIDZ6AyUg/57qZvRihoJ6+W7G3IUrUreR89hHtwBqgWXj7IoMQzcOnsCE/SqZLjELcBvar+DVV6SyvQE7RQ/K1jUiIn4kMKI+opp8IT7S77Djp3VkDSGBJGZMkw1NXCvkeiZrVY/uJaSkJGGNt6Z+5e+8j+mTG5k7l50H0BjvlrObbCn5csANDuj7IR8N4Tx/nKC1y7AeqnXKmgJ2OqCLqHN/ZhuXWgKd4sM/t++TJ7rKP9PSdBxGjqzRl0HBuOV2UP4EoidY+HhB2L0EP6g2MZzZWR+fxG/L9OjqJFHYPDe0QlZWhIh5DbCq+IGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pKmIq03TxnaaocoH8YwPQq/JCD8rv21GJtrcnM8TLS8=;
 b=A+lqdrjTq9rFDe+etkcvpoAV1JmdItvZdT+KIQlEkFSh75+y9A9Yk4wKknJwJvT05qFJWBlNptkemUy8TP/xb3rnuEnmrTCZb231KYVkJucNZby2uFTLHrc1qG2lByKCEnFBbXslD86PKZW2iIxF88HfvUQTURYQNefTZs3StZ5aHNryPWq2wB19QUmscpsFypqLPGXGv9LBzSOr6NqRH3B5e5FY5WUXkUVaG30ltMUGSg7aiUbVje0f7VrGIXJviovW64X0sfbOqPsccAaQ+AWTDfiI8zsCEZBQmFfOzYJEs+r+r/JT0DGs5mWiCnCkvZbYo2+1xmMGSbfHpLEVig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKmIq03TxnaaocoH8YwPQq/JCD8rv21GJtrcnM8TLS8=;
 b=e2jAbiWIxqh/gBOqIBoNc1m+Aa3LcAh9B1mAvMvqwVp+sVgRN/YDFtoXbVmONxRN/JUlkzIdYTe2dSlWczkKBqYTWu2EY8xs3QNKc2nf2nqFE5wpdo3KBWFaKgOSCPorYtDPtZJSle6EbjYADkqqUeSVK5Z3P+vXgI7zz8r1IWA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=ni.com;
Received: from BYAPR04MB4870.namprd04.prod.outlook.com (2603:10b6:a03:4a::15)
 by CYYPR04MB8867.namprd04.prod.outlook.com (2603:10b6:930:bf::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.30; Fri, 18 Aug
 2023 17:51:24 +0000
Received: from BYAPR04MB4870.namprd04.prod.outlook.com
 ([fe80::9f2d:5e4c:747a:6add]) by BYAPR04MB4870.namprd04.prod.outlook.com
 ([fe80::9f2d:5e4c:747a:6add%5]) with mapi id 15.20.6699.020; Fri, 18 Aug 2023
 17:51:23 +0000
Message-ID: <d09e99a8-008d-b31a-ac56-fba55527f904@ni.com>
Date: Fri, 18 Aug 2023 12:51:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [oe-core][PATCH v2 7/7] testimage.bbclass: Update rpm dnf tests
 to use do_packagefeed.
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
References: <20230816200931.2577181-1-charlie.johnston@ni.com>
 <20230816200931.2577181-8-charlie.johnston@ni.com>
 <202308180840062b5ac1f7@mail.local>
Content-Language: en-US
From: Charlie Johnston <charlie.johnston@ni.com>
In-Reply-To: <202308180840062b5ac1f7@mail.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0069.namprd04.prod.outlook.com
 (2603:10b6:806:121::14) To BYAPR04MB4870.namprd04.prod.outlook.com
 (2603:10b6:a03:4a::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR04MB4870:EE_|CYYPR04MB8867:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d536812-8893-4625-7c6c-08dba013bcd4
x-ni-monitor: EOP Exclude NI Domains ETR True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	e8hT1+1SKiuTdbAfZYgXk+AH1r8D7Op1GpIp5C/HYC5/9AkPdTt57S3g0Z5Bf4D0mxhoQovE/vWQ7ceiLaNuwATRO3WkBQnP2e1sLmXXi3UErhF5k3jeMomZzOnrG0OFwgOTnkHOz5hrfJm7Nu579UQQtq63w8eAjPrfnFR0xwX5P6hvkPUwehxCvoxpvd4/YknWdoDX/+bJfFjmpLIrPSeaqd9otpICTmJ+Fcob5mlj2Smv7uVRRtRN43tbnjK1reqX93+qPX8ZSIhzmXN6x69QCN2CCeidslya/dRpG1P0aM/DciFxxG8m3moQNBTJFgxf5PmSJuNvV1wGQdZbAmNGFy8u+i5Y+0dnUzrZlDxkf1TmOYoe/2Wb0DYwaIRN1FN2H0+uS1k3+GrmDup074VUPyu2Ljljt/t04VpexCXZnqf8ORLj3w9p/kqtJZWTtSFHWc6StadMZxsGX8v804Rpv5eE/wDmxb+GidsJ9HkJpWvbZB3E5iA2FTALuia9hleChgGcAPTLNRcFmwlqtX3+tQetybJlDDuvqpcHse5X1vaKOWIGHYH7YNsXiKcUcvaivl7qylzgnjIgLwjMrciWNKw7jLN0iOV/6tfNUA6TzEzbhD3eaAoBTWbid7N/
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR04MB4870.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(366004)(376002)(136003)(396003)(186009)(451199024)(1800799009)(2616005)(83380400001)(6916009)(316002)(66556008)(66476007)(66946007)(2906002)(26005)(36756003)(44832011)(31696002)(6506007)(6512007)(31686004)(53546011)(6486002)(15650500001)(5660300002)(478600001)(966005)(4326008)(38100700002)(86362001)(8936002)(8676002)(41300700001)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eFdWcWxPbUx6T3RZT3kwTG1veklEN2FvbzJWUm0zemJ4L1FId29QN3VrVVJI?=
 =?utf-8?B?WnhtV1VUbGZlT2NuN1R3LzFEQmdrODU3NjJGcWRGS01hZ0F0cXJVSlVjd09R?=
 =?utf-8?B?MjBOTE90aWF4QU8wSGJFbzdvb2JwbGlDVG1VQk9UK3cxcWI2RjlqUHh3clF6?=
 =?utf-8?B?c21nSkdPSlBaWlRrUUc1QnVLL3VVM09XaVFIbTRNRU56QVFjYk4vOE1YUVo3?=
 =?utf-8?B?Q1RHSkdYY2pNbXkxak5mT0pzMGo3VlVKV0VKVjUzVE1hZEtLelV0U0NvczRt?=
 =?utf-8?B?eGJPVGEwaUwyOHNkZ0FZVzV6OXhVQTQvNnFGbGNyQnMxNk92bHBQU3hXM1FI?=
 =?utf-8?B?dlNsN01zVXh2UmJ4d2kyK1pnU055Y3d3eFB0S28xZ0E1U3VRbmJEYms3eG9I?=
 =?utf-8?B?THZ3MC9KNUpOL2RIaTBxbFdJYUdkSDNPaWdoTGhFQTcra2E4elFHaDhhaUVM?=
 =?utf-8?B?eERKcXJXODUrKzNVL252R1JxeFdHNFFkcUVWWU1QY1RZVHIza0JsUU03VUgy?=
 =?utf-8?B?OFNWSGNWNS84K2tTVlJ3YVMxeGM5Mk5NemN2SVo0YldDNEFJQnNCd0FRc2hs?=
 =?utf-8?B?ZGlSbCtuSFFIbnhOT3N3Rmtsa2tRdHNrK0p3RGp6b2JvYmozVHh6NmMweDZE?=
 =?utf-8?B?Wi9pTmhkRldFUU8vemp0MHgvK3RSZzlFbUQ3czQ2N1Z5dWViNmwzREU2alNs?=
 =?utf-8?B?eDY4YWhKaURXVlRCL3ZNQkFZMENWMGkrU0ZPMDRkWHRzTXVhTWFnWE1zblNh?=
 =?utf-8?B?NktnK29vTTdMUkdxbFBvd2cvWmtkcW54cCtMNVg4UzB2MlJQME40R2tMU3VI?=
 =?utf-8?B?cGVWUkl6VFFJbHRFTUcwcXhYMGhtajNLdTlCbjAzaFNlWXFhM3UwTit2OW9t?=
 =?utf-8?B?MGl5ekcrdWdIcmlmZHFYMGh4UjJCMHZxcjZuUExxbnJqdUZKRit0RlJTUmZX?=
 =?utf-8?B?bnphdTNqOVNzbW92cEw3b0tKSktObWtjMHJIZEtjNDdVWnMvVy9HZ1JFS0NK?=
 =?utf-8?B?WFpqUWtVbDFVSzVUbURPMHBNdXhJWmxkNUR0NzVDd3ZKT3lVTHdoQUVqTDNa?=
 =?utf-8?B?c3BCUDM0LzFGZEN5UGRCaUMvZDZ1aUVwZktpVHJjMVlSWmIrNElpNkNZeUZS?=
 =?utf-8?B?R0FjOXpGYmVBaGsxa2pWN0lGcDF3SXBjdFROMFB6b0tEL2p3Q0xDbVpSN2g2?=
 =?utf-8?B?SmJnZXVlTW0rbG4zVFlVQnlLMUZwOVJNSENyTTBOWEE5VEhVVHB6a2xQYVh1?=
 =?utf-8?B?VFg4MWRBcGREMXo0cVJlcjdsaDVTRml0UG9ESWpBZmtycHpsUXJaVWliUWkw?=
 =?utf-8?B?bTFxWm9RUlgyUmF2TFI1cHA1dWIzTkN2eUdxZytvVStYRFRBOGdrR2pOMkQx?=
 =?utf-8?B?aVpwUHp1K3VHZW1oZ2F0MjlOWHFHZUlHN2ZlYXBkOG1qU250Q0ptQnNScUNU?=
 =?utf-8?B?UHlmOXNPY3R3b0pKMmYvWFhtb01aQ3BBbnRiQmZWcllGR3g5OWlWWmJ4QTRz?=
 =?utf-8?B?dGhoMlhJeXRJc0l5Y29FWW90ZnRqb0VYbDlXYlVJUTFFbVRCekVML3ZqbHlK?=
 =?utf-8?B?ZlRWTE1LUnJHQXNTMm1UaWJJR2xMVVk1Wkh6cmc0K0tIYUpTa3pzK2FCZFEw?=
 =?utf-8?B?SU5rdDhwTWhnKzJIcVVSVUFnalFtNGQ1bHZMRzIvNGswWFh6ZXI0VncwV1Rs?=
 =?utf-8?B?Z01XS1k1WTRLRGpjT1E0WnN5cUs5ZDJtS2RsTHUvWVdtWWNEMnVoVGZTYWFG?=
 =?utf-8?B?elozcC9Uby95TndyR1d1aWZnTG9WMkVGazh3am1YeVhoYWVPbEN5cUlqb0pp?=
 =?utf-8?B?ajhkSDFreDJwZ01JQ1ZhVXBqTUJoSm4rZEZhWHA0MnVTRUJPUHhPRW5JVktq?=
 =?utf-8?B?VFRuVXVTemU3VkFoVWw4V240c1c5VWZNU3piNnlGamlpVGU3M2djd0tNdlkz?=
 =?utf-8?B?RTFoT2VTVXNlR05tdVZWL2VoZzZvclFkU3J4RWEvOU5rYzVPYVJia2pSWVdp?=
 =?utf-8?B?QVNydk5kODVOS3RrQ004bW1IdzVHMUdVSGJ3Q1FsUDZES2pWYmJHSGRKcGNs?=
 =?utf-8?B?bmVYWmY2dFhod2IzMDZ0OG82YXhLNnpiV0V3TTdsUXFvWmVsT25GR1Q5Sllq?=
 =?utf-8?B?K0pUbUVtMlE4bzcyNmlnVTEwN1Bkdk1oaDBXRG41UiswUlVkUjg4TEdBRGt0?=
 =?utf-8?B?RVE9PQ==?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d536812-8893-4625-7c6c-08dba013bcd4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR04MB4870.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2023 17:51:23.7690
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D8zqjgPoi4aNqLf1Dqq5sEYvXZNWFLf03IyQ67WgGo1HB+gWFiJD4QnQ+vEe17KdLuq6Fj9EnrOiKfX8g5Ad2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR04MB8867
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 17:51:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186392

On 8/18/23 03:40, Alexandre Belloni wrote:
> [You don't often get email from alexandre.belloni@bootlin.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> Hello,
> 
> On 16/08/2023 15:08:37-0500, Charlie Johnston wrote:
>> To test the new packagefeed.bbclass, the testimage case for
>> testing on rpm images has been updated to use a newly added
>> packagefeed (packagefeed-core-rpmtest) instead
>> of manually moving the feeds from DEPLOY_DIR_RPM, removing
>> unwanted packages, and building the indexes manually. The
>> new logic creates the feed in DEPLOY_DIR_FEED_RPM via
>> building the packagefeed and links to it from the location
>> expected for the tests to run.
>>
>> The resulting feed is technically bigger than before but is
>> still smaller than creating a feed with all packages present
>> in DEPLOY_DIR_RPM without the manual removal step.
>>
>> These changes were tested against testimage runs of the
>> following images:
>> - core-image-minimal
>> - core-image-full-cmdline
>> - core-image-sato
>> - core-image-sato-sdk
>>
>> Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
>> ---
>>  meta/classes-recipe/testimage.bbclass         | 57 +++----------------
>>  .../packagefeeds/packagefeed-core-rpmtest.bb  | 14 +++++
>>  2 files changed, 22 insertions(+), 49 deletions(-)
>>  create mode 100644 meta/recipes-core/packagefeeds/packagefeed-core-rpmtest.bb
> 
> This causes:
> 
> WARNING: packagefeed-core-rpmtest-1.0-r0 do_recipe_qa: QA Issue: Recipe packagefeed-core-rpmtest in /home/pokybuild/yocto-worker/a-full/build/meta/recipes-core/packagefeeds/packagefeed-core-rpmtest.bb does not contain a SUMMARY. Please add an entry. [missing-metadata]
> WARNING: packagefeed-core-rpmtest-1.0-r0 do_recipe_qa: QA Issue: Recipe packagefeed-core-rpmtest in /home/pokybuild/yocto-worker/a-full/build/meta/recipes-core/packagefeeds/packagefeed-core-rpmtest.bb does not have an assigned maintainer. Please add an entry into meta/conf/distro/include/maintainers.inc. [missing-maintainer]
> 
> 
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Ah, thanks for catching that. Hadn't rebased since the do_recipe_qa task was added.
Fixed and resubmitted.

Thanks,
Charlie Johnston

