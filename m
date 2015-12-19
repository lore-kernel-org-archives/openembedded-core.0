Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 76413731CF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 23:52:40 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id n135so5578036qka.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Dec 2015 15:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=kubzl4HYNk++IOM6TmewI9+RDDL5wRGepagmlcezMJM=;
	b=izq9rz7AS9hTn0Wgj2eSjFBrRSQxlPk49k5NUyxS6pYqASem61Awc5OuwJsbEdFGw0
	SJ/mGAkh6uGaFL87SX5kzwve9KwH4IcDKvzBPr0E2y/euc+cZ5lbA+IV3gcAbc+pGRjc
	CUnebR9AoDUDbbnoswBHMfNeXczlRnVXRA9A8nI5TO8R63rCPa3txAfxchXnAiAQhSE4
	10tV5dHU4MNGRJP45QVVxAvK6Vgx4jCysGHF4J0ffJlY+UqbOyNlfCkSZeGZRWQ7ygmb
	Hxmd5JkusKAShxOH3D9AoeV+5zVCKi2xiPAlHZM+33frTdwKHiU5FOD1hTT9+Qv0eJSE
	QE6Q==
X-Received: by 10.55.204.211 with SMTP id n80mr15364629qkl.36.1450569161576;
	Sat, 19 Dec 2015 15:52:41 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id c2sm9785372qkb.41.2015.12.19.15.52.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 19 Dec 2015 15:52:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Dec 2015 23:52:24 +0000
Message-Id: <a331b534820b2206c739cc1632d31b2fc2a4ebac.1450568936.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <81170e1970685f34735007c496ce175279d46304.1450568936.git.raj.khem@gmail.com>
References: <81170e1970685f34735007c496ce175279d46304.1450568936.git.raj.khem@gmail.com>
In-Reply-To: <cover.1450568936.git.raj.khem@gmail.com>
References: <cover.1450568936.git.raj.khem@gmail.com>
Subject: [PATCH 15/17] argp-standalone: Add recipe
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
X-List-Received-Date: Sat, 19 Dec 2015 23:52:41 -0000

This helps packages like gnutls to compile with musl
any package that needs glibc's implementation of argp
can link to this library

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../argp-standalone/argp-standalone_1.3.bb         | 28 ++++++++
 .../files/0001-throw-in-funcdef.patch              | 84 ++++++++++++++++++++++
 .../argp-standalone/files/0002-isprint.patch       | 51 +++++++++++++
 3 files changed, 163 insertions(+)
 create mode 100644 meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
 create mode 100644 meta/recipes-support/argp-standalone/files/0001-throw-in-funcdef.patch
 create mode 100644 meta/recipes-support/argp-standalone/files/0002-isprint.patch

