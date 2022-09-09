Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75695ECAAD3
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 08:42:21 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.92.65.54])
 by mx.groups.io with SMTP id smtpd.web11.4390.1662712935416122832
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 01:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=sOj2bOTH;
 spf=pass (domain: outlook.com, ip: 40.92.65.54,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ihfas+lXKDannUODFk+m+kBCTGYnAZSls/QEB6Qkq6l4Jhxqq3RTTiAbMC9WeW8EIKkDKCxvN+K2DI3HLgwvLgKdkTxuE+vtE/w6qUtFCX5pNyDZ2zOTL3F8vju4uVrQ/ZCa9C3wTIBKNjr7MINnhLXKIRnSzd7wlHjfDHi0mFdDjLRQ6b1sCXCb3RE0+o9xksoLNhhDzN0344EOBAiyBgQxY+bBYZQXK6POZhYLf/XVqAzB/UNFB1LxcCST4Nw2uXsEsvJFfwQEO7bvpkzlK6QcZKk4gaGlsV/I9Wv68YG1VL/tQVlBsLIZ9qC3J46Pz8ADegmGotFH8hF4qf3WQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kL/YcThzs9h6UHtjj51jJ4blwCeAbO5z6L2YlAgS4jg=;
 b=f1Tn85mHqMcQhZWDqtLxQkQTbV4iA8V3Wx9scbW3Jkt76sD7IdYWjr/5XrjDo6aBb1jfJezYhzmjuSJtEcr6VGK9R8PFnxFxCRBg38vZhUjf/kkjsoDBjQfwMloh47nrLftvp2lUCm5QZh9MDSx/b6aSLgtq3Y43ckik4xCpELcyS+JvwuWTMvEZcZ312Qh2bUzmW30yFx2V8LapBuBXQrep2gH48hMvLUK5QJqt1J3VcavgzKv+t1MF7BsLjcgXZRj5gWNN7cV6rc97Zol9dG4atlGR/kxvmH8S6jF6z7pXPimMLa/d6O6fObW6RekzxhURvB1+vROkPEKcCSltVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kL/YcThzs9h6UHtjj51jJ4blwCeAbO5z6L2YlAgS4jg=;
 b=sOj2bOTH4q0Udccf0YtnHrvLhrNC3E6aa3UnWdiUMhx9q+CFPykKMCYOKK9BRSfvPk504iW/oolg/rqOEBiYs8qCnrPSZOf0CE6LXIy5jMqPlCDUqp3Yy0Pb1y5oPI9cu8q9DttP+lRoPGp01SfaGZRqaUVxjxZ7AlJ/JlXvTTRVtD3LJ3+wu/aEcCqcPx1VQNsVtqb/USnd0ePzxXMRN3h9Col2ONhoxuHEE7c9KnTSfx7LpukumyYGM3d1pA7ePni9C05bf2QELDIr9c+Ab87+a4gWMhG/oOgNXeiro/G62gtpMRBT/M7yIX/Tw+2TiaC7douiRYQFDLMMhZCoKw==
Received: from PR2PR09MB3100.eurprd09.prod.outlook.com (2603:10a6:101:1b::18)
 by PR3PR09MB5329.eurprd09.prod.outlook.com (2603:10a6:102:174::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Fri, 9 Sep
 2022 08:42:12 +0000
Received: from PR2PR09MB3100.eurprd09.prod.outlook.com
 ([fe80::4117:11af:4a1d:3f6c]) by PR2PR09MB3100.eurprd09.prod.outlook.com
 ([fe80::4117:11af:4a1d:3f6c%4]) with mapi id 15.20.5612.020; Fri, 9 Sep 2022
 08:42:12 +0000
Message-ID: 
 <PR2PR09MB310090AC0EFFE5E72CC30942A8439@PR2PR09MB3100.eurprd09.prod.outlook.com>
Date: Fri, 9 Sep 2022 10:42:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
From: Konrad Weihmann <kweihmann@outlook.com>
Subject: Re: [PATCHv2 1/3] oe-setup-builddir: Correct when validation of the
 templates dir is run
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [uccjtNPdH9rA940CO1SQaLTDu3jbavKp22vGTuqM6aFsmwSORjWY0Gcy5zuQzXJa]
X-ClientProxiedBy: FR3P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::10) To PR2PR09MB3100.eurprd09.prod.outlook.com
 (2603:10a6:101:1b::18)
X-Microsoft-Original-Message-ID: 
 <4c41d526-a76d-551f-6fc9-2aa2a3f55d21@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR2PR09MB3100:EE_|PR3PR09MB5329:EE_
X-MS-Office365-Filtering-Correlation-Id: ae6277dc-5e1b-4723-a922-08da923f3045
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lbUOcsr46Jteh8jwoxUTHuAy1oAEXIb8OXkf0mbMZEl0lbKbxYztrfn72PeBQA/1sKE6dGQt4r4H9NpFs8pJmQu97MIEN4IuQqNydlfJKpnU5GxrxnrmvoKKRpEnGX7HZpO6fNJQs9F5NyxGHtlg1ChFOhbi4ImtGnicHkMmsoix3KfRK2/QE5WvTIIV3l/n/FkMcpA+WaIMSiZK3Aj2XSyS286RzgIr1TajcM9BR4jeAYMvKRe5zvHkxNSq1TDXRpmtsErJeH4uk63/EEvGVay0ExJYhsPIGAqPhCMNJHqpu7H/Gq1508MYoI6q6+CZ6+l3aUzoNLw9cOxwgwQZQGtCfbB2Fu4seECDTFOw6OW3DhTtD0DFn6nmBKIuKTI7+51bmSnrj9FJvjekTHKis2zbaXiTIc644h4otNqly+Zz+iWQJjjkv9LCaNCTI8PIFiBmMgo/6N6LLUyiI+VZGBFFfYe6AY1su6cAd3vmcS2Ft6tmWJSkzcBiIFIswVYQ1T0wqDIpCQQZCuktfwwmYNXdoQsY1zMhjj2Kh3AeBUKnZXfB5J4W70ynTwpc0MPzH8T686qR06gfVAli9gE+18qORoURPeJllwxaRxHudkcnF0GJOVA+rNC2UKlNf58Yh5abCqL1mfjiLy7a5ZcfPDQxpvs3vvbbNt/ihuxKn27rS4a+dOXxBAp/z6vM/vU1
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZFYzSEo2SUdDb3oraHRlb1pzV1dad0xBR0x1MElQaFQwdXZxRWFFT1JNWGtP?=
 =?utf-8?B?VThIaHpyS1ZFSklJQVFRYk93Z0xvdWlUNFkwVERHYSt6eG5ibTZ3TXJkZFA3?=
 =?utf-8?B?bytHckdLYUEyc09HVTcwcks0ajREMGlTQzdZc1dYRGs1OUFUTGMrRGhPK01Z?=
 =?utf-8?B?YXg4MFRaMTdGRmJmK1ZkWE9LczIrSGZDMnZZZE9pZzc5aWprV0RWL3hJSWhR?=
 =?utf-8?B?Zmgxa2E3RTMwcXg2anM3elc2VHdRVjZ4TnNmcE4yeXdWU2YyK1J0NjJ2MVBP?=
 =?utf-8?B?TmdVWjZna1ZuMUJYQnFxWFN3OGhZTHE3VXZnWjNxYm9KcTJINWNQNTZBalVx?=
 =?utf-8?B?MXZlQ2NzL0NPU2x2S0lieFlSTElJVUlhSGRac3dDUEtlVDIxbzEzdURDYVY1?=
 =?utf-8?B?RVBPMmtnb2VHVDN5TUtlRUtqVjRBTStUcUtTU21XVzIrMzlYQUZKUk9xVXRV?=
 =?utf-8?B?SzVpSjRHU3R3V0xHYmNZMzk3Y0trOUFvQVpCVXRrS2hEcUVEYlJ1alpvMC80?=
 =?utf-8?B?MlF2TlIwbDJFZHltZUdERXdZN09LSDdYemtuKzdJZkNGcGI1UGl2RXN1SVoy?=
 =?utf-8?B?SVV2VlViMTRwdS9yTXBOcmswM2d6c2NyV2tjSVZKaWV6UnN2clp6dXZUaVpL?=
 =?utf-8?B?R3Y0N1BIYmtPTk1KcEVLcnJvYVV3WmcyYVVVTEpmMld6YjN1dHRmVmROTTJQ?=
 =?utf-8?B?K1BBaXhOS2JNUFlGY2RHdTRITCt4ajlCdnpDMnRwT3RxVmg0TzlYMTZvZTZ5?=
 =?utf-8?B?cjNqWWMzRVhwenprYXh2TmhnTm04Yi9KalNtY1E4aUcwVDBZMEkzK0hyR3Nk?=
 =?utf-8?B?SGxNQnM3anZ1aHF1czY0eG52SkZ1UElkY21keFNjbXRZYkpwMlRxNU9PT0VN?=
 =?utf-8?B?OGUwdWZFUkw4a2NMZkN0VjBmOXIyVkFyY3c4Ni9tQ0pSd3JtSEErRlRIaUJw?=
 =?utf-8?B?WjhDSm5rK1dPb2w4SUw1amRITng2SWJpZ2RaYklaOFVtZEhQK1gvV0M3My9l?=
 =?utf-8?B?cUJidzgxTVR5V0cwdHFrSkxrdUp6dmN3RmhmdDVRWUpVa3YxQVNoQjhsczQy?=
 =?utf-8?B?UG9CM2EvbEtRM1JmOUsycGdSaHJpT3NLVU9XcGpiUnlYRXVoSmxsckM2cTNM?=
 =?utf-8?B?Z2dLZkdzRjlCVTJyQ3czcTM3Nk1QZFd4RTlDMG9pWDMvSnBsSTNaRVBIMUlQ?=
 =?utf-8?B?NFdGNVFKN1dySkxMMkF2ZExCMGZ4SXZQZEFPV3p4Y01EZ1pYZitGK0cxUEUx?=
 =?utf-8?B?UktwbHVydzZZOW5oVnJNU0w3V3JiOXRWTzlIR2RZS3BXZU41bUZnaHlFOXRo?=
 =?utf-8?B?ZGMwWGlaTE1GSkl1NnIrTnFtVmdhV2FJLzRTQmc4Mm9PMDJSS3VuVU9rZ20v?=
 =?utf-8?B?bTIydWJyR2pJUWxhYm9CYmk0SUNCT2pMK28veU53Qy9jTitnTk9aZGhIbGdi?=
 =?utf-8?B?OElRc0NLZkx5TDA5YTdJdGNybERsQkV3SlF5NW1jRTdxRmd5czRCZlVrWVRD?=
 =?utf-8?B?UG15d2d3UlV0dU1tZWloZko2bUR6eU1NWlZLa09VeURmTHhNM0pISUFxbUhY?=
 =?utf-8?B?TURjUWJWVExyR1BSajBRSjI3V1UyRGF5N3ovU1BOYlBoQUtTeUd1U0NZOU5V?=
 =?utf-8?B?QmVhYzlPd05kRmtWQko3MWxLZ0tMRS9lYzVsRUh2TEUxekxDckE2RWVDMmVS?=
 =?utf-8?B?ckJCa1M5dk02cmVtSFBCZzFIQXNmdDd6eEpCWXdoRzlwMW1KQWFBMlNBSi9V?=
 =?utf-8?B?MDVIM3N2K3R1ZXBNbzd0WUlJMnJqdmk3OVkzdGEvdmpKbkU0UEtwbFFUMk96?=
 =?utf-8?B?THZ0MTNETmkwZXEvNlBYZz09?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ae6277dc-5e1b-4723-a922-08da923f3045
X-MS-Exchange-CrossTenant-AuthSource: PR2PR09MB3100.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 08:42:12.2750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR09MB5329
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 08:42:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170479

A general remark from my side about this patch is that this limitation 
isn't mentioned in the documentation at all [1].
I would have been in favor of just dropping this piece of code, esp as 
the check wasn't run for years now - but here we are with another 
undocumented and breaking change (at least for me, as the template confs 
in my projects weren't located under templates, until everything fell 
apart in CI over night)

[1] 
https://docs.yoctoproject.org/ref-manual/structure.html?highlight=templateconf#oe-init-build-env

