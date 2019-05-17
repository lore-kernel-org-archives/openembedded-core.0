Return-Path: <jonathan.rajotte-julien@efficios.com>
Received: from mail.efficios.com (mail.efficios.com [167.114.142.138])
	by mail.openembedded.org (Postfix) with ESMTP id 21FC06D409
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 15:53:09 +0000 (UTC)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id DE64C1E52FE;
	Fri, 17 May 2019 11:53:10 -0400 (EDT)
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10032)
	with ESMTP id VxefrFkEeF3q; Fri, 17 May 2019 11:53:09 -0400 (EDT)
Received: from localhost (ip6-localhost [IPv6:::1])
	by mail.efficios.com (Postfix) with ESMTP id C17531E52FA;
	Fri, 17 May 2019 11:53:09 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com C17531E52FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
	s=default; t=1558108389;
	bh=U77hAqrg1cPrVh4MdAZ4v3hy7UdpsC5u5xHsXaIIYts=;
	h=From:To:Date:Message-Id;
	b=NybvIZkCY/VMvojXxoFiRWbR/pskkth7I8hVzodhi6lIdN7y66Rf0Z0gYiSqg+eV7
	c7NzA4xDGzqBN7IvtAirJVve7INjs2vE6Z1073UKlc/9dtiSXmVAuhibVdly//0gIW
	WddvzlO9TnYd11Q54WR9ZIeEscs4xDoNd2wVM+NftgPmh0+XuXsTe4cGfSjZ1vAtKZ
	umiONkneP8Fa/6GKJy6xAEb7yt+BRv8clVcFL8+B9x6bsX8/zAti5+7PD1NTWW+c7T
	H53/LqCvRngwpip5x2QC9/xFnZJ5OmDPxk3EFMnGz14mPClcgv9Ds998vZ6ofn20IL
	7AmoPl9YfG8Gw==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([IPv6:::1])
	by localhost (mail02.efficios.com [IPv6:::1]) (amavisd-new, port 10026)
	with ESMTP id AYDeR4pPlqk0; Fri, 17 May 2019 11:53:09 -0400 (EDT)
Received: from joraj-yocto-dev.internal.efficios.com
	(192-222-181-218.qc.cable.ebox.net [192.222.181.218])
	by mail.efficios.com (Postfix) with ESMTPSA id 9AC181E52F5;
	Fri, 17 May 2019 11:53:09 -0400 (EDT)
From: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 15:52:52 +0000
Message-Id: <20190517155252.867-1-jonathan.rajotte-julien@efficios.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] liburcu: update to 0.11.0
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
X-List-Received-Date: Fri, 17 May 2019 15:53:10 -0000

Drop backported patch.
Update paths to files that establish the licensing.

Signed-off-by: Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>
---
 ...-support-for-the-RISC-V-architecture.patch | 157 ------------------
 .../{liburcu_0.10.2.bb => liburcu_0.11.0.bb}  |  10 +-
 2 files changed, 4 insertions(+), 163 deletions(-)
 delete mode 100644 meta/recipes-support/liburcu/files/Add-support-for-the-RISC-V-architecture.patch
 rename meta/recipes-support/liburcu/{liburcu_0.10.2.bb => liburcu_0.11.0.bb} (65%)

