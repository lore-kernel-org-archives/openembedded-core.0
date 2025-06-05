Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9ACBC5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 05:31:07 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.434.1749101461619334901
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 22:31:01 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=82513ac62d=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5551d4sO027200
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Jun 2025 22:31:01 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 471g9ruj7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 22:31:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VAasLSPZD5MycltlxNiQbybN4nk1ulOgA7NvOqbXjyU6svpTCrf5LhkNxLn4EaoKxjGLnIPzVP4QD7/2JK/37rmZp5iBZu8D9d2p7ed/s9mnu/AEo4RXZK/OQ15eREkd2wmZnHsqujA73gziOsvwnxdCpjZw6/QElgCz+6NnghEziZqjmHHT5Wca088gr0620twt8ppCEpuV/kDg5SE8aPKoJ1wKlkVlhEWX6mAuazguvWj7MJnkW+CtkCyP+WE+z9xt8Ak/zPn91o3uaL0Z4xlsrdzKXdaZCRpwhtsPbNpTkYbbHYR0mt6k2UhabjgYPcyZDyknkIlcjTMtTm6pkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B19ZK5jXI15tkucKYarCAPrNRGtfqDfUPPowUckkM1s=;
 b=TUu15sM66TEDzriC3ru/CeS2ATvjHMF1vubxg9lHnxQ18vLGNs6cgwJKfCL1Ucgaet2IFfVKsNiEJScMvZ8lmfJ5hgULyWTxaKwG3RCKeBW/gLNfuAR82XyeXlECAjUnVpRf5JRYI81BHekeCBc5ZzsJ7V7Z/KLArz211mC7Nqj3nT00Rzig6iwqtwy3S8vZOWAUbf062JqSJfbdlIqEMS4ybTj8ERtsaCjibaRokDG+7PwA/6XQHREvzZSFtCcvGGaik1PYa8Q0C4gy8H23kfXU2GtJpn/VhUjLBycIWFTxGYBJVJKjKwhdYeMuZuQJYhTHq8SRo5RLRIGUWHDaFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by MW3PR11MB4668.namprd11.prod.outlook.com (2603:10b6:303:54::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.21; Thu, 5 Jun
 2025 05:30:58 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%3]) with mapi id 15.20.8813.020; Thu, 5 Jun 2025
 05:30:58 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [scarthgap][PATCH] binutils: Fix CVE-2025-5245
Date: Wed,  4 Jun 2025 22:30:52 -0700
Message-ID: <20250605053052.564169-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN0PR08CA0011.namprd08.prod.outlook.com
 (2603:10b6:408:142::33) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|MW3PR11MB4668:EE_
