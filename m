Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCBDEFC9EDF
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 14:04:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38905.1772978657737217843
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 07:04:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EIfBJAcy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75278c0199=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 628DUo9e482562
	for <openembedded-core@lists.openembedded.org>; Sun, 8 Mar 2026 07:04:17 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=fnPR02zyWTCHrpB25+BwaUxXCj2OkCg6le9bdxvwUwI=; b=
	EIfBJAcyrRk5QsyA7yM7bb4VV36KpNynuvwomaz5nmNINEccZXQG570D8wgJ6TeM
	PQcnWSUITCa/Fm2itfT1hjfEKJ57f1IqGcU7+C69kg9da06JVRRvM9ehHOypMmH1
	8TsNPYuRswjtIPE9RTw7u+TzBt2KYz35sIgVlve73r+g5rGpE39q+YharIWU9+OE
	cV+dtpMRgXSw3y3+qiymyngF4Mcu3zfJ6/JvTj+JqQVOb/C4Zb178BHHh4WMrSn3
	+d1FPFFD77du184WCzp2rQAFsSNIyJELX7Z26WDedVxMIxwb8R5l3kfaJfKQzEhv
	0AtzoMjq/T4FVOnG2Msseg==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011045.outbound.protection.outlook.com [40.93.194.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4crg62gu91-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 07:04:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CNbH3KQJB4Ek9xvtfuUOtSMyoAK1CDOp94MJpFvK+DJU2HLgNKU/1irNW28s/6Byni+3lhETF9Yu9eTfcn8eSSjZOo78/+LgQmqHoIT6IcZCn7ExEuI+OYuc0knurmsRhXbzVwrUWsHbqLnhWbOmYuiAEQE6ugDeRqHgCvmZr3X4QZQ0bgyyohrDuyUM8tdwr7eEtZjOvEU4KPW7br4+EIBPVScabsnr8kC0Ut0TjBa6rt7zqrEQ8wu7n3Zik0QGfrNeM0t47dmMr8/u2TfNJUKPZFQxkT+jTmfFc55vjhVTG5WfVz1NHxmiTWO+tskgGkhRMJwqXnvywfkAmYK8Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnPR02zyWTCHrpB25+BwaUxXCj2OkCg6le9bdxvwUwI=;
 b=gHLO7rGBc1oKYBxqxF5P0sQGi3COx780F/d+LTB39WGaGsrIk0on10hBu2xCiz2QsYKjRYfCAk+qxDdFPr2n9TrvVgtENbAp6W/0brqn7uEjNmDk5mOQuOzE1j208lDGQab5dVdu/UmvVepBNbJCubimp859SoThgi5VoV98qqDsSwONnicul1yIC+ETPE1z6mchkg4Bszby/eNMdFGBJX9kWRKaYmqfzT4rYCZ4eVojZDKHBKxDhutyUicDi/GfIHZDZKekIXpEIgQ5xSG2LSMYV6DDpJ14f+Q0idaVr2zwvcrlXub9MXTD3Zn0V2A6Nx+mF3235PgYBnO2pbUnJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA0PR11MB4574.namprd11.prod.outlook.com (2603:10b6:806:71::11)
 by MW5PR11MB5859.namprd11.prod.outlook.com (2603:10b6:303:19e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Sun, 8 Mar
 2026 14:04:14 +0000
Received: from SA0PR11MB4574.namprd11.prod.outlook.com
 ([fe80::215f:e93f:c560:8486]) by SA0PR11MB4574.namprd11.prod.outlook.com
 ([fe80::215f:e93f:c560:8486%6]) with mapi id 15.20.9700.009; Sun, 8 Mar 2026
 14:04:14 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com
Subject: [PATCH 4/7] gcc-runtime: avoid discarded-qualifiers build failure with glibc 2.43
Date: Sun,  8 Mar 2026 07:03:11 -0700
Message-ID: <20260308140337.2503858-4-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260308140337.2503858-1-Hemanth.KumarMD@windriver.com>
References: <20260308140337.2503858-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::14) To SA0PR11MB4574.namprd11.prod.outlook.com
 (2603:10b6:806:71::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR11MB4574:EE_|MW5PR11MB5859:EE_
X-MS-Office365-Filtering-Correlation-Id: 59ad71b7-babd-4879-04ad-08de7d1b946a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	OPm/Y5YJv3hsAQiWTxJqhiKT2hO84XoFpLtSaUi44xdWjALVEiftngTflb6RMnGGxqbBmcX2PdaiWeUf3owdw0cIndxlYxM5dyGvQFU+NYIxL4q3FH7JQTW4aPq1KF7qoeqnoWdYuOfthr7HS5YanJNbt4r6DzdUaYKjk/VjeNKuykWGCGLTRlTpwSE/WCYTA+oFJI2erQsV2E7TdHL2RPXbrfhI66mmJ7rk0Qa6v6OrApyEaZF2Giu8Sslm+GQxW1DzL96bhD5EY9/gvs/rNUV7zPV5Lsw8EO+n3fjuCjZy3UCJ9ajYaP4fE9WjDpEEg/QllKIlrMxnN+jtCQlcwq8Nt6e67BddFs5XfY1h7KHZXVj5z3h1RVrz9i/Bv06wY5Rg21aE3Cn1JefHq5j0ePmWbCxk6dMFo1QBN+gMDOLcmT8XU8k4PyEKz/WXIs1qq7ey1QWpb04HXAkBxePBz9xmLojLxLLHf3gjN8Fu92YxQWNTDk5vaQ4ZEOD8NZSUQk47oVfsdcP0aRfqp8NARNhFcH99Gy7TFVptSeMh31dqpiiMIRZfHcZmx/sbUso7DRbzHWzwaqo7CcBq7thfjH2UcDY6SFCfpu2XWCIKlNelj6h2HqWbysdlS+bqHz0BHGASJk4y+yhC8L2kw8EooRrm7U/HhiVauC9e9lOv/N8vHi6UgeVTxa3dNS5V/pJRCDiah6jHCSlNrOkcA7YF1sNsnJawCB4UZ9V6k1eF9aWnupjcUy38usyoUPA69m6OuKdsxbpFhDOxFMY0/gfFA6elqlGzVqeDgYGRbv9Ni7A=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR11MB4574.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wd/yLo//nxbGBnDHcfw+nv8syeL7W9J0WNHIZMa9lFfx6hOv8ywgg64E+htQ?=
 =?us-ascii?Q?fDsUFdQoiHJcIID+do6ioMuv4G0M9EPL4HJgYojkSpD9nQqNhWPc1F+HUZuU?=
 =?us-ascii?Q?hnNo34Wo1nJDtELKN79Vp16ZYOo70QQoLb3zqMjPjc4yfrjx5F+KnqbAmaPf?=
 =?us-ascii?Q?1Ik94mMDYCrwJ/AUXZgE67LWHwAOjB/4NLxFnYuDqGpoAWpWe3B3Zs+J7ITb?=
 =?us-ascii?Q?yJWJFlIAW5JliALdOL/diVtQDgURmGMd0SIvKNTwbFSyFrfn2ZRKByU1aRwC?=
 =?us-ascii?Q?XfkA4OZEMJQdCJKoutXZeP+c+y7RFESQjJVDA53JG4EErIITOf2VdFh6rELB?=
 =?us-ascii?Q?87mKH3pTRDos1otxOn93MO+W21pk0l4gz0mrU4gmo/2hVuimZziOWBPv2k7F?=
 =?us-ascii?Q?LQCyU3eAymljL8fSC3UwxqCA4VHWJkmeWBY/Pc06VMGcu5n35caknp/L0FdZ?=
 =?us-ascii?Q?JFIt1+3l44qh0EVj5zd9XwQ0/0JH/l35oPUlib95zDqJT9VF5zJ5tkIH/28e?=
 =?us-ascii?Q?YGecc24VymWRyetZ5JKgMTV2op5quWlKg1/k7ZpflOsorrHAqHOlaFhV62xr?=
 =?us-ascii?Q?JkdlFjW4SW3vg1z16Tfnr0borUnGQW3sFd1z4w0ItId6Dy/6poSdp0nFCFSY?=
 =?us-ascii?Q?Ruf2HHylyNhzSQeHpD1mLTm1lTIkmrDxL8QQKi6F0SopZjezSjandWz1j0Un?=
 =?us-ascii?Q?uaT/xMJHJgLv+H+AbFR5+OzqKKLqmDnEajkHm2tqWWi6YbtNQQ7Z8H8mDdfm?=
 =?us-ascii?Q?kGer5Kz47zECEun4WM6r4bvwFxyssAXMhmF5DLL581vT76Vi4A/Y1lwhZ+MX?=
 =?us-ascii?Q?ERN+U9C04ScfUjFrMlQuF8s6ZOmEVf+Ak5lUBLvi1E6ebLhHK/UOz/G0OFoB?=
 =?us-ascii?Q?TNsFUh2/16ifZHrqgE4p/BbGQVfQFS3Ttct/fywbKr75KZpxX25ocweiTp+R?=
 =?us-ascii?Q?TkpgVDWUr2L5j9szEIG9pQ8Aegaj1qTbqh53or2kQ+2LRs6cmrnOW6pCXty8?=
 =?us-ascii?Q?3TB6F1yIu+DPAk0S95t4DMPlFkI4gHCxSC7Wo4/3dNKfvmWpU07W1fitvJ75?=
 =?us-ascii?Q?R515F/+jEP+I9Vjhsg7ebo/W4O9XsyVc8v18dfhD51Ysuew15GoC0Yqgpmie?=
 =?us-ascii?Q?8d20WnKVMv1AcE3fUVRN8HlOGsM7QGgD9hsMWqJ85FRgbcM/Z6usyuodxUSM?=
 =?us-ascii?Q?21eVHHhL2F9VjzkwsDWsU5t60Chu5T5yjOzrBh76UfpP4e+m+JGJUE5Eiff1?=
 =?us-ascii?Q?wLTLMY590L63xFGhOL+isRX17m86+aVzgVqENzsjRLjbP6cUI04V9/ME7vMJ?=
 =?us-ascii?Q?As6J9v0fLfX90hjdXhPCzjB24NnGbs7r7jAaCZclsSYxJeRqhWbEhSHduYb5?=
 =?us-ascii?Q?99cw+hfGi7S2xygqskXFGjiPjoaJhiam8MIwSx1KRUvY13x3dpkE7relXb2R?=
 =?us-ascii?Q?f/68/RbAzvycyVd6ThTo/bVU7eOX0nsbPpuq5Gqv854TJX+9KrxioSm/hc/9?=
 =?us-ascii?Q?FmJAdIvbaBCnf0RW3jnt0yz7EnBWSqQ70CIPft7FPYjk0nzmSg+hjTnw5r0s?=
 =?us-ascii?Q?dfza8SLmekEqGieU2W2OY1hRfd/nHO8On0jGlAOe2IHUSsgYZ3o81i7RoG4T?=
 =?us-ascii?Q?N8naKG0TIJ6HjY+f6bTia9XEJlMt3AvJgONCUzsLCZq33XUZ0n+Q3Geegks3?=
 =?us-ascii?Q?45LZ/STNAlQY5srJ6CDlfdaCcn9qZ2v5RjwiqT3nYIYd1ff7R9CKqNDwchBw?=
 =?us-ascii?Q?lMYLWWf4O94YMzGsN/ju9orgW2W7Uv8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59ad71b7-babd-4879-04ad-08de7d1b946a
X-MS-Exchange-CrossTenant-AuthSource: SA0PR11MB4574.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 14:04:14.5528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U8LpAmjEi61E7zBhZwK0gEnlvYzhlwFydca2Y8Uby0ngx9TKGwXR1u7hNcOo6V3vBXee6quDtnZZMncJl5hnlEKWt1gRUyzegOmXOmXcfuc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5859
X-Authority-Analysis: v=2.4 cv=f4FFxeyM c=1 sm=1 tr=0 ts=69ad81e1 cx=c_pps
 a=z/rjtr9/JqYX5j7IdmSYkQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=1HE7Jd8PXYmj_aZCj6AA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDEyOSBTYWx0ZWRfX/OeBB1KejmIG
 IrKWpyd+2/Q7gI/SnTE9ZuEhaXgWaCnUBXz3zbNOucea2HxGSaZE2egjhg6Xtn0AfRB34ApkIK9
 EyqdNZAHuGicPQihVK7pXXO1o++sbJzVzO+MxMt3WZ8A/l2LT2vIcfBfllzwutn+mX+Cd8I9kEG
 IOwFT1RJ893li4v4I9SQwjtCJ64VsDUuuZU3Upw49gtAbNMtAbOpnTQioKrkbuL2GNaN/6SXuYe
 RktBPy+1lqJNGKnWC0qtm+frjfvGeulBEL1wHNrqXpbiVH0ruQf4xcE09cqZQrMOY5ZPwjed3Ro
 U+OojYUHRcCPP+uqgVix4ox4tkDHueecj/ILDhvZ3Y6vPmVppbHCH2YPtmpQOqYiepPXWNp8HAx
 PbHak1bTEZtA8FrbM3ZMNrXfCgn/Jn4dZUABvnu81rZ86v5r81Bzf1Z40D2dwYoh7+9YU0CW8Gq
 TeoThtBVbDqeHzdMoxw==
X-Proofpoint-ORIG-GUID: toa3lcfL_nQoKBHjrbUQejFWNMyYp9F3
X-Proofpoint-GUID: toa3lcfL_nQoKBHjrbUQejFWNMyYp9F3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080129
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 14:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232645

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

With the glibc 2.43 upgrade, building gcc-runtime triggers a
-Wdiscarded-qualifiers warning in libgomp/affinity-fmt.c which
becomes a build failure due to -Werror.

Add -Wno-error=discarded-qualifiers to CFLAGS as a workaround until
the upstream const-correctness issue in libgomp is resolved.

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index c4e1c5b9a5..07db9d6fcc 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -7,7 +7,8 @@ SUMMARY = "Runtime libraries from GCC"
 LICENSE = "GPL-3.0-with-GCC-exception"
 
 CXXFLAGS:remove = "-fvisibility-inlines-hidden"
-
+CFLAGS += "-Wno-error=discarded-qualifiers"
+ 
 EXTRA_OECONF_PATHS = "\
     --with-gxx-include-dir=${includedir}/c++/${BINV} \
     --with-sysroot=/not/exist \
-- 
2.49.0


