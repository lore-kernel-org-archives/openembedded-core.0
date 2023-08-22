Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7767AEE49A6
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 02:14:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.8790.1692670481270044604
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 19:14:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=fPhHya9O;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=75985cfad4=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37M1nNH6015920
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 19:14:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=bPEpbqg8oFbv8j5VkC
	Od34zvvFwMS4NM1/PupLdOuRU=; b=fPhHya9Ok0FE+jIdM1hmjHz2Jdr/wWjwu8
	qELQmcaCSIRlehNUdg0q/U65fPjufrcMArhb3v+vdoYN5gzhceErlLYO0Lba1OGQ
	Xga9W445bVT5jLlhHR4H9iawsgzhtpcKYIGslGaI92WtDercY3sLpIj9rqiOLWLA
	Z9tOIqzT5XPX8dkII7Prz87QGFSdsCPWnTQgvpEiGhLPs9sO6whwin6WySJ7WzFE
	PX0f5uYQNcHCoLrUM80qbNSsfUTUoXtasLM4RvUKblvsxEQpRHgdRQRkjrnCAjE8
	+H3xC7gfLp5+9Km3b8auUqoawCMuAbRN4bvEvSNn0cyFMzUHhaHQ==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sjs0yt3c4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 19:14:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZE2Z0OvhNmM2+fZFtr9LwWzDqq3Qy4IEOE90zh1rtDeFssEXiWLHVLkg8gzTrEgvMQSRMetojV9/X4933KlCZIumyYffSnf/CjDEARy9OxNDTC3zEcNuEnsUc0v7I+tfx7WQs9CG+PlT2DE9TMH3QriO0bt3kQC4nCJmwC9IaB8PNdR0xd7cXCsJObqpiJ0ZIItbsBgieWp0WFZMSc+MsFpppmiwZIZOhvgKG2hc3EPFzNQbSCfWbS9Cjh6cjV50bQoLk0sxkq+TUHOBlcCrJtLy4+3ZXEXkMQni5Ga/ftH0rngjztvOVFuROT4AVwGPTWHWc2L9EaqXaCIayNrkyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bPEpbqg8oFbv8j5VkCOd34zvvFwMS4NM1/PupLdOuRU=;
 b=fVgIAtWvo5Y26UXlr6vesN4yGUr5+lh3jX5/muAZodj9riVNmMb1E99qr4k7bwh4R92/zb64MC2wwhG5mZ0YwjNTrQq4Z8HaI5wxFkF0vPRV+jz8VaNHnaqt7WDLp4J53hCarFbU2Uu9woH3k+hkQVxkuIjz3Pm9Bi0yz/7lGX1oaRRKmmdz951HzIUn9ZF0sbMMQ2gs76jBCT/XLLc42aXgawXO1cf+qaUS7FSBBEGKIkp4s+4fGmrWG9ZCZKhgj7rIorJ2jvFABa7D5hTLyvSjH6jvp4tVlvWUDjgl3H3M2oasSM0pK7HLHQNHLbP8/T5NIxTGqX6QRpewjEK08g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5611.namprd11.prod.outlook.com (2603:10b6:510:ed::9)
 by CY8PR11MB7923.namprd11.prod.outlook.com (2603:10b6:930:7e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Tue, 22 Aug
 2023 02:14:38 +0000
Received: from PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::1133:b6c0:3f07:84bc]) by PH0PR11MB5611.namprd11.prod.outlook.com
 ([fe80::1133:b6c0:3f07:84bc%7]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 02:14:38 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 1/2] cmake: drop OE specific environment variable support
Date: Mon, 21 Aug 2023 19:14:25 -0700
Message-Id: <20230822021426.3203962-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.40.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0010.namprd10.prod.outlook.com
 (2603:10b6:a03:255::15) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5611:EE_|CY8PR11MB7923:EE_
