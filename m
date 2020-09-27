Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.5927.1601177495467707815
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Sep 2020 20:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: yongxin.liu@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 08R3UZgk020184
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Sat, 26 Sep 2020 20:30:46 -0700
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.40) with Microsoft SMTP Server id 14.3.487.0; Sat, 26 Sep 2020
 20:30:24 -0700
From: "Yongxin Liu" <yongxin.liu@windriver.com>
To: <anuj.mittal@intel.com>, <richard.purdie@linuxfoundation.org>,
        <openembedded-core@lists.openembedded.org>
CC: <Randy.MacLeod@windriver.com>
Subject: [OE-core][PATCH] grub: fix several CVEs in grub 2.04
Date: Sun, 27 Sep 2020 11:29:04 +0800
Message-ID: <20200927032904.42942-1-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Content-Type: text/plain

Backport patches from https://git.savannah.gnu.org/git/grub.git
to fix some CVEs. Here is the list.

CVE-2020-10713:
0001-yylex-Make-lexer-fatal-errors-actually-be-fatal.patch

CVE-2020-14308:
0002-calloc-Make-sure-we-always-have-an-overflow-checking.patch
0003-lvm-Add-LVM-cache-logical-volume-handling.patch
0004-calloc-Use-calloc-at-most-places.patch

CVE-2020-14309, CVE-2020-14310, CVE-2020-14311:
0005-safemath-Add-some-arithmetic-primitives-that-check-f.patch
0006-malloc-Use-overflow-checking-primitives-where-we-do-.patch

CVE-2020-15706:
0007-script-Remove-unused-fields-from-grub_script_functio.patch
0008-script-Avoid-a-use-after-free-when-redefining-a-func.patch

CVE-2020-15707:
0009-linux-Fix-integer-overflows-in-initrd-size-handling.patch

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
---
 ...Make-lexer-fatal-errors-actually-be-fatal.patch |   73 +
 ...-sure-we-always-have-an-overflow-checking.patch |  246 +++
 ...lvm-Add-LVM-cache-logical-volume-handling.patch |  287 +++
 .../0004-calloc-Use-calloc-at-most-places.patch    | 1859 ++++++++++++++++++++
 ...d-some-arithmetic-primitives-that-check-f.patch |   94 +
 ...overflow-checking-primitives-where-we-do-.patch | 1326 ++++++++++++++
 ...ve-unused-fields-from-grub_script_functio.patch |   37 +
 ...d-a-use-after-free-when-redefining-a-func.patch |  113 ++
 ...integer-overflows-in-initrd-size-handling.patch |  173 ++
 meta/recipes-bsp/grub/grub2.inc                    |    9 +
 10 files changed, 4217 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0001-yylex-Make-lexer-fatal-errors-actually-be-fatal.patch
 create mode 100644 meta/recipes-bsp/grub/files/0002-calloc-Make-sure-we-always-have-an-overflow-checking.patch
 create mode 100644 meta/recipes-bsp/grub/files/0003-lvm-Add-LVM-cache-logical-volume-handling.patch
 create mode 100644 meta/recipes-bsp/grub/files/0004-calloc-Use-calloc-at-most-places.patch
 create mode 100644 meta/recipes-bsp/grub/files/0005-safemath-Add-some-arithmetic-primitives-that-check-f.patch
 create mode 100644 meta/recipes-bsp/grub/files/0006-malloc-Use-overflow-checking-primitives-where-we-do-.patch
 create mode 100644 meta/recipes-bsp/grub/files/0007-script-Remove-unused-fields-from-grub_script_functio.patch
 create mode 100644 meta/recipes-bsp/grub/files/0008-script-Avoid-a-use-after-free-when-redefining-a-func.patch
 create mode 100644 meta/recipes-bsp/grub/files/0009-linux-Fix-integer-overflows-in-initrd-size-handling.patch

