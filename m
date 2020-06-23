Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.88])
 by mx.groups.io with SMTP id smtpd.web10.2722.1592900800305422389
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 01:26:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=NLD+I3Vz;
 spf=pass (domain: windriver.com, ip: 40.107.237.88, mailfrom: yanfei.xu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AN7YzzXo0vtGNSYvykdrLYUW3ibZ26jcH+H2e7YO9kPujoz1QM70VrFQjqWSd2ayDyLLomPtSbLGOBNEkchZkeS7NyaXwjhf+68Ate6tPwFCM3/K06raNoDoTpCBMiV9KAa7WiUNL5vN4ZFxV0w3R0xkXcKJeM3+dGS9E0GgVgCT4x24PL5DcTu29BiV166VnPjyyZvxP/sON6C/DBTjWInqdVMSQtFXLta1hZhy9VxlzybYzarBk9EfDptI/Yzm5948mnLOlvwex2QYC5nEeLn98u9EWlw17tPj4FvL7Djpp21L3arbVh6N5Dp6kA2tl/WXrHwnbYKbpcTgXuMBPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2DKH2E2uFg9iG++O8R5kQGZwzw2syMM31qcvc/94fk=;
 b=iQ2wHI5kONdxXipAW0OmoJJJcwYQsd2DI7NjUkGzcvUuiRCucV5z/2OArSpLxJSYhU6IiS6WZ6AogYevEcxkTTCE2ifZAiVUKVXQ7umfWm6Fyp3Wzutvgl6lB0AeqYbrzU6KKxT6gcg9Gu6+mwbeJA9WfOI4IVTeOUCKGwQdY7MOKpQ/eEfHCueO7fWeoxN7Le3jLKxWfUNAc8V9pW6/HtEN00vPfsAJFA8jSBNZQ1LkhcQ9lUWSqW/2ingx+xCOqSMc7r2Zle5Z3ZUg3PgUgEpK/fSoRj0+DH6TFtC8fvKZLK2VAzjbRTMqcTB6Tw9NzflWj3n4NCFXQ9d6pgie7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2DKH2E2uFg9iG++O8R5kQGZwzw2syMM31qcvc/94fk=;
 b=NLD+I3VzQqZcA7bjlmfbP0WQL16RHJT9bUSBncq15fPGbVC6CVnOfd8tl2vvcePYQpgjkCR7Yr095p41cRcc2tdGLTAJL+ak+CtDqe7URfIAtpSv8i663Gs2yR5auyi83uUnvXGPyJW60c+0QsyP8bncohVpHftqkav0ayueC1I=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BYAPR11MB2599.namprd11.prod.outlook.com (2603:10b6:a02:c6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Tue, 23 Jun
 2020 08:26:38 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::6892:dd68:8b6b:c702]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::6892:dd68:8b6b:c702%4]) with mapi id 15.20.3109.027; Tue, 23 Jun 2020
 08:26:38 +0000
Subject: Re: [OE-core][PATCH 0/1 v3] classes/kernel: Use a copy of image for kernel*.rpm if fs doesn't support symlinks
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: bruce.ashfield@gmail.com, richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
References: <1619EF7B69C83A3C.10370@lists.openembedded.org>
Message-ID: <9de30c55-f97d-59f7-11a3-0366349102b6@windriver.com>
Date: Tue, 23 Jun 2020 16:26:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
In-Reply-To: <1619EF7B69C83A3C.10370@lists.openembedded.org>
X-ClientProxiedBy: HK2PR02CA0215.apcprd02.prod.outlook.com
 (2603:1096:201:20::27) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
