Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C66BDCAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 10:03:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.13777.1758881011764261511
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Sep 2025 03:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=fqoSXIRb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1364670208=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58Q4tDM61645808
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 10:03:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=OxxIgHSTY731IJO4ENBcEW57swaqNi6oYKNvtR8nrug=; b=
	fqoSXIRbcplZRATHWAAEycLwCJjauxaSPo5YAqwM353LoCnuLbX20JX857IegZrZ
	s1OdEpP40h+NQ/5UXd7pzSfuMO1tre5ZyA+VXcC49vv2YQwELSoG90cGWmh98I3a
	sq+9GlDobkKHgHbfm8AlZ0e+DXhh9a7hweb6wi4evmG54LBO6l/uCP+OpifQXnHX
	Wxo8s+D4bk8mh6KGC+YI+l2cL/c1nKW5jkHVs8jyVS29X9FzOkEHLc1qjD9pKhcg
	TOi1rhM78vSMLDVFrsOK/KNT6de7Z43xRNJhIIj6ii34p4CxVuQMi40CZP0ZyOPM
	53n8yNeM4UyAvPnP/4mYbA==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012017.outbound.protection.outlook.com [52.101.53.17])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49dbsm8nbp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 10:03:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EUYfQsZRw10qQmTMWimEB6TRm90MzS4IIv9sI/J5mbI+WtvdYW/47bAvIwgyPzAhjFa4RSVv3yzkqQWB6nT/smob/nTilfx/v7WIftmv2p0HoO9Jh6edQtEgtuhOQD3E4M4+czX0eqjpv4q1adDZgwb3CWV9iCWvkjlq1AhpCqbmL079KY4rHrd2Y6qEiFuVH/By4+FVBN/5MGi1JtcTcdocjt3HnlkMLT/3YM7hOikt6jBrgdr/Z4h9FS5g88XCX20cjaRSm7N8CUwetaExx5t1UwIRUAdOJH6N/YM5rnVpfO8mBWQJwK3xQge0UTPUZgYO3s6Wg5Tp0XPc5K9nBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OxxIgHSTY731IJO4ENBcEW57swaqNi6oYKNvtR8nrug=;
 b=UK+3ynJGkIBl1Yi75xHQfUi57LAMhQHNXT2zRKCyrYSw1NRF6DVbIkZJktg+sFCVCc7aZxCPQ7uHolCnA8xTG/sALsGQ038OkMo4GnkRdGKNjT55CM//vg0wvlyzOJdv+Arcfgi+uIHs0gYnChVLk0tTgG9OYi9XRnm1GMiX3ld0Tf4g0alj3tt+aAl+aPhrq/22jc/xRu0BeddPqyt2x+6/DCSNZKHiVP+mLQPBCrfqrJ3A4Of0g1GaTX+zNBIFhp5oc5A7KV+kV+oQs7MpPNEgbVHE29I5q0XeHIor1AEbCTgiHKjO95m24zLo60ylGrd9sCn59hqHqI/kSVSCAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by SA1PR11MB5948.namprd11.prod.outlook.com (2603:10b6:806:23c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Fri, 26 Sep
 2025 10:01:46 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 10:01:46 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH V2 2/2] rust: Drop rust-llvm
