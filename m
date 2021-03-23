Received: from NAM04-DM6-obe.outbound.protection.outlook.com (NAM04-DM6-obe.outbound.protection.outlook.com [40.107.102.63])
 by mx.groups.io with SMTP id smtpd.web09.142.1616542850727880470
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 16:40:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=LLpugyG7;
 spf=pass (domain: windriver.com, ip: 40.107.102.63, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZUk4qoVG8F3P9srqFzlMZY7XG1jgcoadxBDntUmsAErIWdQ6T5X1v3NlwPt2YDCssAjOq0emrPieLLsmGRKv0UsCjKUT5wDxRIi4x4Fb0y8Sj8qk14pzPYxTP4uIKdpf3Acqx/VkpObJX9Y+6rFRh4ULC0LYyP1Nxiky06UXvs89yEOYGUDBNj+liwVrysBbqvs/NrAvM/SNDjFeI/JbDsPj9rYNoziHqo6rjEiRaqaztfNNdb7RerERD0SkDnAK0SKknk/WmmRdaP3fRJ/+b3fS+QElNoIVayuSYJZ1NDdk81Zi5DTqIrwa1fD3lEa/9xBsYGcJFIL8fBpa+8yVlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1UBBdNNs7reb6nPvRiVdhvSndzOf/hhs0i+Ke5lYKA=;
 b=QDKgY19ZEba5QvUQKzWkEShFB/4OB7VAxjUZvyT69sffpllphrfhhq3JHu03MqBmOMKqCJ67tLYuAzd96zKBqbZvfyOP6KKlMAGLYu0mhtqwCU7edDZHwylDWHLIk2qoWz1UlOliNpfp0C5U6jXpAzj4MgDP37ScCxbVy3A9tKzCZnsPbQLun47gQLEeJ88P7cMN5ySUmJFw2uOcgFxXZl7HZ/kYdZRboF8ES4+k1QY6W8orz2T09xIFYc3NdO7chvWJ7fcJv7lYszGaMU3hfbL4r0ZhQyBz/l7vQ//UCOhYOVdBJCk2LioRSDZKUe8C0dK5jw1AQR8cYMSmKgjYxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R1UBBdNNs7reb6nPvRiVdhvSndzOf/hhs0i+Ke5lYKA=;
 b=LLpugyG7TiLBpMP81eED2jDugezz97k57jNhGw1gAPc6i9sCyxbOYTVo1Wmy7/yk9oA+8wgPzPFlNAkXMEB41PjSOlwhCN07htwDEeiNC7Lfyuqw0YlOneFJgYCftQ1scNPac48Qr2eR5z0YNwa2I9MhhzFDyLRRJI3mSpuc2rU=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM5PR11MB1674.namprd11.prod.outlook.com (2603:10b6:4:b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18; Tue, 23 Mar 2021 23:40:49 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::f17d:2de1:291f:80a9%4]) with mapi id 15.20.3977.024; Tue, 23 Mar 2021
 23:40:49 +0000
Subject: Re: [OE-core] [dunfell][PATCH] connman: fix CVE-2021-26675, CVE-2021-26676
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: openembedded-core@lists.openembedded.org,
 "steve@sakoman.com" <steve@sakoman.com>
