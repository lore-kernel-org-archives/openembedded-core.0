Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.80])
 by mx.groups.io with SMTP id smtpd.web09.28721.1605491053909856079
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2020 17:44:14 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZHV8H7kl;
 spf=pass (domain: windriver.com, ip: 40.107.243.80, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oSjpBOqVopSEwrKPlaW8efP214mU3SHXuHBnCISpWqZpPV9GpJ/AJvghCVuOWagq5Fg0OgM1fGROQCO/SAjKvvo+zQg1b9BKkLBeyrTDEKeu8KwytH4x/+hX11TA3pZ2WFrNj7S2y4KhiC+W1ZRmkuZA0VBNIpCSQ4CCj7CZxM1OO9RpovHqSfv7mnXwVMONXD+/O6FlLWUBvMfchOcEQhl3A08TUP1p2FAUPsQNXHb4cJ56GMNWiav4GXln6T1Ta7BI7j0XOIgYhG+q5MfqfqOs/LOl+VpSymsOfomxsE9cEbG76tRLtbl1c608f2fKJX2aFstIR9ITh4gCzRMneA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E40hkFMvSV0VQtRCdBB8J+lzW4aTj5tL5e+2jVlArqA=;
 b=Z+sZKgAiKW/dHs+UG4jNu125f+b4wcHUi8SfLHk2GUJp5hVmYQ+88kCHw5xJ8SL1/2eDlIttzLVqlecgOFL7HDudznxAMMgGdfO2c5613EvBgQHrijabMff3sxTfpCjCDAgGpIyn5VHq0W6psoLCoh8vwMaxRvgL9camTfBXoK7evyqBs9wP1/Sw4sKja/S1o/dTp8Kv+/6xZjHSHfHs2H04orfqUvrUlJHM33/M9YaHPUQrSotid7CPVh65HYvL4mWeAR8PS+7gmZo+ZqJRyf65+jTOiKoHP4W5TP9KL2MrRyY0RBQNMtWzZdPJcL+AjmBXy7UThjwk0QhcwXfHlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E40hkFMvSV0VQtRCdBB8J+lzW4aTj5tL5e+2jVlArqA=;
 b=ZHV8H7klZFwlKuP4IoN1UUmSPh/5umRaxZgD0XoYDrlYOQAUN36IwFEzRr3CKXtkwddoat2yETNZrpLKXnvRk08sSuOLdtZjHIgV0VCS+uTYx/W7ynHm8wF2rTt2vDRwfHeuvEhDdOU7SME20pAdyGO6np0JA+BuIVy5WApd9NY=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SN6PR11MB3213.namprd11.prod.outlook.com (2603:10b6:805:be::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 16 Nov
 2020 01:44:11 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::e933:258c:17b3:105]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::e933:258c:17b3:105%6]) with mapi id 15.20.3564.028; Mon, 16 Nov 2020
 01:44:11 +0000
