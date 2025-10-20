Return-Path: <maganuru.jayasurya@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F94CCD193
	for <webhook@archiver.kernel.org>; Mon, 20 Oct 2025 07:23:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12638.1760944976831053852
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 00:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=c0SYKDh5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2388f750f5=maganuru.jayasurya@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59K5Erbq4030237
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 00:22:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Nqc/kWNWU
	CvmNMjJkm3VfTwHgEfNWQ9hW1f3hoF73OM=; b=c0SYKDh5FGYAFIlO/60vwhxfh
	mY2gzXTrpgCoN381OnKcPgdjbM5P+c0q4CQGZW1vEHWepIYWAB6XZZHpiA9/PVKU
	dAseQPVSERLR1wItXcUJVMDCpbDYtA81pfhOYurAn2NrhT1g3bPFjMybsCvV+9Je
	IcbP+TYaW7VXAJMkABt0wkmvvBrFORabbT0M+Rg+cF1uzaxR1vfZ5QdCXVehMUqa
	Qlo+F7pJdgpq9l15XEK0fsFptfRt/NfxXEnlHNaysF1JNH7XFsMgnCAii6fvrFtl
	YGfvh9iEiBPu0Ea9Q1auScysvWy5cgH8PEaPYL0YoLqnWqLnKrsQnu1AzAe3Q==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012033.outbound.protection.outlook.com [52.101.43.33])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49vadj184x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 00:22:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rJ4fOzDNpQu/upcuIw6xt2QnKZl/6TQW/c8G8XmqYh0fLNPJf9+QDAVutrp0SwvX1o+Dvz2LlexOZYAHNxztjt77cOMUnPam22R997SVI4iqRV27d6XxW/tNj6kGvNNv389x+JHHOu2AmVeQFYDLyMi/bHHezs5T/lV+A2R3r2ncjdjlQuD87Y7tonbNkOpr7jTKqhV3HAYLpgCejqqQjIIDK2ScKyYtoy3BYNpu9+IQm5UMlCbEcBjXusX5hwIFKyy3jKqJEpFyz++3RJ+URhVbZN/PS3AVr22zBaHIxuLYk//VEETQzDmv4Ha2KsgGd6dmrgn9BDULObbV/a1eNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nqc/kWNWUCvmNMjJkm3VfTwHgEfNWQ9hW1f3hoF73OM=;
 b=H6Zwoj4VqDG0hzZuj/FmdYEe3UJ8q9yldyrDvW8L75TQ5g7fwb4uhKwOGxMTeA1G1vMcRtCtZ3Vbs5OcKpOrqDzA/GgBqvFhVzxAytPE0GuJSmdhNRjNKj/x2fYz5gGG+KfQCw3SS83DRn4hkL5m4Aj+WgEYRh/W8CIIjQMMfWAgPFAAWTim1kzK+WInlcd/kqRkk2lWvEyqQHL0nobJcRNqQ2WvSz43yx6LShZhmVuusQnz7hU7P7fq4WMlcB5FRq71rXzyFcESetoGYTBvqy3d86732CGBMB4FJz0LSEQD/RJvj9ki7DH62pxUXYIHKMy+N0jZkFZkRN6UJXR+zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB7753.namprd11.prod.outlook.com (2603:10b6:208:421::19)
 by DM3PPFF3DEC9799.namprd11.prod.outlook.com (2603:10b6:f:fc00::f61) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 07:22:54 +0000
