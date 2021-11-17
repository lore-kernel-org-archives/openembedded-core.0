Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <dbfbf7aee5bb837deab0f04d16bfe60f514fb72f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] glibc: Append files instead of making then part of main SRC_URI
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Wed, 17 Nov 2021 17:38:44 +0000
In-Reply-To: <20211117165646.70015-2-raj.khem@gmail.com>
References: <20211117165646.70015-1-raj.khem@gmail.com>
	 <20211117165646.70015-2-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org

On Wed, 2021-11-17 at 08:56 -0800, Khem Raj wrote:
> This will help later with using devupstream
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/glibc/glibc_2.34.bb | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-core/glibc/glibc_2.34.bb b/meta/recipes-core/glibc/glibc_2.34.bb
> index 72064772789..778898f1979 100644
> --- a/meta/recipes-core/glibc/glibc_2.34.bb
> +++ b/meta/recipes-core/glibc/glibc_2.34.bb
> @@ -29,10 +29,6 @@ NATIVESDKFIXES:class-nativesdk = "\
>  "
>  
>  SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
> -           file://etc/ld.so.conf \
> -           file://generate-supported.mk \
> -           file://makedbs.sh \
> -           \
>             ${NATIVESDKFIXES} \
>             file://0009-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch \
>             file://0010-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch \
> @@ -60,6 +56,12 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>             file://0001-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
>             file://CVE-2021-43396.patch \
>             "
> +# Use append instead of += that way patch is applied with devupstream too
> +SRC_URI:append = "\
> +           file://etc/ld.so.conf \
> +           file://generate-supported.mk \
> +           file://makedbs.sh \
> +"
>  S = "${WORKDIR}/git"
>  B = "${WORKDIR}/build-${TARGET_SYS}"
>  

I'm afraid I really dislike these kinds of patches. We need to do something with
our syntax so we don't have to jump through weird hoops like this. These kind of
changes look really fragile and easy to break. 

Effectively it is an arms race to turn everything into an append, then nothing
can disable it.

Cheers,

Richard