References: <166F1D02F2DBFD39.25882@lists.openembedded.org>
Cc: Catalin Enache <catalin.enache@windriver.com>
Message-ID: <50e6d4dd-c8bf-406f-0a14-e7f5f23ac109@windriver.com>
Date: Tue, 23 Mar 2021 19:40:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <166F1D02F2DBFD39.25882@lists.openembedded.org>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: BYAPR08CA0013.namprd08.prod.outlook.com
 (2603:10b6:a03:100::26) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by BYAPR08CA0013.namprd08.prod.outlook.com (2603:10b6:a03:100::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 23:40:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c1db3d7-ea1a-47d3-8c6e-08d8ee5516ab
X-MS-TrafficTypeDiagnostic: DM5PR11MB1674:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB16745E94172FE895DC4B14E4F8649@DM5PR11MB1674.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:364;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tdvwysBFUUM8+dqcODWonoNcX4Bg4bX814R3IEA1vOFPEfWqIfU1OnDkabu8A1MpIj0KhPMwIf10HDFf6LxcP7899spC8+fj7DXKjVwWDdOh2a2zwvCWt10mrEgPAZO1QkL1mF+8oxGQsJPP4H+MPriowkeUCYnCpBkduaY3dcRFCRfbRB2zCItGP9nGe0qRSovAC0/VaVhJiUkO6jQUczsz9h46Rf/vAzOASsoHKsqrxRPF+hny+6c97y6yzexg+YxGslVmTGmVl5pU8GjfUrbEYMPkN7ZsRFiERgTD4Aped1ydCHh0Km0XHZb302i2iG5FPN6AxqQonqUlMKqjvxS/W095PxwxaRa1b6+cGlh33ETmFgNongB8wtLjFpN829rPIkQqk036FLV/gvCzv/FIc+LBtcTiyX28oHeZEqo8cWKhASt1Nmz1+5mz/c1mGJjYp8IR4R61ZqcBvtGXhLm5kgCFxVvvBjk4rZhPhZIJHgzfJIOFhG13zc2KwZn3CvnppJiSN+bl0lYpjrQYrF1M5Gu1D37fRrUJVjYX0Pwy3Ag/JGq0bVoFwtIoWyuH5mcAYYoxVbmIx/RRSXwYOOSx1ipoXdRkrIAIgAv/20lkCqHeJzLKxK+o/KfUAI/Of/eQoxQ+n8p6pzSIx+hs/jXt4abgwMCtGi86LHiINjBjVYsCplOYpLNZJG/40J5f/t2skdu+SsqccODV6y1HgdceK1+FSQ4/v+7Z/Wc7oFbkoOXhQMheoW7eEMcSKXqahpVJekME50lPxXEDCJc3hoUbCnUJWWHr6FybjfEjPrUWettDkIauQXKF77/gZfuP
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(136003)(39850400004)(366004)(186003)(478600001)(966005)(8676002)(16576012)(31686004)(316002)(26005)(5660300002)(6666004)(52116002)(16526019)(36756003)(4326008)(2616005)(86362001)(53546011)(66476007)(38100700001)(956004)(6916009)(66556008)(31696002)(66946007)(2906002)(6486002)(107886003)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?NjJmWEhuRzdjS256K0tLYTB0SGQzMmp6MkFXRUtPSU1xbVNHRnRhUnEyemFm?=
 =?utf-8?B?eHlGY1psc05PbUorN3llMEVpRjRrQnd6R01JNk11dHdoa0ZCaHZjTCtxaUJB?=
 =?utf-8?B?WlpxQkpjQkx2dGliU3JLQ0FhdytvZXhPNDZ3aWwrV01sYjFGeTNhdlJSd3dm?=
 =?utf-8?B?b0tDNE11dTlzakxobE5zN0NPaks1dm9mRFVPQzNlZExuejB2eFVnQXlkajFv?=
 =?utf-8?B?aXlTRVpvdGVqbXZOWlU5ZnFYUXRKTmJzeDNwbEFvODJUQzdoY2x0WnZrbkd6?=
 =?utf-8?B?RlFOeUY0YVoyakRqdXpsYk0wUlNoTUhJek1pQnJpRWdSU0xENzZTU1VCdkZs?=
 =?utf-8?B?U2I2QjROSFJ2NVJ0Mm5lbUJiMC9ZYnNsTzJkQm8wNVBLbVFna0ViZDJWamg0?=
 =?utf-8?B?dFVZeS9YZ0diaGF2ZXQ1RGY0ZG14RmdTTHpYU0U0b0w1Y040WFBhVkpQRlUw?=
 =?utf-8?B?MDV6OERPRVJuT2RpY21PZGt1Z3IvaVp2UXJTRW5qcDdJc2hTSElqVDdSeU4x?=
 =?utf-8?B?bm5SY1JkMDFhQkFuRjcrcSt2cFgxMGNRd3RQWjBVZ1kwelR1TWJZSkxnMWtM?=
 =?utf-8?B?d2pwU25hOVY4TnhTUXBPcHRBS04xbEZBWjhOeUxMUlRYb3VWU0ZJd01rMFVT?=
 =?utf-8?B?bStNei9SNi9pSTlPVFJTK1Y4QXU2YzgwaU5FOU1JYXRLS2VRTVhsb2dSVjI3?=
 =?utf-8?B?OVovNVQyQmpHYXF2ZFRWN3YvTFVkU3dqOHgwbDBHV05rTlNOcU9RbVB6SW9Y?=
 =?utf-8?B?czB3UGQ0bExRZUNRQUdFdGVkTlp3dGwwZmRVV0lFZHlQZ2pFNVJPaHk1bFcw?=
 =?utf-8?B?Z2diU29wQ0d5N1VvUnJEK0dVMjYrcU5ZYW8xOFo4WjE3cS84bGNUbzI3aW4r?=
 =?utf-8?B?K0duU0JmUGFZZW1zKzN3b2NnSlRvYnYycEpOT3IzZWxxRXM2a0hmWGdyKzVk?=
 =?utf-8?B?QkR4Ny9qNDQxcVJwaVFtNlpXaG9oYVh0Q05GV283REZDZ0swWXk4dUFlZzZT?=
 =?utf-8?B?MDMxWWhLOGpWTGpTVDhnREZKbXZPV0xCWEdnY3A3S0NZdGFOMUJ5Y0dMUDVB?=
 =?utf-8?B?YWI2cGhkcVRXQzBTTlJSUjg1SVptKy8ydE9CS3RVVGovN0dkTmo1Q1VJNjlX?=
 =?utf-8?B?aDdud2RHZUlIeElHZHJqK0dROEZZKzJ1N0lqSFU1TXhDYUVBS2lmOGZEcUk4?=
 =?utf-8?B?QzkvSGRPRkdMMFJRNkd1UXBCMFI3djNqRThMR2gwWXNNQktUM2x3MnBvQ2ox?=
 =?utf-8?B?ODAydGZpaEtRYUw2MmlPNHFXcUIrbkJBUTRZTzJCRHBrSWRYdlVtZjFPYkYw?=
 =?utf-8?B?YmtsRUh2cXNhM1RqVXB6VmVBdGF1NU5NcUxndEREMHpZRFNrcENzYVZNQjhq?=
 =?utf-8?B?N3ZWOHI0UjlTMUZSR1NDcUVUeG1wQjFTT2U5VXVESE5JajJ3bE9rVy92YjJQ?=
 =?utf-8?B?a3FFQThyeWNpUWFBQnNrUG1ScUxSOGk5S3NQTHJGSzlLZ2cwYU14VzJjbEJo?=
 =?utf-8?B?R1ZlRTRJVW12cStmbGJFWUlBTUlWMlR0Qk13ZE1qVnJSWVNoMFVyMDhjVTRO?=
 =?utf-8?B?QnhHcTF3ck9FMGdGbWQxOTlIZHV1Q3lWcmd0Zm4zYzhXV3ZrRkJBdSt2ZG5C?=
 =?utf-8?B?dlU0aGV4MnFFTi9CU3RuYktVME4yTStodWJVQnUxYlo5NFk3QUNHZlkyaFVO?=
 =?utf-8?B?anJlRk5FczJBQ0ZOcldQLzAwdHJ1T0dmM2VXQktZbHowUEkrbXV2NE9Xa1U3?=
 =?utf-8?Q?/FMxNYAmnYWOjnfggVS84kCdnBZkXnKYkyXYjLN?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c1db3d7-ea1a-47d3-8c6e-08d8ee5516ab
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 23:40:49.3986
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3aHvwsDlzGc1T3OXdIAqxSHGce+MfO9qwuK27SWICdLOnCms32ewl4XDdjByjJZOxEqoBCcDpASaRFt+BmG13quEBkdGQVmC5Q5MgP5Rgtg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1674
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2021-03-23 7:37 p.m., Randy MacLeod wrote:
> From: Catalin Enache <catalin.enache@windriver.com>
> 
> A stack-based buffer overflow in dnsproxy in ConnMan before 1.39
> could be used by network adjacent attackers to execute code.
> 
> gdhcp in ConnMan before 1.39 could be used by network-adjacent.
> attackers to leak sensitive stack information, allowing further
> exploitation of bugs in gdhcp.
> 
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2021-26675
> https://nvd.nist.gov/vuln/detail/CVE-2021-26676
> 
> Upstream patches:
> https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=e4079a20f617a4b076af503f6e4e8b0304c9f2cb
> https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=58d397ba74873384aee449690a9070bacd5676fa
> https://git.kernel.org/pub/scm/network/connman/connman.git/commit/?id=a74524b3e3fad81b0fd1084ffdf9f2ea469cd9b1
> 
> Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>

BUILDALL-QEMU LOG FOR connman
START TIME: 2021-03-23_11:13:40
HOSTNAME: ala-lpggp3
HOST OS: Ubuntu 18.04.3 LTS
HOST KERNEL: 5.4.0-67-generic
===============
BUILD RESULTS:
[glibc]
PASS: qemuarmv5
PASS: qemumips
PASS: qemux86-64
PASS: qemuarm64
PASS: qemumips64
PASS: qemuarm
PASS: qemuppc
PASS: qemuriscv64
PASS: qemux86
[musl]
PASS: qemuarmv5
PASS: qemumips
PASS: qemux86-64
PASS: qemuarm64
PASS: qemumips64
PASS: qemuarm
PASS: qemuppc
PASS: qemuriscv64
PASS: qemux86
===============
PASSED: 18
FAILED: 0


I didn't do any run-time testing but I suspect that Catalin did.
Catalin?

-- 
# Randy MacLeod
# Wind River Linux
