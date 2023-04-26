Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64BBFC77B78
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 15:09:49 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.10822.1682521786068828042
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 08:09:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=lxoTXiwL;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1682521786;
  x=1714057786;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N4nmh/DvPzHTjK2PNFHLKJoeaXpl2LcIRMDMJnKjSKA=;
  b=lxoTXiwLxp71wr9dgWAzC0W1MlnXwa4d60PRCseBED5wz+sdQSNE9pfL
   jw5FUp4j28wq8iHGtQkI23uSqVFfD/c91lOcMCcoA8ZNzW8agZiOxI2F5
   7XQxPwIARvMdCci9A0ugB4lMLQkHnH6nQU2Lk7L3j1P2aERulGyJ8KxnO
   NhDD6WqdjT42/V3jC99iyS/ZfHz5KoiJy6qi+4xPQBjqjprsFe61jghfc
   ycjJBdmBhVNG6lB8qBYt/pQ7rle9SizGHqdgbzQ+89nGOIH1dv/sx9TDv
   QvfHT67Hya/zCB+WKvSKOq8pzqYVB7rDd4FEIbBvrcaq42xUVWC/zAgIO
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [master][mickledore][PATCH] glib-2.0: Avoid having g_futex_simple() inadvertently modify errno
Date: Wed, 26 Apr 2023 17:09:39 +0200
Message-ID: <20230426150939.426088-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 15:09:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180445

From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>

If both __NR_futex and __NR_futex_time64 are defined, g_futex_simple()
will first call futex_time64(). If that fails with ENOSYS, then
futex_time() is called instead. However, errno was not saved and
restored in this case, which would result in g_futex_simple()
returning with errno set to ENOSYS, even if futex_time() succeeded.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 ...utex_simple-inadvertently-modify-err.patch | 36 +++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb |  1 +
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
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb
index 5b79ae481c..08a0878496 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb
@@ -16,6 +16,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            file://0001-gio-tests-g-file-info-don-t-assume-million-in-one-ev.patch \
            file://0001-gio-tests-meson.build-do-not-use-can_run_host_binari.patch \
+           file://0001-Avoid-having-g_futex_simple-inadvertently-modify-err.patch \
            file://cpp-null.patch \
            file://cpp-null2.patch \
            "

