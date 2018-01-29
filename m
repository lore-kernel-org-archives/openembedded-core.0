Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 44E03786D6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 03:27:33 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id w17so3368740pgv.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jan 2018 19:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bXWSnjJObcwcwramYptJinSvqnTLgMAA3IGimbsAsCI=;
	b=Ze3Zc2sMO1rUsbSRAUO7eTHPKZLYg3498oV5Dtvi7/3KMUIMeG2CF0xqDXUwNW5HNW
	aVTPjnh+t4qLXBRkhceYmMKy550DJ4V5BlyhgAWBQ5Km20fYcORptxDAX7qwLZaTzZD7
	THkA06Ivth8ISodIQ8+qqExi9TQWSkvvzLvDNZohL6/GsEaWrTlmDf/BrXq4ninxWUt2
	QGVmEHiiS8CSoVDySHw1ZHOg72/hP8RBgo8qBIAsoHBHz2xh+OGsb7Wx5+pQZvE9NrBC
	KG/ZtIINkG7qPMvh/8jdALZEokl+uTmjgel48DNsYam0CDDKl86Vpov8vCBR8lbS59xi
	idAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bXWSnjJObcwcwramYptJinSvqnTLgMAA3IGimbsAsCI=;
	b=lZsuSDVSiQOqfq3gPUKoiUz8IEtZ9DUnMVHtx+9jwbyS8SuYdCXHrT7V+CVU+C8pnh
	DriuN/uQQwaAZiemZldl+id6Kv9VXkZd3YN2/VmVksubQXaA1K5apJBLyUTE4NgeoHuw
	emHC2MC2aNRRmUv1SWLd0eAs+XOp5vgWRjfTyByztAuCr1JSMRq0l+mrWBnqlsE082oI
	Qri2G0ULAnrZFW587pND5TN83t17FiZZss7SccRDV/W/9M5f/IrDysytAiaofLvl9qY1
	J0i0ZVl8DSrRTGJDTkkvDMUyxSgiyEoVQrMasyWjS6K39/CsExhVUMPcwrRkFaedZeA4
	cKAQ==
X-Gm-Message-State: AKwxytd7OEZONAIdKPVQTS5oBLLPN2RMsVpG9HIAsbfm06Z4n82Hv3Hh
	begUSQkJvtCnCJ7cvwGwFn6J6w==
X-Google-Smtp-Source: AH8x2277yBJy61+ZiVfmJvktczLrzhiSYmuEUzq5Vs9hRGXZslDO6Q/34x5VNwE/wfYiQqf1pVFzyw==
X-Received: by 2002:a17:902:14d:: with SMTP id
	71-v6mr20732424plb.42.1517196454520; 
	Sun, 28 Jan 2018 19:27:34 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c::a8d6])
	by smtp.gmail.com with ESMTPSA id
	y5sm29184689pfd.163.2018.01.28.19.27.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 28 Jan 2018 19:27:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 28 Jan 2018 19:27:17 -0800
Message-Id: <c8ef3f50b9b2931733970d039e08e3fcd3fa04e9.1517196242.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <cover.1517196242.git.raj.khem@gmail.com>
References: <cover.1517196242.git.raj.khem@gmail.com>
Subject: [PATCH 6/8] pulseaudio: Fix build with glibc 2.27
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
X-List-Received-Date: Mon, 29 Jan 2018 03:27:33 -0000

