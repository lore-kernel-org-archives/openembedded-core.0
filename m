Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F0AC02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 10:27:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7860.1737109655351131395
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jan 2025 02:27:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3112c2805f=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50H6uf6c029368
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jan 2025 02:27:35 -0800
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443mt76ge8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jan 2025 02:27:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qbUoCNALD/2cwh9okudxEFZeJ3/WeVat/nNUxx2AFbYVNv07//z1jzKVYxTg2SAxC/xayMNi1X40ECrZWlgLhrYJIg1/QITmpPhI3vPdLp8+GvgIdFqcDBKPZWbkXxBkCYnPTtsoduOzkv8xzOXeUIOq6DgOW4V+5QCLHP+o7wSWHk+cwf59IAQ3iT9Z0FDGfKqnaJisDqe5yIX4zeTkSX8u5UMwL/i0zjw1at1TMOvyjAaQ3A5UWpc1KStPVn2j/4nmbOVH7NPOAHZnS3WBHBnN7TL7nGue6ci17/toXwB9WS4y6NnQ17mW294obj0Tg1r+y07nNhXjPZlsMK992g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HcNUQEsqxzGs6HofZ7kes2OyFmO69QNh0nOXzaQd31Q=;
 b=usaj17fCDHATw+UuUF99+bC5BwzeLQYGj2xblVkp4TKHdM1tdVNgKw2Ens85LQuwrUs1Id9Ec/c1VRNDYXaF98T90U0GdjNO7QszZJhRR4GR9K4kB3muhmyWH5UQ+nKUQnbsUBUQ3cZtUgmldADAGUANLFSuyst/5ok9iidVsHzlQco6UbsLJafedQEOgOJD80pvclwvqFZyTjYWW6Xo/oc8+lBJXzOtli/p07al4VVj//L4m6CxExijmWdLxkdTPMsKsUTC4WFnK1aw4/Jd/yTlwG3ehB+IF6V4whmAfZjkZ384UmGpt9LLnq5phQDwwROZM9kEhSJk5p8/wEAJnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by SA0PR11MB4719.namprd11.prod.outlook.com (2603:10b6:806:95::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.16; Fri, 17 Jan
 2025 10:27:31 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::9ea3:51c1:edff:4d3a%5]) with mapi id 15.20.8356.010; Fri, 17 Jan 2025
 10:27:31 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][master-next][PATCH] base: use recipe specific PREFERRED_PROVIDER
