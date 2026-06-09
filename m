Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E289CD8CAA
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 14:20:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.80999.1781014798417906900
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 07:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GRAz2MOm;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0620c5cc53=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659CnrZR2755487
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Jun 2026 07:19:58 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=hSxSDuZ42
	15huLeIQTrGolz4LJL/U0kkCX6HLon0cqc=; b=GRAz2MOmkjEEVeOf3RJ7jbjeD
	+3NHvIkiAijb0OIiTBtGmpfHL2qo+3nrou61EpDgLbRMS/4FVYwsBeoXBIy2X4mo
	eX7WTAhKW7r8TEoArM1sY2yZAVVr3O+92bURmqg1A3FHz/LFfOQtSmfOQF7WS5Ch
	ENLFhtrSKqhrqNM++9+vHTjNPQ4mdRfCdIS/4PLEJwWmG0Axgw/JrhjSxt++sz0z
	ZZLbxSAwiNkRFfCfsS7DubraHGMSrxHXn87r7EKEgzXypUSDVVSKs1axjo8yJl1S
	tLt6oJg+tVwRM/BJnBgHwZDDJM6efCsBGniHK/rqFZaCM7yKjvf3H3ljQXZpQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011027.outbound.protection.outlook.com [52.101.57.27])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4emk2gvaw2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 09 Jun 2026 07:19:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zg4YVr9iS0Jr5iSEm/BBkzTyily8GZ5SS1vMQXK1YkIMVq17oi2JLAxR3hjSjcQEgRN9cSI/ZnQJS6J9VQIPcqdoD+1go73sMNAgvaYodmXpoxF9fofkJg5jTvis7z0jj42o6QpMPgoa0aevqqt0qlqCIfWfTys6rnz2mUe1xpeK5UQe1MvSVu8u5UvEG4vVrA3TBOA3k9vhOP9jnXJQBPy9wDxAyzvm+iRzMtR1K28ZE/JTHh2ZDQMEdaPFb1w/Uh8r8XlA9YF2CGnF3MzrCkH5Me5Yf0+ZokuAEMQ4+lNdukiJSal3NeY2pcd/cqBeQBDm+GSLR1WEEVjOj3Qe4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSxSDuZ4215huLeIQTrGolz4LJL/U0kkCX6HLon0cqc=;
 b=aJfuyv+/N4xKu97BB2SsuWeyrskESyHw3K3p4Y7i8OMMJksP+Xl0z+puYI6MVIhw55wHxKlieaguvToNe9Cu1UEIyqOeg081K4SNqlg6MltUNkQY93+dH7X8jg5mlbPdM129vPCdAJqZJds2vzBYx0UOZXfHM0E9ZP2+icGh5sAu1gDByF3k9QfFMe53VXP40YsAH5yTjVsVXxteteEmSgBW2y3AwIp+GLj2DPcxwINV2o7DVz1tREWgpcoXE0Ebna3Q3/1vBTmLAzc7A7NCdMIKDE6WXvmb1LzqbL4jnIZtfYiKjMbT90OW9VNpt/SBxDjI4C53thy5pSx5bVR9Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by BY1PR11MB8031.namprd11.prod.outlook.com (2603:10b6:a03:529::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Tue, 9 Jun 2026
 14:19:53 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%6]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 14:19:53 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com,
        Randy.Macleod@windriver.com, richard.purdie@linuxfoundation.org
Subject: [PATCH] llvm/rust: simplify llvm-config handling for target builds
Date: Tue,  9 Jun 2026 07:19:16 -0700
Message-ID: <20260609141916.2724362-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0111.namprd03.prod.outlook.com
 (2603:10b6:a03:333::26) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|BY1PR11MB8031:EE_
