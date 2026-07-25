Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 587C7C531D0
	for <webhook@archiver.kernel.org>; Sat, 25 Jul 2026 03:53:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.33976.1784951593173924832
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Jul 2026 20:53:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dVEnbrUL;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=166643924b=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66P3RmpO3250231
	for <openembedded-core@lists.openembedded.org>; Fri, 24 Jul 2026 20:53:12 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=lcb/bQQk9/7/kPefkRNXdjLo1DTEDzC+0UjWogQ0Pi4=; b=dVEnbrUL2SYo
	eQci5kegZUN5UayL7LjDOYAEiu6i5wpSY38vfG7vvdLRjkgMpV43PTkJD2WjTurg
	ZHdz3hwXxOkojjFrwwWZ7rUkfHbWwAREiLl6vb6pZXYtyolxJdfBWJnebHzGS6mn
	uuSrZ4n3PMYVJ6kYj1q8KkKJFYdY+ztmnCtXtkfQsKJN3Holn2T+bGcIQsSV0o/j
	VqTQ8qq64/5KYMtgdEL/gFuZQ2A8SoyNyzuK13k7aW4cmGMZjQWVdeRwMF7uyLbd
	YBwdn6qhAZUADdLxwcj3rYZbfUDpHkM5VP+3Lj/2fUA8E9rcJ5Yj23RRCpoAdor2
	Caw0i3Exkg==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011017.outbound.protection.outlook.com [52.101.62.17])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fmjh1g44d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Jul 2026 20:53:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZBQHVA5Xx4f4f2SlyMY2FsSkmNO7HghIMmL1sE4edlfP9UGYlskcmFyQi1NsmipBzayIMgXZ+zMGlznno/xoHHPG4MVICi3xHNor2vLjxaMORLYhs/duLz9m17Toc/URNJbzMb+jKMD1BRZM+VLFOjrqNX0d2eCdIk/ARoPFy1n0UnoTg7QuD2Pae4gSXG/TjpWfGsk/4+8o3gbJPMaVAiEwDud5nUdT2poPfITDaM7tJhaPvETt9iP5FMWf26+4P7hpQzmc179HWQ6R/t+uoSCjFWXoK4Y/cKQJHupD9rCPfQL0MhF/lqBxdPkolFLXQtplLqKovqsAu5hDp7lKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcb/bQQk9/7/kPefkRNXdjLo1DTEDzC+0UjWogQ0Pi4=;
 b=jjT+IfQSMlxamYmfKmpYDu8W3awpmvRPu2/vMOserKGpf0WUr7o/GJ4/tyw4qxn0nDwui9/VqEwS7Czr+cJmcOXpAwDtuIRva6r3OjoUedlV5krXeyKd61HgS7h9V4Sr5B0GsTIOzOFm7TDK+QFXT2iMY5a/zdexI0MUnxpYN3nRVCob2iIsaRexoTxLd6nbsA/Tx6wBw3fzdyY+gbt2iTsv73xYOvjeNjyoKfKL8mj989Tn5/YDAahZxIZDt5fpkqkr2BMF+Z8COJHu9IUnqNYFfPGmV/DM3I7NE+Na+0G1Hnq9w0XccxZjQJJdMvK5zCfww7UkLOrz2En7JVDbBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by DM6PR11MB4625.namprd11.prod.outlook.com (2603:10b6:5:2a8::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Sat, 25 Jul
 2026 03:53:10 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%4]) with mapi id 15.21.0245.012; Sat, 25 Jul 2026
 03:53:10 +0000
Message-ID: <4458b9cb-9027-4e17-9217-175415db6ff9@windriver.com>
Date: Sat, 25 Jul 2026 09:23:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2 2/3] rust: refactor source handling into a
 shared work-shared recipe
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20260722061757.109411-1-Deepesh.Varatharajan@windriver.com>
 <20260722061757.109411-2-Deepesh.Varatharajan@windriver.com>
 <DK5PEQXXJ9YA.34F0OF7DED7VM@bootlin.com>
