Return-Path: <daniel.diaz@linaro.org>
Received: from mail-ot0-f196.google.com (mail-ot0-f196.google.com
	[74.125.82.196])
	by mail.openembedded.org (Postfix) with ESMTP id 436D778297
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 15:46:56 +0000 (UTC)
Received: by mail-ot0-f196.google.com with SMTP id n74so18748732ota.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Mar 2018 07:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Y2xCOuramHL69KA6x4r1YV1JfGoM4vWsyqQEmnoHx9M=;
	b=kL5veBa87RrIxku/qD+uDepjEnEbLTsdwaWwOm5ZtbMAR3FiWuwRgpbMd+TpKnBkWV
	Kkmp0x42RTyo3mU8gMJDjyNef0DkdrLqOUBbqtUDAbRwbaa9fXRLKD+Qj6lBmrFG+78/
	As/dXS+HSlQaLjl72UHxXPW8t0J2CRqjH3TLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Y2xCOuramHL69KA6x4r1YV1JfGoM4vWsyqQEmnoHx9M=;
	b=Yq1tfpnbhF/XVc2SGpmrrHk2UumBUvjOfpcgtnNuXrpebk/nZOHE1Nv9wkIn7663bn
	GYaTy23rFSc9opogKzMyzQktR1wdYNOeyNzTL1CSu6PI/g6mGSBjg23uKhijNxeFhJZc
	ItL4IPJehYd8VMtjxksZpfPDJSFerz987C2AT9qVkN+0nvD4RG6MgHMhNDJnrfDS0/h/
	9X8QeKzoawfAE1bawh1S01+qPjNgkTVeAh3QVUFGv7hYcFjT/ZBmiNZGC3JdMkE2emTx
	eHwUwBMqTOmlVq9IjmCI87WgfL4xunT8t21iNAI8HskbDcu1gwxoqk+FeJPRE+h+ByLD
	SD2Q==
X-Gm-Message-State: AElRT7FNZ8gpmpdqW3+MLeig6OdoLyeGb/g3N+F8BtiXSioxOQwU2XOt
	4826ebYvNwG826iXc/roCRL17tvsF9o=
X-Google-Smtp-Source: AG47ELvl+8KZm95SKU5AsDVFHYf20j7VQLdBU0UGBXJtkJjJLrL9EWbM9ATxoK4yvvv/Ynm9nVwUjw==
X-Received: by 10.157.89.158 with SMTP id u30mr5691872oth.294.1520351217695;
	Tue, 06 Mar 2018 07:46:57 -0800 (PST)
Received: from aura.cortijodelrio.net
	(CableLink-187-161-113-185.PCs.InterCable.net. [187.161.113.185])
	by smtp.googlemail.com with ESMTPSA id
	h188sm7407997oib.4.2018.03.06.07.46.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 07:46:56 -0800 (PST)
From: =?UTF-8?q?Daniel=20D=C3=ADaz?= <daniel.diaz@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Mar 2018 09:46:21 -0600
Message-Id: <1520351181-18084-1-git-send-email-daniel.diaz@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520051014-6587-1-git-send-email-daniel.diaz@linaro.org>
References: <1520051014-6587-1-git-send-email-daniel.diaz@linaro.org>
MIME-Version: 1.0
Subject: [PATCH v2] gdb: fix header ordering for TRAP_HWBKPT
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
X-List-Received-Date: Tue, 06 Mar 2018 15:46:57 -0000
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

Signed-off-by: Daniel Díaz <daniel.diaz@linaro.org>
---
v2: Add signed-off-by tag to patch

 meta/recipes-devtools/gdb/gdb-8.0.1.inc            |  1 +
 ...4-defining-TRAP_HWBKPT-before-including-g.patch | 56 ++++++++++++++++++++++
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-devtools/gdb/gdb/gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch

diff --git a/meta/recipes-devtools/gdb/gdb-8.0.1.inc b/meta/recipes-devtools/gdb/gdb-8.0.1.inc
index 83c08e5..4a5299b 100644
--- a/meta/recipes-devtools/gdb/gdb-8.0.1.inc
+++ b/meta/recipes-devtools/gdb/gdb-8.0.1.inc
@@ -17,6 +17,7 @@ SRC_URI = "http://ftp.gnu.org/gnu/gdb/gdb-${PV}.tar.xz \
            file://0010-resolve-restrict-keyword-conflict.patch \
            file://package_devel_gdb_patches_120-sigprocmask-invalid-call.patch \
            file://0012-Unbreak-GDBserver-build-for-x32.patch \
+           file://gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch \
 "
 SRC_URI[md5sum] = "48cac527e6f3018b865ece021e9723ac"
 SRC_URI[sha256sum] = "3dbd5f93e36ba2815ad0efab030dcd0c7b211d7b353a40a53f4c02d7d56295e3"
diff --git a/meta/recipes-devtools/gdb/gdb/gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch b/meta/recipes-devtools/gdb/gdb/gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch
new file mode 100644
index 0000000..2cdeafc
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch
@@ -0,0 +1,56 @@
+From c57122f94b1c749e4c12f6449b61a3b114f705cd Mon Sep 17 00:00:00 2001
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


