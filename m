Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2ECFCD343F
	for <webhook@archiver.kernel.org>; Sat,  9 May 2026 05:30:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6873.1778304655258213393
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 22:30:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=UotEx3Dr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=95895a8adf=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6494juhb357410
	for <openembedded-core@lists.openembedded.org>; Fri, 8 May 2026 22:30:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=5GwR+BrVG4FWyoDYQGKpIU4sQJf4nwG4Ayx824mjEmY=; b=
	UotEx3DrpoKaEvXdAop+yGq7rCY4HOdorCfR/1ajRHSiDXrGEHLtobBox48ctgr4
	uSPNkTph4rI68NxkeAwoY1E7C2tJVPQ8OrE0iDV2jo9ZO7JRFbE+VxF5O9AXUXSM
	QfR8vkuuxZTRgaKt2NHpsK60Zp6Int1TraVVS+343Xv5OyNSXNlfimJE28hD1b1+
	X82YJlRODfNXWP40oD8jV+u+e0jrrcy+gwEOhbpQcRoD6MeOlNeCbA+CXhzDxnmA
	EZbmFRSaHZbBA/ShJT4wtDdtQzp8yFDoADWZsH7paFZdoPoXOA38T8m2XsnadXxZ
	LHqmvaYYOyYc4ZLeHa8gDw==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011021.outbound.protection.outlook.com [52.101.52.21])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e1hkmgted-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 08 May 2026 22:30:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K7a4EplOs0svsLWcCE+VD5NRhWm9P6E+x4tEayCho31q2Eqhyni/SF4U+aGfMCuWU89zTUtG1Dr1ngVAoJ01sP9pOdg0pYnZ8+z6Vk1gGJf9pOq1lKlz3kg6Assjfsi83ove/yCias+H+qgGHvnNZGVKspPxXIvzFgxCJqTeBAOOgoG9vO5IfMRsamGgkGhRvLXfL/w/3+HIp2Con4rnTHP9LfzvX3tV+uBflVFoXOVVp7EIBmXfuhulklazMGfnycrpbWQk6Cq1A9MtO0cfHju+AuQZ7ioOjo5GCqSA6I95N9I+p99dQQ3VjUZlWcsxubxkrvFB4OjXv6WW8jJ+ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5GwR+BrVG4FWyoDYQGKpIU4sQJf4nwG4Ayx824mjEmY=;
 b=QSSKeayxe3yC03xZTNMOyZj2H5VhiGQCY11+CMBVk8ICpICx+fSFpk7Vt0V24DN3XQweGwrelLKYs6Ym+/n7zPDqm3qAGNqRz8xr/lzmBlmuFs2AFaUUPA94H9H5bJMe9zDZCN+oWZNbvHnZm+E4nmUysNdUCMSfDRH82qm/NiY6Re4wiLka7PVRK1eHol2534UEgqDYb8Z+GgQyCJy6rLhBczUfwuLLD2bVHHFWfk51oVaKnxLFNGfQpu/h37DibB2nGan+CXYfZlgOVUKNxsOV/wNsPul1Ek2FVx4I3SMRJK+h2Y/YqPkLUX3A+EthYOmJclpzSsYCNYsSVvDXLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CH3PR11MB8657.namprd11.prod.outlook.com (2603:10b6:610:1ca::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Sat, 9 May
 2026 05:30:52 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%3]) with mapi id 15.20.9891.019; Sat, 9 May 2026
 05:30:52 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, randy.macleod@windriver.com
