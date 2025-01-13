Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C262CE7719F
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 13:40:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.16723.1736775598109686634
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 05:39:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3108bd75fe=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DBNTgU023278
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 05:39:57 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2044.outbound.protection.outlook.com [104.47.70.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443s1phgww-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 05:39:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X/QDAyBKwCYs5xF3roWujM+CGtnw83O/mATcOVWdpU5YEKc2CNUZkoRGhMPRfdt4wX/+k4+cThWoHXXuk2UKXnLwYdyimz3Gcv//PkHah7kgDthKRGjNgifOHc8gIAWDK7soFxphccWdHuAp0VjR2/owhN0bu0nS/KdwQaqw7o6o2cHCyL/zcKe1iDSLE3jJBrgZMAzoXKDVXRRr3W44YtI7powSUsm29OCdb/RJRBafRkuiTGPxVBFRy2/P7W0crM0ZlJYOTWSnEOtPBJyLYxEzpvJXohejbWwcgC/dF95h9elckGrJd03t71EWO/McyxiCLHQ8w6kPj7FHeAL9Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjQvS3oBvzCVrVsYJXG+BbrPECTAmQ5Bngz0pjqPlKc=;
 b=OJmnNtHfLFaYqmyWp+JrkI+mTlIdQbBLhTljtxqj1efH/Z4ZpujD2t/23eb+hJKEgMbJNifmL/HLLHFO0px2wHJDgyutlHGE8vDj2A05Nglo6eFF6/+/NyC7lNnZMdkQSliPe3VyviLC6u9adL727E2MsPP2bj359JrXEHO0Q0gLTY8RKU3r0hEL2bzlx3ZzLdF3whEdBDU9ghnJXyZFkXK4SpnbfRHjoZzjFnPtZY47UtPvlCIpDM8TRUu7lqyuOGQO9m1REnD3VeiGa8/ZoqLsxE5szxSRqblrlSafOOgbCDg+eE33CIEfuBy6PBXBTo3JFQVv0AnGLoz3V6sj1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 13:39:51 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 13:39:51 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH V4 1/3] rust-target-config: Update data layout x86,ppc,riscv64,aarch64,loongaarch64 targets.