Date: Fri, 26 Sep 2025 03:01:14 -0700
Message-ID: <20250926100120.3731171-2-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250926100120.3731171-1-Deepesh.Varatharajan@windriver.com>
References: <20250926100120.3731171-1-Deepesh.Varatharajan@windriver.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR03CA0133.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::18) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|SA1PR11MB5948:EE_
X-MS-Office365-Filtering-Correlation-Id: c0128a31-15cb-4163-e588-08ddfce3b416
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c04wTWhsc3FWSWNRczNQWXJIK3BuMnNoOCs4SVMxWDhFWU9VZXJxd3ZpUGZq?=
 =?utf-8?B?NVYwcEFCS3VGdm5qNzZLTlZmTVpZeWhuNThPQ29HN2xTc09uUXhjeTZURVlX?=
 =?utf-8?B?Wm5FOFJZaHdMbDVxd0tGRWtTdmNONHozRmMwS1ZqQ3pQTHVvMjZINEs4RHZk?=
 =?utf-8?B?LzhoWGhuWUZtYm1nd3J1Sm9VWWQ0eHZsQ0xtai9CVjhlVWFHaGdQTlZkRXJU?=
 =?utf-8?B?VkhqcTRrK0grd3pwRFBPOE5UenYxTDN1OUxYL2t0azJ1U1BSL0lzRHZieW9G?=
 =?utf-8?B?dHBFbVJEeFZTKzl6UmRHTk00Vi9SY0NMTnBCdE5PK1c2NkRsSGw4eWhKcHEw?=
 =?utf-8?B?S3RqWHV6YjZqazJLdWZCZ04rUG5zd1ZHaHZUMzBFamowaFY4d09uTW1vT1ZX?=
 =?utf-8?B?dTJDY0t5QW1McEJieXR2d2ZUSXFmQW80Q3A3Y2dCdTN5bngvbW41c2tQWlRY?=
 =?utf-8?B?cXdKYmZNWkhjRC9FU2w0TjVFMWIzWTR6WVB0V0xiMy9vUmo4QkdId2JpQkJG?=
 =?utf-8?B?Q3BxRTJSRldySGhJWjdaM21rYURVeUNub2xnSTVScVlUNWQ0a0sydGg0TDZQ?=
 =?utf-8?B?MEhzZEZpQzN3M0RNZW1IY1NVUWswekx2UUcrM04wd28vZE5FaDdyaUwydDJF?=
 =?utf-8?B?VWxzOC8rVTBJSVFQck1HRFloS1p2TkJRSGdnekNJQlpyTG4yMkNRSjVqRmFz?=
 =?utf-8?B?WUQ5VE53eUJlRU9VOEhtV244aDc0NDZKa2NTS1laWGVIeFJDT1RzeFVQRG05?=
 =?utf-8?B?KzVuTE5SS0QyamFhWGROcXI2RWkySGwzWDIvOUwxa1ZCaU5BVkZZOGRVTGl5?=
 =?utf-8?B?R3d5YUFkYU9UZG5vQlcvbzF6eUdSL3M2UEQ1YlFrNnk3NzZaQ3ByWXNaZ0xG?=
 =?utf-8?B?SVBQU1lHMTRZS0xBYzA1ckZMdTIwQjJBc3hzWk5zM0tBdU5kdzVuNTA5RWhs?=
 =?utf-8?B?SHRrcklpdXpFZVNIUlN3S3YrNGxuUmhZSWhocExocjI3RUl1WGFYTDBjdE1B?=
 =?utf-8?B?U00yS3I5TG9WYmdVTGpPL1JQYnl1Z2pPR29lRVF0NGFZVmpsZ3phNk81U0Qv?=
 =?utf-8?B?VjEwV1RLV0c2bjMwTytQU1RudEIyT3Jzd2xkaTJvT2FFbFhZTytpNjN0eURC?=
 =?utf-8?B?NUN2RXY2TnpyYVVpNkZYR2FVRTN1ME1lTWRxYlQvMHA2ajRZQ3FRZWhMMFlq?=
 =?utf-8?B?TEJwVm8rSDRpZWM3VDJodm9YNUx2US9oK0RUMC9wM3BXNGFqZGx0NXpDQXdB?=
 =?utf-8?B?blNhUSt6SWdrRGYzK3R4ZTh4RUg1NXVQWXVJOHhGVjQwRVJOZW4rK3FKSTlm?=
 =?utf-8?B?NFZ3OVBYcGh6bUpqYTEwVHlKZUt6NTZvaGk1eWp2VnBwR2pSak9JQm5sYnl2?=
 =?utf-8?B?b3BqZkJ6Z2R3VFB6T2luZnRZSmYrWlkvc3FjNVRhaS9EaUJlRXV6aVByc0dr?=
 =?utf-8?B?NklkYWdscXc2ODdWZzVTa0IwbmxGRDY1YSs3ZWg3K3ZYaDlDVjFNcUM1U3RF?=
 =?utf-8?B?Y2tVSURjWithMytxS1RaMW9uMk9kSXNFb0VHNnFhWElKTGhwVGd4VkVHc0xi?=
 =?utf-8?B?RlkwNjVmQS9BcVRGUjR0YTdyRlVFcWpPZlJybUl1bUdPMjYySy9nWDdoMzRZ?=
 =?utf-8?B?bjJGQk40MFpVZ1NVVGNaZUdqVk5BQytzbU9lLzEzT0JsWHcxMUdBbUhycjdm?=
 =?utf-8?B?elRZLzJLVjU2MXg3LzV2UTJTTU5KTllHc2dPL1hVZ0N5NXl1cm9TVm00UGw4?=
 =?utf-8?B?U1FHY3IxUnZDdnJpRVgzSWpvQjdJWFZQRTVIdS83eklJQlViWFd1RzloMkVy?=
 =?utf-8?B?VDFvYUc4RGNtWHRiUUZNU1NqcWlDQkZ0Ty9xVWtPZ2k1NWVHZGFKa0N4Z0d4?=
 =?utf-8?B?SmlmcXpzbCtqaXRtOHJtWjljanpuMlhWVnRUU0k1N21VY1d5MmZ6OEtKd1Vm?=
 =?utf-8?B?QXByb0ZhWnN5aEdOaEJCS0xjV3R3bWxLY1hYckhHZTQ3NEhnNXI5UEtUcmY3?=
 =?utf-8?B?SzMxZW1lS21BPT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SUpMRGdYM2l5R1d5dWlTQlhxRTdibEp3RE5FbjMxWWFLRHl3MzVwdjk4ajB1?=
 =?utf-8?B?eW8zTkVQMm1tNSt2TGN6WjBOTC92cndQZnBUVFRKWFlBelB4Ym5WcG1IWjlQ?=
 =?utf-8?B?b1hldEphTzlFeUJGNzdzcERXWkswMUNQR2RLMjIzSHVrZGFzVC9mcnVLbXpo?=
 =?utf-8?B?Ly92eno1Y2NoWDZwZU5HMXcwUXp3UkFsNUxpcDRmVEJ1RStEZDlDY2dlalhy?=
 =?utf-8?B?andnY3hReFR6Qi9iWHhuemI2TTJNWjY1emgzdTlCZVYyem90STk0R2lZTFE4?=
 =?utf-8?B?S1c4cTd1cGxveFQvK1pLbXVhci9HSHdwanpETXp0NTVWeDFkT2Fnblhra295?=
 =?utf-8?B?TTRmYU01TUpodEZpek9GbUI2YTA2MWJpMUJlem01R28wdzFQVmM0a3dMUFdC?=
 =?utf-8?B?Q1k2U1Z1Zkd2RElCM1czNWtQb3ZWdzVHbXRaY0ZKMVdERlRkbVI4Q1FCNjFH?=
 =?utf-8?B?MXpyQitkM3JsakU4Y2NhaUR3RlVIQUwybkxMSEx5WVRuaTZHaXFHdG8yblg2?=
 =?utf-8?B?NjF6dWhIU21EVUprU2JDd0Z6MjdEV05PUWxlVVVWNkFla3UxL2pXTXhLSTFX?=
 =?utf-8?B?dDYwWE4zQ1I2TmJXVFZNLzNWcGNkV3V2bXpyVW0wYTRSREpTR1FzYkFSZFo4?=
 =?utf-8?B?ZzNvR0dQQWVycW05eGZCWFN2REQzYXlGK3NJa21IZVBEY2x3TzZURFFVK1Jo?=
 =?utf-8?B?VFBtblNpNk5LRmxWUTVjZ2wzZ1UvWXFxeHluNmp1bTNMSnY0M29HR3ZDZUMy?=
 =?utf-8?B?UHpSYUlsZzZ4Q2hlbkhCVjFWYWRJV210ZHNUb0RtL0JRSmx6RVNwc1BIRHJY?=
 =?utf-8?B?SHl5UmNLMHQrOHN4SlhiMStTUDhkMWdjbC91L2liTXZJWXZQNE1UWWhBYjYy?=
 =?utf-8?B?dmZhSk9QamtUaHFWcWt6bm5oQll0NlVvblNsRlcrb085b3EyU2JLTjBIazBX?=
 =?utf-8?B?cFBXN2JJWDJ6TTFKVWg0dm9iVjdyamVCaXVHeFdrUTNPMmVjS0EyT0ZYbGlD?=
 =?utf-8?B?Mys2UnhBMVhET2l5RzFweU9ZN3ZTTlFYNkFlcklZVE5LU1QxdVcyN1lqREd1?=
 =?utf-8?B?VmVTcjJmTUtFZkZsMU0xcjBPbmtDbG9CSHhFV29OL1BNTkk2bWJreHJWR1Fr?=
 =?utf-8?B?dUZmUy9BSEZMaG5WTDBWS1U4OW5tZzd3bGxsSTY3OWIyYm5VYTgrcU11dDgz?=
 =?utf-8?B?UmhHdDNwK2NiZDVLYzdpTWN6U09sM3hPL08xb1hzVWV4bWRtUUtScXhiRnN0?=
 =?utf-8?B?QTdkZGM4WHlBOG53elU2L01lcy92bUhwV2VBL3YrRXgrL205VDBkWFVMSGxE?=
 =?utf-8?B?alM3eU0wZHFuM0pKUWM5UGdleTlyV3paUkQ3V1c5R1JONzV2bjdhVDk5bUs0?=
 =?utf-8?B?VEJFNEg3R1lHbWY0NGFYTDdoUm1NaFE0MWh3ZjVobnVpcmhKdUt6VHNWaVlv?=
 =?utf-8?B?U1c0aXB2RFhObkhCRXdHRENFUEVhLzNyaDcwV1JTQXlUek81TU5nL3ZDdit2?=
 =?utf-8?B?OUFReGpuQUxTMk5RdDVFS3hMS3NxYkhITGdramRJMzZVR3lwOGpxSThVZXJo?=
 =?utf-8?B?SU5DYTdRaHJzZFBTeHExbHAvMU5TckdLQ1VoK1hZYXFuNldTTU5RMStUQWlC?=
 =?utf-8?B?QmlVV0haeFNqbDFiNTczSnlpTi9PNE5vM2k1aTZwenIwcGRHU2t0a1A2UktL?=
 =?utf-8?B?U1lrM0lBaDVxcGJaclBSblpVZEwzQXZ1ZXg3eGlxdFZWSEE2MnU5WG5MVUtB?=
 =?utf-8?B?Q2l6QUkyMWo1UEZ6Mkl4bHh0RDYxUzhBTUtpWDR0SXhhRnpnZkVMOWlPUlli?=
 =?utf-8?B?OHlNcy96c2pDVGdxZFlMcWZqMWtSay9OU1l0NkhxS3lCV1N2bldGR0tlQ0Fl?=
 =?utf-8?B?NG9MT3cwWVdhQmRRaWVtTXVaOVNjUmVtR1JtNkZoZWRWWTRrQ2hLbTRMUGNR?=
 =?utf-8?B?a0pVblNVcGxNcGU1REJGMEpTNW4wQTBrdUhtY1NEcUJyUnB5ZkVwWXBNSTc1?=
 =?utf-8?B?MnErTFk4eFF0ZUhVTkc3V1FQSm45M3JtOGlFSVpxdlVrTXBMdG5wZnpuWGUw?=
 =?utf-8?B?M2tiUmhqT2hjM3BaR3cwazdEQ2JVWTJCbHpXUE5YQzZMTGFYZ000QmMwendZ?=
 =?utf-8?B?SnFJSDJnc0hoTG1VdmE4WTd0dWQ1VGxYeFNQUW94WWd5WkEzalhGR3ZORDRJ?=
 =?utf-8?Q?C4zRH6427Dj8IArfAQp9VXM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0128a31-15cb-4163-e588-08ddfce3b416
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 10:01:46.6666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D8Dq5nkT5pG0vvvlH1gFnOs1Sfh1ADF2z45JoMPuBGKMWW4+X4U6XJAhZ2G/XhtbLaRDHVnOkeUlv+0Vt2kmF6wt1Q49KvSCWWuJfOhHUBIP39hCxGXsfkOvfxUFuVko
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5948
X-Proofpoint-GUID: G1b3Mc5ITZF5fhBDvqIJin9OlvrLNiuJ
X-Authority-Analysis: v=2.4 cv=TJhIilla c=1 sm=1 tr=0 ts=68d664f2 cx=c_pps
 a=8SVoR3TXwnQnu/Z+5+8XkA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8
 a=mDV3o1hIAAAA:8 a=Twlkf-z8AAAA:8 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8
 a=7CQSdrXTAAAA:8 a=iGHA9ds3AAAA:8 a=8wEic9LhAAAA:8 a=pGLkceISAAAA:8
 a=IvTj1HvjAAAA:8 a=JVUAX_dDDhsBa-RCHgwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-74SuR6ZdpOK_LpdRCUo:22 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=M9VCcFR7d36vLOFuqMn8:22
 a=kmyLcwvAnC_t3PsnBtKb:22
