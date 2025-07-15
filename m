Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 248A6C83F1A
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 00:35:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.3363.1752539711945587211
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jul 2025 17:35:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9291d67bba=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56F0Ue652713808
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 17:35:10 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47uk032haa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 14 Jul 2025 17:35:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUfTgrgif5/WQJOZXjLnXbPtG/1Z5yaxpqTGPvbKupMG2LDTmODg+h/2okOBKlOqe+FQxJYLBPZPU2DhPBjEMZIhXIuQqEQ/rzAUc6o1rEnQ3/LeQJxmpTf35s9A1aWj3NGwXqdPhvIx7zS/xYaY/sh5YDsRbkTlAiuVf2HYC23V5wN2N9EpFMeWPkq8gZXnaCaqQufK/NHfi81NmgGz1jEbH8ZRy3Ygd+oaf642NgsyFKPnl21uJNGyCuvijprxXyy6WTmttGMj2yfMXIInUD2dpAG7lS7S/XlfHYBbxPdXxKp0lGpGUXp4vAS+p1OI8M66JR6Bg3Z0JStn9p1n8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OKe6brzLLnyri+3SOwNX4dIaWK+2l6OuDLfRBSuWvTU=;
 b=wOYh+MKRg4UEEJXSXppJIrdFY/R2Wc0Xe5rBCHMO9xA+je0tgkr4NVPB7cx9Y2jlwxCxKShyT4J/agUYO4489xzj0MHAEhcXkQIvuin01wS6uq12TplDHFeezHXFmLFAhSOGMofsPVo6R1W/VTBJ+queV0uxdwgoL8yYDSUAW34LoduO361Na8sJmZIpp0SNjKVxFQ2JQRJx5sIX4AP+pITmj5CvSit959reL0UDqyQrtAgLiXt4kj84dQBnkSbfJ/2H4ViMG82sC45O6tKVyCU5jY4q0f0QJ54cZb1p5rQSimjVb8otXsm7he0edpPsFoXyoY4urwTxsVzlC7zHoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by CY5PR11MB6439.namprd11.prod.outlook.com (2603:10b6:930:34::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.23; Tue, 15 Jul
 2025 00:35:07 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86%3]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 00:35:07 +0000
