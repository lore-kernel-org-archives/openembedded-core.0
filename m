Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9717BC87FC9
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 08:48:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.30676.1753865324114695621
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 01:48:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0306c9daa3=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56U6nmdp2204318
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 08:48:43 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 484m7xktbv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 08:48:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9fi+vsv3sZTY3cknHx1P9oFJccRdFltPuVlRPHBepP5lUAQ8BLIxRx7pDxTgy0winOwxMpX9XwiOsnW52FZUTe8F6I1DgrAF9zKFRbPOJ+ukJC4esAe15o7mAWJ3gTE7bfaCtjavSDl6tQq+uOF/8SWSJkDnYJv1+eieCsYwMWYYS2bo/DbscYPgQi5XebVaqF1l9knw3Gfyi7Iey8Lab0ILfOTZ3huA3kkIQoVMJ+1t8H2a45MBAL360zs4/HC2jfoI9olb/JUJHPzFEY+7iojfbIeI98HG4IokypjUY60Fi7g3S93nwBelWTjPT0jshcnsb5Lo2vftEQgTFKfKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIUkL0k0V2zFEBXYqvnSLbijmqorl2OpiunLqllwtLg=;
 b=RygaMlG5KNuTWteFBUcz6GhMzcCfXkVIy5aNHSkOv8QgqmqyIMbE2SO4pCWPlhpVWXkPXXl52ItD+vLagSJqG+cXCAeDGWH2n72tiTm61VaoFwXddrmWu4iXsAynHaRTeq5ER3mXaOsZg12JMaE/Zkv4IDfmUDSsXEf8eiqCh4BoznipBa5T9gYUw6ADuTAvVx/fkOwxYY7ABHCf841i+63A1Z+hheNi+TUmDa4lAAc+dJsODZUkX4gl3t9cZXyqMIYKGY61RHlswYSLbsOWag6BCKdKb3xOfszgvPsQV+HWTP1RqpICnR+Fu4UD+fAJjwfZJT+Vp6CzF48kO9DFyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CH0PR11MB8190.namprd11.prod.outlook.com (2603:10b6:610:188::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Wed, 30 Jul
 2025 08:48:40 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.8964.026; Wed, 30 Jul 2025
 08:48:40 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH v2 1/4] Revert "rust: remove redundant cargo config file"
Date: Wed, 30 Jul 2025 01:48:15 -0700
Message-ID: <20250730084818.27093-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0022.prod.exchangelabs.com (2603:10b6:a02:80::35)
 To PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CH0PR11MB8190:EE_
