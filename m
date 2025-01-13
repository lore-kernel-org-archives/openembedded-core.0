Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9508C02183
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 13:40:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.17026.1736775597617156253
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 05:39:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3108bd75fe=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DBNTgT023278
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 05:39:57 -0800
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2044.outbound.protection.outlook.com [104.47.70.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443s1phgww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 05:39:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lTfDojHv+tTjcdocwOJFTvkjifjQuDWuXiLfPeN936LCeiW1w+LhvA5a6i7t/Pya7HGE8xGnI6be2RLRQIYaAll+RpKkmJFdBUEQw2GX6VLy8grihoXOX3WMYO3sSuIdp1SGkwOI6TuDe8AZsgRFg+reIgGn0DxuV48gDJ62KVfCyP7EqRTBCSim4iklAFbAtNufAcCuBOO7juGcQu+saSUIvlHs9wY+1rS3yl3v8OsUfCL6QMlMFQvsAZwROZ5ZBwRBWYOL5h1b7z9LWRIkelT6fTPDk6Lxb4Fb4s7rGgbOd+89Mqd314Rf4KwaiiUhMQ6jc4bIRrTswRMIH5V5yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Cir8aGKxQ2sFGDw13Y0LnSfE43IHPNb349gw40FQO8=;
 b=ikReFIwxalx18OlFQblfql6fQGPRDv3Z4IMezn9qTkGKdS9yoRL3efziBTlP+VIIUX+VN4hd206kUs0U8EAX7pKEReaUSKNwA9qKfgEFIWmnsVyPJvcNvI52sjNXykvB8f9W/WqjGBb1NWUYFDI61RqoLNz4RkQwcIaoPUp9MwfOV34ytItsnYfkNVSj4v/N6V2d6qHJLR1D+Hbuw77lYXsWBZCpFsMNhlN7YTSbizfclSgGZVdqdqXXxzlvgzvEgFrthZnzdIxLK/J5BO9zVXR5P1Md3o42otMQAnR0z8WJ3d67UJbMf36bnbfbrjgbnra4XEb/x1P/832rjjv5lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 13:39:54 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%4]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 13:39:54 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH V4 2/3] rust: Fix for duplicate libstd.so
