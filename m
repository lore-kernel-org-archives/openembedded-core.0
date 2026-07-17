Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B8D4C4451C
	for <webhook@archiver.kernel.org>; Fri, 17 Jul 2026 12:19:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12142.1784290751594937565
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 05:19:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=U5ib07r0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1658a50258=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HCJBXa1111922
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:19:11 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=1Jv/bDQ4Y
	sepxj/DkAhBpfCqrBzla0EDTyLe2BB7Z1s=; b=U5ib07r0Rbd/BgmUm1hFAanCo
	aO4GPMJ9N6YygOTkVgUmOtTaTlB9k3Ed1c0sBZHoT9LNZ0GPPIpQQHqugmw1/jht
	kLEaKD4vlKh2D2eszxUftkTKRi/jsYXa4Z4krp5Alr7AJ0k1As+CyyyJUDfq7mUk
	7qg0fgucgSTymm2QigVKlMnFmxcR//4LBNGoo/GiovHo2GMiiKt3Hch4NG3jDvme
	c1bF75Vu4eoYrgpXV0YNz4cZcSo+1XSC3homVov5BVxyYVkoK3Al3zUQ2isK2Fa5
	ru8ge4ulUGOveOaLoWmJyJvnJ2riuW+QbRJtPThwPXLQwjNG76zood6CEw7dg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012034.outbound.protection.outlook.com [52.101.43.34])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ffgn588dx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 05:19:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F4EMplv6aVfyJ/Q05IQ8m5OicpDDF/1WD8BL6o058dgrsSJDt3W5mH7ETvITt8gBrpQsB9GTD0QHzZvq/u2Pfj8JR9oaMSwWayXvVQdY3dgBclF3thuF08Y7u5pMnWhMs/AL/9Rq6MxddCECz2SJbcIh2AbWHy2ndf9aNyIHMhpPY0sTeW2gfWOO/gA2v2icXuRsUZ7tLND5T1eSRI+GnTun0q9gpOBC1TQANOYfxrhNx2fP7zGY9LKkcIQIo4d99I/X5RrSmhYKIdmQhFi3QIqd6I6hOc6qI1FLyAaROTchM9D+czgEf1HKG5+Kva7DFM8Y/9ElVr0fAJHjxwdh9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Jv/bDQ4Ysepxj/DkAhBpfCqrBzla0EDTyLe2BB7Z1s=;
 b=pqj3WAsD+L5WAOQ5ZcIjW5WPIaNV+ML9YOj+InxqURnMMDC2Qx0j5OxbC++KNyMH70xoFfmyRu9/SW8WWrfutnzebwPD0y4u1nIuzUhv2ZNr0rpXB+3BX7zXGGdbyatqihPCAuzvlTYDLCFLt+x2pqgqTjy48IgsrNM5zYllHhVeDYbEDQQgHAYggPrUBprW8ukNOUa+t9lllTNnE1dpBylsOAL0H17pDzJ5jGUuob/smFIjX35IuJ7S4GdVip5jAYOPqy+7Up9s6a7fU2oYVA5Nv2p1h3EjWLwqrtCl8itJMlGqe+d0c8Uop8RNDcV39NnuqeNxELI1FCqZe95uag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by CYYPR11MB8407.namprd11.prod.outlook.com (2603:10b6:930:c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 12:19:05 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%6]) with mapi id 15.21.0223.012; Fri, 17 Jul 2026
 12:19:05 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH 1/4] packagegroup-core-buildessential-rust: add new packagegroup
