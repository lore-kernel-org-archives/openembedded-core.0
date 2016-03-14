Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 73CA673174
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Mar 2016 06:51:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2E6prQp001545
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 23:51:53 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 13 Mar 2016 23:51:52 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 13 Mar 2016 23:51:49 -0700
Message-ID: <bf280fed7f8168268ce4361ef3f0de5284f4d51a.1457938004.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1457938004.git.liezhi.yang@windriver.com>
References: <cover.1457938004.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] make 4.1: fix segfault when ttyname fails
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
X-List-Received-Date: Mon, 14 Mar 2016 06:51:54 -0000
Content-Type: text/plain

From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>

GNU make segfaults when run in a chroot environment because
of a known bug in GNU make 4.1. See [1] for details.

Works if /dev/pts is mounted before chroot.

[1] http://savannah.gnu.org/bugs/?43434

[YOCTO #9067]

Reported-by: Alexander Larsson <alexl@redhat.com>
(From OE-Core master rev: 0fe2a4b428b1b9a937914d87ec089b5a64f641eb)

Signed-off-by: Anuj Mittal <anujx.mittal@intel.com>
Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...-SV-43434-Handle-NULL-returns-from-ttynam.patch |   63 ++++++++++++++++++++
 meta/recipes-devtools/make/make_4.1.bb             |    2 +
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
1.7.9.5


