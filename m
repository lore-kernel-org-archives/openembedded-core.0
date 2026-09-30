Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D6BCA5FBE
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 12:49:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12625.1790772585161885648
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Sep 2026 05:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hd3umd4S;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4733047ffa=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB9AsQ2940588
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 12:49:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=YI/QElWwdZjAxUIYm4qxuDuEL3j0VT88monZZeXfbMg=; b=
	hd3umd4SIPbnGjBPcDK16GcBaZ00u55Nc+5kAU3+ZFBpuspwPapctbLZAZrItV8K
	ohEM3aMFbNuU2k9XWisqwNgMN5ttkAFhCnpR02p1uXe+YC8b7vttZnGRb/Goqdre
	F7yHFueydU8ylxwwhKwjtmQ26EIfWHtbsaJb1rabPxWHM7z4Es6AkcZpSuI+R4tZ
	oVPxi8e0v2nLWNORm1MpnIHAVZIvRszxl+6TEvs8kO41cgC9VF5aYsE/ReFDupDW
	OjwpUiScWtdV5fs1QfszwdmMUIJV/fa2W8LZkNzqZXMoVmTClqNJvYf1cj6hapT6
	nneT2B0+iv8bt5ICP4U2ew==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11021130.outbound.protection.outlook.com [40.93.194.130])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gx38weh4t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 12:49:43 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bL90gU2yIhOfVhowABanH5ffFPYoS74WHyH8VubLbu5aC9pB7AaVfYni9DtByxqqouNlVDtaBenNiDWyzw2oOuL53vGKcStfWeKSSkgBZqs3MH2pjUEtAZr4o+oH/adD3KiVOsPQqxaPSmV00o+H059bAdar+DK6U+FsyU1DBdUcYhbYIzVK4NsnDjyZziFviNb4fYEnbNv4bu3qzBsxFVPnL3wg/xY9KdmFQg4c+03hEEB36JmdeCBHWqsJIhh6WGvWrhExniQ+Q/Xrfug1agpyK83I3VLtCt2SlGLuUsdnjqh3Vd8OUSzHgKsdd9QPDe0H5yEc81WTIbm1aC4WEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YI/QElWwdZjAxUIYm4qxuDuEL3j0VT88monZZeXfbMg=;
 b=Ne8Q7d0bQmpzkQ+9ZKKajiqVEKH9h50UXfCd2/3AUyGbAW2pKS27o/D3Lfxgpt2/LEwjvbcc4vfW8Xjtg6wNvPb0v1kP4kGHuZqpa2MVZYbL/rLJx2taBsMOCYiovzxT51BcCoZ87lOdq4J/p8GjkJKp2jskYpqTGsldt+UDWCCLjGLho6jCzQ3UMV403pctsjfPmtufbKDCxRYVZVVcteWELsOUJuPHSnSrmF9vzLe/ys9axhG3aNsJlpbvsPl4uRTMCQnkhzAcSjZqI62cjCRkNwfrqYUJhwfLw3MgkYl24LFT2B5X9mlajdM0bQSfHskTqDXdTeZpib/t7JTquQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS0PR11MB9478.namprd11.prod.outlook.com (2603:10b6:8:28f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Wed, 30 Sep
 2026 12:49:41 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%3]) with mapi id 15.21.0472.015; Wed, 30 Sep 2026
 12:49:41 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH v3 3/4] rust-cross-canadian: install target-specific env scripts and fix rustlib lookup
