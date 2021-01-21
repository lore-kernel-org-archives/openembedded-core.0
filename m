Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.1379.1611246138081873702
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Jan 2021 08:22:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: +YHVQfKvV1zFmn2hjm7jcIhIKHtfzHnu2S1JqYKN0B4sT7jbTIu7gFtJkmuqGTnzdGHySU6hwP
 LGH2OCvd8eyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9871"; a="179446361"
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="179446361"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:22 -0800
IronPort-SDR: PfWD5dP2gZDN4WurpMHkyhiy9SFiZ+0mxsL/uIQ+wBQF+wetHO3g2pcCZeCCP0/zk9fI3Xd/RL
 4mJuN8Io66EQ==
X-IronPort-AV: E=Sophos;i="5.79,364,1602572400"; 
   d="scan'208";a="427413620"
Received: from yonshuta-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.145.18])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2021 08:22:21 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 05/20] boost: drop arm-intrinsics.patch
Date: Fri, 22 Jan 2021 00:21:50 +0800
Message-Id: <c6dac9e737b27dc0e2b02a75463b0eba4b9b01d0.1611245974.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1611245974.git.anuj.mittal@intel.com>
References: <cover.1611245974.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mans Rullgard <mans@mansr.com>

This patch makes gcc produce broken code.  It is unclear why it is there
in the first place.  Drop it.

Signed-off-by: Mans Rullgard <mans@mansr.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5f3cace37496fe1dc4fd045f688f7d441505c437)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../boost/boost/arm-intrinsics.patch          | 55 -------------------
 meta/recipes-support/boost/boost_1.74.0.bb    |  2 +-
 2 files changed, 1 insertion(+), 56 deletions(-)
 delete mode 100644 meta/recipes-support/boost/boost/arm-intrinsics.patch

diff --git a/meta/recipes-support/boost/boost/arm-intrinsics.patch b/meta/recipes-support/boost/boost/arm-intrinsics.patch
deleted file mode 100644
index fe85c69a82..0000000000
--- a/meta/recipes-support/boost/boost/arm-intrinsics.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-Upstream-Status: Backport
-
-8/17/2010 - rebased to 1.44 by Qing He <qing.he@intel.com>
-
-diff --git a/boost/smart_ptr/detail/atomic_count_sync.hpp b/boost/smart_ptr/detail/atomic_count_sync.hpp
-index b6359b5..78b1cc2 100644
---- a/boost/smart_ptr/detail/atomic_count_sync.hpp
-+++ b/boost/smart_ptr/detail/atomic_count_sync.hpp
-@@ -33,17 +33,46 @@ public:
- 
-     long operator++()
-     {
-+#ifdef __ARM_ARCH_7A__
-+       int v1, tmp;
-+       asm volatile ("1:                 \n\t"
-+                     "ldrex   %0, %1     \n\t"
-+                     "add     %0 ,%0, #1 \n\t"
-+                     "strex   %2, %0, %1 \n\t"
-+                     "cmp     %2, #0     \n\t"
-+                     "bne     1b         \n\t"
-+                     : "=&r" (v1), "+Q"(value_), "=&r"(tmp)
-+                    );
-+#else
-         return __sync_add_and_fetch( &value_, 1 );
-+#endif
-     }
- 
-     long operator--()
-     {
-+#ifdef __ARM_ARCH_7A__
-+       int v1, tmp;
-+       asm volatile ("1:                 \n\t"
-+                     "ldrex   %0, %1     \n\t"
-+                     "sub     %0 ,%0, #1 \n\t"
-+                     "strex   %2, %0, %1 \n\t"
-+                     "cmp     %2, #0     \n\t"
-+                     "bne     1b         \n\t"
-+                     : "=&r" (v1), "+Q"(value_), "=&r"(tmp)
-+                    );
-+       return value_;
-+#else
-         return __sync_add_and_fetch( &value_, -1 );
-+#endif
-     }
- 
-     operator long() const
-     {
-+#if __ARM_ARCH_7A__
-+        return value_;
-+#else
-         return __sync_fetch_and_add( &value_, 0 );
-+#endif
-     }
- 
- private:
diff --git a/meta/recipes-support/boost/boost_1.74.0.bb b/meta/recipes-support/boost/boost_1.74.0.bb
index b01b390a59..9188303195 100644
--- a/meta/recipes-support/boost/boost_1.74.0.bb
+++ b/meta/recipes-support/boost/boost_1.74.0.bb
@@ -1,7 +1,7 @@
 require boost-${PV}.inc
 require boost.inc
 
-SRC_URI += "file://arm-intrinsics.patch \
+SRC_URI += " \
            file://boost-CVE-2012-2677.patch \
            file://boost-math-disable-pch-for-gcc.patch \
            file://0001-Apply-boost-1.62.0-no-forced-flags.patch.patch \
-- 
2.29.2

