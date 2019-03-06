Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 1341C7CDF0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 19:21:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44F3Xz5qC7z3G
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 20:21:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1551900116;
	bh=mIOjIey3oPA5CQhowp8BB0ltyYM4TaHeEwYYcX1phSI=;
	h=From:To:Subject:Date:From;
	b=Nra04yqtcBx+2keMPXsSIyqpqPaXdxsRKz5VMVLvdzyVhl6buaWLAOh7UBxCQo+pr
	sftp8WLg0RvOND922QeCie81mYC9h4d6ONe5k/iGClKzd/KsWXzn3U4icOzBPjjChI
	j68hWo1chpGIAai0Z7bBDLDpsvzJGwPNIOU3Rh23NvNLl8qjWIRcWLz9t51RgQ0u8s
	0s3QtAOZC0PweTC5vN70vshvpRaBzAfEpAR3YxkbCe6Zf1FwP11m4tmUO2Gj60YJTE
	SzvjJEkM9TD8ih9YW9OPd8qkXGjXxEhpQo0pYg0icSGYMnqjeNTunB1fx44dEUlcPs
	SA2SCKP9ogTIXhE0E4RcwHEsTffacSK4Y7bpLfPc33qL/jQK72Lud11iUlbsjjOtlP
	MT6Co7D1sTBTTRqjiX24BAy3LbEo32LHNtEt9oAZE94CoyaZ6nvIcBxooY3eidd4a8
	9j753KHq2sDVJpfjez8NDvrf37C+RyL7qAk8qPhpRGzIW6Uwk+IVWAXrMUV6ScaHth
	yQu4106S/wFNx+aCiJWDtG7mTzj51KDiVu58XHyfcpgY4Tb93Lg3Nq4UH/5yoZFhb8
	Bsy1+KBXvj65VLwCo+B/oLL7VExLlHzDEZUySmK6MaTqM6IHJ8C4FE/ChSVQCE34of
	fB/JFYjBU/qbtA3Imna4/ee4=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Mar 2019 21:21:54 +0200
Message-Id: <20190306192154.18987-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] kmod: Remove compatibility for ancient hosts
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
X-List-Received-Date: Wed, 06 Mar 2019 19:21:56 -0000

Lack of be32toh() is handled upstream since 2014.

Linux 2.6.23 was released 2007, distributions with kernels
older than that are far outside the host distributions
still supported today.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-kernel/kmod/kmod-native_git.bb   |  3 --
 meta/recipes-kernel/kmod/kmod.inc             |  1 -
 ...g-bswap_-instead-of-htobe-and-be-toh.patch | 40 -------------------
 .../kmod/kmod/fix-O_CLOEXEC.patch             | 36 -----------------
 4 files changed, 80 deletions(-)
 delete mode 100644 meta/recipes-kernel/kmod/kmod/Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch
 delete mode 100644 meta/recipes-kernel/kmod/kmod/fix-O_CLOEXEC.patch

diff --git a/meta/recipes-kernel/kmod/kmod-native_git.bb b/meta/recipes-kernel/kmod/kmod-native_git.bb
index f0e274ed79..f61134bbaf 100644
--- a/meta/recipes-kernel/kmod/kmod-native_git.bb
+++ b/meta/recipes-kernel/kmod/kmod-native_git.bb
@@ -7,9 +7,6 @@ DEPENDS += "zlib-native"
 
 inherit native
 
-SRC_URI += "file://Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch \
-           "
-
 do_install_append (){
 	for tool in depmod insmod lsmod modinfo modprobe rmmod
 	do
diff --git a/meta/recipes-kernel/kmod/kmod.inc b/meta/recipes-kernel/kmod/kmod.inc
index 6d0e031c6f..e68860f6b4 100644
--- a/meta/recipes-kernel/kmod/kmod.inc
+++ b/meta/recipes-kernel/kmod/kmod.inc
@@ -21,7 +21,6 @@ PV = "26"
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git \
            file://depmod-search.conf \
            file://avoid_parallel_tests.patch \
-           file://fix-O_CLOEXEC.patch \
           "
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-kernel/kmod/kmod/Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch b/meta/recipes-kernel/kmod/kmod/Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch
deleted file mode 100644
index 0ec20fad99..0000000000
--- a/meta/recipes-kernel/kmod/kmod/Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 38d6871d9c98e0080426ea375e390728485b2bc2 Mon Sep 17 00:00:00 2001
-From: Ting Liu <b28495@freescale.com>
-Date: Tue, 10 Sep 2013 06:00:20 +0000
-Subject: [PATCH] Change to calling bswap_* instead of htobe* and be*toh
-
-We can't use htobe* and be*toh functions because they are not
-available on older versions of glibc, For example, shipped on Centos 5.5.
-
-Change to directly calling bswap_* as defined in+byteswap.h.
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Ting Liu <b28495@freescale.com>
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-
----
- libkmod/libkmod-signature.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/libkmod/libkmod-signature.c b/libkmod/libkmod-signature.c
-index 48d0145..dd2c6fa 100644
---- a/libkmod/libkmod-signature.c
-+++ b/libkmod/libkmod-signature.c
-@@ -18,6 +18,7 @@
-  */
- 
- #include <endian.h>
-+#include <byteswap.h>
- #include <inttypes.h>
- #ifdef ENABLE_OPENSSL
- #include <openssl/cms.h>
-@@ -343,7 +344,7 @@ bool kmod_module_signature_info(const struct kmod_file *file, struct kmod_signat
- 			modsig->hash >= PKEY_HASH__LAST ||
- 			modsig->id_type >= PKEY_ID_TYPE__LAST)
- 		return false;
--	sig_len = be32toh(get_unaligned(&modsig->sig_len));
-+	sig_len = bswap_32(get_unaligned(&modsig->sig_len));
- 	if (sig_len == 0 ||
- 	    size < (int64_t)(modsig->signer_len + modsig->key_id_len + sig_len))
- 		return false;
diff --git a/meta/recipes-kernel/kmod/kmod/fix-O_CLOEXEC.patch b/meta/recipes-kernel/kmod/kmod/fix-O_CLOEXEC.patch
deleted file mode 100644
index 07e4a1f538..0000000000
--- a/meta/recipes-kernel/kmod/kmod/fix-O_CLOEXEC.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 5f55e6806cd8ae1a6c8ec1e6cb38ad292cfc1df9 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Wed, 22 Jan 2014 01:06:40 -0500
-Subject: [PATCH] libkmod/libkmod-internal.h: check whether O_CLOEXEC is
- defined or not
-
-O_CLOEXEC is introduced from Linux 2.6.23, so old kernel doesn't have
-it, we need check before use.
-
-This patch is much more like a workaround, since it may need fcntl() use
-FD_CLOEXEC to replace.
-
-This problem was reported by "Ting Liu <b28495@freescale.com>"
-Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
-
-Upstream-Status: Pending
-
----
- libkmod/libkmod-internal.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/libkmod/libkmod-internal.h b/libkmod/libkmod-internal.h
-index a65ddd1..a4f4b77 100644
---- a/libkmod/libkmod-internal.h
-+++ b/libkmod/libkmod-internal.h
-@@ -10,6 +10,10 @@
- 
- #include "libkmod.h"
- 
-+#ifndef O_CLOEXEC
-+#define O_CLOEXEC 0
-+#endif
-+
- static _always_inline_ _printf_format_(2, 3) void
- 	kmod_log_null(struct kmod_ctx *ctx, const char *format, ...) {}
- 
-- 
2.17.1