Date: Wed, 30 Sep 2026 05:49:21 -0700
Message-ID: <20260930124922.2397906-3-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260930124922.2397906-1-Harish.Sadineni@windriver.com>
References: <20260930124922.2397906-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0246.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::11) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS0PR11MB9478:EE_
X-MS-Office365-Filtering-Correlation-Id: 25833ce0-12ae-4c69-4db0-08df1ef14b7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|23010399003|1800799024|376014|366016|38350700014|6133799003|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	XxXMEEt6yv59C0rRUbC02plWnhF5R32zjKPuA9fySOxWuRoTfYJY0Ev2Kdt7MJDsbMgOcNL4UsrB0lC6ug65rgpX631zryC+G7QNJsO9g0dvODEkEAQP8rrIVn6GcMy0bAdz8wtUff+NhStpOI3faHkJsbbyAkVweL4j0D4IBvPX+bczCl2AldTLakenf3gGtqtfdu0v95tNnBmdhnJvYtQ3W3LvDti/4AgQQFfqw0Smqj9rBQ/MSZQLnNK8FFRs8h+pTnNkcBwvN3Y85q4ZTrX6sI856GbSfRaItKXnDjYBfhySB9lzNq+xUvpoAmX37nDW0O1TmyV2uYS240elo+DpXeBl/MVnncW+2zW0/X9yWvJZETPlUFD2yp6WcrzIGd903KjhOu0QH9utaATcI09m7bshET9XZHXEsw+1s6Aax+Mv5ZJ0+dA8tp279LWvgdTSGM9ruBsJKGOxDZ7iltCjO1ZURaK0u1Bmv0eFdKI2p909B8BdPzndpIjNxlkl7lyeUNkDSv60K2qHvwma9dCniy5fgv/KEYNTPMxbJBXTL0iqoVoEtElnUVonf4p7vwvJsiR3BhIKUT2OGS/McfMH1aqXjzRiMiVvQyhYdV5sSxqXxDLTvrQd25iKM6Yy5nHhgZa4Uw/iycP2f4lySFag9ed7L61sXNr8rDIu83CdKaSYOGcDmJ0nSjfZywXsuVN4lX6Q0ShVA1MG63RIcF2wMUFF0j7eWb3EfI0mmck=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(1800799024)(376014)(366016)(38350700014)(6133799003)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Q6MCnixc8R/8QVqajsTZadCUOidax6osCTUguqMg7tIEO/Dsdp6d3PnAUXdI?=
 =?us-ascii?Q?cvycC1ScSMOsYepc1bkh77omkpndt9ELNN1c1UKFL2PPjZnrIHtpYTu2KN41?=
 =?us-ascii?Q?T9w1uIjSrQ+w65gurfTVFU6LONY3jbqTlQ0s4uLfP5M3E0w7HoMaPVazQEDx?=
 =?us-ascii?Q?gknBkNSuQXG9BUYgEmDoWv8AqLmErdD3m4GKCZ9ysEbanofGT0W3TggDivLv?=
 =?us-ascii?Q?S9r0iCGM7ez77Cm4bK8PScGOCK34f9svx3fnB5MIRQBz63zxq18dI25velBY?=
 =?us-ascii?Q?XSUtPWk93hNObBXTS57EQgBAxr/O/cjJXp/UVbzUs4iA7i1rMwloVxzjPQRk?=
 =?us-ascii?Q?Tlz/cXM6jgq26NwV/lHQ7WeAevD8F8GHdna2Mg5knyMTeWVZe63xbcBZaUIK?=
 =?us-ascii?Q?aCbHn2s0pfAoUBNLkBxD35aLREho+PAMdFUIgiLphx2F1zzFersmy/tUpyLc?=
 =?us-ascii?Q?z+fojmRxFPwEgOYBmfOXW6nIgNahpUjAMRwTchDeCm0Q1Z6MKXVvBON+q6G3?=
 =?us-ascii?Q?bbxyXZGpT+M6msgYsNRRdQGC9SL30qCbEFOv0kqoGSAe3LQxpEzLXru9xrVs?=
 =?us-ascii?Q?4OpRI6x9XZ/imbCmUbUbuzDsKwjU+luZO3vRB8/xwuai9FQF2aB3jhsiUUQA?=
 =?us-ascii?Q?8gQb2e+YI44N8nqLTHjpwiowLYc4TExR3fS1hDu8kvLOr0jcOgyzKYV+7Ckb?=
 =?us-ascii?Q?G2VB7d6kBHtvXWPOgEe5jH2lULjXOig05cKQtn3m7CQDEOXRskqSVYJcT0R6?=
 =?us-ascii?Q?0HS6R3rLnx7tseTu0tGlENp8XxFh7JvuzqL06kaYVP9OafXTUnu6n++zNnI/?=
 =?us-ascii?Q?mIQV3EOBeXnQUKtPCo/dRAhGjs3CutAUFWBPgLJTesV1cdcYN8uLuI4cJFWg?=
 =?us-ascii?Q?LBLnuDZz71096okPcEMay6ZtVcBbUFk4hW6W7HZV0nVuT1aiA3kX4fEVWZUR?=
 =?us-ascii?Q?M6/PwpXQksxv6dtcb7AqS8h+FCKV86xySuTK0GPkhx1E4yQzo0xfSOD6+/tM?=
 =?us-ascii?Q?0WwwekRJGhEXvlWaMbnElzJ6FaPmWp3xLtit5ToKQIBMCqC3yFrjeCW1siZa?=
 =?us-ascii?Q?9PjoV2k9/tXq+JSbQOVRHnmA4inCmnZIhnEnIeNgCXLSLUEOqyqkOsVRAKGX?=
 =?us-ascii?Q?w3rtnwYpf1pIHJwI5fcKzlb38r+pk3xKNIO0D1vI6F/DyOUHEBEsZBlOenvL?=
 =?us-ascii?Q?x4NlqmV226b6SqMZEU3GL6wwf1vJFLTsjvZ2eaJrC+j3/qAmnQ3r2EspmMu5?=
 =?us-ascii?Q?Er40cl7u0kVnYiGSbYmc01wT5eyjRX3Rzgf0u/5hfR0rf/ExSTLbQ4WBAr/o?=
 =?us-ascii?Q?uHBJEtT5PPkvb/+x7Y/Ia9O9VSKVvflD4JnXrUBs6kJH2hSm4VoDe6aqsIfP?=
 =?us-ascii?Q?vtrgMC4U9Al1H2N3fIOJM8GpR6XCddPUlNuVP2u15+t4vNSYCgqm9G+4msd0?=
 =?us-ascii?Q?jQyYUqMqNnCIY9eWdm8AmRJI22/AP/9rBAFd9XRusbf+oaCHK3T9Stq/Bklm?=
 =?us-ascii?Q?VazPWoCct/wYu+Pi+lCbOinOIDpVQQAQp7aab+qAhpbMS0Maks2WLXX7WoMc?=
 =?us-ascii?Q?MJgr4EFWacbhBKhmcaHxuoy4A70RcMqeMJYduSzvD3ojfYj13NUCDnGGBuk9?=
 =?us-ascii?Q?9XTyFqK086hSf15ImVfQ4PynZpnfsLnFHqKWjohaa+iBjOAPGSJe+aQPdc4j?=
 =?us-ascii?Q?ALbk+co5rgD5zD9R7FoDf1oV+GB3nhxpYe/ldXqrm8L6N0vmyF47jaNJ+3a4?=
 =?us-ascii?Q?4TWQMVHBSWmQq+dN2aroFRaMxL8oXEw=3D?=