X-MS-Office365-Filtering-Correlation-Id: d855dfdf-ed99-47cb-7e1c-08dba2b5895f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	flGugyl07sf2djc5y0Fp7vOIAph3q11+mG1q1edpSATO8rNkXxXVqYij+DLj5snbHCfmicdC0yRGPPGelSdgwlERIAC4vWpzznSQ4v+QARDCvc1yFEVI7QuLbHf8M4cJYEOtGZ5yChLx2+W7G4v8pU7t+GMBdozwcGsT3vdulHer1QfbXrlBLLF8h781IaAw2phEykVeYPT8yJ01zqGfl0wugiOj2PfWFAbaSOd3u+YbkEv8xV0Uek9M9fopIh14oDfW5O9WPqVHTet7HMzNNezANNGsH6uUGu4gl38kyULGi8qXu7+E0rrzmpL7Ly5qnZySsv19xidcuejJxj2I5SlDo/FbM1ivZSAQQ7pFmc4L40AN+JlUQBFxPVoVMI6rthxwlQSy5lsOyQENuEuLvQGx2/0DTMsw/PrgU2j6hcKQvpEh0WyruDnQlI4hfX7qvrgQYAyeoNdicPKTZNdj5N9D/ItfL6uxYD98vjvou6kVSOtla07sGx9uhixGj+ue9SDLAFM97uskBPaDfHeI1AgQOmvwAfVffhzIePtxS1Ej9Q2w3n7K3xJhIpd8WNthOWlwTFe/EdH/Dx4jjQ/NG5QcgOsTivS9TSl2JtMUGhk6s4NVGxLERBRwhEB2uW+c
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5611.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(39850400004)(376002)(366004)(396003)(451199024)(1800799009)(186009)(66556008)(8676002)(1076003)(2616005)(26005)(6666004)(6486002)(9686003)(52116002)(6506007)(83380400001)(5660300002)(8936002)(2906002)(6512007)(41300700001)(66946007)(478600001)(316002)(66476007)(6916009)(38100700002)(38350700002)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4Sntj4Cv4ECqz0o70+z7G/Qx6wjsIglngfpk3JEtcRYnvvfg/WcGKEp+0jMZ?=
 =?us-ascii?Q?JqrU+NP0Ob8xu3V09u8WOPNo81Au+H2N3LBAyu6zBeSmOBK49Njc+2Dq0DXs?=
 =?us-ascii?Q?zKy8Nna3qgXfKLv+mKDSvEihNhqU955AoNl5eF7cbFgGzuG9y0GWAd/XnTyB?=
 =?us-ascii?Q?Il79rPLvfB9fkIUvZThLYpIC7iDk7R2O3xo05BtneItMgtIh5loF5MmzGhBg?=
 =?us-ascii?Q?jZbCPTc6f3t4i5L4vzDn6nbL4B1A24OSVq+srGpuOTFjmzQBq242PM87XFCj?=
 =?us-ascii?Q?qZwVHtfSrarT0kgfYWsQD3KArzqXzksZS2UDmDboyBsuYI9vy18ovBeY8LB0?=
 =?us-ascii?Q?lgl4VnAphrtlckcaj277hiiV49/ycfKKgRoTUxQDo4o8UysCbPZkzsuOs6on?=
 =?us-ascii?Q?0CXjevTs3veLDisJYpLC3aKyfOm9+RRnmZrKs1kDg4WsJQnTfIOEfuzTfRqA?=
 =?us-ascii?Q?dNXLvU20oUkYESluhrVr1GQaOtKz9D55IP0J7TU4oSIXmSmvJ2AL6dqe19R6?=
 =?us-ascii?Q?dPX17EkbOGxTU2q8z4tXxsiCKvlUqOMxfApUuTD9ntVJ4L0M3CTtMScGA0HT?=
 =?us-ascii?Q?Te+FkWSgP4uy8FmvQAiSJdknTniyvwLdr4UhRFSMA2aP/3vtan6tW6rh36ae?=
 =?us-ascii?Q?/bkMdsEXB0/BVaTg0yfru7x+EkJt2e1kFxOnshIk8kUqcypBszydtLrwnWmB?=
 =?us-ascii?Q?1Z6Ur1CKP+v1qnSJTofyU2GKdDYkYboNywFwvve857KkXxHXP3zaucK/pgp2?=
 =?us-ascii?Q?Sgg8U1oSjB40OkG8VnIAOWcy30KnyC+OUzZD5+t+W3VwPe5h2G4B/oCPeUm3?=
 =?us-ascii?Q?gl0kwYc5LfM7GjXEB1DY68OuHpUbpxhN9bFXJH2N1XEEqRKpIG7PQ5yeXbft?=
 =?us-ascii?Q?nDgZhiNo0xLkq8zfYbCIE9XFN8TX0XI+FJpGcBT3W4fBiCg3cPZrNRl/tDvh?=
 =?us-ascii?Q?A3bCVfzPPreVoH1KgOc3NWHgeitF/ti5rNSnDay47o98939HYUjRQgJVtccq?=
 =?us-ascii?Q?SmZisESDbweqOwQGi4lqXAiavcLAqOFgeGTwAxagpj4H59LZOQa9za9rXt/y?=
 =?us-ascii?Q?nIypGnfKM0t7JyAo6TG/YkDlBxUJnQHdc0feBXbt5F6P9gus4EfbhzAnXA4+?=
 =?us-ascii?Q?vbeyoinruds4aYbcWpDP8j9zftjeWEnFwaK5zoFscvqPl7opEo1IciksJK+8?=
 =?us-ascii?Q?O8EZnaaCxTBWUC4x6akrs3fn/bHxW0stCaZtrXm+LfR/eTQHGoRVjmaEP88S?=
 =?us-ascii?Q?Oy+37APnDTkoNsdl8fWmEphA8NfrLMiCl1L0BnNIR6I1/6d3hk72WZ9kNFZb?=
 =?us-ascii?Q?AgH4z9VlEb5uJ5k+bk0Nr5nc9fJK6tYGjXKXqg7ru744ODn0g8bzWxBop7G4?=
 =?us-ascii?Q?UcuWZdm32DBnxx+bL+1V3ZqbqP0p6+0HEIWu8LFGrkiPs3eTcVWUIao3cM+l?=
 =?us-ascii?Q?Ut3MzlygkqI4l3iZRTMzhwnXkXobRVxrOvYkK6D7vKfG5SM1AYQY+Xgc1Xhj?=
 =?us-ascii?Q?SBZZnoEKpysWiVBdr5e/veoNmAEB8RrGmuiiFfQJtqBzX3vtJnJ7MCFnmwVG?=
 =?us-ascii?Q?gq9Oyhrel46c63vUO4ZEgbKEfhOYAomldGgSenNPN5h6HlOl7DZ0VUDX7u7J?=
 =?us-ascii?Q?9Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d855dfdf-ed99-47cb-7e1c-08dba2b5895f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 02:14:38.2665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BgBmFkbMZbp6D8fb5wVuyIsq8BNIt2W3j/gILmEMyvkg2k3ph0O0Hw6Fiqwd6/pibJkLa+N5KYd5m1u8WtdXGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7923
