Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85034C28B2B
	for <webhook@archiver.kernel.org>; Fri, 19 Aug 2022 07:27:58 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.459.1660894076525308798
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:27:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oxvE2GJ8;
 spf=pass (domain: gmail.com, ip: 209.85.128.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id
 m10-20020a05600c3b0a00b003a603fc3f81so2082516wms.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Aug 2022 00:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=tTTA8CgtX3R9EdLIhV+6fJ4X2eYjHoV1RcEY5vicb2E=;
        b=oxvE2GJ8j0mMkcP1knk4q2qFJhr7ehHWTs4hkcCwyJtPCydK6q9fGFKlAHuh0LKVio
         Pq0rCJS5Wv5kHB2+wMbYYkdzZACzfHcKLsxf/2glqkPtJxeran7olwuwvTXVu/ZQ5Ytr
         fwCmpD/p3SdClL4CYE0lMROOa08MvjLK+KTcJI9Ag+qvvLJdOAurLIYLHwTpJWTlaC4I
         I0vsaXOmrB5PcY1IjA15ULGuuGWfGozXVAsVKwsV0upFCSrc5EO0O10aoDsHGodeBGUa
         H4DLYgKwy5zacqdF09sIBXMgj/+4PjYnuMa1h3x/mWIPvpcHw4joDOY/DZmI8e7sfOfc
         YSoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=tTTA8CgtX3R9EdLIhV+6fJ4X2eYjHoV1RcEY5vicb2E=;
        b=ilFfijuBER5fspW9St7+EvxbGgu5r4WGBFFKs6gTsZYExujsBvwJfEvVtDwDiAReoo
         wsIHOzJDlEwTI5tlRp2iVCmE2v+/2o/nMHx4wiiP2i8D1/BCXP53UvR6JOBcS+62+77k
         ecVNYV1IOzySNP6kqEywtOxqMCEMgrXVUU0Ajux9t0K7W0F+VovoxBpAltC7gyrApSOp
         NA1KQ5Jzb/4KKbgkL2g/1XBDxnEOy0TlYN+mAvObeCm6yWK+RJMg7DEi8QjcQIPofqy4
         vsazSO9OxKLKdttUOf5Xm3XNxWs+mANE5LAGYw1fYTUoFeuwWBXDdtt3KILQFIoUuXyJ
         hQjQ==
X-Gm-Message-State: ACgBeo3tbhAAiUCjFX5EFriiJybO8Ezil8vMOODrRkQvtjAyZFIb0nSh
	PQLKxripUO9I6v4luSN2GQvsDbTKcdA=
X-Google-Smtp-Source: 
 AA6agR7KdWOXSte8VviaF3jW3Cd0zEybI8Rkf5SDyp7Szet9r5xrnW1fFcGyTeYTb6NwwJnLoqXRHQ==
X-Received: by 2002:a05:600c:4e8a:b0:3a6:d89:aa24 with SMTP id
 f10-20020a05600c4e8a00b003a60d89aa24mr3986496wmq.149.1660894075003;
        Fri, 19 Aug 2022 00:27:55 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 ay15-20020a05600c1e0f00b003a604a29a34sm4650739wmb.35.2022.08.19.00.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 00:27:54 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 11/42] boost: update 1.79.0 -> 1.80.0
Date: Fri, 19 Aug 2022 09:26:56 +0200
Message-Id: <20220819072727.2236928-11-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819072727.2236928-1-alex@linutronix.de>
References: <20220819072727.2236928-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Aug 2022 07:27:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169582

Drop boost-CVE-2012-2677.patch; fixed upstream after 10 years:
https://github.com/boostorg/pool/pull/42

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{boost-1.79.0.inc => boost-1.80.0.inc}    |   2 +-
 ...h-instruction-set-flags-we-do-that-o.patch |  19 ++-
 .../boost/boost/boost-CVE-2012-2677.patch     | 112 ------------------
 .../{boost_1.79.0.bb => boost_1.80.0.bb}      |   3 +-
 4 files changed, 16 insertions(+), 120 deletions(-)
 rename meta/recipes-support/boost/{boost-1.79.0.inc => boost-1.80.0.inc} (90%)
 delete mode 100644 meta/recipes-support/boost/boost/boost-CVE-2012-2677.patch
 rename meta/recipes-support/boost/{boost_1.79.0.bb => boost_1.80.0.bb} (73%)

