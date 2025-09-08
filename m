Return-Path: <randy.macleod@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB44CCAC582
	for <webhook@archiver.kernel.org>; Mon,  8 Sep 2025 20:01:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.4561.1757361661311954856
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Sep 2025 13:01:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=H4FZTPO6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=134604146f=randy.macleod@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 588I7XMX140802
	for <openembedded-core@lists.openembedded.org>; Mon, 8 Sep 2025 20:01:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=1Jn/p0etY6KrCKUmkLXXkk
	6pyJLUEZ8BJ0pJbQou96M=; b=H4FZTPO69Byclqn3tqWE2E11qWjcaTyjcTU/mW
	cPphnLIzXt7YOdPSOAhh4uZg+YwknMQ8X4izucSBVxlPyB35dFzwJFM7aabJLA+j
	resDZkb0MOfu+kkt5I0XUd8uZ9zUIZ6ZaiUjNfbpIoqdPYVcodNYUyGE6AQW15ZL
	iOmQLgnhRTq+Vx6soJoZDXp5wj7pA3PgQer6nyn0+1ci4L7Tq9Ff6bVfkwB3lVbA
	XHELcJ1kfkDWlIYEhAw8inxhyuarIo/XvjbFmSix1SnheGrl4zJ7H0rkaD48GF3S
	QQwuFGnArRk63E+Rjjb7hogIARUnb43VKXX80YH8oQe40ojQ==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 491ve30jvp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 20:01:00 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2CsDYHaiQ+AIKjklZgG4yFHSf1jIjskIYPkwDXgJ8PNKYqUQdkW2Q08BS4a3UXGNP6pv6I1n1xNGwhvBfsQDnANvtZGs6WmsyVd/1AtJKyivTFtENTu6y6Aq11wwvfqbJSQGgNpB+e+4k/klF98tUqypYgXn08RL9dL2cEt358Gk1HoBpXc5dSIZgDypeJt6TutHGnxIIy3iHCWd6MT2G0R6gXImn5dfmtq5bpDl0e6I1345z8ICKFM8KLZ2v2l2+KLnJBvxSR6ceOH01oKfzYMOheOmwtxqgUiHUCvBLh31qZNCehjmo/pjWWVRp0B3MMtRCbZX1N8ElD8EEfHHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Jn/p0etY6KrCKUmkLXXkk6pyJLUEZ8BJ0pJbQou96M=;
 b=vA3ybiLa+LTc+h72RDCRXhOyTkM7vKBTl8zNa6kt+t1cfEvL5agjHYIxVfYT9OYqtJ0MiXe8u7/NEhaaObi4qHarnrWSK0/542xWYQXJRZhm9uflgr2tjuL3zxFJsbBXNMEgkyRVYDUXFWMKjLQX5NuR3BmzUmDof51HlvhUTuuX1Ob8mJlRZBNb2boqHxOa+CF2/Sf2fPHh5oFNrOkJOmeTLupwl3LK4RdxT4+7oDjoNGQ2Tkva6JPgq7gOdtLQQu5F5wMq03eackraJojEBFQhBrTZphiv8SBLC6TlA+S5O0kdqmpSy1NysGLKWVmbz5I6YXtL7KORBAcZr/iKWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8496.namprd11.prod.outlook.com (2603:10b6:610:1ba::22)
 by CH3PR11MB7722.namprd11.prod.outlook.com (2603:10b6:610:122::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 20:00:55 +0000
Received: from CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552]) by CH3PR11MB8496.namprd11.prod.outlook.com
 ([fe80::cdc3:a646:2a93:9552%4]) with mapi id 15.20.9094.021; Mon, 8 Sep 2025
 20:00:55 +0000
Content-Type: multipart/alternative;
 boundary="------------dYKVRbXNI2SK6A8p3VYob3Na"
Message-ID: <eb321eb7-200e-4562-8e37-aa349c569606@windriver.com>
Date: Mon, 8 Sep 2025 16:00:52 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v2] nativesdk-openssl: support multlib libdir
To: hongxu.jia@eng.windriver.com, openembedded-core@lists.openembedded.org
References: <CANNYZj89EdN9FW9QiaHXKdjEvM672xDnjoQiOfvpkYbmXNnYVQ@mail.gmail.com>
 <2959.1756177743238083995@lists.openembedded.org>
