Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B77FE7717F
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 03:04:32 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.2318.1733886270185618356
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Dec 2024 19:04:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=207545b38d=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB2HTJ4003262
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 03:04:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cx4xbnmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 03:04:28 +0000 (GMT)
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BB34SBA008747;
	Wed, 11 Dec 2024 03:04:28 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2040.outbound.protection.outlook.com [104.47.70.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cx4xbnmp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 03:04:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4uDCycFVr2YdtHpT3AG85q505nED/AqZ8lwdJhhB5yVZ/1NIz+SPOANNLAFePqzxmchZ/Ouyg6TINhbACOtVwHY8a1HFbDL2OBTSx5iqAZt+3+pyGX2bAlwETw08F8NxFFJHCXRPmmf4dG32kHQp29HZ9K5OTAXWn6W21BSyVy7xaUb+MBNwLNbyiVv5QGpMJ7yyKi0PaxM7Suqr9rTByC6qbMGAVnseBQr1lefD4rfzdJjFEnTXHpw6dHHpYzGXnKu5q0sP2tj6dYFQyXRoRYFSDwSn+dVZn6xOzMEBacv6a3Ccz3ovwSxkp4mq5AMATVCgjBtoztD7U8H5ta7rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4D8r02JrJDYjGTqIKcIsP8LCbr8RZzTFgUvoclbLYrc=;
 b=TFzW9xHomeROEJhJOEaCsGtNfMVjWlbk3cvd/Z/L3YspUEHJdbdIb3OaRD5uozx9taJuisFWlJvJ287IxhaioL5D6wIiaavNJ2hhQ84nrlc70y0aidaQ/Lv9/M1UxOVMSAR/DgjaVzGaW3Igud0IWQWNl2bycHxIZMnExyMUt9i2Qsr8PP7Wcw49wLPtAQJkasktYmBjOuYhMYhuEL9Av2mUu3qnmcUpzHhK0zaa3RjD831h7HKbH6x/3LYXrWcBGkWaVRCjDZmProrENKapTXc9jmYJ0sk/CdN7g4oZSQTFc7jBYCGgFYW/uq+koxTsGCfinhg2KggpcgqE/jbHew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by DS7PR11MB7887.namprd11.prod.outlook.com (2603:10b6:8:e2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 03:04:24 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%4]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 03:04:24 +0000
Content-Type: multipart/alternative;
 boundary="------------Y3Ozw1bRUfQLVSBu9zZ32VSA"
Message-ID: <bc98e563-26ee-40a8-8878-1a5c943f41e0@windriver.com>
Date: Wed, 11 Dec 2024 11:04:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-core][PATCH 3/3] oeqa/selftest: Add SPDX 3.0 include source
 cases for core_image_minimal build
To: Joshua Watt <jpewhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20241125081500.4048680-1-hongxu.jia@windriver.com>
 <20241125081500.4048680-4-hongxu.jia@windriver.com>
 <CAJdd5GanQHGooSz0V1jV-NuDfKkdqjt1Ms2ZypYqvz5peP1=mA@mail.gmail.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <CAJdd5GanQHGooSz0V1jV-NuDfKkdqjt1Ms2ZypYqvz5peP1=mA@mail.gmail.com>