X-MS-Office365-Filtering-Correlation-Id: cc989c5d-2779-451f-a6e5-08dec6322c80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|6133799003|18002099003|38350700014|56012099006|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info: 
	Pjv6NH9SHVS8lnmF9WGQhbIeQq4Ii3FdXMB5T3PKcy12aCo14IZ6U7hQCoE9dU7hm7ZnPI3YjSfMz84OEAXXvc35ZO+/reG8raMpG4PSwN5mmc48DM27XAamYN1xFShCxTafmeL8R86Jgor1jWseqUr11/9fqi95k8+AwOjK55cFbq1WzMxN0bTjyS2GP2BvyaqNZmR9zYDZFdUOE7VVTGxi+o/IJbUJmL9vD0XTsdU2SIPpniRoK6Sij7EYiOfwS9b+cz9fwCS+csTNzNg7ZVj2QI7K2bdbbbhOxxs41rGjaxA+SxGwa9S0uZwltmj3C8el2PPcbOKca/ajB8DTojtXiU4XD2wYQOlTCldIysReIfxxag6sU2qD6JXaDDldLeyrkLEZbuJoQdj9/S0gxN7xWpJrbFgX/6GZejprNSoo8iYdqfEIQbEKJOBnudGinaqVxYW6yu+kCU5LXR/s2ShEEf5HOEjJbUMACv21oXsU5RfqXGKj9u95WAhpsJCWy49ihVCYUae4HyPdzOkfV/LpHraz+eMUmTr5EQbPe7J3IjY6y+lpa1GOHycFCAw6d5hQT6rtzTYcqdVGz5vKgU61hHrtLfvYvqg/VH9dSVD91pyj3/7FCs9hFZNGJ52fqkU9uR3kXf8Nw6hKohLGuPCls0k40pcR9FHmmGeQ2L8q2TcfE4iLQ8HOgSq7Qa38dffCd/mTfu1ntga/ElWxP0uAt5v4YXPMSieOSiVYYapXrATT07koXgLzEnf5SaSG
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(6133799003)(18002099003)(38350700014)(56012099006)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?N+CryImbqo6PV5Vh4u6ZmHIooxp4n76X7B+R8PlEXiHjE7C0SXnlVGCN05xT?=
 =?us-ascii?Q?xq02NO5FKNg/YsBNYC3ylFawnxPXxTV8e1efh2OTlnAu1pve34/ecilbiJAL?=
 =?us-ascii?Q?AuijPjntHr6SEL3g6peLPoNaWaDQf7BThNUUy1VWIoCHgMIP6oG53EiTa+cH?=
 =?us-ascii?Q?YOSweFCksr3IEfsspPma08v0HqoQ9J6baVpscEBMNn5jkf6R2c4xvXc30G4+?=
 =?us-ascii?Q?ZEar5/MoWyzp0NcbVyUumJ9yABTfesq7GmACvuvYQSFSFkPmAJIIqLDnVPB2?=
 =?us-ascii?Q?gsJOwmbdaGoFNIHYW1h+QukW9IgJMh2HPZhMb1W/c2HU359rw/dZ+KEIrETT?=
 =?us-ascii?Q?Scai5sqB3oBI6YSo1Gd2OIVH4fX0VKP4iSjAHuZXYJwFeH5W3GuYzkuU/Ozo?=
 =?us-ascii?Q?1XNPoRWLXgy9LNa+EfNZ3Ntha7Md8AmH3JxYjUDjCOJpjaFyouP2kwqSrK5l?=
 =?us-ascii?Q?fHW3JVuX3sSOwK3Fo3fC8SL6+hdf2X01tn83Vt3eY1DrETGPoZwLm/cJD2ad?=
 =?us-ascii?Q?ywhNTL3j7sy/f9aQrG40KmLzTrT1x6zP4dXBFa4lrxYVHqzntynJlWqYYN/6?=
 =?us-ascii?Q?5icLulNymZ8dzpKdjX3LwgQfeGKQp9Iv3+H0NX13f6T/cfDsH+YBWorS10Ws?=
 =?us-ascii?Q?fZOfe5kFozGtGBUSzmOJH4fBQetlFJjVZybs4V7kFLUK6rQ0Cs1kJM0aKJ3x?=
 =?us-ascii?Q?h+9gfn9bJV0lT7B7trtx76mJokakwEp6eokASUw7x9Bvkz03kG7aaS8fHJ2h?=
 =?us-ascii?Q?T9ASdgcFFObRP0ypj12YSC5PbE6HG5DRsa9TvL7KJ5M27bAUnnsmB9Ne5YyD?=
 =?us-ascii?Q?XShMK+gN//6r6X3WnGY9cRKnCVb/E1v16XK3LcVUURW6sAvsAF+K14UYyxYy?=
 =?us-ascii?Q?MoPBYsJJkwNXKweCIXqZFl5QMD9M+gLWP10O4u+jcQwf9Z2dZp+S7hZe0A8H?=
 =?us-ascii?Q?KZxiblzCDuR/hCg18S17bVfWxN36prE9z7Uv9jxJNvGH+ko0crRPuNI4TBWl?=
 =?us-ascii?Q?T+x07+ZZJzwbXIkJdkzuRMCydgEuBUEFWVsIZYbEt3tXqcZHnz25ea6PiO37?=
 =?us-ascii?Q?y/M9KCc5HyIldOC6VfJb7AhvZDKpC/6RhK4Tt7E8/Iep4LVvLZe6dc/AJZok?=
 =?us-ascii?Q?3TczlFntoC/S25SZ1ugrEbR8kJQPDLt5NAN1717ydRP4wTH6390H7gBM7q9Q?=
 =?us-ascii?Q?ElZxq5K1udoaE0dkcEa1/Um1Lw9PDcSu15mPes56eURTdmYob25FKf4RwRTW?=
 =?us-ascii?Q?zt0pNGvl1bfgbv03wwIPd8I7bCmUbQIAQZP+usxS6id4XvjBmHQi0Nf5SqYs?=
 =?us-ascii?Q?a53Rv9GTuRWSnLRSEt972TFf3pH8W7QxsivxZkK6rwZnSov28dbQ6zgIoS0S?=
 =?us-ascii?Q?TLma3FKXNEW3ZCt6GfcCE0kN0Y2B4dHE5RqLHLUib9NVZ0MFTRTec2x4LZwF?=
 =?us-ascii?Q?DFvoMcsRnJl9DFJwFdOEeZuQvfb9EoK7vqiYexG9IbqxQSMsilIl9rIJpkhe?=
 =?us-ascii?Q?YQt8rg23skTqROeGQrktE8x509Tu0GAbVbcU6Bgf4HnpVHdoTq2+5xkL2R8a?=
 =?us-ascii?Q?Dzkyx49rmBJQIx3+Fa/+YRenD928YFHzmEKCGlVvLfD6IfLrVt+UJfpX3cn0?=
 =?us-ascii?Q?R5ZuUuq/87Vj5Quz4iQqzEjBsjjlQhsdpIR4lqC2HC0qugRHpBvW4iP4EKmF?=
 =?us-ascii?Q?ItotD3EP5bzcnMCSVBvoloZrCqltXNrFH+CbOcEkf70NUK7mjXswJSLEhOiu?=
 =?us-ascii?Q?QDwprUcsUUpKLbCoPN//VCUxdWOTpXwHHoDoiFnGiEmSzxswDbIe?=
