Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA59E74907
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 03:15:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.114392.1766546109836448858
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Dec 2025 19:15:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MQfaMoGG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4453656b1c=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO1Uw3e1205716
	for <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 19:15:09 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=fr4MxLj2OLsT4GVgWvYygp
	w1GZr6VyvknIxnz/q8f+w=; b=MQfaMoGG2xlc70pAQKlJlaZ6LLb8OaMVtKc4j+
	/pNfgZNRFL1+SV8v5vKicQA1mLMmILoOi44nhC5W4k6b1NPm8neICd3/wKmfYQ9L
	Sq3udX1Q5reXw/rXMOBjWwDF33+5m65x5bdc1FPLVoBhBuiOBNK8/190emf1n1Qq
	q/BqZw5EFWIs3cauP/SwPLl5eacDoBowarb5su68p+RXIeDI+sp0TmdEBJgpsfFj
	4Br5+iBMYH7Jv2A7DO1Vs207XXdTt3QLghvRuYl/LVRHyG380dcukwKPTKHFKHpQ
	xp27+R85+dAChmNzrXJaI4S/pVfC/sBsVC1QyroZKfulv0bA==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013022.outbound.protection.outlook.com [40.107.201.22])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5qy4umhu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Dec 2025 19:15:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jInJSLWPCHSZYijPJtoi5uwfy9etoq9dWEm3qDT6So/GvWhKZ1wrd5I+6bsPP3BlIxgdqhbEa20rhRGikllxL3Ba6vsvDiRIURlGZS/CEYR2zlbawXVF/kp5LMSyoEcB4YpWwtHQBFP2W8Eg2IH7QOGRVo8v6UnjiWfwveeSG/XG9Wl+TAGt3QBhJ24zbdxnsUcANVVulYm6fJl3A0nO3XU2iVqC8hphDW7dZv8CGdWSy5YlktHsgBeQKsKZLfZ8Oik3VzJz2houYCtyFrHvBZiwXcNnTJkADN2AwcRcjb9TgjVgeTccYd53hivbyoE2H/PCPqQOzEpYDDCeAStEtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fr4MxLj2OLsT4GVgWvYygpw1GZr6VyvknIxnz/q8f+w=;
 b=Xv979M2XFutTn51EZto88N6w7v3Wj6c9gOnGf4pyjTIeAQBKp6CgdjwaO/QrEdr0CSXU0MMGhb/PHVWmb5CPVuwTi7I/j9s2Iyepw9UryfmfBvmHBjWA40IwrS+rncUVHjfjoZa0rsuWtSYsDvbGn9XVCfwNOGMESAavQdJN4Fs958fGrARC7BjkvWBBQLNxm5ke4soZ9rnkyOKjS5GbyLQ6QYGuTdslKMTFoTGCtUSVi+CtfqPwOcXZU4p0PHQM2h3DFnQN0ovKAoXITjCkfK+qB7IBel1TL2yT7OzpFbx9HLZR/6RieXxVUBvCe+J4iSl3YR/6hyUaZPYa0z1h+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by DS4PPF2AD6B04BA.namprd11.prod.outlook.com (2603:10b6:f:fc02::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Wed, 24 Dec
 2025 03:15:06 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::c84c:d2c3:1102:cf45%3]) with mapi id 15.20.9434.009; Wed, 24 Dec 2025
 03:15:05 +0000
Content-Type: multipart/alternative;
 boundary="------------YWfwSkAsV9YdrY02xIanqbDx"
Message-ID: <aa268342-7075-41e7-a60b-470de870b6b8@windriver.com>
Date: Wed, 24 Dec 2025 11:14:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] vte: fix build failed for ppc64
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20251223085453.1635323-1-hongxu.jia@windriver.com>
 <CANNYZj-rHr0YQewsyj30cUHNtm2vLJ7iwb4NonudHYxnUg2gqA@mail.gmail.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <CANNYZj-rHr0YQewsyj30cUHNtm2vLJ7iwb4NonudHYxnUg2gqA@mail.gmail.com>
