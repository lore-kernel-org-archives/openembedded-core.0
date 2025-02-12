Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE2AAC021A0
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 14:41:07 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.117])
 by mx.groups.io with SMTP id smtpd.web10.17303.1739371259628995989
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 06:41:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.com header.s=selector2 header.b=0jzVFDUv;
 spf=pass (domain: weidmueller.com, ip: 40.107.21.117, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ggUp5SLymYDH0aYyHJZY9Xc2tpvjLkAqNLmxuyKTz31SwrPMKzzwTWPapnEAs+MQYnrr4M7EfAIn5CqfIFoPAcjUb6/Ldu0Vja4ykIpyCMVmnQRJPEB3o4c4aoQu79RJGAx2prj6I0j3K4VO6+FF46i6XgTc0KrSzY9fzc2eVmDIvBoXPZRmmg4Y3rPzq4h7v1Idg3KSt5DiVte1r7dP2RBdHQnPMvqja+SZgZg56WixcHAyG2IPSpAGXGb34qcR+7Okf9kJ9Lrnpp3sKclZB5Umk2U+OMzSBg1/3opWLPCSsUEhx+ZcowdE6wcMaVKYvgmjDZXF5cy3yHBEMqPhXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNf4DMnuOWGyPwGvLnnoM1ANl5NFr4v5/B+yGVofebw=;
 b=SUYcK2cQBSrif7gYzfTWQHotW13PNGIdMbraztg3ZuDSviB/atRUlXsH4v7u4S5do7nljsN6wf0OyO2ba9vpGFRWeemmXqywwyOGJR0Zk4FtvoC/A4OvtWb5+iwVgFm7ztVNz570DzBmqKoMx8pBIbZ9MHUaA0R+MBJ+6vfoo3brx7FR8/mvOsKxNJaXjsc7xqkiJBQ9vRPJy4+ASeLN97qTs63DLldblWJ2CkC67qXYtNtd2PbJQlrNlS9HU7HilEYlFNHuEio58Ir1KuiE5u0ruE/WWoWMzITd77aFh7jk7HJ0npU1+nz50OBj2++8uGuqDNHTn0o362D5TfoRtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZNf4DMnuOWGyPwGvLnnoM1ANl5NFr4v5/B+yGVofebw=;
 b=0jzVFDUv3x61o1MSOp4xcHssyKQxlDmUvF9xpFtyZT0ATqzOv2v4zX6WL6Q7dw3nZTdESg3AZO4MnqxNWA+Uy3lDKSHHxst6g/xgUYIZBbLDC7ipVYVaHRbwG+bj+GIGzIO3Ib12M/1k9w6xGPp4IqE71hLMJsIJvF6ITcLBvxY9jd/yqn0ifKR+IdTOKAXyd5OqPyaHkY5WwiJsXKDmxRpYF0buEwEz02pYJ2H6QiEjDGKA4Q6OQfYLPnrF2gPKSjugtAsun+IClfWAISEwEdSX1I2T09ylzPKaWKKcI/DCqe7J5lGqfpgeL58tuJLR/OEXgW2ztw3pKs7CQM18rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by GV1PR08MB8058.eurprd08.prod.outlook.com (2603:10a6:150:96::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 12 Feb
 2025 14:40:56 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 14:40:56 +0000
Content-Type: multipart/alternative;
 boundary="------------v3oNx2aw3JP917D5do0Bw2ML"
Message-ID: <f1effd92-1148-4a8b-9c9b-79b86e58fdc2@weidmueller.com>
Date: Wed, 12 Feb 2025 15:40:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH 15/30] classes: add early fetch, unpack and
 patch support
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20250211150034.18696-16-stefan.herbrechtsmeier-oss@weidmueller.com>
 <Z6vQDT6LkF9JMQ+S@gmail.com>
 <1c055ff2-cf06-4e21-8c8a-a4f09d037d5f@weidmueller.com>
 <CADkTA4P31j6diWt_Qa5BjYksQktMGxRhy4KgdX_imdkf0vrY0w@mail.gmail.com>
Content-Language: en-US
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <CADkTA4P31j6diWt_Qa5BjYksQktMGxRhy4KgdX_imdkf0vrY0w@mail.gmail.com>
X-ClientProxiedBy: FR0P281CA0255.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::18) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|GV1PR08MB8058:EE_
X-MS-Office365-Filtering-Correlation-Id: e84de32c-7ea3-4912-4480-08dd4b73424a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QllHaDFUUWZ0SXRrZkFaQlJxWDRVckZsVG52R29pZm4rb2JKRjJBc3ozUjc0?=
 =?utf-8?B?SmFCajI2RThxSkFJV1h4S3pRRXNqakxQSVBpcGRjcWJWaExBc050Ym5aOHZv?=
 =?utf-8?B?dnZKa0JqN3dIQU4wT2l4NXFzc2lFL1pJb3RReHVsMDFvUGx5bkl6Um8xenNy?=
 =?utf-8?B?eUJkejM0UytDc1poK1ZxOUQvQmFCeWtGdjhveThpdzBpckh6MmxwakhSUlNI?=
 =?utf-8?B?S0pOOHRSMDZ4cEl3Z2FaOXlNTjRsMFlWUnVkZlFtdzhNOVBVTzAyaWJJak54?=
 =?utf-8?B?NlRmblFFMHljNy95MDIyQ0x5cVl1cUpuOG5DT2g4RVVmcjFtNmtqd2lQOFVp?=
 =?utf-8?B?VFQwdXQyaUVmalkwR2R6aU5HK09nK3dzamc5ZXZnQWszK0dRSHBiY1k5Ulky?=
 =?utf-8?B?Y0hFS21xRytxdkhnNm84K3JuQ1c0Nmk3YlVwRVlKQTRERHBpelZycURadGlC?=
 =?utf-8?B?ZmgwQ0M1OUpXWDVpSVIzSk1hMTNaeUR5aFh1M1FRTlpsNDhVamJQbE9yajQ1?=
 =?utf-8?B?blM1bnpLQXNGSGF0ZVpYRTJOWWtiMklZUEV1WHlXTTJxME8yMWxqQytmNHA4?=
 =?utf-8?B?NjZmOHFzd3A3dDVaMUhrNE9yb1RRYWFsWnhuSDh0TjcxOWY0K3IrWFZYK2x2?=
 =?utf-8?B?NWdESjJxcUh5TE1sRlNhMlZZdDViUUcvV0NUYmg5aU4xend1b0dGNzNlV2ph?=
 =?utf-8?B?R281Uy9lN1c4anpKUC9VTmNXRG14SERQdFpoOS9xeTFJU1dGR3EwNmlUV1dT?=
 =?utf-8?B?SzYwbHVZRk95OGEvTUpmRFBIQ0VZazg3YURuMVRJNG9XemltRWZUdVpFNi9j?=
 =?utf-8?B?VUhvWjM3K2lDY0xEN2hncmdWQTRhamNRYnhqdnhyaFpsQStoeXYvbDhTVk5l?=
 =?utf-8?B?ZGJZQkNOTmtWM3Y5bmFJWVp2alppak5LcVZSKzhMSThnNk1zT3VuUWVxdWhN?=
 =?utf-8?B?eTQ5YzJQR3FzNFN4c0laTEQxSDFTdllDY3laWURZTGNqVGtTcW1ERUMxWjFh?=
 =?utf-8?B?RmJiV245ang3SUdwK3R2UTAwN3NVU2pYSXRBOGhTUHNtemNHR3RRbFJQdk5w?=
 =?utf-8?B?ZGJ3U2UvbUU5Q05QcGJpL2hkWUFUaktGSHQrQVZvVC9pUVFSY0FoMS9hajN4?=
 =?utf-8?B?Q1AzVyswbzh3blUxTURLemtwUEFWSkhxQVBpUHNNZER1dU8yWHlNM0NMZ2NP?=
 =?utf-8?B?UFU0VWx0SWtoUE5lTmJYUVJnaG9ObW1UallGMDc3cWhBNzdoVmJOZ3l6VVdi?=
 =?utf-8?B?NmhObU4wcGMrY2JySTJVVHphS0NTUDFKWDR5VSt0S2hsSEZOUXUwaDkzUFVE?=
 =?utf-8?B?dEZLaGVCOXBraUI3SVFUOUI0WUhKTnNmdy9GN2c3L1UzdloxSjdhQmExWGJZ?=
 =?utf-8?B?Y1FuOGtrZ0JQbUxKeWFVaDBrR1ozWFFJa2M1djVFQkcwUHNaTDlnWnJVaSs2?=
 =?utf-8?B?Vk9LZHdWY3VhUnJqc2pVbEwzTWhVUkx2cWZlTVFHQmdvZ1RmZnhKaG4va0pw?=
 =?utf-8?B?QktqWVFrc1QyYnUwTVhvdFZLd0p6M0ZkZE5XOVdNbGI5RWl2T2ZoajgvbHpX?=
 =?utf-8?B?Q2tZOXJhYzJSZXZ6NndPcXFsbUpjYjlHMmxHVUpVaWhXT1cwREZobDVBTG5B?=
 =?utf-8?B?YkRyR2pheWcweE1JREcwcjM4MWZ3aDVtYzVqMSt2T1JCSk05NUdUdkxPaXJx?=
 =?utf-8?B?VWorSkJOdFNGVkNtQ2h2VnNsSE55OVN2SDJIajRYSWJXbmVWbWtkSzlrMW1x?=
 =?utf-8?Q?IlIO9BnAA2RkotPfq92gHmzw6sDcGWR6qkEG+TF?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(13003099007)(8096899003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OVQ4cDNJajFGdHNzY2t1V2dObkxzSXE2Q0pMcU41SnF6MjNHSHJCSjJCd3JE?=
 =?utf-8?B?dnMrTHcwRnd5T1NFZzQ3V2E4Nmo0bFBFRVVIYWFxTDJ5WUpLbHFldGR0U1Ro?=
 =?utf-8?B?ZDhJR200Z2p4YksrY2crOUEvVDZSSi9aNGxCNGNHQVlQbzlRazVYcVlXTVJ5?=
 =?utf-8?B?bURwVmVVZHF5VG96TWlEUndNYklNeVF0cnp2d0swdVRGVHZtQlplOUZvUTU1?=
 =?utf-8?B?VUoyOWM0YVhZQzlzOTdDYm01eXZoa09RdzVhYWRVN0hQTXdtOXRaVjMzQXRX?=
 =?utf-8?B?cnBKMENyYXE5S2NuNlJVcU05KzRDOS9qK2JERTB0WXV0V1lUTWJReTFJbm5r?=
 =?utf-8?B?ODJ0b1VzOS9abzFUMmFINndraUZrK3RMbjFaWDM2eW1SeVRDRENwT3hMUEZW?=
 =?utf-8?B?czB2N2dwWExuYmtZYUc1Z0JSajRyYlgveGxZM09CN0VZYW5iNlBmeUg2ZzFN?=
 =?utf-8?B?aDFzRC9adHVmMXNVSXlya2ZHanlVYzQ1eExqY2J1T0orclZPYU84R1oxL0Uy?=
 =?utf-8?B?bTVRcmRMWW41KzNWbGUrc1pLdkNTTkV5ZkFBYitidmFxZy81SXlla0drUTBG?=
 =?utf-8?B?ZkJ2QUlpaFBiMUxnc1JsK2xkWjM5Ym9vcWM1VnEwSjdHTUpVV0lMTGIwZ1dV?=
 =?utf-8?B?VDExK21LMjFYTkJDaDh2TjVzNWxvdk94SVJCdC9LZDdKZERWOHVYdzA3eE9v?=
 =?utf-8?B?cnVxRVF5bDJqOWxvM0dwU1hMbnVCbVdqY3lvMk5JMEhNeVFEb29EbC9kbEJF?=
 =?utf-8?B?d2dSUFA0RU1vS29QKzEwM3hoZ3BjaURvN2E1eWNyZnJBUE9MZStBS3d4VUhz?=
 =?utf-8?B?V1gzdWM4VzVrL2RuUytYMytiNnFpQUIzZm1pYVdmMjVUSzNQMVNOM0ZxV2o0?=
 =?utf-8?B?Q1dvT1hjR01Mb3NVNERRV1M4TVlFWW56aDQ5eFRHeVA2TnpjRzFmLzNBZVQ2?=
 =?utf-8?B?Q09NR1RTck96UTBsKzRoNVFEYXF6UDhsVVZXSHV1WmZSR1IyQkdvelA0aDNi?=
 =?utf-8?B?MHh0MDlmekYxMHV4TW5UN3JmN05Hb1Zvd1h2ckd4NzlrSHlDZEx2MnY1cHlV?=
 =?utf-8?B?SEczQ3laMUVCYlFRQkJMYy9sS0U2VUZEU0RTWGZVcDRmbnBOMzNFS2ZlZnB1?=
 =?utf-8?B?a3NTVUhzbCttT2pETFh1UHZ0bVI2SGZSbmpCSEx5MjZZUDdOUm1KS3BTbExo?=
 =?utf-8?B?bHF3TWtHK1ZMcGNtTnVBdDU2UGZZbFRXTFZnNWoyaXBUeDBCM2ducEFsSVpG?=
 =?utf-8?B?aXdMaStleXlxajVKakVibzhyUVZHS3E3SC9ob1F4NHhnNWtNS2RNM1kzazRB?=
 =?utf-8?B?MmNZaG1hQWE3QTFSZWxYMUFNTXBwaUJjaW9TQTlvWnczdXJCaWxEOVRkZFFD?=
 =?utf-8?B?UWdTSllXVUl1VmxiN0hsVHNySHFvbzVsQVh2czQ2MkEyaGI1WDlNMWQvTUVN?=
 =?utf-8?B?QjVia3NvNEp5YVhNMEF2bFJ4OFlFZGVrNU9hbUpTVTNNdDgxSzAwTHNSV1dF?=
 =?utf-8?B?b2tWdjgxUk9Ici9wdlBveGQxT3VvS3dCbVA5MFF6cHY4bGo1N2N5eS9QcFB1?=
 =?utf-8?B?QWhvWG94dHp4S1V4ekh3OEJ0MXVHOTYxdStXSk56ZkR1ZVVEL0c4Sit3WDNJ?=
 =?utf-8?B?T1hxc1pOUkJTb0s1emxzZXpZcnk2QzZjOGpXVWpQVm1sbHpQWGV3Wk9wM2Ri?=
 =?utf-8?B?disrWVhNdVVrOUNjME1VblBteWxqUVZCOUZnQWw4ZE9MUFB5cmhDUHhSUnZY?=
 =?utf-8?B?ekFVY08vUnlPUHNKbG1jOU96Qk4vWXY0UEViZGxJcmpoMTlMNDRGT3ArcWw4?=
 =?utf-8?B?Q21HWlZRQWgxem01QXhtYkNYcDlUNkVpMlJ2SHJnQWRnMXEzV3U1am1PM2VB?=
 =?utf-8?B?RkJwUWQ5ZTMvZTBWVVZ2T1RDeGtXeHVhd2ZIQzFmK2ZSZmpNMEM1OERYVGJV?=
 =?utf-8?B?WFc0eVp6MitPVTBKYmFZcDBpSEkwU1cvYWdYNFhZb1J5NU93NWNzT1FLM0Zo?=
 =?utf-8?B?YUpiKzhQZnQ4Lzh5RkFyN3VPUlFwR0ZBNXJpTjFEcTg5R1R3RWJVQUp3eFRH?=
 =?utf-8?B?Q25uN0xkSzZvbE5rR3Q1YWt1N3hJOW1IcytvQmNMSUlQNHNYSUtFU3J4WWpE?=
 =?utf-8?B?WFp1ZjZ4SG5RKzc0d2x5dllGWWhCVWxyRXg1MHRmOHRWRWh6RUZHMzRQbDg5?=
 =?utf-8?B?OEE9PQ==?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e84de32c-7ea3-4912-4480-08dd4b73424a
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 14:40:56.3495
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AIOb59eGDrqnpTnZDKqp/V2s/uuV0GWUkjS/mypFbi2DRAL4ZzDdGXzQljeBo9Ohaib/aqCLuMu7VIcSL8X4bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 14:41:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211244

--------------v3oNx2aw3JP917D5do0Bw2ML
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 12.02.2025 um 14:55 schrieb Bruce Ashfield:
>
>
> On Wed, Feb 12, 2025 at 7:42 AM Stefan Herbrechtsmeier 
> <stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
>
>
>     Am 11.02.2025 um 23:32 schrieb Bruce Ashfield via
>     lists.openembedded.org <http://lists.openembedded.org>:
>>     In message: [OE-core] [RFC PATCH 15/30] classes: add early fetch, unpack and patch support
>>     on 11/02/2025 Stefan Herbrechtsmeier vialists.openembedded.org <http://lists.openembedded.org> wrote:
>>
>>>     From: Stefan Herbrechtsmeier<stefan.herbrechtsmeier@weidmueller.com> <mailto:stefan.herbrechtsmeier@weidmueller.com>
>>>
>>>     Add support for early fetch, unpack and patches task which run before
>>>     normal patch task. This feature is useful to fetch additional
>>>     dependencies based on a patched source before the normal unpack and
>>>     patch tasks. The patch are marked as early via an early=1 parameter. An
>>>     example use case is a patch for a package manager lock file (Cargo.lock,
>>>     go.sum, package-lock.json).
>>     I understand why you need to do the above, but there's now multiple
>>     fetch and patch tasks running throughout the pipeline of the
>>     build and that's just more complexity to maintain.
>
>     The tasks call the same functions and the difference is really
>     low. The early task simple use a filtered list of the SRC_URI. At
>     the moment the gitsm fetcher is doing the same but without a
>     possibility to patch a dependency.
>
>>     This is what I was asking about in some of my first replies
>>     to the RFC series. When I've done this in the past, I'd just
>>     suggest something simpler like the recipe provide a complete
>>     "lock file" in the layer/recipe-space and have it overlayed
>>     in the source.
>
>     This was already supported by my first patch series. The
>     disadvantage is a lot of noise during each update.
>
>>     Of course that means it is in the same fetch task as what
>>     will be fetching the vendor bits, but coordinating within
>>     the single task is simpler in my experience (and it can
>>     be checked on the SRC_URI). I haven't fully thought through
>>     how to manage it, but wanted to reply to this while it was
>>     fresh in my mind.
>
>     It is simpler because you manual fetch the lock file, remove the
>     possibility to patch the file and skip the unpack. But you still
>     need a manual fetch, unpack and maybe patch the source and copy
>     the file into the meta layer.
>
>
> That's a completely different type of complexity. Richard and I are 
> only talking
> about the complexity after "bitbake <foo>" has been called.
>
>
>     It is also possibility to integrate the early and resolve task
>     into fetch task but I'm unsure if this simplify the complexity.
>
>
> Having direct calls to additional routines via conditional is less 
> complex than
> tasks (dealing with timing, scheduling, code maintenance, etc), so that is
> preferable from at least my point of view.
Okay, I thought separate tasks are preferred. What is the alternative to 
the EXPORT_FUNCTIONS in this case. I need to call different functions 
depending on the inherit class.

--------------v3oNx2aw3JP917D5do0Bw2ML
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Am 12.02.2025 um 14:55 schrieb Bruce
      Ashfield:<br>
    </div>
    <blockquote type="cite" cite="mid:CADkTA4P31j6diWt_Qa5BjYksQktMGxRhy4KgdX_imdkf0vrY0w@mail.gmail.com">
      
      <div dir="ltr">
        <div dir="ltr">
          <div class="gmail_default" style="font-size:small"><br>
          </div>
        </div>
        <br>
        <div class="gmail_quote gmail_quote_container">
          <div dir="ltr" class="gmail_attr">On Wed, Feb 12, 2025 at
            7:42 AM Stefan Herbrechtsmeier &lt;<a href="mailto:stefan.herbrechtsmeier-oss@weidmueller.com" moz-do-not-send="true" class="moz-txt-link-freetext">stefan.herbrechtsmeier-oss@weidmueller.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <p><br>
              </p>
              <div>Am 11.02.2025 um 23:32 schrieb Bruce Ashfield via <a href="http://lists.openembedded.org" target="_blank" moz-do-not-send="true">lists.openembedded.org</a>:<br>
              </div>
              <blockquote type="cite">
                <pre>In message: [OE-core] [RFC PATCH 15/30] classes: add early fetch, unpack and patch support
on 11/02/2025 Stefan Herbrechtsmeier via <a href="http://lists.openembedded.org" target="_blank" moz-do-not-send="true">lists.openembedded.org</a> wrote:

</pre>
                <blockquote type="cite">
                  <pre>From: Stefan Herbrechtsmeier <a href="mailto:stefan.herbrechtsmeier@weidmueller.com" target="_blank" moz-do-not-send="true">&lt;stefan.herbrechtsmeier@weidmueller.com&gt;</a>

Add support for early fetch, unpack and patches task which run before
normal patch task. This feature is useful to fetch additional
dependencies based on a patched source before the normal unpack and
patch tasks. The patch are marked as early via an early=1 parameter. An
example use case is a patch for a package manager lock file (Cargo.lock,
go.sum, package-lock.json).
</pre>
                </blockquote>
                <pre>I understand why you need to do the above, but there's now multiple
fetch and patch tasks running throughout the pipeline of the
build and that's just more complexity to maintain.
</pre>
              </blockquote>
              <p>The tasks call the same functions and the difference is
                really low. The early task simple use a filtered list of
                the SRC_URI. At the moment the gitsm fetcher is doing
                the same but without a possibility to patch a
                dependency.<br>
                <br>
              </p>
              <blockquote type="cite">
                <pre>This is what I was asking about in some of my first replies
to the RFC series. When I've done this in the past, I'd just
suggest something simpler like the recipe provide a complete
&quot;lock file&quot; in the layer/recipe-space and have it overlayed
in the source.
</pre>
              </blockquote>
              <p>This was already supported by my first patch series.
                The disadvantage is a lot of noise during each update.<br>
                <br>
              </p>
              <blockquote type="cite">
                <pre>Of course that means it is in the same fetch task as what
will be fetching the vendor bits, but coordinating within
the single task is simpler in my experience (and it can
be checked on the SRC_URI). I haven't fully thought through
how to manage it, but wanted to reply to this while it was
fresh in my mind.</pre>
              </blockquote>
              <p>It is simpler because you manual fetch the lock file,
                remove the possibility to patch the file and skip the
                unpack. But you still need a manual fetch, unpack and
                maybe patch the source and copy the file into the meta
                layer.<br>
              </p>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div class="gmail_default">That's a completely different type
            of complexity. Richard and I are only talking</div>
          <div>about the complexity after &quot;bitbake &lt;foo&gt;&quot; has been
            called.&nbsp;</div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div>
              <p> <br>
                It is also possibility to integrate the early and
                resolve task into fetch task but I'm unsure if this
                simplify the complexity.<br>
              </p>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class="gmail_default" style="font-size:small">Having
              direct calls to additional routines via conditional is
              less complex than</div>
            <div class="gmail_default" style="font-size:small">tasks
              (dealing with timing, scheduling, code maintenance, etc),
              so that is</div>
            <div class="gmail_default" style="font-size:small">preferable
              from at least my point of view.</div>
          </div>
        </div>
      </div>
    </blockquote>
    Okay, I thought separate tasks are preferred. What is the
    alternative to the EXPORT_FUNCTIONS in this case. I need to call
    different functions depending on the inherit class.<br>
    <br>
  </body>
</html>

--------------v3oNx2aw3JP917D5do0Bw2ML--

