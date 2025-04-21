Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2BDEC369C2
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 01:55:33 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.7500.1745200525743569571
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Apr 2025 18:55:25 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=6206ff3b2b=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53L1o3Ne004132
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 01:55:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 464121hdqw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 01:55:24 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53L1tOlp011456;
	Mon, 21 Apr 2025 01:55:24 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2045.outbound.protection.outlook.com [104.47.57.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 464121hdqv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 01:55:24 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xpA5BMKTQM62aRzN/FIPyIXJKntkJG/G/VbBJA1/vhSofsJDSIB3TG+csQqJXYXh5IeuSEqETbX+vB/1vK4qRCWmrm/REY5pmfXI+ktMCU2MndK/1b6s306UN/4UoNA20Ls0QZJd90Blp/WomYPA42IAs1cjnX5JMKb8vCQSBWwrhjELsyJnenssf3LA6DAezh3RAxSdSDXOQabefxAYM/7JFUhMzmWNZYbF/BKMKxOvwwtcYs6PKUWdRL1uk7woEsR5JqtX/Je8B9vU3s0KP0qGdJfZ9koz9rNUKl3OLxFlO1YsbLE8M6yXnccSD+HcVRYYSSP33ewN5eGRZMvO8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pw/dfIFdSv6Qpapj+8Iam20s0ocPDFHXgHbtAoEAGRM=;
 b=CXXk3pYQpxYiCvuw8OeqFN9Z9Mg7EK7G28liOAJ6XsAaaNI3o5F1AAUbUhAChyZUEMMx+tF6jLamFHUJ7I8cJILK2ps+J1wwYQBSnwR6hlQiRi0UE4Gv9Pl7qBaGI7tzDu8CZVEZNyd9UYV0XXK9NK/3Os7oxogh9xLW3pCarUdF51WQHszxY8mQymzZZFHbdEDfJcnpHUe1NVDOrsKjJJfoQ1xjqJTK8NdKkCZAF+NxtS9JSlf80epNHyAmgFK1CMnZneaX/0Z3h7Davmo3mntzeZQ662eX4bv4tE3bNjdsuPqNb362Qj+AYOygmdSgH+by3zzymZAf9LH7aAvf4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.34; Mon, 21 Apr
 2025 01:55:21 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%3]) with mapi id 15.20.8655.030; Mon, 21 Apr 2025
 01:55:21 +0000
Content-Type: multipart/alternative;
 boundary="------------NQ9qVPA992tmWthgMz6VLbiL"
Message-ID: <35075fc2-e002-4ed3-9284-76ab5f94269d@windriver.com>
Date: Mon, 21 Apr 2025 09:55:15 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] icu: Add coreutils-native as DEPENDS
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20250418081919.382562-1-changqing.li@windriver.com>
 <D99WLTK5WV0E.27NXW99OIGMYH@bootlin.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <D99WLTK5WV0E.27NXW99OIGMYH@bootlin.com>