X-MS-Office365-Filtering-Correlation-Id: a300d0f0-7a74-4f4c-a69b-08ddcf45e1b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?U8lAxRW7wKvxgTjxN1t3WAdNfJrVymJtidP+chMUsq7/8/1RvS6r92Z0Jse8?=
 =?us-ascii?Q?frqclP9Ipth30wXNxjeiwXSZY5y+raeYq82sSApjWCfFdHkaPBi9l7rPTWbi?=
 =?us-ascii?Q?HxZVKDK3VFGqrgZM+IJgu8RXVK0+IBDkJA6hKQobmh7Qg+vCsWt4Hd6MVJgF?=
 =?us-ascii?Q?o3ASwzfrYUzi9nrxooR8lR2GDH8y+LQ8R6O7J+IKZPspZKZMCimh2903Dnfm?=
 =?us-ascii?Q?9XlW6Q64Kkwc0QhbSnNo+uRW/m/IeVH86QgEPkMKvzziZ9teIzzZ510h72wp?=
 =?us-ascii?Q?Q11lh/kfidC2V2U8PLeZTOuy/JwSagHUwTFaO94bLtCkYFtL9mD5AGxqhhOs?=
 =?us-ascii?Q?mXSK7OaOG+ZuTTdxr0BQctSBEDlUOAlCm8tAfFAPQ1Un2F9ErcwC4YRCWMBf?=
 =?us-ascii?Q?QqPFHkMnHVV7HoxOzEuMW73hp5XtJxAoF8amCXkfD8tjfmfHAnaiDh+kRFq2?=
 =?us-ascii?Q?jAaXLaP7X0q/ey8m9M3Su9aXXex4545pDSE0tYEJuitnuvMSTHzKHDHckh31?=
 =?us-ascii?Q?xELh6jxd7O1RiWb4OAvrd9xxxnf1YrmWvzNQEivTHB1Vd8iX3aI+LsG+MfYD?=
 =?us-ascii?Q?PakNfX1AXnXK9HmMjoGeS9nlcPDH17sucqwk9UEb0vvOithOIqgYBAP0Lno0?=
 =?us-ascii?Q?i7pUzo2QRTgiFJKkuyXkk9w2lrJG0Qe8V/19B/My8OVH98XL8t5gLni+9k85?=
 =?us-ascii?Q?WsH7kI5qYU+K/+9+OxkoV2BlmwO6pi2w835axIXMs3pkHT9VHRnrtS+puUvp?=
 =?us-ascii?Q?mbL/uj8KxNNH2y8kED+C2XLAZgkTx7GKNTLlR8KQzbxk3kjmaFPDso1Easlh?=
 =?us-ascii?Q?RIv+mLj+NGqQBpE9dJcpWPZddCS1M+GOjjvmBG0jON1FxuHB2rjjKdfReduR?=
 =?us-ascii?Q?JIEJDtAuWNYj49kOBg5ntMDWTkqClg1LkGW0gaxiG5XJqu5uyoBdrl28UBhQ?=
 =?us-ascii?Q?rpQSGKgZj+qHR+AFSceO6Buxaj7BRfeniYVGYHfRRPjOLHK7xcAxT93XYpQN?=
 =?us-ascii?Q?81xitE75OTdNSCjM8NkVmOXyDhq466MdwmCB5sSKqW5YNOQ1VwHRoHYDcKAA?=
 =?us-ascii?Q?/XvJGhD35bLkwhgZUKDiEu5UTZIotk3b0deuuK2lQMxkNoH1EGzHi7D2M6sw?=
 =?us-ascii?Q?QqE89fdNVlmd2bDQdsB7bfb09so3LHlBwTl1iF9F8ktkcOYgNihBnzG++xPj?=
 =?us-ascii?Q?n5L2HjCjBMW9qkFAsDpopY9Jag/G5R1jqSMupAWXQxx9UewiBznrMoFduJ1v?=
 =?us-ascii?Q?mX+eWItHaudUcM0wgOqS4GPE8USAbxO//nbRX5qZX6+FmSyC8HWV1qMHoA9x?=
 =?us-ascii?Q?iYZtXwJ/j8ugmzrHFZiMWIVuLqf/8TbmWAJ+VSgo3IDhYhqUDCBeKONNhHkk?=
 =?us-ascii?Q?brJLgKaMSNN0TzGlLemlfnuvXsFtN5qwkiR+TKoVaANxHiA0eSaG5LXzLmBL?=
 =?us-ascii?Q?70lBiaB9yEg6HvDeO0FuyKtZzptNbsp8IdWuppa32XUvul7ll3S8JQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?44IeE7VDqjgBx3SHEqb/NcmLvUQ9b4KpVji9wLTZEpUjfa6Jpkw9P+aF5wNe?=
 =?us-ascii?Q?MtbvbYUp95Q3IOStQpx/2cOJcCbY2pe8z+uNkner49RFGGUVxJSJzfrXO7++?=
 =?us-ascii?Q?61nWuR0CHK/78X1RTRJ+kKCHiUpwfem+k8P38LW+xLJx4Gk/QzTgEx75NFhq?=
 =?us-ascii?Q?0H+18/zCZoVQEYdEknQpnEIOeO9OJtuVGRA4yLa7KAY6FXbLgQhJWdDksQMC?=
 =?us-ascii?Q?GJgRZd33mQsavn+csh90ntJU+MSHZruFOEtOcL6HrVR+Y5B1noDZBk6Ml1ag?=
 =?us-ascii?Q?KRf2+/NoM8HAtg8gfdbnBWgrvizbLcbwtgfEaEtYNEMkwcE2HU6xZVgvzjgy?=
 =?us-ascii?Q?iZ2Q/qZIuSLWzsBITNXYE01tRRxl5tZ4k/G4Cx7k7LU8rS4gcZDpKqk7x7Ro?=
 =?us-ascii?Q?EWop9YMsNIpK4hrdZWjX0hNX2fUL2BuZu/PQ2DdHPHzs2CsqaXxHtJN/nzNC?=
 =?us-ascii?Q?+d3xMSLBNnvlF4O4m2ln/Vm+yH2aoxASlLzefDCQc2Iexy+KIWjfW87RyV7B?=
 =?us-ascii?Q?9iUsEp7dYqP0HcWZ+w1JJy1xPWdKGQVo+Ni7zTpCtB0Zws6J3XCrw+ktydBQ?=
 =?us-ascii?Q?porRxLZwBoSXLp7W/RpsnuxNY2JsXlIFjcC2aRtok5dGWycrqpw/ncRbKR/Y?=
 =?us-ascii?Q?B8OZ+IG9WYqMyDyLtRYSJBlHHZ3A3GAWa27kZezT/C/+oOr3QwskMcjIJNZg?=
 =?us-ascii?Q?gYWxBcAhSH+88duOXIa4eBc8KoFkILD5+cZT6e1KizfqRVpDwZO2Tgf4gJhz?=
 =?us-ascii?Q?i8meT+d1AUIBQT9TaU/RYH0pJKaeWqK1EOEaJGW7UcuscA0p+AHJ4nFje9cm?=
 =?us-ascii?Q?WC5EH/ez6kXwDLVFCHjK4xHCMQBySplYNQ4D63jDuMGP796mr3qtYo5+vudN?=
 =?us-ascii?Q?Wevyqz7QmXoVBpx7fJB81ufGZ52BN0QVfOjBRMmTx+Hl5HDRg+a5ybmHcuPQ?=
 =?us-ascii?Q?Xne9GxGKrXG24dRtsVzm26vQ5t0xD3Z0dYEWuj0FTK+ZF1LMMz1/uu9xF8tD?=
 =?us-ascii?Q?qDVn9NWDhJI7QCfOy1fPFUd+gQzepBYUQ1upCgJHZ7V4ET9alIqbAsVv279S?=
 =?us-ascii?Q?sGW8dFQxhM/ugnuYXX/vmzb30mkgzwTpcSBPJZ8I+1w776IbfwYWwXOymqpc?=
 =?us-ascii?Q?4yc/iQbAEIpcjlR/JOjdFICxyTyYa/bEFJzCVWGUpI6TkscbyWWA2ET8tyvb?=
 =?us-ascii?Q?qSpQnzW8Rgkt84G3lHlyMkt4RJs9DclIYuhaHAJD8AVhjEmi34L32LiYFzr7?=
 =?us-ascii?Q?WG6cueKf8ZQEkbH7i3XWaT9FoeFrOB7Cc/W31OwoaGCJH3QVkXNFrwYxklSN?=
 =?us-ascii?Q?gnN0rcdGEPCvXNxf5e7DovKiiH2WCRLNhfl/uW/tijU36xVrj0+4fHTJSco8?=
 =?us-ascii?Q?GnIJ71ufhy00vyRKmZ4ccJOlW1t68LaA+JS0ItcQhKOYfJFoRSo8RYl5HU8T?=
 =?us-ascii?Q?iZUCX5UJHSBMwxaLuNKQXYt0J62jEPL5lE/m6LFgroLkz/OPxlb50zJGW7BO?=
 =?us-ascii?Q?rwBNwTPigWtnXc/3M8ibHR2YaJjVcj7bvUCSVsxfvBzFyjy2bjeuKbL25AgW?=
 =?us-ascii?Q?yj5NaGY0Yhm6e2HKL0mXoP16HU72O8Omoj39t+UH1C/8z3BIz9Xl/DsNHNtL?=
 =?us-ascii?Q?Ug=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a300d0f0-7a74-4f4c-a69b-08ddcf45e1b8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 08:48:40.3982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AXdfxUTjWvruLrxHJJTrIyyR19QkPlBvNAG+D+kMvn9kW6QyI2t+Yj+0sAITZki5XwApgCwNxk1g1wIS8ltii+pE9WOnqLbYYoZP42pKZkI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8190
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDA2MSBTYWx0ZWRfX2kNjKDefCWV/
 DN/XaLqr2Lild7kDVE7WUEcED4aSlLoaxEN9w15Yv2zO8ZHEb6aeEHRTzLxM1eVnSCuOHXxLOEv
 FwVmwB82Igm+ku3c2fAuWjFP5XqH9qwDjHtgqDSU6E1XIvjNigOTLZcSMcoON3Ta1LnL+7LWryg
 etWtLIhlGS3RZ9RUTgo2NyTP4LrQ5EggnlS4Rj+XoBXYDAntmXd4l8I2E1AML3u/fd/GgkMPEtC
 bNbqVveaD/anFekhQu7d3bVIS23qkDwQONHSuv48yRwP3V2UCy2p4LCQLMCTTGYiV+nyBeJyH01
 nIs2PVyIzaf663yzYHYCVHg22PLmaxK8SHSnL6n8gb9Mx7eBSq4dLLtTQlpZvR6n7UYJxxI9Rw+
 tbuD11s2