Date: Fri, 17 Jan 2025 02:27:19 -0800
Message-Id: <20250117102719.267277-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0155.namprd05.prod.outlook.com
 (2603:10b6:a03:339::10) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|SA0PR11MB4719:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e7668bb-e5b1-42f3-05b4-08dd36e18c74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?MawHYnmSp6xZWvI5mRc6IMCwv8csPZfkwpZGaR50s/aSYCoLyzXde5QTwoBP?=
 =?us-ascii?Q?UOUPa+AoMT5RHfdz9g/AvZNJe6+Kojo8KsP+k3GfoPy9B+1JlPIVvFWJmbyf?=
 =?us-ascii?Q?tNGfZNJouc6j890wBFL5FFs8uRNgQXLtI9NvGjX39Ddn0eLYPEyesz+HlEpj?=
 =?us-ascii?Q?X0k5oExqQJeMUPwUTF4L5ymjA/j6AazgJb6XlKISQ/T1ma8DmYYOKjiu9pxH?=
 =?us-ascii?Q?3Ztxz+HS2sUhHuU3/jYuqwFEfIM+sj744ENmTWI+s+blptJ9g4cmjpHE9qQn?=
 =?us-ascii?Q?GW+WhqoQeLXqxR6VbS+GKpaBTktUfOwY4z9NOASpPd0Z5/fVWQ08rVNM9+50?=
 =?us-ascii?Q?6XD5+yu83hqGXud8VZYalGXtwtlSS3wBjdun85RTe6DEZ+KmcpBMQYt9nERb?=
 =?us-ascii?Q?NixhWoCtmjGw7lJJOFUrtqKM9lhPKgjJIzZuNxGOSKyz7xfKjOjPsjRdK010?=
 =?us-ascii?Q?OzcmdXSxF8+POoQmmH9yoHJuyuy98jiBgwM2kDDCoiT7Y0zXZp9EU/mRiHYP?=
 =?us-ascii?Q?3dXF5SiBBQ6zD6kKpSx+eXeVx26NsJ73PilKuyZEqnJv4YrQIdJjiBeIXA1W?=
 =?us-ascii?Q?pklXelrxbjAfmXarodhiTHyhqC9SiCGAYerioAXtNsLuRrXAsPisIj+yDTXy?=
 =?us-ascii?Q?IW29TltNXQECVqCTHrsU2KAspDfzJuE8dLZDXcLCkFgbJ7PJo3i+2jzlcqAq?=
 =?us-ascii?Q?2b2uBXxk4lR2dkG/rr90NTLG3pi8lSfSNBluyTjXlLoaCeCzQr8YRdx5CFh7?=
 =?us-ascii?Q?6yiz9sbPw8W5PQ/1dwObT5El4O23xpTE/MxZjiDQiGztgiEQd7uUDMPueZj2?=
 =?us-ascii?Q?4KBPOC7pxSONyZhVisbI6iOFNp/rFAGQL+eVZ1C0dC1JZYeQ3don17GGildX?=
 =?us-ascii?Q?wEvcwYLi2qF3Qta04/Rj1RdbLvVH+6auT5GSZYUFR9Q5ChNolwu7q1h5f+N8?=
 =?us-ascii?Q?KAwp9dDN4N1nWUr+xCUcUyIhXgByT5WDvjXaFlrMd2hbSvoG9024rW7AQtEa?=
 =?us-ascii?Q?UO0Xww2Y4T7zcaZOfIdr9XOyVlD8T90sxs4vejszb10eiJVrw0UxeF0EjgQ3?=
 =?us-ascii?Q?b3GYtK/lY2cv7Ku2vziXA1rdmibL06sVw68GU+FvmpAgzDnz3mbGIe+0OE1p?=
 =?us-ascii?Q?jPMdIdZ48zoqHnivyMV4PBJlQbmq0wnbLrIZkyloQFwSqV7tMSCUgB+G/gnn?=
 =?us-ascii?Q?/KlcJ10OPwyeNP6dbCHer+8+2h4AbjD06GhLQKWryvoW9YvVstsgEKygxXnb?=
 =?us-ascii?Q?tWvo6c8wwMDImQDlqjgtWvPQ6eIi43gsxhSZKDFQbjsCJbkLdnhgKv4gk7fd?=
 =?us-ascii?Q?owzcwvbC2Uq9b4i5nVJjjKpBEmuqBI9a/Pck5XKJJokG3MYPeDlVud6c97ap?=
 =?us-ascii?Q?pnUFjFVjgWQ8Dr9pbFr+10UC2oIs?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GaS/dFt6e9NESQoFBr8OxtCi3lDW5VsedIaOiWm1obGK5M3tKoQuFFn9KHYL?=
 =?us-ascii?Q?DiZlg3nx7AR9QXs74cmDmOBnrihdgoEFu6l6cllXjtAc3y92HD+gsIW5sb/5?=
 =?us-ascii?Q?qAXGvSN28HqpHkd8BZ87m4cs56bSMGcMZYj2A2XjR7npun6uuevtmTrehsR8?=
 =?us-ascii?Q?d3qskFNILpG2oMsA4Ui1HH8gyc7JN03wT0X/fwFLW4gPonOfcbDnZqigHSyH?=
 =?us-ascii?Q?uhSgG9WRqInQ1VHUFc0GP/HKMBSPYYXKYGMTfAgbIauvoFmXryG3BaKSyr35?=
 =?us-ascii?Q?FXen9wvNruGJvjY3S3QsZqj93PAZjf1PUi0r8B6sX3bwriB3rAHIhvjcrLCH?=
 =?us-ascii?Q?EwMf9f8iGxXFGJ4uYN482qyW2BB3hsT1KXXkGehB4v+pnz6IioHjXawZ1yYc?=
 =?us-ascii?Q?jBsezI6JsO08Qc29trIvhHuP8OWGmwuGRX28xw5SNIbzBm7HcCPNUcSgX3TK?=
 =?us-ascii?Q?7XUrX5PPjAeNoPiOQbM9amee0IqVh0Fm1BDpqLy8v3oo9XZrMAU1pCyeljCg?=
 =?us-ascii?Q?FcUpR8YKVlwhVvLBfcnsniHNOQOHuTEoTktgu2eWrGbkL9OxdtSQG5Z0hLNU?=
 =?us-ascii?Q?iddmUsZbacEW0r/E+yegTJ5m7KGqav55AUHdRpvqN3D4TvN/+Yo0RczlGyUc?=
 =?us-ascii?Q?WNnX2e0GrCqqyLUt5gLJjdmKeatj9PNEWlgpioxu25cAke70TIbDAis/QRnS?=
 =?us-ascii?Q?nPxPFyu+kGLtEyIX91Fkie2FRrOFV4o28W/11PH2WM9av/ikY7KaoFRgVjXJ?=
 =?us-ascii?Q?N49O8XiHIKB2G6Gyudvmzjk5Jhqw/3iYHevug+Xho/zA77hK1wwtz4UOBBvF?=
 =?us-ascii?Q?UNCxgcudAMyaRT6DZF/oY+P43z9BiFxVAG1s21TI4BrxLvRCTq1VlrbUQNgS?=
 =?us-ascii?Q?qV4br4MoFVzAmLSBRI8/7Z+fy0PksAn1PI7/C4r6/WsHkwlsM3qzRt9jwFLg?=
 =?us-ascii?Q?4rusl378xamPhY8IhXQNhLznDh069sM0oBRK8bc7ajnrdiXgQy/ZDbODpDLX?=
 =?us-ascii?Q?640kIuK7ydj9XmqJgnHGhij8ipkYXdpbK50z1pj7yi+2fpmm/bYjaAVyQ0hi?=
 =?us-ascii?Q?ZzDUnk0AoLtba+jThnSpjpNXusW6/xW46LSFCJgBnGV8fFKf7plVkqVckBsx?=
 =?us-ascii?Q?+84gu7HS0NzHBB6idWfV5YQXfYT4Y5LTalQcQ3Lb5HDnGqzUrO7p0aWRPCL7?=
 =?us-ascii?Q?vNqIca6QXqGn1dh7pMDPngYFIcKrCSgGRhUPe0/cwwDccSZY7u5jqcpvZ6D9?=
 =?us-ascii?Q?7CA52Hkzi74LBUs5RiJEs+2FrTRYIXNoTvEzhJD87DKo/XsqHB7LTFdsyqc5?=
 =?us-ascii?Q?V5Km2ObCIOs/CGvllm+umuqneByNcTcipZ7aVajgQG7rKdXUlNCofIJYt4KP?=
 =?us-ascii?Q?Bjekt7bcRbIQuW8PzeqVPr5UYydUjQD83VH8qFKMy/P7itdIUVNo1rzXcVrN?=
 =?us-ascii?Q?mv/AGhVtcDps8wmjDYcw4ydofXEqToZC6IIJZdvWy/SmuJQp9lkS+pDqJX2e?=
 =?us-ascii?Q?eWubPmK+V5VonR63o+3l0ypktD1KDoBNX7GokgroTcosQVsfr+U88ChlZKM3?=
 =?us-ascii?Q?nyljJR2YuiGQAyAtKUDQ5jaK+9VZzufMVaoYFBrI4VihsykcibUveW0i3kiC?=
 =?us-ascii?Q?QQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e7668bb-e5b1-42f3-05b4-08dd36e18c74
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 10:27:30.9605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TqpBAAQRN7IWi08BRNbmNL706ly8xRI/3/GSTQzLhXY7ewLWNTWoJwU/Mz7qO8aT8WS9xJU7/xbA9QDy6j5qFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4719
X-Proofpoint-ORIG-GUID: _e47WzPhe9eXILLmwY3Dvco_fzKT5tgW
X-Authority-Analysis: v=2.4 cv=SeoNduRu c=1 sm=1 tr=0 ts=678a3096 cx=c_pps a=NZTPE88KBhpz0z3fOSYQ1w==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=ICRX-_T3RLZKeFDtdnMA:9 a=L4ybAgwKF3oDl8m8:21 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: _e47WzPhe9eXILLmwY3Dvco_fzKT5tgW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_04,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501170083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jan 2025 10:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209982