X-ClientProxiedBy: TYWP286CA0007.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::15) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|MN0PR11MB6135:EE_
X-MS-Office365-Filtering-Correlation-Id: 673b4406-b7c6-4704-7243-08dd807792e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dmZTNkdOdGtwNWkraUFhbzU5ditKczVxb21naW9IM0xJYklzMXQ4MnNWMHhD?=
 =?utf-8?B?K1dXZU5IZGFJYTVZNk5jTlF2MDI2VXlZOExSbXRzQWJ1dnN2QTUyejF5aDJ2?=
 =?utf-8?B?TXFBRDNpL1VRK1N6cjNOQTBFbWVFQTAwenJpdXEwWlg2R05oTFVxRU5zaTRz?=
 =?utf-8?B?TWc4K25zbmJEdW04cW1nWDQxelgyN1Z0YXNjbGZqdEF6eWw4TkNEUUpLZEg0?=
 =?utf-8?B?SzBuWTd5Z2krYmhna29IaEtEVERuQkFkQnlsMDlnUzV4YWNuREp2NXFDZU56?=
 =?utf-8?B?eWtmU1lDZDZnL2taeFg1dG5Wc0pnNVFlM1pxeUs3b0pvVDNHb1lacnhyR29H?=
 =?utf-8?B?d1A2UTdWQ2RDdlBxNHBLRWxLb05oYWVLOWMza0E2SWtGUFRNTnJJNjRWZVVh?=
 =?utf-8?B?dks4NEpTd3A4ZlFJNWN1OFdBaVgvdE5OSHdkdlRQL3NJZTRkSWMxelJVQ1B1?=
 =?utf-8?B?dE9BYlJxUmdzcnVxZVZWcktibzd0SmF4Z3dsT2dEbzB0M2dLeWxqUHNQMjAr?=
 =?utf-8?B?ck9LcklJN0RKTi9aOXk4NUhIa2VRdE8rcGIrOCtuMlJSOURDOXkrcVhnRGc2?=
 =?utf-8?B?LzNJSGRaS2RYRlhsOG9XdGtnUkowVUJCaC9jMHgxcDlGallSc2p1VVdCYXQ3?=
 =?utf-8?B?cGNKWjRPazBzd2ZQbjkrUU5ITDJJT1daVmw0WVNiY2ZMNTRQdVd4RmZTSE16?=
 =?utf-8?B?MHltRVRCeFVLQTE2OW1KZFVGNG11b2NzUTgzc0w1NFZad25qaENkc09Sdjlq?=
 =?utf-8?B?RXVMMlR4RUJDcmhkOGd2MHBBR1J0QVZqZWFVYk1EN3BBQzV3KzQ5NnZVa2dv?=
 =?utf-8?B?ekVKVHliZTQ1dWxJQndYdFAxV2xvYjdGTHR0RlQ2VWlubnFqc3N1NDdXMlNp?=
 =?utf-8?B?Sk9hSkgwY2hDN0F3V0wzRnBDbVJKTW5SZVl0ZnVEVDRIRyszWXVWcTZrZHdq?=
 =?utf-8?B?cmFwRHdNcVlMVlJub0JYQmYxckg2Q3JQeG1IOHliN2tyUlRQKy9UbkFRU3VW?=
 =?utf-8?B?QVRkZVMwUFVhKzNwVDNCV0ZzcjdtSkN3MDZLbE1Ha3VDc1R2RGRlY0Y5Sk5P?=
 =?utf-8?B?Y3Rva210MlJTa1Z1dWxaSXZoNXI5K2h2N3NWZ0M0OGhjOU9NNW4yWEF0UkUr?=
 =?utf-8?B?dDZOUmcvWDdjaGpMRVVRTE03dzY3WmdiakxkeHlwU1RYa0krNTdKcFMvR0gz?=
 =?utf-8?B?eUtGeGRMQVNzNC9iNmxKZWtSMjBqNGNZbC9MV0Jzc3JZTzhQUzhxN3lYV01Q?=
 =?utf-8?B?eWZiWWpkYWY1V1AyTVppeXNISjkrWVdWaWlWQ2hiRnFITHQzeGFVY2hrT0xB?=
 =?utf-8?B?MHRWTzFORVRRa1lNSUNFZWd2andjQ0Y0MUNlcVVUYzNiK2NGRWFCT1VSSGpF?=
 =?utf-8?B?c29vMnFnS0R1YW51Q1dXQ2RBTis5R0dKNWxhRzVWWGwxNEl1WTQ1bDNXMEtJ?=
 =?utf-8?B?NlUrcXlKdWxFRlpIZ2lZaS82ME9zS2oxOGxCS0QvRUU2R2d0cGRDeGhRcWpN?=
 =?utf-8?B?NUtWWWNxT2x0eEQ4QUhxZElxTVNkNS9KYjg2bDRVc0VVWkNTUTRtMi9kTmhV?=
 =?utf-8?B?dzc1U0Rrc09td2RlbFpRS2x5eHVrMUoxN2lRTEVBMmNBQUFBSEQ4TXU0bDRp?=
 =?utf-8?B?a2dxM3RVQTZRMjhoUG40eUFPMkxPR051NUlYbDlNT1ZMVWFpTTYrdnFZVWdp?=
 =?utf-8?B?U3kxZVRXZWo5anl3aC9kZkExNllNZlFwMXJ3VGVTR2E0SlNCMGNNRDBwYmdH?=
 =?utf-8?B?Um9aTlJWelVuSGtzdTQyRFlmdW0vWmR2TUlld3RrcHV5Wkw2c3c2YVFseE5a?=
 =?utf-8?Q?rn1iu3bHWA2foupuCGpmnhmdl/rK4KjalkVTM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?OGpZQlQyY2ZlVmVtcW5tUEtPdmZPdUhGMllIcDZiMHFJMm5CSkxXMU52NnVw?=
 =?utf-8?B?bVV2cndLRmNPdEd5TGFJOUFVdmhlM1VQZVBhUkM0aFpsTTFuV09XUXg2YW1p?=
 =?utf-8?B?QlhJMWtNQ25CenNnWW91bEpQa0Y2cEorSWU0aXJtZWIrcnFZNjEyRDdITFVS?=
 =?utf-8?B?V24wYUo2OHpPT0FLNUI2WElDdjdaQ0s3dHJXZmJrNGYrV3NRcDh5RmJhMDU1?=
 =?utf-8?B?NlBxY0haU3VFNE5ZQ2VFdlUrc0hkVnVHQ2JkZVJJd093S2pXSm5BSHhSaWZC?=
 =?utf-8?B?d2gzRmptK0JNbHhpZDFCZHo1LzRUMHY1ejFaSVNVVDRXWC9IeE1pTXU3alha?=
 =?utf-8?B?MVZlcVZUbll4QU4rUjZLeXpNUElXT3lJRnFPZGZHNWc2Y0pkVjNBVVh0OVdF?=
 =?utf-8?B?ZjVWTW1BbGhLSGU0dlhHVzFHck1IcFJoVWhRSzNsUWZVZlpJUWxSMGJjS0JI?=
 =?utf-8?B?TkRETVhTR0lqcVdzWXZmVUJSMFJ3QzdHTFlQdWZGVFgyMjNDeldySnBkU2xr?=
 =?utf-8?B?Zkt0RGlKaFhSSWZTYlB5NHZNWmg0VkF5MUJiWnNsaXdoNWhwQTZwL1pQQ3U2?=
 =?utf-8?B?SVN1bVA2dWhVWWVhQVE2SHVvYW1zbm5CT2ZmYzNqOEo5eHRON0FKRzFzcTk2?=
 =?utf-8?B?SEdXaHFFVVZScHh3Zk14cTRkMkVFMzBGQkc3UUNMSXV3amNJbWlZeE05bm1Y?=
 =?utf-8?B?bHdMOVBoSkdqaDRMTm13L1prdFh0eFl2Z0pHU0xCblFkMHBoYUJXL1NoZHpj?=
 =?utf-8?B?MjlXTlNSQ0xUZmNrckMweEpwVkZJbGlPOTFSQUgwT09QeE9tSmhYSGFtUnY0?=
 =?utf-8?B?Z3d0bXQyNGhXc1o0ZjZwaW1GemdNK2JwQkhHd3hQWis3UVAzZ2d0MDFGcnZ4?=
 =?utf-8?B?WktWTGtLWURLQjJhUzNJRGNwTm9xN2xSQjRhdEJ2WXRTaUFiKzNOckViazRh?=
 =?utf-8?B?Z1FWeVVUemloMEhpWk8rSEpVUURUNlZraWVmUHVLY3VDdTgwYWJzYmNIMG5R?=
 =?utf-8?B?TjBNZXFCQU1FbDhpN1gzYit5NTZSa3dWK0hGaVlUNWJCK1J0Wnd3SDNya3kv?=
 =?utf-8?B?aEg1NGsrOXA4cXBJOHBNU1B1OWsvMjdiR3VXQ09XeFZ2d3lXSjliOGpuYzVP?=
 =?utf-8?B?VzNVWnhFdFdSV3Z0ZEUrbFNjNzkvME5kbTBEMXQzdFd5TVhIcVY1Y3YzZG9o?=
 =?utf-8?B?Tit3N2pvT3hHb1JmMDhaVzhya1JKaU5uYzlOL1lGcXVYNWZFZHJ3UWFDTXBQ?=
 =?utf-8?B?WjhSNGpUanluTFNCZU4za01oOHBkek1QMjZ4TTBaQ0h5Z2p0OGNydXhwZ2FC?=
 =?utf-8?B?cWx0VFdIUzhoSTIzYU5GdWdFQkJZblkrbnUxT1NRZ0R2bWZyanpvMUcwTkhF?=
 =?utf-8?B?RDNsbWxLUmRGOTFkUjZnOU1KSno4VGtMVEpWaEpxOGZjUXVVMHB3dmJjOHlO?=
 =?utf-8?B?cHZ5VjY1RzJmK2pwanc2ZHd6cGx3THJjczN6aW5EbzlVd1dCZ2lnS0pOUXhq?=
 =?utf-8?B?VWFxL0RXSmdRTHBsdGNsbmdWNVA5NmtNVkE4ZDdXQWozQzFud0E4T3JmZVVD?=
 =?utf-8?B?cXpuNGx3cksyWWpHMWNuQm1qcy9YOVk3cXRUMENPUVBCd04zVlU0RE1yMkVH?=
 =?utf-8?B?YUNlK3lHT0pmakNBbGpldExSNGxVdHRnRW9uSGdFakRLMXBJeGE2bkxzUURu?=
 =?utf-8?B?MjZIbXVpRjlja0h2aDY4aGRaejRXUjJ3K3hzRXMyZ0NqUXJaR1Rya0V0RjEw?=
 =?utf-8?B?dWtXdUpxT3lJK3NLMmE0aTlHZWt3MWdPWjVBMUp4aTdjc2pTM3NkdzFxNFY2?=
 =?utf-8?B?bFRyN3ZtVTdsUHBURmxIZEwrYnJsUlM2dHcrbmtjNXhRSVRHMWQ2dC8vTEF0?=
 =?utf-8?B?dFBUK3dGdUVJL1ZMUEljUk9nOHNLTW9LRHVOcWRNMzFRV1pUYjRHQXV4dk5T?=
 =?utf-8?B?ZndsT003K2JkRHZTSFVKai9xY0tqc0JRN3JsaTlGeUlSRkhhMDg0cUdhc2xP?=
 =?utf-8?B?bThUeHZaWktaQ29aMlFWYkR6ek1xbCtQcURkb1QwY3dqKy9TWUZsdTVxcHdJ?=
 =?utf-8?B?dkxORjdZOVkzQUxtWW1wWEVDcjQzUXkvN3lQY2V1bUxPUHZ4Q2s4LzFOeUx1?=
 =?utf-8?B?VkhRdUJGSmEyZEZEK2hNblNJeFpOYmpWVk1VMHNmNTRIbTFvZi8vZUQ3V3lp?=
 =?utf-8?B?QlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 673b4406-b7c6-4704-7243-08dd807792e1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 01:55:21.3292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fi3ZWiTw/LkxOiOH2qVBRVnZlkqftVngL0W5nbnzqSwOe50tUmX9lsRHOmpS9I3P0xqfbk42+ZbtBdo5fPiu9zCVPU8NjfUOzos7W8dVW6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6135
