Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AED9C001DF
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 02:24:45 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5811.1691029475397051262
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Aug 2023 19:24:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GP/oEHiB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7579fb91dd=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37323OYu023624
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Aug 2023 19:24:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=message-id:date:subject:to:references:cc:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=
	PPS06212021; bh=GxKvhThmtJZgYXzxjWkUzybRDPvBk/9hofcXMBXgaqQ=; b=
	GP/oEHiBNfHP24WjiwIdTg+CMcelz8bMnIjWIZy1+o54Qx+SK/e/XAyqzGuaUtZb
	0yxoGZW7YWX55qKzSR1FLXYYPLcHMwGWC+rFG9FIMlDB6FFEc1FUJOTyy1ZRnfRV
	YDkOf0PBr3u/GM0YhZgZYgW547wFeZNkmicrlz+QW3SQ0vfcWGJcX7gaxhNfA7sO
	35beVfwDSlH6WvTBXLv95Y3wD5cFO2N0uCzuWJVZP4CjcOCX3i42ND8Jx6mHMO6I
	ihZ47Fb9WJVz5eLIxUX/0j7mlwjtgnZPRFz2ZT5/axer1oIEcxMmZochVnPySmdH
	zTFyOcbwfqwMwj8fgcX+iQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s6daqtrc7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Aug 2023 19:24:34 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.22/8.17.1.22) with ESMTP id 3732OYii029360;
	Wed, 2 Aug 2023 19:24:34 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s6daqtrc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Aug 2023 19:24:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EA6bPt94Bsh8TBneN3BZ6tdLz7R45SZ0uy6cT+HoiyJw5tEUpxeFp4ahuZa76wD0mtvgrVCm7EPFljFlQBPouceLQzxV/7XdJASlf5Z6whAJ9wG+SDNYeiFhSOybLRhVu4TRTrkGwTvfP7k7ojzds6IBahUXyUQ2czbkRMYRD81AjsNjdFvVAntok0fjwEs4WEROo9Tk5Xf7vVK4rhQP5GN12YfwhbCn0+zFWQGALqtGYowcdi8ACn6Y3iifZ3C7RHodf3AtgwSSAeQWuL/FM81JX9pdiC1f54U0PkrK8nPy88kNn61ZjEdII2Kw4jBJlQHcdVH3vbZptQGAsrQK6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GxKvhThmtJZgYXzxjWkUzybRDPvBk/9hofcXMBXgaqQ=;
 b=KH+Q6JycykwkxE8KlTwu9YV9cNP1nkJuc0fncW+vEiiFERLWcyapOTbSSgK4hSgZ/Y/8KJ+HlPE3T7n8zjYR7TSfn3oWvWE+thaaJvjBCwfmIWOA/35Pu8QYeiJiecRYV6AOrqd+qQGcOZHkwLz43weEWd5YXZhEUaWLIV99adBRNnAUUWc5iBPZ8G9hAHn7HBkJD1mtQwtlSQdzD73J84j4CVZwi5NIKLUMexbvNQ0nI7EmyqKEvTZHJl3ECpvx6vyDDNaN0faavwDzqw0BtxbwfREx93xZGYQbUmvMzxYYDCR9wtelFlf+bhpnS5UDY++TUnEgYf4Y5K4CDjATmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SA1PR11MB6821.namprd11.prod.outlook.com (2603:10b6:806:29d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Thu, 3 Aug
 2023 02:24:31 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1ba9:4bef:c1a4:306]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::1ba9:4bef:c1a4:306%2]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 02:24:31 +0000
