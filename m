Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.86])
 by mx.groups.io with SMTP id smtpd.web12.4597.1592963284234220860
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 18:48:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=mgRKmbdS;
 spf=pass (domain: windriver.com, ip: 40.107.237.86, mailfrom: yanfei.xu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7ecPzq7Wk8U80tpZ4f3icBmtB3a1H30jlVRUQaOW6ZgdmTbygfpKZyTDPEwz4xxPQayq3E/9Myq5ocTDmwFl9+7Xgj5S9K8fJv6rqG9uZekIfzJboIeGfbY1KgfSJjzBhEgS4XzzYhcXEySsTpSSJDvhlImV0M7CFcIgIcUwxuyTYr7H1IExi+Rqr+l7d2ZW2VQqLuAQDUfXqalhEW9J0fYr5So177hKrgnhgcRcd3Iiog0N5zHzt12UbX2iNKVNab89e8RgY5Azik8BDVkJA7FAQYRzs4/+bgUijJ1mZmcsQMgzqg6DjQcCCDHOJcUlAanZJ/6zBEw24aJcTMryQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1mrrxkHOnOpu1mgFoGZ7i1xIBrXCYn6ynpN2tSYRNE=;
 b=ggFl0LZBLYywyeDEHowt9UemtzfdjDnP9LrQW/IHXu1Xloe8NQhamWCTvqSTRFwjtwVp1C8vKyu1Bn2Zw0rQkWgbAPKSdhMWc2R5VARxOQvjp0McxxdpgFUC2SE0fK/3cszv9iS1pz36EgTpEleckLhvfPyyzNEvpJtI8KPJmAklSalSWD1uCckiIIs6ayFsOwgXYWRak3jz6WH1eeU3I2dVNYuxPUNHLfCkmaV7qUBQpn8KgwlBvgPdBuvTNn4FP5M2NNRH37qwZGGJEqxbT+WUCKAODrgpYLsGprDG9/vN3NADUIOlx6S1RHeHUhoK6qYO4CsUzi9gThTfVawBsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t1mrrxkHOnOpu1mgFoGZ7i1xIBrXCYn6ynpN2tSYRNE=;
 b=mgRKmbdS+7VGT4gmTByY+YkUW4MQlH09JJlBgFEvPOuXJkXqXhY6wgvPVA49/4N5Z9aCuIfP3p8tYXoQn8EqsKvBFuva6nhErcr1WkC/qVEHTJUOb//yUFWxFOjEQIMIqyphtZc/T9rz2G7Wlr1Othu9mVOXVVCk+Vk4dPsUiJI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BY5PR11MB4305.namprd11.prod.outlook.com (2603:10b6:a03:1bf::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Wed, 24 Jun
 2020 01:48:02 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::6892:dd68:8b6b:c702]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::6892:dd68:8b6b:c702%4]) with mapi id 15.20.3131.020; Wed, 24 Jun 2020
 01:48:01 +0000
