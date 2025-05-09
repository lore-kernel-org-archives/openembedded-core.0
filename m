Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B64ACC3ABCC
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 13:17:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.14666.1746796656712809604
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 06:17:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7224021966=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549ChCI0015582
	for <openembedded-core@lists.openembedded.org>; Fri, 9 May 2025 06:17:36 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46hhxjr104-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 06:17:35 -0700 (PDT)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 549DBsQe027222
	for <openembedded-core@lists.openembedded.org>; Fri, 9 May 2025 06:17:35 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2046.outbound.protection.outlook.com [104.47.56.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46hhxjr103-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 06:17:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dfzsY3TuXT3e8drY8WwnAdssfnl3I2UUuK0kQK/t5f54tvWd76sKR3lPxVt20nY5Yz2Bmq5mmHdfz5vBlXzEAbKO8bl/eMfb5Hgce5WD/4g/dh+cQcrxgEyYrG9zb780FdoFFSkW8W/4Y3Pb11xoE0dCugLi8nH5DdMhWrjlG+W8rTraSMtnno6X4AHa8ovKeiML9lw8bm6TA9q13tMcDDEWiAjPuf4ppNLPGV8f7jU3Gy2/yvnyjWfizgKA/3KTGgU5gsljIh1m0Iww26zgPTsEy2euczR6EnKif/UWD9/IDEEOAKi23bWZA1ALvirn8125OZf0XAEkb2wlrUoN0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0A9OX8e+1m5OSdwgCCrqGc8Zm2dfqRTIryrPrspPPro=;
 b=ZHFmJjiR4IPEOQoD1EJ7j6KyY5RNuAA6NMw3sKOrSXfft6FAdxB+icATPNjRa/+B17Ms7fItWuovkqkcLAhf9FHnmS4jbzh56hXRm4qpuULrdtquJqtiyk7TBQ1w51KIrFSTlnj3fW0Spj2OhkaH//2nYXkn7VeZ36b2YpNFn7kfhDxsAHrENyb48DthqRivXnVTbKuWAy6XPhVj9pKhEjOTWUzfNSu4FDcktnAGNlsOoUubxcGSAQPpQs3BHuxv4vdxOJZPf/VZn9vp+vhuoQIrU03hKDMSoS20cUnonKgKwi6epwO9QYigVLTt1M/U8Bj6g6BXxnFjDMUHfc8cjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ5PPF1FF629472.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::818) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 13:17:29 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8722.020; Fri, 9 May 2025
 13:17:29 +0000
Message-ID: <5ecd3be7-de58-450d-8941-fd87769684c3@windriver.com>
Date: Fri, 9 May 2025 21:17:23 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] openssl: add fips support
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org
References: <20250509093740.1367372-1-yi.zhao@windriver.com>
 <CANNYZj8+SvOzz7D0a_sEi81vhi3up699eYoJ1pgBsW0xMHuhog@mail.gmail.com>
 <b7826686-6580-41ea-bc93-89a28798d7fd@windriver.com>
 <CANNYZj-pfxvDHcHwtCePMp4VZCyKFo-oCz_3dv9_rEcvOrC_OA@mail.gmail.com>
Content-Language: en-US
From: Yi Zhao <yi.zhao@windriver.com>
In-Reply-To: <CANNYZj-pfxvDHcHwtCePMp4VZCyKFo-oCz_3dv9_rEcvOrC_OA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: SG2PR04CA0175.apcprd04.prod.outlook.com
 (2603:1096:4:14::13) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ5PPF1FF629472:EE_
