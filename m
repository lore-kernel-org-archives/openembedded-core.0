Received: from afflict.kos.to ([92.243.29.197])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <riku.voipio@linaro.org>) id 1TxEG1-0007IR-6k
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 11:05:37 +0100
Received: from aimless.elisa-laajakaista.fi
	(a91-156-58-157.elisa-laajakaista.fi [91.156.58.157])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by afflict.kos.to (Postfix) with ESMTPSA id 8BB97264BE;
	Mon, 21 Jan 2013 10:50:09 +0100 (CET)
From: Riku Voipio <riku.voipio@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2013 11:50:03 +0200
Message-Id: <1358761803-2475-1-git-send-email-riku.voipio@linaro.org>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <50F97FDC.2060405@linux.intel.com>
References: <50F97FDC.2060405@linux.intel.com>
Subject: [PATCH] libaio: add aarch64 support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jan 2013 10:05:46 -0000

Picking up a patch from gentoo and adding aarch64 defines
is enough to fix libaio and pass the harness testsuite

Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
---
 .../libaio/libaio/libaio-aarch64.patch             |   28 +++++++++
 .../libaio/libaio/libaio-generic.patch             |   65 ++++++++++++++++++++
 meta/recipes-extended/libaio/libaio_0.3.109.bb     |    5 +-
 3 files changed, 97 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libaio/libaio/libaio-aarch64.patch
 create mode 100644 meta/recipes-extended/libaio/libaio/libaio-generic.patch

diff --git a/meta/recipes-extended/libaio/libaio/libaio-aarch64.patch b/meta/recipes-extended/libaio/libaio/libaio-aarch64.patch
new file mode 100644
index 0000000..e3d1058
--- /dev/null
+++ b/meta/recipes-extended/libaio/libaio/libaio-aarch64.patch
@@ -0,0 +1,28 @@
+Upstream-Status: Submitted
+
+Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
+
+---
+ harness/cases/16.t |    2 ++
+ src/libaio.h       |   10 ++++++++++
+ 2 files changed, 12 insertions(+)
+
+--- a/src/libaio.h
++++ b/src/libaio.h
+@@ -107,6 +107,16 @@
+ #  else
+ #    error "neither mipseb nor mipsel?"
+ #  endif
++#elif defined(__aarch64__)
++#  if defined (__AARCH64EB__) /* big endian, 64 bits */
++#define PADDED(x, y)    unsigned y; x
++#define PADDEDptr(x,y)  x
++#define PADDEDul(x, y)  unsigned long x
++#  elif defined(__AARCH64EL__) /* little endian, 64 bits */
++#define PADDED(x, y)    x, y
++#define PADDEDptr(x, y) x
++#define PADDEDul(x, y)  unsigned long x
++#  endif
+ #else
+ #error	endian?
+ #endif
diff --git a/meta/recipes-extended/libaio/libaio/libaio-generic.patch b/meta/recipes-extended/libaio/libaio/libaio-generic.patch
new file mode 100644
index 0000000..3fcf541
--- /dev/null
+++ b/meta/recipes-extended/libaio/libaio/libaio-generic.patch
@@ -0,0 +1,65 @@
+From 5e96c73d5dfbdea8d0be82b7f3fc8d6735e5dfa7 Mon Sep 17 00:00:00 2001
+From: Mike Frysinger <vapier@gentoo.org>
+Date: Sun, 17 Jan 2010 17:07:48 -0500
+Subject: [PATCH] add a generic syscall() fallback
+
+Upstream-Status: Pending
+
+Signed-off-by: Mike Frysinger <vapier@gentoo.org>
+Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
+---
+ src/syscall-generic.h |   29 +++++++++++++++++++++++++++++
+ src/syscall.h         |    3 ++-
+ 2 files changed, 31 insertions(+), 1 deletions(-)
+ create mode 100644 src/syscall-generic.h
+
+diff --git a/src/syscall-generic.h b/src/syscall-generic.h
+new file mode 100644
+index 0000000..24d7c7c
+--- /dev/null
++++ b/src/syscall-generic.h
+@@ -0,0 +1,29 @@
++#include <errno.h>
++#include <unistd.h>
++#include <sys/syscall.h>
++
++#define _body_io_syscall(sname, args...) \
++{ \
++   int ret = syscall(__NR_##sname, ## args); \
++   return ret < 0 ? -errno : ret; \
++}
++
++#define io_syscall1(type,fname,sname,type1,arg1) \
++type fname(type1 arg1) \
++_body_io_syscall(sname, (long)arg1)
++
++#define io_syscall2(type,fname,sname,type1,arg1,type2,arg2) \
++type fname(type1 arg1,type2 arg2) \
++_body_io_syscall(sname, (long)arg1, (long)arg2)
++
++#define io_syscall3(type,fname,sname,type1,arg1,type2,arg2,type3,arg3) \
++type fname(type1 arg1,type2 arg2,type3 arg3) \
++_body_io_syscall(sname, (long)arg1, (long)arg2, (long)arg3)
++
++#define io_syscall4(type,fname,sname,type1,arg1,type2,arg2,type3,arg3,type4,arg4) \
++type fname (type1 arg1, type2 arg2, type3 arg3, type4 arg4) \
++_body_io_syscall(sname, (long)arg1, (long)arg2, (long)arg3, (long)arg4)
++
++#define io_syscall5(type,fname,sname,type1,arg1,type2,arg2,type3,arg3,type4,arg4, type5,arg5) \
++type fname (type1 arg1,type2 arg2,type3 arg3,type4 arg4,type5 arg5) \
++_body_io_syscall(sname, (long)arg1, (long)arg2, (long)arg3, (long)arg4, (long)arg5)
+diff --git a/src/syscall.h b/src/syscall.h
+index 78becfe..d954af0 100644
+--- a/src/syscall.h
++++ b/src/syscall.h
+@@ -25,5 +25,6 @@
+ #elif defined(__arm__)
+ #include "syscall-arm.h"
+ #else
+-#error "add syscall-arch.h"
++#warning "using generic syscall method"
++#include "syscall-generic.h"
+ #endif
+-- 
+1.7.3.1
+
diff --git a/meta/recipes-extended/libaio/libaio_0.3.109.bb b/meta/recipes-extended/libaio/libaio_0.3.109.bb
index 0712d04..afe9adf 100644
--- a/meta/recipes-extended/libaio/libaio_0.3.109.bb
+++ b/meta/recipes-extended/libaio/libaio_0.3.109.bb
@@ -11,7 +11,10 @@ SRC_URI = "${DEBIAN_MIRROR}/main/liba/libaio/libaio_${PV}.orig.tar.gz \
            file://00_arches.patch \
            file://toolchain.patch \
            file://destdir.patch \
-           file://libaio_fix_for_x32.patch"
+           file://libaio_fix_for_x32.patch \
+           file://libaio-generic.patch \
+           file://libaio-aarch64.patch \
+"
 
 SRC_URI[md5sum] = "435a5b16ca6198eaf01155263d855756"
 SRC_URI[sha256sum] = "bf4a457253cbaab215aea75cb6e18dc8d95bbd507e9920661ff9bdd288c8778d"
-- 
1.7.10.4



