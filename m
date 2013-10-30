Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id E459060EA5
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 23:48:22 +0000 (UTC)
Received: by mail-ie0-f170.google.com with SMTP id at1so3646944iec.1
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 30 Oct 2013 16:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=2/tkY76yHcOMLjLypcwOeuRdzr5Lo+nJtfn0XMbaGUk=;
	b=bWOHFTWhD4FtCxwH3tpY6juPU8K6fb7ZVS7wZ98Ub3H2vbjBHLfpBy7Kat0cl/gjQo
	ACkqvSAAS7/sR5SXNOgrkuhJIyzwgEFvy3MSTcLbPxbRMhXbGCr4cm437VcopMZWDYX5
	YtLCjA7USGXFq0FMtdSNmRkvbtF2Xc3rjctDCd8d2xXsASE3SM35qCKCDZ3jEKyAlfrj
	JQvbmrYogToCaf9JRPJ2yLI2JtLk7C8PWbrwfexdUSMKclO6da8ZBYFqUvE+lBVFwiCf
	R0xrcMiWJcpJT3X2bF1AKkrUigy9TKAdqOle7twMZoCTL2jEVjrqDrJSOhJu4iZY5Gl8
	PMDg==
X-Received: by 10.50.61.179 with SMTP id q19mr4322402igr.33.1383176904860;
	Wed, 30 Oct 2013 16:48:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.219.195 with HTTP; Wed, 30 Oct 2013 16:47:54 -0700 (PDT)
In-Reply-To: <1383173291-4017-1-git-send-email-jason.wessel@windriver.com>
References: <1383173291-4017-1-git-send-email-jason.wessel@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 30 Oct 2013 16:47:54 -0700
Message-ID: <CAMKF1srsz3njDJpvm4sr865VDkWtemeZzDshT2gY05noNqZZLA@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mtools, syslinux: add ability to compile with nativesdk
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
X-List-Received-Date: Wed, 30 Oct 2013 23:48:23 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 30, 2013 at 3:48 PM, Jason Wessel
<jason.wessel@windriver.com> wrote:
> For regenerating and ISO or EFI boot image the nativesdk needs mtools
> and syslinux.
>
> Both recipes are patched in one patch since syslinux requires
> mtools.
>

as they depend on eglibc/glibc only. Can you also make sure that they
get flagged when building
systems with non-eglibc C libraries.

> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  meta/recipes-devtools/mtools/mtools_3.9.9.bb    |    9 +++++++--
>  meta/recipes-devtools/mtools/mtools_4.0.18.bb   |   12 +++++++++---
>  meta/recipes-devtools/syslinux/syslinux_6.01.bb |    2 +-
>  3 files changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-devtools/mtools/mtools_3.9.9.bb b/meta/recipes-devtools/mtools/mtools_3.9.9.bb
> index 2213c17..8678a8b 100644
> --- a/meta/recipes-devtools/mtools/mtools_3.9.9.bb
> +++ b/meta/recipes-devtools/mtools/mtools_3.9.9.bb
> @@ -9,8 +9,12 @@ LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=92b58ec77696788ce278b044d2a8e9d3"
>  PR = "r6"
>
> -RDEPENDS_${PN} = "glibc-gconv-ibm850"
> -RRECOMMENDS_${PN} = "\
> +targetdepgconv = ""
> +targetdepgconv_class-target = "glibc-gconv-ibm850"
> +RDEPENDS_${PN} = "${targetdepgconv}"
> +
> +targetrecgconv = ""
> +targetrecgconv_class-target = "\
>         glibc-gconv-ibm437 \
>         glibc-gconv-ibm737 \
>         glibc-gconv-ibm775 \
> @@ -26,6 +30,7 @@ RRECOMMENDS_${PN} = "\
>         glibc-gconv-ibm866 \
>         glibc-gconv-ibm869 \
>         "
> +RRECOMMENDS_${PN} = "${targetrecgconv}"
>
>  #http://mtools.linux.lu/mtools-${PV}.tar.gz
>  SRC_URI = "http://downloads.yoctoproject.org/mirror/sources/mtools-${PV}.tar.gz \
> diff --git a/meta/recipes-devtools/mtools/mtools_4.0.18.bb b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
> index dcd6066..602b3c0 100644
> --- a/meta/recipes-devtools/mtools/mtools_4.0.18.bb
> +++ b/meta/recipes-devtools/mtools/mtools_4.0.18.bb
> @@ -6,8 +6,12 @@ LICENSE = "GPLv3"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>
>
> -RDEPENDS_${PN} = "glibc-gconv-ibm850"
> -RRECOMMENDS_${PN} = "\
> +targetdepgconv = ""
> +targetdepgconv_class-target = "glibc-gconv-ibm850"
> +RDEPENDS_${PN} = "${targetdepgconv}"
> +
> +targetrecgconv = ""
> +targetrecgconv_class-target = "\
>         glibc-gconv-ibm437 \
>         glibc-gconv-ibm737 \
>         glibc-gconv-ibm775 \
> @@ -23,6 +27,8 @@ RRECOMMENDS_${PN} = "\
>         glibc-gconv-ibm866 \
>         glibc-gconv-ibm869 \
>         "
> +RRECOMMENDS_${PN} = "${targetrecgconv}"
> +
>  SRC_URI[md5sum] = "a23646617546bf6ad56f061d8b283c85"
>  SRC_URI[sha256sum] = "59e9cf80885399c4f229e5d87e49c0c2bfeec044e1386d59fcd0b0aead6b2f85"
>
> @@ -37,4 +43,4 @@ EXTRA_OECONF = "--without-x"
>
>  PARALLEL_MAKEINST = ""
>
> -BBCLASSEXTEND = "native"
> +BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-devtools/syslinux/syslinux_6.01.bb b/meta/recipes-devtools/syslinux/syslinux_6.01.bb
> index 4438ea8..c6e83b5 100644
> --- a/meta/recipes-devtools/syslinux/syslinux_6.01.bb
> +++ b/meta/recipes-devtools/syslinux/syslinux_6.01.bb
> @@ -65,4 +65,4 @@ FILES_${PN}-dev += "${datadir}/${BPN}/com32/lib*${SOLIBS} ${datadir}/${BPN}/com3
>  FILES_${PN}-staticdev += "${datadir}/${BPN}/com32/lib*.a ${libdir}/${BPN}/com32/lib*.a"
>  FILES_${PN}-misc = "${datadir}/${BPN}/* ${libdir}/${BPN}/* ${bindir}/*"
>
> -BBCLASSEXTEND = "native"
> +BBCLASSEXTEND = "native nativesdk"
> --
> 1.7.9.5
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