Subject: Re: [OE-core][PATCH 1/1 v3] classes/kernel: Use a copy of image for kernel*.rpm if fs doesn't support symlinks
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20200619114727.40142-1-yanfei.xu@windriver.com>
 <20200619114727.40142-2-yanfei.xu@windriver.com>
 <CADkTA4NApB19MmwAWP3Mgtf+zNEtsPuSxL7h19S8c3FNoC2o4Q@mail.gmail.com>
 <144b99d5a5b327d660925ff5ee18139d7dc088c3.camel@linuxfoundation.org>
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
Message-ID: <7d7b57ca-5419-971d-6701-4cd2e8958960@windriver.com>
Date: Wed, 24 Jun 2020 09:47:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <144b99d5a5b327d660925ff5ee18139d7dc088c3.camel@linuxfoundation.org>
X-ClientProxiedBy: BYAPR07CA0009.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::22) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
Return-Path: yanfei.xu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.160] (60.247.85.82) by BYAPR07CA0009.namprd07.prod.outlook.com (2603:10b6:a02:bc::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.20 via Frontend Transport; Wed, 24 Jun 2020 01:48:00 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 850d2924-2f19-4e4b-3299-08d817e0a127
X-MS-TrafficTypeDiagnostic: BY5PR11MB4305:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB430518B5D1EB6AB6950185FDE4950@BY5PR11MB4305.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:350;
X-Forefront-PRVS: 0444EB1997
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2cMF2kkv/BluFo88nchQJZucmAwkrzgTTQmzFIwjFSTt5nOd+FSix2LbbemH3ey5KGdtRIOHEgLhspNUHwoCpS+LgLaFx6omowhogh4ch5P/zJsgh1HX2sg9qOz7oylIUOvMjgdVVTH+MqMnNiRW09U0K4B0J+NZn3WNphgLooUXzbMlWeiGv0QAc3mpWXC/caC7+9Rb63KHabZNl8SLER8jTNYhrUQDyps20LKEUbREPVI5ebc83IDLkVq8Y7vKZN77y7vHQRUtB6mhTtMBLY89bFN7YSeeEmEjbAvE69PmWJ7BQdwkBkB9/3E/cKvUXtfWHWXOw+0i7PvT1Lv6ydWQohWvg1oGDG246BezWNNd2j2cp+zHRMv4SzY1v+vx13yJdkfael0rbIhQXAHooaDOGWrxkXWvJp+ORq4GzqTCXXba6HVaw/udKTRD1zjpUrHyBBpPdGaodJlA9/ZVlmxKA7fYxLIxR9F1l8/V/8NEflCCRfU0hKvdqigeyFcNMeh50QFkNpJCj367PTa/eg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(366004)(396003)(136003)(376002)(346002)(39850400004)(6666004)(186003)(8936002)(86362001)(66556008)(966005)(52116002)(53546011)(478600001)(66946007)(5660300002)(66476007)(16526019)(110136005)(4326008)(36756003)(26005)(83380400001)(6706004)(956004)(31686004)(316002)(31696002)(2906002)(16576012)(8676002)(6486002)(2616005)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	qejwp4BvptLMqYAwFYNqjK8JXphsllCkHJQnt8AD6a9AQFLRF6A1JBlEO593zITJp+/0ehW7ruXz1KtBhC14DzDhix6X38/6LMoD7AiV+Q35mezOSwBZ1ePRihkjv+br3EM4C1Z9D4WDK6NqQB+MhJj62mWtZo7lV1H/896rH9Uh19iAOG0NT+iC9DR5OSn5+3EKWuvvCx3zISZsDpkpUwRs2j+3WYw1EiYXr7cIWubvq+0aOmV/TiFfj8QuHnzlx7UpufRpR1K1SRS7uyisTyxNpZfziDOrBgaNOZgE3IKhkoB3LuwXPah4uVGowfKhotoASS7pwXbzLppDwdCwkLr/P5gnlqxd3iTdxMtPI74OGdhJESiSbLKuFWlpXOSczofvhrhMjsXbI1QON1fQYJsqUFQ1aMGUNaA2Est4uU1u7cVTUYkMLm/uFrMp6nJLR5fO0kI2vC77PxM4LCOukwIULggFXt+MQFGnt7qxWMM=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 850d2924-2f19-4e4b-3299-08d817e0a127
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2020 01:48:01.8278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 68NdmyF7s+vVcphOlFASDmo6upZTkwo1dk+n2ULFoYWTFCufPdXcvs/1PblPLUsgkT9wsOoVvg/0yqUvukjFTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4305
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/24/20 5:51 AM, Richard Purdie wrote:
> On Tue, 2020-06-23 at 10:31 -0400, Bruce Ashfield wrote:
>> On Fri, Jun 19, 2020 at 7:47 AM <yanfei.xu@windriver.com> wrote:
>>> From: Yanfei Xu <yanfei.xu@windriver.com>
>>>
>>> Some filesystems don't support symlink, then you will get failure
>>> when
>>> you install or update the kernel rpm package. Now we use a copy of
>>> image for these filesystems instead of symlink.
>>>
>>> Suggested-by: Bruce Ashfield <bruce.ashfield@gmail.com>
>>> Suggested-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
>>> ---
>>>   meta/classes/kernel.bbclass | 19 ++++++++++++++++---
>>>   1 file changed, 16 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/meta/classes/kernel.bbclass
>>> b/meta/classes/kernel.bbclass
>>> index 20a0135fc9..1269b54343 100644
>>> --- a/meta/classes/kernel.bbclass
>>> +++ b/meta/classes/kernel.bbclass
>>> @@ -94,6 +94,22 @@ python __anonymous () {
>>>           d.appendVar('RDEPENDS_%s-image' % kname, ' %s-image-%s' %
>>> (kname, typelower))
>>>           d.setVar('PKG_%s-image-%s' % (kname,typelower), '%s-image-
>>> %s-${KERNEL_VERSION_PKG_NAME}' % (kname, typelower))
>>>           d.setVar('ALLOW_EMPTY_%s-image-%s' % (kname, typelower),
>>> '1')
>>> +        d.setVar('pkg_postinst_ontarget_%s-image-%s' %
>>> (kname,typelower), """
>>
>> You were previously concerned about boot issues if the unversioned
>> image link/copy was deferred until boot. I don't see a summary of why
>> that's no longer a concern in the v3 of the patch. Can you confirm
>> that it isn't an issue ? Is it simply because the booted image isn't
>> installed via this package, and hence we are fine ?
> 
> I'm suspecting this patch is why we're seeing selftest failures:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1055
> 
Do you mean this patch has been applied? and introduce new issues?

Regards,
Yanfei

> Cheers,
> 
> Richard
> 
