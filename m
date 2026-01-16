Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 942F7D4A5FF
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 05:08:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.197.1768540131154934420
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 21:08:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=B/N4gWw5;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54765a9f88=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60G3RZCu1381471
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 05:08:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=QXYPQQLY/
	DFobSxoKMQ5rqOXdi/yKa75JY7ECuo4T38=; b=B/N4gWw5fiHuAG9yf0to1JCg5
	OtBXOhJpzYCM6DM2h+Tz+3TOlTE0OzJEncTu1FcGPPIYLddepRjKZ6zAM+97nYNQ
	Dmw2ZiuoeKM1yFjpfLPv/HTdvRkPwRzAnp6EDPCZaYpLzu4gH636DnSfVjifjqP8
	bERcIppC+v8mTdSPlwUERG3oEjZinPZq+FL9Y0QI1cIL9HXL+jQHZTBdy+xjdpU/
	6dQGLlSzqQqJVlO2bJqr0MYg0Nz7Emlxe4J8F6AcoSDtgfnqQnjuac1NJ0U+u0dr
	BMbeq2wx/fwSCEiXhdE8+XkPAgVjQJXIO2UQMGbjpzba/jqCJHBNktFXVw0xg==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010069.outbound.protection.outlook.com [52.101.61.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bqddvr265-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 16 Jan 2026 05:08:49 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9voksKyYH7X+NxA44jkw5fqFeAvOo5Yk/EofUsDt7SBpWd2JdmrFlLngN5lR5+ZIsugHdcouKj1rJpZQeYpSDFyUgCsEesjosVgxkgR3DHG+T75SyKaNuYYW88H0Bggej0r/SuSVEhfr5Rbwe/fmR75HkQFzLU4phsr2qmEOeJHMqPynaJuij8Biiv4Kn4Kxl/3GsS9zFlb1cNYXj8MDoz6kOSd2Bxlm/PojysUwuvOdyaBClpmuulJEwaVrzcyYMXmGfergiI+Bwb5coEcOngMB1gqad/xapi46wxITQMDjzUdtBq/yFwxc45qAO1hH/ovA9PUWeXcr6JYfNhE2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXYPQQLY/DFobSxoKMQ5rqOXdi/yKa75JY7ECuo4T38=;
 b=AfiFyGBScqxM27HbkfH9ZKpgfRHzei/CG5iFl2CyGFfkQpUQPTK5Tup1jvpirmlpa60A5uH1XjoEOLyXlw/9UvH1WvJ/3sQHX2ctrMo9cBHSGC8k6dgIv3NQVRaAaPNq5pgPBUmzHQS7iHNJx6A/cVN9SoGKCsJr6oIqLl3Dzb1kCk6JxbErnKLAW53scIKnOeU7k2L8vVXQGi3qqBY0fwYSenQAwCS19Hv7Ww2mfKobTPTWD/RHvTe0QrLwG8FTHNjmB1nWHs/j+MOw36SsFkprkZ6KsYT8nlAm6yzS8DoGU8qIJRUY3tw/Hg8uVH78R9nd1tFkx4AYtaQ8eJgCsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ5PPFF9DAC6756.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::863) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 05:08:46 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9520.003; Fri, 16 Jan 2026
 05:08:46 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: liuyd.fnst@fujitsu.com
Subject: [PATCH 1/2] blueprint-compiler: add recipe
Date: Fri, 16 Jan 2026 13:08:30 +0800
Message-Id: <20260116050831.2356718-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::31)
 To DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ5PPFF9DAC6756:EE_