Date: Fri, 17 Jul 2026 05:18:46 -0700
Message-ID: <20260717121849.2163115-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0438.namprd03.prod.outlook.com
 (2603:10b6:408:113::23) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|CYYPR11MB8407:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f9579ea-c8e0-48fd-c1d9-08dee3fd9811
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|6133799003|11063799006|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	JKMm65jXT5008vSqmei6UALhlQCguDrqQQ492aUQol0FWOOeaQ2D2Q+Lac8BfSA3Z6pQ0+L63awyGczUqvDlOXvQqOINlCmWBcXCCM14BOa4WGIU0ewvXe7yzvhh82N7WwyUca6ZTEumM+zvTzGyz33II4YvLNM34QrAwogp/EsYJB5kOQ/0H1OnPqrB1+pVYPOaMRJDI6+30DZeyvgellyNEhjOoxDiPgXmdZLPCg17LcK2RaU3isKcEjBU0n3r5UI9HTmfzvBl1fk0ZTc0SS6vd8rktdQt2myiEGsvFdlZCZrqUM12oNRNuC8F85uWTOjdxOFhs74pCV7N4JtQm+A0RK8tf56ofUgRdODkdnLI7V2/e628Rk8Bgcs8AquJu4vCATzsCo6gvtFLVyYcRKjY4y7VMCgBTTs6fOx6hNRNk17n0zhX01i6xZCjWTlptQTcxrzrZNzl8JfT02Lfgr1slYecyBUJX+PJeNcpQJat8HqLjc+AvFdH1Qd+uVVToWQZmLRPpdsvDiM4denpsM8wEQtfNL/jWqaSvC9qGhAMc5G8q19pTKLAmJZ6t0q8SLYqjCRMWDQZ8jjfnle7t8Cc39cDbwvbljs47Kc9zduUUO582PFpCY8WfMOtwVO+MpkFXiORQfhyg424Zui9t5SNxeskmurs6QzWkASNiVhGdX3UnTJBh2y0ZMiJ1t1Nam1wbgBPY6v5UF8ORf7UNiKDLJvry9X9Y6a9hmQuJqA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(6133799003)(11063799006)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5ByXH9b71nwCKDZTsQ0acMUm3rxDaszavFO1xrZV2zhqsYPzHJbjktbrEDey?=
 =?us-ascii?Q?NBLx4yE2Mnud+sRW38SBoCyNF1NClbBeUi6JuUfEt9M/2Xjt0pLv+Ls/jYby?=
 =?us-ascii?Q?Da+BZYl0JBG8cvRZi95lfR9At+DSmE1lG0s5zFF6n1PfjZnNW6L63RkCqwNx?=
 =?us-ascii?Q?d0k382Oei6luV7wwEUvPBPJQL8Ti6cg2YF5nW9U8f6LLI3Hq7cqSM3JUx5Nc?=
 =?us-ascii?Q?YhoAxNsxmv4Whum6vYiVJBH1KJMU5bXLt4UzgXpiNzaLMdLnGDQjd7eHrxEh?=
 =?us-ascii?Q?b08h5ixlWtdBN/aYrGKYYJM/Q6zbiFjkypCTEOZWuQUyCo5QybRuxWaEYuvm?=
 =?us-ascii?Q?34D7FxKhnjgB/nZLzgqKVA6ORgTxe+3NxUDF98reAVB1IRJcUTGbc6dY7S+t?=
 =?us-ascii?Q?kZr0SL1idohImYcr/mqwJTnK5bKRyRKKa0/U4Dl8WjXUKn3edfd2hZi3EVgE?=
 =?us-ascii?Q?r3NM6HSo+Snw5vyhR6c3ND93tS/AcMZR/SUqAFEiQphKwgllLIoqZjTn9+s3?=
 =?us-ascii?Q?O6/SAidWf6WTHRbO43CME9mOJAFquLv6+wocO+jqtyjzR24NqQr9l/DIHeMu?=
 =?us-ascii?Q?xKKE1yUDpRIQ2yVGzE+WV/kIYBNr/acNXZNYq/DdpyYrkQO+Vs6xomSLrBmi?=
 =?us-ascii?Q?3r6Sj8eaWEIOfAXuluyzZOyDbUc+Zn0UixSdT2pa2opxSDtJJzTAIBbkLe+S?=
 =?us-ascii?Q?TVoHVFiH63IsUjzeqVfOBOyBDsbF/2Tw95XOrbGbJo+Wp77siLC6WwV1ZRqx?=
 =?us-ascii?Q?a4+p7hqfgMFB6GB3QuuLqhH4vp8Vln1VdPIGOfqNKjTRwo7XEjYT7obBiFU1?=
 =?us-ascii?Q?XWmL1gFVQf4BFsE3qhvEQmy6Rfcr9fgIGBr9dllky2uGyW/jXFaLREVEmoVG?=
 =?us-ascii?Q?CkWP7+vO4T1jIcKT+iH4WTI6OdtQYed21L7K8EtUtp1Psrq3SEIX2Noel70L?=
 =?us-ascii?Q?3ZrjK6VAyi1cDCwqGCUCtrd0tu9kDdnFHIiHOuM4XLnmN8mPe2c5gfYSE4M2?=
 =?us-ascii?Q?FLV3SOu1tiCQ/ZkOt0sQVF/RsZzUHd6Ezrs50i43bu7ENXvCtpdu/ilvmG+k?=
 =?us-ascii?Q?dSQN7SXYePknJl4g4HZbgA72OGxqfgEr0VO4MTb2LY2gH5+o4NqYH0kYhmft?=
 =?us-ascii?Q?IIINIQEQnrVGEyaa1nT+yy2FSe8gyE8aST43gGbibQZvrJ4MVKHE28kRiPOc?=
 =?us-ascii?Q?RyidHKmT39vjLRojqhUn9z0JXeq5Wb0uIghDmDdAKG4qvyxoS3C8QA9+iSTX?=
 =?us-ascii?Q?UVl5HvfTjmGRu20XHL3FrfItoDHecMMyZ4JtGPMWGWvGcwiIwPrXnyWY1RqH?=
 =?us-ascii?Q?WZFPFNU83UJGjgg4kYxMqZF+ZOMGIzNKw7nmW672lT8uiy59L+30f/rAIY3L?=
 =?us-ascii?Q?FS9FGooJru4aLUHHWaj4Z7GycXAcOK+gd53Pg3fPLRpb9DZrMMq1zETNPm+I?=
 =?us-ascii?Q?jIVmzdH94K4n8Db8ppa3avDNAvjW+XHcgST8fD3D/k17J4qThwc+Ui52gCoQ?=
 =?us-ascii?Q?8+hEXM5xAhZZUQ3ycATDt6kiOtR8Uo3p+ENl38v0xn8zVna0KCU1I/JiUwlx?=
 =?us-ascii?Q?Ekef6nNXvMwc9TdIpIGOxI3zGF6eaCUSGYsrfW/ZCfhmb6klcEEqMnrGwj/v?=
 =?us-ascii?Q?GhI+FE4zKtx8rU6XFF3ygE37wSgdSE8GhLzNaNNMcNbc59B9H1jzQbFJPPUm?=
 =?us-ascii?Q?tTU385CYHTzhy59lBznLufy2lC/jgxYPtb5PzTKLPTMToFk9ecx4hxNhIA0p?=
 =?us-ascii?Q?dZ7pkbBb3gmZWP6xBP3pjnKteJk7MrY=3D?=
