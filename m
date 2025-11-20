Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E70CF8859
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 13:25:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34104.1763645110654939683
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 05:25:10 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=AtOLX92F;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=341909d004=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AKBNqqC003448
	for <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 05:25:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=JHOaICuTku11TtjV9Wkx2skn3wwdyblhg8Iws2SEW1c=; b=
	AtOLX92FWlKEHZebxgAqk9EBicF35JsYl5eC6ag1jfcaREW+nHAtHZiiX7W6ushB
	2x5XRHhIjVY1tZJQurNksQNnS+k7zxJChgJwYD2dLLXqJLoEZu1frEzrpLzvk2Is
	PspdxoT8/ISUUgJa0cO793mNqYFknv82kNnD1+Qwqpe+gXQBrbxlBEyasNqXp3F+
	T8Lt7Jjal6t9OuBR8nbuFcx6Lz4f82AhslPjapK2NaZlUJBm+bYMp/ydZ76rCu6d
	8Gragq2sezlnTtqW4MVGJv9Ho30Ccl5LqNi20ZBrntKB8i7BitX4k9ZiNa169I0c
	RQjjKb6Rp0t6i7+YCXZKJA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010046.outbound.protection.outlook.com [52.101.46.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeswje81v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 05:25:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FcngAIU1MdT9tZynYsjy1GkBXsY/Ywao6ZogRvtX7SyXIWF3C+Caf9OE7WqEtitHRHQ1ochZUvKp3avRU7hqcf1l5f/CUYI56AmkjcSVzw/hrD8IEJCV8FALPqX4tHEjQzPtwD1rV1y/PsqLUkjhmNlLAGnP+NJ6GdNkPyGKIF6su68djdLaW2ZTH+aTK+0NtS+tNOKu+u4ygmn8cTTUqQHf7Wf+r4vNg5W4O1XfZMW7NI8KnVO9I4HPg+L8INbR85BWzST6o/NrzBofjN7eR1gRRnPB2W+uLNMMinhdg9IQuTEXmRwFuumIcpkqUIEtpXaFr8lSM7MdxQU0CCbPBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHOaICuTku11TtjV9Wkx2skn3wwdyblhg8Iws2SEW1c=;
 b=dyLsVPOG6u8HORV+uJLvHRwwuVZawsH+ulHbKY9LVpzCHJqjUImIZHg0AdZs2niDTfqPm3h+1Hi9aQHzNy/ODwOn14ehrsVK4QOPqCQkFg4dUs7K2swuK4P/1qy6q91Zvz77BTr2pNADNHf49x6Wp5vaR+BO5JdjRP7oNLmIIzkokhd++zNGlv1aL/CQlfebFDwoktTUF+hLCYwdFuMUVMPr9Mv2cYaVE3K+WcFsPLh9TWUHCplfMuLXw86zNBju+AocFRFXX95frC+1Mm0JC+h44CzfF1IOCZWZ7aOj83r7B4uKzFm1u8AgvwQuGv1gJNOMiSrEfhGb2lHC9hZfeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA1PR11MB7295.namprd11.prod.outlook.com (2603:10b6:208:428::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 13:25:06 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 13:25:06 +0000
Message-ID: <eb737f16-1b9d-45c2-88d2-dc18b3621ce9@windriver.com>
Date: Thu, 20 Nov 2025 18:54:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 07/11] linux-yocto: enable Rust support in kernel
 configuration
To: Randy MacLeod <randy.macleod@windriver.com>,
        openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, elmehdi.younes@smile.fr
References: <20251119164804.256364-1-Harish.Sadineni@windriver.com>
 <20251119164804.256364-8-Harish.Sadineni@windriver.com>
 <498559c1-64f9-4a9a-86e1-2bcaea5bae40@windriver.com>
Content-Language: en-US
From: Harish Sadineni <Harish.Sadineni@windriver.com>
In-Reply-To: <498559c1-64f9-4a9a-86e1-2bcaea5bae40@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0036.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::20) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA1PR11MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: efecf58d-ff58-4e8a-bf19-08de28383824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RmRDbzgrVk4wWEZzcTJYT21TVGxUREVxczFnSFM2SVJLVTZYSHFzNVl5Q3I2?=
 =?utf-8?B?MVhhdXdzeGVtNkM3RWdZMG9MZnY3dHFKblVPcndsTlBadndLckIyYWZPVzlS?=
 =?utf-8?B?SExYK2FCZVRob2Z6K215MEF0Nnl1VkZWVVBxd0hZdGhhaFpidWdoL2pua2V5?=
 =?utf-8?B?S1V4c1huNG9YdGE5UVF3dXBNS1RDSnptTEtqWkFlS0xLdEtCZnQxeWkrL2ly?=
 =?utf-8?B?T3FHcitCZVQxdit5bHFHa3F6Sk8rc0VKcWpBTEE1cDVFSkY1cU11SzU4cnpy?=
 =?utf-8?B?UUNXa1ZxMktXc2JMNXZhdC8ySGtBMnF2V0RtZzJtS0RCY3JsRkxxbEZHN28r?=
 =?utf-8?B?Qmt4eVZNdzZndFlJVWs4dlRSK3VkN3BBeXY2T3dSM0RoVlp1ZHlBZ0Zhd01o?=
 =?utf-8?B?WW8wcTRTeFlXeVVNV0p4QlFCb204R20zMlNhWDc0anR2MTNJRmkwcjdxRC9O?=
 =?utf-8?B?OUtzVnRIaVd5YmQrSmF6Y2RHOERsWHVHOWNjOWpMOUNocUR2aloxV0tCNUJw?=
 =?utf-8?B?cHlLNXVHMEMxQktudDh5L0xhdUtacURsS2lWUk82cGxHRVRPMTdtTXBKSTdz?=
 =?utf-8?B?Qnd3aUlDV04xL0Y2bTBDWmkwZmF0ZWRhRllLTnR6UHRXVGlmZFB3bUltMmtZ?=
 =?utf-8?B?d3hyVmkycTFsNG91ZWJhbEJnNEF0QTExUHppaHE1eE96eEk4cGtodUpkYUxO?=
 =?utf-8?B?OFg4b1dRa1pPUVJUaTNaUGMvK2N1dGh3eEd5WFBaTWwyQ2R1L0d6ZmJadmVa?=
 =?utf-8?B?WVZwSFlYVmFhQWVLbW15WGhFZitScHRWWmxzMTFPN2ZudkxmQ2llNGh6a1F5?=
 =?utf-8?B?V3B0WVFjTk1TU2lwdGVGczlIcldtTmNVUytrSDZIcnNTVE5RaUtJODk5Rmlq?=
 =?utf-8?B?VTNFTmQvTG1LdmNyYmhwS1YzZWpybjlGL3FyVC9qaWVzUmNINGV1aFZQLzBu?=
 =?utf-8?B?ZFJwdGdrR3BhTnJsY1gxa0xadTVwOXlLMjV5bkpGeldpMDc2L0FXVXZjMzVv?=
 =?utf-8?B?WFJXVk5odkF1aWVOanpzbTIxN3BBZm80Sk5LczdKUTUwcVpiaW1zbG9Ncldz?=
 =?utf-8?B?clZVSmRlZVJ3UytEY0o2U0FaSk9PUWNrMHRlY2JHdkU1TE5EL3AybWowYXFT?=
 =?utf-8?B?a0diVWlpcVZXNk4xRE9VTEFhSlJqUzlSL0ExdWk5Y3RlN2lsL0MrbzlKYjQv?=
 =?utf-8?B?ZW5JczVWNUZhRENWTzJJSnJ6VkpJWVVMYXpXUWkxeDdFZUF2WmFaTnlFZFZm?=
 =?utf-8?B?dzd5bXJEY0Rva3djak04ajd0YXJ6MGNqVEdZZ2NJaUZaUzg2OUlGdktlNkhj?=
 =?utf-8?B?dmRGZ2xVVVVoZC8rdG9PQVdSbFcrYnZFRTYxSTF1d1QxMUpURTlhaFIwZkV5?=
 =?utf-8?B?bnNZdGZRbTZaY285RXptaFFDRHhzQTRoeGJuWW9lQjdoT3E5d0FtR2hlMzQv?=
 =?utf-8?B?d0lMa3JnYzlvMVNONFNPZUcrd0xMMHZRNkVnNm50Lzc1NENpczBXaUIxTVBU?=
 =?utf-8?B?V0p2TzRMTm5SbEczQlc4akVWN3NVamxCZWxTTmE0anZvblFXSy9qQ2ZvUDdv?=
 =?utf-8?B?bnY0dURjdExXR0hSU2ZCa3V0QXMzZ2hJNnFmbEdFOWp6YWFGY0ROK09uN0ZB?=
 =?utf-8?B?S0lDTG1TQXNRcjhNbzZkdlNNQ3pPQzVUdFF0dGFNazVOVUpOZXhBaGxqb29n?=
 =?utf-8?B?dG1LeTM2ekVaaFd1d3pvVkI3QmZjWFFPN0h1bkhrbU5LNGthYWpYeDdYTlFY?=
 =?utf-8?B?N3U1UEo5N2dETFd5WjlYM3BkSnMyVC8yb0NDaytSdFFaeWw0VDdZVTFnRG5m?=
 =?utf-8?B?SXVWSjQ3YmpVeFE0eUpBa3dMQ1dBb0pDSi93dXRqZFFySGJIRElLVWdJRlQ2?=
 =?utf-8?B?NnVZdXBzRHU2SktrOXNES0llWTI3MmhGU2FTT014akZ3THo5TUxoeEhVYzFj?=
 =?utf-8?B?UXp5cmhIejYvaFpxcUlHOEhQSS9zVUs0bTFMc2tzdEw1ajhYNGQ5Qmw0YWZw?=
 =?utf-8?B?T3ZDRVpEYUxhQ0NqRTAvbnhsMENpUHFESW9CZ25wSHFJanN1M1dlNUhqandG?=
 =?utf-8?Q?pgCZPF?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eVFLZFV1ZG0zQlVVQzF4RmNKZDl2VmRkeG9DdnpQVlhFQ2s3WHpneVdPRVky?=
 =?utf-8?B?ODBKKzRsbFlORlJaMGRobEZIc0p3K25adnFzMzVpN1RjQTFrYzRHcHA4Tjc1?=
 =?utf-8?B?MzRmS2YyMXpBU1ZlOW91MVFvOTB3RExPN3VMaXk5YklrTXJMRDBwTnB1STNY?=
 =?utf-8?B?RWFiTk54MzFDWnhwUXR1bCt3a21YZWxiVVM0MHI5a0VyZEFhTXJyWUg2Q0xm?=
 =?utf-8?B?YUFMcGNnbmhJT0xlZFRTNHRjRFltbWR0OENxRkE1amVvVGVRQVRJOHhPd2w1?=
 =?utf-8?B?Q2hkOFpCRWpTS1dYa3JXUFRIZmVuZUtEQWFqQ3BpOStCY2JXZFh0TGZRYW5F?=
 =?utf-8?B?Rm54RXF4cEk1eU9qbWZhQUJpUlErZVMydW9xMmV0ZVVQWTZIdjkxR1FMYlBn?=
 =?utf-8?B?c2NjTmI2MGRaeG9qSm5JWDBncmR1T21qUUdiZllGdDF1Z1lQQk43NHpRVnQx?=
 =?utf-8?B?d3hJam0xS3Z2V3FtSU5CUmZFamRHN28xSldDTWE4Z0NUUnVkdlpvVENVOFNs?=
 =?utf-8?B?aW8yWVBrWmt3eDdOZEFYaEZ3N2tMTHBITldjbFZZUXdCdGFzYm5JWnFJYUV2?=
 =?utf-8?B?ZTdzWFY2UUVldnpLeGFKdEVOYzZLTEY2ekpCbncrNFR6SzVpUmtBMWRGV1ZJ?=
 =?utf-8?B?ZE1JSUdUc2JWaE94eENRdlVwQzd4NkdxbE0xWmwwMnM1RVAyd2tYWU42OXcv?=
 =?utf-8?B?N1pldzBTZkdEZHVieTNtbUZFNGw4SWMzRU5MSnJKVXU0cTRhRW5ZSitTTERK?=
 =?utf-8?B?bVRFZTVydkhpMkZ6NStJTzh4WlRFKzBFbmJ2VDBYbGJzOVBQdmpkQUlHaUFW?=
 =?utf-8?B?QzU5L1NRWDlZMFZURFlhbTlTankrcUw2eitMVkIrSXBnUUVHNkxnQy9qb1dC?=
 =?utf-8?B?UWFhWkFTVEhaSFVObStqNmFFbkY3cTFwNG9vTnJ1ZHE1TW9SUVBXSWNvcWdI?=
 =?utf-8?B?QklYaFNuMVI3YVZjZXhKZks0cVhWRDBJeENBUWVoZ3I5UjVheUFtMTRmWEFH?=
 =?utf-8?B?eHV3R2xoclJMVSttbkRaR2NZSUNVSWtiMWJMUTQyQWcyOGh0ajB0UXVHb0ZR?=
 =?utf-8?B?d1laR2pmcTBrYXBtdEYxVm5ickpmbFBPRzRoR0ZiMlREYTVWekh3emMycE0v?=
 =?utf-8?B?TkZnc2pwQmVZN1E1ZWxtM2NadWxIUnNWc1VyemFMOUpveUxTWGU5eUxmendT?=
 =?utf-8?B?d3VVeTR1ZXEwK0JtOFdpejlTWHcramNoUkg0SkhORERFcUpxVWYzYThWNm1G?=
 =?utf-8?B?cXlhYmdGdVVzWHZJOEk1K1AzK2lHL0h5SCtuaDV4emR2THpBRGhvNmxTQWxr?=
 =?utf-8?B?TUp1N3pPNE5iU1pwM2thNmx4RmhvNzk2SytOUHJvOXN1WFYrc1NDbUlCK0FJ?=
 =?utf-8?B?TWplRE1KcS80bUNOUXRzakVOblVSM25PZXlqcytDUnVKVUlldVRGMkRSK01N?=
 =?utf-8?B?STRvY2Z1ellvbmNKajR5NTlZNlNIZXAvSVJ0WHpCVlV0dkZPN2NCSXgrSDZC?=
 =?utf-8?B?b1JROXFRUzdiZjE2cERsNE5ZNmQyR1owK2tUZFg1ZEI4T2QwaG40ZG5Vbm9j?=
 =?utf-8?B?YXFqdkY1VDlrYVJGTzJUWkMyQWJXVXhIYnR2SzhDaXh2dWI2VFBvdllXZVJX?=
 =?utf-8?B?MUNXQXBBdlFTemlKTjlzK2o0ZWlHdnFXb3gwMklObjF2TmpPV0x4ODI2bjZT?=
 =?utf-8?B?OXdabEpjZlZIaS9ic04rWXdiTTZyaHNtaGFDTGp1d0xrSnJBVGpGRHdrTGdi?=
 =?utf-8?B?VVI3Z2xoaFJyUHBSbDdCTkE4b2RhMnBtS1Q1RElCL2VuMnhLdW1mRjk4Nkpx?=
 =?utf-8?B?R1p2Mi9CNzNhS1V4OVQvUXFNa3JqQTdZT0poZzgzS2pubjZMUFRyM0toUDRV?=
 =?utf-8?B?eW5pOXJjSmlYMEdkdzZsdzRHdVRHbnAzZi82aDBRMFVKRFdSS0JWS2VXZmxM?=
 =?utf-8?B?bzJ4TUVMVWJYV3RYbkFYYWUyUFh2OVUxcjgyc1hUbmxYK3BVZEZjendtdVlp?=
 =?utf-8?B?c3JuS1RjSzRWNGs2bFA3dlRob005bVJ3T1ZjdnE5c08yaUExUUVDeTlwS291?=
 =?utf-8?B?TVlnUndkRGpJWXMxZFU5SjlSWUxYMk1lVlZQbnE5SmYxdEdMbjhVMks0T09K?=
 =?utf-8?B?S0dXTjJCU0FoTGMxQUJXOFJ4YUQrbkVRL2Y4aFZkcVpRcVVqS3dQbkFxVEJL?=
 =?utf-8?Q?korMvuuTMIQpHkJndVCHAAU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efecf58d-ff58-4e8a-bf19-08de28383824
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 13:25:06.2069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wk6+jSbZ3hsDdD8ow+OJu9kz4DNYnQIzqh2FBKVMTnF6wCUkc+EbMxWT3vGJ4Y7k2c6zQXfBKoNduYXk31DBG+6Mp68i5NdihdjfKO3dBxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7295
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=BqiQAIX5 c=1 sm=1 tr=0 ts=691f16b5 cx=c_pps
 a=BcPl/o76WFXIZ3b3OvynCQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=HhTpv8GAFryYrsyhOcUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: lsO1jHfMkOxvrrYHNUL6-uZWt5PX7_1N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA4NiBTYWx0ZWRfX4fP2e8d+yT9u
 7M3tweLTMKioJofCbVkFE0VpFcsSYsoJEQsmvNZnDu+UWTOwDRuW+am7BY8KDgAorTMUBKQlso8
 Ff/IiLueH8+Uv6HKHvuNtTKJqI3uQ5bqN41gPlujMrYDWDYIgJTSf5cKTxcLEyc/ZJjLnR3cpTS
 bauAGBR/zYhZl4D001V4zqjiNtu7VMqsk/CSWmeARRFfT6lMsq+i4/53UAfrhdJfx1wG3U8GRck
 +5MUZ6nch/IbOvI3jV55DTO13UHzDWI0QCqrWIawhtuaTokSv2zD3NxmQWGrri5EcA+OMLrwYnB
 KCHZE3HPuc4F4dJWy24qznRA2y/nQTwWIBiVH/vSRg8EoVgprxQXsLNkxTfvLbxrubabPnvWk9q
 9C0EMo7MDppGHESPTWjoun3lEZ+CrA==