X-ClientProxiedBy: TYCPR01CA0179.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::14) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|DS7PR11MB7887:EE_
X-MS-Office365-Filtering-Correlation-Id: 6242392e-edf9-417f-2522-08dd1990843b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MTlLaldGOVJpOTRzbkVlTEZzblowVTJjbzhhL0Z2T0tUVXZHUHJMMi9BYmV0?=
 =?utf-8?B?WGY3U3NNdVY5V3dYYWVMTVNMQTcrNmc1UGliZFFoemUzcno3U2tnR2JnaWQy?=
 =?utf-8?B?Y3pDOGFDbHpvU0gza2MwcDNIYlltNmI1QnRNMHpmL0pIZzNsZFZMY0poMkIy?=
 =?utf-8?B?bnF6NlJUVzloMGFUM2F0M2ttZm84OFJtbGxxcjN2bVBpTGJGelBVMFBuUGEz?=
 =?utf-8?B?MWdIQ2dSSWZWa2twSi9nVXFYQkVOSjBNTVlkbGlwYXpMYThqTVZ1UjRjZDdK?=
 =?utf-8?B?NXR3ekdleDlDOC94N016aVRtSnEydFgvN29DRkJSN2FEU1BZZnlwenA5TG41?=
 =?utf-8?B?ZTZrSGVqOENzdDUzZ21rTlJMK3gwdmVMR3FaeklyUVNtb0xwM2hLV0JSczN4?=
 =?utf-8?B?YW5TODhpSk4rK00xQzJtQ1FjYjhSSWRkNis1Umdlc2hYdmNzc3FnUUFCdUFw?=
 =?utf-8?B?Q3FTV3FRZnNqWk1ua0FJR0d6VnlsV3YrTVppQkVGSmhNMWFidXBiaWZmSGEz?=
 =?utf-8?B?RGFjckJySnF5KytKcVRUdGQ1L2o5bTNRNzllaGVtSW5NeU1VR0RXZmhUNmQw?=
 =?utf-8?B?Wkp2WHlRUkFLaVkvcVRxNWJyYkZyenFOVzNBOFZOMXhNSmtmWmI5aFI4NDQ5?=
 =?utf-8?B?SkpuNGJ0MkZjTGd6NU04Y1Zkdk9tK2wzcllsTHM1ZU1JKzhUN3gxOTJ1RFhS?=
 =?utf-8?B?VG1uclpPaWxBWDM2VGRjOWdQWUx6QTYwUUdqTGNpVll6aWZicEhWd1RMQUZh?=
 =?utf-8?B?M3BQa29UbnN1WWVDeWV0VkVXUWdHS2ttdkNuYnlFTys1WE1vKzhyc1RhcGpY?=
 =?utf-8?B?Z0pnYXlZTlNtNE1IWHgzc0d3aWtkdTlWK092Wm1HRzFJazUrR1VYK0R5aWVL?=
 =?utf-8?B?K3FwaGtqTlNFeE1wQjdDYy9PRjJjQXlhMUV3clRsOVRXUVRUeG1oVEUzd3kv?=
 =?utf-8?B?R01kdEc1b1hWM0xhWi9XcEMzQ2d0a2NkeEUvMW1FWDFSZUYwbE9wNCtKQXAx?=
 =?utf-8?B?WEdDOWZBN1ZTZkJZZGkreDdtTGNnSTFDWHBaVmdnWDNjb084c0FPanJRaWZu?=
 =?utf-8?B?UXJIVUx3dEJMbngwaXdpRnNuTkU0S25yaGU2VmYwQ0xoQm5xNkk2dEtzQkF6?=
 =?utf-8?B?MTVtcXlDTmY2TEh5S2UxdXRoVmUwVzBPdExUdDl0TVp3OCtET2NEVFNZMlAw?=
 =?utf-8?B?MHl2NFlLL2lGMVhXVUovMTZnOXVvNi84Q1FmTDdKOC9POXcvUEtybFVXOWU3?=
 =?utf-8?B?aEFoUG01ejFYRnBpT0tIUktXQm5CWWZxSkNoOE9XTks4VS81dUhEcEdLNWFj?=
 =?utf-8?B?QjlXNTREODhhV2ZxUTF4azhXUWZxYi80cTNVMWhsaHVpZUJBSTFRQ1hjWDRX?=
 =?utf-8?B?Ui94SForM3daNFNWQmErZEpMcEhiQTV0cGo3a3RMd0c2ZWpNY0JNQWtHNitY?=
 =?utf-8?B?bGdVWWlxTFgwK2w5VEh1RHBwaUtDamZEVW5rR204WXpjRkpKcGlEN1Ewbko0?=
 =?utf-8?B?enlKV09KcmRtZ1FQOGxJb0FaejVybVN1b2V1SkVwWWVlRDc2Z3pWZ2ZhZ2pB?=
 =?utf-8?B?U01yRWc1MnVSMm1WSHFxekJxRys0OVRja2NuM0ZiQ1VWTGQrMlY1TmdvaFBF?=
 =?utf-8?B?bmxHeVpKalFhUHllS1NkMWNBRW9TTlRiYTE4MkFRVXVWVXd2dDlqMDFSNVYw?=
 =?utf-8?B?N1JONmpQaVRSbGNIUmxWT1QwMHFVRmpLenk3WGJaT2UzeUExeFQ3cndNVmVj?=
 =?utf-8?B?amtIZWZTZ3ZuQjNWekpxRllJVUhRZnM0YVhOajQralBsaXZNdGJOcTBjQ244?=
 =?utf-8?B?ZGFxV0FHKzJ1N2hzV3o5UT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RjFRVktxb0pSTjJxVGI0dVAwUmFmZUlVRlZVM24zMzdhVzloUnowTE5OQ1V0?=
 =?utf-8?B?eGxoSjBFSitOeUVXdzZiUmY2S3kyeTN6M2p0dnZFMEZqdmduZTBMRjUrTkEw?=
 =?utf-8?B?eDV1amhPNi95RktMNUkxNjMycHd2Skx0VUdrc1drM055THIyd1NWRFBsWGlE?=
 =?utf-8?B?RXFidlltcWcwbnBPSHMwOXJFWDFGV1hVV3dDN2lNeElBaDAveE5yVWsvNUdS?=
 =?utf-8?B?ckJOelZCcDhCTzNXMUxlaXZiNG9FbGd4ejIydWVLWDNrRFdQcXVtZnNWSjlj?=
 =?utf-8?B?cmZ5VnN6cEhQck1WV201UTBBaFdQVVBUK2g4YnFQenFyeWZ5ZFFCZSswNy9p?=
 =?utf-8?B?WEVLUUR4dDlXNzc4VXYyVit0d2ZzdjVOclhmWitzRDBncklaWTdxNU1aeWtQ?=
 =?utf-8?B?alFLN21PM3pZdUtwK1k3Q0UxbDZuVlVrbmtyZU9Ga0RoZDNTZXhkamJucy85?=
 =?utf-8?B?Ui9XbTdScHJ2QUdWS1VkNUphN2p2blUxUDJVNzRzWHl3UHBJVjF6bldqYVRp?=
 =?utf-8?B?MXdieHZGTUw0UUYvVVdSczNEUFBRTUl4Ynl0UGZRUUwwZTBkWGNJMDBqUEhY?=
 =?utf-8?B?T1UzTUFnWUY1RllldDVKNEU1WHcySmsvSkF6TzFZNlB0bThwNHo2b09xTjE0?=
 =?utf-8?B?VlVDWkVlS1lYemd5YVRXSzN0M1NGOW9POWhTNm9wTk9RaEQrTllqU1RrVUpX?=
 =?utf-8?B?TTJxTTFycHJ3dEk2Y2pqelZiMHQxR1hQMEdHYzN4NUJwTVRhcWtHaTZHUlFv?=
 =?utf-8?B?ZEFCS2JMNVVBT2o4d3hlR0o1ZmJKcmUwNEpQckoyTzV2UjFpVXJqNHBiM09M?=
 =?utf-8?B?a2JsL2cvUXFEekNKTmZvdUJ5TmY1UDdjTldzWGVnRkVmaG5zcWtJZVJoL1Vn?=
 =?utf-8?B?dmh0UG1CeXRMaWZNREQ4UE9GTFVIRWt5Zk1zUUN3SmIzNDdoRlFPaHdXWExY?=
 =?utf-8?B?M2U5YXRPUklVMzBTdy8xck9Pem4xOStWQnU4aFVwRTJnc2tKeTRwK3ZnYTdV?=
 =?utf-8?B?UnRaYUhTRWFKUytybzRKUUlwS1Fab2FQQ3hTODlONGRXUm10bm9xK0lueGNt?=
 =?utf-8?B?amdaeHRFblc2NzRQLzZOTkttM1c0RnR5Wld3U3AzcGhpbVRrQmdVeXAwNkVL?=
 =?utf-8?B?bFdkT1hEQXJLZlpRcUpROEpldlZLZUk0NVlCVmNQVThZUEhXZ3ZjLytzeDNN?=
 =?utf-8?B?ZVhMQnlRcnVkZGloaDErQm1tR0U0ekExdU9XVU80R0xnQzMzdGRkTjdGZzl5?=
 =?utf-8?B?WUpsdlZTQm5IOE9pUzMxWmtqaG5YMVEzMmowZVduN0k0dklBTGJWSFBDb2JB?=
 =?utf-8?B?NWx6VFdLQzVCMmxnRzhiQ05pS1NyRlZ3d0hzSFBYZWRWRDVhSnU0STUzT1hX?=
 =?utf-8?B?dTFud0VGbDV2dVcrTW5ndjEwNENYeGVydUc5TytoNFlLa2dzZ1R2Q2NtMVNu?=
 =?utf-8?B?QUwrNURPdFhId1hIOEpHMVB5TTcyOEFCN1UzenNvNHhXanlPZ3BUZ0xzRFQ4?=
 =?utf-8?B?VHJQOVkrRU9RbmhkSDNMa1NJUFFteUxTeFNVRjZTZkk0SDlrRUd1VlM5QWdZ?=
 =?utf-8?B?NEdXOGJ1NXBTeXpKSjlySlZkazN0RDB3b1RvUUpJUE0zeEoyOE5TaXIwY2l2?=
 =?utf-8?B?dVJiNkFISjlKVHo2ei84b0IwRjlYa0RRK1I1WEVESDVFakhCeE10NmRxOUZZ?=
 =?utf-8?B?cFF3TE1DUXlWZWhKUEU4bnlsaTlpREJvcUJEbnJiTUxFOGhxS3FaNDc1UlZB?=
 =?utf-8?B?cURSZGQ3L1BwTURCb3pVbjFoaFVIcHBTcEtGb29ZWE9IZmdEaVJmRlJwMG9J?=
 =?utf-8?B?cS9QbHFqVFdpV0ViWkdaZXdIbS9kTWJjTGVkeEFzcGJyQytOOTRzdGlNU1ZJ?=
 =?utf-8?B?V0NMd0JLaEJjWWdTbWplQXhJcE8vbVllUld4SkZkY0xZMnpTZHVXd3pHbGJ4?=
 =?utf-8?B?aUtBSVBGQ1RSVzFpaFFObXQvSEFQcVE1RVRacU4ra3ltamVyWjFSYXphRkdN?=
 =?utf-8?B?am0wL1d2SzkrYW1XaGVERnlFL0xjS2F4TzJjTHNxTmcyZFZvajBkMHZWbHU5?=
 =?utf-8?B?VjRQOTdUdE1aNXhtb0JvcU1WL25oOHlpNXBPY3NHamsvVks2WjN3SHdyVldr?=
 =?utf-8?B?Q0NIcHNWS2V2QjJHOXAzODZjemh4Y1VDWVZqTk0wNEZ5cUJyemNCclQ0TWk2?=
 =?utf-8?B?U2c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6242392e-edf9-417f-2522-08dd1990843b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 03:04:24.1821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ja8v+ud5+jfmUIBOyI3QsSKC4+9QtLcnREDnFYrlX/UByIYSbgXybnPQ9BS8AU8S/K2xrCKSr/iEAHE72c6CPECQiMUHAFFGPrFAMz3ko9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7887
