Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.76])
 by mx.groups.io with SMTP id smtpd.web09.7007.1611909641593643085
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Jan 2021 00:40:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=a0fA0ajm;
 spf=pass (domain: windriver.com, ip: 40.107.244.76, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cDu1RYJoXXLTNO6yifKTGzeXPY3Nr4AuO03LQSmqe4HucJXbVnCqgRAoaB+vkTnPMx/FlyRCEAo4aRdxXhkhvjgBMj5tIdPZo4oyWqZlhyv7gNfd6SUycN2vcRiJETtca5yWUBlwxHGPoMDLFq7Zyi2zp8Y+mn2Hm5c+WgNVEFzCzNfUSVPtsd0697t8rWxSdtFHwQPa+8XQ0R35vA95NS0CMAh9pXevoNh4Rq8+/bGty6mzYir0DoHzjusGn6WHmJoH6292AfYCEVouz16CwFgSJhSjvEIorBD8HexDPBji5I+msHvyYzaGa+L+Qk5+yPYDqiNYJCxVW8A5HkolbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FC7J4IMvLAP8UChjIQemTiUk4PDXNVC91XB1WUJvQdE=;
 b=oL6ji8y5KkOuJ6ys1lPCOZXS56RT9iefo3kSRo6Wla9nAopR9t3V1TYvxGXytU2esXETagjFVNT/QZki3zQPdnvL8h7D7XRObBTF7m9FIOcZv47MteHicQ8YqkzhU/xQCRDioU5nolgxWtLX6lPnTBXXEy6XwmQRrbx7qQUA9+1StCSeEKpDLhOQumrMjKKMxJVOUn8MjEip/PTIfY7c7NfolD1Vt6hN2qJsY9djlAs2lC6tZqHKZQkzAkseK34hh7GRSit/KtH+7PfpNEJESwFGgrMmgyyGniyW0BtCzbfR1UYa56g24zgcJErd5lIEvorXWGYcKrY811Rsi7+qBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FC7J4IMvLAP8UChjIQemTiUk4PDXNVC91XB1WUJvQdE=;
 b=a0fA0ajmTem7aC+jd4ZWcvHnjKaNyOQhEuDS9j0HAAACHGAdL7f1Hn1FjL26pDIVwYq1W0XQtd2+qVv8OPKIExIVTSTJLJfWwTsgdvIweRCzW1PkYK7/o2OzCu89Rw1wa2+AdejuF78TNoyBAIi8pM48a287lspdCh0pAHz1g3U=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BL0PR11MB3474.namprd11.prod.outlook.com (2603:10b6:208:67::17)
 by MN2PR11MB4598.namprd11.prod.outlook.com (2603:10b6:208:26f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16; Fri, 29 Jan
 2021 08:40:39 +0000
Received: from BL0PR11MB3474.namprd11.prod.outlook.com
 ([fe80::2548:a42b:4216:731c]) by BL0PR11MB3474.namprd11.prod.outlook.com
 ([fe80::2548:a42b:4216:731c%6]) with mapi id 15.20.3784.019; Fri, 29 Jan 2021
 08:40:39 +0000
Subject: Re: [OE-core] [PATCH] sanity.bbclass: verify that user isn't building in PSEUDO_IGNORE_PATHS
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Dorinda <dorindabassey@gmail.com>, openembedded-core@lists.openembedded.org
References: <20210125230811.21862-1-dorindabassey@gmail.com>
 <77ad8e184576449791b56fe9c6e0fc872cc98a42.camel@linuxfoundation.org>
 <4e6da54d-f6ef-9c04-4bdb-5af64807cbd7@windriver.com>
 <423d07e79bdbbacc58d63ff64c8fa1bd8f70f9f9.camel@linuxfoundation.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <4c6758c8-66f4-71fd-c928-07cb47b84ef6@windriver.com>
Date: Fri, 29 Jan 2021 16:49:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <423d07e79bdbbacc58d63ff64c8fa1bd8f70f9f9.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HKAPR04CA0008.apcprd04.prod.outlook.com
 (2603:1096:203:d0::18) To BL0PR11MB3474.namprd11.prod.outlook.com
 (2603:10b6:208:67::17)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.161] (60.247.85.82) by HKAPR04CA0008.apcprd04.prod.outlook.com (2603:1096:203:d0::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3805.16 via Frontend Transport; Fri, 29 Jan 2021 08:40:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49f07eec-1cbc-4da6-8f5e-08d8c4318e3d
X-MS-TrafficTypeDiagnostic: MN2PR11MB4598:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB4598B5D2A7B4D583F79D359BEDB99@MN2PR11MB4598.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2JqgbpDQv5NhM66zNSQQHHZoedcI19cEfZ6OI9db6PxEXG6ENUuyXZS7SOuaJUKPKDW3sLm5W7k0Ayzo0i0l/D/nynUEGYleZGg++PO01q8LnPXhpYXvcvHU3LW0XQ9K8k2aNBbvSI70iKSySj13bhhQoIzcgpRNIK3y08RpDpgSATBNdwX3EX+IG0+roJGeqog9unOV9XLaz3cTFs8HY1Wzoa8rC0LPgASsfJB0nqPWOZKX7Qd86yqfHcQpXrZ5kmoQ5s8a4u776lsQap66cIn4LokIdDtkedK3cFN3BO3xX0rf8RWI8NeTe5OyUcly4rIPH2mUGpDpQ5m7hH9PuVO1t5r0BnmZZLc/1RS4bhcS0Vt5D81ODpU9hByotmI0ANz8N4pLryvGINporVBia05++LH/3NqZFBHVTnJb9C6XzOOspHoMUytFrDITIWcqEd64915EGdp6ptPTuVc50uPoMQUWEV05wsNKAEOxcz8hBAXxj2StIi4IybVf3OnyBa3aw3V5j5txpkzhk2LuLz45M12Qixqx3xJsWQgWHHKTeosAbsa+KlLfWFvzXNaC3quFtPCYDRpe4+9B6+BNkPIAiLblQc3U1OmSQssjh4K3LQlYnHOzRX0H8t0brCSF
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3474.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(376002)(346002)(39850400004)(366004)(31696002)(66946007)(16526019)(36756003)(6706004)(956004)(53546011)(86362001)(16576012)(66476007)(8676002)(5660300002)(110136005)(2906002)(186003)(66556008)(83380400001)(2616005)(26005)(52116002)(31686004)(6486002)(8936002)(15650500001)(316002)(478600001)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?S21hZVZ6ZThFTEVCR2JHUnZ5aWc0NjZNUGdsd1llcXVvV0FhVUErQ0RPemZH?=
 =?utf-8?B?WTNTU3FVc0JxV0hrYWdjZDFJcDBQbUoxelorZUVHZmxtOEY4YUlJdG93ZkNv?=
 =?utf-8?B?WStZZmk1aG9TVW4raFVtNEs2UkNDL2owRTZPTVhqWmduN010MTlZOE9yQ3Rm?=
 =?utf-8?B?c0grcm1yNU1NaFQ4emswZkQ0NWlzTFVvc3hDcWFrTnltdzB6ejJrRmlKNWZX?=
 =?utf-8?B?TzJvWWkwYWR6cElmL1lObGVzbGVBUDJjbngxR1hlZWtnbU5oY3BlMDd5YU0v?=
 =?utf-8?B?OGpIa2xaMU55Z0tSVWh4U29qSkdpYkxPaXVibjgrWFFMVC9NVWFGT01JWThP?=
 =?utf-8?B?aFJnV3ZDOG96VUZ5NWVFTXh4OFY5TzZMelBremozRGQrcWpSWGdnMkZnbktX?=
 =?utf-8?B?dFJxZmJQVnI3L1gzN3BsSGMvdDc4a2NPbEpYSk41aG9iWWc1cEtjbUVwQVB4?=
 =?utf-8?B?K2duVjdNMHhIWkY0MWF3NStjOUZ2TmxqVCtscElGQjN1cHRIbHNOd0dnVHBZ?=
 =?utf-8?B?eGROOTdXVVVDRVZwL2hPQ0g4cHlhb0VEZWtkakRvQXpkV1RpWWFIV2ZiYmQ4?=
 =?utf-8?B?dzJhZ1lhZ0JONzBJZ1Q4K3VnY3ZNa0hYaHJYNDlzT1RCc2UzN0NWWjZCMXA5?=
 =?utf-8?B?MTFWVWw4VlBoeUJnVThZMEtBR0x3MjhNNVgrVUJZVVRkdlhQd0ttU1RYZVRM?=
 =?utf-8?B?YnMyZUpXQjlFTldvekM1NkFKNENlUVY2ZHpBZUVDYTl6RFplT3pSR1NVZjdi?=
 =?utf-8?B?UzZERmtMWW5PQjZDdUxpRzFKN0ZIL0paTHd3NE92TStxUUY0WW0rV2tmUmtN?=
 =?utf-8?B?aHlvTW90b2dya1JvL2VCSW9lTERLQ05VVGRJNWNSU1dXL2VvWUR5V2dQdFlq?=
 =?utf-8?B?Wk9SUXY4YTRLdTJDa1RCWnFzbjVCb0VqbEFrRFBJSDd3U0IveEs2UW9OTUUw?=
 =?utf-8?B?UVlleWN2OURsWW50L2IydWVMN3NLeVdNT0ZXZUJoWHVlRmdZZ3FlU0dJSVpL?=
 =?utf-8?B?MUFUZVFKbEdWdkZkQ0V3QWdJcUliT0t0Q1pncVdjcjl1REhXSkhNYkU2bTZX?=
 =?utf-8?B?YzNOekI4dVZFY3d1Zng1QTNRUEQ1b3U0Zk8yRmdsaGxxWnNuUmIrVXM0RGR6?=
 =?utf-8?B?N0YxVEpDQjV6TEtvb2tlZ0M0aGs3c3VBK0JqZWJ5MFVjWENNbU4rMnA5K2VG?=
 =?utf-8?B?eVN6NE9EV1RpbUlQcGtwWWtHV0h0N28zL0FTUktUdk9lSlVEMFcvSVJlTC9R?=
 =?utf-8?B?YUpQblgybWlwY0wvVWdETFhrNzJYMFBCUW1nY2p6ckF2L2hNTVpjdGhXeXcy?=
 =?utf-8?B?bjNhSTJkSWpTUWViNEI2UzFXSDlWaDJhVTVaQVNyZGdzU0Q1ZmZiclNheHVK?=
 =?utf-8?B?bGd2RGs5ZmR0MUR5Y1NiL0pFVVNndWNROTdITUJ5SERIU0RldG9QSnlCNmpU?=
 =?utf-8?Q?mxH4uJgj?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49f07eec-1cbc-4da6-8f5e-08d8c4318e3d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2021 08:40:39.2985
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NE9plFn1CZWzm5EAikTzOBkwBK8Eu4NN/EPKacSEeIHhkfiMek4TgPcAr0fsfqlPGxYr9PxD6avSeeUttU3NOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4598
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Richard,

I've sent out the patches. They are tested with:
1. bitbake IMAGE && bitbake IMAGE -c populate_sdk
2. bitbake world
3. bitbake IMAGE -c populate_sdk_ext; Install the eSDK

The world build covers all oe-core recipes and part of the recipes in 
some other meta layers such as meta-openembedded, meta-virtualization, 
meta-secure-core, etc. The recipe number is about 2000.

Best Regards,
Chen Qi

On 01/27/2021 05:49 PM, Richard Purdie wrote:
> Hi,
>
> On Wed, 2021-01-27 at 17:46 +0800, ChenQi wrote:
>>   Is it possible to use an opposite way for pseudo path filtering?
>>   Instead of ignoring paths, only take into consideration paths in
>> something like PSEUDO_CONSIDER_PATHS.
>>   The list should be short. ${D}, ${PKGD}, ${PKGDEST},
>> ${IMAGE_ROOTFS}?
> Its a good question, I was convinced by the pseudo authors that it was
> a bad idea. The reason being that it isn't just the above paths but we
> also need to catch calls where files are transiently in other
> directories or in other parts of the filesystem such as /tmp/. Code
> creates files in interesting and convoluted ways to preserve
> permissions, for security reasons and so on and there was a worry that
> masking just a specific list would cause a different set of problems.
> It probably shouldn't be crossing filesystem boundaries doing it but I
> know there were complications due to it.
>
> That said, now that pseudo can support path filtering, it may be worth
> an experiment to see how whether it could work better than what we're
> doing now. The algorithm (whether its include or exclude) should be
> relatively easy to test.
>
> I can also say the above list would need expanding as some sstate
> objects need to preserve ownership/permissions during creating and so
> on. It probably would still be simpler than our current ignore list
> though.
>
> Cheers,
>
> Richard
>
>
>
>
>

