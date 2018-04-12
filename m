Return-Path: <daniel.diaz@linaro.org>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0BB8472EC7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 22:55:17 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id f63-v6so6745704oic.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 15:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=rOHpSI55o93/i/xue3DG9OQ9OZ/YNuCiG4RNmM3mBPE=;
	b=YQlZbxRDvsEPlCqBj5h+aqEldETC8bq9bfHhOs9HcVxEo99QndWhMfJpUc7zSD+1Ua
	xnxM5uh+P0U7/whcEYlGLwGtJOS0Y1Y9hatI4RAVwLcoDmYFwwyofaRn90UWS1ZeUyx0
	Td6V8ElAuuhavQYn4q7bNAM//o/vzx3jht3Qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=rOHpSI55o93/i/xue3DG9OQ9OZ/YNuCiG4RNmM3mBPE=;
	b=P3Fj33xcApnK9Zb9sZrdP3scLJtsocYjkYr0BU5plkbWyGRYSRv/tLLux3m5tpcABb
	69hiKeQuNSNgCOQ8OCW8LBlKzqPOJ6lYjPAD+L9mCz20ejsVPnD2wFnJZk24r12XU8Zj
	/le9/0uHT9RqdUcv9V0XzDxPehbrq9Uy1bd3ol8yZfKorKD/rm6CmQB3M4i0bFeUIezR
	o9pFb45jss7QTLDdm+9/PMyHVB7YnXtnRCRcMrY5H/tnbmU8zDRUlujJ8cBBSswxkIwc
	KfZm4egCLzGJDQU9k56wTrt2Cr+3RXJWvnVZhHZ+hnyuizAFK2/jRzUe2hjwrxO7U/xG
	t+Hg==
X-Gm-Message-State: ALQs6tCFdec5oRzgud8MHJjlfyoBcupDBpS2vyvj7ECWIKqGvKMn0jR9
	w+i88Kin/k9fyGI2lOcIXk4JayX73e1x4g==
X-Google-Smtp-Source: AIpwx49uHzJ3TZm66UKQUBICTheUvOxLx22Woo6NyMPGHFxOEfd2DKHEjSvcBNa0GUQTpIZexdusqw==
X-Received: by 2002:aca:ec4e:: with SMTP id
	k75-v6mr7284940oih.81.1523573718301; 
	Thu, 12 Apr 2018 15:55:18 -0700 (PDT)
Received: from localhost.localdomain
	(CableLink-187-161-190-249.PCs.InterCable.net. [187.161.190.249])
	by smtp.googlemail.com with ESMTPSA id
	k49-v6sm3259864otb.58.2018.04.12.15.55.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 12 Apr 2018 15:55:17 -0700 (PDT)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Apr 2018 17:55:08 -0500
Message-Id: <1523573708-6519-2-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523573708-6519-1-git-send-email-daniel.diaz@linaro.org>
References: <1523573708-6519-1-git-send-email-daniel.diaz@linaro.org>
MIME-Version: 1.0
Subject: [pyro][PATCH 2/2 v2] gdb: fix header ordering for TRAP_HWBKPT
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
X-List-Received-Date: Thu, 12 Apr 2018 22:55:18 -0000
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
v2: Add signed-off-by to patch.

 meta/recipes-devtools/gdb/gdb-7.12.1.inc           |  1 +
 ...4-defining-TRAP_HWBKPT-before-including-g.patch | 53 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)
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
index 0000000..9bf99f6
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch
@@ -0,0 +1,53 @@
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
+
+Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
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


