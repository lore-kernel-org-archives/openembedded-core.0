Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.59])
 by mx.groups.io with SMTP id smtpd.web09.502.1605892701705181797
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 09:18:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=PxvHIEDO;
 spf=pass (domain: windriver.com, ip: 40.107.223.59, mailfrom: stacy.gaikovaia@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=heUj3Q+uQjPJe4+E7DKnI3GfAoNFA+36p2/s8AIvWcxACruJzNTRB88gojhJ4bb4khWOQGI0sdLGFkr5irlV0ExV8iBB85fXIpphyaCdcyEzXICWVyo3JKloE6SIOGK582snQIZRRX/uI49m7st89LgvCLrtO/VnCNr29t3U9+7XZtR+igxDNmYzBF38IWEQ/1sHEaSx0fbGwP/r06rLAtHqqx9uvNchkUwJFJ16wiMnrXhFUcXbDe7h3XAlP2Kbx72B3/apciIK5Fxu5RrLjrhHjedMGNBICDpv7RO2i/0K0U9dFwqVSVErp/3OEI5GwIo69PYpHqGwdGE8v1VQwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E8oCzELssFWymmE6LzvfImvhqHMt3nuoHeXiIyU3BL0=;
 b=daQ5XBtUlU00kaOLMLj3Wu2D4NqYFDjkKhlBSPZoG++XQaGLvpKesGBvEatRvfGJ1tWJVZLodtqBFNqnauEk/1g8fddmke/F7oveqHojUGlrFvjDCjTSbcXzdBMvIUbQPcIZov4jwGydqvxclfLt8Za67P+lYAQa9MqRdL2rnlxRQVxC3t2g0jMVGVUy1Hf0gVADlpX0xxYQ4RNPemKWsN8TLbnz+vskPKp4pgQFVqJFARXqqvQJ58gWlLJZBYLggZP6qifu4RNFehMF/dArXHWt1qIq8N9G6m9XkO7VO2knujvVn6pX0o345AUVj2pXYB9QnH3GeCqA17lDdU39VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E8oCzELssFWymmE6LzvfImvhqHMt3nuoHeXiIyU3BL0=;
 b=PxvHIEDO2BsBY46+2NEJYDlRS5d3Ki/9IGm9kZ+C7gVdZbRkmGmFJOFi1qTzS27o69OWpyR2rMG6XFb8wO3S71Qfbl6qLQMRRWHQQTVXlbXFRoRDBsl/bos96RhQL2JaTG9cI+jSjsvVvmJRaQ5K7v3K83E2W9AMI6hOT6IAwoc=
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=windriver.com;
Received: from BYAPR11MB3127.namprd11.prod.outlook.com (2603:10b6:a03:91::32)
 by BY5PR11MB4497.namprd11.prod.outlook.com (2603:10b6:a03:1cc::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Fri, 20 Nov
 2020 17:18:20 +0000
Received: from BYAPR11MB3127.namprd11.prod.outlook.com
 ([fe80::3cdc:2026:1e0d:62f9]) by BYAPR11MB3127.namprd11.prod.outlook.com
 ([fe80::3cdc:2026:1e0d:62f9%6]) with mapi id 15.20.3499.034; Fri, 20 Nov 2020
 17:18:20 +0000
Subject: Re: [OE-core] [PATCH] valgrind: helgrind: Intercept libc functions
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>
References: <20201119183151.16752-1-stacy.gaikovaia@windriver.com>
 <b47a68f4240998f40c6f5e4b4d5b5d882632da6e.camel@linuxfoundation.org>
From: "Stacy Gaikovaia" <Stacy.Gaikovaia@windriver.com>
Message-ID: <0335866b-128f-f51a-bf3a-dccb64624fc5@windriver.com>
Date: Fri, 20 Nov 2020 12:18:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
In-Reply-To: <b47a68f4240998f40c6f5e4b4d5b5d882632da6e.camel@linuxfoundation.org>
X-Originating-IP: [2607:f2c0:e564:14c4::3]
X-ClientProxiedBy: YT1PR01CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::48)
 To BYAPR11MB3127.namprd11.prod.outlook.com (2603:10b6:a03:91::32)
Return-Path: stacy.gaikovaia@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:f2c0:e564:14c4::3] (2607:f2c0:e564:14c4::3) by YT1PR01CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::48) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend Transport; Fri, 20 Nov 2020 17:18:19 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 561ca2ec-6a0b-471a-2df3-08d88d7846dd
X-MS-TrafficTypeDiagnostic: BY5PR11MB4497:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB4497D16E7085899F9753247BFDFF0@BY5PR11MB4497.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	O0cxgFLzDQ4zUpwfgoAjtoIZOFTgiq4dCF30bC3S3iF6hArO7THW5bo+CmTdw112LUjUcrFqdrbzOo5qVsK4wDewputXJZo8AECtXV2boNrMhhyq4W+6YGa+PhKaVQJIwitwdfWyZgemocBJXJVKDb1Qmy3059AfCVJ0bDEs6ceEeScVpLe0XVIMg5gJAhqGkVWleLRI7iHGNcUorR/LH6L1Kz7z1HGyjNF7Ru2YweMjI2cSAhTLQeH/3IIlPdJ8iYjl8DbItxtwPP+SfJ7HBKn6j9l3Fq+onh5f3IyaBRWOyWl8GFrA2c14AZumP60Fa4p1eNQotQge+kvHvqSr4RZ/NzTtHz7ela+zyisEOpxO7yp8zUaATVK9hNg96gUhkVYDvZ3AeAgnfTaIRmYovbAweMZbOPMUW/BjbQbdp2tWpt7pYkfKJazrnNq73Jx4EOLdHJru8VcaxeqslWRYSO64V8us1n4VyJSl4v+ehyw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3127.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(346002)(376002)(136003)(39850400004)(31696002)(83380400001)(966005)(4326008)(316002)(8676002)(66946007)(2616005)(186003)(4744005)(2906002)(44832011)(36756003)(53546011)(66476007)(66556008)(16526019)(6486002)(5660300002)(4001150100001)(478600001)(86362001)(6666004)(31686004)(8936002)(52116002)(43740500002)(15866825006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	RfGhPnDcU09odB1P7I0eyLFeGoiHsrt+395bnQ28mDUvwyhn1hi4DUm6M2O32lGhicF+ia2AYDQgPIK3kFYY3pGgb1/EVIzulvVjqCHqq8nCgzIRZ6FN9WMbynWUfHrX6KDK7GCom4WJZ2OFLhB/UplTG18TNJOr+eAm+QmRq8eUvpSnmO/lEVTPDCsM2URHqslBDpDeMStGrXrfK5zzsgTZUQgw0y4OCIl4Tsotf/P8a0FN0wEyvZz5hsQoxYFTUKL/jkPEMmfx/hwZvezcHCm9Qn0yH29huIcxjQLvekC0R8iLXCmK5XvtfSsCjoAFZnC3y4VTJgBYbXjnXrXmwcgB83kK7jrQBvOlbevcqz/CGhBj2qURRZbY41v2j/OyL4BvZpnh3Lt0nONQlD9po2y8AjKshkIlJo3dp5nIi+nCtapG+GoWk7ola++XwVN6dOsg087z9I64Ssk4GvLMSK5FiCWIhf6Unb7tgXYj0MxKqYRRp5SWJgQPDujGxFh+7ZjcUHrXzP8+j7rqMkLLOIuEAa9QbhL7mg/9dK9GvFhwUchO+Cps5qbnjyxgzoJ/dmcBpbHUrOJSQxdhyKxCOK6Y6J39qOreKTHvr1aZiNl2HYxaLBniKsKzAhuBiViijaNEXq6lcKuIEstSikSFsgM8nuHHScihNHLwv2sN2S8=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 561ca2ec-6a0b-471a-2df3-08d88d7846dd
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3127.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2020 17:18:20.0455
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rknLXaHLHL1yz7crZ+824/RQogLhLa3XYQBpbtWq5oZbR072GiuJBuNmvLbB1crqNqNimJIfZ+gedP31GSAPXEGGqmhFLN9jPmQp9jQBkOg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4497
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Alright - I'll submit a fix today.

Stacy

On 2020-11-20 11:32 a.m., Richard Purdie wrote:
> [Please note this e-mail is from an EXTERNAL e-mail address]
>
> On Thu, 2020-11-19 at 10:31 -0800, Stacy Gaikovaia wrote:
>> From: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
>>
>> PTH_FUNC definition needs to be modified in order to
>> intercept posix thread functions in both libc and libpthread.
>> In order to handle this in helgrind, weak alias the pthread functions
>> in glibc.
>> This also prevents any need for a special case for musl, where
>> these definitions aren't duplicated.
>>
>> See https://bugs.kde.org/show_bug.cgi?id=428909 for additional
>> discussion.
>>
>> Signed-off-by: Paul Floyd <paulf@free.fr>
>> Signed-off-by: Stacy Gaikovaia <Stacy.Gaikovaia@windriver.com>
> Unfortunately this failed on musl:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/2731
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/2728
>
> Cheers,
>
> Richard
>