X-Proofpoint-ORIG-GUID: G1b3Mc5ITZF5fhBDvqIJin9OlvrLNiuJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI2MDA5MSBTYWx0ZWRfX+zjdzBn+8QmR
 dVpOmgDzUCM8dXU3vIiD5wROFz1P9DT3t256R66L5YOobnBBK6GRXrvldIipTIyFK8DU8mRt1z0
 sv7t9sVwFm4dxl57nZe5kWaai9WTz0dmAIJsIJyZ/Y1vomdMNlandBc4pe2mKiZBaVtKoGueF0D
 a0nQet3yJySvF6xFF3lKdeS/j4w2DU4neIt9J4IKuesO1VgXmwolqwdp/xINkumTu9TW16vSui0
 fvfK4Z4VYcHscV1GObblLiRT9AB68GmSNnsx31S805+pWEGZklbijVexQpwa92uoQsY/GurrtMM
 olN1xCyqQvri1A6p0pVrU0Rmz/aoMijzZQLRUnm1jVbJ+WsAftobMKtwlAzcyJr5s3GQx/leIbg
 onnaUL13syOBd+YiJMmxsCTAOWuBsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2509260091
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 58Q4tDM61645808
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Sep 2025 10:03:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224071

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Drop rust-llvm recipe because now rust depends on clang for building

