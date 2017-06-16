Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 25B6B7845A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 12:29:29 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 05:29:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="1161279613"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2017 05:29:17 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Jun 2017 15:28:53 +0300
Message-Id: <651ba83b1745b17e93a9d9b857f1bf70620f76ec.1497615866.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
References: <cover.1497615866.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 30/32] liburcu: update to 0.10.0
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
X-List-Received-Date: Fri, 16 Jun 2017 12:29:31 -0000

Drop backported patch.
Update paths to files that establish the licensing.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../0001-Support-for-NIOS2-architecture.patch      | 145 ---------------------
 .../{liburcu_0.9.3.bb => liburcu_0.10.0.bb}        |   9 +-
 2 files changed, 4 insertions(+), 150 deletions(-)
 delete mode 100644 meta/recipes-support/liburcu/liburcu/0001-Support-for-NIOS2-architecture.patch
 rename meta/recipes-support/liburcu/{liburcu_0.9.3.bb => liburcu_0.10.0.bb} (51%)

diff --git a/meta/recipes-support/liburcu/liburcu/0001-Support-for-NIOS2-architecture.patch b/meta/recipes-support/liburcu/liburcu/0001-Support-for-NIOS2-architecture.patch
deleted file mode 100644
index 6296238b83b..00000000000
--- a/meta/recipes-support/liburcu/liburcu/0001-Support-for-NIOS2-architecture.patch
+++ /dev/null
@@ -1,145 +0,0 @@
-From f37c5b56376d9bb506da68bb11d0d7463e6e563b Mon Sep 17 00:00:00 2001
-From: Marek Vasut <marex@denx.de>
-Date: Tue, 9 Feb 2016 01:52:26 +0100
-Subject: [PATCH] Support for NIOS2 architecture
-
-Add support for the Altera NIOS2 CPU archirecture. The atomic operations
-are handled by the GCC. The memory barriers on this systems are entirely
-trivial too, since the CPU does not support SMP at all.
-
-Signed-off-by: Marek Vasut <marex@denx.de>
-Upstream-Status: Backport [ http://git.lttng.org/?p=userspace-rcu.git;a=commit;h=859050b3088aa3f0cb59d7f51ce24b9a0f18faa5 ]
-
----
- LICENSE              |  1 +
- README.md            |  1 +
- configure.ac         |  1 +
- urcu/arch/nios2.h    | 40 ++++++++++++++++++++++++++++++++++++++++
- urcu/uatomic/nios2.h | 32 ++++++++++++++++++++++++++++++++
- 5 files changed, 75 insertions(+)
- create mode 100644 urcu/arch/nios2.h
- create mode 100644 urcu/uatomic/nios2.h
-
-diff --git a/LICENSE b/LICENSE
-index 3147094..a06fdcc 100644
---- a/LICENSE
-+++ b/LICENSE
-@@ -45,6 +45,7 @@ compiler.h
- arch/s390.h
- uatomic/alpha.h
- uatomic/mips.h
-+uatomic/nios2.h
- uatomic/s390.h
- system.h
- 
-diff --git a/README.md b/README.md
-index f6b290f..6fe9c1e 100644
---- a/README.md
-+++ b/README.md
-@@ -43,6 +43,7 @@ Currently, the following architectures are supported:
-   - S390, S390x
-   - ARM 32/64
-   - MIPS
-+  - NIOS2
-   - Alpha
-   - ia64
-   - Sparcv9 32/64
-diff --git a/configure.ac b/configure.ac
-index eebed56..8014e1d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -136,6 +136,7 @@ AS_CASE([$host_cpu],
- 	[arm*], [ARCHTYPE="arm"],
- 	[aarch64*], [ARCHTYPE="aarch64"],
- 	[mips*], [ARCHTYPE="mips"],
-+	[nios2*], [ARCHTYPE="nios2"],
- 	[tile*], [ARCHTYPE="tile"],
- 	[hppa*], [ARCHTYPE="hppa"],
- 	[ARCHTYPE="unknown"]
-diff --git a/urcu/arch/nios2.h b/urcu/arch/nios2.h
-new file mode 100644
-index 0000000..b4f3e50
---- /dev/null
-+++ b/urcu/arch/nios2.h
-@@ -0,0 +1,40 @@
-+#ifndef _URCU_ARCH_NIOS2_H
-+#define _URCU_ARCH_NIOS2_H
-+
-+/*
-+ * arch_nios2.h: trivial definitions for the NIOS2 architecture.
-+ *
-+ * Copyright (c) 2016 Marek Vasut <marex@denx.de>
-+ *
-+ * This library is free software; you can redistribute it and/or
-+ * modify it under the terms of the GNU Lesser General Public
-+ * License as published by the Free Software Foundation; either
-+ * version 2.1 of the License, or (at your option) any later version.
-+ *
-+ * This library is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
-+ * Lesser General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU Lesser General Public
-+ * License along with this library; if not, write to the Free Software
-+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
-+ */
-+
-+#include <urcu/compiler.h>
-+#include <urcu/config.h>
-+#include <urcu/syscall-compat.h>
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+#define cmm_mb()	cmm_barrier()
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#include <urcu/arch/generic.h>
-+
-+#endif /* _URCU_ARCH_NIOS2_H */
-diff --git a/urcu/uatomic/nios2.h b/urcu/uatomic/nios2.h
-new file mode 100644
-index 0000000..5b3c303
---- /dev/null
-+++ b/urcu/uatomic/nios2.h
-@@ -0,0 +1,32 @@
-+#ifndef _URCU_UATOMIC_ARCH_NIOS2_H
-+#define _URCU_UATOMIC_ARCH_NIOS2_H
-+
-+/*
-+ * Atomic exchange operations for the NIOS2 architecture. Let GCC do it.
-+ *
-+ * Copyright (c) 2016 Marek Vasut <marex@denx.de>
-+ *
-+ * Permission is hereby granted, free of charge, to any person obtaining a copy
-+ * of this software and associated documentation files (the "Software"), to
-+ * deal in the Software without restriction, including without limitation the
-+ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
-+ * sell copies of the Software, and to permit persons to whom the Software is
-+ * furnished to do so, subject to the following conditions:
-+ *
-+ * The above copyright notice and this permission notice shall be included in
-+ * all copies or substantial portions of the Software.
-+ *
-+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-+ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
-+ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
-+ * IN THE SOFTWARE.
-+ */
-+
-+#include <urcu/compiler.h>
-+#include <urcu/system.h>
-+#include <urcu/uatomic/generic.h>
-+
-+#endif /* _URCU_UATOMIC_ARCH_NIOS2_H */
--- 
-2.10.2
-
diff --git a/meta/recipes-support/liburcu/liburcu_0.9.3.bb b/meta/recipes-support/liburcu/liburcu_0.10.0.bb
similarity index 51%
rename from meta/recipes-support/liburcu/liburcu_0.9.3.bb
rename to meta/recipes-support/liburcu/liburcu_0.10.0.bb
index 4486e0abeb2..8e6a5e693cf 100644
--- a/meta/recipes-support/liburcu/liburcu_0.9.3.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.10.0.bb
@@ -4,15 +4,14 @@ BUGTRACKER = "http://lttng.org/project/issues"
 
 LICENSE = "LGPLv2.1+ & MIT-style"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e548d28737289d75a8f1e01ba2fd7825 \
-                    file://urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9 \
-                    file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=58e50bbd8a2f073bb5500e6554af0d0b"
+                    file://src/urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9 \
+                    file://include/urcu/uatomic/x86.h;beginline=4;endline=21;md5=58e50bbd8a2f073bb5500e6554af0d0b"
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2 \
-           file://0001-Support-for-NIOS2-architecture.patch \
            "
 
-SRC_URI[md5sum] = "920970e35a1a2066c8353eabfeab8730"
-SRC_URI[sha256sum] = "1bce32e6a6c967fef6d37adaadf33df19878d69673f9ef9d3f2470e0c6ed4006"
+SRC_URI[md5sum] = "69dab85b6929c378338b9504adc6aea7"
+SRC_URI[sha256sum] = "7cb58a7ba5151198087f025dc8d19d8918e9c6d56772f039696c111d9aad3190"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 CFLAGS_append_libc-uclibc = " -D_GNU_SOURCE"
-- 
2.11.0


