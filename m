Return-Path: <daniel.diaz@linaro.org>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id 9ABE378924
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2018 16:17:46 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id 108-v6so186688otv.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2018 09:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=0ZymNTB1z7x3q7ErOP6R7vJCpWat82bmUF6l3EJ9G5o=;
	b=KJ36KKRM7dy/vvEhMHIIaK5iEo/ocElzTkAp34U0HPpVQvlv8I5aoVy5UYm465Ga6X
	4Bv3txevCcp2JCj6LZv6/7NmOWDrcdboBEo8hCeBP4/WE6TAK/u9wreFMUjOv7rJyKzs
	Gt6En96n+6illoKTxpCg7h3As9IGRzPawJmA0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0ZymNTB1z7x3q7ErOP6R7vJCpWat82bmUF6l3EJ9G5o=;
	b=YGORs54n7pXM89NIrtl/2apD3wWUK7IwGWXeQgmC+x+fkZB7g0d7rQ4+7p6VUDv1sP
	vXuX83BqYv8YxleBmOxDuNy3P9+NPh2dRDTVIP6Clu4ku5wvR1xc55XJCR9mC/r6I/eM
	oU9jhp+PJu4iWxEGvDjZdkyXsHxHGU+cGEllcA0u6zFsHWzDzxyN6l7GEJcU4x2bwl/D
	3X0TfpsNltRwcTqpE/G+p+TUnKm3NLuHUlkjD5GD5lAbt7OMiNoze8tRtnblNQ34OpxF
	t6wC7c1Ck6azH8gHqu7Tq1HAlh5eqGIjBqKDsx2uxBn0BjsvlKdtbnECzqI4nn/eEJp5
	Zs1Q==
X-Gm-Message-State: AElRT7GqgGruNh+8HMoAsodaVC0Y0DJRUnwkJ3OoFBM1xV7jn5QDbTdA
	bnmptVde42yYoSsuXv0mrQR8qMjz9MI=
X-Google-Smtp-Source: AG47ELu3uxuJIrSWu7pIPkHjEviCDP4VuYTEtVBBKOZPQE8vWfrLVFIXDBvWbBZuwy5vPdyHQzpaMQ==
X-Received: by 10.157.83.9 with SMTP id g9mr830418oth.172.1520957867420;
	Tue, 13 Mar 2018 09:17:47 -0700 (PDT)
Received: from localhost.localdomain
	(CableLink-187-161-113-185.PCs.InterCable.net. [187.161.113.185])
	by smtp.googlemail.com with ESMTPSA id
	c33sm283789ote.79.2018.03.13.09.17.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 13 Mar 2018 09:17:46 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2018 10:17:38 -0600