X-Exchange-RoutingPolicyChecked: 
	TG18LdxrTvJzahm9SdQNaHsCoZe+p3JjNKnfDOgyQQqKQoMRrrdr3JA0BPzQUAOR6b6gEyElMcRhDbIHhMJ+Hr4AOxawPzjWyeVaM0f7HEZfjw/11ZDVsiSDSTYEOM4mE0LGf/EorNSan4cXbzFyOfiMDiwzVpKoy29NtCO+4UXKHA68IyLPrz/jR7IhRw98CNS5JnBVjWhMDpOfbo0D7dupa0YIJGtxH6lOiQF6icdd2h9Xvtt9oDPh9bu2mqRuio8hqBMF4NCenOMXYDJn3VXVPN6FTeFk5KdKynXf6CfsIF19HcEYeaFCsN73/JnlBE30ebK/m5FlzGIYhniIJA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25833ce0-12ae-4c69-4db0-08df1ef14b7f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 12:49:41.3414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7+YrPJsfXY0bnlYRvADmir53VcpQHBg46WRZWfAVwF5NPhiSoH2pRT4wj+kGt08OiWi8sP+rfAguGHgcn3NfGHevofTcx+YoZj4cTyMp4gk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB9478
X-Proofpoint-GUID: 2_hy0M8urM4Q0RR0mbKLs1CFVCFyLKW8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX33RYkTWsen4Y
 bjsgdWdB9epzWd1mu2NQWbMzL7NthO7C6tr39sLcwYVI/EhKD30Bk/vnG2F2jz6PEx7JhDN4xzc
 +pntTEUnNG7+snfnGCJtCgkR57mIiV+FOUofwG90Q07fVO9NmCiZW+IhuF+P+1BrDINYsM9rF0F
 67NM4DyRoaXSgqNVXf8AacaOqiGxml6AhwJOHZb9wMcAn7iP70+MfA0Hh673/8nakg5fG61rHHL
 O0Ik7uScFIaSBTdMN7gDcRX7pYZ7GL2qdZU0TMJg4ohX+FCQxfcncTZdho+XL0/etL6rxjXbf5q
 L8DRdiif6Gr+KxBt4pjUOJOep7aT1PCdBm5FQKQ/SWi4PsotyrDHZfUAhliCcatWjUX+i6WQsmK
 uV4MlM/JCAG7GojcEK74Rq1BMG8/R/7EcR2x36aB0eplnPt/+XFegVfdNOVPKv1gFM/L3zox1or
 rvdJgSwANZ2y7wrSHyA==
