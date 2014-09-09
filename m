Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3725665D58
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 18:59:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s89IxcIi017215
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Sep 2014 11:59:39 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 9 Sep 2014 11:59:38 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Sep 2014 11:59:38 -0700
Message-ID: <1410289178-5328-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 1/1] gdb: allow compilation for __aarch64__
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
X-List-Received-Date: Tue, 09 Sep 2014 18:59:47 -0000
Content-Type: text/plain

asm/ptrace.h must be included in two files.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-devtools/gdb/gdb.inc                  |    1 +
 .../gdb/gdb/include_asm_ptrace.patch               |   30 ++++++++++++++++++++
 2 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/gdb/gdb/include_asm_ptrace.patch

diff --git a/meta/recipes-devtools/gdb/gdb.inc b/meta/recipes-devtools/gdb/gdb.inc
index 3321a24..7b3e59a 100644
--- a/meta/recipes-devtools/gdb/gdb.inc
+++ b/meta/recipes-devtools/gdb/gdb.inc
@@ -5,6 +5,7 @@ inherit gettext
 SRC_URI += "file://kill_arm_map_symbols.patch \
             file://gdbserver-cflags-last.diff;striplevel=0 \
             file://renesas-sh-native-support.patch \
+            file://include_asm_ptrace.patch \
            "
 #LDFLAGS_append = " -s"
 #export CFLAGS_append=" -L${STAGING_LIBDIR}"
diff --git a/meta/recipes-devtools/gdb/gdb/include_asm_ptrace.patch b/meta/recipes-devtools/gdb/gdb/include_asm_ptrace.patch
new file mode 100644
index 0000000..85e0147
--- /dev/null
+++ b/meta/recipes-devtools/gdb/gdb/include_asm_ptrace.patch
@@ -0,0 +1,30 @@
+gdb: include asm/ptrace.h in two aarch64 source files
+
+Both sys/ptrace.h and asm/ptrace.h need to be included.
+
+Upstream-Status: Pending
+
+Signed-off-by: joe.slater@windriver.com
+
+
+--- a/gdb/aarch64-linux-nat.c
++++ b/gdb/aarch64-linux-nat.c
+@@ -32,6 +32,8 @@
+ #include "elf/common.h"
+ 
+ #include <sys/ptrace.h>
++#include <asm/ptrace.h>
++
+ #include <sys/utsname.h>
+ 
+ #include "gregset.h"
+--- a/gdb/gdbserver/linux-aarch64-low.c
++++ b/gdb/gdbserver/linux-aarch64-low.c
+@@ -26,6 +26,7 @@
+ #include <signal.h>
+ #include <sys/user.h>
+ #include <sys/ptrace.h>
++#include <asm/ptrace.h>
+ #include <sys/uio.h>
+ 
+ #include "gdb_proc_service.h"
-- 
1.7.3.4