X-MS-Office365-Filtering-Correlation-Id: bfd5871f-cceb-41bb-a182-08de54bd53d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XJRu7k4TkUMz8QYUvfPqIyY4Lp5t0+uDnhnUVJ0Nm/3TIhuONt+wR1jh8jEZ?=
 =?us-ascii?Q?L4QcG2MgnFByRz5STjCQS9Ltj26OqL3UdpDwWOuNvyr0NlX3rXAyYdcVTQN7?=
 =?us-ascii?Q?UZ3GZTF4lIuEJVYokX3u45PTQry4b2XE61r/yj6CseMfByQC8W0PZ8aJX4b1?=
 =?us-ascii?Q?u1lNsJWI2CJK+saPlJFeA+cu9oh/L0Imanl87nbLrG+rIydko+bbRc8ftm44?=
 =?us-ascii?Q?TW7N95pXBJ53tsycqyEUX4tfLUaivB87QG4TblWm1mUcaMClNT+MzgdqGezB?=
 =?us-ascii?Q?XOtTxEScjPgjaK7s020UVYh1QjVg0kMXGNV0/5NSGULJReX8vZQidGOp8Ofc?=
 =?us-ascii?Q?VBOlYTk1oeGhcd1fxH03O9lbpEUlPteNBxGZ58t62rkcqSmP7521D8dAtFUl?=
 =?us-ascii?Q?JzKCQvVGodf0c1qiEWQ0jHbJDBB6rGf+Q2HCAabQhGNwSYpb6i7g6qVQ/AgT?=
 =?us-ascii?Q?rfuqNvs77hlJ+sQzLd9VAOlSRxweBr5l2DMAnBll6r4Ox3nc46t3ZoD9qTuZ?=
 =?us-ascii?Q?AP+pQGO3rxgCdDC30rnA9k3kLSmyhDVUCdqbUiTF2PDQmRLb1WgNb7zP7410?=
 =?us-ascii?Q?s9Tf7LoaqoiBAor3m1APKKMVbtIO6sVYqj96Fq1z7g9e3Jh5s3fUBZoAncGa?=
 =?us-ascii?Q?2oUFZKMIYyWpczkwRrTfBYFKXnyQ9VOympx41TWYZUlbArX6Eaa443T8VHPc?=
 =?us-ascii?Q?pWG7c1R6ik3LWBpu5Hlv55nYkaxKBTXaz5ud8FAkKdQNkGTET9T1dKeoDeY1?=
 =?us-ascii?Q?yU4+bOd5tO2mjb9diAD3esdJT6/Upz8IttmvbPcm16nI8GG4YD/86R1y5vz+?=
 =?us-ascii?Q?Bt6ERWOPTal3hSRBnl07nIrF+WN5f2CFAcarsYOaw0Gs1QrZBM679vcZa+qW?=
 =?us-ascii?Q?mDvnjpuZOaimQn0ARXXyxDyzhIfSW/+Vyigs7MbMvpSDixTj6TBBG3ink39O?=
 =?us-ascii?Q?RPXm7dvxChzMiTpdZYYAP9Fy7Dqmiy3qCzsNQSMqMukZXqvFdxXAamck55hA?=
 =?us-ascii?Q?oqeFAoiUopMDuixBMSrg2K8DBf/mU4PZEd+yZzydDni68FyA/pQGQX594ntX?=
 =?us-ascii?Q?l4a+CNuWU+JM74TgGQXOQ8D4n99b2euHQQxANxR61+RhxdTrDbwgLhFjwnq7?=
 =?us-ascii?Q?2c3tR4N2a+TWNeDARnX/hZBucFSfj9QvbIYpSWjkd7he0bB3nvdw3rtx832G?=
 =?us-ascii?Q?+xwlLj4lLim7e8q6DTbKrXQCp68hb0bjSN7Dr465QlLpQR3RkSDjglmsGuXt?=
 =?us-ascii?Q?UHJLTq9BQRF2bCK9vpDGju2fi7wuZJqV6bHxtzCP3LSl75A5ZlSI9UKk6VnH?=
 =?us-ascii?Q?W4zAYdYm1Zsp+Gcf3AM707HXl4S3l4qA9OZeo0jL+OsoJdzcj5Em4K2M/Nww?=
 =?us-ascii?Q?zAfphqhaOm/lmgS5xbfxNiPV57aUpyANTCmDKT/TtzHjqYjBLpxOb8gVkCx9?=
 =?us-ascii?Q?kqoB4TkWvMaslT3SPUCPImbsrnhCx2qc7i8ocoTZzk++0q+IEtTdXRo8cObh?=
 =?us-ascii?Q?mOIRzMV4IoSyl7QTu3AcJSkJqVFgzjVOvG2vdZ73usNBPZZBcMwLizBDL+7e?=
 =?us-ascii?Q?thXQ5XhLK5HFXqd+zsdAnqbYhQilxhr0c/Q7pqcjvk9+3hFSl0O9DJGqpMD0?=
 =?us-ascii?Q?/uoDzDzuWlzLLb5kP/ktTmU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0MbRdLth8Zw3AfPXyy9PZa16ifx1qfehi/i4RMuuzlVNTOthLBnf17/xc6u2?=
 =?us-ascii?Q?AIJvvGKzGxmFcX9zvufpNdIZAsZz2OA7+EHOb6uLyEVE0sMwCnKe4wvYBkwk?=
 =?us-ascii?Q?x8PNK8Grz0XehCks1iJR7nvjbVGtT4nls4mAA6O/yPkZ7pPZ670j/UoxOKxt?=
 =?us-ascii?Q?So1VIBlAzBdDWoX8sFJ8YC2S9Lo+j1wQiZx5rVKw1gmmpQZkEAcXl60pZvfi?=
 =?us-ascii?Q?vD2BMoDBX5N6rS4yC0VmhyP6OmltgB57oyeKXvTjWKEqtR1Mn0VTup/hCWO6?=
 =?us-ascii?Q?HZMWb/wP/fKT4w+zN/HVpN8AuzoC2H8Ivz0XmCmnexFj49VG8XWfQMvztcEc?=
 =?us-ascii?Q?Xok4kEs/5AGiHirfgWlzxksMH9j70fUvcQbiEbo1Au2I0vZPHDAK1oCetu4d?=
 =?us-ascii?Q?cBVU5eWWNUs/hYDw6q2q5415CKMysXzA71Y9lMkNTuQyEq4Yx+4t0OENFBqZ?=
 =?us-ascii?Q?9vzMQcqvq88LoLdZfe2kiRn4REl34HsxtmRIUo1Jx3jMD2v6kJb++w+jbH+u?=
 =?us-ascii?Q?fOTB7XAHhmYKh2r+Ra4qVn0zF9Asq/F4v1APEQwaqY7tJHnYtaBkDSmTW61H?=
 =?us-ascii?Q?y1zkXnP0S2hhYE+6hXaix5AxcgcjaEBC8aL3UhTJ4JWuuPy3L5sJ1Zd5FdOk?=
 =?us-ascii?Q?MISOFExgaYMdv5n5ohvBlkTVGGmnHaobLkYe+zJUbNtVcr1PjpEoSAhgfN1S?=
 =?us-ascii?Q?ZI2Mc8usP5vO4vAM+fSjO7rZQY+FBzCubsVAa+M1y/O4gNepAOVaRHwIXeAl?=
 =?us-ascii?Q?Cwxzj3mtmDRVnLXeppzc468jPovT7ZlUbd3T7mm1h0rZjfjeBRXIFabRoKAW?=
 =?us-ascii?Q?852nH3oFXWiZy+LOx4rXqMW6fGEz5hzWbLHchDpuxVoPiaWj5K+bEVUwDUgS?=
 =?us-ascii?Q?FHX5rW6iodpwf98Bc6DoteSBTpq1gNw/D77a6dGXUDLziy7+1p5Knbfv0WkV?=
 =?us-ascii?Q?T+Zv7c8c7o+Dee9omuu1UxwBmoHBLVEcWuEXnb8kLVFxS7Jm5e5oZgcxHM5Y?=
 =?us-ascii?Q?de179Hg8b2HQtX4z2KrsLveAxo1hk8XmsjrTaB/TZVy2EzwpTlvbvIROzeYz?=
 =?us-ascii?Q?cXg24Ml52+Cv9i5KL5Y6TCjJOj/KBtQKCGXtX0BUCHJoVUPySkVd4CU5a4Xk?=
 =?us-ascii?Q?8xkUyxMFFsQOQO6gd3CV2M3rb5aOzKNwVK9oEE/Eg4aUM/KxyIZCyflX7LLd?=
 =?us-ascii?Q?SuvcA3eCLSd4CmNyXXBEbGttGt8nK7bnXIgS3FJPjQ+GDQPMZrCXRdWez3XW?=
 =?us-ascii?Q?Vxj8bAAYjDcOrHwxzRkIHawfxoTxVYrW/FPSqdTlksWyfoe2bwhHV8kcbIUs?=
 =?us-ascii?Q?B2uGmVMOUNiove2nZwxKdECI9fc4JCesD4huKy3kK+EuGOyQziCQ9S4iLyHF?=
 =?us-ascii?Q?X71ulnL/8JJ4hpQAGq8csMNyG9Xd3KtZ5o7udM0im3QmOtSC+dKIxu1Nr72M?=
 =?us-ascii?Q?STzxT53wpx71/NoWxKj0gjS+DuFpfVqj1Ff2+5I+oQ9a6N9/hRHne7gQlKep?=
 =?us-ascii?Q?dMBvA7CYmL++kRjQG3PY5B316YcQSBpKZz5L2fsVt+IDGPUjGsjH+3o75H/k?=
 =?us-ascii?Q?mmxgtmLIRxJnaWA4MMNTnyBOrZ4rVf7Hvhl+ERwP/oyV+lbPRylPo7czGc2w?=
 =?us-ascii?Q?pKyQnIgly1nBwJ8FLIo8PDOo/BlPpf/DLyJR++FDCBIclbore561UHjMtyj6?=
 =?us-ascii?Q?F26tTu03AHOFooUeI5cdlqXLg6stDJcEMkU0d9D5Z8XiDhkhcqcfDIduYE0j?=
 =?us-ascii?Q?0BbCjtx8ew=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfd5871f-cceb-41bb-a182-08de54bd53d2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2026 05:08:46.6874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 979BwuQlKcHZQjGDF34QxmB29xZIocA457wW6+csaKN8nExZsN1cKnlQ96A8pzH9hRokRR2KVI7HoYtqV2yigQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF9DAC6756
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDAzOSBTYWx0ZWRfX5SdYDkcWq5k4
 HofSF+aO1YDAb/2hx41mwGEB3XsP2CiaIHB28h0puiHA4WjqYKXdF8ik2o+tLpahsAak1tL4t6M
 6RMDJrCaR9Du2XZaMACn590hcd72B+JZGwF4XJRhbg3OcbKNbPHHJTVsYwbc7A2bXQeCylXOhNV
 ureb40BBqR0b1MplbMCGhmQ8aGHRXR7WD36Z9nwpb1SLdT7wW/atFsY620aG6HoFeTPC/SSDdlq
 todecH27lCgEKINH1GlveB8dZJ0guGcmFRy/xVBf3Jb6EHkUaMAj/Md8ICRz/frhE5EcPJ9u6NP
 aiyea0KrjdIL060QdeemVKvafxBw+pGhVpcgRo0MTSifpWh3zq8XXb8PkPeax8l9G6XERZavqG7
 YbzetuFwEndoqizGDxZeEcs+RLlo2DV51eQo9Ukd4llyPS7DOe/c0dMBTeB/9m2DH5oIe+jlnkb
 GOSjx/XEadfkMSWOqFg==
