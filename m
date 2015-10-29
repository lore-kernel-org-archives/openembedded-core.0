Return-Path: <juro.bystricky@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 28D50755F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 20:50:12 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 29 Oct 2015 13:50:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,216,1444719600"; d="scan'208";a="674590940"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga003.jf.intel.com with ESMTP; 29 Oct 2015 13:50:12 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org,
	jurobystricky@hotmail.com
Date: Thu, 29 Oct 2015 13:43:38 -0700
Message-Id: <1446151418-16034-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446151418-16034-1-git-send-email-juro.bystricky@intel.com>
References: <1446151418-16034-1-git-send-email-juro.bystricky@intel.com>
Subject: [PATCH 1/1] glibc: Allow 64 bit atomics for x86
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
X-List-Received-Date: Thu, 29 Oct 2015 20:50:12 -0000

This patch fixes [YOCTO#8140].

The fix consist of allowing 64bit atomic ops for x86.
This should be safe for i586 and newer CPUs.
It also makes the synchronization more efficient.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 .../glibc/glibc/use_64bit_atomics.patch            | 24 ++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.22.bb              |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/use_64bit_atomics.patch

diff --git a/meta/recipes-core/glibc/glibc/use_64bit_atomics.patch b/meta/recipes-core/glibc/glibc/use_64bit_atomics.patch
new file mode 100644
index 0000000..eb7f2b2
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/use_64bit_atomics.patch
@@ -0,0 +1,24 @@
+This patch alows using 64 bit atomic instructions on a
+32 bit platform. This is safe, providing x86 is Pentium or
+later (would not work on i386, i486). Using 64 bit atomic 
+instructions bypasses code containing a bug as documented in
+https://bugzilla.yoctoproject.org/show_bug.cgi?id=8140
+
+Upstream-Status: TBD
+
+Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
+
+
+Index: libc/sysdeps/i386/i486/bits/atomic.h
+===================================================================
+--- libc.orig/sysdeps/i386/i486/bits/atomic.h
++++ libc/sysdeps/i386/i486/bits/atomic.h
+@@ -54,7 +54,7 @@ typedef uintmax_t uatomic_max_t;
+ # endif
+ #endif
+ 
+-#define __HAVE_64B_ATOMICS 0
++#define __HAVE_64B_ATOMICS 1
+ #define USE_ATOMIC_COMPILER_BUILTINS 0
+ 
+ 
diff --git a/meta/recipes-core/glibc/glibc_2.22.bb b/meta/recipes-core/glibc/glibc_2.22.bb
index 020e417..2494ad7 100644
--- a/meta/recipes-core/glibc/glibc_2.22.bb
+++ b/meta/recipes-core/glibc/glibc_2.22.bb
@@ -50,6 +50,7 @@ SRC_URI_append_class-nativesdk = "\
            file://0001-nativesdk-glibc-Look-for-host-system-ld.so.cache-as-.patch \
            file://0002-nativesdk-glibc-Fix-buffer-overrun-with-a-relocated-.patch \
            file://0003-nativesdk-glibc-Raise-the-size-of-arrays-containing-.patch \
+           file://use_64bit_atomics.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
1.9.1


