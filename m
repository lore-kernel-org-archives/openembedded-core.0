Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B62F1CA5FFE
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 17:05:36 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24905.1791219934682157448
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 10:05:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Jdsq0qyl;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-202610051705327d36f2c3bf0002072f-gz6gou@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 202610051705327d36f2c3bf0002072f
        for <openembedded-core@lists.openembedded.org>;
        Mon, 05 Oct 2026 19:05:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=djTdexBAuBvAswVwvNYMMUCkB0qWv9L4u3/kYMoVcEk=;
 b=Jdsq0qylcOcMoKzfGuKarw9gaqcWxUcXffGf3EmMKvdbnZi6VbMEoavS6rBGMFLX2OnRae
 ChfsGH2PerKpjSoweHcGl5URj3UihnyeAZpeGtUSAYWVqTaISULv6pmevBR0tHl1uEIz4mbP
 iWIHEOETESC9XJ/yqsWx36fWK6PYskVDgGy+329FBPEQQRm5XTBaTDqe1oDj/TP1XcJuYLc3
 zfoAPhqAkD+YP/mcHOHKBzxitH8IIZxY2LUeD2wAcYnHduZknZDr9zFEGbGRYR7jK0XmojiP
 RSbPGtsGx33DmfuA1CfnazN95bLj1+CT7sLmhdGMq/8apAB/BhnRJXlA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [scarthgap][PATCH 2/7] util-linux: patch CVE-2026-53613
Date: Mon,  5 Oct 2026 19:05:07 +0200
Message-ID: <20261005170513.632348-2-peter.marko@siemens.com>
In-Reply-To: <20261005170513.632348-1-peter.marko@siemens.com>
References: <20261005170513.632348-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 17:05:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247247

From: Peter Marko <peter.marko@siemens.com>

Pick patch referencing this CVE from 2.41.5 release.
Also pick patches implementing used helper functions and fixing
consequent build errors.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/recipes-core/util-linux/util-linux.inc   |   5 +
 ...ib-fileutils-add-ul_open_no_symlinks.patch |  98 +++++++++
 ...dd-ul_openat_resolve-openat2-wrapper.patch |  85 ++++++++
 ...x-RESOLVE_NO_SYMLINKS-fallback-value.patch |  71 +++++++
 ...x-unused-parameter-warnings-without-.patch |  64 ++++++
 .../util-linux/CVE-2026-53613.patch           | 192 ++++++++++++++++++
 6 files changed, 515 insertions(+)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-lib-fileutils-add-ul_open_no_symlinks.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-lib-fileutils-add-ul_openat_resolve-openat2-wrapper.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-lib-fileutils-fix-RESOLVE_NO_SYMLINKS-fallback-value.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-lib-fileutils-fix-unused-parameter-warnings-without-.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/CVE-2026-53613.patch

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 70acf6dfec3..db698ef9367 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -50,6 +50,11 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://CVE-2026-13595.patch \
            file://CVE-2026-3184.patch \
            file://CVE-2026-53614.patch \
+           file://0001-lib-fileutils-add-ul_open_no_symlinks.patch \
+           file://0001-lib-fileutils-add-ul_openat_resolve-openat2-wrapper.patch \
+           file://0001-lib-fileutils-fix-unused-parameter-warnings-without-.patch \
+           file://0001-lib-fileutils-fix-RESOLVE_NO_SYMLINKS-fallback-value.patch \
+           file://CVE-2026-53613.patch \
            "
 
 SRC_URI[sha256sum] = "7b6605e48d1a49f43cc4b4cfc59f313d0dd5402fa40b96810bd572e167dfed0f"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-lib-fileutils-add-ul_open_no_symlinks.patch b/meta/recipes-core/util-linux/util-linux/0001-lib-fileutils-add-ul_open_no_symlinks.patch
