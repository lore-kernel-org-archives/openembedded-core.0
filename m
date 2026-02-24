Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF30DEEC2BC
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 01:45:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11024.1771897504435979109
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Feb 2026 17:45:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=b/hb7xEy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6515bcc28d=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O0ava92782331
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 17:45:04 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=+N0gTVbSu8/xdDYe+CH8
	wkcZFC0FZhMwnJI+mleRnIM=; b=b/hb7xEyjSKRzkAYxZ1bw+Uzh1onli33cLqN
	MQwuGA8j8P3V0cEukllW6mTRTC3+CV/+gqD7ebJk0/iWnKfBxRptIUvYcMdxF3Ax
	63I81RbW+cfQaiORi7bKTNNT4XKZ+AJiii8ff66vapxG9eFRDgVQ+BSjk6Cmohz8
	gmG+An7x+bqmukDzUg8L/VEuhbiR8nMpCq/9ex7QOfmupKjEvBA7l3uKir6/lJKg
	XHJny9a8vs0mD35oH+cCtFxQKQE4aDMj6LuRdCbEODOngNtL4H5JNp4UJk4d0yLG
	r7OH/VVuNUitUhTVfeeR52/a+l0m5/fhEDuRg7OsPLmJLYCrjw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010068.outbound.protection.outlook.com [40.93.198.68])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cf8v42djn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Feb 2026 17:45:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=roZQRDJUXKl209Wn5OudwD4XoLJmuj3b0vAlxgETTtXhhCgt8d94JfPTSwCgCyPV1gaf2yCHjwmf9WmzpnySGJUL0/YZLdSvahM7ZVHxHLFoygbxvGE5TnezidC8yF4BjAL5HaIKYuRNxc91yv31bsVbTfEzmLMDCFOwIHxb3WJQmNptBAv8HFy7U67uB2Hu9Quwv/pRCDC+7HV/t3e5Nrd5ZBqz2hRZHxljenEPmqtQL8uEcWFARqDSyaCWHRY3pAghZFziC7rvCtofUzPpJsGFtfORdmgLir/W35Arx9OfuArv2KSkx9ox84jcHe7lCIaUsrfEpAOAe1gvisvbzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+N0gTVbSu8/xdDYe+CH8wkcZFC0FZhMwnJI+mleRnIM=;
 b=bkvSsCDKRKBRmJJL/mbmN/MnW996HLXm5vhXPZ3JCi2XLH00VU0T3ahoOSqg6IMvdOrxy6RTYm5a7IVTkgCWRLUds61S4Vgw6i0KllPbF6XAunS7kZZcYOOb/G99J/kBfqZWuVXBbEOzd5gOlueftfjNjCvXly1uuUBdKomDhoS9Fl1MZwLbT2XIdI7UOhaCmq7bVhkecCjrH1pXcslxjtZDKJYuldS59nDDpKtln9VFtWaKjDXINXn0ttJQPrehIkUoFSsJu1u3q71WGzOCDOe7iipIcUYlESuYsIbOal/kug3/XlrJKZ1v1nXvfqgtoe5caLL0S8DyMj3LscrRTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by PH0PR11MB7616.namprd11.prod.outlook.com (2603:10b6:510:26d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 01:45:02 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 01:45:02 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gdk-pixbuf: upgrade from 2.44.4 to 2.44.5
Date: Tue, 24 Feb 2026 09:44:48 +0800
Message-Id: <20260224014448.3334592-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0045.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::18) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|PH0PR11MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d55e8b3-8457-4773-f822-08de73465360
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YThM7eMPVVr2xHjww5DC+6jIofBzCqaRTNjOF1rILzLsHSja6SWYz09maOBe?=
 =?us-ascii?Q?epU/NZXJDK8kuN/35bRlhRJUounkQY8w18PS7CHMYoWLLzkL4Z7Op3HEy2FM?=
 =?us-ascii?Q?R5xzb3nb7YUKGh/dXU+/Z+i5OmgqciFLGS9/Q+C+KoZCHNkKOb9BT08YR7pS?=
 =?us-ascii?Q?BbluqLzvFMOGnEEUgZJZJqlSSEzUtPXRI4kRloz3Wcdq26jR/ZNiaJk7fiUf?=
 =?us-ascii?Q?x0OgMnPPMUIDMhx15sagNPO+WsI1sWhSD1p21uo9Y59E7sudHkwND00uE9g2?=
 =?us-ascii?Q?gAOE1kMonxu06IJeUUCHUa6Ednu+jjfa2cBEzcQ5EFpj2PXb2T3j6yr0sxwf?=
 =?us-ascii?Q?UWSCKFl085lf6coP5gG6rPz4pBm9VOvQBC7pJ6PznTbwgWRjjp7wfCeHRvaZ?=
 =?us-ascii?Q?tJ9ACtYiFu/vlX0zHUtde1DWxP79Pt8NmNln1ZVvUe2r2H1LlcxG/Y/9T7Yp?=
 =?us-ascii?Q?hbLoV8xSkAaK0Vv8DXWM5O9bME1E5t7zmJYeIGU1n7yqSwwNsM4e4KAm6867?=
 =?us-ascii?Q?Y2kCNLyRlnoyR6CR8jX/Lq9PkpuMvg7a4dYmQzvoSykPPGJt0rSM+gmvGlOl?=
 =?us-ascii?Q?MZIwlrmHZD+dRPXqEntyzbn6CBIUe1G1DWFX4aEXAtWNUdua1GUH12XBQqM2?=
 =?us-ascii?Q?gp72pWQWBtlmr30MsiH8Sv0j+9xGWt2q+Ac5Rnr/TH6s4H/Z1DUNYCroPCLX?=
 =?us-ascii?Q?vYQa5/dlpFYgFcSYBU4b1Ot2/rrZzUsgGCrb0vZU3/W0pFrycaO+e9v9HbaO?=
 =?us-ascii?Q?lvOnyslSMw3H4y3VUZ1icrCEogytsgMxlPcrsHmVH0aoZeyLbYzJfvyUv28C?=
 =?us-ascii?Q?raumpJERl9N0UvvICXjy2fs6wKgdGPhFB+zDYP33H8YffwIZhIK8PEHfTjnM?=
 =?us-ascii?Q?4z+77dXb2+3QVFCsushpt8Z4R1NBYbc5XAfVn0fSLxsYejtAMsC+xCx5PgwG?=
 =?us-ascii?Q?H0aBoyI9W16e1IQeJIFUNMtiE4bs+179LmpzBqswbrE+bSGbv2wAVRhPP0qk?=
 =?us-ascii?Q?OKxE7ZhaTNuiUNgYewpZVnKw6+ilNwPjwKWCjVBlxTy+GfCVhxNNKwL1vV+J?=
 =?us-ascii?Q?fz4tXBcFEUGTga5TkZOtSsUmeXhhgWHmdyGkqfk+lADlXMp9QbETb9onyZPN?=
 =?us-ascii?Q?OUd/ff/NALzUFHxErEGDzKmjpjE1L31JvxJx+ZCKwfLiO8VXo5KcD55pQk6H?=
 =?us-ascii?Q?RY1qzbY7k+h7RLM8d9Ib+JUupkRfvAEMtTGv7ZiUiZ+79fohFiZe3uc0jJE7?=
 =?us-ascii?Q?Zat4TxqqgcI2yHnEgYrk7amSr0bEo4kiZacOjN5LpK7UaH7EZl3atfOfUScV?=
 =?us-ascii?Q?ySHNTt92vRvfZRA7/BIDNwH4bT5OqEJ67ZPollg1OH0k/UMUZG3Z+yN78u5y?=
 =?us-ascii?Q?ll9d0K5IzvAD2FyCSOsv1nyCw5eu9g9qe8AaZhVEbeZjFe+lepIT3VUzCuzT?=
 =?us-ascii?Q?72pkw+PaGs0BnQ3PF0LFnnJbaaEflF3bYDbXksk8oabUrTpmww3x6DMnL/Pp?=
 =?us-ascii?Q?5lo8eIHksg35bC/PmuPY/ze0pVVJasRJLoPiesN6QP4EQn2e1SUT4WfD5VIr?=
 =?us-ascii?Q?YyPik9bVZ3qrok+Jo6tCOUb2FQmeygqKyJ4QgkJNtp0Bx1AsbZ2dq3AIshil?=
 =?us-ascii?Q?Bbb9TMbYDrrTsPzw5f1LqMc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3w0QnqdWa+sJmbrXZL3NuB1OQ5wxAxpsUK4TR0QC/rh9ryLMj9reFsYkZQVE?=
 =?us-ascii?Q?/nLrufeChdYlyp6uI8xry3Q9UtYQx3TU7PM3YOyPN/rAezbbU4Gpf+Br7TcD?=
 =?us-ascii?Q?JI87+2YbEmRJpeNP8HCs3EwcOqD2hRs2JYszx/Ff6YrVBAYD/Y4RoYCFxSXw?=
 =?us-ascii?Q?exLwbrQrbzUd9CXrxF6QT6YN//vrcWO6eVeR/dzWc7NcyDo2fzResvqW01az?=
 =?us-ascii?Q?EcSQEK6ngA7RbIEvvbpxlchKVT3xqMan1UsqQkpQI/EzUsHkDE4UbHSB6i4T?=
 =?us-ascii?Q?tcnNg9zm7Mp4s4r2xQkjaNF3E0GOsq8G09Ot1XJnpb22WwWChezwJYUoquEk?=
 =?us-ascii?Q?v+7gwgqsv2wkk4idxn87ki+orqA6WyB2cwy8XK1C8EGOkkGKnSLe8a+gEHpw?=
 =?us-ascii?Q?q/HqImBp18JGIX6iUq0LphUzrmbdwD8alL1H4yg1Mu17sYOH3QluTMmNtEX0?=
 =?us-ascii?Q?ut4bo2n4UAyChnUKKKcP+4VSVoMszeZrHkDbUEVMQr2vhH+/77E0kzH+WusK?=
 =?us-ascii?Q?7CBiw+YHqJ8bGRGcDkHbq2FZp0W/m6J1anyBO6mscVyKahcAFHzIe3ylh5Ge?=
 =?us-ascii?Q?UbqFxjfIJAoc8h0ZYssvMEr8UmoX08GRUONeKg8tSYjO5aGoyF5lRT9BuIek?=
 =?us-ascii?Q?9rH2RWos0YH9mmASBYkrBFGb/Pc1v3NAvhXQ3LM8IJKsRaWIID64+O4T9Ly7?=
 =?us-ascii?Q?Kl1vT37HmFjhvp3fOz4HYrwsZHTwBBARl5gbRXBbn0/DMN25rKNrbdtM3Lbl?=
 =?us-ascii?Q?zRFraw7aWoExlXg74mtzmDUtTPm17ocTqAGLR/iaayJt9GYaJBLLSi2d9cJF?=
 =?us-ascii?Q?npHDnDcIf2WQs9D+HvHwa/uM22UtSme3//q4k6fgN+lRKwrN6+o4Y+3Uxg0l?=
 =?us-ascii?Q?3ZhD5CmT23sr3a8aZ9fOawnt55tx1oxtZrRTgKDa1UZ1zHzAPBsZFmnGERMl?=
 =?us-ascii?Q?Xf5Z25WlF5QnOfNfmrR43fkw7ezCJDV97fTga+2uubc7riZQ66v0OSEoWpbu?=
 =?us-ascii?Q?kZ/WvlHZp7d6lh40SI6RLZ76TrH+gSXVruXzyvJ0wcyO7SIzr5V7DDDxBu7P?=
 =?us-ascii?Q?rP9NFfdKbYrLDoj1sFu4OFEYOLbI9EoOVPreBEHPi8J0SJHnQlEi+MVtpA3h?=
 =?us-ascii?Q?waj9cUruxbASRQpdcK1BnSyiuc8TpdL2dss1xgnLTpCUID07nkeH/29DKdEO?=
 =?us-ascii?Q?LkkPOPmxU6+CkKCkUhwhUaVkmI6FuZgFREioQEdoaq1toFvyLA/Pisq3pv2w?=
 =?us-ascii?Q?cCh0TPo77FuvNd37cMpOL47aa5xv/2LBsN/0x9vcDOFwBCteTLmrLu1g45Sh?=
 =?us-ascii?Q?7zCePPs9QAHUQb/SL8ol19DMpWR+ds7pqsggCSVnFwKpDzlSekxUA6GQfrNX?=
 =?us-ascii?Q?8/2WdbG1JjZ3UWQd/uhCagA6Zq157Zc09PAIEFVm67CmJM6JSQ2saYRTq5p1?=
 =?us-ascii?Q?nIqhp+LnameY21S6aDOU0y+0MaU/wiiPO7vtcOad3zM4KVMbfErEybSa1y8J?=
 =?us-ascii?Q?lvMCEYgt2sBAnGskfXF6i1JFrcqhZ/RUKrv9feqXUkPmLE6uq7n6o3Dd1Cge?=
 =?us-ascii?Q?m8g1LGTBOkkvHn9G8tR6qYREAs8pADhtTCiFMgp03cn0gSPelIRbnctY3E/3?=
 =?us-ascii?Q?2bbeADP37kuC5u6tPDEJdxmy55enxW9ipZiR3/VHpLuKHMqvCKXTsoiohBxy?=
 =?us-ascii?Q?XZX3wTYZ8DRT3EyKOxLm+mtQ/crMwMH/bgZXN9c5iUEeRLa2Fqcoosde4cUv?=
 =?us-ascii?Q?vLlepqjQLJCCeA8dolMNLkQIvqHA0DQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d55e8b3-8457-4773-f822-08de73465360
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 01:45:01.9097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LOBxDuydnfCyKZbAwN0Y9QCKRMQYABqMTOc/NIMV0kf8Ftv/EZD5K8YyATFr8wwXoeiSbk9KJEQkhDAzD/vhVTXvE9rIHqzDGFDKbzUl+/Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7616
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAxMyBTYWx0ZWRfX7sAYbENHUxaB
 teJxycjdR19u78ZFHbZ6DP17faNquHz+nFsuRYr62BFc300fRuAJ02SNyNKlwl1AcjRF7wqrSAw
 mj8Mby1hP2G+FCJ9mdFQkdXqmB/6y497eCtBjgD92pRYG54LFYVDOK5uQZqhJz5puXCKyc0T2Pc
 TqSqJX6KUT4+CZCYtqObGdJkuNr2TfkoLs/InEyzbe2kmzmx7n9KHiurpgnNLwTVtVAmmZ0LeA8
 0DMhAxF1AFcftrUBv0Ol3rHjPAbjIZEfBoQQCpKyRnQz4UdkVYBv8CUzXNa/CEOnRlfbR7+qDAK
 QjfqrYHdhciYpw6x5Jq1sNkYFC4AjpE32wFolciT7sXK064Mcd4cKdnJG4PNcJV474i7BY0ts8H
 SBXtUWywp/KxbQBCqaqsMidXuTstkJsKcBL6cClgDd/24lWpulexGBzq9M8mJRw85ppHLZO7K27
 DsJwKcObCCNKC/O9b/g==