X-Proofpoint-ORIG-GUID: -2vAKK2oKEnHCKPN92NyM97x42S336zc
X-Proofpoint-GUID: -2vAKK2oKEnHCKPN92NyM97x42S336zc
X-Authority-Analysis: v=2.4 cv=Y9v4sgeN c=1 sm=1 tr=0 ts=6889dc6a cx=c_pps
 a=E/8BleX2w456MFKUPs7IYQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=t7CeM3EgAAAA:8 a=nZTMiEG4cM8ErhhU3NkA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_03,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2507210000 definitions=main-2507250208
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 08:48:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221109

From: Harish Sadineni <Harish.Sadineni@windriver.com>

The 'cargo build' is supposed to build binary for the target but it is
building for Host.
Reverting below commit to make 'cargo build' to built for target as
default in sdk
commit# 37fea972a6fafe360bfbb2d1ac472fa9e060c733.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/rust/rust-cross-canadian.inc | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
index df8b78d326..fcfd178f34 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian.inc
@@ -64,6 +64,20 @@ do_install () {
 
     chown -R root.root ${D}
 
+    CARGO_ENV_SETUP_SH="${ENV_SETUP_DIR}/cargo.sh"
+    cat <<- EOF > "${CARGO_ENV_SETUP_SH}"
+	export CARGO_HOME="\$OECORE_TARGET_SYSROOT/home/cargo"
+	mkdir -p "\$CARGO_HOME"
+        # Init the default target once, it might be otherwise user modified.
+	if [ ! -f "\$CARGO_HOME/config" ]; then
+		touch "\$CARGO_HOME/config"
+		echo "[build]" >> "\$CARGO_HOME/config"
+		echo 'target = "'${RUST_TARGET_SYS}'"' >> "\$CARGO_HOME/config"
+		echo '# TARGET_SYS' >> "\$CARGO_HOME/config"
+		echo '[target.'${RUST_TARGET_SYS}']' >> "\$CARGO_HOME/config"
+		echo 'linker = "target-rust-ccld"' >> "\$CARGO_HOME/config"
+    fi
+	EOF
 }
 
 FILES:${PN} += "${base_prefix}/environment-setup.d"
-- 
2.49.0


