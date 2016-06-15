Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7315A60761
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jun 2016 02:29:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5F2Trek013080
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 19:29:53 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 14 Jun 2016 19:29:52 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Jun 2016 19:29:51 -0700
Message-ID: <bd14ed91e60429507fcb8b28e0ffc1d87c586365.1465957427.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1465957427.git.liezhi.yang@windriver.com>
References: <cover.1465957427.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] make: 4.2 -> 4.2.1
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
X-List-Received-Date: Wed, 15 Jun 2016 02:29:54 -0000
Content-Type: text/plain

1) Remove unused patch 0001-main.c-main-SV-43434-Handle-NULL-returns-from-ttynam.patch.

2) Here are the fixes since 4.2, the [SV 47995] is important for us.
   * maintMakefile: TP recommends rsync for retrieving PO files.
   * main.c (main): [SV 48009] Reset stack limit for make re-exec.
   [SV 47995] Ensure forced double-colon rules work with -j.
   * DELETE_ON_ERROR: [SV 48061] Use "exit 1" for portability.
   * w32/pathstuff.c: [SV 47996] Use ISBLANK() not isblank().
   Fix printing time stamps on MS-Windows
   [SV 48037] Fix MinGW build with Posix configury tools

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...-SV-43434-Handle-NULL-returns-from-ttynam.patch | 63 ----------------------
 .../make/{make_4.2.bb => make_4.2.1.bb}            |  4 +-
 2 files changed, 2 insertions(+), 65 deletions(-)
 delete mode 100644 meta/recipes-devtools/make/make-4.2/0001-main.c-main-SV-43434-Handle-NULL-returns-from-ttynam.patch
 rename meta/recipes-devtools/make/{make_4.2.bb => make_4.2.1.bb} (71%)

diff --git a/meta/recipes-devtools/make/make-4.2/0001-main.c-main-SV-43434-Handle-NULL-returns-from-ttynam.patch b/meta/recipes-devtools/make/make-4.2/0001-main.c-main-SV-43434-Handle-NULL-returns-from-ttynam.patch
deleted file mode 100644
index 7a5f4ba..0000000
--- a/meta/recipes-devtools/make/make-4.2/0001-main.c-main-SV-43434-Handle-NULL-returns-from-ttynam.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 292da6f6867b75a5af7ddbb639a1feae022f438f Mon Sep 17 00:00:00 2001
-From: Paul Smith <psmith@gnu.org>
-Date: Mon, 20 Oct 2014 01:54:56 -0400
-Subject: [PATCH] * main.c (main): [SV 43434] Handle NULL returns from
- ttyname().
-
-Upstream-Status: Backport
-
-From: http://git.savannah.gnu.org/cgit/make.git/commit/?id=292da6f6867b75a5af7ddbb639a1feae022f438f
-
----
- main.c    | 15 ++++++++++-----
- makeint.h |  3 ++-
- 2 files changed, 12 insertions(+), 6 deletions(-)
-
-diff --git a/main.c b/main.c
-index b2d169c..0cdb8a8 100644
---- a/main.c
-+++ b/main.c
-@@ -1429,13 +1429,18 @@ main (int argc, char **argv, char **envp)
- #ifdef HAVE_ISATTY
-     if (isatty (fileno (stdout)))
-       if (! lookup_variable (STRING_SIZE_TUPLE ("MAKE_TERMOUT")))
--        define_variable_cname ("MAKE_TERMOUT", TTYNAME (fileno (stdout)),
--                               o_default, 0)->export = v_export;
--
-+        {
-+          const char *tty = TTYNAME (fileno (stdout));
-+          define_variable_cname ("MAKE_TERMOUT", tty ? tty : DEFAULT_TTYNAME,
-+                                 o_default, 0)->export = v_export;
-+        }
-     if (isatty (fileno (stderr)))
-       if (! lookup_variable (STRING_SIZE_TUPLE ("MAKE_TERMERR")))
--        define_variable_cname ("MAKE_TERMERR", TTYNAME (fileno (stderr)),
--                               o_default, 0)->export = v_export;
-+        {
-+          const char *tty = TTYNAME (fileno (stderr));
-+          define_variable_cname ("MAKE_TERMERR", tty ? tty : DEFAULT_TTYNAME,
-+                                 o_default, 0)->export = v_export;
-+        }
- #endif
- 
-   /* Reset in case the switches changed our minds.  */
-diff --git a/makeint.h b/makeint.h
-index 6223936..2009f41 100644
---- a/makeint.h
-+++ b/makeint.h
-@@ -436,10 +436,11 @@ extern struct rlimit stack_limit;
- /* The number of bytes needed to represent the largest integer as a string.  */
- #define INTSTR_LENGTH         CSTRLEN ("18446744073709551616")
- 
-+#define DEFAULT_TTYNAME "true"
- #ifdef HAVE_TTYNAME
- # define TTYNAME(_f) ttyname (_f)
- #else
--# define TTYNAME(_f) "true"
-+# define TTYNAME(_f) DEFAULT_TTYNAME
- #endif
- 
- 
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/make/make_4.2.bb b/meta/recipes-devtools/make/make_4.2.1.bb
similarity index 71%
rename from meta/recipes-devtools/make/make_4.2.bb
rename to meta/recipes-devtools/make/make_4.2.1.bb
index 6327d6c..c6e6a0c 100644
--- a/meta/recipes-devtools/make/make_4.2.bb
+++ b/meta/recipes-devtools/make/make_4.2.1.bb
@@ -6,7 +6,7 @@ require make.inc
 
 EXTRA_OECONF += "--without-guile"
 
-SRC_URI[md5sum] = "85ad14d08766201ffe71efa866f4fb91"
-SRC_URI[sha256sum] = "4e5ce3b62fe5d75ff8db92b7f6df91e476d10c3aceebf1639796dc5bfece655f"
+SRC_URI[md5sum] = "15b012617e7c44c0ed482721629577ac"
+SRC_URI[sha256sum] = "d6e262bf3601b42d2b1e4ef8310029e1dcf20083c5446b4b7aa67081fdffc589"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.8.0


