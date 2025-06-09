Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3587AC61DB2
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 21:25:09 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.14])
 by mx.groups.io with SMTP id smtpd.web11.71254.1749504298980373336
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jun 2025 14:24:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=rDb5fV1O;
 spf=pass (domain: axis.com, ip: 40.107.162.14, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1xpRvR/x1NNaayfYSnDLw5ujge4zZD7I6I2NDkZN0kXnCqEWS/E2dfRDUXj0ARwcm8ziSPc0DniG/TF74v/eUkiVxoVHLbQWzlEIuHIfBemf6+337mhQZ2le33f9WFG/f29LSlmijbeA1CgIN4FdMzbj6ucU6CdslrzBG0OzGJLIeR7b9cNoK0bglrit+gjY8Cot/mnUcirRUYNoOWZoAEhsh283AlzeMJBcUDA0biSe3XuxEs6x7KPwQNarNlFqsi3gTqAIIx2RMCYzHsizgxA/OJc6969BRYkhzpTOLLk21ru2uzGTKJhwZuoJct01+hkvW3IBGn7Pu2yzOecNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imYiN89mduRh+Y1H7SYp60lEHGUwecSPz88coe9ucgo=;
 b=J8oDyzgxin57gkz57+GaPcNis3rUhGiU9ztTS6LZS3pLTpoEZmQRzvrIvbc/2P9bfKbNq5SsoIOilgKyVWsNdepqrJqO4pVuY/+bKdDqlrizRwoRLAlFoGOmUgzaUjHQO36UQzfKZiCEKoBlnCOdMAO3copmFmaSxDJQK45OPwUjPMMLyXAlkInnQ9YkqyDWYWdwHKw90u/SFxhcMWcYuJrM1igtFkCbDpRbMVGS44wmKpk5inIsyCdRNH+fLi/fEJ/lX7UTR7wqqd3Jbay6bJbXJVAgLi/Q5WMjtBs6PFtQE5gn9awgsLO33B8Po7EwQ+aO3g2xNMBF3eFhzpmfLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imYiN89mduRh+Y1H7SYp60lEHGUwecSPz88coe9ucgo=;
 b=rDb5fV1O1aE5eavgwu0sR26+0y/s7XKBbz/nguit175fdtuDioxTr4PNjaFeZMVv9RlZEbpocE1tdS6AREgnAxQSAa1MIdU5+/useJKwlSZeUyBq4CcWUgwNy8Ss0+vDpwJwp0b29iFIgfl5qFdtsL7YQQWKfMwZVEYk1zp6qeE=
Received: from DUZPR01CA0028.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::7) by PA4PR02MB6832.eurprd02.prod.outlook.com
 (2603:10a6:102:fe::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.28; Mon, 9 Jun
 2025 21:24:53 +0000
Received: from DU6PEPF0000A7E4.eurprd02.prod.outlook.com
 (2603:10a6:10:46b:cafe::ba) by DUZPR01CA0028.outlook.office365.com
 (2603:10a6:10:46b::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 9 Jun 2025 21:25:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DU6PEPF0000A7E4.mail.protection.outlook.com (10.167.8.43) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 21:24:53 +0000
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 9 Jun
 2025 23:24:52 +0200
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 9 Jun 2025 23:24:52 +0200
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id C9BAD193F
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Jun 2025 23:24:52 +0200 (CEST)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id C43ED1291BE; Mon,  9 Jun 2025 23:24:52 +0200 (CEST)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] cmake: Update to 3.31.7
Date: Mon, 9 Jun 2025 23:24:48 +0200
Message-ID: <20250609212448.1000608-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7E4:EE_|PA4PR02MB6832:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a6c23a1-3d1a-4a1b-3b09-08dda79c1307
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NgTnjm0k0KLrDrP06xKLWoz7tWnyAcKvRyVvaVXoaa8o5qqLXXRcdIJX+mX+?=
 =?us-ascii?Q?+C0GI83Izg5Tdt0FWzH9T9EwdTXgeMtUddSrxfpHUTxnxN2uLyzTtsjjOrf6?=
 =?us-ascii?Q?lfo9tXww2dv/JrShrW89MyA44omMv1LwSkWZFb6J5EhwueyY4214hhgwwVpF?=
 =?us-ascii?Q?a8+yFYLarugwkg0AboCzg1noHO7VojLRhhEHPiwSgl6mT6KhsBU/mYq7tLxE?=
 =?us-ascii?Q?Nc+LfjKOrI/5UYVkxbjjO5EKdZtvjxuPzoZzM6Lz0jNPqeARxw+m8Xlh5kTm?=
 =?us-ascii?Q?PYNDSqYKsZyw+tXMncDpy5RHaY6GKE4ISDoRl4nD39Vlg31axPhedWh0nCkx?=
 =?us-ascii?Q?YwfLE/Oq6dhIngG2/HqvPWi8/Vc7KpgKp8/hJeniMl1t8sUFHMdFns5QwHft?=
 =?us-ascii?Q?eueg4puXPQ3XCE7LUosQ2iQS8F4FC3mb0J1MphOYWsOlXcu9XrfZlN+mFflf?=
 =?us-ascii?Q?eGPpc3/laH+B3BStG2u1ccjeR5eQC5GfskezgwmsQt1XJMyoALzkRDkDwT/s?=
 =?us-ascii?Q?r3Lcc1Bi7jBXwbFnm1ujxo9e3/xcYJ/0AKI/RlRHi6I/3dG2lwgR8zmyHweR?=
 =?us-ascii?Q?vhMZpv0bzhvicPd9uqWPyCHDJanb96c2lVkSnVAlh1uTSMu6AwN0H8c21pGL?=
 =?us-ascii?Q?yYNQMDW7gIdvcInUAGfEFpn3pDRdT/vlbZBcDpYbqpVUYPVNRfcLEl4jfdYD?=
 =?us-ascii?Q?RC9aa+x0c5aHIpwv8G/DyML+aAGkf20toFU0H78dNkdJcmT5wuwlAlkWkclK?=
 =?us-ascii?Q?jfon1or33Qa7qEsydvA9wbV49zB6Z81EckthuNcXXY/qbUPYngPh7lwzEYdP?=
 =?us-ascii?Q?uo2Xdfhxxv+JHnNsbMQoruP9QADY9jw71HgbdBL1xRgogX3FcCuU82z/QURV?=
 =?us-ascii?Q?Mn1Wb5yxJDc56TqTbg9oNFKLZlpnLrQSPzQgSHWM1pyMQIlH7B3ARpxlh03M?=
 =?us-ascii?Q?B89CUwS4rrriE3AC7cD80pkfQ0LetYV2L89E/rf/H9X9iNceF4IfPP/IAPy0?=
 =?us-ascii?Q?QsIIl109PP+VEOfQjlqNRVL15xYxjLZun/d5B+9tNnVMJEt6cJ/LTH7Bm/X4?=
 =?us-ascii?Q?7nDYzuV3PENUu0QX+TwPcbYkS6Q2L2BkZPJycIiOcceoabABxq58QzUWkq23?=
 =?us-ascii?Q?fTlH+h+STpEt9xDtc3S9eKyabXm1tXmlhO5T+Y1JlM4QO5THV2qRxgooZ+Ug?=
 =?us-ascii?Q?ZfCHYQvoQejZZJyvWS2vMbZSk2sMbYlL7wC6qfPQ2JttT4+z2Yaf7OQr2887?=
 =?us-ascii?Q?2mC4GjAeHe8cP7oLEKVtpFh1B5uaLbFozzRc+BjK5zLhlN+RrFAPj3hjhlnD?=
 =?us-ascii?Q?WPBdCTlj16AH2EAat5z2SGwektCTB7Q9zSXCDW+WE3sfPgqQ03phz+EMKBmR?=
 =?us-ascii?Q?nPN19b/qeZcWKYavM544lbh+0+1KdV5m4+UtnWIc/062ZWFHO+/gWVLjtlK0?=
 =?us-ascii?Q?RA8tVZy+jNcgvCSyiC3MZEFAZqJjl/8Wic5zoN10cXYLBy+/cMABzQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 21:24:53.1942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6c23a1-3d1a-4a1b-3b09-08dda79c1307
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000A7E4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR02MB6832
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jun 2025 21:25:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218307

Changes since 3.31.6:
* 5c7224b: Tests: Teach RunCMake to ignore GNU ld --warn-rwx-segments
           warnings
* e9c4940: cmake-gui: Fix regression that prints an incidental error on
           fresh build trees
* 1b0c92a: cmCurl: Avoid using undocumented type for CURLOPT_NETRC
           values
* 1b4a802: MSVC: Split C++23 flag selection into dedicated block
* b3f1c60: MSVC: Use -std:c++23preview flag for C++23 when available
* 90d9c79: file(MAKE_DIRECTORY): Do not make directories for command
           keywords
* a039a16: file(MAKE_DIRECTORY): Clarify formatting of unexpected
           arguments error
* d54916d: MSVC: Revert use of temporary -std:c++23preview flag for
           C++23
* bbbbab4: Help: Add 3.31 release note for CMAKE_CONFIG_DIR
* 9b5915c: MARMASM: Fix loading linker information
* 3f5f2b2: Linker: Honor
           CMAKE_<LANG>_LINK_LIBRARY_USING_FEATURE_SUPPORTED when FALSE
* a9b126b: Linker: Save linker inspection results with compiler
           inspection results
* 7b552b9: Linker: Save GNU push-/pop-state detection with compiler
           inspection results
* d5be7c7: Linker: Detect GNU push-state/pop-state flags more robustly
* cbb8f30: CUDAToolkit: Restore ability to find cupti library
* aa64d44: macOS: Define _DARWIN_C_SOURCE in more sources
* 14ffd1c: cmXCodeObject: Drop unused CoreFoundation header
* 42390e7: Source: Include specific CoreFoundation headers instead of
           umbrella header
* 7b16db9: CMake 3.31.7

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...ative_3.31.6.bb =3D> cmake-native_3.31.7.bb} |  0
 meta/recipes-devtools/cmake/cmake.inc         |  3 +-
 ...ng-undocumented-type-for-CURLOPT_NET.patch | 30 -------------------
 .../{cmake_3.31.6.bb =3D> cmake_3.31.7.bb}      |  0
 4 files changed, 1 insertion(+), 32 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.31.6.bb =3D> cmake-nati=
