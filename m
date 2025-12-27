Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92740E8FDD9
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 11:33:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6434.1766835215423810564
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Dec 2025 03:33:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=S81Q7+Au;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=44567337af=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BRBHowF657952
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 03:33:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=o65eu9Tyc
	DWzg0q49MOMrAHfkZynyEmSKmdzZonhuok=; b=S81Q7+AufhC2ldD2too8qV3qn
	A7ObGeO5MjiG3bPxuHwYKvNTqoNsMlM8h+3oFDoSKjNlyzE7uamPa/SvCFl7bzg3
	wgw4z1C5b46AUo4QGLJ9PrFatBBvkv9CW2HWvHSVaRmpA+ExP8ZwF/Oxh1XvpmZ+
	5UpGSA6/mD0Y9FVASOh+cmxO6nN/3raaS1IeD40ox9+kyfBlLFgH/ViovIzk42wR
	H4/hfTNpzj1Wrlv0Z6OFkIyBgbWhW8MdXYRcZeXCcDK4fX1dEfbFkovWRiRFBHe9
	ONpbpJC/J/V+c13s2fS2rJiH4sMjUyYkyFOaf+rPaam2j2AMzWbeGreneZnHg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013031.outbound.protection.outlook.com [40.107.201.31])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5v6he2nm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 03:33:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LithA2tZ5hMoGoupxZ1P4Srr4la1kYpGppD7JIyHE1MDC89wZifxb/GhtJHKDJkonl3ULCowSlyYy7LaNbViWzGhAELHOdn8MLJEZ43hBNG2GSdYIX3sKvYOuzH5k3PNy4ZIlJMOmzUSx3125C2t120+Je9OllXFDGn7ARy5rksFTMMTIs8f6iy34j7qpqKewqFA3rw8wn0cKmw+AXYyz9VX7xdKhZdRMUaqpZeL10rGrPNE5wRso2XhuEes8kwww+cfDaYVfKibNursnYuvCBHd3siIPyNg2SBSWjsOdcnRrTSxardDW37IGwNfi3bcQXu7r9rYGea4LuBI1H8Lhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o65eu9TycDWzg0q49MOMrAHfkZynyEmSKmdzZonhuok=;
 b=B9G0s5hBptnxlY1QmIl9EHirXYRAJyZBUKJOfSFLIY1cVrAOdrDoOQHh9x3EUo2TmKHNFmEfgplq8lNgLLiC84V6oSVphnqSVp8G8rNFyoUIHMpdONZs3LbD00WzVl2Qowa+2A5oFONVVhf4kx83ItAKts9+gtSi9cQtYgoOA/aBDpMbUx4wqvtw0VRhKPdLYpcZhWLuLM5fmp4kxwMaCpfJiHEZMamIExRDxWBjHDeXrU8kGhzaF6aYVQXebRk/H9/NWdnUYNbJ2nnmyBV+fbl5RbJGR1BH0pCqLd9U6drSftzC9di2Og7KgTqZM75vq05r71lcLB/Vykn7kHIQUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Sat, 27 Dec
 2025 11:33:32 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9456.013; Sat, 27 Dec 2025
 11:33:32 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH 00/16] Enable rust support for linux kernel
