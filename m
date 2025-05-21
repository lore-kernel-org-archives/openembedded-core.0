Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E785C54E65
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 11:56:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9371.1747828580525484127
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 May 2025 04:56:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7236f77f38=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54L7rxR7026177
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 11:56:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfws8ua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 11:56:19 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54LBuISM004120;
	Wed, 21 May 2025 11:56:18 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfws8u9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 11:56:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NIDwVVfPLRp2bp6YnA+1MxNcLrgY32NeALAmsbT9hDaekD9RVvJoS41cBhnSxtFjFWa6iT9dS0opiwG/27i+8eTdfnIfyTw8WPgrENTYkDH1pXyJsV2WHr+5MagWrUZb9HQfuxWvYegdzQ4RE34GrGjaFMLvEx0CYCwIlfjuaYVPUlprTMbQD61x+sIZ75WhFAJ4VYtaaJyAhcuxpRcbonhCEUCRD1zI1jimt72cmAvkFYHudE7L/eaQlcx5Pji3KuxDdEH8altYfi9OV894TY4YUudVUbdAxBTa0yKAfvMbwafyxgfq5qNmGY/0EO1F0s1AU+rnBb/mRlwVyOr/jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KXCbeiqsfkGjeFnjXOybIvp6ZMZeUkJ51+Y6egbvgMM=;
 b=ANdJ3m7NA0DjIM/Kwlq7aWwW3vUL0yQwvWCOYnuopiidBJdJDghoGehFttlujvxAfakt/K60Cixa6pxl/WvY39FcLC78asAnkQV5cckfLy03HCEbroi8aDK8Y+hmfEAeRoRorVB4DNValk0ZbLHUPC/BZ9LKIWcdnlzvtTv37m6GOBQoWvWbm8wAiBvRZP745LaZ1X3f2KdvHflR1s/I1TvNC4G4qiVl6zZy+NS2pB35L0l5wVk5xvSVekvZ7sLxf8zK7Y/BkLE6HwlnHe0PwG+By0O44hAEqB42ruISPZAhrdu5VdneEb3Tn4rQYrLgosG6FpGqRjpkn/LD1RMm7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV3PR11MB8531.namprd11.prod.outlook.com (2603:10b6:408:1b6::15)
 by SJ5PPF37792A6D2.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::820) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 11:56:16 +0000
Received: from LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d]) by LV3PR11MB8531.namprd11.prod.outlook.com
 ([fe80::d341:6ff5:fce1:c6d%5]) with mapi id 15.20.8746.030; Wed, 21 May 2025
 11:56:15 +0000
Message-ID: <72abbf64-a40c-487c-b08e-840dc1a5b6f4@windriver.com>
Date: Wed, 21 May 2025 19:56:07 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/1] autotools.bbclass: Copy
 gettext/po/Makefile.in.in to all po/Makefile.in.in
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <cover.1747817251.git.liezhi.yang@windriver.com>
 <ec444128381202080ec89649e127d0e6ae6cbdf5.1747817251.git.liezhi.yang@windriver.com>
 <20864857-AF77-4A76-ACE2-B5548B42A7C4@arm.com>