ve_3.31.7.bb} (100%)
 delete mode 100644 meta/recipes-devtools/cmake/cmake/0001-cmCurl-Avoid-usi=
ng-undocumented-type-for-CURLOPT_NET.patch
 rename meta/recipes-devtools/cmake/{cmake_3.31.6.bb =3D> cmake_3.31.7.bb} =
(100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.31.6.bb b/meta/reci=
pes-devtools/cmake/cmake-native_3.31.7.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.31.6.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.31.7.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/=
cmake/cmake.inc
index 9b1898f22f..ee17482e3f 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -18,10 +18,9 @@ CMAKE_MAJOR_VERSION =3D "${@'.'.join(d.getVar('PV').spli=
t('.')[0:2])}"
=20
 SRC_URI =3D "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.t=
ar.gz \
            file://0001-CMakeDetermineCompilerABI-Strip-pipe-from-compile-f=
l.patch \
-           file://0001-cmCurl-Avoid-using-undocumented-type-for-CURLOPT_NE=
T.patch \
            "
=20
-SRC_URI[sha256sum] =3D "653427f0f5014750aafff22727fb2aa60c6c732ca91808cfb7=
8ce22ddd9e55f0"
+SRC_URI[sha256sum] =3D "a6d2eb1ebeb99130dfe63ef5a340c3fdb11431cce3d7ca1485=
24c125924cea68"
=20
 UPSTREAM_CHECK_REGEX =3D "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