Date: Mon, 13 Jan 2025 05:39:34 -0800
Message-ID: <20250113133936.2968211-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0083.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::24) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|PH0PR11MB5880:EE_
X-MS-Office365-Filtering-Correlation-Id: 7046348d-b16a-4cf4-97cf-08dd33d7c155
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Oy+QgbdaEqjyxbN6OCCNWvyTjq7m3QOPCSzL+1F8D/zBqnOEfyIDYATKZ6R1?=
 =?us-ascii?Q?CREtc3+lAnlaBUTvkc/4mjghyLN4P1DiIovjlx426DsHfiRZ/cqQupQA9DIB?=
 =?us-ascii?Q?MU0NzeMjQ27hn42l3KnFWkzWT5E+YB6nuP7MxGcrqN5408dlNiGeyBkz6DVW?=
 =?us-ascii?Q?aspfb09jym/UpMXPMo5V22e7EgXOQVAPK6Cuj1jqKYDNlH1HI77e1d8k0Eej?=
 =?us-ascii?Q?qsU0tgeYX4ZTZFXK9rnQUHTNvIfqWZ0rUXioUTpsslbw99rOjnYbKVfOI+F0?=
 =?us-ascii?Q?pDCtAQaaHEZRGqWdEVT8/FO5IYwoLut2BLqzAluUeoGRZ1zhFPsA7tt68Ksx?=
 =?us-ascii?Q?8Exdw07pbs7L+1ru4tKeZi1LE/yVYL2WEUsLcEdJbBPFcELKThq6eoI50w7b?=
 =?us-ascii?Q?teIPzj8d9VGbbSW1vyrQs2JgTYm243Mnk1g+Az/c1llZMMfntnzuuK2bA3UB?=
 =?us-ascii?Q?g2bvmBsADoU5fBC2lacKvevRuXSfStwPHsJ2AdRhkPrGqB108QSCCG610vYM?=
 =?us-ascii?Q?wG5w2wGDVkPwTgF4/KFduQ4vMZwb+K54a2shEA3S1EpEEqUpjYZMN9QRlgfU?=
 =?us-ascii?Q?OkM6quG9+WrmxJ4HR1YmGnphO0mrUpiCEEh7gzueLrEmeFQlBsMX47yG8/3t?=
 =?us-ascii?Q?JN80c1Sa2IqQUqpse/0AoM+vIwEuyxHRm6im6M2nukVlz0990UN2i9E4JOBZ?=
 =?us-ascii?Q?LyVf3MzP0ymje7X1U7/8vqx+HGy8BD9JCShM1Mz13cNubHTzYNeoMN5oJmog?=
 =?us-ascii?Q?BEnaVXF4CfvHwnPkTiJEPXHDqcS2RRcytswGu+FSfBw/rfJCcUIlW0Aahunq?=
 =?us-ascii?Q?3AsZE1MLnpmkGzLDrRdTLDR4AVEiLRvFK1jADBU+Zz54EOVk+UWatC+DatsN?=
 =?us-ascii?Q?bLsVwfcGyjFrgnwcSqO/el2n2M0qIPf6B6s3ityPs06RW0uL2ejoa9PF6g7A?=
 =?us-ascii?Q?exzf0fW9GUEhKEwgz0/h8KxU77BryaqWPw4T4b/EEIBdW6LBRSq7zqYH6rXV?=
 =?us-ascii?Q?lz/dWK1piHdqwMgEd4fP08VPc7VNTNQNavwsJXt37fnFjQ6OTO2qzKdbnTEp?=
 =?us-ascii?Q?s9WNRGJCFn4hFQSZdMxpJ8jWfZPFgr1ujsWPAEeMrjnDz7p0R5yvLZ52MK5x?=
 =?us-ascii?Q?fp7JHKdzqRn7+FgGsntkVPrtKDREybp0sjhIg1ljbuLWWVCwQcXbZBqhOY8n?=
 =?us-ascii?Q?fcNM2w3o4iBOQA37VrQQNb1usmuKTwlBCo+mOXXUDVuXJfIUVNty0EXTS+YG?=
 =?us-ascii?Q?MSkwdNqlfY/ct+EjZrFu1NIYbWAbKcN1PNMk8wVbC5GBhCQJ8YY1j8lxZlAQ?=
 =?us-ascii?Q?0ekMkjTSzG1fhmHoELwAZ/K6Azs614PWkzQmJZY0a5KLz7cYDZTWwNa7MOvH?=
 =?us-ascii?Q?Yy8RXYFjgXe09N53MF3ImTgnwIyPEeccKRrn0/DX9Es5THMzXNB4AJIgK/Db?=
 =?us-ascii?Q?rWnexO4etWfk99xH5AvWTRqGB35SEmKH?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?klPPbTtmdX/zeE3iZe9LkbKv51KbqsiSa+HN30COx/DKsmFPJmHL6ZREaQib?=
 =?us-ascii?Q?JD+KIQM6WmQs+fhRiQVv2ERDEgzipxSmL7BhurTbhbLToNFCqsK22RQI0+AR?=
 =?us-ascii?Q?SP5ZwtW6wxyWwfoZ/klKYXiK5iD3cqt67RIc0VNPZi+jZZp+ZGENiAoE8UyQ?=
 =?us-ascii?Q?2XYYQ6tJc+xwQ7tZtrkTDR5OLJf3ej80DdawtD9OZ9bcqc9wxSwihHgKJtP/?=
 =?us-ascii?Q?sVZHFVMDtWyWoqKuv2DqIyhlG3QML9OIJi0jblKUQvR4lyY0RJQZThUnP+gb?=
 =?us-ascii?Q?2YvMHI1jci2DmH0Xuhoc4ns7gRrMPQEIhfjfv5Nb10uUWaww5kQZdjia8Cx+?=
 =?us-ascii?Q?kBewC3sMJRmmGJaCA5hxXSfQkrV75GfVLIm3/xvE9NwKgy3jiAPdBE3kzTSF?=
 =?us-ascii?Q?JRRBSTsdKJCXPoQCnc/PF/c3R2EIAAW/joYxbOMJsMmafjZ8h0VJXX000orM?=
 =?us-ascii?Q?8LvFAhogJqqQq0DIstvPyImDu9EUP1/j6Le112llZaKNZjqFFu+DuBCK5c8Q?=
 =?us-ascii?Q?zqSnEKoFXwDXLjh319JTEInOhlovzF6df/Y09j8+vO0oV9jV1siCqH1eBZCs?=
 =?us-ascii?Q?NkJlNygBM6vkFWFmi6Mb90khf+0wJGzG4JHQ3gslapMVHec+y1mL8C7AYo5c?=
 =?us-ascii?Q?hgP/7XPeFI8Ph5VV8/BV/7Yxk2AQf4QSgRqS/G+j3gM0Ydf9V+/C/LLXh+W5?=
 =?us-ascii?Q?8MScCL8DSDzNGYAou5IJpHoObJyPOu42fbMtpAdgronsOG2FXx3mw9FrnrEu?=
 =?us-ascii?Q?iKYq5ILnwfOtvuZqn9rRz/HjMdiUINEsd2QQyPVzre2Q1xDZJ77kqXg5m2u/?=
 =?us-ascii?Q?OiOBkvz0zKl7f69q+E1ZySPabBKRM5KAHwOScyAsGAux+gFGRTXmdTFhBsTY?=
 =?us-ascii?Q?0iuopvKTZoLgjyrX01Dz+cv0TJFPWz+9/DtWByPSUl2elq1SbsFq749xuqlo?=
 =?us-ascii?Q?S8VnFyDR8sgk3Xam7eMpzAdDxrbzimnl/F0KL7asaoVdYvP6F50wHvEINeIT?=
 =?us-ascii?Q?4dWUwExBpNJLf/ld7vgIfp+AHB6jChnUAIXUbQJoyWlTShdKSfx2TJSXeszD?=
 =?us-ascii?Q?AlE3+cblr7FKsRtEk8cOuyWeiKJoVcgbhpHvKuAtuRp+fGRXk8lPipzc6nhr?=
 =?us-ascii?Q?+Z2Ie1yWZsBGUkLkkFmQcFINUmKwVZ0SP2/Dyp/1oYvFly7DMqPHrygGfTVE?=
 =?us-ascii?Q?6LWo0c2BPP9hWgowY1AHPoEdKV21Hewjgl+RCzon80C8sqVZqq0Rw2xyZZT2?=
 =?us-ascii?Q?883Oc3pNs16NLHPugfU8lb5w/ZvsDnahw0UbA/r5Fkat2zCAjB67CBBDNWjU?=
 =?us-ascii?Q?ec0C3PEdQQ+IDhcMqThcX8VSnUTFhpjAeGYui9KbIqt3FTyhwELq7uqPgXpL?=
 =?us-ascii?Q?t+nWfqwk7TUbEIxRAg3GkJhDAOb1lkZFyhEROhes00lBAedTMw0d+7Ml9ilg?=
 =?us-ascii?Q?sFI5fCLKMqHJO1oEErfCPqBdYArK97nq4RvtZv4TMNWM8ygGmSRnfH+q5P6y?=
 =?us-ascii?Q?VFiGb8+GWESWyUBosVks1cViuGrc1qAV+17tvpD0bi9H6l+IB2w68vdbczgZ?=
 =?us-ascii?Q?8E9IXDy3U7eMuZ14DFrC21urJR9ymFSlYd7gQ71UzcW4+b1nUEMkzZqx6p4C?=
 =?us-ascii?Q?KsEe27ovvHBGSGHNxBwmZpQ=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7046348d-b16a-4cf4-97cf-08dd33d7c155
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 13:39:51.2433
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k1qBftKY/DAqAGmIyY/gSaaBey3mAbfGd/F1vW0WG72NHGFnlTyENQ5f11B1YS/0p/3pP1nPDOvT0Y/S1QyyBnn3sambM08jbFJuRa8sds1RJxsSnoehXMLVdh+r0SBs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5880
X-Authority-Analysis: v=2.4 cv=DdLtqutW c=1 sm=1 tr=0 ts=678517ad cx=c_pps a=zz2QubYGG/9FVtTd3zWqHQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=Vxcp6TsG9gSaDC-ermoA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: XnQDY1ZJJWrVOyBpPym6uurxK11IRtLa
X-Proofpoint-ORIG-GUID: XnQDY1ZJJWrVOyBpPym6uurxK11IRtLa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_05,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=824 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501130115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 13:40:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209721

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