Content-Language: en-US
From: Robert Yang <liezhi.yang@windriver.com>
In-Reply-To: <20864857-AF77-4A76-ACE2-B5548B42A7C4@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0148.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::16) To LV3PR11MB8531.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8531:EE_|SJ5PPF37792A6D2:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f30e001-0b8f-4d5e-7d76-08dd985e7d8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZDZoTUZvYUFwUnZVOHhOVmVFRlpWZmRiOG1HZFdRSTZwQ1ZrUkJsTWNTeC9T?=
 =?utf-8?B?YWtrbjV5WWFlKzRNNjVRM3hEVHdoUmtmRTVubmJqa1k4dWF5Z3R2eU9rdEM5?=
 =?utf-8?B?OTNjdFh6OVNJbjEzNklhWHBxYTFSYUNpRElMVnZSUTNBdUN6Uzc2ZllkYjBN?=
 =?utf-8?B?YjREM0EyNjhoWUlZOURDazdQbG5HcXZtK24vc091Qk5ocDlKdWR2NTdOT3Vh?=
 =?utf-8?B?aXQvTEhhSUlKT1VudEEyVk8zc2FzTzYvayszcktqVVVUWjBDOVRaRHJRVld6?=
 =?utf-8?B?U21lcEw3czJWUThwRXd6SzVSYXFNQ25IV3o4RDUzY1Y1MkF4RFM0azFNL0N3?=
 =?utf-8?B?N2FuQmI3R2dZZFZjME4vN2hSelYvemlFRDd2OVdaRE9EdjJsU1kwVGNrS2Fs?=
 =?utf-8?B?Z1JQWk1BV0RIRU05SXZld2x4NGlRSEVleFVHM2RhNDBmd3AxdHhqT1NFdW1B?=
 =?utf-8?B?eGRXcnc5cDZJUDRSWk9ZMlM0TTlXTFMwY0pBMW1MaXVUUjVOVlowbjB3Mm9u?=
 =?utf-8?B?L1NQMXhRTVZWT3kzcUlSWWNDbnB3VERkSmlNNWxOOG41TjNmcGdsZGxSS3lw?=
 =?utf-8?B?UUJqUkN6dUlOZGh5bmEyWkIzYnZneHRTOXZvOGJnTXNUVm9RUjVJaVFVY2t3?=
 =?utf-8?B?clZzNEtlTW9VME8yalZjL1BOK1hhWDFnbnAweUY1K3N1dWJMd0x0NGdkZGRz?=
 =?utf-8?B?c2xCNUg0Ym8vVEdlUkhaQ29OSURJV2kybnhra25MdndIRHloUXQxeWpvQ1lz?=
 =?utf-8?B?aHRtNzhOSXR4b2d5eDJYSS95eDFIOUNGdnZ3cStFZE9PMHpVQy9oeC9lbkNF?=
 =?utf-8?B?RTVwTTRLNkkrQlVjSUNjNDNhbUJvdkhRV05WMDgxSXpGYmJwRERDcjluVEtP?=
 =?utf-8?B?c0Z1dlJwNzQ4aXpwaEV0ZnlybzFiaDA4M2Q3ZHhkR0xqQmNSWmcxeU14TkRs?=
 =?utf-8?B?V1ZncXF3YlRKeE9JZ0FqbVc2REl4YlFUVnhuVS9ERzlTN2FSaHJkcnA0RjQ0?=
 =?utf-8?B?aVFZVFhqTE83ZWpWeWphL3AxT0k2WWcycVk4dEJuKzhvMkRLR01QU2MzUU8w?=
 =?utf-8?B?VGhDaWNHenpqRDAxbDJHcGFtTHlvV0NOWFNjQllCZTFuMVJmYTFNZGp4Ykp2?=
 =?utf-8?B?dnN4RGZ1UFBaNWtSeTJEeTlxdGtaR2REVW1FdEZGRkVla2tOb0dVUEZJNnZG?=
 =?utf-8?B?UXc1L0ZGVmlwYWlZQjlwV2N0MGVVUm1ycFhFcU1QTGJDQnlZWjNCOXBVeVNm?=
 =?utf-8?B?aHNCVXBNbWtyNy9MUHF5emNWSFNkNE4rdXZtVFd3QmIvbXFPdEZ3VENQdU5G?=
 =?utf-8?B?VG9HeDJvZEV0ZExLenBwUERQNkV5bTRFMGdieXRaU1YzODhqV2UwOWlUUjJ6?=
 =?utf-8?B?Q0pxcDd4eXVrOWxML1VPL1ZXMjhmdFhWWHh5MFoyMURJRHZpaExadGQ5OUd5?=
 =?utf-8?B?U3VqaTJleG1VajVlQzBxVzRVQU91SU9OeVBRNkhNV1RveW9EMXNiMERKRFBr?=
 =?utf-8?B?VmwvTVFDRFZOY3NuZ2ErRzhBTkVoMWxEanF3bVZpRDBPeWFvYnZpaDlLdkFq?=
 =?utf-8?B?dUp2OElKSXF4T3hYbVRjU2M0bkNrTTYrU214VkZqNTBXQUFUNnNQMnEvN3p1?=
 =?utf-8?B?bjdqQlRNRDlOb1ljcExoQ2NJMW5sK0lpaHc3TDdIYWpKZFN2RnYwbzJabDdx?=
 =?utf-8?B?aWZTZmJZYUhBRVpLRGZWcjBvYlFkOGhIT1hBVFRsZzBwR2FjYmRwVlhWT3VG?=
 =?utf-8?B?M3AxdmhUYXdxRzZqcGx5NUozRFJDWmVMeS9sOTl5U1YwQ0JTTzI5ZFdVU1Yx?=
 =?utf-8?B?NWh0dld4RVZmVDhpRlYvVC9BZlZ0azRYUjdQNEZyTDRhVTNMNDRVL3ByR1hE?=
 =?utf-8?B?LzFTZEVUd2l3ZmN6MkpUaVBoT0FLYk1KS0ZKYjYwUEZsUWM5NUZ0TmlDWk5U?=
 =?utf-8?Q?LJmC2gmJyJ4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8531.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bEM1TFcycnFXU2xicTB3b2U3SzJEV1FnVXRNckRqblhHNU9ZVmhvRFQwTUpI?=
 =?utf-8?B?aFV6OW1HQmRMQ1pzS0hWVTNsV3JMdWNZOTVEMnBpQ25kKzRBOGxzSkI4a282?=
 =?utf-8?B?d2xNQTk2NEYzZzRCN2VWOUZPWE54L1N2ejB0WUhyNVBiUzU5VmJsMXVJZk9O?=
 =?utf-8?B?ejJtZzV6RmdJS0hUdndzQjYwa2RQME5YTklkMkd1QXdzZ0o2ckVKWnFVZnJo?=
 =?utf-8?B?SWZqOHRwZWlwcU9hQzZSZ3V6SFA4dE03MFhKbndFMys2b3ZSb1kwekRqRTRz?=
 =?utf-8?B?c1E4US8rOE9zVHc1MHlHeElXeWM2SnRBdTBnT0h2Y2dMMlQxaG9MeVhZY1Fo?=
 =?utf-8?B?NE5DMllvTXkra3U5cWlYREhzUmRjNlhDUmtxSGtRancwbDdrNTFYRk9USnpl?=
 =?utf-8?B?Y1ZpdUJVdmZ5VWkxei9WY2ZCbWxVTktvUlNlVG8vbWpPcm5UeGxPcVA4a3Bo?=
 =?utf-8?B?RUdNeXNQcXkvOU5BNFdqakJFRkwxTDVXZncrc0FYeGpMUHlud28zMm5JdWtz?=
 =?utf-8?B?Y2FBeUJGVFRFbnRXclBlNEF3Nyt0Y2V0NGw4L3ZERTQ5RzRCMUFESTZIaTJI?=
 =?utf-8?B?Z3drcDMwMytvSnBRWnlSdDU4MEUwWkkwVU5nVFBmQnI3eTJlVmEzZCswbXB4?=
 =?utf-8?B?UUhvRVdVbjZnKzZNUkg4cjRTaFlnbDRmRjFKRmR3UEp2VFVQOHBrTzVGaGRI?=
 =?utf-8?B?NXd0Qmx5WUdFRDhGVmxINFZZWU5QbTlVa1p6cG12RWJlcWsrZUtBdzlDR0tC?=
 =?utf-8?B?SEhQS21JV3g1dHNCeEhKMlQybnh6bWQ3ODNYWXMvbXlBYklJcE44eFdjY2F1?=
 =?utf-8?B?TEJ2SzByRzlGYzBaT3Rtb0c5YTZXV3EyZjZyckMrWXJZaVZFVERQeWV5SUlU?=
 =?utf-8?B?aXplTW9JUjZBcmtrRjIxMCtKeDlYQkR2WWE5TTY5NUtwTlhhQXJGVXdEbmx4?=
 =?utf-8?B?U0hhTFVKbmZWeWV1REkvV3dmUmRJenlDTk9PaFJMODcyWlByWEpTQmFDdzlT?=
 =?utf-8?B?QktROFVvODFjbVlSb2RNcWVyMnVLUjVDcWZzelo3R1YzbTMxQitJMk1xWm1I?=
 =?utf-8?B?aFJvbjJOdk13WWdBYUZEc1UvOGx1bnZrWmVLNVlrUTBhUll5aVdpdm1HRDcy?=
 =?utf-8?B?dTJ5R25MYjJUeDIrMVpZYkVncjArdVpueDRWaUZxNHo0cXVidkFWSmVRM2dl?=
 =?utf-8?B?bU55U2VpUDFHczk3YlRvYU1nNEFFTmxnWm9aa1V1N1BEVnNQUERiQWhuNmVI?=
 =?utf-8?B?MVpzY29qaVpMdVhKWUNpY1dMQ1A2dk5xcGhOQVY1Z0xGOGhVQ3V6c2JNUUU4?=
 =?utf-8?B?ZVlxaTBDYy9xUlNKMlRqMktmTmlhaU9WM2hkN25oeWVUUDFwdUlWSzZCK0lZ?=
 =?utf-8?B?a3I4SXN1QU5tcUxTK1dSNWRQZ2ovdUlUbVdON0ZLU3Jpem1TMmxsaHRSOVda?=
 =?utf-8?B?ZzU0a1BHMGN4RUZIUUw0MEdESDBFZUk2N2ZwbUltMk9UZ3k5eG50NHZOaVJR?=
 =?utf-8?B?MEorTCtzeng5SVNvNmY3UHd5U0hocURaVGlGVmJPOTJMcFdONnA5THBJbzZB?=
 =?utf-8?B?Nnlna2w0eHZoTjhzVzhYSFVBSmZSei9mYUhVRHUrbFM3Q282U3ByZTQvZ0h0?=
 =?utf-8?B?YUFmYlhXWktoYjVwQTlOQ2d6bnVmeVNiT0N4eG1RWlRmUnJvczdJNVhmeDZq?=
 =?utf-8?B?NklPQitZY1RHYkh2RGxLb1pQdURjRHVmbytKZ1doSWorOEJYVEdGL0s2dFFp?=
 =?utf-8?B?MGJpUkREYUd5cDBSbEUrVzU5bTJpVlI1dUdzMFUwQWV2YUNicDVEZUNIN3FP?=
 =?utf-8?B?Ym9lV0MrTFE0YjRXNTFkcEFtSU1sSUtYZmVlbTZsM2JSYzNWNG9DUFlGY3Nw?=
 =?utf-8?B?YXYzMXM2cnQzMFFlTEdva1dlZXlycTNraHhONUhEUlFMQWFhKzBjem8rcmNv?=
 =?utf-8?B?UXAzT0xBZlFWbXFscUlqZHpZSnIycm5KQUhyekJyam1WQnlTV0wzbkZEUHBR?=
 =?utf-8?B?UnZKdWJxUEkyNW9aVVFpaUJCbEFDMmVpWmQ1L0I5ZU5IZFJ1Sy8vSllFMHh4?=
 =?utf-8?B?Z0xhbHBxbU9MdDg1TkRmbXRhc1p0YnpFQ09jWld5UERUcFlCZ0YzWGNBemFv?=
 =?utf-8?B?SmZuTWpBNHd6OW1KVEhhZEVMVHZNcTdEakhBTnBsZERJQ2JzUFF3TmtWTmpS?=
 =?utf-8?B?Wnc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f30e001-0b8f-4d5e-7d76-08dd985e7d8f
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8531.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 11:56:15.8773
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AlSlUd082kjyKTmil/pqmm+Z9mGotTf4CmsRvhIRaOr0Hb+G7YigPoj80qsSwGhbH6zuLk+LUN2ZnPUSUkR/CWqdS3oNwrGTaEEV6+QSTi4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF37792A6D2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDExOCBTYWx0ZWRfX3kjIj8DTtEmg gZ9j8ptjPFoSUdW0JnXQnEgBKxIBKpNqbJWQ5RM4rXLtWgzOwiJ4wE0md6tjA2u/2BYvTx2bGGc bUuEbsKk2YpYceDluVZ6EmLN97sRBhTc0XzDPVXW5jiklzdANuPoBw4v0znUgmdWM0Jas6mgH/l
 lmryeH88yb/pzbgDxt+fcnb7XYYNf1Bxgu0QJU5lHMy+1kh6IahUjuzs1IR71ex7qLzD1e06rQS ErwP0wy5V/WMq7fvYqIOMydsFuA7TbMdWwjAjcJ30ZIwqeHDoqEfT5kuGF9zF3Hbw15U4kaEPlm z6s7nRB3VHx0PAyRUxWjLHvNI1r+1s0epBq/8C15ddBbUPMn4eyawEraOs0vyE347obyTsO+yaj
 6qI5d846Tcy8x23/WWsHnPkeM7ygJqtVrMg7WPub+9IsE3mjmCsj67hA5dALb+23XvQbEira
