Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8271B724E4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Feb 2015 06:40:30 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id b16so24448684igk.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Feb 2015 22:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=vGzCdtlH/Q/LsLP6JRVgcSpOslYTDTzkxnFNA6jJxRk=;
	b=JpuaZcY0ioEVH725MiQlyu6Soa2ZC+gN5SMqkd+2atk+PQnZtGxw+3KkLVIROaJUPK
	hFZPOEzcujvzVKyYK9D3sdK0L8JFEBmDGSQGXuMrPMKDTluzlB541xEb+xMnjTJjI4r7
	r2pyy8ASCHe+7saazF9LXwAKwI64FfyZteimJHeuqj9Tl4yuFhLVuWRhJDUPUAAivnLO
	Pb4Cn2BrmsHmEpO+JpQUqjOuMFb8K6oUNvGia2+kwUgrQ65ojVWHFajOPmr7Nki6qf9T
	0Yo7FH/ILGrN7yoVVafjERlzdPCq/AszDYd2LMzkjj17buncdWDc8p5eqW/vwwUQFP3k
	1Myg==
X-Received: by 10.107.153.193 with SMTP id b184mr19168582ioe.85.1424760032013; 
	Mon, 23 Feb 2015 22:40:32 -0800 (PST)
Received: from kraj-ch2e.sys.comcast.net (a-96-119-88-205.sys.comcast.net.
	[96.119.88.205])
	by mx.google.com with ESMTPSA id qs3sm7557999igb.8.2015.02.23.22.40.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Feb 2015 22:40:31 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Feb 2015 06:39:59 +0000
Message-Id: <1424759999-25846-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] glibc: Help compile with -Os
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
X-List-Received-Date: Tue, 24 Feb 2015 06:40:32 -0000

When we modify to use -Os
-Werror doesnt go well with it, glibc needs to be
cleaned up for that but until then lets disable -Werror
when using -Os

Change-Id: I5495255fce67953f15c07e423e3e0eef41d4ce5e
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc.inc                  |  3 ++
 .../glibc/glibc/eglibc-use-option-groups.patch     | 47 ++++++++++++++++++----
 2 files changed, 43 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc.inc b/meta/recipes-core/glibc/glibc.inc
index 99a4753..4d5e98b 100644
--- a/meta/recipes-core/glibc/glibc.inc
+++ b/meta/recipes-core/glibc/glibc.inc
@@ -15,6 +15,9 @@ def get_optimization(d):
     if bb.utils.contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
         bb.note("glibc can't be built with -O0, -O2 will be used instead.")
         return selected_optimization.replace("-O0", "-O2")
+    elif bb.utils.contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
+        bb.note("glibc can't be built with -Os, -Os -Wno-error will be used instead.")
+        return selected_optimization.replace("-Os", "-Os -Wno-error")
     return selected_optimization
 
 SELECTED_OPTIMIZATION := "${@get_optimization(d)}"
diff --git a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch b/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
index 0fcaff9..439b4a9 100644
--- a/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
+++ b/meta/recipes-core/glibc/glibc/eglibc-use-option-groups.patch
@@ -2294,11 +2294,37 @@ Index: git/locale/programs/locfile.h
  /* Change the output to be big-endian if BIG_ENDIAN is true and
     little-endian otherwise.  */
  static inline void
-@@ -276,4 +278,49 @@ extern void identification_output (struc
+@@ -89,7 +91,8 @@ maybe_swap_uint32 (uint32_t value)
+ }
+ 
+ /* Likewise, but munge an array of N uint32_ts starting at ARRAY.  */
+-static inline void
++static void
++__attribute__ ((unused))
+ maybe_swap_uint32_array (uint32_t *array, size_t n)
+ {
+   if (swap_endianness_p)
+@@ -99,7 +102,8 @@ maybe_swap_uint32_array (uint32_t *array
+ 
+ /* Like maybe_swap_uint32_array, but the array of N elements is at
+    the end of OBSTACK's current object.  */
+-static inline void
++static void
++__attribute__ ((unused))
+ maybe_swap_uint32_obstack (struct obstack *obstack, size_t n)
+ {
+   maybe_swap_uint32_array ((uint32_t *) obstack_next_free (obstack) - n, n);
+@@ -276,4 +280,55 @@ extern void identification_output (struc
  				   const struct charmap_t *charmap,
  				   const char *output_path);
  
-+static inline size_t
++static size_t wcslen_uint32 (const uint32_t *str) __attribute__ ((unused));
++static uint32_t * wmemcpy_uint32 (uint32_t *s1, const uint32_t *s2, size_t n) __attribute__ ((unused));
++static uint32_t * wcschr_uint32 (const uint32_t *s, uint32_t ch) __attribute__ ((unused));
++static int wcscmp_uint32 (const uint32_t *s1, const uint32_t *s2) __attribute__ ((unused));
++static int wmemcmp_uint32 (const uint32_t *s1, const uint32_t *s2, size_t n) __attribute__ ((unused));
++
++static size_t
 +wcslen_uint32 (const uint32_t *str)
 +{
 +  size_t len = 0;
@@ -2307,7 +2333,7 @@ Index: git/locale/programs/locfile.h
 +  return len;
 +}
 +
-+static inline int
++static  int
 +wmemcmp_uint32 (const uint32_t *s1, const uint32_t *s2, size_t n)
 +{
 +  while (n-- != 0)
@@ -2319,7 +2345,7 @@ Index: git/locale/programs/locfile.h
 +  return 0;
 +}
 +
-+static inline int
++static int
 +wcscmp_uint32 (const uint32_t *s1, const uint32_t *s2)
 +{
 +  while (*s1 != 0 && *s1 == *s2)
@@ -2327,13 +2353,13 @@ Index: git/locale/programs/locfile.h
 +  return *s1 - *s2;
 +}
 +
-+static inline uint32_t *
++static uint32_t *
 +wmemcpy_uint32 (uint32_t *s1, const uint32_t *s2, size_t n)
 +{
 +  return memcpy (s1, s2, n * sizeof (uint32_t));
 +}
 +
-+static inline uint32_t *
++static uint32_t *
 +wcschr_uint32 (const uint32_t *s, uint32_t ch)
 +{
 +  do
@@ -5627,7 +5653,7 @@ Index: git/posix/regexec.c
        /* match with character_class?  */
        for (i = 0; i < cset->nchar_classes; ++i)
  	{
-@@ -3863,8 +3843,16 @@ check_node_accept_bytes (const re_dfa_t
+@@ -3863,14 +3843,22 @@ check_node_accept_bytes (const re_dfa_t
  	      goto check_node_accept_bytes_match;
  	    }
  	}
@@ -5645,6 +5671,13 @@ Index: git/posix/regexec.c
        nrules = _NL_CURRENT_WORD (LC_COLLATE, _NL_COLLATE_NRULES);
        if (nrules != 0)
  	{
+ 	  unsigned int in_collseq = 0;
+ 	  const int32_t *table, *indirect;
+-	  const unsigned char *weights, *extra;
++	  const unsigned char *weights, *extra = NULL;
+ 	  const char *collseqwc;
+ 
+ 	  /* match with collating_symbol?  */
 @@ -3955,8 +3943,12 @@ check_node_accept_bytes (const re_dfa_t
  	    }
  	}
-- 
2.1.4