X-MS-Office365-Filtering-Correlation-Id: 397240ad-9a27-4457-c92a-08dd8efbd946
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|4022899009|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UWQzSUhzMWp2Y3pqaEZ4Y3dBWkxyUjFhZjAyeHU1amlrK2xsdENWamFRSWI3?=
 =?utf-8?B?MXAxNmprVUIxV2N6Rm50V2FBNENlYmprN1dTbWNDVGwzYVNpQ3ZLc3E0ajVn?=
 =?utf-8?B?amxmWHNLRlVmMGc0dVBobmZ5MHhrRStQL1NKRVIxOW9UbXFTK0J3Um1vR1RL?=
 =?utf-8?B?ZmEra1BFcHRET1dmY3RjL05OZGxZWVUxT0hwZnNJbWVPNEd4QzVmUmllallF?=
 =?utf-8?B?NWYwdnF6U3VPQk5RMEVpSkZoOUpodm1PZWFYUW5Xa1JrMHExbDZlMHFUaVhV?=
 =?utf-8?B?RjNkZVNxanM2TDZ0OUJQb2t0UnBoOEJPeU1MaHJqcEsxRVQycXd3eUN2Q1Bt?=
 =?utf-8?B?WmVNRFlmeGVUaXRvVk1oT2VxdkZkR2gzWnhCVTdGYnNYRmZ6QXZuMHRYc3NX?=
 =?utf-8?B?Q1JvNXlLckRLWkJWLzFQT3FUY250RTdPWEJLNEtwanpiZUd6QXd4cVNmT1gx?=
 =?utf-8?B?WGdWckZnVlFuOWVraWlBSkJaSG9mUlduWlprM1hxbnRvUk1DbnA0eU1lN241?=
 =?utf-8?B?VXpPeVVqaXdhbDNVb3BFYk80N0U0RFEvRUoxTVlqcllGbWx0T2ZjWm45dHR6?=
 =?utf-8?B?dHR6dWQvaDZnZzFmL0MwMHpHS2hudUFQK0FjN202WXNKeHczbjAxbUJKR0dS?=
 =?utf-8?B?b0NtRzFvclNSNTdTODdMUDJMcFlsQ1BJMkwzY2QrUDc1VkxMMk02SHpnVEFr?=
 =?utf-8?B?VlhKZ2FjcDhMR29tOVBGTTBrVW5PR3Q4ZS8xZUdGdFlGV1FjUGtQYlczdytK?=
 =?utf-8?B?VkNkdHVNVC9HNlhORWJVdElLNWhrcnNiR2RHVEFyM1B3cW04bVZCdEdka0ZK?=
 =?utf-8?B?ajF4VGxyRGhZZSs3NHU2SDY3ZHQ0OVFHT1BzaVRkQTR3Szk1WVJzOUtHS1Rh?=
 =?utf-8?B?WjIyUE1vcnlpSGdpSVplaGNRUU4wRldNcU9RNW5uUWhvUG90RTZBMGtQRDFV?=
 =?utf-8?B?MjV4L3h6azhZYUUwRzdCTkFYM2dDUUZOcGpIQU1RVzFhUjYxOVIzSldnTzlx?=
 =?utf-8?B?RklMSjREeG03bC82T3lKR2JVd2R2UFd1YndpeE5RZktuUjBBYzJqY2dLZ243?=
 =?utf-8?B?UmMxU1BqVE5PaFR5U0Rmck43NXFheW5MZEVpcVBKZHNWcGN4aC9VMElPVFl0?=
 =?utf-8?B?c01kTjNna1dLS0dwSS85U1JqelBjbkM0eTJwRmRDSnRyN3p0SWNZSC9DcjlM?=
 =?utf-8?B?OHFIejNZUkpzQzBNSU9QZ1Q4dFBNM1Zia3FwbFRtN3FkU0FWcDlwUzNIWXgw?=
 =?utf-8?B?VGhyY3hmRnJYYUZEUGdBYVk1WEl5c1RhTEZSZ00rUU1zOHducHJ0SFJ0MFhK?=
 =?utf-8?B?TE15OHpUN01acG9pSFEyQkJDWkNBaUM5MXd5YUFUdmcwZndKdGI1a09Wdm1q?=
 =?utf-8?B?a2FESUdrVUwvRUlYT1hMZ0ZjamlEcEhmWi9la1ZFL3p3RXgzd2w4d2dIY3Nz?=
 =?utf-8?B?VU4yV3AxTTB3UDlrV2M0Ry9HclltUjNZOXNFNlhiU3ZxM21wdEZZUFpJWWRp?=
 =?utf-8?B?aUtMTjR2VWhQU1IyMHlsbFJWNVlkVkg2R3c4ZVlHd1ZNTXRTdldKYkFueTcy?=
 =?utf-8?B?RU1oTFhuZXh2eVhMOVgxd3V4WGZVZytiUWVVVkFkWkFIQXVRZlBWazlENWp0?=
 =?utf-8?B?VWNWN2VBcnRFUGhLRFV0REdmL3BQNnNvWE5ITmZyTWJ2QTBET3pTK0pjbWdj?=
 =?utf-8?B?T3d1ellyQjNVYVRFTHA0UnFqakpTSTRTQklNSFVrYW9hb3lGN0Q3VWhieXRU?=
 =?utf-8?B?eFllcVJSYTZabkloRmlVSk13THZGc1FOK1FNQllxRFB5M3dldXRxVnJkUCs2?=
 =?utf-8?B?ais1YXBBbWY4SytteDZFTTlRVnBxQWVZcXZzWkJSeHcvWjA5eldYVzEzRzNJ?=
 =?utf-8?Q?HfrjqmtRb8I2o?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(4022899009)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MGVDMGMwdEhNcnFJZHdCMHhEcDgrZGFsUU5VTWRsbmhnR21WWDZ3WUFzWkhV?=
 =?utf-8?B?QTQvMUdvdVNJVjIxLy9YclZXWlo2U1V4a0ZCTkVBcXYvRUVncTRpR2hNeDc4?=
 =?utf-8?B?T0ZhTzBoZzdrWHIwenp0TUhVeTVJS3RML0FXNHd1NTFZdllvUXdXZFlib2lR?=
 =?utf-8?B?MGNRQ2VYbmlrek5YdjY3YzJnN2t4TjJtL1A1OCt0RW1rdEp1Q29DM1dHcG0x?=
 =?utf-8?B?eHZSVnpBd1hmNnl3cG4wYjRIZWZ1NjRxTGNXUFFXNFpoMk9GbkM0TWliSlE3?=
 =?utf-8?B?aVprZGNrUzN2WFhJRWhLd014UnVaNHFiRklOWVdkUnJxaE8vTkV4YW5iN2Nw?=
 =?utf-8?B?L3FnRnV3Syt1aTk1L3Z6QXRmR0V1ZElwMmJXOVNIZ0lweGV3eGlXS0t6azl5?=
 =?utf-8?B?SzhHbjNMTi9EVkliU0Qrb2JnNnFyejFxRWIwRjEzM3cxdWpGVWdXSWZEMHB1?=
 =?utf-8?B?d1NmL0FsUUYxUEVmaHZsaFkxQ0x6UUdod3J6WUorRDFmT0tnWUJDRktCdDhS?=
 =?utf-8?B?Z0NkUGVNaGtpRlRhMmVDTGIzR3l4Rk5pYVA2R0xiYk1uS0drRm1hOEJoWDRw?=
 =?utf-8?B?NHFaNkJKcVQwd1EwOFZCTlI1aThxcWQwWVh5WmVvaHBvcEhuYUo1RTJFOW9z?=
 =?utf-8?B?SkY3UDE1aHJXRUExMHJ1cm51UituUzh2bFN0c29RaUxhakNwVzJ1L09VZnN5?=
 =?utf-8?B?cEtFZzFjc21Rc0wzWURwSnhVV0xuc2g4dmd3Z3FidHZ4dTl4U21vTXdTeHo1?=
 =?utf-8?B?OTlrVlBYOGtsR3dYcEw5YU1yNUhCQVlreURob1ordzl6RzVzeW0ySHE2MjhE?=
 =?utf-8?B?c3BjVEhXcFhsU1ludlo2NlZRZnV4Y0tOK2Mvc3JXcGdYR01jb3BFWWc3SCt1?=
 =?utf-8?B?QU1VTldTUUFJZ0ZteUU3QWtRZ3kzN0RDZzhlUTJtV08vR093alFJRTJ4eUhx?=
 =?utf-8?B?YlZPNXpHc2Rqbml3ZWsyTU1kMUx1MHRxMnZaTUY1TG9hL09XaGlLZ2JtekIw?=
 =?utf-8?B?b3lKcit2dFZFdGpGSWhIdHV6VWpVWXdMRE1lYXJ3Z3JjMlJ2N1l6cDlreEZO?=
 =?utf-8?B?SG5xbWliYXcweTk4dUNMU2tCQjFRVWFZWmFZOHJ6YW1PemwzMkVlb1ppQ1o3?=
 =?utf-8?B?bXo5cXBPQzVtakNoU1lwNjR2a3NlRTVFcEVjeEtTKzJGeEtlNlRGMC9uUlFp?=
 =?utf-8?B?MjFlTlI4NlpXa2RVRnFIYzh6elh0ZGZ0NC80Z0FjOWIyb21oMis4N00rZHVz?=
 =?utf-8?B?ZTI4RTAycEpHNkJ0TlVnUHpWcFNRQXk1ejlsTERPMzArd0dBbG5BUWU0QWZN?=
 =?utf-8?B?YmVCRW1CTDY2b0hCRWw3SERUWTU2Z2M3ZEJLOUZzQS9MUnYxVjNHV3FnbDN2?=
 =?utf-8?B?ejJWelRCdk5ZUlNhZXEzanhubDdKNUpqVkxJaCs5ZXNqaVFOamlDeFlINHdH?=
 =?utf-8?B?UWJTcHhYMHJEVlRtbE5RVDc0NE5xNXA4aGJCMVA2M0dlUVVxb1hGK1E1ZUVp?=
 =?utf-8?B?T3BDY2dCL0ZlSExjeFFMeUEwM3d6REcveVFTaGZwZHZRRVRzbU1NL2ptZUpQ?=
 =?utf-8?B?ZkI1UHJseDVhVlJyUFpzRmhnTlJicVdPSGcveXZiNGphZGZFUVBvZHB6UW5M?=
 =?utf-8?B?U3E3MncyMExSNms2dENsOVBlU2xmVVVDQ2FPaHprNUVOdHFsMTc2Y0xlZHF2?=
 =?utf-8?B?dnZpdVdad3NIZG4rOHM5UVF6TFdjM3RDaWhIcnBxSGlvT2hDanZZQVNpK2NS?=
 =?utf-8?B?VTNmdjJHNkFVK3hCNjlCSm02Z2lhT0JVMmNSa29rWnVnMXN5aG15VUcxTWV2?=
 =?utf-8?B?OFZadzh2YU5Qd1dDcjZwWUF4VjVMdVhBRkxNRGVNK0dKY0xBemovakVEdTZo?=
 =?utf-8?B?R2xvRkVXUWtZd29IR3lrOTdSTnhVVWZHWFJpdUxsNThhWXorVzhTRlBwK2RY?=
 =?utf-8?B?eWRsR2tDdC8wSDJCVzcwb3FXREtlcEMwb2w2R1Q2aVZ0RWN3RUdNUE5vVjk4?=
 =?utf-8?B?SVIyRXUwa1dCT1EvcmkyZ2tjNFlOUXNOZ2w2L2lTdStrYUd3NmZudXRLWWZr?=
 =?utf-8?B?M1BQRnRNV3BEMVhlUmdwMWp3MTZiSzBQMkdvNjdFNVZ0cUpxbEttUTJYNEpI?=
 =?utf-8?Q?gu8+gkMEggWymmXXf9m66+S6A?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 397240ad-9a27-4457-c92a-08dd8efbd946
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 13:17:29.3339
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p2usS+GKA6Z/r1i4/HEY/tzxC2XWcWrD3unx4vld4Lozh00okDXaN5+4tKMeCqDhiSPQza537v10jc0mbHI1JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF1FF629472
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDEzMCBTYWx0ZWRfXy5cKSMYLxbVs IlPrkgWiBZxTPgEQK1hDcnT1cmosH4PuXY4CI+2yOZa6C6eqHTDTavRKWnhDkZGxTSigXwcisUn qf2CeoYOZPF/487E8UkMpsN2F0ODb0Vy31/WSwrZfOZV08NQSDad4t78ClmCxnFwpCWp44fd0RV
 u5kfEACVIbzJf36q7TTJHvbbBFG/Uf+ZAHZE3F2GW5/1KL9PGf7AtUe6yudkv3ckQseazAwRjkM Br1ukrznT75UkoSeUex1biiLVVHe0rK2uSYbjcFHQ+VHxp9IMlrcWEP7u7lPghhgQtKlFyXzYTM iGVVi4MwRzw3SLg6GEeB+dxlv1JIm9Ta+IktNdywada+Ku9ZOqLqMQdaQ5aL2rCZpxlb45KlOXj
 QIgjU9ybZKw8HEfH6YUoIE5l2/kHr6VNEYxvvV0kMJ/zZ9RH0xGvY0P6uQMASFVCPvoo7IWo