X-MS-Office365-Filtering-Correlation-Id: abad7f5e-1ee2-45c7-494b-08dda3f2267f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?yPoso515K6AZpmJcMF++1rP7V/jGEkoDO8OV/cl0vZDWNVRMnmdre7SgA08e?=
 =?us-ascii?Q?RtUsCIaOOlMsT0spkJo8uIT5OEEX4qKiB7S4+9cuDS9LJL/y3+q7mEmfoAYy?=
 =?us-ascii?Q?fkpDVkZ2QdTgIOqbCQvGPSrIkxGhceGUS2NlJyeFu8HJOqRVLPabs9u0+wsv?=
 =?us-ascii?Q?g5BV+6oQMu//Jg5F3v1dNutEG1vIhH63WJ98N4zkcpWRulahgQiwo3KeoDEb?=
 =?us-ascii?Q?Cd0Ey1BacaRmWFsP0IyxKyM40elwZ4SBNWvJHWDfh/3DUiGiX6n+6+p7VPaI?=
 =?us-ascii?Q?Flth2HNhw7ovSMPMOGFZBIPh5RQJawlFO8KOG2oAINC9LTruQ22bGlJRKdXp?=
 =?us-ascii?Q?TatxCeCVL5AVVcTJ0vjys6jNi+joQ3soSmiOifs5+MEW5Hti17MDX0sT9KCO?=
 =?us-ascii?Q?/1FmiwNVVbvfcXKKdOB/ZUV7wwn/tD0AG/QW+Bw5Dui97t5BLsKmJSI6ErOV?=
 =?us-ascii?Q?qQp9/jZ+fXyliPoRAsU599vlsRfbUgR1IgcCd7rJ0x3sCdVZJs4Nv2kOIpqK?=
 =?us-ascii?Q?9w0qQiQpw6p7n6iXgUShRACPhThwJPGf3pS+Nlg6apTFFN3aEQtoO+GY14gg?=
 =?us-ascii?Q?FisC7uXv/61WLEBdwgGSzGbv1ZtJT9wgwQvdmiuTjojKERi52dyLFjUvAeLf?=
 =?us-ascii?Q?sfdlD7DWSO6zxVU1VUuIWr+Mwp3OVqcE9M8iF7bWAbyvttuxZLpuxmvkCPM2?=
 =?us-ascii?Q?ywuOMvvKdp3vC4gRb+Rf2YCR06fCQ2ZgBq8YCb17YURrU4k/f7rE4TjOrzq4?=
 =?us-ascii?Q?BTEjiEFh2XO5C4pxS96HnisGskT1zPCTAgexEBwQi14BJ3q4tcWbYRFp4Yot?=
 =?us-ascii?Q?oYwCuZ55haO/L4DPiSqtPNMxFxoZvg/7jwLjDpLMM6gk3Ar5Fli87jafTmfN?=
 =?us-ascii?Q?hhCEdRjdD8ff3oRtmmlJiaIYWfNuLqZaG33lntGsmJwPsls15w5vEjiZAGhB?=
 =?us-ascii?Q?oTkYrZvyJPw82iTTQZ33cJhx9pKlvIfchOMd+2B/ljlaLfuYYeD7PzD+Zsvv?=
 =?us-ascii?Q?UkwALW5f/5htuOICKilHO6GJQKoDR4EKoLxKnhcGWw+CKORMcbEarMBWxre8?=
 =?us-ascii?Q?ra3kGEi16FwXGrYJ45iIjxqG8bkYKIbyGD4YPtHYA9CNggnro/9Y667uwBr6?=
 =?us-ascii?Q?nzMCtA3KLbqkLTiRCr9auPz50ltJVPnWdWcQLAUuee7L0Kp4gNtXZ9YAFZm3?=
 =?us-ascii?Q?0GwNt+clqcA5WB1A5uhszXFXszfKCsEY+gsY8NLRWN25k5cWlXafi10/8Vta?=
 =?us-ascii?Q?0eWMZmpLn2+SdLVbDajtBOEcQhRim4mEGOdTROaRUYT5nL3OYoiicaBqmLWb?=
 =?us-ascii?Q?OQ2FwoyO/fOIPbhr5xVNS/oersZUqWgoeNlb6WCIyo/2RPKNyp//OrPVifmi?=
 =?us-ascii?Q?eHWVkplraRpugJAdt0SiV9lMHXME+uEqmTRUlBBmx7FI33g6jsN19fDMOnzM?=
 =?us-ascii?Q?SbJUmckkuKk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CxRNDOSK/qCG79SptMIvu/YTDq2K97NUeY30/MX8lldzf/WLOEu0rqyDtd3p?=
 =?us-ascii?Q?HQUGGC5rKKOvj3nWUeLVzGiZLqPoarUDhZAQAkCSxut0whxm1a8ugslNigi/?=
 =?us-ascii?Q?nmZN1WEBfx2UIVkBebfnl+As9xdtLalyWHKaZdpD/sHIsXuBsOCktU4iKJ0x?=
 =?us-ascii?Q?sKg3MJREGChziCQzqu4EsBiEfbhpXfUMGvh1HgJjeGCB4Dls+H0XuhmPXfZB?=
 =?us-ascii?Q?a0U2PFx6+LLtYb9m/QHjQJ0n7WR3hhSuWZEzTBUAmI1LQ1tmH/1fe0jcVzqA?=
 =?us-ascii?Q?sJ+D6I5o63qEicQCPMi8nL2EloeSIKvpNIqdADR7Gudj9tUUdcE4iEoXK/V2?=
 =?us-ascii?Q?c2M179xO2w+Jj8zjSraHrgaIiVMQDCIHw9AokxsC7Pi3UdWsusJl3Bp3BQo8?=
 =?us-ascii?Q?mTsDUPolQ25f4jdTGVcABOrYsJcqCT97cO6OwuAkHVUYeOkXoccmukJQmMV0?=
 =?us-ascii?Q?gsmq5+6/hV2rxkdR5UeO1mEYYqJs1kEneLdz3lYNnEF5uDiPkfYOE/o02/0W?=
 =?us-ascii?Q?cWMIWRMlZQMgFCBY4qQi1fxB6KJbHOzZEeWhPOS0sYCJi1fMZym1GAbYFRTU?=
 =?us-ascii?Q?4X3lgiWUmd5Wa2xSssDI3BffdPMgUKDNcm5yF+mQ9i8cC7Y9KP9Onp+4OOD3?=
 =?us-ascii?Q?DscroGlQFhEJSaBKVarYzYT8VIs2W9L7Tj1IFGe1ga5R9YWwQZDw6ibRo/y2?=
 =?us-ascii?Q?RDEUiNm7kPyBCh2peUcwRvq0g95Hw0JE1vZ46Rv18yUEmRHWkyY7sUOYzMbZ?=
 =?us-ascii?Q?80dB+kKaWWJXBV3UJKmgJ17CxYrdeTAlvOB5s6mG5Ii0geJVqnY9F/eA4RvH?=
 =?us-ascii?Q?Gumb6ntAaDyz6zGEFbVjpSmk/7aYf8vLy/KHzbFYEfUMLHLZFXJZN3h6Q6Nk?=
 =?us-ascii?Q?M6P/bEdlHD+EORtm1GqsJ6wLmCKkzunTvi5zTkcP7h/VY5KhjQXccS/qX4eX?=
 =?us-ascii?Q?fSEHXUSPdjgA3ZT8BuR8MJGgH6hg4189jw7zLweHfalUzvBvasqvmPIN3Wtz?=
 =?us-ascii?Q?7xSrIeR3Rte7dQW1SCTwdBVhNvRWqYI0T6CoGLG7XZrI2xHNckcr6esPZs1O?=
 =?us-ascii?Q?bdew733lKkEN7hZ4pJC2N/kHQnDBu+MvmqnvWshNoxZ4PnwoJOdjQRCvQ3aH?=
 =?us-ascii?Q?yCAaSSJQ8LNa95pijoCuZVx94LDOU+46CgOcaOvA+lD4G3fu+Mze/IvweloL?=
 =?us-ascii?Q?zEDQRxh2Sy+BCMo3bo4QgeXzSbXvbFR8qx4QDhExZI3IQ71jjDcfdFW6VE3m?=
 =?us-ascii?Q?rGrfKCz2fHozxYvrvuiN9HNefrmZjqbwOTt58IP17Lh4t7QF8krhk1qrKarK?=
 =?us-ascii?Q?5velQIQXIUB+qaaEwHlF3Fl146TvUbnQE2ygfijIiFGSer6QTvuYssKoPZrm?=
 =?us-ascii?Q?ZXRGg0KTrVj/m7UUiN29+GVbLL+ROeP0sIe7cSreNRzuSWmsBcDnYP2/tDea?=
 =?us-ascii?Q?m0490ibBRSEwbF3K6g4CoqZMRTthiAX6Aq73AbS1o+ZZdqBELoVZbrWR1TYw?=
 =?us-ascii?Q?Tt/cQWAJ4AFo1iwPPpzniZuNdAhzNwUgpRNKpsjjGdwVYNLxR/roIP6c3JO+?=
 =?us-ascii?Q?b/gTxx1wCKTfuS/NT1iA7QnBmwnVrbdXPSJ5JRJQpYtJLiIiwB8gluEqcvmD?=
 =?us-ascii?Q?ndqfPaynR0mILvssXiLmwQM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abad7f5e-1ee2-45c7-494b-08dda3f2267f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 05:30:58.1373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O0oIPyyjp88f4LidJseuHlEDbHHSqUxfyEAlnz/1Sovr66AvZ4y9tqcBMkXhxebcYbk845iJHhOgz0DnkMvzTJM5n5yO6q/O3a3lcQwbD6aD0TYrbtaVxsZUfqdzYUau
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4668
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDA0NyBTYWx0ZWRfX7x8++DBAwD7v emRkTG9Bs9ZpQAO5JzVh9fqQkFeJsYe9Pwz5IfR5CQoBlpws5bHLLVxgLSYACF6khKEIT5MxmiQ CjMsZxSv389mys0VfBdS9+lxja/Jcc+uV6iN/pH17VlgplSaGmHZZZIPeEcwLVLOA4KY3svkPWx
 FS+gJW6XJ5F3j/+Z63cRWnBMoE2ywhhvnYi+Q8STeTSRjpcXfNRd8qK6pz6ptKocF4N03jekX0P NzW95wFubPoHkAFnvfukH8/EcWJSiFk8euw5Hp7lnflcRTgpCnHO5fYGwcI3v3psuvD7crZptRS GeZk3Y/b2Lx0TP7Or8ZHk7fBqwHlMSjRgmySBJKIbTRDIfeMr5qDT94TB243YcQC/t8WnaWld+i
 Mat5vkyE4eXS9e1kZAdPjNnqUPknVjGay9D+kzk2zkR8zFgM0AIGPUvblor0tPZ+ICjX83EL
