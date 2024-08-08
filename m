Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A58CEC52D71
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 10:01:16 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.56321.1723111270716082120
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Aug 2024 03:01:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=89508821c1=yash.shinde@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4789ApZX000558
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Aug 2024 03:01:10 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40v0c91et4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 03:01:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lBnyGxh+YBCqmTPzkF+Gi/E9NKk2wnutNxORM/AfRneXpyAArQCsGwDuERCWZqD3vxWpHC9qZHZ0e2l0GNWvd/3NHLTg51ajn+6YloNZlJgz9Zu4Wtqy/rL6NNg122GhFvubckPXypxILWBE0fOc34ZQ9pQqiPFvzDQg/8ODQOBYHIlOTXV44UwV3PAVJA7SEA2hIHuxd2yGSnwDbCtb4Z/K1TJcuwjs5ERD73ACmMa3SClNB1C37i66fd7Zd5mydN0tp032M7QolcLzV7ZnXJYKnzW/+i9XnbQgwoVLC5qVDqjKvHr7NWTNGnhg7Rl0NTkdMaMPobEzKczvD+NRLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CwVb6AyqB9tkgwkWMQTGpEJwcfJTrE8/eAf9aAEDV3M=;
 b=ccgxmgYxlXcb7dWGT+h5pzKj+zk3qVod+taLVDUpldiMWdNEkcg14Z/2Tg3AeK9R9r+99pIFWdj85Vcg5R/Rk2SSxCUPy/GCLmbQCJj6ipsfTe1u6ZmeTDLEVZ2QW3ZtvQi2DLS5X2H0ZYUSEg6CpgFM8wkLh+EsxXby0u3Va5sZ00ss6m64BAuo/tFl63NmjlJR7XEV+qLQtDJbo7aURlWKbBJ6kpOmxQvtH8PF8Vl90M2YbmkKIqOyt+RZ5S+SkqB3fIFxSS2nudcicN1zpEEBpbulS+bwOyO15M9ZVgg+oYD/CWI/pG34sGjlcyLC+PNwbGy/unsbZi/ayisBKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by SA1PR11MB8374.namprd11.prod.outlook.com (2603:10b6:806:385::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.31; Thu, 8 Aug
 2024 10:01:06 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%4]) with mapi id 15.20.7828.023; Thu, 8 Aug 2024
 10:01:06 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH 6/7] rust: Upgrade 1.77.0->1.77.1