=20
diff --git a/meta/recipes-devtools/cmake/cmake/0001-cmCurl-Avoid-using-undo=
cumented-type-for-CURLOPT_NET.patch b/meta/recipes-devtools/cmake/cmake/000=
1-cmCurl-Avoid-using-undocumented-type-for-CURLOPT_NET.patch
deleted file mode 100644
index c719c1fdfb..0000000000
--- a/meta/recipes-devtools/cmake/cmake/0001-cmCurl-Avoid-using-undocumente=
d-type-for-CURLOPT_NET.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From c608975f4490f67872926f2601e5c37f2e570307 Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@fujitsu.com>
-Date: Wed, 9 Apr 2025 01:40:46 +0000
-Subject: [PATCH] cmCurl: Avoid using undocumented type for CURLOPT_NETRC
- values
-
-Fix: nativesdk-cmake/3.31.6/cmake-3.31.6/Source/cmCurl.cxx:178:26: error: =
invalid conversion from 'long int' to 'CURL_NETRC_OPTION' [-fpermissive]
-Upstream-Status: Backport [https://gitlab.kitware.com/cmake/cmake/-/merge_=
requests/10449/diffs?commit_id=3D1b0c92a3a1b782ff3e1c4499b6ab8db614d45bcd]
-
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
----
- Source/cmCurl.cxx | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Source/cmCurl.cxx b/Source/cmCurl.cxx
-index b9133ed7..0cf8a71a 100644
---- a/Source/cmCurl.cxx
-+++ b/Source/cmCurl.cxx
-@@ -170,7 +170,7 @@ std::string cmCurlSetNETRCOption(::CURL* curl, const s=
td::string& netrc_level,
-                                  const std::string& netrc_file)
- {
-   std::string e;
--  CURL_NETRC_OPTION curl_netrc_level =3D CURL_NETRC_LAST;
-+  long curl_netrc_level =3D CURL_NETRC_LAST;
-   ::CURLcode res;
-=20
-   if (!netrc_level.empty()) {
---=20
-2.43.0
-
diff --git a/meta/recipes-devtools/cmake/cmake_3.31.6.bb b/meta/recipes-dev=
tools/cmake/cmake_3.31.7.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.31.6.bb
rename to meta/recipes-devtools/cmake/cmake_3.31.7.bb

