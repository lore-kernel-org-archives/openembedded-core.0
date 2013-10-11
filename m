Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 8835C6CF15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 15:27:27 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Oct 2013 08:27:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1081,1371106800"; d="scan'208";a="373506397"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.234])
	by azsmga001.ch.intel.com with ESMTP; 11 Oct 2013 08:27:29 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2013 08:27:07 -0700
Message-Id: <664cd9c705a03b0529f30e091b6e8b721ef13a09.1381505051.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1381505051.git.sgw@linux.intel.com>
References: <cover.1381505051.git.sgw@linux.intel.com>
Subject: [PATCH 01/18] kmod-native: use bswap to work on older Linux hosts
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
X-List-Received-Date: Fri, 11 Oct 2013 15:27:28 -0000

From: Ting Liu <b28495@freescale.com>

We can't use htobe* and be*toh functions because they are not
available on older versions of glibc, For example, shipped on Centos 5.5.

Change to directly calling bswap_* as defined in byteswap.h.

(From OE-Core rev: c7577e0205af641171cf4eab12e98e865c4d2338)

Signed-off-by: Ting Liu <b28495@freescale.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/kmod/kmod-native_git.bb        |  1 +
 ...alling-bswap_-instead-of-htobe-and-be-toh.patch | 39 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-kernel/kmod/kmod/Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch

diff --git a/meta/recipes-kernel/kmod/kmod-native_git.bb b/meta/recipes-kernel/kmod/kmod-native_git.bb
index f22efc0..d008cbf 100644
--- a/meta/recipes-kernel/kmod/kmod-native_git.bb
+++ b/meta/recipes-kernel/kmod/kmod-native_git.bb
@@ -6,6 +6,7 @@ inherit native
 
 SRC_URI += "file://fix-undefined-O_CLOEXEC.patch \
             file://0001-Fix-build-with-older-gcc-4.6.patch \
+            file://Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch \
            "
 
 do_install_append (){
diff --git a/meta/recipes-kernel/kmod/kmod/Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch b/meta/recipes-kernel/kmod/kmod/Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch
new file mode 100644
index 0000000..82b83b3
--- /dev/null
+++ b/meta/recipes-kernel/kmod/kmod/Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch
@@ -0,0 +1,39 @@
+From 0c4dbadc9db3cda1cfca64e44ea08c6e89919ea7 Mon Sep 17 00:00:00 2001
+From: Ting Liu <b28495@freescale.com>
+Date: Tue, 10 Sep 2013 13:44:18 +0800
+Subject: [PATCH] Change to calling bswap_* instead of htobe* and be*toh
+
+We can't use htobe* and be*toh functions because they are not
+available on older versions of glibc, For example, shipped on Centos 5.5.
+
+Change to directly calling bswap_* as defined in+byteswap.h.
+
+Signed-off-by: Ting Liu <b28495@freescale.com>
+---
+ libkmod/libkmod-signature.c |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/libkmod/libkmod-signature.c b/libkmod/libkmod-signature.c
+index 6b80caa..3544a36 100644
+--- a/libkmod/libkmod-signature.c
++++ b/libkmod/libkmod-signature.c
+@@ -19,6 +19,7 @@
+  */
+ 
+ #include <endian.h>
++#include <byteswap.h>
+ #include <stdint.h>
+ #include <stdlib.h>
+ #include <string.h>
+@@ -121,7 +122,7 @@ bool kmod_module_signature_info(const struct kmod_file *file, struct kmod_signat
+ 			modsig->hash >= PKEY_HASH__LAST ||
+ 			modsig->id_type >= PKEY_ID_TYPE__LAST)
+ 		return false;
+-	sig_len = be32toh(modsig->sig_len);
++	sig_len = bswap_32(modsig->sig_len);
+ 	if (size < (off_t)(modsig->signer_len + modsig->key_id_len + sig_len))
+ 		return false;
+ 
+-- 
+1.7.5.4
+
-- 
1.8.3.1


