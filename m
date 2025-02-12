Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D1AFC02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 09:28:05 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.134])
 by mx.groups.io with SMTP id smtpd.web11.11163.1739352476285047461
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 01:27:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.com header.s=selector2 header.b=LVS+cfMq;
 spf=pass (domain: weidmueller.com, ip: 40.107.20.134, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UG4zjRObgupwkGP4/sZbhO1A/7A4lMaGNvrgZWS1yq5c53bG2eRvnw3tQjx6E0pVv6TxFpUJPIScG90u+vq10RqeOUqCTJgrYK7ycdhneDTW4YwqkZB4qUD1B8maF17/gyaLTG1SudlSo+2eo32+t4UZuqurvB7VJpBQjl/rw7ESfB/K8RF1aYhB5tbTKTvN8R+ygmZvTgqAjBHasft42ShKPw9S1nUMUT5whs3pRjGniZ/evamVGf+u6b0fPWja9sOA+McmDaWQY+KCSp5iSPh0IsD8mTQX7blP7N4hr0SUuEIsyM8LFeJd2xKf7nFcvTeIvHVbzMdqZo9xRz64TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lzZHc74ZjP7Qxu7uZ9UU2QomAv013fddETyNkCjOdls=;
 b=S8cEcd9EqJjY3m/cbc56wMeWuxR8hq6sKD0OXGN8RwxDjs578mQLt36ED/RmMW5mhx+FHYbU06kBAg/9Bb3Z7Jhohw8NGPvxsPbjt8Bw+tdZ7vGnvDdpuSbFMY8hpDbPmGGrGcq7MWaVZJgXaAGa+tKhECoE+P5E5zpOQvqyvT3x55qeD+m5F1OzYfve1ER94c5T97Hih2x6DSeU5aymbR5H5Pr9MjMYj7selhoWbGyqLA6z5HMS2rWCWUQsYGr40T6p6+x+YAgbZeMvQZljfGLX9xgtc6acT++TyrqvtiHjDdo4WRl5tPc9qr+x7FI3X4/xNh+G/qbfTXU89agFRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lzZHc74ZjP7Qxu7uZ9UU2QomAv013fddETyNkCjOdls=;
 b=LVS+cfMqqV3yVB4yUPFL/flN/wRVSckzbzBSCI3i3nZ9jsfVZCUPjTV1YiUKA1mrFtWiCcFDjomWoM6jyLGjzaPjyWvn9EmdYxLUHmGOVPHhUbfVkbZ7wfkM0Suq++mI1nywNfJ2C9XI6V848dIVXxRJiNmVmFG0orPwyto9G0TF2qAa9bLtFPyPgW4Y615bZKTVZxWJJbYS/tacZsaVaEWu7UzNL6zCZGViHUHV4gOjjODJRfdKdH3zm9V/lOwxlQOQuMtWGlqkQx3vforg+oobrbUcyOuMTp8tluvyIjJZpmBtYMvY/02hG6rSetVxd0oEak+B0bs22FpymrYVoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by PA4PR08MB6077.eurprd08.prod.outlook.com (2603:10a6:102:e7::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Wed, 12 Feb
 2025 09:27:53 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%7]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 09:27:53 +0000
Content-Type: multipart/alternative;
 boundary="------------VOTEVDFPXGK1v1wq5vxufOW0"
Message-ID: <db370fd9-a390-46c2-bf5b-250110bb0c96@weidmueller.com>
Date: Wed, 12 Feb 2025 10:27:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH 05/30] lib: oe: add vendor module
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
Cc: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20250211150034.18696-6-stefan.herbrechtsmeier-oss@weidmueller.com>
 <0e8a6ac372068e4f9eb73b2170a50cef5e7d8232.camel@linuxfoundation.org>
