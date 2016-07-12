Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 5242B73185
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 01:24:47 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id n132so98747qka.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jul 2016 18:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CaXKiE7SZZLSSzGYVnCuwH7EXVdf6CS1gS4erAS7hF4=;
	b=IJI2VAH9tLBteq9VF45pMMBa4WZFLaiz1iObcYM0wC1eM9ZK2vbJvFihPYqYsfL+Fq
	OqgJhZc6tzmuvf/qHa76bgqXv2efpg2aoHaUS9yI4QYEZqePpjmQNps3dmPWor5WtELT
	Ej3L0LUvc0bJXmg7pRhN04ErFwBQM49/zM074+HGcIsS5dpXd3Ijkmz/MhONRvIht/Mz
	UJngET+PYcs+EPP462kweG/OqjonFGCP/6SyqN1qrFQZ8xmyIDzgOXXXah79+Zaiinn3
	zMPqsB0ZgbgOe1nCXeIZBQc5NeiFluQ/yiKs0DezKMvstGhZoBjxqaX1YnP2xOuft0nk
	oY/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CaXKiE7SZZLSSzGYVnCuwH7EXVdf6CS1gS4erAS7hF4=;
	b=fENbNMkWPvIPzdjps8RbD7yKhGgGf1CHzejOuGvEW52GEN6A0t3/bRBM2g9MIusahR
	y1vKCXhtlbyeWh226Gm9yGwFSaE4/mbd3ea2eUGjQlYqQi0zueDmkShy446QV7xWeuxd
	k3JdMdMwgELBdYuzCD+7PFTN+THIdyCG46qzqkDLg9QDwjCEZ6e7oxzrXKpUQvAKmBgW
	BwGwhqW6vsGCl9bvuPCgYPGTPYYvU6kOohJI/YecAVoyDZXXlmnsAmKTshDeopivH3Cy
	xIxFVbLfTsmSyUDvwr5xO+aBOs2KWvuUZUo7Z8+jeuoxi/2jCVkrGMQQUYNHbIIcv1rz
	Pw6Q==
X-Gm-Message-State: ALyK8tI/oTN570Hoy0TmOA9YS5daXwyPX3X8XeYCQSjlAD4KZ3H5ybC1/Sirqbvao8dDfLWY39/bsBfEZVK22w==
X-Received: by 10.55.97.18 with SMTP id v18mr28327680qkb.102.1468286688652;
	Mon, 11 Jul 2016 18:24:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.214.83 with HTTP; Mon, 11 Jul 2016 18:24:19 -0700 (PDT)
In-Reply-To: <1468271236-6781-1-git-send-email-ross.burton@intel.com>
References: <1468271236-6781-1-git-send-email-ross.burton@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Jul 2016 18:24:19 -0700
Message-ID: <CAMKF1sqMyAKWu1Hos94LsmrEr=mHHqxC6ybZy558erPJKrtHjw@mail.gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: add more Imagination Meta relocation to elf.h
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
X-List-Received-Date: Tue, 12 Jul 2016 01:24:48 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 11, 2016 at 2:07 PM, Ross Burton <ross.burton@intel.com> wrote:
> glibc master added the EM_METAG tag but didn't add the relocation defines.
> However the kernel tooling only checks for EM_METAG when defining its own values
> so scripts/recordmcount ends up using R_META_* symbols without their definition.
>
> Whilst the kernel can and should be fixed, this breaks all users of recordmcount
> so patch elf.h to add the values.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-core/glibc/glibc/elf-meta.patch | 32 ++++++++++++++++++++++++++++
>  meta/recipes-core/glibc/glibc_2.24.bb        |  1 +
>  2 files changed, 33 insertions(+)
>  create mode 100644 meta/recipes-core/glibc/glibc/elf-meta.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/elf-meta.patch b/meta/recipes-core/glibc/glibc/elf-meta.patch
> new file mode 100644
> index 0000000..fab66d7
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/elf-meta.patch
> @@ -0,0 +1,32 @@
> +Upstream-Status: Pending
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +
> +From a495656665cd4a4f97744741a4741eafa621d65b Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@intel.com>
> +Date: Mon, 11 Jul 2016 16:57:38 +0100
> +Subject: [PATCH] elf.h: add relocations for Imagination META
> +
> +Adding EM_METAG but not the relocations means the kernel doesn't compile as it
> +guards its own declarations on the presence of EM_METAG.
> +---
> + elf/elf.h | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/elf/elf.h b/elf/elf.h
> +index b6112d9..69e85a7 100644
> +--- a/elf/elf.h
> ++++ b/elf/elf.h
> +@@ -3677,6 +3677,10 @@ enum
> +
> + #define R_TILEGX_NUM          130
> +
> ++/* Imagination META relocs */
> ++#define R_METAG_ADDR32                2
> ++#define R_METAG_NONE          3
> ++

Looks ok, however if you want it to be upstreamed then

1. Move them after BPF declarations.
2. Write a ChangeLog entry, something like

 2016-07-11  Ross Burton  <xxx@yyy.zzz>

       * elf/elf.h (R_METAG_NONE, R_METAG_NONE): New.

> + /* BPF specific declarations.  */
> +
> + #define R_BPF_NONE            0       /* No reloc */
> +--
> +2.8.1
> +
> diff --git a/meta/recipes-core/glibc/glibc_2.24.bb b/meta/recipes-core/glibc/glibc_2.24.bb
> index f0c6a03..456f206 100644
> --- a/meta/recipes-core/glibc/glibc_2.24.bb
> +++ b/meta/recipes-core/glibc/glibc_2.24.bb
> @@ -37,6 +37,7 @@ SRC_URI = "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
>             file://0023-eglibc-Install-PIC-archives.patch \
>             file://0024-eglibc-Forward-port-cross-locale-generation-support.patch \
>             file://0025-Define-DUMMY_LOCALE_T-if-not-defined.patch \
> +           file://elf-meta.patch \
>  "
>
>  SRC_URI += "\
> --
> 2.8.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