Content-Language: en-US
From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
In-Reply-To: <DK5PEQXXJ9YA.34F0OF7DED7VM@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0303.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:21e::6) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|DM6PR11MB4625:EE_
X-MS-Office365-Filtering-Correlation-Id: d33bf9a2-eac0-4005-3cf6-08deea003e9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|6133799003|18002099003|22082099003|4143699003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	8GRRTyj5pdTc2VdqXXdgtZ3lHQ2mnUNOlTQSZEJCTNKqeYxwzuH7++NH3E8x0yiktfb0hAo5fd9UOeiKGHHNNl2TC4j1OVJhEkdQPzmqHSAVUs+tmJO6cNQVL5N5v23uPN2YpljaR7vEf6zDs0oLPo7fnNEPO2fSVjHUpsvfvdGE/dQOq6WFJesf72gJoktRaHwuMJEM98NOhK5Bs1vyLM4g0Pw6eoz671RBTJ7f7IDxPCTGJ3Gqx4XcEMJQ46RN8sqtiDJtKmm7AyJkKOEZdjm+zPIMN++plsHBoT2yDrwHGjoPTxiJ0BJ5LU9P1KTnuypNiO/ZgDE1aqAd1P4LKdl5oDevmj7I44eDEsj2sKGNUnkfYGWr8OXvQhI4cMxPOct+bdTdtoQtw/DlMpvR8Z1kAICoPyQBy8/9Cx0iKbtoqR9upwNtyx01Fmd4Gt/d0M8tMao+RRx0c9Qjupu/6JK4/OJbvSorRWXZENZVhiWEbddK9LjGBoQ6dwRTZ0zIj8lJ6W9l5TAeP1gICDG+jrC8VJEHuwppSbCG17tmI6GzvZDhpki6vLMmJc6Q1zFcEqUS4SFXbVM9ASlLEMS04yTEdPncvm/8YOb4nOC3Nf8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(6133799003)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Y0NLdDEyWEFZNGZ0TGNGKy8xN01uTnY2K0x6dmgwMk8zTmxING00dmFtTDFs?=
 =?utf-8?B?emNzOGR2R3NqRXdhU3FmVW9vc2FUeDE5Z2xNSXN0cW5yeldrTjJUS3c0eXB4?=
 =?utf-8?B?amtrS0lqQW5pcUw5SGY1UkxwdmZqaXI2R29BcXgxeVlNdTlrcHYrelpCTGhY?=
 =?utf-8?B?ZHBmVGlvNW1MZGlHMXFMUCsyamhwZmh3R21QS3AzWDRteHBLdmZ6Y1JHcCtp?=
 =?utf-8?B?TjczUC9oTHBwT0dGSWcxTmpaSTRhUDhqTmwrRXFLVExmWXpyam9JVWllT1Nl?=
 =?utf-8?B?ZFN4N3BVOUJsRThsdCtlZkNhOXFOd05kRFR5QmRGQW5sWUpaTW1BZWpXRXND?=
 =?utf-8?B?WnllQ2lZMmJaV29BL0VIaEdmV25zWFozN2h5bVlpVlh5QTFYeGZaZjRrNDlN?=
 =?utf-8?B?d3ZUNHZjd1oyQzNuNlk3QlNBUmlmNXpyM1BrL1ZPbmJZd2VkVzBNSFJhWnhy?=
 =?utf-8?B?ZUg3TG9PRkljU3AwUHl0RmFwRnBLS0d1bnRkS2R1RWwycEpJWTdIUDRWcUJM?=
 =?utf-8?B?b2ZUVG9vQWZ6YUwyZkNwTFB2eHpiYmxZbHA1VElwcEVVSWxvRlhxU0E3VmZF?=
 =?utf-8?B?Ym8rOXZiYXJWWmx2b3R2QVF0czdta0tpWWZaeStmKyttSURxcFB1bGYwZ0tj?=
 =?utf-8?B?YXRhL2o0eVVXWkcySkdkbmk5bHE3TGtQNXE2YzkvcHJpK3ZlUk9KSm9PNWNG?=
 =?utf-8?B?OHFCZ3I2U3VGbUNOMEpVcVhFc1luQXVHTWN4UURLSitYZ0h1UklIdXUxOE8z?=
 =?utf-8?B?YzE2eVZUR29EZ0tyOVRob1EzcXd1SHVHVzY3VGt2TlNkYlNyck9XMUdQRFRL?=
 =?utf-8?B?L3FZUm4vNUpuYm9EZnJ0WDd2QlVBNzdzU1lQeFVoV0ZNUVdFMzhjak0xeFJQ?=
 =?utf-8?B?YVE1Rlg3dUFRd3NaM1M4eEl3WDlBbGpwNGxVVnVCbU5lcWxCaXpmOWJ4OEdN?=
 =?utf-8?B?RTJqU0lQbGV3dXpRT0JtSzNJQm52ZlpTNEI4ck1DWEo1WDJlTWwzTjUwdllw?=
 =?utf-8?B?b3FBK0VOb1lQNG40TFowbk5sanJTckdMdXpZNmg1NWtYTEhTVTVVYS9WdVph?=
 =?utf-8?B?ZHBJUjBTSE9KejduNlFBcml6QkgyRkVhcDU5WVNNWnR1QVlKSEdTRlRVRllq?=
 =?utf-8?B?dEorRkdSY3REYng0d1o4MXNDL1RKc09TZXhuMEZXLzFkWFl6emp2TUNOSktW?=
 =?utf-8?B?ZW5pdVNlVi8vckYwRlY3WlFzSDQ4V05NMTZMMzIxdGVWcDhmZjhoWTFpMUQ1?=
 =?utf-8?B?MTNUVXJEMGlYRDlBSk90S1VHV2lYNUZuMDhsdkltd1NUeHY3d2lTYS94cEZQ?=
 =?utf-8?B?RXcxSzhoT1VQbnUrU1lESElqN1B3OC9LbGVqWVlNWVlLUk0zSjRTWkVYdnRR?=
 =?utf-8?B?WVovMTJSVTdxTmJiaWI0K2lVVlRCaDR6eUJtWjdNU2FUN1RsdWltaHVrZGh2?=
 =?utf-8?B?Ry8zQU5wVGFLTzFKQzFVVnZjK1laRkJQNWszUy80aXNIMTZ4QkZNcGl2ek4x?=
 =?utf-8?B?TmxxbFpZS1FXNUd6eUVqOGJJUC81elNkWGNxWnhjazhEZmJZbEVLT2h6MWNZ?=
 =?utf-8?B?a2Qvbmp3L3VTVFpYSEhwQTdCR3BuK2UrWUVYNE1FbHNHOE41SWY1R2IxV29I?=
 =?utf-8?B?MTNtTFhmOVJKVVpONjEvaHBlWGlTSURJcDRaSkpveTFqbU95TG1QVjB1TSto?=
 =?utf-8?B?NDNoUVJCUFhYSE1DcDlvcjlLU0FqVkc4Q1NabWE4YkN5cFNYYVRpeHVZN0RI?=
 =?utf-8?B?MkVwcnc2ZVdLeGUxKzcvMG92QmNZMnlucmYwRnF4dk1LejhjTjlTVWYvUHY0?=
 =?utf-8?B?Umd4a2VENVhOSmNQWkNyeWdYa21sdDBFaktqc0t5S0ZBZ3crNURkZDQ0NUJB?=
 =?utf-8?B?MHh2YjVyUklRWkxYQlZUdUN3ZGJMZEptejg4c01Zdnk4aDhsMloydkpmdUFG?=
 =?utf-8?B?MENGNU1MMjFjSVRCVUwySlVQYWxZZlcvRENIYWhWS0ZrRUp0SGVZd2NXT0xx?=
 =?utf-8?B?OFJxOUVEdUovY1B5KzJzK0YxMGhLUEJnd3YybFZxbi9zS0tkb01wdVdKRlFL?=
 =?utf-8?B?b2U4ZFVuSEJWRi9kdGZsMXZTbTE0YTBnd0xFQXFxVWRjWlZPbkJaME1IejZO?=
 =?utf-8?B?ZTk1N2ZObW95NkJtRDJRK0lZZExid05kNVBNNy9pWFd6NEJVaFpJRm13WXRw?=
 =?utf-8?B?cTh0NjBMdGtYYSsvSWRGMmQ1cVlhUlAwR20wZUlJQ2JXUkYwQmhtY3B0Zk5h?=
 =?utf-8?B?dnFGK2k3WlpGV015ellqL2VVamc2MzkydG54UGpvZUROVmZlZzhZWnRHOXN4?=
 =?utf-8?B?ZWRtbmRFN2UzbWFPbWszSkVQK3hQdHkwdmVZSVJRT3Uyd2R1Z2p6YklaYmpi?=
 =?utf-8?Q?YMpvaG9mbcHaszk26u5jFQ/nc/IZepQmqjrBe?=
