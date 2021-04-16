Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web08.5770.1618557487250510221
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Apr 2021 00:18:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=b7U2WHUM;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id f17so36181826lfu.7
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Apr 2021 00:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CHEONtjvsRckZ7hQmHJDRornHd/ciEuWW0MAPcEnaXE=;
        b=b7U2WHUMMIYhwAsYi291rBNxzrznlmAyBKiwlUKjp692/75QiwqLK8Ay/wLzuC5hK2
         PY3TuIMRiTmCMjiHcpDLE7Zv4aXg2dZ+8QVb2Plnqci1U4v+NzfkTIcSMmwhLUWQX8as
         c3pJU3qtyqOYhxQ6XQjQEBckML0TYeloOlxwsSCvSOo9Pnax4hDR4PLo6WJg9gYlTiPn
         0hn+4aKJgFJHkIycA8kEoI+sxn5ZeIybG+VqHwsIZ8bfUZMowo1oDB7hCQHviMtFn/UY
         AoC/kZWXZK7s7A2rRT3VpzuG8SRmkkz6HHQR9jQTHA4fTVume+c7nEkrMylQl+0DNPQM
         UMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CHEONtjvsRckZ7hQmHJDRornHd/ciEuWW0MAPcEnaXE=;
        b=dwf6VZ881o/L5ll6FQ5dHr1lul1iDgR9Ms/e/i837+ZglgDdc/Zl+JZuXgjsGyqWzQ
         fv0vYo6EdYFKl6TivT2OAmrBqgZ9rgCfnJWiCtIFWfo+wOnRNEhB/rAwGTq48So+yhMQ
         fqRCHzfqg8fAorJZ1p8PuS8b5TLMTP5fHYdyUefVt7ATGTq8O4/q6wVQLAElyYmZT/vi
         5d6SYT98ISY02lpLgueFcfP7wBgj1SW0zjLjBHxdZ9YIKUUOhLh7yOvVOmPge6qyzabK
         kUOlrg5xDfJU9jsArJ3dkzcccLLxM9Y1c3oWO89wJDsSrzH9undEiZqs6UAWu4QIp0ze
         XJGw==
X-Gm-Message-State: AOAM530nQueo2znV7e8WCLILDedu891eSOTHM8hK66qQEP7oRkOsev+o
	83k6oMOGh3ltbpzBWotjCodzGIn66GrTGHPfG0g=
X-Google-Smtp-Source: ABdhPJwbAl4Op30yhfuSPoTwSlUQS0q7WOIsfBnG41vCCQRK7kkWF6L1a+loNQlk6NvBKKeLSlgUC6+aiUPZi4h60SE=
X-Received: by 2002:a19:6d07:: with SMTP id i7mr2032811lfc.568.1618557485032;
 Fri, 16 Apr 2021 00:18:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210416053729.1021506-1-robert.joslyn@redrectangle.org> <20210416053729.1021506-2-robert.joslyn@redrectangle.org>
In-Reply-To: <20210416053729.1021506-2-robert.joslyn@redrectangle.org>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Fri, 16 Apr 2021 00:17:54 -0700
Message-ID: <CAJ86T=VARprmYY1mPKa7uG0pNpzpdJXBXu_-PYtBPvDRaZqohQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/3] btrfs-tools: Add PACKAGECONFIG options
To: Robert Joslyn <robert.joslyn@redrectangle.org>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 15, 2021 at 10:38 PM Robert Joslyn
<robert.joslyn@redrectangle.org> wrote:
>
> Add options to make it easier to control which features are enabled. All
> of these default to enabled by upstream, so keep them enabled to
> maintain previous behavior.
>
> The convert option also supports reiserfs, but no recipes exist in the
> layer index. Limit the option to ext filesystems until someone cares
> enough to make reiserfs recipes.
>
> Remove acl and attr from DEPENDS, as they do not apper to be needed. Add
> zlib since it is required.
>
> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> ---
>  .../btrfs-tools/btrfs-tools_5.11.1.bb         | 26 ++++++++++++++++---
>  1 file changed, 23 insertions(+), 3 deletions(-)
>
> diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb
> index 2ab476a88e..b875ea1aa1 100644
> --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb
> +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.11.1.bb
> @@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = " \
>      file://libbtrfsutil/COPYING.LESSER;md5=3000208d539ec061b899bce1d9ce9404 \
>  "
>  SECTION = "base"
> -DEPENDS = "util-linux attr e2fsprogs lzo acl"
> +DEPENDS = "lzo util-linux zlib"
>  DEPENDS_append_class-target = " udev"
>  RDEPENDS_${PN} = "libgcc"
>
> @@ -22,17 +22,37 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
>             file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
>             "
>
> -PACKAGECONFIG ??= "python"
> +PACKAGECONFIG ??= " \
> +    ${@bb.utils.filter('DISTRO_FEATURES', 'largefile', d)} \

The largefile distro feature is for historical reference only. Recipes
should always enable largefile support regardless of the distro
feature (which will eventually be removed).

> +    backtrace \
> +    programs \
> +    shared \
> +    convert \
> +    python \
> +    crypto-builtin \

This is not conventional formatting for a list of PACKAGECONFIG
options. Maybe have a look at some other recipes in oe-core to get a
feel for the typical style.

> +"
> +PACKAGECONFIG[largefile] = "--enable-largefile,--disable-largefile"
> +PACKAGECONFIG[backtrace] = "--enable-backtrace,--disable-backtrace"
>  PACKAGECONFIG[manpages] = "--enable-documentation, --disable-documentation, asciidoc-native xmlto-native"
> +PACKAGECONFIG[programs] = "--enable-programs,--disable-programs"
> +PACKAGECONFIG[shared] = "--enable-shared,--disable-shared"
> +PACKAGECONFIG[static] = "--enable-static,--disable-static"

The choice to build shared and/or static libs is not something which
is typically controlled by PACKAGECONFIG options.

> +PACKAGECONFIG[convert] = "--enable-convert --with-convert=ext2,--disable-convert --without-convert,e2fsprogs"
>  PACKAGECONFIG[python] = "--enable-python,--disable-python,python3-setuptools-native"
>  PACKAGECONFIG[zstd] = "--enable-zstd,--disable-zstd,zstd"
>
> +# Pick only one crypto provider
> +PACKAGECONFIG[crypto-builtin] = "--with-crypto=builtin"
> +PACKAGECONFIG[crypto-libgcrypt] = "--with-crypto=libgcrypt,,libgcrypt"
> +PACKAGECONFIG[crypto-libsodium] = "--with-crypto=libsodium,,libsodium"
> +PACKAGECONFIG[crypto-libkcapi] = "--with-crypto=libkcapi,,libkcapi"
> +
>  inherit autotools-brokensep pkgconfig manpages
>  inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'distutils3-base', '', d)}
>
>  CLEANBROKEN = "1"
>
> -EXTRA_OECONF_append_libc-musl = " --disable-backtrace "
> +PACKAGECONFIG_remove_libc-musl = "backtrace"

Use of _remove in core recipes is discouraged.

>  EXTRA_PYTHON_CFLAGS = "${DEBUG_PREFIX_MAP}"
>  EXTRA_PYTHON_CFLAGS_class-native = ""
>  EXTRA_PYTHON_LDFLAGS = "${LDFLAGS}"
> --
> 2.26.3
>
>
> 
>
