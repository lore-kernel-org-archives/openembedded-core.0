Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 4FD1A78E6B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Aug 2018 17:04:42 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id r1-v6so1364559pgp.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2018 10:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=E7VFSq1EoOQ2NT4EPGLbIbbo7tlrOOvFeHSTu0lO9jo=;
	b=YxUD+SQuTK9remQB/X7BBftfaagK1eii/+FGdQihbpIfPK34gBlsSMb+3oKkabN1HN
	bNEnGEwljg1mnWhSMbO6se8E6xUTyULuMnKtTr7/6Rj+/BkiNVSFcuNxKj++hLtQJrPX
	q9ei27QaQiDGYEQvOnSeQhN8kgSy1iZMs14CqyheT6MSIaOAFurSjmkdcqSOTpjZH4J1
	12h/PpbBH9I5SSTuqMcRCjaDH3Ks1IARj403ewDCC7TlWPiUZ9uznepnd75QFMZoUV5U
	BDcVNsa8sIIb8yPzqYlHzHJH5giJKrtUO9ctx7IAvf8YiU542Wjf5yfZlmine1QId3DO
	BLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=E7VFSq1EoOQ2NT4EPGLbIbbo7tlrOOvFeHSTu0lO9jo=;
	b=dyDh3dpxe3WsYtSaGMbUN8OPUweCGlVXPsuoDlu4DbJeZQhJRGBDhOkUuysczaweGa
	kjYAO55vaogLKJqJNPVigCIuZFFONZLo0Uc5DBSXpjzNVIm3NTP5NAHwQhGFpO0uG1ng
	UVoUqJ9EPHpTtxcRIhKcIdnDpPAqxC5Na0QDL/+zhWMYNqyj37vtaGSDvxc4lx553yNF
	IPZj+QyKvUF5jCHE6d4b6lXTFqy0r8ijm8xj3HnOs5VYnPkHlzxtP1pP/jrLpZQ0FkvP
	EfxaSDrSXO2am6JZUn7zqdCzfCL8GloDGYDkj+0w/gKbQPH1k7JHtFICkHCdN5jBkcVn
	fB0Q==
X-Gm-Message-State: AOUpUlEmYoT6RgmK1nAy7RkQo2HX8IJ+qpKaJdS0kLHxENFvbTp7+N0H
	kKerzDVnONvxUxw3YLxz/ZSw8tEq
X-Google-Smtp-Source: AA+uWPysMPrWRxiz+bcx9mAOPNEN1Lea9AUCrfQnpsfHc8VG84w1KBgvUCSK+A0plSIHLLZoUmMl/g==
X-Received: by 2002:a63:6c05:: with SMTP id
	h5-v6mr3372812pgc.367.1533747882994; 
	Wed, 08 Aug 2018 10:04:42 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1d00])
	by smtp.gmail.com with ESMTPSA id
	h9-v6sm3673108pfe.187.2018.08.08.10.04.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Aug 2018 10:04:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Aug 2018 10:04:25 -0700
Message-Id: <33de34276c7905018d6f4c09189bb27dec863882.1533747698.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1533747698.git.raj.khem@gmail.com>
References: <cover.1533747698.git.raj.khem@gmail.com>
Subject: [PATCH 8/8] sysvinit: Fix build with glibc 2.28 + libxcrypt
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
X-List-Received-Date: Wed, 08 Aug 2018 17:04:42 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...acros.h-for-major-minor-defines-in-g.patch | 71 +++++++++++++++++++
 .../recipes-core/sysvinit/sysvinit_2.88dsf.bb |  3 +-
 2 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/sysvinit/sysvinit-2.88dsf/0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch

diff --git a/meta/recipes-core/sysvinit/sysvinit-2.88dsf/0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch b/meta/recipes-core/sysvinit/sysvinit-2.88dsf/0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch
new file mode 100644
index 0000000000..2575b59b5e
--- /dev/null
+++ b/meta/recipes-core/sysvinit/sysvinit-2.88dsf/0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch
@@ -0,0 +1,71 @@
+From 29c7a529d3bb0c1e20239f885e74c5036f1a908c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 6 Aug 2018 15:38:58 -0700
+Subject: [PATCH] include sys/sysmacros.h for major/minor defines in glibc
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Pending
+---
+ src/bootlogd.c |   3 +++
+ src/bootlogd.o | Bin 58448 -> 60376 bytes
+ src/dowall.c   |   3 +++
+ src/shutdown.c |   4 +++-
+ 4 files changed, 9 insertions(+), 1 deletion(-)
+
+Index: sysvinit-2.88dsf/src/bootlogd.c
+===================================================================
+--- sysvinit-2.88dsf.orig/src/bootlogd.c
++++ sysvinit-2.88dsf/src/bootlogd.c
+@@ -53,6 +53,9 @@
+ #ifdef __linux__
+ #include <sys/mount.h>
+ #endif
++#ifdef __GLIBC__
++#include <sys/sysmacros.h>
++#endif
+ 
+ char *Version = "@(#) bootlogd 2.86 03-Jun-2004 miquels@cistron.nl";
+ 
+Index: sysvinit-2.88dsf/src/dowall.c
+===================================================================
+--- sysvinit-2.88dsf.orig/src/dowall.c
++++ sysvinit-2.88dsf/src/dowall.c
+@@ -37,6 +37,9 @@
+ #include <signal.h>
+ #include <setjmp.h>
+ #include <paths.h>
++#ifdef __GLIBC__
++#include <sys/sysmacros.h>
++#endif
+ 
+ #ifndef _PATH_DEV
+ # define _PATH_DEV	"/dev/"
+Index: sysvinit-2.88dsf/src/shutdown.c
+===================================================================
+--- sysvinit-2.88dsf.orig/src/shutdown.c
++++ sysvinit-2.88dsf/src/shutdown.c
+@@ -57,7 +57,9 @@
+ #include "reboot.h"
+ #include "initreq.h"
+ #include "init.h"
+-
++#ifdef __GLIBC__
++#include <sys/sysmacros.h>
++#endif
+ 
+ char *Version = "@(#) shutdown 2.86-1 31-Jul-2004 miquels@cistron.nl";
+ 
+Index: sysvinit-2.88dsf/src/mountpoint.c
+===================================================================
+--- sysvinit-2.88dsf.orig/src/mountpoint.c
++++ sysvinit-2.88dsf/src/mountpoint.c
+@@ -32,6 +32,9 @@
+ #include <stdarg.h>
+ #include <getopt.h>
+ #include <stdio.h>
++#ifdef __GLIBC__
++#include <sys/sysmacros.h>
++#endif
+ 
+ int dostat(char *path, struct stat *st, int do_lstat, int quiet)
+ {
diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
index ad65819b2d..a21e7e46f7 100644
--- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
+++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
@@ -15,6 +15,7 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/sysvinit/sysvinit-${PV}.tar.bz2 \
            file://pidof-add-m-option.patch \
            file://0001-This-fixes-an-issue-that-clang-reports-about-mutlipl.patch \
            file://realpath.patch \
+           file://0001-include-sys-sysmacros.h-for-major-minor-defines-in-g.patch \
            file://rcS-default \
            file://rc \
            file://rcS \
@@ -29,7 +30,7 @@ S = "${WORKDIR}/sysvinit-${PV}"
 B = "${S}/src"
 
 inherit update-alternatives distro_features_check
-DEPENDS_append = " update-rc.d-native base-passwd"
+DEPENDS_append = " update-rc.d-native base-passwd virtual/crypt"
 
 REQUIRED_DISTRO_FEATURES = "sysvinit"
 
-- 
2.18.0


