Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.118])
 by mx.groups.io with SMTP id smtpd.web08.9462.1624635959673582043
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jun 2021 08:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@prevas.dk header.s=selector1 header.b=lM3mHfCa;
 spf=pass (domain: prevas.dk, ip: 40.107.8.118, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YUJcSgjNhxPv0E2Luk8OwZxsA3vNhkVJwkcYwHXLvWK/l7UM2o60S2Jfs7lCvbow+r4jHq/ryiTpSEUk9hGxM8ctPJ4uEEffgyyowr2wBBUqyoyefKzBx/9bqzypUS7IGO/6+9EzAgHIF7adQjv1SCeoniXjs0hlbCblGzQuuDgoS4bLuiSysU37mZH5iY/dsH8m85BysQjlGr+uCHrZDfWi9IMZx98EYG1CcegrUtJYdWsOp6NzpMnsPCnAlWlXevJJ9CsGXijeHhmoindEgmCrnMSD7IjRzfu9cUx9IQlzXRbS0qS/W7fqg/3viLyiUVQ1K7tugZZ7Wdeg/AG6hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/I0xw4jNUVS7ZkJO3Bx2KH7FB0/RS6K+fXgeCrFeKEU=;
 b=LaTyq4xhytDmKSDvxpmhfZK225dkJBfjjafu6ZtFF8AX0me35BQnRn4L/ENfIT/bNY0L+k3CvYcBj13LcwdsBZrLwNFGB/HZk6fhrsFmULHQmClN8Hjgt+Ud6buF9ITaQ+ISbRYji+0YS+m1BKUt9ffzGDIfjyBIwmwYKMzMUQVnan5cALNGUCJpjDpgcJqXI10WP3u8nLcbhjR1VI0RtZdXKvyYMD5PjPD8nRpBsuPn4iBcL/fSB5oQK/3TX6Sc6EXY4gmr6cmaaOVgU6idIXMpf7ibIFAHQQgk9syLDgswdyqkc146U4mZC7CDmwFxtpsfYbXgQU0+e1j7STGb6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/I0xw4jNUVS7ZkJO3Bx2KH7FB0/RS6K+fXgeCrFeKEU=;
 b=lM3mHfCabt1slrtA0sl/uredgyfz4kQuDzRyHh2RDPEQryh6IuyyqURYJPoo67sQ9vuPh3j4Dux5vB5gFNli9PJN1fLlXRCKNZORxnIL+GepFHcmd1KpMTgXfF9XPI74Ss0/duGMW6+P7Lp94qefod/9vCzNa1fXNmbajlC289o=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=prevas.dk;
Received: from AM6PR10MB1880.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:2f::12)
 by AM6PR10MB2952.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:eb::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.21; Fri, 25 Jun
 2021 15:45:56 +0000
Received: from AM6PR10MB1880.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::78e7:758a:9dd5:6b52]) by AM6PR10MB1880.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::78e7:758a:9dd5:6b52%7]) with mapi id 15.20.4264.020; Fri, 25 Jun 2021
 15:45:56 +0000
Subject: Re: [OE-core] RRECOMMENDS "masking" unsatisfiable IMAGE_INSTALL
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <5d6b6934-bd33-04e5-cf55-ce09895bbd6c@prevas.dk>
 <599d48303a40d8c4db4d0d380d4cfcc5f0c7acfb.camel@linuxfoundation.org>
From: "Rasmus Villemoes" <rasmus.villemoes@prevas.dk>
Message-ID: <6f831e07-bfc3-8803-07a8-39050f92b3f6@prevas.dk>
Date: Fri, 25 Jun 2021 17:45:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <599d48303a40d8c4db4d0d380d4cfcc5f0c7acfb.camel@linuxfoundation.org>
X-Originating-IP: [80.208.64.110]
X-ClientProxiedBy: AM7PR04CA0012.eurprd04.prod.outlook.com
 (2603:10a6:20b:110::22) To AM6PR10MB1880.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:2f::12)
