Return-Path: <danismostlikely@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 715AE70022
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 16:03:44 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id g132so1254499pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 09:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=aG+RD7UfTxskThfQzK5Q5fyab+MdLiv2D5TrvGNerFs=;
	b=AsnTkA5s87SmBAHi+Citm4wuFNBa4K/TwK9Sk2W/VHzXLVGSyrQoQ5gh74Ffi4t9rD
	hpp0dyMEAM2nCBMinFahm2HQlAFGh5q7mup065C4GLwmrChsERUjUjy68eecb/hz2TAD
	YGZdKXOIf5m7kolPNIQxRz9q4g/P+dtJM7bKK5/HYClUR/1XpLQeR3RPSS42Y94oMGHR
	mtWIYeUy5kfevrOZbuCzP+woOImxL8J0lQ5QF9FSfYhOagHhgbxduuNeLpkIfvhXXLgI
	BSgD5K9WS2YjWNKspxhSwjXQQQan4WE0b+GvRs5BjjXkWrnBNFOxe+B9KioHybhbbmEE
	SgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=aG+RD7UfTxskThfQzK5Q5fyab+MdLiv2D5TrvGNerFs=;
	b=T5evPXyQpW24AvOB7Ms72D2AGdqnOR11UkWr4vQVtk/po8IT1jLwlfkJVuukPth8cM
	h+tClDSDk7buKyA8yPGYucoogb3re0FcI7lH895wNWQ2Ns2ftH3aLa1Oz/acBV3lb1bm
	PdjvlxR5wARaj5xLRDn2ZKceGNjd7YzaMVEgRkXL6cRL/J/sjKtyivMQopDx2lU7v0di
	2VfEfGhGByMcdvXzZ/+S8MH3k52tcVkgRXvhKGlsAQQqBBt8UjDVvhTdf85lV2tGyNHX
	C29lmdGx9+ZSVBLMuY95fvZ4VlqPsA+YV3xwE8ZmJwcI/h1GrIt8Uakk9BVi3RP4+0Js
	aJMA==
X-Gm-Message-State: AOPr4FWmkysJRqwAZqf+mDCT4/9syrIb8wQpMhybFXxCrWAYetEqhoy9rZHti1mkKx4Wig==
X-Received: by 10.98.81.195 with SMTP id f186mr59622361pfb.30.1462896225599;
	Tue, 10 May 2016 09:03:45 -0700 (PDT)
Received: from mediabox.local (71-17-245-40.sktn.hsdb.sasknet.sk.ca.
	[71.17.245.40]) by smtp.gmail.com with ESMTPSA id
	to9sm5528651pab.27.2016.05.10.09.03.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2016 09:03:44 -0700 (PDT)
From: danismostlikely@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 May 2016 10:03:41 -0600
Message-Id: <1462896221-15574-1-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <1462828461-8181-1-git-send-email-danismostlikely@gmail.com>
References: <1462828461-8181-1-git-send-email-danismostlikely@gmail.com>
Subject: [master][krogoth][PATCH v2 1/5] gcc-5.3: backport gperf fixes
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
X-List-Received-Date: Tue, 10 May 2016 16:03:45 -0000

From: Dan McGregor <danismostlikely@gmail.com>

From: Daniel McGregor <daniel.mcgregor@vecima.com>

gperf was being used in a way that generated files don't conform to
the language standard. Backport the fix from upstream.

This is required to build these GCC versions when the host compiler
is GCC 6.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-devtools/gcc/gcc-5.3.inc              |   1 +
 .../gcc/gcc-5.3/0059-remove-prototypes-cfns.patch  | 153 +++++++++++++++++++++
 2 files changed, 154 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0059-remove-prototypes-cfns.patch

diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-devtools/gcc/gcc-5.3.inc
index 9808be1..3da7e54 100644
--- a/meta/recipes-devtools/gcc/gcc-5.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
@@ -88,6 +88,7 @@ SRC_URI = "\
            file://0056-Enable-libc-provide-ssp-and-gcc_cv_target_dl_iterate.patch \
            file://0057-unwind-fix-for-musl.patch \
            file://0058-fdebug-prefix-map-support-to-remap-relative-path.patch \
+           file://0059-remove-prototypes-cfns.patch \
 "
 
 BACKPORTS = ""
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0059-remove-prototypes-cfns.patch b/meta/recipes-devtools/gcc/gcc-5.3/0059-remove-prototypes-cfns.patch
new file mode 100644
index 0000000..2452b6f
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0059-remove-prototypes-cfns.patch
@@ -0,0 +1,153 @@
+Upstream-Status: backport
+
+From 1e5f1089dec3af328fd03125d6778f666d0bd4e4 Mon Sep 17 00:00:00 2001
+From: edlinger <edlinger@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Thu, 25 Feb 2016 15:33:50 +0000
+Subject: [PATCH] 2016-02-25  Bernd Edlinger  <bernd.edlinger@hotmail.de>
+
+        Backported from mainline
+        2016-02-19  Jakub Jelinek  <jakub@redhat.com>
+                    Bernd Edlinger  <bernd.edlinger@hotmail.de>
+
+        * Make-lang.in: Invoke gperf with -L C++.
+        * cfns.gperf: Remove prototypes for hash and libc_name_p
+        inlines.
+        * cfns.h: Regenerated.
+        * except.c (nothrow_libfn_p): Adjust.
+
+
+---
+ gcc/cp/Make-lang.in |  2 +-
+ gcc/cp/cfns.gperf   | 10 ++--------
+ gcc/cp/cfns.h       | 41 ++++++++++++++---------------------------
+ gcc/cp/except.c     |  3 ++-
+ 5 files changed, 31 insertions(+), 37 deletions(-)
+
+diff --git a/gcc/cp/Make-lang.in b/gcc/cp/Make-lang.in
+index e98beb1..b09fb02 100644
+--- a/gcc/cp/Make-lang.in
++++ b/gcc/cp/Make-lang.in
+@@ -111,7 +111,7 @@ else
+ # deleting the $(srcdir)/cp/cfns.h file.
+ $(srcdir)/cp/cfns.h:
+ endif
+-	gperf -o -C -E -k '1-6,$$' -j1 -D -N 'libc_name_p' -L ANSI-C \
++	gperf -o -C -E -k '1-6,$$' -j1 -D -N 'libc_name_p' -L C++ \
+ 		$(srcdir)/cp/cfns.gperf --output-file $(srcdir)/cp/cfns.h
+ 
+ #
+diff --git a/gcc/cp/cfns.gperf b/gcc/cp/cfns.gperf
+index 68acd3d..214ecf6 100644
+--- a/gcc/cp/cfns.gperf
++++ b/gcc/cp/cfns.gperf
+@@ -1,3 +1,5 @@
++%language=C++
++%define class-name libc_name
+ %{
+ /* Copyright (C) 2000-2015 Free Software Foundation, Inc.
+ 
+@@ -16,14 +18,6 @@ for more details.
+ You should have received a copy of the GNU General Public License
+ along with GCC; see the file COPYING3.  If not see
+ <http://www.gnu.org/licenses/>.  */
+-#ifdef __GNUC__
+-__inline
+-#endif
+-static unsigned int hash (const char *, unsigned int);
+-#ifdef __GNUC__
+-__inline
+-#endif
+-const char * libc_name_p (const char *, unsigned int);
+ %}
+ %%
+ # The standard C library functions, for feeding to gperf; the result is used
+diff --git a/gcc/cp/cfns.h b/gcc/cp/cfns.h
+index 1c6665d..596f413 100644
+--- a/gcc/cp/cfns.h
++++ b/gcc/cp/cfns.h
+@@ -1,5 +1,5 @@
+-/* ANSI-C code produced by gperf version 3.0.3 */
+-/* Command-line: gperf -o -C -E -k '1-6,$' -j1 -D -N libc_name_p -L ANSI-C cfns.gperf  */
++/* C++ code produced by gperf version 3.0.4 */
++/* Command-line: gperf -o -C -E -k '1-6,$' -j1 -D -N libc_name_p -L C++ --output-file cfns.h cfns.gperf  */
+ 
+ #if !((' ' == 32) && ('!' == 33) && ('"' == 34) && ('#' == 35) \
+       && ('%' == 37) && ('&' == 38) && ('\'' == 39) && ('(' == 40) \
+@@ -28,7 +28,7 @@
+ #error "gperf generated tables don't work with this execution character set. Please report a bug to <bug-gnu-gperf@gnu.org>."
+ #endif
+ 
+-#line 1 "cfns.gperf"
++#line 3 "cfns.gperf"
+ 
+ /* Copyright (C) 2000-2015 Free Software Foundation, Inc.
+ 
+@@ -47,25 +47,18 @@ for more details.
+ You should have received a copy of the GNU General Public License
+ along with GCC; see the file COPYING3.  If not see
+ <http://www.gnu.org/licenses/>.  */
+-#ifdef __GNUC__
+-__inline
+-#endif
+-static unsigned int hash (const char *, unsigned int);
+-#ifdef __GNUC__
+-__inline
+-#endif
+-const char * libc_name_p (const char *, unsigned int);
+ /* maximum key range = 391, duplicates = 0 */
+ 
+-#ifdef __GNUC__
+-__inline
+-#else
+-#ifdef __cplusplus
+-inline
+-#endif
+-#endif
+-static unsigned int
+-hash (register const char *str, register unsigned int len)
++class libc_name
++{
++private:
++  static inline unsigned int hash (const char *str, unsigned int len);
++public:
++  static const char *libc_name_p (const char *str, unsigned int len);
++};
++
++inline unsigned int
++libc_name::hash (register const char *str, register unsigned int len)
+ {
+   static const unsigned short asso_values[] =
+     {
+@@ -122,14 +115,8 @@ hash (register const char *str, register unsigned int len)
+   return hval + asso_values[(unsigned char)str[len - 1]];
+ }
+ 
+-#ifdef __GNUC__
+-__inline
+-#ifdef __GNUC_STDC_INLINE__
+-__attribute__ ((__gnu_inline__))
+-#endif
+-#endif
+ const char *
+-libc_name_p (register const char *str, register unsigned int len)
++libc_name::libc_name_p (register const char *str, register unsigned int len)
+ {
+   enum
+     {
+diff --git a/gcc/cp/except.c b/gcc/cp/except.c
+index 3ff1ce6..2f2e396 100644
+--- a/gcc/cp/except.c
++++ b/gcc/cp/except.c
+@@ -1040,7 +1040,8 @@ nothrow_libfn_p (const_tree fn)
+      unless the system headers are playing rename tricks, and if
+      they are, we don't want to be confused by them.  */
+   id = DECL_NAME (fn);
+-  return !!libc_name_p (IDENTIFIER_POINTER (id), IDENTIFIER_LENGTH (id));
++  return !!libc_name::libc_name_p (IDENTIFIER_POINTER (id),
++				   IDENTIFIER_LENGTH (id));
+ }
+ 
+ /* Returns nonzero if an exception of type FROM will be caught by a
+-- 
+2.8.2
+
-- 
2.8.2