From: guocai.he.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][kirkstone][PATCH] tcf-agent: correct the SRC_URI
Date: Tue, 15 Jul 2025 08:34:52 +0800
Message-Id: <20250715003452.790166-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0095.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:3::10) To PH0PR11MB5593.namprd11.prod.outlook.com
 (2603:10b6:510:e0::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|CY5PR11MB6439:EE_
X-MS-Office365-Filtering-Correlation-Id: e96c0eac-f41b-41f9-1f75-08ddc3377225
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wkq02LpVaGa2OfgKKk9WjFTIav6ua9YXaaK+SbMef/gAPKqUz6ACiimCXfQM?=
 =?us-ascii?Q?t8rh9ntWulqRPdF1D7N3xGhFaMIRT2RikyxQAlzclK/XhcRUlZj7Yz2dlkwS?=
 =?us-ascii?Q?KqXcfAMwb9ZTseMhMKktsrUn9QLwWRYsUNdVTRMIlxX1gKzroAZ0Rdgg3JDl?=
 =?us-ascii?Q?+OS2XhOj07a/g9NFxnVenkpgteA0ls66Sgcap+zV7y/Uq3tbGuJrav4+73XN?=
 =?us-ascii?Q?6UnjCamVKRK9UGD9oYur6bpiK0jxmpUpJTXN1SrhpgclOpkn1Cg+O6TqjGPX?=
 =?us-ascii?Q?PEEPt41eSiW8TxVDh5SdEnC2hN5KlEpwGNUKh8GrVj/HXxBO7dK60wODpgDx?=
 =?us-ascii?Q?0DGCtCGkjNyiZ85oaJQBtXK6geEoebkiERdIe+U+dFQbb3BQwFF50jNahNjf?=
 =?us-ascii?Q?iv/nE3/+Alb5XlQZzxLIpb0WmOSsspU2K0KdyB8qrNpZnOjgQdczo2bdGjkV?=
 =?us-ascii?Q?jGcwKb9+phXN22dnrD/lrf7HcKXe9k3mX4Yd3/BTBDo5ehVxeJgYDDiCZBN4?=
 =?us-ascii?Q?Sh7r3gOSs0HVGPUsj4HdoqLqZV9NipdBIs1BEQsjPybv7QvlKYxgdM8m5fEw?=
 =?us-ascii?Q?eU0raL6F1nLXkezL1wgQS4Wfa2GUiyXa797VNoCguflQEtrQOmh5mE6qfxp1?=
 =?us-ascii?Q?P9yTFYYLxlpPFkD0rpbq43EBlHeTWPrS4Ohzv8omo9jb1/gTT/r54gzlJHJJ?=
 =?us-ascii?Q?+vRXSU41YMvegFkxX+CkAjZrT2469wKRQh/RYJjuFu+APFF3Wlsvsz3d2Xuu?=
 =?us-ascii?Q?Gr/Ks/NOr4EWOLuqSuQpmvFm7jwgKXefRghy0X7p6r+Yw6I8kNUF1t+B3B7O?=
 =?us-ascii?Q?w5GbQ6VKSZr5bSyFwefi13ffr0EOrFnC1BEEQBODEx/AntZfQcUGnO7/3D1E?=
 =?us-ascii?Q?SxwjX6Q+3dVwxAK8PQCrONRko8UOLpHsvmDAFlcUR6v+QR3MRhMIvAjCsi2P?=
 =?us-ascii?Q?Wlr8uefOlu5x80asbk1uNomvi0LN0OOR6b6p4RLPJT76rIvI7WeO6O/H9r+2?=
 =?us-ascii?Q?VF6crOlRqInljB7+Zc5n8buQmDs1WqrKce6eNHMSyc2DO2lpJuOzhezuSWXV?=
 =?us-ascii?Q?/v3UY6tiiYDIlvfGFguFeb9iVND/dBb7kA3BicS3BmPkjDVllnh4DA8IKW2z?=
 =?us-ascii?Q?FTDTQ54iQUcgbkD6EyZcHzBE68BQ2Cm59cbT4RtJCS5bMi0wG1zLrV+F2owL?=
 =?us-ascii?Q?zXJjGHIcBZUvrc8Qu2lMVGXNBY20PxETW+36Y1OTpTa7zr1Y7xDGS0iBBJLp?=
 =?us-ascii?Q?531ybtrrX/ACXf4tEPBmvFsACk6lVTX75h46+2F0DYSkO33F1dycczbliwyq?=
 =?us-ascii?Q?eZpmRrgX1wNggMpuI8K4K37/Zq6QOiDpWcczpHlmj7Y4eDexEwMCvOmGHE0/?=
 =?us-ascii?Q?I5xh9kvjO6p2lYdQW8SibhRX5KZ/AEX/9oQrs3KDabhwatYMII8pweXQLeVu?=
 =?us-ascii?Q?gQaCjhvBLqjljECm1Ah482ROkWySeupvF+8ipdyFL88JZmGwjJWnEQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EGuolukaNVK4pAPI/70Rs/x5PLldrAplLF7YzZuliZ8pXJHitnsoDJkuN3bz?=
 =?us-ascii?Q?wIhvOkhOOAQDsoH3WOu5xE9DoiFJaOGVhhYCSIRbi5SMVQXNYt2gc7X7NqYF?=
 =?us-ascii?Q?3WniyxcERllcsrY26TMRiGb54QQI7KEgeKno8obvOvFd5K69fLEmTlQdf2sq?=
 =?us-ascii?Q?DPmqSIyvEPJ+wpx+OKE6mmAPI0gUDrYZjpLf3DT18nZJBPrJqnLvjY+3Y4Yx?=
 =?us-ascii?Q?sKckvI8BZZ5mBuQe8NdmbFJijNBzKxklPukVBb6kg2UpgOMhJJMRML5xjkMd?=
 =?us-ascii?Q?gMgvUz9A7cWW50igJ5tEr1v+4J1QRPdbCdQu8tFwWvkASQqPd2KzqU86Y81O?=
 =?us-ascii?Q?hyw4NllWhMFLzZAMpbrw3oaVCU2EggpZY/jtAzKKVZxNAVw4+L/DiZllY5EA?=
 =?us-ascii?Q?vwzhjqOy/Q7We8YD/9Posiq/Hepv+EzzxznsYlWFQPVcBFu9r+hU1vkD2Lbm?=
 =?us-ascii?Q?tteQJZ5PJsklSmx8QyLaBa0jrhvYuQAdUvxAXwyF4qcw9qROiMiiMuBuUXdY?=
 =?us-ascii?Q?s2Sd7R3USUuK0BZNx5hPHg3jcSMemLbryK/F31xO/P1WEUxScDhxCTHbuwEm?=
 =?us-ascii?Q?e23bp4PSUp260lO7+avau5/YNX4ux+uah84k2eFIJpDwGEXoxyVhGc8gCKEs?=
 =?us-ascii?Q?ib4/vru5sMvLTb7WCR1ck4oNSM3FwrRXna7VFRsxEN1NAbYVb+qfyg+HUsc8?=
 =?us-ascii?Q?Tep+s1z87rxDaPAxd7IzCk9taPLH3ghidbxUQupCzXcf6+Y88qVVKx6qOvJH?=
 =?us-ascii?Q?+lHsWi/WO5ULmHVuG8xWbmwj1WifPLJ7psD172Znb8ln+JhEBpZtrU3wqVXt?=
 =?us-ascii?Q?TgWqHsvEbdbRBFWXTsfb6huW2OLcg7L6/O32aRAb1zSszeH3HQ2spnwT6jF7?=
 =?us-ascii?Q?BKFcYRZiuRYOUxOnlkz8F99nihf6gSCSzCyYf7vX6FUSc1EDnL2pNSAIg0oX?=
 =?us-ascii?Q?clgzMXZtrG0W3Xrt1CigVGB5guZknw7cz0SnpcliAe3btblJJ9GgBD1zBkNP?=
 =?us-ascii?Q?oiUnnkYlB26FM/dfgI/K5ibjjEaiG7rB3h3EyM5I06eTNNXxbet8bnHaDlvI?=
 =?us-ascii?Q?J0+CkblIrJKbjjQ0Q+hnw3gQfL3wu8v1uJaFqymwm2R+VNAprhnKVM0PEwQT?=
 =?us-ascii?Q?snKxkRDCf1LpXL3Qjo8AK1hd3ooTg7VlQTSWqpR2LYSYVz3G6SZ/coT4r5qm?=
 =?us-ascii?Q?c4YWaZCC6rKTd72XiXAH/uY36+ssB7P+vv24NW90rjIDNoTCfMlGTk3MGomI?=
 =?us-ascii?Q?JyT0L4JfNuEyr2xMCMXNjFJpsWVMMIvfIkFlUngWSNFMLFIVzFCPnj4NP/nO?=
 =?us-ascii?Q?2JFsbNUcUQjI+ds42q0gTCkiufVrL1AkIip0oB72KKZ6ZhQxFaWtvP04YH6H?=
 =?us-ascii?Q?tEvkVumrNUoMoNVp/wokf6l+FT0kLIoFecCt9Tuy+343GLqYW7N3UW+kUUf9?=
 =?us-ascii?Q?JCoMOucY9ijdsE4+grYZZlB9fbFGRIuYixHr1WgzV1g4Im8ZCqITyJbNA3X7?=
 =?us-ascii?Q?BS6WMI/jgK+iEjTrHOdKvrrljehWibh5r9yj9qgUwYo58sZ8SxY+z+SSJWKv?=
 =?us-ascii?Q?ANzsN72/JDrcgij6TUOHDgEjId5FE36kHt8X8TC8BYVIMHqc+lCxyQCQESDf?=
 =?us-ascii?Q?eQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e96c0eac-f41b-41f9-1f75-08ddc3377225
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 00:35:07.0422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fyabnc9NyIyEGr6Fm8OxUrvsNb/tn79FBXA0MaJp3M/tXGjKDaQK6BhkBzLyeLDE6SXA9/4hIZahExuOboOsYa27NE4ULuPtoytxjyGmTWw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6439
X-Authority-Analysis: v=2.4 cv=RrjFLDmK c=1 sm=1 tr=0 ts=6875a23d cx=c_pps
 a=F0lD6ZpX2VF4uFIdGQZaxg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=t7CeM3EgAAAA:8 a=JIVOxcAaAAAA:8 a=qvi8lN0Ck-3KJq75PowA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: sYoeJqrcMioYIvOyZ8z6IhPCXWf-kkQH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDA1MyBTYWx0ZWRfX6AyO6Mh8Ephn
 eIHt28ycrZmyEPBZ5e8SJ0Af3U+vZ2hb+/hu1W10+JVOEOJvQQ0gflViJsyAfLv59/AVqJaevPe
 O60IBawicFNav1u9cgwkYSmuU0Lbu67CIB0vLP0tLqyFEj15rIopOEFadUNCawZB+83zIgA+wWA
 r2m8dHcNewhbt/JRu1OQFdtgSr2An9bhY+yrf9SHNTM9PgKr3wAWDOK7c7UySaGoomtxErcs0eW
 CCM8cKy6iTfWv6iJwo1lBhlrG8BEIddGDLvwJEe/d9v0n/AhhTttpTX8jVXqW49cgASWjSi6OU7
 Ta/pqscLDREwUx1n59mPgRKdg7IxL97xt0u/pSelD57XzbBCu/AcZRMSZCYlYp11OFSkF4ufLpz
 /mBymVql
X-Proofpoint-GUID: sYoeJqrcMioYIvOyZ8z6IhPCXWf-kkQH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_03,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507120053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 00:35:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220262

From: Guocai He <guocai.he.cn@windriver.com>

The SRC_URI is changed to git://gitlab.eclipse.org/eclipse/tcf/tcf.agent.git

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
index 0d627f4e23..8165d35758 100644
--- a/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
+++ b/meta/recipes-devtools/tcf-agent/tcf-agent_git.bb
@@ -10,7 +10,7 @@ SRCREV = "2735e3d6b7eccb05ab232825c618c837d27a5010"
 PV = "1.7.0+git${SRCPV}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+))"
-SRC_URI = "git://git.eclipse.org/r/tcf/org.eclipse.tcf.agent.git;protocol=https;branch=master \
+SRC_URI = "git://gitlab.eclipse.org/eclipse/tcf/tcf.agent.git;protocol=https;branch=master  \
            file://ldflags.patch \
            file://tcf-agent.init \
            file://tcf-agent.service \
-- 
2.34.1