X-Authority-Analysis: v=2.4 cv=cfzSrmDM c=1 sm=1 tr=0 ts=681e006f cx=c_pps a=SmJf4+RRogz8lGj/IwyRsg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=OsxupwSoyU_uQN-Y0b8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: drxERyD1GY-GuWgGllqQRG8Ts5_pWzyS
X-Proofpoint-ORIG-GUID: niRMcB8D9qmdwvw18TGrp_OmlH_TRYkY
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_05,2025-05-08_04,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2504070000
 definitions=main-2505090130
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 549ChCI0015582
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 13:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216204


On 5/9/25 20:35, Alexander Kanavin via lists.openembedded.org wrote:
>> The "openssl fipsinstall" command will do the following things:
>> 1. Runs the FIPS module self tests on target
>> 2. Generates config file fipsmodule.conf containing information about
>> the module such as the calculated MAC of the FIPS module and the MAC o=
f
>> the value of the self tests status
>>
>> We should not use the same fipsmodule.cnf on different machines. So it
>> will be generated on the target.
> Thanks. Is the original file (which is installed and then deleted)
> pre-packaged with openssl tarball, or generated during build? Can you
> show the difference between that, and the file that gets generated on
> target? I'd like to see the actual content.

The original file is generated by util/mk-fipsmodule-cnf.pl during build.


