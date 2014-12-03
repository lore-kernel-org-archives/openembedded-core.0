Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 77DF060169
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 22:53:05 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Dec 2014 14:51:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,510,1413270000"; d="scan'208";a="632300844"
Received: from smoffitt-mobl.ger.corp.intel.com (HELO
	swold-linux.amr.corp.intel.com) ([10.255.13.114])
	by fmsmga001.fm.intel.com with ESMTP; 03 Dec 2014 14:51:59 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Dec 2014 14:51:58 -0800
Message-Id: <1417647118-19527-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH v2] lzo: add debian patch for alignment issue
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
X-List-Received-Date: Wed, 03 Dec 2014 22:53:15 -0000

[YOCTO #6994]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
v2 Fixed Patched Tag info

 ...0001-Use-memcpy-instead-of-reinventing-it.patch | 70 ++++++++++++++++++++++
 meta/recipes-support/lzo/lzo_2.08.bb               |  1 +
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-support/lzo/lzo/0001-Use-memcpy-instead-of-reinventing-it.patch

diff --git a/meta/recipes-support/lzo/lzo/0001-Use-memcpy-instead-of-reinventing-it.patch b/meta/recipes-support/lzo/lzo/0001-Use-memcpy-instead-of-reinventing-it.patch
new file mode 100644
index 0000000..db3a70e
--- /dev/null
+++ b/meta/recipes-support/lzo/lzo/0001-Use-memcpy-instead-of-reinventing-it.patch
@@ -0,0 +1,70 @@
+From: Simon McVittie <smcv@debian.org>
+Date: Sun, 23 Nov 2014 22:50:33 +0000
+Subject: Use memcpy() instead of reinventing it
+
+gcc inlines memcpy() with results as fast as handwritten code (at
+least in my brief testing with lzop), and knows the alignment
+constraints for our architectures.
+
+Change suggested by Julian Taylor.
+
+Bug-Debian: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=757037
+
+Upstream-Status: Pending
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+---
+ minilzo/minilzo.c | 14 ++++++++++++++
+ src/lzo_func.h    | 14 ++++++++++++++
+ 2 files changed, 28 insertions(+)
+
+
+diff --git a/minilzo/minilzo.c b/minilzo/minilzo.c
+index ab2be5f..6913c2f 100644
+--- a/minilzo/minilzo.c
++++ b/minilzo/minilzo.c
+@@ -3523,6 +3523,20 @@ LZO_COMPILE_TIME_ASSERT_HEADER(sizeof(*(lzo_memops_TU8p)0)==8)
+     if ((void)0, n__n > 0) do { *d__n++ = *s__n++; } while (--n__n > 0); \
+     LZO_BLOCK_END
+ 
++/* Debian-specific change: we know that our compiler inlines memcpy() with
++ * constant n to be as fast as handwritten code, and knows which architectures
++ * need things correctly aligned. */
++#undef LZO_MEMOPS_COPY1
++#undef LZO_MEMOPS_COPY2
++#undef LZO_MEMOPS_COPY4
++#undef LZO_MEMOPS_COPY8
++#undef LZO_MEMOPS_COPYN
++#define LZO_MEMOPS_COPY1(dd,ss) memcpy(dd, ss, 1)
++#define LZO_MEMOPS_COPY2(dd,ss) memcpy(dd, ss, 2)
++#define LZO_MEMOPS_COPY4(dd,ss) memcpy(dd, ss, 4)
++#define LZO_MEMOPS_COPY8(dd,ss) memcpy(dd, ss, 8)
++#define LZO_MEMOPS_COPYN(dd,ss,nn) memcpy(dd, ss, nn)
++
+ __lzo_static_forceinline lzo_uint16_t lzo_memops_get_le16(const lzo_voidp ss)
+ {
+     lzo_uint16_t v;
+diff --git a/src/lzo_func.h b/src/lzo_func.h
+index dfaa676..1cc1b53 100644
+--- a/src/lzo_func.h
++++ b/src/lzo_func.h
+@@ -333,6 +333,20 @@ LZO_COMPILE_TIME_ASSERT_HEADER(sizeof(*(lzo_memops_TU8p)0)==8)
+     if ((void)0, n__n > 0) do { *d__n++ = *s__n++; } while (--n__n > 0); \
+     LZO_BLOCK_END
+ 
++/* Debian-specific change: we know that our compiler inlines memcpy() with
++ * constant n to be as fast as handwritten code, and knows which architectures
++ * need things correctly aligned. */
++#undef LZO_MEMOPS_COPY1
++#undef LZO_MEMOPS_COPY2
++#undef LZO_MEMOPS_COPY4
++#undef LZO_MEMOPS_COPY8
++#undef LZO_MEMOPS_COPYN
++#define LZO_MEMOPS_COPY1(dd,ss) memcpy(dd, ss, 1)
++#define LZO_MEMOPS_COPY2(dd,ss) memcpy(dd, ss, 2)
++#define LZO_MEMOPS_COPY4(dd,ss) memcpy(dd, ss, 4)
++#define LZO_MEMOPS_COPY8(dd,ss) memcpy(dd, ss, 8)
++#define LZO_MEMOPS_COPYN(dd,ss,nn) memcpy(dd, ss, nn)
++
+ __lzo_static_forceinline lzo_uint16_t lzo_memops_get_le16(const lzo_voidp ss)
+ {
+     lzo_uint16_t v;
diff --git a/meta/recipes-support/lzo/lzo_2.08.bb b/meta/recipes-support/lzo/lzo_2.08.bb
index 7d7d1f3..af06e29 100644
--- a/meta/recipes-support/lzo/lzo_2.08.bb
+++ b/meta/recipes-support/lzo/lzo_2.08.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://src/lzo_init.c;beginline=5;endline=25;md5=a6e25df9a83b24629e847846ccdd8054"
 
 SRC_URI = "http://www.oberhumer.com/opensource/lzo/download/lzo-${PV}.tar.gz \
+           file://0001-Use-memcpy-instead-of-reinventing-it.patch \
            file://acinclude.m4 \
            "
 
-- 
1.8.3.1


