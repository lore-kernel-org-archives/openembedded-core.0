Return-Path: <Yuanjie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 219EE77150
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 01:44:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u141is5w000661
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Feb 2016 17:44:54 -0800 (PST)
Received: from Flora.wrs.com (128.224.163.135) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 3 Feb 2016 17:44:53 -0800
From: Yuanjie Huang <Yuanjie.Huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 4 Feb 2016 09:51:32 +0800
Message-ID: <1454550692-7736-1-git-send-email-Yuanjie.Huang@windriver.com>
X-Mailer: git-send-email 2.7.0
MIME-Version: 1.0
Subject: [PATCH V2] glibc: fix CVE-2015-8777 and CVE-2015-8779
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
X-List-Received-Date: Thu, 04 Feb 2016 01:44:55 -0000
Content-Type: text/plain

From: Yuanjie Huang <yuanjie.huang@windriver.com>

According to http://seclists.org/oss-sec/2016/q1/153

CVE-2015-8777: LD_POINTER_GUARD was an environment variable which controls
security-related behavior, but was not ignored for privileged binaries (in
AT_SECURE mode).  This might allow local attackers (who can supply the
environment variable) to bypass intended security restriction.

[glibc BZ #18928] -- https://sourceware.org/bugzilla/show_bug.cgi?id=18928

(cherry picked from commit a014cecd82b71b70a6a843e250e06b541ad524f7)

CVE-2015-8779: A stack overflow (unbounded alloca) in the catopen function can
cause applications which pass long strings to the catopen function to crash or,
potentially execute arbitrary code.

[glibc BZ #17905] -- https://sourceware.org/bugzilla/show_bug.cgi?id=17905

(cherry picked from commit 0f58539030e436449f79189b6edab17d7479796e
and commit 7565d2a862683a3c26ffb1f32351b8c5ab9f7b31)

Upstream-Status: Backport [2.23]
CVE: CVE-2015-8777 CVE-2015-8779

Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
---
 ...able-pointer-guard-BZ-18928-CVE-2015-8777.patch |  87 ++++++++
 ...-multiple-unbounded-stack-allocations-BZ-.patch | 238 +++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.22.bb              |   2 +
 3 files changed, 327 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0030-Always-enable-pointer-guard-BZ-18928-CVE-2015-8777.patch
 create mode 100644 meta/recipes-core/glibc/glibc/0031-Fix-catopen-multiple-unbounded-stack-allocations-BZ-.patch

diff --git a/meta/recipes-core/glibc/glibc/0030-Always-enable-pointer-guard-BZ-18928-CVE-2015-8777.patch b/meta/recipes-core/glibc/glibc/0030-Always-enable-pointer-guard-BZ-18928-CVE-2015-8777.patch
new file mode 100644
index 0000000..c3eb70a
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0030-Always-enable-pointer-guard-BZ-18928-CVE-2015-8777.patch
@@ -0,0 +1,87 @@
+From b81f52160a5d7e08491a58ce5a39fc1f24534313 Mon Sep 17 00:00:00 2001
+From: Florian Weimer <fweimer@redhat.com>
+Date: Thu, 15 Oct 2015 09:23:07 +0200
+Subject: [PATCH 1/2] Always enable pointer guard [BZ #18928] (CVE-2015-8777)
+
+Honoring the LD_POINTER_GUARD environment variable in AT_SECURE mode
+has security implications.  This commit enables pointer guard
+unconditionally, and the environment variable is now ignored.
+
+        [BZ #18928]
+        * sysdeps/generic/ldsodefs.h (struct rtld_global_ro): Remove
+        _dl_pointer_guard member.
+        * elf/rtld.c (_rtld_global_ro): Remove _dl_pointer_guard
+        initializer.
+        (security_init): Always set up pointer guard.
+        (process_envvars): Do not process LD_POINTER_GUARD.
+
+(cherry picked from commit a014cecd82b71b70a6a843e250e06b541ad524f7)
+
+Upstream-Stratus: Backport [2.23]
+CVE: CVE-2015-8777
+
+Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
+---
+ elf/rtld.c                 | 15 ++++-----------
+ sysdeps/generic/ldsodefs.h |  3 ---
+ 2 files changed, 4 insertions(+), 14 deletions(-)
+
+diff --git a/elf/rtld.c b/elf/rtld.c
+index 8362932..83e4b0e 100644
+--- a/elf/rtld.c
++++ b/elf/rtld.c
+@@ -163,7 +163,6 @@ struct rtld_global_ro _rtld_global_ro attribute_relro =
+     ._dl_hwcap_mask = HWCAP_IMPORTANT,
+     ._dl_lazy = 1,
+     ._dl_fpu_control = _FPU_DEFAULT,
+-    ._dl_pointer_guard = 1,
+     ._dl_pagesize = EXEC_PAGESIZE,
+     ._dl_inhibit_cache = 0,
+ 
+@@ -710,15 +709,12 @@ security_init (void)
+ #endif
+ 
+   /* Set up the pointer guard as well, if necessary.  */
+-  if (GLRO(dl_pointer_guard))
+-    {
+-      uintptr_t pointer_chk_guard = _dl_setup_pointer_guard (_dl_random,
+-							     stack_chk_guard);
++  uintptr_t pointer_chk_guard
++    = _dl_setup_pointer_guard (_dl_random, stack_chk_guard);
+ #ifdef THREAD_SET_POINTER_GUARD
+-      THREAD_SET_POINTER_GUARD (pointer_chk_guard);
++  THREAD_SET_POINTER_GUARD (pointer_chk_guard);
+ #endif
+-      __pointer_chk_guard_local = pointer_chk_guard;
+-    }
++  __pointer_chk_guard_local = pointer_chk_guard;
+ 
+   /* We do not need the _dl_random value anymore.  The less
+      information we leave behind, the better, so clear the
+@@ -2478,9 +2474,6 @@ process_envvars (enum mode *modep)
+ 	      GLRO(dl_use_load_bias) = envline[14] == '1' ? -1 : 0;
+ 	      break;
+ 	    }
+-
+-	  if (memcmp (envline, "POINTER_GUARD", 13) == 0)
+-	    GLRO(dl_pointer_guard) = envline[14] != '0';
+ 	  break;
+ 
+ 	case 14:
+diff --git a/sysdeps/generic/ldsodefs.h b/sysdeps/generic/ldsodefs.h
+index a3e2c0a..4668f73 100644
+--- a/sysdeps/generic/ldsodefs.h
++++ b/sysdeps/generic/ldsodefs.h
+@@ -600,9 +600,6 @@ struct rtld_global_ro
+   /* List of auditing interfaces.  */
+   struct audit_ifaces *_dl_audit;
+   unsigned int _dl_naudit;
+-
+-  /* 0 if internal pointer values should not be guarded, 1 if they should.  */
+-  EXTERN int _dl_pointer_guard;
+ };
+ # define __rtld_global_attribute__
+ # if IS_IN (rtld)
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/glibc/glibc/0031-Fix-catopen-multiple-unbounded-stack-allocations-BZ-.patch b/meta/recipes-core/glibc/glibc/0031-Fix-catopen-multiple-unbounded-stack-allocations-BZ-.patch
new file mode 100644
index 0000000..24cd217
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0031-Fix-catopen-multiple-unbounded-stack-allocations-BZ-.patch
@@ -0,0 +1,238 @@
+From a8fd3645b46f7012f1b6607a808dd84cad157e21 Mon Sep 17 00:00:00 2001
+From: Paul Pluzhnikov <ppluzhnikov@google.com>
+Date: Sat, 8 Aug 2015 15:53:03 -0700
+Subject: [PATCH 2/2] Fix catopen() multiple unbounded stack allocations [BZ
+ #17905] (CVE-2015-8779)
+
+A stack overflow (unbounded alloca) in the catopen function can cause
+applications which pass long strings to the catopen function to crash
+or, potentially execute arbitrary code.
+
+(cherry picked from commit 0f58539030e436449f79189b6edab17d7479796e
+and commit 7565d2a862683a3c26ffb1f32351b8c5ab9f7b31)
+
+Upstream-Status: Backport [2.23]
+CVE: CVE-2015-8779
+
+Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
+---
+ catgets/Makefile       |  9 ++++++++-
+ catgets/catgets.c      | 19 ++++++++++++-------
+ catgets/open_catalog.c | 23 ++++++++++++++---------
+ catgets/tst-catgets.c  | 31 +++++++++++++++++++++++++++++++
+ 4 files changed, 65 insertions(+), 17 deletions(-)
+
+diff --git a/catgets/Makefile b/catgets/Makefile
+index 05714fd..7f45fc3 100644
+--- a/catgets/Makefile
++++ b/catgets/Makefile
+@@ -37,6 +37,7 @@ ifeq (y,$(OPTION_EGLIBC_CATGETS))
+ ifeq ($(run-built-tests),yes)
+ tests-special += $(objpfx)de/libc.cat $(objpfx)test1.cat $(objpfx)test2.cat \
+ 		 $(objpfx)sample.SJIS.cat $(objpfx)test-gencat.out
++tests-special += $(objpfx)tst-catgets-mem.out
+ endif
+ endif
+ gencat-modules	= xmalloc
+@@ -53,9 +54,11 @@ catgets-CPPFLAGS := -DNLSPATH='"$(msgcatdir)/%L/%N:$(msgcatdir)/%L/LC_MESSAGES/%
+ 
+ generated += de.msg test1.cat test1.h test2.cat test2.h sample.SJIS.cat \
+ 	     test-gencat.h
++generated += tst-catgets.mtrace tst-catgets-mem.out
++
+ generated-dirs += de
+ 
+-tst-catgets-ENV = NLSPATH="$(objpfx)%l/%N.cat" LANG=de
++tst-catgets-ENV = NLSPATH="$(objpfx)%l/%N.cat" LANG=de MALLOC_TRACE=$(objpfx)tst-catgets.mtrace
+ 
+ ifeq ($(run-built-tests),yes)
+ # This test just checks whether the program produces any error or not.
+@@ -89,4 +92,8 @@ $(objpfx)test-gencat.out: test-gencat.sh $(objpfx)test-gencat \
+ $(objpfx)sample.SJIS.cat: sample.SJIS $(objpfx)gencat
+ 	$(built-program-cmd) -H $(objpfx)test-gencat.h < $(word 1,$^) > $@; \
+ 	$(evaluate-test)
++
++$(objpfx)tst-catgets-mem.out: $(objpfx)tst-catgets.out
++	$(common-objpfx)malloc/mtrace $(objpfx)tst-catgets.mtrace > $@; \
++	$(evaluate-test)
+ endif
+diff --git a/catgets/catgets.c b/catgets/catgets.c
+index cf93d56..4be452d 100644
+--- a/catgets/catgets.c
++++ b/catgets/catgets.c
+@@ -16,7 +16,6 @@
+    License along with the GNU C Library; if not, see
+    <http://www.gnu.org/licenses/>.  */
+ 
+-#include <alloca.h>
+ #include <errno.h>
+ #include <locale.h>
+ #include <nl_types.h>
+@@ -35,6 +34,7 @@ catopen (const char *cat_name, int flag)
+   __nl_catd result;
+   const char *env_var = NULL;
+   const char *nlspath = NULL;
++  char *tmp = NULL;
+ 
+   if (strchr (cat_name, '/') == NULL)
+     {
+@@ -54,7 +54,10 @@ catopen (const char *cat_name, int flag)
+ 	{
+ 	  /* Append the system dependent directory.  */
+ 	  size_t len = strlen (nlspath) + 1 + sizeof NLSPATH;
+-	  char *tmp = alloca (len);
++	  tmp = malloc (len);
++
++	  if (__glibc_unlikely (tmp == NULL))
++	    return (nl_catd) -1;
+ 
+ 	  __stpcpy (__stpcpy (__stpcpy (tmp, nlspath), ":"), NLSPATH);
+ 	  nlspath = tmp;
+@@ -65,16 +68,18 @@ catopen (const char *cat_name, int flag)
+ 
+   result = (__nl_catd) malloc (sizeof (*result));
+   if (result == NULL)
+-    /* We cannot get enough memory.  */
+-    return (nl_catd) -1;
+-
+-  if (__open_catalog (cat_name, nlspath, env_var, result) != 0)
++    {
++      /* We cannot get enough memory.  */
++      result = (nl_catd) -1;
++    }
++  else if (__open_catalog (cat_name, nlspath, env_var, result) != 0)
+     {
+       /* Couldn't open the file.  */
+       free ((void *) result);
+-      return (nl_catd) -1;
++      result = (nl_catd) -1;
+     }
+ 
++  free (tmp);
+   return (nl_catd) result;
+ }
+ 
+diff --git a/catgets/open_catalog.c b/catgets/open_catalog.c
+index e069416..9f4d776 100644
+--- a/catgets/open_catalog.c
++++ b/catgets/open_catalog.c
+@@ -47,6 +47,7 @@ __open_catalog (const char *cat_name, const char *nlspath, const char *env_var,
+   size_t tab_size;
+   const char *lastp;
+   int result = -1;
++  char *buf = NULL;
+ 
+   if (strchr (cat_name, '/') != NULL || nlspath == NULL)
+     fd = open_not_cancel_2 (cat_name, O_RDONLY);
+@@ -57,23 +58,23 @@ __open_catalog (const char *cat_name, const char *nlspath, const char *env_var,
+   if (__glibc_unlikely (bufact + (n) >= bufmax))			      \
+     {									      \
+       char *old_buf = buf;						      \
+-      bufmax += 256 + (n);						      \
+-      buf = (char *) alloca (bufmax);					      \
+-      memcpy (buf, old_buf, bufact);					      \
++      bufmax += (bufmax < 256 + (n)) ? 256 + (n) : bufmax;		      \
++      buf = realloc (buf, bufmax);					      \
++      if (__glibc_unlikely (buf == NULL))				      \
++	{								      \
++	  free (old_buf);						      \
++	  return -1;							      \
++	}								      \
+     }
+ 
+       /* The RUN_NLSPATH variable contains a colon separated list of
+ 	 descriptions where we expect to find catalogs.  We have to
+ 	 recognize certain % substitutions and stop when we found the
+ 	 first existing file.  */
+-      char *buf;
+       size_t bufact;
+-      size_t bufmax;
++      size_t bufmax = 0;
+       size_t len;
+ 
+-      buf = NULL;
+-      bufmax = 0;
+-
+       fd = -1;
+       while (*run_nlspath != '\0')
+ 	{
+@@ -188,7 +189,10 @@ __open_catalog (const char *cat_name, const char *nlspath, const char *env_var,
+ 
+   /* Avoid dealing with directories and block devices */
+   if (__builtin_expect (fd, 0) < 0)
+-    return -1;
++    {
++      free (buf);
++      return -1;
++    }
+ 
+   if (__builtin_expect (__fxstat64 (_STAT_VER, fd, &st), 0) < 0)
+     goto close_unlock_return;
+@@ -325,6 +329,7 @@ __open_catalog (const char *cat_name, const char *nlspath, const char *env_var,
+   /* Release the lock again.  */
+  close_unlock_return:
+   close_not_cancel_no_status (fd);
++  free (buf);
+ 
+   return result;
+ }
+diff --git a/catgets/tst-catgets.c b/catgets/tst-catgets.c
+index a0a4089..0886938 100644
+--- a/catgets/tst-catgets.c
++++ b/catgets/tst-catgets.c
+@@ -1,7 +1,10 @@
++#include <assert.h>
+ #include <mcheck.h>
+ #include <nl_types.h>
+ #include <stdio.h>
++#include <stdlib.h>
+ #include <string.h>
++#include <sys/resource.h>
+ 
+ 
+ static const char *msgs[] =
+@@ -12,6 +15,33 @@ static const char *msgs[] =
+ };
+ #define nmsgs (sizeof (msgs) / sizeof (msgs[0]))
+ 
++
++/* Test for unbounded alloca.  */
++static int
++do_bz17905 (void)
++{
++  char *buf;
++  struct rlimit rl;
++  nl_catd result;
++
++  const int sz = 1024 * 1024;
++
++  getrlimit (RLIMIT_STACK, &rl);
++  rl.rlim_cur = sz;
++  setrlimit (RLIMIT_STACK, &rl);
++
++  buf = malloc (sz + 1);
++  memset (buf, 'A', sz);
++  buf[sz] = '\0';
++  setenv ("NLSPATH", buf, 1);
++
++  result = catopen (buf, NL_CAT_LOCALE);
++  assert (result == (nl_catd) -1);
++
++  free (buf);
++  return 0;
++}
++
+ #define ROUNDS 5
+ 
+ static int
+@@ -62,6 +92,7 @@ do_test (void)
+ 	}
+     }
+ 
++  result += do_bz17905 ();
+   return result;
+ }
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-core/glibc/glibc_2.22.bb b/meta/recipes-core/glibc/glibc_2.22.bb
index eeb9742..eb967a4 100644
--- a/meta/recipes-core/glibc/glibc_2.22.bb
+++ b/meta/recipes-core/glibc/glibc_2.22.bb
@@ -43,6 +43,8 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0028-Clear-ELF_RTYPE_CLASS_EXTERN_PROTECTED_DATA-for-prel.patch \
            file://strcoll-Remove-incorrect-STRDIFF-based-optimization-.patch \
            file://0029-fix-getmntent-empty-lines.patch \
+           file://0030-Always-enable-pointer-guard-BZ-18928-CVE-2015-8777.patch \
+           file://0031-Fix-catopen-multiple-unbounded-stack-allocations-BZ-.patch \
 "
 
 SRC_URI += "\
-- 
1.9.1