X-Exchange-RoutingPolicyChecked: 
	cNkzLEuzP7lCFRsvsB4xGJpqk5FA7+vo7hqAPbnAkiDP0SiCV+P7tpCi5TwaxtMQYYu4FDDV8QcF7Y7X0y2gEGrkZjQ1yWmxOntiNf3nW7sJFahY8lG9+JOVneUaIwpJBdvw4ynsTKeIwcm4MgPxQOKd09H5LeHFMO6pz+qkdYflLrmVXd5+3WrRKI0D1v1lRtLYBNAMm9eajL7xCLFdptVjBX26TX7tl/w+RMR9RHmUmiGXMptBCiJZXVFuCflT2uJzJzhk4R/AvJ7S5TxXS5FhcCcHt11IQG9MKzW1dM/BEeZmCZRvhKR1ZNZFiaxIHSwJDWK37tNbnMGzoJlZpQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d33bf9a2-eac0-4005-3cf6-08deea003e9d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2026 03:53:10.7819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yUbnZ2Lau8hAwIgk1Z+gPyHEFIM8tMDt4MpjemlSLtnLbM8QViSTJzeaAlyCTbuGLMnDCodrTyQiHlc5Vo6FhVKopOVVE5pVZRiZsiU94t0z2p7LOe2p2OZclq7W24Mm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4625
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: ORXp8xkJWV7J4n0FH4yBT7YpAbfWYXgc
X-Proofpoint-GUID: 0IX6y_Ofb6Iq4JFMmidBJXNSiWVymnWp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI1MDAzMyBTYWx0ZWRfX7GMhmLkFK1Ql
 btBu8+JQq8ukquRVt+MrcvG7CR1f8N4M2nOnJlJqtUOnRiiIntqcc6+RiUGDGAeDk3U+JtUrDxr
 ruS34d9zHQwomhTR5d53HuvokuwSgCuUy5fqhqRi4HZ1Fxi+Narr21K5XqJiTEJgdyimvQQrhgg
 w36/X+WRUBI6YUYRvq68+wBGIoSeHOftSIBSu9Yxw3Ru2IWhVCYaY+8X2jJlAvmMTRiQBpUXQ+i
 XA0oymKb5ftCRHkzz80svOQZTKfZ+PC88SRPqWWo1xF20PmVMuImCtJxJTHhxNI2P9XGs4F5YdB
 9aX4jSnxBYQdYOs1qvRAXsxx39Jj9eGUQNmHdQsZJ/ygVRmui/hyI7bKOkeJ09ZmHIxufNpS/sQ
 Tp3PCj1lsB879HBFYSasE7bYGeQNbGRdHgQxzwtA3I+qB9gM81+f0h3pd5RYZY82swzJ42uM4iW
 Iy+YSJQ3E6rrn9ywzPQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI1MDAzMyBTYWx0ZWRfX8v5b+j4FbBT2
 6trWIeLG5IKa+Zc6wNSxJpgv5pjrSelgFxkN7C0ExNh52nSz6Zf69je0HW+mglaAdeQM3Yj1vNv
 IC9WzdKKhL0QIbUsvH3kCg/4USGKJUN4Dai0ZKIQybaVEZMQYKlf
