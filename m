Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B71CD5BA4
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 07:26:04 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16154.1779175557255485578
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 00:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sPKYWzUH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9599376d2f=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5F40I3123077
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=snbnFRmpahOf14giXxZ42SZ5xNoIS1ps285J/Ldtj2E=; b=
	sPKYWzUHaA6cK7fme24lvEWnBZBFyssoUcdbrhqdJegEKfCTSGQsx9sjkb8aQlJo
	YwsjZYl8ee6r0+uDMRlSej6RbygA/1E3BsAbpm9TW/xxpJ+7QCUw6qk9j2aLC9gz
	a3jepiSMmjplcfh0iCsxebzstWw0V1fwyAvVXm3YGJYDqhxYMMxIe0U/uf1SpCNX
	500IFMY8pbRCbuXVQueKYL1hhWTvXfTBzSQEPnAIyvgdFMtTSm8Tw6/UW4BnK49r
	GApyX2LNMzG0LsrtORWmqeNvnm/dzeGAG/Jd5LOAqwoOihZlqAsIx7Kq8uqEwH6T
	lUC/RYAxcK+YfI567ygMbg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012007.outbound.protection.outlook.com [52.101.43.7])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e6ecf37vq-6
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:25:53 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VRAHb7BAbszsTODLxK+aM1QHf0GoO4s3uK9XBLjxXQHVI68YXuzasOIueByyiQPPH1jh8mzuJCEUrKGsM5IlTtzggvCk6YUtLGG58nOplcpabsVxICY7ATWZm4N/mI+VpR7UKlAG4ltDn44HQQFTL0Q2BXzRgwpDk9icTt2y9wsVaLmxMpow7Xn9/yINcOT6CWlOIIEi4t2Vi1h1sdwtosNz6kQ8CkY4EgWlChOdVrpyReu/6UTIvOJJ7HxlO2FCCGLIbp/9buDxutjxLL9J7yYAqgfU9qHvWH9QBs6pdI0RaXldllbmbQYExrQksYp5b9/5b3iYnTQIWp4/K4Yoww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snbnFRmpahOf14giXxZ42SZ5xNoIS1ps285J/Ldtj2E=;
 b=Cq9YngC3t8m3Co7zZvtu63BVIebm/Uf0wTnTKR1jZj1h1VOCQn7JCHBUtH59YOt3KOGt4C1mu6OvyU2cqA5lexkWDCXMQ/izAKXO7K+Aq+zaCdty1kbYhDqMxZ7Jnop3FUWvXiDeJTGx0N63WJ7TxLFZKbgqoGStICfZPLCtAt0bY+hCibrxyA7i++vfy5jjqGlCo0eaM83ZKLCpueBKtxinIaSdKx3QIM0+Kk73qHCLSNV50y4GR7lrn7qVhwbUc9UXAJtVgZCb0boDR5bpRfLBo9uhAUHF3EsNHZBxLbQDvS+f+eGYcCVWsulw1x2jRTYJKJvtZpNmaTBBfLvE0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 LVUPR11MB9590.namprd11.prod.outlook.com (2603:10b6:408:3a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 19 May
 2026 07:25:49 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9913.009; Tue, 19 May 2026
 07:25:49 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com
Subject: [PATCH v3 01/12] piglit:backport a fix for building with gcc-16
Date: Tue, 19 May 2026 00:25:23 -0700
Message-ID: <20260519072534.24588-2-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
References: <20260519072534.24588-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR02CA0076.namprd02.prod.outlook.com
 (2603:10b6:5:1f4::17) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|LVUPR11MB9590:EE_
X-MS-Office365-Filtering-Correlation-Id: e9fa687a-3d37-4631-bbc7-08deb577d94c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|13003099007|38350700014|22082099003|11063799003|18002099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info: 
	Ry4ueaOGW5UetOfrh+G3Yu3a7yfChBMr3Z2Rjqwg7q7tCEb0ey38x1DsZi4p7KuWb8HVgVyAg8b3JwHFkPH/Wp95pnEzZVvz5jSGaQJGSMsvipCQJnG/YYwSqQGxFnFEtESHLuqjFxlrByddUECnYQmWN4udzagqkus4xCiedGnbqqwf20fC1mbnbpJZoR6SCYFO2v8egAPlVFBA91ZzpUQyiYeknYIDs82emMCglzVyRuh41+7u3Ec209rF3Jk4ABRm77f3DVRcmN+/vvpGWIHIOIP0mysoWjP42MvaaCjFuSQ8tCMBIkWt8OdlygQKUvJYJOoAwCQfQH9QBtl2Slmar5nKwhIK/IaAsFNA0LEDyul7bCTFiIFWEvOb7RoqmgBtNwoG0lCWViBXqrZfktqV5UwZ5Pvz5Iai13uHPXi8FU7h8eKXxyZ8P0+ec6q/ZDpwPR5SsZ2j2ge6HAP29U4HyUvb6afFS4QiSK812z4qTdlQK1xGkUWrwNBo2YvtcMXVwF7C049oCeFHfjRXOFm/+KR7dU+QxpZTuA7OFVzpKANFoiZt0fc6EN5nvBTvPvtkY4+K3c6fKqQ/v2q5BiiQmliUEkwnN97FQvyNfl3w+d2xJ3ZpOlefqIBd5MxB2ZyPz4+7YTdu6kAPGLE35U6VuUQJgqPsXVItV29i6MAhSeHno+iy72VurSibwmfH1NiEBZhsmpfTJNR9iiQEkQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(13003099007)(38350700014)(22082099003)(11063799003)(18002099003)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sGxWQdaHmLaWHogI8viFTFs7RnVBl5yZgqqtMS+DgSVA/2O4tiNavgyk9Rh4?=
 =?us-ascii?Q?saPPA4Sqm4GcLXX7wR24pe6eeUhVeGP5L5hlwyT3VsQgj19y1MQONgtlamrG?=
 =?us-ascii?Q?x1bT9T3wdsor+NQrkLtTxhNHARjdtM1b0rzUt+PpEA8RbTjL+HeIYSpgB9NX?=
 =?us-ascii?Q?JVoarXO4al+K8oPnS1xcTrggwaewlqbNJ565lJRrsCwXDrgpG+fGmcNHsO4U?=
 =?us-ascii?Q?snSxYvP1E5FUbsT0pLVcsGFETQRDtLc4yZpRawFkYiytN3HhXaiP9bdvZvC1?=
 =?us-ascii?Q?TMSbXTO55x1B02JNyxzXfGxEyDjqjayFC2V4/gHXJKpZyytMxaqsFGXFv416?=
 =?us-ascii?Q?1zWuiuOayKdUOiCRDLOIM8rLPas1Uzcr3bMrYseHxo7ZuJvxPpLKEJJsYxx6?=
 =?us-ascii?Q?Dq05KUMuI1E1eUjZ3NpMCaooHzGNtnGvf/9UvpjHRO7KvF/zNf02By0KOXyK?=
 =?us-ascii?Q?07+A2+DJidY/mLthD/+gx+toRqCzzAgaMhVFX4Ggmg7yAmgBYxbvLFm420lx?=
 =?us-ascii?Q?drBRA0y4hqjMlp/JseGJUlWYlUy0kgVHiJHGY/EcIedbyXwn3D29ghYc8dcU?=
 =?us-ascii?Q?dLsa+WoeaitEVVPvzyXZl3+EgxJC25zY/4GG1cXwh676FjbOGhImGANeCMCF?=
 =?us-ascii?Q?pAD5cCDFca8oo5HRcK9FKLb4BOAQjtVUJGjHV5hPA9bifF/BCFUn3zzw2Bwx?=
 =?us-ascii?Q?VHJ3YsskjlALLFS+Tk8V0ns483WZ95m19/P5Sr33Ndq3xQB6iERtxyeMV1mH?=
 =?us-ascii?Q?yF2KxduwnEIrZOfRPXARpIgFzL1pEQISNqJe2WR6bUqr+IDpnB1OOZXeXaBE?=
 =?us-ascii?Q?uoVdDZGtv7gSviLOn7FzFJ4eoE1xFf4Eao8f6vv3PAt6MsBIk/B5ZCorRcgS?=
 =?us-ascii?Q?EMos9W+WsScaml4d2Z/eLDqo55dCTHx9FmbS3Q/FrLIViXBI1UpuxqWZXE98?=
 =?us-ascii?Q?DM8woxMDQxg3LfAhZWbPKYm34Wl6/2xgy0NASFFiKCLuwOs6LaUZVdiaLi/V?=
 =?us-ascii?Q?TrGpZkd+VppE8cf8u90LdySB43JaM5xbkJeJWRnYmo/YUNwgJWab1sYfahFj?=
 =?us-ascii?Q?VVKC/B0xZCEwCR+M7kFU7FplWYvIATSVoiJte+HAKt6HJovHNAqwUd/0qLwL?=
 =?us-ascii?Q?PRxQvZNjvULcmXOfPzlYW1dxshCl5Xx0n6ykOcrj7/CdBE6DtMlt/MXjo69W?=
 =?us-ascii?Q?mYOyqJr6bR8zRZab5yzWbjW6rXsuUFCJwlwSH8Rl0CM23Ag818F7Lm7vtaqQ?=
 =?us-ascii?Q?sOjcrur/CS1gMeBh/dI6AWMctuLT3+f001ru7QqP5HtWXXNQtB7J/whK+Td+?=
 =?us-ascii?Q?tBkewXtF2P42eqDykK+VmIBq/E6MElEiTtjEknRd6HN1ER0l/V6+U9IvWEZi?=
 =?us-ascii?Q?e1/+BSBNJMuQa8du0lPWiuUt7srvNeepeKwscj3aDwj6Huae4LRVqRHhCDLM?=
 =?us-ascii?Q?LmbDK96EHzdJOs7hMEZ2ArSfhV34BIcuqlatbfGtBZBMK73cJJre+aqeOfgE?=
 =?us-ascii?Q?Hg5mHq/01L4e86bHoJdbcN46lBIsXPhFpsUliP+P9YRayQ5YcucKfp+FqrHd?=
 =?us-ascii?Q?nO2uS58pfiUHnvEGimgZedbpe0MI7JEThq+KXncs+LF/hBY5W5d4F1pFCsvZ?=
 =?us-ascii?Q?Hjexf+4k4Uk+jaNGJPHqQ1gNGNng3PfEULQ8ZuhfM1OzC18nKtnheMNAMI9M?=
 =?us-ascii?Q?Q02762ARzRluRdKMehYI+fEipfKgxMW1ZZQ3W0entYdRdrpNImEyuk+Q3y4S?=
 =?us-ascii?Q?FdGFckYkWbDG/KEusWHYuEWLBZtX5Ls=3D?=
X-Exchange-RoutingPolicyChecked: 
	QrBogIhsfKVSdFrSY1/8ScaW5HZwgd0ftepJlN7eqB5NYflry+SMcXFoTQRHLeHrWpuB96cz70ouqHug711ioTVDMdtlq+cbQzf1UiVgWwTF6jt+J6VQcsd509ry6Ze5/YbDKlP1fnaBBhjqnFbqkHteR5+A75bW0nc8ckm7iv7Ouq8DzFsEfQmV+ESquCzYz755p4Yr4seFj61XAv+vauNN2pCTyvxzNMphTPSus+rl6/0PYOY8a9s/9Ubm1dHSbE5hjbGBz2CIOyTpcO8nK7/kBd4mqULieneYJ6+GroyYEXj4nHYgNPOAwj1qAg5+JhYzRqOZGAaJxe1hKA003w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9fa687a-3d37-4631-bbc7-08deb577d94c
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 07:25:48.5967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jARgKuMSavf80aOpD95CFo7FdthRf90NaMsA+6x6sYz8mFYFuuMmcy9l3XADDGm5QrTtO9Rov8/7WNglS+qd2Q1TMLtOPjaJVdjfhOCy1Qs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR11MB9590
X-Proofpoint-ORIG-GUID: NtJv3sguu02pFI4mnaJtziJ3eeVt3-Zg
X-Proofpoint-GUID: NtJv3sguu02pFI4mnaJtziJ3eeVt3-Zg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA3MiBTYWx0ZWRfX5JMnYJpXuq0y
 apPNssV6LIFDyI5LEHZVQY5X5B/XdzwWVRfIBCilNRruCQZi7ZHRQ2RX0kDB1Vr189+5WGUheuz
 Ceh2EZ+g8rm73YGg4KS3Ho1IL4HfPGO8ka3YoiwXFgKLX5hrPkYl1GD7+I7uCITWbx70LFGLoxA
 vp0mO+CBG3SetsDmtWzRNIuPvVRLSHPqcC33YiP4092HIBFlg0jIiQN8WpUlddX8YI92DjFbeCv
 Qiij5tKz2q+IDITRTb4JGX5hQNr8Skhl5NMU8sXCOx7KjmAXAFCpB5l4aybnHd1up2p0zgAiFv3
 HHOoF6JusJwpXMCj7UPEg1UDKRmfAXg6yaVtN6Oxeh8jAnyYkwRrlXpuacdoYBpNieaiNvFCuRz
 VHLulV7XLoREngCWW+QuTpjIoSpvMEu1QmBbA0jbe3isN7pX2f3MFXlOWi85l9q3kMcO9Hhq+w3
 JNPsn3q4ctm7x2IsLyQ==
X-Authority-Analysis: v=2.4 cv=dK2WXuZb c=1 sm=1 tr=0 ts=6a0c1082 cx=c_pps
 a=Qv0FdJiMAyQkWbHkl99ofg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=e5mUnYsNAAAA:8
 a=t7CeM3EgAAAA:8 a=0SOlGnYWBby2Ja47d9QA:9 a=Vxmtnl_E_bksehYqCbjh:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237281

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

Avoid conflict with C++20 std::lerp from <cmath>, which
causes redefinition and ambiguous call errors with newer
toolchains.

Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/piglit/-/commit/ec0fc2fef0755b1595c3799ab25129174a4b2007]

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 ...h-rename-local-lerp-to-linear_interp.patch | 46 +++++++++++++++++++
 meta/recipes-graphics/piglit/piglit_git.bb    |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-graphics/piglit/piglit/0001-fbo-blit-stretch-rename-local-lerp-to-linear_interp.patch

