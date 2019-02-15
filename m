Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DEF486C0F4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2019 03:03:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x1F33q3b009276
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Feb 2019 19:03:52 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.435.0; Thu, 14 Feb 2019 19:03:50 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Feb 2019 11:22:18 +0800
Message-ID: <a6508fac5fa1be0a38a1804b2932457673faf978.1550200881.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
In-Reply-To: <cover.1550200881.git.liezhi.yang@windriver.com>
References: <cover.1550200881.git.liezhi.yang@windriver.com>
Subject: [PATCH 1/4] cryptodev: 1.9 -> 1.10
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
X-List-Received-Date: Fri, 15 Feb 2019 03:03:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

* Remove backported patches:
  0001-Port-tests-to-openssl-1.1.patch
  0001-ioctl.c-Fix-build-with-linux-4.13.patch
  0001-ioctl.c-Fix-build-with-linux-4.17.patch
  0001-refactoring-split-big-function-to-simplify-maintaina.patch
  0002-refactoring-relocate-code-to-simplify-later-patches.patch
  0003-convert-to-new-AEAD-interface-in-kernels-v4.2.patch

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...ptodev-linux_1.9.bb => cryptodev-linux_1.10.bb} |   0
 ...odev-module_1.9.bb => cryptodev-module_1.10.bb} |   5 -
 ...ptodev-tests_1.9.bb => cryptodev-tests_1.10.bb} |   1 -
 meta/recipes-kernel/cryptodev/cryptodev.inc        |   2 +-
 .../files/0001-Port-tests-to-openssl-1.1.patch     | 103 ---------
 .../0001-ioctl.c-Fix-build-with-linux-4.13.patch   |  49 ----
 .../0001-ioctl.c-Fix-build-with-linux-4.17.patch   |  43 ----
 ...-split-big-function-to-simplify-maintaina.patch | 250 ---------------------
 ...g-relocate-code-to-simplify-later-patches.patch |  64 ------
 ...ert-to-new-AEAD-interface-in-kernels-v4.2.patch | 102 ---------
 10 files changed, 1 insertion(+), 618 deletions(-)
 rename meta/recipes-kernel/cryptodev/{cryptodev-linux_1.9.bb => cryptodev-linux_1.10.bb} (100%)
 rename meta/recipes-kernel/cryptodev/{cryptodev-module_1.9.bb => cryptodev-module_1.10.bb} (54%)
 rename meta/recipes-kernel/cryptodev/{cryptodev-tests_1.9.bb => cryptodev-tests_1.10.bb} (88%)
 delete mode 100644 meta/recipes-kernel/cryptodev/files/0001-Port-tests-to-openssl-1.1.patch
 delete mode 100644 meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-with-linux-4.13.patch
 delete mode 100644 meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-with-linux-4.17.patch
 delete mode 100644 meta/recipes-kernel/cryptodev/files/0001-refactoring-split-big-function-to-simplify-maintaina.patch
 delete mode 100644 meta/recipes-kernel/cryptodev/files/0002-refactoring-relocate-code-to-simplify-later-patches.patch
 delete mode 100644 meta/recipes-kernel/cryptodev/files/0003-convert-to-new-AEAD-interface-in-kernels-v4.2.patch

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-linux_1.9.bb b/meta/recipes-kernel/cryptodev/cryptodev-linux_1.10.bb
similarity index 100%
rename from meta/recipes-kernel/cryptodev/cryptodev-linux_1.9.bb
rename to meta/recipes-kernel/cryptodev/cryptodev-linux_1.10.bb
diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.9.bb b/meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb
similarity index 54%
rename from meta/recipes-kernel/cryptodev/cryptodev-module_1.9.bb
rename to meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb
index ed4327d..552eb6a 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-module_1.9.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb
@@ -9,11 +9,6 @@ DEPENDS += "cryptodev-linux"
 
 SRC_URI += " \
 file://0001-Disable-installing-header-file-provided-by-another-p.patch \
-file://0001-ioctl.c-Fix-build-with-linux-4.13.patch \
-file://0001-ioctl.c-Fix-build-with-linux-4.17.patch \
-file://0001-refactoring-split-big-function-to-simplify-maintaina.patch \
-file://0002-refactoring-relocate-code-to-simplify-later-patches.patch \
-file://0003-convert-to-new-AEAD-interface-in-kernels-v4.2.patch \
 "
 
 EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