Subject: [OE-core][PATCH V3 2/6] upstream-stable-release-point.bbclass: add bbclass for stable point upgrade
Date: Sat,  9 May 2026 13:30:29 +0800
Message-Id: <20260509053033.1565462-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260509053033.1565462-1-Qi.Chen@windriver.com>
References: <20260509053033.1565462-1-Qi.Chen@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0281.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::14) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|CH3PR11MB8657:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ded9de9-36ab-4016-5190-08dead8c2241
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	PGnqm3kGMfBd2hTZxnrhKgQ9PfoxNyAEMNEds8nqNQ8iP/CZU2EkkvSVrcJhBc95G2+Pozzz0GugNU4SG4YKdpT+h932mXVbrG8vhUj+KeXGdeDeJho3FMorchRqAcXBKdtZqLv3Yf+/heWnVIwsgeznAP4DFguM3DWxNsd96GZySX+FwIL5nSDWRpHw25GLjsJduSRNHoFzzylCqtINd9yGO6fHdH3StuSlicJiHGXeCJErTgxOfQWn0iL8APlB0GQKXC1TC5DDAKWjv6YCanp2sq49zWA349xDo0Lavi+2vxnOQ5uDpAWaI7CG5IqicmMky+FMel1A11Vbx6qlhomooLya2YQeB0WWhwdcgLqJSjCISMyxpgmkarGogCom/ahpeEl5oXogNOVGnGKnjgQel1bqD1uLSNR3yqJNirY6UA4gAQHc8kRnC1wUVWyXIUazwtEPHiGdOMzP9vkjjzCMY2Zc3G4lbqrsFEvHvcZXnxFq7B3tw+BZBUgJrxbTr8b2bY6ZkHuR6Cm4l09E1VkC0EJQkaYDI2RChzpQH3L3pUpujtbvjpnXPzyydzwoZ7EGwGvGtkY+NJ9HaJmUO80xYdB6sL4orD2avV5Gy2klqbJP9SWt7gVv2gY0fsNr4W4d0MD1CNOh4kcYN8BoKKylhMK23cayuIXQQCPA43fe2CQJRj2xngVUpo03M2vgY9NXXqzGQiqHrxhbej8Xv05egkb0rLGZYWbWmD/z5GSIR2ekjoUB+zl84GC08z4m
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?V+RTPzskuSGt/kWrFHirD2HCjjvPrOnEe2V5QC6JDqlfcTB0eSiet9oz+PrU?=
 =?us-ascii?Q?s4itYDWnIj4Ax87GN9ssxNpkLYvjf+RDuNSSWyuYrRwCzdioTvL/mTPZcPDR?=
 =?us-ascii?Q?Lbvn84Flu35ycoJ/ZvJVV/0Hau7PhIUsCb29JFjCk5Ki2F2NJniuAVmipG1u?=
 =?us-ascii?Q?VwCEa+HPz/wrMp+iyO/LBPv94eAjoBEEa8IzCanS0LccvE4b0mQ0ZJr4Bg6b?=
 =?us-ascii?Q?9TKusMOn9kmy/hQlR7f0QTXvd2trW4OtharwUyEIffBEIh0WgNd0vmp+k9Uy?=
 =?us-ascii?Q?dFxRQPyyEH9/s7XooG2FEKSrn2sukLovJPCLn2OYHOr3Ivmu8XggRLFn1Zh+?=
 =?us-ascii?Q?jQj1+rWWXhX2q8TNXIDCBgGpvPBQDEnttwYQ47dnfozWljzDdySukgnV2QLb?=
 =?us-ascii?Q?lD1RMwWT8e8b3dl/KdIBc1mmDT0B9C9CqyaT/UczWYI6A52sImvcLEi6q6eE?=
 =?us-ascii?Q?q2n4ZyxDyHr4j+lsd8Z3jIHFiykO3Q4lwk3oE4Q2OAGj6HSZr9a6xaU/nrjr?=
 =?us-ascii?Q?xB6QjfDfcyswwdVnQ45VRV+tMPAo1ephgknl4uJ094DFuVyYUZVLH6ceiF1I?=
 =?us-ascii?Q?QH3zhKDm/5OJOyKvX17WvSnoTBeSNlugl68SCeSGGonDjdNx6/DJcPcOaEYx?=
 =?us-ascii?Q?CnAk2VnpL03lS1AS3izn3iM5ILAW8CtoiPfFWAXoEdapPpHr8wDezZ+OJVGk?=
 =?us-ascii?Q?3LY9LpZrmfOmJu50bn3hH3ehPVvPfFD5oqgcVf/ucEcb1IjHmmOar+DLtWcK?=
 =?us-ascii?Q?MuCg8lU6RpJpoSrYqnJ/H7sZ33o8Rx14bn3Cy05T+GOxpc2lsFTJQilPci9w?=
 =?us-ascii?Q?BTOAGOh9tKiH6N2cPDIOoIzpgPtWuxWa/abvfCPsHMWThRRskWy8sTFd+NZ3?=
 =?us-ascii?Q?XBlbtlpWV+5eFL11uGq1OZ+ctGr7k65tRKK3E0GIs05NhYdNHbXww+15zidB?=
 =?us-ascii?Q?h+B/sqag+nWMTi36NgFwkcmc6PqfQKKSABOML4W+6boicMSh/8Oh4fGzRzL/?=
 =?us-ascii?Q?yUJ4oKnvyyRQhM50HKIZ8yjQbJssrTb/TfrG9DCebWSQVNPLAP6AqFb2SXRD?=
 =?us-ascii?Q?n4tkn3Ox7Jm4vsy89TdBOYagWrlOSg0RihtQVYCwiVkfJ5JGvwHwEPtiyCEw?=
 =?us-ascii?Q?4Ih4s/0iSEG/gVjQhDiRzlkI+HNEdCoUmh+BqEz4E3J/z2bGsYcVHy8k/XF3?=
 =?us-ascii?Q?FhZM+y3EK7XPsnJWTB+PowvRPyyqENv+4ca8e0cs2konnh00Mct4RoaHAiYQ?=
 =?us-ascii?Q?mHQfJy6F1H9CdeG13qKy7tEMrxD8yATXHcKrVnAULdBMc+3CQ6NNV1z88LWU?=
 =?us-ascii?Q?ujC8BQw9jfpP4vcYKqGA8oSakanQoWq2JxzkcDWSl8bCjoPMZKr9DwSN2rCq?=
 =?us-ascii?Q?gR8ReVLxut2ICp4RaQ8DesQMyl00OOT/8xJEKqBfBtEAEErNgiftuxuo3fUK?=
 =?us-ascii?Q?ICb7Wa4a69DtqmwM8vdimlCPeu0ZunVhSH5bP2Jo9WoOY9EZYOL2PsUUnwLW?=
 =?us-ascii?Q?8fVeZ4bliz3mJrorlqHDzTWZCd0J/Ph7PfJEp/YGp7AqSldzQhyCDo6LzMph?=
 =?us-ascii?Q?q9WvbbbHkrQJXQezuYAyTt1o3ObT6UDF9s/ccu9qSr/j9W6AzHBsXuxyvLzq?=
 =?us-ascii?Q?hnexPq4IsBnokub584k3Tmqo11vOp3Bx2+e4Z//XYkwiuXaHRSc3h7rvPaF4?=
 =?us-ascii?Q?ZxjqQPEyUNAsVRywsWCp9jUgB8OwQv/AsqA4Mlk4JmEqwwny/sg+qx9+wXuV?=
 =?us-ascii?Q?cZrNFnS7ug=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	fSYhMF3OX+VS24OXMk7ZrHKwJ/5ikTEvmig+DANinBD0TBAhx8rjAfjIgbGJ9GyfIXqag46az/emmurmRSXnoyaqYJVWeSzicU9PHYQ9KrUxBMzW+bZUkUh2G5TgSeQT2t+MFp2ZQHuwuqcnB7wqvgMDpQMZVEcP0emmKX7vF8MF6DAkhFl7XoAarL8K3a3a9ZBDc6VMMV5rD/jv/0yAUBVePl+X9LCUzF6bcOwgHDKsFg8s4wOjeJo/GMM14D3dqDiXuCvMYZ4n/CVg4dweFqprPYBn2EVq9ZdzDJtL5zqKko0hkMVAASmpSu4jHFcyvckvTTNPzTKKHn1VI1wxVg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ded9de9-36ab-4016-5190-08dead8c2241
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 05:30:52.1029
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bMkzGuZdhfqhj/zSS7x7N+Zw0IMBoY3IFtgfZhSkO9ViJfWE25J6RyV0jZcN9nD57ZZzg+RHyxmj+ocp75CZOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8657
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDA1NCBTYWx0ZWRfXwO7ee/B76i9F
 byOWa0dLGbYWf/4DYy7NvzNPK7o39G0cS35YcVuc/Lbl/l8eOJxUUq8BqWY0g8MkhJKUkhsosfa
 yovhHgUYYk+6+ksUqEYF+9vRqz4570Ap0l2RPURWUFrw5Hem2JrH7woXbIy9Tz2OqazQdG7MtXA
 R7iCpL00YpFkeuqXsmsKakAQKVKBGeq+N24RFPCc2PPuPqzj9EIYPE54IvYarVK5YechCN4wzaB
 9g/LpjeWzf/NtJOfjb19Kl9s4pDyvJwU8ZQzMoGSwDCPwlCvqWaZ6y+mz37q8Dh2hnTlkUXphem
 Z+x9NhhkGan0GPbsEDEOmg258dSM5uoQN/k/E8cNT5H0/DbGlYh0mr1MYZSBIgoANRnpw+swM8Z
 bfcfYUQs4jxFCz+m29+DZnQbVCSOgxDSpgkoIaxYSpWw7K7oDBEX1elf3ISrYoPlJzdUdphrd12
 wUZoAEnB7+XEKIadsFQ==