Here is the diff result:

$ diff fipsmodule.cnf.orig=C2=A0 fipsmodule.cnf
6,29c6,30
< module-mac =3D=20
8A:6E:E0:65:18:AF:1C:1C:67:FA:CF:8E:89:9B:67:03:4A:1F:0E:87:1A:34:23:D3:5=
D:90:73:98:32:A3:AC:31
< tls1-prf-ems-check =3D 1
< no-short-mac =3D 1
< drbg-no-trunc-md =3D 1
< signature-digest-check =3D 1
< dsa-sign-disabled =3D 1
< hkdf-digest-check =3D 1
< tls13-kdf-digest-check =3D 1
< tls1-prf-digest-check =3D 1
< sshkdf-digest-check =3D 1
< sskdf-digest-check =3D 1
< x963kdf-digest-check =3D 1
< tdes-encrypt-disabled =3D 1
< rsa-pkcs15-pad-disabled =3D 1
< rsa-pss-saltlen-check =3D 1
< rsa-sign-x931-pad-disabled =3D 1
< hkdf-key-check =3D 1
< kbkdf-key-check =3D 1
< tls13-kdf-key-check =3D 1
< tls1-prf-key-check =3D 1
< sshkdf-key-check =3D 1
< sskdf-key-check =3D 1
< x963kdf-key-check =3D 1
< x942kdf-key-check =3D 1
---
 > hmac-key-check =3D 0
 > kmac-key-check =3D 0
 > tls1-prf-ems-check =3D 0
 > no-short-mac =3D 0
 > drbg-no-trunc-md =3D 0
 > signature-digest-check =3D 0
 > hkdf-digest-check =3D 0
 > tls13-kdf-digest-check =3D 0
 > tls1-prf-digest-check =3D 0
 > sshkdf-digest-check =3D 0
 > sskdf-digest-check =3D 0
 > x963kdf-digest-check =3D 0
 > dsa-sign-disabled =3D 0
 > tdes-encrypt-disabled =3D 0
 > rsa-pkcs15-pad-disabled =3D 0
 > rsa-pss-saltlen-check =3D 0
 > rsa-sign-x931-pad-disabled =3D 0
 > hkdf-key-check =3D 0
 > kbkdf-key-check =3D 0
 > tls13-kdf-key-check =3D 0
 > tls1-prf-key-check =3D 0
 > sshkdf-key-check =3D 0
 > sskdf-key-check =3D 0
 > x963kdf-key-check =3D 0
 > x942kdf-key-check =3D 0
31,33c32,33
< ecdh-cofactor-check =3D 1
< hmac-key-check =3D 1
< kmac-key-check =3D 1
---
 > ecdh-cofactor-check =3D 0
 > module-mac =3D=20
83:F9:46:E4:60:88:FC:B7:CF:7D:CA:30:1F:9D:9A:FB:4C:18:5F:57:68:44:C7:2D:8=
D:8A:CD:92:21:D4:10:44

>
> Alex
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#216203): https://lists.openembedded.org/g/openembed=
ded-core/message/216203
> Mute This Topic: https://lists.openembedded.org/mt/112895798/7283133
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
yi.zhao@eng.windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