X-Authority-Analysis: v=2.4 cv=brl8wkai c=1 sm=1 tr=0 ts=6a643328 cx=c_pps
 a=ixsBY7txtd2I+GiPRIsFOw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=ei4SEBeUAAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=gO5Atbz82MeMq9LolTYA:9 a=QEXdDO2ut3YA:10 a=8zIOOLb7Ym0NljyPXbuS:22
 a=d3PnA9EDa4IxuAV0gXij:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-25_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607250033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Jul 2026 03:53:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241957


On 23-07-2026 11:03, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Wed Jul 22, 2026 at 8:17 AM CEST, Deepesh via lists.openembedded.org Varatharajan wrote:
>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>
>> [YOCTO #15808]
>>
>> Consolidate Rust source management across all Rust recipes (rust, cargo,
>> libstd-rs and their native/nativesdk variants) into a single shared
>> source tree using the work-shared pattern.
>>
>> Disk savings: a world build with multilibs enabled, together with
>> nativesdk-rust and nativesdk-cargo, now shares a single ~4.2 GB rustc-src
>> tree instead of maintaining up to 11 independent copies (~46.2 GB total).
>>
> Hi Deepesh,
>
>> --- /dev/null
>> +++ b/meta/recipes-devtools/rust/rust-source.bb
>> @@ -0,0 +1,56 @@
>> +# rust-source.bb - Shared source recipe for the Rust toolchain
>> +#
>> +# This recipe fetches, unpacks, and patches the rustc source tree into a
>> +# work-shared location so that rust, cargo, libstd-rs, and their native/nativesdk
>> +# variants all share a single copy of the source. This eliminates duplication
>> +# (up to 11 copies of the ~4.2 GB source tree in multilib + nativesdk builds)
>> +# and significantly reduces disk usage (~46.2 GB -> ~4.2 GB for rustc-src).
>> +#
>> +# Only do_fetch, do_unpack, and do_patch are meaningful here. All other
>> +# tasks are disabled since this recipe exists solely to provide sources.
>> +
>> +SUMMARY = "Rust compiler and runtime libaries"
>> +HOMEPAGE = "http://www.rust-lang.org"
>> +SECTION = "devel"
>> +LICENSE = "(MIT | Apache-2.0) & Unicode-3.0"
> Please use the new LICENSE syntax here...
>
>
>> --- a/meta/recipes-devtools/rust/rust_1.96.1.bb
>> +++ b/meta/recipes-devtools/rust/rust_git.bb
>> @@ -4,6 +4,10 @@ SECTION = "devel"
>>   LICENSE = "(MIT | Apache-2.0) & Unicode-3.0"
> ... and here.
>
> Parsing recipes...WARNING: /srv/pokybuild/yocto-worker/beaglebone/build/layers/openembedded-core/meta/recipes-devtools/rust/rust-source.bb: rust-source-1.96.1: LICENSE is using an old syntax and should be upgraded to: "Unicode-3.0 AND (Apache-2.0 OR MIT)"
>
> Thanks,
> Mathieu
Hi Mathieu,

Fixed in v3.

Regards,
Deepesh
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

