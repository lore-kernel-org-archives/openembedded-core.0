Return-Path: <danismostlikely@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id E7FC473243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 16:04:50 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id r187so1485027pfr.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 09:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=xGyw36BGkoabzRuXPP+JVBCPA14lKh+SOGdFRo0eoxg=;
	b=ayj+bdVl0g8lQfrAtD9aPOeYkVreW4RN1QItXaSAXKSKgOFHJ/O2O3WbbWdGJbBPmu
	hGwVtKfQV/nHw0fht+W1mRYVQWvxPnvve/4z0K8MEmj9dFZibrB7qjXVa4I3TAAMgCiT
	FdgBPA8Lc0ytc/iOTEZK4E2yGkzHdyOZUAwSzbZIQDo9suCzPxNlYPwqvR5yxQHUZBdR
	lferDe6X5KlEOtrYpNul/oyTyRbIFWMTijRW2UlWYDxwrqwaBJ0dSlKyih5mCYcQsyCW
	uBijEKiUi6BxQ7bUEOpaSUym4WtWOV4FNBcYwH/CThoD5I6ocbwBw0mux5gHdvSvZCSp
	jE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=xGyw36BGkoabzRuXPP+JVBCPA14lKh+SOGdFRo0eoxg=;
	b=HPaMA17s45oCw5RwHuU0ZdXjh2VEjqWLcwmfrMPfPTfdmEMQ7ti0Hm7qJzIU9edStY
	QGtu/sYJeTDBb/EqiBxaQ74Cj7ROAdAkdshv9wKB2itRhc5fUMmunZYXH4vGdJkfqeBh
	v9eG0WAvLFOc8oQ0eihnP73UC7HGXgqlDh9St7szDg4jzWlNolaWBVUHZ1AXDqCZVDo2
	gxwvfM6J8FRadJoAgOP7DFcpEJNbl2vgRZXszFWaos72IXYld8AxA09NU0He74fjjcHt
	GZ2aC+EH0g3R/F1BKtSr/DEMQJXGHKgV4gCWWx7XIbSyQbBW8lW83lsUWVGYrTHC8woo
	f4OQ==
X-Gm-Message-State: AOPr4FULhp+iqDsAJXGXtn43Ii+CgT8pnTrAISBAeDcBfc/2uJK/uif7uJoqF6tOexqlEA==
X-Received: by 10.98.98.69 with SMTP id w66mr48860792pfb.20.1462896291379;
	Tue, 10 May 2016 09:04:51 -0700 (PDT)
Received: from mediabox.local (71-17-245-40.sktn.hsdb.sasknet.sk.ca.
	[71.17.245.40]) by smtp.gmail.com with ESMTPSA id
	ez6sm5569097pab.12.2016.05.10.09.04.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 May 2016 09:04:50 -0700 (PDT)
From: danismostlikely@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 May 2016 10:04:46 -0600
Message-Id: <1462896289-15644-1-git-send-email-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.8.2
Subject: [master][krogoth][PATCH v2 2/5] gcc 4.9: backport gperf fixes
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
X-List-Received-Date: Tue, 10 May 2016 16:04:51 -0000

From: Dan McGregor <danismostlikely@gmail.com>

From: Daniel McGregor <daniel.mcgregor@vecima.com>

gperf was being used in a way that generated files don't conform to
the language standard. Backport the fix from upstream.

This is required to build these GCC versions when the host compiler
is GCC 6.

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta/recipes-devtools/gcc/gcc-4.9.inc              |   1 +
 .../gcc/gcc-4.9/0075-remove-prototypes-cfns.patch  | 153 +++++++++++++++++++++
 2 files changed, 154 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0075-remove-prototypes-cfns.patch

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
-- 
2.8.2


