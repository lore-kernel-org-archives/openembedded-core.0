Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 88558750F5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 08:37:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w7M8bDJI030363
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 01:37:13 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 22 Aug 2018 01:37:12 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Aug 2018 01:37:12 -0700
Message-ID: <20180822083712.46032-1-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] cryptodev-linux: Fixes a kernel crash observed with cipher-gcm test
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
X-List-Received-Date: Wed, 22 Aug 2018 08:37:12 -0000
Content-Type: text/plain

The crypto API for AEAD ciphers changed in recent kernels, so that
associated data is now part of both source and destination scatter
gathers. The source, destination and associated data buffers need
to be stiched accordingly for the operations to succeed.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 .../cryptodev/cryptodev-module_1.9.bb              |   3 +
 ...-split-big-function-to-simplify-maintaina.patch | 250 +++++++++++++++++++++
 ...g-relocate-code-to-simplify-later-patches.patch |  64 ++++++
 ...ert-to-new-AEAD-interface-in-kernels-v4.2.patch | 102 +++++++++
 4 files changed, 419 insertions(+)
 create mode 100644 meta/recipes-kernel/cryptodev/files/0001-refactoring-split-big-function-to-simplify-maintaina.patch
 create mode 100644 meta/recipes-kernel/cryptodev/files/0002-refactoring-relocate-code-to-simplify-later-patches.patch
 create mode 100644 meta/recipes-kernel/cryptodev/files/0003-convert-to-new-AEAD-interface-in-kernels-v4.2.patch

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.9.bb b/meta/recipes-kernel/cryptodev/cryptodev-module_1.9.bb
index 6052650c95..ed4327d40d 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-module_1.9.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-module_1.9.bb
@@ -11,6 +11,9 @@ SRC_URI += " \
 file://0001-Disable-installing-header-file-provided-by-another-p.patch \
 file://0001-ioctl.c-Fix-build-with-linux-4.13.patch \
 file://0001-ioctl.c-Fix-build-with-linux-4.17.patch \
+file://0001-refactoring-split-big-function-to-simplify-maintaina.patch \
+file://0002-refactoring-relocate-code-to-simplify-later-patches.patch \
+file://0003-convert-to-new-AEAD-interface-in-kernels-v4.2.patch \
 "
 
 EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
