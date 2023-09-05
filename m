Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB2BC71153
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 02:02:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12747.1693879334874943952
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Sep 2023 19:02:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GhlwbWd9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7612f83f6c=kai.kang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3851vdmB014945
	for <openembedded-core@lists.openembedded.org>; Tue, 5 Sep 2023 02:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=J4JC5
	M2fc8w0hKPzUe6x82Dq5iD7NK/w2gPvMivmUWE=; b=GhlwbWd9lBCdM9we2ECau
	8hpafzR2wfpOHxhWs/Bd6q0uBBX07IvV8gfc44KNryJC+z3pE/JFcU6GHzVzRk0v
	UMO5BMvP5P2HIU+D3pfOlBaMXA52QivNfGhqyGnzWaOMRM1YIbCDT+3ZQmz3zVFg
	HTDtn2zdodfXHFsZiiDz8vEE49N7kFq2EwQFXjvX07Ye+n0VSssnX4hGNUxONLsn
	FJizxfV1N3iQjn2YLr3P+l/at1jbcVzgXOrdLIZ1X0dpMXKYtxXJ3ijqrzp7iAa+
	/zXK0fymOBYl0ClAeQvnKTbWf8o6Rsoav3N7zGrkZBv29eyK9aY56yHjaVM/tNXl
	g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3sw33k0vff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 02:02:13 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 4 Sep 2023 19:02:10 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Mon, 4 Sep 2023 19:02:09 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] webkitgtk: fix build failure with DEBUG_BUILD enabled
Date: Tue, 5 Sep 2023 10:02:09 +0800
Message-ID: <20230905020209.171312-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: _00HZjVMWyrq5K3PT2xzbdrpLpcATqzG
X-Proofpoint-ORIG-GUID: _00HZjVMWyrq5K3PT2xzbdrpLpcATqzG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_01,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=784
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309050016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 02:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187194

From: Kai Kang <kai.kang@windriver.com>

It fails to compile webkitgtk when debug build enabled:

| /path_to/tmp/work/core2-64-poky-linux/webkitgtk/2.40.5/webkitgtk-2.40.5/Source/bmalloc/libpas/src/libpas/pas_allocation_result.h:76:1:
  error: inlining failed in call to 'always_inline' 'pas_allocation_result pas_allocation_result_identity(pas_allocation_result)':
  function not considered for inlining
|    76 | pas_allocation_result_identity(pas_allocation_result result)
|       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Add a cmake variable WEBKIT_NO_INLINE_HINTS to disable gcc function
attribute `always_inline` when debug build is enabled.

And adjust indent as well.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...able-to-control-macro-__PAS_ALWAYS_I.patch | 76 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.40.5.bb  | 18 +++--
 2 files changed, 86 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
