Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 99C8476312
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:19:34 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id o11so348658935qge.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=O2ID1iLrNjRVSxem0nFnde+iKPa6XhHh2U1hUlkaQuw=;
	b=lchLRss8EDlo/Ybmyf83UJ3XGViTmCSa5ZeWdKGRZT3nZp9GvCLu4myH/+OiTiIw5e
	fo5Bwmn+ct/uWgeF62Ji13oMpot9dqvafsq32kq1kFdQU0RsAMQcv8wx4D1vWvdFjyRp
	peneZOO5wFGFbwfHLm3ie+qxE7EX8ZN0p4fljXNG5Fxrk0t9E2GSOR79DHsV9N8trbNr
	zFAw/VnFKOozsOQayLyi4B3HOapicE6A/bAlTXDh8GZq1mmUpO2GxAMs1GbiauxoJwXU
	Dm5eXnSg2ZQCO/Z1AmddhNN9hqY6AGzBN5Mq5YXcfbvJa16Ar/O9mGm7ae7woKBC3Zag
	1inw==
X-Received: by 10.140.93.77 with SMTP id c71mr109043764qge.46.1452248374943;
	Fri, 08 Jan 2016 02:19:34 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.19.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:19:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:18:39 +0000
Message-Id: <b5a60b943feaa1238cd94ca7f9f92bea37fd24fa.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 11/53] gdk-pixbuf: Fix latent build issue exposed by musl
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
X-List-Received-Date: Fri, 08 Jan 2016 10:19:38 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gdk-pixbuf/gdk-pixbuf/libc_memfuncs.patch      | 63 ++++++++++++++++++++++
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/libc_memfuncs.patch

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/libc_memfuncs.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/libc_memfuncs.patch
new file mode 100644
index 0000000..82a27c3
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/libc_memfuncs.patch
@@ -0,0 +1,63 @@
+From 205a3b04e1216c1df199aec95185f7f48b8e0491 Mon Sep 17 00:00:00 2001
+From: Natanael Copa <ncopa@alpinelinux.org>
+Date: Tue, 6 Oct 2015 09:11:38 +0200
+Subject: Run only pixbuf-lowmem test on GNU libc
+
+The test case depends on GNU libc specific internals so we only run it
+on GNU libc.
+
+This fixes build on Linux with musl libc.
+
+https://bugzilla.gnome.org/show_bug.cgi?id=756078
+---
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport
+
+ tests/Makefile.am     | 5 -----
+ tests/pixbuf-lowmem.c | 8 ++++++++
+ 2 files changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index bdd68f3..c122188 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -19,13 +19,8 @@ LDADD = \
+ noinst_PROGRAMS += 			\
+ 	pixbuf-read			\
+ 	pixbuf-random			\
+-	$(NULL)
+-
+-if OS_LINUX
+-noinst_PROGRAMS += 			\
+ 	pixbuf-lowmem			\
+ 	$(NULL)
+-endif
+ 
+ test_programs = 			\
+ 	animation			\
+diff --git a/tests/pixbuf-lowmem.c b/tests/pixbuf-lowmem.c
+index ae71788..9e9571f 100644
+--- a/tests/pixbuf-lowmem.c
++++ b/tests/pixbuf-lowmem.c
+@@ -24,6 +24,7 @@
+ #include <time.h>
+ #include <string.h>
+ 
++#ifdef __GLIBC__
+ #define PRETEND_MEM_SIZE (16 * 1024 * 1024)
+ #define REMAINING_MEM_SIZE 100000
+ 
+@@ -225,3 +226,10 @@ main (int argc, char **argv)
+   
+   return 0;
+ }
++#else
++int
++main (int argc, char **argv)
++{
++	return 0;
++}
++#endif
+-- 
+cgit v0.11.2
+
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb
index 084fe36..104c743 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.1.bb
@@ -17,6 +17,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://extending-libinstall-dependencies.patch \
            file://run-ptest \
            file://fatal-loader.patch \
+           file://libc_memfuncs.patch \
            "
 
 SRC_URI[md5sum] = "b1590189a2e89fab9f871959c168508c"
-- 
2.7.0