X-Proofpoint-GUID: EpdEXevvE2V4kxc1-izap6KprxEEMMXA
X-Proofpoint-ORIG-GUID: EpdEXevvE2V4kxc1-izap6KprxEEMMXA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-21_13,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1011 mlxscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=999
 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2306200000
 definitions=main-2308220016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 02:14:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186489

From: Chen Qi <Qi.Chen@windriver.com>

CMAKE_TOOLCHAIN_FILE is now also a supported environment
variable, we can export it directly. There's no need to
use a OE specific patch to add OE_CMAKE_TOOLCHAIN_FILE
support.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../cmake/cmake-native_3.26.4.bb              |  1 -
 ...stem-use-oe-environment-vars-to-load.patch | 44 -------------------
 .../cmake/cmake/environment.d-cmake.sh        |  2 +-
 meta/recipes-devtools/cmake/cmake_3.26.4.bb   |  1 -
 4 files changed, 1 insertion(+), 47 deletions(-)
 delete mode 100644 meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.26.4.bb b/meta/recipes-devtools/cmake/cmake-native_3.26.4.bb
index 2177aa81a4..26a3331cb0 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.26.4.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.26.4.bb
@@ -5,7 +5,6 @@ DEPENDS += "bzip2-replacement-native xz-native zlib-native ncurses-native zstd-n
 
 SRC_URI += "file://OEToolchainConfig.cmake \
             file://environment.d-cmake.sh \
-            file://0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch \
             file://0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch \
             file://0001-CMakeLists.txt-disable-USE_NGHTTP2.patch \
             "
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
deleted file mode 100644
index d13c367e78..0000000000
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 5acfcb2aba1a5641d390558fdf288373f5e39cb5 Mon Sep 17 00:00:00 2001
-From: Cody P Schafer <dev@codyps.com>
-Date: Thu, 27 Apr 2017 11:35:05 -0400
-Subject: [PATCH] CMakeDetermineSystem: use oe environment vars to load default
- toolchain file in sdk
-
-Passing the toolchain by:
-
- - shell aliases does not work if cmake is called by a script
- - unconditionally by a wrapper script causes cmake to believe it is
-   configuring things when it is not (for example, `cmake --build` breaks).
-
-The OE_CMAKE_TOOLCHAIN_FILE variable is only used as a default if no
-toolchain is explicitly specified.
-
-Setting the CMAKE_TOOLCHAIN_FILE cmake variable is marked as cached
-because '-D' options are cache entries themselves.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Cody P Schafer <dev@codyps.com>
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
-
----
- Modules/CMakeDetermineSystem.cmake | 7 +++++++
- 1 file changed, 7 insertions(+)
-
-diff --git a/Modules/CMakeDetermineSystem.cmake b/Modules/CMakeDetermineSystem.cmake
-index 2c2c2ac3..fae4f97f 100644
---- a/Modules/CMakeDetermineSystem.cmake
-+++ b/Modules/CMakeDetermineSystem.cmake
-@@ -112,6 +112,13 @@ else()
-   endif()
- endif()
- 
-+if(NOT DEFINED CMAKE_TOOLCHAIN_FILE)
-+  if(DEFINED ENV{OE_CMAKE_TOOLCHAIN_FILE})
-+    set(CMAKE_TOOLCHAIN_FILE "$ENV{OE_CMAKE_TOOLCHAIN_FILE}" CACHE FILEPATH "toolchain file")
-+    message(STATUS "Toolchain file defaulted to '${CMAKE_TOOLCHAIN_FILE}'")
-+  endif()
-+endif()
-+
- # if a toolchain file is used, the user wants to cross compile.
- # in this case read the toolchain file and keep the CMAKE_HOST_SYSTEM_*
- # variables around so they can be used in CMakeLists.txt.
diff --git a/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh b/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh
index 7bdb19fb6c..c94b6bb3e3 100644
--- a/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh
+++ b/meta/recipes-devtools/cmake/cmake/environment.d-cmake.sh
@@ -1,2 +1,2 @@
-export OE_CMAKE_TOOLCHAIN_FILE="$OECORE_NATIVE_SYSROOT/usr/share/cmake/OEToolchainConfig.cmake"
+export CMAKE_TOOLCHAIN_FILE="$OECORE_NATIVE_SYSROOT/usr/share/cmake/OEToolchainConfig.cmake"
 export OE_CMAKE_FIND_LIBRARY_CUSTOM_LIB_SUFFIX="`echo $OECORE_BASELIB | sed -e s/lib//`"
diff --git a/meta/recipes-devtools/cmake/cmake_3.26.4.bb b/meta/recipes-devtools/cmake/cmake_3.26.4.bb
index bb7ed83e30..ae29a3a945 100644
--- a/meta/recipes-devtools/cmake/cmake_3.26.4.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.26.4.bb
@@ -9,7 +9,6 @@ SRC_URI:append:class-nativesdk = " \
     file://SDKToolchainConfig.cmake.template \
     file://cmake-setup.py \
     file://environment.d-cmake.sh \
-    file://0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch \
 "
 
 LICENSE:append = " & BSD-1-Clause & MIT"
-- 
2.40.0


