Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5FE9D731FC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 03:06:13 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 144so6767927pfv.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2016 19:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4h1I1jNqmU0RaaKYYJqH8dhXzS4N/CxpWp+h7nDDi2k=;
	b=sL+Q0uM6vhdPYvsnfeG7+4H6aIgnG0GSOJ9MhRsjJvqcTHtd43s5flqPcAd3xMMbUj
	jegLhzQGuwm7GkNvh7wvDQlVVr5qQlfDPw6xGy+QxDZwFssSIUwo6hB5uPn6NwRV0mR/
	9dqqwEHDoLHBS/PTubyt7vSt0bannDwasGYkwjbWfjunKpqTCxayoExpAFe2Vo21j5CR
	hjVzk1Zi2Pq4a1MIwLS0O9b5XSe5FuLs0zvcLbNHrX8IPDVDO6ahrYCEb5rQeoOJNsUk
	BJyOlZK/WqBz/s0P/CArkmZNnGMlaku0unvXXTk8GdlSSWM2Foo4oyrhxtxkMJn9X4E3
	DeZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4h1I1jNqmU0RaaKYYJqH8dhXzS4N/CxpWp+h7nDDi2k=;
	b=i9YO3E4pS8N+6R63+krDZRp50faYu6PDrImfkksRLf9l32IQzhXiSG5Ob2YtIDlxVv
	lcg3zajloEEE5b4MPTfo7wdAI9unltbuVjaeMO7MhzLFag4GrEHbSSS6AZ0HKrJ34OrT
	ybhSJxHpsCOeTEnpzDrnGd3Dpx+7wQJevQix7fzv/q8C6z1f0Pk3BknPB9gxMxZjK5lA
	i30hn4hZPLcZYG/MgVBQEPch1EWZE3++UJG/VW89aW3us/FXhw4i/Kzne/p8r0I/PZ9S
	oRU5seIf2Q4Nf372lD8yTikU84OaaVParg2cIW+mcGT03ocHAkflz8u9t15VVp5a+7hz
	+BhQ==
X-Gm-Message-State: AKaTC02ssn9VoRnLYr/plWj5M1RxCJeM72STqy7b68Orxkhk0bFZZoshdA1b7x5hTYPWJg==
X-Received: by 10.98.155.9 with SMTP id r9mr13201763pfd.71.1482116775299;
	Sun, 18 Dec 2016 19:06:15 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	65sm26830276pfn.12.2016.12.18.19.06.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Dec 2016 19:06:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Dec 2016 19:05:55 -0800
Message-Id: <20161219030600.1284-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161219030600.1284-1-raj.khem@gmail.com>
References: <20161219030600.1284-1-raj.khem@gmail.com>
Subject: [PATCH 3/8] grub: Fix build with glibc 2.25
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
X-List-Received-Date: Mon, 19 Dec 2016 03:06:14 -0000

Backport relevant patch from grub git

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Use-AC_HEADER_MAJOR-to-find-device-macros.patch | 92 ++++++++++++++++++++++
 meta/recipes-bsp/grub/grub2.inc                    |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-bsp/grub/files/0001-build-Use-AC_HEADER_MAJOR-to-find-device-macros.patch