*Dropped Patches:

0001-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch(Merged)
https://github.com/llvm/llvm-project/commit/b46f34452e9dec50eee6ddbe07875=
f05e421a81c

0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
0002-llvm-allow-env-override-of-exe-path.patch
(We have the above two patches in clang)

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 ...-gcs-instead-of-gcs-target-attribute.patch | 66 -------------
 ...r-sort-ClassInfo-lists-by-name-as-we.patch | 31 ------
 ...-llvm-allow-env-override-of-exe-path.patch | 33 -------
 .../recipes-devtools/rust/rust-llvm_1.90.0.bb | 98 -------------------
 5 files changed, 229 deletions(-)
 delete mode 100644 meta/recipes-devtools/rust/files/0001-libunwind-Use-g=
cs-instead-of-gcs-target-attribute.patch
 delete mode 100644 meta/recipes-devtools/rust/rust-llvm/0001-AsmMatcherE=
mitter-sort-ClassInfo-lists-by-name-as-we.patch
 delete mode 100644 meta/recipes-devtools/rust/rust-llvm/0002-llvm-allow-=
env-override-of-exe-path.patch
 delete mode 100644 meta/recipes-devtools/rust/rust-llvm_1.90.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 0988bf50a7..7eec664619 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -773,7 +773,6 @@ RECIPE_MAINTAINER:pn-ruby =3D "Ross Burton <ross.burt=