X-Authority-Analysis: v=2.4 cv=PvyTbxM3 c=1 sm=1 tr=0 ts=68412b95 cx=c_pps a=qrXqrasEdc/lfzlssxSwCw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=G7adr3sDebAgiyP3PKIA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: pTX9yZu49q0Scs0uPj4boKaldxGATvZX
X-Proofpoint-ORIG-GUID: pTX9yZu49q0Scs0uPj4boKaldxGATvZX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_01,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=816 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506050047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 05:31:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217984

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

PR32829, SEGV on objdump function debug_type_samep
u.kenum is always non-NULL, see debug_make_enum_type.

Backport a patch from upstream to fix CVE-2025-5245
Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=patch;h=6c3458a8b7ee7d39f070c7b2350851cb2110c65a]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../binutils/binutils-2.42.inc                |  1 +
 .../binutils/0022-CVE-2025-5245.patch         | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0022-CVE-2025-5245.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/recipes-devtools/binutils/binutils-2.42.inc
index 16db8bc05e..c6fec579ae 100644
--- a/meta/recipes-devtools/binutils/binutils-2.42.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
@@ -51,5 +51,6 @@ SRC_URI = "\
      file://0021-CVE-2025-1153-3.patch \
      file://CVE-2025-1179-pre.patch \
      file://CVE-2025-1179.patch \
+     file://0022-CVE-2025-5245.patch \
 "
 S  = "${WORKDIR}/git"