new file mode 100644
index 0000000000..4266d11e9e
--- /dev/null
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch
@@ -0,0 +1,76 @@
+From 73efe0ea75c3ac4cb088f300acc3de44d5dd3344 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Fri, 11 Aug 2023 14:20:48 +0800
+Subject: [PATCH] [CMake] Add a variable to control macro
+ __PAS_ALWAYS_INLINE_BUT_NOT_INLINE
+ https://bugs.webkit.org/show_bug.cgi?id=260065
+
+Reviewed by NOBODY (OOPS!).
+
+It fails to compile webkitgtk with option `-Og` of gcc/g++:
+
+| In file included from Source/bmalloc/libpas/src/libpas/pas_heap_page_provider.h:30,
+|                  from Source/bmalloc/libpas/src/libpas/pas_bootstrap_heap_page_provider.h:29,
+|                  from Source/bmalloc/libpas/src/libpas/pas_large_heap_physical_page_sharing_cache.h:29,
+|                  from Source/bmalloc/libpas/src/libpas/pas_basic_heap_page_caches.h:29,
+|                  from Source/bmalloc/libpas/src/libpas/pas_heap_config_utils.h:32,
+|                  from Source/bmalloc/libpas/src/libpas/bmalloc_heap_config.h:34,
+|                  from Source/bmalloc/libpas/src/libpas/bmalloc_heap_inlines.h:34,
+|                  from Source/bmalloc/bmalloc/bmalloc.h:39,
+|                  from Source/bmalloc/bmalloc/bmalloc.cpp:26:
+| In function 'pas_allocation_result pas_local_allocator_try_allocate(pas_local_allocator*, size_t, size_t, pas_heap_config, pas_allocator_counts*, pas_allocation_result_filter)',
+|     inlined from 'pas_allocation_result pas_try_allocate_common_impl_fast(pas_heap_config, pas_allocator_counts*, pas_allocation_result_filter, pas_local_allocator*, size_t, size_t)' at webkitgtk-2.40.2/Source/bmalloc/libpas/src/libpas/pas_try_allocate_common.h:85:46,
+|     inlined from 'pas_allocation_result bmalloc_try_allocate_with_alignment_impl_impl_fast(pas_local_allocator*, size_t, size_t)' at webkitgtk-2.40.2/Source/bmalloc/libpas/src/libpas/bmalloc_heap_inlines.h:59:1,
+|     inlined from 'pas_allocation_result pas_try_allocate_intrinsic_impl_casual_case(__pas_heap*, size_t, size_t, pas_intrinsic_heap_support*, pas_heap_config, pas_try_allocate_common_fast, pas_try_allocate_common_slow, pas_intrinsic_heap_designation_mode)' at webkitgtk-2.40.2/Source/bmalloc/libpas/src/libpas/pas_try_allocate_intrinsic.h:167:44,
+|     inlined from 'pas_allocation_result bmalloc_try_allocate_with_alignment_impl_casual_case(size_t, size_t)' at webkitgtk-2.40.2/Source/bmalloc/libpas/src/libpas/bmalloc_heap_inlines.h:59:1:
+| webkitgtk-2.40.2/Source/bmalloc/libpas/src/libpas/pas_allocation_result.h:76:1: error: inlining failed in call to 'always_inline' 'pas_allocation_result pas_allocation_result_identity(pas_allocation_result)': function not considered for inlining
+|    76 | pas_allocation_result_identity(pas_allocation_result result)
+|       | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Add an variable `WEBKIT_NO_INLINE_HINTS` to control macro
+__PAS_ALWAYS_INLINE_BUT_NOT_INLINE whether includes function attribute
+`always_inline`. It could set the variable to make compilation pass when
+gcc option `-Og` is used.
+
+* Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h:
+* Source/cmake/WebKitCompilerFlags.cmake:
+
+Upstream-Status: Submitted [https://github.com/WebKit/WebKit/pull/16601]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h | 2 +-
+ Source/cmake/WebKitCompilerFlags.cmake              | 7 +++++++
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h b/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
+index 5d5fb38cddbd..a554f70064eb 100644
+--- a/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
++++ b/Source/bmalloc/libpas/src/libpas/pas_utils_prefix.h
+@@ -44,7 +44,7 @@ __PAS_BEGIN_EXTERN_C;
+ #define __SUSPICIOUS__
+ #define __BROKEN__
+ 
+-#ifdef __OPTIMIZE__
++#if defined(__OPTIMIZE__) && !defined(WEBKIT_NO_INLINE_HINTS)
+ #define __PAS_ALWAYS_INLINE_BUT_NOT_INLINE __attribute__((__always_inline__))
+ #else
+ #define __PAS_ALWAYS_INLINE_BUT_NOT_INLINE
+diff --git a/Source/cmake/WebKitCompilerFlags.cmake b/Source/cmake/WebKitCompilerFlags.cmake
+index 9b2fecf9a0d3..7cdc2b6afbe0 100644
+--- a/Source/cmake/WebKitCompilerFlags.cmake
++++ b/Source/cmake/WebKitCompilerFlags.cmake
+@@ -453,3 +453,10 @@ endif ()
+ 
+ # FIXME: Enable pre-compiled headers for all ports <https://webkit.org/b/139438>
+ set(CMAKE_DISABLE_PRECOMPILE_HEADERS ON)
++
++# It fails to compile with `gcc -Og`
++set(WEBKIT_NO_INLINE_HINTS OFF CACHE BOOL "Disable funtion attribute always_inline for WebKit")
++
++if (WEBKIT_NO_INLINE_HINTS)
++    add_definitions(-DWEBKIT_NO_INLINE_HINTS)
++endif ()
+-- 
+2.34.1
+
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.40.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.40.5.bb
index 39bb6a476f..c97dcfad1f 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.40.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.40.5.bb
@@ -14,6 +14,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://reproducibility.patch \
            file://0d3344e17d258106617b0e6d783d073b188a2548.patch \
            file://check-GST_GL_HAVE_PLATFORM_GLX.patch \
+           file://0001-CMake-Add-a-variable-to-control-macro-__PAS_ALWAYS_I.patch \
            "
 SRC_URI[sha256sum] = "7de051a263668621d91a61a5eb1c3771d1a7cec900043d4afef06c326c16037f"
 
@@ -76,14 +77,15 @@ PACKAGECONFIG[avif] = "-DUSE_AVIF_LOG=ON,-DUSE_AVIF=OFF,libavif"
 PACKAGECONFIG[media-recorder] = "-DENABLE_MEDIA_RECORDER=ON,-DENABLE_MEDIA_RECORDER=OFF,gstreamer1.0-plugins-bad"
 
 EXTRA_OECMAKE = " \
-		-DPORT=GTK \
-		${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
-		${@bb.utils.contains('GIDOCGEN_ENABLED', 'True', '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
-		-DENABLE_MINIBROWSER=ON \
-                -DENABLE_BUBBLEWRAP_SANDBOX=OFF \
-                -DENABLE_GAMEPAD=OFF \
-                -DUSE_GTK4=ON \
-		"
+                 -DPORT=GTK \
+                 ${@oe.utils.vartrue('GI_DATA_ENABLED', '-DENABLE_INTROSPECTION=ON', '-DENABLE_INTROSPECTION=OFF', d)} \
+                 ${@oe.utils.vartrue('GIDOCGEN_ENABLED', '-DENABLE_DOCUMENTATION=ON', '-DENABLE_DOCUMENTATION=OFF', d)} \
+                 ${@oe.utils.vartrue('DEBUG_BUILD', '-DWEBKIT_NO_INLINE_HINTS=ON', '-DWEBKIT_NO_INLINE_HINTS=OFFF', d)} \
+                 -DENABLE_MINIBROWSER=ON \
+                 -DENABLE_BUBBLEWRAP_SANDBOX=OFF \
+                 -DENABLE_GAMEPAD=OFF \
+                 -DUSE_GTK4=ON \
+                 "
 
 # Javascript JIT is not supported on ARC
 EXTRA_OECMAKE:append:arc = " -DENABLE_JIT=OFF "
-- 
2.34.1


