Return-Path: <cristian.iorga@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D5A486D032
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2014 14:34:50 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 08 Jan 2014 06:34:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,624,1384329600"; d="scan'208";a="462024893"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga002.fm.intel.com with ESMTP; 08 Jan 2014 06:34:51 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jan 2014 16:37:31 +0200
Message-Id: <db41a6d15f1c97b268fcecde55019caad277447b.1389191803.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1389191803.git.cristian.iorga@intel.com>
References: <cover.1389191803.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1389191803.git.cristian.iorga@intel.com>
References: <cover.1389191803.git.cristian.iorga@intel.com>
Subject: [PATCH 2/2] qemu: upgrade to 1.7.0
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
X-List-Received-Date: Wed, 08 Jan 2014 14:34:51 -0000

linux-user-Handle-SOCK_CLOEXEC-NONBLOCK-if-unavailab.patch
file no longer needed, included in upstream.
qemu-native tested on all architectures,
host machine is Ubuntu Linux 13.10 x86-64.
Basic X11 and networking tests performed.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 ...Handle-SOCK_CLOEXEC-NONBLOCK-if-unavailab.patch | 92 ----------------------
 meta/recipes-devtools/qemu/qemu.inc                |  1 -
 .../qemu/{qemu_1.6.1.bb => qemu_1.7.0.bb}          |  4 +-
 3 files changed, 2 insertions(+), 95 deletions(-)
 delete mode 100644 meta/recipes-devtools/qemu/files/linux-user-Handle-SOCK_CLOEXEC-NONBLOCK-if-unavailab.patch
 rename meta/recipes-devtools/qemu/{qemu_1.6.1.bb => qemu_1.7.0.bb} (78%)

diff --git a/meta/recipes-devtools/qemu/files/linux-user-Handle-SOCK_CLOEXEC-NONBLOCK-if-unavailab.patch b/meta/recipes-devtools/qemu/files/linux-user-Handle-SOCK_CLOEXEC-NONBLOCK-if-unavailab.patch
deleted file mode 100644
index eb63896..0000000
--- a/meta/recipes-devtools/qemu/files/linux-user-Handle-SOCK_CLOEXEC-NONBLOCK-if-unavailab.patch
+++ /dev/null
@@ -1,92 +0,0 @@
-Upstream-Status: Backport
-
-From 53d09b761f032f50c4424e8649396a9041070bae Mon Sep 17 00:00:00 2001
-From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
-Date: Mon, 23 Sep 2013 14:11:53 +0200
-Subject: [PATCH] linux-user: Handle SOCK_CLOEXEC/NONBLOCK if unavailable on
- host
-
-If the host lacks SOCK_CLOEXEC, bail out with -EINVAL.
-If the host lacks SOCK_ONONBLOCK, try to emulate it with fcntl()
-and O_NONBLOCK.
-
-Signed-off-by: Edgar E. Iglesias <edgar.iglesias@gmail.com>
-Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
----
- linux-user/syscall.c | 40 +++++++++++++++++++++++++++++++++++++---
- 1 file changed, 37 insertions(+), 3 deletions(-)
-
-diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index b3822b3..4a14a43 100644
---- a/linux-user/syscall.c
-+++ b/linux-user/syscall.c
-@@ -1773,7 +1773,7 @@ static void unlock_iovec(struct iovec *vec, abi_ulong target_addr,
-     free(vec);
- }
-
--static inline void target_to_host_sock_type(int *type)
-+static inline int target_to_host_sock_type(int *type)
- {
-     int host_type = 0;
-     int target_type = *type;
-@@ -1790,22 +1790,56 @@ static inline void target_to_host_sock_type(int *type)
-         break;
-     }
-     if (target_type & TARGET_SOCK_CLOEXEC) {
-+#if defined(SOCK_CLOEXEC)
-         host_type |= SOCK_CLOEXEC;
-+#else
-+        return -TARGET_EINVAL;
-+#endif
-     }
-     if (target_type & TARGET_SOCK_NONBLOCK) {
-+#if defined(SOCK_NONBLOCK)
-         host_type |= SOCK_NONBLOCK;
-+#elif !defined(O_NONBLOCK)
-+        return -TARGET_EINVAL;
-+#endif
-     }
-     *type = host_type;
-+    return 0;
-+}
-+
-+/* Try to emulate socket type flags after socket creation.  */
-+static int sock_flags_fixup(int fd, int target_type)
-+{
-+#if !defined(SOCK_NONBLOCK) && defined(O_NONBLOCK)
-+    if (target_type & TARGET_SOCK_NONBLOCK) {
-+        int flags = fcntl(fd, F_GETFL);
-+        if (fcntl(fd, F_SETFL, O_NONBLOCK | flags) == -1) {
-+            close(fd);
-+            return -TARGET_EINVAL;
-+        }
-+    }
-+#endif
-+    return fd;
- }
-
- /* do_socket() Must return target values and target errnos. */
- static abi_long do_socket(int domain, int type, int protocol)
- {
--    target_to_host_sock_type(&type);
-+    int target_type = type;
-+    int ret;
-+
-+    ret = target_to_host_sock_type(&type);
-+    if (ret) {
-+        return ret;
-+    }
-
-     if (domain == PF_NETLINK)
-         return -EAFNOSUPPORT; /* do not NETLINK socket connections possible */
--    return get_errno(socket(domain, type, protocol));
-+    ret = get_errno(socket(domain, type, protocol));
-+    if (ret >= 0) {
-+        ret = sock_flags_fixup(ret, target_type);
-+    }
-+    return ret;
- }
-
- /* do_bind() Must return target values and target errnos. */
---
-1.8.2.1
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index e210ea1..856169b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -19,7 +19,6 @@ SRC_URI = "\
     file://no-strip.patch \
     file://larger_default_ram_size.patch \
     file://disable-grabs.patch \
-    file://linux-user-Handle-SOCK_CLOEXEC-NONBLOCK-if-unavailab.patch \
     "
 
 SRC_URI_append_class-native = "\
diff --git a/meta/recipes-devtools/qemu/qemu_1.6.1.bb b/meta/recipes-devtools/qemu/qemu_1.7.0.bb
similarity index 78%
rename from meta/recipes-devtools/qemu/qemu_1.6.1.bb
rename to meta/recipes-devtools/qemu/qemu_1.7.0.bb
index 03e28a0..d5265bc 100644
--- a/meta/recipes-devtools/qemu/qemu_1.6.1.bb
+++ b/meta/recipes-devtools/qemu/qemu_1.7.0.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
 SRC_URI += "file://fxrstorssefix.patch"
 
 SRC_URI_prepend = "http://wiki.qemu.org/download/qemu-${PV}.tar.bz2"
-SRC_URI[md5sum] = "3a897d722457c5a895cd6ac79a28fda0"
-SRC_URI[sha256sum] = "fc736f44aa10478223c881310a7e40fc8386547e9cadf7d01ca4685951605294"
+SRC_URI[md5sum] = "32893941d40d052a5e649efcf06aca06"
+SRC_URI[sha256sum] = "31f333a85f2d14c605a77679904a9668eaeb1b6dc7da53a1665230f46bc21314"
 
 COMPATIBLE_HOST_class-target_mips64 = "null"
 
-- 
1.8.3.2