Content-Language: en-US
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <0e8a6ac372068e4f9eb73b2170a50cef5e7d8232.camel@linuxfoundation.org>
X-ClientProxiedBy: FR4P281CA0188.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ca::13) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|PA4PR08MB6077:EE_
X-MS-Office365-Filtering-Correlation-Id: 98191861-8004-40dc-c5dc-08dd4b4786ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aytobE54RnpMQUhWL09sSzZtZ1M0UDA3YldRZjZaSFZoOGdTV1pUcXpjWE9G?=
 =?utf-8?B?OVZiNUpYemtNcno0RXJtNkZoN0ZnNXdtblRDdWs3L0RIbW9hbzdHakZpbUZs?=
 =?utf-8?B?SFdBSk56RGFaZ3h6dEQ3Z1lzVExPUXJYNjBmeUVrSzY5cHFqeFhlZWFzTmpO?=
 =?utf-8?B?Y2gvVXNXSFBwT0JXelJYYmpUbEcxbC8yd2R5OVlZRk9ZVVRiaGFKVEtRditn?=
 =?utf-8?B?MEZVbzRrMzZFM0J1YXdiRkRHWDdNNFVkbk9PQVhJZzU4ZE8rcXJ0UmdhMjBw?=
 =?utf-8?B?dDRWMFpQalJYRHNua2F3SG5QRFZVTnNhN2FMSzVqYTl6RVBHSThaVnJBVHVO?=
 =?utf-8?B?SzZkVXhXSE12YW1DQzZiblhtZE1tRlE5eGFnUXBSTTZBcXRIeU0vTGx6eU9h?=
 =?utf-8?B?aTJzMzgyU3k5eFJHVXN6VkFzQXlzejFybXRIUG14QW9PZ1ZPSDVvd3NvMGVW?=
 =?utf-8?B?SitzUkFId1JRRFhLWHBFbkt4SFN3dGl4SnN3Z29GV1I5MXZiejNvUlNUZWlK?=
 =?utf-8?B?dWs5VGNCNXFEZmdyQ2o3Y1NaZStwMGRvMVR4aHZvdGtuN1p2bEhycURhcUlz?=
 =?utf-8?B?YWVGeEkwQStEb1ZqVk5Ca3g2QnZIaTZrTE5HODAwVW4vUWRpSnNhU3krVG9P?=
 =?utf-8?B?blBOUWU5cDZGaTUxUDJjSEhOU09xMWczU1V0VUtiYk8rOUhNYXlnVXVFNHEw?=
 =?utf-8?B?S1ZTUzR5ZXNsMmdDNFJyMUpoTXgyajU0Z0poQ1loU0VCbGRNK2ZwSHRydVdi?=
 =?utf-8?B?TWF0V29ZajNiYm1JZkJtZnNCZ09xNWdOUGtzaEgyWEZJcTRmYWkxcTk1Y3k1?=
 =?utf-8?B?WTVLaFZoQk5acFIxL1hXRHluOE01RmdTNDd4ZitIRXJUZGV4QVJSWllxRWVl?=
 =?utf-8?B?VVRXa0J1YTlWL3Z3OWxWR2hSUjZHK1AwdThWdWxocG9MRTZaU3Y4bTRPaFVO?=
 =?utf-8?B?VkxVNit6Zno3UC9qYUxueTNVbXBrY2J2ZjZVUHZnMnE5LzdROGNsRWFHRWU3?=
 =?utf-8?B?dHlOVHZndUJ6U2tmT25pVlRnTWhicUU2dWJVNC9wNnpuNnVJRFNSNEkyUm44?=
 =?utf-8?B?elhUcVpIYU9oMmZGRWpKT1pDRHBKQUpWWlNSQ0x0QmVQZWRYZ0ZyaUZjVW1J?=
 =?utf-8?B?TEJYTmlBMm5sbzdkeHVDS25TMFAzWlUrMTY3TnRrQ1JxSStvVm0vSGlock9p?=
 =?utf-8?B?T3FvVVlldUhYUlNTcXRYengzSSs1cU93OXZiU21tTnMvamF6Rmo3WU1UUVlF?=
 =?utf-8?B?RXV2dm84c1g3cEtOM0dHRCsvbVZtdGI1c0x4SFFBRHFqOFpNV3EvZEJKRFF0?=
 =?utf-8?B?WkIzRTNUMU8xNkdzNEx0bVhJT0xDNUxyajlSYlU0UzMrWWlkQ3dWUFhqOTRt?=
 =?utf-8?B?K3JKWkpPRXdheUV0RThKVUlzYitSamVXamZLeDNuUFRHajRtVTB6aCtuKzFn?=
 =?utf-8?B?REU4ZWFoL0svTHlUaWl1RGovcTUrYXJJK3BMa0VJL3BUQTZNMHV0TnQ4a3pr?=
 =?utf-8?B?V0hYWXFpdmtPbTdyczZUSTdwY1dtNFZKTnBGVEF1K2FsTjdnbFgzeEZ5NEkx?=
 =?utf-8?B?bUpjQjl0L2R6cEk4bUY4dkM1cHFUOG5lWjY5VnZ4VllHTmE1dkNjb0JQV0lC?=
 =?utf-8?B?ZElJUHNCaUFzOEk4UlZINHl4NVhncFA4R2QwUXdWN2NKR1drTzlrSTM5ZEdU?=
 =?utf-8?B?ckFNcWZKTkR6VUt4NWNKL3JpVmhkaHFZVGtJMnRHeDZzYSt5RVFGbDVwdFo2?=
 =?utf-8?B?b3BQcVNaYXhHb2tsdmZuMUpKbGUvZTBZMTF3cUFOOEsrU3hrZzhzZjAvNi9h?=
 =?utf-8?B?akhPSmg3Mk5lQmlJdnhJVW5zekkyMy9aU1RDK2tncmFKWWV5N0xxN1pHa2ZB?=
 =?utf-8?Q?/LFlktkoSkYf4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(8096899003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YncvL2ZkYXJKZmJZSlJncE1jeHJIYThsUlhFdy9SQ0MvNEpEdnBMTnVtVXZP?=
 =?utf-8?B?TTBzNjFNNkpJV1QwQ1BVdWtlcHRmRFJxeHB5WWpsMWIvNFlxVHpsaHZ0cGFS?=
 =?utf-8?B?VHhONDJIdmRqWmlxRVVvUGN1ZU5BWFVsWXNKTEY4VldkQ0hwVEFUVmI3VUpJ?=
 =?utf-8?B?dlhRbFRGMHdodExjdGpZRUVDa0laR3VnSDBTd1FHRkRNQmhEU0Y3MU91RHVN?=
 =?utf-8?B?NXFwYUtPTHc5dGxwY2pNemRSSG94Q3J0UlovNWRrb2tCYkFkMjhkOURuei81?=
 =?utf-8?B?YUcwdmJPS1NKUnN6T0JaSmt3SkZQMTlLdnc0bEVOZXJabE5QNjl6YytJeG5m?=
 =?utf-8?B?RkJLVjVnd1ExTGVrQ3VEMVREeU1oL0creHdaZ21jVE9TVXRhbmRTMEZzMzBq?=
 =?utf-8?B?OG0vd2p3c1NkTXZacTlUTko5UmFKZUp6NFZtdjNNaU9BVE94cGhzR1M5ZlBO?=
 =?utf-8?B?bGxsaWtkOWZuaUlIM0FHNTZoVXZ2blg4QkE4NVVCaEVOYlAxZnpxbE9iRTBK?=
 =?utf-8?B?T0ZlNnhIWVU0dUhSRVk4MGlrVitOdDJ3RXpEdUxnOUcramg5UndzTkdqREdn?=
 =?utf-8?B?R2ZuQ080aVl0djJOU2VMWWVrZVhTeTVlN0ZBcW5pYUd5VFZINkx0SUhZSzJa?=
 =?utf-8?B?dXkvd3VqS0FHQ0traXRDK0d5cTBvczg0YTg0MWFrUXF2anlKY0o5Rnp1QUcx?=
 =?utf-8?B?SXNDcGhiaWFWZFloOWhLQjU2VnFBU1NvYWhwZCt0UjlOY1N5a3lIelRZejRw?=
 =?utf-8?B?NFZWL3RKejhlZzlRUVhPNkNpWmQxbnlzNUlyREFhVEc3U3BMZU1DazFyb2dH?=
 =?utf-8?B?YWdYUzNGcTU3OHdJR1NHaUlRaVJBdWtEMy95WFhLTWlXY1QrUkNvTzkwd0g4?=
 =?utf-8?B?UGdFcUJBTkhnTFB2amZwK2VMdlgvaGlsQU55L2dCRkcyVlhRSG5CTzV4czdV?=
 =?utf-8?B?UjlFUlZQbTlmU1h4TmErQ3VORUJkRFloZlY3UDVSMGpKaVgzaGJ0b3N5OEgx?=
 =?utf-8?B?elU5WHFJcFZIanFvU3FuZy9EdDNGYmxnZHlqYmpYTWZHTW9udkxYVUVDZU1z?=
 =?utf-8?B?RWhrTXBxSFBQSjRadlFZR2VxQitHZlhuM2JXTUp0K0lVOUYwbDBFS2ZtZ0FP?=
 =?utf-8?B?WCtWSGt0bWwzTmVZdkNFaDNjQUVza2FBdHpxTGxGK1FnYUlVYUEySG9OYUwz?=
 =?utf-8?B?UldUZVBSRENrUTBzV3h5RnNZVmxUbWRYMHJ5VmRTSklpUnBiNmhrTzg4QUgz?=
 =?utf-8?B?YlVHVGg2aVh6MkJGSzNsUzN5TDNwYnhaUzhiRmkxVHFzaTAyQ3hyRklDamVs?=
 =?utf-8?B?ZlJ0cEc3QXQxc3RJVmJQZ25NQnNCY3kwajk0SHE3UUZ6MkdXbUNZYWt6ZHBP?=
 =?utf-8?B?eU9QUzhBUys0ckxobmZ4Sk4yaWdSSjhld2ZhM1RjMlBQZkc1bEJYdWFtZVJI?=
 =?utf-8?B?UGYzVnNaZWcxSWZKRTUrM3RrMmhHQlY3amcxZVRkcWRtR3p0czRtb0lmNXI3?=
 =?utf-8?B?NGJ4Q2lYVENOdG5Tak9DN0l0UE1HTmp5V1RRbGV1ZEhBdkVKVGdIMGJsM2ph?=
 =?utf-8?B?UEdYNDZuQlFvb2JkZCs3aHZZem9mUGFqQVdrSEFla0l3NkRHZ2hZRWtFZS8x?=
 =?utf-8?B?WngvZnk1OFFBVWtzWnk0RHNyNHpRQm9lY1hOSnRPYWtxUGg5aTRXMzFDZzMz?=
 =?utf-8?B?SG9lK3VvZnpuM0g1dHZpUHBzM3pQaXMvSTV1RmMwNTJJQ1VzMkg2OWw0bXgx?=
 =?utf-8?B?ZnpncUtRbmUrZjgyMHRRRGVWWkh4aDdZTk5qSjZxS0lJalBFNjErMTIyVy9E?=
 =?utf-8?B?aEtWaGt3VURBSmVRODRtMSt6aXQvdG0xOEIvOGRUWEpQZWdXeDlyQW9HQ3h6?=
 =?utf-8?B?cld1TDNYUmxWdTc4YnQ0SUU0bTZHQ3lTMEZuZHVaQ1RIa3p6dmF2UGJPbEdR?=
 =?utf-8?B?NFI4TmRsRjJDeDdoNU1XdHByVUZOMTd3UzI3WnVSdEhsdFZLWXBiakVNVWQr?=
 =?utf-8?B?ckpxTXU4ZHNSOTJjdmduQmlnb1FVbVhVNXJqUndONkFuQjltWm8yZFhsalpZ?=
 =?utf-8?B?Y1F3SXBueU4zR2Ftc2RmQi9qN21RUHF2dnFlMHdvYVhyZGZsVDVGR2JkVnN0?=
 =?utf-8?B?L3ozS0t1SmJHM1BCQ1FaQ3NtY20vSlRVMnVpSjEydEZueVZvRHJSeFFsbU4x?=
 =?utf-8?B?bVE9PQ==?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98191861-8004-40dc-c5dc-08dd4b4786ba
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 09:27:53.3295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b0zkQQmveUVJGVvfhGZqT27Q8TsIfo6kxZkeq5HY2hjA1EnIpqHcs76PfIQoYOYlpDPSz10aG33PiEr8tREegA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 09:28:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211214

--------------VOTEVDFPXGK1v1wq5vxufOW0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Am 11.02.2025 um 22:31 schrieb Richard Purdie:
> On Tue, 2025-02-11 at 16:00 +0100, Stefan Herbrechtsmeier via lists.openembedded.org wrote:
>> From: Stefan Herbrechtsmeier<stefan.herbrechtsmeier@weidmueller.com>
>>
>> Add a vendor package as base for package manager specific
>> implementations to resolve dependencies and populate vendor directories.
>> Add common dump and load function for SRC_URI files.
>>
>> Signed-off-by: Stefan Herbrechtsmeier<stefan.herbrechtsmeier@weidmueller.com>
>> ---
>>
>>   meta/lib/oe/vendor/__init__.py | 28 ++++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>   create mode 100644 meta/lib/oe/vendor/__init__.py
> Initially I was going to ask there to be a "fetch" or "download" in the
> namespacing. That then made me wonder if in the interests of clarity
> and namepacing, these vendor classes should go into
> lib/bb/fetch2/vendor in bitbake?

The package isn't limited to fetch / download. In some cases it populate 
the vendor directory and could be used for the license extraction in future.

I think it is a bad idea to move code into bitbake which isn't used by 
bitbake. It will complicate future development without any benefit.

> I appreciate the class in OE will use them and separation into bitbake
> can be a bit awkward but it would mean we don't confuse this with any
> other kind of vendoring

What do you mean by "any other kind of vendoring"?

> , it becomes fetch specific and it places them
> alongside the fetch code, which it will need to remain tied to.

It isn't fetch specific. The modules in the package parse lock files and 
extract it content or populate the vendor directory.

> I do feel we need to namespace them though as vendor is not specific
> enough to be directly in lib/oe.

I chose vendor because it is the common name in the package manager to 
create a folder which contains all package manager specific dependencies.

--------------VOTEVDFPXGK1v1wq5vxufOW0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Am 11.02.2025 um 22:31 schrieb Richard
      Purdie:<br>
    </div>
    <blockquote type="cite" cite="mid:0e8a6ac372068e4f9eb73b2170a50cef5e7d8232.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">On Tue, 2025-02-11 at 16:00 +0100, Stefan Herbrechtsmeier via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">From: Stefan Herbrechtsmeier <a class="moz-txt-link-rfc2396E" href="mailto:stefan.herbrechtsmeier@weidmueller.com">&lt;stefan.herbrechtsmeier@weidmueller.com&gt;</a>

Add a vendor package as base for package manager specific
implementations to resolve dependencies and populate vendor directories.
Add common dump and load function for SRC_URI files.

Signed-off-by: Stefan Herbrechtsmeier <a class="moz-txt-link-rfc2396E" href="mailto:stefan.herbrechtsmeier@weidmueller.com">&lt;stefan.herbrechtsmeier@weidmueller.com&gt;</a>
---

&nbsp;meta/lib/oe/vendor/__init__.py | 28 ++++++++++++++++++++++++++++
&nbsp;1 file changed, 28 insertions(+)
&nbsp;create mode 100644 meta/lib/oe/vendor/__init__.py
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Initially I was going to ask there to be a &quot;fetch&quot; or &quot;download&quot; in the
namespacing. That then made me wonder if in the interests of clarity
and namepacing, these vendor classes should go into
lib/bb/fetch2/vendor in bitbake?</pre>
    </blockquote>
    <p>The package isn't limited to fetch / download. In some cases it
      populate the vendor directory and could be used for the license
      extraction in future.<br>
      <br>
      I think it is a bad idea to move code into bitbake which isn't
      used by bitbake. It will complicate future development without any
      benefit.<br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:0e8a6ac372068e4f9eb73b2170a50cef5e7d8232.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">I appreciate the class in OE will use them and separation into bitbake
can be a bit awkward but it would mean we don't confuse this with any
other kind of vendoring
</pre>
    </blockquote>
    <p>What do you mean by &quot;any other kind of vendoring&quot;?<br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:0e8a6ac372068e4f9eb73b2170a50cef5e7d8232.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">, it becomes fetch specific and it places them
alongside the fetch code, which it will need to remain tied to.</pre>
    </blockquote>
    <p>It isn't fetch specific. The modules in the package parse lock
      files and extract it content or populate the vendor directory.<br>
      <span style="white-space: pre-wrap">

</span></p>
    <blockquote type="cite" cite="mid:0e8a6ac372068e4f9eb73b2170a50cef5e7d8232.camel@linuxfoundation.org">
      <pre wrap="" class="moz-quote-pre">I do feel we need to namespace them though as vendor is not specific
enough to be directly in lib/oe.
</pre>
    </blockquote>
    <p>I chose vendor because it is the common name in the package
      manager to create a folder which contains all package manager
      specific dependencies.<br>
    </p>
    <span style="white-space: pre-wrap">
</span>
  </body>
</html>

--------------VOTEVDFPXGK1v1wq5vxufOW0--

