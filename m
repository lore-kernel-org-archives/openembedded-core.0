Return-Path: <B28495@freescale.com>
Received: from co1outboundpool.messaging.microsoft.com
	(co1ehsobe002.messaging.microsoft.com [216.32.180.185])
	by mail.openembedded.org (Postfix) with ESMTP id 0A6986161F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 06:00:32 +0000 (UTC)
Received: from mail85-co1-R.bigfish.com (10.243.78.236) by
	CO1EHSOBE017.bigfish.com (10.243.66.80) with Microsoft SMTP Server id
	14.1.225.22; Tue, 10 Sep 2013 06:00:32 +0000
Received: from mail85-co1 (localhost [127.0.0.1])	by mail85-co1-R.bigfish.com
	(Postfix) with ESMTP id 6ECDF680165	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 06:00:32 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h208ch1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz1de098h1de097h8275bhz2dh2a8h839hd24he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1b2fh1fb3h1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1fe8h1ff5h1155h)
Received: from mail85-co1 (localhost.localdomain [127.0.0.1]) by mail85-co1
	(MessageSwitch) id 1378792830642351_18618;
	Tue, 10 Sep 2013 06:00:30 +0000 (UTC)
Received: from CO1EHSMHS024.bigfish.com (unknown [10.243.78.228])	by
	mail85-co1.bigfish.com (Postfix) with ESMTP id 8A1E56C0074	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 06:00:30 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS024.bigfish.com
	(10.243.66.34) with Microsoft SMTP Server (TLS) id 14.16.227.3;
	Tue, 10 Sep 2013 06:00:29 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.3.158.2; Tue, 10 Sep 2013 06:00:28 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r8A60Pox003645;	Mon, 9 Sep 2013 23:00:27 -0700
From: <b28495@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Sep 2013 14:00:20 +0800
Message-ID: <1378792820-2664-1-git-send-email-b28495@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
X-FOPE-CONNECTOR: Id%0$Dn%*$RO%0$TLS%0$FQDN%$TlsDn%
Subject: [PATCH] kmod-native: use bswap to work on older Linux hosts
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
X-List-Received-Date: Tue, 10 Sep 2013 06:00:33 -0000
Content-Type: text/plain

From: Ting Liu <b28495@freescale.com>

We can't use htobe* and be*toh functions because they are not
available on older versions of glibc, For example, shipped on Centos 5.5.

Change to directly calling bswap_* as defined in byteswap.h.

Signed-off-by: Ting Liu <b28495@freescale.com>
---
 meta/recipes-kernel/kmod/kmod-native_git.bb        |    1 +
 ...alling-bswap_-instead-of-htobe-and-be-toh.patch |   39 ++++++++++++++++++++
 2 files changed, 40 insertions(+), 0 deletions(-)
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
1.7.5.4