Received: from IA1PR11MB7753.namprd11.prod.outlook.com
 ([fe80::82c8:53e:89e4:43e8]) by IA1PR11MB7753.namprd11.prod.outlook.com
 ([fe80::82c8:53e:89e4:43e8%6]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 07:22:53 +0000
From: Maganuru.Jayasurya@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, SunilKumar.Dora@windriver.com
Subject: [PATCH] spdx_common: Fix invalid SPDX downloadLocation for Rust crates
Date: Mon, 20 Oct 2025 00:22:28 -0700
Message-ID: <20251020072228.2819750-1-Maganuru.Jayasurya@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0011.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::24) To IA1PR11MB7753.namprd11.prod.outlook.com
 (2603:10b6:208:421::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7753:EE_|DM3PPFF3DEC9799:EE_
X-MS-Office365-Filtering-Correlation-Id: b564aac0-8cea-4071-a49d-08de0fa97bf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mC/iMJ9JJ871PiGJJ76BG5C3PmRc7Z8RKiu9yRQ0WhhP9EdX4qoBTjww8suj?=
 =?us-ascii?Q?GwiwLvoITNoQK95m/WAgKqlVwpSDmm4O3LxOrS2++gFc2hNGueWKBt5ky+Cd?=
 =?us-ascii?Q?HqaYJuP64XcrCzImsqFmVzQkpY/s4CuHT3pnfhyEWXYw/glH+l669UfslgIL?=
 =?us-ascii?Q?DcX7VWwdKYC3Hds56Q0bjgOQT87cFGMbk8MfwFOgsGG+Df4/mYZB/QH9H/RH?=
 =?us-ascii?Q?YrB93mBC0O/9H1YSNsoIKrKW82tz3fls7GjOOS7HvwX6tkiXtM0fdEDXJRRx?=
 =?us-ascii?Q?AEC1eEJFUf7vVlne/3N1azOJyi4S8RiUN+7AWlqnNkJ64Ap42J88I+oq1FhT?=
 =?us-ascii?Q?1XjZ5gEpwB1W4n14RFBvXSAfYkswIme8D02u+/SN3KUdUpDcEkU7/Fpibznv?=
 =?us-ascii?Q?zB6PAPHZXC20it6I7GtjydnmhPGOIfLVwSOd0dwPnXMrgainGf6i7ciEoE/V?=
 =?us-ascii?Q?1SE3ktPx/jVu8Fnv081+SMRYR3LUmUjFiIhw10wFZ58GMc2y+NwRu1a78jvQ?=
 =?us-ascii?Q?9VbkswMeXxAywONtQXIlkXFxlfXvhMxoQLfDge0o0ReCfYdeU0wuYBXGdZ3D?=
 =?us-ascii?Q?OU/uPPhZ+/Z0eB9RLr7zFDLeE9WU4B5imOFU3ZekoUxF9+CdDul3EBsr2e52?=
 =?us-ascii?Q?RhUBpXg0x00BKzoej3irf5iucdE4xmgut5qdEw6Ml9V4FbwvkIX2LhTEPTTa?=
 =?us-ascii?Q?45lJLK3BmOQCFff7osP8y3WYRkW1/khpPOwLpbqVUKCp3LEDUUzoInulVVDx?=
 =?us-ascii?Q?V2u+YSo9Zi5oR9FHQ/LT3/WXXCSNLUgw3c/vHpo9vcFBIsTVJevqAk57LKc0?=
 =?us-ascii?Q?T/ppEetSsUYPhMLTihQEyXFn2SsixvbSQQPa19LaDI0UDSI/9fSwHHlJqe5R?=
 =?us-ascii?Q?QhnCkbeijhhal7HQYp2GaaJ3kjoQr1/wN+xMdY3RMw0SL0+r+7B94vGUCIpy?=
 =?us-ascii?Q?FUHP7GDJt/RGzVgU7WELn4LGTaviJp3w8XPairmNMKZ1kKIQEVPLXyqdcY+H?=
 =?us-ascii?Q?Mr09rt7EfgARmG2APc0sCLs9Md1EuN/sU5DRmPi0fhenrocRUYBaYnk3rr+H?=
 =?us-ascii?Q?RgpZj1QGt64ZHxNDEo6BVRhvT6EHMSSknMDYE7LrlORfWwgFtS0B03zmfNCe?=
 =?us-ascii?Q?XpyEU4N2vkYNvlUuCJfwBA+Xq+njoIdGY7q6S9+JZJuuZjdHZc5IiZNR8Ixx?=
 =?us-ascii?Q?Z8tnnLHm3HnLP4jh3iKiWEqudBD21wvAtp24ouUQtnOvrDVzQQgFB+yDYAMN?=
 =?us-ascii?Q?veFN/l59VXyfWD/xGwke4sh5N/2d1iFaKH9mw95uV9ybjWDUQun46ZKjPu+n?=
 =?us-ascii?Q?Qc4+UUqByQvpqLvnETZjGTTfuU9WqLhAhGUqzcj33jV3qvbSA6AfI0MCly0a?=
 =?us-ascii?Q?6nHhknPqvM7PBfVS+Bf5E9eI4UjHDR05gStjrdESuWupwYGlu1Tgfbhko40E?=
 =?us-ascii?Q?/1956TGaorum97o42+l9lLlI2eYRmfHWwhcPrJBieLk/hdnpxIF4hg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7753.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?thq2YJsBya506q/6wB7QcpeHoZ0e604hxqaR7kxFkzdQFhYJVyFGWWpwrgIP?=
 =?us-ascii?Q?YDJ/KrXRZZFMhbYdkiBvM7HkrMnxr+9GHopHUYgWWWwpPNI8uSz5FB+qdJZh?=
 =?us-ascii?Q?yVHXLPwN0GP9F5iR7PJSzhgEkP2QDepL49WSxfoGOgvEOEdW555qZZSvJd15?=
 =?us-ascii?Q?1l80t7Bx9KmDNE+HDAbNkSmNRYZZYHH+wJmdFm2TVcjkygsA+Oi5aaJ/WfxT?=
 =?us-ascii?Q?PdpHVgG+m8tlCXoCEtBsPmxs/BtEFPM1Gnb9rzOMna9i2bqH1/Pb8I9bXb6P?=
 =?us-ascii?Q?kjZxt7yLEHohOYqPMURAMk8ABvedZshY1g2LcgmgQ88MZATmWcfjdL/90/Y5?=
 =?us-ascii?Q?1M/1q+wkIW4a46pgNaVJpeW1kfxfXsnE8v9FpQ650KAIMOA9c7rhiREpmXE2?=
 =?us-ascii?Q?xoxu56+/6x0gNVxyO4G5bHN2oj60haPq7G4nk7ll3b3M3Jux7h8F0mAEynp2?=
 =?us-ascii?Q?4DpKByxGTw+wEEamGbig1t+BqQvEB5ej7N92U/Rq4SyaKkBWyZSvVhddRdqj?=
 =?us-ascii?Q?fQVWaQQpfBgnEBeLTf6jAgPOC+zqLGYnxAqoyQxzww5t9rGf0SaSH346+mTC?=
 =?us-ascii?Q?lQ+fYsmAWCIDB4/oqNrh7OArU/sZXJhH+rn5vr9Nn+POO14CpI4p3pmH3Vm6?=
 =?us-ascii?Q?M96lxk0jXRDLaaCuqzI9m8bDrezqsz1SJHWFT9dyJapPEXHQh+BGGZnAhJdq?=
 =?us-ascii?Q?fd/FiI52hNJgnoNlDXN/QRPsyaeKUhnJ82Ojqx5tq2CMOGTNYA5EIa5Sn88x?=
 =?us-ascii?Q?sNcg6dCLTKAphHNjOrMwN+xo/FqZtGnem34dmrzlLSKJrQNkJ/lHC42vCxhd?=
 =?us-ascii?Q?ndLr2/3kJ5bh5yj3wkuf1ovbqRls/PGPuwT1/w/yIOw3GwnWPyiyFytVHcYR?=
 =?us-ascii?Q?Cozs/gUQR/SNQl6EgXf7ABUqyGc6C4lux0pXMuewFA0LdZcMVBzXOshblvrj?=
 =?us-ascii?Q?Ys8VguVn6lH4gYGX9bjf0KOPM13KOzcOzIfh9Uml1hFbqmr4ZSqB17xTC8rf?=
 =?us-ascii?Q?UPNhbn4Uni0uV+rFlv8viY8rJ9hoNql8XPA53kkdFJtZFLbJHwqz1xD9hnds?=
 =?us-ascii?Q?AOml3DWFwF756PstYMgXGp9K2tKuktuy8iyZYwq9pMrw91MpzauyiePd0T7B?=
 =?us-ascii?Q?Ie6l9IKzkEk6Y4NDOXe9nGZoLMY6gEUqCvWOryz90mg9BYQwiPZHwAxn8PMS?=
 =?us-ascii?Q?dXWxrolNV3Q63ascgMzo5EswNRAAztJk67dJhsEO6PRuKkmiOiypO/AD0Wn3?=
 =?us-ascii?Q?BbSXBhtZUjdis1UkYWBTj0VarFOODU7/WPoyWVjxtXrilEYCIdnPp7qrMW5X?=
 =?us-ascii?Q?BF6Oob5PhDB5wweCuqTo31fObd2WLl0REbGuf4aoPISzpyTl33/NAYlsV34Y?=
 =?us-ascii?Q?jzW18Qf+/Q3nKMgOp0YvhCRanja/6mNh6o4q+eqKDXTGeIpsh+syiL1GGoPR?=
 =?us-ascii?Q?G65PYft5sfIalzLW7SMrQrWmDgfs5f7tlQnvSxKMwKrIjGO4uMtkUj37A5QU?=
 =?us-ascii?Q?clRpIb6g2SZmkTNQowfh08in17lQ4o4pUYX2Dp9lLw++qBG3dBxlUPGrHv2S?=
 =?us-ascii?Q?Bb4IizPiR2kAOcZ8jNYiJVVz83WMwZD+1Jw5CoQyIdhFlqCWWd+Tfor44Wze?=
 =?us-ascii?Q?nB1Ax54w0j6JZqsRUdOrV4g=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b564aac0-8cea-4071-a49d-08de0fa97bf5
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 07:22:53.9136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GDxc8Br61zodJfyTSvkUFWiOKFTN4gvwfUzPcA+o7DYbdaZdQHVwUuzVFNVQMM3SopqgaV3qd49Fnmz8nf0FDVNYbpbg5OgvLKO4UU1Lt+yurL83calt5gFEnIP6i86e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFF3DEC9799
X-Proofpoint-ORIG-GUID: ZSqSoZZCTuDS6jysRHns85bfaeapDEJ9
X-Authority-Analysis: v=2.4 cv=K+4v3iWI c=1 sm=1 tr=0 ts=68f5e350 cx=c_pps
 a=BRoDR27eCUDGJJSfTO8W4A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=OcE5tU-iAAAA:8 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=AkuDUe9G3ANPW9psv_wA:9
 a=qwkNQZnGtIHGNKTLT1RO:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=poXaRoVlC6wW9_mwW8W4:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIwMDA1NyBTYWx0ZWRfX3cYYeh1BBf3O
 LEXy8+Kj8emBjsGm53vFjCSUJqdMFkoY7gelGFJ8dsQuj0p2NNU2iSKxHD+tje03PUKqbmj7Ug8
 sS/M/K2ufpKn5YJUf8l8a6jUeJuAhSMFjvfij/pgGSlRb/vs6z72OrdcaxIKCEyYKx51pi/Xhyc
 bHcc2o6MMbqYaR4t5N1fb/fG+DBtCukVEDOYA+JUNnKDoKLWFIFPm4nYbaFtGz4DX4ZvqWys6j1
 0J/S8fm8Lh67q8M35lAkERZdIuHu1IxD2gOZTC/ki6AJCYmRbsVqsTEx6MtpY5DltdZEPLvjPfw
 rXn5KgH5uToN9C/sy0NVbNd8sZ1bOPBHRx2ILHBJQ4QJwAxJUHuwmfRfNYoPhCTHnfhLIrlw8a2
 aRh5hvd4lJVewd88FnawvZXYTxrdlQ==
X-Proofpoint-GUID: ZSqSoZZCTuDS6jysRHns85bfaeapDEJ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510200057
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Oct 2025 07:23:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225110

From: Jayasurya Maganuru <Maganuru.Jayasurya@Windriver.com>

Fixes [YOCTO #15909]

SPDX validation was failing due to the use of `crate://crates.io/...` as the
`downloadLocation`, which is not a valid SPDX URL as per the 2.2 specification.

This patch updates `fetch_data_to_uri()` in `spdx_common.py` to detect when the
fetcher type is "crate" and instead use the `url` attribute, which contains a
valid HTTP(S) URL in the expected format, e.g.:

  https://crates.io/api/v1/crates/<name>/<version>/download

This aligns the SPDX metadata for Rust crates with the specification and avoids
validation errors in tools consuming SPDX documents.

Tested with the `python3-bcrypt` recipe and verified that the
generated `spdx.json` contains a valid `software_downloadLocation`.

Reference: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15909

Signed-off-by: Jayasurya Maganuru <Maganuru.Jayasurya@Windriver.com>
---
 meta/lib/oe/spdx_common.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index c2dec65563..72c24180d5 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -230,6 +230,11 @@ def fetch_data_to_uri(fd, name):
     Translates a bitbake FetchData to a string URI
     """
     uri = fd.type
+
+    # crate: is not a valid URL.  Use url field instead if exist
+    if uri == "crate" and hasattr(fd,"url"):
+       return fd.url
+
     # Map gitsm to git, since gitsm:// is not a valid URI protocol
     if uri == "gitsm":
         uri = "git"
-- 
2.49.0


