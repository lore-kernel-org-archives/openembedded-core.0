Return-Path: <Jianchuan.Wang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 40D416AD01
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Oct 2014 01:51:57 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9H1pwMK011868
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Oct 2014 18:51:58 -0700 (PDT)
Received: from PEK-JWANG7-D1.corp.ad.wrs.com (128.224.162.221) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 16 Oct 2014 18:51:58 -0700
From: <jianchuan.wang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Oct 2014 09:51:45 +0800
Message-ID: <1413510705-24120-1-git-send-email-jianchuan.wang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] libaio: fix for mips64
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
X-List-Received-Date: Fri, 17 Oct 2014 01:52:03 -0000
Content-Type: text/plain

From: Jianchuan Wang <jianchuan.wang@windriver.com>

Add mips64 support in the libaio.h
- add macro PADDED/PADDEDptr/PADDEDul in the mips64 for structure iocb
  to be matched userland with kernel

Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
---
 .../libaio/libaio/libaio_fix_for_mips64.patch      | 42 ++++++++++++++++++++++
 meta/recipes-extended/libaio/libaio_0.3.109.bb     |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-extended/libaio/libaio/libaio_fix_for_mips64.patch

diff --git a/meta/recipes-extended/libaio/libaio/libaio_fix_for_mips64.patch b/meta/recipes-extended/libaio/libaio/libaio_fix_for_mips64.patch
new file mode 100644
index 0000000..0ef9f14
--- /dev/null
+++ b/meta/recipes-extended/libaio/libaio/libaio_fix_for_mips64.patch
@@ -0,0 +1,42 @@
+From 62fd97fbc5c53835baa18f210fca593fc8b5c636 Mon Sep 17 00:00:00 2001
+From: Jianchuan Wang <jianchuan.wang@windriver.com>
+Date: Wed, 15 Oct 2014 07:04:02 +0800
+Subject: [PATCH] libaio: fix for mips64
+    
+Add mips64 support in the libaio.h
+ - add macro PADDED/PADDEDptr/PADDEDul in the mips64 for structure iocb 
+   to be matched userland with kernel
+
+Upstream-Status: Backport
+
+Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
+---
+ src/libaio.h | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/src/libaio.h b/src/libaio.h
+index ff99188..64ea8f3 100644
+--- a/src/libaio.h
++++ b/src/libaio.h
+@@ -95,6 +95,18 @@ typedef enum io_iocb_cmd {
+ #define PADDED(x, y)   unsigned y; x
+ #define PADDEDptr(x, y)        unsigned y; x
+ #define PADDEDul(x, y) unsigned y; unsigned long x
++#elif defined(__mips64)
++#  if defined (__MIPSEB__) /* big endian, 64 bits */
++#define PADDED(x, y)	unsigned y; x
++#define PADDEDptr(x,y)	x
++#define PADDEDul(x, y)	unsigned long x
++#  elif defined(__MIPSEL__) /* little endian, 64 bits */
++#define PADDED(x, y)	x, y
++#define PADDEDptr(x, y)	x
++#define PADDEDul(x, y)	unsigned long x
++#  else
++#    error "mips64: neither mipseb nor mipsel?"
++#  endif
+ #elif defined(__mips__)
+ #  if defined (__MIPSEB__) /* big endian, 32 bits */
+ #define PADDED(x, y)   unsigned y; x
+-- 
+1.8.2.1
+
diff --git a/meta/recipes-extended/libaio/libaio_0.3.109.bb b/meta/recipes-extended/libaio/libaio_0.3.109.bb
index 978f5f5..0483c71 100644
--- a/meta/recipes-extended/libaio/libaio_0.3.109.bb
+++ b/meta/recipes-extended/libaio/libaio_0.3.109.bb
@@ -15,6 +15,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/liba/libaio/libaio_${PV}.orig.tar.gz \
            file://libaio-generic.patch \
            file://libaio-aarch64.patch \
            file://libaio_fix_for_mips_syscalls.patch \
+           file://libaio_fix_for_mips64.patch \
 "
 
 SRC_URI[md5sum] = "435a5b16ca6198eaf01155263d855756"
-- 
1.9.1