X-Proofpoint-GUID: Kix1MKLU01HRQwc481PtgHIgjxpBORK0
X-Proofpoint-ORIG-GUID: 1ennBgt98nSJR-jR2XdrXnlNrSFRYjEW
X-Authority-Analysis: v=2.4 cv=Y/UCsgeN c=1 sm=1 tr=0 ts=6759013c cx=c_pps a=bqH6H/OQt14Rv/FmpY1ebg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=b5cu9YrTm6L_ACu4Ex0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pGLkceISAAAA:8 a=EAsFkKYyPTmsdqQjm-4A:9 a=670YboeG2YXutm_w:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-11_02,2024-12-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2412110022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 03:04:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208573

--------------Y3Ozw1bRUfQLVSBu9zZ32VSA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4BB2HTJ4003262

On 12/5/24 03:24, Joshua Watt wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> Is there some advantage to this patch over the test_gcc_include_source =
test?

It could check objset missing or not while SPDX_INCLUDE_SOURCES =3D "1"

//Hongxu

> On Mon, Nov 25, 2024 at 1:15=E2=80=AFAM Hongxu Jia<hongxu.jia@windriver=
.com>  wrote:
>> $ oe-selftest -r spdx.SPDX30Check.test_core_image_minimal_include_sour=
ce
>> 2024-11-09 09:17:54,600 - oe-selftest - INFO - Adding layer libraries:
>> 2024-11-09 09:17:54,601 - oe-selftest - INFO -  path-to/poky/meta/lib
>> 2024-11-09 09:17:54,601 - oe-selftest - INFO -  path-to/poky/meta-yoct=
o-bsp/lib
>> 2024-11-09 09:17:54,601 - oe-selftest - INFO -  path-to/poky/meta-self=
test/lib
>> 2024-11-09 09:17:54,601 - oe-selftest - INFO -  path-to/meta-openembed=
ded/meta-oe/lib
>> 2024-11-09 09:17:54,602 - oe-selftest - INFO - Checking base configura=
tion is valid/parsable
>> 2024-11-09 09:17:56,653 - oe-selftest - INFO - Adding: "include selfte=
st.inc" in path-to/build_spdx3-st/conf/local.conf
>> 2024-11-09 09:17:56,653 - oe-selftest - INFO - Adding: "include bblaye=
rs.inc" in bblayers.conf
>> 2024-11-09 09:17:56,653 - oe-selftest - INFO - test_core_image_minimal=
_include_source (spdx.SPDX30Check.test_core_image_minimal_include_source)
>> 2024-11-09 10:41:16,654 - oe-selftest - INFO - Keepalive message
>> 2024-11-09 11:37:53,091 - oe-selftest - INFO -  ... ok
>> 2024-11-09 11:55:18,638 - oe-selftest - INFO - -----------------------=
-----------------------------------------------
>> 2024-11-09 11:55:18,638 - oe-selftest - INFO - Ran 1 test in 9442.187s
>> 2024-11-09 11:55:18,638 - oe-selftest - INFO - OK
>> 2024-11-09 11:55:35,453 - oe-selftest - INFO - RESULTS:
>> 2024-11-09 11:55:35,453 - oe-selftest - INFO - RESULTS - spdx.SPDX30Ch=
eck.test_core_image_minimal_include_source: PASSED (8396.65s)
>> 2024-11-09 11:55:35,490 - oe-selftest - INFO - SUMMARY:
>> 2024-11-09 11:55:35,490 - oe-selftest - INFO - oe-selftest () - Ran 1 =
test in 9442.187s
>> 2024-11-09 11:55:35,490 - oe-selftest - INFO - oe-selftest - OK - All =
required tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=3D=
0)
>>
>> Signed-off-by: Hongxu Jia<hongxu.jia@windriver.com>
>> ---
>>   meta/lib/oeqa/selftest/cases/spdx.py | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/self=
test/cases/spdx.py
>> index 8384070219..c785f5445f 100644
>> --- a/meta/lib/oeqa/selftest/cases/spdx.py
>> +++ b/meta/lib/oeqa/selftest/cases/spdx.py
>> @@ -174,6 +174,20 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestC=
ase):
>>           # Document should be fully linked
>>           self.check_objset_missing_ids(objset)
>>
>> +    def test_core_image_minimal_include_source(self):
>> +        objset =3D self.check_recipe_spdx(
>> +            "core-image-minimal",
>> +            "{DEPLOY_DIR_IMAGE}/core-image-minimal-{MACHINE}.rootfs.s=
pdx.json",
>> +            extraconf=3Dtextwrap.dedent(
>> +                """\
>> +                SPDX_INCLUDE_SOURCES =3D "1"
>> +                """
>> +            ),
>> +        )
>> +
>> +        # Document should be fully linked
>> +        self.check_objset_missing_ids(objset)
>> +
>>       def test_core_image_minimal_sdk(self):
>>           objset =3D self.check_recipe_spdx(
>>               "core-image-minimal",
>> --
>> 2.25.1
>>

--------------Y3Ozw1bRUfQLVSBu9zZ32VSA
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4BB2HTJ4003262

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <div class=3D"moz-cite-prefix">On 12/5/24 03:24, Joshua Watt wrote:<b=
r>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CAJdd5GanQHGooSz0V1jV-NuDfKkdqj=
t1Ms2ZypYqvz5peP1=3DmA@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">CAUTION: This email comes fr=
om a non Wind River email account!
Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.

Is there some advantage to this patch over the test_gcc_include_source te=
st?
</pre>
    </blockquote>
    <p>It could check objset missing or not while <span style=3D"white-sp=
ace: pre-wrap">SPDX_INCLUDE_SOURCES =3D &quot;1&quot;</span></p>
    <p>//Hongxu<br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:CAJdd5GanQHGooSz0V1jV-NuDfKkdqj=
t1Ms2ZypYqvz5peP1=3DmA@mail.gmail.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
On Mon, Nov 25, 2024 at 1:15=E2=80=AFAM Hongxu Jia <a class=3D"moz-txt-li=
nk-rfc2396E" href=3D"mailto:hongxu.jia@windriver.com">&lt;hongxu.jia@wind=
river.com&gt;</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
$ oe-selftest -r spdx.SPDX30Check.test_core_image_minimal_include_source
2024-11-09 09:17:54,600 - oe-selftest - INFO - Adding layer libraries:
2024-11-09 09:17:54,601 - oe-selftest - INFO -  path-to/poky/meta/lib
2024-11-09 09:17:54,601 - oe-selftest - INFO -  path-to/poky/meta-yocto-b=
sp/lib
2024-11-09 09:17:54,601 - oe-selftest - INFO -  path-to/poky/meta-selftes=
t/lib
2024-11-09 09:17:54,601 - oe-selftest - INFO -  path-to/meta-openembedded=
/meta-oe/lib
2024-11-09 09:17:54,602 - oe-selftest - INFO - Checking base configuratio=
n is valid/parsable
2024-11-09 09:17:56,653 - oe-selftest - INFO - Adding: &quot;include self=
test.inc&quot; in path-to/build_spdx3-st/conf/local.conf
2024-11-09 09:17:56,653 - oe-selftest - INFO - Adding: &quot;include bbla=
yers.inc&quot; in bblayers.conf
2024-11-09 09:17:56,653 - oe-selftest - INFO - test_core_image_minimal_in=
clude_source (spdx.SPDX30Check.test_core_image_minimal_include_source)
2024-11-09 10:41:16,654 - oe-selftest - INFO - Keepalive message
2024-11-09 11:37:53,091 - oe-selftest - INFO -  ... ok
2024-11-09 11:55:18,638 - oe-selftest - INFO - --------------------------=
--------------------------------------------
2024-11-09 11:55:18,638 - oe-selftest - INFO - Ran 1 test in 9442.187s
2024-11-09 11:55:18,638 - oe-selftest - INFO - OK
2024-11-09 11:55:35,453 - oe-selftest - INFO - RESULTS:
2024-11-09 11:55:35,453 - oe-selftest - INFO - RESULTS - spdx.SPDX30Check=
.test_core_image_minimal_include_source: PASSED (8396.65s)
2024-11-09 11:55:35,490 - oe-selftest - INFO - SUMMARY:
2024-11-09 11:55:35,490 - oe-selftest - INFO - oe-selftest () - Ran 1 tes=
t in 9442.187s
2024-11-09 11:55:35,490 - oe-selftest - INFO - oe-selftest - OK - All req=
uired tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=3D0)

