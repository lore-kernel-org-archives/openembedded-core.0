Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AEE7C28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 14:30:57 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.12536.1743172247130664084
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Mar 2025 07:30:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=61826d4890=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52SC02rd018238
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 07:30:46 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45n7v7hau8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 07:30:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nyLt09q1qlvBwL3s0XTegTMe5px5ivTJL46Mz7QI8vCM2+OqGNIlo8IzOZgVxU4z28ox5tetpci1ZWjnySXACWlx9KFgo7UOo5ohEueCRU0pP787yi3thRT31MamoM+Tmj8b2QG4NHNNexZB+7kNDKUvc45h/lP5rjNtTNy6hcQVTqyfD9nTKqIi+LGvUlToSvls/t74fHTYqUfx18t4ktNpRwwNscxu8BubhIjniqE8VdHTqZ8/7JxwUrwbUPrpyR+4CtgcvKjoh1aQvhPa0l6I0Cppcfqj1G+8GyZBF50yQHJe01cxnG97VGMEV7+wmm7RMjCebvB8gYi85QSmGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+NoLazolGb9L4ngev0NCJCGOmFnAVzCkG8kEuDP0XaU=;
 b=qYGdusaTFku+Cp9Gar6mSyarXwxFgKOgaVdna0vtjwo5Tw308QzRl85SriyDGxWtEFJP+ALqnTiNaV6QWGUZX+WnB0UtmeYfDQ2AfE3n7KVdX/8+2NErkfdUZl5j1u4V6q1ku7BysVK3NywDT368aiAd5i3GkaA9oH0FFnnRc2yHLFenAYhz9neL8WzRWi8rZssYfKpKf1Z6/q6vFrik1dsFBQT5FB9+ROhJgz1JmaP4QKWa5NneUwm/xe3BboCNkTyz2DTt4Opkzk+VNYqN+fGqs5ZDDvs2tjr+PcPTzbsPrAfLqBDqGBNi6161cdAUd3jCKky8oXdxMjR+/zLXuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by DS7PR11MB6247.namprd11.prod.outlook.com (2603:10b6:8:98::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Fri, 28 Mar
 2025 14:30:44 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%3]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 14:30:44 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        Yash.Shinde@windriver.com
Subject: [PATCH 3/3] rust: Upgrade 1.85.0->1.85.1
Date: Fri, 28 Mar 2025 07:30:03 -0700
Message-ID: <20250328143005.880998-3-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328143005.880998-1-Yash.Shinde@windriver.com>
References: <20250328143005.880998-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ROAP284CA0003.BRAP284.PROD.OUTLOOK.COM (2603:10d6:10:c::8)
 To PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|DS7PR11MB6247:EE_