diff --git a/meta/recipes-kernel/cryptodev/files/0001-refactoring-split-big-function-to-simplify-maintaina.patch b/meta/recipes-kernel/cryptodev/files/0001-refactoring-split-big-function-to-simplify-maintaina.patch
new file mode 100644
index 0000000000..ed5b7e44b3
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/files/0001-refactoring-split-big-function-to-simplify-maintaina.patch
@@ -0,0 +1,250 @@
+From 20dcf071bc3076ee7db9d603cfbe6a06e86c7d5f Mon Sep 17 00:00:00 2001
+From: Cristian Stoica <cristian.stoica@nxp.com>
+Date: Thu, 4 May 2017 15:06:20 +0300
+Subject: [PATCH 1/3] refactoring: split big function to simplify maintainance
+
+The setup of auth_buf in tls and aead is now duplicated but this
+is temporary and allows necessary corrections for the aead case
+with v4.2+ kernels.
+
+Signed-off-by: Cristian Stoica <cristian.stoica@nxp.com>
+
+Upstream-Status: Backported
+
+Commit ID: 20dcf071bc3076ee7db9d603c
+
+Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
+---
+ authenc.c | 197 ++++++++++++++++++++++++++++++++++++++++----------------------
+ 1 file changed, 126 insertions(+), 71 deletions(-)
+
+diff --git a/authenc.c b/authenc.c
+index 1bd7377..28eb0f9 100644
+--- a/authenc.c
++++ b/authenc.c
+@@ -609,96 +609,151 @@ auth_n_crypt(struct csession *ses_ptr, struct kernel_crypt_auth_op *kcaop,
+ 	return 0;
+ }
+ 
+-/* This is the main crypto function - zero-copy edition */
+-static int
+-__crypto_auth_run_zc(struct csession *ses_ptr, struct kernel_crypt_auth_op *kcaop)
++static int crypto_auth_zc_srtp(struct csession *ses_ptr, struct kernel_crypt_auth_op *kcaop)
+ {
+-	struct scatterlist *dst_sg, *auth_sg, *src_sg;
++	struct scatterlist *dst_sg, *auth_sg;
+ 	struct crypt_auth_op *caop = &kcaop->caop;
+-	int ret = 0;
++	int ret;
+ 
+-	if (caop->flags & COP_FLAG_AEAD_SRTP_TYPE) {
+-		if (unlikely(ses_ptr->cdata.init != 0 &&
+-		             (ses_ptr->cdata.stream == 0 ||
+-			      ses_ptr->cdata.aead != 0))) {
+-			derr(0, "Only stream modes are allowed in SRTP mode (but not AEAD)");
+-			return -EINVAL;
+-		}
++	if (unlikely(ses_ptr->cdata.init != 0 &&
++		(ses_ptr->cdata.stream == 0 || ses_ptr->cdata.aead != 0))) {
++		derr(0, "Only stream modes are allowed in SRTP mode (but not AEAD)");
++		return -EINVAL;
++	}
+ 
+-		ret = get_userbuf_srtp(ses_ptr, kcaop, &auth_sg, &dst_sg);
+-		if (unlikely(ret)) {
+-			derr(1, "get_userbuf_srtp(): Error getting user pages.");
+-			return ret;
+-		}
++	ret = get_userbuf_srtp(ses_ptr, kcaop, &auth_sg, &dst_sg);
++	if (unlikely(ret)) {
++		derr(1, "get_userbuf_srtp(): Error getting user pages.");
++		return ret;
++	}
+ 
+-		ret = srtp_auth_n_crypt(ses_ptr, kcaop, auth_sg, caop->auth_len,
+-			   dst_sg, caop->len);
++	ret = srtp_auth_n_crypt(ses_ptr, kcaop, auth_sg, caop->auth_len,
++			dst_sg, caop->len);
+ 
+-		release_user_pages(ses_ptr);
+-	} else { /* TLS and normal cases. Here auth data are usually small
+-	          * so we just copy them to a free page, instead of trying
+-	          * to map them.
+-	          */
+-		unsigned char *auth_buf = NULL;
+-		struct scatterlist tmp;
++	release_user_pages(ses_ptr);
+ 
+-		if (unlikely(caop->auth_len > PAGE_SIZE)) {
+-			derr(1, "auth data len is excessive.");
+-			return -EINVAL;
+-		}
++	return ret;
++}
+ 
+-		auth_buf = (char *)__get_free_page(GFP_KERNEL);
+-		if (unlikely(!auth_buf)) {
+-			derr(1, "unable to get a free page.");
+-			return -ENOMEM;
+-		}
++static int crypto_auth_zc_tls(struct csession *ses_ptr, struct kernel_crypt_auth_op *kcaop)
++{
++	struct crypt_auth_op *caop = &kcaop->caop;
++	struct scatterlist *dst_sg, *auth_sg;
++	unsigned char *auth_buf = NULL;
++	struct scatterlist tmp;
++	int ret;
+ 
+-		if (caop->auth_src && caop->auth_len > 0) {
+-			if (unlikely(copy_from_user(auth_buf, caop->auth_src, caop->auth_len))) {
+-				derr(1, "unable to copy auth data from userspace.");
+-				ret = -EFAULT;
+-				goto free_auth_buf;
+-			}
++	if (unlikely(ses_ptr->cdata.aead != 0)) {
++		return -EINVAL;
++	}
++
++	if (unlikely(caop->auth_len > PAGE_SIZE)) {
++		derr(1, "auth data len is excessive.");
++		return -EINVAL;
++	}
++
++	auth_buf = (char *)__get_free_page(GFP_KERNEL);
++	if (unlikely(!auth_buf)) {
++		derr(1, "unable to get a free page.");
++		return -ENOMEM;
++	}
+ 
+-			sg_init_one(&tmp, auth_buf, caop->auth_len);
+-			auth_sg = &tmp;
+-		} else {
+-			auth_sg = NULL;
++	if (caop->auth_src && caop->auth_len > 0) {
++		if (unlikely(copy_from_user(auth_buf, caop->auth_src, caop->auth_len))) {
++			derr(1, "unable to copy auth data from userspace.");
++			ret = -EFAULT;
++			goto free_auth_buf;
+ 		}
+ 
+-		if (caop->flags & COP_FLAG_AEAD_TLS_TYPE && ses_ptr->cdata.aead == 0) {
+-			ret = get_userbuf_tls(ses_ptr, kcaop, &dst_sg);
+-			if (unlikely(ret)) {
+-				derr(1, "get_userbuf_tls(): Error getting user pages.");
+-				goto free_auth_buf;
+-			}
++		sg_init_one(&tmp, auth_buf, caop->auth_len);
++		auth_sg = &tmp;
++	} else {
++		auth_sg = NULL;
++	}
+ 
+-			ret = tls_auth_n_crypt(ses_ptr, kcaop, auth_sg, caop->auth_len,
+-				   dst_sg, caop->len);
+-		} else {
+-			if (unlikely(ses_ptr->cdata.init == 0 ||
+-			             (ses_ptr->cdata.stream == 0 &&
+-				      ses_ptr->cdata.aead == 0))) {
+-				derr(0, "Only stream and AEAD ciphers are allowed for authenc");
+-				ret = -EINVAL;
+-				goto free_auth_buf;
+-			}
++	ret = get_userbuf_tls(ses_ptr, kcaop, &dst_sg);
++	if (unlikely(ret)) {
++		derr(1, "get_userbuf_tls(): Error getting user pages.");
++		goto free_auth_buf;
++	}
+ 
+-			ret = get_userbuf(ses_ptr, caop->src, caop->len, caop->dst, kcaop->dst_len,
+-					  kcaop->task, kcaop->mm, &src_sg, &dst_sg);
+-			if (unlikely(ret)) {
+-				derr(1, "get_userbuf(): Error getting user pages.");
+-				goto free_auth_buf;
+-			}
++	ret = tls_auth_n_crypt(ses_ptr, kcaop, auth_sg, caop->auth_len,
++			dst_sg, caop->len);
++	release_user_pages(ses_ptr);
++
++free_auth_buf:
++	free_page((unsigned long)auth_buf);
++	return ret;
++}
++
++static int crypto_auth_zc_aead(struct csession *ses_ptr, struct kernel_crypt_auth_op *kcaop)
++{
++	struct scatterlist *dst_sg, *auth_sg, *src_sg;
++	struct crypt_auth_op *caop = &kcaop->caop;
++	unsigned char *auth_buf = NULL;
++	struct scatterlist tmp;
++	int ret;
+ 
+-			ret = auth_n_crypt(ses_ptr, kcaop, auth_sg, caop->auth_len,
+-					   src_sg, dst_sg, caop->len);
++	if (unlikely(ses_ptr->cdata.init == 0 ||
++		(ses_ptr->cdata.stream == 0 && ses_ptr->cdata.aead == 0))) {
++		derr(0, "Only stream and AEAD ciphers are allowed for authenc");
++		return -EINVAL;
++	}
++
++	if (unlikely(caop->auth_len > PAGE_SIZE)) {
++		derr(1, "auth data len is excessive.");
++		return -EINVAL;
++	}
++
++	auth_buf = (char *)__get_free_page(GFP_KERNEL);
++	if (unlikely(!auth_buf)) {
++		derr(1, "unable to get a free page.");
++		return -ENOMEM;
++	}
++
++	if (caop->auth_src && caop->auth_len > 0) {
++		if (unlikely(copy_from_user(auth_buf, caop->auth_src, caop->auth_len))) {
++			derr(1, "unable to copy auth data from userspace.");
++			ret = -EFAULT;
++			goto free_auth_buf;
+ 		}
+ 
+-		release_user_pages(ses_ptr);
++		sg_init_one(&tmp, auth_buf, caop->auth_len);
++		auth_sg = &tmp;
++	} else {
++		auth_sg = NULL;
++	}
++
++	ret = get_userbuf(ses_ptr, caop->src, caop->len, caop->dst, kcaop->dst_len,
++			kcaop->task, kcaop->mm, &src_sg, &dst_sg);
++	if (unlikely(ret)) {
++		derr(1, "get_userbuf(): Error getting user pages.");
++		goto free_auth_buf;
++	}
++
++	ret = auth_n_crypt(ses_ptr, kcaop, auth_sg, caop->auth_len,
++			src_sg, dst_sg, caop->len);
++
++	release_user_pages(ses_ptr);
+ 
+ free_auth_buf:
+-		free_page((unsigned long)auth_buf);
++	free_page((unsigned long)auth_buf);
++
++	return ret;
++}
++
++static int
++__crypto_auth_run_zc(struct csession *ses_ptr, struct kernel_crypt_auth_op *kcaop)
++{
++	struct crypt_auth_op *caop = &kcaop->caop;
++	int ret;
++
++	if (caop->flags & COP_FLAG_AEAD_SRTP_TYPE) {
++		ret = crypto_auth_zc_srtp(ses_ptr, kcaop);
++	} else if (caop->flags & COP_FLAG_AEAD_TLS_TYPE) {
++		ret = crypto_auth_zc_tls(ses_ptr, kcaop);
++	} else {
++		ret = crypto_auth_zc_aead(ses_ptr, kcaop);
+ 	}
+ 
+ 	return ret;
+-- 
+2.11.0
+
diff --git a/meta/recipes-kernel/cryptodev/files/0002-refactoring-relocate-code-to-simplify-later-patches.patch b/meta/recipes-kernel/cryptodev/files/0002-refactoring-relocate-code-to-simplify-later-patches.patch
new file mode 100644
index 0000000000..ceb4f83554
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/files/0002-refactoring-relocate-code-to-simplify-later-patches.patch
@@ -0,0 +1,64 @@
+From c2bf0e42b1d9fda60cde4a3a682784d349ef1c0b Mon Sep 17 00:00:00 2001
+From: Cristian Stoica <cristian.stoica@nxp.com>
+Date: Thu, 4 May 2017 15:06:21 +0300
+Subject: [PATCH 2/3] refactoring: relocate code to simplify later patches
+
+This code move will simplify the conversion to new AEAD interface in
+next patches
+
+Signed-off-by: Cristian Stoica <cristian.stoica@nxp.com>
+
+Upstream-Status: Backported
+
+Commit ID: c2bf0e42b1d9fda
+
+Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
+---
+ authenc.c | 17 +++++++++--------
+ 1 file changed, 9 insertions(+), 8 deletions(-)
+
+diff --git a/authenc.c b/authenc.c
+index 28eb0f9..95727b4 100644
+--- a/authenc.c
++++ b/authenc.c
+@@ -711,11 +711,18 @@ static int crypto_auth_zc_aead(struct csession *ses_ptr, struct kernel_crypt_aut
+ 		return -ENOMEM;
+ 	}
+ 
++	ret = get_userbuf(ses_ptr, caop->src, caop->len, caop->dst, kcaop->dst_len,
++			kcaop->task, kcaop->mm, &src_sg, &dst_sg);
++	if (unlikely(ret)) {
++		derr(1, "get_userbuf(): Error getting user pages.");
++		goto free_auth_buf;
++	}
++
+ 	if (caop->auth_src && caop->auth_len > 0) {
+ 		if (unlikely(copy_from_user(auth_buf, caop->auth_src, caop->auth_len))) {
+ 			derr(1, "unable to copy auth data from userspace.");
+ 			ret = -EFAULT;
+-			goto free_auth_buf;
++			goto free_pages;
+ 		}
+ 
+ 		sg_init_one(&tmp, auth_buf, caop->auth_len);
+@@ -724,16 +731,10 @@ static int crypto_auth_zc_aead(struct csession *ses_ptr, struct kernel_crypt_aut
+ 		auth_sg = NULL;
+ 	}
+ 
+-	ret = get_userbuf(ses_ptr, caop->src, caop->len, caop->dst, kcaop->dst_len,
+-			kcaop->task, kcaop->mm, &src_sg, &dst_sg);
+-	if (unlikely(ret)) {
+-		derr(1, "get_userbuf(): Error getting user pages.");
+-		goto free_auth_buf;
+-	}
+-
+ 	ret = auth_n_crypt(ses_ptr, kcaop, auth_sg, caop->auth_len,
+ 			src_sg, dst_sg, caop->len);
+ 
++free_pages:
+ 	release_user_pages(ses_ptr);
+ 
+ free_auth_buf:
+-- 
+2.11.0
+
diff --git a/meta/recipes-kernel/cryptodev/files/0003-convert-to-new-AEAD-interface-in-kernels-v4.2.patch b/meta/recipes-kernel/cryptodev/files/0003-convert-to-new-AEAD-interface-in-kernels-v4.2.patch
new file mode 100644
index 0000000000..f494e011fc
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/files/0003-convert-to-new-AEAD-interface-in-kernels-v4.2.patch
@@ -0,0 +1,102 @@
+From a705360197260d28535746ae98c461ba2cfb7a9e Mon Sep 17 00:00:00 2001
+From: Cristian Stoica <cristian.stoica@nxp.com>
+Date: Thu, 4 May 2017 15:06:22 +0300
+Subject: [PATCH 3/3] convert to new AEAD interface in kernels v4.2+
+
+The crypto API for AEAD ciphers changed in recent kernels so that
+associated data is now part of both source and destination scatter
+gathers. The source, destination and associated data buffers need
+to be stiched accordingly for the operations to succeed:
+
+src_sg: auth_buf + src_buf
+dst_sg: auth_buf + (dst_buf + tag space)
+
+This patch fixes a kernel crash observed with cipher-gcm test.
+
+See also kernel patch: 81c4c35eb61a69c229871c490b011c1171511d5a
+    crypto: ccm - Convert to new AEAD interface
+
+Reported-by: Phil Sutter <phil@nwl.cc>
+Signed-off-by: Cristian Stoica <cristian.stoica@nxp.com>
+
+Upstream-Status: Backported
+
+Commit ID: a705360197260d2853574
+
+Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
+---
+ authenc.c | 40 ++++++++++++++++++++++++++++++++++++++--
+ 1 file changed, 38 insertions(+), 2 deletions(-)
+
+diff --git a/authenc.c b/authenc.c
+index 95727b4..692951f 100644
+--- a/authenc.c
++++ b/authenc.c
+@@ -688,12 +688,20 @@ free_auth_buf:
+ 
+ static int crypto_auth_zc_aead(struct csession *ses_ptr, struct kernel_crypt_auth_op *kcaop)
+ {
+-	struct scatterlist *dst_sg, *auth_sg, *src_sg;
++	struct scatterlist *dst_sg;
++	struct scatterlist *src_sg;
+ 	struct crypt_auth_op *caop = &kcaop->caop;
+ 	unsigned char *auth_buf = NULL;
+-	struct scatterlist tmp;
+ 	int ret;
+ 
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 2, 0))
++	struct scatterlist tmp;
++	struct scatterlist *auth_sg;
++#else
++	struct scatterlist auth1[2];
++	struct scatterlist auth2[2];
++#endif
++
+ 	if (unlikely(ses_ptr->cdata.init == 0 ||
+ 		(ses_ptr->cdata.stream == 0 && ses_ptr->cdata.aead == 0))) {
+ 		derr(0, "Only stream and AEAD ciphers are allowed for authenc");
+@@ -718,6 +726,7 @@ static int crypto_auth_zc_aead(struct csession *ses_ptr, struct kernel_crypt_aut
+ 		goto free_auth_buf;
+ 	}
+ 
++#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 2, 0))
+ 	if (caop->auth_src && caop->auth_len > 0) {
+ 		if (unlikely(copy_from_user(auth_buf, caop->auth_src, caop->auth_len))) {
+ 			derr(1, "unable to copy auth data from userspace.");
+@@ -733,6 +742,33 @@ static int crypto_auth_zc_aead(struct csession *ses_ptr, struct kernel_crypt_aut
+ 
+ 	ret = auth_n_crypt(ses_ptr, kcaop, auth_sg, caop->auth_len,
+ 			src_sg, dst_sg, caop->len);
++#else
++	if (caop->auth_src && caop->auth_len > 0) {
++		if (unlikely(copy_from_user(auth_buf, caop->auth_src, caop->auth_len))) {
++			derr(1, "unable to copy auth data from userspace.");
++			ret = -EFAULT;
++			goto free_pages;
++		}
++
++		sg_init_table(auth1, 2);
++		sg_set_buf(auth1, auth_buf, caop->auth_len);
++		sg_chain(auth1, 2, src_sg);
++
++		if (src_sg == dst_sg) {
++			src_sg = auth1;
++			dst_sg = auth1;
++		} else {
++			sg_init_table(auth2, 2);
++			sg_set_buf(auth2, auth_buf, caop->auth_len);
++			sg_chain(auth2, 2, dst_sg);
++			src_sg = auth1;
++			dst_sg = auth2;
++		}
++	}
++
++	ret = auth_n_crypt(ses_ptr, kcaop, NULL, caop->auth_len,
++			src_sg, dst_sg, caop->len);
++#endif
+ 
+ free_pages:
+ 	release_user_pages(ses_ptr);
+-- 
+2.11.0
+
-- 
2.11.0