X-Exchange-RoutingPolicyChecked: 
	Fqp980xTmuGsXoRbrce9xArRbSIPcOAyEo13xRX6OoualoYSZsMhWwepLzRxriIC8k/yppHPh42E1X+aqZ9mEw+RVDya+39BMfdQWhvtNU7tcY9XixM9gK+N7QcP3/zFXypOuYZtsle7H/7DTN2Uf+R6mnKRvD27MSAJXKBqEYyolU7DvcZC46baD2896cyRB3OIbjtt81PX2g1lhtxSokRq79jzhLCKjuFkhPJfZUerx3+L0GfWPEcpVJbADrLtULA6w7nbBYDErqT5JzRjqxfulHfZJ9aMrDQ16m1gV5XVthvJTgoDTwc0J7nAgXHUAWb4R1n3IByZQmmadCjWWw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc989c5d-2779-451f-a6e5-08dec6322c80
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 14:19:53.1887
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ToPbceCnwNeEVa1TgY0980NbS+yiNK23TP8l0lsNfZBx3cGug9W45kBl32c3uRbNbmXA4xFxH1i5mpAKaYptFS7XURwu1kUWAcLuIAtHW+h+5SLTGcrK3irjTIAIIFES
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8031
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=VZHH+lp9 c=1 sm=1 tr=0 ts=6a28210d cx=c_pps
 a=XDLC/QdwmM9eY7nDu63Q8Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=ckCNTkt6AjYl-fCN-5sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEzNiBTYWx0ZWRfX+0iPgUzTV0dG
 KEBU9PQIHdCi2mzg/a3VOV+gFXFISq3H/kjNZOZQ8XrQZk8rS62+0P5poL0yDT5KWGD9Em1dsPf
 R+OLGTQmWoqecV+629EetzfaKQmSSYSQjCtwa0bW2wXItRRaILYOjFRRYLvWLLzFLNJ8B7fIn8t
 pb9v9jJL11PLwHS9VLsXjjRd5TdyD8LxVtfnMjZu6VGUZPBwI8+L074Lmo6ODqeR4ZqRBHMLHA8
 HDIOZAL5Z1EFJGUEO2pYGbgbejj0Wl+IW9dlxHR7A+V2Sc5dZ97cAWZLypzZsVnbglt88nDql8z
 uL35z1ahGVsAf1mwCCOc2ZaLtX9i6Qc0eJSUPHgG4wESJA16PsHyhfRXuRSbTINjPbrx8d55SPP
 R/K6SrTG4Z5Kbd7/knuuVEziz7ZCtvFNeCLkHub/1XXScWO1w8COoX5d9VTeC8uPQuTBPrBknwu
 Z/Lq551ArODC13nrbQw==
