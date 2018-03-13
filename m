Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id B102D78940
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2018 16:08:09 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id a207so102464oii.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2018 09:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=JDvO8BaNuNcwV3mQktCj2i2HTrHYrqrDk5FlH2ao4fw=;
	b=Q7lrQ0S2UvwrIEjg5vUvK95Tt0+pwSWF4ub5f3J2nCaP/b1u/D1S03ws3Jkyh6e14x
	rkZeYxjPqlj7l1r0aAeD+DrT4ryg/txH4zZ3Zsq+UZn1RppgPDdrA6UxGEWSYoH1vQ2K
	R+FI8sI+NMDMut0clWIjr6NFMuRH8NeCGKMsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=JDvO8BaNuNcwV3mQktCj2i2HTrHYrqrDk5FlH2ao4fw=;
	b=P+C+5oB6cKg8809PYHnYDjtdqbPQegCcH4bLU+uydFn+JqVW7nQQ6KIx3TaTNvXFum
	CvznxtitzOnZomOXNnr7BVv4Bz1VXYtLrh+9gt4MkRHPQwGTi7XKQJlcYNRcAzXz/ZhK
	rw9JnRupRvFiBnx7kknGwT0hAPnRuvHZ2MQVuNMJd/SYlwjk7MW+IQzTL19+dkYj6104
	fca1x0xqydAHc00awBOKsIScshUMyTAcpIRXmTPITcxXz1Tv4aHW1X64uFOQzMSybC1i
	ExoQKCSi8p2nFkPiwz2G2qqpXK+o4qPHk0OCJBIzF5ZREfSjIO3nMnVAWDzE2ZE8gzE5
	zs/g==
X-Gm-Message-State: AElRT7EKtEJfJwUlbijD41mESbw8Il423ReKdF5vHV+F/G4u8RJZL4A6
	ECZv5wk3CO3++jiFXA5cNJHfyWMZ3k0=
X-Google-Smtp-Source: AG47ELuuFydvVj3C6b3deniXOTUQr5oreqHjSbRF5EaH1l1WReORAJIXkhSPAOvKOsWqxufFxdl9vA==
X-Received: by 10.202.179.66 with SMTP id c63mr794520oif.115.1520957290370;
	Tue, 13 Mar 2018 09:08:10 -0700 (PDT)
Received: from localhost.localdomain
	(CableLink-187-161-113-185.PCs.InterCable.net. [187.161.113.185])
	by smtp.googlemail.com with ESMTPSA id
	x4sm307077otx.13.2018.03.13.09.08.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 13 Mar 2018 09:08:09 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Mar 2018 10:07:50 -0600
Message-Id: <1520957270-5866-2-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520957214-5689-1-git-send-email-daniel.diaz@linaro.org>
References: <1520957214-5689-1-git-send-email-daniel.diaz@linaro.org>
MIME-Version: 1.0
Subject: [rocko] [PATCH 2/2] gdb: fix header ordering for TRAP_HWBKPT
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
X-List-Received-Date: Tue, 13 Mar 2018 16:08:09 -0000
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
 meta/recipes-devtools/gdb/gdb-8.0.inc              |  1 +
 ...4-defining-TRAP_HWBKPT-before-including-g.patch | 56 ++++++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch

diff --git a/meta/recipes-devtools/gdb/gdb-8.0.inc b/meta/recipes-devtools/gdb/gdb-8.0.inc
index fba32ce..227abd9 100644
--- a/meta/recipes-devtools/gdb/gdb-8.0.inc
+++ b/meta/recipes-devtools/gdb/gdb-8.0.inc
@@ -16,6 +16,7 @@ SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
            file://0009-Change-order-of-CFLAGS.patch \
            file://0010-resolve-restrict-keyword-conflict.patch \
            file://package_devel_gdb_patches_120-sigprocmask-invalid-call.patch \
+           file://gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch \
 "
 SRC_URI[md5sum] = "c3d35cd949084be53b92cc1e03485f88"
 SRC_URI[sha256sum] = "f6a24ffe4917e67014ef9273eb8b547cb96a13e5ca74895b06d683b391f3f4ee"
diff --git a/meta/recipes-devtools/gdb/gdb/gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch b/meta/recipes-devtools/gdb/gdb/gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch
new file mode 100644
index 0000000..ef97de7
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch
@@ -0,0 +1,56 @@
+From b033a9663053eed87cb572397176747b88e9a699 Mon Sep 17 00:00:00 2001
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
+index 3265b16..559c2de 100644
+--- a/gdb/nat/linux-ptrace.c
++++ b/gdb/nat/linux-ptrace.c
+@@ -21,8 +21,6 @@
+ #include "linux-procfs.h"
+ #include "linux-waitpid.h"
+ #include "buffer.h"
+-#include "gdb_wait.h"
+-#include "gdb_ptrace.h"
+ #ifdef HAVE_SYS_PROCFS_H
+ #include <sys/procfs.h>
+ #endif
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