-----------------------------------------------------------------------------------------
error: data-layout for target `x86-linux`, `e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128`,
differs from LLVM target's `i686-unknown-linux-gnu` default layout,
`e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i128:128-f64:32:64-f80:32-n8:16:32-S128`

error: data-layout for target `powerpc-linux`, `E-m:e-p:32:32-i64:64-n32`,
differs from LLVM target's `powerpc-unknown-linux-gnu` default layout,
`E-m:e-p:32:32-Fn32-i64:64-n32`

error: data-layout for target `x86_64-poky-linux-gnux32`,
`e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128`,
differs from LLVM target's `x86_64-poky-linux-gnux32` default layout,
`e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128`
------------------------------------------------------------------------------------------

Rust commits for updating the data layouts:

x86:
https://github.com/rust-lang/rust/commit/dbff90c2a7c751cf9d6843cd585429beb100c17d
x86_64-x32:
https://github.com/rust-lang/rust/commit/ec55a05374d89d206be5140a4759af92f1b42f15
aarch64:
https://github.com/rust-lang/rust/commit/4d397d33da8aff64419a03694d152c8250916f19
ppc:
https://github.com/rust-lang/rust/commit/ad7ea8b7e690e6000006b6fde630a2c8c4385019
riscv64gc:
https://github.com/rust-lang/rust/commit/f414715ebfda201f91f80ef9f28d9923d614d1c4
loongaarch64:
https://github.com/rust-lang/rust/commit/4a06a5bc7ad259023e4373e794687adfce252dac

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/classes-recipe/rust-target-config.bbclass | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 399c13db26..67aaa56bac 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -146,7 +146,7 @@ MAX_ATOMIC_WIDTH[armv7-eabi] = "64"
 FEATURES[armv7-eabi] = "+v7,+vfp2,+thumb2"
 
 ## aarch64-unknown-linux-{gnu, musl}