Content-Language: en-CA
From: Randy MacLeod <randy.macleod@windriver.com>
In-Reply-To: <2959.1756177743238083995@lists.openembedded.org>
X-ClientProxiedBy: SJ0PR05CA0053.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::28) To CH3PR11MB8496.namprd11.prod.outlook.com
 (2603:10b6:610:1ba::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8496:EE_|CH3PR11MB7722:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ffa5f6d-a2cd-4917-13f8-08ddef126b66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|4022899009|366016|1800799024|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?YW1zdGxBbWl5RzZLcHRhQ01Wd0lsMjJFSktDNnh3QktMeURSK2NHU3lIL0lS?=
 =?utf-8?B?N2xMSXR2emY2YktmZXVzM05EeUcxbVAvRWRBWmhZRmFweGFSRHI1WDgySFUy?=
 =?utf-8?B?OHBRVWNMVnQ3RG9yVi9BMWNWaGs1STBXOCtFcEI5NmNSVHVRWTRTeDVUUjhI?=
 =?utf-8?B?RXAvZXNRTWczWjNHZENseEp4L3Rab0FHWmYrZ3pTSExVQkhFNGNlaHErTWQv?=
 =?utf-8?B?bVZHeWpMckl6VlVIUW5mWnpHeVdKUW5OTk8rY1FMRStWb1cvMDBnbEhLMkpI?=
 =?utf-8?B?VXNINGJlMXdNVm42VFpZR25XTVJma3BMWFpyZ2tPRzhpOWxZMnZiaTI0ZFhm?=
 =?utf-8?B?M0p2dHFTVU1mU3BWMlFiWWhUSWxiL3VSeDZha2xESllwNzFJR00zVENPMFEy?=
 =?utf-8?B?eWNWUGlWTUlLcTdCMldsNUNvM1BOY0ZYY1FLNzNZNXk2Y01JSm1WZk5wdzdk?=
 =?utf-8?B?WHF1L1dmanpiVUwyS1NKK1padjVtdWpPQXYzSzErWTZqRzdvbnpUNDdDR05s?=
 =?utf-8?B?akM4bmptL2NhM2kxR3JLc0hDV1o1NmJ2WXN4d2xkaDRjMFlybGh0Z3hVdlhH?=
 =?utf-8?B?REhyUDdZb2gvWmdKQ2Z3Qjl3bnFHVmhZeW5pejN6WGVMTGtpZWdzazJzeVJt?=
 =?utf-8?B?M0h4NWZMUlZXS1NkQlFabUZSS1hVSHQzRk1UbWxKdDMrS0ZGZXZ4MDdqYS9v?=
 =?utf-8?B?eURHWitXTitPNS9vRXZvd2hUeGE2S1BMb01zbS9YcDlzclE5aUtTZkpEeVMy?=
 =?utf-8?B?aTlwM2lmc3l3Y0hqNnFCa0ZHSDFRN1BUUW1Ba1h1SDRCWCtZRzBUK3BtRExq?=
 =?utf-8?B?OTNiV0VheFNWNk03WmwrOXNNRnhFMHhGbHcyU2FzMThoK2EwQzlvcWxFVmk3?=
 =?utf-8?B?alBSRFQ3U2ZHbHluNzVPOVY0blEyNzlWN1VJT2R2cW1nZ0k2MlZBdUNqZnV3?=
 =?utf-8?B?aEVZSE5KMndtWXR2SzFaeWFHbVIva2k0by9SRmpZTmtodEZNbUJWeWVZai93?=
 =?utf-8?B?THRVRkpLWXJmeGZZNjdRZWhMK0tRSW50bUkvV0tvSHZuVlhTTDE2TEdPOG1L?=
 =?utf-8?B?dnRZdkZaSlRCbFVWK05qRFVlVUFmaFVUMzc2YjY2Mzg1aFFLNjBTY1QvZHc5?=
 =?utf-8?B?cXZFQmo1RisrZnpkRk9BK0F5Y3JTN1NVS0pQWUFpU20yQlI4VHlZVk5YWHNy?=
 =?utf-8?B?N3dpUHRNYkgvVk5PVWFmWEFBR0w1SnM4azVHUzVXNGFoaDRabFI4ZDNtTGFT?=
 =?utf-8?B?S1ErQnV6ZUw2bkVIME1rNW80cGRUOFlOdkRhb2F6VkxhclNFdEs5aDBaRUZz?=
 =?utf-8?B?TkdRZnd1aVNhZ20yNnlTK0JnN09rMXV6UG9DL2Rxd253WkJiaVJ0bUhDeElZ?=
 =?utf-8?B?enVSbWFvWnJYYUs1MG1hWEV6L3RHRlc3REdRc1hoUFZGNitsejBoSGNJMmhk?=
 =?utf-8?B?SzJJanQ0cUMvZkNXOFNwNnRISW1xbldXMHBXYVRybVJOd2t1MnVDZ3pMOTdl?=
 =?utf-8?B?UG5Qcnl4Um5Pb1FyZis4YU9NbUE4blE4US91VXRaNG1BeUpaRDRmOHVIUDlH?=
 =?utf-8?B?aEV5eVFrYlNFS09FbjZYek55cXNGcmJlQ05xbHlsZ1NmSUM1aXRPSjhoQ1VF?=
 =?utf-8?B?NVovME4rTXVtSUJBYlBQa2NqQmZuZjZlVE0ySE1OUmdGVDlEdDVPOTN0bW1y?=
 =?utf-8?B?c1J3QnAwV3ZtMlpmZ3BRVTNqRC8xRlB2NkRqb1JNWWNHdFRFL0FRRGEvdXZF?=
 =?utf-8?B?WDRLcXVxSi9jc2M3R2J5V01neWk3ck1nVEUvZUI4b2piL1VnOHJwZm9VSHAr?=
 =?utf-8?B?WHk1MTJnVWJYNGV2YllHRnpMd0ZuUU1SbEtpaU5ZTllDMHMzUEt1M1FoZ2c1?=
 =?utf-8?Q?R8IB8BNygzSw0?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8496.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(4022899009)(366016)(1800799024)(13003099007)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Rkt5VTlSN3dQQWpFcThMWGlMNXhwVTZ1MnJQS3BSelVGOXRZZVYxS2ZNUW9H?=
 =?utf-8?B?YnlyeS94MUFQeVQ1R0c4M1RKYmg5SlpmUlRJQnNmK1dhWnRZV0N5cjBZelc1?=
 =?utf-8?B?WDhSUnBwOHlYd2F1cUZYKzNHS1FrSTdlK0s0QUU5RWJPZEVSNmdKM0lDWFZl?=
 =?utf-8?B?VkZpNno4VkFXS29mSzZTeEhiMnIxRC9Pd3p2RVlSYm81dFNXb3F4T3IvdzFw?=
 =?utf-8?B?QVJDTk5oLzdjRmZRYWdXLzFuUUJPRG1hcVRPQmxiNUVpODY4VDNQTjJ3UytQ?=
 =?utf-8?B?eTNQd0Rzc3B4RWNqZHhjbjROMlc5c2FrNmtGYm1XRFU5VjVWalAzNSszYWNn?=
 =?utf-8?B?WVZndWU1NTczRnVacC9UY042VitsTVVZWnRuOFFubUlPakNpdy9zSzNxR2FI?=
 =?utf-8?B?YjdWUGc4VFdTWnd3Q0RZOTVjK0FrNm9TSEZOdVJudnNpVnRsckNkZ2xYRDlQ?=
 =?utf-8?B?RitoMWxmNHRzZnh4bDdaaUkxV2x6SEdUWTNjZTIwc1lXYmlVWm9sQkMzWDda?=
 =?utf-8?B?WUNPQ081V0JQMkZKaGh2Qm5iRDFyUUdySzkyajgzS01XN2VibVJMSitjNVpW?=
 =?utf-8?B?dVJMQU1JN1M2b1F2YWtDb00rZk9ScU8wK3NmSGw4SjlTeWZKUmw5L0RzSVgr?=
 =?utf-8?B?anYwbEZOcGVHZlBLeFNFWm9NYmlybTlaYjk0ZUVnL1B4dFprUlFPVXkxZnNJ?=
 =?utf-8?B?MTIyVThCQ2Zja3VRR3RNQzcxcE90a0xvVkpNUDc0emptN0loa0ZOdUFHSUNY?=
 =?utf-8?B?Zmx2MWQreTBUdlJqWVorTWZlSDQ2WVNwYnp1NnFRS3QveHNBYlVaRE1mS0tj?=
 =?utf-8?B?bi9FVEVsOUx2cmJMdyt0OE04VWI3YjZjRVJyTEY3Sk9rWTRsY0liNFRGNnBx?=
 =?utf-8?B?d01HQ09tN1JrdW5LOHJkakNGRFVUNEd4WWVJOXo5WktaQk9FRG9hV08vQ3BU?=
 =?utf-8?B?WjhkOVNtb2IxR2tCVjN5RHpyajMrOEVaYTRRTk42V2tDSGhwbHM3NzBRRjRj?=
 =?utf-8?B?UHBjUG9paEFhN0hQRU8veTJGSnZEaW5JS2JHaVVaZytlSDMzK3ZLL0N4RElo?=
 =?utf-8?B?bnZ0TFh5YkhjVHRMYUNjMHNQUjVISU9xa0RwOGVpRUJvTWZqRHIvU0g0VmYr?=
 =?utf-8?B?RTROR1Q0TTBPb0I1aTJONzVENjdBb3JMVlBKRXlETVluYVZGVklnd0k4VFNL?=
 =?utf-8?B?d25ZZWxCRzQrYVk0VUZJeWl5ZlZaOVlQTi9kS0dtd2VIRVR1OW5xSGZWY3Jk?=
 =?utf-8?B?SnJyYnF2ZWdwMHpKZmcxRGJXNHNCRSsrSHEzMnQxZGZrMTl1aW90QzlzTTND?=
 =?utf-8?B?NGR0RXo4Qkw4Qm9heWtVMHh1czVkeVRpU05MMXJHckkybzAyTU5pcXdUODhv?=
 =?utf-8?B?dHVxdUdLN2VGTVNNS0kyb0U5SnpxaFFxbEl1eUl3d0lOMWtOVmw1SFR5ZzZW?=
 =?utf-8?B?R2NPRzN6U3ZqMmNwWWYwYjlrcGE4WkRaNGU4bVNRNmYwRlQ1Q3B6bU9hVmor?=
 =?utf-8?B?Qzd2WnNJSG43L1ZmT0owQ1RCOFdSYU1uUWVVSTRMYVdFZHFpbDZDa2NVMGFZ?=
 =?utf-8?B?eWRIdVcyNmdQVE95RnBZYWdHczlrelBvUndZclBLRTdPb1FNSzhtLzNzL1ln?=
 =?utf-8?B?S1A4dk9rNWZ0YWNYNnBYYUZpYW1mOG9XdGRaSkJQdDRsN2Y3YmMzUWUvV1dn?=
 =?utf-8?B?YTQ4Sms0bk1oWmMyaCthY3ozK1lvL2JxQi95YjV4QWxlU2ZBdXhtczR5M1Nn?=
 =?utf-8?B?ZUt0dXFJWHJSM2o3TmxvYmhpRGN2WmsxSFcvTm52akpxRFNsRVlDUlRFUm81?=
 =?utf-8?B?MkJJa0hjRTJPUThGNlcyYnFsdGZVMC9ycyttWVI3cHhjUlNQWjRWSlVLQXpm?=
 =?utf-8?B?b1Z4VDhRU3BJWHZYOXFFQkZWanMrcVBBOWNyVWpPNHBXaGJyRmVnd1FSeU9W?=
 =?utf-8?B?cWVSTUp5M2VHbCtKZGRhT3poU0N0cDE5ZmtxNlI1a1NVZHExM3dIdVpDMmJ2?=
 =?utf-8?B?QTNIMG5ud25xN2tvbU9taFRMRFFiOFk5cDlnUWY0U3Jyd2x6N1UzeHJvK2ht?=
 =?utf-8?B?ODhNY05SWmdTT0VUL0R2aGpHZ3lURExXWXhWTVdjNU1QOWtpYjVFQy9rN3Zm?=
 =?utf-8?B?SGxlSVNCbnpNZGRuMElpZVJwcEw3ZlpyWVBjMlQwaTZEZkhsMlZOcU5MakNp?=
 =?utf-8?B?dEE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ffa5f6d-a2cd-4917-13f8-08ddef126b66
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8496.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 20:00:54.9896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+ctzaXCOeBHgN7yJGVu1+vhYT/vQ3eGVLmMeFLnVB/eMtasluboC+QSTHaNoo9IxCTgTrGX4QMkVRgN/s+2OmRW/Y2emZlpkA3m9Fze1og=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7722
X-Proofpoint-GUID: qbfTosloe5kjQh8r9jFCyrYYNLSkOx1N
X-Authority-Analysis: v=2.4 cv=U4mSDfru c=1 sm=1 tr=0 ts=68bf35fc cx=c_pps
 a=Uxc0GFoxdPZgc4BcwYY9pA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=9mKKIDYaI_nPijLMu9sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=cohnsRh1lYnEMWr9dJYA:9 a=kDknKEkV3c58r4gU:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: qbfTosloe5kjQh8r9jFCyrYYNLSkOx1N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDE5NiBTYWx0ZWRfXxOMbBjVegET7
 BveZByj7WXsC2v99yi6V/kloV8xyiobMiWfL1PSxopAeNrSTmyRx8EkA+1PWfn9ec9mT7uYEqBB
 V6PeVFXAwPtgj632iKf0hKlgddX69ojxmobl1eilyAnjR8qXdu+PvhLOEXTzzQMD4oU4mHYbgSX
 qhd1WTHHQJ1gy0AtBTy4+Pm761IlujSBMnoxkVpnsGAAtMghdrALkLE0EToe1DRYM6qZ3O+E+Ss
 dwHp7qncyegGVTeM1W53Fxfmctw94fUlBi1iA//R0XBZFnFg7A0Olk6rh89T4LXnEn4CKxPDrNV
 KCoPEnmHBEEU+OcUEgmxvmThFTROu9viB0ztpao9MuTg1ADBovhf0i1xWeAK0Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Sep 2025 20:01:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223078

--------------dYKVRbXNI2SK6A8p3VYob3Na
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 588I7XMX140802

On 2025-08-25 11:09 p.m., hongxu via lists.openembedded.org wrote:
> It is customized locally, such as use 64 bit nativesdk-gcc to build=20
> 32bit application
> I have sent the patches months ago [1], but it is not suitable for=20
> Yocto, because the implement is complicated and the scope of use is sma=
ll


Right. Yocto does not and will not support this.


WR should continue to send patches but they should be marked at RFC or=20
FYI with a
comment that the feature is not supported in oe-core but other users=20
might find the

patch useful.


../Randy




> So we support it locally, but we need Yocto SDK to support the ability=20
> of multilib extension
> Commit =C2=A0[2]=C2=A0 is the similar patch to support the ability of m=
ultilib=20
> extension
> [1]=20
> https://lists.openembedded.org/g/openembedded-core/topic/110767332#msg2=
10201
> [2]=20
> https://git.openembedded.org/openembedded-core/commit/?id=3D70318775524=
4b1a45dd9f90aeaf620d4c92a6757
> //Hongxu
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222429):https://lists.openembedded.org/g/openembedd=
ed-core/message/222429
> Mute This Topic:https://lists.openembedded.org/mt/114812592/3616765
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [r=
andy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--=20
# Randy MacLeod
# Wind River Linux

--------------dYKVRbXNI2SK6A8p3VYob3Na
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2025-08-25 11:09 p.m., hongxu via
      lists.openembedded.org wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:2959.1756177743238083995@lists.openembedded.org">
      
      <div>It is customized locally, such as use 64 bit nativesdk-gcc to
        build 32bit application</div>
      <div>&nbsp;</div>
      <div>I have sent the patches months ago [1], but it is not
        suitable for Yocto, because the implement is complicated and the
        scope of use is small</div>
    </blockquote>
    <p><br>
    </p>
    <p>Right. Yocto does not and will not support this.</p>
    <p><br>
    </p>
    WR should continue to send patches but they should be marked at RFC
    or FYI with a <br>
    comment that the feature is not supported in oe-core but other users
    might find the<br>
    <p>patch useful.</p>
    <p><br>
    </p>
    <p>../Randy</p>
    <p><br>
    </p>
    <br>
    <br>
    <blockquote type="cite" cite="mid:2959.1756177743238083995@lists.openembedded.org">
      <div>So we support it locally, but we need Yocto SDK to support
        the ability of multilib extension</div>
      <div>&nbsp;</div>
      <div>Commit &nbsp;[2]&nbsp; is the similar patch to support the ability of
        multilib extension</div>
      <div>&nbsp;</div>
      <div>[1] <a href="https://lists.openembedded.org/g/openembedded-core/topic/110767332#msg210201" target="_blank" rel="noopener" moz-do-not-send="true" class="moz-txt-link-freetext">https://lists.openembedded.org/g/openembedded-core/topic/110767332#msg210201</a></div>
      <div>[2] <a href="https://git.openembedded.org/openembedded-core/commit/?id=703187755244b1a45dd9f90aeaf620d4c92a6757" target="_blank" rel="noopener" moz-do-not-send="true" class="moz-txt-link-freetext">https://git.openembedded.org/openembedded-core/commit/?id=703187755244b1a45dd9f90aeaf620d4c92a6757</a></div>
      <div>&nbsp;</div>
      <div>//Hongxu</div>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre wrap="" class="moz-quote-pre">-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#222429): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/222429">https://lists.openembedded.org/g/openembedded-core/message/222429</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/114812592/3616765">https://lists.openembedded.org/mt/114812592/3616765</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:randy.macleod@windriver.com">randy.macleod@windriver.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------dYKVRbXNI2SK6A8p3VYob3Na--