From: Chen Qi <Qi.Chen@windriver.com>

This patch adjusts Richard's patch a little bit:
https://lists.openembedded.org/g/openembedded-core/message/209927

The adjustments mainly includes:
1) Use bb.event.RecipeTaskPreProcess to do the replacement.
2) Do replacements for every task's "[depends]".
3) Use "virtual/nativesdk-cross-" instead of "virtual/cross-sdk-".

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes-global/base.bbclass              | 28 ++++++++++++++++++-
 meta/classes-global/staging.bbclass           |  2 +-
 meta/classes/multilib_global.bbclass          |  6 ++++
 .../conf/distro/include/default-providers.inc |  1 +
 meta/conf/distro/include/tcmode-default.inc   | 10 +++----
 .../binutils/binutils-cross-canadian.inc      |  2 +-
 .../binutils/binutils-cross.inc               |  1 -
 .../binutils/binutils-crosssdk_2.43.1.bb      |  2 --
 .../gcc/gcc-cross-canadian.inc                |  2 +-
 meta/recipes-devtools/gcc/gcc-cross.inc       |  1 -
 meta/recipes-devtools/gcc/gcc-crosssdk.inc    |  4 +--
 meta/recipes-devtools/gcc/gcc-runtime.inc     |  2 +-
 .../gdb/gdb-cross-canadian.inc                |  2 +-
 .../recipes-devtools/go/go-cross-canadian.inc |  2 +-
 meta/recipes-devtools/go/go-crosssdk.inc      |  2 +-
 .../rust/rust-cross-canadian.inc              |  2 +-
 16 files changed, 49 insertions(+), 20 deletions(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index dbbf6cef8c..c174383f05 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -267,10 +267,36 @@ def buildcfg_neededvars(d):
         bb.fatal('The following variable(s) were not set: %s\nPlease set them directly, or choose a MACHINE or DISTRO that sets them.' % ', '.join(pesteruser))
 
 addhandler base_eventhandler
-base_eventhandler[eventmask] = "bb.event.ConfigParsed bb.event.MultiConfigParsed bb.event.BuildStarted bb.event.RecipePreFinalise bb.event.RecipeParsed"
+base_eventhandler[eventmask] = "bb.event.ConfigParsed bb.event.MultiConfigParsed bb.event.BuildStarted bb.event.RecipeTaskPreProcess bb.event.RecipeParsed"
 python base_eventhandler() {
     import bb.runqueue
 
+    if isinstance(e, bb.event.RecipeTaskPreProcess):
+        # remapping virtual/xxx
+        pn = d.getVar("PN")
+        virtprovs = (d.getVar("RECIPE_VIRTUAL_PROVIDERS") or "").split()
+        depends = (d.getVar("DEPENDS") or "").split()
+        newdeps = []
+        for dep in depends:
+            if dep in virtprovs:
+                newdep = d.getVar("PREFERRED_PROVIDER_" + dep)
+                if not newdep:
+                    bb.fatal("PREFERRED_PROVIDER_%s not set" % dep)
+            else:
+                newdep = dep
+            newdeps.append(newdep)
+        d.setVar("DEPENDS", " ".join(newdeps))
+        tasks = d.getVar("__BBTASKS", False)
+        for task in tasks:
+            task_deps = (d.getVarFlag(task, "depends") or "").split()
+            remapped_deps = []
+            for task_dep in task_deps:
+                r, t = task_dep.split(":")
+                if r in virtprovs:
+                    r = d.getVar("PREFERRED_PROVIDER_" + r)
+                remapped_deps.append("%s:%s" % (r, t))
+            d.setVarFlag(task, "depends", " ".join(remapped_deps))
+    
     if isinstance(e, bb.event.ConfigParsed):
         if not d.getVar("NATIVELSBSTRING", False):
             d.setVar("NATIVELSBSTRING", lsb_distro_identifier(d))
diff --git a/meta/classes-global/staging.bbclass b/meta/classes-global/staging.bbclass
index a8d66481f3..1008867a6c 100644
--- a/meta/classes-global/staging.bbclass
+++ b/meta/classes-global/staging.bbclass
@@ -127,7 +127,7 @@ do_populate_sysroot[vardepsexclude] += "BB_MULTI_PROVIDER_ALLOWED"
 
 POPULATESYSROOTDEPS = ""
 POPULATESYSROOTDEPS:class-target = "virtual/cross-binutils:do_populate_sysroot"
-POPULATESYSROOTDEPS:class-nativesdk = "virtual/sdk-binutils:do_populate_sysroot"
+POPULATESYSROOTDEPS:class-nativesdk = "virtual/nativesdk-cross-binutils:do_populate_sysroot"
 do_populate_sysroot[depends] += "${POPULATESYSROOTDEPS}"
 
 SSTATETASKS += "do_populate_sysroot"
diff --git a/meta/classes/multilib_global.bbclass b/meta/classes/multilib_global.bbclass
index c95c3a586d..3ffdb3e757 100644
--- a/meta/classes/multilib_global.bbclass
+++ b/meta/classes/multilib_global.bbclass
@@ -155,6 +155,12 @@ def preferred_ml_updates(d):
             extramp.append(translate_provide(pref, p))
     d.setVar("BB_MULTI_PROVIDER_ALLOWED", " ".join(mp + extramp))
 
+    virtprovs = d.getVar("RECIPE_VIRTUAL_PROVIDERS").split()
+    for p in virtprovs.copy():
+        for pref in prefixes:
+            virtprovs.append(translate_provide(pref, p))
+    d.setVar("RECIPE_VIRTUAL_PROVIDERS", " ".join(virtprovs))
+    
     abisafe = (d.getVar("SIGGEN_EXCLUDERECIPES_ABISAFE") or "").split()
     extras = []
     for p in prefixes:
diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 506d77811f..a5867d42c9 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -1,6 +1,7 @@
 #
 # Default virtual providers
 #
+RECIPE_VIRTUAL_PROVIDERS = "virtual/cross-cc virtual/cross-c++ virtual/cross-binutils virtual/compilerlibs virtual/nativesdk-cross-cc virtual/nativesdk-cross-c++ virtual/nativesdk-cross-binutils virtual/nativesdk-compilerlibs"
 PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/xserver-xf86 ?= "xserver-xorg"
 PREFERRED_PROVIDER_virtual/egl ?= "mesa"
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index cb734dc524..51a2723a62 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -5,17 +5,17 @@
 PREFERRED_PROVIDER_virtual/cross-binutils = "${MLPREFIX}binutils-cross-${TARGET_ARCH}"
 PREFERRED_PROVIDER_virtual/cross-cc = "${MLPREFIX}gcc-cross-${TARGET_ARCH}"
 PREFERRED_PROVIDER_virtual/cross-c++ = "${MLPREFIX}gcc-cross-${TARGET_ARCH}"
-PREFERRED_PROVIDER_virtual/compilerlibs = "gcc-runtime"
+PREFERRED_PROVIDER_virtual/compilerlibs = "${MLPREFIX}gcc-runtime"
 PREFERRED_PROVIDER_gdb = "gdb"
 
 PREFERRED_PROVIDER_virtual/cross-binutils:class-nativesdk ?= "binutils-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/cross-cc:class-nativesdk = "gcc-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/cross-c++:class-nativesdk = "gcc-crosssdk-${SDK_SYS}"
 
-PREFERRED_PROVIDER_virtual/cross-sdk-binutils ?= "binutils-crosssdk-${SDK_SYS}"
-PREFERRED_PROVIDER_virtual/cross-sdk-cc = "gcc-crosssdk-${SDK_SYS}"
-PREFERRED_PROVIDER_virtual/cross-sdk-c++ = "gcc-crosssdk-${SDK_SYS}"
-PREFERRED_PROVIDER_virtual/sdk-compilerlibs = "nativesdk-gcc-runtime"
+PREFERRED_PROVIDER_virtual/nativesdk-cross-binutils ?= "binutils-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/nativesdk-cross-cc = "gcc-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/nativesdk-cross-c++ = "gcc-crosssdk-${SDK_SYS}"
+PREFERRED_PROVIDER_virtual/nativesdk-compilerlibs = "nativesdk-gcc-runtime"
 
 # Default libc config
 PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
index a322114b52..c1fda1a465 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
@@ -4,7 +4,7 @@ SUMMARY = "GNU binary utilities (cross-canadian for ${TARGET_ARCH} target)"
 PN = "binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 BPN = "binutils"
 
-DEPENDS = "flex-native bison-native virtual/cross-sdk-cc virtual/nativesdk-libc nativesdk-zlib nativesdk-gettext nativesdk-flex"
+DEPENDS = "flex-native bison-native virtual/nativesdk-cross-cc virtual/nativesdk-libc nativesdk-zlib nativesdk-gettext nativesdk-flex"
 EXTRA_OECONF += "--with-sysroot=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS} \
                 --enable-poison-system-directories \
                 "
diff --git a/meta/recipes-devtools/binutils/binutils-cross.inc b/meta/recipes-devtools/binutils/binutils-cross.inc
index b908393c1f..9c371e7e13 100644
--- a/meta/recipes-devtools/binutils/binutils-cross.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross.inc
@@ -1,5 +1,4 @@
 inherit cross
-PROVIDES = "virtual/cross-binutils"
 
 PN = "binutils-cross-${TARGET_ARCH}"
 BPN = "binutils"
diff --git a/meta/recipes-devtools/binutils/binutils-crosssdk_2.43.1.bb b/meta/recipes-devtools/binutils/binutils-crosssdk_2.43.1.bb
index afc91a9b3b..6752659304 100644
--- a/meta/recipes-devtools/binutils/binutils-crosssdk_2.43.1.bb
+++ b/meta/recipes-devtools/binutils/binutils-crosssdk_2.43.1.bb
@@ -1,7 +1,5 @@
 require binutils-cross_${PV}.bb
 
-PROVIDES = "virtual/cross-sdk-binutils"
-
 inherit crosssdk
 
 PN = "binutils-crosssdk-${SDK_SYS}"
diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
index a97329e58f..9b55ec21e0 100644
--- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
@@ -3,7 +3,7 @@ inherit cross-canadian
 SUMMARY = "GNU cc and gcc C compilers (cross-canadian for ${TARGET_ARCH} target)"
 PN = "gcc-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
-DEPENDS = "virtual/cross-sdk-cc virtual/cross-cc virtual/cross-sdk-binutils virtual/nativesdk-libc nativesdk-gettext flex-native virtual/libc"
+DEPENDS = "virtual/nativesdk-cross-cc virtual/cross-cc virtual/nativesdk-cross-binutils virtual/nativesdk-libc nativesdk-gettext flex-native virtual/libc"
 
 GCCMULTILIB = "--enable-multilib"
 
diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index 4549f92c2f..7afdf58577 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -3,7 +3,6 @@ inherit cross
 INHIBIT_DEFAULT_DEPS = "1"
 EXTRADEPENDS = ""
 DEPENDS = "virtual/cross-binutils ${EXTRADEPENDS} ${NATIVEDEPS}"
-PROVIDES = "virtual/cross-cc virtual/c++"
 python () {
     if d.getVar("TARGET_OS").startswith("linux"):
         d.setVar("EXTRADEPENDS", "linux-libc-headers")
diff --git a/meta/recipes-devtools/gcc/gcc-crosssdk.inc b/meta/recipes-devtools/gcc/gcc-crosssdk.inc
index 1adce65cf8..4397dd898d 100644
--- a/meta/recipes-devtools/gcc/gcc-crosssdk.inc
+++ b/meta/recipes-devtools/gcc/gcc-crosssdk.inc
@@ -8,7 +8,7 @@ SYSTEMLIBS1 = "${SDKPATHNATIVE}${libdir_nativesdk}/"
 
 GCCMULTILIB = "--disable-multilib"
 
-DEPENDS = "virtual/cross-sdk-binutils gettext-native ${NATIVEDEPS}"
-PROVIDES = "virtual/cross-sdk-cc virtual/cross-sdk-c++"
+DEPENDS = "virtual/nativesdk-cross-binutils gettext-native ${NATIVEDEPS}"
+PROVIDES = "virtual/nativesdk-cross-cc virtual/nativesdk-cross-c++"
 
 gcc_multilib_setup[vardepsexclude] = "MULTILIB_VARIANTS"
diff --git a/meta/recipes-devtools/gcc/gcc-runtime.inc b/meta/recipes-devtools/gcc/gcc-runtime.inc
index 7380123ab6..291ace2d09 100644
--- a/meta/recipes-devtools/gcc/gcc-runtime.inc
+++ b/meta/recipes-devtools/gcc/gcc-runtime.inc
@@ -157,7 +157,7 @@ do_install:append:class-target () {
 
 INHIBIT_DEFAULT_DEPS = "1"
 DEPENDS = "virtual/cross-cc virtual/cross-c++ ${MLPREFIX}libgcc virtual/${MLPREFIX}libc"
-DEPENDS:class-nativesdk = "virtual/cross-sdk-cc virtual/cross-sdk-c++ ${MLPREFIX}libgcc virtual/${MLPREFIX}libc"
+DEPENDS:class-nativesdk = "virtual/nativesdk-cross-cc virtual/nativesdk-cross-c++ ${MLPREFIX}libgcc virtual/${MLPREFIX}libc"
 PROVIDES = "virtual/${MLPREFIX}compilerlibs"
 
 BBCLASSEXTEND = "nativesdk"
diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
index b4b6742d13..9150c196a8 100644
--- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
@@ -7,7 +7,7 @@ PN = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 BPN = "gdb"
 
 DEPENDS = "nativesdk-ncurses nativesdk-expat nativesdk-gettext nativesdk-gmp nativesdk-mpfr \
-           virtual/cross-sdk-cc virtual/cross-sdk-binutils virtual/nativesdk-libc"
+           virtual/nativesdk-cross-cc virtual/nativesdk-cross-binutils virtual/nativesdk-libc"
 
 GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
 
diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/recipes-devtools/go/go-cross-canadian.inc
index 7be6fe778f..ff6c063d69 100644
--- a/meta/recipes-devtools/go/go-cross-canadian.inc
+++ b/meta/recipes-devtools/go/go-cross-canadian.inc
@@ -1,7 +1,7 @@
 inherit cross-canadian
 
 DEPENDS = "go-native virtual/${HOST_PREFIX}go virtual/nativesdk-${HOST_PREFIX}go-runtime \
-           virtual/cross-sdk-cc virtual/nativesdk-libc \
+           virtual/nativesdk-cross-cc virtual/nativesdk-libc \
            virtual/nativesdk-compilerlibs"
 PN = "go-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
diff --git a/meta/recipes-devtools/go/go-crosssdk.inc b/meta/recipes-devtools/go/go-crosssdk.inc
index f2a0521ccf..4f19025ba7 100644
--- a/meta/recipes-devtools/go/go-crosssdk.inc
+++ b/meta/recipes-devtools/go/go-crosssdk.inc
@@ -1,6 +1,6 @@
 inherit crosssdk
 
-DEPENDS = "go-native virtual/cross-sdk-cc virtual/nativesdk-compilerlibs virtual/cross-sdk-binutils"
+DEPENDS = "go-native virtual/nativesdk-cross-cc virtual/nativesdk-compilerlibs virtual/nativesdk-cross-binutils"
 PN = "go-crosssdk-${SDK_SYS}"
 PROVIDES = "virtual/${TARGET_PREFIX}go"
 
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index 0c2f6144b8..25c0e64ba1 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 
 MODIFYTOS = "0"
 
-DEPENDS += "virtual/cross-sdk-cc virtual/nativesdk-libc virtual/nativesdk-compilerlibs"
+DEPENDS += "virtual/nativesdk-cross-cc virtual/nativesdk-libc virtual/nativesdk-compilerlibs"
 
 SRC_URI += "file://target-rust-ccld.c"
 LIC_FILES_CHKSUM = "file://target-rust-ccld.c;md5=af4e0e29f81a34cffe05aa07c89e93e9;endline=7"
-- 
2.25.1