X-Exchange-RoutingPolicyChecked: 
	gcNGgp9TiDGwzwVX7m3wL4mT1gRwAuWaxSDxHzC6AV/S4fP+ysWt9Z4tFhZ4YwWcivJDd6duc6EZTJ+s2V9grs0fKX4FNChfRHoFsfbh3TXCQWxD/vqxvdFnPFb7xe8TqkLPj7zmyNUNrH7gXb5bBRqSHlR0Q5zQS4KX2bW7pGpuO7Oe8/9ysJJOxsTP2BG+m4oD9ehLzkS1qPKylOgqF/t8APYg1Y9anrBSSJKumeuaYKe+3TTLNzz2Gb7nweyT/t+VdDe4bJLuZjBR9MM1ogd8D2NDjVyrzDkKqbkI0+u/RVryIYRzYYgYVe2wk4f2gp/V0fgdBY2cAFDye7a+VA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f9579ea-c8e0-48fd-c1d9-08dee3fd9811
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 12:19:05.3552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DLoR4abQsGQPrvo+vusUMdg2tBbUh6FGlFD9cbZb7VxrwKK5lII2sxOg7fqhStTUZRFk1gchxs0L9y8ZQNMPbmLpsdb61jRDBWQDCEISaqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8407
X-Authority-Analysis: v=2.4 cv=eYQNubEH c=1 sm=1 tr=0 ts=6a5a1dbe cx=c_pps
 a=e7UpQLGcWimQYEoqUdNrWw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=ykIo3778XL2VIhXAJQcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: ClOCSyz0dsSyjlfnKojkqTdevhgzGTek
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDEyNSBTYWx0ZWRfX+gYU3y4djchv
 vKbTWALb+aSqOyAUa+00tR7pfgDiqp23ytmJ713msX5TTzcyxXQQro0sY0zXhXUL7R6pB3fD6x5
 Nxi8v3T+3emUXZMDCt7bLYsSJ4ZSBPTpMuaDlflYnoubQjrI9lsaHsRGGODwIZHuhwH3v3KLoYV
 A94eVCvBNBdnP7cVxPk/lah8AXgWhGxkRV21Xy/1pCXcxJ6PiC21or5IhYjMRA9PaZ3k77K3sQx
 /hpTFOQPQUPBgBZfRTrrQi4jJY4BHRMZus5yHppiZu1vN3SmI5/hTEhUD5YC9qYYBcZl3r9VMg4
 o113Z4AIPHa8vPXAf0+XSXflVOrWAMT6CgBfHiB/K+UaRWe95XKFu6ZOU6ZZCEKuko0Wk7PLxuE
 Gz+CyUw5t420gmP/2t/p1lGCRDtM5iEeuHyrRBaz/iLRP7XfBiT8q0R56sEw8S5gGaHEncyoOFy
 Yd+7BYReOFQIDsRuNXA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDEyNSBTYWx0ZWRfX8lCyje3pEGxo
 YJoY5FtChFXyRMxsEPhnpKOOuBLh9XRphl81IwZyrfBEFcr7A1QqWKmVISN6WDjsyQB0QZi+bEG
 fuaa8ZYRClgc4/rJ7zsc+y+RCxSq1fCyuhS8UWQK1/bq08Ov1B7R
