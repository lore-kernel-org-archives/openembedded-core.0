Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 3D7B0731CC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 00:04:21 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3q0Lt80sPgz3hjHK;
	Wed, 10 Feb 2016 01:04:16 +0100 (CET)
X-Auth-Info: wdFfy6djryBc5KN6s6dI5mVE4qgVj8kDsw4VESGFyc0=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3q0Lt762c5zvdWt;
	Wed, 10 Feb 2016 01:04:15 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 01:04:05 +0100
Message-Id: <1455062646-12311-6-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1455062646-12311-1-git-send-email-marex@denx.de>
References: <1455062646-12311-1-git-send-email-marex@denx.de>
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH V2 6/7] liburcu: Add nios2 support
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
X-List-Received-Date: Wed, 10 Feb 2016 00:04:21 -0000

Add support for the nios2 into the liburcu.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
---
V2: Patch is now Backport
    The patch is updated according to mainline feedback

NOTE: LICENSE file checksum changed, because the patch adds an entry into the
      LICENSE file.
---
 .../0001-Support-for-NIOS2-architecture.patch      | 144 +++++++++++++++++++++
 meta/recipes-support/liburcu/liburcu_0.9.1.bb      |   8 +-
 2 files changed, 149 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-support/liburcu/liburcu/0001-Support-for-NIOS2-architecture.patch