diff --git a/meta/recipes-graphics/piglit/piglit/0001-fbo-blit-stretch-rename-local-lerp-to-linear_interp.patch b/meta/recipes-graphics/piglit/piglit/0001-fbo-blit-stretch-rename-local-lerp-to-linear_interp.patch
new file mode 100644
index 0000000000..05f1dd687a
--- /dev/null
+++ b/meta/recipes-graphics/piglit/piglit/0001-fbo-blit-stretch-rename-local-lerp-to-linear_interp.patch
@@ -0,0 +1,46 @@
+From ec0fc2fef0755b1595c3799ab25129174a4b2007 Mon Sep 17 00:00:00 2001
+From: Vinson Lee <vlee@freedesktop.org>
+Date: Sat, 7 Feb 2026 18:39:39 -0800
+Subject: [PATCH] fbo-blit-stretch: rename local lerp to linear_interp
+
+Avoid conflict with C++20 std::lerp from <cmath>, which
+causes redefinition and ambiguous call errors with newer
+toolchains.
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/piglit/-/commit/ec0fc2fef0755b1595c3799ab25129174a4b2007]
+
+Signed-off-by: Vinson Lee <vlee@freedesktop.org>
+Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
+---
+ tests/fbo/fbo-blit-stretch.cpp | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/tests/fbo/fbo-blit-stretch.cpp b/tests/fbo/fbo-blit-stretch.cpp
+index a83288c0f..b0d362ecd 100644
+--- a/tests/fbo/fbo-blit-stretch.cpp
++++ b/tests/fbo/fbo-blit-stretch.cpp
+@@ -173,7 +173,7 @@ clamp(GLint &x, GLint xmin, GLint xmax)
+ }
+ 
+ static float
+-lerp(float x0, float x1, float w)
++linear_interp(float x0, float x1, float w)
+ {
+ 	return x0 + (x1 - x0) * w;
+ }
+@@ -181,9 +181,9 @@ lerp(float x0, float x1, float w)
+ static float
+ lerp2d(float xy00, float xy01, float xy10, float xy11, float wx, float wy)
+ {
+-	float y0 = lerp(xy00, xy01, wx);
+-	float y1 = lerp(xy10, xy11, wx);
+-	return lerp(y0, y1, wy);
++	float y0 = linear_interp(xy00, xy01, wx);
++	float y1 = linear_interp(xy10, xy11, wx);
++	return linear_interp(y0, y1, wy);
+ }
+ 
+ static float clearColor[4] = {
+-- 
+2.49.0
+
diff --git a/meta/recipes-graphics/piglit/piglit_git.bb b/meta/recipes-graphics/piglit/piglit_git.bb
index 7659635062..0dd9c58714 100644
--- a/meta/recipes-graphics/piglit/piglit_git.bb
+++ b/meta/recipes-graphics/piglit/piglit_git.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://gitlab.freedesktop.org/mesa/piglit.git;protocol=https;branch=ma
            file://0001-tests-egl-spec-make-egl_ext_surface_compression-cond.patch \
            file://0001-tests-no_error.py-modify-_command-and-not-command.patch \
            file://0001-generated_tests-use-shape-in-place-of-newshape-on-nu.patch \
+           file://0001-fbo-blit-stretch-rename-local-lerp-to-linear_interp.patch \
            "
 UPSTREAM_CHECK_COMMITS = "1"
 
-- 
2.49.0