From: "Changqing Li" <changqing.li@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH V2] vulkan-samples: fix do_compile failure
Date: Mon, 16 Nov 2020 09:43:42 +0800
Message-ID: <20201116014342.10081-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0045.apcprd04.prod.outlook.com
 (2603:1096:202:14::13) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK2PR04CA0045.apcprd04.prod.outlook.com (2603:1096:202:14::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25 via Frontend Transport; Mon, 16 Nov 2020 01:44:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: de3cfb75-e0de-4d44-2d2b-08d889d11d97
X-MS-TrafficTypeDiagnostic: SN6PR11MB3213:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB321318C75B86D39F7E8DBED882E30@SN6PR11MB3213.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:983;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sPvDFT9AlaUR1eGeRCgxJzu7OXkQNVkSa7lCf4PI1WCkBpehT3UhuLmaP92I1yhcwk8no1in7i69bEIJYDSUDOJDFm8hnOCiWwKA7TnHK4qblJW+HlPl4pzupDsKsH2VIlskNpmjseF0PFDRc2vbIgdPusA9qWauQC0hMfYNfSXakXjfRiwmi4k+SB/viQUTIU1xNR3NVKmHjXU2CUs/lFlqBQ28Hj8dbl8WgTzsQliZlYvAOCdY0h0+XFfxGK0FffDJCaRElVxlpay0f+hGncKBZMgCWG0Zi618sF81HSzWYLTKg5l27YYsOiGrgueS5qhwZEAJnWf5CJIEkjjB4lRwKsSgHuDiEc6JEA7EvI3yuAKRx/oSO1xRWmHrDkPKTvcZUCpYs7Eb2NBrDqdNQw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(366004)(39840400004)(396003)(316002)(6916009)(2906002)(6666004)(36756003)(16526019)(478600001)(5660300002)(186003)(83380400001)(8936002)(8676002)(86362001)(26005)(1076003)(6486002)(2616005)(956004)(6512007)(66556008)(44832011)(52116002)(66946007)(66476007)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	TpkAVwv2+cLV0sAOxeM80Oj3LJiYNoJFzTniWqIO6rxevKv0TZB/vo/pGcBwt0CJdOJ31p3s9+jM6cqD6ocAW4Tv0dIN5iNhhPxqiXFAZm3LiYMzAcTN+I6tPM4REGFIcT4Ez4PAIQleu7z+V3kJS0Su5x51wBswoZGF4Fc0X1112Ege3XAairJiHEeclCji+TQHCTxFkeamcLw+2xfQKb5AO2dTv/Si0eVHKwLiV3vQpzsK/XyKM1Gs1ApTbZsCvHKhB84V4VU1V8js2+/Jv3tuHDP+CPRcZcnzZJk55zCdMlLk722V1CoZOHgP1Rm6MKUIZqLhYZJmjhlpVTUhVm9dzFw/ed225LeXlKP0rxbmiOYpKA7UOeQ7cweAx6vfCUv1mPmKsH30/kQTCEXcFWaQSjuA8sw4gKbwwVu1knGabsFnv5zShvYqJZbEjo/R+EcYyqAZUzJspSeiC02h0g6tF52McyxM9J8Yq5c0sz2rMOOWbU9tb5ybmm4FN6EO4Zgx9W2d7uasmrGEngITCvT0tCuPMxgsaj4DcWjtHbhPyUbwjIIBZ2ddVAimNv+7EJIPuC4u2ZB8jSoxLg9MDPM3iMZEiL35wWH44DwwRzvzZ2BUO/RDgMI4xhMjIJdAEHAc/HVcg8TDoEfduTkOtg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de3cfb75-e0de-4d44-2d2b-08d889d11d97
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2020 01:44:11.2301
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jWNzAP0k+Jgt38Zc0ihuEOCC8jy17io1JBfz3wvT5FciXNBOTBlPCHyYa1cRb+tSrNF9putLGSaFcgntXJIQJ6gJlm0sL/otp/zmRQgIY8c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB3213
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

fix error:
| framework/lib/ppc/libframework.a(device.cpp.o): in function `std::__atomi=
c_base<unsigned long long>::load(std::memory_order) const':
| /usr/include/c++/10.2.0/bits/atomic_base.h:426: undefined reference to `_=
_atomic_load_8'

some arch don't have built-in atomic, so need to link it
explicitly

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...inst-libatomic-if-no-built-in-atomic.patch | 117 ++++++++++++++++++
 .../vulkan/vulkan-samples_git.bb              |   2 +
 2 files changed, 119 insertions(+)
 create mode 100644 meta/recipes-graphics/vulkan/vulkan-samples/0001-suppor=
t-link-against-libatomic-if-no-built-in-atomic.patch

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples/0001-support-link-=
against-libatomic-if-no-built-in-atomic.patch b/meta/recipes-graphics/vulka=
n/vulkan-samples/0001-support-link-against-libatomic-if-no-built-in-atomic.=
patch
new file mode 100644
index 0000000000..6c0fb60868
--- /dev/null
+++ b/meta/recipes-graphics/vulkan/vulkan-samples/0001-support-link-against=
-libatomic-if-no-built-in-atomic.patch
@@ -0,0 +1,117 @@
+From e20a5d13935a41a856e8f71c49f2cc9d81b1d92c Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 13 Nov 2020 17:07:00 +0800
+Subject: [PATCH] support link against libatomic if no built-in atomic exis=
t
+
+fix error:
+| framework/lib/ppc/libframework.a(device.cpp.o): in function `std::__atom=
ic_base<unsigned long long>::load(std::memory_order) const':
+| /usr/include/c++/10.2.0/bits/atomic_base.h:426: undefined reference to `=
__atomic_load_8'
+
+Upstream-Status: Submitted [https://github.com/KhronosGroup/Vulkan-Samples=
/pull/212]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ CMakeLists.txt                  |  1 +
+ bldsys/cmake/check_atomic.cmake | 62 +++++++++++++++++++++++++++++++++
+ framework/CMakeLists.txt        |  4 +++
+ 3 files changed, 67 insertions(+)
+ create mode 100644 bldsys/cmake/check_atomic.cmake
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index e72e829..466f51d 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -42,6 +42,7 @@ endmacro(vulkan_samples_pch)
+ include(utils)
+ include(global_options)
+ include(sample_helper)
++include(check_atomic)
+=20
+ # Add third party libraries
+ add_subdirectory(third_party)
+diff --git a/bldsys/cmake/check_atomic.cmake b/bldsys/cmake/check_atomic.c=
make
+new file mode 100644
+index 0000000..6b47a7a
+--- /dev/null
++++ b/bldsys/cmake/check_atomic.cmake
+@@ -0,0 +1,62 @@
++# check weither need to link atomic library explicitly
++INCLUDE(CheckCXXSourceCompiles)
++INCLUDE(CheckLibraryExists)
++
++if(NOT DEFINED VULKAN_COMPILER_IS_GCC_COMPATIBLE)
++  if(CMAKE_COMPILER_IS_GNUCXX)
++    set(VULKAN_COMPILER_IS_GCC_COMPATIBLE ON)=20
++  elseif( MSVC )
++    set(VULKAN_COMPILER_IS_GCC_COMPATIBLE OFF)
++  elseif( "${CMAKE_CXX_COMPILER_ID}" MATCHES "Clang" )
++    set(VULKAN_COMPILER_IS_GCC_COMPATIBLE ON)=20
++  elseif( "${CMAKE_CXX_COMPILER_ID}" MATCHES "Intel" )
++    set(VULKAN_COMPILER_IS_GCC_COMPATIBLE ON)=20
++  endif()
++endif()
++
++# Sometimes linking against libatomic is required for atomic ops, if
++# the platform doesn't support lock-free atomics.
++
++function(check_working_cxx_atomics varname)
++  set(OLD_CMAKE_REQUIRED_FLAGS ${CMAKE_REQUIRED_FLAGS})
++  set(CMAKE_REQUIRED_FLAGS "${CMAKE_REQUIRED_FLAGS} -std=3Dc++11")
++  CHECK_CXX_SOURCE_COMPILES("
++#include <atomic>
++std::atomic<int> x;
++std::atomic<short> y;
++std::atomic<char> z;
++int main() {
++  ++z;
++  ++y;
++  return ++x;
++}
++" ${varname})
++  set(CMAKE_REQUIRED_FLAGS ${OLD_CMAKE_REQUIRED_FLAGS})
++endfunction(check_working_cxx_atomics)
++
++function(check_working_cxx_atomics64 varname)
++  set(OLD_CMAKE_REQUIRED_FLAGS ${CMAKE_REQUIRED_FLAGS})
++  set(CMAKE_REQUIRED_FLAGS "-std=3Dc++11 ${CMAKE_REQUIRED_FLAGS}")
++  CHECK_CXX_SOURCE_COMPILES("
++#include <atomic>
++#include <cstdint>
++std::atomic<uint64_t> x (0);
++int main() {
++  uint64_t i =3D x.load(std::memory_order_relaxed);
++  (void)i;
++  return 0;
++}
++" ${varname})
++  set(CMAKE_REQUIRED_FLAGS ${OLD_CMAKE_REQUIRED_FLAGS})
++endfunction(check_working_cxx_atomics64)
++
++set(NEED_LINK_ATOMIC  OFF CACHE BOOL "weither need to link against atomic=
 library")
++if(VULKAN_COMPILER_IS_GCC_COMPATIBLE)
++    # check if non-64-bit atomics work without the library.
++    check_working_cxx_atomics(HAVE_CXX_ATOMICS_WITHOUT_LIB)
++    # check 64-bit atomics work without the library.
++    check_working_cxx_atomics64(HAVE_CXX_ATOMICS64_WITHOUT_LIB)
++    if (NOT HAVE_CXX_ATOMICS_WITHOUT_LIB OR NOT HAVE_CXX_ATOMICS64_WITHOU=
T_LIB)
++        set(NEED_LINK_ATOMIC  ON CACHE BOOL "weither need to link to atom=
ic library" FORCE)
++    endif()
++endif()
+diff --git a/framework/CMakeLists.txt b/framework/CMakeLists.txt
+index bf26786..322526e 100644
+--- a/framework/CMakeLists.txt
++++ b/framework/CMakeLists.txt
+@@ -412,6 +412,10 @@ target_link_libraries(${PROJECT_NAME}
+     ctpl
+     docopt)
+=20
++if(${NEED_LINK_ATOMIC})
++    target_link_libraries(${PROJECT_NAME} atomic)
++endif()
++
+ # Link platform specific libraries
+ if(ANDROID)
+     target_link_libraries(${PROJECT_NAME} log android native_app_glue)
+--=20
+2.17.1
+
diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/reci=
pes-graphics/vulkan/vulkan-samples_git.bb
index 241a313a7b..980557a3b9 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -5,7 +5,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D48aa35cefb768436=
223a6e7f18dc2a2a"
=20
 SRC_URI =3D "gitsm://github.com/KhronosGroup/Vulkan-Samples.git \
            file://0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-=
t.patch \
+           file://0001-support-link-against-libatomic-if-no-built-in-atomi=
c.patch \
            "
+
 UPSTREAM_CHECK_COMMITS =3D "1"
 SRCREV =3D "f52361d3cd6ac8c30fc3365a464b4e220c32cfd6"
=20
--=20
2.26.2