Date: Sat, 27 Dec 2025 03:32:35 -0800
Message-ID: <20251227113251.773795-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0049.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::24) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ0PR11MB5087:EE_
X-MS-Office365-Filtering-Correlation-Id: 35f4f4d7-37c7-4b13-6e4b-08de453bc394
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bE9W43cjMKdy172GQoz580GOPDwcqa/X1KKSdBLYzunqRT3otU7jlW0vX8YX?=
 =?us-ascii?Q?y+FdiA5kwWvmpMUdXl5y6Moyzrz0wT90bsyBAdBLnHJRVW7kutwMLPAa4LCz?=
 =?us-ascii?Q?RcWvwoQs0tyAFdI90g64cSvM//mkCLkHdlAma2lrxogJ5wK1YyikV+1cNHiQ?=
 =?us-ascii?Q?ikk1f3l1b6VmOPfUz9Vkhh3gosJlvPBokHyetfcxJj/qd+wE6e7ASU9n/1F2?=
 =?us-ascii?Q?7/9WvEuKE0SZUSFusq4ALVX2h6a3u1fNskosgSpGazu89vO5SwQHdQNBrlxv?=
 =?us-ascii?Q?fXDoXDXE3xt0cLSvRhtdqoM5CRDM+1YxDRt4VrNK5NOqX7XfyfFDaGWXj9tZ?=
 =?us-ascii?Q?v69a+ufBKKwEIVm2DkdCMkOxgOISOcwZA6Bzrj9SblrYbOZxGfemOhtAGwG8?=
 =?us-ascii?Q?UZpdGVyQQuFkQO5fBdIcdk2impO7H4CazUyfnnXJD+QtooiU8HvNwryPsH2m?=
 =?us-ascii?Q?OHiUSJ8efvMtp78FqrhoOFD/s2YaELCfA4gektFiUResE/6UrjDjjjg18CSv?=
 =?us-ascii?Q?6v7gjMB5XfyJcbh0BxeAaaqc1/yCDdSZHhHLRpvUGNa0WjA0h+JuPpeWog8j?=
 =?us-ascii?Q?B5nx4uzKyR9gMBzcHKUCMuG0SuTDfG3f8IsCnHAuwWjO3sVGVfR8fzXFCW7F?=
 =?us-ascii?Q?CJYVKm93mPOf5VdYY+yhSSy0ZAaTEj8N25wsufgwjBYDtFVBFsUGYpjbfBKf?=
 =?us-ascii?Q?lIKWrEErAeo59c2QsscI2vim0CYCmO7K5I75uLgNWMK9wrEAkiUuQWSGN9Bb?=
 =?us-ascii?Q?G8WLFziaRcwF/W0SWqsHYFliXhbA+TtHKU5xHLtjgNT/RIY9W8cBi6zbFmPR?=
 =?us-ascii?Q?QZtUPYrlvFNZZrX3CyZ1jr6DgNx4hr0+RfiOe2tVYvQNW+hEWIdBOfWzhwn2?=
 =?us-ascii?Q?mLw8msdiIGVNxaxnr/t14uk+LXY1hVqCede8WHr5RkCBrxozLuaYXQN1VNJo?=
 =?us-ascii?Q?62iQdkDENZpgKFpJAkW3CC3GQEC1W/9qU0Q6aqIUxYJOmt2bgdyXMIBB39EW?=
 =?us-ascii?Q?NplMPUyMmX4gHt/i4S0lx4a/VW6GMH6UFzEWkeNmjG6pNuVqvWyxdYM3hdYD?=
 =?us-ascii?Q?ZOjO31BHBgg5zlHCFBItz3gw1jYFk+ptpKo5awB+bP5BaQtTn8qCxU/66foA?=
 =?us-ascii?Q?D/h3W6sSGjw2ljalLtU6k5yYsGYUKsMjzsEV48DJJwxxgSg+inFYpb+YqGW0?=
 =?us-ascii?Q?P1MepVyeqRDHUssJKpZ4FX020IxOHOqU5Ww0ALdFTX+am/2yLJJkUkeWHyEV?=
 =?us-ascii?Q?YeTo0IMuSocrvp6YSiRWUOqbQ3UkkktLjlALmHfAcoY009cxBqPd9uuzI1Os?=
 =?us-ascii?Q?fYPTFYuiHj/wfdl0UAAdL/re4y+GfEajnaSmtHF3gZUWWj9Q44r46AT0Qxqt?=
 =?us-ascii?Q?ropkG5+/8ZSCblNUFT4COvlp2rU9wIbcAbphupq5uHxyxsIaDcVuOQKsBTiU?=
 =?us-ascii?Q?ucq6i5btqimCOC6X8t/FKshKHM4D19QYcJVKiFRJSdPzdjSgPKyEh11niBWu?=
 =?us-ascii?Q?J2Y0VRh/TrcX1lj7GVZKdfqeumexWhqfPhjE?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?voVhAVTaMTUHF0C860x+OQiUpM+gEgRXjtIYmXwIfT10seuDFXOEebMKT13t?=
 =?us-ascii?Q?vS4MuMpwqEv7E8Nu0eL5dD7viTCFTItc7fryblRxiF6/AEGkaRRaQqq0HNEh?=
 =?us-ascii?Q?0tgRnhPqEMlin8832QlEev7hDYEE6R0uf9m6fgMxaCNnhujJ1kZNKTBOmL8G?=
 =?us-ascii?Q?jD3DmYDwdx5OJ2Ra0TFkjz9D77al+JoefwHDX3K8pwMi5BjZt2NYKuy0EpNK?=
 =?us-ascii?Q?WK3Hl+RReQyyBi3aLbAuuTWiUmEGpVKUskwUu+0SVHchwewrnfrsNqHc2Hpq?=
 =?us-ascii?Q?BdMrJ8TngQLHptr/K966JHmhs8mlkl/iHX0uG99Fiw+YEF4mqtgL6BPwNd9C?=
 =?us-ascii?Q?SXIpgpJw2f/dzyEDWR7f2fLn1J3MhKGGKeW1MulT+WvNKVBT0r5hHtSr6NGR?=
 =?us-ascii?Q?4fdcvl9S5m2QOqGdb0Yd5NW7rSZ9v++xbvSOoQoWZE70NJcvOblr6XiLUn1w?=
 =?us-ascii?Q?46fAQ0KzIv+7KUCBZrL9wsCYgt4hE9aXJVASjwK6Uoec8aK0pVg12TuUNVn0?=
 =?us-ascii?Q?ScUFk7MEkHPB1SBMj3yY2K6gWJJVspVPZfM3Zj54aRCadhJodWYWYVBd6DGW?=
 =?us-ascii?Q?waUq7UsHT20p7c2tCCEUJ2hrlU+vn9qyPK8MpSSeJP5DhvYeKNsJXzPP8ii6?=
 =?us-ascii?Q?eJBvHfS7yNTQ9f4Dm8rwIR1USVsqqhH0nEfSYvans1MJi+1lznriiq7d+J66?=
 =?us-ascii?Q?mHcxrWwuyRxybwA+5Zt7ijNR4HPXDOrm9w/rfCZzv8TbMm6DZB9Au6lrEeYA?=
 =?us-ascii?Q?ECMFv/1CsP/Pme8mML3cX8qWxHy90pyCMrLIgoGL6INcpGKySdHIn+TOR4qv?=
 =?us-ascii?Q?ffUU043gRZwVeaQvdUVmep+ud2/nCqzXEYYnHPBnEKZ7UOYH2W5qiJ/SGFT+?=
 =?us-ascii?Q?f0hexEfdIXl8UPJUSCwX8GrHSiSNmvzxpkNgMcfoziTK6ctbnIB4gaUx5VKl?=
 =?us-ascii?Q?3TLe6/3dVAg02bnrxYoJ7G28lfxTCvOOV0oDiYHk7+yJQqkge82Z6xq1gdM0?=
 =?us-ascii?Q?ddO87GzKzWXmE0K8VrneBhFbToIaOSPA5E4qzHxlFtcR7gHunOdv+jOCRUgp?=
 =?us-ascii?Q?3txw3Z8GHE7HM9cCSl+88xZhLu8xAi01+jqT14UC/MOjNLFUe7t6azMS/ngM?=
 =?us-ascii?Q?acJ4abUd/LZORXLP/fCeE+S51gQuHkJPawjwiB+2A3UkIs6mo09y5bFvbdbx?=
 =?us-ascii?Q?w4Nx/vX6ZgzyIrkFeG5xEFBrIdNl0HiJ9uvsVqwhbYHo0eLnNVOYxAWaUjXU?=
 =?us-ascii?Q?AulcQd4Kw1stijDlLLJJNUQbLKDJ8Q3Wdbr/Yo9OYflkxvd5cekDqHlleHjl?=
 =?us-ascii?Q?eSnAb9R08qF+KI3efZs9iwjPiCgE7RRPYQZb5Zz4sBaYVNhKCOcAaEn16u6g?=
 =?us-ascii?Q?VxfMQgR0S/O+ERNNSaXrzocPyP0zttYqVDHqjyuwH/EZ8gJ/cjNL/hkWMj8x?=
 =?us-ascii?Q?yzszaFpNZZhWerKsY61eAP7fA7hk0IfKH/c7JL/lKao7V18hHCxhgtZzb6Ch?=
 =?us-ascii?Q?8pu1jH1dV+fR5FAIaEKtt3qxptyMY8mUwdO3F4nn/64434S9f9nSK+fWeIBQ?=
 =?us-ascii?Q?fMZ0VOLQbVCsRBqcm8FCYiNHuMC8rsdEMtLYHgoLbWbx8Nn2XA+m86hfivJj?=
 =?us-ascii?Q?9+u+EIHRihbyb0llxNWC0xjYvia4IzYZQJNasEur9eS6Z64ysQgs81OrcniI?=
 =?us-ascii?Q?n/qhHX8VMFVSo12XDz46bIaiSV6rf6mQ7Rls4pChiJr+v/T1UioMN4fpypaE?=
 =?us-ascii?Q?m+ALzL75RCTOyxOk99ik8xXTvV8SSxc=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35f4f4d7-37c7-4b13-6e4b-08de453bc394
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2025 11:33:32.0983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nh8cqk1aQ32DwiyG+JM9poxQiUGekrsmw+mmELKJ6ADbQaoSE9xhevmq1JiQYQlDn/haX++wGN885sZD3LZNQ+KMUUWaTvZ/DlDDi9/S4pA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDEwNyBTYWx0ZWRfX8qDCFhYfvriw
 WNj/RauZNqjogYyLfBAHnzp0OsnTfuKpU+iNgUXi/AUKKwFHHVhOwVYhzsiR1+0/5YNi8HP3uAK
 s8P37HffjUpBwHvsybdzurRTqe2WhZNZnlu6hQ1T6YKihY1Xgbm+Zv9EPdKD9WuIKLN1no5IJ0e
 iFinS6xdT/cYXP5ZkLe5QEAlcuUsjMbWCrVpbaTvFhrG+nvY7zwMWeex1UQU+kmGqQk1KApIoPC
 hpy5Xo0RQ4NLbqZvxUCR+k5C1cDfKgedZSN666T4tU1dquPOWBiR5preHnNYeGzmKpiZ/iF728k
 yLDY681mRWjRv/gNDgYNjds7M0z99KOLRPc1IpyH0z6SBt/R50L8DJ5ryIs+GmM2mq0VwTShQVM
 EJ+V+/ZfuEssXn4pfx7q042VHsF9K80dlMaHmV4CMlk0TAzOLC6MhpFgkXmXLw5oDx59K/4oxsN
 l8sF1SWJkh+jOMoUtJA==