Message-ID: <26e6db4b-10d5-0db1-c442-ca318c58852f@windriver.com>
Date: Thu, 3 Aug 2023 10:24:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [OE-core][master][PATCH] bind: Upgrade 9.18.15 -> 9.18.16
Content-Language: en-US
To: steve@sakoman.com
References: <20230627063200.12025-1-sdoshi@mvista.com>
Cc: Siddharth <sdoshi@mvista.com>, openembedded-core@lists.openembedded.org
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <20230627063200.12025-1-sdoshi@mvista.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0150.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::30) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|SA1PR11MB6821:EE_
X-MS-Office365-Filtering-Correlation-Id: 01392532-055c-417a-fc35-08db93c8c4f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CruH3Aef9SQx0U+SGSvRqJJcn0u+8pKUj5eqJ5XJUjRFh4FttFqBGYowVniqPpzgt8Xzobon3ZKBy94Cxr/HBAeBd1rP/PAcNbsNMLqq3A4jscedwnRg4Q0sVgxwFP+zO+i/gzz4mYQE7IiNgboeZBk4zmw2z4sMKTfT5invzNxLA4qh4S01MSIMYiTkmiUqgfgwWLIi0OiieLAN7P5hYXbTkKv3U7J09bEpBuHWTybH3VHVy0/JDQP14vVZW+DOCe4EXFGUzRvBlqKVRDBGgLpIMtAtTJwIynfDEnQOpBcC4LxawV+f7ht+Mi/efQzESmvjvcix3XQcKlVg8T5bQwFzFbjgSocvia/1DEGBj31AYwkjCk/ViFrhMaNtxEORvF98k+g5nZHV90Qm1JmTzPTISk7kZH+izV/tEQMuWCNXG+7Klz36ycYQ/oOJRDFAulJ6CrxqapTq6nvSWV2VEQqCk3e+8F7ypycm9DTjkgsP5W7N0dl3MFQ3GowmoOjmoOKq2uYvQXSSuC0GJHIrn9SvIvj352PXD7KWY2uF2SKZ9RPu2rwXJWbOUiMYTq4xDDSq8fvOGvxl8IXJODxhCBrGZ05z/u0HlLBtC3Wsx73h9Lr43D77CbHSLuObj0axR3qwVhHxFxwfuXFLAMspnjFRI+5EXe1vRzUBAYbPhim6kQy7oGjbu45FwyidPmHh
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39850400004)(376002)(366004)(396003)(451199021)(8936002)(31686004)(8676002)(6486002)(478600001)(66899021)(6666004)(6916009)(66476007)(316002)(66946007)(66556008)(4326008)(83380400001)(6512007)(966005)(38100700002)(41300700001)(186003)(6506007)(44832011)(26005)(5660300002)(53546011)(31696002)(86362001)(2906002)(2616005)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TFVOZDUyRFBWNmgrYWQ2eGZjZk5BRTRhZnFvckRtMmxkWlB2TTlRRkJWOWMr?=
 =?utf-8?B?SGZtSzlNOEx6U2UrS1ZJS3ZoWnQzeEZ3ZVl2UXBNNzRqVUdmL1RkOWxiV1lw?=
 =?utf-8?B?T29vOGtrc1BIWWs3ektJU3hTeXh2V2tTTitqR1BhVjBNeDZlWTJMMk1pL2o0?=
 =?utf-8?B?Ky9ZVlROWkM5ODFreTJ5d1hTbXQ0VTlZQlk3R2Vva3lzdXhRdkcxRmxTL0d6?=
 =?utf-8?B?Z2IraGRtalh3ejJXcGl5RVNjbkkrTDVFVGxVOStmeTJxMStjNWlYdEtyZTRC?=
 =?utf-8?B?djFJVTNTQzk2bnNZMlNPeCtjb3BSYmd4UHdsRUQrYlZDNFB5QWlUOEE2SEFE?=
 =?utf-8?B?MXZKU3pnMWZZeGZFUmVoVjRTZUw5SGNTUnB1d2lBUEVoNkt4b2w0anV5Wmd2?=
 =?utf-8?B?aU5wT3UydVMwT1hVOFhnc01GVjhrOEg2MXBuRHp4dFNTVDF2UVF6cFFuY0hs?=
 =?utf-8?B?RHdjdEdRUU9DZFBjWVhaRU55NVZaMTJlYms3YXlYUmFydFVFY0QzZldVeFpQ?=
 =?utf-8?B?cWlQa0JsWWhDaHdFbUkyVk9EOEhCV2QxY200WlZWNWxMT1IydXAxTW5mczdj?=
 =?utf-8?B?YnU1bS9GY3NSampibkZFU3IvUDB3V1lXQldVWDhielNEZEhRMFNQeitBSUtX?=
 =?utf-8?B?WkJISnEyaXg2SVBWSDhqQ3pockZ0cldoQlIyd1dnNU1VMVI4M2RlMlJ6ejE0?=
 =?utf-8?B?cnlNNzNpazlLWkpoNjIzRjdub3F2TG0vWGZRSE5ZWCs2NmZKckxJUkU5NDlE?=
 =?utf-8?B?L08xRjFFRks3QitZRHNnQXB6MTgxS3VYcnpSMk5hbXNWSXVkQ3FjRHdRdWtI?=
 =?utf-8?B?QXFFODhsSUovMlo4dmtaTGV3bytrcThJN2RyVzNOT1o1SVBMeldGTkJuT0ZW?=
 =?utf-8?B?Mi9BWFRLYkh3eTFvdzhaV0x2L1lNMmVLUTMvNDZlOWNoWUJaWlErMzZkMll0?=
 =?utf-8?B?SWdKR2V3SkpNK0VZOEtZVzFkcWFPRFB3SXBwbnNKRmZkRHZHZDB1QXZBUEJk?=
 =?utf-8?B?c1hQSElWazg3YzV6c0piOGdnSVhSQnhUWG91Yk9lVnIzY0E1bkxWbnZabFQ5?=
 =?utf-8?B?VzNNUHZYSkNxMkthVDdGMzlURkU1UVF2SEVPS3JsbjdHOHM3eTBtbXNqbmFQ?=
 =?utf-8?B?NnUvU0IrRVcvNWQ5UWVvY1RpRGIxbnpVcmdMd1Z6d2FmcjMvQ1VvL0JoMzU4?=
 =?utf-8?B?Zkc3Q1VaNnZSSUV0cmRocnU2OVZGUlVmbHM0MktJandFdEFGZG5yYWxyelpy?=
 =?utf-8?B?STZBbVA4MHc1RUZkdzBYQ1dsYWIraXJCNXFTNjY1blNNWDNRV1Y4Z0NsbjlB?=
 =?utf-8?B?emNKVW56TFRPWlVqZENJdS90SmUrUGFPRFgrcXBGZkMvQmVvT2RSZTJsUjNK?=
 =?utf-8?B?ekJRZW5XeUM5RnhLVWlhb2VlZTRwTEVlYWs4MjFUR0VRWTB4STVwYkt5RGNz?=
 =?utf-8?B?d1J2NGpSK2R4N3RoVWtHb2Izd2RaakpkRWR5SVNHRzN2Qm5kdVZ1TFQyNTZL?=
 =?utf-8?B?aW0xK2xwUmswazIxcjNtOW10T2l5R09IT2pGTFFwWGJuaWdEaGUvSDJqeEpY?=
 =?utf-8?B?SHIvTUtLaUNBbWdQeSs2eHB5MWxhUlg5R0srcTYxeDJBNUNNb2w4V1VKUk9T?=
 =?utf-8?B?UGhIb2tqRkxXdmVtV3dlOXJwcHhnSHcrb0NQM3dRQm1nVXd0L0hoQmdyOHBu?=
 =?utf-8?B?UU0yNitmbWhHc2Z3SnVlbDBPMUExOU9nL2FXKzRZY0VIWGlWZndhK1Jad2E2?=
 =?utf-8?B?ckFvL1JTdHIra3ZnQk1WeTVlYUxUbmtCQVpoVXdDWmZEMWg3cHJLeWc4WHBu?=
 =?utf-8?B?VFJhaTJPU2NQM1U5RmNYd0d1NTJmVVpTSWx6SGZNak5lajYvSjVVK1Z3OWRW?=
 =?utf-8?B?d1VPdUZYVnBxd1p2bzVzUWJKeFViOWoyTW1sNkpFTis2TEpPbXBZcVQ2ZmFZ?=
 =?utf-8?B?V1BSZ0kwOXQvdjh2RHA5Q3VwSFc0aTUxRHZKQ3lHcElTTGhRTlduNStBQ3p5?=
 =?utf-8?B?OWR4Um9wRklpYnlqRTl5RDdrb1FxdE5EcTc5ODFSTkc1Qkx5cXZFRE91bCtY?=
 =?utf-8?B?OXMrSDYzd3RpS2dZTit2ZE05VGlwQ1BBR1FFVjV4bW81dlplNVZxRXR0a0Mx?=
 =?utf-8?Q?ipznKIxMDNTPrijBP91UzddDp?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01392532-055c-417a-fc35-08db93c8c4f9
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 02:24:31.2662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SbIbDA61mEsVj2b8OIrnIihRmWZtSwX7lUivZ0RL3Zugn6213JdRSx4MwlDhG0JnxmDsQujQliYaW3WLNxKsRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6821
X-Proofpoint-ORIG-GUID: Y_y_LCV0oHN652rUymRiRt6b-WDAS-jg
X-Proofpoint-GUID: 1JddT5IS7gKf5q-HZxcM6Z3mskfdfcE7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-02_21,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1011 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308030021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Aug 2023 02:24:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185448


