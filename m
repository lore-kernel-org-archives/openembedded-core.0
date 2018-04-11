Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2AF2D7493C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 03:43:51 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id e123-v6so402039oih.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 20:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Rhq5yGjins2pc8fbO27/9X5ZNnd95X3sUk4f78zCOqs=;
	b=MR0DCDiQJ/i0cqpWbQKFhHoTxcEJ6ulunhyZs2aReV80irDnxe6Ttq3kCtUZm+u2I6
	p6O4NOUYCNjoSPQqiuJmscok6l34vTJgwK/zD/Ot7CkWHFOxU9fKpxXyNls61YrvJpxK
	Dllpz2BeQhxgwUiUB60dl6enVt1FmCVXA279Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Rhq5yGjins2pc8fbO27/9X5ZNnd95X3sUk4f78zCOqs=;
	b=aIrk0mnSofxorzgCjehxoCuJKQBj6tbiyHLz/Na5SRNwYHg0L0WM8Tc+UHaRaeOlJG
	v/p2kQITcMVvXvYL1x9WKM9nN6hcB3W4tYTupukmdrgUdMO84TrbFb5/aOTyWK1hvG8k
	ej249hFLIL7cXlqCm/HAZ08DvGL602e2RIP0QLjE0GQW18ZsiteGrB9FpZavXbNvR7II
	rNWDzIon/t+oGk5xE/i1EuAeiHJ04HJmIzDYM8hNfVwRRkBWGeqPH3ZyjtCBQBzRm22/
	RZLfOXwttHJ3470zt7AJSMCxmFW5TkJQDfcHwYGW5KQXYc8zA9KmDrDfrRP38l8G5vme
	LgcA==
X-Gm-Message-State: ALQs6tBgZnyyGXb01uJzxpaNIY1un7W2F2EmeXVwQShUJIQ7t+8f7Jun
	R5A2BoemgCEWdFsapy1mw6UsAAWSW92dqg==
X-Google-Smtp-Source: AIpwx48xBA3rc11TcIHcYRNlcwvTE81+Z/5JO/LkWeC02ZAjXyBMsHV3gRJS4ZTstu1Lbdc2e0Jv5Q==
X-Received: by 2002:aca:3303:: with SMTP id z3-v6mr2039620oiz.67.1523418231837;
	Tue, 10 Apr 2018 20:43:51 -0700 (PDT)
Received: from aura.cortijodelrio.net
	(CableLink-187-161-190-249.PCs.InterCable.net. [187.161.190.249])
	by smtp.googlemail.com with ESMTPSA id
	j23-v6sm169001oiy.22.2018.04.10.20.43.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 10 Apr 2018 20:43:50 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2018 22:43:29 -0500
Message-Id: <1523418209-1534-2-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523418209-1534-1-git-send-email-daniel.diaz@linaro.org>
References: <1523418209-1534-1-git-send-email-daniel.diaz@linaro.org>
MIME-Version: 1.0
Subject: [pyro][PATCH 2/2] gdb: fix header ordering for TRAP_HWBKPT
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
X-List-Received-Date: Wed, 11 Apr 2018 03:43:53 -0000
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
 meta/recipes-devtools/gdb/gdb-7.12.1.inc           |  1 +
 ...4-defining-TRAP_HWBKPT-before-including-g.patch | 51 ++++++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch

diff --git a/meta/recipes-devtools/gdb/gdb-7.12.1.inc b/meta/recipes-devtools/gdb/gdb-7.12.1.inc
index 634756c..1d81185 100644
--- a/meta/recipes-devtools/gdb/gdb-7.12.1.inc
+++ b/meta/recipes-devtools/gdb/gdb-7.12.1.inc
@@ -16,6 +16,7 @@ SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
            file://0009-Change-order-of-CFLAGS.patch \
            file://0010-resolve-restrict-keyword-conflict.patch \
            file://package_devel_gdb_patches_120-sigprocmask-invalid-call.patch \
+           file://gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch \
 "
 SRC_URI[md5sum] = "193453347ddced7acb6b1cd2ee8f2e4b"
 SRC_URI[sha256sum] = "4607680b973d3ec92c30ad029f1b7dbde3876869e6b3a117d8a7e90081113186"
diff --git a/meta/recipes-devtools/gdb/gdb/gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch b/meta/recipes-devtools/gdb/gdb/gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch
new file mode 100644
index 0000000..cbcc65a
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch
@@ -0,0 +1,51 @@
+From 49bd068c3acf376a3018c0ebd849bf7f72a1874d Mon Sep 17 00:00:00 2001
+From: James Clarke <jrtc27@jrtc27.com>
+Date: Fri, 19 Jan 2018 17:22:49 +0000
+Subject: [PATCH] gdb: Fix ia64 defining TRAP_HWBKPT before including
+ gdb_wait.h
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
+---
+ gdb/nat/linux-ptrace.c | 2 --
+ gdb/nat/linux-ptrace.h | 1 +
+ 2 files changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/gdb/nat/linux-ptrace.c b/gdb/nat/linux-ptrace.c
+index 3447e07..dd3310e 100644
+--- a/gdb/nat/linux-ptrace.c
++++ b/gdb/nat/linux-ptrace.c
+@@ -21,8 +21,6 @@
+ #include "linux-procfs.h"
+ #include "linux-waitpid.h"
+ #include "buffer.h"
+-#include "gdb_wait.h"
+-#include "gdb_ptrace.h"
+ #include <sys/procfs.h>
+ 
+ /* Stores the ptrace options supported by the running kernel.
+diff --git a/gdb/nat/linux-ptrace.h b/gdb/nat/linux-ptrace.h
+index 5954945..6faa89b 100644
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