diff --git a/meta/recipes-support/liburcu/liburcu/0001-Support-for-NIOS2-architecture.patch b/meta/recipes-support/liburcu/liburcu/0001-Support-for-NIOS2-architecture.patch
new file mode 100644
index 0000000..690872b
--- /dev/null
+++ b/meta/recipes-support/liburcu/liburcu/0001-Support-for-NIOS2-architecture.patch
@@ -0,0 +1,144 @@
+From add566b913e1b5cd4974a2167157dc08d8245ab0 Mon Sep 17 00:00:00 2001
+From: Marek Vasut <marex@denx.de>
+Date: Tue, 9 Feb 2016 01:52:26 +0100
+Subject: [PATCH] Support for NIOS2 architecture
+
+Add support for the Altera NIOS2 CPU archirecture. The atomic operations
+are handled by the GCC. The memory barriers on this systems are entirely
+trivial too, since the CPU does not support SMP at all.
+
+Signed-off-by: Marek Vasut <marex@denx.de>
+Upstream-Status: Backport [ http://git.lttng.org/?p=userspace-rcu.git;a=commit;h=859050b3088aa3f0cb59d7f51ce24b9a0f18faa5 ]
+---
+ LICENSE              |  1 +
+ README.md            |  1 +
+ configure.ac         |  1 +
+ urcu/arch/nios2.h    | 40 ++++++++++++++++++++++++++++++++++++++++
+ urcu/uatomic/nios2.h | 32 ++++++++++++++++++++++++++++++++
+ 5 files changed, 75 insertions(+)
+ create mode 100644 urcu/arch/nios2.h
+ create mode 100644 urcu/uatomic/nios2.h
+
+diff --git a/LICENSE b/LICENSE
+index 3147094..a06fdcc 100644
+--- a/LICENSE
++++ b/LICENSE
+@@ -45,6 +45,7 @@ compiler.h
+ arch/s390.h
+ uatomic/alpha.h
+ uatomic/mips.h
++uatomic/nios2.h
+ uatomic/s390.h
+ system.h
+ 
+diff --git a/README.md b/README.md
+index f6b290f..6fe9c1e 100644
+--- a/README.md
++++ b/README.md
+@@ -43,6 +43,7 @@ Currently, the following architectures are supported:
+   - S390, S390x
+   - ARM 32/64
+   - MIPS
++  - NIOS2
+   - Alpha
+   - ia64
+   - Sparcv9 32/64
+diff --git a/configure.ac b/configure.ac
+index 39a7777..71a7d71 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -124,6 +124,7 @@ AS_CASE([$host_cpu],
+ 	[arm*], [ARCHTYPE="arm"],
+ 	[aarch64], [ARCHTYPE="aarch64"],
+ 	[mips*], [ARCHTYPE="mips"],
++	[nios2*], [ARCHTYPE="nios2"],
+ 	[tile*], [ARCHTYPE="tile"],
+ 	[hppa*], [ARCHTYPE="hppa"],
+ 	[ARCHTYPE="unknown"]
+diff --git a/urcu/arch/nios2.h b/urcu/arch/nios2.h
+new file mode 100644
+index 0000000..030d1bc
+--- /dev/null
++++ b/urcu/arch/nios2.h
+@@ -0,0 +1,40 @@
++#ifndef _URCU_ARCH_NIOS2_H
++#define _URCU_ARCH_NIOS2_H
++
++/*
++ * arch_nios2.h: trivial definitions for the NIOS2 architecture.
++ *
++ * Copyright (c) 2016 Marek Vasut <marex@denx.de>
++ *
++ * This library is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU Lesser General Public
++ * License as published by the Free Software Foundation; either
++ * version 2.1 of the License, or (at your option) any later version.
++ *
++ * This library is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++ * Lesser General Public License for more details.
++ *
++ * You should have received a copy of the GNU Lesser General Public
++ * License along with this library; if not, write to the Free Software
++ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
++ */
++
++#include <urcu/compiler.h>
++#include <urcu/config.h>
++#include <urcu/syscall-compat.h>
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++#define cmm_mb()	cmm_barrier()
++
++#ifdef __cplusplus
++}
++#endif
++
++#include <urcu/arch/generic.h>
++
++#endif /* _URCU_ARCH_NIOS2_H */
+diff --git a/urcu/uatomic/nios2.h b/urcu/uatomic/nios2.h
+new file mode 100644
+index 0000000..5b3c303
+--- /dev/null
++++ b/urcu/uatomic/nios2.h
+@@ -0,0 +1,32 @@
++#ifndef _URCU_UATOMIC_ARCH_NIOS2_H
++#define _URCU_UATOMIC_ARCH_NIOS2_H
++
++/*
++ * Atomic exchange operations for the NIOS2 architecture. Let GCC do it.
++ *
++ * Copyright (c) 2016 Marek Vasut <marex@denx.de>
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining a copy
++ * of this software and associated documentation files (the "Software"), to
++ * deal in the Software without restriction, including without limitation the
++ * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
++ * sell copies of the Software, and to permit persons to whom the Software is
++ * furnished to do so, subject to the following conditions:
++ *
++ * The above copyright notice and this permission notice shall be included in
++ * all copies or substantial portions of the Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
++ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
++ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
++ * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
++ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
++ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
++ * IN THE SOFTWARE.
++ */
++
++#include <urcu/compiler.h>
++#include <urcu/system.h>
++#include <urcu/uatomic/generic.h>
++
++#endif /* _URCU_UATOMIC_ARCH_NIOS2_H */
+-- 
+2.7.0
+
diff --git a/meta/recipes-support/liburcu/liburcu_0.9.1.bb b/meta/recipes-support/liburcu/liburcu_0.9.1.bb
index 39348d7..dccc05c 100644
--- a/meta/recipes-support/liburcu/liburcu_0.9.1.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.9.1.bb
@@ -3,12 +3,14 @@ HOMEPAGE = "http://lttng.org/urcu"
 BUGTRACKER = "http://lttng.org/project/issues"
 
 LICENSE = "LGPLv2.1+ & MIT-style"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0f060c30a27922ce9c0d557a639b4fa3 \
+LIC_FILES_CHKSUM = "file://LICENSE;md5=e548d28737289d75a8f1e01ba2fd7825 \
                     file://urcu.h;beginline=4;endline=32;md5=4de0d68d3a997643715036d2209ae1d9 \
                     file://urcu/uatomic/x86.h;beginline=4;endline=21;md5=58e50bbd8a2f073bb5500e6554af0d0b"
 
-SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2 \
-          "
+SRC_URI = " \
+	http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2 \
+	file://0001-Support-for-NIOS2-architecture.patch \
+	"
 
 SRC_URI[md5sum] = "124eaeea06863271c0bdf2a0cc1d8e4b"
 SRC_URI[sha256sum] = "f8d278e9d95bec97c9ba954fc4c3fb584936bc0010713a8fe358b916bafd8715"
-- 
2.1.4