X-Proofpoint-GUID: IQjlYEjzyvEik_6A1E0gfvC54u14LBk_
X-Proofpoint-ORIG-GUID: TBjNx9esY0mNzKk75UElvaeoedYDv1TM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090136
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 14:20:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238297

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Replace PATH-based llvm-config discovery with explicit sysroot-native
resolution and simplify the target llvm-config wrapper to act as a pure
pass-through while preserving Yocto alternate path handling.

The previous implementation relied on:

* `which -a llvm-config | sed -n 2p`

  This depends on PATH ordering and assumes the desired native
  llvm-config is visible in the build environment. In cross-build
  configurations this is fragile and may resolve an unexpected
  instance or fail to locate the intended tool.

* `echo $base_libdir | sed -n '/lib64/p'`

  This depends on build-time variable expansion and may select an
  incorrect library directory when the expected value is unavailable.

Update the wrapper to:

* Resolve llvm-config directly from known sysroot-native location.
* Detect libdir using filesystem inspection rather than variable
  parsing.
* Preserve `YOCTO_ALTERNATE_EXE_PATH` and
  `YOCTO_ALTERNATE_LIBDIR` handling.
* Delegate all arguments directly to the native llvm-config.

Remove the native llvm-config copy logic and lib/lib64 symlink workaround.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 ...unwind.pc.in-and-llvm-config-scripts.patch | 52 +++----------------
 meta/recipes-devtools/rust/rust_1.96.0.bb     | 41 +--------------
 2 files changed, 9 insertions(+), 84 deletions(-)

diff --git a/meta/recipes-devtools/clang/clang/0026-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch b/meta/recipes-devtools/clang/clang/0026-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
index eeb802732b..a2c3532a66 100644
--- a/meta/recipes-devtools/clang/clang/0026-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
+++ b/meta/recipes-devtools/clang/clang/0026-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
@@ -8,6 +8,7 @@ These are added by OE project
 Upstream-Status: Inappropriate [ OE-Specific ]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
 ---
  libunwind/libunwind.pc.in          |  9 ++++++
  llvm/tools/llvm-config/llvm-config | 52 ++++++++++++++++++++++++++++++
@@ -35,56 +36,19 @@ new file mode 100644
 index 000000000000..6a0dd54b8eab
 --- /dev/null
 +++ b/llvm/tools/llvm-config/llvm-config
-@@ -0,0 +1,52 @@
+@@ -0,0 +1,15 @@
 +#!/bin/bash
 +#
-+# Wrapper script for llvm-config. Supplies the right environment variables
-+# for the target and delegates to the native llvm-config for anything else. This
-+# is needed because arguments like --ldflags, --cxxflags, etc. are set by the
-+# native compile rather than the target compile.
++#The llvm-config wrapper will act as a pure pass-through to the native llvm-config
++#while preserving Yocto-specific environment variables used for alternate executable
++#and library path resolution.
 +#
 +SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
-+NEXT_LLVM_CONFIG="$(which -a llvm-config | sed -n 2p)"
++NEXT_LLVM_CONFIG="$(readlink -f "$SCRIPT_DIR/../../../../recipe-sysroot-native/usr/bin/llvm-config")"
 +export YOCTO_ALTERNATE_EXE_PATH="${YOCTO_ALTERNATE_EXE_PATH:="$(readlink -f "$SCRIPT_DIR/../llvm-config")"}"
-+if [ -n "$( echo $base_libdir | sed -n '/lib64/p')" ]; then
++if [ -d "$(readlink -f "$SCRIPT_DIR/../../lib64")" ]; then
 +    export YOCTO_ALTERNATE_LIBDIR="${YOCTO_ALTERNATE_LIBDIR:="/lib64"}"
 +else
 +    export YOCTO_ALTERNATE_LIBDIR="${YOCTO_ALTERNATE_LIBDIR:="/lib"}"
 +fi
