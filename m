Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 756B4C7EE26
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 01:14:26 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.9687.1684804456627490737
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 May 2023 18:14:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=QbKVWH2k;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1684804457;
  x=1716340457;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=cZWl1FMjQbuiVlaf2dyqDz6TQ/uzk6NSBdXwY5tkC7E=;
  b=QbKVWH2klZ5ffS7mM4YXmuwkDL9XBtNcjU1anJ7OtneOpKQnMtBSLi6E
   b3g/NgXKzpNmE79oHz4gxqhS2MgvSmH1D3Am1qLAwf1UGaHK0VjJMersQ
   P9JXke8j3sYttrf+TPpwefYDuoEbPGxeJgD4207DgB4A+WYlVvHzTxDME
   tBUVjBSb1s79shxsM8p6GdMqmP91VrP0E5hU+GzWJJjmsxQhP6RnIEl39
   DgEn8BX3Oqri8zvnVN0U2XrDBaCFmc/5lceKTQKidh4m00Cza+fDkMbQs
   JzOx+hxu0PbM7akSow58pcSu13Y7sQ/jdN1nJ9UWinlf5G/h7RDmmLFYu
   w==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2] glib-2.0: Avoid having g_futex_simple() inadvertently modify errno
Date: Tue, 23 May 2023 03:14:06 +0200
Message-ID: <20230523011406.47282-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 May 2023 01:14:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181620

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

If both __NR_futex and __NR_futex_time64 are defined, g_futex_simple()
will first call futex_time64(). If that fails with ENOSYS, then
futex_time() is called instead. However, errno was not saved and
restored in this case, which would result in g_futex_simple()
returning with errno set to ENOSYS, even if futex_time() succeeded.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

PATCHv2: Updated to apply to the 2.76.2 recipe.

The original patch should still apply to Mickledore.

 ...utex_simple-inadvertently-modify-err.patch | 36 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Avoid-having-g_futex_simple-inadvertently-modify-err.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Avoid-having-g_futex_simple-inadvertently-modify-err.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Avoid-having-g_futex_simple-inadvertently-modify-err.patch
new file mode 100644
index 0000000000..db63cfd91e
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Avoid-having-g_futex_simple-inadvertently-modify-err.patch
@@ -0,0 +1,36 @@
+From edd1e47f107410d9e4edb691335410026ae5a534 Mon Sep 17 00:00:00 2001
+From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+Date: Tue, 25 Apr 2023 20:02:31 +0200
+Subject: [PATCH] Avoid having g_futex_simple() inadvertently modify errno
+
+If both __NR_futex and __NR_futex_time64 are defined, g_futex_simple()
+will first call futex_time64(). If that fails with ENOSYS, then
+futex_time() is called instead. However, errno was not saved and
+restored in this case, which would result in g_futex_simple()
+returning with errno set to ENOSYS, even if futex_time() succeeded.
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/-/commit/edd1e47f107410d9e4edb691335410026ae5a534]
+Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
+---
+ glib/gthreadprivate.h | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/glib/gthreadprivate.h b/glib/gthreadprivate.h
+index 9c847e039..74d37ba32 100644
+--- a/glib/gthreadprivate.h
++++ b/glib/gthreadprivate.h
+@@ -65,9 +65,13 @@ struct  _GRealThread
+ #define g_futex_simple(uaddr, futex_op, ...)                                     \
+   G_STMT_START                                                                   \
+   {                                                                              \
++    int saved_errno = errno;                                                     \
+     int res = syscall (__NR_futex_time64, uaddr, (gsize) futex_op, __VA_ARGS__); \
+     if (res < 0 && errno == ENOSYS)                                              \
+-      syscall (__NR_futex, uaddr, (gsize) futex_op, __VA_ARGS__);                \
++      {                                                                          \
++        errno = saved_errno;                                                     \
++        syscall (__NR_futex, uaddr, (gsize) futex_op, __VA_ARGS__);              \
++      }                                                                          \
+   }                                                                              \
+   G_STMT_END
+ #elif defined(__NR_futex_time64)
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb
index 224f2c262e..f3a716eb9d 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb
@@ -14,6 +14,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-Do-not-write-bindir-into-pkg-config-files.patch \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
+           file://0001-Avoid-having-g_futex_simple-inadvertently-modify-err.patch \
            "
 SRC_URI:append:class-native = " file://relocate-modules.patch"
 