diff --git a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.9.bb b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.10.bb
similarity index 88%
rename from meta/recipes-kernel/cryptodev/cryptodev-tests_1.9.bb
rename to meta/recipes-kernel/cryptodev/cryptodev-tests_1.10.bb
index 617db6c..9cb5dcb 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.9.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.10.bb
@@ -6,7 +6,6 @@ DEPENDS += "openssl"
 
 SRC_URI += " \
 file://0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch \
-file://0001-Port-tests-to-openssl-1.1.patch \
 "
 
 EXTRA_OEMAKE='KERNEL_DIR="${STAGING_EXECPREFIXDIR}" PREFIX="${D}"'
diff --git a/meta/recipes-kernel/cryptodev/cryptodev.inc b/meta/recipes-kernel/cryptodev/cryptodev.inc
index ab15bc1..252d39d 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev.inc
+++ b/meta/recipes-kernel/cryptodev/cryptodev.inc
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/cryptodev-linux/cryptodev-linux"
-SRCREV = "87d959d9a279c055b361de8e730fab6a7144edd7"
+SRCREV = "fd8b15ef1c8398a69a37932ee48c74ab40329a29"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-kernel/cryptodev/files/0001-Port-tests-to-openssl-1.1.patch b/meta/recipes-kernel/cryptodev/files/0001-Port-tests-to-openssl-1.1.patch
deleted file mode 100644
index c969126..0000000
--- a/meta/recipes-kernel/cryptodev/files/0001-Port-tests-to-openssl-1.1.patch
+++ /dev/null
@@ -1,103 +0,0 @@
-From 2fe4bdeb8cdd0b0f46d9caed807812855d51ea56 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Wed, 28 Mar 2018 20:11:05 +0300
-Subject: [PATCH] Port tests to openssl 1.1
-
-Upstream-Status: Accepted [https://github.com/cryptodev-linux/cryptodev-linux/pull/36]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- tests/openssl_wrapper.c | 33 +++++++++++++++++++++++++++++++++
- 1 file changed, 33 insertions(+)
-
-diff --git a/tests/openssl_wrapper.c b/tests/openssl_wrapper.c
-index 038c58f..dea2496 100644
---- a/tests/openssl_wrapper.c
-+++ b/tests/openssl_wrapper.c
-@@ -4,6 +4,7 @@
- #include <openssl/aes.h>
- #include <openssl/evp.h>
- #include <openssl/hmac.h>
-+#include <openssl/opensslv.h>
- 
- //#define DEBUG
- 
-@@ -23,10 +24,17 @@ enum ctx_type {
- 	ctx_type_md,
- };
- 
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+union openssl_ctx {
-+	HMAC_CTX *hmac;
-+	EVP_MD_CTX *md;
-+};
-+#else
- union openssl_ctx {
- 	HMAC_CTX hmac;
- 	EVP_MD_CTX md;
- };
-+#endif
- 
- struct ctx_mapping {
- 	__u32 ses;
-@@ -63,6 +71,16 @@ static void remove_mapping(__u32 ses)
- 	switch (mapping->type) {
- 	case ctx_type_none:
- 		break;
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+	case ctx_type_hmac:
-+		dbgp("%s: calling HMAC_CTX_free\n", __func__);
-+		HMAC_CTX_free(mapping->ctx.hmac);
-+		break;
-+	case ctx_type_md:
-+		dbgp("%s: calling EVP_MD_CTX_free\n", __func__);
-+		EVP_MD_CTX_free(mapping->ctx.md);
-+		break;
-+#else
- 	case ctx_type_hmac:
- 		dbgp("%s: calling HMAC_CTX_cleanup\n", __func__);
- 		HMAC_CTX_cleanup(&mapping->ctx.hmac);
-@@ -71,6 +89,7 @@ static void remove_mapping(__u32 ses)
- 		dbgp("%s: calling EVP_MD_CTX_cleanup\n", __func__);
- 		EVP_MD_CTX_cleanup(&mapping->ctx.md);
- 		break;
-+#endif
- 	}
- 	memset(mapping, 0, sizeof(*mapping));
- }
-@@ -127,10 +146,17 @@ static int openssl_hmac(struct session_op *sess, struct crypt_op *cop)
- 
- 		mapping->ses = sess->ses;
- 		mapping->type = ctx_type_hmac;
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+		ctx = mapping->ctx.hmac;
-+
-+		dbgp("calling HMAC_CTX_new");
-+		ctx = HMAC_CTX_new();
-+#else
- 		ctx = &mapping->ctx.hmac;
- 
- 		dbgp("calling HMAC_CTX_init");
- 		HMAC_CTX_init(ctx);
-+#endif
- 		dbgp("calling HMAC_Init_ex");
- 		if (!HMAC_Init_ex(ctx, sess->mackey, sess->mackeylen,
- 				sess_to_evp_md(sess), NULL)) {
-@@ -172,10 +198,17 @@ static int openssl_md(struct session_op *sess, struct crypt_op *cop)
- 
- 		mapping->ses = sess->ses;
- 		mapping->type = ctx_type_md;
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L
-+		ctx = mapping->ctx.md;
-+
-+		dbgp("calling EVP_MD_CTX_new");
-+		ctx = EVP_MD_CTX_new();
-+#else
- 		ctx = &mapping->ctx.md;
- 
- 		dbgp("calling EVP_MD_CTX_init");
- 		EVP_MD_CTX_init(ctx);
-+#endif
- 		dbgp("calling EVP_DigestInit");
- 		EVP_DigestInit(ctx, sess_to_evp_md(sess));
- 	}
diff --git a/meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-with-linux-4.13.patch b/meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-with-linux-4.13.patch
deleted file mode 100644
index a41efac..0000000
--- a/meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-with-linux-4.13.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From f0d69774afb27ffc62bf353465fba145e70cb85a Mon Sep 17 00:00:00 2001
-From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
-Date: Mon, 4 Sep 2017 11:05:08 +0200
-Subject: [PATCH] ioctl.c: Fix build with linux 4.13
-
-git/ioctl.c:1127:3: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
-   {0, },
-    ^
-note: (near initialization for 'verbosity_ctl_dir[1]')
-git/ioctl.c:1136:3: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
-   {0, },
-    ^
-
-Linux kernel has added -Werror=designated-init around 4.11 (c834f0e8a8b)
-triggering build errors with gcc 5 and 6 (but not with gcc 4)
-
-Upstream-Status: Backport
-
-Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
-Signed-off-by: Cristian Stoica <cristian.stoica@nxp.com>
----
- ioctl.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/ioctl.c b/ioctl.c
-index 0385203..8d4a162 100644
---- a/ioctl.c
-+++ b/ioctl.c
-@@ -1124,7 +1124,7 @@ static struct ctl_table verbosity_ctl_dir[] = {
- 		.mode           = 0644,
- 		.proc_handler   = proc_dointvec,
- 	},
--	{0, },
-+	{},
- };
- 
- static struct ctl_table verbosity_ctl_root[] = {
-@@ -1133,7 +1133,7 @@ static struct ctl_table verbosity_ctl_root[] = {
- 		.mode           = 0555,
- 		.child          = verbosity_ctl_dir,
- 	},
--	{0, },
-+	{},
- };
- static struct ctl_table_header *verbosity_sysctl_header;
- static int __init init_cryptodev(void)
--- 
-2.7.4
-
diff --git a/meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-with-linux-4.17.patch b/meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-with-linux-4.17.patch
deleted file mode 100644
index 5881d1c..0000000
--- a/meta/recipes-kernel/cryptodev/files/0001-ioctl.c-Fix-build-with-linux-4.17.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From f60aa08c63fc02780554a0a12180a478ca27d49f Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>
-Date: Wed, 23 May 2018 18:43:39 +0300
-Subject: [PATCH] ioctl.c: Fix build with linux 4.17
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Since kernel 4.17-rc1, sys_* syscalls can no longer be called directly:
-819671ff849b ("syscalls: define and explain goal to not call syscalls in the kernel")
-
-Since cryptodev uses sys_close() - and this has been removed in commit:
-2ca2a09d6215 ("fs: add ksys_close() wrapper; remove in-kernel calls to sys_close()")
-cryptodev has to be updated to use the ksys_close() wrapper.
-
-Signed-off-by: Horia Geantă <horia.geanta@nxp.com>
-
-Upstream-Status: Backport
-
-Signed-off-by: He Zhe <zhe.he@windriver.com>
----
- ioctl.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/ioctl.c b/ioctl.c
-index d831b0c..2571034 100644
---- a/ioctl.c
-+++ b/ioctl.c
-@@ -828,7 +828,11 @@ cryptodev_ioctl(struct file *filp, unsigned int cmd, unsigned long arg_)
- 		fd = clonefd(filp);
- 		ret = put_user(fd, p);
- 		if (unlikely(ret)) {
-+#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 17, 0))
- 			sys_close(fd);
-+#else
-+			ksys_close(fd);
-+#endif
- 			return ret;
- 		}
- 		return ret;
--- 
-2.7.4
-
diff --git a/meta/recipes-kernel/cryptodev/files/0001-refactoring-split-big-function-to-simplify-maintaina.patch b/meta/recipes-kernel/cryptodev/files/0001-refactoring-split-big-function-to-simplify-maintaina.patch
deleted file mode 100644
index f557b5d..0000000
--- a/meta/recipes-kernel/cryptodev/files/0001-refactoring-split-big-function-to-simplify-maintaina.patch
+++ /dev/null
@@ -1,250 +0,0 @@
-From 20dcf071bc3076ee7db9d603cfbe6a06e86c7d5f Mon Sep 17 00:00:00 2001
-From: Cristian Stoica <cristian.stoica@nxp.com>
-Date: Thu, 4 May 2017 15:06:20 +0300
-Subject: [PATCH 1/3] refactoring: split big function to simplify maintainance
-
-The setup of auth_buf in tls and aead is now duplicated but this
-is temporary and allows necessary corrections for the aead case
-with v4.2+ kernels.
-
-Signed-off-by: Cristian Stoica <cristian.stoica@nxp.com>
-
-Upstream-Status: Backport
-
-Commit ID: 20dcf071bc3076ee7db9d603c
-
-Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
----
- authenc.c | 197 ++++++++++++++++++++++++++++++++++++++++----------------------
- 1 file changed, 126 insertions(+), 71 deletions(-)
-
-diff --git a/authenc.c b/authenc.c
-index 1bd7377..28eb0f9 100644
---- a/authenc.c
-+++ b/authenc.c
-@@ -609,96 +609,151 @@ auth_n_crypt(struct csession *ses_ptr, struct kernel_crypt_auth_op *kcaop,
- 	return 0;
- }
- 
--/* This is the main crypto function - zero-copy edition */
--static int
--__crypto_auth_run_zc(struct csession *ses_ptr, struct kernel_crypt_auth_op *kcaop)
-+static int crypto_auth_zc_srtp(struct csession *ses_ptr, struct kernel_crypt_auth_op *kcaop)
- {
--	struct scatterlist *dst_sg, *auth_sg, *src_sg;
-+	struct scatterlist *dst_sg, *auth_sg;
- 	struct crypt_auth_op *caop = &kcaop->caop;
--	int ret = 0;
-+	int ret;
- 
--	if (caop->flags & COP_FLAG_AEAD_SRTP_TYPE) {
--		if (unlikely(ses_ptr->cdata.init != 0 &&
--		             (ses_ptr->cdata.stream == 0 ||
--			      ses_ptr->cdata.aead != 0))) {
--			derr(0, "Only stream modes are allowed in SRTP mode (but not AEAD)");
--			return -EINVAL;
--		}
-+	if (unlikely(ses_ptr->cdata.init != 0 &&
-+		(ses_ptr->cdata.stream == 0 || ses_ptr->cdata.aead != 0))) {
-+		derr(0, "Only stream modes are allowed in SRTP mode (but not AEAD)");
-+		return -EINVAL;
-+	}
- 
--		ret = get_userbuf_srtp(ses_ptr, kcaop, &auth_sg, &dst_sg);
--		if (unlikely(ret)) {
--			derr(1, "get_userbuf_srtp(): Error getting user pages.");
--			return ret;
--		}
-+	ret = get_userbuf_srtp(ses_ptr, kcaop, &auth_sg, &dst_sg);
-+	if (unlikely(ret)) {
-+		derr(1, "get_userbuf_srtp(): Error getting user pages.");
-+		return ret;
-+	}
- 
--		ret = srtp_auth_n_crypt(ses_ptr, kcaop, auth_sg, caop->auth_len,
--			   dst_sg, caop->len);
-+	ret = srtp_auth_n_crypt(ses_ptr, kcaop, auth_sg, caop->auth_len,
-+			dst_sg, caop->len);
- 
--		release_user_pages(ses_ptr);
--	} else { /* TLS and normal cases. Here auth data are usually small
--	          * so we just copy them to a free page, instead of trying
--	          * to map them.
--	          */
--		unsigned char *auth_buf = NULL;
--		struct scatterlist tmp;
-+	release_user_pages(ses_ptr);
- 
--		if (unlikely(caop->auth_len > PAGE_SIZE)) {
--			derr(1, "auth data len is excessive.");
--			return -EINVAL;
--		}
-+	return ret;
-+}
- 
--		auth_buf = (char *)__get_free_page(GFP_KERNEL);
--		if (unlikely(!auth_buf)) {
--			derr(1, "unable to get a free page.");
--			return -ENOMEM;
--		}
-+static int crypto_auth_zc_tls(struct csession *ses_ptr, struct kernel_crypt_auth_op *kcaop)
-+{
-+	struct crypt_auth_op *caop = &kcaop->caop;
-+	struct scatterlist *dst_sg, *auth_sg;
-+	unsigned char *auth_buf = NULL;
-+	struct scatterlist tmp;
-+	int ret;
- 
--		if (caop->auth_src && caop->auth_len > 0) {
--			if (unlikely(copy_from_user(auth_buf, caop->auth_src, caop->auth_len))) {
--				derr(1, "unable to copy auth data from userspace.");
--				ret = -EFAULT;
--				goto free_auth_buf;
--			}
-+	if (unlikely(ses_ptr->cdata.aead != 0)) {
-+		return -EINVAL;
-+	}
-+
-+	if (unlikely(caop->auth_len > PAGE_SIZE)) {
-+		derr(1, "auth data len is excessive.");
-+		return -EINVAL;
-+	}
-+
-+	auth_buf = (char *)__get_free_page(GFP_KERNEL);
-+	if (unlikely(!auth_buf)) {
-+		derr(1, "unable to get a free page.");
-+		return -ENOMEM;
-+	}
- 
--			sg_init_one(&tmp, auth_buf, caop->auth_len);
--			auth_sg = &tmp;
--		} else {
--			auth_sg = NULL;
-+	if (caop->auth_src && caop->auth_len > 0) {
-+		if (unlikely(copy_from_user(auth_buf, caop->auth_src, caop->auth_len))) {
-+			derr(1, "unable to copy auth data from userspace.");
-+			ret = -EFAULT;
-+			goto free_auth_buf;
- 		}
- 
--		if (caop->flags & COP_FLAG_AEAD_TLS_TYPE && ses_ptr->cdata.aead == 0) {
--			ret = get_userbuf_tls(ses_ptr, kcaop, &dst_sg);
--			if (unlikely(ret)) {
--				derr(1, "get_userbuf_tls(): Error getting user pages.");
--				goto free_auth_buf;
--			}
-+		sg_init_one(&tmp, auth_buf, caop->auth_len);
-+		auth_sg = &tmp;
-+	} else {
-+		auth_sg = NULL;
-+	}
- 
--			ret = tls_auth_n_crypt(ses_ptr, kcaop, auth_sg, caop->auth_len,
--				   dst_sg, caop->len);
--		} else {
--			if (unlikely(ses_ptr->cdata.init == 0 ||
--			             (ses_ptr->cdata.stream == 0 &&
--				      ses_ptr->cdata.aead == 0))) {
--				derr(0, "Only stream and AEAD ciphers are allowed for authenc");
--				ret = -EINVAL;
--				goto free_auth_buf;
--			}
-+	ret = get_userbuf_tls(ses_ptr, kcaop, &dst_sg);
-+	if (unlikely(ret)) {
-+		derr(1, "get_userbuf_tls(): Error getting user pages.");
-+		goto free_auth_buf;
-+	}
- 
--			ret = get_userbuf(ses_ptr, caop->src, caop->len, caop->dst, kcaop->dst_len,
--					  kcaop->task, kcaop->mm, &src_sg, &dst_sg);
--			if (unlikely(ret)) {
--				derr(1, "get_userbuf(): Error getting user pages.");
--				goto free_auth_buf;
--			}
-+	ret = tls_auth_n_crypt(ses_ptr, kcaop, auth_sg, caop->auth_len,
-+			dst_sg, caop->len);
-+	release_user_pages(ses_ptr);
-+
-+free_auth_buf:
-+	free_page((unsigned long)auth_buf);
-+	return ret;
-+}
-+
-+static int crypto_auth_zc_aead(struct csession *ses_ptr, struct kernel_crypt_auth_op *kcaop)
-+{
-+	struct scatterlist *dst_sg, *auth_sg, *src_sg;
-+	struct crypt_auth_op *caop = &kcaop->caop;
-+	unsigned char *auth_buf = NULL;
-+	struct scatterlist tmp;
-+	int ret;
- 
--			ret = auth_n_crypt(ses_ptr, kcaop, auth_sg, caop->auth_len,
--					   src_sg, dst_sg, caop->len);
-+	if (unlikely(ses_ptr->cdata.init == 0 ||
-+		(ses_ptr->cdata.stream == 0 && ses_ptr->cdata.aead == 0))) {
-+		derr(0, "Only stream and AEAD ciphers are allowed for authenc");
-+		return -EINVAL;
-+	}
-+
-+	if (unlikely(caop->auth_len > PAGE_SIZE)) {
-+		derr(1, "auth data len is excessive.");
-+		return -EINVAL;
-+	}
-+
-+	auth_buf = (char *)__get_free_page(GFP_KERNEL);
-+	if (unlikely(!auth_buf)) {
-+		derr(1, "unable to get a free page.");
-+		return -ENOMEM;
-+	}
-+
-+	if (caop->auth_src && caop->auth_len > 0) {
-+		if (unlikely(copy_from_user(auth_buf, caop->auth_src, caop->auth_len))) {
-+			derr(1, "unable to copy auth data from userspace.");
-+			ret = -EFAULT;
-+			goto free_auth_buf;
- 		}
- 
--		release_user_pages(ses_ptr);
-+		sg_init_one(&tmp, auth_buf, caop->auth_len);
-+		auth_sg = &tmp;
-+	} else {
-+		auth_sg = NULL;
-+	}
-+
-+	ret = get_userbuf(ses_ptr, caop->src, caop->len, caop->dst, kcaop->dst_len,
-+			kcaop->task, kcaop->mm, &src_sg, &dst_sg);
-+	if (unlikely(ret)) {
-+		derr(1, "get_userbuf(): Error getting user pages.");
-+		goto free_auth_buf;
-+	}
-+
-+	ret = auth_n_crypt(ses_ptr, kcaop, auth_sg, caop->auth_len,
-+			src_sg, dst_sg, caop->len);
-+
-+	release_user_pages(ses_ptr);
- 
- free_auth_buf:
--		free_page((unsigned long)auth_buf);
-+	free_page((unsigned long)auth_buf);
-+
-+	return ret;
-+}
-+
-+static int
-+__crypto_auth_run_zc(struct csession *ses_ptr, struct kernel_crypt_auth_op *kcaop)
-+{
-+	struct crypt_auth_op *caop = &kcaop->caop;
-+	int ret;
-+
-+	if (caop->flags & COP_FLAG_AEAD_SRTP_TYPE) {
-+		ret = crypto_auth_zc_srtp(ses_ptr, kcaop);
-+	} else if (caop->flags & COP_FLAG_AEAD_TLS_TYPE) {
-+		ret = crypto_auth_zc_tls(ses_ptr, kcaop);
-+	} else {
-+		ret = crypto_auth_zc_aead(ses_ptr, kcaop);
- 	}
- 
- 	return ret;
--- 
-2.11.0
-
diff --git a/meta/recipes-kernel/cryptodev/files/0002-refactoring-relocate-code-to-simplify-later-patches.patch b/meta/recipes-kernel/cryptodev/files/0002-refactoring-relocate-code-to-simplify-later-patches.patch
deleted file mode 100644
index 83d9005..0000000
--- a/meta/recipes-kernel/cryptodev/files/0002-refactoring-relocate-code-to-simplify-later-patches.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From c2bf0e42b1d9fda60cde4a3a682784d349ef1c0b Mon Sep 17 00:00:00 2001
-From: Cristian Stoica <cristian.stoica@nxp.com>
-Date: Thu, 4 May 2017 15:06:21 +0300
-Subject: [PATCH 2/3] refactoring: relocate code to simplify later patches
-
-This code move will simplify the conversion to new AEAD interface in
-next patches
-
-Signed-off-by: Cristian Stoica <cristian.stoica@nxp.com>
-
-Upstream-Status: Backport
-
-Commit ID: c2bf0e42b1d9fda
-
-Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
----
- authenc.c | 17 +++++++++--------
- 1 file changed, 9 insertions(+), 8 deletions(-)
-
-diff --git a/authenc.c b/authenc.c
-index 28eb0f9..95727b4 100644
---- a/authenc.c
-+++ b/authenc.c
-@@ -711,11 +711,18 @@ static int crypto_auth_zc_aead(struct csession *ses_ptr, struct kernel_crypt_aut
- 		return -ENOMEM;
- 	}
- 
-+	ret = get_userbuf(ses_ptr, caop->src, caop->len, caop->dst, kcaop->dst_len,
-+			kcaop->task, kcaop->mm, &src_sg, &dst_sg);
-+	if (unlikely(ret)) {
-+		derr(1, "get_userbuf(): Error getting user pages.");
-+		goto free_auth_buf;
-+	}
-+
- 	if (caop->auth_src && caop->auth_len > 0) {
- 		if (unlikely(copy_from_user(auth_buf, caop->auth_src, caop->auth_len))) {
- 			derr(1, "unable to copy auth data from userspace.");
- 			ret = -EFAULT;
--			goto free_auth_buf;
-+			goto free_pages;
- 		}
- 
- 		sg_init_one(&tmp, auth_buf, caop->auth_len);
-@@ -724,16 +731,10 @@ static int crypto_auth_zc_aead(struct csession *ses_ptr, struct kernel_crypt_aut
- 		auth_sg = NULL;
- 	}
- 
--	ret = get_userbuf(ses_ptr, caop->src, caop->len, caop->dst, kcaop->dst_len,
--			kcaop->task, kcaop->mm, &src_sg, &dst_sg);
--	if (unlikely(ret)) {
--		derr(1, "get_userbuf(): Error getting user pages.");
--		goto free_auth_buf;
--	}
--
- 	ret = auth_n_crypt(ses_ptr, kcaop, auth_sg, caop->auth_len,
- 			src_sg, dst_sg, caop->len);
- 
-+free_pages:
- 	release_user_pages(ses_ptr);
- 
- free_auth_buf:
--- 
-2.11.0
-
diff --git a/meta/recipes-kernel/cryptodev/files/0003-convert-to-new-AEAD-interface-in-kernels-v4.2.patch b/meta/recipes-kernel/cryptodev/files/0003-convert-to-new-AEAD-interface-in-kernels-v4.2.patch
deleted file mode 100644
index 8602307..0000000
--- a/meta/recipes-kernel/cryptodev/files/0003-convert-to-new-AEAD-interface-in-kernels-v4.2.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From a705360197260d28535746ae98c461ba2cfb7a9e Mon Sep 17 00:00:00 2001
-From: Cristian Stoica <cristian.stoica@nxp.com>
-Date: Thu, 4 May 2017 15:06:22 +0300
-Subject: [PATCH 3/3] convert to new AEAD interface in kernels v4.2+
-
-The crypto API for AEAD ciphers changed in recent kernels so that
-associated data is now part of both source and destination scatter
-gathers. The source, destination and associated data buffers need
-to be stiched accordingly for the operations to succeed:
-
-src_sg: auth_buf + src_buf
-dst_sg: auth_buf + (dst_buf + tag space)
-
-This patch fixes a kernel crash observed with cipher-gcm test.
-
-See also kernel patch: 81c4c35eb61a69c229871c490b011c1171511d5a
-    crypto: ccm - Convert to new AEAD interface
-
-Reported-by: Phil Sutter <phil@nwl.cc>
-Signed-off-by: Cristian Stoica <cristian.stoica@nxp.com>
-
-Upstream-Status: Backport
-
-Commit ID: a705360197260d2853574
-
-Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
----
- authenc.c | 40 ++++++++++++++++++++++++++++++++++++++--
- 1 file changed, 38 insertions(+), 2 deletions(-)
-
-diff --git a/authenc.c b/authenc.c
-index 95727b4..692951f 100644
---- a/authenc.c
-+++ b/authenc.c
-@@ -688,12 +688,20 @@ free_auth_buf:
- 
- static int crypto_auth_zc_aead(struct csession *ses_ptr, struct kernel_crypt_auth_op *kcaop)
- {
--	struct scatterlist *dst_sg, *auth_sg, *src_sg;
-+	struct scatterlist *dst_sg;
-+	struct scatterlist *src_sg;
- 	struct crypt_auth_op *caop = &kcaop->caop;
- 	unsigned char *auth_buf = NULL;
--	struct scatterlist tmp;
- 	int ret;
- 
-+#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 2, 0))
-+	struct scatterlist tmp;
-+	struct scatterlist *auth_sg;
-+#else
-+	struct scatterlist auth1[2];
-+	struct scatterlist auth2[2];
-+#endif
-+
- 	if (unlikely(ses_ptr->cdata.init == 0 ||
- 		(ses_ptr->cdata.stream == 0 && ses_ptr->cdata.aead == 0))) {
- 		derr(0, "Only stream and AEAD ciphers are allowed for authenc");
-@@ -718,6 +726,7 @@ static int crypto_auth_zc_aead(struct csession *ses_ptr, struct kernel_crypt_aut
- 		goto free_auth_buf;
- 	}
- 
-+#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 2, 0))
- 	if (caop->auth_src && caop->auth_len > 0) {
- 		if (unlikely(copy_from_user(auth_buf, caop->auth_src, caop->auth_len))) {
- 			derr(1, "unable to copy auth data from userspace.");
-@@ -733,6 +742,33 @@ static int crypto_auth_zc_aead(struct csession *ses_ptr, struct kernel_crypt_aut
- 
- 	ret = auth_n_crypt(ses_ptr, kcaop, auth_sg, caop->auth_len,
- 			src_sg, dst_sg, caop->len);
-+#else
-+	if (caop->auth_src && caop->auth_len > 0) {
-+		if (unlikely(copy_from_user(auth_buf, caop->auth_src, caop->auth_len))) {
-+			derr(1, "unable to copy auth data from userspace.");
-+			ret = -EFAULT;
-+			goto free_pages;
-+		}
-+
-+		sg_init_table(auth1, 2);
-+		sg_set_buf(auth1, auth_buf, caop->auth_len);
-+		sg_chain(auth1, 2, src_sg);
-+
-+		if (src_sg == dst_sg) {
-+			src_sg = auth1;
-+			dst_sg = auth1;
-+		} else {
-+			sg_init_table(auth2, 2);
-+			sg_set_buf(auth2, auth_buf, caop->auth_len);
-+			sg_chain(auth2, 2, dst_sg);
-+			src_sg = auth1;
-+			dst_sg = auth2;
-+		}
-+	}
-+
-+	ret = auth_n_crypt(ses_ptr, kcaop, NULL, caop->auth_len,
-+			src_sg, dst_sg, caop->len);
-+#endif
- 
- free_pages:
- 	release_user_pages(ses_ptr);
--- 
-2.11.0
-
-- 
2.7.4