memfd_create is now available in glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Check-if-memfd_create-is-already-defined.patch | 62 ++++++++++++++++++++++
 .../pulseaudio/pulseaudio_11.1.bb                  |  3 +-
 2 files changed, 64 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-multimedia/pulseaudio/pulseaudio/0001-build-sys-Check-if-memfd_create-is-already-defined.patch

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-build-sys-Check-if-memfd_create-is-already-defined.patch b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-build-sys-Check-if-memfd_create-is-already-defined.patch
new file mode 100644
index 0000000000..a02f7d505c
--- /dev/null
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio/0001-build-sys-Check-if-memfd_create-is-already-defined.patch
@@ -0,0 +1,62 @@
+From 185b3c0cdd564901133e530ddd30853f65151622 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 27 Jan 2018 13:14:03 -0800
+Subject: [PATCH] build-sys: Check if memfd_create is already defined
+
+glibc 2.27+ has introduced this function
+
+BugLink: https://bugs.freedesktop.org/show_bug.cgi?id=104815
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Submitted
+
+ configure.ac                   | 7 +++++++
+ src/pulsecore/memfd-wrappers.h | 4 ++--
+ 2 files changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 77b5ff5..aa97944 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -603,6 +603,10 @@ AS_IF([test "x$enable_memfd" != "xno"],
+     AC_CHECK_DECL(SYS_memfd_create, [HAVE_MEMFD=1], [HAVE_MEMFD=0], [#include <sys/syscall.h>]),
+     [HAVE_MEMFD=0])
+ 
++AS_IF([test "x$enable_memfd" != "xno"],
++    AC_CHECK_FUNC(memfd_create, [HAVE_MEMFD_CREATE=1], [HAVE_MEMFD_CREATE=0], [#include <sys/mman.h>]),
++    [HAVE_MEMFD_CREATE=0])
++
+ AS_IF([test "x$enable_memfd" = "xyes" && test "x$HAVE_MEMFD" = "x0"],
+     [AC_MSG_ERROR([*** Your Linux kernel does not support memfd shared memory.
+                   *** Use linux v3.17 or higher for such a feature.])])
+@@ -610,6 +614,9 @@ AS_IF([test "x$enable_memfd" = "xyes" && test "x$HAVE_MEMFD" = "x0"],
+ AC_SUBST(HAVE_MEMFD)
+ AM_CONDITIONAL([HAVE_MEMFD], [test "x$HAVE_MEMFD" = x1])
+ AS_IF([test "x$HAVE_MEMFD" = "x1"], AC_DEFINE([HAVE_MEMFD], 1, [Have memfd shared memory.]))
++AC_SUBST(HAVE_MEMFD_CREATE)
++AM_CONDITIONAL([HAVE_MEMFD_CREATE], [test "x$HAVE_MEMFD_CREATE" = x1])
++AS_IF([test "x$HAVE_MEMFD_CREATE" = "x1"], AC_DEFINE([HAVE_MEMFD_CREATE], 1, [Define to 1 if you have the `memfd_create` function.]))
+ 
+ #### X11 (optional) ####
+ 
+diff --git a/src/pulsecore/memfd-wrappers.h b/src/pulsecore/memfd-wrappers.h
+index 3bed9b2..87ed758 100644
+--- a/src/pulsecore/memfd-wrappers.h
++++ b/src/pulsecore/memfd-wrappers.h
+@@ -32,11 +32,11 @@
+  * defined in the kernel header file <linux/fcntl.h>, that file as
+  * a whole conflicts with the original glibc header <fnctl.h>.
+  */
+-
++#ifndef HAVE_MEMFD_CREATE
+ static inline int memfd_create(const char *name, unsigned int flags) {
+     return syscall(SYS_memfd_create, name, flags);
+ }
+-
++#endif
+ /* memfd_create(2) flags */
+ 
+ #ifndef MFD_CLOEXEC
+-- 
+2.16.1
+
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_11.1.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_11.1.bb
index a50b5a08ae..94278eb34e 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_11.1.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_11.1.bb
@@ -4,7 +4,8 @@ SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/${BP}.tar.xz \
            file://0001-padsp-Make-it-compile-on-musl.patch \
            file://0001-client-conf-Add-allow-autospawn-for-root.patch \
            file://volatiles.04_pulse \
-"
+           file://0001-build-sys-Check-if-memfd_create-is-already-defined.patch \
+           "
 SRC_URI[md5sum] = "390de38231d5cdd6b43ada8939eb74f1"
 SRC_URI[sha256sum] = "f2521c525a77166189e3cb9169f75c2ee2b82fa3fcf9476024fbc2c3a6c9cd9e"
 
-- 
2.16.1