X-Proofpoint-ORIG-GUID: XEWxjKpIojRVkKdtMOc7Q3hHXru5rWHM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_05,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200086
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5AKBNqqC003448
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Nov 2025 13:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226621


On 11/20/2025 1:51 AM, Randy MacLeod wrote:
> On 2025-11-19 11:47 a.m., Harish.Sadineni@windriver.com wrote:
>> From: Harish Sadineni<Harish.Sadineni@windriver.com>
>>
>> Add initial support for building the Linux kernel with Rust enabled:
>>
>> - Introduce `rust.cfg rust-samples.cfg rust-debug.cfg` to set Rust-rel=
ated kernel config options, including:
>>    - `CONFIG_RUST=3Dy`
>>    - Rust sample modules and developer checks (overflow/debug assertio=
ns)
>>
>> - Update `linux-yocto_${PV}.bb` to:
>>    - Append `rust.scc rust-samples.scc` to `SRC_URI` and `KERNEL_FEATU=
RES`
>>
>> when sending non-RFC version, we will send kernel-config-fragment to t=
he yocto-kenrel-cache
>>
>> Signed-off-by: Harish Sadineni<Harish.Sadineni@windriver.com>
>> ---
>>   meta/recipes-kernel/linux/files/rust-debug.cfg   | 1 +
>>   meta/recipes-kernel/linux/files/rust-debug.scc   | 3 +++
>>   meta/recipes-kernel/linux/files/rust-samples.cfg | 4 ++++
>>   meta/recipes-kernel/linux/files/rust-samples.scc | 3 +++
>>   meta/recipes-kernel/linux/files/rust.cfg         | 3 +++
>>   meta/recipes-kernel/linux/files/rust.scc         | 3 +++
>>   meta/recipes-kernel/linux/linux-yocto_6.16.bb    | 2 ++
>>   meta/recipes-kernel/linux/linux-yocto_6.17.bb    | 2 ++
>>   8 files changed, 21 insertions(+)
>>   create mode 100644 meta/recipes-kernel/linux/files/rust-debug.cfg
>>   create mode 100644 meta/recipes-kernel/linux/files/rust-debug.scc
>>   create mode 100644 meta/recipes-kernel/linux/files/rust-samples.cfg
>>   create mode 100644 meta/recipes-kernel/linux/files/rust-samples.scc
>>   create mode 100644 meta/recipes-kernel/linux/files/rust.cfg
>>   create mode 100644 meta/recipes-kernel/linux/files/rust.scc
>>
> >< snip ><
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/reci=
pes-kernel/linux/linux-yocto_6.16.bb
>> index 2188c7fed2..37cada11a5 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
>> @@ -77,3 +77,5 @@ KERNEL_FEATURES:append:powerpc64le =3D " arch/powerp=
c/powerpc-debug.scc"
>>   # Check again during next major version upgrade
>>   KERNEL_FEATURES:remove:riscv32 =3D "features/debug/debug-kernel.scc"
>>   INSANE_SKIP:kernel-vmlinux:qemuppc64 =3D "textrel"
>> +SRC_URI +=3D"${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', '=
=20
>> file://rust.scc file://rust-samples.scc file://rust-debug.scc', '', d)=
}"
>
> I suspect that we want to pull in _only_ rust.scc by default.
> Do you agree Harish?
>
Yes, adding 'rust.scc' will be sufficient,=C2=A0 But 'rust-samples.scc' i=
s=20
required for selftest patch:
"selftest/cases/runtime_test: Add test for Linux Rust Sample=20
(https://lists.openembedded.org/g/openembedded-core/message/226571)".

Thanks,
Harish
>
>
> This is fine for now and can be fixed once the fragments are merged in=20
> y-k-cache.
>
> ../Randy
>
>
>> +KERNEL_FEATURES:append =3D " ${@bb.utils.contains('DISTRO_FEATURES', =
'rust-kernel', ' rust.scc rust-samples.scc rust-debug.scc', '', d)}"
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.17.bb b/meta/reci=
pes-kernel/linux/linux-yocto_6.17.bb
>> index 5d10a17e70..f63405a3a0 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_6.17.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_6.17.bb
>> @@ -77,3 +77,5 @@ KERNEL_FEATURES:append:powerpc64le =3D " arch/powerp=
c/powerpc-debug.scc"
>>   # Check again during next major version upgrade
>>   KERNEL_FEATURES:remove:riscv32 =3D "features/debug/debug-kernel.scc"
>>   INSANE_SKIP:kernel-vmlinux:qemuppc64 =3D "textrel"
>> +SRC_URI +=3D"${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', '=
=20
>> file://rust.scc file://rust-samples.scc file://rust-debug.scc', '', d)=
}"
>> +KERNEL_FEATURES:append =3D " ${@bb.utils.contains('DISTRO_FEATURES', =
'rust-kernel', ' rust.scc rust-samples.scc rust-debug.scc', '', d)}"
>
>
> --=20
> # Randy MacLeod
> # Wind River Linux

