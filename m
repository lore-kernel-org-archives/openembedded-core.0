Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.89])
 by mx.groups.io with SMTP id smtpd.web10.2467.1607392759901261169
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Dec 2020 17:59:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=bDatU1QY;
 spf=pass (domain: windriver.com, ip: 40.107.223.89, mailfrom: jiping.ma2@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SBOCXQMhNveoSWWAwTTnIX5TVIuyVs1SssnNCocXehAqVX/L3lQfUwxj2s4knI3NZXDl7EgCxk/xuVQAwi/H7fXeRnsL6c6Y/stwL0gF5w5QyACXg/pte6WpA03PcMxPsHMjpmSihn0A4M2IXDPq0Fly4BONaPmMZAUeQTe1LDjUz6K2l+q95H0V6W1omqO7lFAEF+ZRH4BMxXX49CBAynyUaOV/MHJefdUXJvR3Z/Ke7LC6YiQdNsSrW0yRqIUrSMKtd/DP/WZ0yIA6QVLOoKBbm5PNxOhpzBilF2TKW5ZVzQv+b0QMrKcyey+uuaCQUnHqxQRvUXdFXGiqc7VDQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90MCv3YI8WhS5BCLnqcw9oKE03w0ghMK4o8R6QMHNxY=;
 b=c38RQ3hTZktivX59R+S9YthSFrCA8DglV/K0bCIi9ZGXPEp0KD70R9neS39zpWuqWmrisDiGT1qAmPaKV7RaL53uYHBv1ZIZCJeGzU3qY/194nKSJtJ+ErECZ4ysJKaFxlESWHOE5gGzMMhdrgzXkmcph/r7aSmgkjtoGS/P1eqdjpw33mpMcWKUUU/WYsbUMCS8JbuWWiXcr3cYGjm7uHmsEOGSuOohvl4SDHsWEeiONTU14EwQlXSx//7fOv3gMUi/08hKbmARu+RsBDAX2g2e/MwGqQBuw0U8Ae/1yZLRVjd/vuPAq+rP0kM8UW+AcuNT9yOtfumW5MJuKaM3Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=90MCv3YI8WhS5BCLnqcw9oKE03w0ghMK4o8R6QMHNxY=;
 b=bDatU1QYdmRkTUv+Hl8FwtcZMtlQOQ4/MV9GLj366u8kLTMBAB7uk4ZmqP8THERkeiwNrOrCAnXypn8VOGfKojBSeWzv1B5neSNa4O0hX2U7tKRzVol+XaXsXGC+m8I5PsNJeCQizkFYMF+ei+loKA7VpaDi1nEBYMP5/Ry3lN8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2747.namprd11.prod.outlook.com (2603:10b6:5:c6::22) by
 DM5PR11MB1564.namprd11.prod.outlook.com (2603:10b6:4:d::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.21; Tue, 8 Dec 2020 01:59:19 +0000
Received: from DM6PR11MB2747.namprd11.prod.outlook.com
 ([fe80::dd9a:8caa:5d02:f349]) by DM6PR11MB2747.namprd11.prod.outlook.com
 ([fe80::dd9a:8caa:5d02:f349%7]) with mapi id 15.20.3632.021; Tue, 8 Dec 2020
 01:59:19 +0000
From: "Jiping Ma" <jiping.ma2@windriver.com>
To: openembedded-core@lists.openembedded.org,
	yue.tao@windriver.com,
	jiping.ma2@windriver.com
Subject: [V2][oe][master][PATCH] packagegroup-cross-canadian: repackage when multilibs gcc gdb binutils changes
Date: Tue,  8 Dec 2020 09:58:19 +0800
Message-Id: <20201208015819.154331-1-jiping.ma2@windriver.com>
X-Mailer: git-send-email 2.18.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0198.apcprd02.prod.outlook.com
 (2603:1096:201:21::34) To DM6PR11MB2747.namprd11.prod.outlook.com
 (2603:10b6:5:c6::22)
Return-Path: jiping.ma2@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp2.wrs.com (60.247.85.82) by HK2PR02CA0198.apcprd02.prod.outlook.com (2603:1096:201:21::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3632.18 via Frontend Transport; Tue, 8 Dec 2020 01:59:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0cfb2c4a-931f-41bb-99e7-08d89b1cdfde
X-MS-TrafficTypeDiagnostic: DM5PR11MB1564:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM5PR11MB1564E7D9A394F76CDE5BC081D8CD0@DM5PR11MB1564.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ovXd9isriQmDsm+cmNMIvYjEqm1riAjC6kTWB7hcgry+bxNjAnWj9VPbULVNHKW6QcG/lBsZWHz1gWG3gxtk/wsU8n42FgmM/0UyQpGZgGfQ3vrY93NTZ6mTDgVd0jc+j2SclT1JD1eHm09QFXUau0zjRvnBBkithj7xCBCoje4SuW39U26DMnXPyJPay5/wCJr8/z0LzvY5fMLXyLFl5zAOSHrAJ9nxk7Lnysg1ida/oLeaSWGYzbEErVFS1F4sX6o5M9nXe3pcPaZ7r2FVJsKHTtJ1iX7lNWKGv17q+n2y2q5oh5gdUMlWkceO50yX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2747.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(396003)(39850400004)(136003)(366004)(346002)(478600001)(1076003)(5660300002)(86362001)(83380400001)(16526019)(26005)(2616005)(316002)(8676002)(8936002)(6506007)(66556008)(2906002)(52116002)(6486002)(186003)(36756003)(956004)(66946007)(6512007)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?2PKQsEIR3PkI+PPlzxiYz3siSloMuLV9vOSZusE6ZRAV3RJyHWhDRhbaoQFn?=
 =?us-ascii?Q?0ied+jZE6fCeIxR+aq6kWdaEZjWl43OyxL+2/kzDLrV1kOnACoid5VwE1QI6?=
 =?us-ascii?Q?ywAnmUFzi1jrQjlWGL67us72SAHlO8COXGdD17LWeMY0I0k4cQ+Vj+ll+oFP?=
 =?us-ascii?Q?mjAwX5BQ7QHTowzZAU9nGe2k6ty3gYzfjXjMR22jySu3Wi9NHE3fqMXaWNlU?=
 =?us-ascii?Q?rTfbd6mxbOUzjlWS5VMLtFmtlp+kQqPiM+Onh28O7PHgCQgSXXmsQkre8EYX?=
 =?us-ascii?Q?HFnNaxsk5uNkelUfQA2EO091ZzpSZm0YVvT1XJDzs/bCgQEKB3NSN5CLw7ZL?=
 =?us-ascii?Q?UZViEYky+SLS2gzwjDItua0KkDDaEl/AwwvPNtqZAEbUTXQ04S2b7BLFmXlV?=
 =?us-ascii?Q?PS19vjfHnhhpjy6/McAqwTV2/LcJkHNjs8PlBM5EQTjZCOsghov+MmP/OmZy?=
 =?us-ascii?Q?87XnTliWjVktLkSWaPqOqtMGorHTxAWtmvNO9DA1oUlUxE6mS6uiGV8cMMwm?=
 =?us-ascii?Q?r3YTjc1Vf3YgM2Kuviku0ZLq9xUOmnRkxoH0TDB1O1F+fMfbnIcEuXPkSpIS?=
 =?us-ascii?Q?bi9rBI4jXo36V4Ldvdlgbwr9pYdVfsbpW37OQZIzW8NhyL1IlD/NtyAiKx4/?=
 =?us-ascii?Q?tmxG+zKOGkRnhJeCYtKByide9f4L6ofarPEW9YPJdKO37G6aKrZMMXibqGZM?=
 =?us-ascii?Q?npxESEwCzczOgpU1MxSEQwl3ibkMNm8O6gTZyNDhrV1M+zE4BR0epC9Wr42w?=
 =?us-ascii?Q?YUcpdwTrnn5lP/Pxoq6KEqQuMGIRAclpPu8IZRBRtq+LcL1nS+l9GmdezqfG?=
 =?us-ascii?Q?KKo61rV/2ZpZDGHClR4PaS9j8Ps/LkBNap4jeI4+5kR5UaOBVTkmBLkgt3sq?=
 =?us-ascii?Q?AVFt6roSIuuORslezr7/YOMsiLHqZOP/githaI7EygRdBrtxPskMPDt/FKZd?=
 =?us-ascii?Q?QpfeeuPcjvatRRWG6+osZE8jtLV21+uAx+nOUuKgv0oai4Qh1MIEIuZ/BElF?=
 =?us-ascii?Q?4+qU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2747.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 01:59:18.9482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cfb2c4a-931f-41bb-99e7-08d89b1cdfde
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P3VIabufg4JVPUZRyETo2o6OXz1J6bM9CtQwC6UxmC016+VkGc/OG1a0hhPJkqNe02P8avNOMkslSs3GvrcCHfIFq5/9Jsn+buHU6PR8p/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR11MB1564
Content-Type: text/plain

1. Build SDK without "MULTILIBS = """ in local.conf.
2. Build SDK again with "MULTILIBS = """ in local.conf, build will fail with the error info.
Error:
 Problem: conflicting requests
  - nothing provides binutils-cross-canadian-arm needed by packagegroup-cross-canadian-nxp-ls1028-1.0-r0.x86_64_nativesdk
  - ......

Signed-off-by: Jiping Ma <jiping.ma2@windriver.com>
---
 .../packagegroups/packagegroup-cross-canadian.bb  | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
index 3b430c0814..b6b3e5235f 100644
--- a/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-cross-canadian.bb
@@ -17,8 +17,13 @@ RDEPENDS_${PN} = "\
     meta-environment-${MACHINE} \
     "
 
-# When TUNE_ARCH changes but MACHINE does not (for example when a machine definition is updated), 
-# cross-canadian.bbclass prevents variable dependency propagation to TRANSLATED_TARGET_ARCH
-# This will result in erroneous reuse of previous sstate packages. The following line
-# establishes a direct dependency instead.
-do_package[vardeps] += "TUNE_ARCH"
+# When TUNE_ARCH, GCC, GDB, BINUTILS changes but MACHINE does not (for example when a machine 
+# definition is updated), cross-canadian.bbclass prevents variable dependency propagation to 
+# TRANSLATED_TARGET_ARCH This will result in erroneous reuse of previous sstate packages. The
+# following line establishes a direct dependency instead.
+do_package[vardeps] += "\
+    ${@all_multilib_tune_values(d, 'BINUTILS')} \
+    ${@all_multilib_tune_values(d, 'GDB')} \
+    ${@all_multilib_tune_values(d, 'GCC')} \
+    TUNE_ARCH \
+    "
-- 
2.23.0

