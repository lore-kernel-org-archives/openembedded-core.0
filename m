Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B9122606D0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 09:09:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6I994gp025919
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2016 02:09:04 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 18 Jul 2016 02:09:03 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 18 Jul 2016 17:06:36 +0800
Message-ID: <1468832796-21727-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Subject: [PATCH] boost: fix CVE-2012-2677
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Jul 2016 09:09:11 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2012-2677 for boost from:

https://svn.boost.org/trac/boost/changeset/78326

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../boost/boost/boost-CVE-2012-2677.patch          | 112 +++++++++++++++++++++
 meta/recipes-support/boost/boost_1.61.0.bb         |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-support/boost/boost/boost-CVE-2012-2677.patch

diff --git a/meta/recipes-support/boost/boost/boost-CVE-2012-2677.patch b/meta/recipes-support/boost/boost/boost-CVE-2012-2677.patch
new file mode 100644
index 0000000..859f4aa
--- /dev/null
+++ b/meta/recipes-support/boost/boost/boost-CVE-2012-2677.patch
@@ -0,0 +1,112 @@
+Reference
+
+https://svn.boost.org/trac/boost/changeset/78326
+
+Upstream-Status: Backport
+
+Signed-off-by: Yue Tao <yue.tao@windriver.com>
+
+diff --git a/boost/pool/pool.hpp.old b/boost/pool/pool.hpp
+index c47b11f..417a1e0 100644
+--- a/boost/pool/pool.hpp.old
++++ b/boost/pool/pool.hpp
+@@ -26,6 +26,8 @@
+ 
+ #include <boost/pool/poolfwd.hpp>
+ 
++// std::numeric_limits
++#include <boost/limits.hpp>
+ // boost::integer::static_lcm
+ #include <boost/integer/common_factor_ct.hpp>
+ // boost::simple_segregated_storage
+@@ -355,6 +357,15 @@ class pool: protected simple_segregated_storage < typename UserAllocator::size_t
+       return s;
+     }
+ 
++    size_type max_chunks() const
++    { //! Calculated maximum number of memory chunks that can be allocated in a single call by this Pool.
++      size_type partition_size = alloc_size();
++      size_type POD_size = math::static_lcm<sizeof(size_type), sizeof(void *)>::value + sizeof(size_type);
++      size_type max_chunks = (std::numeric_limits<size_type>::max() - POD_size) / alloc_size();
++
++      return max_chunks;
++    }
++
+     static void * & nextof(void * const ptr)
+     { //! \returns Pointer dereferenced.
+       //! (Provided and used for the sake of code readability :)
+@@ -375,6 +386,8 @@ class pool: protected simple_segregated_storage < typename UserAllocator::size_t
+       //!   the first time that object needs to allocate system memory.
+       //!   The default is 32. This parameter may not be 0.
+       //! \param nmax_size is the maximum number of chunks to allocate in one block.
++      set_next_size(nnext_size);
++      set_max_size(nmax_size);
+     }
+ 
+     ~pool()
+@@ -398,8 +411,8 @@ class pool: protected simple_segregated_storage < typename UserAllocator::size_t
+     }
+     void set_next_size(const size_type nnext_size)
+     { //! Set number of chunks to request from the system the next time that object needs to allocate system memory. This value should never be set to 0.
+-      //! \returns nnext_size.
+-      next_size = start_size = nnext_size;
++      BOOST_USING_STD_MIN();
++      next_size = start_size = min BOOST_PREVENT_MACRO_SUBSTITUTION(nnext_size, max_chunks());
+     }
+     size_type get_max_size() const
+     { //! \returns max_size.
+@@ -407,7 +420,8 @@ class pool: protected simple_segregated_storage < typename UserAllocator::size_t
+     }
+     void set_max_size(const size_type nmax_size)
+     { //! Set max_size.
+-      max_size = nmax_size;
++      BOOST_USING_STD_MIN();
++      max_size = min BOOST_PREVENT_MACRO_SUBSTITUTION(nmax_size, max_chunks());
+     }
+     size_type get_requested_size() const
+     { //!   \returns the requested size passed into the constructor.
+@@ -708,9 +722,9 @@ void * pool<UserAllocator>::malloc_need_resize()
+ 
+   BOOST_USING_STD_MIN();
+   if(!max_size)
+-    next_size <<= 1;
++    set_next_size(next_size << 1);
+   else if( next_size*partition_size/requested_size < max_size)
+-    next_size = min BOOST_PREVENT_MACRO_SUBSTITUTION(next_size << 1, max_size*requested_size/ partition_size);
++    set_next_size(min BOOST_PREVENT_MACRO_SUBSTITUTION(next_size << 1, max_size * requested_size / partition_size));
+ 
+   //  initialize it,
+   store().add_block(node.begin(), node.element_size(), partition_size);
+@@ -748,9 +762,9 @@ void * pool<UserAllocator>::ordered_malloc_need_resize()
+ 
+   BOOST_USING_STD_MIN();
+   if(!max_size)
+-    next_size <<= 1;
++    set_next_size(next_size << 1);
+   else if( next_size*partition_size/requested_size < max_size)
+-    next_size = min BOOST_PREVENT_MACRO_SUBSTITUTION(next_size << 1, max_size*requested_size/ partition_size);
++    set_next_size(min BOOST_PREVENT_MACRO_SUBSTITUTION(next_size << 1, max_size * requested_size / partition_size));
+ 
+   //  initialize it,
+   //  (we can use "add_block" here because we know that
+@@ -792,6 +806,8 @@ void * pool<UserAllocator>::ordered_malloc(const size_type n)
+ { //! Gets address of a chunk n, allocating new memory if not already available.
+   //! \returns Address of chunk n if allocated ok.
+   //! \returns 0 if not enough memory for n chunks.
++  if (n > max_chunks())
++    return 0;
+ 
+   const size_type partition_size = alloc_size();
+   const size_type total_req_size = n * requested_size;
+@@ -840,9 +856,9 @@ void * pool<UserAllocator>::ordered_malloc(const size_type n)
+ 
+   BOOST_USING_STD_MIN();
+   if(!max_size)
+-    next_size <<= 1;
++    set_next_size(next_size << 1);
+   else if( next_size*partition_size/requested_size < max_size)
+-    next_size = min BOOST_PREVENT_MACRO_SUBSTITUTION(next_size << 1, max_size*requested_size/ partition_size);
++    set_next_size(min BOOST_PREVENT_MACRO_SUBSTITUTION(next_size << 1, max_size * requested_size / partition_size));
+ 
+   //  insert it into the list,
+   //   handle border case.
diff --git a/meta/recipes-support/boost/boost_1.61.0.bb b/meta/recipes-support/boost/boost_1.61.0.bb
index d8b14fe..1116444 100644
--- a/meta/recipes-support/boost/boost_1.61.0.bb
+++ b/meta/recipes-support/boost/boost_1.61.0.bb
@@ -4,4 +4,5 @@ include boost.inc
 SRC_URI += "\
     file://arm-intrinsics.patch \
     file://consider-hardfp.patch \
+    file://boost-CVE-2012-2677.patch \
 "
-- 
2.6.1