-+if [[ $# == 0 ]]; then
-+  exec "$NEXT_LLVM_CONFIG"
-+fi
-+
-+remain=""
-+output=""
-+for arg in "$@"; do
-+  case "$arg" in
-+    --cppflags)
-+      output="${output} ${CPPFLAGS}"
-+      ;;
-+    --cflags)
-+      output="${output} ${CFLAGS}"
-+      ;;
-+    --cxxflags)
-+      output="${output} ${CXXFLAGS}"
-+      ;;
-+    --ldflags)
-+      output="${output} ${LDFLAGS}"
-+      ;;
-+    --shared-mode)
-+      output="${output} shared"
-+      ;;
-+    --link-shared)
-+      break
-+      ;;
-+    *)
-+      remain="${remain} ${arg}"
-+      ;;
-+  esac
-+done
-+
-+if [ "${remain}" != "" ]; then
-+      output="${output} "$("$NEXT_LLVM_CONFIG" ${remain})
-+fi
-+
-+echo "${output}"
++exec "$NEXT_LLVM_CONFIG" "$@"
diff --git a/meta/recipes-devtools/rust/rust_1.96.0.bb b/meta/recipes-devtools/rust/rust_1.96.0.bb
index 3eb2a36406..45a67e71ab 100644
--- a/meta/recipes-devtools/rust/rust_1.96.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.96.0.bb
@@ -31,7 +31,7 @@ PV .= "${@bb.utils.contains('RUST_CHANNEL', 'stable', '', '-${RUST_CHANNEL}', d)
 
 export FORCE_CRATE_HASH = "${BB_TASKHASH}"
 
-RUST_ALTERNATE_EXE_PATH ?= "${STAGING_BINDIR}/llvm-config"
+RUST_ALTERNATE_EXE_PATH ?= "${STAGING_BINDIR_CROSS}/llvm-config"
 RUST_ALTERNATE_EXE_PATH_NATIVE = "${STAGING_BINDIR_NATIVE}/llvm-config"
 
 # We don't want to use bitbakes vendoring because the rust sources do their
@@ -192,37 +192,6 @@ python do_configure() {
     bb.build.exec_func("setup_cargo_environment", d)
 }
 
-# llvm-config expects static/dynamic libraries to be in the 'lib' directory rather than 'lib64' when
-# multilibs enabled. Since we are copying the natively built llvm-config into the target sysroot
-# and executing it there, it will default to searching in 'lib', as it is unaware of the 'lib64'
-# directory. To ensure llvm-config can locate the necessary libraries, create a symlink from 'lib'
-do_compile:append:class-target() {
-    # Ensure llvm-config can find static libraries in multilib setup
-    lib64_dir="${STAGING_DIR_TARGET}/usr/lib64"
-    lib_dir="${STAGING_DIR_TARGET}/usr/lib"
-
-    if [ -d "$lib64_dir" ]; then
-        # If lib does not exist, symlink it to lib64
-        if [ ! -e "$lib_dir" ]; then
-            ln -s lib64 "$lib_dir"
-        fi
-
-        # Only do per-file symlinking if lib is a real directory (not symlink)
-        if [ -d "$lib_dir" ] && [ ! -L "$lib_dir" ]; then
-            for lib64_file in "${lib64_dir}"/libLLVM*.a "${lib64_dir}"/libLLVM*.so*; do
-                if [ -e "$lib64_file" ]; then
-                    lib_name=$(basename "${lib64_file}")
-                    target_link="${lib_dir}/${lib_name}"
-
-                    if [ ! -e "${target_link}" ]; then
-                        ln -s "../lib64/${lib_name}" "${target_link}"
-                    fi
-                fi
-            done
-        fi
-    fi
-}
-
 rust_runx () {
     echo "COMPILE ${PN}" "$@"
 
@@ -236,14 +205,6 @@ rust_runx () {
 
     export RUSTFLAGS="${RUST_DEBUG_REMAP} -Clink-arg=-lz -Clink-arg=-lzstd"
 
-    # Copy the natively built llvm-config into the target so we can run it. Horrible,
-    # but works!
-    if [ ${RUST_ALTERNATE_EXE_PATH_NATIVE} != ${RUST_ALTERNATE_EXE_PATH} -a ! -f ${RUST_ALTERNATE_EXE_PATH} ]; then
-        mkdir -p `dirname ${RUST_ALTERNATE_EXE_PATH}`
-        cp ${RUST_ALTERNATE_EXE_PATH_NATIVE} ${RUST_ALTERNATE_EXE_PATH}
-        patchelf --remove-rpath ${RUST_ALTERNATE_EXE_PATH}
-    fi
-
     oe_cargo_fix_env
 
     python3 src/bootstrap/bootstrap.py ${@oe.utils.parallel_make_argument(d, '-j %d')} "$@" --verbose
-- 
2.49.0


