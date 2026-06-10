Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 154CACD8CB9
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 11:26:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18064.1781090791197423071
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 04:26:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GfAAPWFv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0621c479bc=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A9U44T543838
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 04:26:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=jGUSWAqPG
	BsFxLR0/FznIbf9x2KBWhF28I0kbYC7FGs=; b=GfAAPWFv0qrQC2qG8cYxExjvl
	mRRryX45xsxmn2ZWrOLVVoVoKhpgxiBs5oRZNhwELARe+0CkyzT5SV6dMK3iD2Gd
	Fo0I9JDhxKsEsVqLJyf26J1JSzAHf2r/csAkO8+/AM32geuQ07+lvH639wg51q3k
	L1F5s74pnCfWrTpED9/6g8s5XObqV2He4KPdhAKhDWQB6GzjJCiOXzu2ugdLKrEZ
	I3Mqy3kAHH2J6MTWq3a9PCGZtjWksq7aNWN4/DOZP0tY8Vo3CRAdbV5pgXptolpU
	Mm8e8XRtGiVhR57+gGiIVTXL+mjY0AvzWSKP5AONuBey7c303XrbrOSpTZxgA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011058.outbound.protection.outlook.com [40.107.208.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4epwrw8gtp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 04:26:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uwDKoGWWUwygVRc5j1rAUaZxQs/4K5r4nTgLsObWC92IvA2U7u1dpoj3UyUFs1jSATpVbtewfShSTnvhDYR+YoglrmTfcpSFYBgE4bksW9x2sZPhfPRGDpiggK1eWcDkT6qdpk8XuHijeCEHcYW6GUJXWo9SWugD6kz0QB1UJkXtGGH/D2hy4047zQAwQAC6t9AsQ8ZXniTGN5oea6pIidBfaHdOPRF0f7cMTXXi7Lp+AxAdVtdoMsUejsCtcdxp7jF5y9hyyXnV36Z/DZA/yLX57SyJJy0H7BLlkKTWFC7Q9WR3C5OX4FNYM7tNderQHZDwtXq/ej3cofjmNVFFxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jGUSWAqPGBsFxLR0/FznIbf9x2KBWhF28I0kbYC7FGs=;
 b=agfaypHpZRXzyrJCMU+DO1k+kDfxgT1DP3PraJt6sm4hOS5RgjRN0jzLW5fPE8QIpYWnZXhw/c4yuSvMgORUhq+d4azclMwsiYB9P5G7DeIlj+ionYUKjhADHBysbK4lsF1EnT5SsMemCA96zlzyV72gHzqX40PK2lSPkt/3nMepsoxN7T9BN5/e2Hh80kHdsXbhRJLvcOZuaUhsSXSaRSO3zldkuVvprLcRAfmXEcDYUwefXOn3YOBcKRprYexksCH946SNfAfvosISIkdElqoMuf04EjxZ6hcyuYE62N/LRmbbjuTTgK2Xwz52OTciKqLq7kyBNkm3o4dRzXQL6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by IA1PR11MB6395.namprd11.prod.outlook.com (2603:10b6:208:3ac::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 11:26:26 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%6]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 11:26:26 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com,
        Randy.Macleod@windriver.com, richard.purdie@linuxfoundation.org
Subject: [PATCH v2] llvm/mesa/rust: simplify llvm-config handling
Date: Wed, 10 Jun 2026 04:26:11 -0700
Message-ID: <20260610112611.649074-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0083.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::28) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|IA1PR11MB6395:EE_
X-MS-Office365-Filtering-Correlation-Id: da3d30f6-29a3-4dc4-9200-08dec6e31beb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|52116014|376014|366016|56012099006|11063799006|6133799003|18002099003|3023799007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	kBkCGmDKY6Tcd2NXtEqqkoyveKdsVMJ/pVT7ioIcMAbq492LL3vdjxRWO/8sFlbIw7RkToyxRZZHDDhFNfMPhCV40myoSLKfjz6ISx2oVK8CKin9V/FqNe2l0Io2O7ZVhLSC81r/oHFOzn0s7B+8eaM70qbIaTVFkC5qLXkZUcybYTdUn0y1oVZWYT8OHIZ0kEjLhnxqeGyw3SCShk8TzTV0M3q3AzS3hbwQhEl3BCNNFxHlB6pFsC2zQ4fBaAL81BlOQEIelXal9dMaaCF0T+VpUWZQdEDhDtxyVWRSeZJeoUgde/6HKEQ5Y+hg9tnMx5AfulRcZBXOIMohcT2LSt0Q7tAWdxafMpnGR0/pOcfaJoZLWYodKpIIeB4mPBm+QwEcHvF2yQwnPrZ8RQYFDm4KUg4x5pOdY0tFN9vWKE8b0EQ1qvyISSSbxj+PjTRXBfKsNsIqTlN1PeQ6a5b5V6qbWZ/JupyMvorYGWF2xbErZosrUNjFFelGT+q2nWx9ogtlhMvqpDh6YuwJsTjeQMQIzLzSLRbU6hleLQzbQkkePwqK6HOfYC2CII3Ciea0DZEZkuRdXJ9XBKhS+8b8WdnjIHEdZgiEIZwE5rRmXnI6Jf4mvsK3MoIQV839Sv0XVdxbeV5+kfCMdr3jIFAjQH16csMR0dS/yEaza0iPf62HX35EWG4z/ruCAOgkNdpxeq+ObOYeDh5WMfddLmD3CuPb9vzcKWJOAv+7dPlxGIP7mu2i65RDa2ewDCr6PW6P
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(52116014)(376014)(366016)(56012099006)(11063799006)(6133799003)(18002099003)(3023799007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UvxgSa1kLfCTb1qGVrivAlNe69FX3RJxFU84PZWEiLJyEZF43YE7EAjru+jg?=
 =?us-ascii?Q?IqHLxISKh+DQ9/m/U0jabIKxfiQHcXlx6fZ4gEENxXZhC56AXRhRVU/rTjGX?=
 =?us-ascii?Q?73DbHpYhLmZrojGMfFPKmLt+aj5JLMCvzk7dwMRlK6Utr2KBNejx9sXhATsN?=
 =?us-ascii?Q?Qc/VOm8V+RnscEYtoMLY8c+X+IjTVO+89AZH/4W2TeJvSJVyDxR4h7XHYqZ5?=
 =?us-ascii?Q?SJyeUS9C2kq60hWNBEhMUgcTM8N+FBUi+cRmsoNY0/LgLJd/dvkWmgiGNi9b?=
 =?us-ascii?Q?s118MwZcfMhut1aUFgpqGQ595sbOV6FfVE6bv+5ysFDhYRyrngG1Fxt2lD9o?=
 =?us-ascii?Q?YCrgx1yEeZKwL8veLOghIpMfm4aNvCmnOBtMBYz5mSkTRNIFE/6lMCgcMzT9?=
 =?us-ascii?Q?kG6zfvMw/+A1MdSeGcB8mF4qLFNokiUomxxQroyUPASaw3iFLcWI+vSd9z+P?=
 =?us-ascii?Q?1gK9snrRMDXZLkGTD+3GuCxYH0wSpOXRbMJj206aQSnMYnuripgTXKZZSaQ2?=
 =?us-ascii?Q?n6edMaGN60qJ3KkbiT03OIHIKC4XJOFs1dwNBnqyLRbr+VlaAyt2A+AeEyW0?=
 =?us-ascii?Q?A8J5tmJ3Qp0A5LxrJbzNlcbB/i0zZahXbGzflrRqYXtEgJ8awhUcejkjdJkR?=
 =?us-ascii?Q?BBIeuEClY1KCQ0WVDT8WGyy30d82uoa697d0XnqBMFP5sBeYSpomH0Rn5PWd?=
 =?us-ascii?Q?vZnPazHA8Z1HkO9S2ihQ5dM25gG99GH5d1SViK3bXJs8JE0UgRFA1w8BN9T3?=
 =?us-ascii?Q?p4BoO0hsoEWBVUcDx8wT6bVwcb+I32/szpbXKLzfYbWwVlRnS3TfuvxGKfI4?=
 =?us-ascii?Q?LfTgrp3h1AuHQHbgZp0hog0q/cyyaGKkFYGHdbgpuXMy3zXMP6FRyNNrUQiq?=
 =?us-ascii?Q?zIU2187TbD2FY/n+GuALQuEAwVMhmC7OUmV29xY1lQgWV2/b6ykVxK6JCX7d?=
 =?us-ascii?Q?b3RHNS17kuYAx4jJ1v/FHsjLN/m8tVnQlVIckt9KBV5siGazCab4Y/mWbsI8?=
 =?us-ascii?Q?kjrJc1vxEHU445gkJE7lvHpzreZkuqdxXDuCdW1WeuL3YOrREM4gl71mWm3t?=
 =?us-ascii?Q?IGgwoKnFHyMMOsmYDi//GMr9m0DSfFRZb46glJmhCf8sE4AUSG6TmqYJ8sJO?=
 =?us-ascii?Q?Q5RysC48mS1BFAnVVZdU4kVdrslXQQT8krOxwzH1rGiTg467jVZgWURPGbdJ?=
 =?us-ascii?Q?QGCCIQpJR/+1jogW6g9RXui+5YLTNd1EmYAFR/w8J8k1PmdQxvF8fmqnR+51?=
 =?us-ascii?Q?WtDa1qDPWoL2hYI2vn+zpg0v6j6eAhIJSJc1ch6pa+i0WKRCkPR9/k5W+XEp?=
 =?us-ascii?Q?KBUc+NXibrov3HDWTlq01x2XLGzoZKkyjpsLJHdXw01yudsJyXkic9zNktTQ?=
 =?us-ascii?Q?kWomLlu4RVacTEwCGqd876Nda5Ip06zf74P/Qv2BLNwY26dFYvgsiG7238C0?=
 =?us-ascii?Q?g//hWUJjQz2jHwaJ0yfqOIA4Oh9xcUuf8krViHu3aHLHd8UHSppenVvRwdhd?=
 =?us-ascii?Q?Z70oh0lo6r8cV2yioYs/Q7uSLXjn+of7tAP/btBGP2WXEA7Ab4T3JfC/s9Pv?=
 =?us-ascii?Q?tF7SoJd7f7YaJreiTTFDmFLKOJ4j4SoBsROsN8trR5zafwbPsZp18wzOjGOz?=
 =?us-ascii?Q?E3iUWjMZ/6ZYv+KcIlyfftpuim8uXJAJTYysymic4gVye+poZiXHXED7V7nZ?=
 =?us-ascii?Q?ka62Qsjs8tocnY02oTFno2SKR/3BNyxWO81y9Rn0ApwGHKjWbHeYNH5fUTkP?=
 =?us-ascii?Q?LeInHy6VyfPe0IqnPzLlbZY5TcF4Ko8zD1IFOCfMLLF6ejBq895X?=
X-Exchange-RoutingPolicyChecked: 
	Yj56Qv+RZgMuGcUbrWYoXNR9LFpSQ5J66zWDx/wg6Z4edVRDzoidTtC+d154RYNGn0Cyu3RNpvjQFlUIfy85V4+tRRDR2/RRqMZgBcG8q8UlCEfGxxIp5dz0ZKwQXjADNtSkBl4iOmfbyrns1bjVN8/JdaUm7ZDa2TAMpepDznYt7aI794oiROeXMXync0fkSCiTYOYBK/QepAXZDRqge3TuRBySCvmq1d5YtV5eMPSlmrmzYBOUCDKvYSubgyATcG3tuPEk1cMG4XjcuduopBbaHu02JuLBMUuGcIYJyKFWbhHOoapGF1IMyOpVvRKajFa2JTPQopbivV1lCxhN0A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da3d30f6-29a3-4dc4-9200-08dec6e31beb
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 11:26:26.3139
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bxAvqn0w1D9Jh8r4SKkZdpzbvSWURnImPo6e9JbaxFezgr7yhKD7Hc5VJrG6aEm8HCAAMpo/0ckP8lT02i6W0/RE+Dzy3FhgafO6dN/e8V3Pjuxja93H02CPAlHqsr6h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6395
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEwOSBTYWx0ZWRfXy1ARgbtvMTMV
 FQpE4fF6uLvt6/Qbz6G0hkDSDseFVtgGIoWxGy9yT2mRn+AVSS7nAbM/qKWo/blWDKMvTX7yFlz
 yn+PporZNr/Ebbx+/K9apcDlCm1ofnRM/di8z+tMJKJMSE6SUjdmMer0ArVLTLcrvrve0b8/Zdl
 C0dFE+CiYpeelbQiq/BQVmebf0BYCAFwMAPGPJiqAy1XG6GW4PDPnsDBiD4hJOqV4hgjK3JpORW
 Dwh2rEZmTfFgCLGJV6On6mt1cPUZEd+pk6azZmYO9XSdWk9gbZIKdwfwXY9lYosEDItVIHSSU18
 YO57ioVjhvOz0vuuEdp/bAyNqmcSQeDYTuEioEP1PwzdZUfS9kpicl+rthD6m9YAbO6oxLi+w4Y
 FI8ozvP9qR8orMLATO18E7Bs29m++TDFELGgS4kr6UiBc/sQfqth4sBCVCNRsmf9/vZ7JMLBXVn
 3zt0FU2/K7i0ZNznFPw==
X-Authority-Analysis: v=2.4 cv=DcQnbPtW c=1 sm=1 tr=0 ts=6a2949e6 cx=c_pps
 a=EoP4yJziA5n+MzrLuL7W4g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=pGLkceISAAAA:8 a=dT9Y9HKPEq8aplpvp-8A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 3GDNC7xsJFIKBNdcM4ggeMGtBN8d0yjk
X-Proofpoint-ORIG-GUID: A2VOmifFPmENp2qH-grvbpkTfryteVqv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 11:26:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238352

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Replace PATH-based llvm-config discovery with explicit sysroot-native
resolution and simplify the target llvm-config wrapper to act as a pure
pass-through while preserving Yocto alternate path handling.

The previous implementation relied on:

* `which -a llvm-config | sed -n 2p`
   which is unreliable in cross-build environments because it only
   searches executables present in $PATH. Native sysroot tools
   (e.g. recipe-sysroot-native llvm-config) are not guaranteed to be
   exposed via PATH, so they may not be discovered at all.

* `echo $base_libdir | sed -n '/lib64/p'`
   which depends on a BitBake variable that may be empty or unset
   in certain build contexts, leading to incorrect libdir selection.

Update the wrapper to:

* Use an @LLVM_CONFIG_PATH@ placeholder that is replaced during the
  build with the appropriate native llvm-config path.
* Detect libdir using filesystem inspection rather than variable
  parsing.
* Preserve `YOCTO_ALTERNATE_EXE_PATH` and
  `YOCTO_ALTERNATE_LIBDIR` handling.
* Delegate all arguments directly to the native llvm-config.

Update rust and mesa recipes to replace the placeholder with the native
llvm-config path during target and nativesdk builds.

Also remove the native llvm-config copy logic and lib/lib64 symlink
workarounds, relying instead on explicit native tool resolution.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 ...unwind.pc.in-and-llvm-config-scripts.patch | 52 +++----------------
 meta/recipes-devtools/rust/rust_1.96.0.bb     | 51 +++++-------------
 meta/recipes-graphics/mesa/mesa.inc           | 16 ++++++
 3 files changed, 38 insertions(+), 81 deletions(-)

diff --git a/meta/recipes-devtools/clang/clang/0026-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch b/meta/recipes-devtools/clang/clang/0026-llvm-Add-libunwind.pc.in-and-llvm-config-scripts.patch
index eeb802732b..72ffdc6c1f 100644
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
++# The llvm-config wrapper will act as a pure pass-through to the native llvm-config
++# while preserving Yocto-specific environment variables used for alternate executable
++# and library path resolution.
 +#
 +SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
-+NEXT_LLVM_CONFIG="$(which -a llvm-config | sed -n 2p)"
++NEXT_LLVM_CONFIG="@LLVM_CONFIG_PATH@"
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
index 3eb2a36406..f4158522b8 100644
--- a/meta/recipes-devtools/rust/rust_1.96.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.96.0.bb
@@ -31,7 +31,7 @@ PV .= "${@bb.utils.contains('RUST_CHANNEL', 'stable', '', '-${RUST_CHANNEL}', d)
 
 export FORCE_CRATE_HASH = "${BB_TASKHASH}"
 
-RUST_ALTERNATE_EXE_PATH ?= "${STAGING_BINDIR}/llvm-config"
+RUST_ALTERNATE_EXE_PATH = "${STAGING_BINDIR_CROSS}/llvm-config"
 RUST_ALTERNATE_EXE_PATH_NATIVE = "${STAGING_BINDIR_NATIVE}/llvm-config"
 
 # We don't want to use bitbakes vendoring because the rust sources do their
@@ -192,37 +192,22 @@ python do_configure() {
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
+replace_llvm_config_path() {
+    if [ -f "${STAGING_BINDIR_CROSS}/llvm-config" ]; then
+        sed -i \
+            's#@LLVM_CONFIG_PATH@#${RUST_ALTERNATE_EXE_PATH_NATIVE}#g' \
+            ${RUST_ALTERNATE_EXE_PATH}
     fi
 }
 
+do_compile:append:class-target() {
+    replace_llvm_config_path
+}
+
+do_compile:append:class-nativesdk() {
+    replace_llvm_config_path
+}
+
 rust_runx () {
     echo "COMPILE ${PN}" "$@"
 
@@ -236,14 +221,6 @@ rust_runx () {
 
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
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 15dad6eedd..f40fed5ebc 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -51,6 +51,22 @@ ANY_OF_DISTRO_FEATURES = "opencl opengl vulkan"
 
 PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)}"
 
+replace_llvm_config_path() {
+    if [ -f "${STAGING_BINDIR_CROSS}/llvm-config" ]; then
+        sed -i \
+            's#@LLVM_CONFIG_PATH@#${STAGING_BINDIR_NATIVE}/llvm-config#g' \
+            ${STAGING_BINDIR_CROSS}/llvm-config
+    fi
+}
+
+do_configure:prepend:class-target() {
+    replace_llvm_config_path
+}
+
+do_configure:prepend:class-nativesdk() {
+    replace_llvm_config_path
+}
+
 # set the MESA_BUILD_TYPE to either 'release' (default) or 'debug'
 # by default the upstream mesa sources build a debug release
 # here we assume the user will want a release build by default
-- 
2.51.0