X-Authority-Analysis: v=2.4 cv=QZNmvtbv c=1 sm=1 tr=0 ts=6805a58c cx=c_pps a=hSS9g3ca6WprpwKybkK64g==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=XR8D0OoHHMoA:10
 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=MExtCd46UHBcOEm37zIA:9 a=QEXdDO2ut3YA:10 a=wvPkM9v7g1_ikmSEda4A:9 a=qBJFqzWMhNmIc0Bk:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: J7lFw8cqKKlEDAxwqZCE9vF66npDbcGc
X-Proofpoint-ORIG-GUID: qO_Tjv8MOhKyiH2opbF3tXVbDQS9Gm2t
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 spamscore=0
 phishscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504210013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Apr 2025 01:55:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215164

--------------NQ9qVPA992tmWthgMz6VLbiL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/19/25 00:26, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Fri Apr 18, 2025 at 10:19 AM CEST, Changqing Li via lists.openembedded.org wrote:
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> icu will check program install path during do_configure, eg:
>> checking for a BSD-compatible install... /path/to/install -c
>>
>> And this path will be writen into pkgdata.inc:
>> INSTALL_CMD=$(INSTALL-L)
>>
>> Decided by if install is installed into recipe-sysroot-native during
>> do_configure stage, the INSTALL_CMD could be
>> /build/tmp/work/corei7-64-wrs-linux/icu/76-1/recipe-sysroot-native/usr/bin/install
>> or /build/tmp/hosttools/install
>>
>> Add coreutils-native as DEPENDS to make a determined result of
>> INSTALL_CMD, avoid vary caused by the execute sequence of another task
>> which DEPENDS on coreutils-native and also independent with do_configure
>>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
> Hi,
>
> Thanks for your patch.
>
> It looks like this is raising a QA issue:
>
> ERROR: nativesdk-icu-76-1-r0 do_package_qa: QA Issue: File /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/icu/76.1/pkgdata.inc in package nativesdk-icu-dev contains reference to TMPDIR [buildpaths]
> ERROR: nativesdk-icu-76-1-r0 do_package_qa: Fatal QA errors were found, failing task.
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/1404
>
> Can you have a look at this error please?

