Return-Path: <Li.Zhou@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 18D9E60777
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 10:05:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v8SA5DoD004249
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Sep 2017 03:05:13 -0700 (PDT)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 28 Sep 2017 03:05:12 -0700
From: Li Zhou <li.zhou@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Sep 2017 18:04:21 +0800
Message-ID: <1506593061-168725-1-git-send-email-li.zhou@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [PATCH] expect: Fix segfaults when Expect clib is used directly from C program
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
X-List-Received-Date: Thu, 28 Sep 2017 10:05:13 -0000
Content-Type: text/plain

Fix segfaults if Tcl is built with stubs and Expect clib function is used
directly from C program.

Signed-off-by: Li Zhou <li.zhou@windriver.com>
---
 ...segfaults-if-Tcl-is-built-with-stubs-and-.patch | 90 ++++++++++++++++++++++
 meta/recipes-devtools/expect/expect_5.45.bb        |  1 +
 2 files changed, 91 insertions(+)
 create mode 100644 meta/recipes-devtools/expect/expect/0001-expect-Fix-segfaults-if-Tcl-is-built-with-stubs-and-.patch

diff --git a/meta/recipes-devtools/expect/expect/0001-expect-Fix-segfaults-if-Tcl-is-built-with-stubs-and-.patch b/meta/recipes-devtools/expect/expect/0001-expect-Fix-segfaults-if-Tcl-is-built-with-stubs-and-.patch
new file mode 100644
index 0000000..d1619ba
--- /dev/null
+++ b/meta/recipes-devtools/expect/expect/0001-expect-Fix-segfaults-if-Tcl-is-built-with-stubs-and-.patch
@@ -0,0 +1,90 @@
+From f0049b4b2ea55b3b3c53bf6f0275654801c755d2 Mon Sep 17 00:00:00 2001
+From: Li Zhou <li.zhou@windriver.com>
+Date: Thu, 28 Sep 2017 15:54:55 +0800
+Subject: [PATCH] expect: Fix segfaults if Tcl is built with stubs and Expect
+ is used directly from C program
+
+Description: This dirty hack fixes segfaults if Tcl is built with stubs
+ and Expect is used directly from C program.
+Bug: http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=588817
+Example:
+ #include <stdio.h>
+ #include <tcl8.5/expect.h>
+ int main()
+ {
+     FILE *pipe;
+     char *some_command = "uname";
+     char datum;
+     pipe = exp_popen(some_command);
+     if (pipe == NULL) return 1;
+     while ((datum = getc (pipe)) != EOF)
+ 	printf("%c",datum);
+ }
+Example:
+ #include <stdio.h>
+ #include "expect.h"
+ main()
+ {
+     int fd = 0;
+     fd = exp_spawnl("echo", "echo", "Hello User: Whats up?", (char*) 0);
+     switch (exp_expectl(fd, exp_regexp, "ser:", 1, exp_end)) {
+ 	case 1: {
+ 	    printf("GOT ser:\n");
+ 	    break;
+ 	}
+ 	default: {
+ 	    printf("DEFAULT\n");
+ 	    return 1;
+ 	}
+     }
+     printf("Normal Exit\n");
+     return 0;
+ }
+Author: Sergei Golovan <sgolovan@debian.org>
+
+Upstream-Status: Backport
+Backport from http://pkgs.fedoraproject.org/cgit/rpms/expect.git/commit/
+?h=master&id=b6737eed550be93182f2ed194e836a6cbbcf4fa3
+Signed-off-by: Li Zhou <li.zhou@windriver.com>
+---
+ exp_clib.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/exp_clib.c b/exp_clib.c
+index 172c05e..19341d5 100644
+--- a/exp_clib.c
++++ b/exp_clib.c
+@@ -114,7 +114,11 @@ extern unsigned long	strtoul _ANSI_ARGS_((CONST char *string,
+ #include <stdlib.h>		/* for malloc */
+ #endif
+ 
+-#include <tcl.h>
++#define ckalloc(x) Tcl_Alloc(x)
++#define ckfree(x) Tcl_Free(x)
++extern char *Tcl_ErrnoMsg(int err);
++extern char *Tcl_Alloc(unsigned int size);
++extern void Tcl_Free(char *ptr);
+ #include "expect.h"
+ #define TclRegError exp_TclRegError
+ 
+@@ -389,7 +393,7 @@ char *exp;
+ 		FAIL("regexp too big");
+ 
+ 	/* Allocate space. */
+-	r = (regexp *)ckalloc(sizeof(regexp) + (unsigned)rcstate->regsize);
++	r = (regexp *)malloc(sizeof(regexp) + (unsigned)rcstate->regsize);
+ 	if (r == NULL)
+ 		FAIL("out of space");
+ 
+@@ -399,7 +403,7 @@ char *exp;
+ 	rcstate->regcode = r->program;
+ 	regc(MAGIC, rcstate);
+ 	if (reg(0, &flags, rcstate) == NULL) {
+-	  ckfree ((char*) r);
++	  free((char*) r);
+ 	  return(NULL);
+ 	}
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/expect/expect_5.45.bb b/meta/recipes-devtools/expect/expect_5.45.bb
index e2d24e8..c9f5aba 100644
--- a/meta/recipes-devtools/expect/expect_5.45.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.bb
@@ -26,6 +26,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/expect/Expect/${PV}/${BPN}${PV}.tar.gz \
            file://01-example-shebang.patch \
            file://0001-expect-install-scripts-without-using-the-fixline1-tc.patch \
            file://0001-Resolve-string-formatting-issues.patch \
+           file://0001-expect-Fix-segfaults-if-Tcl-is-built-with-stubs-and-.patch \
           "
 SRC_URI[md5sum] = "44e1a4f4c877e9ddc5a542dfa7ecc92b"
 SRC_URI[sha256sum] = "b28dca90428a3b30e650525cdc16255d76bb6ccd65d448be53e620d95d5cc040"
-- 
1.9.1


