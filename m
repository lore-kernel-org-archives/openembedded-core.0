Return-Path: <maganuru.jayasurya@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D7D6D5B17D
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 15:12:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50957.1765811523682502536
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 07:12:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IPAUn/Er;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4444652189=maganuru.jayasurya@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BF7p7NF783557
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 07:12:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Qk1KNpBGa
	Vy3XQ0QLhnWugNXa8eKnR3o7PEN/S2xhCw=; b=IPAUn/ErW5lXhPRnzgEv3Ud/T
	uVSEDIFAATKwg6R+7Z6oPZIUDXd42WbaPj6+G6vtBFh0W58RHhP05z524IrUyw+o
	A/tOCMEej6htpeYNHemcKXeuMNXN8tLbkimzgbeoHGtsH1K/2oPobpZwAT8oSVpt
	cgQJaOPCfgk/TXbjJhQNubC2tz6/7Cymn3nzYCMtaNlYU05wJEd23TB7eBNhlKeU
	5OQLQjDY8IsdTjYHEenR18C06dpGYhEa5mEPP9wTib/dP0f8ispwzQnxQY3fOGdS
	ypTJjr5ByX3ZgANlzrLW+zxGj2M0pm4HBVfckUzy6qjnVWA1G1U+UZYO1rLHw==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012016.outbound.protection.outlook.com [40.107.209.16])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b18hmshr4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 15 Dec 2025 07:12:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AEU4j2j1Fu+4Ea68bTJvYj65PKETgQFSpaTim7WTk0P0EFJEfCzg3eFEY/l9uj7y0OArAhhKZO9kPY3pA5VifSmarPaSbIYRWVol5YGdFLMtg1/XhYHiG3BdRG81tywN9RockkGb/HKfW+ASymDCj2jE42phskaJVJ25VynuRNYV6Mk+qh+07iabPtcqX+8Ay6eB8PArTu5kDf/JmHFpmFIvWe3VcTa19RYdlakqpNwUpzqK3DoJku4rP1ZYxMaw+Rds+e/HqopAgBD6Y+lqXArRE9TynmzmQ2q+5NtLUBiXzherE02n4Ntx0JGTL2dr4cu/40nDa88fPxi/JU9Bxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qk1KNpBGaVy3XQ0QLhnWugNXa8eKnR3o7PEN/S2xhCw=;
 b=R6/H9MsJoIQL7qLxaRo/Mi68VY6bVniSX98+FXFV6crVvRpIvhAuZyxd9EoWpzDX8Vr0D/FMCPUfFtxLA/iZjx/uskeM1NEv3j7r46adpZ+tZDQDS3hg5NmCg/5QUq4BZPff27lWAYY7I/1j/aI4ZvRC5HjAYQf17iZzFI/rcZIk85r+dXfQ3i0j7ZToKbpE9xLzrwTg//N9w46Li1OJj+XxqXW64LE6vtJQnUfPuyXmT+C3VsZdiHQkJBTsxWr5GHzdrQQbEI+engZwMsVuesjbGd1SHO5iMxEEXi11NsQzvhrAINniKEX/hEq2v4j1SyvWEM5ETN25SDonCXw2Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB7753.namprd11.prod.outlook.com (2603:10b6:208:421::19)
 by DS0PR11MB7767.namprd11.prod.outlook.com (2603:10b6:8:138::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Mon, 15 Dec
 2025 15:11:59 +0000
Received: from IA1PR11MB7753.namprd11.prod.outlook.com
 ([fe80::8d46:700f:2de7:c0d6]) by IA1PR11MB7753.namprd11.prod.outlook.com
 ([fe80::8d46:700f:2de7:c0d6%7]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 15:11:58 +0000
From: Maganuru.Jayasurya@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, JPEWhacker@gmail.com,
        SunilKumar.Dora@windriver.com
Subject: [PATCH v4 1/2] create-spdx-image-3.0: Image SPDX/SBOM tasks are retained for eSDK installation
Date: Mon, 15 Dec 2025 07:11:06 -0800
Message-ID: <20251215151107.2010834-1-Maganuru.Jayasurya@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0152.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::15) To IA1PR11MB7753.namprd11.prod.outlook.com
 (2603:10b6:208:421::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7753:EE_|DS0PR11MB7767:EE_
X-MS-Office365-Filtering-Correlation-Id: baf678ae-6572-43b4-bcb3-08de3bec4a56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LPBraSKhD24mUOI99s3Cldnxc9OFVJTofKT2jTicbXY21hQ3L1pe1I3rrSl4?=
 =?us-ascii?Q?T5avMhea6YOei4ztV1ysTB48YGXq+IQ66R6xfffw7Tqqc7kuSVncPZph/yqh?=
 =?us-ascii?Q?JrEQ5ASxfG4h7gSU2pasmJsP5I625eidEsOGvFxpJ+HA+xDBizfdr2iz5dvU?=
 =?us-ascii?Q?fcwVlfTt/Z2Glr/9XIKz6Xo6D37cA+yUMVoXck+sh2f/WcXgjZtDMBlw3o7k?=
 =?us-ascii?Q?yPkMphBTFO3tcBzKgrrG2B544jgQEe2aLeTinS2nmSP7hKbXYPoBpLdwbFj7?=
 =?us-ascii?Q?BGyeB4z52JnZ9l7P7jk7W2ZLteCHg7ExkopjM5exJqhLErEdGZyjWd4K/jOA?=
 =?us-ascii?Q?DpManSsPCYY0aXCOPr3PuyrEeX8Bib+ZNnXjKwtV5aGNYNH5gqjKpT8xo+e1?=
 =?us-ascii?Q?tp/lO66KuRbvTvKuwivL0daEjx5mmqjfUc8Sz0PytOMFDgi4b5+OVHZd5+Vm?=
 =?us-ascii?Q?iWG1EIfi6OlZUxtrwImRjwFXuMgkzVW5QdtQMKlouc4Qp9E2qc87FXbhHQqx?=
 =?us-ascii?Q?zGvEjjoQWUA7p5iVPvMRhn+0Txu0DYRNstX/x8KTCuQAWmC5JSfgLQOCIC2Y?=
 =?us-ascii?Q?r+eBcsksiueEG5ej3k9LKHSXcUkDlGLcorpgl/mtBcML5g9IQ0UXLFyd1Quf?=
 =?us-ascii?Q?2lWpmIU054Zjk2YSZUfkPhhiagG9RO0FUJx5vxg7cgPH1mhsmVdVD43gt1Lj?=
 =?us-ascii?Q?Wf7eT48rr12Cwcgbm4CUN7DK7+F5Kl6yVOdWd7jWfMd3bPyoMFiczljxkL1Y?=
 =?us-ascii?Q?wq3YgCr/nmG+m4jjHNCkE/906mAi+Pg7dUw2irJTzKLAp11FnmnzwNV6PWYT?=
 =?us-ascii?Q?2fBdQux0m6w7O2np4REs+J9/kVYPs3jHTYYurhMD0BDVJigSuyAjjA3RnKbS?=
 =?us-ascii?Q?qBBNKLzN9y9StZucP0noWjiHkDwxggm824nNNbXth/r7q4rP1/QStbkvpvb+?=
 =?us-ascii?Q?9X1aXEhMTV2XpCcfUpBLSdHsc65B1qqmbMp42BsMOHgfUceszlB11fm+RvXa?=
 =?us-ascii?Q?ArdZpP5Jj+zlAyjUiOgkrIEzMPZVWtKfE9V9WVM3kYIbYuMgiiBun6IkmiZm?=
 =?us-ascii?Q?++1qyeozvApNx5YdwFVXZtNbKSdHgqx7FaEZCF2oKjR7rmU/xfbFh0rELRE4?=
 =?us-ascii?Q?i9soh4miVZOuS6Vnc4T/9XqOcS58Ys0O2z9G+wwTJmiGTra8ztwiwp6Dt8ts?=
 =?us-ascii?Q?oOvOkf4BpnjIfPebfVdDd+5KHlCGOrLByPywTqyp3XZ0jiheQvZ4msE2VuPb?=
 =?us-ascii?Q?ckeptQGvf5xHVs+y2ljIX4N4urZvpe8xll/xUHtMlLR+gNbhQLxRMITb6rEO?=
 =?us-ascii?Q?R4eJpSFBUGRdcl88U2oZCBID96TGcNaOzSgSBclQ3+b5/fur+2f3qON+daQY?=
 =?us-ascii?Q?eJK/6f4ozpmbSMUrKF7qrobwi279lLOYNcqMTn9cqeOGbbn2WK32jRF6dmug?=
 =?us-ascii?Q?y4zvUY9q6842CrHCNOz6dQmKJz2gO29mYsGcnZfIjVMRrm+5XM6ddd9cNw8a?=
 =?us-ascii?Q?sRQYZ6VGdJmaUh3LupE0wGUlugsWXTihOM9y?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7753.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vJGBw4XXsNY593i2/J4tz0LKjIJmQASGRWOnc8TIdQucOV34ESHcXzF61p/z?=
 =?us-ascii?Q?x9RCiYogBeqrWDL5tjDX1wpXG7sKWot3/hQdETQnZlntEwZl7Xvyc2OccHVd?=
 =?us-ascii?Q?+EC7LHRBtf/wIC+aYMchaeqoH1QcudujZEz1glHD9Io18zGKBZtoM/YwlPL/?=
 =?us-ascii?Q?2BpLnR81VmRI0a76ExCb+8tM3E23EjfQQFzIQ5WU54Vtpb4aEXDhI79sZ51T?=
 =?us-ascii?Q?ZQqf+BJ0vtfiRGTRormxCZx/BxnUGgHOCgKwgseqBxGn1mn+HB9B2lOI12+d?=
 =?us-ascii?Q?SoUVQEX+HQddSfUuoHZ94Jx75PGxDviv3oMvAgNroB6NaQ1fmygqGxBkP9sh?=
 =?us-ascii?Q?zWT+5wpN/+CT3GPgm5OWXgycZfPh+annrHlmtVdiRUbl6GuiqkhFBZPeARNY?=
 =?us-ascii?Q?iqPTYkzdeoknRgG7UODZbcd9s/IAMTf+I/VistkBuvu40xWQoNz93f9twieY?=
 =?us-ascii?Q?A0HAO4cznAvaaBbwgfVb7HvMdVSoQQIIXE7bClcuXIM7qEGgaGSsFSPU7Lvp?=
 =?us-ascii?Q?KxbMBYHnC1l66Kp9wjUANnuCa+wq3WlCYF7pG/V7EveppLQdSd7DNnau0pJM?=
 =?us-ascii?Q?IPJCgkd5OJMO+UmzRggNny9bvkvDJMakGzLygUBHY+anbM92QHog2CXoeuSH?=
 =?us-ascii?Q?zSsi/d5oFAfECzQQfkF2OkB/CuYFZNcI2qcHK5jm0PlZs6s0wAzeU4zk+AhE?=
 =?us-ascii?Q?dx8h3UuLl8YAUBBark7Vp+gbix4u+l5Anw3oEizq/Y7FtZMFpqNXyRYxswL6?=
 =?us-ascii?Q?sknwecmgkz40GjnlZ5LFW1e5mVJd1/ODR+mZDYzoVIAlxIsDsmffGjxXvygZ?=
 =?us-ascii?Q?QQNkp7MPGMDl7PxXLZ9t/atzO3RB/yOLmtBT3m7Uil4qp/dzaQ8t3KhV5kP4?=
 =?us-ascii?Q?62M92TPYmOyy28qLcuBe4s4ZgMcRtXO6Px4IRgiCHQVj+350F+1iaZUbKB0X?=
 =?us-ascii?Q?w+bt6vtTg/TwaR+UKmZL98CNsTf0SOF50dJh6ianh8W0xMGqovAgNTptxzWa?=
 =?us-ascii?Q?GBxngNapeq17MgBL71qiC37T0YNzfQv/pkab3LUy1j6ucVELbCpaSY5Q/8KN?=
 =?us-ascii?Q?xYcBCNPR5jvmaB66ZpMumKDOh0iXJS/fwXyy5nxg1IdaTS7FGnKdhFQYiLtQ?=
 =?us-ascii?Q?fAeubuTMOm1/TohnqbXV3WK47KrUH0O2DlwNXwSdop76JZqnOTv82IrFxkCf?=
 =?us-ascii?Q?AbxSLHKNVmrii3mb8Ns0LGElpPQ4/jsRpZICfr7yWePEWBrvXKqoLVRnbnbZ?=
 =?us-ascii?Q?HtFP6AW+TkwS8DxPpGvrXcQj6Le4MYHZi/trCI86Bgh9me9iorbAoSWUTZHX?=
 =?us-ascii?Q?MuLSt0T7m2qU2Efq8KNxqEUsw3kZ8YF2+vGiaCFDwdGl6kFdMRLlb6nt/WLE?=
 =?us-ascii?Q?bCK1/uaSVbIvIissRw3JWOJNCqN7HPHojBWl2m+HlVSVq49MKd8uFHOtkbGD?=
 =?us-ascii?Q?2p9kIfeNnnXjMwPupXgpWyzgMvNQeneR0f9fyAs6rf+VOYkgiaMXAXTbXEX6?=
 =?us-ascii?Q?GVeH1lD9I4PbmxUDBpBeqPfTPi+VD6m3cG/GncyUqUc6TIX0o8etSz0S/xrd?=
 =?us-ascii?Q?z+elWeAkTSHwNmgf0i+MU7VoVESVqrLbQHiag7mR3RJl3R7n5FGRLHE2Pbgf?=
 =?us-ascii?Q?pK+n+5tAv4+9A0dwCBoxidg=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: baf678ae-6572-43b4-bcb3-08de3bec4a56
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 15:11:58.3653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aQb5ibt44PBeCGW4eahgL6jfHz23fDRFiDaJcCMZQ6cSe818qMOcMFXgx1OS0wLUIb/fwefSviZmhB+6kzMnbFlEauGtTcSAd5Uqf0uAaaOOWNgy6M/fZuOu+MpCl7j3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7767
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDEzMiBTYWx0ZWRfX7LXpUrBECoU9
 G0RxJgj4G4gCBCuvLQhDWoO3mlzpcfJx34Wukh8uUwdfQmSHbWpTe+8CXuQRiLfnrXxm887GECm
 v9w04mdbIq2UcWIi9dsDlcu5y94gBKdASp3at4N1b0nL6WUOgtHi4D9+ESKMUo57BSoNCEspBNj
 Vf2/cs8rjFkQvisUfXeISvYShiIf9t/R0u+cbGtvYVT5R3s6xF6KmaK9jsn9bxEx2gQu26szb3B
 1EPCvMhjtYBCkMe7mIGfj/xM9SRrnlb4xKSVz3I1uEXLuEs4g7K2CJT+5EGptoiIly1Uk3b50nx
 Wq8n25qgY/Rc7ZXC/xaD8reZoPSi5Pmtmd/1n4E8fshpHF9NjROzhPFp/E0jX6TUtjTr9U1+cGR
 GDgojT+uUarcHQoc0IYk9NtcWMIraw==
X-Proofpoint-GUID: efOapvaqEsrf7ZPqG8c3uUXn--VCLxDE
X-Proofpoint-ORIG-GUID: yZHySu4STz0uSUYPDpfPj_ubK6o8zA15
X-Authority-Analysis: v=2.4 cv=XMY9iAhE c=1 sm=1 tr=0 ts=69402543 cx=c_pps
 a=lV9semjb6HF4qJ8WeHToSQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=ikt4RBt7ELKClQgxfkkA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_03,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150132
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 15:12:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227739

From: Jayasurya Maganuru <Maganuru.Jayasurya@windriver.com>

Fixes [YOCTO #15853]

Image SPDX/SBOM tasks were running after do_sdk_depends, causing their
signatures to be excluded from locked-sigs.inc. As a result, the eSDK installer
attempted to re-run these tasks, leading to unexpected task execution errors.

Run do_create_image_sbom_spdx before do_sdk_depends to ensure all image
SPDX/SBOM tasks are completed and captured in the locked signatures.

Signed-off-by: Jayasurya Maganuru <Maganuru.Jayasurya@windriver.com>
Suggested-by: Joshua Watt <jpewhacker@gmail.com>
---
v4:
 - Split the original patch into two patches as suggested.
 - Addressed shortlog length warning.

 meta/classes-recipe/create-spdx-image-3.0.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/create-spdx-image-3.0.bbclass b/meta/classes-recipe/create-spdx-image-3.0.bbclass
index 636ab14eb0..f070b7e697 100644
--- a/meta/classes-recipe/create-spdx-image-3.0.bbclass
+++ b/meta/classes-recipe/create-spdx-image-3.0.bbclass
@@ -69,7 +69,7 @@ python do_create_image_sbom_spdx() {
     import oe.spdx30_tasks
     oe.spdx30_tasks.create_image_sbom_spdx(d)
 }
-addtask do_create_image_sbom_spdx after do_create_rootfs_spdx do_create_image_spdx before do_build
+addtask do_create_image_sbom_spdx after do_create_rootfs_spdx do_create_image_spdx before do_build do_sdk_depends
 SSTATETASKS += "do_create_image_sbom_spdx"
 SSTATE_SKIP_CREATION:task-create-image-sbom = "1"
 do_create_image_sbom_spdx[sstate-inputdirs] = "${SPDXIMAGEDEPLOYDIR}"
-- 
2.49.1