Hi,

Thanks, V2 is sent.

Regards

Changqing

> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
--------------NQ9qVPA992tmWthgMz6VLbiL
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 4/19/25 00:26, Mathieu Dubois-Briand
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:D99WLTK5WV0E.27NXW99OIGMYH@bootlin.com">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Fri Apr 18, 2025 at 10:19 AM CEST, Changqing Li via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

icu will check program install path during do_configure, eg:
checking for a BSD-compatible install... /path/to/install -c

And this path will be writen into pkgdata.inc:
INSTALL_CMD=$(INSTALL-L)

Decided by if install is installed into recipe-sysroot-native during
do_configure stage, the INSTALL_CMD could be
/build/tmp/work/corei7-64-wrs-linux/icu/76-1/recipe-sysroot-native/usr/bin/install
or /build/tmp/hosttools/install

Add coreutils-native as DEPENDS to make a determined result of
INSTALL_CMD, avoid vary caused by the execute sequence of another task
which DEPENDS on coreutils-native and also independent with do_configure

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hi,

Thanks for your patch.

It looks like this is raising a QA issue:

ERROR: nativesdk-icu-76-1-r0 do_package_qa: QA Issue: File /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/lib/icu/76.1/pkgdata.inc in package nativesdk-icu-dev contains reference to TMPDIR [buildpaths]
ERROR: nativesdk-icu-76-1-r0 do_package_qa: Fatal QA errors were found, failing task.

<a class="moz-txt-link-freetext" href="https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/1404">https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/1404</a>

Can you have a look at this error please?
</pre>
    </blockquote>
    <p>Hi, <br>
    </p>
    <p>Thanks, V2 is sent. <br>
    </p>
    <p>Regards</p>
    <p>Changqing<br>
    </p>
    <blockquote type="cite" cite="mid:D99WLTK5WV0E.27NXW99OIGMYH@bootlin.com">
      <pre class="moz-quote-pre" wrap="">
--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
<a class="moz-txt-link-freetext" href="https://bootlin.com">https://bootlin.com</a>

</pre>
    </blockquote>
  </body>
</html>

--------------NQ9qVPA992tmWthgMz6VLbiL--