-DATA_LAYOUT[aarch64] = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
+DATA_LAYOUT[aarch64] = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128-Fn32"
 TARGET_ENDIAN[aarch64] = "little"
 TARGET_POINTER_WIDTH[aarch64] = "64"
 TARGET_C_INT_WIDTH[aarch64] = "32"
@@ -160,21 +160,21 @@ TARGET_C_INT_WIDTH[x86_64] = "32"
 MAX_ATOMIC_WIDTH[x86_64] = "64"
 
 ## x86_64-unknown-linux-gnux32
-DATA_LAYOUT[x86_64-x32] = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
+DATA_LAYOUT[x86_64-x32] = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
 TARGET_ENDIAN[x86_64-x32] = "little"
 TARGET_POINTER_WIDTH[x86_64-x32] = "32"
 TARGET_C_INT_WIDTH[x86_64-x32] = "32"
 MAX_ATOMIC_WIDTH[x86_64-x32] = "64"
 
 ## i686-unknown-linux-{gnu, musl}
-DATA_LAYOUT[i686] = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
+DATA_LAYOUT[i686] = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i128:128-f64:32:64-f80:32-n8:16:32-S128"
 TARGET_ENDIAN[i686] = "little"
 TARGET_POINTER_WIDTH[i686] = "32"
 TARGET_C_INT_WIDTH[i686] = "32"
 MAX_ATOMIC_WIDTH[i686] = "64"
 
 ## XXX: a bit of a hack so qemux86 builds, clone of i686-unknown-linux-{gnu, musl} above