X-Proofpoint-ORIG-GUID: TOZS_6k3bqM52kwrL1KSTsXFo1csXCMD
X-Proofpoint-GUID: Dxm4vK5cPWbR3v7RrYm8MMKc_KqQtTFa
X-Authority-Analysis: v=2.4 cv=b6Cy4sGx c=1 sm=1 tr=0 ts=682dbf63 cx=c_pps a=YkRwJB1Lcas13D3J5+BQ6w==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=Q4-j1AaZAAAA:8 a=rMKeqvycNBd5n_UQfEsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 spamscore=0 mlxscore=0 mlxlogscore=828 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 phishscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505160000 definitions=main-2505210118
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 54L7rxR7026177
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 May 2025 11:56:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217021



On 5/21/25 18:21, Ross Burton wrote:
> On 21 May 2025, at 09:50, Robert Yang via lists.openembedded.org <liezh=
i.yang=3Dwindriver.com@lists.openembedded.org> wrote:
>> The previous code only copied to ${S}/po/Makefile.in.in, but there mig=
ht be
>> other po/Makefile.in.in in ${S}, for example:
>=20
> I=E2=80=99ve made it my life=E2=80=99s work over the last few years to =
slowly remove all the crazy from autotools.bbclass so I have a counter-pr=
oposal: what if gettextize works now?

I will try gettextize.

>=20
> If there=E2=80=99s a new gettext release we need to integrate, then it=E2=
=80=99s absolutely worth investigating to see if the tooling now works ou=
t of the box.  Unfortunately what the breakage actually is has been lost =
beyond a comment saying that it=E2=80=99s =E2=80=9Cbroken=E2=80=9D.

Before 0.24.1, they way to include Makevars is the following line in=20
po/Makefile.in.in:

# Makevars gets inserted here. (Don't remove this line!)


After 0.24.1, the above line doesn't work, and the new way is:

# Include the customization of this po/ directory.
include $(srcdir)/Makevars

So po/Makefile.in.in from older gettext doesn't work any more, and will g=
et the=20
errors like:

make[2]: *** No rule to make target '/config.status', needed by 'Makefile=
'.  Stop.

This is because it doesn't include Makevars which makes it misses var=20
definitions such as top_builddir.

// Robert



>=20
> Ross