diff --git a/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb b/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
new file mode 100644
index 0000000..a5d20d3
--- /dev/null
+++ b/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb
@@ -0,0 +1,28 @@
+# Copyright (C) 2015 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "Glibc hierarchical argument parsing standalone library"
+HOMEPAGE = "http://www.lysator.liu.se/~nisse/misc/"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://argp.h;beginline=1;endline=20;md5=008b7e53dea6f9e1d9fdef0d9cf3184a"
+SECTION = "libs"
+
+SRC_URI = "http://www.lysator.liu.se/~nisse/misc/argp-standalone-${PV}.tar.gz \
+           file://0001-throw-in-funcdef.patch \
+           file://0002-isprint.patch \
+          "
+SRC_URI[md5sum] = "720704bac078d067111b32444e24ba69"
+SRC_URI[sha256sum] = "dec79694da1319acd2238ce95df57f3680fea2482096e483323fddf3d818d8be"
+
+inherit autotools
+
+CFLAGS += "-fPIC -U__OPTIMIZE__"
+
+do_install() {
+	install -D -m 0644 ${B}/libargp.a ${D}${libdir}/libargp.a
+	install -D -m 0644 ${S}/argp.h ${D}${includedir}/argp.h
+}
+#
+# We will skip parsing for non-musl systems
+#
+COMPATIBLE_HOST = ".*-musl.*"
diff --git a/meta/recipes-support/argp-standalone/files/0001-throw-in-funcdef.patch b/meta/recipes-support/argp-standalone/files/0001-throw-in-funcdef.patch
new file mode 100644
index 0000000..a6e2759
--- /dev/null
+++ b/meta/recipes-support/argp-standalone/files/0001-throw-in-funcdef.patch
@@ -0,0 +1,84 @@
+# --- T2-COPYRIGHT-NOTE-BEGIN ---
+# This copyright note is auto-generated by ./scripts/Create-CopyPatch.
+# 
+# T2 SDE: package/.../rng-tools/throw-in-funcdef.patch.argp-standalone
+# Copyright (C) 2006 The T2 SDE Project
+# 
+# More information can be found in the files COPYING and README.
+# 
+# This patch file is dual-licensed. It is available under the license the
+# patched project is licensed under, as long as it is an OpenSource license
+# as defined at http://www.opensource.org/ (e.g. BSD, X11) or under the terms
+# of the GNU General Public License as published by the Free Software
+# Foundation; either version 2 of the License, or (at your option) any later
+# version.
+# --- T2-COPYRIGHT-NOTE-END ---
+
+
+No __THROW in function implementation.
+	--jsaw
+
+Taken from buildroot
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- argp-standalone-1.4-test2/argp.h.orig	2006-01-06 02:29:59.000000000 +0100
++++ argp-standalone-1.4-test2/argp.h	2006-01-06 02:41:10.000000000 +0100
+@@ -560,17 +560,17 @@
+ # endif
+ 
+ # ifndef ARGP_EI
+-#  define ARGP_EI extern __inline__
++#  define ARGP_EI extern inline
+ # endif
+ 
+ ARGP_EI void
+-__argp_usage (__const struct argp_state *__state) __THROW
++__argp_usage (__const struct argp_state *__state)
+ {
+   __argp_state_help (__state, stderr, ARGP_HELP_STD_USAGE);
+ }
+ 
+ ARGP_EI int
+-__option_is_short (__const struct argp_option *__opt) __THROW
++__option_is_short (__const struct argp_option *__opt)
+ {
+   if (__opt->flags & OPTION_DOC)
+     return 0;
+@@ -582,7 +582,7 @@
+ }
+ 
+ ARGP_EI int
+-__option_is_end (__const struct argp_option *__opt) __THROW
++__option_is_end (__const struct argp_option *__opt)
+ {
+   return !__opt->key && !__opt->name && !__opt->doc && !__opt->group;
+ }
+--- argp-standalone-1.4-test2/argp-parse.c.orig	2006-01-06 02:47:48.000000000 +0100
++++ argp-standalone-1.4-test2/argp-parse.c	2006-01-06 02:48:16.000000000 +0100
+@@ -1290,13 +1290,13 @@
+ /* Defined here, in case a user is not inlining the definitions in
+  * argp.h */
+ void
+-__argp_usage (__const struct argp_state *__state) __THROW
++__argp_usage (__const struct argp_state *__state)
+ {
+   __argp_state_help (__state, stderr, ARGP_HELP_STD_USAGE);
+ }
+ 
+ int
+-__option_is_short (__const struct argp_option *__opt) __THROW
++__option_is_short (__const struct argp_option *__opt) 
+ {
+   if (__opt->flags & OPTION_DOC)
+     return 0;
+@@ -1310,7 +1310,7 @@
+ }
+ 
+ int
+-__option_is_end (__const struct argp_option *__opt) __THROW
++__option_is_end (__const struct argp_option *__opt) 
+ {
+   return !__opt->key && !__opt->name && !__opt->doc && !__opt->group;
+ }
diff --git a/meta/recipes-support/argp-standalone/files/0002-isprint.patch b/meta/recipes-support/argp-standalone/files/0002-isprint.patch
new file mode 100644
index 0000000..1c07eea
--- /dev/null
+++ b/meta/recipes-support/argp-standalone/files/0002-isprint.patch
@@ -0,0 +1,51 @@
+Subject: restrict value range passed to isprint function
+
+According to C standards isprint argument shall be representable as an
+unsigned char or be equal to EOF, otherwise the behaviour is undefined.
+
+Passing arbitrary ints leads to segfault in nm program from elfutils.
+
+Restrict isprint argument range to values representable by unsigned char.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+
+Taken from buildroot
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+Index: b/argp.h
+===================================================================
+--- a/argp.h
++++ b/argp.h
+@@ -23,6 +23,7 @@
+ 
+ #include <stdio.h>
+ #include <ctype.h>
++#include <limits.h>
+ 
+ #define __need_error_t
+ #include <errno.h>
+@@ -577,7 +578,7 @@
+   else
+     {
+       int __key = __opt->key;
+-      return __key > 0 && isprint (__key);
++      return __key > 0 && __key <= UCHAR_MAX && isprint (__key);
+     }
+ }
+ 
+Index: b/argp-parse.c
+===================================================================
+--- a/argp-parse.c
++++ b/argp-parse.c
+@@ -1292,7 +1292,7 @@
+       int __key = __opt->key;
+       /* FIXME: whether or not a particular key implies a short option
+        * ought not to be locale dependent. */
+-      return __key > 0 && isprint (__key);
++      return __key > 0 && __key <= UCHAR_MAX && isprint (__key);
+     }
+ }
+ 
-- 
2.6.4