Date: Mon, 13 Jan 2025 05:39:35 -0800
Message-ID: <20250113133936.2968211-2-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250113133936.2968211-1-Deepesh.Varatharajan@windriver.com>
References: <20250113133936.2968211-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0083.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::24) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|PH0PR11MB5880:EE_
X-MS-Office365-Filtering-Correlation-Id: 38e5d455-b9e8-450e-e082-08dd33d7c354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OMVkSIdbXAXHVcfC+AbQJmdJYqPFuKm39eXQxDlX7OF7imeGi7YFyVEdzb0S?=
 =?us-ascii?Q?cUMIpkaSh59uORUEP89h7tYYvAkTyh0KH4tQ3e4zrPnJZjgNXlk0sZx7rCvZ?=
 =?us-ascii?Q?CfJI/iSAwJJEyMBeTumyjdU49Rg/jkDCv/z+uRBxz9hDyBpL0wyq2wfbOkYC?=
 =?us-ascii?Q?cxk8q12k3G8cKOdgpVFryu5+NKMFJjf64M2nMA0kzgcZRopUqpuSbzk9uti6?=
 =?us-ascii?Q?aod2iH6uMReS0i5KWrjYnKqNV9EMz8C7wFJwt8ZoZtt8mFuirMTsP7j3GWWn?=
 =?us-ascii?Q?H/muUGU9HBPgVXjmosKzrB/QWMToEOOzJYjF42dhqvykh52W3qwKFA0ZAa//?=
 =?us-ascii?Q?gKHZgNsTIljO4tsMTSHk5aqrX/8mSCbNcFUHhcWIsez+5V7i6DfYYaagkfZ3?=
 =?us-ascii?Q?L1yL1c0MrCB5OSFKehbouufABZBcL9Hz+bxM68696a2LHhKdme1TP5VlpXri?=
 =?us-ascii?Q?oUBWBNcaNZ8fl73SzNxdFz+5oCWhZGyAQ7uJW0tSEay1oBOAiPvx2BLmmd9s?=
 =?us-ascii?Q?WLhXlpqNHLJbpEHdY/xiHshnmdx5YRrDPMSBM0qpqWLRIR5xjzZgHMNBkOHv?=
 =?us-ascii?Q?eVnwTvflORVWB6UVo+6MVv0L+YcEOap0MDaBXFgR4RyZWG8gzKf/FXw0LDN+?=
 =?us-ascii?Q?WeTg6aljDPj7RdSOQURLxwcVcS29gR8o+jEeGV3VInuaZNQj9DPxEutUx3Wi?=
 =?us-ascii?Q?5V7MADHsIzIIXg7ETgp0JmQy5fRCCYsRt9BrWOF25n8RZtKkf55QF5+of/4J?=
 =?us-ascii?Q?FrDXeLmX5UWlw/s94HoVm8NVZFzSY99v17TSyGcSa0oRuJLKx6BfjuskbKbH?=
 =?us-ascii?Q?PjUmrpdaJushictKBMAu4q98j5xBBPpAfioq9wUwVRJ1FiCKAl/HAIJhMO90?=
 =?us-ascii?Q?mhQb0f6GHlWFjL+AOSo0gudGC/ciubYxptok+/j1+ehtGhG/BaeIccKlQB3U?=
 =?us-ascii?Q?fdZjmLMWBkj+YfZW50nzfHv4ybwW++wBsFz7A+W9OrOeYOTdC7ReaQyNR/9t?=
 =?us-ascii?Q?YNufBV+S9HiAFIoPVNiNSe/kOC56IoxbbsJ6qsrQBvKzZ3+/tj3BInreNpbV?=
 =?us-ascii?Q?QqHgpdJJZ6aibKaDacPYnDuwf7BQPdgct1NTepdoYamBoXfroZ7AY+7cpuBQ?=
 =?us-ascii?Q?E4ByqwrP6twVVSkGe/UTLf+CgE27HDBK5srJAbzS1nmHR2HyQ7v4Or2Qe3QJ?=
 =?us-ascii?Q?65Y+E1qMWGfUwpC/llb5AGRKBn4I5iwGQXcRqFWLC2vDVr0lZJYRYKIfzggk?=
 =?us-ascii?Q?iZW9vLyX92pNnT5KL2hBRWKuvl9Uwe84m7eGeVMI21aW0DsFZzOQBE6AeZm4?=
 =?us-ascii?Q?cX7bL+HHttS/7PSNaYl4YM6sYDic/Gzmb7T9CnGmBr1TsYMAFnBVhpsApr9u?=
 =?us-ascii?Q?j9oqmTPCTtyu3EOLT5ipFZ2O88oI/3tAuDl5JQpSv8iwUEaXS9iZJ/mYL3RI?=
 =?us-ascii?Q?b2o5wDuLDSBjXeLCumBLYjfUI2l28u38?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8yUSfWTFYhjM1iqJYBjX/hI8JxfbnI2Vmbf1E9rZiNTZdSwcZ5qW8AjXTkLK?=
 =?us-ascii?Q?0/7nigzhTOPjrJbxaKUURtuaGR+hwxwcmTI1yAKX+Q8GXyf8FduSMbz+SPG5?=
 =?us-ascii?Q?cIFMg7JGpNV8Kj621qHsAM0o6bfPnbl32yQeJtXzysbjaB5wkCwM+lHM1FvP?=
 =?us-ascii?Q?P43nCi1MUNyTdFZGE7KM7T19v/Jv5Vm2qQhhENWpM7iT9J+NIfvoezhEbWrJ?=
 =?us-ascii?Q?Xi1rYwbTWv7Oi6beLIvcbL1Kx119hhRjuyympaK26hzzbbCq6PP55ID8Cr0h?=
 =?us-ascii?Q?4lwe0A2PmQCmMbZJcbh+2bTW+Yxrk6mSHUg0aDMk3mcoEMpZ+au8Er4WKhY0?=
 =?us-ascii?Q?szO3tjjLNiTHdVLD61irAAOq1ytclTxkoTap85JjoDQaqDUvCnymOHLJwqR2?=
 =?us-ascii?Q?SP8ynQ9Zg7WvEmkJDPQGYhLlrQEm1o4Ja1DGp9rozZabJnSGHkdXM4z5wOB4?=
 =?us-ascii?Q?KPGTy6WQCt/HPOrDvXUOUEWdTpQPJg96/i0JL4w9N5fuEX/IFON2QZYT+nsM?=
 =?us-ascii?Q?V6JWYb9n4YkqfC9l4twN/RiT2JHgcMbcKCantjefW9EiU6gkTUnodacZ3TbT?=
 =?us-ascii?Q?affwViJ8R9T6DAArdaekBGLdjaFyxrQGbcsID1FoIA7yse8mmtyyYZumn9kL?=
 =?us-ascii?Q?bcUQpCoW0sZPtjTxP7XU2TFwtFwqzc74UJZ1bbjVbDhcVxXMjnvYDGMDZWrY?=
 =?us-ascii?Q?5iuSOO61TUD3KPIyTbyIAhpFjEJlJXzgDC1g6ujSF3UVLT5Zx1BTNvvaccGH?=
 =?us-ascii?Q?ss1ejPLeOI5B56zdPSodmAT3sq450p32kF/piWVQjixbW4PTgykWD3Nz8GDc?=
 =?us-ascii?Q?QpY5em4DruPr3CSWUlvKcqbt4RR6W/AZ1D2pFAE2B9GWr+OMq5BsgWt/FK6F?=
 =?us-ascii?Q?yOoXq3Gg2MlsrvrnGzoGQvsNL1hcEIsdrz5kaI33wVHBlHFHdAqs1xSJq8gM?=
 =?us-ascii?Q?Gz+khXYxYwANsivLxzYot1W4jdP6RLJBSrC98bgjZnA3CjLhge6uoHGIJ7eC?=
 =?us-ascii?Q?VHH8Nd6eSPrl/WgaxdQS62CQR9RA09l7f4vTzmv3tz37SB/RedrcTroKMCOz?=
 =?us-ascii?Q?mGrEu91upF2SCEpcLR7HaLdEP+iSsUGeKgZhrCh1bQ7LHm/qSfBiySdRtOhe?=
 =?us-ascii?Q?I5+itaWyFeV+9bQWGlrd/5Tvu932miNQrSLKP16OwrBfvhxeL/ZciiJNVB0l?=
 =?us-ascii?Q?Ez2Hsw91t8FgKkKPy9piQq9HyCmqb5AHMvkEVqB+twurPgGV2C26IkLdTQpD?=
 =?us-ascii?Q?ZnjJlSyhL3/BvXW3YuUBlYkIc2e7fYPmgt2VaYO6mVyc2oHe5zKUukfVvzBp?=
 =?us-ascii?Q?T9YcCA4MAK4ExCCnLc9Ewuys2wUFcQu8SmVUgZQVJik+plkf/mgqVboAX8oC?=
 =?us-ascii?Q?fB9j7fSRTS7w2g1wvz6AxmMcIlN9H77SOEcsGmLtLko6VKooBkVC731JOAsn?=
 =?us-ascii?Q?xjge289ou1W09CAb47J+XDYPHyT+ABPhL6n2d39UMzd7BvdIL7/73tw3Pwy+?=
 =?us-ascii?Q?OQHSb0ZzyE4eTmDvIbKqRNR0i4sW6EyPbMz0x2afPyeOjeYRk/DxQr4NR22O?=
 =?us-ascii?Q?BuXUmrBBtLIy1DL5gVNEpHV6mShnmfpnyIlWrNHyBAZ796qWAEaJzkpjv/ID?=
 =?us-ascii?Q?AyL/ZAdZb3l0MVnGmZ+txxs=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38e5d455-b9e8-450e-e082-08dd33d7c354
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 13:39:54.5337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lKGTklvPIhXcZCYVi4ZqiueVRbc+muIWR4jhDsAQaQ5qPCnPMjH26B/N59T2uKI+V/K037H5NBAj36+qPa1l8uzdkBmf9YwP1WErcVkMQXxyGD++8c3PoNSLAf1UBuBu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5880
X-Authority-Analysis: v=2.4 cv=DdLtqutW c=1 sm=1 tr=0 ts=678517ad cx=c_pps a=zz2QubYGG/9FVtTd3zWqHQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8
 a=6dGOS1gDf5vp_lC5mo8A:9 a=-tu3t9Ey6INAYvtyu7WB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: vawpdzPlHSZs6GBKsWRevim06iIat7mH
