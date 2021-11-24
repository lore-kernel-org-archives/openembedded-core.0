Return-Path: <kweihmann@outlook.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C37EDC433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 08:10:09 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (EUR05-VI1-obe.outbound.protection.outlook.com [40.92.90.23])
 by mx.groups.io with SMTP id smtpd.web08.3368.1637741405215232022
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:10:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@outlook.com header.s=selector1 header.b=vKUnkRC4;
 spf=pass (domain: outlook.com, ip: 40.92.90.23,
 mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FDsjGoDQNjs53j5kBfc7dcXmB6EyVgLUAeEdTPALfEEsYrhJxy6Q1DEQ/49jAlDjPLQzJFKSrNfYOZqfgGbFUQrodMnokg2hm3wXx+tjCXzVCIi+Z6ZSwBBlHbKg/z0z/KSleQUXC3HFZ7ZCwmxJcVWB7ctjvi/ifjBelTblnuihYNs2Ze+nTCaPklYeKz3Gzd031S4ISl5G2FB45brTLg9AEd5haxbMhNA+AjNepNFJBhEjf/WqB3j2oWAozgf8gg7/F7klHjzaGwFPRsUy89iccMrsjRPmOOxbHAkOBR2fiFJvats41snRbLW9CX0BOuPl8cyeOda/6YYa0FvrOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBdNZq1C8pGERWIpdrOwfZOZlBNdhWFdNLpI4Eaqlm8=;
 b=QUx05yQXVvacUcVcd9qB9Ib9vLjteupjVoRwTsuBSpV69FEjs/kvEdXGkzmW5GvFcnYC0xw9L6V3Z/jMsfnv8Ai5b589v7lYW+4gbgJtPxprFMbRsqAtpGBnrrXKr9rDfoNnITXhWo+SO8rSXuPJvgg59WANZ9tDGHEUFuAid6Ctsf38fbpOYhUnEYCwwpLkPVFuSBjk0D+/9tLVlS6tJLwCHrybaJNw3MAp8oM8PgGd27JIaVlVxkWW+CFGpSg+SLFZSyok/r4J7rbo7BM33ROP9DjohAXZft7JQYX4LlQqCPqNw3Ze3OLMwy5NBFaXxmsN4L7+4BQ19X5gLaqYmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBdNZq1C8pGERWIpdrOwfZOZlBNdhWFdNLpI4Eaqlm8=;
 b=vKUnkRC4QUh2fds2BvE6CysihlZDCn6R+1/kWWx8iKGfLKBTlhoha/nmBPk9PO2SPeojfktMxD+gwabuACOkQF0cG0Uw/T6dNBM03JDQ5WEpYQlQKJI1EkFH4wHaDu3b6frM4wb7Hibgm/KgNiKlFLFa8eA1ZQJkYXRCzQSfBhgR3hrg67x4FjI7qHNFUaML5cX6r1pDOjzwzp5oog51JOKzc94zu5q1hOxyqdddq0M+ol8ERFfRGRiPONqHZMeFZgLbMNTsZtscuz4Y5IDMsDHHQHmHXcTz8ZegwyPeZQk1ahyEcq37BNhnLzQacUwcZ5/4bNUC9D47fTny2BY4mg==
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com (2603:10a6:20b:284::24)
 by AM0PR09MB3410.eurprd09.prod.outlook.com (2603:10a6:208:16b::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Wed, 24 Nov
 2021 08:10:02 +0000
Received: from AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710]) by AM9PR09MB4642.eurprd09.prod.outlook.com
 ([fe80::7c6f:9b99:3d00:f710%3]) with mapi id 15.20.4734.020; Wed, 24 Nov 2021
 08:10:02 +0000
Subject: Re: [OE-core] [PATCH v2 1/7] systemd: skip chown when building for
 nativesdk
To: Luca Boccassi <luca.boccassi@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: paul.eggleton@microsoft.com
References: <20211117123201.111905-1-luca.boccassi@gmail.com>
 <20211119113429.502652-1-luca.boccassi@gmail.com>
 <AM9PR09MB4642F4FE2BBA8DF859A98BE1A89F9@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <b0ab6dd09c793181318adc5cc99127bd936b48e1.camel@gmail.com>
From: Konrad Weihmann <kweihmann@outlook.com>
Message-ID: 
 <AM9PR09MB4642AB2A320DD6BEDB0F835AA8619@AM9PR09MB4642.eurprd09.prod.outlook.com>
Date: Wed, 24 Nov 2021 09:09:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <b0ab6dd09c793181318adc5cc99127bd936b48e1.camel@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TMN: [Ezn3eQCl3HhBOWdrwc23okkZ10hnf3wqOIds+h5K+GOJidsBY8tRJiDIIIuf4tL3]
X-ClientProxiedBy: AM9P250CA0009.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:21c::14) To AM9PR09MB4642.eurprd09.prod.outlook.com
 (2603:10a6:20b:284::24)
X-Microsoft-Original-Message-ID: 
 <34ac48ac-b4f4-99ce-9479-07c23660ea6d@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:3103:205c:200:bed3:df7f:f488:16a2]
 (2a02:3103:205c:200:bed3:df7f:f488:16a2) by
 AM9P250CA0009.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:21c::14) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24 via Frontend
 Transport; Wed, 24 Nov 2021 08:10:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0e4e749-4706-47ee-9f6f-08d9af21d0fd