on@arm.com>"
 RECIPE_MAINTAINER:pn-run-postinsts =3D "Ross Burton <ross.burton@arm.com=
>"
 RECIPE_MAINTAINER:pn-rust =3D "Randy MacLeod <Randy.MacLeod@windriver.co=
m>"
 RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "=
Randy MacLeod <Randy.MacLeod@windriver.com>"
-RECIPE_MAINTAINER:pn-rust-llvm =3D "Randy MacLeod <Randy.MacLeod@windriv=
er.com>"
 RECIPE_MAINTAINER:pn-rxvt-unicode =3D "Unassigned <unassigned@yoctoproje=
ct.org>"
 RECIPE_MAINTAINER:pn-sassc =3D "Simone Wei=C3=9F <simone.p.weiss@posteo.=
com>"
 RECIPE_MAINTAINER:pn-sato-screenshot =3D "Ross Burton <ross.burton@arm.c=
om>"
diff --git a/meta/recipes-devtools/rust/files/0001-libunwind-Use-gcs-inst=
ead-of-gcs-target-attribute.patch b/meta/recipes-devtools/rust/files/0001=
-libunwind-Use-gcs-instead-of-gcs-target-attribute.patch
deleted file mode 100644
index a704671fb9..0000000000
--- a/meta/recipes-devtools/rust/files/0001-libunwind-Use-gcs-instead-of-=
gcs-target-attribute.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From e4f4094de8ddcbe6d5ff1cdf782d2b89e0563903 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 30 Apr 2025 19:51:19 -0700
-Subject: [PATCH] libunwind: Use +gcs instead of gcs target attribute
-
-__attribute__((target("gcs"))) does not work with gcc
-
-GCC-15 has added gcs intrinsics [1] but the syntax for enabling it is
-slightly different. This syntax works with clang too.
-
-With gcc15 compiler libunwind's check for this macros is succeeding and =
it
-ends up enabling 'gcs' by using function attribute, this works with clan=
g
-but not with gcc but '+gcs' works with both
-
-We can see this in rust compiler bootstrap for aarch64/musl when system
-uses gcc15, it ends up with these errors
-
-Building libunwind.a for aarch64-poky-linux-musl
-cargo:warning=3D/mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-=
poky-linux-musl/rust/1.85.1/rustc-1.85.1-src/src/llvm-project/libunwind/s=
rc/UnwindLevel1.c:191:1: error: arch extension 'gcs' should be prefixed b=
y '+'
-cargo:warning=3D  191 | unwind_phase2(unw_context_t *uc, unw_cursor_t *c=
ursor, _Unwind_Exception *exception_object) {
-cargo:warning=3D      | ^~~~~~~~~~~~~
-cargo:warning=3D/mnt/b/yoe/master/sources/poky/build/tmp/work/cortexa57-=
poky-linux-musl/rust/1.85.1/rustc-1.85.1-src/src/llvm-project/libunwind/s=
rc/UnwindLevel1.c:337:22: error: arch extension 'gcs' should be prefixed =
by '+'
-cargo:warning=3D  337 |                      _Unwind_Stop_Fn stop, void =
*stop_parameter) {
-cargo:warning=3D      |                      ^~~~~~~~~~~~~~~
-
-[1] https://gcc.gnu.org/git/?p=3Dgcc.git;a=3Dcommit;h=3D5a6af707f0af
-
-Upstream-Status: Submitted [https://github.com/llvm/llvm-project/pull/13=
8077]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/llvm-project/libunwind/src/UnwindLevel1.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
---- a/src/llvm-project/libunwind/src/UnwindLevel1.c
-+++ b/src/llvm-project/libunwind/src/UnwindLevel1.c
-@@ -185,7 +185,7 @@ extern int __unw_step_stage2(unw_cursor_
-=20
- #if defined(_LIBUNWIND_USE_GCS)
- // Enable the GCS target feature to permit gcspop instructions to be us=
ed.
--__attribute__((target("gcs")))
-+__attribute__((target("+gcs")))
- #endif
- static _Unwind_Reason_Code
- unwind_phase2(unw_context_t *uc, unw_cursor_t *cursor, _Unwind_Exceptio=
n *exception_object) {
-@@ -329,7 +329,7 @@ unwind_phase2(unw_context_t *uc, unw_cur
-=20
- #if defined(_LIBUNWIND_USE_GCS)
- // Enable the GCS target feature to permit gcspop instructions to be us=
ed.
--__attribute__((target("gcs")))
-+__attribute__((target("+gcs")))
- #endif
- static _Unwind_Reason_Code
- unwind_phase2_forced(unw_context_t *uc, unw_cursor_t *cursor,
---- a/src/llvm-project/libunwind/src/cet_unwind.h
-+++ b/src/llvm-project/libunwind/src/cet_unwind.h
-@@ -42,7 +42,8 @@
- #include <arm_acle.h>
-=20
- // We can only use GCS if arm_acle.h defines the GCS intrinsics.
--#ifdef _CHKFEAT_GCS
-+// Enable gcs with clang for now, gcc does not build unwindlevel1.c cor=
rectly
-+#if defined(_CHKFEAT_GCS) && defined(__clang__)
- #define _LIBUNWIND_USE_GCS 1
- #endif
-=20
diff --git a/meta/recipes-devtools/rust/rust-llvm/0001-AsmMatcherEmitter-=
sort-ClassInfo-lists-by-name-as-we.patch b/meta/recipes-devtools/rust/rus=
t-llvm/0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as-we.patch
deleted file mode 100644
index 48af6fc283..0000000000
--- a/meta/recipes-devtools/rust/rust-llvm/0001-AsmMatcherEmitter-sort-Cl=
assInfo-lists-by-name-as-we.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 86940d87026432683fb6741cd8a34d3b9b18e40d Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 27 Nov 2020 10:11:08 +0000
-Subject: [PATCH] AsmMatcherEmitter: sort ClassInfo lists by name as well
-
-Otherwise, there are instances which are identical in
-every other field and therefore sort non-reproducibly
-(which breaks binary and source reproducibiliy).
-
-Upstream-Status: Submitted [https://reviews.llvm.org/D97477]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- llvm/utils/TableGen/AsmMatcherEmitter.cpp | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/llvm/utils/TableGen/AsmMatcherEmitter.cpp b/llvm/utils/Tabl=
eGen/AsmMatcherEmitter.cpp
-index ccf0959389b..1f801e83b7d 100644
---- a/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-+++ b/llvm/utils/TableGen/AsmMatcherEmitter.cpp
-@@ -359,7 +359,10 @@ public:
-     // name of a class shouldn't be significant. However, some of the b=
ackends
-     // accidentally rely on this behaviour, so it will have to stay lik=
e this
-     // until they are fixed.
--    return ValueName < RHS.ValueName;
-+    if (ValueName !=3D RHS.ValueName)
-+        return ValueName < RHS.ValueName;
-+    // All else being equal, we should sort by name, for source and bin=
ary reproducibility
-+    return Name < RHS.Name;
-   }
- };
-=20
diff --git a/meta/recipes-devtools/rust/rust-llvm/0002-llvm-allow-env-ove=
rride-of-exe-path.patch b/meta/recipes-devtools/rust/rust-llvm/0002-llvm-=
allow-env-override-of-exe-path.patch
deleted file mode 100644
index 9be26677a9..0000000000
--- a/meta/recipes-devtools/rust/rust-llvm/0002-llvm-allow-env-override-o=
f-exe-path.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 7111770e8290082530d920e120995bf81431b0aa Mon Sep 17 00:00:00 2001
-From: Martin Kelly <mkelly@xevo.com>
-Date: Fri, 19 May 2017 00:22:57 -0700
-Subject: [PATCH 12/18] llvm: allow env override of exe path
-
-When using a native llvm-config from inside a sysroot, we need llvm-conf=
ig to
-return the libraries, include directories, etc. from inside the sysroot =
rather
-than from the native sysroot. Thus provide an env override for calling
-llvm-config from a target sysroot.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Martin Kelly <mkelly@xevo.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- llvm/tools/llvm-config/llvm-config.cpp | 7 +++++++
- 1 file changed, 7 insertions(+)
-
---- a/llvm/tools/llvm-config/llvm-config.cpp
-+++ b/llvm/tools/llvm-config/llvm-config.cpp
-@@ -226,6 +226,13 @@ Typical components:\n\
-=20
- /// Compute the path to the main executable.
- std::string GetExecutablePath(const char *Argv0) {
-+  // Hack for Yocto: we need to override the root path when we are usin=
g
-+  // llvm-config from within a target sysroot.
-+  const char *Sysroot =3D std::getenv("YOCTO_ALTERNATE_EXE_PATH");
-+  if (Sysroot !=3D nullptr) {
-+    return Sysroot;
-+  }
-+
-   // This just needs to be some symbol in the binary; C++ doesn't
-   // allow taking the address of ::main however.
-   void *P =3D (void *)(intptr_t)GetExecutablePath;
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.90.0.bb b/meta/recipe=
s-devtools/rust/rust-llvm_1.90.0.bb
deleted file mode 100644
index 42d4031da1..0000000000
--- a/meta/recipes-devtools/rust/rust-llvm_1.90.0.bb
+++ /dev/null
@@ -1,98 +0,0 @@
-SUMMARY =3D "LLVM compiler framework (packaged with rust)"
-LICENSE ?=3D "Apache-2.0-with-LLVM-exception"
-HOMEPAGE =3D "http://www.rust-lang.org"
-
-# check src/llvm-project/llvm/CMakeLists.txt for llvm version in use
-#
-LLVM_RELEASE =3D "20.1.8"
-
-require rust-source.inc
-
-SRC_URI +=3D "file://0002-llvm-allow-env-override-of-exe-path.patch;stri=
plevel=3D2 \
-            file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-a=
s-we.patch;striplevel=3D2 \
-           "
-
-S =3D "${RUSTSRC}/src/llvm-project/llvm"
-
-LIC_FILES_CHKSUM =3D "file://LICENSE.TXT;md5=3D8a15a0759ef07f2682d2ba4b8=
93c9afe"
-
-inherit cmake
-
-DEPENDS +=3D "ninja-native rust-llvm-native"
-
-ARM_INSTRUCTION_SET:armv5 =3D "arm"
-ARM_INSTRUCTION_SET:armv4t =3D "arm"
-
-# rustc_llvm with debug info is not recognized as a valid crate that's
-# generated by rust-llvm-native.
-CFLAGS:remove =3D "-g"
-CXXFLAGS:remove =3D "-g"
-
-LLVM_DIR =3D "llvm${LLVM_RELEASE}"
-
-RUST_LLVM_TARGETS ?=3D "ARM;AArch64;Mips;PowerPC;RISCV;X86"
-
-EXTRA_OECMAKE =3D " \
-    -DCMAKE_BUILD_TYPE=3DRelease \
-    -DLLVM_TARGETS_TO_BUILD=3D'${RUST_LLVM_TARGETS}' \
-    -DLLVM_BUILD_DOCS=3DOFF \
-    -DLLVM_ENABLE_TERMINFO=3DOFF \
-    -DLLVM_ENABLE_ZLIB=3DOFF \
-    -DLLVM_ENABLE_ZSTD=3DOFF \
-    -DLLVM_ENABLE_LIBXML2=3DOFF \
-    -DLLVM_ENABLE_FFI=3DOFF \
-    -DLLVM_ENABLE_LIBEDIT=3DOFF \
-    -DLLVM_INSTALL_UTILS=3DON \
-    -DLLVM_BUILD_EXAMPLES=3DOFF \
-    -DLLVM_BUILD_LLVM_DYLIB=3DON \
-    -DLLVM_LINK_LLVM_DYLIB=3DON \
-    -DLLVM_INCLUDE_EXAMPLES=3DOFF \
-    -DLLVM_BUILD_TESTS=3DOFF \
-    -DLLVM_INCLUDE_TESTS=3DOFF \
-    -DLLVM_INCLUDE_BENCHMARKS=3DOFF \
-    -DLLVM_TARGET_ARCH=3D${TARGET_ARCH} \
-    -DCMAKE_INSTALL_PREFIX:PATH=3D${libdir}/llvm-rust \
-"
-
-# Forcibly disable the detection of these packages as otherwise
-# it will look at the host Python install
-EXTRA_OECMAKE +=3D "\
-    -DPY_PYGMENTS_FOUND=3DOFF \
-    -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=3DOFF \
-    -DPY_YAML_FOUND=3DOFF \
-"
-
-EXTRA_OECMAKE:append:class-target =3D "\
-    -DLLVM_BUILD_TOOLS=3DOFF \
-    -DLLVM_TABLEGEN=3D${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-tblgen=
 \
-    -DLLVM_CONFIG_PATH=3D${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-con=
fig \
-"
-
-EXTRA_OECMAKE:append:class-nativesdk =3D "\
-    -DLLVM_BUILD_TOOLS=3DOFF \
-    -DLLVM_TABLEGEN=3D${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-tblgen=
 \
-    -DLLVM_CONFIG_PATH=3D${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-con=
fig \
-"
-
-# The debug symbols are huge here (>2GB) so suppress them since they
-# provide almost no value. If you really need them then override this
-INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
-
-export YOCTO_ALTERNATE_EXE_PATH =3D "${STAGING_LIBDIR}/llvm-rust/bin/llv=
m-config"
-
-do_install:append () {
-    # we don't need any of this stuff to build Rust
-    rm -rf "${D}/usr/lib/cmake"
-}
-
-PACKAGES =3D+ "${PN}-bugpointpasses ${PN}-llvmhello ${PN}-liblto"
-
-# Add the extra locations to avoid the complaints about unpackaged files
-FILES:${PN}-bugpointpasses =3D "${libdir}/llvm-rust/lib/BugpointPasses.s=
o"
-FILES:${PN}-llvmhello =3D "${libdir}/llvm-rust/lib/LLVMHello.so"
-FILES:${PN}-liblto =3D "${libdir}/llvm-rust/lib/libLTO.so.*"
-FILES:${PN}-staticdev =3D+ "${libdir}/llvm-rust/*/*.a"
-FILES:${PN} +=3D "${libdir}/libLLVM*.so.* ${libdir}/llvm-rust/lib/*.so.*=
 ${libdir}/llvm-rust/bin"
-FILES:${PN}-dev +=3D "${datadir}/llvm ${libdir}/llvm-rust/lib/*.so ${lib=
dir}/llvm-rust/include ${libdir}/llvm-rust/share ${libdir}/llvm-rust/lib/=
cmake"
-
-BBCLASSEXTEND =3D "native nativesdk"
--=20
2.49.0