X-Proofpoint-GUID: HOjbXwkGSKhgjLiilMCY3xOCTsEnF-DV
X-Proofpoint-ORIG-GUID: clxySlCdoJrW7YnLQ-NT-sG4ocNxrqV2
X-Authority-Analysis: v=2.4 cv=KYffcAYD c=1 sm=1 tr=0 ts=694fc40e cx=c_pps
 a=nW9vh20j/mJxMPy+qbWKBA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=HzRlP5ouLR9e6J-S4LYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_03,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512270107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 11:33:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228554

From: Harish Sadineni <Harish.Sadineni@windriver.com>

This patch series introduces Rust support into the linux-yocto kernel recipe
and related build infrastructure in the Yocto Project. The goal is to enable
building the Linux kernel with Rust components and provide support for building 
kernel module which is written in rust and also provide support to build
rust kernel modules in sdk. 

And this series adds test for Linux Rust sample and also added support for out-of-tree kernel 
module written in Rust as well as associated test.

Summary of patches:

- Patch 01: Extend 'bindgen-cli' to support 'nativesdk', allowing it to be available in the SDK environment.
- Patch 02: Add required dependencies ('clang-native', 'rust-native', 'bindgen-cli-native') to the kernel to support Rust binding generation.
- Patch 03: Install the Rust standard library source ('library/') into `work-shared` and which will be later copied to
           linux-yocto recipe-sysroot-native.