X-Proofpoint-GUID: sbNTejfobdD_hifoPbN5h4o5fzSj2X4V
X-Proofpoint-ORIG-GUID: unwOwgnPWcn9BgySBJ0vYoCEdLVSxjBh
X-Authority-Analysis: v=2.4 cv=NqvcssdJ c=1 sm=1 tr=0 ts=6969c7e1 cx=c_pps
 a=wsTBi80DslKxnI1CMYi+3A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=GHR8O2WEAAAA:20 a=omOdbC7AAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=iGHA9ds3AAAA:8 a=2X12lZP5CFuO6KqQosoA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_01,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 05:08:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229521

Blueprint-compiler is a markup language and compiler for GTK 4 user
interfaces.

Move it from meta-openembedded to openembedded-core as it is required by
epiphany 49.2.

The original author Liu Yiding, is willing to continue maintaining the
recipe. Add him as maintainer for this.

CC: Liu Yiding <liuyd.fnst@fujitsu.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/conf/distro/include/maintainers.inc         |  1 +
 .../blueprint-compiler_0.18.0.bb                 | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.18.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index e830648945..b231daf485 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -71,6 +71,7 @@ RECIPE_MAINTAINER:pn-binutils-testsuite = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-binutils-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-bison = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-blktrace = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-blueprint-compiler = "Liu Yiding <liuyd.fnst@fujitsu.com>"
 RECIPE_MAINTAINER:pn-bluez5 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-bmaptool = "Trevor Woerner <twoerner@gmail.com>"
 RECIPE_MAINTAINER:pn-boost = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.18.0.bb b/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.18.0.bb
new file mode 100644
index 0000000000..8980d7199c
--- /dev/null
+++ b/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.18.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "A markup language for GTK user interface files."
+HOMEPAGE = "https://gitlab.gnome.org/GNOME/blueprint-compiler"
+LICENSE = "LGPL-3.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
+
+SRC_URI = "git://gitlab.gnome.org/GNOME/blueprint-compiler;protocol=https;branch=main"
+SRCREV = "07c9c9df9cd1b6b4454ecba21ee58211e9144a4b"
+
+inherit meson pkgconfig
+
+PACKAGES += "${PN}-python"
+
+FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
+RDEPENDS:${PN}-python = "python3-pygobject"
+
+BBCLASSEXTEND = "native"
-- 
2.34.1