X-Authority-Analysis: v=2.4 cv=SNNPlevH c=1 sm=1 tr=0 ts=699d02a0 cx=c_pps
 a=48c6PaPq82/B1OY+thwv9A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=GHR8O2WEAAAA:20
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=YiNiJB1NaOXgVCpsLy8A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: bEnc7X6yAZvTa96Xq_Z872QtYKRkCEnJ
X-Proofpoint-GUID: bEnc7X6yAZvTa96Xq_Z872QtYKRkCEnJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 01:45:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231723

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...w-a-subset-of-tests-in-cross-compile.patch | 20 ++++++++++++-------
 ...-pixbuf_2.44.4.bb => gdk-pixbuf_2.44.5.bb} |  2 +-
 2 files changed, 14 insertions(+), 8 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.44.4.bb => gdk-pixbuf_2.44.5.bb} (97%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
index 534f4e0076..45b9aa60c4 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch
@@ -1,4 +1,4 @@
-From 325a4cde99a00b84116ab7111d27e6973f3c5026 Mon Sep 17 00:00:00 2001
+From 3b6aab24f6844b7d5b3e166bc910bffbcee1f6f5 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Thu, 26 Jan 2023 20:29:46 +0100
 Subject: [PATCH] meson.build: allow (a subset of) tests in cross compile
@@ -13,16 +13,19 @@ items that do require running target executables.
 
 Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/merge_requests/150]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