X-ClientProxiedBy: SI1PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::18) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|DS4PPF2AD6B04BA:EE_
X-MS-Office365-Filtering-Correlation-Id: 96eafdbf-2596-4455-0966-08de429aa2c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Yi80bWZVdStiL1ZGcWR4dUx0SnpKZHAzTDkvM0lGNmsxVDBTS0UrbTFlRElP?=
 =?utf-8?B?M0kzbFc0QUhMVlk2cUZWUVJNRWZMQlgyZms1T3JpQjhtQVRXWVJWTG4xdzhl?=
 =?utf-8?B?UURaVlFoOW4yYmRMaXhIUTZ3NXFGMzNsZE96ckRLWG5RRmJOQXQzOWk2VzNC?=
 =?utf-8?B?czhUbVNUM1dRdUtYOXorZWxxVlpub3lySUxickxSQUlRZXJ5QUZ1VVk0UUFM?=
 =?utf-8?B?MnVEeHVHRytKVnBKV2Y5MUp0UERVd29hUklOemhOdFpPSmV1UEM3b2NRQVdV?=
 =?utf-8?B?RnRCa1pXWjRmTER2aEJ6UGR5T3ZaNnZuUjhiQnY3c3c0dGhDMzAyYk93R1Ns?=
 =?utf-8?B?SWFyKzVML3dVOGd0Nkg1QUtXMk1kQlpIUERsQXFSREJndFhtRWpWNFdod3RU?=
 =?utf-8?B?S01CbmdXUFA0dnJ1S3lqM1ZjME05UHRlcnZmTExqREZtaWJaLzV6bm5MazNV?=
 =?utf-8?B?SkFPbEZmTHE2SldPNUkwWEpWUTI4WnRBSnZkcE1YZ1BDYkhtcFRad2t5b0J2?=
 =?utf-8?B?SHpKd3R5emR3R2VialFlU2NhaERQZWV5aStwQ2lJWjVNZ3R6TkNpa3FXSktJ?=
 =?utf-8?B?cjh0b0w5MnNPUXVGS056ZkF4MkdOM2tQWkx5c3hQZmhobkVZOGdIUVllTno5?=
 =?utf-8?B?aTZJMXFxMmh5N2tKMzh0UmZvUDdVNTFqQSsvS2N1ekR1cDNiZFNnMW4xZFBK?=
 =?utf-8?B?SUdvejhLT1I2SGQ4eVp5dnh1b3ZWYzFENDhPVmZUdklzY2JwaU1oZG5hbEox?=
 =?utf-8?B?bldlaHgxOFVEWGFZWnRaamNtWTM1bW1FVmd0SFRmcnlWbjQ2aU5DekdyeUNy?=
 =?utf-8?B?VHVqbGtDaUxHdUZtRzltckhkR09DeHlSSnBVUXN6b3FQVmZLZFVZbFRzMTdP?=
 =?utf-8?B?YUlJWkFRdThML3ZZUzYxYXdyanJVKzJJVmFmTEtDUzFWV0RjVU5ZbmloT0kw?=
 =?utf-8?B?by8xZU1lcVl2ejYzSFNERDZvUjk4REgxcmp2ME5LTGZiRWZqY0xnMHVBeG1u?=
 =?utf-8?B?TEZjUDdkZHZFTmlXaFEyZHFNRzBadlBsSVhyWnpiMVhYbGNENVdVbTZiYUtK?=
 =?utf-8?B?NjJrTW9YYmJWN0kzVzZ6MmNySG5pTzFDNWcvTGRDcGprNklORG96dlh3QVUz?=
 =?utf-8?B?ckYwQm1PcXB4SGR4RHBBYk9GbFFWWnJuMGRFTDd2UWEwczJLL1VxOE5PZGxs?=
 =?utf-8?B?blU1Ulg2ZzRFQlFGS09POEZ3cGRmSTZaU1Y2MkhvQUZtaFpwdTJVa2Q1N0NV?=
 =?utf-8?B?RkRBSFM5TGFlY3ptMDgyOGsxU2FCU2JsS2k5OHV0U0N0bm91UysvNXpsdk54?=
 =?utf-8?B?ektFRURkUVkyU0RKVzY1a1cxblNDS0l6RXUzLzJpdS90MmtweXEwSDNGUjNQ?=
 =?utf-8?B?UzdFankxaTlrbkxyRnprUmxhVmtESE5Wc3FKOFUramhhWmRVTDl3RnVyWlFt?=
 =?utf-8?B?Kys1ODZFWG1VcTBDQVVPekt4aE9SckVNNkcycy96VXdzT3ovYnpKbG14UFJQ?=
 =?utf-8?B?ZVVZSE5TdWc0S09aTURoRktKTXRSYTlpNkl1aHFOSmdnZEhqRTZLeER3VWtO?=
 =?utf-8?B?VGdhQkk2eHA1bHhpcDIvNS85RmdWUWpNSFp6N3FCMFFzRlEwQ1I5YS9iYkpK?=
 =?utf-8?B?SFVQS0dwMnhERng1eHVJblJ0aUxuNjVCODN1aEhXYWhRSHJxQlVObmEyRkRT?=
 =?utf-8?B?SGV2dlZuK2h3dzROenFRRDFDYTFLaEpHdGk5VkQ2cGduTlYwTUJ2T1NkUmVp?=
 =?utf-8?B?TG1JM29xd3ZBZmtoRSswZUdBZDdMTHRMUFBIVmhsd2o2dVZDR1A5UUgxQzVn?=
 =?utf-8?B?Ry96YksxN0NBVW1OWEFXcUY1eTZEWnZEcDZNZ2ZxL1czdVJqeWZBSHAydElT?=
 =?utf-8?B?V1pUWnR6ZWh4Z25UMmU1WTZmL3JpbVlZNm5XTUtOY2l5U2xFQmtacG8xZ0Ra?=
 =?utf-8?B?K3RaN2xDUllSMTFHLzZ3TmhvSWFteS94M0ZvMzI1ZWJyTnJUZzFBNUpGcE9U?=
 =?utf-8?B?aWRCMk85blFnPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cnNwV0kxeitidDBxQkVvNFB6R2ZkZVVabFd4aXhTeU5qUXlKeGMzTzJmSS9T?=
 =?utf-8?B?UWlRNnlpQkZTTVlNbzRGM21ZdU9MWUQ1SFliU2hieFFQb0x2eDJDYmtaNWFy?=
 =?utf-8?B?cWFDenJ3YXRsU3ZjU2VlejZXWXlXam9Hd1FPcFNtemdJNGVYKzErUWpJbWw2?=
 =?utf-8?B?cThaU1pIcHk2ejQzcmFXKzBJUXVhYVFhZlhiclh0OU4vbUM2RG5EdVBCbk5Y?=
 =?utf-8?B?SWhmcjRKcFJwdkpnSzlDbnR6NytkNVphUHF0dG0rQ3p1WUhMbmpEcVhMKzdO?=
 =?utf-8?B?YVgvYzV1M3ZzYlBhTU1ITmk4b3prNEFueFFEVjV4L0RxUzhqQTNWUVp4TGhp?=
 =?utf-8?B?SGljSW9EdWZXT0J5R0ZneFRmenBJejNDeWNVOEJ1dWFkR2pkMlV6bVJXN3ZT?=
 =?utf-8?B?blZSODlaQjQyUEZPcmlGVEl6Q3owTFFUOCtYQTNXb1pLSnlJMFdaS2EyUkxU?=
 =?utf-8?B?Nkh6ejQ4SDhUT1ZBYWh4MG4vYnp3ekJSbFE2OThMTWkwVEgzZDdrbXZ2WUhW?=
 =?utf-8?B?NFJ2SnhqaC9aUHkzbGN1cWZGYmNRWERIdjJpOUxXdE5sV1FFbjFtUEVoMnVF?=
 =?utf-8?B?dDNLWXhoZ2FPRVpnY1NMWWptcW10d1NOcWxqQWVpR3BmbDFwcGZIeTV5ZmdC?=
 =?utf-8?B?UjBuMzNzMXZtUVV2TXJaZzUya2lXTVllWVZhYVBBT0VUbmNubVZ6UEhKd3Jl?=
 =?utf-8?B?ZWpkUjRKUmhhUGRqMjlhSkJPbTFBRmJvbDVtV3hJem53dGVPRm5nOEthblE0?=
 =?utf-8?B?cGp0UE1FRWdmbVNDMFNjRGQ2ZTlvZ2pOM3djL3JHSFdtYVBwSnNiRFN4TVBi?=
 =?utf-8?B?TXZidEFLajJqdHZKTGJtVjhkclZiS2pNMkpsU1dUbU1hbXM5MVJRQkVza0VZ?=
 =?utf-8?B?NUJ1Mkt0cTdmS0hLeHlCbFY5RWJzN2o1Si9oQlhSV0M3VW5TaEsxeW9hSmV5?=
 =?utf-8?B?OXJTQ1RLSTNyTTh6L292VkxRZGVrSWZ4Tmc0WkxiQUcrdUJUbDhMdy82Z0pE?=
 =?utf-8?B?RVlPeks5TmFZcmkrdDZKdHNha1lhY0k2aVEzcUtqVzJ2Y1JhZW1vYWJtSTVK?=
 =?utf-8?B?STUwYkFMejE3WjBzSjZ0NWJMUzdubnowdkZML2doYlBCMFJVSU5xYU1uU1hO?=
 =?utf-8?B?VWVMOEplYU0wQUFOZ1VDY25PS0k1ZHF0Q0M0bHFUMFVzczlwS0tsNFJLQ0Z3?=
 =?utf-8?B?ZEdOcFY0ZmtPQThQaWF2MklGSGIzQ0xJbmNoaWJlR2ZPZG5sSm9mcVdra211?=
 =?utf-8?B?Vmp3YTZsQ2g2Z3g0L1o2WmhSM0Jwa01UcThWZGxTSEtTSS9RNjlnUEhHa3VR?=
 =?utf-8?B?NWxqVW8vZk15V1NsbmZUWkx4M3dUcUlybXE0Q2FaRUdibGk0UDc1VXphTkZx?=
 =?utf-8?B?QXFCeHlhZ2gzRTduQ2hZclVMMkNrNnV5YVhmYklzaU91RGZ5UlRISUo4ZVo1?=
 =?utf-8?B?UXJ6VExlbmloRlVKZjZGSThSMnhJWFJ1ZDNxRDRWSkNoanFMeEF5U2RzYmsz?=
 =?utf-8?B?M1pKV2tDemRlU2VHZGFDbDhMb3ZrWW9lOG94M1d1Vzd6YjBoVGZUS0wzUWdh?=
 =?utf-8?B?UEZTcXF2RmtSTm52UXAvaUdNTHU4NHRIanp1MzVaS3ZuNHVIOU1pTmNHNVk0?=
 =?utf-8?B?d08xeWc0ZCtUdTlNV0VBUXZJZ1FSdXJmdzZPMXV3TCsyWmtDcHQwWGdGcEpp?=
 =?utf-8?B?WjRBVzFrMVg3UVNJY2VxSGI3eVd1Uzk0ejBVckQ5SHY3NlVYL01ab1NSQ2RH?=
 =?utf-8?B?aXNFQS9kVnFjMHNabG1SRlFYQitobjBGbjhqc1hlZTg2VmxYV21Xb2x6ZTh0?=
 =?utf-8?B?c1dQQVBOTjVQWXVYcEhmS1B6VmtrbmNsUE1EcGhlZ3hkdVpLeEp0VEdHYUpo?=
 =?utf-8?B?bzhyWCt2RGU0TlhJeDJhWGloZ21hVFlhZjl2QUpSRFNvbEhpQUcrR21odmNz?=
 =?utf-8?B?WGs0VExTTjBGMko3cVkyT1BUMmRwQkRRY0lZa0lKTnZLZ2VucjFqWW5pcjgv?=
 =?utf-8?B?Njh0Mk1zczlGZGRRQURaTGVkQW5pN1dMbXV4emlTT3RpajlJa3F2dDJRZGwr?=
 =?utf-8?B?aUpFaVRZY1hqSEhIeEhmeFZ1UDJ4NG9QeXZJdWowbEU5MHpBcUt2Wm5URlgr?=
 =?utf-8?B?ZkJlbmxxbXA2TkpuNlI4WTdVUTBzcWdUOHhQMnAwRW9helllWHhGc080Vy9i?=
 =?utf-8?B?UXhKQkRlMkVneTZwYTNWVEFybzkybndpTStjMDM1Y3FYVDRaQ2tNMVU3TG1X?=
 =?utf-8?B?aXJqbk9SYmJiSm9OTXptcWR5aWE0ekJvM0hLSnU3Z2ptSDVKK0d4TEprRVZE?=
 =?utf-8?B?RDVTV0g1ejVhcnZCTFBOTkJaUkxMWitUZnRwY3o3OHFxTHR2TjJBZz09?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96eafdbf-2596-4455-0966-08de429aa2c2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 03:15:05.8762
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WM3LPo0ck5aQPb1ClBr/WEF69IBunO2Ur90IdEkWdwGBcBq2cbpGryEL79Hvz7lvp33o9bqnR2jCrujzlh8tGaEPVFqeOVHzpMz+Hn0VlKI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2AD6B04BA
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: qgCm6sc2zAYrkjs06Abraekf4om8Okob
X-Authority-Analysis: v=2.4 cv=Q+vfIo2a c=1 sm=1 tr=0 ts=694b5abd cx=c_pps
 a=KM6hcDErBpdSH7DPVcpu/A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=GHR8O2WEAAAA:20 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=NLOWuCdESRyvfSN1j7MA:9 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8
 a=wvPkM9v7g1_ikmSEda4A:9 a=uWmUe7AMcHM7fmZN:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAyNCBTYWx0ZWRfXw2GNPmAWixt4
 14j+DitskQ29ld53QQxi9b0QB1ZXzy8QUIa8Un7WDKGYyP25PgSvhmDGD4RerMsbE6eH2yyi9sW
 TtxdDplaZ2o74GdUYz7tTrGpg6YBmrb3o9kr307AUVzZk2iHGADlwcWWoOKXb8+d88tLiM0Mqvx
 9ylSHqSxLKiC04Qx9f917VlYH+uDfJvactd95sbbY6J6I+5WREP6fdie/EIlqIrgcVAQqtHqhGR
 fmHdDJ8U7ketOSXT8n/PDc4NvUiLUfxPfWaFeS8aHpLdO332EPTRocTC3IwDursb10SeL9IGoY7
 +A0iSYUFX0oO6I73JTtfUn9EGHxMuKi34elh0cqlgiKlEInrY16x5tF74DOHRfQtdnQ4ed07usF
 xvJKPRgkNaQucj2/i/pXR34QRC5o6tREyVV7ziM5/um+10ObdOMGpkaKUYX5C8LdhYStdfPrDQj
 MiY+EaxXDXvC97JSNYA==
