Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3972A6FFA4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 04:02:04 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 09 Mar 2016 20:02:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,314,1455004800"; d="scan'208";a="761389675"
Received: from rebeccas-ilbpg3.png.intel.com ([10.88.227.80])
	by orsmga003.jf.intel.com with ESMTP; 09 Mar 2016 20:02:05 -0800
From: Rebecca Chang <rebecca.swee.fun.chang@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Mar 2016 12:01:48 +0800
Message-Id: <1457582508-9142-1-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: Rebecca Chang <rebecca.swee.fun.chang@intel.com>
Subject: [master][jethro][PATCH] make 4.1: fix segfault when ttyname fails
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
X-List-Received-Date: Thu, 10 Mar 2016 04:02:08 -0000

From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>

GNU make segfaults when run in a chroot environment because
of a known bug in GNU make 4.1. See [1] for details.

Works if /dev/pts is mounted before chroot.

[1] http://savannah.gnu.org/bugs/?43434

[YOCTO #9067]

Reported-by: Alexander Larsson <alexl@redhat.com>
Signed-off-by: Anuj Mittal <anujx.mittal@intel.com>
Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 ...-SV-43434-Handle-NULL-returns-from-ttynam.patch | 63 ++++++++++++++++++++++
 meta/recipes-devtools/make/make_4.1.bb             |  2 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-devtools/make/make-4.1/0001-main.c-main-SV-43434-Handle-NULL-returns-from-ttynam.patch

diff --git a/meta/recipes-devtools/make/make-4.1/0001-main.c-main-SV-43434-Handle-NULL-returns-from-ttynam.patch b/meta/recipes-devtools/make/make-4.1/0001-main.c-main-SV-43434-Handle-NULL-returns-from-ttynam.patch
new file mode 100644
index 0000000..7a5f4ba
--- /dev/null
+++ b/meta/recipes-devtools/make/make-4.1/0001-main.c-main-SV-43434-Handle-NULL-returns-from-ttynam.patch
@@ -0,0 +1,63 @@
+From 292da6f6867b75a5af7ddbb639a1feae022f438f Mon Sep 17 00:00:00 2001
+From: Paul Smith <psmith@gnu.org>
+Date: Mon, 20 Oct 2014 01:54:56 -0400
+Subject: [PATCH] * main.c (main): [SV 43434] Handle NULL returns from
+ ttyname().
+
+Upstream-Status: Backport
+
+From: http://git.savannah.gnu.org/cgit/make.git/commit/?id=292da6f6867b75a5af7ddbb639a1feae022f438f
+
+---
+ main.c    | 15 ++++++++++-----
+ makeint.h |  3 ++-
+ 2 files changed, 12 insertions(+), 6 deletions(-)
+
+diff --git a/main.c b/main.c
+index b2d169c..0cdb8a8 100644
+--- a/main.c
++++ b/main.c
+@@ -1429,13 +1429,18 @@ main (int argc, char **argv, char **envp)
+ #ifdef HAVE_ISATTY
+     if (isatty (fileno (stdout)))
+       if (! lookup_variable (STRING_SIZE_TUPLE ("MAKE_TERMOUT")))
+-        define_variable_cname ("MAKE_TERMOUT", TTYNAME (fileno (stdout)),
+-                               o_default, 0)->export = v_export;
+-
++        {
++          const char *tty = TTYNAME (fileno (stdout));
++          define_variable_cname ("MAKE_TERMOUT", tty ? tty : DEFAULT_TTYNAME,
++                                 o_default, 0)->export = v_export;
++        }
+     if (isatty (fileno (stderr)))
+       if (! lookup_variable (STRING_SIZE_TUPLE ("MAKE_TERMERR")))
+-        define_variable_cname ("MAKE_TERMERR", TTYNAME (fileno (stderr)),
+-                               o_default, 0)->export = v_export;
++        {
++          const char *tty = TTYNAME (fileno (stderr));
++          define_variable_cname ("MAKE_TERMERR", tty ? tty : DEFAULT_TTYNAME,
++                                 o_default, 0)->export = v_export;
++        }
+ #endif
+ 
+   /* Reset in case the switches changed our minds.  */
+diff --git a/makeint.h b/makeint.h
+index 6223936..2009f41 100644
+--- a/makeint.h
++++ b/makeint.h
+@@ -436,10 +436,11 @@ extern struct rlimit stack_limit;
+ /* The number of bytes needed to represent the largest integer as a string.  */
+ #define INTSTR_LENGTH         CSTRLEN ("18446744073709551616")
+ 
++#define DEFAULT_TTYNAME "true"
+ #ifdef HAVE_TTYNAME
+ # define TTYNAME(_f) ttyname (_f)
+ #else
+-# define TTYNAME(_f) "true"
++# define TTYNAME(_f) DEFAULT_TTYNAME
+ #endif
+ 
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/make/make_4.1.bb b/meta/recipes-devtools/make/make_4.1.bb
index a1b0d7c..78fe0b5 100644
--- a/meta/recipes-devtools/make/make_4.1.bb
+++ b/meta/recipes-devtools/make/make_4.1.bb
@@ -4,6 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://glob/COPYING.LIB;md5=4a770b67e6be0f60da244beb2de0fce4"
 require make.inc
 
+SRC_URI += "file://0001-main.c-main-SV-43434-Handle-NULL-returns-from-ttynam.patch"
+
 EXTRA_OECONF += "--without-guile"
 
 SRC_URI[md5sum] = "57a7a224a822f94789a587ccbcedff69"
-- 
1.9.1


