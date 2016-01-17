Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id CD05E731A7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 11:37:08 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id e65so142593281pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 03:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=O2ID1iLrNjRVSxem0nFnde+iKPa6XhHh2U1hUlkaQuw=;
	b=GOmIQo/sbdo4ZkLZ6LOFzUihL/jV3/iaimc6MdfmSKqcQmclPlqAd6s7qOqAgmICH/
	bRoyb0PmFO0InYZuoz1KD2BRI2pdmDpVoZktDqqZlC2K9iqzsfGwVXYWy626hjWybfy+
	cSBLOjqiBBLpwf/DHMHZTkdHQ++yK1ppCMe4UCVvsbqfGIL3YA1F5KGuTGt106J1hiAk
	kP3uwJ0vbaHzZKwTYUhPhZEF2eqS6pW2lnYwpCjO2hDEWotIfrgQCuYc/5Ln17+A/FWl
	Odd6qhIsvCQwrbup3CNWTp6Mdv7SGrGgz/DGgJu5uo30xz6yTElsGHTEyAAQ4qj0kxeV
	hdfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=O2ID1iLrNjRVSxem0nFnde+iKPa6XhHh2U1hUlkaQuw=;
	b=ja87Wb2462eWvADhBoSKy642y9TC9BuVvNyWcf59nav9PWNslmdzSrvzkzIcxKZHtx
	BjEdwLi6sPdIagTDxDwNY3d2F19IrlT8lnQo0PbKsBJCrm/k/yK98zTVWn58lMkxlrWQ
	dpFxbTrckoBqKbnqaoqMmFEIE2N3ujW0zKXCjcN9ME1ylRihNf4jcTnBWCAmYizTbkpT
	UCDrj+tsQc8YN92I+HPq2XWirjAEB+veVKjy83t89AK2k5j1J2/pizqvLpTJy4S1FnS7
	i4S0sWWANLSMYI82BcctWP/Kevw9kLiMuk2Cj+LycfQRWc9wLcWJUW68P8ujgEFkYf/7
	L0Og==
X-Gm-Message-State: ALoCoQkzWxCv8/U3xG9HLwG7JcMI8w+aKfn4YAk9cLDOIT42VTTsqs+3E8VddSzFIx7jrPbRqqrvK68ikXFVLvt986nElc6hLw==
X-Received: by 10.98.10.203 with SMTP id 72mr28738074pfk.87.1453030629375;
	Sun, 17 Jan 2016 03:37:09 -0800 (PST)
Received: from arch.hsd1.ca.comcast.net (c-73-252-206-77.hsd1.ca.comcast.net.
	[73.252.206.77]) by smtp.gmail.com with ESMTPSA id
	ty5sm26838363pac.48.2016.01.17.03.37.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 17 Jan 2016 03:37:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Jan 2016 03:35:43 -0800
Message-Id: <54d539b494ebfa2cc733a7dc8703e20a2129b141.1453029952.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
References: <a11d14dd08dcef1c508ae13079284cfb96629c50.1453029952.git.raj.khem@gmail.com>
In-Reply-To: <cover.1453029952.git.raj.khem@gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
Subject: [PATCH 10/73] gdk-pixbuf: Fix latent build issue exposed by musl
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
X-List-Received-Date: Sun, 17 Jan 2016 11:37:08 -0000

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