Hi Steve,


On 6/27/23 14:32, Siddharth wrote:
> From: Siddharth Doshi <sdoshi@mvista.com>
>
> - Remove configure options no longer supported online.
>
> Changelog:
> =========
> [security]	A query that prioritizes stale data over lookup
> 		triggers a fetch to refresh the stale data in cache.
> 		If the fetch is aborted for exceeding the recursion
> 		quota, it was possible for 'named' to enter an infinite
> 		callback loop and crash due to stack overflow. This has
> 		been fixed. (CVE-2023-2911) [GL #4089]
>
> [security]	Improve the overmem cleaning process to prevent the
> 		cache going over the configured limit. (CVE-2023-2828)
> 		[GL #4055]


There are some CVE fixes in this minor update. Is there any plan to 
backport it to mickledore ?


Thanks,

Yi

>
> [performance]	Reduce memory consumption by allocating properly
> 		sized send buffers for stream-based transports.
> 		[GL #4038]
>
> [bug]		Fix a 'clients-per-query' miscalculation bug. When the
> 		'stale-answer-enable' options was enabled and the
> 		'stale-answer-client-timeout' option was enabled and
> 		larger than 0, named was taking two places from the
> 		'clients-per-query' limit for each client and was
> 		failing to gradually auto-tune its value, as configured.
> 		[GL #4074]
>
> [func]		Add "ClientQuota" statistics channel counter, which
> 		indicates the number of the resolver's spilled queries
> 		due to reaching the clients per query quota. [GL !7978]
>
> [bug]		Fix a serve-stale bug where a delegation from cache
> 		could be returned to the client. [GL #3950]
>
> [cleanup]	Remove configure checks for epoll, kqueue and
> 		/dev/poll. [GL #4098]
>
> [func]		The "tkey-dhkey" option has been deprecated; a
> 		warning will be logged when it is used. In a future
> 		release, Diffie-Hellman TKEY mode will be removed.
> 		[GL #3905]
>
> [bug]		The session key object could be incorrectly added
> 		to multiple different views' keyrings. [GL #4079]
>
> [bug]		Fix an interfacemgr use-after-free error in
> 		zoneconf.c:isself(). [GL #3765]
>
> [test]		Add support for using pytest & pytest-xdist to
> 		execute the system test suite. [GL #3978]
>
> [bug]		BIND could get stuck on reconfiguration when a
> 		'listen' statement for HTTP is removed from the
> 		configuration. That has been fixed. [GL #4071]
>
> [bug]		Properly process extra "nameserver" lines in
> 		resolv.conf otherwise the next line is not properly
> 		processed. [GL #4066]
>
> [bug]		named could crash when deleting inline-signing zones
> 		with "rndc delzone". [GL #4054]
>
> [bug]		Fix a logic error in dighost.c which could call the
> 		dighost_shutdown() callback twice and cause problems
> 		if the callback function was not idempotent. [GL #4039]
>
> Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
> ---
>   .../0001-avoid-start-failure-with-bind-user.patch             | 0
>   ...0001-named-lwresd-V-and-start-log-hide-build-options.patch | 0
>   ...bind-ensure-searching-for-json-headers-searches-sysr.patch | 0
>   .../bind/{bind-9.18.15 => bind-9.18.16}/bind9                 | 0
>   .../bind/{bind-9.18.15 => bind-9.18.16}/conf.patch            | 0
>   .../bind/{bind-9.18.15 => bind-9.18.16}/generate-rndc-key.sh  | 0
>   .../init.d-add-support-for-read-only-rootfs.patch             | 0
>   .../make-etc-initd-bind-stop-work.patch                       | 0
>   .../bind/{bind-9.18.15 => bind-9.18.16}/named.service         | 0
>   .../bind/{bind_9.18.15.bb => bind_9.18.16.bb}                 | 4 ++--
>   10 files changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/0001-avoid-start-failure-with-bind-user.patch (100%)
>   rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/0001-named-lwresd-V-and-start-log-hide-build-options.patch (100%)
>   rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/bind-ensure-searching-for-json-headers-searches-sysr.patch (100%)
>   rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/bind9 (100%)
>   rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/conf.patch (100%)
>   rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/generate-rndc-key.sh (100%)
>   rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/init.d-add-support-for-read-only-rootfs.patch (100%)
>   rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/make-etc-initd-bind-stop-work.patch (100%)
>   rename meta/recipes-connectivity/bind/{bind-9.18.15 => bind-9.18.16}/named.service (100%)
>   rename meta/recipes-connectivity/bind/{bind_9.18.15.bb => bind_9.18.16.bb} (96%)
>
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/0001-avoid-start-failure-with-bind-user.patch b/meta/recipes-connectivity/bind/bind-9.18.16/0001-avoid-start-failure-with-bind-user.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.15/0001-avoid-start-failure-with-bind-user.patch
> rename to meta/recipes-connectivity/bind/bind-9.18.16/0001-avoid-start-failure-with-bind-user.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/0001-named-lwresd-V-and-start-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind-9.18.16/0001-named-lwresd-V-and-start-log-hide-build-options.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.15/0001-named-lwresd-V-and-start-log-hide-build-options.patch
> rename to meta/recipes-connectivity/bind/bind-9.18.16/0001-named-lwresd-V-and-start-log-hide-build-options.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/bind-ensure-searching-for-json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind-9.18.16/bind-ensure-searching-for-json-headers-searches-sysr.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.15/bind-ensure-searching-for-json-headers-searches-sysr.patch
> rename to meta/recipes-connectivity/bind/bind-9.18.16/bind-ensure-searching-for-json-headers-searches-sysr.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/bind9 b/meta/recipes-connectivity/bind/bind-9.18.16/bind9
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.15/bind9
> rename to meta/recipes-connectivity/bind/bind-9.18.16/bind9
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/conf.patch b/meta/recipes-connectivity/bind/bind-9.18.16/conf.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.15/conf.patch
> rename to meta/recipes-connectivity/bind/bind-9.18.16/conf.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/generate-rndc-key.sh b/meta/recipes-connectivity/bind/bind-9.18.16/generate-rndc-key.sh
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.15/generate-rndc-key.sh
> rename to meta/recipes-connectivity/bind/bind-9.18.16/generate-rndc-key.sh
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/init.d-add-support-for-read-only-rootfs.patch b/meta/recipes-connectivity/bind/bind-9.18.16/init.d-add-support-for-read-only-rootfs.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.15/init.d-add-support-for-read-only-rootfs.patch
> rename to meta/recipes-connectivity/bind/bind-9.18.16/init.d-add-support-for-read-only-rootfs.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/make-etc-initd-bind-stop-work.patch b/meta/recipes-connectivity/bind/bind-9.18.16/make-etc-initd-bind-stop-work.patch
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.15/make-etc-initd-bind-stop-work.patch
> rename to meta/recipes-connectivity/bind/bind-9.18.16/make-etc-initd-bind-stop-work.patch
> diff --git a/meta/recipes-connectivity/bind/bind-9.18.15/named.service b/meta/recipes-connectivity/bind/bind-9.18.16/named.service
> similarity index 100%
> rename from meta/recipes-connectivity/bind/bind-9.18.15/named.service
> rename to meta/recipes-connectivity/bind/bind-9.18.16/named.service
> diff --git a/meta/recipes-connectivity/bind/bind_9.18.15.bb b/meta/recipes-connectivity/bind/bind_9.18.16.bb
> similarity index 96%
> rename from meta/recipes-connectivity/bind/bind_9.18.15.bb
> rename to meta/recipes-connectivity/bind/bind_9.18.16.bb
> index 80164aad87..1b1649566a 100644
> --- a/meta/recipes-connectivity/bind/bind_9.18.15.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.18.16.bb
> @@ -20,7 +20,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
>              file://0001-avoid-start-failure-with-bind-user.patch \
>              "
>   
> -SRC_URI[sha256sum] = "28ae8db14862801bc2bd4fd820db00667d3f1ff9ae9cc2d06a0ef7810fed7a4e"
> +SRC_URI[sha256sum] = "c88234fe07ee75c3c8a9e59152fee64b714643de8e22cf98da3db4d0b57e0775"
>   
>   UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
>   # follow the ESV versions divisible by 2
> @@ -39,7 +39,7 @@ PACKAGECONFIG[readline] = "--with-readline=readline,,readline"
>   PACKAGECONFIG[libedit] = "--with-readline=libedit,,libedit"
>   PACKAGECONFIG[dns-over-http] = "--enable-doh,--disable-doh,nghttp2"
>   
> -EXTRA_OECONF = " --disable-devpoll --disable-auto-validation --enable-epoll \
> +EXTRA_OECONF = " --disable-auto-validation \
>                    --with-gssapi=no --with-lmdb=no --with-zlib \
>                    --sysconfdir=${sysconfdir}/bind \
>                    --with-openssl=${STAGING_DIR_HOST}${prefix} \
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183438): https://lists.openembedded.org/g/openembedded-core/message/183438
> Mute This Topic: https://lists.openembedded.org/mt/99804753/7283133
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [yi.zhao@eng.windriver.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