- Patch 04: Added 'rust-kernel' to DISTRO_FEATURES_FILTER_NATIVE and DISTRO_FEATURES_FILTER_NATIVESDK, the 'rust-kernel' feature automatically
           propagates from target DISTRO_FEATURES to native/nativesdk builds
- Patch 05: Stage the Rust sources into `recipe-sysroot-native` for kernel build compatibility, making them visible during native builds.
- Patch 06: Update `kernel-yocto.bbclass` to invoke `make rustavailable` during 'do_kernel_configme', ensuring Rust readiness.
- Patch 07: Add kernel configuration support for Rust (via 'kernel-rust.scc'), enabling the Rust build options in kernel config.
- Patch 08: Fixed buildpaths errors when rust is enabled for kernel by appending --remap-path-prefix to RUST_DEBUG_REMAP
- Patch 09: Disabling ccache when rust-kernel is enabled for linux-yocto.
- Patch 10: Copy Rust kernel sources into kernel-devsrc build directory which will be required while running 'make prepare' in sdk.
- Patch 11: Added oe-selftest case for the Linux Rust sample.
- patch 12: Copying include/config/auto.conf in STAGING_KERNEL_BUILDDIR
- patch 13: Export artifacts needed for out-of-tree Rust compilation
- patch 14: Prepare out-of-tree rust module compilation
- patch 15: Added rust-out-of-tree-module recipe in meta-skeleton layer
- patch 16: Added rust-out-of-tree selftest

