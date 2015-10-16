Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 15B227714A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 08:00:10 +0000 (UTC)
Received: by pacfv9 with SMTP id fv9so15286892pac.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 01:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=VB4zHxn9sXVP8KwLM6/71l23tl/ONziu6sPRIYOAPLo=;
	b=J7ox0PM4kFA/Ns4/MEFBboYNvX5WLF4yb6FlP0NcdqNCoAl4zTtbkpuRWPtNDXU9rz
	3iU2Ojyox3RXdzFTMYpGlo66BRAX3S+r5ZsJeFIMg2rA3qrVWXWNcAKV/4YnBXgNlC+9
	77+H26bJSa3e0+EES0zJ+1IeefvgdlteyRXAAjX2cbdV+Kx+Trc82iMvm3EYrRyZ9XRM
	jqIsuiEzFbO7Xnn0zC765CuE7UdD8OhT5uOtvgZ0et3eA4LcqZo9kzbLIXW4bkzQimgV
	ctx5Cm6AyN6faUCfgQZKG5orvzAZ8kGT2QQozV3v0PL01gpgnzPqCT7sE4YV9z/849uR
	rxgw==
X-Received: by 10.66.159.66 with SMTP id xa2mr15130713pab.28.1444982411183;
	Fri, 16 Oct 2015 01:00:11 -0700 (PDT)
Received: from imac.hsd1.ca.comcast.net (c-24-130-225-169.hsd1.ca.comcast.net.
	[24.130.225.169]) by smtp.gmail.com with ESMTPSA id
	ln10sm19671535pab.29.2015.10.16.01.00.10
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Oct 2015 01:00:10 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Oct 2015 01:00:02 -0700
Message-Id: <37b9c228f4b5fa68ca4f520426f2399831c487bc.1444982178.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <10ea250a6d2383cde4f6c3f72e0f527c3b82de42.1444982178.git.raj.khem@gmail.com>
References: <10ea250a6d2383cde4f6c3f72e0f527c3b82de42.1444982178.git.raj.khem@gmail.com>
In-Reply-To: <cover.1444982178.git.raj.khem@gmail.com>
References: <cover.1444982178.git.raj.khem@gmail.com>
Subject: [PATCH 8/9] systemd: Fix build with uclibc
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
X-List-Received-Date: Fri, 16 Oct 2015 08:00:11 -0000

225 needs additional patches for cater for new APIs used
in systemd

Change-Id: Idb66c2c6bb65c94b52ba35b276ca12cc868b043e
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../systemd/0001-fix-build-on-uClibc-exp10.patch   | 22 ++++++++++++
 ...nv-when-secure-versions-are-not-available.patch | 39 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_225.bb           |  2 ++
 3 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-fix-build-on-uClibc-exp10.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0022-Use-getenv-when-secure-versions-are-not-available.patch

diff --git a/meta/recipes-core/systemd/systemd/0001-fix-build-on-uClibc-exp10.patch b/meta/recipes-core/systemd/systemd/0001-fix-build-on-uClibc-exp10.patch
new file mode 100644
index 0000000..76ce4b7
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0001-fix-build-on-uClibc-exp10.patch
@@ -0,0 +1,22 @@
+Inspired by: http://peter.korsgaard.com/patches/alsa-utils/alsamixer-fix-build-on-uClibc-exp10.patch
+
+exp10 extension is not part of uClibc, so compute it.
+
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+
+Upstream-Status: Pending
+
+Index: git/src/basic/missing.h
+===================================================================
+--- git.orig/src/basic/missing.h
++++ git/src/basic/missing.h
+@@ -1036,3 +1036,8 @@ static inline int kcmp(pid_t pid1, pid_t
+ #ifndef INPUT_PROP_ACCELEROMETER
+ #define INPUT_PROP_ACCELEROMETER  0x06
+ #endif
++
++#ifdef __UCLIBC__
++/* 10^x = 10^(log e^x) = (e^x)^log10 = e^(x * log 10) */
++#define exp10(x) (exp((x) * log(10)))
++#endif /* __UCLIBC__ */
diff --git a/meta/recipes-core/systemd/systemd/0022-Use-getenv-when-secure-versions-are-not-available.patch b/meta/recipes-core/systemd/systemd/0022-Use-getenv-when-secure-versions-are-not-available.patch
new file mode 100644
index 0000000..30e3817
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/0022-Use-getenv-when-secure-versions-are-not-available.patch
@@ -0,0 +1,39 @@
+From cb71e4beea3b3b11e5951f95c829cd2eee9fcf7b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 12 Sep 2015 19:10:04 +0000
+Subject: [PATCH 22/31] Use getenv when secure versions are not available
+
+musl doesnt implement secure version, so we default
+to it if configure does not detect a secure imeplementation
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+Upstream-Status: Rejected
+
+ src/basic/missing.h | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/basic/missing.h b/src/basic/missing.h
+index bf9b490..d6dbc7d 100644
+--- a/src/basic/missing.h
++++ b/src/basic/missing.h
+@@ -584,13 +584,14 @@ static inline int name_to_handle_at(int fd, const char *name, struct file_handle
+         return syscall(__NR_name_to_handle_at, fd, name, handle, mnt_id, flags);
+ }
+ #endif
+-
+-#ifndef HAVE_SECURE_GETENV
++#ifdef HAVE_SECURE_GETENV
+ #  ifdef HAVE___SECURE_GETENV
+ #    define secure_getenv __secure_getenv
+ #  else
+ #    error "neither secure_getenv nor __secure_getenv are available"
+ #  endif
++#else
++#  define secure_getenv getenv
+ #endif
+ 
+ #ifndef CIFS_MAGIC_NUMBER
+-- 
+2.5.2
+
diff --git a/meta/recipes-core/systemd/systemd_225.bb b/meta/recipes-core/systemd/systemd_225.bb
index c2dad58..18c2448 100644
--- a/meta/recipes-core/systemd/systemd_225.bb
+++ b/meta/recipes-core/systemd/systemd_225.bb
@@ -53,6 +53,8 @@ S = "${WORKDIR}/git"
 
 SRC_URI_append_libc-uclibc = "\
             file://0001-units-Prefer-getty-to-agetty-in-console-setup-system.patch \
+            file://0022-Use-getenv-when-secure-versions-are-not-available.patch \
+            file://0001-fix-build-on-uClibc-exp10.patch \
            "
 LDFLAGS_append_libc-uclibc = " -lrt"
 
-- 
2.6.1


