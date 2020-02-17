Return-Path: <Zhe.He@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8171160C92
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 03:02:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 01H32FlF015795
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 19:02:45 -0800
Received: from [128.224.162.175] (128.224.162.175) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Sun, 16 Feb 2020 19:02:05 -0800
From: He Zhe <zhe.he@windriver.com>
To: <openembedded-core@lists.openembedded.org>
References: <20200210131128.28390-1-zhe.he@windriver.com>
Message-ID: <736eaf22-3981-44d9-84f5-ee6f6d162c3e@windriver.com>
Date: Mon, 17 Feb 2020 11:02:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200210131128.28390-1-zhe.he@windriver.com>
X-Originating-IP: [128.224.162.175]
Subject: Re: [PATCH] cryptodev-module: Fix build failure with kernel v5.5
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
X-List-Received-Date: Mon, 17 Feb 2020 03:02:55 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Ping.

Zhe

On 2/10/20 9:11 PM, zhe.he@windriver.com wrote:
> From: He Zhe <zhe.he@windriver.com>
>
> Backport from upstream to fix the following build failure.
>
> cryptlib.c:162:37: error: 'crypto_ablkcipher_type' undeclared
> (first use in this function); did you mean 'crypto_skcipher_tfm'?
> 162 |   if ((tfm->__crt_alg->cra_type == &crypto_ablkcipher_type)
>     |                                     ^~~~~~~~~~~~~~~~~~~~~~
>     |                                     crypto_skcipher_tfm
> cryptlib.c:169:25: error: 'struct crypto_alg' has no member named
> 'cra_ablkcipher'
> 169 |    alg = &tfm->__crt_alg->cra_ablkcipher;
>     |                         ^~
> cryptlib.c:170:21: error: dereferencing pointer to incomplete type
> 'struct ablkcipher_alg'
> 170 |    min_keysize = alg->min_keysize;
>     |                     ^~
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  .../cryptodev/cryptodev-module_1.10.bb        |  1 +
>  ...-cryptlib.c-fix-build-on-kernel-v5.5.patch | 49 +++++++++++++++++++
>  2 files changed, 50 insertions(+)
>  create mode 100644 meta/recipes-kernel/cryptodev/files/0001-cryptlib.c-fix-build-on-kernel-v5.5.patch
>
> diff --git a/meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb b/meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb
> index 552eb6abaa..89b52d8d95 100644
> --- a/meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb
> +++ b/meta/recipes-kernel/cryptodev/cryptodev-module_1.10.bb
> @@ -9,6 +9,7 @@ DEPENDS += "cryptodev-linux"
>  
>  SRC_URI += " \
>  file://0001-Disable-installing-header-file-provided-by-another-p.patch \
> +file://0001-cryptlib.c-fix-build-on-kernel-v5.5.patch \
>  "
>  
>  EXTRA_OEMAKE='KERNEL_DIR="${STAGING_KERNEL_DIR}" PREFIX="${D}"'
> diff --git a/meta/recipes-kernel/cryptodev/files/0001-cryptlib.c-fix-build-on-kernel-v5.5.patch b/meta/recipes-kernel/cryptodev/files/0001-cryptlib.c-fix-build-on-kernel-v5.5.patch
> new file mode 100644
> index 0000000000..1af9aed8d8
> --- /dev/null
> +++ b/meta/recipes-kernel/cryptodev/files/0001-cryptlib.c-fix-build-on-kernel-v5.5.patch
> @@ -0,0 +1,49 @@
> +From 98b163a23f6b9fbdc18c3644cf94a75cdcd0cc80 Mon Sep 17 00:00:00 2001
> +From: Andrei Botila <andrei.botila@nxp.com>
> +Date: Wed, 27 Nov 2019 09:53:37 +0200
> +Subject: [PATCH] cryptlib.c: fix build on kernel v5.5+
> +
> +Starting with kernel v5.5-rc1 ablkcipher and blkcipher are removed and
> +symmetric key operations will rely solely on skcipher:
> +commit d63007eb954 ("crypto: ablkcipher - remove deprecated and unused ablkcipher support").
> +
> +When cryptodev will use higher kernel versions > 5.4 will need to use the
> +skcipher interface instead.
> +
> +Signed-off-by: Andrei Botila <andrei.botila@nxp.com>
> +
> +Upstream-Status: Backport [https://github.com/cryptodev-linux/cryptodev-linux/
> +commit/98b163a23f6b9fbdc18c3644cf94a75cdcd0cc80]
> +
> +Signed-off-by: He Zhe <zhe.he@windriver.com>
> +
> +---
> + cryptlib.c | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/cryptlib.c b/cryptlib.c
> +index 4a87037..e2a4198 100644
> +--- a/cryptlib.c
> ++++ b/cryptlib.c
> +@@ -159,6 +159,7 @@ int cryptodev_cipher_init(struct cipher_data *out, const char *alg_name,
> + 
> + #if (LINUX_VERSION_CODE >= KERNEL_VERSION(4, 8, 0))
> + 		tfm = crypto_skcipher_tfm(out->async.s);
> ++#if (LINUX_VERSION_CODE <= KERNEL_VERSION(5, 4, 0))
> + 		if ((tfm->__crt_alg->cra_type == &crypto_ablkcipher_type)
> + #if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 0, 0))
> + 		    || (tfm->__crt_alg->cra_type == &crypto_givcipher_type)
> +@@ -169,7 +170,9 @@ int cryptodev_cipher_init(struct cipher_data *out, const char *alg_name,
> + 			alg = &tfm->__crt_alg->cra_ablkcipher;
> + 			min_keysize = alg->min_keysize;
> + 			max_keysize = alg->max_keysize;
> +-		} else {
> ++		} else
> ++#endif
> ++		{
> + 			struct skcipher_alg *alg;
> + 
> + 			alg = crypto_skcipher_alg(out->async.s);
> +-- 
> +2.7.4
> +