X-Proofpoint-ORIG-GUID: 2_hy0M8urM4Q0RR0mbKLs1CFVCFyLKW8
X-Authority-Analysis: v=2.4 cv=ZYSIpcVA c=1 sm=1 tr=0 ts=6abd0567 cx=c_pps
 a=Pb7wY1jdxbaV20HAOOqOTg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=EoEa0L0g2eIUafYROuIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MCBTYWx0ZWRfX9pN7jTj3xLjz
 1ohKQGukcNStmroZ+IPRmB3lTbbTEwIMKKO8rOPqFhc3N3X/FPGuCTDP5IOyJ+hc3F51zUPkTXg
 czB2Xh6W3ncfkQC7CGb+iE8z/PBCrN7v9bqu2J1PBN+THc6EfAnE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 12:49:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246966

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes [YOCTO #15061]

Fixes 32-bit Cargo build failures when using multilib-enabled SDKs.

Store the generated environment setup script in a target-specific
subdirectory so that sourcing the SDK environment always loads the
matching script for the selected target, avoiding accidental reuse of
the 64-bit configuration when building for a 32-bit target.

Also update CARGO_TARGET_<TRIPLE>_RUSTFLAGS to add an explicit -L
search path to the target rustlib directory inside the sysroot. This
ensures Cargo can locate the correct target-specific Rust libraries
during cross-compilation with the cross-canadian toolchain.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/rust/rust-cross-canadian.inc | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index f083bcda82..689ffa7efd 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -51,14 +51,15 @@ do_install () {
     chmod +x "$outfile"
     create_sdk_wrapper "${SYS_BINDIR}/target-rust-ccld-wrapper" "CC"
 
-    ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
-    mkdir "${ENV_SETUP_DIR}"
-    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/${RUST_TARGET_SYS}_rust.sh"
+    ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d/${TARGET_ARCH}
+    mkdir -p "${ENV_SETUP_DIR}"
+    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/rust.sh"
 
     RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
 
     cat <<- EOF > "${RUST_ENV_SETUP_SH}"
-	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT"
+	LIB_PATH="\$OECORE_TARGET_SYSROOT/usr/${baselib}/rustlib/${RUST_TARGET_SYS}/lib"
+	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT -L \$LIB_PATH"
 	export CARGO_BUILD_TARGET="${RUST_TARGET_SYS}"
 	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
 	EOF
-- 
2.51.0


