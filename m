Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5D98370022
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 06:22:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4B6MUog004783
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 10 May 2016 23:22:30 -0700
Received: from [128.224.163.137] (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 10 May 2016 23:22:29 -0700
To: Armin Kuster <akuster808@gmail.com>, <akuster@mvista.com>,
	<openembedded-core@lists.openembedded.org>
References: <1462319165-24307-1-git-send-email-akuster808@gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5732CFA3.7080302@windriver.com>
Date: Wed, 11 May 2016 14:22:27 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <1462319165-24307-1-git-send-email-akuster808@gmail.com>
Subject: Re: [master][krogoth][PATCH] openssl: Security fix via update to 1.0.2h
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
X-List-Received-Date: Wed, 11 May 2016 06:22:31 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 05/04/2016 07:46 AM, Armin Kuster wrote:
> From: Armin Kuster <akuster@mvista.com>
>
> CVE-2016-2105
> CVE-2016-2106
> CVE-2016-2109
> CVE-2016-2176
>
> https://www.openssl.org/news/secadv/20160503.txt
>
> fixup openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
>
> drop crypto_use_bigint_in_x86-64_perl.patch as that fix is in latest.

After I looked into the code, it seems that this patch is not in latest code ?
It is a backported patch from gentoo.

// Robert

>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>   ...oid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch | 14 +++++++-------
>   .../openssl/{openssl_1.0.2g.bb => openssl_1.0.2h.bb}       |  6 ++----
>   2 files changed, 9 insertions(+), 11 deletions(-)
>   rename meta/recipes-connectivity/openssl/{openssl_1.0.2g.bb => openssl_1.0.2h.bb} (91%)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch b/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
> index cebc8cf..f736e5c 100644
> --- a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
> +++ b/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
> @@ -8,16 +8,16 @@ http://www.mail-archive.com/openssl-dev@openssl.org/msg32860.html
>
>   Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
>   ---
> -Index: openssl-1.0.2/crypto/evp/digest.c
> +Index: openssl-1.0.2h/crypto/evp/digest.c
>   ===================================================================
> ---- openssl-1.0.2.orig/crypto/evp/digest.c
> -+++ openssl-1.0.2/crypto/evp/digest.c
> -@@ -208,7 +208,7 @@ int EVP_DigestInit_ex(EVP_MD_CTX *ctx, c
> -         return 0;
> +--- openssl-1.0.2h.orig/crypto/evp/digest.c
> ++++ openssl-1.0.2h/crypto/evp/digest.c
> +@@ -211,7 +211,7 @@ int EVP_DigestInit_ex(EVP_MD_CTX *ctx, c
> +         type = ctx->digest;
>        }
>    #endif
>   -    if (ctx->digest != type) {
>   +    if (type && (ctx->digest != type)) {
> -         if (ctx->digest && ctx->digest->ctx_size)
> +         if (ctx->digest && ctx->digest->ctx_size) {
>                OPENSSL_free(ctx->md_data);
> -         ctx->digest = type;
> +             ctx->md_data = NULL;
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2g.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
> similarity index 91%
> rename from meta/recipes-connectivity/openssl/openssl_1.0.2g.bb
> rename to meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
> index 290f129..ae65992 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2g.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
> @@ -34,15 +34,13 @@ SRC_URI += "file://find.pl;subdir=${BP}/util/ \
>               file://openssl-fix-des.pod-error.patch \
>               file://Makefiles-ptest.patch \
>               file://ptest-deps.patch \
> -            file://crypto_use_bigint_in_x86-64_perl.patch \
>               file://openssl-1.0.2a-x32-asm.patch \
>               file://ptest_makefile_deps.patch  \
>               file://configure-musl-target.patch \
>               file://parallel.patch \
>              "
> -
> -SRC_URI[md5sum] = "f3c710c045cdee5fd114feb69feba7aa"
> -SRC_URI[sha256sum] = "b784b1b3907ce39abf4098702dade6365522a253ad1552e267a9a0e89594aa33"
> +SRC_URI[md5sum] = "9392e65072ce4b614c1392eefc1f23d0"
> +SRC_URI[sha256sum] = "1d4007e53aad94a5b2002fe045ee7bb0b3d98f1a47f8b2bc851dcd1c74332919"
>
>   PACKAGES =+ "${PN}-engines"
>   FILES_${PN}-engines = "${libdir}/ssl/engines/*.so ${libdir}/engines"
>

