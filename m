Return-Path: <kergoth@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 7EDDC6DE3A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 18:07:25 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id a1so5288541wgh.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 10:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=sRuSjxwXmcAT56lVxLMPzPz2q4UomDnNe1r4k3HVj0Q=;
	b=mx+jQdOUQkD9pHxnkYeXwq++kHaTr5H3MVbGs4lwSzgyS4d12Mb6oGm8tnDQqU/5N4
	0KMTNZxgMGbM7j21VaJ2TPZfdnddiDDUBr439TlafMrxOkYe455T0UaA60XVyft2qoqs
	Pylj1YWwFqphtGeRljzaZMcN2NQ4IkyBKPPMBDXbQfZg/7mVnpKuKg9IrjCO6HO6ae6u
	uYXu1hN3oYT1BhKBQTiLk9PuG8Ni3Embml0htY7Inh3I0EGZyXAs8VpFpzVbFEpf/bvq
	iehGFVMqEjGghv6wxLgkzItVcXy62M54w4Crx5gifcpLnHXOeKWt2/aCSxVPZmEmpV2A
	dAYA==
X-Received: by 10.181.11.201 with SMTP id ek9mr12195105wid.54.1385575644842;
	Wed, 27 Nov 2013 10:07:24 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id w1sm37430090wib.6.2013.11.27.10.07.22
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 27 Nov 2013 10:07:24 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2013 11:07:06 -0700
Message-Id: <a4a81e16e8524d630ed9f3d0a7a72332c2c00c53.1385575572.git.kergoth@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1385575572.git.kergoth@gmail.com>
References: <cover.1385575572.git.kergoth@gmail.com>
In-Reply-To: <cover.1385575572.git.kergoth@gmail.com>
References: <cover.1385575572.git.kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 6/7] qemu: handle CLOEXEC/NONBLOCK if unavailable on host
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
X-List-Received-Date: Wed, 27 Nov 2013 18:07:25 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 ...Handle-SOCK_CLOEXEC-NONBLOCK-if-unavailab.patch | 92 ++++++++++++++++++++++
 meta/recipes-devtools/qemu/qemu.inc                |  1 +
 2 files changed, 93 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/files/linux-user-Handle-SOCK_CLOEXEC-NONBLOCK-if-unavailab.patch

diff --git a/meta/recipes-devtools/qemu/files/linux-user-Handle-SOCK_CLOEXEC-NONBLOCK-if-unavailab.patch b/meta/recipes-devtools/qemu/files/linux-user-Handle-SOCK_CLOEXEC-NONBLOCK-if-unavailab.patch
new file mode 100644
index 0000000..eb63896
--- /dev/null
+++ b/meta/recipes-devtools/qemu/files/linux-user-Handle-SOCK_CLOEXEC-NONBLOCK-if-unavailab.patch
@@ -0,0 +1,92 @@
+Upstream-Status: Backport
+
+From 53d09b761f032f50c4424e8649396a9041070bae Mon Sep 17 00:00:00 2001
+From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
+Date: Mon, 23 Sep 2013 14:11:53 +0200
+Subject: [PATCH] linux-user: Handle SOCK_CLOEXEC/NONBLOCK if unavailable on
+ host
+
+If the host lacks SOCK_CLOEXEC, bail out with -EINVAL.
+If the host lacks SOCK_ONONBLOCK, try to emulate it with fcntl()
+and O_NONBLOCK.
+
+Signed-off-by: Edgar E. Iglesias <edgar.iglesias@gmail.com>
+Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
+---
+ linux-user/syscall.c | 40 +++++++++++++++++++++++++++++++++++++---
+ 1 file changed, 37 insertions(+), 3 deletions(-)
+
+diff --git a/linux-user/syscall.c b/linux-user/syscall.c
+index b3822b3..4a14a43 100644
+--- a/linux-user/syscall.c
++++ b/linux-user/syscall.c
+@@ -1773,7 +1773,7 @@ static void unlock_iovec(struct iovec *vec, abi_ulong target_addr,
+     free(vec);
+ }
+
+-static inline void target_to_host_sock_type(int *type)
++static inline int target_to_host_sock_type(int *type)
+ {
+     int host_type = 0;
+     int target_type = *type;
+@@ -1790,22 +1790,56 @@ static inline void target_to_host_sock_type(int *type)
+         break;
+     }
+     if (target_type & TARGET_SOCK_CLOEXEC) {
++#if defined(SOCK_CLOEXEC)
+         host_type |= SOCK_CLOEXEC;
++#else
++        return -TARGET_EINVAL;
++#endif
+     }
+     if (target_type & TARGET_SOCK_NONBLOCK) {
++#if defined(SOCK_NONBLOCK)
+         host_type |= SOCK_NONBLOCK;
++#elif !defined(O_NONBLOCK)
++        return -TARGET_EINVAL;
++#endif
+     }
+     *type = host_type;
++    return 0;
++}
++
++/* Try to emulate socket type flags after socket creation.  */
++static int sock_flags_fixup(int fd, int target_type)
++{
++#if !defined(SOCK_NONBLOCK) && defined(O_NONBLOCK)
++    if (target_type & TARGET_SOCK_NONBLOCK) {
++        int flags = fcntl(fd, F_GETFL);
++        if (fcntl(fd, F_SETFL, O_NONBLOCK | flags) == -1) {
++            close(fd);
++            return -TARGET_EINVAL;
++        }
++    }
++#endif
++    return fd;
+ }
+
+ /* do_socket() Must return target values and target errnos. */
+ static abi_long do_socket(int domain, int type, int protocol)
+ {
+-    target_to_host_sock_type(&type);
++    int target_type = type;
++    int ret;
++
++    ret = target_to_host_sock_type(&type);
++    if (ret) {
++        return ret;
++    }
+
+     if (domain == PF_NETLINK)
+         return -EAFNOSUPPORT; /* do not NETLINK socket connections possible */
+-    return get_errno(socket(domain, type, protocol));
++    ret = get_errno(socket(domain, type, protocol));
++    if (ret >= 0) {
++        ret = sock_flags_fixup(ret, target_type);
++    }
++    return ret;
+ }
+
+ /* do_bind() Must return target values and target errnos. */
+--
+1.8.2.1
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 747d6b2..0852722 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -18,6 +18,7 @@ SRC_URI = "\
     file://no-strip.patch \
     file://larger_default_ram_size.patch \
     file://disable-grabs.patch \
+    file://linux-user-Handle-SOCK_CLOEXEC-NONBLOCK-if-unavailab.patch \
     "
 
 SRC_URI_append_class-native = "\
-- 
1.8.3.4