diff --git a/meta/recipes-support/liburcu/files/Add-support-for-the-RISC-V-architecture.patch b/meta/recipes-support/liburcu/files/Add-support-for-the-RISC-V-architecture.patch
deleted file mode 100644
index b026782bd5..0000000000
--- a/meta/recipes-support/liburcu/files/Add-support-for-the-RISC-V-architecture.patch
+++ /dev/null
@@ -1,157 +0,0 @@
-From fdfad81006c2c964781b616f0a75578507be809c Mon Sep 17 00:00:00 2001
-From: Michael Jeanson <mjeanson@efficios.com>
-Date: Wed, 21 Mar 2018 17:38:41 -0400
-Subject: [PATCH] Add support for the RISC-V architecture
-
-Tested in QEMU 2.12.0-rc0, requires --disable-compiler-tls to go
-through the benchmarks reliably.
-
-Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
-Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
-Upstream-Status: Backport
----
- configure.ac                 |  1 +
- include/Makefile.am          |  2 ++
- include/urcu/arch/riscv.h    | 49 ++++++++++++++++++++++++++++++++++++++++++++
- include/urcu/uatomic/riscv.h | 44 +++++++++++++++++++++++++++++++++++++++
- 4 files changed, 96 insertions(+)
- create mode 100644 include/urcu/arch/riscv.h
- create mode 100644 include/urcu/uatomic/riscv.h
-
-diff --git a/configure.ac b/configure.ac
-index d0b4a9ac..9145081a 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -151,6 +151,7 @@ AS_CASE([$host_cpu],
- 	[tile*], [ARCHTYPE="tile"],
- 	[hppa*], [ARCHTYPE="hppa"],
- 	[m68k], [ARCHTYPE="m68k"],
-+	[riscv*], [ARCHTYPE="riscv"],
- 	[ARCHTYPE="unknown"]
- )
- 
-diff --git a/include/Makefile.am b/include/Makefile.am
-index dcdf304b..36667b43 100644
---- a/include/Makefile.am
-+++ b/include/Makefile.am
-@@ -27,6 +27,7 @@ EXTRA_DIST = urcu/arch/aarch64.h \
- 	urcu/arch/mips.h \
- 	urcu/arch/nios2.h \
- 	urcu/arch/ppc.h \
-+	urcu/arch/riscv.h \
- 	urcu/arch/s390.h \
- 	urcu/arch/sparc64.h \
- 	urcu/arch/tile.h \
-@@ -43,6 +44,7 @@ EXTRA_DIST = urcu/arch/aarch64.h \
- 	urcu/uatomic/mips.h \
- 	urcu/uatomic/nios2.h \
- 	urcu/uatomic/ppc.h \
-+	urcu/uatomic/riscv.h \
- 	urcu/uatomic/s390.h \
- 	urcu/uatomic/sparc64.h \
- 	urcu/uatomic/tile.h \
-diff --git a/include/urcu/arch/riscv.h b/include/urcu/arch/riscv.h
-new file mode 100644
-index 00000000..1fd7d62b
---- /dev/null
-+++ b/include/urcu/arch/riscv.h
-@@ -0,0 +1,49 @@
-+#ifndef _URCU_ARCH_RISCV_H
-+#define _URCU_ARCH_RISCV_H
-+
-+/*
-+ * arch/riscv.h: definitions for the RISC-V architecture
-+ *
-+ * Copyright (c) 2018 Michael Jeanson <mjeanson@efficios.com>
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
-+#include <stdlib.h>
-+#include <sys/time.h>
-+
-+/*
-+ * On Linux, define the membarrier system call number if not yet available in
-+ * the system headers.
-+ */
-+#if (defined(__linux__) && !defined(__NR_membarrier))
-+#define __NR_membarrier		283
-+#endif
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#include <urcu/arch/generic.h>
-+
-+#endif /* _URCU_ARCH_RISCV_H */
-diff --git a/include/urcu/uatomic/riscv.h b/include/urcu/uatomic/riscv.h
-new file mode 100644
-index 00000000..a6700e17
---- /dev/null
-+++ b/include/urcu/uatomic/riscv.h
-@@ -0,0 +1,44 @@
-+/*
-+ * Atomic exchange operations for the RISC-V architecture. Let GCC do it.
-+ *
-+ * Copyright (c) 2018 Michael Jeanson <mjeanson@efficios.com>
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
-+#ifndef _URCU_ARCH_UATOMIC_RISCV_H
-+#define _URCU_ARCH_UATOMIC_RISCV_H
-+
-+#include <urcu/compiler.h>
-+#include <urcu/system.h>
-+
-+#ifdef __cplusplus
-+extern "C" {
-+#endif
-+
-+#define UATOMIC_HAS_ATOMIC_BYTE
-+#define UATOMIC_HAS_ATOMIC_SHORT
-+
-+#ifdef __cplusplus
-+}
-+#endif
-+
-+#include <urcu/uatomic/generic.h>
-+
-+#endif /* _URCU_ARCH_UATOMIC_RISCV_H */
diff --git a/meta/recipes-support/liburcu/liburcu_0.10.2.bb b/meta/recipes-support/liburcu/liburcu_0.11.0.bb
similarity index 65%
rename from meta/recipes-support/liburcu/liburcu_0.10.2.bb
rename to meta/recipes-support/liburcu/liburcu_0.11.0.bb
index b4b6e2323d..df41ffc73e 100644
--- a/meta/recipes-support/liburcu/liburcu_0.10.2.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.11.0.bb
@@ -4,15 +4,13 @@ BUGTRACKER = "http://lttng.org/project/issues"
 
 LICENSE = "LGPLv2.1+ & MIT-style"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e548d28737289d75a8f1e01ba2fd7825 \
-                    file://src/urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9 \
+                    file://include/urcu/urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9 \
                     file://include/urcu/uatomic/x86.h;beginline=4;endline=21;md5=58e50bbd8a2f073bb5500e6554af0d0b"
 
-SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2 \
-           file://Add-support-for-the-RISC-V-architecture.patch \
-           "
+SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "7c424c5183ec009d87e0f70c23e92f1b"
-SRC_URI[sha256sum] = "b3f6888daf6fe02c1f8097f4a0898e41b5fe9975e121dc792b9ddef4b17261cc"
+SRC_URI[md5sum] = "102184afa99e64e3ecefb320092ac1e4"
+SRC_URI[sha256sum] = "1af5694c4f6266f4eba5eb4b832daee600d1e7055fce6da5d514d735d72eb3e7"
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 inherit autotools multilib_header
-- 
2.17.1


