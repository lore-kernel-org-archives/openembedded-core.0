Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 184B56010D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 13:00:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7VD0OUA025197 for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 14:00:24 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VcZ3PQpbsLar
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 14:00:24 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7VD0MDf025192
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Aug 2016 14:00:24 +0100
Message-ID: <1472648422.29583.82.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 31 Aug 2016 14:00:22 +0100
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: cryptodev: Add backported patches for 4.6+ kernels
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
X-List-Received-Date: Wed, 31 Aug 2016 13:00:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This allows 4.6 onward kernels to build, backported from upstream
master.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
index ade7ef9..160ab30 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -3,7 +3,9 @@ HOMEPAGE = "http://cryptodev-linux.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRC_URI = "http://download.gna.org/cryptodev-linux/cryptodev-linux-${PV}.tar.gz"
+SRC_URI = "http://download.gna.org/cryptodev-linux/cryptodev-linux-${PV}.tar.gz \
+           file://06d6b560c6e45dc317dae47c74706fa43f4a31d8.patch \
+           file://cb186f682679383e8b5806240927903730ce85d9.patch"
 
 SRC_URI[md5sum] = "02644cc4cd02301e0b503a332eb2f0b5"
 SRC_URI[sha256sum] = "67fabde9fb67b286a96c4f45b594b0eccd0f761b495705c18f2ae9461b831376"