Signed-off-by: Hongxu Jia <a class=3D"moz-txt-link-rfc2396E" href=3D"mail=
to:hongxu.jia@windriver.com">&lt;hongxu.jia@windriver.com&gt;</a>
---
 meta/lib/oeqa/selftest/cases/spdx.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftes=
t/cases/spdx.py
index 8384070219..c785f5445f 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -174,6 +174,20 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase=
):
         # Document should be fully linked
         self.check_objset_missing_ids(objset)

+    def test_core_image_minimal_include_source(self):
+        objset =3D self.check_recipe_spdx(
+            &quot;core-image-minimal&quot;,
+            &quot;{DEPLOY_DIR_IMAGE}/core-image-minimal-{MACHINE}.rootfs=
.spdx.json&quot;,
+            extraconf=3Dtextwrap.dedent(
+                &quot;&quot;&quot;\
+                SPDX_INCLUDE_SOURCES =3D &quot;1&quot;
+                &quot;&quot;&quot;
+            ),
+        )
+
+        # Document should be fully linked
+        self.check_objset_missing_ids(objset)
+
     def test_core_image_minimal_sdk(self):
         objset =3D self.check_recipe_spdx(
             &quot;core-image-minimal&quot;,
--
2.25.1

</pre>
      </blockquote>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------Y3Ozw1bRUfQLVSBu9zZ32VSA--

