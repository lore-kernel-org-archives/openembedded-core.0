Return-Path: <eero.aaltonen@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D9DCC433F5
	for <webhook@archiver.kernel.org>; Tue, 30 Nov 2021 13:24:32 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.53])
 by mx.groups.io with SMTP id smtpd.web12.76107.1638278669507650399
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 05:24:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=wVnVJ7FH;
 spf=pass (domain: vaisala.com, ip: 40.107.7.53,
 mailfrom: eero.aaltonen@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nKD9+mZSlfmYkuuH+iOHLSe2LKZ0o95SEHM4b996TjuQALIvnyEs0OD1Af1I7lcUsg2aKVNdUboMxm2SjjUXnOB4sjjPNM10lcbJ82OtMalKpzuKBokYK+iJZD3EbbJp4DKREh5+dKFZKUfHMy0gk3MqEv5db3tQTbSt9fG+WzP66jjrYOAg2i+MxmOvrgo6kZJv7GzTiymh+gCsf7OoG+nPlPRoBhyUDOgYE9xI/ImwFIanT3CCq1qMUoLEZ6S2HZQkMC25GcNGMd/fcN9z1sIJhIrGqP4HNPvvuVEs2ElTzifkYIVYbKuXJ6VDhXGqOv1FILTRL/b+ADz8JMgAFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abactHdGhIhEeS8UVtor8AMDWs2N13okW1IxSrUj0FU=;
 b=QDErzwgMVduVq34rtpKyazYYBxygYx6++WrZMuGD7k/zZfvaR1VZFpDYeVLWgimE6/O1lO6FUEubGcUmYTsm63jkR0uJ8C9zaW6ND3WvZlp7jWS0Y8/3J9WSF1KCBY05U866wapopTiX+Du/gzECjeHZrwUa/Od5SZUU2OnZnEhVbe4r3N51ICRz8DZgrhAmy9X2aCoCqaLBN/L8BhERgHzClLHf9pzADwZpxwbdYyP5CgCORh6jXjrryJsdwd2cMvvDZ9oJX8vUzuhPJL7POp4iLR0eopzWH6/XzAGrLniTR2w/f3x8L9X6/i1DQ8xpSSXtpYesEus4rSGVbNTyag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abactHdGhIhEeS8UVtor8AMDWs2N13okW1IxSrUj0FU=;
 b=wVnVJ7FHPwEaAtlzVgrmPLh0eMUMHkUpCWPayd31WKMApOhqYQ4O7v5bxD1f/oeOCvSARaOz+DmtDbf/B2vOzPa5jh+8cffw7MfDdNnpg0jn9CnVhsn6ypSMHrzoJbJIEVWtmo4JyoZzyljc9tYmhmaDvNECeotzIEmT2i9HALjC+UzRbOvc378SF0iubpSb42udkcHjZX3/ooqsrzpKlGdNjrDeb9OnkPtXXiRxED8km0bquGXVUuRccJ2Ip5RRk94/zRB1Ji3gG3OZ/miAmsylOO9LpkBStEhr/vjVxC0bIoSCTqiXYIVlTObYcKwe7dIlp4tsWNg9syx2IF5xhA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from HE1PR0602MB3340.eurprd06.prod.outlook.com (2603:10a6:7:23::31)
 by HE1PR0601MB2649.eurprd06.prod.outlook.com (2603:10a6:3:50::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Tue, 30 Nov
 2021 13:24:25 +0000
Received: from HE1PR0602MB3340.eurprd06.prod.outlook.com
 ([fe80::d92:5470:cb89:9852]) by HE1PR0602MB3340.eurprd06.prod.outlook.com
 ([fe80::d92:5470:cb89:9852%3]) with mapi id 15.20.4734.024; Tue, 30 Nov 2021
 13:24:25 +0000
From: Eero Aaltonen <eero.aaltonen@vaisala.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH] cmake: FindGTest: Add target for gmock library
Date: Tue, 30 Nov 2021 15:23:59 +0200
Message-Id: <20211130132359.14147-1-eero.aaltonen@vaisala.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0297.eurprd05.prod.outlook.com
 (2603:10a6:7:93::28) To HE1PR0602MB3340.eurprd06.prod.outlook.com
 (2603:10a6:7:23::31)
MIME-Version: 1.0
Received: from hel-blackbird.corp.vaisala.com.com (80.220.173.83) by
 HE1PR05CA0297.eurprd05.prod.outlook.com (2603:10a6:7:93::28) with Microsoft
 SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Tue, 30 Nov 2021 13:24:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1c974920-e542-4335-671f-08d9b404ba69
X-MS-TrafficTypeDiagnostic: HE1PR0601MB2649:
X-Microsoft-Antispam-PRVS: 
	<HE1PR0601MB264901188B8F15270E8FEE80F5679@HE1PR0601MB2649.eurprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	v1a2qRp5KlduD7RKH2yb/CZF3QSZO2zt5IVEb0Z/BzkRowLJJLL4sZOEFcsSIeyUhDNr4TutI5lUuiXniwDz05rARQG/kxTWsgglQKloc3mgM/W5v9KleYpgr5/0gTip6hOZ92YxTJa9u2Cizay/R29eDRc2ALew/vPIrFICi+2nHeoV/tvc474YcCCC6pVVnX0Xz7BLpY10IIlhcrL440woWj05WWlQjBGwmyi98E8UnlQGrOMt1Si5vSqF7B+9USC0LQOMl0SePvv5wvi/1V+VXr/WGlLqWJ2QHLCcugOiwcX8/PF+GV3DosGBawPKEnH2TALw3ksjz/3AZLBycQmbCAwR6iejvGn8oGdd++1ElR4QTafo+q7qc88nFgBTDnRwEmnAXhvEpHSUIVbq9y96VTKZ2Xa2/eXCLYs099jnSDwmdqCf5tiXAw5ALgM9WiyyLHtDyl8AmpHr5ROSEnxvqeFwNEBihb8+FBMSLrySQ4y/w0L/lwUGwj8G3+PFMOh5MyvbuZOjhNoJg+Bj8jpNI6+Lp/REH64NtawYioRkbnA9xr1eaYCxhrxb+wR7HzL9M+/QDfhXv9J1XKy+FPC5ermmWwE0K/dvHIQ2/DMktCC5WnEmepgH0q/3uDb1nskM69BnR2LqFJL201f/Ns0iQbK3hFcAAxpUvGMgqQj5Rp/X77Dg2WleluGjW97VAHJiubKKz+N2LL1rtsj9MjTQBrQ7ViIpUATetD47gxxX5VFOt0+7kQJkdFngScU2bocCC9u5D2UwbRNVMDrOwAHYLK5XPbs+VWlgp6fXjlPy/ISblOsmvI9/UJNEH5CDGQldR6kzdgBk0sM8IZEpKQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0602MB3340.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(8676002)(5660300002)(66946007)(86362001)(38100700002)(2616005)(83380400001)(38350700002)(6916009)(44832011)(956004)(2906002)(186003)(6506007)(7696005)(30864003)(6486002)(508600001)(66556008)(66476007)(6666004)(26005)(316002)(1076003)(36756003)(52116002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GTfAog0ei0M7xJsDNKOvBKj5dZTvpK7tQoFVL4HSszO6yToDU6stY20BvfcE?=
 =?us-ascii?Q?5JIXkYALqZnn2ESaJQryV3vNPRJA/JHRXgtrBsFgHBMty5tJIdds4+cfVRnb?=
 =?us-ascii?Q?rWWLkWoxRkXlC7CXSwsqkOhjx6FHFis1jnmsMsovdtfexPWwBHlGmFGrwVS5?=
 =?us-ascii?Q?Xs7pOGa2VlsDZJUemMvxQDdnrkseY1EuKHctKSMnKc5oPXYU0cpHXHH8aoek?=
 =?us-ascii?Q?1vozknmZqixzZoCGj7z7piDbhUKbSMFXbrdDAquTSukxdO8g55ML0x75NpEy?=
 =?us-ascii?Q?emAEGDvbG+2kTNvd8CoCHd0ZjeS+mDi+Ep/z04180nHzDxte5lUUwexOmKn8?=
 =?us-ascii?Q?snXyLDv0UvyXtAZLHARjzBC/SBgott/D3iuLYi02ZbZkvoeVpH5Ia4JKI4+E?=
 =?us-ascii?Q?bVRcvAneut6C37CU4yCRB3jKCdKeUBv0hIJv6PVVZ5MISpkDO0ZjZCL8tVbz?=
 =?us-ascii?Q?OeHJ9OevsZ59kYj1njnVClHvhPTX4moumiU17vio0HOL27krjwCXSidzIXKt?=
 =?us-ascii?Q?PmuyrjuqzqZbRnXe5mCuxOlwmLpF26XOB3OwXRl04rb1CpZkOqZgHCeAChom?=
 =?us-ascii?Q?s3aUrfJRlHiNjNg4DA31NbQyY3tVodaZAPetvDt9gkYCCuNzCGCu7XQnbVXT?=
 =?us-ascii?Q?AMf+qi2997gEUTDLya+Z+64EMSKg/2TyAbIujFACcUanX8W+Q828ZMbcXYzV?=
 =?us-ascii?Q?Gi/HGWY7rur6lH0XBLrBGaBCmnk+zGkXFgD6AEBHWpMx57pQpeM9/IVfbqSJ?=
 =?us-ascii?Q?TEhBfm9aA38x1F7ZAlik17lDGnEUoucK9R5mPyKpyl1XxEqvWXxTY8spdzFM?=
 =?us-ascii?Q?YwtM0AsThmDLOilbfBnUW2C/Y6EN39NLICfbjZly+9G/Adrc4YcT1m/ZFOqz?=
 =?us-ascii?Q?xfF/LJGXZ2njkJQMUBr40F5ClxaH+cSGZCaJnq7J6ejU6aKWtyNqo78+T97h?=
 =?us-ascii?Q?/QF90z4iOW8/9IDiBMxFsh9NvwjxJblU0Z0uVTUDEu9Aa15AEKnn+Vis6ba8?=
 =?us-ascii?Q?HoR0eUooGFDciCPm3CraAxvVO/dMHOhb3Q2ZWNvXldcJH5x+8WLpvuD9ZnL8?=
 =?us-ascii?Q?StXA6ZTJswu8ooXH6rX/j4b/c7ClbiLNXUMuWAkqfLYm//aH+UWjKfYA7hCu?=
 =?us-ascii?Q?oSDDlxv0iJKcVoGLYJv+eSGleORJJ1wxTcwTmtnGtIo/fWTXI4JIZSS8Y9rP?=
 =?us-ascii?Q?UntpRVviBgXxrTFsDw3o9InIPIc8gDjGg+2ZINGSY+aTQY2DaI9/G7yLfcSn?=
 =?us-ascii?Q?G61/1+K401yfcv2VWIGchMSVUdotae5LhQdZUQYCspbUPaRf7k4/b2AiqaLi?=
 =?us-ascii?Q?UyrL3GeeVEVHjYCsJwjQRmGwnmi5mQB5vl7EEexbRnFGoMIFx92dEXAu+rkF?=
 =?us-ascii?Q?la00O0h9vuJWcIqleJsdU+0KIl4OyiFZooK8CnwC/kZdVZ4sC8NmbV7mLb+D?=
 =?us-ascii?Q?P9VuzEOevZaUYwM3sKk3qTTd4cX7xwNw/E5GIxQTSXhcw4kHYC1/gdsL1mIq?=
 =?us-ascii?Q?9TItULprTxudoUmeiunzgz+MY8i2XRed57u9/PqORdk6CNijQrgbq+kPrYxS?=
 =?us-ascii?Q?OgLxm/iBEJebyvxUfAArsXcZZ/SYwrc0TICqCRWrd41KdcXTrYatLM0sSJmL?=
 =?us-ascii?Q?6e1Af3vltvzW56zKmD/JVXcaz9iUSG+qUvjmyPzUClcI4VU2uVFxJsUQfDRV?=
 =?us-ascii?Q?tpL/AQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1c974920-e542-4335-671f-08d9b404ba69
X-MS-Exchange-CrossTenant-AuthSource: 
 HE1PR0602MB3340.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2021 13:24:25.1743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 8ixN+AnOYNnRUSj5AxUcyXSXb0HkkAIaIGbqMP1eZLxF0UIJBpRENTHdpGmaM9Zcy86xYwvF4fuj2BDOfZKcK+lbP1+kvZ7Lf+K4zkvJiGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0601MB2649
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Nov 2021 13:24:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158973

`googlemock` has been absorbed into the
[googletest](https://github.com/google/googletest) project and is built
and installed from the same source tree.

`googletest` has provided a CMake Config-file Package starting with
GTest 1.8.1. `find_package(GTest ...)` by default dispatches first to
CMake Find Module. Starting with CMake commit
2327b4330cce157d616ff8b611b3e77568d00351 in CMake v3.20.0 the module
dispatches onward to the Config-file Package so that the same targets
are available. In pre v3.20.0 versions of CMake however the Find Module
masks the targets provided by the upstream `GTest` package.

Update `Modules/FindGTest.cmake` to provide the same targets as the
CMake Config-file Package and backwards compatible targets and result
variables.

Signed-off-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
---
 .../cmake/cmake-native_3.16.5.bb              |   1 +
 ...ndGTest-Add-target-for-gmock-library.patch | 255 ++++++++++++++++++
 2 files changed, 256 insertions(+)
 create mode 100644 meta/recipes-devtools/cmake/cmake/0006-cmake-FindGTest-Add-target-for-gmock-library.patch

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb b/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb
index b2952ee5f5..96a7be6770 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.16.5.bb
@@ -7,6 +7,7 @@ SRC_URI += "file://OEToolchainConfig.cmake \
             file://environment.d-cmake.sh \
             file://0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch \
             file://0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch \
+            file://0006-cmake-FindGTest-Add-target-for-gmock-library.patch \
             "
 
 
diff --git a/meta/recipes-devtools/cmake/cmake/0006-cmake-FindGTest-Add-target-for-gmock-library.patch b/meta/recipes-devtools/cmake/cmake/0006-cmake-FindGTest-Add-target-for-gmock-library.patch
new file mode 100644
index 0000000000..267f586a71
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/0006-cmake-FindGTest-Add-target-for-gmock-library.patch
@@ -0,0 +1,255 @@
+From 39eae0d6c1b398f18761abac7f55944f0290f8a1 Mon Sep 17 00:00:00 2001
+From: Eero Aaltonen <eero.aaltonen@iki.fi>
+Date: Sun, 17 Oct 2021 17:13:07 +0300
+Subject: [PATCH] FindGTest: Add target for gmock library
+
+`googlemock` has been absorbed into the
+[googletest](https://github.com/google/googletest) project and is built
+and installed from the same source tree.
+
+As GTest may be built with or without GMock, skip GMock if it is not
+present.
+
+Do not provide result variables for GMock.  They are not provided by
+upstream GTest's CMake Package Configuration File.
+
+Also update the test case to cover linking to `GTest::gmock`.
+
+The patch was imported from the Kitware git server
+(git@gitlab.kitware.com:cmake/cmake.git) as of commit id
+50bf457a0dd857cf976b22c5be7d333493233d1e
+
+Patch was modified to support upper case variable `GTEST_FOUND`.
+
+Upstream-Status: Accepted [https://gitlab.kitware.com/cmake/cmake/-/merge_requests/6632]
+Milestone: 3.23.0
+
+Signed-off-by: Eero Aaltonen <eero.aaltonen@vaisala.com>
+---
+ .../dev/FindGTest-target-for-gmock.rst        |   4 +
+ Modules/FindGTest.cmake                       | 133 +++++++++++++++---
+ Tests/FindGTest/Test/CMakeLists.txt           |   4 +
+ 3 files changed, 121 insertions(+), 20 deletions(-)
+ create mode 100644 Help/release/dev/FindGTest-target-for-gmock.rst
+
+diff --git a/Help/release/dev/FindGTest-target-for-gmock.rst b/Help/release/dev/FindGTest-target-for-gmock.rst
+new file mode 100644
+index 0000000000..f78242c80e
+--- /dev/null
++++ b/Help/release/dev/FindGTest-target-for-gmock.rst
+@@ -0,0 +1,4 @@
++FindGTest-target-for-gmock
++--------------------------
++
++* The :module:`FindGTest` module now provides a target for GMock, if found.
+diff --git a/Modules/FindGTest.cmake b/Modules/FindGTest.cmake
+index e015a9840f..0331049594 100644
+--- a/Modules/FindGTest.cmake
++++ b/Modules/FindGTest.cmake
+@@ -7,10 +7,23 @@ FindGTest
+ 
+ Locate the Google C++ Testing Framework.
+ 
++.. versionadded:: 3.20
++  Upstream ``GTestConfig.cmake`` is used if possible.
++
+ Imported targets
+ ^^^^^^^^^^^^^^^^
+ 
+-This module defines the following :prop_tgt:`IMPORTED` targets:
++  This module defines the following :prop_tgt:`IMPORTED` targets:
++
++``GTest::gtest``
++  The Google Test ``gtest`` library, if found; adds Thread::Thread
++  automatically
++``GTest::gtest_main``
++  The Google Test ``gtest_main`` library, if found
++
++.. deprecated:: 3.20
++  For backwards compatibility, this module defines additionally the
++  following deprecated :prop_tgt:`IMPORTED` targets (available since 3.5):
+ 
+ ``GTest::GTest``
+   The Google Test ``gtest`` library, if found; adds Thread::Thread
+@@ -18,7 +31,6 @@ This module defines the following :prop_tgt:`IMPORTED` targets:
+ ``GTest::Main``
+   The Google Test ``gtest_main`` library, if found
+ 
+-
+ Result variables
+ ^^^^^^^^^^^^^^^^
+ 
+@@ -146,8 +158,42 @@ function(__gtest_import_library _target _var _config)
+     endif()
+ endfunction()
+ 
++function(__gtest_define_backwards_compatible_library_targets)
++    set(GTEST_BOTH_LIBRARIES ${GTEST_LIBRARIES} ${GTEST_MAIN_LIBRARIES} PARENT_SCOPE)
++
++    # Add targets mapping the same library names as defined in
++    # older versions of CMake's FindGTest
++    if(NOT TARGET GTest::GTest)
++        add_library(GTest::GTest INTERFACE IMPORTED)
++        target_link_libraries(GTest::GTest INTERFACE GTest::gtest)
++    endif()
++    if(NOT TARGET GTest::Main)
++        add_library(GTest::Main INTERFACE IMPORTED)
++        target_link_libraries(GTest::Main INTERFACE GTest::gtest_main)
++    endif()
++endfunction()
++
+ #
+ 
++include(${CMAKE_CURRENT_LIST_DIR}/FindPackageHandleStandardArgs.cmake)
++
++# first specifically look for the CMake version of GTest
++find_package(GTest QUIET NO_MODULE)
++
++# if we found the GTest cmake package then we are done, and
++# can print what we found and return.
++if(GTest_FOUND)
++    set(GTEST_FOUND ${GTest_FOUND})
++    FIND_PACKAGE_HANDLE_STANDARD_ARGS(GTest HANDLE_COMPONENTS CONFIG_MODE)
++
++    set(GTEST_LIBRARIES      GTest::gtest)
++    set(GTEST_MAIN_LIBRARIES GTest::gtest_main)
++
++    __gtest_define_backwards_compatible_library_targets()
++
++    return()
++endif()
++
+ if(NOT DEFINED GTEST_MSVC_SEARCH)
+     set(GTEST_MSVC_SEARCH MD)
+ endif()
+@@ -194,50 +240,97 @@ if(MSVC AND GTEST_MSVC_SEARCH STREQUAL "MD")
+     __gtest_find_library(GTEST_LIBRARY_DEBUG      gtest-mdd gtestd)
+     __gtest_find_library(GTEST_MAIN_LIBRARY       gtest_main-md  gtest_main)
+     __gtest_find_library(GTEST_MAIN_LIBRARY_DEBUG gtest_main-mdd gtest_maind)
++    __gtest_find_library(GMOCK_LIBRARY            gmock-md  gmock)
++    __gtest_find_library(GMOCK_LIBRARY_DEBUG      gmock-mdd gmockd)
++    __gtest_find_library(GMOCK_MAIN_LIBRARY       gmock_main-md  gmock_main)
++    __gtest_find_library(GMOCK_MAIN_LIBRARY_DEBUG gmock_main-mdd gmock_maind)
+ else()
+     __gtest_find_library(GTEST_LIBRARY            gtest)
+     __gtest_find_library(GTEST_LIBRARY_DEBUG      gtestd)
+     __gtest_find_library(GTEST_MAIN_LIBRARY       gtest_main)
+     __gtest_find_library(GTEST_MAIN_LIBRARY_DEBUG gtest_maind)
++    __gtest_find_library(GMOCK_LIBRARY            gmock)
++    __gtest_find_library(GMOCK_LIBRARY_DEBUG      gmockd)
++    __gtest_find_library(GMOCK_MAIN_LIBRARY       gmock_main)
++    __gtest_find_library(GMOCK_MAIN_LIBRARY_DEBUG gmock_maind)
+ endif()
+ 
+-include(${CMAKE_CURRENT_LIST_DIR}/FindPackageHandleStandardArgs.cmake)
+ FIND_PACKAGE_HANDLE_STANDARD_ARGS(GTest DEFAULT_MSG GTEST_LIBRARY GTEST_INCLUDE_DIR GTEST_MAIN_LIBRARY)
+ 
+-if(GTEST_FOUND)
++if(GMOCK_LIBRARY AND GMOCK_MAIN_LIBRARY)
++    set(GMock_FOUND True)
++else()
++    set(GMock_FOUND False)
++endif()
++
++if(GTest_FOUND)
+     set(GTEST_INCLUDE_DIRS ${GTEST_INCLUDE_DIR})
+     __gtest_append_debugs(GTEST_LIBRARIES      GTEST_LIBRARY)
+     __gtest_append_debugs(GTEST_MAIN_LIBRARIES GTEST_MAIN_LIBRARY)
+-    set(GTEST_BOTH_LIBRARIES ${GTEST_LIBRARIES} ${GTEST_MAIN_LIBRARIES})
+ 
+     find_package(Threads QUIET)
+ 
+-    if(NOT TARGET GTest::GTest)
++    if(NOT TARGET GTest::gtest)
+         __gtest_determine_library_type(GTEST_LIBRARY)
+-        add_library(GTest::GTest ${GTEST_LIBRARY_TYPE} IMPORTED)
++        add_library(GTest::gtest ${GTEST_LIBRARY_TYPE} IMPORTED)
+         if(TARGET Threads::Threads)
+-            set_target_properties(GTest::GTest PROPERTIES
++            set_target_properties(GTest::gtest PROPERTIES
+                 INTERFACE_LINK_LIBRARIES Threads::Threads)
+         endif()
+         if(GTEST_LIBRARY_TYPE STREQUAL "SHARED")
+-            set_target_properties(GTest::GTest PROPERTIES
++            set_target_properties(GTest::gtest PROPERTIES
+                 INTERFACE_COMPILE_DEFINITIONS "GTEST_LINKED_AS_SHARED_LIBRARY=1")
+         endif()
+         if(GTEST_INCLUDE_DIRS)
+-            set_target_properties(GTest::GTest PROPERTIES
++            set_target_properties(GTest::gtest PROPERTIES
+                 INTERFACE_INCLUDE_DIRECTORIES "${GTEST_INCLUDE_DIRS}")
+         endif()
+-        __gtest_import_library(GTest::GTest GTEST_LIBRARY "")
+-        __gtest_import_library(GTest::GTest GTEST_LIBRARY "RELEASE")
+-        __gtest_import_library(GTest::GTest GTEST_LIBRARY "DEBUG")
++        __gtest_import_library(GTest::gtest GTEST_LIBRARY "")
++        __gtest_import_library(GTest::gtest GTEST_LIBRARY "RELEASE")
++        __gtest_import_library(GTest::gtest GTEST_LIBRARY "DEBUG")
+     endif()
+-    if(NOT TARGET GTest::Main)
++    if(NOT TARGET GTest::gtest_main)
+         __gtest_determine_library_type(GTEST_MAIN_LIBRARY)
+-        add_library(GTest::Main ${GTEST_MAIN_LIBRARY_TYPE} IMPORTED)
+-        set_target_properties(GTest::Main PROPERTIES
+-            INTERFACE_LINK_LIBRARIES "GTest::GTest")
+-        __gtest_import_library(GTest::Main GTEST_MAIN_LIBRARY "")
+-        __gtest_import_library(GTest::Main GTEST_MAIN_LIBRARY "RELEASE")
+-        __gtest_import_library(GTest::Main GTEST_MAIN_LIBRARY "DEBUG")
++        add_library(GTest::gtest_main ${GTEST_MAIN_LIBRARY_TYPE} IMPORTED)
++        set_target_properties(GTest::gtest_main PROPERTIES
++            INTERFACE_LINK_LIBRARIES "GTest::gtest")
++        __gtest_import_library(GTest::gtest_main GTEST_MAIN_LIBRARY "")
++        __gtest_import_library(GTest::gtest_main GTEST_MAIN_LIBRARY "RELEASE")
++        __gtest_import_library(GTest::gtest_main GTEST_MAIN_LIBRARY "DEBUG")
++    endif()
++
++    __gtest_define_backwards_compatible_library_targets()
++endif()
++
++if(GMock_FOUND)
++    if(NOT TARGET GTest::gmock)
++        __gtest_determine_library_type(GMOCK_LIBRARY)
++        add_library(GTest::gmock ${GMOCK_LIBRARY_TYPE} IMPORTED)
++        set(_gmock_link_libraries "GTest::gtest")
++        if(TARGET Threads::Threads)
++            list(APPEND _gmock_link_libraries Threads::Threads)
++        endif()
++        set_target_properties(GTest::gmock PROPERTIES
++            INTERFACE_LINK_LIBRARIES "${_gmock_link_libraries}")
++        if(GMOCK_LIBRARY_TYPE STREQUAL "SHARED")
++            set_target_properties(GTest::gmock PROPERTIES
++                INTERFACE_COMPILE_DEFINITIONS "GMOCK_LINKED_AS_SHARED_LIBRARY=1")
++        endif()
++        if(GTEST_INCLUDE_DIRS)
++            set_target_properties(GTest::gmock PROPERTIES
++                INTERFACE_INCLUDE_DIRECTORIES "${GTEST_INCLUDE_DIRS}")
++        endif()
++        __gtest_import_library(GTest::gmock GMOCK_LIBRARY "")
++        __gtest_import_library(GTest::gmock GMOCK_LIBRARY "RELEASE")
++        __gtest_import_library(GTest::gmock GMOCK_LIBRARY "DEBUG")
++    endif()
++    if(NOT TARGET GTest::gmock_main)
++        __gtest_determine_library_type(GMOCK_MAIN_LIBRARY)
++        add_library(GTest::gmock_main ${GMOCK_MAIN_LIBRARY_TYPE} IMPORTED)
++        set_target_properties(GTest::gmock_main PROPERTIES
++            INTERFACE_LINK_LIBRARIES "GTest::gmock")
++        __gtest_import_library(GTest::gmock_main GMOCK_MAIN_LIBRARY "")
++        __gtest_import_library(GTest::gmock_main GMOCK_MAIN_LIBRARY "RELEASE")
++        __gtest_import_library(GTest::gmock_main GMOCK_MAIN_LIBRARY "DEBUG")
+     endif()
+ endif()
+diff --git a/Tests/FindGTest/Test/CMakeLists.txt b/Tests/FindGTest/Test/CMakeLists.txt
+index b65b9d28f6..7d3a378a65 100644
+--- a/Tests/FindGTest/Test/CMakeLists.txt
++++ b/Tests/FindGTest/Test/CMakeLists.txt
+@@ -12,3 +12,7 @@ add_executable(test_gtest_var main.cxx)
+ target_include_directories(test_gtest_var PRIVATE ${GTEST_INCLUDE_DIRS})
+ target_link_libraries(test_gtest_var PRIVATE ${GTEST_BOTH_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})
+ add_test(NAME test_gtest_var COMMAND test_gtest_var)
++
++add_executable(test_gmock_tgt main.cxx)
++target_link_libraries(test_gmock_tgt GTest::gmock_main)
++add_test(NAME test_gmock_tgt COMMAND test_gmock_tgt)
+-- 
+2.17.1
+
-- 
2.17.1