Return-Path: yanfei.xu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.160] (60.247.85.82) by HK2PR02CA0215.apcprd02.prod.outlook.com (2603:1096:201:20::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend Transport; Tue, 23 Jun 2020 08:26:36 +0000
X-Originating-IP: [60.247.85.82]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bb2ae17-31f9-4158-1d75-08d8174f25d0
X-MS-TrafficTypeDiagnostic: BYAPR11MB2599:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB259929C20736633029833440E4940@BYAPR11MB2599.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-Forefront-PRVS: 04433051BF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	j3HPgb5wGb92/DjFVrCyHHH9epp9Bo200fKk17hXgVF7r+04wXgW5ydDA2gQ7ao8ZUtiXLDbCFJT3dvPhU/PfQvTdQS8TlefLMm0DbaRzKefv84Gc/tgDAxlSjgxMOTEcUhnj5XA29x//4U2MvaqzURyPEBHNM85Pidw9OakoVt/1kkvOSEj88tPqS0/+JG8XZb8L7KYJqifLu5Kww0CBoPiGPtjdbTjjPP6+k9LgQCENJVgrm9YmarZJxJkYw8/fFVKAJcRmKhMXFSObvaiTgQgGFa7ZWR2z5Bk3JVYXZg/3zb555WsCUg9G8H5QumtFu1gkU8i6pXkE0ZBzPtVARpa+o350TpO/hfrRNCT7QFtaIMDdPkKeN5Sjk5u3K7e69MxhGZdnlTaBtwmp3PyNqRKDngWStr328I0ic6mWBhejLqFKJbRGw8zJIu6VzvCDC5P7GSkJ1JE5ztpIdFnootFBBnNi1TrQZ38s5pDCk2jZfCvBGn5hZeZmTsh4uMuPczfMm7tVPuZamClYVy7Sg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(136003)(39850400004)(396003)(346002)(366004)(376002)(6666004)(956004)(53546011)(2616005)(4744005)(186003)(16526019)(31696002)(83380400001)(86362001)(6706004)(5660300002)(26005)(966005)(66946007)(31686004)(478600001)(2906002)(66476007)(66556008)(16576012)(52116002)(8676002)(8936002)(316002)(36756003)(6486002)(78286006)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	lWdOKGOEHhNH/KE2GMfxvkNKRmVF5yTWH0MWh4IQN1BMA3/0ghsj/LMuFEXfhYUoaTupMd0RbGFJK1t6P+zWzPeewiAE3Zyp9jS/CtNiqWKK9IERaklspKRQzUhiEItVkCjZ4rJ60+FWANBQdxZnhLuuZuIbB7yF4mROAxSNfMcNFfKWa3sPyZtvLBuBIrfMwR+6HOh+dYQY0PoZsiNC8+HXBV09hrUkXPxSi9WNHnEYH94P3uZ8G6CdVxVVNj1zsZvqRDLfRtwkRdq5DoQJ00+WTq1LSALM7/gpx522o9KcbrNocCLUJDyqjhEm8jO3sIHXJI23fmuYtaPVlsuLI7vcBn4CXwJmVMGTzfb4gTbLdJ/1GbyZhgCx0kZmBJI92V8bULyUmlpR/2UwBJYnPl5RM8ocb8YbZD93CaNDRkCXXi/yWvLffR42wUHJZjwVNlC6/0GXLF1MB1GaqrS0TbSXYUJCKmFepHiOoCECRmQ=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bb2ae17-31f9-4158-1d75-08d8174f25d0
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2020 08:26:38.1923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GhQzKZEIkaf4GbJVFHIEkwxOeozrCWfiu6M6Udh7bYjswi975FHXqgJTG+/v3mq9u3eQ+PP49nQnSPk2gutW9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2599
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

ping Bruce

On 6/19/20 7:47 PM, Xu, Yanfei wrote:
> From: Yanfei Xu <yanfei.xu@windriver.com>
> 
> v1->v2->v3:
> 1.Put the symlink creation at postinstall script instead of build time.
> 2.Add a postremove script for removing image created in postinstall.
> 
> Yanfei Xu (1):
>    classes/kernel: Use a copy of image for kernel*.rpm if fs doesn't
>      support symlinks
> 
>   meta/classes/kernel.bbclass | 19 ++++++++++++++++---
>   1 file changed, 16 insertions(+), 3 deletions(-)
> 
> 
> 
> 