Message-Id: <1520957858-7006-2-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520957858-7006-1-git-send-email-daniel.diaz@linaro.org>
References: <1520957858-7006-1-git-send-email-daniel.diaz@linaro.org>
MIME-Version: 1.0
Subject: [morty][PATCH 2/2] gdb: fix header ordering for TRAP_HWBKPT
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
X-List-Received-Date: Tue, 13 Mar 2018 16:17:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This error can appear in gdb/nat/linux-ptrace.c because of
the order in which some headers are processed:
| In file included from ../../gdb-7.11.1/gdb/nat/linux-ptrace.c:20:0:
| ../../gdb-7.11.1/gdb/nat/linux-ptrace.h:175:22: error: expected identifier before numeric constant
|  # define TRAP_HWBKPT 4
|                       ^
| Makefile:2357: recipe for target 'linux-ptrace.o' failed
| make[2]: *** [linux-ptrace.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| make[2]: Leaving directory '/oe/build/tmp-rpb-glibc/work/aarch64-linaro-linux/gdb/7.11.1-r0/build-aarch64-linaro-linux/gdb'
| Makefile:8822: recipe for target 'all-gdb' failed
| make[1]: *** [all-gdb] Error 2
| make[1]: Leaving directory '/oe/build/tmp-rpb-glibc/work/aarch64-linaro-linux/gdb/7.11.1-r0/build-aarch64-linaro-linux'
| Makefile:846: recipe for target 'all' failed
| make: *** [all] Error 2

A patch from GDB's current master solves the issue.

(From OE-Core rev: 4aaf747099714ec11158571527396ed9e818729e)

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/gdb/gdb-7.11.1.inc           |  1 +
 ...4-defining-TRAP_HWBKPT-before-including-g.patch | 56 ++++++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/0012-gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch

diff --git a/meta/recipes-devtools/gdb/gdb-7.11.1.inc b/meta/recipes-devtools/gdb/gdb-7.11.1.inc
index d9dfe6f..c8ead51 100644
--- a/meta/recipes-devtools/gdb/gdb-7.11.1.inc
+++ b/meta/recipes-devtools/gdb/gdb-7.11.1.inc
@@ -16,6 +16,7 @@ SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
            file://0009-Change-order-of-CFLAGS.patch \
            file://0010-resolve-restrict-keyword-conflict.patch \
            file://0011-avx_mpx.patch \
+           file://0012-gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch \
 "
 
 SRC_URI[md5sum] = "5aa71522e488e358243917967db87476"
diff --git a/meta/recipes-devtools/gdb/gdb/0012-gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch b/meta/recipes-devtools/gdb/gdb/0012-gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch
new file mode 100644
index 0000000..1fcd355
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/0012-gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch
@@ -0,0 +1,56 @@
+From e8e11841f55521dc7dbfdd3530a5a0ff7ccbfc7e Mon Sep 17 00:00:00 2001
+From: James Clarke <jrtc27@jrtc27.com>
+Date: Fri, 19 Jan 2018 17:22:49 +0000
+Subject: [PATCH] gdb: Fix ia64 defining TRAP_HWBKPT before including
+ gdb_wait.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+On ia64, gdb_wait.h eventually includes siginfo-consts-arch.h, which
+contains an enum with TRAP_HWBKPT, along with a #define. Thus we cannot
+define TRAP_HWBKPT to 4 beforehand, and so gdb_wait.h must be included
+earlier; include it from linux-ptrace.h so it can never come afterwards.
+
+gdb/ChangeLog:
+
+	* nat/linux-ptrace.c: Remove unnecessary reinclusion of
+	gdb_ptrace.h, and move including gdb_wait.h ...
+	* nat/linux-ptrace.h: ... to here.
+
+Upstream-Status: Accepted [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=5a6c3296a7a90694ad4042f6256f3da6d4fa4ee8]
+
+Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
+---
+ gdb/nat/linux-ptrace.c | 2 --
+ gdb/nat/linux-ptrace.h | 1 +
+ 2 files changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/gdb/nat/linux-ptrace.c b/gdb/nat/linux-ptrace.c
+index 0eaf9a3..446d5ba 100644
+--- a/gdb/nat/linux-ptrace.c
++++ b/gdb/nat/linux-ptrace.c
+@@ -21,8 +21,6 @@
+ #include "linux-procfs.h"
+ #include "linux-waitpid.h"
+ #include "buffer.h"
+-#include "gdb_wait.h"
+-#include "gdb_ptrace.h"
+ 
+ /* Stores the ptrace options supported by the running kernel.
+    A value of -1 means we did not check for features yet.  A value
+diff --git a/gdb/nat/linux-ptrace.h b/gdb/nat/linux-ptrace.h
+index 0a23bcb..d84114b 100644
+--- a/gdb/nat/linux-ptrace.h
++++ b/gdb/nat/linux-ptrace.h
+@@ -21,6 +21,7 @@
+ struct buffer;
+ 
+ #include "nat/gdb_ptrace.h"
++#include "gdb_wait.h"
+ 
+ #ifdef __UCLIBC__
+ #if !(defined(__UCLIBC_HAS_MMU__) || defined(__ARCH_HAS_MMU__))
+-- 
+2.7.4
+
-- 
2.7.4