Patches have been build-tested successfully on:
- qemuarm64
- qemux86-64

Benchmark test-result for x86-64:
+-------------------------------+------------+-----------+-----------+-----------+
| DISTRO_FEATURES               |   real     |   user    |    sys    |  FS usage |
+-------------------------------+------------+-----------+-----------+-----------+
| rust-kernel (enabled)         | 46m1.720s  | 0m28.864s | 0m3.696s  |   58 GB   |
| rust-kernel (disabled)        | 30m1.053s  | 0m20.091s | 0m2.748s  |   33 GB   |
+-------------------------------+------------+-----------+-----------+-----------+

The increased in time & fs is due to kernel rust dependencies in
linux-yocto.


Harish Sadineni (9):
  bindgen-cli: extend BBCLASSEXTEND to include nativesdk
  linux-yocto: conditionally add clang/rust/bindgen-cli-native to
    DEPENDS
  rust: install Rust library sources for 'make rustavailable' support
  bitbake.conf: Include "rust-kernel" in native/nativesdk feature
    filters
  kernel-yocto: stage rustlib sources for linux-yocto 'make
    rustavailable' support
  kernel-yocto: add rust support via "make rustavailable" in
    do_kernel_configme
  linux-yocto: enable Rust support in kernel configuration
  kernel-yocto: Fix for buildpaths errors when rust is enabled for
    kernel
  kernel-devsrc: copying rust-kernel source to $kerneldir/build

Yoann Congal (7):
  kernel-yocto.bbclass: Disable ccache when rust-kernel is enabled
  selftest/cases/runtime_test: Add test for Linux Rust sample
  kernel.bbclass: Copy include/config/auto.conf in
    STAGING_KERNEL_BUILDDIR
  kernel.bbclass: Export artifacts needed for out-of-tree Rust
    compilation
  module.bbclass: Prepare out-of-tree rust module compilation
  meta-skeleton: Add rust-out-of-tree-module recipe
  runtime_test: Add rust-out-of-tree selftest

 .../rust-out-of-tree-module_git.bb            | 18 ++++++++++
 meta/classes-recipe/kernel-yocto.bbclass      | 28 +++++++++++++++
 meta/classes-recipe/kernel.bbclass            | 19 ++++++++++
 meta/classes-recipe/module.bbclass            |  8 +++++
 meta/conf/bitbake.conf                        |  4 +--
 meta/lib/oeqa/selftest/cases/runtime_test.py  | 35 +++++++++++++++++++
 .../bindgen-cli/bindgen-cli_0.72.1.bb         |  2 +-
 meta/recipes-devtools/rust/rust_1.91.1.bb     | 17 +++++++++
 meta/recipes-kernel/linux/kernel-devsrc.bb    |  4 +++
 meta/recipes-kernel/linux/linux-yocto.inc     |  2 ++
 meta/recipes-kernel/linux/linux-yocto_6.16.bb |  1 +
 meta/recipes-kernel/linux/linux-yocto_6.18.bb |  1 +
 12 files changed, 136 insertions(+), 3 deletions(-)
 create mode 100644 meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb

-- 
2.49.0


