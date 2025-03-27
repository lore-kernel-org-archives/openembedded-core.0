Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A768C3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 09:06:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.45499.1743066390378886160
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Mar 2025 02:06:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=518172d04b=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R5S3Ef025707
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 02:06:30 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hvqkddtu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 02:06:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pawF1/l0GQlmgbn0Ep3Bwx2N8QLNfBVgDFMM7M3JqGPyJOs3LXMdKXl66pH7AnBIfamf43prabgsUG9vnayEjbny9TjV9VfX9UbEmjY9WY2+lKOiwGNJF5zk36uJxxKyXhTYM/0O0lCoNtj4gMWjdUc43oNY61/W4CBnxNre+Upr8ky+g8ohweEVKDf7vT+uaghLIal2Ml6WCDO8BJ7lxaEII+QrR2Dog2yzrN8VJck+8/H+MW7Iu+InQ2LXo8n9mQ2Eq3VODy4SvqPLHkGPNjOU5WqRlthoSznB5O3JSyF/ZOriZsXtvIbjsJYZ/VtRe5bxqmooID8lYdNL/fZN/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r12eEvhacbkmVDZNfvztzMMiD0mZ0KxHzOUD2ufQu2Q=;
 b=QGm0O/Bu96ndZEyosLKX/+391mnE7L1FqW4ROEizmY3gNVit6/NiRUwj0T6lnnyB4E2FBF65zEPNPKLaZ4vRLn2eYrD5P1dfJ44rLKjfRgMfopRFKWet0+ZUCrtdvKeT9c221MBYWdVw6D7dlEIh7A3lqnTX5YLDzSvPmVfo/VuWfQPSYW8vaHiiOXSOpNb8O6UBPOt/4Is5Dj/3wXZQGYyTjmo/HwPJLq6l80mkx+IB7G4G5ku4iCRsLvl8lffIgfX5k35fppgfz1tOto4ogtfFjJdm3rNe21cZppyGNPuHu0EWKugxUw/AzGHzVmCyDzUtetwCMtxkhbyIV3zuow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM8PR11MB5637.namprd11.prod.outlook.com (2603:10b6:8:33::5) by
 IA4PR11MB9060.namprd11.prod.outlook.com (2603:10b6:208:56d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 09:06:27 +0000
Received: from DM8PR11MB5637.namprd11.prod.outlook.com
 ([fe80::8ee7:3d97:35d6:d1e7]) by DM8PR11MB5637.namprd11.prod.outlook.com
 ([fe80::8ee7:3d97:35d6:d1e7%5]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 09:06:27 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Shivaprasad.Moodalappa@windriver.com,
        Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH V2 2/5] rust: Fix build break because of "download-rustc" and "llvm-tools"
Date: Thu, 27 Mar 2025 02:06:04 -0700
Message-ID: <20250327090609.1096447-2-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250327090609.1096447-1-Deepesh.Varatharajan@windriver.com>
References: <20250327090609.1096447-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:a03:254::34) To DM8PR11MB5637.namprd11.prod.outlook.com
 (2603:10b6:8:33::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5637:EE_|IA4PR11MB9060:EE_
X-MS-Office365-Filtering-Correlation-Id: 10be6692-90c5-4092-b166-08dd6d0ea7e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?c9Zyb4EFvyYEizlHrM1L4+LE+Idq9qle/GWrV0NDNHe5HNKBFTYDNHL9kwLj?=
 =?us-ascii?Q?E5AWMsqb7aAELe0h1zxcEesXWJAWXoIiYegWPcrcnuDTax87Q+WWroTiei5+?=
 =?us-ascii?Q?3S+uj1wOAWKEv20LI3h67DuK60+sNwTdky835nXcGDZXNbUv7Y4qHpuEIZkI?=
 =?us-ascii?Q?mn3pQcUnvACvZZJsFfx+SmOx/jDhXctOcCON6KcO0Wmne+uGAwLLgGnhrr36?=
 =?us-ascii?Q?kA8j1D+b4v8TQRcyNJo/FvBdux5eSpHgfb+Rg1DU9uWnCEjMQVwkxof7tSf5?=
 =?us-ascii?Q?hH7s07ypHHVhO8gy/ENSbRL2JsjA3rmvNrhF4q/wF2dnxc5OsE8+fl99M4WI?=
 =?us-ascii?Q?Z0VGZCUzNHvms3TuVUzX/DlVoDk9KUIqWDQftrBR673Hcve2RVbDa/okDwQw?=
 =?us-ascii?Q?L/vjpxx69J325Wpz7kdOtlhcL5lBlJU/DNQY4umKEkc/UjzWCd730e1ajPcg?=
 =?us-ascii?Q?uqr8wWQEDx4MT1H9mC/pNn2tN7uzyAhxbn3d/I//83pMHodJ83DV8tQHVtaC?=
 =?us-ascii?Q?I2V3zv6DmZU9KnNTKcgm3erEpMsbS5ZvOsiNo/Osky7ZJK9ls1Ao8DfB2hw1?=
 =?us-ascii?Q?iFxgkURiFYiyBVmBqAFZBlKtty/DGiHYxySplagDG+VrvvoTmDQieRKySoKX?=
 =?us-ascii?Q?dgD6CwFxjuDoZ0W2knXm5i4Fz+ijJ5LpAjuZYIETuM+NFN9xH3iRKQ1spJwu?=
 =?us-ascii?Q?j8wfJcJxCvmwjiMMD0NHhh2FLdjCpaJhB1hchnrig/nyXO0BIervhjVHuVVU?=
 =?us-ascii?Q?GcTwazaNa8OlyDppwSwwC8mzVbdPP/TVzVO4zA0X2AwWTtvBHrODg0jmMTk4?=
 =?us-ascii?Q?KLbbL44RLJ7a3GLXuJzFD81DGvs3Yh7L6YPD1nNj9jm0WTQkTpIJ1Dkb53oT?=
 =?us-ascii?Q?14BlLQTpYmTag5TnI/pGpgxWBzf3KIWaMgggS7H3orRI1TThpenhbshDKDYh?=
 =?us-ascii?Q?a+LD9y8yiZH48x/4Snlw/jx5TRWQrQQhzyUXbp/NXJGIZ82taGeKmpRG0lCN?=
 =?us-ascii?Q?WFTla9tGY07S32Kz4Z+dheusW1r5l8TI/Hw3SZ7GHajhAmuamjl8LmDXJ+H8?=
 =?us-ascii?Q?cZzGEqaFXpl49QNYmsh7Qn9ibSdT30ZUwo7mATPlgsqIybzW+cxUq23SnyHs?=
 =?us-ascii?Q?Z2D0eglXud2D3/NBsREXC8cHtK1BPmAalvviCspKU1hRkCdcAN3VeDiQN9y+?=
 =?us-ascii?Q?uw5xXQ8alfwKwGlZWnju+JzDNa9TPsp6eYroldwOb7BqVXnoicnB6CM1MOs2?=
 =?us-ascii?Q?yvOjahuHYlGLn29jVPBFp74w9LtVoEmW8cr8tOACDJNHwrxdpq30WB3/Rt0E?=
 =?us-ascii?Q?3LM9NknzEPZhAETGAw3Iry1r2xv8x3PqD0EqOyoGgCfiCueWtqx8fwljnWld?=
 =?us-ascii?Q?ifniN5mx99GKd3EOl+ihHNmBgAEi5k49PPPwGewGNCHBx1gUtWFJUr4lO6Mp?=
 =?us-ascii?Q?gOn/xrhYwaDquEZl6ktL639cUBQLXm3A+3wVSBI5K26ZAqCsnN+cZ/W3hoHe?=
 =?us-ascii?Q?Ms9+41PIJsVTFg0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5637.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mzfRglQAo44tMdMDUASwLpbwGA1czAE8JuBkUGpqk04VZ9XnZY8f7YhT3Wj5?=
 =?us-ascii?Q?wfY0l0obYziRtyY3EkkJMIlIIhTVo+FuNBtAJQhMPL7EoUH1Ud5logfpvkpt?=
 =?us-ascii?Q?wC99wwgTrdWZfFyHbojk1M/+VyrelDUxRZpqXd4acSUjPdv61if6ED89Gk+V?=
 =?us-ascii?Q?J/bwAU8bMvPh2v2AT/0V4sWEsRRk023DcwxuwkuTIAjnMqUc1RbDGTvm5aR7?=
 =?us-ascii?Q?ks76u3Fri/wibFoYqRlS7m+7CPET5mq0j5MaReckU+h+g4PlLlrrccUa9aYc?=
 =?us-ascii?Q?dsU8PYCfPjnHWr5nbapEOXP6/MswBpxtpOP6rGbQVWINhY2wlyntR0MZoE81?=
 =?us-ascii?Q?8GjHwTPUFGRBjCuioHWLEV6Cn+M2g4WjFU16gntMROG2KzrH7l8VOAc+mpHd?=
 =?us-ascii?Q?WYjTTG5oCMEL9dNH1LWzZEgcuJb4hhs4AStin0kJ9bF8rQciImqXKp7178f5?=
 =?us-ascii?Q?Q17e83SAORN1ce1QVkF1p3RgREb6UkGRfnczSMCHkTf+UkJzQTQxYVYxVdiR?=
 =?us-ascii?Q?niNKdlozEugyTrx2GC88eoBXfMdh/iFjUJgL2JVZLSwK8cBb25NH6+CvXrDY?=
 =?us-ascii?Q?qAGzhFLuV7F+K+kw+IvWo4G0beDda6edKorXn7rYZ0bZ9WYnrB+dMt9eJ5Qu?=
 =?us-ascii?Q?CHR+uMOhy+g9rTtWycxUu1ox0HLOmvZPQ3UOOwAWVfSUFmysZSofEHPeujNz?=
 =?us-ascii?Q?AScQg5YgltBplIv6WTSYPdNnMwM3eyDriXrBMAXhUoPIEBddkyI3kQif3XW2?=
 =?us-ascii?Q?ekBFskL8+tsVzKIQHYkVDAOv0/+3FBx9HuGlUguRLcfgA4lJgGMEOCAESASl?=
 =?us-ascii?Q?PoDK0uhEtW/4J3KkZn2N974m2f2Pqn3qhDRF8/4aMkJZrySmpNAoGir0tPlS?=
 =?us-ascii?Q?SBSwgqx+YpJLjkh61FM9YWaynrjJ/ipiDRSKfM06e2A5IoapC3pLsPbuwxl4?=
 =?us-ascii?Q?BDeZl9ltPB4thzQkL5qNyN1bFqnCMeIvmUDFprDZpdp8LtV1u6Hhmjp9hyUZ?=
 =?us-ascii?Q?vWHBvtg9Nf3AuuPKJhbZPYB6bXzAGbvJPoirfGkS5qAg4BCtR72MvgH0S/A9?=
 =?us-ascii?Q?fgGGbGu6SiavauyEPZKw5DPkXfuwbN5qZFlZU/ZCwKcoqwlgXoGFH5HwsmWx?=
 =?us-ascii?Q?gmn/tuVxoU9pxSMj7alJZY2gqEW8YmkgNIGnZ/x659FNlAbfmy/fPhgLr3C9?=
 =?us-ascii?Q?e7iaaxSypIkzmV+wHyn0MGSnyPcY2cA0nWGLOzrsnMyQdtD34MImEmm82NSE?=
 =?us-ascii?Q?pWs/0Vlev2zBWCxwCP2NLDv4CGl5dQOmfmL4i8xH/YvwNZoqHhcr7K3M7+Lg?=
 =?us-ascii?Q?gTOk75hRRJdHa4jy0MPeRvqf1aMRpcSTb8xXXFbRCxLTwXGc4vw6JEt9QQDH?=
 =?us-ascii?Q?NhgsxJl6OFVL+f12NEB7/UCdlWrQKqeptJYytBLaiE9FW70X9EaJrapO1wTJ?=
 =?us-ascii?Q?ICWSOVQdC2I18RDhVqD502zG3+cFQR1cSn2rZJWwegsC0WxRdVkJluqM3EPh?=
 =?us-ascii?Q?b66eFl91FzCHWoYgs8idJW8jJ5KicOtAkXlofjz/QHyvkPui3o2c+QaifVU4?=
 =?us-ascii?Q?FEbutQ7V93kMOK9jr6fDOF7Yx8Y6uLB2d8EpxITS6jgYwNCpa0R3NBDYUKAk?=
 =?us-ascii?Q?EPBk640pcLtmX+ucd4P0UCs=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10be6692-90c5-4092-b166-08dd6d0ea7e7
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5637.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 09:06:27.1545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c7zmtMjs0KbRsptTitH/3geHYaPr3lCpEW8FaeBM4kCjSMLHySTk3MK38C8aVp4WKpdeF43bXWyvQd3c5D4y62ee8XOD0ct8SmvctsWJrWWtMKPyRY6HA/y/8LSfGN6w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9060
X-Authority-Analysis: v=2.4 cv=XNkwSRhE c=1 sm=1 tr=0 ts=67e51515 cx=c_pps a=b6GhQBMDPEYsGtK7UrBDFg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=PWzzmaXyrbUS9jlXZ2UA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: wPvTfo9s7un7nZSVXiEi7PxstN5OEutX
X-Proofpoint-ORIG-GUID: wPvTfo9s7un7nZSVXiEi7PxstN5OEutX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxscore=0 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 mlxlogscore=794 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503270061
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Mar 2025 09:06:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213713

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

From Rust 1.84, the download-rustc and llvm-tools options were set to True
(previously they were False)

https://github.com/rust-lang/rust/commit/cce6f03754f096f8a2bdfb357e3739b855e29366
(download-rustc)

https://github.com/rust-lang/rust/commit/38f0c099b2e684ea689633eb424d8737a1063a5e
(llvm-tools)

For tarball sources, the download-rustc option should be False, so it has been
reverted back to False.

Setting llvm-tools to True caused issues with finding llvm-objcopy, so this
has been changed back to False.

Upstream-Status: https://github.com/rust-lang/rust/pull/134240/

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.83.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust_1.83.0.bb b/meta/recipes-devtools/rust/rust_1.83.0.bb
index cd470b1883..ee8c782ce3 100644
--- a/meta/recipes-devtools/rust/rust_1.83.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.83.0.bb
@@ -137,6 +137,8 @@ python do_configure() {
     config.add_section("rust")
     config.set("rust", "rpath", e(True))
     config.set("rust", "remap-debuginfo", e(True))
+    config.set("rust", "download-rustc", e(False))
+    config.set("rust", "llvm-tools", e(False))
     config.set("rust", "channel", e(d.expand("${RUST_CHANNEL}")))
 
     # Whether or not to optimize the compiler and standard library
-- 
2.43.0