-DATA_LAYOUT[i586] = "e-m:e-p:32:32-f64:32:64-f80:32-n8:16:32-S128"
+DATA_LAYOUT[i586] = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-i128:128-f64:32:64-f80:32-n8:16:32-S128"
 TARGET_ENDIAN[i586] = "little"
 TARGET_POINTER_WIDTH[i586] = "32"
 TARGET_C_INT_WIDTH[i586] = "32"
@@ -216,21 +216,21 @@ TARGET_C_INT_WIDTH[mips64el] = "32"
 MAX_ATOMIC_WIDTH[mips64el] = "64"
 
 ## powerpc-unknown-linux-{gnu, musl}
-DATA_LAYOUT[powerpc] = "E-m:e-p:32:32-i64:64-n32"
+DATA_LAYOUT[powerpc] = "E-m:e-p:32:32-Fn32-i64:64-n32"
 TARGET_ENDIAN[powerpc] = "big"
 TARGET_POINTER_WIDTH[powerpc] = "32"
 TARGET_C_INT_WIDTH[powerpc] = "32"
 MAX_ATOMIC_WIDTH[powerpc] = "32"
 
 ## powerpc64-unknown-linux-{gnu, musl}
-DATA_LAYOUT[powerpc64] = "E-m:e-i64:64-n32:64-S128-v256:256:256-v512:512:512"
+DATA_LAYOUT[powerpc64] = "E-m:e-Fi64-i64:64-n32:64-S128-v256:256:256-v512:512:512"
 TARGET_ENDIAN[powerpc64] = "big"
 TARGET_POINTER_WIDTH[powerpc64] = "64"
 TARGET_C_INT_WIDTH[powerpc64] = "32"
 MAX_ATOMIC_WIDTH[powerpc64] = "64"
 
 ## powerpc64le-unknown-linux-{gnu, musl}
-DATA_LAYOUT[powerpc64le] = "e-m:e-i64:64-n32:64-v256:256:256-v512:512:512"
+DATA_LAYOUT[powerpc64le] = "e-m:e-Fn32-i64:64-n32:64-S128-v256:256:256-v512:512:512"
 TARGET_ENDIAN[powerpc64le] = "little"
 TARGET_POINTER_WIDTH[powerpc64le] = "64"
 TARGET_C_INT_WIDTH[powerpc64le] = "32"
@@ -244,14 +244,14 @@ TARGET_C_INT_WIDTH[riscv32gc] = "32"
 MAX_ATOMIC_WIDTH[riscv32gc] = "32"
 
 ## riscv64gc-unknown-linux-{gnu, musl}
-DATA_LAYOUT[riscv64gc] = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
+DATA_LAYOUT[riscv64gc] = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
 TARGET_ENDIAN[riscv64gc] = "little"
 TARGET_POINTER_WIDTH[riscv64gc] = "64"
 TARGET_C_INT_WIDTH[riscv64gc] = "32"
 MAX_ATOMIC_WIDTH[riscv64gc] = "64"
 
 ## loongarch64-unknown-linux-{gnu, musl}
-DATA_LAYOUT[loongarch64] = "e-m:e-i8:8:32-i16:16:32-i64:64-n32:64-S128"
+DATA_LAYOUT[loongarch64] = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
 TARGET_ENDIAN[loongarch64] = "little"
 TARGET_POINTER_WIDTH[loongarch64] = "64"
 TARGET_C_INT_WIDTH[loongarch64] = "32"
-- 
2.43.0