X-Proofpoint-ORIG-GUID: vawpdzPlHSZs6GBKsWRevim06iIat7mH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_05,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=784 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501130115
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 13:40:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209720

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

During the Rust build process, multiple copies of libstd-*.so are generated, as
Rust copies the required files from the stage2 build artifacts to the target
image directory. When these build binaries are copied to the image, Yocto's
do_package step encounters an error. To resolve this, the redundant libstd-*.so
files are removed during the do_install step.

-------------------------------------------------------------------------------
ERROR: rust-1.81.0-r0 do_package: rust: Multiple shlib providers for
libstd-20c3de2d9292cd03.so:....
-------------------------------------------------------------------------------

Multiple copies of libstd-*.so are generated during the Rust build process.
The redundant files are removed during the do_install step.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/rust/rust_1.80.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/rust/rust_1.80.1.bb b/meta/recipes-devtools/rust/rust_1.80.1.bb
index eae1f28bb8..b583508456 100644
--- a/meta/recipes-devtools/rust/rust_1.80.1.bb
+++ b/meta/recipes-devtools/rust/rust_1.80.1.bb
@@ -271,6 +271,7 @@ rust_do_install:class-nativesdk() {
     rm ${D}${libdir}/rustlib/uninstall.sh
     rm ${D}${libdir}/rustlib/install.log
     rm ${D}${libdir}/rustlib/manifest*
+    rm ${D}${libdir}/rustlib/${RUST_HOST_SYS}/lib/libstd*.so
 }
 
 EXTRA_TOOLS ?= "cargo-clippy clippy-driver rustfmt"
@@ -294,6 +295,7 @@ rust_do_install:class-target() {
     rm ${D}${libdir}/rustlib/uninstall.sh
     rm ${D}${libdir}/rustlib/install.log
     rm ${D}${libdir}/rustlib/manifest*
+    rm ${D}${libdir}/rustlib/${RUST_HOST_SYS}/lib/libstd*.so
 }
 
 addtask do_update_snapshot after do_patch
-- 
2.43.0