X-MS-TrafficTypeDiagnostic: AM0PR09MB3410:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZgFNQav4WBaYqjJnNrgQ6uL/KdRbifHPuLmV/xrzdjap7wXs+Zrd/nw07MKoHmuFDk+hyowyIJD0dPGBeCgb2pmdGMQfcuDiZb8s08v19Ic8P5UMVEViQimlEV0sf7SNpAjGUE94HeDLc9OeuhrHMNtYy0eT1i6m3wkbbhjRpiLuiW2LWXWFgKxw9Bn2p/kYJouVC7MpswxnNxDQS16w/mxMldIpXhhskHJGGOuxMT3WUDv/VfaFIvYMioUL/19Ml3jW5cw6yElfnZn1kKkauJjBaYeCjDkSPmsnSJWi6f6mGaQKhAOcbhRztNoQMhtuMp3+v0v5VzJGFfdLL2KEqUSq6N0SxYkGARVEh1Fq0XzOmzLyDS54KrO73j/SpEwLAV4CvbOnFQ92Chot7l9jxOq1NqO9+7WVK0bK/nNwiqwpoSXKnXoFnvPO6jFWmunyB1Ijq64nEO1j2x+6NZ7+7sOJG+wYpzJG8arCWErvNLP7VTsixIWQi236yWKG4zQfVLu6hPIjbTaBUaup3FJPuyIB/ZRIWv+Co+yZqJhMAzL7ByLPA1nP8MS6/ndPasV+G8x60a+PirD3x+KrcA0eJQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	NCMu/WZ9tjdm+ITtJg9/Fq9gNPq+O5S/lM1rxWDo8B3bCRjzhBZFGfNDpCXyZrWIp2gcw+egXMvYYcl4UBGU+ME3TYsB/z2go1vZUBZIrErRhEOZyBzRWpi/K3i3OMnMKCHNToCfEHmy2knfHfItwDXGJPNGIXwmISSRjwTlJehvT3QIY39dj7UAZiezp+ODkoAyB9PAXq8p41jhPhQFW053qyRgYs0h+t8c0jZyZ4TABbA6irkgdPJWV60HbaPjMvjlnj1UVoYZMvcDKHqAnFpaR+a259MrXR3+4XjRzWdz7Z4K0bIO6wCvMc5V7JzKBeQV8UAlcV5Dy9H5XOSUzZqxv+CO1XTnWdWKIHADseVg1mc2T+UdNW8btHxKiMywhOdSWR5la5hVIlNHVKhhKv6LeWfNLWhVcY8cbGx/jn5hhHftAecCcf0ARfb1qMoDK0ZVc4FcOKgRl50nphT/zGQoHvJSiPCY5ZU1FAZHSgPU3EaKpQdvtIKgt1avaQug+7nSTy/b0bU9jngIFGz/kymmUav41ZjwS1YEPRRs7JiHvKiDtd47WAcEfYBS+36MGoXOXj9Tt2t6b8JLsSA/cjCtrGZEFva36x6sQdnIewGA6Vn4ia5Psmtyq6EVuA5pmryJhg5MclNt9zDWOMm0ZhzSZQ7Xowk1OQHoeSNExaAGRnGYto2V+yYdAGgNxgqQLUBuMxKCkFgkmCte4RHvdhUiWxKYcBpvNvt6t/M3SCrDnhCI+d11/0Fdkuw2t71I5GhxgzgnloUx9QOlmk3Y+w==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e0e4e749-4706-47ee-9f6f-08d9af21d0fd
X-MS-Exchange-CrossTenant-AuthSource: AM9PR09MB4642.eurprd09.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 08:10:02.8363
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR09MB3410
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 08:10:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158678



On 22.11.21 23:47, Luca Boccassi wrote:
> On Mon, 2021-11-22 at 14:57 +0100, Konrad Weihmann wrote:
>> I have sort of a general question regarding this patch series.
>>
>> Last time I checked (and yeah it's been a while back) systemd-analyze
>> wasn't self-containing, meaning it would have to have a running
>> systemd
>> process and at least a running dbus iirc.
>>
>> Is that still the case?
> 
> That was the case only for some verbs - 'verify' does not need a
> running instance. From v250 (next release) it will also be able to
> operate on images/root directories.
> The 'security' verb did need a running instance, but there's a new --
> offline switch in v250.
> 

Thanks for the background information.
I kind of agree with the voices raised in the discussion so far.

As the feature will be available only in a yet to be released version, I 
would propose to

- wait for the release of systemd 2.50
- build a native variant of the tools first
- package only what is really suitable for "offline" use
- add a nativesdk variant later on

And I think there should be some demo patch to use maybe the analyze 
part in insane bbclass or so, so we could first of all see the actual 
benefit of it and even more important can easily track down future 
regressions.

BTW you said you tested this primary on dunfell, what kind of makes me 
think how these pieces fit together, as dunfell (likely) will never get 
the support for the tools mentioned