diff --git a/meta/recipes-bsp/grub/files/0001-build-Use-AC_HEADER_MAJOR-to-find-device-macros.patch b/meta/recipes-bsp/grub/files/0001-build-Use-AC_HEADER_MAJOR-to-find-device-macros.patch
new file mode 100644
index 0000000000..f95b9ef9a0
--- /dev/null
+++ b/meta/recipes-bsp/grub/files/0001-build-Use-AC_HEADER_MAJOR-to-find-device-macros.patch
@@ -0,0 +1,92 @@
+From 7a5b301e3adb8e054288518a325135a1883c1c6c Mon Sep 17 00:00:00 2001
+From: Mike Gilbert <floppym@gentoo.org>
+Date: Tue, 19 Apr 2016 14:27:22 -0400
+Subject: [PATCH] build: Use AC_HEADER_MAJOR to find device macros
+
+Depending on the OS/libc, device macros are defined in different
+headers. This change ensures we include the right one.
+
+sys/types.h - BSD
+sys/mkdev.h - Sun
+sys/sysmacros.h - glibc (Linux)
+
+glibc currently pulls sys/sysmacros.h into sys/types.h, but this may
+change in a future release.
+
+https://sourceware.org/ml/libc-alpha/2015-11/msg00253.html
+---
+Upstream-Status: Backport
+
+ configure.ac                         | 3 ++-
+ grub-core/osdep/devmapper/getroot.c  | 6 ++++++
+ grub-core/osdep/devmapper/hostdisk.c | 5 +++++
+ grub-core/osdep/linux/getroot.c      | 6 ++++++
+ grub-core/osdep/unix/getroot.c       | 4 +++-
+ 5 files changed, 22 insertions(+), 2 deletions(-)
+
+Index: grub-2.00/configure.ac
+===================================================================
+--- grub-2.00.orig/configure.ac
++++ grub-2.00/configure.ac
+@@ -326,7 +326,8 @@ fi
+ 
+ # Check for functions and headers.
+ AC_CHECK_FUNCS(posix_memalign memalign asprintf vasprintf getextmntent)
+-AC_CHECK_HEADERS(sys/param.h sys/mount.h sys/mnttab.h sys/mkdev.h limits.h)
++AC_CHECK_HEADERS(sys/param.h sys/mount.h sys/mnttab.h limits.h)
++AC_HEADER_MAJOR
+ 
+ AC_CHECK_MEMBERS([struct statfs.f_fstypename],,,[$ac_includes_default
+ #include <sys/param.h>
+Index: grub-2.00/grub-core/kern/emu/hostdisk.c
+===================================================================
+--- grub-2.00.orig/grub-core/kern/emu/hostdisk.c
++++ grub-2.00/grub-core/kern/emu/hostdisk.c
+@@ -41,6 +41,12 @@
+ #include <errno.h>
+ #include <limits.h>
+ 
++#if defined(MAJOR_IN_MKDEV)
++#include <sys/mkdev.h>
++#elif defined(MAJOR_IN_SYSMACROS)
++#include <sys/sysmacros.h>
++#endif
++
+ #ifdef __linux__
+ # include <sys/ioctl.h>         /* ioctl */
+ # include <sys/mount.h>
+Index: grub-2.00/util/getroot.c
+===================================================================
+--- grub-2.00.orig/util/getroot.c
++++ grub-2.00/util/getroot.c
+@@ -35,6 +35,13 @@
+ #ifdef HAVE_LIMITS_H
+ #include <limits.h>
+ #endif
++
++#if defined(MAJOR_IN_MKDEV)
++#include <sys/mkdev.h>
++#elif defined(MAJOR_IN_SYSMACROS)
++#include <sys/sysmacros.h>
++#endif
++
+ #include <grub/util/misc.h>
+ #include <grub/util/lvm.h>
+ #include <grub/cryptodisk.h>
+Index: grub-2.00/util/raid.c
+===================================================================
+--- grub-2.00.orig/util/raid.c
++++ grub-2.00/util/raid.c
+@@ -29,6 +29,12 @@
+ #include <errno.h>
+ #include <sys/types.h>
+ 
++#if defined(MAJOR_IN_MKDEV)
++#include <sys/mkdev.h>
++#elif defined(MAJOR_IN_SYSMACROS)
++#include <sys/sysmacros.h>
++#endif
++
+ #include <linux/types.h>
+ #include <linux/major.h>
+ #include <linux/raid/md_p.h>
diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index b69de9f340..ef893b327f 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -35,6 +35,7 @@ SRC_URI = "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
            file://0001-Enforce-no-pie-if-the-compiler-supports-it.patch \
            file://0001-grub-core-kern-efi-mm.c-grub_efi_finish_boot_service.patch \
            file://0002-grub-core-kern-efi-mm.c-grub_efi_get_memory_map-Neve.patch \
+           file://0001-build-Use-AC_HEADER_MAJOR-to-find-device-macros.patch \
             "
 
 DEPENDS = "flex-native bison-native autogen-native"
-- 
2.11.0