Date: Thu,  8 Aug 2024 03:00:38 -0700
Message-ID: <20240808100039.2455895-6-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240808100039.2455895-1-Yash.Shinde@windriver.com>
References: <20240808100039.2455895-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0042.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::17) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|SA1PR11MB8374:EE_
X-MS-Office365-Filtering-Correlation-Id: 4443c1f6-7687-416d-dbb9-08dcb791055e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?iARja+bN8omybt3/kDHtMRiRmzFNUtTJW4RuLxKw52H4CpXqc3Yv1itvCPFm?=
 =?us-ascii?Q?sJUDoCmVI4cOe+zI+iKrUcvsyWyuXWsWXDSmKsMhA2OCbjyLUSe/fRl2x7K2?=
 =?us-ascii?Q?YGhFLt8zeTyhzAi1D4FwXNExCVjaXL8SCEtQFnORIJDJfHgP0kpHjyYTpqwU?=
 =?us-ascii?Q?nxiVbzrQNAimwP5bhTy3gp+kD9lz122DDnAH3CbIfwdmNwG1wgp6bvOzO/HK?=
 =?us-ascii?Q?p+XFzbwpykCmI/fWFHNPuaNErOAGafagN0zei9ZkkwtWhza4/FQfHk2qP6cH?=
 =?us-ascii?Q?VVGjUuvlZuM2kReu+AeUKuPsKgnla3VsjFy/UmvjwadUb3lVo+FQotxBzfvT?=
 =?us-ascii?Q?C4wKPDheBB8ERVJNfWQI2V1AezKLGWHjJ0s8RU3y2fb4PCFN1lolxByWrBfl?=
 =?us-ascii?Q?6g5Mm5J1aAWI9X5P8iCC6VjOTeFJ+mwC30VkTi4Bor/MRkBVmA7ZBfUOKOSl?=
 =?us-ascii?Q?iyhDz9Tvl12aKz2tBPJS7UAczOOT2+R41MNWMr5NqbmAJpap8hLdMKkXD5Sg?=
 =?us-ascii?Q?JTsiZ0mlajN8icIjw3WA7LMCKCWI5oWZ1iEvbn0pBwVH0qfKPCDtmXEtxZfj?=
 =?us-ascii?Q?2hhNIFN7hDdy1RVNRS4qNeinW4be1PWeKVds/3+VA0BN0zjbH1lKFOMjI1Xl?=
 =?us-ascii?Q?CGVtAZyYc98hL+3sRSkpw/M2F6Ju+7FlWbcXp6dt1UgDBq7N9uQn8YtUQDEV?=
 =?us-ascii?Q?hnNU3rjxdNxOa4tDxWeZtIgVH41el42rOev5WVDC7pMvFQGVfaJgJ31hT1Co?=
 =?us-ascii?Q?S5cLH8zxLNFVj+QBmF4aRsQqIiQzpiHzNkaGvOI2K/eF/zXIGgV9asleOSnO?=
 =?us-ascii?Q?EXX2WcHZ8PxR+n05SduAHg+fZv14HmY+3+W1HBnNgoLTNEkgZdcs+fTM8Jq2?=
 =?us-ascii?Q?n05Ta+kaAtYqbLp5rGfCK0HnjPtNk9LCqK8w+QRSEuWVv3wKkVBp2iFichSi?=
 =?us-ascii?Q?8JVdQGXaHZAZYUykuI31lbE7fZP98nqAEuIe7yVTFS/xB4AxQkvtTj1jz1p8?=
 =?us-ascii?Q?pCfwrvnxQC/oz9EcGoUG6vj80xIxg7629ZGjPGkC+sTn50QNubNGDvJ/GtcS?=
 =?us-ascii?Q?FG5nOS/yrG5bnxZjPgsfcoChtliGnLUbMIe27ebVYqRZjvIwKagpQoKi87jz?=
 =?us-ascii?Q?hU6gxBCOeHjsV+nCgKIVYFCupfjnl5o6PYwF4hpHfAyWg0TuN9TLJreEDwHH?=
 =?us-ascii?Q?hHtn7EvMLIJGqCSCPXh9DupmWou/bKer9D8ZUqgKN45fXP639EvUIx1+8CLK?=
 =?us-ascii?Q?o6QmA2gHjeZBAMU4kGCcpRrFERLE2D2qatsoZNTrG5QFlvqw2XoIONC4ZJgr?=
 =?us-ascii?Q?MTx5hCa8QZG/JlTe7cvihzQ9xerfZ/nFAY/JRUxLIF4bpMF7VGaatA0hTzy5?=
 =?us-ascii?Q?3wMqvYk=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KLePrkgektmng55YtHofZQjhZ3fl6KVn3sC8q8GsxWIDYSgyVGqfMc3GTpWM?=
 =?us-ascii?Q?xlJwU4D7vMJHE/IFLVwW6ACVE9nHKn+AzrS6mJAvkuWIPKjn5Lf6fZKWMCg5?=
 =?us-ascii?Q?42u0oQ+m7HLqRa6nUiAI2NHJp4ECWoCQuYSwQOTjYJz6j8JlpB+XS8j3JCVW?=
 =?us-ascii?Q?r40MSL1aEyzbls1V2/rKxVLZ1Iac4woJHtCtTcFg16HZcyQssuCdtCOnfdvP?=
 =?us-ascii?Q?BKaA4BbX2Hf/WdpPc531pgFnmmcz6V9Rq5+x0gE0ZcyQZFhZxw2lL8sqfRm/?=
 =?us-ascii?Q?s3o35pTC0rXcJJp7mXY0/n4+yUiIjhepoQ5+K9Ih0wEmvr8kocmdGOkq+rmo?=
 =?us-ascii?Q?d3N2PNfEX7tZ4l9lhHO6BE5gua2AGUv6qdUYb9Dj0iyxagLc44WIyUtvaEGL?=
 =?us-ascii?Q?uiWy6Pz0wYAC5yJgELLvF3+yEg6DwLML7AlngERHCjL7RV29QNFc8tfE0ece?=
 =?us-ascii?Q?wf6DAjprD55mL/AqB4nmepRx/rH37vZPsKaNnbFMkfSeeupI7ot4ZxBW2gFq?=
 =?us-ascii?Q?AqQO+9aRGGh4cvgb1lHQ7w4X4WjsRCwgYPhs3OMAOzyPQGNRw09hwQD9izpp?=
 =?us-ascii?Q?lF6luDdpo0VjSQ+WB6a/nDIInW7QvIiKoYP+wpaaBWA4Ud3g9g4cK2LVJRe9?=
 =?us-ascii?Q?Qizc+ZvQnxUZXFPLWsTRjSr/XCLkgb5sfJkuoHJ7H6ZjuGPGotM5vIrmAF3H?=
 =?us-ascii?Q?9xsFmWy8vguJjKMn5PCvk8z4FyBGmTFvbiy2pixvzPVq24rWDSyydClMvChZ?=
 =?us-ascii?Q?uCMfX8s+xsNTCHOqU4Y3OUjOA/d8JOo5JWmaWqQLrDd/3BDShEdJRFsF+iJQ?=
 =?us-ascii?Q?1+P46of/d5iDMlPRU+le+7R6Dpu1696mSHhqX/5G1LY8n+Ih+U0RcP+Kxf2R?=
 =?us-ascii?Q?v3eUN0pvTGr2Sy8FJFYuVqd4SFGVN8pz7G4PDpsfNL/DLGVyij3Qdrv1MsA2?=
 =?us-ascii?Q?zQ5wX39LIo8sQoQdI25A6Eozd0RbtqmTFFVEEmxgT9HXKe7JQmNy5eibUJMC?=
 =?us-ascii?Q?6oIx5FPOCV+/IXH3La/4mFlSJi29/kk4cGfzk+G2Qn0TvNXtOetU5ql7F91E?=
 =?us-ascii?Q?H51kgqCU3UDyq6xrMxQsXqAJB9ZMMBa1D9FQOdnWG6UVd34Ut4fsoTfmI5eW?=
 =?us-ascii?Q?i5mR19wlaQo2A/Rtp3hkhq6Htkyl1GfuJd9sLLe0TpVK5k/w5NFsT3fVPnwz?=
 =?us-ascii?Q?PIuCMmX/Ple71O6EM39mx/X4T//vuwmoXaPun0S2krpQE9aBH4M0jBmwfuTU?=
 =?us-ascii?Q?6/SnjUU+4cIVHUjs/MzwSbYbzkETr196VE9oNDDGMBN58xV0/riQbbJoYn6s?=
 =?us-ascii?Q?bLNt8Ck17SQ/GD7Q3ivI4vHhoCQXVp5A+n0MUD6ma+6d534fRH0ryQV6aurs?=
 =?us-ascii?Q?mAzm1G5WC3IAINBtvahHtWNtUS9AHcRPt6myvtlsd77BS3cFkjpx7pNX5Sr4?=
 =?us-ascii?Q?+RHANi7r8hhs7a7CQw4lDgvesc8pz5WoXGilLdRJH+ZIFASiDtGmrt/2N9NN?=
 =?us-ascii?Q?EB43G99uLs5uhS4MsPhR/XmF1lvIGhQlqi2SRbdGFyNFth4OSiDpqGXAkDuf?=
 =?us-ascii?Q?fjYGjhck0JUBzgp+5qOnsAd/LeYrYZp5EQnxszIkV0HlzPu/wy9xfUkQ6CHQ?=
 =?us-ascii?Q?ww=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4443c1f6-7687-416d-dbb9-08dcb791055e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 10:01:06.8692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9RcCI6d05R2YlqZLvz8456xowEl7cWwa9/iN2X5CFirkzcnTVlcYaB0AJjTNxoBmyPcAf4Km8LcUHHwOm3iRw233p4Ls+PEjkbf06V7KnN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8374