diff --git a/meta/recipes-support/boost/boost-1.79.0.inc b/meta/recipes-support/boost/boost-1.80.0.inc
similarity index 90%
rename from meta/recipes-support/boost/boost-1.79.0.inc
rename to meta/recipes-support/boost/boost-1.80.0.inc
index f90c463931..3ee82eb9b2 100644
--- a/meta/recipes-support/boost/boost-1.79.0.inc
+++ b/meta/recipes-support/boost/boost-1.80.0.inc
@@ -12,7 +12,7 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "https://boostorg.jfrog.io/artifactory/main/release/${PV}/source/${BOOST_P}.tar.bz2"
-SRC_URI[sha256sum] = "475d589d51a7f8b3ba2ba4eda022b170e562ca3b760ee922c146b6c65856ef39"
+SRC_URI[sha256sum] = "1e19565d82e43bc59209a168f5ac899d3ba471d55c7610c677d4ccf2c9c500c0"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
index 67d5dff125..4fe15741bf 100644
--- a/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
+++ b/meta/recipes-support/boost/boost/0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch
@@ -1,4 +1,4 @@
-From 4d2a8fc8117e56bc283349e5f7f889ebbfc55c71 Mon Sep 17 00:00:00 2001
+From 21ba558abe074e7d49bdc931018ce2138e6e8eb5 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 18 Dec 2018 15:42:57 +0100
 Subject: [PATCH] Don't set up arch/instruction-set flags, we do that
@@ -10,14 +10,14 @@ Signed-off-by: Christopher Larson <chris_larson@mentor.com>
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
- tools/build/src/tools/gcc.jam | 144 ----------------------------------
- 1 file changed, 144 deletions(-)
+ tools/build/src/tools/gcc.jam | 153 ----------------------------------
+ 1 file changed, 153 deletions(-)
 
 diff --git a/tools/build/src/tools/gcc.jam b/tools/build/src/tools/gcc.jam
-index 47a113223..d77525724 100644
+index 726555369..5c5f8ba91 100644
 --- a/tools/build/src/tools/gcc.jam
 +++ b/tools/build/src/tools/gcc.jam
