Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 271D4CD3446
	for <webhook@archiver.kernel.org>; Thu,  7 May 2026 17:32:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1563.1778175162182038329
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2026 10:32:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Fx9yev5T;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9587ffd4f1=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6475xvcV3336311
	for <openembedded-core@lists.openembedded.org>; Thu, 7 May 2026 10:32:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=3rmYoDaSDG6qdGHdUpTpEig4gHJIfBihX4aVYUP63hQ=; b=
	Fx9yev5TLs4KXOYFCSgtZmyKd8/tOenYTibZFjBIhYEhOSL4urtEZQszRblakWBN
	leCbvTa8zzwnQxmh3ZC6hwhexVm8LBynB2XK35itf9FKX7Ms0Abe3QD8XNWHxDba
	6EGUZfj7/QdvKKVdl/JRk1Dw/LMmfRwB0j4JfC38kF2ig7YMC3Kcxhfn+L0ByElv
	Zde3ITfa7c0AAAKOAXk9FIZiP6idBtx6OLWHZtHvMdZWusF7zUfPAYQupTTxpiFN
	eJmZzfU2Yfa/uATnjNvVIA25ACW7LcmK17OocZqYyCzqMOZvT8E8Eu3C0s/h0ggF
	QVKgs+94z7gUD0cuPnI89w==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010040.outbound.protection.outlook.com [52.101.193.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dwchyxpea-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 07 May 2026 10:32:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iTcpbeQwckh6mf2kVZrvyLUEu3BKSaP9qhzu00I2yZkkF0pAX27UvUCSIX+iSDZgFQOOGJuQf8eq7w4ElZZXnjsX6fiXMrIcZ1X5l7vWfzrXAqWgo2AOUtq6G+Nv+i9kMtykSjByR7JlZYlhzTYKr/M3n+S0XV1Tjo3oUOZvE3iBWQ7sNKqwuUJsVDowK5H6ii+labHRd0A7X8NLpHNSpSzqxSg0E1E7mgFrNbVwvsTjaPtgA1eyFFTMMlk4Hfv7fJlgK9ftao5ULPmTd9gBpqXR94QxGry3/vQ0vJGGPnoq5wgBmndFsF/bl3Nejv6fiRVcpSDGcqcSE0Pp0DfI8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3rmYoDaSDG6qdGHdUpTpEig4gHJIfBihX4aVYUP63hQ=;
 b=e4nZ0ZL01QqRs5wphzkTyBvENxRFoNjukVWGOVxeaID1D9OkQpZdDP8/5eI43xmhgAjShFSruKRfDNYcVSM2HbII5ikBhxM38na3X2D9qWbnsobUyGczoKKvP+hj36hqvsdW7PRGGQdHuXnYa7MYYKoBhsSrhaDm9M77IM2exnmFqioOy3l/WeVYN+eMcS5WRbr+AloJvlzlF/lAqIehNYUmLsfJh9GFnSVY2ZYFalYAj6EFO15eKlTZCpZhALJpGOZt2Uoss0Et9LApZYF18T2VrpV8puSb38sgATK7oE03SVpnrcX1UUCyqkK5CYxNlx07XRAPC4OQwg5jlgxzNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 DSVPR11MB9556.namprd11.prod.outlook.com (2603:10b6:8:389::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9870.25; Thu, 7 May 2026 17:32:38 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.20.9891.019; Thu, 7 May 2026
 17:32:38 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Randy.MacLeod@windriver.com,
        khem.raj@gmail.com
Subject: [PATCH 5/7] gcc-runtime: disable automatic libatomic linking during build
Date: Thu,  7 May 2026 10:32:09 -0700
Message-ID: <20260507173211.672855-6-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260507173211.672855-1-Hemanth.KumarMD@windriver.com>
References: <20260507173211.672855-1-Hemanth.KumarMD@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0462.namprd03.prod.outlook.com
 (2603:10b6:408:139::17) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|DSVPR11MB9556:EE_
X-MS-Office365-Filtering-Correlation-Id: dd1f988b-061c-466c-c6d0-08deac5ea270
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|3023799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	kUb2dc+mvE9jo3/T+jn6yE6BuD70bplVvu4If6HU/XnxIpdMMFSuOvtcLSP+EyeKHd9pterDqbQ2fxSdto2ZXLrlcmPJsxmrnx4fAGWCXZP4rosXlS/WXitNZZq+iRA7H2fHKZcJd20W4SFfQ4QmY5ENQjQXYiXN+wH6h8k9f4120NAATJ84ihCBgBkgtuM6cPcSChDNcgJC0W/cwUFVL59QCULElf9XTnO8EKxejPC65b4Y+wLCqXNwu8zIRb38rtCPLBasccngzKqZ7quyagxHRxYf7f5h0s77X9bDtOymDgt8v9ulkwWWm3C0GXFq7vBPC+evaUulLae+YALwuSvL7gvaXVScBo1lAZIWShqSEk+TBNiPFOh+6Ow+PTyDnO21eyP8xwXnSKeUIt3IXdUiN1Pu9WUqHovMzvWBBPLhMMJoyPcJHGC+tyrxjfInR4YZfcO6Lijl/caP6+vl4ja6Nnes81eKUXLrEH/eD1OmAYVqqrIfLyGAJeaibwbDU0iOQZYIOHWjfIJszMWUNsl1MzJPbGEnGebRQ52tOYPUHAaNu4rjEHiLWEsWXrG69YaXrozmv63zJdK6Kr2OL7JES6NVaDlJMM3c1hK4JwoYAn2wZgLkDZU8Dvc3325AW4ohgPCWzLrxEw9rB6+oq1XgjCKZufpACacE/OTA1vZS9u7dKTdPDPjrooaDmBNXpuiLp0r1qjzDzr4Aie3nUDpL8wvlN0c3lfyoZaFX71yhPWN2PXiYKuKAu4GQ3B8y
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(3023799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Fv8+jE2gnJIVIM1ijGnbZiXOKuia6jnsKvQV8aAX1R76TMuvTgkckRyGkq57?=
 =?us-ascii?Q?jIgji9VZto2gvEzaPPIdpeAzXUSA9HO2LGDaBGyDf0SyWxdesERLUc8l6XvF?=
 =?us-ascii?Q?TTnW6PtDdenXprAtg6BrU6nN4HJ00NhZOx88zddePEHY9pIJza3xQoJn60yb?=
 =?us-ascii?Q?eMNjiaMP1XxzaSKRwt9z3AzuDXy5P7HKEoGzNpubCye5gctgu35d20Phn1yD?=
 =?us-ascii?Q?MICL36hQ28nLKNUMSuyCO7F5N9FiYDAo1ixL5MCe7B6fI2d/XoRGd49JS4H9?=
 =?us-ascii?Q?e6oZvhss6so+2C7T/vRHoUHu8tMmcc6AfbnfreS54PzqMEQRpirEWymxppTr?=
 =?us-ascii?Q?O47ZX1asyY4+vg+QrdQ2eEgJotBsH63LvhnkhsjKypk39jCKGpDFD+NnAlkD?=
 =?us-ascii?Q?h462vf/eGwHBqh6L+OiWI6OCO+8yklBitWaylpHhMNcfHxwd68ZM7/XQ8Ykx?=
 =?us-ascii?Q?o5MHBFjPaQlg+D0e27Fg7SyfT4i38JWwVA3RzUhuqtiaVhTXtJbIdaQpN9Jm?=
 =?us-ascii?Q?EE7JWjSbaMZI9f6LxUeV1VjTXaVvk43qq21KHuvU0xt2gOEzw1tazT7ZfWif?=
 =?us-ascii?Q?FZs3qc//UU1nXiRJAcG7wVxHhteHx8yHB59HHCMdwrxznT8ytUzdXv6RpINB?=
 =?us-ascii?Q?nkOOPpIVc0lznOm/iHqqf292wNXRJQVZlVaywvLf1W5G6QC+KLhZjICf+37t?=
 =?us-ascii?Q?V4cLfU/6tmN8MOsfd5uPFILjgH+3oSdsnM6Qlxtp2/gpco+9YnUbMEUXOy4f?=
 =?us-ascii?Q?FwBAniQGXUMBCd8Cs2OPMd9HyIrYhnXSHvGTGp3AlV3LIz6CgzMldhjOG0NT?=
 =?us-ascii?Q?mH8FmmwTIULKcJiof/C8gKaymqNrbBLJHzJaMwX+ts1/EghutWbNZnd2uC9E?=
 =?us-ascii?Q?fdgpxlegIHg9sCD6S1Gf3wB23u8oqF2jLtE+9icg+I3/Zke57MlgGwgFvgTt?=
 =?us-ascii?Q?b/OR57pyjFWeQ1SFnjMDJaxrC5B3UtOZII8QQlJXWgbhLoZeQlK/NScKisGd?=
 =?us-ascii?Q?DSDs3ok778PYkBBtslzzTA0XDwsv0M32bbTh8qu6rMnNmigInsurbWYaIoKl?=
 =?us-ascii?Q?0my/atlUyxD5A9i7VuZKTl9noPTYUCaLpSGkM0ItWm4FV8PLetOaokrZQBGB?=
 =?us-ascii?Q?TSBFKr+GaY0uKgvlm+Inj92+oVhMlmraCMNt+1r+VIG8bc2+4C+HZmFm58As?=
 =?us-ascii?Q?ojSzuhyZNeqoAXx/Nepw7b85TGZ4xZtRhl68uu1dQSUqlbLy68pSPeAbMzsm?=
 =?us-ascii?Q?Kv0IFkP/1rrYJANcaGGOmkNCQZxMtSLr3+NC5rMfuOdXeqmHf1Pt85viIXnQ?=
 =?us-ascii?Q?FPiboGTIfU1jWU4PT+fjgGUZlFd7OvwJfCl1wFG3xdxDuJWh1TULojVFEBtf?=
 =?us-ascii?Q?25Zy9OPGC6xlCqEAXliGbVDZlzUPDGd8iiR2TzL9dRNDDEXsf6s1S3si91tK?=
 =?us-ascii?Q?BmcSm3ZUrFWY/GUyPmi7pq0c8MZIZpVTEINdy9dRFL816lMrmXkwKR3RlyNQ?=
 =?us-ascii?Q?h/1TqrKZq5ScqzJRwIP3+EeKP9qU0EiJKFy0bbZ2fOp8UEDsbDO+caG012Hf?=
 =?us-ascii?Q?pKC7pOM77/SxFkFkvJQHumeAfbFqPx2AYuL0k5oXXaJowteFErA/oHcc9MAe?=
 =?us-ascii?Q?0ahq+lLx0bwR1fUufY+DI3XYv8l2dqaPfoCpcsT1ZwfTuiGPsE2Fimp5d9HX?=
 =?us-ascii?Q?m4IAQTyBYl1J2GtUd4jt69qwknuD09Mr3ixMqwD75fijxU+eFmYjm1Av/cLS?=
 =?us-ascii?Q?94lRex4iLzn/la0ItzpPq/k+Eu0Efrw=3D?=
X-Exchange-RoutingPolicyChecked: 
	WnoG85M/ReCZIRm7xNi3rh21/M3BkO2or9FMzoGipyiN/BhebB2CO5om2osTS0ANFlv8T+wZRNimpVmwIxIPaIYD29jNl7Xs9qtxNH9qTsfEuZQMAnrPJV3yjwZ5C7dS57JH882lrjf2daoZ+yt11knFfqQj1AV7SOlN38npr16epRM3AwBAweOBxP6olvmqyMdM7MA2XOKAmCSns9QxL4y14QoyTOmFkJ+OqDnest+R+/BOThcmLMd0ysBUd1w2LMOVrw40/49z/EfBeeP57cT/NylYVzAoCl4tNKz9ZIY2ZQK814ejaZOW+nz+vf/cKW3k/Wugp05xOTTPw3sXYA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd1f988b-061c-466c-c6d0-08deac5ea270
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 17:32:38.7421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rd0N9GM4aDRfdXflWC5j9D+oXC927uaXjM98AjtOTHuovs5qa7jN5zjOpjLtjZag+ZyCeOo8bSR6MJ6Urhc9zT4IRPwhCH3tAzEiRRUyZz8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9556
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE3NyBTYWx0ZWRfXyjBvvaFhM4Sc
 uqHVmyack0yJvUTBTCHl52jDBCicLez75Hdm/4l1WKyEHRlL6pF758BvuN3rPcSfiP+QADlklW/
 t/ThMuXHg+5cSBZy0VHr2qoW330Do8pvS6/1EIaAiuME86RtuZ7F6py82FE1Iyp6o1HVxRTkTi3
 dg2ioRmcv5IL7R9DPGGNhbomh4JQns+yYqXfpBHC0uwPqZcL/Mtcw70ycfZs7hg7ULdNwnnYY5w
 B7qprQ//0v5nk253Najy7SWMrohOKiybBywhRj0TOuqQChYG5BR6R3aThDWOsVHPXuAfAEFhdFM
 QmHrVQ+8h+gFyPWhXlGb0Qws2osT1InausqSTmZX2RfeyE1aoPWZiuAumbgxuho1UlqXTlOjOi9
 ktOmYUOC1BKWfu0zTWX6M5L64/jha45XEZ42dVnvASTIgf2gG9RT0WVJSyHOoCiMN1pDbQ4vKtw
 Hog3/pIFk5gxscrb5aw==
X-Proofpoint-ORIG-GUID: S-dvzk4fYmKTWeUwpiPIU89jfeJZI22o
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=69fcccb9 cx=c_pps
 a=2d9FbaPwie0YXhWIRYJR4A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=0SpPGjiuViyywlX_MzsA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: x9Sgq1Dfe7fr1dECfjtby99lj06ZgJWj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 suspectscore=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070177
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 May 2026 17:32:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236612

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

GCC 16 introduced -flink-libatomic which automatically injects
-latomic_asneeded into link commands via LINK_LIBATOMIC_SPEC.
During gcc-runtime do_compile, OE uses a pre-built GCC 16
cross-compiler to build target runtime libraries before libatomic
itself is ready.

Link: https://github.com/gcc-mirror/gcc/commit/e63cf4b130b86dd7dde1bf499d3d40faca10ea2e

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-runtime.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index ef38cff58a..d975153bc2 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -15,6 +15,9 @@ EXTRA_OECONF_PATHS = "\
     --with-build-sysroot=${STAGING_DIR_TARGET} \
 "
 
+TARGET_CC_ARCH += "-fno-link-libatomic"
+SDK_CC_ARCH += "-fno-link-libatomic"
+
 EXTRA_OECONF:append:linuxstdbase = " --enable-clocale=gnu"
 EXTRA_OECONF:append = " --cache-file=${B}/config.cache"
 EXTRA_OECONF:append:libc-newlib = " --with-newlib --with-target-subdir"
-- 
2.49.0