Return-Path: rasmus.villemoes@prevas.dk
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.149] (80.208.64.110) by AM7PR04CA0012.eurprd04.prod.outlook.com (2603:10a6:20b:110::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 15:45:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 37aa98db-4492-4336-8490-08d937f0524e
X-MS-TrafficTypeDiagnostic: AM6PR10MB2952:
X-Microsoft-Antispam-PRVS: 
	<AM6PR10MB2952E872FAE9A5AAF23BFFC693069@AM6PR10MB2952.EURPRD10.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Sujp8e3PpHTdlE3oaBdRzhhC7MTJfQkeSvpfTE6+xu5UT+KmJ6ISJjVuGvJybdOmCEf/8eMyR+CI6frwU8EFSVe/KtDf5wEIP4ujy+4d2jzOH5JN5OJZqjcWjOeoDa1CN5Tvv0pVDNvDaUxWkwyYi6HWZCJptEJ4xTBsrD98W0E9uJmcJ566CVyoVbhe2QTMNXhBhc6kLGEjwnuCu5/uLjRGjll4oO4eMJNZCrBQvhvrOrsc1owfr6aiIyxwbS/F1BPDu0PE7lfEjU+uG2Xa5g6JJqF9mhPlr75ExzYM4Ws6waNywJRSLyOU7ZKjc6FGtXP3znxCZDn7SbFfxjF9nYE1Zj2AZikmSDlFy1b81lifWqqkxCgBuAPAsWwfk6jgKIU1aSUh8t65Y2gpMvx3YdAFGh3Y61xsOyhQsT4JRhRA5BmDTjw5nlpFNAxdgzO+bk982leDKDZBiv6kOWTnCg2IIbFJDvh5jLuAZVHDEuWCyodwhkZ4AbBygLt5bs8Ehqp7piIW7VlO6/F0ueUW8Bn+r2zPFiOmMi5EP0A+Zjm9kL1QHf9k0P7OdiZZ9+vAXCeEyExtvWzg9ovUbtP1uISR+txFr2GRpmDlL2ej2C2S3wXoxKpR8jxMZQZY6atNGMfIYRI2UbiNqrdXAq6raK6EXvccH9xxZB/rQ6aNNAD0sdi+LHN2oYHsYJy0g9HREo5TYqepDm83Hv/L26bqxA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR10MB1880.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(346002)(376002)(396003)(366004)(136003)(39830400003)(52116002)(66556008)(66476007)(6486002)(66946007)(956004)(2616005)(31696002)(44832011)(36756003)(16526019)(86362001)(38350700002)(38100700002)(31686004)(110136005)(8676002)(8936002)(8976002)(26005)(186003)(2906002)(478600001)(16576012)(5660300002)(83380400001)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RTB2SmphdmhNTzRvUyszSnYyVHo1czZVT3hyZDZERzBiV3VRNDI1MnZZVHd5?=
 =?utf-8?B?R3RKV0hlc1VBbEVyNHoyS1paRzg3WTdZWDFrR3lwbGxyWFlqbjBZSnQ3UThp?=
 =?utf-8?B?Q0VSdUZ6QzlZTC9wZUNXSTA4dC96UW83b2JlUW9seGRVUm42QjZKV2w3QlpL?=
 =?utf-8?B?ZU9zVUVRbWtUUk01VndNT2tRdUkyTXJvcnhPNGZFaFBvWkUwUWdGOUN4dFFF?=
 =?utf-8?B?Z3oxaWhlVzlHUC9GejZudmxqQjdrZVNZb2I2V29kajR6WXdFcURWR2RaSXdq?=
 =?utf-8?B?Nk1UeFk3b0l6MXd1SFd5SnRUZzd6R3UvTTdnQ3d5QkErajJCWnljb2x1d0RV?=
 =?utf-8?B?R1QwOVM4TGdGWkdDVnNFaG9LVWxjSE9oL2Z2WHF6SXZnWkNGRXlFZlZ3b21K?=
 =?utf-8?B?bHh0WEpLL2VxTzNLeHNyS0FZZmJjS3ZoZ2hjTGZVVXVzaVJDUlhPMEZzUEs0?=
 =?utf-8?B?Y2phazRDbDdtdm9IUG9ZaktGeU5FcGV3OFVpK0R2Rmw0K3o4TFZHQmxFOEZL?=
 =?utf-8?B?M3VmV0NjTTFWRDE5YURjRGdIMDhMTFNoMmdyUEhDdWZZTmpxL2RwbDFqc0M2?=
 =?utf-8?B?ajc5WDd5SGxzVndFOVlNb25zQytmQk1xWi9uQ3RpcEQyaG4rVGVIakZpT3J5?=
 =?utf-8?B?TFRQajZ5cy9QUnBmMy9vMWVSeTY1S1pNNTBnZERwbUlydHRvYW9pa0lKSHBF?=
 =?utf-8?B?OEwxdEFBRU5LaG5NcEt6V1k3M2JzQklxendoVFA0NG1oNmxLcGhjdXVLdkx4?=
 =?utf-8?B?ZUVkUFc0Q0o4OGxjVzgzeVBHMWJYaE1vVnA2aC9Wc3NYUHNZKzBnVHlyMFQv?=
 =?utf-8?B?dkpPNG4wMU53QmcwOEUzSlRXK05ENWZtUFV6Z2xvTHdvSGhNdU5OMTk1a3Ni?=
 =?utf-8?B?U2xKTkE1TC9OUHpFZ2ZITGpjS3lsRHIyWW1WKzZVNXVWWERJU2hpL2txdFJZ?=
 =?utf-8?B?aTZOQU1iZm91SnJRNGhmd2ROcG01NjY3YzA5ei9wdS9sVTVQNDJOWjd5aW0r?=
 =?utf-8?B?S2Fuc282TWNTaVRkYzEzbFVQRnYvS2xVdlZGRGJqaksyNFZRNVBQSlpPNy8r?=
 =?utf-8?B?SWU5WjJncXFOVUZOSTJqbjF2bTBaNzBId0xJV0NRdFc2UGFEVzY0dmhDTkl4?=
 =?utf-8?B?aU1XZml2TmIwaEhKVlpKMHB2aHM5QzdJeG1wd1ZiS3pBMHB1OWRzT3N4bUI4?=
 =?utf-8?B?eFpKekRsT01IOWZWV0RIRDRpb1pGeW9JSktnYSt6YW16ai95UEljMGtmNXJH?=
 =?utf-8?B?YmN0V2xjUHBvRkExQS93VDBMNFBxNjloM0NiWVB4M296bVhPdGIxc0lXck1m?=
 =?utf-8?B?QStZQ05DQ1YyaDhoUEFxNXB0UGgrV3ZJWWNHU2JDeWlRcWxyeGpNcnpmUEkr?=
 =?utf-8?B?ZWczYjJabURuVVNSTlowNzByYVVOc0Y4MUZqOFlSSW02TERONWhXYW5EaDNO?=
 =?utf-8?B?TkNoNHg3U3RIY1VMYzRpZ3Y2MXV5cktBZjFpeE5MRTZKOHBpYjVzTm5FRnNq?=
 =?utf-8?B?ZUlQQTREZjZYaXNKS00yRVJodTdHWmwvRjA1TEZlSHd5VVZsTitmOVh0TVRj?=
 =?utf-8?B?NDgyZFo5N3J2T3Z1d3JtV1MyaG9hSUlNN0ZQMzh4WVFZTkhyQ3dweUMzUXk2?=
 =?utf-8?B?djhVSWNpVGJYbUNoenBRaUdjVys1bmN3VnVRbUhNYmd2b05haHRJT1M1UkIy?=
 =?utf-8?B?QS9ZclFTR09nWFBsZ3FmYkZFbzYycTdwUWNOMzVzUG1PT3lPWmJpK3kvb0RV?=
 =?utf-8?Q?MuLwe61vwA2h8OphtqTMvnnCYfHP6DF5N5xOQa2?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 37aa98db-4492-4336-8490-08d937f0524e
X-MS-Exchange-CrossTenant-AuthSource: AM6PR10MB1880.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 15:45:56.7109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6HC1J6sBGl5+vfNbKKDzYi1LkyV9FtfEyr3eAGmUBhkcJdIYY2A4deTLyGoP8XXEqK7Q/ZPrSZGJVy3n5oUQZHpj6jg6sTIa2cA5I88CJec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR10MB2952
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25/06/2021 14.16, Richard Purdie wrote:
> On Fri, 2021-06-25 at 09:37 +0200, Rasmus Villemoes via lists.openembedded.org wrote:
>> I noticed that if I have an image recipe that says
>>
>> IMAGE_INSTALL += "kernel-module-foo"
>>
>> it fails as expected when the kernel hasn't been built with CONFIG_FOO=m.
>>
>> However, if at the same time some other package which happens to get
>> installed in the same image says
>>
>> RRECOMMENDS_${PN} += "kernel-module-foo"
>>
>> the image build silently succeeds, obviously without any foo.ko
>> included. This doesn't seem right. [I'm well aware that the RRECOMMENDS
>> line alone works as expected, this is about the case where both the
>> above lines are in play.]
> 
> Which package backend are you using and does this happen if you
> use a different one, particularly swapping ipk and rpm?
> 
> That might tell us if this is a package manager issue or a bitbake
> metadata one.

I was using ipk. It seems to work as expected (i.e. fail the build) when
using rpm.

Rasmus
