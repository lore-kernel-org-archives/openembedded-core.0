Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 127C8701CD
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 11:01:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6SB12xf002206
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 04:01:03 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 28 Jul 2014 04:01:02 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Jul 2014 19:01:03 +0800
Message-ID: <1406545263-7393-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] gmp: redefine a function
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
X-List-Received-Date: Mon, 28 Jul 2014 11:01:12 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

redefine a function to make it be able to work on mips64 64BIT ABI

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../gmp/gmp-4.2.1/reimplement_umul_ppmm.patch      |   39 ++++++++++++++++++++
 meta/recipes-support/gmp/gmp_4.2.1.bb              |    1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-support/gmp/gmp-4.2.1/reimplement_umul_ppmm.patch

diff --git a/meta/recipes-support/gmp/gmp-4.2.1/reimplement_umul_ppmm.patch b/meta/recipes-support/gmp/gmp-4.2.1/reimplement_umul_ppmm.patch
new file mode 100644
index 0000000..739d88a
--- /dev/null
+++ b/meta/recipes-support/gmp/gmp-4.2.1/reimplement_umul_ppmm.patch
@@ -0,0 +1,39 @@
+[PATCH] reimplement umul_ppmm to make it be able to building on mips64 64bit ABI
+
+Upstream-Status: Pending[This version was not maintained by upstream, larger versions have been fixed]
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+---
+ longlong.h | 14 ++++++++++++--
+ 1 file changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/longlong.h b/longlong.h
+index b53fbee..faa845a 100644
+--- a/longlong.h
++++ b/longlong.h
+@@ -1024,10 +1024,20 @@ extern UWtype __MPN(udiv_qrnnd) _PROTO ((UWtype *, UWtype, UWtype, UWtype));
+ #endif /* __mips */
+ 
+ #if (defined (__mips) && __mips >= 3) && W_TYPE_SIZE == 64
+-#if __GNUC__ > 2 || __GNUC_MINOR__ >= 7
++#if __GMP_GNUC_PREREQ (4,4)
++#define umul_ppmm(w1, w0, u, v) \
++  do {						\
++    typedef unsigned int __ll_UTItype __attribute__((mode(TI)));	\
++    __ll_UTItype __ll = (__ll_UTItype)(u) * (v);	\
++    w1 = __ll >> 64;					\
++    w0 = __ll;						\
++  } while (0)
++#endif
++#if !defined (umul_ppmm) && __GMP_GNUC_PREREQ (2,7)
+ #define umul_ppmm(w1, w0, u, v) \
+   __asm__ ("dmultu %2,%3" : "=l" (w0), "=h" (w1) : "d" (u), "d" (v))
+-#else
++#endif
++#if !defined (umul_ppmm)
+ #define umul_ppmm(w1, w0, u, v) \
+   __asm__ ("dmultu %2,%3\n\tmflo %0\n\tmfhi %1"				\
+ 	   : "=d" (w0), "=d" (w1) : "d" (u), "d" (v))
+-- 
+1.9.1
+
diff --git a/meta/recipes-support/gmp/gmp_4.2.1.bb b/meta/recipes-support/gmp/gmp_4.2.1.bb
index 69ad0ca..216ee41 100644
--- a/meta/recipes-support/gmp/gmp_4.2.1.bb
+++ b/meta/recipes-support/gmp/gmp_4.2.1.bb
@@ -12,6 +12,7 @@ PR = "r2"
 SRC_URI = "${GNU_MIRROR}/gmp/${BP}.tar.bz2 \
            file://disable-stdc.patch \
            file://gmp_fix_for_automake-1.12.patch \
+           file://reimplement_umul_ppmm.patch \
            "
 
 SRC_URI[md5sum] = "091c56e0e1cca6b09b17b69d47ef18e3"
-- 
1.7.10.4