diff --git a/meta/recipes-devtools/binutils/binutils/0022-CVE-2025-5245.patch b/meta/recipes-devtools/binutils/binutils/0022-CVE-2025-5245.patch
new file mode 100644
index 0000000000..d4b7d55966
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/0022-CVE-2025-5245.patch
@@ -0,0 +1,38 @@
+From: Alan Modra <amodra@gmail.com>
+Date: Tue, 1 Apr 2025 22:36:54 +1030
+
+PR32829, SEGV on objdump function debug_type_samep
+u.kenum is always non-NULL, see debug_make_enum_type.
+
+Upstream-Status: Backport [https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=6c3458a8b7ee7d39f070c7b2350851cb2110c65a]
+CVE: CVE-2025-5245
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/binutils/debug.c b/binutils/debug.c
+index dcc8ccde..465b18e7 100644
+--- a/binutils/debug.c
++++ b/binutils/debug.c
+@@ -2554,9 +2554,6 @@ debug_write_type (struct debug_handle *info,
+     case DEBUG_KIND_UNION_CLASS:
+       return debug_write_class_type (info, fns, fhandle, type, tag);
+     case DEBUG_KIND_ENUM:
+-      if (type->u.kenum == NULL)
+-	return (*fns->enum_type) (fhandle, tag, (const char **) NULL,
+-				  (bfd_signed_vma *) NULL);
+       return (*fns->enum_type) (fhandle, tag, type->u.kenum->names,
+ 				type->u.kenum->values);
+     case DEBUG_KIND_POINTER:
+@@ -3097,9 +3094,9 @@ debug_type_samep (struct debug_handle *info, struct debug_type_s *t1,
+       break;
+ 
+     case DEBUG_KIND_ENUM:
+-      if (t1->u.kenum == NULL)
+-	ret = t2->u.kenum == NULL;
+-      else if (t2->u.kenum == NULL)
++      if (t1->u.kenum->names == NULL)
++	ret = t2->u.kenum->names == NULL;
++      else if (t2->u.kenum->names == NULL)
+ 	ret = false;
+       else
+ 	{
-- 
2.49.0