X-Authority-Analysis: v=2.4 cv=X+li7mTe c=1 sm=1 tr=0 ts=69fec68e cx=c_pps
 a=4NR8cDhszsP7ZiL8l4sOGg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=kyH_fV5XIT1y_pECcQAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: D7wioGW8oDtwNnrshInz-WaeuPKC9Hwe
X-Proofpoint-ORIG-GUID: yK7wooXtbzKm2zp7B9sZtnABnNzbPpMA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090054
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 May 2026 05:30:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236755

From: Chen Qi <Qi.Chen@windriver.com>

When inheriting this bbclass, the recipe should have been checked
to be sure that the last part bump (e.g., 1.0.0 -> 1.0.1 or 34 -> 34.1)
is a stable version upgrade.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../upstream-stable-release-point.bbclass     | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/classes-recipe/upstream-stable-release-point.bbclass

diff --git a/meta/classes-recipe/upstream-stable-release-point.bbclass b/meta/classes-recipe/upstream-stable-release-point.bbclass
new file mode 100644
index 0000000000..947f882152
--- /dev/null
+++ b/meta/classes-recipe/upstream-stable-release-point.bbclass
@@ -0,0 +1,22 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+#
+# This bbclass is expected to be inherited by recipes explicitly.
+# If a recipe's version is separated by point and its last part's
+# bump is a stable upgrade, then it can inherit this bbclass.
+#
+
+def get_majmin_version_regex(d):
+    pv = d.getVar('PV')
+    v_parts = pv.split('.')
+    if len(v_parts) == 1:
+        return pv
+    else:
+        return '\.'.join(v_parts[:-1])
+
+MAJMIN_VERSION_REGEX = "${@get_majmin_version_regex(d)}"
+UPSTREAM_STABLE_RELEASE_REGEX = "${MAJMIN_VERSION_REGEX}\.\d"
-- 
2.34.1