-@@ -1122,147 +1122,3 @@ local rule cpu-flags ( toolset variable : architecture : instruction-set + :
+@@ -1124,156 +1124,3 @@ local rule cpu-flags ( toolset variable : architecture : instruction-set + :
          <architecture>$(architecture)/<instruction-set>$(instruction-set)
          : $(values) ;
  }
@@ -72,6 +72,9 @@ index 47a113223..d77525724 100644
 -cpu-flags gcc OPTIONS : x86 : cascadelake : -march=skylake-avx512 -mavx512vnni ;
 -cpu-flags gcc OPTIONS : x86 : cooperlake : -march=cooperlake ;
 -cpu-flags gcc OPTIONS : x86 : tigerlake : -march=tigerlake ;
+-cpu-flags gcc OPTIONS : x86 : rocketlake : -march=rocketlake ;
+-cpu-flags gcc OPTIONS : x86 : alderlake : -march=alderlake ;
+-cpu-flags gcc OPTIONS : x86 : sapphirerapids : -march=sapphirerapids ;
 -cpu-flags gcc OPTIONS : x86 : k6 : -march=k6 ;
 -cpu-flags gcc OPTIONS : x86 : k6-2 : -march=k6-2 ;
 -cpu-flags gcc OPTIONS : x86 : k6-3 : -march=k6-3 ;
@@ -98,6 +101,7 @@ index 47a113223..d77525724 100644
 -cpu-flags gcc OPTIONS : x86 : btver2 : -march=btver2 ;
 -cpu-flags gcc OPTIONS : x86 : znver1 : -march=znver1 ;
 -cpu-flags gcc OPTIONS : x86 : znver2 : -march=znver2 ;
+-cpu-flags gcc OPTIONS : x86 : znver3 : -march=znver3 ;
 -cpu-flags gcc OPTIONS : x86 : winchip-c6 : -march=winchip-c6 ;
 -cpu-flags gcc OPTIONS : x86 : winchip2 : -march=winchip2 ;
 -cpu-flags gcc OPTIONS : x86 : c3 : -march=c3 ;
@@ -165,3 +169,8 @@ index 47a113223..d77525724 100644
 -cpu-flags gcc OPTIONS : arm : cortex-r5+vfpv3-d16 : -mcpu=cortex-r5 -mfpu=vfpv3-d16 -mfloat-abi=hard ;
 -# AIX variant of RS/6000 & PowerPC
 -toolset.flags gcc AROPTIONS <address-model>64/<target-os>aix : "-X64" ;
+-
+-# Enable response file control
+-toolset.flags gcc RESPONSE_FILE_SUB <response-file>auto : a ;
+-toolset.flags gcc RESPONSE_FILE_SUB <response-file>file : f ;
+-toolset.flags gcc RESPONSE_FILE_SUB <response-file>contents : c ;
diff --git a/meta/recipes-support/boost/boost/boost-CVE-2012-2677.patch b/meta/recipes-support/boost/boost/boost-CVE-2012-2677.patch
deleted file mode 100644
index 917617a044..0000000000
--- a/meta/recipes-support/boost/boost/boost-CVE-2012-2677.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-Reference
-
-https://svn.boost.org/trac/boost/changeset/78326
-
-Upstream-Status: Backport
-CVE: CVE-2012-2677
-Signed-off-by: Yue Tao <yue.tao@windriver.com>
-
-diff --git a/boost/pool/pool.hpp.old b/boost/pool/pool.hpp
-index c47b11f..417a1e0 100644
---- a/boost/pool/pool.hpp.old
-+++ b/boost/pool/pool.hpp
-@@ -26,6 +26,8 @@
- 
- #include <boost/pool/poolfwd.hpp>
- 
-+// std::numeric_limits
-+#include <boost/limits.hpp>
- // boost::integer::static_lcm
- #include <boost/integer/common_factor_ct.hpp>
- // boost::simple_segregated_storage
-@@ -355,6 +357,15 @@ class pool: protected simple_segregated_storage < typename UserAllocator::size_t
-       return s;
-     }
- 
-+    size_type max_chunks() const
-+    { //! Calculated maximum number of memory chunks that can be allocated in a single call by this Pool.
-+      size_type partition_size = alloc_size();
-+      size_type POD_size = integer::static_lcm<sizeof(size_type), sizeof(void *)>::value + sizeof(size_type);
-+      size_type max_chunks = (std::numeric_limits<size_type>::max() - POD_size) / alloc_size();
-+
-+      return max_chunks;
-+    }
-+
-     static void * & nextof(void * const ptr)
-     { //! \returns Pointer dereferenced.
-       //! (Provided and used for the sake of code readability :)
-@@ -375,6 +386,8 @@ class pool: protected simple_segregated_storage < typename UserAllocator::size_t
-       //!   the first time that object needs to allocate system memory.
-       //!   The default is 32. This parameter may not be 0.
-       //! \param nmax_size is the maximum number of chunks to allocate in one block.
-+      set_next_size(nnext_size);
-+      set_max_size(nmax_size);
-     }
- 
-     ~pool()
-@@ -398,8 +411,8 @@ class pool: protected simple_segregated_storage < typename UserAllocator::size_t
-     }
-     void set_next_size(const size_type nnext_size)
-     { //! Set number of chunks to request from the system the next time that object needs to allocate system memory. This value should never be set to 0.
--      //! \returns nnext_size.
--      next_size = start_size = nnext_size;
-+      BOOST_USING_STD_MIN();
-+      next_size = start_size = min BOOST_PREVENT_MACRO_SUBSTITUTION(nnext_size, max_chunks());
-     }
-     size_type get_max_size() const
-     { //! \returns max_size.
-@@ -407,7 +420,8 @@ class pool: protected simple_segregated_storage < typename UserAllocator::size_t
-     }
-     void set_max_size(const size_type nmax_size)
-     { //! Set max_size.
--      max_size = nmax_size;
-+      BOOST_USING_STD_MIN();
-+      max_size = min BOOST_PREVENT_MACRO_SUBSTITUTION(nmax_size, max_chunks());
-     }
-     size_type get_requested_size() const
-     { //!   \returns the requested size passed into the constructor.
-@@ -708,9 +722,9 @@ void * pool<UserAllocator>::malloc_need_resize()
- 
-   BOOST_USING_STD_MIN();
-   if(!max_size)
--    next_size <<= 1;
-+    set_next_size(next_size << 1);
-   else if( next_size*partition_size/requested_size < max_size)
--    next_size = min BOOST_PREVENT_MACRO_SUBSTITUTION(next_size << 1, max_size*requested_size/ partition_size);
-+    set_next_size(min BOOST_PREVENT_MACRO_SUBSTITUTION(next_size << 1, max_size * requested_size / partition_size));
- 
-   //  initialize it,
-   store().add_block(node.begin(), node.element_size(), partition_size);
-@@ -748,9 +762,9 @@ void * pool<UserAllocator>::ordered_malloc_need_resize()
- 
-   BOOST_USING_STD_MIN();
-   if(!max_size)
--    next_size <<= 1;
-+    set_next_size(next_size << 1);
-   else if( next_size*partition_size/requested_size < max_size)
--    next_size = min BOOST_PREVENT_MACRO_SUBSTITUTION(next_size << 1, max_size*requested_size/ partition_size);
-+    set_next_size(min BOOST_PREVENT_MACRO_SUBSTITUTION(next_size << 1, max_size * requested_size / partition_size));
- 
-   //  initialize it,
-   //  (we can use "add_block" here because we know that
-@@ -792,6 +806,8 @@ void * pool<UserAllocator>::ordered_malloc(const size_type n)
- { //! Gets address of a chunk n, allocating new memory if not already available.
-   //! \returns Address of chunk n if allocated ok.
-   //! \returns 0 if not enough memory for n chunks.
-+  if (n > max_chunks())
-+    return 0;
- 
-   const size_type partition_size = alloc_size();
-   const size_type total_req_size = n * requested_size;
-@@ -840,9 +856,9 @@ void * pool<UserAllocator>::ordered_malloc(const size_type n)
- 
-   BOOST_USING_STD_MIN();
-   if(!max_size)
--    next_size <<= 1;
-+    set_next_size(next_size << 1);
-   else if( next_size*partition_size/requested_size < max_size)
--    next_size = min BOOST_PREVENT_MACRO_SUBSTITUTION(next_size << 1, max_size*requested_size/ partition_size);
-+    set_next_size(min BOOST_PREVENT_MACRO_SUBSTITUTION(next_size << 1, max_size * requested_size / partition_size));
- 
-   //  insert it into the list,
-   //   handle border case.
diff --git a/meta/recipes-support/boost/boost_1.79.0.bb b/meta/recipes-support/boost/boost_1.80.0.bb
similarity index 73%
rename from meta/recipes-support/boost/boost_1.79.0.bb
rename to meta/recipes-support/boost/boost_1.80.0.bb
index 09e2556790..c34ab7d703 100644
--- a/meta/recipes-support/boost/boost_1.79.0.bb
+++ b/meta/recipes-support/boost/boost_1.80.0.bb
@@ -1,8 +1,7 @@
 require boost-${PV}.inc
 require boost.inc
 
-SRC_URI += "file://boost-CVE-2012-2677.patch \
-           file://boost-math-disable-pch-for-gcc.patch \
+SRC_URI += "file://boost-math-disable-pch-for-gcc.patch \
            file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
            file://0001-dont-setup-compiler-flags-m32-m64.patch \
            file://0001-The-std-lib-unary-binary_function-base-classes-are-d.patch \
-- 
2.30.2