+rebase to version 2.44.5
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  meson.build       |  6 +++---
  tests/meson.build | 10 ++++++----
  2 files changed, 9 insertions(+), 7 deletions(-)
 
 diff --git a/meson.build b/meson.build
-index 3eb3fcc..dc7e790 100644
+index f478326..464ae1d 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -390,10 +390,10 @@ subdir('gdk-pixbuf')
+@@ -428,10 +428,10 @@ subdir('gdk-pixbuf')
  # i18n
  subdir('po')
  
@@ -37,19 +40,19 @@ index 3eb3fcc..dc7e790 100644
    if not thumbnailer_opt.disabled()
      subdir('thumbnailer')
 diff --git a/tests/meson.build b/tests/meson.build
-index 3781066..911b5fb 100644
+index 9b96fdc..9c3ed7d 100644
 --- a/tests/meson.build
 +++ b/tests/meson.build
 @@ -4,7 +4,7 @@
  # gdk-pixbuf-pixdata from build directory because it needs all DLL locations in
  # $PATH. Ideally we should use gnome.compile_resources() and let Meson deal with
  # this problem: See https://github.com/mesonbuild/meson/issues/8266.
--if enabled_loaders.contains('png') and host_system != 'windows'
-+if enabled_loaders.contains('png') and host_system != 'windows' and not meson.is_cross_build()
+-if (enabled_loaders.contains('png') or enabled_loaders.contains('glycin')) and host_system != 'windows'
++if (enabled_loaders.contains('png') or enabled_loaders.contains('glycin')) and host_system != 'windows' and not meson.is_cross_build()
    # Resources; we cannot use gnome.compile_resources() here, because we need to
    # override the environment in order to use the utilities we just built instead
    # of the system ones
-@@ -164,9 +164,11 @@ endif
+@@ -159,9 +159,11 @@ endif
  test_deps = gdk_pixbuf_deps + [ gdkpixbuf_dep, ]
  test_args = [ '-k' ]
  test_env = environment()
@@ -64,3 +67,6 @@ index 3781066..911b5fb 100644
  
  foreach test_name, test_data: installed_tests
    test_sources = [ test_name + '.c', 'test-common.c' ]
+-- 
+2.34.1
+
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb
similarity index 97%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb
index 0c06bdda09..9ed9a272e0 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.5.bb
@@ -14,7 +14,7 @@ SECTION = "libs"
 
 DEPENDS = "glib-2.0 shared-mime-info"
 
-SRC_URI[archive.sha256sum] = "93a1aac3f1427ae73457397582a2c38d049638a801788ccbd5f48ca607bdbd17"
+SRC_URI[archive.sha256sum] = "69b93e09139b80c0ee661503d60deb5a5874a31772b5184b9cd5462a4100ab68"
 
 inherit gettext gnomebase pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gi-docgen lib_package manpages
 
-- 
2.34.1