X-Proofpoint-ORIG-GUID: sJDfUf_tuD8TWGVE_0AQx3wHDp-tQazU
X-Proofpoint-GUID: sJDfUf_tuD8TWGVE_0AQx3wHDp-tQazU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-08_10,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=819 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408080072
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Aug 2024 10:01:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203126

From: Yash Shinde <Yash.Shinde@windriver.com>

    https://blog.rust-lang.org/2024/03/28/Rust-1.77.1.html

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/recipes-devtools/rust/{cargo_1.77.0.bb => cargo_1.77.1.bb} | 0
 .../rust/{libstd-rs_1.77.0.bb => libstd-rs_1.77.1.bb}           | 0
 ...t-cross-canadian_1.77.0.bb => rust-cross-canadian_1.77.1.bb} | 0
 .../rust/{rust-llvm_1.77.0.bb => rust-llvm_1.77.1.bb}           | 0
 meta/recipes-devtools/rust/rust-source.inc                      | 2 +-
 meta/recipes-devtools/rust/{rust_1.77.0.bb => rust_1.77.1.bb}   | 0
 6 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/rust/{cargo_1.77.0.bb => cargo_1.77.1.bb} (100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.77.0.bb => libstd-rs_1.77.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.77.0.bb => rust-cross-canadian_1.77.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.77.0.bb => rust-llvm_1.77.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.77.0.bb => rust_1.77.1.bb} (100%)

diff --git a/meta/recipes-devtools/rust/cargo_1.77.0.bb b/meta/recipes-devtools/rust/cargo_1.77.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.77.0.bb
rename to meta/recipes-devtools/rust/cargo_1.77.1.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.77.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.77.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.77.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.77.1.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.77.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.77.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.77.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.77.1.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.77.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.77.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.77.0.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.77.1.bb
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index e2ac60ea81..29185f5ae7 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -12,7 +12,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://rust-oe-selftest.patch;patchdir=${RUSTSRC} \
             file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] = "66126989782cbf77fa3aff121bbb108429f2d46fe19328c3de231553de711b90"
+SRC_URI[rust.sha256sum] = "2ddc6f5e01df1bd6c7ff94d9931574181795a231b199ca6948d433fa5e795873"
 
 RUSTSRC = "${WORKDIR}/rustc-${RUST_VERSION}-src"
 
diff --git a/meta/recipes-devtools/rust/rust_1.77.0.bb b/meta/recipes-devtools/rust/rust_1.77.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.77.0.bb
rename to meta/recipes-devtools/rust/rust_1.77.1.bb
-- 
2.43.0


