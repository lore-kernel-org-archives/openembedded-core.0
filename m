Return-Path: <Zhe.He@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6E76971BF0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 07:51:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6P7p4CK023808
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2018 00:51:05 -0700 (PDT)
Received: from [128.224.162.216] (128.224.162.216) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Wed, 25 Jul 2018 00:51:03 -0700
To: Jiping Ma <jiping.ma2@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <1531103081-201215-1-git-send-email-jiping.ma2@windriver.com>
	<1531103081-201215-2-git-send-email-jiping.ma2@windriver.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <e517f1ba-e0dc-758d-b5ec-fb58b1e53768@windriver.com>
Date: Wed, 25 Jul 2018 15:50:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1531103081-201215-2-git-send-email-jiping.ma2@windriver.com>
X-Originating-IP: [128.224.162.216]
Subject: Re: [PATCH] cryptodev-linux: Fixes a kernel crash observed with cipher-gcm test.
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
X-List-Received-Date: Wed, 25 Jul 2018 07:51:04 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Seems this needs updating. The context of cryptiodev-module_1.9.bb has changed.

Thanks,
Zhe

On 2018年07月09日 10:24, Jiping Ma wrote:
> The crypto API for AEAD ciphers changed in recent kernels so that
> associated data is now part of both source and destination scatter
> gathers. The source, destination and associated data buffers need
> to be stiched accordingly for the operations to succeed.
>
> Signed-off-by: Jiping Ma <jiping.ma2@windriver.com>
> ---
>  .../cryptodev/cryptodev-module_1.9.bb              |   2 +
>  ...inux-split-big-function-to-simplify-maint.patch | 249 +++++++++++++++++++++
>  ...inux-Fixes-a-kernel-crash-observed-with-c.patch | 115 ++++++++++
>  3 files changed, 366 insertions(+)
>  create mode 100644 meta/recipes-kernel/cryptodev/files/0001-cryptodev-linux-split-big-function-to-simplify-maint.patch
>  create mode 100644 meta/recipes-kernel/cryptodev/files/0002-cryptodev-linux-Fixes-a-kernel-crash-observed-with-c.patch
>
> diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.9.bb b/meta/recipes-kernel/cryptodev/cryptodev-module_1.9.bb
> index 552eb6a..16ac527 100644
> --- a/meta/recipes-kernel/cryptodev/cryptodev-module_1.9.bb
> +++ b/meta/recipes-kernel/cryptodev/cryptodev-module_1.9.bb
> @@ -9,6 +9,8 @@ DEPENDS += "cryptodev-linux"
>  
>  SRC_URI += " \
>  file://0001-Disable-installing-header-file-provided-by-another-p.patch \
> +file://0001-cryptodev-linux-split-big-function-to-simplify-maint.patch \
> +file://0002-cryptodev-linux-Fixes-a-kernel-crash-observed-with-c.patch \
>  "
>  
>  EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
> diff --git a/meta/recipes-kernel/cryptodev/files/0001-cryptodev-linux-split-big-function-to-simplify-maint.patch b/meta/recipes-kernel/cryptodev/files/0001-cryptodev-linux-split-big-function-to-simplify-maint.patch
> new file mode 100644
> index 0000000..56a5bb7
> --- /dev/null
> +++ b/meta/recipes-kernel/cryptodev/files/0001-cryptodev-linux-split-big-function-to-simplify-maint.patch
> @@ -0,0 +1,249 @@
> +From 1b0b6cc97ba5cc71ae1385d125256fc1b2d606b0 Mon Sep 17 00:00:00 2001
> +From: Jiping Ma <jiping.ma2@windriver.com>
> +Date: Wed, 2 May 2018 04:59:32 +0000
> +Subject: [PATCH 1/2] cryptodev-linux: split big function to simplify
> + maintainance
> +
> +The setup of auth_buf in tls and aead is now duplicated but this
> +is temporary and allows necessary corrections for the aead case
> +with v4.2+ kernels.
> +
> +Upstream-Status: Backported
> +
> +commit 20dcf071bc3076ee7db9d603cfbe6a06e86c7d5f
> +
> +Signed-off-by: Jiping Ma <jiping.ma2@windriver.com>
> +---
> + authenc.c | 197 ++++++++++++++++++++++++++++++++++++++++----------------------
> + 1 file changed, 126 insertions(+), 71 deletions(-)
> +
> +diff --git a/authenc.c b/authenc.c
> +index 1bd7377..28eb0f9 100644
> +--- a/authenc.c
> ++++ b/authenc.c
> +@@ -609,96 +609,151 @@ auth_n_crypt(struct csession *ses_ptr, struct kernel_crypt_auth_op *kcaop,
> + 	return 0;
> + }
> + 
> +-/* This is the main crypto function - zero-copy edition */
> +-static int
> +-__crypto_auth_run_zc(struct csession *ses_ptr, struct kernel_crypt_auth_op *kcaop)
> ++static int crypto_auth_zc_srtp(struct csession *ses_ptr, struct kernel_crypt_auth_op *kcaop)
> + {
> +-	struct scatterlist *dst_sg, *auth_sg, *src_sg;
> ++	struct scatterlist *dst_sg, *auth_sg;
> + 	struct crypt_auth_op *caop = &kcaop->caop;
> +-	int ret = 0;
> ++	int ret;
> + 
> +-	if (caop->flags & COP_FLAG_AEAD_SRTP_TYPE) {
> +-		if (unlikely(ses_ptr->cdata.init != 0 &&
> +-		             (ses_ptr->cdata.stream == 0 ||
> +-			      ses_ptr->cdata.aead != 0))) {
> +-			derr(0, "Only stream modes are allowed in SRTP mode (but not AEAD)");
> +-			return -EINVAL;
> +-		}
> ++	if (unlikely(ses_ptr->cdata.init != 0 &&
> ++		(ses_ptr->cdata.stream == 0 || ses_ptr->cdata.aead != 0))) {
> ++		derr(0, "Only stream modes are allowed in SRTP mode (but not AEAD)");
> ++		return -EINVAL;
> ++	}
> + 
> +-		ret = get_userbuf_srtp(ses_ptr, kcaop, &auth_sg, &dst_sg);
> +-		if (unlikely(ret)) {
> +-			derr(1, "get_userbuf_srtp(): Error getting user pages.");
> +-			return ret;
> +-		}
> ++	ret = get_userbuf_srtp(ses_ptr, kcaop, &auth_sg, &dst_sg);
> ++	if (unlikely(ret)) {
> ++		derr(1, "get_userbuf_srtp(): Error getting user pages.");
> ++		return ret;
> ++	}
> + 
> +-		ret = srtp_auth_n_crypt(ses_ptr, kcaop, auth_sg, caop->auth_len,
> +-			   dst_sg, caop->len);
> ++	ret = srtp_auth_n_crypt(ses_ptr, kcaop, auth_sg, caop->auth_len,
> ++			dst_sg, caop->len);
> + 
> +-		release_user_pages(ses_ptr);
> +-	} else { /* TLS and normal cases. Here auth data are usually small
> +-	          * so we just copy them to a free page, instead of trying
> +-	          * to map them.
> +-	          */
> +-		unsigned char *auth_buf = NULL;
> +-		struct scatterlist tmp;
> ++	release_user_pages(ses_ptr);
> + 
> +-		if (unlikely(caop->auth_len > PAGE_SIZE)) {
> +-			derr(1, "auth data len is excessive.");
> +-			return -EINVAL;
> +-		}
> ++	return ret;
> ++}
> + 
> +-		auth_buf = (char *)__get_free_page(GFP_KERNEL);
> +-		if (unlikely(!auth_buf)) {
> +-			derr(1, "unable to get a free page.");
> +-			return -ENOMEM;
> +-		}
> ++static int crypto_auth_zc_tls(struct csession *ses_ptr, struct kernel_crypt_auth_op *kcaop)
> ++{
> ++	struct crypt_auth_op *caop = &kcaop->caop;
> ++	struct scatterlist *dst_sg, *auth_sg;
> ++	unsigned char *auth_buf = NULL;
> ++	struct scatterlist tmp;
> ++	int ret;
> + 
> +-		if (caop->auth_src && caop->auth_len > 0) {
> +-			if (unlikely(copy_from_user(auth_buf, caop->auth_src, caop->auth_len))) {
> +-				derr(1, "unable to copy auth data from userspace.");
> +-				ret = -EFAULT;
> +-				goto free_auth_buf;
> +-			}
> ++	if (unlikely(ses_ptr->cdata.aead != 0)) {
> ++		return -EINVAL;
> ++	}
> ++
> ++	if (unlikely(caop->auth_len > PAGE_SIZE)) {
> ++		derr(1, "auth data len is excessive.");
> ++		return -EINVAL;
> ++	}
> ++
> ++	auth_buf = (char *)__get_free_page(GFP_KERNEL);
> ++	if (unlikely(!auth_buf)) {
> ++		derr(1, "unable to get a free page.");
> ++		return -ENOMEM;
> ++	}
> + 
> +-			sg_init_one(&tmp, auth_buf, caop->auth_len);
> +-			auth_sg = &tmp;
> +-		} else {
> +-			auth_sg = NULL;
> ++	if (caop->auth_src && caop->auth_len > 0) {
> ++		if (unlikely(copy_from_user(auth_buf, caop->auth_src, caop->auth_len))) {
> ++			derr(1, "unable to copy auth data from userspace.");
> ++			ret = -EFAULT;
> ++			goto free_auth_buf;
> + 		}
> + 
> +-		if (caop->flags & COP_FLAG_AEAD_TLS_TYPE && ses_ptr->cdata.aead == 0) {
> +-			ret = get_userbuf_tls(ses_ptr, kcaop, &dst_sg);
> +-			if (unlikely(ret)) {
> +-				derr(1, "get_userbuf_tls(): Error getting user pages.");
> +-				goto free_auth_buf;
> +-			}
> ++		sg_init_one(&tmp, auth_buf, caop->auth_len);
> ++		auth_sg = &tmp;
> ++	} else {
> ++		auth_sg = NULL;
> ++	}
> + 
> +-			ret = tls_auth_n_crypt(ses_ptr, kcaop, auth_sg, caop->auth_len,
> +-				   dst_sg, caop->len);
> +-		} else {
> +-			if (unlikely(ses_ptr->cdata.init == 0 ||
> +-			             (ses_ptr->cdata.stream == 0 &&
> +-				      ses_ptr->cdata.aead == 0))) {
> +-				derr(0, "Only stream and AEAD ciphers are allowed for authenc");
> +-				ret = -EINVAL;
> +-				goto free_auth_buf;
> +-			}
> ++	ret = get_userbuf_tls(ses_ptr, kcaop, &dst_sg);
> ++	if (unlikely(ret)) {
> ++		derr(1, "get_userbuf_tls(): Error getting user pages.");
> ++		goto free_auth_buf;
> ++	}
> + 
> +-			ret = get_userbuf(ses_ptr, caop->src, caop->len, caop->dst, kcaop->dst_len,
> +-					  kcaop->task, kcaop->mm, &src_sg, &dst_sg);
> +-			if (unlikely(ret)) {
> +-				derr(1, "get_userbuf(): Error getting user pages.");
> +-				goto free_auth_buf;
> +-			}
> ++	ret = tls_auth_n_crypt(ses_ptr, kcaop, auth_sg, caop->auth_len,
> ++			dst_sg, caop->len);
> ++	release_user_pages(ses_ptr);
> ++
> ++free_auth_buf:
> ++	free_page((unsigned long)auth_buf);
> ++	return ret;
> ++}
> ++
> ++static int crypto_auth_zc_aead(struct csession *ses_ptr, struct kernel_crypt_auth_op *kcaop)
> ++{
> ++	struct scatterlist *dst_sg, *auth_sg, *src_sg;
> ++	struct crypt_auth_op *caop = &kcaop->caop;
> ++	unsigned char *auth_buf = NULL;
> ++	struct scatterlist tmp;
> ++	int ret;
> + 
> +-			ret = auth_n_crypt(ses_ptr, kcaop, auth_sg, caop->auth_len,
> +-					   src_sg, dst_sg, caop->len);
> ++	if (unlikely(ses_ptr->cdata.init == 0 ||
> ++		(ses_ptr->cdata.stream == 0 && ses_ptr->cdata.aead == 0))) {
> ++		derr(0, "Only stream and AEAD ciphers are allowed for authenc");
> ++		return -EINVAL;
> ++	}
> ++
> ++	if (unlikely(caop->auth_len > PAGE_SIZE)) {
> ++		derr(1, "auth data len is excessive.");
> ++		return -EINVAL;
> ++	}
> ++
> ++	auth_buf = (char *)__get_free_page(GFP_KERNEL);
> ++	if (unlikely(!auth_buf)) {
> ++		derr(1, "unable to get a free page.");
> ++		return -ENOMEM;
> ++	}
> ++
> ++	if (caop->auth_src && caop->auth_len > 0) {
> ++		if (unlikely(copy_from_user(auth_buf, caop->auth_src, caop->auth_len))) {
> ++			derr(1, "unable to copy auth data from userspace.");
> ++			ret = -EFAULT;
> ++			goto free_auth_buf;
> + 		}
> + 
> +-		release_user_pages(ses_ptr);
> ++		sg_init_one(&tmp, auth_buf, caop->auth_len);
> ++		auth_sg = &tmp;
> ++	} else {
> ++		auth_sg = NULL;
> ++	}
> ++
> ++	ret = get_userbuf(ses_ptr, caop->src, caop->len, caop->dst, kcaop->dst_len,
> ++			kcaop->task, kcaop->mm, &src_sg, &dst_sg);
> ++	if (unlikely(ret)) {
> ++		derr(1, "get_userbuf(): Error getting user pages.");
> ++		goto free_auth_buf;
> ++	}
> ++
> ++	ret = auth_n_crypt(ses_ptr, kcaop, auth_sg, caop->auth_len,
> ++			src_sg, dst_sg, caop->len);
> ++
> ++	release_user_pages(ses_ptr);
> + 
> + free_auth_buf:
> +-		free_page((unsigned long)auth_buf);
> ++	free_page((unsigned long)auth_buf);
> ++
> ++	return ret;
> ++}
> ++
> ++static int
> ++__crypto_auth_run_zc(struct csession *ses_ptr, struct kernel_crypt_auth_op *kcaop)
> ++{
> ++	struct crypt_auth_op *caop = &kcaop->caop;
> ++	int ret;
> ++
> ++	if (caop->flags & COP_FLAG_AEAD_SRTP_TYPE) {
> ++		ret = crypto_auth_zc_srtp(ses_ptr, kcaop);
> ++	} else if (caop->flags & COP_FLAG_AEAD_TLS_TYPE) {
> ++		ret = crypto_auth_zc_tls(ses_ptr, kcaop);
> ++	} else {
> ++		ret = crypto_auth_zc_aead(ses_ptr, kcaop);
> + 	}
> + 
> + 	return ret;
> +-- 
> +1.9.1
> +
> diff --git a/meta/recipes-kernel/cryptodev/files/0002-cryptodev-linux-Fixes-a-kernel-crash-observed-with-c.patch b/meta/recipes-kernel/cryptodev/files/0002-cryptodev-linux-Fixes-a-kernel-crash-observed-with-c.patch
> new file mode 100644
> index 0000000..cd7b592
> --- /dev/null
> +++ b/meta/recipes-kernel/cryptodev/files/0002-cryptodev-linux-Fixes-a-kernel-crash-observed-with-c.patch
> @@ -0,0 +1,115 @@
> +From d2f765e13fb193ac03679e60fe06832d400d7717 Mon Sep 17 00:00:00 2001
> +From: Jiping Ma <jiping.ma2@windriver.com>
> +Date: Wed, 2 May 2018 05:10:58 +0000
> +Subject: [PATCH 2/2] cryptodev-linux: Fixes a kernel crash observed with
> + cipher-gcm test.
> +
> +The crypto API for AEAD ciphers changed in recent kernels so that
> +associated data is now part of both source and destination scatter
> +gathers. The source, destination and associated data buffers need
> +to be stiched accordingly for the operations to succeed.
> +
> +Upstream-Status: Backported
> +
> +commit a705360197260d28535746ae98c461ba2cfb7a9e
> +
> +Signed-off-by: Jiping Ma <jiping.ma2@windriver.com>
> +---
> + authenc.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++---------
> + 1 file changed, 46 insertions(+), 9 deletions(-)
> +
> +diff --git a/authenc.c b/authenc.c
> +index 28eb0f9..692951f 100644
> +--- a/authenc.c
> ++++ b/authenc.c
> +@@ -688,12 +688,20 @@ free_auth_buf:
> + 
> + static int crypto_auth_zc_aead(struct csession *ses_ptr, struct kernel_crypt_auth_op *kcaop)
> + {
> +-	struct scatterlist *dst_sg, *auth_sg, *src_sg;
> ++	struct scatterlist *dst_sg;
> ++	struct scatterlist *src_sg;
> + 	struct crypt_auth_op *caop = &kcaop->caop;
> + 	unsigned char *auth_buf = NULL;
> +-	struct scatterlist tmp;
> + 	int ret;
> + 
> ++#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 2, 0))
> ++	struct scatterlist tmp;
> ++	struct scatterlist *auth_sg;
> ++#else
> ++	struct scatterlist auth1[2];
> ++	struct scatterlist auth2[2];
> ++#endif
> ++
> + 	if (unlikely(ses_ptr->cdata.init == 0 ||
> + 		(ses_ptr->cdata.stream == 0 && ses_ptr->cdata.aead == 0))) {
> + 		derr(0, "Only stream and AEAD ciphers are allowed for authenc");
> +@@ -711,11 +719,19 @@ static int crypto_auth_zc_aead(struct csession *ses_ptr, struct kernel_crypt_aut
> + 		return -ENOMEM;
> + 	}
> + 
> ++	ret = get_userbuf(ses_ptr, caop->src, caop->len, caop->dst, kcaop->dst_len,
> ++			kcaop->task, kcaop->mm, &src_sg, &dst_sg);
> ++	if (unlikely(ret)) {
> ++		derr(1, "get_userbuf(): Error getting user pages.");
> ++		goto free_auth_buf;
> ++	}
> ++
> ++#if (LINUX_VERSION_CODE < KERNEL_VERSION(4, 2, 0))
> + 	if (caop->auth_src && caop->auth_len > 0) {
> + 		if (unlikely(copy_from_user(auth_buf, caop->auth_src, caop->auth_len))) {
> + 			derr(1, "unable to copy auth data from userspace.");
> + 			ret = -EFAULT;
> +-			goto free_auth_buf;
> ++			goto free_pages;
> + 		}
> + 
> + 		sg_init_one(&tmp, auth_buf, caop->auth_len);
> +@@ -724,16 +740,37 @@ static int crypto_auth_zc_aead(struct csession *ses_ptr, struct kernel_crypt_aut
> + 		auth_sg = NULL;
> + 	}
> + 
> +-	ret = get_userbuf(ses_ptr, caop->src, caop->len, caop->dst, kcaop->dst_len,
> +-			kcaop->task, kcaop->mm, &src_sg, &dst_sg);
> +-	if (unlikely(ret)) {
> +-		derr(1, "get_userbuf(): Error getting user pages.");
> +-		goto free_auth_buf;
> ++	ret = auth_n_crypt(ses_ptr, kcaop, auth_sg, caop->auth_len,
> ++			src_sg, dst_sg, caop->len);
> ++#else
> ++	if (caop->auth_src && caop->auth_len > 0) {
> ++		if (unlikely(copy_from_user(auth_buf, caop->auth_src, caop->auth_len))) {
> ++			derr(1, "unable to copy auth data from userspace.");
> ++			ret = -EFAULT;
> ++			goto free_pages;
> ++		}
> ++
> ++		sg_init_table(auth1, 2);
> ++		sg_set_buf(auth1, auth_buf, caop->auth_len);
> ++		sg_chain(auth1, 2, src_sg);
> ++
> ++		if (src_sg == dst_sg) {
> ++			src_sg = auth1;
> ++			dst_sg = auth1;
> ++		} else {
> ++			sg_init_table(auth2, 2);
> ++			sg_set_buf(auth2, auth_buf, caop->auth_len);
> ++			sg_chain(auth2, 2, dst_sg);
> ++			src_sg = auth1;
> ++			dst_sg = auth2;
> ++		}
> + 	}
> + 
> +-	ret = auth_n_crypt(ses_ptr, kcaop, auth_sg, caop->auth_len,
> ++	ret = auth_n_crypt(ses_ptr, kcaop, NULL, caop->auth_len,
> + 			src_sg, dst_sg, caop->len);
> ++#endif
> + 
> ++free_pages:
> + 	release_user_pages(ses_ptr);
> + 
> + free_auth_buf:
> +-- 
> +1.9.1
> +