X-MS-Office365-Filtering-Correlation-Id: cfdb2af8-91ca-418d-445f-08dd6e051f70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QszlyViSQ7u2+k1yWBlnkO/XuhqPBm9H+PR7slEaXrhWIswVzoVHwRvoa3Y0?=
 =?us-ascii?Q?1iE4Tj1SB4V4/wzWp2dnQZJ4WYQxOl1Dxxa7OlSgI038eWlJMl/fyg/tZpY4?=
 =?us-ascii?Q?2VHL6F19bKn/7/dzMQrg11XD25yB9VVtFBFQEU3JcVoiqkvs3QtpKUmsMx2Z?=
 =?us-ascii?Q?NzCNPu3+VvsEd1zyBaT//l0ZWnudp0qDxBXLTeFNIiIQE5kHHIYCO4ukXa3n?=
 =?us-ascii?Q?Ad5ANmTnwEoFUptcEmScsifm9UVHw0A1jUCv/OPJjlz6OKHgnuiso1bMCYKm?=
 =?us-ascii?Q?2owsZxQu7ATSDV5IfJ/KDYgLPHeuxkX1aBNUl9sJQ4vFzlpmiNu7m+rcsNGJ?=
 =?us-ascii?Q?ZmsRSiI+/E+dVtEdebOCrl/ptJC/lOh96CQ7nsLUGJ47bTOvHVX1vyKhDzd0?=
 =?us-ascii?Q?jAADFmNPOrDymQNxR2DTuW5DwMOgIZ2/rCyEy6TuL/arEB19DpT0qJfS3zJf?=
 =?us-ascii?Q?GHq3p0QfQofokWMqe3+PWOaEJwgSLijETbhkzo1FC2qSWKDFc7aJQZksvOJp?=
 =?us-ascii?Q?7saHd8xcZ8+yRmKs4wbdsejQpRBvRswHr5dR8IjhnmbSkuc7Kh1eiH/d4/Mk?=
 =?us-ascii?Q?DQcJQc2vQGqOWQm7Njxiiy7eHBJbwOO1ELhwXYRfj8JvqJR23sskGoEc/PHo?=
 =?us-ascii?Q?7/7+q/izihGvRfFLG3ON/SAfkN48RMD9GS/2JfhtHEELIHAtnnkGWfuINhso?=
 =?us-ascii?Q?KGCHo+Ocgt/9lZicc/Izxz+ptYg7R07J8VA2HywpCSb/6Ndq5rUTy2XvEH3r?=
 =?us-ascii?Q?osRugj4A5rC6AgoH/Tm6I4QO65vPtnauRCf/8aLUkn+V/n3y6URl1Kc1Yxf0?=
 =?us-ascii?Q?ScA/fJ+237+99rZeYuSrj/HGJxn8Bj6znVs0tVUzcjbdsDsqU/GzPfetQ/D2?=
 =?us-ascii?Q?ydynKInOZLgZT+k7BpX6/WYLumgkreQ9zMwybCb3CcIbzELulS19Yj+Q8ZH3?=
 =?us-ascii?Q?JueTuzXKxYv5swfI7DMAdRsx2pxltblvJQFvWWXqutJCIsm2v+SmFpZCEr7S?=
 =?us-ascii?Q?RP/M8h5XnBz30/GbhtdI5+uoIzQ3HWByMw6UZb7OoF9Biqilryh/njsQUIE5?=
 =?us-ascii?Q?jQnl/7/wztmNZBtrnDWb61n1XUS9Vtwlj5iokRmYQWxJWbC4/A6MjODSwOHR?=
 =?us-ascii?Q?NJAYJUfWqv9h9m5aGUKsbGUxostyXzuqioV7KNTlc2BYyeO8OQTPJmtRKIYF?=
 =?us-ascii?Q?VMQdUvlvbYEGfitNBfnGB0ddaPFZHOYFT2qtECb8J7jK2ZPNAXrYviwdsUYE?=
 =?us-ascii?Q?hgc6F7qznlvBBNTH2jYQYezoqRC7VdDTPCyb/qSPsK2s28PAEI2RcR/dU5Cz?=
 =?us-ascii?Q?4QT2t1AUBmMHHNRhU4K7xfYq6/FTreqow13JeS+NPGbguEj6YBPYwbG+vQxx?=
 =?us-ascii?Q?FxCquESYKQaND6eSKlnq6WXiL/G9Dz/p/ZjqXS2W98v3raSqbg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tw+TbOFCGxBki198gR/pqplkhH7byoWnAdS17s0SwcR2/gwtkNe+V64wSvzb?=
 =?us-ascii?Q?D3HJl6YYZGbzHfcHu/zuZb5QCrskPNjl7c44qvNXWgh0c1+qJ5JYrvVuyf/L?=
 =?us-ascii?Q?OpwSH+52zo8oPIGF/0PD4o4gPL3RUl/qoNrYd8TF5z4OyT3vfANh23lLdlhO?=
 =?us-ascii?Q?cjaPmrI5/tMGG0iXCQSkFFETbyJVK0yRoTtrAiUlWx25x2ov+zc9nGylbOMN?=
 =?us-ascii?Q?5KjOv3pOqq4yDWGYkv+d/3qjIN5bcgJHIcDII7YiE6+6pKgfd+f7uMicsZJM?=
 =?us-ascii?Q?gGNv+G+qtfJV5LrXKJNyMFu8YwySgOhoBEIspJqom6Lo/OHUG2nVpr50YVad?=
 =?us-ascii?Q?OMsFmDJBbRCy2VnmviBv4SlpQIXFYC+B49tmvb4fwniyLWv59Urk1KiCNLLQ?=
 =?us-ascii?Q?wBuTpiWw+1qahcDeAs5P5Lvq3qfIW8mo/oQ12ZSo/GCpPlEpx5PSIjPDcETf?=
 =?us-ascii?Q?Ve+al5WFSEUh3Of1Wjiti/2+yJFlPXE8wRif3pMQktKC92n9F0Ek+EI1xcYd?=
 =?us-ascii?Q?n0bdf/bcGMgjVkLoD+qblhY6qcm6+sjdmqSCjJCRXC/nZow5xIqeVdxOtzuW?=
 =?us-ascii?Q?RuReRc6wv9ThvHddOwEow0Lc4tcvj8Pld7Ota8UOmO854eYefEfsB4s5Q1GG?=
 =?us-ascii?Q?cmyoynEggrwirMmkianIf6j0/YQzo+QZ+zeI8Hg4pRhYaeOB8OWneH51WhS0?=
 =?us-ascii?Q?K+82wKEN8onk2CIkLOV61kX+7Vw+l30PDig7BOEgqW76ds7UZSS/pu8Q/2cc?=
 =?us-ascii?Q?4ZwHLgzoK2BHJrAuYi27HpTKUP9IKM8ZjCtpY4gdJdc9ot4FcwW2eCU1NqFm?=
 =?us-ascii?Q?+jfrcPY6gZuiNnCjxOx/8BPfjTxNcr8vpfEdhWrrth2kkar3MJQEqzvAh6hh?=
 =?us-ascii?Q?e2XDd3kq0ZtbMdpO0lpZOGL3rNcyFYrO/B+R0DmWc9AnouzG0tg8kqAh6KGP?=
 =?us-ascii?Q?T1ZYVIUNCnTzCtw9SNaXYqg9QGrMsfxaYz53Rvoazhy1EZRI5DacJcVfL/8H?=
 =?us-ascii?Q?FhPjvdbbHjbob/7tXkkQQc4m0YKdZI0RQ1XtwQwELTS3qApeTzYoPfKvm9hI?=
 =?us-ascii?Q?3LjwI5LFeH3ofbhMfoA0rgS7A0fSRSArLH9F4luGqyORW1sIfVROMH47KuLo?=
 =?us-ascii?Q?pIbMOwYUH6yLDUcnNtSsSTrLNwWxJ+nNQ3iFEyDDekMdI6+XzYnZ3MZBKt4e?=
 =?us-ascii?Q?EHVWnLrivTd9DlXmcjwucCj2GYzRTDdNlNq1JejltZ4Zh5Vfd8747aaTa8gA?=
 =?us-ascii?Q?2qBnMyx8Pkgjpkx7xUwatPpDOoQ/7rsu24LQjQcjjZ/lnYrqrzrXFsh8pV0V?=
 =?us-ascii?Q?KcvdVvEJrl6JtDtx3IXE70HAsAabQmMGcz/ozo3rGSrLwrRJNLrZ/xw2cEGs?=
 =?us-ascii?Q?Kzu/9rrZ4Zoe2DiIuF8NDCxVRaBfZz1iKPoemi1pCk4nMtj3NnkUbVpcITXM?=
 =?us-ascii?Q?CQJhHi6ctoRwbSWJU7eW7MS2dZAwNfM9DFS+TSNlIAnx58UvmMJvj3rKh4K6?=
 =?us-ascii?Q?3oXNf1C9hCblOqAa/qARVSa/H7l1I72u+afKQvDdTnyGT3gH8ZS5hsRDwgPE?=
 =?us-ascii?Q?eKzMXmjhwF8RU03w+EbBrUKT3/xfb6wkuQL3hiW21UqrASsAT4Z/tyPcj5pe?=
 =?us-ascii?Q?0Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cfdb2af8-91ca-418d-445f-08dd6e051f70
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 14:30:44.1134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ks7JByxTIUlpMoUk9OR+WravhEO+TlyGogEvjDEv2LNpFt2xSO/2LkAJ1fBn/xaBAlEAJPieJX/7pQKP8Z0YrUlrX2oFuH9sgaoprq5DqdA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6247
X-Authority-Analysis: v=2.4 cv=bsdMBFai c=1 sm=1 tr=0 ts=67e6b296 cx=c_pps a=5b96o3JgDboJA9an2DnXiA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=qq54jUvTnKLytTDlvBMA:9 a=QdjJsVrtEpESJCbI:21 a=42jQ_h8IXvAA:10 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: le1oIDiNTaXacmvAhd5Fion_yo0gkSqp
X-Proofpoint-GUID: le1oIDiNTaXacmvAhd5Fion_yo0gkSqp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_07,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503280100
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Mar 2025 14:30:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213841

