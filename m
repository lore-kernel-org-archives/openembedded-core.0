Return-Path: <yogesh.tyagi@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41064C369B1
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 09:13:16 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by mx.groups.io with SMTP id smtpd.web10.11141.1727255588933546950
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Sep 2024 02:13:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=Cq8bKSDt;
 spf=pass (domain: intel.com, ip: 198.175.65.14, mailfrom: yogesh.tyagi@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727255589; x=1758791589;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yKxUIPiwQ3nJ7pS8mr/PiKo1srLufhelAHvc2gGfDVQ=;
  b=Cq8bKSDtIXy9iuVcMNvuEmxrArlWRUtHJ3ltTtJ1gwtjvNeQu0EesE2r
   p6QBt6AKLuOuVUJ0Njvj7w/CNEfrr8mhQd9sD9a6nuEL6BlQfunF8GST3
   a+hUxHMhjElGNp1u1/Y4DFgMfFO5zePYbcJ/0hOBzu69+L9xcnDTdV74j
   7ota9iGUvrn6Wtq7loFhT82iOYcZWPvzSnX1bnR7xFsfuAo9gWWZVamrU
   yAQbSGKmE0yNvWT9/EUYz2VHexhec7aZZ2LXK47NRHOZou/T2cD7Dbghi
   7Y9lZZPk1h7PPLE7EnLXf33n6IG3poGkmTRKkJAgT2ZUj/mQM47jivn6K
   g==;
X-CSE-ConnectionGUID: sXjD034iSyy7XVs8YTZRWQ==
X-CSE-MsgGUID: 6U1oVT7CS8mpqfOMS5VvbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="30082307"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="30082307"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 02:13:08 -0700
X-CSE-ConnectionGUID: XnD4Lx8QRgGZ/aOB3c24uQ==
X-CSE-MsgGUID: MRHSqs2bQvWHo53o8e1vGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="75810329"
Received: from ytyagi-desk.iind.intel.com ([10.49.15.7])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 02:13:07 -0700
From: Yogesh Tyagi <yogesh.tyagi@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [scarthgap][PATCH] tbb-native: Fix build with gcc-13
Date: Wed, 25 Sep 2024 14:42:56 +0530
Message-ID: <20240925091256.1382361-1-yogesh.tyagi@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 09:13:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204944

* Fixes following stringop-overflow warning with gcc-13:

In file included from /usr/include/c++/13/atomic:41,
                 from /poky/build/tmp/work/x86_64-linux/tbb-native/2021.11.0/git/src/tbb/../../include/oneapi/tbb/detail/_utils.h:22,
                 from /poky/build/tmp/work/x86_64-linux/tbb-native/2021.11.0/git/src/tbb/task_dispatcher.h:20,
                 from /poky/build/tmp/work/x86_64-linux/tbb-native/2021.11.0/git/src/tbb/arena.cpp:17:
In member function ‘void std::__atomic_base<_IntTp>::store(__int_type, std::memory_order) [with _ITp = bool]’,
    inlined from ‘void std::atomic<bool>::store(bool, std::memory_order)’ at /usr/include/c++/13/atomic:104:20,
    inlined from ‘void tbb::detail::r1::concurrent_monitor_base<Context>::notify_one_relaxed() [with Context = long unsigned int]’ at /poky/build/tmp/work/x86_64-linux/tbb-native/2021.11.0/git/src/tbb/concurrent_monitor.h:293:53:
/usr/include/c++/13/bits/atomic_base.h:481:25: error: ‘void __atomic_store_1(volatile void*, unsigned char, int)’ writing 1 byte into a region of size 0 overflows the destination [-Werror=stringop-overflow=]
  481 |         __atomic_store_n(&_M_i, __i, int(__m));
      |         ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
compilation terminated due to -Wfatal-errors.
cc1plus: all warnings being treated as errors

(cherry picked from commit e131071769ee3df51b56b053ba6bfa06ae9eff25)

Signed-off-by: Yogesh Tyagi <yogesh.tyagi@intel.com>
---
 ...suppress-new-GCC-12-13-warnings-1192.patch | 57 +++++++++++++++++++
 meta-oe/recipes-support/tbb/tbb_2021.11.0.bb  |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta-oe/recipes-support/tbb/tbb/0001-Fix-suppress-new-GCC-12-13-warnings-1192.patch

diff --git a/meta-oe/recipes-support/tbb/tbb/0001-Fix-suppress-new-GCC-12-13-warnings-1192.patch b/meta-oe/recipes-support/tbb/tbb/0001-Fix-suppress-new-GCC-12-13-warnings-1192.patch
new file mode 100644
index 0000000000..489f011b84
--- /dev/null
+++ b/meta-oe/recipes-support/tbb/tbb/0001-Fix-suppress-new-GCC-12-13-warnings-1192.patch
@@ -0,0 +1,57 @@
+From e131071769ee3df51b56b053ba6bfa06ae9eff25 Mon Sep 17 00:00:00 2001
+From: Dmitri Mokhov <dmitri.n.mokhov@intel.com>
+Date: Mon, 11 Sep 2023 10:35:07 -0500
+Subject: [PATCH] Fix/suppress new GCC 12/13 warnings (#1192)
+
+Upstream-Status: Backport [https://github.com/oneapi-src/oneTBB/commit/e131071769ee3df51b56b053ba6bfa06ae9eff25]
+Signed-off-by: Dmitri Mokhov <dmitri.n.mokhov@intel.com>
+---
+ .../oneapi/tbb/detail/_concurrent_unordered_base.h   |  2 +-
+ src/tbb/concurrent_monitor.h                         | 12 +++++++++++-
+ 2 files changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/include/oneapi/tbb/detail/_concurrent_unordered_base.h b/include/oneapi/tbb/detail/_concurrent_unordered_base.h
+index ade91c33..40829208 100644
+--- a/include/oneapi/tbb/detail/_concurrent_unordered_base.h
++++ b/include/oneapi/tbb/detail/_concurrent_unordered_base.h
+@@ -921,7 +921,7 @@ private:
+             node_allocator_traits::deallocate(dummy_node_allocator, node, 1);
+         } else {
+             // GCC 11.1 issues a warning here that incorrect destructor might be called for dummy_nodes
+-            #if (__TBB_GCC_VERSION >= 110100 && __TBB_GCC_VERSION < 130000 ) && !__clang__ && !__INTEL_COMPILER
++            #if (__TBB_GCC_VERSION >= 110100 && __TBB_GCC_VERSION < 140000 ) && !__clang__ && !__INTEL_COMPILER
+             volatile
+             #endif
+             value_node_ptr val_node = static_cast<value_node_ptr>(node);
+diff --git a/src/tbb/concurrent_monitor.h b/src/tbb/concurrent_monitor.h
+index 3d20ef5b..3e5c4beb 100644
+--- a/src/tbb/concurrent_monitor.h
++++ b/src/tbb/concurrent_monitor.h
+@@ -1,5 +1,5 @@
+ /*
+-    Copyright (c) 2005-2021 Intel Corporation
++    Copyright (c) 2005-2023 Intel Corporation
+ 
+     Licensed under the Apache License, Version 2.0 (the "License");
+     you may not use this file except in compliance with the License.
+@@ -290,7 +290,17 @@ public:
+             n = my_waitset.front();
+             if (n != end) {
+                 my_waitset.remove(*n);
++
++// GCC 12.x-13.x issues a warning here that to_wait_node(n)->my_is_in_list might have size 0, since n is
++// a base_node pointer. (This cannot happen, because only wait_node pointers are added to my_waitset.)
++#if (__TBB_GCC_VERSION >= 120100 && __TBB_GCC_VERSION < 140000 ) && !__clang__ && !__INTEL_COMPILER
++#pragma GCC diagnostic push
++#pragma GCC diagnostic ignored "-Wstringop-overflow"
++#endif
+                 to_wait_node(n)->my_is_in_list.store(false, std::memory_order_relaxed);
++#if (__TBB_GCC_VERSION >= 120100 && __TBB_GCC_VERSION < 140000 ) && !__clang__ && !__INTEL_COMPILER
++#pragma GCC diagnostic pop
++#endif
+             }
+         }
+ 
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-support/tbb/tbb_2021.11.0.bb b/meta-oe/recipes-support/tbb/tbb_2021.11.0.bb
index f834726bd6..318cd87643 100644
--- a/meta-oe/recipes-support/tbb/tbb_2021.11.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2021.11.0.bb
@@ -16,6 +16,7 @@ BRANCH = "onetbb_2021"
 SRCREV = "8b829acc65569019edb896c5150d427f288e8aba"
 SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH} \
             file://0001-hwloc_detection.cmake-remove-cross-compiation-check.patch \
+            file://0001-Fix-suppress-new-GCC-12-13-warnings-1192.patch \
 "
 S = "${WORKDIR}/git"
 
-- 
2.43.0