diff --git a/meta/recipes-kernel/cryptodev/files/06d6b560c6e45dc317dae47c74706fa43f4a31d8.patch b/meta/recipes-kernel/cryptodev/files/06d6b560c6e45dc317dae47c74706fa43f4a31d8.patch
new file mode 100644
index 0000000..cb556e1
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/files/06d6b560c6e45dc317dae47c74706fa43f4a31d8.patch
@@ -0,0 +1,54 @@
+From f14b4706b0d04988e7e5bc8c4d2aefef9f029d9d Mon Sep 17 00:00:00 2001
+From: Michael Weiser <michael.weiser@gmx.de>
+Date: Fri, 5 Aug 2016 18:43:55 +0200
+Subject: [PATCH] Adjust to recent user page API changes
+
+4.6.0 basically renamed get_user_pages() to get_user_pages_remote() and
+introduced a new get_user_pages() that always works on the current
+task.[1] Distinguish the two APIs based on kernel version we're
+compiling for.
+
+Also, there seems to have been a massive cleansing of
+page_cache_release(page) in favour of put_page(page)[2] which was an
+alias for put_page(page)[3] since 2.6.0. Before that beginning with
+2.4.0 both page_cache_release(page) and put_page(page) have been aliases
+for __free_page(page). So using put_page() instead of
+page_cache_release(page) will produce identical code for anything after
+2.4.0.
+
+[1] https://lkml.org/lkml/2016/2/10/555
+[2] https://www.spinics.net/lists/linux-fsdevel/msg95923.html
+[3] https://www.spinics.net/lists/linux-fsdevel/msg95922.html
+---
+ zc.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+Upstream-Status: Backport [from master for 4.8 kernels]
+
+Index: cryptodev-linux-1.8/zc.c
+===================================================================
+--- cryptodev-linux-1.8.orig/zc.c
++++ cryptodev-linux-1.8/zc.c
+@@ -59,7 +59,12 @@ int __get_userbuf(uint8_t __user *addr,
+ 	}
+ 
+ 	down_read(&mm->mmap_sem);
+-	ret = get_user_pages(task, mm,
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 6, 0))
++	ret = get_user_pages_remote(
++#else
++	ret = get_user_pages(
++#endif
++			task, mm,
+ 			(unsigned long)addr, pgcount, write, 0, pg, NULL);
+ 	up_read(&mm->mmap_sem);
+ 	if (ret != pgcount)
+@@ -119,7 +124,7 @@ void release_user_pages(struct csession
+ 		else
+ 			ses->readonly_pages--;
+ 
+-		page_cache_release(ses->pages[i]);
++		put_page(ses->pages[i]);
+ 	}
+ 	ses->used_pages = 0;
+ }
diff --git a/meta/recipes-kernel/cryptodev/files/cb186f682679383e8b5806240927903730ce85d9.patch b/meta/recipes-kernel/cryptodev/files/cb186f682679383e8b5806240927903730ce85d9.patch
new file mode 100644
index 0000000..eb0eab6
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/files/cb186f682679383e8b5806240927903730ce85d9.patch
@@ -0,0 +1,279 @@
+From cb186f682679383e8b5806240927903730ce85d9 Mon Sep 17 00:00:00 2001
+From: Michael Weiser <michael.weiser@gmx.de>
+Date: Fri, 5 Aug 2016 17:26:27 +0200
+Subject: [PATCH] Support skcipher in addition to ablkcipher API
+
+The ablkcipher API is being phased out[1]. The unified skcipher API
+seems to have made its entry with 4.3.[3, 4] By what can be seen from
+migration patches[1.ff.], it's a drop-in replacement.
+
+Also, deallocators such as crypto_free_skcipher() are NULL-safe now[2].
+
+Add a new header cipherapi.h to aid migration from ablkcipher to skcipher and
+retain support for old kernels. Make it decide which API to use and provide
+appropriate function calls and type definitions. Since the ablkcipher and
+skcipher APIs are so similar, those are mainly defines for corresponding
+pseudo-functions in namespace cryptodev_ derived directly from their API
+counterparts.
+
+Compiles and works (i.e. checks pass) with Debian testing 4.6.4 kernel
+as well as 4.8-rc2+ Linus git tree as of today. (Both require a fix for
+changed page access API[5].)
+
+[1] https://www.spinics.net/lists/linux-crypto/msg18133.html
+[2] https://www.spinics.net/lists/linux-crypto/msg18154.html, line 120
+[3] https://www.spinics.net/lists/linux-crypto/msg16373.html
+[4] https://www.spinics.net/lists/linux-crypto/msg16294.html
+[5] https://github.com/cryptodev-linux/cryptodev-linux/pull/14
+---
+ cipherapi.h | 60 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ cryptlib.c  | 40 ++++++++++++++++++----------------------
+ cryptlib.h  |  6 ++++--
+ ioctl.c     |  4 ++--
+ 4 files changed, 84 insertions(+), 26 deletions(-)
+ create mode 100644 cipherapi.h
+
+Upstream-Status: Backport [from master for 4.8 kernels]
+
+Index: cryptodev-linux-1.8/cipherapi.h
+===================================================================
+--- /dev/null
++++ cryptodev-linux-1.8/cipherapi.h
+@@ -0,0 +1,60 @@
++#ifndef CIPHERAPI_H
++# define CIPHERAPI_H
++
++#include <linux/version.h>
++
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 8, 0))
++# include <linux/crypto.h>
++
++typedef struct ablkcipher_alg cryptodev_blkcipher_alg_t;
++typedef struct crypto_ablkcipher cryptodev_crypto_blkcipher_t;
++typedef struct ablkcipher_request cryptodev_blkcipher_request_t;
++
++# define cryptodev_crypto_alloc_blkcipher crypto_alloc_ablkcipher
++# define cryptodev_crypto_blkcipher_alg crypto_ablkcipher_alg
++# define cryptodev_crypto_blkcipher_blocksize crypto_ablkcipher_blocksize
++# define cryptodev_crypto_blkcipher_ivsize crypto_ablkcipher_ivsize
++# define cryptodev_crypto_blkcipher_alignmask crypto_ablkcipher_alignmask
++# define cryptodev_crypto_blkcipher_setkey crypto_ablkcipher_setkey
++
++static inline void cryptodev_crypto_free_blkcipher(cryptodev_crypto_blkcipher_t *c) {
++	if (c)
++		crypto_free_ablkcipher(c);
++}
++
++# define cryptodev_blkcipher_request_alloc ablkcipher_request_alloc
++# define cryptodev_blkcipher_request_set_callback ablkcipher_request_set_callback
++
++static inline void cryptodev_blkcipher_request_free(cryptodev_blkcipher_request_t *r) {
++	if (r)
++		ablkcipher_request_free(r);
++}
++
++# define cryptodev_blkcipher_request_set_crypt ablkcipher_request_set_crypt
++# define cryptodev_crypto_blkcipher_encrypt crypto_ablkcipher_encrypt
++# define cryptodev_crypto_blkcipher_decrypt crypto_ablkcipher_decrypt
++# define cryptodev_crypto_blkcipher_tfm crypto_ablkcipher_tfm
++#else
++#include <crypto/skcipher.h>
++
++typedef struct skcipher_alg cryptodev_blkcipher_alg_t;
++typedef struct crypto_skcipher cryptodev_crypto_blkcipher_t;
++typedef struct skcipher_request cryptodev_blkcipher_request_t;
++
++# define cryptodev_crypto_alloc_blkcipher crypto_alloc_skcipher
++# define cryptodev_crypto_blkcipher_alg crypto_skcipher_alg
++# define cryptodev_crypto_blkcipher_blocksize crypto_skcipher_blocksize
++# define cryptodev_crypto_blkcipher_ivsize crypto_skcipher_ivsize
++# define cryptodev_crypto_blkcipher_alignmask crypto_skcipher_alignmask
++# define cryptodev_crypto_blkcipher_setkey crypto_skcipher_setkey
++# define cryptodev_crypto_free_blkcipher crypto_free_skcipher
++# define cryptodev_blkcipher_request_alloc skcipher_request_alloc
++# define cryptodev_blkcipher_request_set_callback skcipher_request_set_callback
++# define cryptodev_blkcipher_request_free skcipher_request_free
++# define cryptodev_blkcipher_request_set_crypt skcipher_request_set_crypt
++# define cryptodev_crypto_blkcipher_encrypt crypto_skcipher_encrypt
++# define cryptodev_crypto_blkcipher_decrypt crypto_skcipher_decrypt
++# define cryptodev_crypto_blkcipher_tfm crypto_skcipher_tfm
++#endif
++
++#endif
+Index: cryptodev-linux-1.8/cryptlib.c
+===================================================================
+--- cryptodev-linux-1.8.orig/cryptlib.c
++++ cryptodev-linux-1.8/cryptlib.c
+@@ -23,7 +23,6 @@
+  * 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
+  */
+ 
+-#include <linux/crypto.h>
+ #include <linux/mm.h>
+ #include <linux/highmem.h>
+ #include <linux/ioctl.h>
+@@ -37,6 +36,7 @@
+ #include <linux/rtnetlink.h>
+ #include <crypto/authenc.h>
+ #include "cryptodev_int.h"
++#include "cipherapi.h"
+ 
+ 
+ struct cryptodev_result {
+@@ -133,15 +133,15 @@ int cryptodev_cipher_init(struct cipher_
+ 	int ret;
+ 
+ 	if (aead == 0) {
+-		struct ablkcipher_alg *alg;
++		cryptodev_blkcipher_alg_t *alg;
+ 
+-		out->async.s = crypto_alloc_ablkcipher(alg_name, 0, 0);
++		out->async.s = cryptodev_crypto_alloc_blkcipher(alg_name, 0, 0);
+ 		if (unlikely(IS_ERR(out->async.s))) {
+ 			ddebug(1, "Failed to load cipher %s", alg_name);
+ 				return -EINVAL;
+ 		}
+ 
+-		alg = crypto_ablkcipher_alg(out->async.s);
++		alg = cryptodev_crypto_blkcipher_alg(out->async.s);
+ 		if (alg != NULL) {
+ 			/* Was correct key length supplied? */
+ 			if (alg->max_keysize > 0 &&
+@@ -154,11 +154,11 @@ int cryptodev_cipher_init(struct cipher_
+ 			}
+ 		}
+ 
+-		out->blocksize = crypto_ablkcipher_blocksize(out->async.s);
+-		out->ivsize = crypto_ablkcipher_ivsize(out->async.s);
+-		out->alignmask = crypto_ablkcipher_alignmask(out->async.s);
++		out->blocksize = cryptodev_crypto_blkcipher_blocksize(out->async.s);
++		out->ivsize = cryptodev_crypto_blkcipher_ivsize(out->async.s);
++		out->alignmask = cryptodev_crypto_blkcipher_alignmask(out->async.s);
+ 
+-		ret = crypto_ablkcipher_setkey(out->async.s, keyp, keylen);
++		ret = cryptodev_crypto_blkcipher_setkey(out->async.s, keyp, keylen);
+ 	} else {
+ 		out->async.as = crypto_alloc_aead(alg_name, 0, 0);
+ 		if (unlikely(IS_ERR(out->async.as))) {
+@@ -191,14 +191,14 @@ int cryptodev_cipher_init(struct cipher_
+ 	init_completion(&out->async.result->completion);
+ 
+ 	if (aead == 0) {
+-		out->async.request = ablkcipher_request_alloc(out->async.s, GFP_KERNEL);
++		out->async.request = cryptodev_blkcipher_request_alloc(out->async.s, GFP_KERNEL);
+ 		if (unlikely(!out->async.request)) {
+ 			derr(1, "error allocating async crypto request");
+ 			ret = -ENOMEM;
+ 			goto error;
+ 		}
+ 
+-		ablkcipher_request_set_callback(out->async.request,
++		cryptodev_blkcipher_request_set_callback(out->async.request,
+ 					CRYPTO_TFM_REQ_MAY_BACKLOG,
+ 					cryptodev_complete, out->async.result);
+ 	} else {
+@@ -218,10 +218,8 @@ int cryptodev_cipher_init(struct cipher_
+ 	return 0;
+ error:
+ 	if (aead == 0) {
+-		if (out->async.request)
+-			ablkcipher_request_free(out->async.request);
+-		if (out->async.s)
+-			crypto_free_ablkcipher(out->async.s);
++		cryptodev_blkcipher_request_free(out->async.request);
++		cryptodev_crypto_free_blkcipher(out->async.s);
+ 	} else {
+ 		if (out->async.arequest)
+ 			aead_request_free(out->async.arequest);
+@@ -237,10 +235,8 @@ void cryptodev_cipher_deinit(struct ciph
+ {
+ 	if (cdata->init) {
+ 		if (cdata->aead == 0) {
+-			if (cdata->async.request)
+-				ablkcipher_request_free(cdata->async.request);
+-			if (cdata->async.s)
+-				crypto_free_ablkcipher(cdata->async.s);
++			cryptodev_blkcipher_request_free(cdata->async.request);
++			cryptodev_crypto_free_blkcipher(cdata->async.s);
+ 		} else {
+ 			if (cdata->async.arequest)
+ 				aead_request_free(cdata->async.arequest);
+@@ -289,10 +285,10 @@ ssize_t cryptodev_cipher_encrypt(struct
+ 	reinit_completion(&cdata->async.result->completion);
+ 
+ 	if (cdata->aead == 0) {
+-		ablkcipher_request_set_crypt(cdata->async.request,
++		cryptodev_blkcipher_request_set_crypt(cdata->async.request,
+ 			(struct scatterlist *)src, dst,
+ 			len, cdata->async.iv);
+-		ret = crypto_ablkcipher_encrypt(cdata->async.request);
++		ret = cryptodev_crypto_blkcipher_encrypt(cdata->async.request);
+ 	} else {
+ 		aead_request_set_crypt(cdata->async.arequest,
+ 			(struct scatterlist *)src, dst,
+@@ -311,10 +307,10 @@ ssize_t cryptodev_cipher_decrypt(struct
+ 
+ 	reinit_completion(&cdata->async.result->completion);
+ 	if (cdata->aead == 0) {
+-		ablkcipher_request_set_crypt(cdata->async.request,
++		cryptodev_blkcipher_request_set_crypt(cdata->async.request,
+ 			(struct scatterlist *)src, dst,
+ 			len, cdata->async.iv);
+-		ret = crypto_ablkcipher_decrypt(cdata->async.request);
++		ret = cryptodev_crypto_blkcipher_decrypt(cdata->async.request);
+ 	} else {
+ 		aead_request_set_crypt(cdata->async.arequest,
+ 			(struct scatterlist *)src, dst,
+Index: cryptodev-linux-1.8/cryptlib.h
+===================================================================
+--- cryptodev-linux-1.8.orig/cryptlib.h
++++ cryptodev-linux-1.8/cryptlib.h
+@@ -3,6 +3,8 @@
+ 
+ #include <linux/version.h>
+ 
++#include "cipherapi.h"
++
+ struct cipher_data {
+ 	int init; /* 0 uninitialized */
+ 	int blocksize;
+@@ -12,8 +14,8 @@ struct cipher_data {
+ 	int alignmask;
+ 	struct {
+ 		/* block ciphers */
+-		struct crypto_ablkcipher *s;
+-		struct ablkcipher_request *request;
++		cryptodev_crypto_blkcipher_t *s;
++		cryptodev_blkcipher_request_t *request;
+ 
+ 		/* AEAD ciphers */
+ 		struct crypto_aead *as;
+Index: cryptodev-linux-1.8/ioctl.c
+===================================================================
+--- cryptodev-linux-1.8.orig/ioctl.c
++++ cryptodev-linux-1.8/ioctl.c
+@@ -34,7 +34,6 @@
+  */
+ 
+ #include <crypto/hash.h>
+-#include <linux/crypto.h>
+ #include <linux/mm.h>
+ #include <linux/highmem.h>
+ #include <linux/ioctl.h>
+@@ -53,6 +52,7 @@
+ #include "cryptodev_int.h"
+ #include "zc.h"
+ #include "version.h"
++#include "cipherapi.h"
+ 
+ MODULE_AUTHOR("Nikos Mavrogiannopoulos <nmav@gnutls.org>");
+ MODULE_DESCRIPTION("CryptoDev driver");
+@@ -765,7 +765,7 @@ static int get_session_info(struct fcryp
+ 
+ 	if (ses_ptr->cdata.init) {
+ 		if (ses_ptr->cdata.aead == 0)
+-			tfm = crypto_ablkcipher_tfm(ses_ptr->cdata.async.s);
++			tfm = cryptodev_crypto_blkcipher_tfm(ses_ptr->cdata.async.s);
+ 		else
+ 			tfm = crypto_aead_tfm(ses_ptr->cdata.async.as);
+ 		tfm_info_to_alg_info(&siop->cipher_info, tfm);