diff --git a/meta/recipes-bsp/grub/files/0001-yylex-Make-lexer-fatal-errors-actually-be-fatal.patch b/meta/recipes-bsp/grub/files/0001-yylex-Make-lexer-fatal-errors-actually-be-fatal.patch
new file mode 100644
index 0000000000..f9be4ef055
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0001-yylex-Make-lexer-fatal-errors-actually-be-fatal.patch
@@ -0,0 +1,73 @@
+From dc1b7b6c8204d717c29ed5a3ae4f24920d127eff Mon Sep 17 00:00:00 2001
+From: Peter Jones <pjones@redhat.com>
+Date: Wed, 15 Apr 2020 15:45:02 -0400
+Subject: [PATCH 1/9] yylex: Make lexer fatal errors actually be fatal
+
+When presented with a command that can't be tokenized to anything
+smaller than YYLMAX characters, the parser calls YY_FATAL_ERROR(errmsg),
+expecting that will stop further processing, as such:
+
+  #define YY_DO_BEFORE_ACTION \
+        yyg->yytext_ptr = yy_bp; \
+        yyleng = (int) (yy_cp - yy_bp); \
+        yyg->yy_hold_char = *yy_cp; \
+        *yy_cp = '\0'; \
+        if ( yyleng >= YYLMAX ) \
+                YY_FATAL_ERROR( "token too large, exceeds YYLMAX" ); \
+        yy_flex_strncpy( yytext, yyg->yytext_ptr, yyleng + 1 , yyscanner); \
+        yyg->yy_c_buf_p = yy_cp;
+
+The code flex generates expects that YY_FATAL_ERROR() will either return
+for it or do some form of longjmp(), or handle the error in some way at
+least, and so the strncpy() call isn't in an "else" clause, and thus if
+YY_FATAL_ERROR() is *not* actually fatal, it does the call with the
+questionable limit, and predictable results ensue.
+
+Unfortunately, our implementation of YY_FATAL_ERROR() is:
+
+   #define YY_FATAL_ERROR(msg)                     \
+     do {                                          \
+       grub_printf (_("fatal error: %s\n"), _(msg));     \
+     } while (0)
+
+The same pattern exists in yyless(), and similar problems exist in users
+of YY_INPUT(), several places in the main parsing loop,
+yy_get_next_buffer(), yy_load_buffer_state(), yyensure_buffer_stack,
+yy_scan_buffer(), etc.
+
+All of these callers expect YY_FATAL_ERROR() to actually be fatal, and
+the things they do if it returns after calling it are wildly unsafe.
+
+Fixes: CVE-2020-10713
+
+Upstream-Status: Backport [commit a4d3fbdff1e3ca8f87642af2ac8752c30c617a3e
+from https://git.savannah.gnu.org/git/grub.git]
+
+Signed-off-by: Peter Jones <pjones@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
+---
+ grub-core/script/yylex.l | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/grub-core/script/yylex.l b/grub-core/script/yylex.l
+index 7b44c37..b7203c8 100644
+--- a/grub-core/script/yylex.l
++++ b/grub-core/script/yylex.l
+@@ -37,11 +37,11 @@
+ 
+ /* 
+  * As we don't have access to yyscanner, we cannot do much except to
+- * print the fatal error.
++ * print the fatal error and exit.
+  */
+ #define YY_FATAL_ERROR(msg)                     \
+   do {                                          \
+-    grub_printf (_("fatal error: %s\n"), _(msg));     \
++    grub_fatal (_("fatal error: %s\n"), _(msg));\
+   } while (0)
+ 
+ #define COPY(str, hint)                         \
+-- 
+2.14.4
+
diff --git a/meta/recipes-bsp/grub/files/0002-calloc-Make-sure-we-always-have-an-overflow-checking.patch b/meta/recipes-bsp/grub/files/0002-calloc-Make-sure-we-always-have-an-overflow-checking.patch
new file mode 100644
index 0000000000..c9536e68ef
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0002-calloc-Make-sure-we-always-have-an-overflow-checking.patch
@@ -0,0 +1,246 @@
+From c005f62f5c4b26a77b916c8f76a852324439ecb3 Mon Sep 17 00:00:00 2001
+From: Peter Jones <pjones@redhat.com>
+Date: Mon, 15 Jun 2020 12:15:29 -0400
+Subject: [PATCH 2/9] calloc: Make sure we always have an overflow-checking
+ calloc() available
+
+This tries to make sure that everywhere in this source tree, we always have
+an appropriate version of calloc() (i.e. grub_calloc(), xcalloc(), etc.)
+available, and that they all safely check for overflow and return NULL when
+it would occur.
+
+Upstream-Status: Backport [commit 64e26162ebfe68317c143ca5ec996c892019f8f8
+from https://git.savannah.gnu.org/git/grub.git]
+
+Signed-off-by: Peter Jones <pjones@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
+---
+ grub-core/kern/emu/misc.c          | 12 ++++++++++++
+ grub-core/kern/emu/mm.c            | 10 ++++++++++
+ grub-core/kern/mm.c                | 40 ++++++++++++++++++++++++++++++++++++++
+ grub-core/lib/libgcrypt_wrap/mem.c | 11 +++++++++--
+ grub-core/lib/posix_wrap/stdlib.h  |  8 +++++++-
+ include/grub/emu/misc.h            |  1 +
+ include/grub/mm.h                  |  6 ++++++
+ 7 files changed, 85 insertions(+), 3 deletions(-)
+
+diff --git a/grub-core/kern/emu/misc.c b/grub-core/kern/emu/misc.c
+index 65db79b..dfd8a8e 100644
+--- a/grub-core/kern/emu/misc.c
++++ b/grub-core/kern/emu/misc.c
+@@ -85,6 +85,18 @@ grub_util_error (const char *fmt, ...)
+   exit (1);
+ }
+ 
++void *
++xcalloc (grub_size_t nmemb, grub_size_t size)
++{
++  void *p;
++
++  p = calloc (nmemb, size);
++  if (!p)
++    grub_util_error ("%s", _("out of memory"));
++
++  return p;
++}
++
+ void *
+ xmalloc (grub_size_t size)
+ {
+diff --git a/grub-core/kern/emu/mm.c b/grub-core/kern/emu/mm.c
+index f262e95..145b01d 100644
+--- a/grub-core/kern/emu/mm.c
++++ b/grub-core/kern/emu/mm.c
+@@ -25,6 +25,16 @@
+ #include <string.h>
+ #include <grub/i18n.h>
+ 
++void *
++grub_calloc (grub_size_t nmemb, grub_size_t size)
++{
++  void *ret;
++  ret = calloc (nmemb, size);
++  if (!ret)
++    grub_error (GRUB_ERR_OUT_OF_MEMORY, N_("out of memory"));
++  return ret;
++}
++
+ void *
+ grub_malloc (grub_size_t size)
+ {
+diff --git a/grub-core/kern/mm.c b/grub-core/kern/mm.c
+index ee88ff6..f2822a8 100644
+--- a/grub-core/kern/mm.c
++++ b/grub-core/kern/mm.c
+@@ -67,8 +67,10 @@
+ #include <grub/dl.h>
+ #include <grub/i18n.h>
+ #include <grub/mm_private.h>
++#include <grub/safemath.h>
+ 
+ #ifdef MM_DEBUG
++# undef grub_calloc
+ # undef grub_malloc
+ # undef grub_zalloc
+ # undef grub_realloc
+@@ -375,6 +377,30 @@ grub_memalign (grub_size_t align, grub_size_t size)
+   return 0;
+ }
+ 
++/*
++ * Allocate NMEMB instances of SIZE bytes and return the pointer, or error on
++ * integer overflow.
++ */
++void *
++grub_calloc (grub_size_t nmemb, grub_size_t size)
++{
++  void *ret;
++  grub_size_t sz = 0;
++
++  if (grub_mul (nmemb, size, &sz))
++    {
++      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is detected"));
++      return NULL;
++    }
++
++  ret = grub_memalign (0, sz);
++  if (!ret)
++    return NULL;
++
++  grub_memset (ret, 0, sz);
++  return ret;
++}
++
+ /* Allocate SIZE bytes and return the pointer.  */
+ void *
+ grub_malloc (grub_size_t size)
+@@ -561,6 +587,20 @@ grub_mm_dump (unsigned lineno)
+   grub_printf ("\n");
+ }
+ 
++void *
++grub_debug_calloc (const char *file, int line, grub_size_t nmemb, grub_size_t size)
++{
++  void *ptr;
++
++  if (grub_mm_debug)
++    grub_printf ("%s:%d: calloc (0x%" PRIxGRUB_SIZE ", 0x%" PRIxGRUB_SIZE ") = ",
++		 file, line, size);
++  ptr = grub_calloc (nmemb, size);
++  if (grub_mm_debug)
++    grub_printf ("%p\n", ptr);
++  return ptr;
++}
++
+ void *
+ grub_debug_malloc (const char *file, int line, grub_size_t size)
+ {
+diff --git a/grub-core/lib/libgcrypt_wrap/mem.c b/grub-core/lib/libgcrypt_wrap/mem.c
+index beeb661..74c6eaf 100644
+--- a/grub-core/lib/libgcrypt_wrap/mem.c
++++ b/grub-core/lib/libgcrypt_wrap/mem.c
+@@ -4,6 +4,7 @@
+ #include <grub/crypto.h>
+ #include <grub/dl.h>
+ #include <grub/env.h>
++#include <grub/safemath.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -36,7 +37,10 @@ void *
+ gcry_xcalloc (size_t n, size_t m)
+ {
+   void *ret;
+-  ret = grub_zalloc (n * m);
++  size_t sz;
++  if (grub_mul (n, m, &sz))
++    grub_fatal ("gcry_xcalloc would overflow");
++  ret = grub_zalloc (sz);
+   if (!ret)
+     grub_fatal ("gcry_xcalloc failed");
+   return ret;
+@@ -56,7 +60,10 @@ void *
+ gcry_xcalloc_secure (size_t n, size_t m)
+ {
+   void *ret;
+-  ret = grub_zalloc (n * m);
++  size_t sz;
++  if (grub_mul (n, m, &sz))
++    grub_fatal ("gcry_xcalloc would overflow");
++  ret = grub_zalloc (sz);
+   if (!ret)
+     grub_fatal ("gcry_xcalloc failed");
+   return ret;
+diff --git a/grub-core/lib/posix_wrap/stdlib.h b/grub-core/lib/posix_wrap/stdlib.h
+index 3b46f47..7a8d385 100644
+--- a/grub-core/lib/posix_wrap/stdlib.h
++++ b/grub-core/lib/posix_wrap/stdlib.h
+@@ -21,6 +21,7 @@
+ 
+ #include <grub/mm.h>
+ #include <grub/misc.h>
++#include <grub/safemath.h>
+ 
+ static inline void 
+ free (void *ptr)
+@@ -37,7 +38,12 @@ malloc (grub_size_t size)
+ static inline void *
+ calloc (grub_size_t size, grub_size_t nelem)
+ {
+-  return grub_zalloc (size * nelem);
++  grub_size_t sz;
++
++  if (grub_mul (size, nelem, &sz))
++    return NULL;
++
++  return grub_zalloc (sz);
+ }
+ 
+ static inline void *
+diff --git a/include/grub/emu/misc.h b/include/grub/emu/misc.h
+index ce464cf..ff9c48a 100644
+--- a/include/grub/emu/misc.h
++++ b/include/grub/emu/misc.h
+@@ -47,6 +47,7 @@ grub_util_device_is_mapped (const char *dev);
+ #define GRUB_HOST_PRIuLONG_LONG "llu"
+ #define GRUB_HOST_PRIxLONG_LONG "llx"
+ 
++void * EXPORT_FUNC(xcalloc) (grub_size_t nmemb, grub_size_t size) WARN_UNUSED_RESULT;
+ void * EXPORT_FUNC(xmalloc) (grub_size_t size) WARN_UNUSED_RESULT;
+ void * EXPORT_FUNC(xrealloc) (void *ptr, grub_size_t size) WARN_UNUSED_RESULT;
+ char * EXPORT_FUNC(xstrdup) (const char *str) WARN_UNUSED_RESULT;
+diff --git a/include/grub/mm.h b/include/grub/mm.h
+index 28e2e53..9c38dd3 100644
+--- a/include/grub/mm.h
++++ b/include/grub/mm.h
+@@ -29,6 +29,7 @@
+ #endif
+ 
+ void grub_mm_init_region (void *addr, grub_size_t size);
++void *EXPORT_FUNC(grub_calloc) (grub_size_t nmemb, grub_size_t size);
+ void *EXPORT_FUNC(grub_malloc) (grub_size_t size);
+ void *EXPORT_FUNC(grub_zalloc) (grub_size_t size);
+ void EXPORT_FUNC(grub_free) (void *ptr);
+@@ -48,6 +49,9 @@ extern int EXPORT_VAR(grub_mm_debug);
+ void grub_mm_dump_free (void);
+ void grub_mm_dump (unsigned lineno);
+ 
++#define grub_calloc(nmemb, size)	\
++  grub_debug_calloc (GRUB_FILE, __LINE__, nmemb, size)
++
+ #define grub_malloc(size)	\
+   grub_debug_malloc (GRUB_FILE, __LINE__, size)
+ 
+@@ -63,6 +67,8 @@ void grub_mm_dump (unsigned lineno);
+ #define grub_free(ptr)	\
+   grub_debug_free (GRUB_FILE, __LINE__, ptr)
+ 
++void *EXPORT_FUNC(grub_debug_calloc) (const char *file, int line,
++				      grub_size_t nmemb, grub_size_t size);
+ void *EXPORT_FUNC(grub_debug_malloc) (const char *file, int line,
+ 				      grub_size_t size);
+ void *EXPORT_FUNC(grub_debug_zalloc) (const char *file, int line,
+-- 
+2.14.4
+
diff --git a/meta/recipes-bsp/grub/files/0003-lvm-Add-LVM-cache-logical-volume-handling.patch b/meta/recipes-bsp/grub/files/0003-lvm-Add-LVM-cache-logical-volume-handling.patch
new file mode 100644
index 0000000000..2b8157f592
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0003-lvm-Add-LVM-cache-logical-volume-handling.patch
@@ -0,0 +1,287 @@
+From 8eb02bcb5897b238b29ff762402bb0c3028f0eab Mon Sep 17 00:00:00 2001
+From: Michael Chang <mchang@suse.com>
+Date: Thu, 19 Mar 2020 13:56:13 +0800
+Subject: [PATCH 3/9] lvm: Add LVM cache logical volume handling
+
+The LVM cache logical volume is the logical volume consisting of the original
+and the cache pool logical volume. The original is usually on a larger and
+slower storage device while the cache pool is on a smaller and faster one. The
+performance of the original volume can be improved by storing the frequently
+used data on the cache pool to utilize the greater performance of faster
+device.
+
+The default cache mode "writethrough" ensures that any data written will be
+stored both in the cache and on the origin LV, therefore grub can be straight
+to read the original lv as no data loss is guarenteed.
+
+The second cache mode is "writeback", which delays writing from the cache pool
+back to the origin LV to have increased performance. The drawback is potential
+data loss if losing the associated cache device.
+
+During the boot time grub reads the LVM offline i.e. LVM volumes are not
+activated and mounted, hence it should be fine to read directly from original
+lv since all cached data should have been flushed back in the process of taking
+it offline.
+
+It is also not much helpful to the situation by adding fsync calls to the
+install code. The fsync did not force to write back dirty cache to the original
+device and rather it would update associated cache metadata to complete the
+write transaction with the cache device. IOW the writes to cached blocks still
+go only to the cache device.
+
+To write back dirty cache, as LVM cache did not support dirty cache flush per
+block range, there'no way to do it for file. On the other hand the "cleaner"
+policy is implemented and can be used to write back "all" dirty blocks in a
+cache, which effectively drain all dirty cache gradually to attain and last in
+the "clean" state, which can be useful for shrinking or decommissioning a
+cache. The result and effect is not what we are looking for here.
+
+In conclusion, as it seems no way to enforce file writes to the original
+device, grub may suffer from power failure as it cannot assemble the cache
+device and read the dirty data from it. However since the case is only
+applicable to writeback mode which is sensitive to data lost in nature, I'd
+still like to propose my (relatively simple) patch and treat reading dirty
+cache as improvement.
+
+Upstream-Status: Backport [commit 0454b0445393aafc5600e92ef0c39494e333b135
+from https://git.savannah.gnu.org/git/grub.git]
+
+Signed-off-by: Michael Chang <mchang@suse.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
+---
+ grub-core/disk/lvm.c | 190 +++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 190 insertions(+)
+
+diff --git a/grub-core/disk/lvm.c b/grub-core/disk/lvm.c
+index 7b265c7..dc6b83b 100644
+--- a/grub-core/disk/lvm.c
++++ b/grub-core/disk/lvm.c
+@@ -33,6 +33,14 @@
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
++struct cache_lv
++{
++  struct grub_diskfilter_lv *lv;
++  char *cache_pool;
++  char *origin;
++  struct cache_lv *next;
++};
++
+ 
+ /* Go the string STR and return the number after STR.  *P will point
+    at the number.  In case STR is not found, *P will be NULL and the
+@@ -95,6 +103,34 @@ grub_lvm_check_flag (char *p, const char *str, const char *flag)
+     }
+ }
+ 
++static void
++grub_lvm_free_cache_lvs (struct cache_lv *cache_lvs)
++{
++  struct cache_lv *cache;
++
++  while ((cache = cache_lvs))
++    {
++      cache_lvs = cache_lvs->next;
++
++      if (cache->lv)
++	{
++	  unsigned int i;
++
++	  for (i = 0; i < cache->lv->segment_count; ++i)
++	    if (cache->lv->segments)
++	      grub_free (cache->lv->segments[i].nodes);
++	  grub_free (cache->lv->segments);
++	  grub_free (cache->lv->fullname);
++	  grub_free (cache->lv->idname);
++	  grub_free (cache->lv->name);
++	}
++      grub_free (cache->lv);
++      grub_free (cache->origin);
++      grub_free (cache->cache_pool);
++      grub_free (cache);
++    }
++}
++
+ static struct grub_diskfilter_vg * 
+ grub_lvm_detect (grub_disk_t disk,
+ 		 struct grub_diskfilter_pv_id *id,
+@@ -242,6 +278,8 @@ grub_lvm_detect (grub_disk_t disk,
+ 
+   if (! vg)
+     {
++      struct cache_lv *cache_lvs = NULL;
++
+       /* First time we see this volume group. We've to create the
+ 	 whole volume group structure. */
+       vg = grub_malloc (sizeof (*vg));
+@@ -671,6 +709,106 @@ grub_lvm_detect (grub_disk_t disk,
+ 			  seg->nodes[seg->node_count - 1].name = tmp;
+ 			}
+ 		    }
++		  else if (grub_memcmp (p, "cache\"",
++				   sizeof ("cache\"") - 1) == 0)
++		    {
++		      struct cache_lv *cache = NULL;
++
++		      char *p2, *p3;
++		      grub_size_t sz;
++
++		      cache = grub_zalloc (sizeof (*cache));
++		      if (!cache)
++			goto cache_lv_fail;
++		      cache->lv = grub_zalloc (sizeof (*cache->lv));
++		      if (!cache->lv)
++			goto cache_lv_fail;
++		      grub_memcpy (cache->lv, lv, sizeof (*cache->lv));
++
++		      if (lv->fullname)
++			{
++			  cache->lv->fullname = grub_strdup (lv->fullname);
++			  if (!cache->lv->fullname)
++			    goto cache_lv_fail;
++			}
++		      if (lv->idname)
++			{
++			  cache->lv->idname = grub_strdup (lv->idname);
++			  if (!cache->lv->idname)
++			    goto cache_lv_fail;
++			}
++		      if (lv->name)
++			{
++			  cache->lv->name = grub_strdup (lv->name);
++			  if (!cache->lv->name)
++			    goto cache_lv_fail;
++			}
++
++		      skip_lv = 1;
++
++		      p2 = grub_strstr (p, "cache_pool = \"");
++		      if (!p2)
++			goto cache_lv_fail;
++
++		      p2 = grub_strchr (p2, '"');
++		      if (!p2)
++			goto cache_lv_fail;
++
++		      p3 = ++p2;
++		      p3 = grub_strchr (p3, '"');
++		      if (!p3)
++			goto cache_lv_fail;
++
++		      sz = p3 - p2;
++
++		      cache->cache_pool = grub_malloc (sz + 1);
++		      if (!cache->cache_pool)
++			goto cache_lv_fail;
++		      grub_memcpy (cache->cache_pool, p2, sz);
++		      cache->cache_pool[sz] = '\0';
++
++		      p2 = grub_strstr (p, "origin = \"");
++		      if (!p2)
++			goto cache_lv_fail;
++
++		      p2 = grub_strchr (p2, '"');
++		      if (!p2)
++			goto cache_lv_fail;
++
++		      p3 = ++p2;
++		      p3 = grub_strchr (p3, '"');
++		      if (!p3)
++			goto cache_lv_fail;
++
++		      sz = p3 - p2;
++
++		      cache->origin = grub_malloc (sz + 1);
++		      if (!cache->origin)
++			goto cache_lv_fail;
++		      grub_memcpy (cache->origin, p2, sz);
++		      cache->origin[sz] = '\0';
++
++		      cache->next = cache_lvs;
++		      cache_lvs = cache;
++		      break;
++
++		    cache_lv_fail:
++		      if (cache)
++			{
++			  grub_free (cache->origin);
++			  grub_free (cache->cache_pool);
++			  if (cache->lv)
++			    {
++			      grub_free (cache->lv->fullname);
++			      grub_free (cache->lv->idname);
++			      grub_free (cache->lv->name);
++			    }
++			  grub_free (cache->lv);
++			  grub_free (cache);
++			}
++		      grub_lvm_free_cache_lvs (cache_lvs);
++		      goto fail4;
++		    }
+ 		  else
+ 		    {
+ #ifdef GRUB_UTIL
+@@ -747,6 +885,58 @@ grub_lvm_detect (grub_disk_t disk,
+ 	      }
+ 	
+       }
++
++      {
++	struct cache_lv *cache;
++
++	for (cache = cache_lvs; cache; cache = cache->next)
++	  {
++	    struct grub_diskfilter_lv *lv;
++
++	    for (lv = vg->lvs; lv; lv = lv->next)
++	      if (grub_strcmp (lv->name, cache->origin) == 0)
++		break;
++	    if (lv)
++	      {
++		cache->lv->segments = grub_malloc (lv->segment_count * sizeof (*lv->segments));
++		if (!cache->lv->segments)
++		  {
++		    grub_lvm_free_cache_lvs (cache_lvs);
++		    goto fail4;
++		  }
++		grub_memcpy (cache->lv->segments, lv->segments, lv->segment_count * sizeof (*lv->segments));
++
++		for (i = 0; i < lv->segment_count; ++i)
++		  {
++		    struct grub_diskfilter_node *nodes = lv->segments[i].nodes;
++		    grub_size_t node_count = lv->segments[i].node_count;
++
++		    cache->lv->segments[i].nodes = grub_malloc (node_count * sizeof (*nodes));
++		    if (!cache->lv->segments[i].nodes)
++		      {
++			for (j = 0; j < i; ++j)
++			  grub_free (cache->lv->segments[j].nodes);
++			grub_free (cache->lv->segments);
++			cache->lv->segments = NULL;
++			grub_lvm_free_cache_lvs (cache_lvs);
++			goto fail4;
++		      }
++		    grub_memcpy (cache->lv->segments[i].nodes, nodes, node_count * sizeof (*nodes));
++		  }
++
++		if (cache->lv->segments)
++		  {
++		    cache->lv->segment_count = lv->segment_count;
++		    cache->lv->vg = vg;
++		    cache->lv->next = vg->lvs;
++		    vg->lvs = cache->lv;
++		    cache->lv = NULL;
++		  }
++	      }
++	  }
++      }
++
++      grub_lvm_free_cache_lvs (cache_lvs);
+       if (grub_diskfilter_vg_register (vg))
+ 	goto fail4;
+     }
+-- 
+2.14.4
+
diff --git a/meta/recipes-bsp/grub/files/0004-calloc-Use-calloc-at-most-places.patch b/meta/recipes-bsp/grub/files/0004-calloc-Use-calloc-at-most-places.patch
new file mode 100644
index 0000000000..eb3e42c3af
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0004-calloc-Use-calloc-at-most-places.patch
@@ -0,0 +1,1859 @@
+From bcdd6a55952222ec9829a59348240a4f983b0b56 Mon Sep 17 00:00:00 2001
+From: Peter Jones <pjones@redhat.com>
+Date: Mon, 15 Jun 2020 12:26:01 -0400
+Subject: [PATCH 4/9] calloc: Use calloc() at most places
+
+This modifies most of the places we do some form of:
+
+  X = malloc(Y * Z);
+
+to use calloc(Y, Z) instead.
+
+Among other issues, this fixes:
+  - allocation of integer overflow in grub_png_decode_image_header()
+    reported by Chris Coulson,
+  - allocation of integer overflow in luks_recover_key()
+    reported by Chris Coulson,
+  - allocation of integer overflow in grub_lvm_detect()
+    reported by Chris Coulson.
+
+Fixes: CVE-2020-14308
+
+Upstream-Status: Backport [commit f725fa7cb2ece547c5af01eeeecfe8d95802ed41
+from https://git.savannah.gnu.org/git/grub.git]
+
+Signed-off-by: Peter Jones <pjones@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+[YL: don't patch on grub-core/lib/json/json.c, which is not existing in grub 2.04]
+Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
+---
+ grub-core/bus/usb/usbhub.c                |  8 ++++----
+ grub-core/commands/efi/lsefisystab.c      |  3 ++-
+ grub-core/commands/legacycfg.c            |  6 +++---
+ grub-core/commands/menuentry.c            |  2 +-
+ grub-core/commands/nativedisk.c           |  2 +-
+ grub-core/commands/parttool.c             | 12 +++++++++---
+ grub-core/commands/regexp.c               |  2 +-
+ grub-core/commands/search_wrap.c          |  2 +-
+ grub-core/disk/diskfilter.c               |  4 ++--
+ grub-core/disk/ieee1275/ofdisk.c          |  2 +-
+ grub-core/disk/ldm.c                      | 14 +++++++-------
+ grub-core/disk/luks.c                     |  2 +-
+ grub-core/disk/lvm.c                      | 12 ++++++------
+ grub-core/disk/xen/xendisk.c              |  2 +-
+ grub-core/efiemu/loadcore.c               |  2 +-
+ grub-core/efiemu/mm.c                     |  6 +++---
+ grub-core/font/font.c                     |  3 +--
+ grub-core/fs/affs.c                       |  6 +++---
+ grub-core/fs/btrfs.c                      |  6 +++---
+ grub-core/fs/hfs.c                        |  2 +-
+ grub-core/fs/hfsplus.c                    |  6 +++---
+ grub-core/fs/iso9660.c                    |  2 +-
+ grub-core/fs/ntfs.c                       |  4 ++--
+ grub-core/fs/sfs.c                        |  2 +-
+ grub-core/fs/tar.c                        |  2 +-
+ grub-core/fs/udf.c                        |  4 ++--
+ grub-core/fs/zfs/zfs.c                    |  4 ++--
+ grub-core/gfxmenu/gui_string_util.c       |  2 +-
+ grub-core/gfxmenu/widget-box.c            |  4 ++--
+ grub-core/io/gzio.c                       |  2 +-
+ grub-core/kern/efi/efi.c                  |  6 +++---
+ grub-core/kern/emu/hostdisk.c             |  2 +-
+ grub-core/kern/fs.c                       |  2 +-
+ grub-core/kern/misc.c                     |  2 +-
+ grub-core/kern/parser.c                   |  2 +-
+ grub-core/kern/uboot/uboot.c              |  2 +-
+ grub-core/lib/libgcrypt/cipher/ac.c       |  8 ++++----
+ grub-core/lib/libgcrypt/cipher/primegen.c |  4 ++--
+ grub-core/lib/libgcrypt/cipher/pubkey.c   |  4 ++--
+ grub-core/lib/priority_queue.c            |  2 +-
+ grub-core/lib/reed_solomon.c              |  7 +++----
+ grub-core/lib/relocator.c                 | 10 +++++-----
+ grub-core/lib/zstd/fse_decompress.c       |  2 +-
+ grub-core/loader/arm/linux.c              |  2 +-
+ grub-core/loader/efi/chainloader.c        |  2 +-
+ grub-core/loader/i386/bsdXX.c             |  2 +-
+ grub-core/loader/i386/xnu.c               |  4 ++--
+ grub-core/loader/macho.c                  |  2 +-
+ grub-core/loader/multiboot_elfxx.c        |  2 +-
+ grub-core/loader/xnu.c                    |  2 +-
+ grub-core/mmap/mmap.c                     |  4 ++--
+ grub-core/net/bootp.c                     |  2 +-
+ grub-core/net/dns.c                       | 10 +++++-----
+ grub-core/net/net.c                       |  4 ++--
+ grub-core/normal/charset.c                | 10 +++++-----
+ grub-core/normal/cmdline.c                | 14 +++++++-------
+ grub-core/normal/menu_entry.c             | 14 +++++++-------
+ grub-core/normal/menu_text.c              |  4 ++--
+ grub-core/normal/term.c                   |  4 ++--
+ grub-core/osdep/linux/getroot.c           |  6 +++---
+ grub-core/osdep/unix/config.c             |  2 +-
+ grub-core/osdep/windows/getroot.c         |  2 +-
+ grub-core/osdep/windows/hostdisk.c        |  4 ++--
+ grub-core/osdep/windows/init.c            |  2 +-
+ grub-core/osdep/windows/platform.c        |  4 ++--
+ grub-core/osdep/windows/relpath.c         |  2 +-
+ grub-core/partmap/gpt.c                   |  2 +-
+ grub-core/partmap/msdos.c                 |  2 +-
+ grub-core/script/execute.c                |  2 +-
+ grub-core/tests/fake_input.c              |  2 +-
+ grub-core/tests/video_checksum.c          |  6 +++---
+ grub-core/video/capture.c                 |  2 +-
+ grub-core/video/emu/sdl.c                 |  2 +-
+ grub-core/video/i386/pc/vga.c             |  2 +-
+ grub-core/video/readers/png.c             |  2 +-
+ include/grub/unicode.h                    |  4 ++--
+ util/getroot.c                            |  2 +-
+ util/grub-file.c                          |  2 +-
+ util/grub-fstest.c                        |  4 ++--
+ util/grub-install-common.c                |  2 +-
+ util/grub-install.c                       |  4 ++--
+ util/grub-mkimagexx.c                     |  6 ++----
+ util/grub-mkrescue.c                      |  4 ++--
+ util/grub-mkstandalone.c                  |  2 +-
+ util/grub-pe2elf.c                        | 12 +++++-------
+ util/grub-probe.c                         |  4 ++--
+ 86 files changed, 178 insertions(+), 177 deletions(-)
+
+diff --git a/grub-core/bus/usb/usbhub.c b/grub-core/bus/usb/usbhub.c
+index 34a7ff1..a06cce3 100644
+--- a/grub-core/bus/usb/usbhub.c
++++ b/grub-core/bus/usb/usbhub.c
+@@ -149,8 +149,8 @@ grub_usb_add_hub (grub_usb_device_t dev)
+   grub_usb_set_configuration (dev, 1);
+ 
+   dev->nports = hubdesc.portcnt;
+-  dev->children = grub_zalloc (hubdesc.portcnt * sizeof (dev->children[0]));
+-  dev->ports = grub_zalloc (dev->nports * sizeof (dev->ports[0]));
++  dev->children = grub_calloc (hubdesc.portcnt, sizeof (dev->children[0]));
++  dev->ports = grub_calloc (dev->nports, sizeof (dev->ports[0]));
+   if (!dev->children || !dev->ports)
+     {
+       grub_free (dev->children);
+@@ -268,8 +268,8 @@ grub_usb_controller_dev_register_iter (grub_usb_controller_t controller, void *d
+ 
+   /* Query the number of ports the root Hub has.  */
+   hub->nports = controller->dev->hubports (controller);
+-  hub->devices = grub_zalloc (sizeof (hub->devices[0]) * hub->nports);
+-  hub->ports = grub_zalloc (sizeof (hub->ports[0]) * hub->nports);
++  hub->devices = grub_calloc (hub->nports, sizeof (hub->devices[0]));
++  hub->ports = grub_calloc (hub->nports, sizeof (hub->ports[0]));
+   if (!hub->devices || !hub->ports)
+     {
+       grub_free (hub->devices);
+diff --git a/grub-core/commands/efi/lsefisystab.c b/grub-core/commands/efi/lsefisystab.c
+index df10302..cd81507 100644
+--- a/grub-core/commands/efi/lsefisystab.c
++++ b/grub-core/commands/efi/lsefisystab.c
+@@ -71,7 +71,8 @@ grub_cmd_lsefisystab (struct grub_command *cmd __attribute__ ((unused)),
+     grub_printf ("Vendor: ");
+     
+     for (vendor_utf16 = st->firmware_vendor; *vendor_utf16; vendor_utf16++);
+-    vendor = grub_malloc (4 * (vendor_utf16 - st->firmware_vendor) + 1);
++    /* Allocate extra 3 bytes to simplify math. */
++    vendor = grub_calloc (4, vendor_utf16 - st->firmware_vendor + 1);
+     if (!vendor)
+       return grub_errno;
+     *grub_utf16_to_utf8 ((grub_uint8_t *) vendor, st->firmware_vendor,
+diff --git a/grub-core/commands/legacycfg.c b/grub-core/commands/legacycfg.c
+index db7a8f0..5e3ec0d 100644
+--- a/grub-core/commands/legacycfg.c
++++ b/grub-core/commands/legacycfg.c
+@@ -314,7 +314,7 @@ grub_cmd_legacy_kernel (struct grub_command *mycmd __attribute__ ((unused)),
+   if (argc < 2)
+     return grub_error (GRUB_ERR_BAD_ARGUMENT, N_("filename expected"));
+ 
+-  cutargs = grub_malloc (sizeof (cutargs[0]) * (argc - 1));
++  cutargs = grub_calloc (argc - 1, sizeof (cutargs[0]));
+   if (!cutargs)
+     return grub_errno;
+   cutargc = argc - 1;
+@@ -436,7 +436,7 @@ grub_cmd_legacy_kernel (struct grub_command *mycmd __attribute__ ((unused)),
+ 	    {
+ 	      char rbuf[3] = "-r";
+ 	      bsdargc = cutargc + 2;
+-	      bsdargs = grub_malloc (sizeof (bsdargs[0]) * bsdargc);
++	      bsdargs = grub_calloc (bsdargc, sizeof (bsdargs[0]));
+ 	      if (!bsdargs)
+ 		{
+ 		  err = grub_errno;
+@@ -559,7 +559,7 @@ grub_cmd_legacy_initrdnounzip (struct grub_command *mycmd __attribute__ ((unused
+ 	return grub_error (GRUB_ERR_BAD_ARGUMENT, N_("can't find command `%s'"),
+ 			   "module");
+ 
+-      newargs = grub_malloc ((argc + 1) * sizeof (newargs[0]));
++      newargs = grub_calloc (argc + 1, sizeof (newargs[0]));
+       if (!newargs)
+ 	return grub_errno;
+       grub_memcpy (newargs + 1, args, argc * sizeof (newargs[0]));
+diff --git a/grub-core/commands/menuentry.c b/grub-core/commands/menuentry.c
+index 2c5363d..9164df7 100644
+--- a/grub-core/commands/menuentry.c
++++ b/grub-core/commands/menuentry.c
+@@ -154,7 +154,7 @@ grub_normal_add_menu_entry (int argc, const char **args,
+     goto fail;
+ 
+   /* Save argc, args to pass as parameters to block arg later. */
+-  menu_args = grub_malloc (sizeof (char*) * (argc + 1));
++  menu_args = grub_calloc (argc + 1, sizeof (char *));
+   if (! menu_args)
+     goto fail;
+ 
+diff --git a/grub-core/commands/nativedisk.c b/grub-core/commands/nativedisk.c
+index 699447d..7c8f97f 100644
+--- a/grub-core/commands/nativedisk.c
++++ b/grub-core/commands/nativedisk.c
+@@ -195,7 +195,7 @@ grub_cmd_nativedisk (grub_command_t cmd __attribute__ ((unused)),
+   else
+     path_prefix = prefix;
+ 
+-  mods = grub_malloc (argc * sizeof (mods[0]));
++  mods = grub_calloc (argc, sizeof (mods[0]));
+   if (!mods)
+     return grub_errno;
+ 
+diff --git a/grub-core/commands/parttool.c b/grub-core/commands/parttool.c
+index 22b46b1..051e313 100644
+--- a/grub-core/commands/parttool.c
++++ b/grub-core/commands/parttool.c
+@@ -59,7 +59,13 @@ grub_parttool_register(const char *part_name,
+   for (nargs = 0; args[nargs].name != 0; nargs++);
+   cur->nargs = nargs;
+   cur->args = (struct grub_parttool_argdesc *)
+-    grub_malloc ((nargs + 1) * sizeof (struct grub_parttool_argdesc));
++    grub_calloc (nargs + 1, sizeof (struct grub_parttool_argdesc));
++  if (!cur->args)
++    {
++      grub_free (cur);
++      curhandle--;
++      return -1;
++    }
+   grub_memcpy (cur->args, args,
+ 	       (nargs + 1) * sizeof (struct grub_parttool_argdesc));
+ 
+@@ -257,7 +263,7 @@ grub_cmd_parttool (grub_command_t cmd __attribute__ ((unused)),
+ 	return err;
+       }
+ 
+-  parsed = (int *) grub_zalloc (argc * sizeof (int));
++  parsed = (int *) grub_calloc (argc, sizeof (int));
+ 
+   for (i = 1; i < argc; i++)
+     if (! parsed[i])
+@@ -290,7 +296,7 @@ grub_cmd_parttool (grub_command_t cmd __attribute__ ((unused)),
+ 	  }
+ 	ptool = cur;
+ 	pargs = (struct grub_parttool_args *)
+-	  grub_zalloc (ptool->nargs * sizeof (struct grub_parttool_args));
++	  grub_calloc (ptool->nargs, sizeof (struct grub_parttool_args));
+ 	for (j = i; j < argc; j++)
+ 	  if (! parsed[j])
+ 	    {
+diff --git a/grub-core/commands/regexp.c b/grub-core/commands/regexp.c
+index f00b184..4019164 100644
+--- a/grub-core/commands/regexp.c
++++ b/grub-core/commands/regexp.c
+@@ -116,7 +116,7 @@ grub_cmd_regexp (grub_extcmd_context_t ctxt, int argc, char **args)
+   if (ret)
+     goto fail;
+ 
+-  matches = grub_zalloc (sizeof (*matches) * (regex.re_nsub + 1));
++  matches = grub_calloc (regex.re_nsub + 1, sizeof (*matches));
+   if (! matches)
+     goto fail;
+ 
+diff --git a/grub-core/commands/search_wrap.c b/grub-core/commands/search_wrap.c
+index d7fd26b..47fc8eb 100644
+--- a/grub-core/commands/search_wrap.c
++++ b/grub-core/commands/search_wrap.c
+@@ -122,7 +122,7 @@ grub_cmd_search (grub_extcmd_context_t ctxt, int argc, char **args)
+     for (i = 0; state[SEARCH_HINT_BAREMETAL].args[i]; i++)
+       nhints++;
+ 
+-  hints = grub_malloc (sizeof (hints[0]) * nhints);
++  hints = grub_calloc (nhints, sizeof (hints[0]));
+   if (!hints)
+     return grub_errno;
+   j = 0;
+diff --git a/grub-core/disk/diskfilter.c b/grub-core/disk/diskfilter.c
+index c3b578a..68ca9e0 100644
+--- a/grub-core/disk/diskfilter.c
++++ b/grub-core/disk/diskfilter.c
+@@ -1134,7 +1134,7 @@ grub_diskfilter_make_raid (grub_size_t uuidlen, char *uuid, int nmemb,
+   array->lvs->segments->node_count = nmemb;
+   array->lvs->segments->raid_member_size = disk_size;
+   array->lvs->segments->nodes
+-    = grub_zalloc (nmemb * sizeof (array->lvs->segments->nodes[0]));
++    = grub_calloc (nmemb, sizeof (array->lvs->segments->nodes[0]));
+   array->lvs->segments->stripe_size = stripe_size;
+   for (i = 0; i < nmemb; i++)
+     {
+@@ -1226,7 +1226,7 @@ insert_array (grub_disk_t disk, const struct grub_diskfilter_pv_id *id,
+ 	  grub_partition_t p;
+ 	  for (p = disk->partition; p; p = p->parent)
+ 	    s++;
+-	  pv->partmaps = xmalloc (s * sizeof (pv->partmaps[0]));
++	  pv->partmaps = xcalloc (s, sizeof (pv->partmaps[0]));
+ 	  s = 0;
+ 	  for (p = disk->partition; p; p = p->parent)
+ 	    pv->partmaps[s++] = xstrdup (p->partmap->name);
+diff --git a/grub-core/disk/ieee1275/ofdisk.c b/grub-core/disk/ieee1275/ofdisk.c
+index f73257e..03674cb 100644
+--- a/grub-core/disk/ieee1275/ofdisk.c
++++ b/grub-core/disk/ieee1275/ofdisk.c
+@@ -297,7 +297,7 @@ dev_iterate (const struct grub_ieee1275_devalias *alias)
+       /* Power machines documentation specify 672 as maximum SAS disks in
+          one system. Using a slightly larger value to be safe. */
+       table_size = 768;
+-      table = grub_malloc (table_size * sizeof (grub_uint64_t));
++      table = grub_calloc (table_size, sizeof (grub_uint64_t));
+ 
+       if (!table)
+         {
+diff --git a/grub-core/disk/ldm.c b/grub-core/disk/ldm.c
+index 2a22d2d..e632370 100644
+--- a/grub-core/disk/ldm.c
++++ b/grub-core/disk/ldm.c
+@@ -323,8 +323,8 @@ make_vg (grub_disk_t disk,
+ 	  lv->segments->type = GRUB_DISKFILTER_MIRROR;
+ 	  lv->segments->node_count = 0;
+ 	  lv->segments->node_alloc = 8;
+-	  lv->segments->nodes = grub_zalloc (sizeof (*lv->segments->nodes)
+-					     * lv->segments->node_alloc);
++	  lv->segments->nodes = grub_calloc (lv->segments->node_alloc,
++					     sizeof (*lv->segments->nodes));
+ 	  if (!lv->segments->nodes)
+ 	    goto fail2;
+ 	  ptr = vblk[i].dynamic;
+@@ -543,8 +543,8 @@ make_vg (grub_disk_t disk,
+ 	    {
+ 	      comp->segment_alloc = 8;
+ 	      comp->segment_count = 0;
+-	      comp->segments = grub_malloc (sizeof (*comp->segments)
+-					    * comp->segment_alloc);
++	      comp->segments = grub_calloc (comp->segment_alloc,
++					    sizeof (*comp->segments));
+ 	      if (!comp->segments)
+ 		goto fail2;
+ 	    }
+@@ -590,8 +590,8 @@ make_vg (grub_disk_t disk,
+ 		}
+ 	      comp->segments->node_count = read_int (ptr + 1, *ptr);
+ 	      comp->segments->node_alloc = comp->segments->node_count;
+-	      comp->segments->nodes = grub_zalloc (sizeof (*comp->segments->nodes)
+-						   * comp->segments->node_alloc);
++	      comp->segments->nodes = grub_calloc (comp->segments->node_alloc,
++						   sizeof (*comp->segments->nodes));
+ 	      if (!lv->segments->nodes)
+ 		goto fail2;
+ 	    }
+@@ -1017,7 +1017,7 @@ grub_util_ldm_embed (struct grub_disk *disk, unsigned int *nsectors,
+       *nsectors = lv->size;
+       if (*nsectors > max_nsectors)
+ 	*nsectors = max_nsectors;
+-      *sectors = grub_malloc (*nsectors * sizeof (**sectors));
++      *sectors = grub_calloc (*nsectors, sizeof (**sectors));
+       if (!*sectors)
+ 	return grub_errno;
+       for (i = 0; i < *nsectors; i++)
+diff --git a/grub-core/disk/luks.c b/grub-core/disk/luks.c
+index 86c50c6..18b3a8b 100644
+--- a/grub-core/disk/luks.c
++++ b/grub-core/disk/luks.c
+@@ -336,7 +336,7 @@ luks_recover_key (grub_disk_t source,
+ 	&& grub_be_to_cpu32 (header.keyblock[i].stripes) > max_stripes)
+       max_stripes = grub_be_to_cpu32 (header.keyblock[i].stripes);
+ 
+-  split_key = grub_malloc (keysize * max_stripes);
++  split_key = grub_calloc (keysize, max_stripes);
+   if (!split_key)
+     return grub_errno;
+ 
+diff --git a/grub-core/disk/lvm.c b/grub-core/disk/lvm.c
+index dc6b83b..7b5fbbc 100644
+--- a/grub-core/disk/lvm.c
++++ b/grub-core/disk/lvm.c
+@@ -209,7 +209,7 @@ grub_lvm_detect (grub_disk_t disk,
+      first one.  */
+ 
+   /* Allocate buffer space for the circular worst-case scenario. */
+-  metadatabuf = grub_malloc (2 * mda_size);
++  metadatabuf = grub_calloc (2, mda_size);
+   if (! metadatabuf)
+     goto fail;
+ 
+@@ -464,7 +464,7 @@ grub_lvm_detect (grub_disk_t disk,
+ #endif
+ 		  goto lvs_fail;
+ 		}
+-	      lv->segments = grub_zalloc (sizeof (*seg) * lv->segment_count);
++	      lv->segments = grub_calloc (lv->segment_count, sizeof (*seg));
+ 	      seg = lv->segments;
+ 
+ 	      for (i = 0; i < lv->segment_count; i++)
+@@ -521,8 +521,8 @@ grub_lvm_detect (grub_disk_t disk,
+ 		      if (seg->node_count != 1)
+ 			seg->stripe_size = grub_lvm_getvalue (&p, "stripe_size = ");
+ 
+-		      seg->nodes = grub_zalloc (sizeof (*stripe)
+-						* seg->node_count);
++		      seg->nodes = grub_calloc (seg->node_count,
++						sizeof (*stripe));
+ 		      stripe = seg->nodes;
+ 
+ 		      p = grub_strstr (p, "stripes = [");
+@@ -898,7 +898,7 @@ grub_lvm_detect (grub_disk_t disk,
+ 		break;
+ 	    if (lv)
+ 	      {
+-		cache->lv->segments = grub_malloc (lv->segment_count * sizeof (*lv->segments));
++		cache->lv->segments = grub_calloc (lv->segment_count, sizeof (*lv->segments));
+ 		if (!cache->lv->segments)
+ 		  {
+ 		    grub_lvm_free_cache_lvs (cache_lvs);
+@@ -911,7 +911,7 @@ grub_lvm_detect (grub_disk_t disk,
+ 		    struct grub_diskfilter_node *nodes = lv->segments[i].nodes;
+ 		    grub_size_t node_count = lv->segments[i].node_count;
+ 
+-		    cache->lv->segments[i].nodes = grub_malloc (node_count * sizeof (*nodes));
++		    cache->lv->segments[i].nodes = grub_calloc (node_count, sizeof (*nodes));
+ 		    if (!cache->lv->segments[i].nodes)
+ 		      {
+ 			for (j = 0; j < i; ++j)
+diff --git a/grub-core/disk/xen/xendisk.c b/grub-core/disk/xen/xendisk.c
+index 48476cb..d6612ee 100644
+--- a/grub-core/disk/xen/xendisk.c
++++ b/grub-core/disk/xen/xendisk.c
+@@ -426,7 +426,7 @@ grub_xendisk_init (void)
+   if (!ctr)
+     return;
+ 
+-  virtdisks = grub_malloc (ctr * sizeof (virtdisks[0]));
++  virtdisks = grub_calloc (ctr, sizeof (virtdisks[0]));
+   if (!virtdisks)
+     return;
+   if (grub_xenstore_dir ("device/vbd", fill, &ctr))
+diff --git a/grub-core/efiemu/loadcore.c b/grub-core/efiemu/loadcore.c
+index 44085ef..2b92462 100644
+--- a/grub-core/efiemu/loadcore.c
++++ b/grub-core/efiemu/loadcore.c
+@@ -201,7 +201,7 @@ grub_efiemu_count_symbols (const Elf_Ehdr *e)
+ 
+   grub_efiemu_nelfsyms = (unsigned) s->sh_size / (unsigned) s->sh_entsize;
+   grub_efiemu_elfsyms = (struct grub_efiemu_elf_sym *)
+-    grub_malloc (sizeof (struct grub_efiemu_elf_sym) * grub_efiemu_nelfsyms);
++    grub_calloc (grub_efiemu_nelfsyms, sizeof (struct grub_efiemu_elf_sym));
+ 
+   /* Relocators */
+   for (i = 0, s = (Elf_Shdr *) ((char *) e + e->e_shoff);
+diff --git a/grub-core/efiemu/mm.c b/grub-core/efiemu/mm.c
+index 52a032f..9b8e0d0 100644
+--- a/grub-core/efiemu/mm.c
++++ b/grub-core/efiemu/mm.c
+@@ -554,11 +554,11 @@ grub_efiemu_mmap_sort_and_uniq (void)
+   /* Initialize variables*/
+   grub_memset (present, 0, sizeof (int) * GRUB_EFI_MAX_MEMORY_TYPE);
+   scanline_events = (struct grub_efiemu_mmap_scan *)
+-    grub_malloc (sizeof (struct grub_efiemu_mmap_scan) * 2 * mmap_num);
++    grub_calloc (mmap_num, sizeof (struct grub_efiemu_mmap_scan) * 2);
+ 
+   /* Number of chunks can't increase more than by factor of 2 */
+   result = (grub_efi_memory_descriptor_t *)
+-    grub_malloc (sizeof (grub_efi_memory_descriptor_t) * 2 * mmap_num);
++    grub_calloc (mmap_num, sizeof (grub_efi_memory_descriptor_t) * 2);
+   if (!result || !scanline_events)
+     {
+       grub_free (result);
+@@ -660,7 +660,7 @@ grub_efiemu_mm_do_alloc (void)
+ 
+   /* Preallocate mmap */
+   efiemu_mmap = (grub_efi_memory_descriptor_t *)
+-    grub_malloc (mmap_reserved_size * sizeof (grub_efi_memory_descriptor_t));
++    grub_calloc (mmap_reserved_size, sizeof (grub_efi_memory_descriptor_t));
+   if (!efiemu_mmap)
+     {
+       grub_efiemu_unload ();
+diff --git a/grub-core/font/font.c b/grub-core/font/font.c
+index 85a2925..8e118b3 100644
+--- a/grub-core/font/font.c
++++ b/grub-core/font/font.c
+@@ -293,8 +293,7 @@ load_font_index (grub_file_t file, grub_uint32_t sect_length, struct
+   font->num_chars = sect_length / FONT_CHAR_INDEX_ENTRY_SIZE;
+ 
+   /* Allocate the character index array.  */
+-  font->char_index = grub_malloc (font->num_chars
+-				  * sizeof (struct char_index_entry));
++  font->char_index = grub_calloc (font->num_chars, sizeof (struct char_index_entry));
+   if (!font->char_index)
+     return 1;
+   font->bmp_idx = grub_malloc (0x10000 * sizeof (grub_uint16_t));
+diff --git a/grub-core/fs/affs.c b/grub-core/fs/affs.c
+index 6b6a2bc..220b371 100644
+--- a/grub-core/fs/affs.c
++++ b/grub-core/fs/affs.c
+@@ -301,7 +301,7 @@ grub_affs_read_symlink (grub_fshelp_node_t node)
+       return 0;
+     }
+   latin1[symlink_size] = 0;
+-  utf8 = grub_malloc (symlink_size * GRUB_MAX_UTF8_PER_LATIN1 + 1);
++  utf8 = grub_calloc (GRUB_MAX_UTF8_PER_LATIN1 + 1, symlink_size);
+   if (!utf8)
+     {
+       grub_free (latin1);
+@@ -422,7 +422,7 @@ grub_affs_iterate_dir (grub_fshelp_node_t dir,
+ 	return 1;
+     }
+ 
+-  hashtable = grub_zalloc (data->htsize * sizeof (*hashtable));
++  hashtable = grub_calloc (data->htsize, sizeof (*hashtable));
+   if (!hashtable)
+     return 1;
+ 
+@@ -628,7 +628,7 @@ grub_affs_label (grub_device_t device, char **label)
+       len = file.namelen;
+       if (len > sizeof (file.name))
+ 	len = sizeof (file.name);
+-      *label = grub_malloc (len * GRUB_MAX_UTF8_PER_LATIN1 + 1);
++      *label = grub_calloc (GRUB_MAX_UTF8_PER_LATIN1 + 1, len);
+       if (*label)
+ 	*grub_latin1_to_utf8 ((grub_uint8_t *) *label, file.name, len) = '\0';
+     }
+diff --git a/grub-core/fs/btrfs.c b/grub-core/fs/btrfs.c
+index 48bd3d0..11272ef 100644
+--- a/grub-core/fs/btrfs.c
++++ b/grub-core/fs/btrfs.c
+@@ -413,7 +413,7 @@ lower_bound (struct grub_btrfs_data *data,
+     {
+       desc->allocated = 16;
+       desc->depth = 0;
+-      desc->data = grub_malloc (sizeof (desc->data[0]) * desc->allocated);
++      desc->data = grub_calloc (desc->allocated, sizeof (desc->data[0]));
+       if (!desc->data)
+ 	return grub_errno;
+     }
+@@ -752,7 +752,7 @@ raid56_read_retry (struct grub_btrfs_data *data,
+   grub_err_t ret = GRUB_ERR_OUT_OF_MEMORY;
+   grub_uint64_t i, failed_devices;
+ 
+-  buffers = grub_zalloc (sizeof(*buffers) * nstripes);
++  buffers = grub_calloc (nstripes, sizeof (*buffers));
+   if (!buffers)
+     goto cleanup;
+ 
+@@ -2160,7 +2160,7 @@ grub_btrfs_embed (grub_device_t device __attribute__ ((unused)),
+   *nsectors = 64 * 2 - 1;
+   if (*nsectors > max_nsectors)
+     *nsectors = max_nsectors;
+-  *sectors = grub_malloc (*nsectors * sizeof (**sectors));
++  *sectors = grub_calloc (*nsectors, sizeof (**sectors));
+   if (!*sectors)
+     return grub_errno;
+   for (i = 0; i < *nsectors; i++)
+diff --git a/grub-core/fs/hfs.c b/grub-core/fs/hfs.c
+index ac0a409..3fe842b 100644
+--- a/grub-core/fs/hfs.c
++++ b/grub-core/fs/hfs.c
+@@ -1360,7 +1360,7 @@ grub_hfs_label (grub_device_t device, char **label)
+       grub_size_t len = data->sblock.volname[0];
+       if (len > sizeof (data->sblock.volname) - 1)
+ 	len = sizeof (data->sblock.volname) - 1;
+-      *label = grub_malloc (len * MAX_UTF8_PER_MAC_ROMAN + 1);
++      *label = grub_calloc (MAX_UTF8_PER_MAC_ROMAN + 1, len);
+       if (*label)
+ 	macroman_to_utf8 (*label, data->sblock.volname + 1,
+ 			  len + 1, 0);
+diff --git a/grub-core/fs/hfsplus.c b/grub-core/fs/hfsplus.c
+index 54786bb..dae43be 100644
+--- a/grub-core/fs/hfsplus.c
++++ b/grub-core/fs/hfsplus.c
+@@ -720,7 +720,7 @@ list_nodes (void *record, void *hook_arg)
+   if (! filename)
+     return 0;
+ 
+-  keyname = grub_malloc (grub_be_to_cpu16 (catkey->namelen) * sizeof (*keyname));
++  keyname = grub_calloc (grub_be_to_cpu16 (catkey->namelen), sizeof (*keyname));
+   if (!keyname)
+     {
+       grub_free (filename);
+@@ -1007,7 +1007,7 @@ grub_hfsplus_label (grub_device_t device, char **label)
+     grub_hfsplus_btree_recptr (&data->catalog_tree, node, ptr);
+ 
+   label_len = grub_be_to_cpu16 (catkey->namelen);
+-  label_name = grub_malloc (label_len * sizeof (*label_name));
++  label_name = grub_calloc (label_len, sizeof (*label_name));
+   if (!label_name)
+     {
+       grub_free (node);
+@@ -1029,7 +1029,7 @@ grub_hfsplus_label (grub_device_t device, char **label)
+ 	}
+     }
+ 
+-  *label = grub_malloc (label_len * GRUB_MAX_UTF8_PER_UTF16 + 1);
++  *label = grub_calloc (label_len, GRUB_MAX_UTF8_PER_UTF16 + 1);
+   if (! *label)
+     {
+       grub_free (label_name);
+diff --git a/grub-core/fs/iso9660.c b/grub-core/fs/iso9660.c
+index 49c0c63..4f1b52a 100644
+--- a/grub-core/fs/iso9660.c
++++ b/grub-core/fs/iso9660.c
+@@ -331,7 +331,7 @@ grub_iso9660_convert_string (grub_uint8_t *us, int len)
+   int i;
+   grub_uint16_t t[MAX_NAMELEN / 2 + 1];
+ 
+-  p = grub_malloc (len * GRUB_MAX_UTF8_PER_UTF16 + 1);
++  p = grub_calloc (len, GRUB_MAX_UTF8_PER_UTF16 + 1);
+   if (! p)
+     return NULL;
+ 
+diff --git a/grub-core/fs/ntfs.c b/grub-core/fs/ntfs.c
+index fc4e1f6..2f34f76 100644
+--- a/grub-core/fs/ntfs.c
++++ b/grub-core/fs/ntfs.c
+@@ -556,8 +556,8 @@ get_utf8 (grub_uint8_t *in, grub_size_t len)
+   grub_uint16_t *tmp;
+   grub_size_t i;
+ 
+-  buf = grub_malloc (len * GRUB_MAX_UTF8_PER_UTF16 + 1);
+-  tmp = grub_malloc (len * sizeof (tmp[0]));
++  buf = grub_calloc (len, GRUB_MAX_UTF8_PER_UTF16 + 1);
++  tmp = grub_calloc (len, sizeof (tmp[0]));
+   if (!buf || !tmp)
+     {
+       grub_free (buf);
+diff --git a/grub-core/fs/sfs.c b/grub-core/fs/sfs.c
+index 50c1fe7..90f7fb3 100644
+--- a/grub-core/fs/sfs.c
++++ b/grub-core/fs/sfs.c
+@@ -266,7 +266,7 @@ grub_sfs_read_block (grub_fshelp_node_t node, grub_disk_addr_t fileblock)
+       node->next_extent = node->block;
+       node->cache_size = 0;
+ 
+-      node->cache = grub_malloc (sizeof (node->cache[0]) * cache_size);
++      node->cache = grub_calloc (cache_size, sizeof (node->cache[0]));
+       if (!node->cache)
+ 	{
+ 	  grub_errno = 0;
+diff --git a/grub-core/fs/tar.c b/grub-core/fs/tar.c
+index 7d63e0c..c551ed6 100644
+--- a/grub-core/fs/tar.c
++++ b/grub-core/fs/tar.c
+@@ -120,7 +120,7 @@ grub_cpio_find_file (struct grub_archelp_data *data, char **name,
+ 	  if (data->linkname_alloc < linksize + 1)
+ 	    {
+ 	      char *n;
+-	      n = grub_malloc (2 * (linksize + 1));
++	      n = grub_calloc (2, linksize + 1);
+ 	      if (!n)
+ 		return grub_errno;
+ 	      grub_free (data->linkname);
+diff --git a/grub-core/fs/udf.c b/grub-core/fs/udf.c
+index dc8b6e2..a837616 100644
+--- a/grub-core/fs/udf.c
++++ b/grub-core/fs/udf.c
+@@ -873,7 +873,7 @@ read_string (const grub_uint8_t *raw, grub_size_t sz, char *outbuf)
+     {
+       unsigned i;
+       utf16len = sz - 1;
+-      utf16 = grub_malloc (utf16len * sizeof (utf16[0]));
++      utf16 = grub_calloc (utf16len, sizeof (utf16[0]));
+       if (!utf16)
+ 	return NULL;
+       for (i = 0; i < utf16len; i++)
+@@ -883,7 +883,7 @@ read_string (const grub_uint8_t *raw, grub_size_t sz, char *outbuf)
+     {
+       unsigned i;
+       utf16len = (sz - 1) / 2;
+-      utf16 = grub_malloc (utf16len * sizeof (utf16[0]));
++      utf16 = grub_calloc (utf16len, sizeof (utf16[0]));
+       if (!utf16)
+ 	return NULL;
+       for (i = 0; i < utf16len; i++)
+diff --git a/grub-core/fs/zfs/zfs.c b/grub-core/fs/zfs/zfs.c
+index 2f72e42..381dde5 100644
+--- a/grub-core/fs/zfs/zfs.c
++++ b/grub-core/fs/zfs/zfs.c
+@@ -3325,7 +3325,7 @@ dnode_get_fullpath (const char *fullpath, struct subvolume *subvol,
+ 	}
+       subvol->nkeys = 0;
+       zap_iterate (&keychain_dn, 8, count_zap_keys, &ctx, data);
+-      subvol->keyring = grub_zalloc (subvol->nkeys * sizeof (subvol->keyring[0]));
++      subvol->keyring = grub_calloc (subvol->nkeys, sizeof (subvol->keyring[0]));
+       if (!subvol->keyring)
+ 	{
+ 	  grub_free (fsname);
+@@ -4336,7 +4336,7 @@ grub_zfs_embed (grub_device_t device __attribute__ ((unused)),
+   *nsectors = (VDEV_BOOT_SIZE >> GRUB_DISK_SECTOR_BITS);
+   if (*nsectors > max_nsectors)
+     *nsectors = max_nsectors;
+-  *sectors = grub_malloc (*nsectors * sizeof (**sectors));
++  *sectors = grub_calloc (*nsectors, sizeof (**sectors));
+   if (!*sectors)
+     return grub_errno;
+   for (i = 0; i < *nsectors; i++)
+diff --git a/grub-core/gfxmenu/gui_string_util.c b/grub-core/gfxmenu/gui_string_util.c
+index a9a415e..ba1e1ea 100644
+--- a/grub-core/gfxmenu/gui_string_util.c
++++ b/grub-core/gfxmenu/gui_string_util.c
+@@ -55,7 +55,7 @@ canonicalize_path (const char *path)
+     if (*p == '/')
+       components++;
+ 
+-  char **path_array = grub_malloc (components * sizeof (*path_array));
++  char **path_array = grub_calloc (components, sizeof (*path_array));
+   if (! path_array)
+     return 0;
+ 
+diff --git a/grub-core/gfxmenu/widget-box.c b/grub-core/gfxmenu/widget-box.c
+index b606028..470597d 100644
+--- a/grub-core/gfxmenu/widget-box.c
++++ b/grub-core/gfxmenu/widget-box.c
+@@ -303,10 +303,10 @@ grub_gfxmenu_create_box (const char *pixmaps_prefix,
+   box->content_height = 0;
+   box->raw_pixmaps =
+     (struct grub_video_bitmap **)
+-    grub_malloc (BOX_NUM_PIXMAPS * sizeof (struct grub_video_bitmap *));
++    grub_calloc (BOX_NUM_PIXMAPS, sizeof (struct grub_video_bitmap *));
+   box->scaled_pixmaps =
+     (struct grub_video_bitmap **)
+-    grub_malloc (BOX_NUM_PIXMAPS * sizeof (struct grub_video_bitmap *));
++    grub_calloc (BOX_NUM_PIXMAPS, sizeof (struct grub_video_bitmap *));
+ 
+   /* Initialize all pixmap pointers to NULL so that proper destruction can
+      be performed if an error is encountered partway through construction.  */
+diff --git a/grub-core/io/gzio.c b/grub-core/io/gzio.c
+index 6208a97..43d98a7 100644
+--- a/grub-core/io/gzio.c
++++ b/grub-core/io/gzio.c
+@@ -554,7 +554,7 @@ huft_build (unsigned *b,	/* code lengths in bits (all assumed <= BMAX) */
+ 	      z = 1 << j;	/* table entries for j-bit table */
+ 
+ 	      /* allocate and link in new table */
+-	      q = (struct huft *) grub_zalloc ((z + 1) * sizeof (struct huft));
++	      q = (struct huft *) grub_calloc (z + 1, sizeof (struct huft));
+ 	      if (! q)
+ 		{
+ 		  if (h)
+diff --git a/grub-core/kern/efi/efi.c b/grub-core/kern/efi/efi.c
+index 6e1ceb9..dc31caa 100644
+--- a/grub-core/kern/efi/efi.c
++++ b/grub-core/kern/efi/efi.c
+@@ -202,7 +202,7 @@ grub_efi_set_variable(const char *var, const grub_efi_guid_t *guid,
+ 
+   len = grub_strlen (var);
+   len16 = len * GRUB_MAX_UTF16_PER_UTF8;
+-  var16 = grub_malloc ((len16 + 1) * sizeof (var16[0]));
++  var16 = grub_calloc (len16 + 1, sizeof (var16[0]));
+   if (!var16)
+     return grub_errno;
+   len16 = grub_utf8_to_utf16 (var16, len16, (grub_uint8_t *) var, len, NULL);
+@@ -237,7 +237,7 @@ grub_efi_get_variable (const char *var, const grub_efi_guid_t *guid,
+ 
+   len = grub_strlen (var);
+   len16 = len * GRUB_MAX_UTF16_PER_UTF8;
+-  var16 = grub_malloc ((len16 + 1) * sizeof (var16[0]));
++  var16 = grub_calloc (len16 + 1, sizeof (var16[0]));
+   if (!var16)
+     return NULL;
+   len16 = grub_utf8_to_utf16 (var16, len16, (grub_uint8_t *) var, len, NULL);
+@@ -383,7 +383,7 @@ grub_efi_get_filename (grub_efi_device_path_t *dp0)
+ 	  while (len > 0 && fp->path_name[len - 1] == 0)
+ 	    len--;
+ 
+-	  dup_name = grub_malloc (len * sizeof (*dup_name));
++	  dup_name = grub_calloc (len, sizeof (*dup_name));
+ 	  if (!dup_name)
+ 	    {
+ 	      grub_free (name);
+diff --git a/grub-core/kern/emu/hostdisk.c b/grub-core/kern/emu/hostdisk.c
+index e9ec680..d975265 100644
+--- a/grub-core/kern/emu/hostdisk.c
++++ b/grub-core/kern/emu/hostdisk.c
+@@ -615,7 +615,7 @@ static char *
+ grub_util_path_concat_real (size_t n, int ext, va_list ap)
+ {
+   size_t totlen = 0;
+-  char **l = xmalloc ((n + ext) * sizeof (l[0]));
++  char **l = xcalloc (n + ext, sizeof (l[0]));
+   char *r, *p, *pi;
+   size_t i;
+   int first = 1;
+diff --git a/grub-core/kern/fs.c b/grub-core/kern/fs.c
+index 2b85f49..f90be65 100644
+--- a/grub-core/kern/fs.c
++++ b/grub-core/kern/fs.c
+@@ -151,7 +151,7 @@ grub_fs_blocklist_open (grub_file_t file, const char *name)
+   while (p);
+ 
+   /* Allocate a block list.  */
+-  blocks = grub_zalloc (sizeof (struct grub_fs_block) * (num + 1));
++  blocks = grub_calloc (num + 1, sizeof (struct grub_fs_block));
+   if (! blocks)
+     return 0;
+ 
+diff --git a/grub-core/kern/misc.c b/grub-core/kern/misc.c
+index 3b633d5..a7abd36 100644
+--- a/grub-core/kern/misc.c
++++ b/grub-core/kern/misc.c
+@@ -690,7 +690,7 @@ parse_printf_args (const char *fmt0, struct printf_args *args,
+     args->ptr = args->prealloc;
+   else
+     {
+-      args->ptr = grub_malloc (args->count * sizeof (args->ptr[0]));
++      args->ptr = grub_calloc (args->count, sizeof (args->ptr[0]));
+       if (!args->ptr)
+ 	{
+ 	  grub_errno = GRUB_ERR_NONE;
+diff --git a/grub-core/kern/parser.c b/grub-core/kern/parser.c
+index 78175aa..619db31 100644
+--- a/grub-core/kern/parser.c
++++ b/grub-core/kern/parser.c
+@@ -213,7 +213,7 @@ grub_parser_split_cmdline (const char *cmdline,
+     return grub_errno;
+   grub_memcpy (args, buffer, bp - buffer);
+ 
+-  *argv = grub_malloc (sizeof (char *) * (*argc + 1));
++  *argv = grub_calloc (*argc + 1, sizeof (char *));
+   if (!*argv)
+     {
+       grub_free (args);
+diff --git a/grub-core/kern/uboot/uboot.c b/grub-core/kern/uboot/uboot.c
+index be4816f..aac8f9a 100644
+--- a/grub-core/kern/uboot/uboot.c
++++ b/grub-core/kern/uboot/uboot.c
+@@ -133,7 +133,7 @@ grub_uboot_dev_enum (void)
+     return num_devices;
+ 
+   max_devices = 2;
+-  enum_devices = grub_malloc (sizeof(struct device_info) * max_devices);
++  enum_devices = grub_calloc (max_devices, sizeof(struct device_info));
+   if (!enum_devices)
+     return 0;
+ 
+diff --git a/grub-core/lib/libgcrypt/cipher/ac.c b/grub-core/lib/libgcrypt/cipher/ac.c
+index f5e946a..63f6fcd 100644
+--- a/grub-core/lib/libgcrypt/cipher/ac.c
++++ b/grub-core/lib/libgcrypt/cipher/ac.c
+@@ -185,7 +185,7 @@ ac_data_mpi_copy (gcry_ac_mpi_t *data_mpis, unsigned int data_mpis_n,
+   gcry_mpi_t mpi;
+   char *label;
+ 
+-  data_mpis_new = gcry_malloc (sizeof (*data_mpis_new) * data_mpis_n);
++  data_mpis_new = gcry_calloc (data_mpis_n, sizeof (*data_mpis_new));
+   if (! data_mpis_new)
+     {
+       err = gcry_error_from_errno (errno);
+@@ -572,7 +572,7 @@ _gcry_ac_data_to_sexp (gcry_ac_data_t data, gcry_sexp_t *sexp,
+     }
+ 
+   /* Add MPI list.  */
+-  arg_list = gcry_malloc (sizeof (*arg_list) * (data_n + 1));
++  arg_list = gcry_calloc (data_n + 1, sizeof (*arg_list));
+   if (! arg_list)
+     {
+       err = gcry_error_from_errno (errno);
+@@ -1283,7 +1283,7 @@ ac_data_construct (const char *identifier, int include_flags,
+   /* We build a list of arguments to pass to
+      gcry_sexp_build_array().  */
+   data_length = _gcry_ac_data_length (data);
+-  arg_list = gcry_malloc (sizeof (*arg_list) * (data_length * 2));
++  arg_list = gcry_calloc (data_length, sizeof (*arg_list) * 2);
+   if (! arg_list)
+     {
+       err = gcry_error_from_errno (errno);
+@@ -1593,7 +1593,7 @@ _gcry_ac_key_pair_generate (gcry_ac_handle_t handle, unsigned int nbits,
+ 	arg_list_n += 2;
+ 
+   /* Allocate list.  */
+-  arg_list = gcry_malloc (sizeof (*arg_list) * arg_list_n);
++  arg_list = gcry_calloc (arg_list_n, sizeof (*arg_list));
+   if (! arg_list)
+     {
+       err = gcry_error_from_errno (errno);
+diff --git a/grub-core/lib/libgcrypt/cipher/primegen.c b/grub-core/lib/libgcrypt/cipher/primegen.c
+index 2788e34..b12e79b 100644
+--- a/grub-core/lib/libgcrypt/cipher/primegen.c
++++ b/grub-core/lib/libgcrypt/cipher/primegen.c
+@@ -383,7 +383,7 @@ prime_generate_internal (int need_q_factor,
+     }
+ 
+   /* Allocate an array to track pool usage. */
+-  pool_in_use = gcry_malloc (n * sizeof *pool_in_use);
++  pool_in_use = gcry_calloc (n, sizeof *pool_in_use);
+   if (!pool_in_use)
+     {
+       err = gpg_err_code_from_errno (errno);
+@@ -765,7 +765,7 @@ gen_prime (unsigned int nbits, int secret, int randomlevel,
+   if (nbits < 16)
+     log_fatal ("can't generate a prime with less than %d bits\n", 16);
+ 
+-  mods = gcry_xmalloc( no_of_small_prime_numbers * sizeof *mods );
++  mods = gcry_xcalloc( no_of_small_prime_numbers, sizeof *mods);
+   /* Make nbits fit into gcry_mpi_t implementation. */
+   val_2  = mpi_alloc_set_ui( 2 );
+   val_3 = mpi_alloc_set_ui( 3);
+diff --git a/grub-core/lib/libgcrypt/cipher/pubkey.c b/grub-core/lib/libgcrypt/cipher/pubkey.c
+index 9109821..ca087ad 100644
+--- a/grub-core/lib/libgcrypt/cipher/pubkey.c
++++ b/grub-core/lib/libgcrypt/cipher/pubkey.c
+@@ -2941,7 +2941,7 @@ gcry_pk_encrypt (gcry_sexp_t *r_ciph, gcry_sexp_t s_data, gcry_sexp_t s_pkey)
+        * array to a format string, so we have to do it this way :-(.  */
+       /* FIXME: There is now such a format specifier, so we can
+          change the code to be more clear. */
+-      arg_list = malloc (nelem * sizeof *arg_list);
++      arg_list = calloc (nelem, sizeof *arg_list);
+       if (!arg_list)
+         {
+           rc = gpg_err_code_from_syserror ();
+@@ -3233,7 +3233,7 @@ gcry_pk_sign (gcry_sexp_t *r_sig, gcry_sexp_t s_hash, gcry_sexp_t s_skey)
+         }
+       strcpy (p, "))");
+ 
+-      arg_list = malloc (nelem * sizeof *arg_list);
++      arg_list = calloc (nelem, sizeof *arg_list);
+       if (!arg_list)
+         {
+           rc = gpg_err_code_from_syserror ();
+diff --git a/grub-core/lib/priority_queue.c b/grub-core/lib/priority_queue.c
+index 659be0b..7d5e7c0 100644
+--- a/grub-core/lib/priority_queue.c
++++ b/grub-core/lib/priority_queue.c
+@@ -92,7 +92,7 @@ grub_priority_queue_new (grub_size_t elsize,
+ {
+   struct grub_priority_queue *ret;
+   void *els;
+-  els = grub_malloc (elsize * 8);
++  els = grub_calloc (8, elsize);
+   if (!els)
+     return 0;
+   ret = (struct grub_priority_queue *) grub_malloc (sizeof (*ret));
+diff --git a/grub-core/lib/reed_solomon.c b/grub-core/lib/reed_solomon.c
+index ee9fa7b..467305b 100644
+--- a/grub-core/lib/reed_solomon.c
++++ b/grub-core/lib/reed_solomon.c
+@@ -20,6 +20,7 @@
+ #include <stdio.h>
+ #include <string.h>
+ #include <stdlib.h>
++#define xcalloc calloc
+ #define xmalloc malloc
+ #define grub_memset memset
+ #define grub_memcpy memcpy
+@@ -158,11 +159,9 @@ rs_encode (gf_single_t *data, grub_size_t s, grub_size_t rs)
+   gf_single_t *rs_polynomial;
+   int i, j;
+   gf_single_t *m;
+-  m = xmalloc ((s + rs) * sizeof (gf_single_t));
++  m = xcalloc (s + rs, sizeof (gf_single_t));
+   grub_memcpy (m, data, s * sizeof (gf_single_t));
+-  grub_memset (m + s, 0, rs * sizeof (gf_single_t));
+-  rs_polynomial = xmalloc ((rs + 1) * sizeof (gf_single_t));
+-  grub_memset (rs_polynomial, 0, (rs + 1) * sizeof (gf_single_t));
++  rs_polynomial = xcalloc (rs + 1, sizeof (gf_single_t));
+   rs_polynomial[rs] = 1;
+   /* Multiply with X - a^r */
+   for (j = 0; j < rs; j++)
+diff --git a/grub-core/lib/relocator.c b/grub-core/lib/relocator.c
+index ea3ebc7..5847aac 100644
+--- a/grub-core/lib/relocator.c
++++ b/grub-core/lib/relocator.c
+@@ -495,9 +495,9 @@ malloc_in_range (struct grub_relocator *rel,
+   }
+ #endif
+ 
+-  eventt = grub_malloc (maxevents * sizeof (events[0]));
++  eventt = grub_calloc (maxevents, sizeof (events[0]));
+   counter = grub_malloc ((DIGITSORT_MASK + 2) * sizeof (counter[0]));
+-  events = grub_malloc (maxevents * sizeof (events[0]));
++  events = grub_calloc (maxevents, sizeof (events[0]));
+   if (!events || !eventt || !counter)
+     {
+       grub_dprintf ("relocator", "events or counter allocation failed %d\n",
+@@ -963,7 +963,7 @@ malloc_in_range (struct grub_relocator *rel,
+ #endif
+     unsigned cural = 0;
+     int oom = 0;
+-    res->subchunks = grub_malloc (sizeof (res->subchunks[0]) * nallocs);
++    res->subchunks = grub_calloc (nallocs, sizeof (res->subchunks[0]));
+     if (!res->subchunks)
+       oom = 1;
+     res->nsubchunks = nallocs;
+@@ -1562,8 +1562,8 @@ grub_relocator_prepare_relocs (struct grub_relocator *rel, grub_addr_t addr,
+ 	    count[(chunk->src & 0xff) + 1]++;
+ 	  }
+     }
+-    from = grub_malloc (nchunks * sizeof (sorted[0]));
+-    to = grub_malloc (nchunks * sizeof (sorted[0]));
++    from = grub_calloc (nchunks, sizeof (sorted[0]));
++    to = grub_calloc (nchunks, sizeof (sorted[0]));
+     if (!from || !to)
+       {
+ 	grub_free (from);
+diff --git a/grub-core/lib/zstd/fse_decompress.c b/grub-core/lib/zstd/fse_decompress.c
+index 72bbead..2227b84 100644
+--- a/grub-core/lib/zstd/fse_decompress.c
++++ b/grub-core/lib/zstd/fse_decompress.c
+@@ -82,7 +82,7 @@
+ FSE_DTable* FSE_createDTable (unsigned tableLog)
+ {
+     if (tableLog > FSE_TABLELOG_ABSOLUTE_MAX) tableLog = FSE_TABLELOG_ABSOLUTE_MAX;
+-    return (FSE_DTable*)malloc( FSE_DTABLE_SIZE_U32(tableLog) * sizeof (U32) );
++    return (FSE_DTable*)calloc( FSE_DTABLE_SIZE_U32(tableLog), sizeof (U32) );
+ }
+ 
+ void FSE_freeDTable (FSE_DTable* dt)
+diff --git a/grub-core/loader/arm/linux.c b/grub-core/loader/arm/linux.c
+index 5168491..d70c174 100644
+--- a/grub-core/loader/arm/linux.c
++++ b/grub-core/loader/arm/linux.c
+@@ -78,7 +78,7 @@ linux_prepare_atag (void *target_atag)
+ 
+   /* some place for cmdline, initrd and terminator.  */
+   tmp_size = get_atag_size (atag_orig) + 20 + (arg_size) / 4;
+-  tmp_atag = grub_malloc (tmp_size * sizeof (grub_uint32_t));
++  tmp_atag = grub_calloc (tmp_size, sizeof (grub_uint32_t));
+   if (!tmp_atag)
+     return grub_errno;
+ 
+diff --git a/grub-core/loader/efi/chainloader.c b/grub-core/loader/efi/chainloader.c
+index cd92ea3..daf8c6b 100644
+--- a/grub-core/loader/efi/chainloader.c
++++ b/grub-core/loader/efi/chainloader.c
+@@ -116,7 +116,7 @@ copy_file_path (grub_efi_file_path_device_path_t *fp,
+   fp->header.type = GRUB_EFI_MEDIA_DEVICE_PATH_TYPE;
+   fp->header.subtype = GRUB_EFI_FILE_PATH_DEVICE_PATH_SUBTYPE;
+ 
+-  path_name = grub_malloc (len * GRUB_MAX_UTF16_PER_UTF8 * sizeof (*path_name));
++  path_name = grub_calloc (len, GRUB_MAX_UTF16_PER_UTF8 * sizeof (*path_name));
+   if (!path_name)
+     return;
+ 
+diff --git a/grub-core/loader/i386/bsdXX.c b/grub-core/loader/i386/bsdXX.c
+index af6741d..a8d8bf7 100644
+--- a/grub-core/loader/i386/bsdXX.c
++++ b/grub-core/loader/i386/bsdXX.c
+@@ -48,7 +48,7 @@ read_headers (grub_file_t file, const char *filename, Elf_Ehdr *e, char **shdr)
+   if (e->e_ident[EI_CLASS] != SUFFIX (ELFCLASS))
+     return grub_error (GRUB_ERR_BAD_OS, N_("invalid arch-dependent ELF magic"));
+ 
+-  *shdr = grub_malloc ((grub_uint32_t) e->e_shnum * e->e_shentsize);
++  *shdr = grub_calloc (e->e_shnum, e->e_shentsize);
+   if (! *shdr)
+     return grub_errno;
+ 
+diff --git a/grub-core/loader/i386/xnu.c b/grub-core/loader/i386/xnu.c
+index e64ed08..b7d176b 100644
+--- a/grub-core/loader/i386/xnu.c
++++ b/grub-core/loader/i386/xnu.c
+@@ -295,7 +295,7 @@ grub_xnu_devprop_add_property_utf8 (struct grub_xnu_devprop_device_descriptor *d
+     return grub_errno;
+ 
+   len = grub_strlen (name);
+-  utf16 = grub_malloc (sizeof (grub_uint16_t) * len);
++  utf16 = grub_calloc (len, sizeof (grub_uint16_t));
+   if (!utf16)
+     {
+       grub_free (utf8);
+@@ -331,7 +331,7 @@ grub_xnu_devprop_add_property_utf16 (struct grub_xnu_devprop_device_descriptor *
+   grub_uint16_t *utf16;
+   grub_err_t err;
+ 
+-  utf16 = grub_malloc (sizeof (grub_uint16_t) * namelen);
++  utf16 = grub_calloc (namelen, sizeof (grub_uint16_t));
+   if (!utf16)
+     return grub_errno;
+   grub_memcpy (utf16, name, sizeof (grub_uint16_t) * namelen);
+diff --git a/grub-core/loader/macho.c b/grub-core/loader/macho.c
+index 085f9c6..05710c4 100644
+--- a/grub-core/loader/macho.c
++++ b/grub-core/loader/macho.c
+@@ -97,7 +97,7 @@ grub_macho_file (grub_file_t file, const char *filename, int is_64bit)
+       if (grub_file_seek (macho->file, sizeof (struct grub_macho_fat_header))
+ 	  == (grub_off_t) -1)
+ 	goto fail;
+-      archs = grub_malloc (sizeof (struct grub_macho_fat_arch) * narchs);
++      archs = grub_calloc (narchs, sizeof (struct grub_macho_fat_arch));
+       if (!archs)
+ 	goto fail;
+       if (grub_file_read (macho->file, archs,
+diff --git a/grub-core/loader/multiboot_elfxx.c b/grub-core/loader/multiboot_elfxx.c
+index 70cd1db..cc68536 100644
+--- a/grub-core/loader/multiboot_elfxx.c
++++ b/grub-core/loader/multiboot_elfxx.c
+@@ -217,7 +217,7 @@ CONCAT(grub_multiboot_load_elf, XX) (mbi_load_data_t *mld)
+     {
+       grub_uint8_t *shdr, *shdrptr;
+ 
+-      shdr = grub_malloc ((grub_uint32_t) ehdr->e_shnum * ehdr->e_shentsize);
++      shdr = grub_calloc (ehdr->e_shnum, ehdr->e_shentsize);
+       if (!shdr)
+ 	return grub_errno;
+       
+diff --git a/grub-core/loader/xnu.c b/grub-core/loader/xnu.c
+index 7f74d1d..77d7060 100644
+--- a/grub-core/loader/xnu.c
++++ b/grub-core/loader/xnu.c
+@@ -800,7 +800,7 @@ grub_cmd_xnu_mkext (grub_command_t cmd __attribute__ ((unused)),
+   if (grub_be_to_cpu32 (head.magic) == GRUB_MACHO_FAT_MAGIC)
+     {
+       narchs = grub_be_to_cpu32 (head.nfat_arch);
+-      archs = grub_malloc (sizeof (struct grub_macho_fat_arch) * narchs);
++      archs = grub_calloc (narchs, sizeof (struct grub_macho_fat_arch));
+       if (! archs)
+ 	{
+ 	  grub_file_close (file);
+diff --git a/grub-core/mmap/mmap.c b/grub-core/mmap/mmap.c
+index 6a31cba..57b4e9a 100644
+--- a/grub-core/mmap/mmap.c
++++ b/grub-core/mmap/mmap.c
+@@ -143,9 +143,9 @@ grub_mmap_iterate (grub_memory_hook_t hook, void *hook_data)
+ 
+   /* Initialize variables. */
+   ctx.scanline_events = (struct grub_mmap_scan *)
+-    grub_malloc (sizeof (struct grub_mmap_scan) * 2 * mmap_num);
++    grub_calloc (mmap_num, sizeof (struct grub_mmap_scan) * 2);
+ 
+-  present = grub_zalloc (sizeof (present[0]) * current_priority);
++  present = grub_calloc (current_priority, sizeof (present[0]));
+ 
+   if (! ctx.scanline_events || !present)
+     {
+diff --git a/grub-core/net/bootp.c b/grub-core/net/bootp.c
+index 04cfbb0..6539572 100644
+--- a/grub-core/net/bootp.c
++++ b/grub-core/net/bootp.c
+@@ -766,7 +766,7 @@ grub_cmd_bootp (struct grub_command *cmd __attribute__ ((unused)),
+   if (ncards == 0)
+     return grub_error (GRUB_ERR_NET_NO_CARD, N_("no network card found"));
+ 
+-  ifaces = grub_zalloc (ncards * sizeof (ifaces[0]));
++  ifaces = grub_calloc (ncards, sizeof (ifaces[0]));
+   if (!ifaces)
+     return grub_errno;
+ 
+diff --git a/grub-core/net/dns.c b/grub-core/net/dns.c
+index 5d9afe0..e332d5e 100644
+--- a/grub-core/net/dns.c
++++ b/grub-core/net/dns.c
+@@ -285,8 +285,8 @@ recv_hook (grub_net_udp_socket_t sock __attribute__ ((unused)),
+       ptr++;
+       ptr += 4;
+     }
+-  *data->addresses = grub_malloc (sizeof ((*data->addresses)[0])
+-				 * grub_be_to_cpu16 (head->ancount));
++  *data->addresses = grub_calloc (grub_be_to_cpu16 (head->ancount),
++				  sizeof ((*data->addresses)[0]));
+   if (!*data->addresses)
+     {
+       grub_errno = GRUB_ERR_NONE;
+@@ -406,8 +406,8 @@ recv_hook (grub_net_udp_socket_t sock __attribute__ ((unused)),
+       dns_cache[h].addresses = 0;
+       dns_cache[h].name = grub_strdup (data->oname);
+       dns_cache[h].naddresses = *data->naddresses;
+-      dns_cache[h].addresses = grub_malloc (*data->naddresses
+-					    * sizeof (dns_cache[h].addresses[0]));
++      dns_cache[h].addresses = grub_calloc (*data->naddresses,
++					    sizeof (dns_cache[h].addresses[0]));
+       dns_cache[h].limit_time = grub_get_time_ms () + 1000 * ttl_all;
+       if (!dns_cache[h].addresses || !dns_cache[h].name)
+ 	{
+@@ -479,7 +479,7 @@ grub_net_dns_lookup (const char *name,
+ 	}
+     }
+ 
+-  sockets = grub_malloc (sizeof (sockets[0]) * n_servers);
++  sockets = grub_calloc (n_servers, sizeof (sockets[0]));
+   if (!sockets)
+     return grub_errno;
+ 
+diff --git a/grub-core/net/net.c b/grub-core/net/net.c
+index d5d726a..38f19df 100644
+--- a/grub-core/net/net.c
++++ b/grub-core/net/net.c
+@@ -333,8 +333,8 @@ grub_cmd_ipv6_autoconf (struct grub_command *cmd __attribute__ ((unused)),
+     ncards++;
+   }
+ 
+-  ifaces = grub_zalloc (ncards * sizeof (ifaces[0]));
+-  slaacs = grub_zalloc (ncards * sizeof (slaacs[0]));
++  ifaces = grub_calloc (ncards, sizeof (ifaces[0]));
++  slaacs = grub_calloc (ncards, sizeof (slaacs[0]));
+   if (!ifaces || !slaacs)
+     {
+       grub_free (ifaces);
+diff --git a/grub-core/normal/charset.c b/grub-core/normal/charset.c
+index b0ab47d..d57fb72 100644
+--- a/grub-core/normal/charset.c
++++ b/grub-core/normal/charset.c
+@@ -203,7 +203,7 @@ grub_utf8_to_ucs4_alloc (const char *msg, grub_uint32_t **unicode_msg,
+ {
+   grub_size_t msg_len = grub_strlen (msg);
+ 
+-  *unicode_msg = grub_malloc (msg_len * sizeof (grub_uint32_t));
++  *unicode_msg = grub_calloc (msg_len, sizeof (grub_uint32_t));
+  
+   if (!*unicode_msg)
+     return -1;
+@@ -488,7 +488,7 @@ grub_unicode_aglomerate_comb (const grub_uint32_t *in, grub_size_t inlen,
+ 	    }
+ 	  else
+ 	    {
+-	      n = grub_malloc (sizeof (n[0]) * (out->ncomb + 1));
++	      n = grub_calloc (out->ncomb + 1, sizeof (n[0]));
+ 	      if (!n)
+ 		{
+ 		  grub_errno = GRUB_ERR_NONE;
+@@ -842,7 +842,7 @@ grub_bidi_line_logical_to_visual (const grub_uint32_t *logical,
+       }							\
+   }
+ 
+-  visual = grub_malloc (sizeof (visual[0]) * logical_len);
++  visual = grub_calloc (logical_len, sizeof (visual[0]));
+   if (!visual)
+     return -1;
+ 
+@@ -1165,8 +1165,8 @@ grub_bidi_logical_to_visual (const grub_uint32_t *logical,
+ {
+   const grub_uint32_t *line_start = logical, *ptr;
+   struct grub_unicode_glyph *visual_ptr;
+-  *visual_out = visual_ptr = grub_malloc (3 * sizeof (visual_ptr[0])
+-					  * (logical_len + 2));
++  *visual_out = visual_ptr = grub_calloc (logical_len + 2,
++					  3 * sizeof (visual_ptr[0]));
+   if (!visual_ptr)
+     return -1;
+   for (ptr = logical; ptr <= logical + logical_len; ptr++)
+diff --git a/grub-core/normal/cmdline.c b/grub-core/normal/cmdline.c
+index c037d50..c57242e 100644
+--- a/grub-core/normal/cmdline.c
++++ b/grub-core/normal/cmdline.c
+@@ -41,7 +41,7 @@ grub_err_t
+ grub_set_history (int newsize)
+ {
+   grub_uint32_t **old_hist_lines = hist_lines;
+-  hist_lines = grub_malloc (sizeof (grub_uint32_t *) * newsize);
++  hist_lines = grub_calloc (newsize, sizeof (grub_uint32_t *));
+ 
+   /* Copy the old lines into the new buffer.  */
+   if (old_hist_lines)
+@@ -114,7 +114,7 @@ static void
+ grub_history_set (int pos, grub_uint32_t *s, grub_size_t len)
+ {
+   grub_free (hist_lines[pos]);
+-  hist_lines[pos] = grub_malloc ((len + 1) * sizeof (grub_uint32_t));
++  hist_lines[pos] = grub_calloc (len + 1, sizeof (grub_uint32_t));
+   if (!hist_lines[pos])
+     {
+       grub_print_error ();
+@@ -349,7 +349,7 @@ grub_cmdline_get (const char *prompt_translated)
+   char *ret;
+   unsigned nterms;
+ 
+-  buf = grub_malloc (max_len * sizeof (grub_uint32_t));
++  buf = grub_calloc (max_len, sizeof (grub_uint32_t));
+   if (!buf)
+     return 0;
+ 
+@@ -377,7 +377,7 @@ grub_cmdline_get (const char *prompt_translated)
+     FOR_ACTIVE_TERM_OUTPUTS(cur)
+       nterms++;
+ 
+-    cl_terms = grub_malloc (sizeof (cl_terms[0]) * nterms);
++    cl_terms = grub_calloc (nterms, sizeof (cl_terms[0]));
+     if (!cl_terms)
+       {
+ 	grub_free (buf);
+@@ -385,7 +385,7 @@ grub_cmdline_get (const char *prompt_translated)
+       }
+     cl_term_cur = cl_terms;
+ 
+-    unicode_msg = grub_malloc (msg_len * sizeof (grub_uint32_t));
++    unicode_msg = grub_calloc (msg_len, sizeof (grub_uint32_t));
+     if (!unicode_msg)
+       {
+ 	grub_free (buf);
+@@ -495,7 +495,7 @@ grub_cmdline_get (const char *prompt_translated)
+ 		grub_uint32_t *insert;
+ 
+ 		insertlen = grub_strlen (insertu8);
+-		insert = grub_malloc ((insertlen + 1) * sizeof (grub_uint32_t));
++		insert = grub_calloc (insertlen + 1, sizeof (grub_uint32_t));
+ 		if (!insert)
+ 		  {
+ 		    grub_free (insertu8);
+@@ -602,7 +602,7 @@ grub_cmdline_get (const char *prompt_translated)
+ 
+ 	      grub_free (kill_buf);
+ 
+-	      kill_buf = grub_malloc ((n + 1) * sizeof(grub_uint32_t));
++	      kill_buf = grub_calloc (n + 1, sizeof (grub_uint32_t));
+ 	      if (grub_errno)
+ 		{
+ 		  grub_print_error ();
+diff --git a/grub-core/normal/menu_entry.c b/grub-core/normal/menu_entry.c
+index cdf3590..1993995 100644
+--- a/grub-core/normal/menu_entry.c
++++ b/grub-core/normal/menu_entry.c
+@@ -95,8 +95,8 @@ init_line (struct screen *screen, struct line *linep)
+ {
+   linep->len = 0;
+   linep->max_len = 80;
+-  linep->buf = grub_malloc ((linep->max_len + 1) * sizeof (linep->buf[0]));
+-  linep->pos = grub_zalloc (screen->nterms * sizeof (linep->pos[0]));
++  linep->buf = grub_calloc (linep->max_len + 1, sizeof (linep->buf[0]));
++  linep->pos = grub_calloc (screen->nterms, sizeof (linep->pos[0]));
+   if (! linep->buf || !linep->pos)
+     {
+       grub_free (linep->buf);
+@@ -287,7 +287,7 @@ update_screen (struct screen *screen, struct per_term_screen *term_screen,
+ 	  pos = linep->pos + (term_screen - screen->terms);
+ 
+ 	  if (!*pos)
+-	    *pos = grub_zalloc ((linep->len + 1) * sizeof (**pos));
++	    *pos = grub_calloc (linep->len + 1, sizeof (**pos));
+ 
+ 	  if (i == region_start || linep == screen->lines + screen->line
+ 	      || (i > region_start && mode == ALL_LINES))
+@@ -471,7 +471,7 @@ insert_string (struct screen *screen, const char *s, int update)
+ 
+ 	  /* Insert the string.  */
+ 	  current_linep = screen->lines + screen->line;
+-	  unicode_msg = grub_malloc ((p - s) * sizeof (grub_uint32_t));
++	  unicode_msg = grub_calloc (p - s, sizeof (grub_uint32_t));
+ 
+ 	  if (!unicode_msg)
+ 	    return 0;
+@@ -1023,7 +1023,7 @@ complete (struct screen *screen, int continuous, int update)
+   if (completion_buffer.buf)
+     {
+       buflen = grub_strlen (completion_buffer.buf);
+-      ucs4 = grub_malloc (sizeof (grub_uint32_t) * (buflen + 1));
++      ucs4 = grub_calloc (buflen + 1, sizeof (grub_uint32_t));
+       
+       if (!ucs4)
+ 	{
+@@ -1268,7 +1268,7 @@ grub_menu_entry_run (grub_menu_entry_t entry)
+   for (i = 0; i < (unsigned) screen->num_lines; i++)
+     {
+       grub_free (screen->lines[i].pos);
+-      screen->lines[i].pos = grub_zalloc (screen->nterms * sizeof (screen->lines[i].pos[0]));
++      screen->lines[i].pos = grub_calloc (screen->nterms, sizeof (screen->lines[i].pos[0]));
+       if (! screen->lines[i].pos)
+ 	{
+ 	  grub_print_error ();
+@@ -1278,7 +1278,7 @@ grub_menu_entry_run (grub_menu_entry_t entry)
+ 	}
+     }
+ 
+-  screen->terms = grub_zalloc (screen->nterms * sizeof (screen->terms[0]));
++  screen->terms = grub_calloc (screen->nterms, sizeof (screen->terms[0]));
+   if (!screen->terms)
+     {
+       grub_print_error ();
+diff --git a/grub-core/normal/menu_text.c b/grub-core/normal/menu_text.c
+index e22bb91..18240e7 100644
+--- a/grub-core/normal/menu_text.c
++++ b/grub-core/normal/menu_text.c
+@@ -78,7 +78,7 @@ grub_print_message_indented_real (const char *msg, int margin_left,
+   grub_size_t msg_len = grub_strlen (msg) + 2;
+   int ret = 0;
+ 
+-  unicode_msg = grub_malloc (msg_len * sizeof (grub_uint32_t));
++  unicode_msg = grub_calloc (msg_len, sizeof (grub_uint32_t));
+  
+   if (!unicode_msg)
+     return 0;
+@@ -211,7 +211,7 @@ print_entry (int y, int highlight, grub_menu_entry_t entry,
+ 
+   title = entry ? entry->title : "";
+   title_len = grub_strlen (title);
+-  unicode_title = grub_malloc (title_len * sizeof (*unicode_title));
++  unicode_title = grub_calloc (title_len, sizeof (*unicode_title));
+   if (! unicode_title)
+     /* XXX How to show this error?  */
+     return;
+diff --git a/grub-core/normal/term.c b/grub-core/normal/term.c
+index a1e5c5a..cc8c173 100644
+--- a/grub-core/normal/term.c
++++ b/grub-core/normal/term.c
+@@ -264,7 +264,7 @@ grub_term_save_pos (void)
+   FOR_ACTIVE_TERM_OUTPUTS(cur)
+     cnt++;
+ 
+-  ret = grub_malloc (cnt * sizeof (ret[0]));
++  ret = grub_calloc (cnt, sizeof (ret[0]));
+   if (!ret)
+     return NULL;
+ 
+@@ -1013,7 +1013,7 @@ grub_xnputs (const char *str, grub_size_t msg_len)
+ 
+   grub_error_push ();
+ 
+-  unicode_str = grub_malloc (msg_len * sizeof (grub_uint32_t));
++  unicode_str = grub_calloc (msg_len, sizeof (grub_uint32_t));
+  
+   grub_error_pop ();
+ 
+diff --git a/grub-core/osdep/linux/getroot.c b/grub-core/osdep/linux/getroot.c
+index 90d92d3..5b41ad0 100644
+--- a/grub-core/osdep/linux/getroot.c
++++ b/grub-core/osdep/linux/getroot.c
+@@ -168,7 +168,7 @@ grub_util_raid_getmembers (const char *name, int bootable)
+   if (ret != 0)
+     grub_util_error (_("ioctl GET_ARRAY_INFO error: %s"), strerror (errno));
+ 
+-  devicelist = xmalloc ((info.nr_disks + 1) * sizeof (char *));
++  devicelist = xcalloc (info.nr_disks + 1, sizeof (char *));
+ 
+   for (i = 0, j = 0; j < info.nr_disks; i++)
+     {
+@@ -241,7 +241,7 @@ grub_find_root_devices_from_btrfs (const char *dir)
+       return NULL;
+     }
+ 
+-  ret = xmalloc ((fsi.num_devices + 1) * sizeof (ret[0]));
++  ret = xcalloc (fsi.num_devices + 1, sizeof (ret[0]));
+ 
+   for (i = 1; i <= fsi.max_id && j < fsi.num_devices; i++)
+     {
+@@ -396,7 +396,7 @@ grub_find_root_devices_from_mountinfo (const char *dir, char **relroot)
+   if (relroot)
+     *relroot = NULL;
+ 
+-  entries = xmalloc (entry_max * sizeof (*entries));
++  entries = xcalloc (entry_max, sizeof (*entries));
+ 
+ again:
+   fp = grub_util_fopen ("/proc/self/mountinfo", "r");
+diff --git a/grub-core/osdep/unix/config.c b/grub-core/osdep/unix/config.c
+index 65effa9..7d63251 100644
+--- a/grub-core/osdep/unix/config.c
++++ b/grub-core/osdep/unix/config.c
+@@ -89,7 +89,7 @@ grub_util_load_config (struct grub_util_config *cfg)
+   argv[0] = "sh";
+   argv[1] = "-c";
+ 
+-  script = xmalloc (4 * strlen (cfgfile) + 300);
++  script = xcalloc (4, strlen (cfgfile) + 300);
+ 
+   ptr = script;
+   memcpy (ptr, ". '", 3);
+diff --git a/grub-core/osdep/windows/getroot.c b/grub-core/osdep/windows/getroot.c
+index 661d954..eada663 100644
+--- a/grub-core/osdep/windows/getroot.c
++++ b/grub-core/osdep/windows/getroot.c
+@@ -59,7 +59,7 @@ grub_get_mount_point (const TCHAR *path)
+ 
+   for (ptr = path; *ptr; ptr++);
+   allocsize = (ptr - path + 10) * 2;
+-  out = xmalloc (allocsize * sizeof (out[0]));
++  out = xcalloc (allocsize, sizeof (out[0]));
+ 
+   /* When pointing to EFI system partition GetVolumePathName fails
+      for ESP root and returns abberant information for everything
+diff --git a/grub-core/osdep/windows/hostdisk.c b/grub-core/osdep/windows/hostdisk.c
+index 3551007..0be3273 100644
+--- a/grub-core/osdep/windows/hostdisk.c
++++ b/grub-core/osdep/windows/hostdisk.c
+@@ -111,7 +111,7 @@ grub_util_get_windows_path_real (const char *path)
+ 
+   while (1)
+     {
+-      fpa = xmalloc (alloc * sizeof (fpa[0]));
++      fpa = xcalloc (alloc, sizeof (fpa[0]));
+ 
+       len = GetFullPathName (tpath, alloc, fpa, NULL);
+       if (len >= alloc)
+@@ -399,7 +399,7 @@ grub_util_fd_opendir (const char *name)
+   for (l = 0; name_windows[l]; l++);
+   for (l--; l >= 0 && (name_windows[l] == '\\' || name_windows[l] == '/'); l--);
+   l++;
+-  pattern = xmalloc ((l + 3) * sizeof (pattern[0]));
++  pattern = xcalloc (l + 3, sizeof (pattern[0]));
+   memcpy (pattern, name_windows, l * sizeof (pattern[0]));
+   pattern[l] = '\\';
+   pattern[l + 1] = '*';
+diff --git a/grub-core/osdep/windows/init.c b/grub-core/osdep/windows/init.c
+index e8ffd62..6297de6 100644
+--- a/grub-core/osdep/windows/init.c
++++ b/grub-core/osdep/windows/init.c
+@@ -161,7 +161,7 @@ grub_util_host_init (int *argc __attribute__ ((unused)),
+   LPWSTR *targv;
+ 
+   targv = CommandLineToArgvW (tcmdline, argc);
+-  *argv = xmalloc ((*argc + 1) * sizeof (argv[0]));
++  *argv = xcalloc (*argc + 1, sizeof (argv[0]));
+ 
+   for (i = 0; i < *argc; i++)
+     (*argv)[i] = grub_util_tchar_to_utf8 (targv[i]); 
+diff --git a/grub-core/osdep/windows/platform.c b/grub-core/osdep/windows/platform.c
+index 7eb53fe..1ef86bf 100644
+--- a/grub-core/osdep/windows/platform.c
++++ b/grub-core/osdep/windows/platform.c
+@@ -225,8 +225,8 @@ grub_install_register_efi (grub_device_t efidir_grub_dev,
+     grub_util_error ("%s", _("no EFI routines are available when running in BIOS mode"));
+ 
+   distrib8_len = grub_strlen (efi_distributor);
+-  distributor16 = xmalloc ((distrib8_len + 1) * GRUB_MAX_UTF16_PER_UTF8
+-			   * sizeof (grub_uint16_t));
++  distributor16 = xcalloc (distrib8_len + 1,
++			   GRUB_MAX_UTF16_PER_UTF8 * sizeof (grub_uint16_t));
+   distrib16_len = grub_utf8_to_utf16 (distributor16, distrib8_len * GRUB_MAX_UTF16_PER_UTF8,
+ 				      (const grub_uint8_t *) efi_distributor,
+ 				      distrib8_len, 0);
+diff --git a/grub-core/osdep/windows/relpath.c b/grub-core/osdep/windows/relpath.c
+index cb08617..478e8ef 100644
+--- a/grub-core/osdep/windows/relpath.c
++++ b/grub-core/osdep/windows/relpath.c
+@@ -72,7 +72,7 @@ grub_make_system_path_relative_to_its_root (const char *path)
+       if (dirwindows[0] && dirwindows[1] == ':')
+ 	offset = 2;
+     }
+-  ret = xmalloc (sizeof (ret[0]) * (flen - offset + 2));
++  ret = xcalloc (flen - offset + 2, sizeof (ret[0]));
+   if (dirwindows[offset] != '\\'
+       && dirwindows[offset] != '/'
+       && dirwindows[offset])
+diff --git a/grub-core/partmap/gpt.c b/grub-core/partmap/gpt.c
+index 103f679..72a2e37 100644
+--- a/grub-core/partmap/gpt.c
++++ b/grub-core/partmap/gpt.c
+@@ -199,7 +199,7 @@ gpt_partition_map_embed (struct grub_disk *disk, unsigned int *nsectors,
+   *nsectors = ctx.len;
+   if (*nsectors > max_nsectors)
+     *nsectors = max_nsectors;
+-  *sectors = grub_malloc (*nsectors * sizeof (**sectors));
++  *sectors = grub_calloc (*nsectors, sizeof (**sectors));
+   if (!*sectors)
+     return grub_errno;
+   for (i = 0; i < *nsectors; i++)
+diff --git a/grub-core/partmap/msdos.c b/grub-core/partmap/msdos.c
+index 7b8e450..ee3f249 100644
+--- a/grub-core/partmap/msdos.c
++++ b/grub-core/partmap/msdos.c
+@@ -337,7 +337,7 @@ pc_partition_map_embed (struct grub_disk *disk, unsigned int *nsectors,
+       avail_nsectors = *nsectors;
+       if (*nsectors > max_nsectors)
+ 	*nsectors = max_nsectors;
+-      *sectors = grub_malloc (*nsectors * sizeof (**sectors));
++      *sectors = grub_calloc (*nsectors, sizeof (**sectors));
+       if (!*sectors)
+ 	return grub_errno;
+       for (i = 0; i < *nsectors; i++)
+diff --git a/grub-core/script/execute.c b/grub-core/script/execute.c
+index ee299fd..c8d6806 100644
+--- a/grub-core/script/execute.c
++++ b/grub-core/script/execute.c
+@@ -553,7 +553,7 @@ gettext_append (struct grub_script_argv *result, const char *orig_str)
+   for (iptr = orig_str; *iptr; iptr++)
+     if (*iptr == '$')
+       dollar_cnt++;
+-  ctx.allowed_strings = grub_malloc (sizeof (ctx.allowed_strings[0]) * dollar_cnt);
++  ctx.allowed_strings = grub_calloc (dollar_cnt, sizeof (ctx.allowed_strings[0]));
+ 
+   if (parse_string (orig_str, gettext_save_allow, &ctx, 0))
+     goto fail;
+diff --git a/grub-core/tests/fake_input.c b/grub-core/tests/fake_input.c
+index 2d60852..b5eb516 100644
+--- a/grub-core/tests/fake_input.c
++++ b/grub-core/tests/fake_input.c
+@@ -49,7 +49,7 @@ grub_terminal_input_fake_sequence (int *seq_in, int nseq_in)
+     saved = grub_term_inputs;
+   if (seq)
+     grub_free (seq);
+-  seq = grub_malloc (nseq_in * sizeof (seq[0]));
++  seq = grub_calloc (nseq_in, sizeof (seq[0]));
+   if (!seq)
+     return;
+ 
+diff --git a/grub-core/tests/video_checksum.c b/grub-core/tests/video_checksum.c
+index 74d5b65..44d0810 100644
+--- a/grub-core/tests/video_checksum.c
++++ b/grub-core/tests/video_checksum.c
+@@ -336,7 +336,7 @@ grub_video_capture_write_bmp (const char *fname,
+     {
+     case 4:
+       {
+-	grub_uint8_t *buffer = xmalloc (mode_info->width * 3);
++	grub_uint8_t *buffer = xcalloc (3, mode_info->width);
+ 	grub_uint32_t rmask = ((1 << mode_info->red_mask_size) - 1);
+ 	grub_uint32_t gmask = ((1 << mode_info->green_mask_size) - 1);
+ 	grub_uint32_t bmask = ((1 << mode_info->blue_mask_size) - 1);
+@@ -367,7 +367,7 @@ grub_video_capture_write_bmp (const char *fname,
+       }
+     case 3:
+       {
+-	grub_uint8_t *buffer = xmalloc (mode_info->width * 3);
++	grub_uint8_t *buffer = xcalloc (3, mode_info->width);
+ 	grub_uint32_t rmask = ((1 << mode_info->red_mask_size) - 1);
+ 	grub_uint32_t gmask = ((1 << mode_info->green_mask_size) - 1);
+ 	grub_uint32_t bmask = ((1 << mode_info->blue_mask_size) - 1);
+@@ -407,7 +407,7 @@ grub_video_capture_write_bmp (const char *fname,
+       }
+     case 2:
+       {
+-	grub_uint8_t *buffer = xmalloc (mode_info->width * 3);
++	grub_uint8_t *buffer = xcalloc (3, mode_info->width);
+ 	grub_uint16_t rmask = ((1 << mode_info->red_mask_size) - 1);
+ 	grub_uint16_t gmask = ((1 << mode_info->green_mask_size) - 1);
+ 	grub_uint16_t bmask = ((1 << mode_info->blue_mask_size) - 1);
+diff --git a/grub-core/video/capture.c b/grub-core/video/capture.c
+index 4f83c74..4d3195e 100644
+--- a/grub-core/video/capture.c
++++ b/grub-core/video/capture.c
+@@ -89,7 +89,7 @@ grub_video_capture_start (const struct grub_video_mode_info *mode_info,
+   framebuffer.mode_info = *mode_info;
+   framebuffer.mode_info.blit_format = grub_video_get_blit_format (&framebuffer.mode_info);
+ 
+-  framebuffer.ptr = grub_malloc (framebuffer.mode_info.height * framebuffer.mode_info.pitch);
++  framebuffer.ptr = grub_calloc (framebuffer.mode_info.height, framebuffer.mode_info.pitch);
+   if (!framebuffer.ptr)
+     return grub_errno;
+   
+diff --git a/grub-core/video/emu/sdl.c b/grub-core/video/emu/sdl.c
+index a2f639f..0ebab6f 100644
+--- a/grub-core/video/emu/sdl.c
++++ b/grub-core/video/emu/sdl.c
+@@ -172,7 +172,7 @@ grub_video_sdl_set_palette (unsigned int start, unsigned int count,
+       if (start + count > mode_info.number_of_colors)
+ 	count = mode_info.number_of_colors - start;
+ 
+-      tmp = grub_malloc (count * sizeof (tmp[0]));
++      tmp = grub_calloc (count, sizeof (tmp[0]));
+       for (i = 0; i < count; i++)
+ 	{
+ 	  tmp[i].r = palette_data[i].r;
+diff --git a/grub-core/video/i386/pc/vga.c b/grub-core/video/i386/pc/vga.c
+index 01f4711..b2f776c 100644
+--- a/grub-core/video/i386/pc/vga.c
++++ b/grub-core/video/i386/pc/vga.c
+@@ -127,7 +127,7 @@ grub_video_vga_setup (unsigned int width, unsigned int height,
+ 
+   vga_height = height ? : 480;
+ 
+-  framebuffer.temporary_buffer = grub_malloc (vga_height * VGA_WIDTH);
++  framebuffer.temporary_buffer = grub_calloc (vga_height, VGA_WIDTH);
+   framebuffer.front_page = 0;
+   framebuffer.back_page = 0;
+   if (!framebuffer.temporary_buffer)
+diff --git a/grub-core/video/readers/png.c b/grub-core/video/readers/png.c
+index 777e713..61bd645 100644
+--- a/grub-core/video/readers/png.c
++++ b/grub-core/video/readers/png.c
+@@ -309,7 +309,7 @@ grub_png_decode_image_header (struct grub_png_data *data)
+   if (data->is_16bit || data->is_gray || data->is_palette)
+ #endif
+     {
+-      data->image_data = grub_malloc (data->image_height * data->row_bytes);
++      data->image_data = grub_calloc (data->image_height, data->row_bytes);
+       if (grub_errno)
+         return grub_errno;
+ 
+diff --git a/include/grub/unicode.h b/include/grub/unicode.h
+index a0403e9..4de986a 100644
+--- a/include/grub/unicode.h
++++ b/include/grub/unicode.h
+@@ -293,7 +293,7 @@ grub_unicode_glyph_dup (const struct grub_unicode_glyph *in)
+   grub_memcpy (out, in, sizeof (*in));
+   if (in->ncomb > ARRAY_SIZE (out->combining_inline))
+     {
+-      out->combining_ptr = grub_malloc (in->ncomb * sizeof (out->combining_ptr[0]));
++      out->combining_ptr = grub_calloc (in->ncomb, sizeof (out->combining_ptr[0]));
+       if (!out->combining_ptr)
+ 	{
+ 	  grub_free (out);
+@@ -315,7 +315,7 @@ grub_unicode_set_glyph (struct grub_unicode_glyph *out,
+   grub_memcpy (out, in, sizeof (*in));
+   if (in->ncomb > ARRAY_SIZE (out->combining_inline))
+     {
+-      out->combining_ptr = grub_malloc (in->ncomb * sizeof (out->combining_ptr[0]));
++      out->combining_ptr = grub_calloc (in->ncomb, sizeof (out->combining_ptr[0]));
+       if (!out->combining_ptr)
+ 	return;
+       grub_memcpy (out->combining_ptr, in->combining_ptr,
+diff --git a/util/getroot.c b/util/getroot.c
+index 847406f..a5eaa64 100644
+--- a/util/getroot.c
++++ b/util/getroot.c
+@@ -200,7 +200,7 @@ make_device_name (const char *drive)
+   char *ret, *ptr;
+   const char *iptr;
+ 
+-  ret = xmalloc (strlen (drive) * 2);
++  ret = xcalloc (2, strlen (drive));
+   ptr = ret;
+   for (iptr = drive; *iptr; iptr++)
+     {
+diff --git a/util/grub-file.c b/util/grub-file.c
+index 50c18b6..b2e7dd6 100644
+--- a/util/grub-file.c
++++ b/util/grub-file.c
+@@ -54,7 +54,7 @@ main (int argc, char *argv[])
+ 
+   grub_util_host_init (&argc, &argv);
+ 
+-  argv2 = xmalloc (argc * sizeof (argv2[0]));
++  argv2 = xcalloc (argc, sizeof (argv2[0]));
+ 
+   if (argc == 2 && strcmp (argv[1], "--version") == 0)
+     {
+diff --git a/util/grub-fstest.c b/util/grub-fstest.c
+index f14e02d..57246af 100644
+--- a/util/grub-fstest.c
++++ b/util/grub-fstest.c
+@@ -650,7 +650,7 @@ argp_parser (int key, char *arg, struct argp_state *state)
+   if (args_count < num_disks)
+     {
+       if (args_count == 0)
+-	images = xmalloc (num_disks * sizeof (images[0]));
++	images = xcalloc (num_disks, sizeof (images[0]));
+       images[args_count] = grub_canonicalize_file_name (arg);
+       args_count++;
+       return 0;
+@@ -734,7 +734,7 @@ main (int argc, char *argv[])
+ 
+   grub_util_host_init (&argc, &argv);
+ 
+-  args = xmalloc (argc * sizeof (args[0]));
++  args = xcalloc (argc, sizeof (args[0]));
+ 
+   argp_parse (&argp, argc, argv, 0, 0, 0);
+ 
+diff --git a/util/grub-install-common.c b/util/grub-install-common.c
+index ca0ac61..0295d40 100644
+--- a/util/grub-install-common.c
++++ b/util/grub-install-common.c
+@@ -286,7 +286,7 @@ handle_install_list (struct install_list *il, const char *val,
+       il->n_entries++;
+     }
+   il->n_alloc = il->n_entries + 1;
+-  il->entries = xmalloc (il->n_alloc * sizeof (il->entries[0]));
++  il->entries = xcalloc (il->n_alloc, sizeof (il->entries[0]));
+   ptr = val;
+   for (ce = il->entries; ; ce++)
+     {
+diff --git a/util/grub-install.c b/util/grub-install.c
+index 8a55ad4..a82725f 100644
+--- a/util/grub-install.c
++++ b/util/grub-install.c
+@@ -626,7 +626,7 @@ device_map_check_duplicates (const char *dev_map)
+   if (! fp)
+     return;
+ 
+-  d = xmalloc (alloced * sizeof (d[0]));
++  d = xcalloc (alloced, sizeof (d[0]));
+ 
+   while (fgets (buf, sizeof (buf), fp))
+     {
+@@ -1260,7 +1260,7 @@ main (int argc, char *argv[])
+       ndev++;
+     }
+ 
+-  grub_drives = xmalloc (sizeof (grub_drives[0]) * (ndev + 1)); 
++  grub_drives = xcalloc (ndev + 1, sizeof (grub_drives[0]));
+ 
+   for (curdev = grub_devices, curdrive = grub_drives; *curdev; curdev++,
+        curdrive++)
+diff --git a/util/grub-mkimagexx.c b/util/grub-mkimagexx.c
+index bc087c2..d97d0e7 100644
+--- a/util/grub-mkimagexx.c
++++ b/util/grub-mkimagexx.c
+@@ -2294,10 +2294,8 @@ SUFFIX (grub_mkimage_load_image) (const char *kernel_path,
+ 		      + grub_host_to_target16 (e->e_shstrndx) * smd.section_entsize);
+   smd.strtab = (char *) e + grub_host_to_target_addr (s->sh_offset);
+ 
+-  smd.addrs = xmalloc (sizeof (*smd.addrs) * smd.num_sections);
+-  memset (smd.addrs, 0, sizeof (*smd.addrs) * smd.num_sections);
+-  smd.vaddrs = xmalloc (sizeof (*smd.vaddrs) * smd.num_sections);
+-  memset (smd.vaddrs, 0, sizeof (*smd.vaddrs) * smd.num_sections);
++  smd.addrs = xcalloc (smd.num_sections, sizeof (*smd.addrs));
++  smd.vaddrs = xcalloc (smd.num_sections, sizeof (*smd.vaddrs));
+ 
+   SUFFIX (locate_sections) (e, kernel_path, &smd, layout, image_target);
+ 
+diff --git a/util/grub-mkrescue.c b/util/grub-mkrescue.c
+index ce2cbc4..5183102 100644
+--- a/util/grub-mkrescue.c
++++ b/util/grub-mkrescue.c
+@@ -441,8 +441,8 @@ main (int argc, char *argv[])
+   xorriso = xstrdup ("xorriso");
+   label_font = grub_util_path_concat (2, pkgdatadir, "unicode.pf2");
+ 
+-  argp_argv = xmalloc (sizeof (argp_argv[0]) * argc);
+-  xorriso_tail_argv = xmalloc (sizeof (argp_argv[0]) * argc);
++  argp_argv = xcalloc (argc, sizeof (argp_argv[0]));
++  xorriso_tail_argv = xcalloc (argc, sizeof (argp_argv[0]));
+ 
+   xorriso_tail_argc = 0;
+   /* Program name */
+diff --git a/util/grub-mkstandalone.c b/util/grub-mkstandalone.c
+index 4907d44..edf3097 100644
+--- a/util/grub-mkstandalone.c
++++ b/util/grub-mkstandalone.c
+@@ -296,7 +296,7 @@ main (int argc, char *argv[])
+   grub_util_host_init (&argc, &argv);
+   grub_util_disable_fd_syncs ();
+ 
+-  files = xmalloc ((argc + 1) * sizeof (files[0]));
++  files = xcalloc (argc + 1, sizeof (files[0]));
+ 
+   argp_parse (&argp, argc, argv, 0, 0, 0);
+ 
+diff --git a/util/grub-pe2elf.c b/util/grub-pe2elf.c
+index 0d4084a..1133129 100644
+--- a/util/grub-pe2elf.c
++++ b/util/grub-pe2elf.c
+@@ -100,9 +100,9 @@ write_section_data (FILE* fp, const char *name, char *image,
+   char *pe_strtab = (image + pe_chdr->symtab_offset
+ 		     + pe_chdr->num_symbols * sizeof (struct grub_pe32_symbol));
+ 
+-  section_map = xmalloc ((2 * pe_chdr->num_sections + 5) * sizeof (int));
++  section_map = xcalloc (2 * pe_chdr->num_sections + 5, sizeof (int));
+   section_map[0] = 0;
+-  shdr = xmalloc ((2 * pe_chdr->num_sections + 5) * sizeof (shdr[0]));
++  shdr = xcalloc (2 * pe_chdr->num_sections + 5, sizeof (shdr[0]));
+   idx = 1;
+   idx_reloc = pe_chdr->num_sections + 1;
+ 
+@@ -233,7 +233,7 @@ write_reloc_section (FILE* fp, const char *name, char *image,
+ 
+       pe_sec = pe_shdr + shdr[i].sh_link;
+       pe_rel = (struct grub_pe32_reloc *) (image + pe_sec->relocations_offset);
+-      rel = (elf_reloc_t *) xmalloc (pe_sec->num_relocations * sizeof (elf_reloc_t));
++      rel = (elf_reloc_t *) xcalloc (pe_sec->num_relocations, sizeof (elf_reloc_t));
+       num_rels = 0;
+       modified = 0;
+ 
+@@ -365,12 +365,10 @@ write_symbol_table (FILE* fp, const char *name, char *image,
+   pe_symtab = (struct grub_pe32_symbol *) (image + pe_chdr->symtab_offset);
+   pe_strtab = (char *) (pe_symtab + pe_chdr->num_symbols);
+ 
+-  symtab = (Elf_Sym *) xmalloc ((pe_chdr->num_symbols + 1) *
+-				sizeof (Elf_Sym));
+-  memset (symtab, 0, (pe_chdr->num_symbols + 1) * sizeof (Elf_Sym));
++  symtab = (Elf_Sym *) xcalloc (pe_chdr->num_symbols + 1, sizeof (Elf_Sym));
+   num_syms = 1;
+ 
+-  symtab_map = (int *) xmalloc (pe_chdr->num_symbols * sizeof (int));
++  symtab_map = (int *) xcalloc (pe_chdr->num_symbols, sizeof (int));
+ 
+   for (i = 0; i < (int) pe_chdr->num_symbols;
+        i += pe_symtab->num_aux + 1, pe_symtab += pe_symtab->num_aux + 1)
+diff --git a/util/grub-probe.c b/util/grub-probe.c
+index 81d27ee..cbe6ed9 100644
+--- a/util/grub-probe.c
++++ b/util/grub-probe.c
+@@ -361,8 +361,8 @@ probe (const char *path, char **device_names, char delim)
+       grub_util_pull_device (*curdev);
+       ndev++;
+     }
+-  
+-  drives_names = xmalloc (sizeof (drives_names[0]) * (ndev + 1)); 
++
++  drives_names = xcalloc (ndev + 1, sizeof (drives_names[0]));
+ 
+   for (curdev = device_names, curdrive = drives_names; *curdev; curdev++,
+        curdrive++)
+-- 
+2.14.4
+
diff --git a/meta/recipes-bsp/grub/files/0005-safemath-Add-some-arithmetic-primitives-that-check-f.patch b/meta/recipes-bsp/grub/files/0005-safemath-Add-some-arithmetic-primitives-that-check-f.patch
new file mode 100644
index 0000000000..29021e8d8f
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0005-safemath-Add-some-arithmetic-primitives-that-check-f.patch
@@ -0,0 +1,94 @@
+From 06c361a71c4998635493610e5d76d0d223925251 Mon Sep 17 00:00:00 2001
+From: Peter Jones <pjones@redhat.com>
+Date: Mon, 15 Jun 2020 10:58:42 -0400
+Subject: [PATCH 5/9] safemath: Add some arithmetic primitives that check for
+ overflow
+
+This adds a new header, include/grub/safemath.h, that includes easy to
+use wrappers for __builtin_{add,sub,mul}_overflow() declared like:
+
+  bool OP(a, b, res)
+
+where OP is grub_add, grub_sub or grub_mul. OP() returns true in the
+case where the operation would overflow and res is not modified.
+Otherwise, false is returned and the operation is executed.
+
+These arithmetic primitives require newer compiler versions. So, bump
+these requirements in the INSTALL file too.
+
+Upstream-Status: Backport [commit 68708c4503018d61dbcce7ac11cbb511d6425f4d
+from https://git.savannah.gnu.org/git/grub.git]
+
+Signed-off-by: Peter Jones <pjones@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+[YL: omit the change to INSTALL from original patch]
+Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
+---
+ include/grub/compiler.h |  8 ++++++++
+ include/grub/safemath.h | 37 +++++++++++++++++++++++++++++++++++++
+ 2 files changed, 45 insertions(+)
+ create mode 100644 include/grub/safemath.h
+
+diff --git a/include/grub/compiler.h b/include/grub/compiler.h
+index c9e1d7a..8f3be3a 100644
+--- a/include/grub/compiler.h
++++ b/include/grub/compiler.h
+@@ -48,4 +48,12 @@
+ #  define WARN_UNUSED_RESULT
+ #endif
+ 
++#if defined(__clang__) && defined(__clang_major__) && defined(__clang_minor__)
++#  define CLANG_PREREQ(maj,min) \
++          ((__clang_major__ > (maj)) || \
++	   (__clang_major__ == (maj) && __clang_minor__ >= (min)))
++#else
++#  define CLANG_PREREQ(maj,min) 0
++#endif
++
+ #endif /* ! GRUB_COMPILER_HEADER */
+diff --git a/include/grub/safemath.h b/include/grub/safemath.h
+new file mode 100644
+index 0000000..c17b89b
+--- /dev/null
++++ b/include/grub/safemath.h
+@@ -0,0 +1,37 @@
++/*
++ *  GRUB  --  GRand Unified Bootloader
++ *  Copyright (C) 2020  Free Software Foundation, Inc.
++ *
++ *  GRUB is free software: you can redistribute it and/or modify
++ *  it under the terms of the GNU General Public License as published by
++ *  the Free Software Foundation, either version 3 of the License, or
++ *  (at your option) any later version.
++ *
++ *  GRUB is distributed in the hope that it will be useful,
++ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
++ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ *  GNU General Public License for more details.
++ *
++ *  You should have received a copy of the GNU General Public License
++ *  along with GRUB.  If not, see <http://www.gnu.org/licenses/>.
++ *
++ *  Arithmetic operations that protect against overflow.
++ */
++
++#ifndef GRUB_SAFEMATH_H
++#define GRUB_SAFEMATH_H 1
++
++#include <grub/compiler.h>
++
++/* These appear in gcc 5.1 and clang 3.8. */
++#if GNUC_PREREQ(5, 1) || CLANG_PREREQ(3, 8)
++
++#define grub_add(a, b, res)	__builtin_add_overflow(a, b, res)
++#define grub_sub(a, b, res)	__builtin_sub_overflow(a, b, res)
++#define grub_mul(a, b, res)	__builtin_mul_overflow(a, b, res)
++
++#else
++#error gcc 5.1 or newer or clang 3.8 or newer is required
++#endif
++
++#endif /* GRUB_SAFEMATH_H */
+-- 
+2.14.4
+
diff --git a/meta/recipes-bsp/grub/files/0006-malloc-Use-overflow-checking-primitives-where-we-do-.patch b/meta/recipes-bsp/grub/files/0006-malloc-Use-overflow-checking-primitives-where-we-do-.patch
new file mode 100644
index 0000000000..146602cd3e
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0006-malloc-Use-overflow-checking-primitives-where-we-do-.patch
@@ -0,0 +1,1326 @@
+From eb77d1ef65e25746acff43545f62a71360b15eec Mon Sep 17 00:00:00 2001
+From: Peter Jones <pjones@redhat.com>
+Date: Mon, 15 Jun 2020 12:28:27 -0400
+Subject: [PATCH 6/9] malloc: Use overflow checking primitives where we do
+ complex allocations
+
+This attempts to fix the places where we do the following where
+arithmetic_expr may include unvalidated data:
+
+  X = grub_malloc(arithmetic_expr);
+
+It accomplishes this by doing the arithmetic ahead of time using grub_add(),
+grub_sub(), grub_mul() and testing for overflow before proceeding.
+
+Among other issues, this fixes:
+  - allocation of integer overflow in grub_video_bitmap_create()
+    reported by Chris Coulson,
+  - allocation of integer overflow in grub_png_decode_image_header()
+    reported by Chris Coulson,
+  - allocation of integer overflow in grub_squash_read_symlink()
+    reported by Chris Coulson,
+  - allocation of integer overflow in grub_ext2_read_symlink()
+    reported by Chris Coulson,
+  - allocation of integer overflow in read_section_as_string()
+    reported by Chris Coulson.
+
+Fixes: CVE-2020-14309, CVE-2020-14310, CVE-2020-14311
+
+Upstream-Status: Backport [commit 3f05d693d1274965ffbe4ba99080dc2c570944c6
+from https://git.savannah.gnu.org/git/grub.git]
+
+Signed-off-by: Peter Jones <pjones@redhat.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
+---
+ grub-core/commands/legacycfg.c | 29 +++++++++++++++++++-----
+ grub-core/commands/wildcard.c  | 36 ++++++++++++++++++++++++-----
+ grub-core/disk/ldm.c           | 32 ++++++++++++++++++--------
+ grub-core/font/font.c          |  7 +++++-
+ grub-core/fs/btrfs.c           | 28 +++++++++++++++--------
+ grub-core/fs/ext2.c            | 10 ++++++++-
+ grub-core/fs/iso9660.c         | 51 +++++++++++++++++++++++++++++-------------
+ grub-core/fs/sfs.c             | 27 +++++++++++++++++-----
+ grub-core/fs/squash4.c         | 45 ++++++++++++++++++++++++++++---------
+ grub-core/fs/udf.c             | 41 +++++++++++++++++++++------------
+ grub-core/fs/xfs.c             | 11 +++++----
+ grub-core/fs/zfs/zfs.c         | 22 ++++++++++++------
+ grub-core/fs/zfs/zfscrypt.c    |  7 +++++-
+ grub-core/lib/arg.c            | 20 +++++++++++++++--
+ grub-core/loader/i386/bsd.c    |  8 ++++++-
+ grub-core/net/dns.c            |  9 +++++++-
+ grub-core/normal/charset.c     | 10 +++++++--
+ grub-core/normal/cmdline.c     | 14 ++++++++++--
+ grub-core/normal/menu_entry.c  | 13 +++++++++--
+ grub-core/script/argv.c        | 16 +++++++++++--
+ grub-core/script/lexer.c       | 21 ++++++++++++++---
+ grub-core/video/bitmap.c       | 25 +++++++++++++--------
+ grub-core/video/readers/png.c  | 13 +++++++++--
+ 23 files changed, 382 insertions(+), 113 deletions(-)
+
+diff --git a/grub-core/commands/legacycfg.c b/grub-core/commands/legacycfg.c
+index 5e3ec0d..cc5971f 100644
+--- a/grub-core/commands/legacycfg.c
++++ b/grub-core/commands/legacycfg.c
+@@ -32,6 +32,7 @@
+ #include <grub/auth.h>
+ #include <grub/disk.h>
+ #include <grub/partition.h>
++#include <grub/safemath.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -104,13 +105,22 @@ legacy_file (const char *filename)
+ 	if (newsuffix)
+ 	  {
+ 	    char *t;
+-	    
++	    grub_size_t sz;
++
++	    if (grub_add (grub_strlen (suffix), grub_strlen (newsuffix), &sz) ||
++		grub_add (sz, 1, &sz))
++	      {
++		grub_errno = GRUB_ERR_OUT_OF_RANGE;
++		goto fail_0;
++	      }
++
+ 	    t = suffix;
+-	    suffix = grub_realloc (suffix, grub_strlen (suffix)
+-				   + grub_strlen (newsuffix) + 1);
++	    suffix = grub_realloc (suffix, sz);
+ 	    if (!suffix)
+ 	      {
+ 		grub_free (t);
++
++ fail_0:
+ 		grub_free (entrysrc);
+ 		grub_free (parsed);
+ 		grub_free (newsuffix);
+@@ -154,13 +164,22 @@ legacy_file (const char *filename)
+ 	  else
+ 	    {
+ 	      char *t;
++	      grub_size_t sz;
++
++	      if (grub_add (grub_strlen (entrysrc), grub_strlen (parsed), &sz) ||
++		  grub_add (sz, 1, &sz))
++		{
++		  grub_errno = GRUB_ERR_OUT_OF_RANGE;
++		  goto fail_1;
++		}
+ 
+ 	      t = entrysrc;
+-	      entrysrc = grub_realloc (entrysrc, grub_strlen (entrysrc)
+-				       + grub_strlen (parsed) + 1);
++	      entrysrc = grub_realloc (entrysrc, sz);
+ 	      if (!entrysrc)
+ 		{
+ 		  grub_free (t);
++
++ fail_1:
+ 		  grub_free (parsed);
+ 		  grub_free (suffix);
+ 		  return grub_errno;
+diff --git a/grub-core/commands/wildcard.c b/grub-core/commands/wildcard.c
+index 4a106ca..cc32903 100644
+--- a/grub-core/commands/wildcard.c
++++ b/grub-core/commands/wildcard.c
+@@ -23,6 +23,7 @@
+ #include <grub/file.h>
+ #include <grub/device.h>
+ #include <grub/script_sh.h>
++#include <grub/safemath.h>
+ 
+ #include <regex.h>
+ 
+@@ -48,6 +49,7 @@ merge (char **dest, char **ps)
+   int i;
+   int j;
+   char **p;
++  grub_size_t sz;
+ 
+   if (! dest)
+     return ps;
+@@ -60,7 +62,12 @@ merge (char **dest, char **ps)
+   for (j = 0; ps[j]; j++)
+     ;
+ 
+-  p = grub_realloc (dest, sizeof (char*) * (i + j + 1));
++  if (grub_add (i, j, &sz) ||
++      grub_add (sz, 1, &sz) ||
++      grub_mul (sz, sizeof (char *), &sz))
++    return dest;
++
++  p = grub_realloc (dest, sz);
+   if (! p)
+     {
+       grub_free (dest);
+@@ -115,8 +122,15 @@ make_regex (const char *start, const char *end, regex_t *regexp)
+   char ch;
+   int i = 0;
+   unsigned len = end - start;
+-  char *buffer = grub_malloc (len * 2 + 2 + 1); /* worst case size. */
++  char *buffer;
++  grub_size_t sz;
+ 
++  /* Worst case size is (len * 2 + 2 + 1). */
++  if (grub_mul (len, 2, &sz) ||
++      grub_add (sz, 3, &sz))
++    return 1;
++
++  buffer = grub_malloc (sz);
+   if (! buffer)
+     return 1;
+ 
+@@ -226,6 +240,7 @@ match_devices_iter (const char *name, void *data)
+   struct match_devices_ctx *ctx = data;
+   char **t;
+   char *buffer;
++  grub_size_t sz;
+ 
+   /* skip partitions if asked to. */
+   if (ctx->noparts && grub_strchr (name, ','))
+@@ -239,11 +254,16 @@ match_devices_iter (const char *name, void *data)
+   if (regexec (ctx->regexp, buffer, 0, 0, 0))
+     {
+       grub_dprintf ("expand", "not matched\n");
++ fail:
+       grub_free (buffer);
+       return 0;
+     }
+ 
+-  t = grub_realloc (ctx->devs, sizeof (char*) * (ctx->ndev + 2));
++  if (grub_add (ctx->ndev, 2, &sz) ||
++      grub_mul (sz, sizeof (char *), &sz))
++    goto fail;
++
++  t = grub_realloc (ctx->devs, sz);
+   if (! t)
+     {
+       grub_free (buffer);
+@@ -300,6 +320,7 @@ match_files_iter (const char *name,
+   struct match_files_ctx *ctx = data;
+   char **t;
+   char *buffer;
++  grub_size_t sz;
+ 
+   /* skip . and .. names */
+   if (grub_strcmp(".", name) == 0 || grub_strcmp("..", name) == 0)
+@@ -315,9 +336,14 @@ match_files_iter (const char *name,
+   if (! buffer)
+     return 1;
+ 
+-  t = grub_realloc (ctx->files, sizeof (char*) * (ctx->nfile + 2));
+-  if (! t)
++  if (grub_add (ctx->nfile, 2, &sz) ||
++      grub_mul (sz, sizeof (char *), &sz))
++    goto fail;
++
++  t = grub_realloc (ctx->files, sz);
++  if (!t)
+     {
++ fail:
+       grub_free (buffer);
+       return 1;
+     }
+diff --git a/grub-core/disk/ldm.c b/grub-core/disk/ldm.c
+index e632370..58f8a53 100644
+--- a/grub-core/disk/ldm.c
++++ b/grub-core/disk/ldm.c
+@@ -25,6 +25,7 @@
+ #include <grub/msdos_partition.h>
+ #include <grub/gpt_partition.h>
+ #include <grub/i18n.h>
++#include <grub/safemath.h>
+ 
+ #ifdef GRUB_UTIL
+ #include <grub/emu/misc.h>
+@@ -289,6 +290,7 @@ make_vg (grub_disk_t disk,
+       struct grub_ldm_vblk vblk[GRUB_DISK_SECTOR_SIZE
+ 				/ sizeof (struct grub_ldm_vblk)];
+       unsigned i;
++      grub_size_t sz;
+       err = grub_disk_read (disk, cursec, 0,
+ 			    sizeof(vblk), &vblk);
+       if (err)
+@@ -350,7 +352,13 @@ make_vg (grub_disk_t disk,
+ 	      grub_free (lv);
+ 	      goto fail2;
+ 	    }
+-	  lv->name = grub_malloc (*ptr + 1);
++	  if (grub_add (*ptr, 1, &sz))
++	    {
++	      grub_free (lv->internal_id);
++	      grub_free (lv);
++	      goto fail2;
++	    }
++	  lv->name = grub_malloc (sz);
+ 	  if (!lv->name)
+ 	    {
+ 	      grub_free (lv->internal_id);
+@@ -599,10 +607,13 @@ make_vg (grub_disk_t disk,
+ 	  if (lv->segments->node_alloc == lv->segments->node_count)
+ 	    {
+ 	      void *t;
+-	      lv->segments->node_alloc *= 2; 
+-	      t = grub_realloc (lv->segments->nodes,
+-				sizeof (*lv->segments->nodes)
+-				* lv->segments->node_alloc);
++	      grub_size_t sz;
++
++	      if (grub_mul (lv->segments->node_alloc, 2, &lv->segments->node_alloc) ||
++		  grub_mul (lv->segments->node_alloc, sizeof (*lv->segments->nodes), &sz))
++		goto fail2;
++
++	      t = grub_realloc (lv->segments->nodes, sz);
+ 	      if (!t)
+ 		goto fail2;
+ 	      lv->segments->nodes = t;
+@@ -723,10 +734,13 @@ make_vg (grub_disk_t disk,
+ 	      if (comp->segment_alloc == comp->segment_count)
+ 		{
+ 		  void *t;
+-		  comp->segment_alloc *= 2;
+-		  t = grub_realloc (comp->segments,
+-				    comp->segment_alloc
+-				    * sizeof (*comp->segments));
++		  grub_size_t sz;
++
++		  if (grub_mul (comp->segment_alloc, 2, &comp->segment_alloc) ||
++		      grub_mul (comp->segment_alloc, sizeof (*comp->segments), &sz))
++		    goto fail2;
++
++		  t = grub_realloc (comp->segments, sz);
+ 		  if (!t)
+ 		    goto fail2;
+ 		  comp->segments = t;
+diff --git a/grub-core/font/font.c b/grub-core/font/font.c
+index 8e118b3..5edb477 100644
+--- a/grub-core/font/font.c
++++ b/grub-core/font/font.c
+@@ -30,6 +30,7 @@
+ #include <grub/unicode.h>
+ #include <grub/fontformat.h>
+ #include <grub/env.h>
++#include <grub/safemath.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -360,9 +361,13 @@ static char *
+ read_section_as_string (struct font_file_section *section)
+ {
+   char *str;
++  grub_size_t sz;
+   grub_ssize_t ret;
+ 
+-  str = grub_malloc (section->length + 1);
++  if (grub_add (section->length, 1, &sz))
++    return NULL;
++
++  str = grub_malloc (sz);
+   if (!str)
+     return 0;
+ 
+diff --git a/grub-core/fs/btrfs.c b/grub-core/fs/btrfs.c
+index 11272ef..2b65bd5 100644
+--- a/grub-core/fs/btrfs.c
++++ b/grub-core/fs/btrfs.c
+@@ -40,6 +40,7 @@
+ #include <grub/btrfs.h>
+ #include <grub/crypto.h>
+ #include <grub/diskfilter.h>
++#include <grub/safemath.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -329,9 +330,13 @@ save_ref (struct grub_btrfs_leaf_descriptor *desc,
+   if (desc->allocated < desc->depth)
+     {
+       void *newdata;
+-      desc->allocated *= 2;
+-      newdata = grub_realloc (desc->data, sizeof (desc->data[0])
+-			      * desc->allocated);
++      grub_size_t sz;
++
++      if (grub_mul (desc->allocated, 2, &desc->allocated) ||
++	  grub_mul (desc->allocated, sizeof (desc->data[0]), &sz))
++	return GRUB_ERR_OUT_OF_RANGE;
++
++      newdata = grub_realloc (desc->data, sz);
+       if (!newdata)
+ 	return grub_errno;
+       desc->data = newdata;
+@@ -622,16 +627,21 @@ find_device (struct grub_btrfs_data *data, grub_uint64_t id)
+   if (data->n_devices_attached > data->n_devices_allocated)
+     {
+       void *tmp;
+-      data->n_devices_allocated = 2 * data->n_devices_attached + 1;
+-      data->devices_attached
+-	= grub_realloc (tmp = data->devices_attached,
+-			data->n_devices_allocated
+-			* sizeof (data->devices_attached[0]));
++      grub_size_t sz;
++
++      if (grub_mul (data->n_devices_attached, 2, &data->n_devices_allocated) ||
++	  grub_add (data->n_devices_allocated, 1, &data->n_devices_allocated) ||
++	  grub_mul (data->n_devices_allocated, sizeof (data->devices_attached[0]), &sz))
++	goto fail;
++
++      data->devices_attached = grub_realloc (tmp = data->devices_attached, sz);
+       if (!data->devices_attached)
+ 	{
++	  data->devices_attached = tmp;
++
++ fail:
+ 	  if (ctx.dev_found)
+ 	    grub_device_close (ctx.dev_found);
+-	  data->devices_attached = tmp;
+ 	  return NULL;
+ 	}
+     }
+diff --git a/grub-core/fs/ext2.c b/grub-core/fs/ext2.c
+index 9b38980..ac33bcd 100644
+--- a/grub-core/fs/ext2.c
++++ b/grub-core/fs/ext2.c
+@@ -46,6 +46,7 @@
+ #include <grub/dl.h>
+ #include <grub/types.h>
+ #include <grub/fshelp.h>
++#include <grub/safemath.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -703,6 +704,7 @@ grub_ext2_read_symlink (grub_fshelp_node_t node)
+ {
+   char *symlink;
+   struct grub_fshelp_node *diro = node;
++  grub_size_t sz;
+ 
+   if (! diro->inode_read)
+     {
+@@ -717,7 +719,13 @@ grub_ext2_read_symlink (grub_fshelp_node_t node)
+        }
+     }
+ 
+-  symlink = grub_malloc (grub_le_to_cpu32 (diro->inode.size) + 1);
++  if (grub_add (grub_le_to_cpu32 (diro->inode.size), 1, &sz))
++    {
++      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is detected"));
++      return NULL;
++    }
++
++  symlink = grub_malloc (sz);
+   if (! symlink)
+     return 0;
+ 
+diff --git a/grub-core/fs/iso9660.c b/grub-core/fs/iso9660.c
+index 4f1b52a..7ba5b30 100644
+--- a/grub-core/fs/iso9660.c
++++ b/grub-core/fs/iso9660.c
+@@ -28,6 +28,7 @@
+ #include <grub/fshelp.h>
+ #include <grub/charset.h>
+ #include <grub/datetime.h>
++#include <grub/safemath.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -531,8 +532,13 @@ add_part (struct iterate_dir_ctx *ctx,
+ 	  int len2)
+ {
+   int size = ctx->symlink ? grub_strlen (ctx->symlink) : 0;
++  grub_size_t sz;
+ 
+-  ctx->symlink = grub_realloc (ctx->symlink, size + len2 + 1);
++  if (grub_add (size, len2, &sz) ||
++      grub_add (sz, 1, &sz))
++    return;
++
++  ctx->symlink = grub_realloc (ctx->symlink, sz);
+   if (! ctx->symlink)
+     return;
+ 
+@@ -560,17 +566,24 @@ susp_iterate_dir (struct grub_iso9660_susp_entry *entry,
+ 	{
+ 	  grub_size_t off = 0, csize = 1;
+ 	  char *old;
++	  grub_size_t sz;
++
+ 	  csize = entry->len - 5;
+ 	  old = ctx->filename;
+ 	  if (ctx->filename_alloc)
+ 	    {
+ 	      off = grub_strlen (ctx->filename);
+-	      ctx->filename = grub_realloc (ctx->filename, csize + off + 1);
++	      if (grub_add (csize, off, &sz) ||
++		  grub_add (sz, 1, &sz))
++		return GRUB_ERR_OUT_OF_RANGE;
++	      ctx->filename = grub_realloc (ctx->filename, sz);
+ 	    }
+ 	  else
+ 	    {
+ 	      off = 0;
+-	      ctx->filename = grub_zalloc (csize + 1);
++	      if (grub_add (csize, 1, &sz))
++		return GRUB_ERR_OUT_OF_RANGE;
++	      ctx->filename = grub_zalloc (sz);
+ 	    }
+ 	  if (!ctx->filename)
+ 	    {
+@@ -776,14 +789,18 @@ grub_iso9660_iterate_dir (grub_fshelp_node_t dir,
+ 	    if (node->have_dirents >= node->alloc_dirents)
+ 	      {
+ 		struct grub_fshelp_node *new_node;
+-		node->alloc_dirents *= 2;
+-		new_node = grub_realloc (node, 
+-					 sizeof (struct grub_fshelp_node)
+-					 + ((node->alloc_dirents
+-					     - ARRAY_SIZE (node->dirents))
+-					    * sizeof (node->dirents[0])));
++		grub_size_t sz;
++
++		if (grub_mul (node->alloc_dirents, 2, &node->alloc_dirents) ||
++		    grub_sub (node->alloc_dirents, ARRAY_SIZE (node->dirents), &sz) ||
++		    grub_mul (sz, sizeof (node->dirents[0]), &sz) ||
++		    grub_add (sz, sizeof (struct grub_fshelp_node), &sz))
++		  goto fail_0;
++
++		new_node = grub_realloc (node, sz);
+ 		if (!new_node)
+ 		  {
++ fail_0:
+ 		    if (ctx.filename_alloc)
+ 		      grub_free (ctx.filename);
+ 		    grub_free (node);
+@@ -799,14 +816,18 @@ grub_iso9660_iterate_dir (grub_fshelp_node_t dir,
+ 		* sizeof (node->dirents[0]) < grub_strlen (ctx.symlink) + 1)
+ 	      {
+ 		struct grub_fshelp_node *new_node;
+-		new_node = grub_realloc (node,
+-					 sizeof (struct grub_fshelp_node)
+-					 + ((node->alloc_dirents
+-					     - ARRAY_SIZE (node->dirents))
+-					    * sizeof (node->dirents[0]))
+-					 + grub_strlen (ctx.symlink) + 1);
++		grub_size_t sz;
++
++		if (grub_sub (node->alloc_dirents, ARRAY_SIZE (node->dirents), &sz) ||
++		    grub_mul (sz, sizeof (node->dirents[0]), &sz) ||
++		    grub_add (sz, sizeof (struct grub_fshelp_node) + 1, &sz) ||
++		    grub_add (sz, grub_strlen (ctx.symlink), &sz))
++		  goto fail_1;
++
++		new_node = grub_realloc (node, sz);
+ 		if (!new_node)
+ 		  {
++ fail_1:
+ 		    if (ctx.filename_alloc)
+ 		      grub_free (ctx.filename);
+ 		    grub_free (node);
+diff --git a/grub-core/fs/sfs.c b/grub-core/fs/sfs.c
+index 90f7fb3..de2b107 100644
+--- a/grub-core/fs/sfs.c
++++ b/grub-core/fs/sfs.c
+@@ -26,6 +26,7 @@
+ #include <grub/types.h>
+ #include <grub/fshelp.h>
+ #include <grub/charset.h>
++#include <grub/safemath.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -307,10 +308,15 @@ grub_sfs_read_block (grub_fshelp_node_t node, grub_disk_addr_t fileblock)
+       if (node->cache && node->cache_size >= node->cache_allocated)
+ 	{
+ 	  struct cache_entry *e = node->cache;
+-	  e = grub_realloc (node->cache,node->cache_allocated * 2
+-			    * sizeof (e[0]));
++	  grub_size_t sz;
++
++	  if (grub_mul (node->cache_allocated, 2 * sizeof (e[0]), &sz))
++	    goto fail;
++
++	  e = grub_realloc (node->cache, sz);
+ 	  if (!e)
+ 	    {
++ fail:
+ 	      grub_errno = 0;
+ 	      grub_free (node->cache);
+ 	      node->cache = 0;
+@@ -477,10 +483,16 @@ grub_sfs_create_node (struct grub_fshelp_node **node,
+   grub_size_t len = grub_strlen (name);
+   grub_uint8_t *name_u8;
+   int ret;
++  grub_size_t sz;
++
++  if (grub_mul (len, GRUB_MAX_UTF8_PER_LATIN1, &sz) ||
++      grub_add (sz, 1, &sz))
++    return 1;
++
+   *node = grub_malloc (sizeof (**node));
+   if (!*node)
+     return 1;
+-  name_u8 = grub_malloc (len * GRUB_MAX_UTF8_PER_LATIN1 + 1);
++  name_u8 = grub_malloc (sz);
+   if (!name_u8)
+     {
+       grub_free (*node);
+@@ -724,8 +736,13 @@ grub_sfs_label (grub_device_t device, char **label)
+   data = grub_sfs_mount (disk);
+   if (data)
+     {
+-      grub_size_t len = grub_strlen (data->label);
+-      *label = grub_malloc (len * GRUB_MAX_UTF8_PER_LATIN1 + 1);
++      grub_size_t sz, len = grub_strlen (data->label);
++
++      if (grub_mul (len, GRUB_MAX_UTF8_PER_LATIN1, &sz) ||
++	  grub_add (sz, 1, &sz))
++	return GRUB_ERR_OUT_OF_RANGE;
++
++      *label = grub_malloc (sz);
+       if (*label)
+ 	*grub_latin1_to_utf8 ((grub_uint8_t *) *label,
+ 			      (const grub_uint8_t *) data->label,
+diff --git a/grub-core/fs/squash4.c b/grub-core/fs/squash4.c
+index 95d5c1e..7851238 100644
+--- a/grub-core/fs/squash4.c
++++ b/grub-core/fs/squash4.c
+@@ -26,6 +26,7 @@
+ #include <grub/types.h>
+ #include <grub/fshelp.h>
+ #include <grub/deflate.h>
++#include <grub/safemath.h>
+ #include <minilzo.h>
+ 
+ #include "xz.h"
+@@ -459,7 +460,17 @@ grub_squash_read_symlink (grub_fshelp_node_t node)
+ {
+   char *ret;
+   grub_err_t err;
+-  ret = grub_malloc (grub_le_to_cpu32 (node->ino.symlink.namelen) + 1);
++  grub_size_t sz;
++
++  if (grub_add (grub_le_to_cpu32 (node->ino.symlink.namelen), 1, &sz))
++    {
++      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is detected"));
++      return NULL;
++    }
++
++  ret = grub_malloc (sz);
++  if (!ret)
++    return NULL;
+ 
+   err = read_chunk (node->data, ret,
+ 		    grub_le_to_cpu32 (node->ino.symlink.namelen),
+@@ -506,11 +517,16 @@ grub_squash_iterate_dir (grub_fshelp_node_t dir,
+ 
+   {
+     grub_fshelp_node_t node;
+-    node = grub_malloc (sizeof (*node) + dir->stsize * sizeof (dir->stack[0]));
++    grub_size_t sz;
++
++    if (grub_mul (dir->stsize, sizeof (dir->stack[0]), &sz) ||
++	grub_add (sz, sizeof (*node), &sz))
++      return 0;
++
++    node = grub_malloc (sz);
+     if (!node)
+       return 0;
+-    grub_memcpy (node, dir,
+-		 sizeof (*node) + dir->stsize * sizeof (dir->stack[0]));
++    grub_memcpy (node, dir, sz);
+     if (hook (".", GRUB_FSHELP_DIR, node, hook_data))
+       return 1;
+ 
+@@ -518,12 +534,15 @@ grub_squash_iterate_dir (grub_fshelp_node_t dir,
+       {
+ 	grub_err_t err;
+ 
+-	node = grub_malloc (sizeof (*node) + dir->stsize * sizeof (dir->stack[0]));
++	if (grub_mul (dir->stsize, sizeof (dir->stack[0]), &sz) ||
++	    grub_add (sz, sizeof (*node), &sz))
++	  return 0;
++
++	node = grub_malloc (sz);
+ 	if (!node)
+ 	  return 0;
+ 
+-	grub_memcpy (node, dir,
+-		     sizeof (*node) + dir->stsize * sizeof (dir->stack[0]));
++	grub_memcpy (node, dir, sz);
+ 
+ 	node->stsize--;
+ 	err = read_chunk (dir->data, &node->ino, sizeof (node->ino),
+@@ -557,6 +576,7 @@ grub_squash_iterate_dir (grub_fshelp_node_t dir,
+ 	  enum grub_fshelp_filetype filetype = GRUB_FSHELP_REG;
+ 	  struct grub_squash_dirent di;
+ 	  struct grub_squash_inode ino;
++	  grub_size_t sz;
+ 
+ 	  err = read_chunk (dir->data, &di, sizeof (di),
+ 			    grub_le_to_cpu64 (dir->data->sb.diroffset)
+@@ -589,13 +609,16 @@ grub_squash_iterate_dir (grub_fshelp_node_t dir,
+ 	  if (grub_le_to_cpu16 (di.type) == SQUASH_TYPE_SYMLINK)
+ 	    filetype = GRUB_FSHELP_SYMLINK;
+ 
+-	  node = grub_malloc (sizeof (*node)
+-			      + (dir->stsize + 1) * sizeof (dir->stack[0]));
++	  if (grub_add (dir->stsize, 1, &sz) ||
++	      grub_mul (sz, sizeof (dir->stack[0]), &sz) ||
++	      grub_add (sz, sizeof (*node), &sz))
++	    return 0;
++
++	  node = grub_malloc (sz);
+ 	  if (! node)
+ 	    return 0;
+ 
+-	  grub_memcpy (node, dir,
+-		       sizeof (*node) + dir->stsize * sizeof (dir->stack[0]));
++	  grub_memcpy (node, dir, sz - sizeof(dir->stack[0]));
+ 
+ 	  node->ino = ino;
+ 	  node->stack[node->stsize].ino_chunk = grub_le_to_cpu32 (dh.ino_chunk);
+diff --git a/grub-core/fs/udf.c b/grub-core/fs/udf.c
+index a837616..21ac7f4 100644
+--- a/grub-core/fs/udf.c
++++ b/grub-core/fs/udf.c
+@@ -28,6 +28,7 @@
+ #include <grub/charset.h>
+ #include <grub/datetime.h>
+ #include <grub/udf.h>
++#include <grub/safemath.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -890,9 +891,19 @@ read_string (const grub_uint8_t *raw, grub_size_t sz, char *outbuf)
+ 	utf16[i] = (raw[2 * i + 1] << 8) | raw[2*i + 2];
+     }
+   if (!outbuf)
+-    outbuf = grub_malloc (utf16len * GRUB_MAX_UTF8_PER_UTF16 + 1);
++    {
++      grub_size_t size;
++
++      if (grub_mul (utf16len, GRUB_MAX_UTF8_PER_UTF16, &size) ||
++	  grub_add (size, 1, &size))
++	goto fail;
++
++      outbuf = grub_malloc (size);
++    }
+   if (outbuf)
+     *grub_utf16_to_utf8 ((grub_uint8_t *) outbuf, utf16, utf16len) = '\0';
++
++ fail:
+   grub_free (utf16);
+   return outbuf;
+ }
+@@ -1005,7 +1016,7 @@ grub_udf_read_symlink (grub_fshelp_node_t node)
+   grub_size_t sz = U64 (node->block.fe.file_size);
+   grub_uint8_t *raw;
+   const grub_uint8_t *ptr;
+-  char *out, *optr;
++  char *out = NULL, *optr;
+ 
+   if (sz < 4)
+     return NULL;
+@@ -1013,14 +1024,16 @@ grub_udf_read_symlink (grub_fshelp_node_t node)
+   if (!raw)
+     return NULL;
+   if (grub_udf_read_file (node, NULL, NULL, 0, sz, (char *) raw) < 0)
+-    {
+-      grub_free (raw);
+-      return NULL;
+-    }
++    goto fail_1;
+ 
+-  out = grub_malloc (sz * 2 + 1);
++  if (grub_mul (sz, 2, &sz) ||
++      grub_add (sz, 1, &sz))
++    goto fail_0;
++
++  out = grub_malloc (sz);
+   if (!out)
+     {
++ fail_0:
+       grub_free (raw);
+       return NULL;
+     }
+@@ -1031,17 +1044,17 @@ grub_udf_read_symlink (grub_fshelp_node_t node)
+     {
+       grub_size_t s;
+       if ((grub_size_t) (ptr - raw + 4) > sz)
+-	goto fail;
++	goto fail_1;
+       if (!(ptr[2] == 0 && ptr[3] == 0))
+-	goto fail;
++	goto fail_1;
+       s = 4 + ptr[1];
+       if ((grub_size_t) (ptr - raw + s) > sz)
+-	goto fail;
++	goto fail_1;
+       switch (*ptr)
+ 	{
+ 	case 1:
+ 	  if (ptr[1])
+-	    goto fail;
++	    goto fail_1;
+ 	  /* Fallthrough.  */
+ 	case 2:
+ 	  /* in 4 bytes. out: 1 byte.  */
+@@ -1066,11 +1079,11 @@ grub_udf_read_symlink (grub_fshelp_node_t node)
+ 	  if (optr != out)
+ 	    *optr++ = '/';
+ 	  if (!read_string (ptr + 4, s - 4, optr))
+-	    goto fail;
++	    goto fail_1;
+ 	  optr += grub_strlen (optr);
+ 	  break;
+ 	default:
+-	  goto fail;
++	  goto fail_1;
+ 	}
+       ptr += s;
+     }
+@@ -1078,7 +1091,7 @@ grub_udf_read_symlink (grub_fshelp_node_t node)
+   grub_free (raw);
+   return out;
+ 
+- fail:
++ fail_1:
+   grub_free (raw);
+   grub_free (out);
+   grub_error (GRUB_ERR_BAD_FS, "invalid symlink");
+diff --git a/grub-core/fs/xfs.c b/grub-core/fs/xfs.c
+index 96ffecb..ea65902 100644
+--- a/grub-core/fs/xfs.c
++++ b/grub-core/fs/xfs.c
+@@ -25,6 +25,7 @@
+ #include <grub/dl.h>
+ #include <grub/types.h>
+ #include <grub/fshelp.h>
++#include <grub/safemath.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -899,6 +900,7 @@ static struct grub_xfs_data *
+ grub_xfs_mount (grub_disk_t disk)
+ {
+   struct grub_xfs_data *data = 0;
++  grub_size_t sz;
+ 
+   data = grub_zalloc (sizeof (struct grub_xfs_data));
+   if (!data)
+@@ -913,10 +915,11 @@ grub_xfs_mount (grub_disk_t disk)
+   if (!grub_xfs_sb_valid(data))
+     goto fail;
+ 
+-  data = grub_realloc (data,
+-		       sizeof (struct grub_xfs_data)
+-		       - sizeof (struct grub_xfs_inode)
+-		       + grub_xfs_inode_size(data) + 1);
++  if (grub_add (grub_xfs_inode_size (data),
++      sizeof (struct grub_xfs_data) - sizeof (struct grub_xfs_inode) + 1, &sz))
++    goto fail;
++
++  data = grub_realloc (data, sz);
+ 
+   if (! data)
+     goto fail;
+diff --git a/grub-core/fs/zfs/zfs.c b/grub-core/fs/zfs/zfs.c
+index 381dde5..36d0373 100644
+--- a/grub-core/fs/zfs/zfs.c
++++ b/grub-core/fs/zfs/zfs.c
+@@ -55,6 +55,7 @@
+ #include <grub/deflate.h>
+ #include <grub/crypto.h>
+ #include <grub/i18n.h>
++#include <grub/safemath.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -773,11 +774,14 @@ fill_vdev_info (struct grub_zfs_data *data,
+   if (data->n_devices_attached > data->n_devices_allocated)
+     {
+       void *tmp;
+-      data->n_devices_allocated = 2 * data->n_devices_attached + 1;
+-      data->devices_attached
+-	= grub_realloc (tmp = data->devices_attached,
+-			data->n_devices_allocated
+-			* sizeof (data->devices_attached[0]));
++      grub_size_t sz;
++
++      if (grub_mul (data->n_devices_attached, 2, &data->n_devices_allocated) ||
++	  grub_add (data->n_devices_allocated, 1, &data->n_devices_allocated) ||
++	  grub_mul (data->n_devices_allocated, sizeof (data->devices_attached[0]), &sz))
++	return GRUB_ERR_OUT_OF_RANGE;
++
++      data->devices_attached = grub_realloc (tmp = data->devices_attached, sz);
+       if (!data->devices_attached)
+ 	{
+ 	  data->devices_attached = tmp;
+@@ -3468,14 +3472,18 @@ grub_zfs_nvlist_lookup_nvlist (const char *nvlist, const char *name)
+ {
+   char *nvpair;
+   char *ret;
+-  grub_size_t size;
++  grub_size_t size, sz;
+   int found;
+ 
+   found = nvlist_find_value (nvlist, name, DATA_TYPE_NVLIST, &nvpair,
+ 			     &size, 0);
+   if (!found)
+     return 0;
+-  ret = grub_zalloc (size + 3 * sizeof (grub_uint32_t));
++
++  if (grub_add (size, 3 * sizeof (grub_uint32_t), &sz))
++      return 0;
++
++  ret = grub_zalloc (sz);
+   if (!ret)
+     return 0;
+   grub_memcpy (ret, nvlist, sizeof (grub_uint32_t));
+diff --git a/grub-core/fs/zfs/zfscrypt.c b/grub-core/fs/zfs/zfscrypt.c
+index 1402e0b..de3b015 100644
+--- a/grub-core/fs/zfs/zfscrypt.c
++++ b/grub-core/fs/zfs/zfscrypt.c
+@@ -22,6 +22,7 @@
+ #include <grub/misc.h>
+ #include <grub/disk.h>
+ #include <grub/partition.h>
++#include <grub/safemath.h>
+ #include <grub/dl.h>
+ #include <grub/types.h>
+ #include <grub/zfs/zfs.h>
+@@ -82,9 +83,13 @@ grub_zfs_add_key (grub_uint8_t *key_in,
+ 		  int passphrase)
+ {
+   struct grub_zfs_wrap_key *key;
++  grub_size_t sz;
++
+   if (!passphrase && keylen > 32)
+     keylen = 32;
+-  key = grub_malloc (sizeof (*key) + keylen);
++  if (grub_add (sizeof (*key), keylen, &sz))
++    return GRUB_ERR_OUT_OF_RANGE;
++  key = grub_malloc (sz);
+   if (!key)
+     return grub_errno;
+   key->is_passphrase = passphrase;
+diff --git a/grub-core/lib/arg.c b/grub-core/lib/arg.c
+index fd7744a..3288609 100644
+--- a/grub-core/lib/arg.c
++++ b/grub-core/lib/arg.c
+@@ -23,6 +23,7 @@
+ #include <grub/term.h>
+ #include <grub/extcmd.h>
+ #include <grub/i18n.h>
++#include <grub/safemath.h>
+ 
+ /* Built-in parser for default options.  */
+ static const struct grub_arg_option help_options[] =
+@@ -216,7 +217,13 @@ static inline grub_err_t
+ add_arg (char ***argl, int *num, char *s)
+ {
+   char **p = *argl;
+-  *argl = grub_realloc (*argl, (++(*num) + 1) * sizeof (char *));
++  grub_size_t sz;
++
++  if (grub_add (++(*num), 1, &sz) ||
++      grub_mul (sz, sizeof (char *), &sz))
++    return grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is detected"));
++
++  *argl = grub_realloc (*argl, sz);
+   if (! *argl)
+     {
+       grub_free (p);
+@@ -431,6 +438,7 @@ grub_arg_list_alloc(grub_extcmd_t extcmd, int argc,
+   grub_size_t argcnt;
+   struct grub_arg_list *list;
+   const struct grub_arg_option *options;
++  grub_size_t sz0, sz1;
+ 
+   options = extcmd->options;
+   if (! options)
+@@ -443,7 +451,15 @@ grub_arg_list_alloc(grub_extcmd_t extcmd, int argc,
+ 	argcnt += ((grub_size_t) argc + 1) / 2 + 1; /* max possible for any option */
+     }
+ 
+-  list = grub_zalloc (sizeof (*list) * i + sizeof (char*) * argcnt);
++  if (grub_mul (sizeof (*list), i, &sz0) ||
++      grub_mul (sizeof (char *), argcnt, &sz1) ||
++      grub_add (sz0, sz1, &sz0))
++    {
++      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is detected"));
++      return 0;
++    }
++
++  list = grub_zalloc (sz0);
+   if (! list)
+     return 0;
+ 
+diff --git a/grub-core/loader/i386/bsd.c b/grub-core/loader/i386/bsd.c
+index 3730ed3..b92cbe9 100644
+--- a/grub-core/loader/i386/bsd.c
++++ b/grub-core/loader/i386/bsd.c
+@@ -35,6 +35,7 @@
+ #include <grub/ns8250.h>
+ #include <grub/bsdlabel.h>
+ #include <grub/crypto.h>
++#include <grub/safemath.h>
+ #include <grub/verify.h>
+ #ifdef GRUB_MACHINE_PCBIOS
+ #include <grub/machine/int.h>
+@@ -1012,11 +1013,16 @@ grub_netbsd_add_modules (void)
+   struct grub_netbsd_btinfo_modules *mods;
+   unsigned i;
+   grub_err_t err;
++  grub_size_t sz;
+ 
+   for (mod = netbsd_mods; mod; mod = mod->next)
+     modcnt++;
+ 
+-  mods = grub_malloc (sizeof (*mods) + sizeof (mods->mods[0]) * modcnt);
++  if (grub_mul (modcnt, sizeof (mods->mods[0]), &sz) ||
++      grub_add (sz, sizeof (*mods), &sz))
++    return GRUB_ERR_OUT_OF_RANGE;
++
++  mods = grub_malloc (sz);
+   if (!mods)
+     return grub_errno;
+ 
+diff --git a/grub-core/net/dns.c b/grub-core/net/dns.c
+index e332d5e..906ec7d 100644
+--- a/grub-core/net/dns.c
++++ b/grub-core/net/dns.c
+@@ -22,6 +22,7 @@
+ #include <grub/i18n.h>
+ #include <grub/err.h>
+ #include <grub/time.h>
++#include <grub/safemath.h>
+ 
+ struct dns_cache_element
+ {
+@@ -51,9 +52,15 @@ grub_net_add_dns_server (const struct grub_net_network_level_address *s)
+     {
+       int na = dns_servers_alloc * 2;
+       struct grub_net_network_level_address *ns;
++      grub_size_t sz;
++
+       if (na < 8)
+ 	na = 8;
+-      ns = grub_realloc (dns_servers, na * sizeof (ns[0]));
++
++      if (grub_mul (na, sizeof (ns[0]), &sz))
++	return GRUB_ERR_OUT_OF_RANGE;
++
++      ns = grub_realloc (dns_servers, sz);
+       if (!ns)
+ 	return grub_errno;
+       dns_servers_alloc = na;
+diff --git a/grub-core/normal/charset.c b/grub-core/normal/charset.c
+index d57fb72..4dfcc31 100644
+--- a/grub-core/normal/charset.c
++++ b/grub-core/normal/charset.c
+@@ -48,6 +48,7 @@
+ #include <grub/unicode.h>
+ #include <grub/term.h>
+ #include <grub/normal.h>
++#include <grub/safemath.h>
+ 
+ #if HAVE_FONT_SOURCE
+ #include "widthspec.h"
+@@ -464,6 +465,7 @@ grub_unicode_aglomerate_comb (const grub_uint32_t *in, grub_size_t inlen,
+ 	{
+ 	  struct grub_unicode_combining *n;
+ 	  unsigned j;
++	  grub_size_t sz;
+ 
+ 	  if (!haveout)
+ 	    continue;
+@@ -477,10 +479,14 @@ grub_unicode_aglomerate_comb (const grub_uint32_t *in, grub_size_t inlen,
+ 	    n = out->combining_inline;
+ 	  else if (out->ncomb > (int) ARRAY_SIZE (out->combining_inline))
+ 	    {
+-	      n = grub_realloc (out->combining_ptr,
+-				sizeof (n[0]) * (out->ncomb + 1));
++	      if (grub_add (out->ncomb, 1, &sz) ||
++		  grub_mul (sz, sizeof (n[0]), &sz))
++		goto fail;
++
++	      n = grub_realloc (out->combining_ptr, sz);
+ 	      if (!n)
+ 		{
++ fail:
+ 		  grub_errno = GRUB_ERR_NONE;
+ 		  continue;
+ 		}
+diff --git a/grub-core/normal/cmdline.c b/grub-core/normal/cmdline.c
+index c57242e..de03fe6 100644
+--- a/grub-core/normal/cmdline.c
++++ b/grub-core/normal/cmdline.c
+@@ -28,6 +28,7 @@
+ #include <grub/env.h>
+ #include <grub/i18n.h>
+ #include <grub/charset.h>
++#include <grub/safemath.h>
+ 
+ static grub_uint32_t *kill_buf;
+ 
+@@ -307,12 +308,21 @@ cl_insert (struct cmdline_term *cl_terms, unsigned nterms,
+   if (len + (*llen) >= (*max_len))
+     {
+       grub_uint32_t *nbuf;
+-      (*max_len) *= 2;
+-      nbuf = grub_realloc ((*buf), sizeof (grub_uint32_t) * (*max_len));
++      grub_size_t sz;
++
++      if (grub_mul (*max_len, 2, max_len) ||
++	  grub_mul (*max_len, sizeof (grub_uint32_t), &sz))
++	{
++	  grub_errno = GRUB_ERR_OUT_OF_RANGE;
++	  goto fail;
++	}
++
++      nbuf = grub_realloc ((*buf), sz);
+       if (nbuf)
+ 	(*buf) = nbuf;
+       else
+ 	{
++ fail:
+ 	  grub_print_error ();
+ 	  grub_errno = GRUB_ERR_NONE;
+ 	  (*max_len) /= 2;
+diff --git a/grub-core/normal/menu_entry.c b/grub-core/normal/menu_entry.c
+index 1993995..50eef91 100644
+--- a/grub-core/normal/menu_entry.c
++++ b/grub-core/normal/menu_entry.c
+@@ -27,6 +27,7 @@
+ #include <grub/auth.h>
+ #include <grub/i18n.h>
+ #include <grub/charset.h>
++#include <grub/safemath.h>
+ 
+ enum update_mode
+   {
+@@ -113,10 +114,18 @@ ensure_space (struct line *linep, int extra)
+ {
+   if (linep->max_len < linep->len + extra)
+     {
+-      linep->max_len = 2 * (linep->len + extra);
+-      linep->buf = grub_realloc (linep->buf, (linep->max_len + 1) * sizeof (linep->buf[0]));
++      grub_size_t sz0, sz1;
++
++      if (grub_add (linep->len, extra, &sz0) ||
++	  grub_mul (sz0, 2, &sz0) ||
++	  grub_add (sz0, 1, &sz1) ||
++	  grub_mul (sz1, sizeof (linep->buf[0]), &sz1))
++	return 0;
++
++      linep->buf = grub_realloc (linep->buf, sz1);
+       if (! linep->buf)
+ 	return 0;
++      linep->max_len = sz0;
+     }
+ 
+   return 1;
+diff --git a/grub-core/script/argv.c b/grub-core/script/argv.c
+index 217ec5d..5751fdd 100644
+--- a/grub-core/script/argv.c
++++ b/grub-core/script/argv.c
+@@ -20,6 +20,7 @@
+ #include <grub/mm.h>
+ #include <grub/misc.h>
+ #include <grub/script_sh.h>
++#include <grub/safemath.h>
+ 
+ /* Return nearest power of two that is >= v.  */
+ static unsigned
+@@ -81,11 +82,16 @@ int
+ grub_script_argv_next (struct grub_script_argv *argv)
+ {
+   char **p = argv->args;
++  grub_size_t sz;
+ 
+   if (argv->args && argv->argc && argv->args[argv->argc - 1] == 0)
+     return 0;
+ 
+-  p = grub_realloc (p, round_up_exp ((argv->argc + 2) * sizeof (char *)));
++  if (grub_add (argv->argc, 2, &sz) ||
++      grub_mul (sz, sizeof (char *), &sz))
++    return 1;
++
++  p = grub_realloc (p, round_up_exp (sz));
+   if (! p)
+     return 1;
+ 
+@@ -105,13 +111,19 @@ grub_script_argv_append (struct grub_script_argv *argv, const char *s,
+ {
+   grub_size_t a;
+   char *p = argv->args[argv->argc - 1];
++  grub_size_t sz;
+ 
+   if (! s)
+     return 0;
+ 
+   a = p ? grub_strlen (p) : 0;
+ 
+-  p = grub_realloc (p, round_up_exp ((a + slen + 1) * sizeof (char)));
++  if (grub_add (a, slen, &sz) ||
++      grub_add (sz, 1, &sz) ||
++      grub_mul (sz, sizeof (char), &sz))
++    return 1;
++
++  p = grub_realloc (p, round_up_exp (sz));
+   if (! p)
+     return 1;
+ 
+diff --git a/grub-core/script/lexer.c b/grub-core/script/lexer.c
+index c6bd317..5fb0cbd 100644
+--- a/grub-core/script/lexer.c
++++ b/grub-core/script/lexer.c
+@@ -24,6 +24,7 @@
+ #include <grub/mm.h>
+ #include <grub/script_sh.h>
+ #include <grub/i18n.h>
++#include <grub/safemath.h>
+ 
+ #define yytext_ptr char *
+ #include "grub_script.tab.h"
+@@ -110,10 +111,14 @@ grub_script_lexer_record (struct grub_parser_param *parser, char *str)
+       old = lexer->recording;
+       if (lexer->recordlen < len)
+ 	lexer->recordlen = len;
+-      lexer->recordlen *= 2;
++
++      if (grub_mul (lexer->recordlen, 2, &lexer->recordlen))
++	goto fail;
++
+       lexer->recording = grub_realloc (lexer->recording, lexer->recordlen);
+       if (!lexer->recording)
+ 	{
++ fail:
+ 	  grub_free (old);
+ 	  lexer->recordpos = 0;
+ 	  lexer->recordlen = 0;
+@@ -130,7 +135,7 @@ int
+ grub_script_lexer_yywrap (struct grub_parser_param *parserstate,
+ 			  const char *input)
+ {
+-  grub_size_t len = 0;
++  grub_size_t len = 0, sz;
+   char *p = 0;
+   char *line = 0;
+   YY_BUFFER_STATE buffer;
+@@ -168,12 +173,22 @@ grub_script_lexer_yywrap (struct grub_parser_param *parserstate,
+     }
+   else if (len && line[len - 1] != '\n')
+     {
+-      p = grub_realloc (line, len + 2);
++      if (grub_add (len, 2, &sz))
++	{
++	  grub_free (line);
++	  grub_script_yyerror (parserstate, N_("overflow is detected"));
++	  return 1;
++	}
++
++      p = grub_realloc (line, sz);
+       if (p)
+ 	{
+ 	  p[len++] = '\n';
+ 	  p[len] = '\0';
+ 	}
++      else
++	grub_free (line);
++
+       line = p;
+     }
+ 
+diff --git a/grub-core/video/bitmap.c b/grub-core/video/bitmap.c
+index b2e0315..6256e20 100644
+--- a/grub-core/video/bitmap.c
++++ b/grub-core/video/bitmap.c
+@@ -23,6 +23,7 @@
+ #include <grub/mm.h>
+ #include <grub/misc.h>
+ #include <grub/i18n.h>
++#include <grub/safemath.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -58,7 +59,7 @@ grub_video_bitmap_create (struct grub_video_bitmap **bitmap,
+                           enum grub_video_blit_format blit_format)
+ {
+   struct grub_video_mode_info *mode_info;
+-  unsigned int size;
++  grub_size_t size;
+ 
+   if (!bitmap)
+     return grub_error (GRUB_ERR_BUG, "invalid argument");
+@@ -137,19 +138,25 @@ grub_video_bitmap_create (struct grub_video_bitmap **bitmap,
+ 
+   mode_info->pitch = width * mode_info->bytes_per_pixel;
+ 
+-  /* Calculate size needed for the data.  */
+-  size = (width * mode_info->bytes_per_pixel) * height;
++  /* Calculate size needed for the data. */
++  if (grub_mul (width, mode_info->bytes_per_pixel, &size) ||
++      grub_mul (size, height, &size))
++    {
++      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is detected"));
++      goto fail;
++    }
+ 
+   (*bitmap)->data = grub_zalloc (size);
+   if (! (*bitmap)->data)
+-    {
+-      grub_free (*bitmap);
+-      *bitmap = 0;
+-
+-      return grub_errno;
+-    }
++    goto fail;
+ 
+   return GRUB_ERR_NONE;
++
++ fail:
++  grub_free (*bitmap);
++  *bitmap = NULL;
++
++  return grub_errno;
+ }
+ 
+ /* Frees all resources allocated by bitmap.  */
+diff --git a/grub-core/video/readers/png.c b/grub-core/video/readers/png.c
+index 61bd645..0157ff7 100644
+--- a/grub-core/video/readers/png.c
++++ b/grub-core/video/readers/png.c
+@@ -23,6 +23,7 @@
+ #include <grub/mm.h>
+ #include <grub/misc.h>
+ #include <grub/bufio.h>
++#include <grub/safemath.h>
+ 
+ GRUB_MOD_LICENSE ("GPLv3+");
+ 
+@@ -301,9 +302,17 @@ grub_png_decode_image_header (struct grub_png_data *data)
+       data->bpp <<= 1;
+ 
+   data->color_bits = color_bits;
+-  data->row_bytes = data->image_width * data->bpp;
++
++  if (grub_mul (data->image_width, data->bpp, &data->row_bytes))
++    return grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is detected"));
++
+   if (data->color_bits <= 4)
+-    data->row_bytes = (data->image_width * data->color_bits + 7) / 8;
++    {
++      if (grub_mul (data->image_width, data->color_bits + 7, &data->row_bytes))
++	return grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is detected"));
++
++      data->row_bytes >>= 3;
++    }
+ 
+ #ifndef GRUB_CPU_WORDS_BIGENDIAN
+   if (data->is_16bit || data->is_gray || data->is_palette)
+-- 
+2.14.4
+
diff --git a/meta/recipes-bsp/grub/files/0007-script-Remove-unused-fields-from-grub_script_functio.patch b/meta/recipes-bsp/grub/files/0007-script-Remove-unused-fields-from-grub_script_functio.patch
new file mode 100644
index 0000000000..84a80d5ffd
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0007-script-Remove-unused-fields-from-grub_script_functio.patch
@@ -0,0 +1,37 @@
+From e219bad8cee67b2bb21712df8f055706f8da25d2 Mon Sep 17 00:00:00 2001
+From: Chris Coulson <chris.coulson@canonical.com>
+Date: Fri, 10 Jul 2020 11:21:14 +0100
+Subject: [PATCH 7/9] script: Remove unused fields from grub_script_function
+ struct
+
+Upstream-Status: Backport [commit 1a8d9c9b4ab6df7669b5aa36a56477f297825b96
+from https://git.savannah.gnu.org/git/grub.git]
+
+Signed-off-by: Chris Coulson <chris.coulson@canonical.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
+---
+ include/grub/script_sh.h | 5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/include/grub/script_sh.h b/include/grub/script_sh.h
+index 360c2be..b382bcf 100644
+--- a/include/grub/script_sh.h
++++ b/include/grub/script_sh.h
+@@ -359,13 +359,8 @@ struct grub_script_function
+   /* The script function.  */
+   struct grub_script *func;
+ 
+-  /* The flags.  */
+-  unsigned flags;
+-
+   /* The next element.  */
+   struct grub_script_function *next;
+-
+-  int references;
+ };
+ typedef struct grub_script_function *grub_script_function_t;
+ 
+-- 
+2.14.4
+
diff --git a/meta/recipes-bsp/grub/files/0008-script-Avoid-a-use-after-free-when-redefining-a-func.patch b/meta/recipes-bsp/grub/files/0008-script-Avoid-a-use-after-free-when-redefining-a-func.patch
new file mode 100644
index 0000000000..fedfc5d203
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0008-script-Avoid-a-use-after-free-when-redefining-a-func.patch
@@ -0,0 +1,113 @@
+From c65fc7e75b7b7e880d90766057040011701e97f4 Mon Sep 17 00:00:00 2001
+From: Chris Coulson <chris.coulson@canonical.com>
+Date: Fri, 10 Jul 2020 14:41:45 +0100
+Subject: [PATCH 8/9] script: Avoid a use-after-free when redefining a function
+ during execution
+
+Defining a new function with the same name as a previously defined
+function causes the grub_script and associated resources for the
+previous function to be freed. If the previous function is currently
+executing when a function with the same name is defined, this results
+in use-after-frees when processing subsequent commands in the original
+function.
+
+Instead, reject a new function definition if it has the same name as
+a previously defined function, and that function is currently being
+executed. Although a behavioural change, this should be backwards
+compatible with existing configurations because they can't be
+dependent on the current behaviour without being broken.
+
+Fixes: CVE-2020-15706
+
+Upstream-Status: Backport [commit 426f57383d647406ae9c628c472059c27cd6e040
+from https://git.savannah.gnu.org/git/grub.git]
+
+Signed-off-by: Chris Coulson <chris.coulson@canonical.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
+---
+ grub-core/script/execute.c  |  2 ++
+ grub-core/script/function.c | 16 +++++++++++++---
+ grub-core/script/parser.y   |  3 ++-
+ include/grub/script_sh.h    |  2 ++
+ 4 files changed, 19 insertions(+), 4 deletions(-)
+
+diff --git a/grub-core/script/execute.c b/grub-core/script/execute.c
+index c8d6806..7e028e1 100644
+--- a/grub-core/script/execute.c
++++ b/grub-core/script/execute.c
+@@ -838,7 +838,9 @@ grub_script_function_call (grub_script_function_t func, int argc, char **args)
+   old_scope = scope;
+   scope = &new_scope;
+ 
++  func->executing++;
+   ret = grub_script_execute (func->func);
++  func->executing--;
+ 
+   function_return = 0;
+   active_loops = loops;
+diff --git a/grub-core/script/function.c b/grub-core/script/function.c
+index d36655e..3aad04b 100644
+--- a/grub-core/script/function.c
++++ b/grub-core/script/function.c
+@@ -34,6 +34,7 @@ grub_script_function_create (struct grub_script_arg *functionname_arg,
+   func = (grub_script_function_t) grub_malloc (sizeof (*func));
+   if (! func)
+     return 0;
++  func->executing = 0;
+ 
+   func->name = grub_strdup (functionname_arg->str);
+   if (! func->name)
+@@ -60,10 +61,19 @@ grub_script_function_create (struct grub_script_arg *functionname_arg,
+       grub_script_function_t q;
+ 
+       q = *p;
+-      grub_script_free (q->func);
+-      q->func = cmd;
+       grub_free (func);
+-      func = q;
++      if (q->executing > 0)
++        {
++          grub_error (GRUB_ERR_BAD_ARGUMENT,
++		      N_("attempt to redefine a function being executed"));
++          func = NULL;
++        }
++      else
++        {
++          grub_script_free (q->func);
++          q->func = cmd;
++          func = q;
++        }
+     }
+   else
+     {
+diff --git a/grub-core/script/parser.y b/grub-core/script/parser.y
+index 4f0ab83..f80b86b 100644
+--- a/grub-core/script/parser.y
++++ b/grub-core/script/parser.y
+@@ -289,7 +289,8 @@ function: "function" "name"
+ 	      grub_script_mem_free (state->func_mem);
+ 	    else {
+ 	      script->children = state->scripts;
+-	      grub_script_function_create ($2, script);
++	      if (!grub_script_function_create ($2, script))
++		grub_script_free (script);
+ 	    }
+ 
+ 	    state->scripts = $<scripts>3;
+diff --git a/include/grub/script_sh.h b/include/grub/script_sh.h
+index b382bcf..6c48e07 100644
+--- a/include/grub/script_sh.h
++++ b/include/grub/script_sh.h
+@@ -361,6 +361,8 @@ struct grub_script_function
+ 
+   /* The next element.  */
+   struct grub_script_function *next;
++
++  unsigned executing;
+ };
+ typedef struct grub_script_function *grub_script_function_t;
+ 
+-- 
+2.14.4
+
diff --git a/meta/recipes-bsp/grub/files/0009-linux-Fix-integer-overflows-in-initrd-size-handling.patch b/meta/recipes-bsp/grub/files/0009-linux-Fix-integer-overflows-in-initrd-size-handling.patch
new file mode 100644
index 0000000000..0731f0ec53
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0009-linux-Fix-integer-overflows-in-initrd-size-handling.patch
@@ -0,0 +1,173 @@
+From 68a09a74f6d726d79709847f3671c0a08e4fb5a0 Mon Sep 17 00:00:00 2001
+From: Colin Watson <cjwatson@debian.org>
+Date: Sat, 25 Jul 2020 12:15:37 +0100
+Subject: [PATCH 9/9] linux: Fix integer overflows in initrd size handling
+
+These could be triggered by a crafted filesystem with very large files.
+
+Fixes: CVE-2020-15707
+
+Upstream-Status: Backport [commit e7b8856f8be3292afdb38d2e8c70ad8d62a61e10
+from https://git.savannah.gnu.org/git/grub.git]
+
+Signed-off-by: Colin Watson <cjwatson@debian.org>
+Reviewed-by: Jan Setje-Eilers <jan.setjeeilers@oracle.com>
+Reviewed-by: Daniel Kiper <daniel.kiper@oracle.com>
+Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
+---
+ grub-core/loader/linux.c | 74 +++++++++++++++++++++++++++++++++++-------------
+ 1 file changed, 54 insertions(+), 20 deletions(-)
+
+diff --git a/grub-core/loader/linux.c b/grub-core/loader/linux.c
+index 471b214..8c8565a 100644
+--- a/grub-core/loader/linux.c
++++ b/grub-core/loader/linux.c
+@@ -4,6 +4,7 @@
+ #include <grub/misc.h>
+ #include <grub/file.h>
+ #include <grub/mm.h>
++#include <grub/safemath.h>
+ 
+ struct newc_head
+ {
+@@ -98,13 +99,13 @@ free_dir (struct dir *root)
+   grub_free (root);
+ }
+ 
+-static grub_size_t
++static grub_err_t
+ insert_dir (const char *name, struct dir **root,
+-	    grub_uint8_t *ptr)
++	    grub_uint8_t *ptr, grub_size_t *size)
+ {
+   struct dir *cur, **head = root;
+   const char *cb, *ce = name;
+-  grub_size_t size = 0;
++  *size = 0;
+   while (1)
+     {
+       for (cb = ce; *cb == '/'; cb++);
+@@ -130,14 +131,22 @@ insert_dir (const char *name, struct dir **root,
+ 	      ptr = make_header (ptr, name, ce - name,
+ 				 040777, 0);
+ 	    }
+-	  size += ALIGN_UP ((ce - (char *) name)
+-			    + sizeof (struct newc_head), 4);
++	  if (grub_add (*size,
++		        ALIGN_UP ((ce - (char *) name)
++				  + sizeof (struct newc_head), 4),
++			size))
++	    {
++	      grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is detected"));
++	      grub_free (n->name);
++	      grub_free (n);
++	      return grub_errno;
++	    }
+ 	  *head = n;
+ 	  cur = n;
+ 	}
+       root = &cur->next;
+     }
+-  return size;
++  return GRUB_ERR_NONE;
+ }
+ 
+ grub_err_t
+@@ -173,26 +182,33 @@ grub_initrd_init (int argc, char *argv[],
+ 	  eptr = grub_strchr (ptr, ':');
+ 	  if (eptr)
+ 	    {
++	      grub_size_t dir_size, name_len;
++
+ 	      initrd_ctx->components[i].newc_name = grub_strndup (ptr, eptr - ptr);
+-	      if (!initrd_ctx->components[i].newc_name)
++	      if (!initrd_ctx->components[i].newc_name ||
++		  insert_dir (initrd_ctx->components[i].newc_name, &root, 0,
++			      &dir_size))
+ 		{
+ 		  grub_initrd_close (initrd_ctx);
+ 		  return grub_errno;
+ 		}
+-	      initrd_ctx->size
+-		+= ALIGN_UP (sizeof (struct newc_head)
+-			    + grub_strlen (initrd_ctx->components[i].newc_name),
+-			     4);
+-	      initrd_ctx->size += insert_dir (initrd_ctx->components[i].newc_name,
+-					      &root, 0);
++	      name_len = grub_strlen (initrd_ctx->components[i].newc_name);
++	      if (grub_add (initrd_ctx->size,
++			    ALIGN_UP (sizeof (struct newc_head) + name_len, 4),
++			    &initrd_ctx->size) ||
++		  grub_add (initrd_ctx->size, dir_size, &initrd_ctx->size))
++		goto overflow;
+ 	      newc = 1;
+ 	      fname = eptr + 1;
+ 	    }
+ 	}
+       else if (newc)
+ 	{
+-	  initrd_ctx->size += ALIGN_UP (sizeof (struct newc_head)
+-					+ sizeof ("TRAILER!!!") - 1, 4);
++	  if (grub_add (initrd_ctx->size,
++			ALIGN_UP (sizeof (struct newc_head)
++				  + sizeof ("TRAILER!!!") - 1, 4),
++			&initrd_ctx->size))
++	    goto overflow;
+ 	  free_dir (root);
+ 	  root = 0;
+ 	  newc = 0;
+@@ -208,19 +224,29 @@ grub_initrd_init (int argc, char *argv[],
+       initrd_ctx->nfiles++;
+       initrd_ctx->components[i].size
+ 	= grub_file_size (initrd_ctx->components[i].file);
+-      initrd_ctx->size += initrd_ctx->components[i].size;
++      if (grub_add (initrd_ctx->size, initrd_ctx->components[i].size,
++		    &initrd_ctx->size))
++	goto overflow;
+     }
+ 
+   if (newc)
+     {
+       initrd_ctx->size = ALIGN_UP (initrd_ctx->size, 4);
+-      initrd_ctx->size += ALIGN_UP (sizeof (struct newc_head)
+-				    + sizeof ("TRAILER!!!") - 1, 4);
++      if (grub_add (initrd_ctx->size,
++		    ALIGN_UP (sizeof (struct newc_head)
++			      + sizeof ("TRAILER!!!") - 1, 4),
++		    &initrd_ctx->size))
++	goto overflow;
+       free_dir (root);
+       root = 0;
+     }
+   
+   return GRUB_ERR_NONE;
++
++ overflow:
++  free_dir (root);
++  grub_initrd_close (initrd_ctx);
++  return grub_error (GRUB_ERR_OUT_OF_RANGE, N_("overflow is detected"));
+ }
+ 
+ grub_size_t
+@@ -261,8 +287,16 @@ grub_initrd_load (struct grub_linux_initrd_context *initrd_ctx,
+ 
+       if (initrd_ctx->components[i].newc_name)
+ 	{
+-	  ptr += insert_dir (initrd_ctx->components[i].newc_name,
+-			     &root, ptr);
++	  grub_size_t dir_size;
++
++	  if (insert_dir (initrd_ctx->components[i].newc_name, &root, ptr,
++			  &dir_size))
++	    {
++	      free_dir (root);
++	      grub_initrd_close (initrd_ctx);
++	      return grub_errno;
++	    }
++	  ptr += dir_size;
+ 	  ptr = make_header (ptr, initrd_ctx->components[i].newc_name,
+ 			     grub_strlen (initrd_ctx->components[i].newc_name),
+ 			     0100777,
+-- 
+2.14.4
+
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index 628ca64926..50a5478f54 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -18,6 +18,15 @@ SRC_URI = "${GNU_MIRROR}/grub/grub-${PV}.tar.gz \
            file://autogen.sh-exclude-pc.patch \
            file://grub-module-explicitly-keeps-symbole-.module_license.patch \
            file://0001-grub.d-10_linux.in-add-oe-s-kernel-name.patch \
+           file://0001-yylex-Make-lexer-fatal-errors-actually-be-fatal.patch\
+           file://0002-calloc-Make-sure-we-always-have-an-overflow-checking.patch \
+           file://0003-lvm-Add-LVM-cache-logical-volume-handling.patch \
+           file://0004-calloc-Use-calloc-at-most-places.patch \
+           file://0005-safemath-Add-some-arithmetic-primitives-that-check-f.patch \
+           file://0006-malloc-Use-overflow-checking-primitives-where-we-do-.patch \
+           file://0007-script-Remove-unused-fields-from-grub_script_functio.patch \
+           file://0008-script-Avoid-a-use-after-free-when-redefining-a-func.patch \
+           file://0009-linux-Fix-integer-overflows-in-initrd-size-handling.patch \
 "
 SRC_URI[md5sum] = "5ce674ca6b2612d8939b9e6abed32934"
 SRC_URI[sha256sum] = "f10c85ae3e204dbaec39ae22fa3c5e99f0665417e91c2cb49b7e5031658ba6ea"
-- 
2.14.4