From: Yash Shinde <Yash.Shinde@windriver.com>

Rust stable version updated to 1.85.1
https://blog.rust-lang.org/2025/03/18/Rust-1.85.1.html

Dropped patches:
downgrade-bootstrap-cc.patch since it's merged with v1.85.1.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../rust/{cargo_1.85.0.bb => cargo_1.85.1.bb} |  0
 .../rust/files/downgrade-bootstrap-cc.patch   | 41 -------------------
 ...ibstd-rs_1.85.0.bb => libstd-rs_1.85.1.bb} |  0
 ....85.0.bb => rust-cross-canadian_1.85.1.bb} |  0
 ...ust-llvm_1.85.0.bb => rust-llvm_1.85.1.bb} |  0
 meta/recipes-devtools/rust/rust-source.inc    |  3 +-
 .../rust/{rust_1.85.0.bb => rust_1.85.1.bb}   |  2 +-
 8 files changed, 3 insertions(+), 45 deletions(-)
 rename meta/recipes-devtools/rust/{cargo_1.85.0.bb => cargo_1.85.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/rust/files/downgrade-bootstrap-cc.patch
 rename meta/recipes-devtools/rust/{libstd-rs_1.85.0.bb => libstd-rs_1.85.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.85.0.bb => rust-cross-canadian_1.85.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.85.0.bb => rust-llvm_1.85.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.85.0.bb => rust_1.85.1.bb} (99%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 6d6c146284..a3b3df2afa 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -12,7 +12,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 GCCVERSION ?= "14.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 GLIBCVERSION ?= "2.41%"
-RUSTVERSION ?= "1.85.0%"
+RUSTVERSION ?= "1.85.1%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/rust/cargo_1.85.0.bb b/meta/recipes-devtools/rust/cargo_1.85.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.85.0.bb
rename to meta/recipes-devtools/rust/cargo_1.85.1.bb
diff --git a/meta/recipes-devtools/rust/files/downgrade-bootstrap-cc.patch b/meta/recipes-devtools/rust/files/downgrade-bootstrap-cc.patch
deleted file mode 100644
index 3ae68720f9..0000000000
--- a/meta/recipes-devtools/rust/files/downgrade-bootstrap-cc.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Downgrade bootstrap cc version
-
-In rust v1.85.0, the upgraded cc version causes bootstrap
-to fail on custom targets. Downgrading the cc version fixes
-the error. This commit is merged with v1.85.1 and the patch
-can be dropped when upgraded to it.
-
-Upstream-Status: Backport [https://github.com/rust-lang/rust/pull/137460/commits/e4ca11f87ffca8c63aa56d45b46e62b6acc58bd7]
-
-Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
-diff --git a/src/bootstrap/Cargo.lock b/src/bootstrap/Cargo.lock
-index a47f3af60cb..890e64e2bab 100644
---- a/src/bootstrap/Cargo.lock
-+++ b/src/bootstrap/Cargo.lock
-@@ -88,9 +88,9 @@ dependencies = [
-
- [[package]]
- name = "cc"
--version = "1.2.0"
-+version = "1.1.22"
- source = "registry+https://github.com/rust-lang/crates.io-index"
--checksum = "1aeb932158bd710538c73702db6945cb68a8fb08c519e6e12706b94263b36db8"
-+checksum = "9540e661f81799159abee814118cc139a2004b3a3aa3ea37724a1b66530b90e0"
- dependencies = [
-  "shlex",
- ]
-diff --git a/src/bootstrap/Cargo.toml b/src/bootstrap/Cargo.toml
-index ed51862390d..2c1d85b01e6 100644
---- a/src/bootstrap/Cargo.toml
-+++ b/src/bootstrap/Cargo.toml
-@@ -37,7 +37,9 @@ test = false
- # Most of the time updating these dependencies requires modifications to the
- # bootstrap codebase(e.g., https://github.com/rust-lang/rust/issues/124565);
- # otherwise, some targets will fail. That's why these dependencies are explicitly pinned.
--cc = "=1.2.0"
-+#
-+# Do not upgrade this crate unless https://github.com/rust-lang/cc-rs/issues/1317 is fixed.
-+cc = "=1.1.22"
- cmake = "=0.1.48"
-
- build_helper = { path = "../build_helper" }
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.85.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.85.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.85.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.85.1.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.85.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.85.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.85.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.85.1.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.85.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.85.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.85.0.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.85.1.bb
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index e07055882c..8400a4875d 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -8,9 +8,8 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch;patchdir=${RUSTSRC} \
             file://revert-link-std-statically-in-rustc_driver-feature.patch;patchdir=${RUSTSRC} \
             file://Zdual-proc-macros-additional-check.patch;patchdir=${RUSTSRC} \
-            file://downgrade-bootstrap-cc.patch;patchdir=${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] = "d542c397217b5ba5bac7eb274f5ca62d031f61842c3ba4cc5328c709c38ea1e7"
+SRC_URI[rust.sha256sum] = "b1fbf809efe9f036939401e142631c201a53bcf43ec1696bd9f5290ba236a266"
 
 RUSTSRC = "${WORKDIR}/rustc-${RUST_VERSION}-src"
 
diff --git a/meta/recipes-devtools/rust/rust_1.85.0.bb b/meta/recipes-devtools/rust/rust_1.85.1.bb
similarity index 99%
rename from meta/recipes-devtools/rust/rust_1.85.0.bb
rename to meta/recipes-devtools/rust/rust_1.85.1.bb
index 5a181b059c..20272f612f 100644
--- a/meta/recipes-devtools/rust/rust_1.85.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.85.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Rust compiler and runtime libaries"
 HOMEPAGE = "http://www.rust-lang.org"
 SECTION = "devel"
 LICENSE = "(MIT | Apache-2.0) & Unicode-TOU"
-LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=c2cccf560306876da3913d79062a54b9"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=9c0fae516fe8aaea2fb601db4800daf7"
 
 inherit rust
 inherit cargo_common
-- 
2.43.0