new file mode 100644
index 00000000000..d795e32087f
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-lib-fileutils-add-ul_open_no_symlinks.patch
@@ -0,0 +1,98 @@
+From b639bf5c4277b7f828b3fcbdbf94bad5a4d20060 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Wed, 27 May 2026 10:35:39 +0200
+Subject: [PATCH] lib/fileutils: add ul_open_no_symlinks()
+
+Add a helper that opens a path rejecting symlinks at any component,
+not just the last one.  Uses openat2(RESOLVE_NO_SYMLINKS) when
+available (Linux >= 5.6), falls back to open(O_NOFOLLOW).
+
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit e01e38b24346a21f1d01498c265486a12c009e61)
+
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/b639bf5c4277b7f828b3fcbdbf94bad5a4d20060]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ configure.ac        |  1 +
+ include/fileutils.h |  2 ++
+ lib/fileutils.c     | 24 ++++++++++++++++++++++++
+ meson.build         |  1 +
+ 4 files changed, 28 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 3bbc94488..2d9388a3c 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -316,6 +316,7 @@ AC_CHECK_HEADERS([ \
+ 	linux/kcmp.h \
+ 	linux/net_namespace.h \
+ 	linux/nsfs.h \
++	linux/openat2.h \
+ 	linux/pr.h \
+ 	linux/raw.h \
+ 	linux/securebits.h \
+diff --git a/include/fileutils.h b/include/fileutils.h
+index 6fc93d0db..996e18322 100644
+--- a/include/fileutils.h
++++ b/include/fileutils.h
+@@ -61,6 +61,8 @@ static inline int is_same_inode(const int fd, const struct stat *st)
+ 	return 1;
+ }
+ 
++extern int ul_open_no_symlinks(const char *path, int flags, mode_t mode);
++
+ extern int dup_fd_cloexec(int oldfd, int lowfd);
+ extern unsigned int get_fd_tabsize(void);
+ 
+diff --git a/lib/fileutils.c b/lib/fileutils.c
+index b7acae430..a9c2022be 100644
+--- a/lib/fileutils.c
++++ b/lib/fileutils.c
+@@ -11,7 +11,14 @@
+ #include <unistd.h>
+ #include <sys/time.h>
+ #include <sys/resource.h>
++#include <sys/syscall.h>
+ #include <string.h>
++#include <fcntl.h>
++#include <errno.h>
++
++#ifdef HAVE_LINUX_OPENAT2_H
++# include <linux/openat2.h>
++#endif
+ 
+ #include "c.h"
+ #include "all-io.h"
+@@ -311,3 +318,20 @@ int ul_reopen(int fd, int flags)
+ 
+ 	return open(buf, flags);
+ }
++
++int ul_open_no_symlinks(const char *path, int flags, mode_t mode)
++{
++#if defined(SYS_openat2) && defined(RESOLVE_NO_SYMLINKS)
++	struct open_how how = {
++		.flags = (__u64) flags,
++		.mode = (__u64) mode,
++		.resolve = RESOLVE_NO_SYMLINKS,
++	};
++	int fd = syscall(SYS_openat2, AT_FDCWD, path, &how, sizeof(how));
++
++	/* only fall back to O_NOFOLLOW if the syscall is unavailable */
++	if (fd >= 0 || errno != ENOSYS)
++		return fd;
++#endif
++	return open(path, flags | O_NOFOLLOW, mode);
++}
+diff --git a/meson.build b/meson.build
+index c79939c05..7b2b9ee71 100644
+--- a/meson.build
++++ b/meson.build
+@@ -177,6 +177,7 @@ headers = '''
+         linux/kcmp.h
+         linux/net_namespace.h
+         linux/nsfs.h
++        linux/openat2.h
+         linux/mount.h
+         linux/pr.h
+         linux/securebits.h
diff --git a/meta/recipes-core/util-linux/util-linux/0001-lib-fileutils-add-ul_openat_resolve-openat2-wrapper.patch b/meta/recipes-core/util-linux/util-linux/0001-lib-fileutils-add-ul_openat_resolve-openat2-wrapper.patch
new file mode 100644
index 00000000000..f8320ae82d5
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-lib-fileutils-add-ul_openat_resolve-openat2-wrapper.patch
@@ -0,0 +1,85 @@
+From 4cccf4edc256507734e3484cfaedf5980945c2fa Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Mon, 20 Jul 2026 14:36:16 +0200
+Subject: [PATCH] lib/fileutils: add ul_openat_resolve() openat2 wrapper
+
+Add ul_openat_resolve() as a generic openat2(2) wrapper with
+caller-specified resolve flags. No fallback to weaker alternatives --
+returns -1/ENOSYS if openat2 is unavailable.
+
+Rewrite ul_open_no_symlinks() to use ul_openat_resolve() with
+RESOLVE_NO_SYMLINKS, dropping the unsafe O_NOFOLLOW fallback that
+only protected the final path component.
+
+Add fallback defines for RESOLVE_NO_SYMLINKS and RESOLVE_BENEATH
+in fileutils.h.
+
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit b9e07ce6f5ad54c38cf3ebc7100101e487be91bd)
+(cherry picked from commit 1426aa06ff2f6a21cba9102c35e3577641b356ff)
+
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/4cccf4edc256507734e3484cfaedf5980945c2fa]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ include/fileutils.h |  9 +++++++++
+ lib/fileutils.c     | 22 ++++++++++++++--------
+ 2 files changed, 23 insertions(+), 8 deletions(-)
+
+diff --git a/include/fileutils.h b/include/fileutils.h
+index 996e18322..09395620a 100644
+--- a/include/fileutils.h
++++ b/include/fileutils.h
+@@ -62,6 +62,15 @@ static inline int is_same_inode(const int fd, const struct stat *st)
+ }
+ 
+ extern int ul_open_no_symlinks(const char *path, int flags, mode_t mode);
++extern int ul_openat_resolve(int dirfd, const char *path, int flags,
++			     mode_t mode, unsigned long long resolve);
++
++#ifndef RESOLVE_NO_SYMLINKS
++# define RESOLVE_NO_SYMLINKS	0x02
++#endif
++#ifndef RESOLVE_BENEATH
++# define RESOLVE_BENEATH	0x08
++#endif
+ 
+ extern int dup_fd_cloexec(int oldfd, int lowfd);
+ extern unsigned int get_fd_tabsize(void);
+diff --git a/lib/fileutils.c b/lib/fileutils.c
+index a9c2022be..c60070855 100644
+--- a/lib/fileutils.c
++++ b/lib/fileutils.c
+@@ -319,19 +319,25 @@ int ul_reopen(int fd, int flags)
+ 	return open(buf, flags);
+ }
+ 
+-int ul_open_no_symlinks(const char *path, int flags, mode_t mode)
++int ul_openat_resolve(int dirfd, const char *path, int flags,
++		      mode_t mode, unsigned long long resolve)
+ {
+-#if defined(SYS_openat2) && defined(RESOLVE_NO_SYMLINKS)
++#if defined(SYS_openat2)
+ 	struct open_how how = {
+ 		.flags = (__u64) flags,
+ 		.mode = (__u64) mode,
+-		.resolve = RESOLVE_NO_SYMLINKS,
++		.resolve = resolve,
+ 	};
+-	int fd = syscall(SYS_openat2, AT_FDCWD, path, &how, sizeof(how));
+ 
+-	/* only fall back to O_NOFOLLOW if the syscall is unavailable */
+-	if (fd >= 0 || errno != ENOSYS)
+-		return fd;
++	return syscall(SYS_openat2, dirfd, path, &how, sizeof(how));
++#else
++	errno = ENOSYS;
++	return -1;
+ #endif
+-	return open(path, flags | O_NOFOLLOW, mode);
++}
++
++int ul_open_no_symlinks(const char *path, int flags, mode_t mode)
++{
++	return ul_openat_resolve(AT_FDCWD, path, flags, mode,
++				 RESOLVE_NO_SYMLINKS);
+ }
diff --git a/meta/recipes-core/util-linux/util-linux/0001-lib-fileutils-fix-RESOLVE_NO_SYMLINKS-fallback-value.patch b/meta/recipes-core/util-linux/util-linux/0001-lib-fileutils-fix-RESOLVE_NO_SYMLINKS-fallback-value.patch
new file mode 100644
index 00000000000..440b513f4b5
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-lib-fileutils-fix-RESOLVE_NO_SYMLINKS-fallback-value.patch
@@ -0,0 +1,71 @@
+From ba905a1874959c70fd706aa7d49df61076864e0a Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Tue, 8 Sep 2026 10:26:38 +0200
+Subject: [PATCH] lib/fileutils: fix RESOLVE_NO_SYMLINKS fallback value
+
+The fallback #define used 0x02, but that is RESOLVE_NO_MAGICLINKS.
+The correct value, as used by the kernel and glibc, is 0x04.
+
+The fallback is not dead code: no libmount source includes
+<linux/openat2.h>, and glibc provides the RESOLVE_* macros only via
+<bits/openat2.h>, which is a recent addition. On older glibc libmount
+then asks openat2() to block magic-links instead of symlinks. The
+syscall succeeds and follows the symlink, so the protection in
+mnt_context_open_tree(), hook_mount.c and hook_idmap.c is silently
+ineffective.
+
+Move the <linux/openat2.h> include from lib/fileutils.c to
+include/fileutils.h so all users get the kernel values, and correct
+the fallback.
+
+Fixes: b9e07ce6f ("lib/fileutils: add ul_openat_resolve() openat2 wrapper")
+Addresses: https://github.com/util-linux/util-linux/issues/4606
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit 20361d66df4d3f32d5e137fe61a55cdf156c91f0)
+
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/ba905a1874959c70fd706aa7d49df61076864e0a]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ include/fileutils.h | 6 +++++-
+ lib/fileutils.c     | 4 ----
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/include/fileutils.h b/include/fileutils.h
+index 09395620a..0b36104be 100644
+--- a/include/fileutils.h
++++ b/include/fileutils.h
+@@ -11,6 +11,10 @@
+ #include <dirent.h>
+ #include <sys/stat.h>
+ 
++#ifdef HAVE_LINUX_OPENAT2_H
++# include <linux/openat2.h>
++#endif
++
+ #include "c.h"
+ 
+ extern int mkstemp_cloexec(char *template);
+@@ -66,7 +70,7 @@ extern int ul_openat_resolve(int dirfd, const char *path, int flags,
+ 			     mode_t mode, unsigned long long resolve);
+ 
+ #ifndef RESOLVE_NO_SYMLINKS
+-# define RESOLVE_NO_SYMLINKS	0x02
++# define RESOLVE_NO_SYMLINKS	0x04
+ #endif
+ #ifndef RESOLVE_BENEATH
+ # define RESOLVE_BENEATH	0x08
+diff --git a/lib/fileutils.c b/lib/fileutils.c
+index 1142febb0..8ca2c0aae 100644
+--- a/lib/fileutils.c
++++ b/lib/fileutils.c
+@@ -16,10 +16,6 @@
+ #include <fcntl.h>
+ #include <errno.h>
+ 
+-#ifdef HAVE_LINUX_OPENAT2_H
+-# include <linux/openat2.h>
+-#endif
+-
+ #include "c.h"
+ #include "all-io.h"
+ #include "fileutils.h"
diff --git a/meta/recipes-core/util-linux/util-linux/0001-lib-fileutils-fix-unused-parameter-warnings-without-.patch b/meta/recipes-core/util-linux/util-linux/0001-lib-fileutils-fix-unused-parameter-warnings-without-.patch
new file mode 100644
index 00000000000..fe14fcae9f0
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/0001-lib-fileutils-fix-unused-parameter-warnings-without-.patch
@@ -0,0 +1,64 @@
+From 339ff352b7b8b868367d2370ed077675326c3bca Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Thu, 3 Sep 2026 09:45:29 +0200
+Subject: [PATCH] lib/fileutils: fix unused parameter warnings without
+ SYS_openat2
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+On systems without SYS_openat2 (older kernels), ul_openat_resolve()
+is a stub that returns -ENOSYS, making all parameters unused. With
+-Werror=unused-parameter this breaks the build.
+
+Move the #ifdef around the whole function so each branch has its own
+declaration — the SYS_openat2 branch uses all parameters normally,
+the fallback branch marks them __unused__.
+
+Fixes: fb8e26535 ("libmount: pin source path with openat2() for restricted users")
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit a471b62e732a491f1abe42450352fb0f9b5b43ea)
+
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/339ff352b7b8b868367d2370ed077675326c3bca]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/fileutils.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/lib/fileutils.c b/lib/fileutils.c
+index c60070855..1142febb0 100644
+--- a/lib/fileutils.c
++++ b/lib/fileutils.c
+@@ -319,10 +319,10 @@ int ul_reopen(int fd, int flags)
+ 	return open(buf, flags);
+ }
+ 
++#if defined(SYS_openat2)
+ int ul_openat_resolve(int dirfd, const char *path, int flags,
+ 		      mode_t mode, unsigned long long resolve)
+ {
+-#if defined(SYS_openat2)
+ 	struct open_how how = {
+ 		.flags = (__u64) flags,
+ 		.mode = (__u64) mode,
+@@ -330,11 +330,19 @@ int ul_openat_resolve(int dirfd, const char *path, int flags,
+ 	};
+ 
+ 	return syscall(SYS_openat2, dirfd, path, &how, sizeof(how));
++}
+ #else
++int ul_openat_resolve(
++		int dirfd __attribute__((__unused__)),
++		const char *path __attribute__((__unused__)),
++		int flags __attribute__((__unused__)),
++		mode_t mode __attribute__((__unused__)),
++		unsigned long long resolve __attribute__((__unused__)))
++{
+ 	errno = ENOSYS;
+ 	return -1;
+-#endif
+ }
++#endif
+ 
+ int ul_open_no_symlinks(const char *path, int flags, mode_t mode)
+ {
diff --git a/meta/recipes-core/util-linux/util-linux/CVE-2026-53613.patch b/meta/recipes-core/util-linux/util-linux/CVE-2026-53613.patch
new file mode 100644
index 00000000000..0fb313d3db2
--- /dev/null
+++ b/meta/recipes-core/util-linux/util-linux/CVE-2026-53613.patch
@@ -0,0 +1,192 @@
+From 2c002044d1be71ebf45c24571f1a4532a408d0d7 Mon Sep 17 00:00:00 2001
+From: Karel Zak <kzak@redhat.com>
+Date: Tue, 16 Jun 2026 11:13:54 +0200
+Subject: [PATCH 07/15] libmount: add fd_target to context for TOCTOU
+ prevention
+
+Add a pinned O_PATH target fd to libmnt_context with lazy-open getter
+mnt_context_get_target_fd() and mnt_context_close_target_fd().
+
+The fd is opened via ul_open_no_symlinks() (RESOLVE_NO_SYMLINKS) to
+reject symlinks at any path component.  The fd is closed on context
+reset.
+
+CVE-2026-53613
+
+Signed-off-by: Karel Zak <kzak@redhat.com>
+(cherry picked from commit 78a860982e036f38fe9c0b3344998df5ac2c2ff5)
+
+CVE: CVE-2026-53613
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit/0b010025a0e429bc80355c94db86a843395d49e2]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ libmount/src/context.c           | 43 ++++++++++++++++++++++++++++++++
+ libmount/src/context_mount.c     |  7 ++++++
+ libmount/src/hook_mount.c        | 18 ++++++++++++-
+ libmount/src/hook_mount_legacy.c |  3 +++
+ libmount/src/mountP.h            |  7 ++++++
+ 5 files changed, 77 insertions(+), 1 deletion(-)
+
+diff --git a/libmount/src/context.c b/libmount/src/context.c
+index 0cd320190..3055c63df 100644
+--- a/libmount/src/context.c
++++ b/libmount/src/context.c
+@@ -37,6 +37,7 @@
+  */
+ 
+ #include "mountP.h"
++#include "fileutils.h"
+ #include "strutils.h"
+ #include "namespace.h"
+ #include "match.h"
+@@ -65,6 +66,7 @@ struct libmnt_context *mnt_new_context(void)
+ 	cxt->ns_orig.fd = -1;
+ 	cxt->ns_tgt.fd = -1;
+ 	cxt->ns_cur = &cxt->ns_orig;
++	cxt->fd_target = -1;
+ 
+ 	cxt->map_linux = mnt_get_builtin_optmap(MNT_LINUX_MAP);
+ 	cxt->map_userspace = mnt_get_builtin_optmap(MNT_USERSPACE_MAP);
+@@ -171,6 +173,7 @@ int mnt_reset_context(struct libmnt_context *cxt)
+ 	cxt->map_userspace = mnt_get_builtin_optmap(MNT_USERSPACE_MAP);
+ 
+ 	mnt_context_reset_status(cxt);
++	mnt_context_close_target_fd(cxt);
+ 	mnt_context_deinit_hooksets(cxt);
+ 
+ 	if (cxt->table_fltrcb)
+@@ -395,6 +398,46 @@ int mnt_context_is_restricted(struct libmnt_context *cxt)
+ 	return cxt->restricted;
+ }
+ 
++int mnt_context_target_fd_required(struct libmnt_context *cxt)
++{
++	return mnt_context_is_restricted(cxt);
++}
++
++int mnt_context_reopen_target_fd(struct libmnt_context *cxt)
++{
++	assert(cxt);
++
++	if (!mnt_context_target_fd_required(cxt))
++		return 0;
++	mnt_context_close_target_fd(cxt);
++	if (mnt_context_get_target_fd(cxt) < 0)
++		return -errno;
++	return 0;
++}
++
++int mnt_context_get_target_fd(struct libmnt_context *cxt)
++{
++	assert(cxt);
++
++	if (cxt->fd_target < 0) {
++		const char *target = mnt_fs_get_target(cxt->fs);
++
++		if (target)
++			cxt->fd_target = ul_open_no_symlinks(target,
++						O_PATH | O_CLOEXEC, 0);
++	}
++	return cxt->fd_target;
++}
++
++void mnt_context_close_target_fd(struct libmnt_context *cxt)
++{
++	assert(cxt);
++
++	if (cxt->fd_target >= 0)
++		close(cxt->fd_target);
++	cxt->fd_target = -1;
++}
++
+ /**
+  * mnt_context_force_unrestricted:
+  * @cxt: mount context
+diff --git a/libmount/src/context_mount.c b/libmount/src/context_mount.c
+index 41986e74b..dd46bf053 100644
+--- a/libmount/src/context_mount.c
++++ b/libmount/src/context_mount.c
+@@ -726,6 +726,13 @@ static int prepare_target(struct libmnt_context *cxt)
+ 	if (rc == 0)
+ 		rc = mnt_context_call_hooks(cxt, MNT_STAGE_PREP_TARGET);
+ 
++	if (rc == 0
++	    && mnt_context_target_fd_required(cxt)
++	    && mnt_context_get_target_fd(cxt) < 0) {
++		DBG(CXT, ul_debugobj(cxt, "failed to pin target"));
++		rc = -errno;
++	}
++
+ 	if (!mnt_context_switch_ns(cxt, ns_old))
+ 		return -MNT_ERR_NAMESPACE;
+ 
+diff --git a/libmount/src/hook_mount.c b/libmount/src/hook_mount.c
+index 593111168..a34b2d4bd 100644
+--- a/libmount/src/hook_mount.c
++++ b/libmount/src/hook_mount.c
+@@ -527,9 +527,25 @@ static int hook_attach_target(struct libmnt_context *cxt,
+ 		umount2(target, MNT_DETACH);
+ 	}
+ 
+-	rc = move_mount(api->fd_tree, "", AT_FDCWD, target, MOVE_MOUNT_F_EMPTY_PATH);
++	/* fd_target is open in restricted mode (see prepare_target()) */
++	if (mnt_context_target_fd_required(cxt)) {
++		int fd = mnt_context_get_target_fd(cxt);
++
++		if (fd < 0)
++			return -errno;
++		rc = move_mount(api->fd_tree, "", fd, "",
++				MOVE_MOUNT_F_EMPTY_PATH | MOVE_MOUNT_T_EMPTY_PATH);
++	} else
++		rc = move_mount(api->fd_tree, "", AT_FDCWD, target,
++				MOVE_MOUNT_F_EMPTY_PATH);
++
+ 	set_syscall_status(cxt, "move_mount", rc == 0);
+ 
++	if (rc == 0) {
++		/* re-open to point to the mounted filesystem root */
++		rc = mnt_context_reopen_target_fd(cxt);
++	}
++
+ 	return rc == 0 ? 0 : -errno;
+ }
+ 
+diff --git a/libmount/src/hook_mount_legacy.c b/libmount/src/hook_mount_legacy.c
+index 56e92b05d..b7882a108 100644
+--- a/libmount/src/hook_mount_legacy.c
++++ b/libmount/src/hook_mount_legacy.c
+@@ -248,6 +248,9 @@ static int hook_mount(struct libmnt_context *cxt,
+ 		return rc;
+ 	}
+ 
++	/* re-open to point to the mounted filesystem root */
++	rc = mnt_context_reopen_target_fd(cxt);
++
+ 	cxt->syscall_status = 0;
+ 	return rc;
+ }
+diff --git a/libmount/src/mountP.h b/libmount/src/mountP.h
+index 339e2761a..37a00e571 100644
+--- a/libmount/src/mountP.h
++++ b/libmount/src/mountP.h
+@@ -442,6 +442,8 @@ struct libmnt_context
+ 	unsigned int	has_selinux_opt : 1;	/* temporary for broken fsconfig() syscall */
+ 	unsigned int    force_clone : 1;	/* OPEN_TREE_CLONE */
+ 
++	int		fd_target;	/* pinned target fd (RESOLVE_NO_SYMLINKS) */
++
+ 	struct list_head	hooksets_datas;	/* global hooksets data */
+ 	struct list_head	hooksets_hooks;	/* global hooksets data */
+ };
+@@ -630,6 +632,11 @@ extern int mnt_context_prepare_update(struct libmnt_context *cxt);
+ extern int mnt_context_merge_mflags(struct libmnt_context *cxt);
+ extern int mnt_context_update_tabs(struct libmnt_context *cxt);
+ 
++extern int mnt_context_target_fd_required(struct libmnt_context *cxt);
++extern int mnt_context_get_target_fd(struct libmnt_context *cxt);
++extern void mnt_context_close_target_fd(struct libmnt_context *cxt);
++extern int mnt_context_reopen_target_fd(struct libmnt_context *cxt);
++
+ extern int mnt_context_umount_setopt(struct libmnt_context *cxt, int c, char *arg);
+ extern int mnt_context_mount_setopt(struct libmnt_context *cxt, int c, char *arg);
+ 