X-Proofpoint-ORIG-GUID: 7_nHaRwuJl2nJTzCbu12ML5X5dkmFJV5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Dec 2025 03:15:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228513

--------------YWfwSkAsV9YdrY02xIanqbDx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/23/25 18:27, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Tue, 23 Dec 2025 at 09:55, hongxu via lists.openembedded.org
> <hongxu.jia=windriver.com@lists.openembedded.org> wrote:
>> +Upstream-Status: Inappropriate [Yocto specific for ppc64]
>> +
>> +Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>
>> +---
>> + meson.build | 3 ++-
>> + 1 file changed, 2 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/meson.build b/meson.build
>> +index 330ee89..a6c64ca 100644
>> +--- a/meson.build
>> ++++ b/meson.build
>> +@@ -41,10 +41,11 @@ simdutf_amalgamate = [
>> +   '--no-zip',
>> +   '--no-readme',
>> +   '--with-utf8',
>> +-  # '--with-utf16',
>> ++  '--with-utf16',
>> +   '--with-utf32',
>> +   # '--with-base64',
>> +   # '--with-detect-enc',
>> ++  '--with-latin1',
>> +   '--with-ascii',
> Why these particular options are necessary on powerpc64 but not other
> targets? They do not seem specific to that platform.

The upstream simdutf newly supports for ppc64 [1], and define

function write_v_u16_11bits_to_utf8 and 
ppc64_convert_utf16_to_1_2_3_bytes_of_utf8 for ppc64,

and apply them with option --with-utf16 and --with-latin1

[1] 
https://github.com/simdutf/simdutf/commit/497f4f29fe25a79af00ce25693a14682a5f669a5


> Also carrying conditional patches for configurations that aren't
> tested in CI is prone to quiet regressions (including such patches
> failing to apply after a version update). I'd say you need to both
> investigate a bit deeper, and raise the issue with both vte and
> simdutf upstreams.

File an issue for upstream vte

https://gitlab.gnome.org/GNOME/vte/-/issues/2926

Submitted a patch to add option --with-utf16 and --with-latin1 by default,

attached the patch along with the issue

//Hongxu

> Alex


--------------YWfwSkAsV9YdrY02xIanqbDx
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 12/23/25 18:27, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj-rHr0YQewsyj30cUHNtm2vLJ7iwb4NonudHYxnUg2gqA@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Tue, 23 Dec 2025 at 09:55, hongxu via lists.openembedded.org
<a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia=windriver.com@lists.openembedded.org">&lt;hongxu.jia=windriver.com@lists.openembedded.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+Upstream-Status: Inappropriate [Yocto specific for ppc64]
+
+Signed-off-by: Hongxu Jia <a class="moz-txt-link-rfc2396E" href="mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
+---
+ meson.build | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 330ee89..a6c64ca 100644
+--- a/meson.build
++++ b/meson.build
+@@ -41,10 +41,11 @@ simdutf_amalgamate = [
+   '--no-zip',
+   '--no-readme',
+   '--with-utf8',
+-  # '--with-utf16',
++  '--with-utf16',
+   '--with-utf32',
+   # '--with-base64',
+   # '--with-detect-enc',
++  '--with-latin1',
+   '--with-ascii',
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Why these particular options are necessary on powerpc64 but not other
targets? They do not seem specific to that platform.
</pre>
    </blockquote>
    <p>The upstream <span>simdutf newly supports for ppc64 [1], and
        define</span></p>
    <p><span>function write_v_u16_11bits_to_utf8 and
        ppc64_convert_utf16_to_1_2_3_bytes_of_utf8 for ppc64,</span></p>
    <p><span>and apply them with option </span><span style="white-space: pre-wrap">--with-utf16 and </span><span style="white-space: pre-wrap">--with-latin1</span></p>
    [1]
<a class="moz-txt-link-freetext" href="https://github.com/simdutf/simdutf/commit/497f4f29fe25a79af00ce25693a14682a5f669a5">https://github.com/simdutf/simdutf/commit/497f4f29fe25a79af00ce25693a14682a5f669a5</a><br>
    <p><br>
      <span></span></p>
    <blockquote type="cite" cite="mid:CANNYZj-rHr0YQewsyj30cUHNtm2vLJ7iwb4NonudHYxnUg2gqA@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">
Also carrying conditional patches for configurations that aren't
tested in CI is prone to quiet regressions (including such patches
failing to apply after a version update). I'd say you need to both
investigate a bit deeper, and raise the issue with both vte and
simdutf upstreams.
</pre>
    </blockquote>
    <p>File an issue for upstream vte<br>
    </p>
    <p><a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/vte/-/issues/2926">https://gitlab.gnome.org/GNOME/vte/-/issues/2926</a></p>
    <p>Submitted a patch to add option --with-utf16 and --with-latin1 by
      default,&nbsp;</p>
    <p>attached the patch along with the issue</p>
    <p>//Hongxu<br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj-rHr0YQewsyj30cUHNtm2vLJ7iwb4NonudHYxnUg2gqA@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">
Alex
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------YWfwSkAsV9YdrY02xIanqbDx--

