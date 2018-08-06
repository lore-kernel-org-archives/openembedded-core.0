Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f42.google.com (mail-pl0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id 38B7778BDE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 22:57:45 +0000 (UTC)
Received: by mail-pl0-f42.google.com with SMTP id w19-v6so4587498ply.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2018 15:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=E7VFSq1EoOQ2NT4EPGLbIbbo7tlrOOvFeHSTu0lO9jo=;
	b=eAzH7IiRbXomGA9u4YvjrYnaay9laD/DpT/nuLR+zTmO2CXfSt+ZP3Cjra4HizVl3n
	v5h2SPAww3zqUJVsAQcqtoBLdoJRMPIbEcVUuPhRj8fnHYioFipgM4NxXov6C+A7pThV
	4fT0U5m4OPobVcFlsWrDlWK3mHRnHwTYv27CbaJGRskufb+KauDzq/sJSIdNMxoY9L3s
	q0ENoQPV1QRjuLucwD5u0VaQ3ZXFZHpd7spN9Y5734RrFKa0vh/mQ4Me5bPBJKlwU87e
	sLnRUT653UQfTc5PYrRKTa7y4dnpRwRRj23weOLhFWAa+9T3/R07db6A0o7/ZRP81PTc
	2KAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=E7VFSq1EoOQ2NT4EPGLbIbbo7tlrOOvFeHSTu0lO9jo=;
	b=Da6GEUhvZTEhbQauSwfACw+0qQ5PDSYF58+4oqagNsHLc+eJcCpyoKXnaUC8VS9tLp
	OxQY1MbH2tk57CtNpdKOR6g2v4gDbgKS7xu7j1/WjLj4fgmMTWSSR3BQsV+2yFS5d0lU
	92PlcKWCZvmVaLdjG6Wbqh093OgBQWS0X882EhYVnd4FgBHY2sGfxzbVDIxMi2+PuCwi
	xBujPf4J7eMjO0RvCWsH6FxfyZs/O0RBuesetbR7PqUM9kRoKeYDU1D8QVaDHIZMNAQ6
	yy99UfR2rqY0pt4oPOLCFZ6E7BbnyxK+bpZzAz76d67rWL//AAuELS3zFZcLDcVmeWZc
	sIrQ==
X-Gm-Message-State: AOUpUlHo/8EtFsSnYD+GtC/ViyF3naQuvkVkdrgSqQT/ysQwoEZe1rUU
	uMixctzRsJaEsEr5gyl9ocX2Lrr8
X-Google-Smtp-Source: AAOMgpdD2rpuVyFRV4HdTCpNrfHpPImpAkZFGKXRCjwrBnFfOhZWiSVB5LjWZmCWUUNi90ziib6b8Q==
X-Received: by 2002:a17:902:9687:: with SMTP id
	n7-v6mr15182627plp.33.1533596266874; 
	Mon, 06 Aug 2018 15:57:46 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1d00])
	by smtp.gmail.com with ESMTPSA id
	x1-v6sm11993137pgr.59.2018.08.06.15.57.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Aug 2018 15:57:46 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Aug 2018 15:57:15 -0700
Message-Id: <c16f4a3bbba643c62049961bc00eeb160d055baf.1533595822.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1533595822.git.raj.khem@gmail.com>
References: <cover.1533595822.git.raj.khem@gmail.com>
Subject: [PATCH 18/18] sysvinit: Fix build with glibc 2.28 + libxcrypt
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
X-List-Received-Date: Mon, 06 Aug 2018 22:57:46 -0000

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


