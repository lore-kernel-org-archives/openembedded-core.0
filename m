Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 926E5106FD81
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 16:00:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19279.1773417598714594638
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Mar 2026 08:59:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=rey84bvu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75322bb784=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DExYpo193742
	for <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 15:59:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=siQyC0UwkaQjRSw4a786w80d5C5GzzdzVmulZ1gM61Q=; b=
	rey84bvuMMvmvxm5woo5PkjGAqOSujORcZizBS4GEBM/kOhiRaJSqzgeHe4TFApM
	v2LvyryFx4kHHDhGcp4gCPpXehyryUsdX/dyNZrPzZVEWx+KrKTr68lB9UG8cJ9f
	SwW4kjgkqvC7JLmSW/MQfVQ5yPxNo3P+7d5cyj2GwR0eSkK7VDLEGbpfK0qUhPRw
	6vnJS/Ynd1mzhSXrLEVBzDXABBLy7H7rNBTHsVjXe+dgemegCua0VB6cOpSUnVGX
	VUQHzhAqKmQ2EQfaQIoBgCTSO2fM2JSYiaMfyMDUdAXEogegaXcHthunolNcJH5V
	NyYAmW03ukCaop5sO92Jlg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012048.outbound.protection.outlook.com [52.101.43.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cvk8nr5nk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Mar 2026 15:59:57 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DKxRk5taXpWeG+UmMO4hnsM9YlM3BMquoNahSLF3MlVPoA7pj4vv6SRjXkhM05cYnNsSyC4PAU4qD19taCJjid7wtR5NkK0NL7QLlrzckrvTaul5od43D1rSrY+KqZeUJ7FpjPNRGUZDmwbESipJE0bxeaS39gcabKAHwz433rUsOIoWTUJrMvQSUJMctRqBbZRMn5+gV/JTOGA4LZwgzYvSFaB08fikZl8kvNDXRT/gA0QRqcaJw37tmqu+IzLRC/WUN3aZvbKo5HO23PF7dE5ZrSkJu0FjgsMOnXJzP4hRLEqOcfd5cECk+ja7w7NpjyXwGcP2STr1yXSNpDX76Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=siQyC0UwkaQjRSw4a786w80d5C5GzzdzVmulZ1gM61Q=;
 b=hZRIywvf/1rKweHc1rKJpeUPsONQBpIpPKq1bpAV2XlWOD1axulz447YB2SAz1IZGyVJf3q6i6i4IpVx8N04R75nBGfhM8QRdZAsR18b27b23gEnTBc6F4C2WsgW77cS9zkS4RYgrNcDxz6bdGY24zuNRWtIp9+z4Z7Hdfx24Dj/jSLrTBPP/So7m6CK7TuM2AiPg5MREOzdPhqLxbls3rzTOV9xbkMs9pRNFVEQnEVtC+PjRVg138pAPB+gdTPHli7dF6e7EdbTToQKMuPF6kzTl5sBV7a4q3a9HKrGf1Wui3NHGT9uaHN4CyYqHHO4oZpifL66Zt7AEJrRxrweUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by PH8PR11MB8062.namprd11.prod.outlook.com (2603:10b6:510:251::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.4; Fri, 13 Mar
 2026 15:59:54 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9723.006; Fri, 13 Mar 2026
 15:59:54 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        yoann.congal@smile.fr, richard.purdie@linuxfoundation.org,
        bruce.ashfield@gmail.com
Subject: [PATCH v9 05/14] kernel-yocto-rust: Fix for buildpaths errors when rust is enabled for kernel
Date: Fri, 13 Mar 2026 08:59:11 -0700
Message-ID: <20260313155920.2347101-6-Harish.Sadineni@windriver.com>
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
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|PH8PR11MB8062:EE_
X-MS-Office365-Filtering-Correlation-Id: 07a0bd70-e13a-47dc-e1c1-08de81199150
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	cPQNBWKqGSHQx9bEXyuR2ww599RZykXJSvd4uv/j8I9o4u3q4Qg1ONh/wvRoDA9AQzqMJi2b4635RzvL7x4HsyOFGl44DPVB+iG48SE/iIXDZzNdbrYiMskesJRrI/BQnRb3N1lWuVtayI1S3TOxnSpYEFVguScthUmXn+gR32fHJhNsNDpPclrSSmiqAMvPkKErv6E4kuEM6ejdnJry+lxV5Ddt8mjK1Q71IzYBdRP8xVCYoMafySKt9XDpWd+Y79/VClI7xbebwn5csAzhQBU9z+2DSOjFFrJ1YPY+BzYgJvC7Mtk6u5sUPkwFatsuWs3M/nzHSiBIFqC8gidNgrLGHo1JyDmnJ+g3moHmObos4yWuDYKZ2Nm6+hxQ0oI6iN49l0i7k5WfHXV7Bk6126nNwA9+pdvP1kx8qi3gU94GPxmetQdOVDS6CBc8pbR5CpvUACXBEPst8nYJ2TTKCkV5F/GkJ6DM1ut9oCnXSV/8HUcw6vsHJZupX5hWDHh4Ph3gE17E2OFfoggzt/XVDaxypUdiLEDJmnjhUdIkLAWkZMrGv2X8jbEEcRFWT09ufyGzzncgjWMgsZS5Jlq/RaNdZG+RDHyxRR3SDGHte2YTMgM3P2ynpD2sjT31RO/pIDMufjyUJWG6/amFGtu2PEepk1vTrmpKOH5oCsZXQIvuaJGVAQy/yp2k/PqVRzHOf44P33gENMf8611xhhOZWYOqGMcsnsp9j9ae4ytFQkq5LuxO92QbzXK0Eq58OcFIBNskVi//JkQC1/gyU/j6abvgtXXOiCyrdFle2CxDlIU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xMFGDAmK710gQT9Lx2OS9p1U23SCz7W06kAM8+ADN9SXnp0WoAfJUwpqh8Xj?=
 =?us-ascii?Q?R77nvPgrcvauGrL0xBaqcrwOxtp4rdXJ2L8id1g+IAA3PoJcN+88QA4nKWCi?=
 =?us-ascii?Q?sC5l4H+rIyGJg4UGnE5W/iy7F9y4+qwTFjlvkGrZkino0JvMLzW5OPNOn5WE?=
 =?us-ascii?Q?c9iqdfXVX7Orxf2spl/r9Vux9wm9xUO1SSpLa7gotejXr6sMRq5sy6UPigKh?=
 =?us-ascii?Q?l+O9PV0HlmJDfpbe3886f1fUVPBVYYMkvBD1PdJyMRmaw02uRqYQcEzf+sE6?=
 =?us-ascii?Q?RyVuZF45c/mPMSOWZ30h+BwJiSJsY1KC6grL3OwFasrlu+/g3Rxa+Ml9q84g?=
 =?us-ascii?Q?0WbgnMWqKLfrBEqxIVT/UMCc8zFcGvvWZlXmmigzczkxSJBxCeAkzihoVh3r?=
 =?us-ascii?Q?zWTet6A7+4hh7OadCwKMqMOrPwtMEtpHlmAzYQ+xcVmMh1NNkm6kW2vE9ioA?=
 =?us-ascii?Q?cGH+TsbXoOwE04HHcgf/fxcPVMVroxTXzaE/9zLbFYiSIPyi31tk5R3bxelV?=
 =?us-ascii?Q?J/uTCkJcGDYvsimMhx28z+w7I0eUyjr6Ik4Ae1cZUs7jTy4vKnAS/TJyCytP?=
 =?us-ascii?Q?sm/SMbnps/HwcCGZwFmHlzQKlVGIlPtH/1hcFw3e5Atm3C/ZrVtsiLVb55hX?=
 =?us-ascii?Q?0a0cxYI2j1n4gyFd/ijgr0SD2dKWztG2hbnwnInGMHEHP5+WConF71/YCSl9?=
 =?us-ascii?Q?iDpDdFkn+UillKHoY6fdqVgb8EaGz/2m9G7FkIjCh9S+bFxl9zA/JkVATnQw?=
 =?us-ascii?Q?T95z2t+W3vKIs2ztUVN6Ni/JExDJ0uGiiJdH/6sDJvOpFovDeSrg3sjJ5XxE?=
 =?us-ascii?Q?Xv0GpLbUXKIcsp2tfXqJZ15vNu8vB52dQjxjbFmh/WtNK4Y6ShvYi37LVQPc?=
 =?us-ascii?Q?8xqnD47IygwsUFm1JLN+KV7iZIkxRiGY/uoOgM00A7SZl2hpu+VYgTrxPaNL?=
 =?us-ascii?Q?AkgLWmhgEfPC8XcHoVSsesopmlmHkBRCeJApgAt7Op4ZYkYmfTOMSRZV7UzY?=
 =?us-ascii?Q?zpNgEhmPVvNDgiBwHmn3XUO0WDB+Oa4cjfkrIEOsMu6ANNsXTDqAC7JNvqN/?=
 =?us-ascii?Q?TBkZ5B2skO5KDLdcjn4WNcXB4aGqrq9LbKL0AAJlz+pBeCkjQg7fGFmrZgQU?=
 =?us-ascii?Q?UVV7VE3yLWedf2Kx70A/hKHXnvGqvhJw9NDRHH2bQP7CQFKBWoWXtx6YmF4P?=
 =?us-ascii?Q?wR3Mas4CHeX2ys0iNQCO+ECsvpdM/PxaV3dR+0elxw8kgdc8OjN4dcQ4xp6m?=
 =?us-ascii?Q?YDIpdRsvbFW4bWzdH5ufmHx3ulFokPrU7UHKQLX/1g/0Xu2tTUauyoystjN+?=
 =?us-ascii?Q?bV9fYMM6yfj9NKApgAscx8JQ1NFumMYdHG2NSZFZfPtRwxEIsA33YdqSXTtW?=
 =?us-ascii?Q?ctRsYBFF9V4I3udQPui7VXHIacChUtI8tliRloEYnZ/44zlQgOxgf39VXevK?=
 =?us-ascii?Q?qYrsb6mOXV4qTNJKoSSLwGXtuJd4sik+gHo/2FE5iESwiNYFWFwBUMLaD5Ls?=
 =?us-ascii?Q?BOYD6XdYyeurE17oYgIm88bN/FqZzRf9AMZPUsoSI+/DsrA5C26CbgMj1rT1?=
 =?us-ascii?Q?MZrZVERefClLtu+DP1fztqtTzjNiZgozR5GM/0HOIHqfoy4CU8X5BFPx6Xnv?=
 =?us-ascii?Q?LiZBztogYyWhRRewPDvrdC2bmu0FGBXyJ2O8wW+nrcnsfdSr2eeRCu/Po6BI?=
 =?us-ascii?Q?VGR2WMlj7H56QScle1vClx/VMlCDYjQU3iYRLMW2q47WvdfxsMeQOWhDWzY4?=
 =?us-ascii?Q?t7mAGn23VvMswy1vSoBMa/imQ6UObGM=3D?=
X-Exchange-RoutingPolicyChecked: 
	dbz1Y+Y9+TyibOidOZRjajri+ZtVuRu9JOGiLU+wUTzYIzCgTfaM6XgFO6RFCcRbNpywX2+H0Nq3iIPZlHmZUxCvmhugUx1oiWp6o60lGeQNjyvrxZJRY/B+MbHodZpe9gs7dPaFVJk05FBs/rt1i0cn6xJ6K8Wh7HQsg8ufmosDrVJ0QcdJg3KPgd4yI9xRrryslzGMb4Z+9micICYQHkQ3JhKWQL4hHpo6k/IOJqD2HFqgSfbcM2iKf5GGnnU/h9fiP/H9aicZAZIzfMD+XkMTVL8O1umPy4YmMsHX/A14Q/B30kVuMksPxZ07eZlMw28GGP+moU6uNPGCNChKtQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07a0bd70-e13a-47dc-e1c1-08de81199150
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 15:59:54.6971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9iFikYZ3fuMvPQUQygJ0EHOc+/JhF0VFOTW5/+InxmXAc7824Rx4zUUu5Ep+q9rcfNJqsvnE77W/TZHT9QMmQHGYRpmsr5VyVa7suHN7+00=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8062
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyNyBTYWx0ZWRfX3YsAuxBV0eFr
 NPLG3S2t2t/bYR7oIfeuDFXXvcxSN7HGGLvslfMRAlrvQCnn4c/NxmEBI2hUmx1zXx5OCPZczG3
 FMgAC8RKtLFVLK6K49glik+RCzEGY8gLqsuR2rKDGyAF36oc88WZMf+hToB3eodAoSTOknx9rHv
 n8uHS2smUa3YqFHKk4j2NC8KGX/2tUCcWbmpxStdvlOqXDEqazAfa/kpXp4D+hxYRK8z1F79LVH
 3pewLcyF0tFBx7J/BZUNYMEaVjEffbBgpbvMrlAzImTywe3M0U9V/dqGEFCjcCwZTwPHvpSZZoo
 lM6npXVu8+u35wXALVBMr7NlrbzC91I1z4HDBwFf+nEHVWH5igiIWO7BpZBLE2ZwovEy64izpwP
 OMXMnHFGxXvXCF7icuP9g63Dd54YYNFJpKt/RWRAlnG3ZernrhCBDsRaULYD8mCxcbpYWcisWlH
 OJaAzWkelB93nli6qpg==
X-Authority-Analysis: v=2.4 cv=Vsguwu2n c=1 sm=1 tr=0 ts=69b4347d cx=c_pps
 a=CdU078GllgbuWnh+Y24ybw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=JTVBbxAFR3XZCbc8QrEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 1fHLNIoOBoCITVFtClDlW2jqZ5kIUK47
X-Proofpoint-ORIG-GUID: pVdCVpxhtDh3HKrkq-O14JnGX5R9k8x7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603130127
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Mar 2026 16:00:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233052

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Fixes for buildpaths errors after enabling rust for linux-kernel

-Introduced KRUSTFLAGS to pass `--remap-path-prefix` to rustc while
 building kernel with rust support.

Co-authored-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto-rust.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto-rust.bbclass b/meta/classes-recipe/kernel-yocto-rust.bbclass
index 7acc81764f..fd9ee91c79 100644
--- a/meta/classes-recipe/kernel-yocto-rust.bbclass
+++ b/meta/classes-recipe/kernel-yocto-rust.bbclass
@@ -4,6 +4,12 @@
 # SPDX-License-Identifier: MIT
 #
 
+RUST_DEBUG_REMAP = "--remap-path-prefix=${WORKDIR}=${TARGET_DBGSRC_DIR} \
+                    --remap-path-prefix=${TMPDIR}/work-shared=${TARGET_DBGSRC_DIR} \
+"
+KRUSTFLAGS = " ${RUST_DEBUG_REMAP}"
+EXTRA_OEMAKE:append = " KRUSTFLAGS='${KRUSTFLAGS}'"
+
 RUST_KERNEL_TASK_DEPENDS ?=  "rust-native:do_populate_sysroot clang-native:do_populate_sysroot bindgen-cli-native:do_populate_sysroot"
 do_kernel_configme[depends] += "${RUST_KERNEL_TASK_DEPENDS}"
 
-- 
2.49.0


