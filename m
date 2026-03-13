Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF296107BCC5
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 16:00:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19287.1773417607242914502
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 09:00:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=KxO4gxoz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75322bb784=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DATbNG2275136
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 16:00:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=1+bCug8VJZ7Obny3RwivI/N2jd2qAIGHcW5r0dvmKg8=; b=
	KxO4gxozskcOrDnBhX3kYCBUktCwEio/tHqc1xwYIpISam9L3EVf0GsqCGZU9OVo
	y280J9YFlXO6fjpxowKeRlmcjVZh02aVep+tzF4impcuwIW0M4zTRZ3i/awhbPuh
	I+4Mimlto218l5R3YXimQ9bOX5T5o+34oKdgd20lfaMglrcrUK354ZU6NtbgFdtY
	F9lfeXHp74JaA8epqcjUAIs5GEfBW4057K0DyQNk1gVY12uaK3iaRy+GGGsbY6H3
	UhPNeE/JftpMkQkN2zWNzIvds9dN0qsxHheXM48IzEZVcNEGUNNrYU1aOIXM1+rf
	2hgrN6LHpiDUK+klVTScGA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012008.outbound.protection.outlook.com [52.101.48.8])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cuh78jbcb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 16:00:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cvqn05UwDoP2caEUB/BxiG1TYFn0q5x6kSIy1iO9v/tjAk7+ncVOKp1mCKoiGBhK1GcDWK4j13OT3MNZtO1J3+N2S5hOQRKWIxy/aFT4aLfM+x1jg4NWAdW3M2f9PTAMsCsvuBVE8d0zDuRTMTQ/Kg10YSgHcmBn4Xgf8lnCjXna1ZwslH9zLA5iXdAgtj7M7xsW/3fpgjIeKs24rOk/miNvtHiYEGaHqBPSNo6hZ8mKYazF0Y2AFii7kvjMo2apBbYzsosf0TY/FOnIRiP7oDgnq9brbAcm87tj7lf2r2DmT641WFgGdh+V+opJDwedj67ISAbwHLB4Lwnlg/kftw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+bCug8VJZ7Obny3RwivI/N2jd2qAIGHcW5r0dvmKg8=;
 b=JiZNRjJvQJCui+TG7ui65Uv3F7y9ZlDPWrcwWSMLTNgierwhaFiyWOenxLrT5YxDttI41+4zoAyeCVJE0Xwuem5gZANq9nGa9+pIRnlcYartXwpz1E5V6ZGlXtLF+bsVwRiymBeGLCu8Oxe2hdPw6gOAdNXCaX9QQcVowRi2LkEeq2dwDhuZON7UzCZI1OzYH4wK6FDALomV6o13lZwpQwjpb09oE5MJGikJwkUustMS4YkpspqnuHWlxgcgOg2hRAnGUcHzIsKQUucWi1dNi4XS+uRYMHr+5ZZVDw8k1Y3c1PkhmSXlBr+M+4IQSqGWjPtVhwf/RlE0VlD9EZTWAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CH0PR11MB5297.namprd11.prod.outlook.com (2603:10b6:610:bc::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Fri, 13 Mar
 2026 16:00:04 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9723.006; Fri, 13 Mar 2026
 16:00:03 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, richard.purdie@linuxfoundation.org,
        bruce.ashfield@gmail.com
Subject: [PATCH v9 10/14] kernel.bbclass: Copy include/config/auto.conf in STAGING_KERNEL_BUILDDIR
Date: Fri, 13 Mar 2026 08:59:16 -0700
Message-ID: <20260313155920.2347101-11-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260313155920.2347101-1-Harish.Sadineni@windriver.com>
References: <20260313155920.2347101-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0046.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::21) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CH0PR11MB5297:EE_
X-MS-Office365-Filtering-Correlation-Id: e23b7601-ecc9-451a-725b-08de811996c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|18002099003|22082099003|56012099003|7142099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	SgKIZrTJkWDlE/AE27GDwhZ5C1xgXQoksFQw/5kWJ+vkdBRZXOTVTiJgde2iQ71XwWP3FPoctw+Fl7/kdAB4WbiZ6jdMNLGiPvtkufY2qd+1IbXpM5JdWQPw2nKnLqW5XRGDXC9zk4FLhAJaQ6QYYR1w5lEs/n2sNLSXRaLs/qFHvlCaQivU2tmtjP4MCOIxOcwrKhyny6zy26ppoV+77e34mkav0VyAXMr2ewlU/flmxu8pGmTAvXbTt14qbBYYCzK32HNCZIRhBlKKxWECnBSQP1ej4DpZHcXQI+m+bmg6npAFdyjcH/fBr36Zul5zv5f32A/4C6uKzkDdU1VfnjHReXzC+cbe9JhMmRntFhE/BStcsAaXr0ujKqhfzd3tzxZyl3f7ojrvnR0Ps8kOGGD6J1cRLF4XqjMz36bKIlmf+iq2dQbW9LBfLuUg5c+V88qxsH1jVtTWQFwntbTGyFlQ+MURa0hIBU6dSMEl9bhueAjoYhLE0bAue2qV4FgGtBoVUJtJ7IYXginPvVJhofbUJNj/+sg1Bf7saleOlU841WPGAruGwAIjbxt4fNAPRJMf0DQbnmk10S8uuKjZfrBOV96lpI3bf6mPW31uQ5ztLgN7M6LXrI8lBmh0qejX6XYfaTx2e4LHmv4Lx1lp5Y82DZHdh0RXGvnXxFL++ICBwNlTclmdB/gs4jgKRHl2ePCsCffIZaKGxe/zJOX4E3bpgtlgIsiqMQxPmwyMBIhQbBp79lqFarnxQRh8SJdU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003)(7142099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sxTU50iEgInewADNYcDwQaq0xs7baeORPdTW3rytPJ8MRZxOlQbITG3/Wavv?=
 =?us-ascii?Q?UDV9QD6t5yql39fPU/VHnJf/BMNGtqHEAcgfDdScVwBA2g/cRu78oT1o1T71?=
 =?us-ascii?Q?IOzN6xzzOUFEJE3PN6HkSf4e8rdM8ZbKNCm+tVK1BMwo96647NmTJCwcfKMc?=
 =?us-ascii?Q?NRiVprIpA4R4UVaEKS8hAEFsvBzEzIAA87U15Ng1ZdEslq4xugrOwJi1GMOt?=
 =?us-ascii?Q?+IV2KN7UYquqXG5d+A+YVe8/xEiPKKQnMUDTKMIVibldXwE/AKyVzRFF+9Zx?=
 =?us-ascii?Q?/EmDvDsTqhR+SD64g8RDnXDxm4SXdnAZ3wlSp5hQoARP9xxvZvVNZKueiHO/?=
 =?us-ascii?Q?IXVi/MOAoZ/shOonjj2XrjAxyuR928WjplJuKxpeEkwy/20JorlSZWbTptkT?=
 =?us-ascii?Q?LIo6SxNCZmdPVU2zcMU80oZyUt2kdy0cceaBMFobM/gO3PxfILsJV4DZWlTt?=
 =?us-ascii?Q?o6tWcBDcVjLc65IRDP1Z6bOVBE+hLF23V2weZ/6KK0S8b1L24O0jhydWi4H6?=
 =?us-ascii?Q?Jly7yjv3UPxAXDKxZbqJ/Rz9LGjRFifzgCV37Dz3Sqf+zhFxZD5qpD3yb0B/?=
 =?us-ascii?Q?USkfRwRvcSkr1tN9rSpSdPsl5Lso1w1MTRIbAhslmHrtc+awYxSxAQt2tkMR?=
 =?us-ascii?Q?pujJ39y8nW80otJNAL2N1MXOEKJ9YHkjhdZgV5w3n+KccZQ2I3qzSRf3baTU?=
 =?us-ascii?Q?JZ0cWjClw9cLgc9mwyp0mTX05Mab3U4iM0RqE8ZL713Hh99Cexc53gaW2rSH?=
 =?us-ascii?Q?ac2X8pbVrCI4XmeI3eJxaCMQZXS7/WOO3Znud1riI1mISb9+7hPc73/okhk7?=
 =?us-ascii?Q?xNHwKebS4wWe6aVCiusyuEjeb1bGgXHIv01Pn5b77trsNkvZHcT9xR8VPdnB?=
 =?us-ascii?Q?LI/lOc9nmWq1zwAuqV8eb1LoY3XxX//fy+0CW4m6VFZrqFhT7bgs2JlcOM7d?=
 =?us-ascii?Q?94x29T9B545t2jCYgeZ/Xi0lDa10GYJUF1TkjVzYCK/V/jKGJrduGjZQIr36?=
 =?us-ascii?Q?taEF1LkoH/YryHUaQkFfDb+cbYE82ZJEAx/PbP7LRmD0VFObc4BOoZ9WmBww?=
 =?us-ascii?Q?HqE4YQZjsGwlc3CxQzMXYsdm3Bpf3YbirHFybMCsQHdRTvFUo9zopaBhDoKh?=
 =?us-ascii?Q?9zUausenLArvCCEeu7q7FMf+znGRHTi23YrR2fQqQynDTb5U+A3/upNbGxky?=
 =?us-ascii?Q?T0rnQD2Yb7Yu7f15/6MgqA6nrAA/uEixyiwyTOLjnFQSKS/708PMJpybUO6j?=
 =?us-ascii?Q?4jBVJcsrMfo9auBSMQVqAsGcqiRibW1/nUfyd8Zh3/esWT58GjK4orVDj2Mu?=
 =?us-ascii?Q?qAnv/ohiOYjoEBsOUJhEtCMhiFSBPOWdVeBswuBC8+yO4sc066g6KE1jxk3g?=
 =?us-ascii?Q?QpkaKfqvs2h3doNH9X6CIhvbvRsI6G2+VKLQRIBfUfL8x3SKQgR9QU7s9Xh7?=
 =?us-ascii?Q?I7M8p79MR1fxTVxCxkoHMZYXXHKaisPvezVfIMgyEj6uL2S01QDMA0mctI/s?=
 =?us-ascii?Q?fYjxzq2qFq+hxffWpmcvy3Nr0FRDuHs5c+k+NqjrckMCKgAf5AA1jfxIsJpH?=
 =?us-ascii?Q?ldLDBimMzsLqMolX5q91FJlZFMvTibFy6ftLLuPGdcOh8B3E2RL7ut49+N5Q?=
 =?us-ascii?Q?HYDrMt0ZQsNFdHgh0gcIt+6WWd0o7aBxnh1+IMP+pxWHE5/IVQgXk+kLOI/2?=
 =?us-ascii?Q?wDx7s0NpJYFiZ5Rpu19qWQdkAUC9X9umvfuRVy2TmGsgAF54HWBkXEWEY08O?=
 =?us-ascii?Q?RMmYnDO14asnDx1LZno/LnHh/s9KFPI=3D?=
X-Exchange-RoutingPolicyChecked: 
	QTU6gKrKCX3I5JP1VKiwPPHkL2xlSUzdHaRSbmkSlT/+vKkjRhho47p9Hk3mmtFzNU9neocRI3gA4O4UzvLNbv/2MDiTB8MMBYWyqdCYCVuqve81boEFDVnISYyczk+SQO3F/ik2kKlgMdHne8ZETcD1SQGXK3f4un2PwdOaljxawQmY67FVMVAaTRUw1LdqLwc4FbCDelt3taRltoyjyrP3bzG42NfsRr7moJ9dzlChvKNqzuCw28ctPlaEa5Mdstg1zLEq5PbX8eDwOBMDB3pOxIl5nqsVaZSnUaujG/Cq/7I0X0EqvhyI5yHvfpBQk+1sfUw7xoUlM5QWxPYrLw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e23b7601-ecc9-451a-725b-08de811996c2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 16:00:03.8153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J9CWQEtoCt1bu1sFfWvKoH6cMRTt4RGd2/XJatVTfVQRaB92AnhxoZZSPcyA3JEuGBi3EoDyBukOCZXls2N/XGFh0YQR9CPfGsiFQQTCvvg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5297
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=ALvEU0hV c=1 sm=1 tr=0 ts=69b43486 cx=c_pps
 a=XFLf1xCRaRgjZQpZvgYG5g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=TeJiQh7uZb9NdfcNB-sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyNyBTYWx0ZWRfX0112KNkaNpJ5
 QCeE70IVKSAv5hGfNl/QhA3FFOTlxULaQR3nDrEMnVLnXK3YhF+kuBjUYWuZT/6t1yiNTXb5s2z
 wt8wfwo/X4aew2aZHOJfvgx2HoittS+i7EVEwaGfuzt3V/IiHfpoqtog2pERaYj9zbybo7k/zCh
 UH0lYELrSsg0z4zSGHt1IUBMepOr8N+t82dkPep0MNXXfoEqU7YDUERzCqkccaZbizKxBx9R0Zj
 WPxKJ9lAbDm3PPe/r7JL8jN3GqO8OK/BrHS+NMBPiaAnjrSeh6uj2B0vkVWD2xfgN6PXAA1xLjJ
 PknPjYM84lQNE+i2j2yuTtt3Sf+5TdN1k8rC8NWEIaOFnuuJlt/AmQ+FF9Ndbm6HZPNtdPF139d
 lReca7DZWqGxBfFZblm0TLzWiKdgaLiKarUyRJu2UIwdzUreE5OkXWYniVq3rpyVPJlA9/6w7uu
 hUqwWUdDiTrgLPjttbA==
X-Proofpoint-ORIG-GUID: Fem78mqfo1Ldi4SRY4CxveiRfxtUJo25
X-Proofpoint-GUID: DQWZTiwBWWVvk0WiKGItKin905DBzxNa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603130127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 16:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233057

From: Yoann Congal <yoann.congal@smile.fr>

Linux commit aaed5c7739be ("kbuild: slim down package for building
external modules")[0] states that include/config/auto.conf is also a
file needed for out-of-tree build.

This avoids this error when building an out-of-tree Rust kernel module:
| make -C .../tmp/work-shared/qemux86-64/kernel-source M=$PWD
| make[1]: Entering directory '.../tmp/work-shared/qemux86-64/kernel-source'
| make[2]: Entering directory '.../tmp/work/qemux86_64-poky-linux/rust-out-of-tree-module/git/sources/rust-out-of-tree-module-git'
| .../tmp/work-shared/qemux86-64/kernel-source/Makefile:779: .../tmp/work-shared/qemux86-64/kernel-build-artifacts/include/config/auto.conf: No such file or directory

[0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=aaed5c7739be81ebdd6008aedc8befd98c88e67a

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
index d61cc82a4e..094c1148b6 100644
--- a/meta/classes-recipe/kernel.bbclass
+++ b/meta/classes-recipe/kernel.bbclass
@@ -550,6 +550,7 @@ do_shared_workdir () {
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
+	cp include/config/auto.conf      $kerneldir/include/config/auto.conf
 	if [ -e certs/signing_key.x509 ]; then
 		# The signing_key.* files are stored in the certs/ dir in
 		# newer Linux kernels
-- 
2.49.0


