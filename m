Return-Path: <danismostlikely@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id E1E60601A4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 May 2016 21:14:24 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y7so16585852pfb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 May 2016 14:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=ytXyP2MwkQsD48OqkEjc/M2p9xANQ4HQ4c5VpeGr+jQ=;
	b=R0eEIPrYX/QlOmhhmBQ/njbxcBD9CymeH++8YSxjg851E3bjjDdEJcwVHJjdP4yBFv
	w9tgAURmdt6fs8JOleo4ZnfE40Eduyy/zqgZ2K22iLpsIob46wrOF9wEadZAoKrgxVAf
	qVMfN8HHSz0cF3C/eMXCPVauOK9qBI3f1bjc5syIY/djdu1qFQ41n0pTz2dRF7HPENPB
	l+ZEanl5vorxXtuQj2VR0F4QChix3lNnJt2LoG9oqa8+pR6PDZfhw4fTGNGoNB9u9vel
	WsI7iOvj/D/caR07n4wBMMMNcG+uJF9qf/utn7v8fMA8iqx9++Iuuu9m8X7WwQLztD0b
	PQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=ytXyP2MwkQsD48OqkEjc/M2p9xANQ4HQ4c5VpeGr+jQ=;
	b=XBU3v+cUdVjgbYiOxNTMNHno6zyy7+1gE4T09ouPig5ZDAm9Yp8MCB+EnkC4+nB5pQ
	0BLioSqRbuQpOGffC7coKZN6KwdLsbyVRzER1pARFX8VxyQdKuM+gISfqdcEvbvMhtLn
	XFBke0bx126Vaifh+kFBmuk189fQRmvv5soES24SDrsNr/bJAA1WwvcD6VacL+3jwP7Q
	OtJYdYZcLvVG1NbUO8O9B8WhoN/EluW3LjmzM5TsLysziIc2grE4NxcMb/T6Shj3z+xi
	QHphQzYMoLaLsVzQJ+KiUyrXIV1/Ihw+LsNwV8cgKcNPhWlemzMiAu5yBHGIcwAF4cYS
	KkYg==
X-Gm-Message-State: AOPr4FVbFyR6RYMdxGZGdvkY1a9/SC/GbGddKOHDZ43kxS/9/jCfEs83ro4a8oZc7twgPg==
X-Received: by 10.98.27.78 with SMTP id b75mr53381985pfb.49.1462828465419;
	Mon, 09 May 2016 14:14:25 -0700 (PDT)
Received: from mediabox.local (71-17-245-40.sktn.hsdb.sasknet.sk.ca.
	[71.17.245.40]) by smtp.gmail.com with ESMTPSA id
	f187sm42626211pfb.60.2016.05.09.14.14.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 May 2016 14:14:24 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 May 2016 15:14:21 -0600
Message-Id: <1462828461-8181-1-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.8.2
Subject: [master][krogoth][PATCH] gcc: backport gperf fixes
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
X-List-Received-Date: Mon, 09 May 2016 21:14:28 -0000

From: Daniel McGregor <daniel.mcgregor@vecima.com>

gperf was being used in a way that generated files don't conform to
the language standard. Backport the fix from upstream.

This is required to build these GCC versions when the host compiler
is GCC 6.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-devtools/gcc/gcc-4.9.inc              |   1 +
 .../gcc/gcc-4.9/0075-remove-prototypes-cfns.patch  | 153 +++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-5.3.inc              |   1 +
 .../gcc/gcc-5.3/0059-remove-prototypes-cfns.patch  | 153 +++++++++++++++++++++
 4 files changed, 308 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0075-remove-prototypes-cfns.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0059-remove-prototypes-cfns.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index 7e03f31..2be0599 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -90,6 +90,7 @@ SRC_URI = "\
     file://0072-support-ffile-prefix-map.patch \
     file://0073-Reuse-fdebug-prefix-map-to-replace-ffile-prefix-map.patch \
     file://0074-fdebug-prefix-map-support-to-remap-relative-path.patch \
+    file://0075-remove-prototypes-cfns.patch \
 "
 SRC_URI[md5sum] = "6f831b4d251872736e8e9cc09746f327"
 SRC_URI[sha256sum] = "2332b2a5a321b57508b9031354a8503af6fdfb868b8c1748d33028d100a8b67e"
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0075-remove-prototypes-cfns.patch b/meta/recipes-devtools/gcc/gcc-4.9/0075-remove-prototypes-cfns.patch
new file mode 100644
index 0000000..2954f2e
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0075-remove-prototypes-cfns.patch
@@ -0,0 +1,153 @@
+Upstream-Status: backport
+
+From 8c3fa311caa86f61b4e28d1563d1110b44340fb2 Mon Sep 17 00:00:00 2001
+From: edlinger <edlinger@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Thu, 25 Feb 2016 15:36:41 +0000
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
+index bd1c1d7..a0ea0d4 100644
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
+index 05ca753..d9b16b8 100644
+--- a/gcc/cp/cfns.gperf
++++ b/gcc/cp/cfns.gperf
+@@ -1,3 +1,5 @@
++%language=C++
++%define class-name libc_name
+ %{
+ /* Copyright (C) 2000-2014 Free Software Foundation, Inc.
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
+index c845ddf..65801d1 100644
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
+ /* Copyright (C) 2000-2014 Free Software Foundation, Inc.
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
+index 221971a..32340f5 100644
+--- a/gcc/cp/except.c
++++ b/gcc/cp/except.c
+@@ -1030,7 +1030,8 @@ nothrow_libfn_p (const_tree fn)
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