X-Proofpoint-GUID: ClOCSyz0dsSyjlfnKojkqTdevhgzGTek
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2026 12:19:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241164

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Introduce packagegroup-core-buildessential-rust to provide the
on-target dependencies required for building Rust-based kernel
modules, including the Rust toolchain, bindgen, and libclang.

Set PACKAGE_ARCH to TUNE_PKGARCH instead of the packagegroup
default of "all", since libclang is dynamically renamed per
build (e.g. libclang22.1), which is incompatible with an
allarch packagegroup.

On riscv64, also pull in clang, lld, and llvm-bin, since rust
support in the kernel on riscv64 requires the LLVM/Clang
toolchain rather than gcc.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../packagegroup-core-buildessential-rust.bb  | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta/recipes-core/packagegroups/packagegroup-core-buildessential-rust.bb

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-buildessential-rust.bb b/meta/recipes-core/packagegroups/packagegroup-core-buildessential-rust.bb
new file mode 100644
index 0000000000..c1993af9aa
--- /dev/null
+++ b/meta/recipes-core/packagegroups/packagegroup-core-buildessential-rust.bb
@@ -0,0 +1,23 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+SUMMARY = "Essential build dependencies for building rust kernel modules in image"
+
+PACKAGE_ARCH = "${TUNE_PKGARCH}"
+
+inherit packagegroup
+
+RDEPENDS:${PN} = "\
+    bindgen-cli \
+    libclang \
+    rust \
+    rust-src-lib \
+    rust-tools-rustfmt \
+"
+
+RDEPENDS:${PN}:append:riscv64 = "\
+    clang \
+    lld \
+    llvm-bin \
+"
-- 
2.51.0


