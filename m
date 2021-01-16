Received: from unicorn.mansr.com (unicorn.mansr.com [81.2.72.234])
 by mx.groups.io with SMTP id smtpd.web09.3976.1610804060920734841
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Jan 2021 05:34:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: mansr.com, ip: 81.2.72.234, mailfrom: mru@mansr.com)
Received: from raven.mansr.com (raven.mansr.com [81.2.72.235])
	by unicorn.mansr.com (Postfix) with ESMTPS id 343EF15360
	for <openembedded-core@lists.openembedded.org>; Sat, 16 Jan 2021 13:34:18 +0000 (GMT)
Received: by raven.mansr.com (Postfix, from userid 51770)
	id 1293B219FDE; Sat, 16 Jan 2021 13:34:18 +0000 (GMT)
From: "Mans Rullgard" <mans@mansr.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] boost: drop arm-intrinsics.patch
Date: Sat, 16 Jan 2021 13:34:08 +0000
Message-Id: <20210116133408.16089-1-mans@mansr.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This patch makes gcc produce broken code.  It is unclear why it is there
in the first place.  Drop it.

Signed-off-by: Mans Rullgard <mans@mansr.com>
---
 .../boost/boost/arm-intrinsics.patch          | 55 -------------------
 meta/recipes-support/boost/boost_1.75.0.bb    |  2 +-
 2 files changed, 1 insertion(+), 56 deletions(-)
 delete mode 100644 meta/recipes-support/boost/boost/arm-intrinsics.patch

diff --git a/meta/recipes-support/boost/boost/arm-intrinsics.patch b/meta=
/recipes-support/boost/boost/arm-intrinsics.patch
deleted file mode 100644
index fe85c69a827a..000000000000
--- a/meta/recipes-support/boost/boost/arm-intrinsics.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-Upstream-Status: Backport
-
-8/17/2010 - rebased to 1.44 by Qing He <qing.he@intel.com>
-
-diff --git a/boost/smart_ptr/detail/atomic_count_sync.hpp b/boost/smart_=
ptr/detail/atomic_count_sync.hpp
-index b6359b5..78b1cc2 100644
---- a/boost/smart_ptr/detail/atomic_count_sync.hpp
-+++ b/boost/smart_ptr/detail/atomic_count_sync.hpp
-@@ -33,17 +33,46 @@ public:
-=20
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
-+                     : "=3D&r" (v1), "+Q"(value_), "=3D&r"(tmp)
-+                    );
-+#else
-         return __sync_add_and_fetch( &value_, 1 );
-+#endif
-     }
-=20
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
-+                     : "=3D&r" (v1), "+Q"(value_), "=3D&r"(tmp)
-+                    );
-+       return value_;
-+#else
-         return __sync_add_and_fetch( &value_, -1 );
-+#endif
-     }
-=20
-     operator long() const
-     {
-+#if __ARM_ARCH_7A__
-+        return value_;
-+#else
-         return __sync_fetch_and_add( &value_, 0 );
-+#endif
-     }
-=20
- private:
diff --git a/meta/recipes-support/boost/boost_1.75.0.bb b/meta/recipes-su=
pport/boost/boost_1.75.0.bb
index 33137e236dba..23b0ffc67e29 100644
--- a/meta/recipes-support/boost/boost_1.75.0.bb
+++ b/meta/recipes-support/boost/boost_1.75.0.bb
@@ -1,7 +1,7 @@
 require boost-${PV}.inc
 require boost.inc
=20
-SRC_URI +=3D "file://arm-intrinsics.patch \
+SRC_URI +=3D " \
            file://boost-CVE-2012-2677.patch \
            file://boost-math-disable-pch-for-gcc.patch \
            file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-tha=
t-o.patch \
--=20
2.30.0

