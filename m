Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com [209.85.222.67])
 by mx.groups.io with SMTP id smtpd.web10.503.1599845593229567078
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Sep 2020 10:33:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hTwOzLFf;
 spf=pass (domain: gmail.com, ip: 209.85.222.67, mailfrom: armccurdy@gmail.com)
Received: by mail-ua1-f67.google.com with SMTP id d18so1738494uav.4
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Sep 2020 10:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=atMThYHuPmgk5doMSvPm7VgiiUHXeCh0FQWNvy+P0ns=;
        b=hTwOzLFftKYg6tFuu5QK228KrhFq/a6p9V+zBpetOyFTSl0JpFuqhVoKbMTzEF8OfK
         2EwFLoh98zz9FTFthEgsztIOsr5XGCX0ZthOUts5pBbNOKfkDPTaoZ3NQTQ57P8vuc/Q
         WDiqjcHpSXvIiBnqqtTNDG7WzWegejamVK8GaXhBtsf92+dfY2OGv2ECAWUT1euvUSj9
         bSywxmGP5w5lxbstpirkBvXIBBN4ZO7tdmBnBlgZD7ESJnE89q4YtfiXRXTZCPhkrx2x
         8Wl3uVorRZkTmi2RIHjBzLkLR9huygFMu8cW6Ta/MwHogm9u544jEkNZo1+lkViiFKjE
         6x0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=atMThYHuPmgk5doMSvPm7VgiiUHXeCh0FQWNvy+P0ns=;
        b=nfiCDuWcEjGV4hHjmj+OAzZEAWXxkSG3zEA8axJ2WAOThupbJasjomdyoeMtW0Xsex
         Hf9jO0eBrl0hD2rsClRwmZDB9TcBdCd4ZZz8TJ3utICxk6lGDnl9veEhZwdu+yADHyjy
         QZzDF2Dkw49idfxVHVy1E4c8kI/4pXXLzapA1C9Gd9hEEgL4N4ra3mNyODdoHLsSB+Lj
         icPX2hoxPqrtNt3fy+XPxGW3MYP1mD4zSURbA5/hEFdSp9Y8AfrIUkx0bh1V2QBzQxvO
         VIGblQqZJrJWAhriXsNgqRgRn/Z3dpN5EGjUWJnCXe5hAceNXAx6T3tVHOmvSAycnfKZ
         0dZg==
X-Gm-Message-State: AOAM531jjQhFYdwvm9bwWh9F6JH2jpA5UCDjwVl/zEazhVU70nzCiwql
	lYYR7kH7A7P6NzX5dPM8FTjXUdPuRB0WJS7ZS6g=
X-Google-Smtp-Source: ABdhPJwYihJ43dHXwJDKZYYPCI/YlTS+d7la6sePBZ6KB9gIGuB+WHIciBVTaod/3+FoAxxObbj7qHSSGWBUXbQDX60=
X-Received: by 2002:a9f:35e3:: with SMTP id u32mr1699570uad.99.1599845592219;
 Fri, 11 Sep 2020 10:33:12 -0700 (PDT)
MIME-Version: 1.0
References: <1599844862-15857-1-git-send-email-pemorrow@linux.microsoft.com>
In-Reply-To: <1599844862-15857-1-git-send-email-pemorrow@linux.microsoft.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Fri, 11 Sep 2020 10:33:04 -0700
Message-ID: <CAJ86T=UPhup8G+e6yt2X9=smV9Y3oMQ=kvZB0K_ivp5ZwKDDCg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] squashfs-tools: Allow COMP_DEFAULT to be changed easily at build time
To: Peter Morrow <pemorrow@linux.microsoft.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 11, 2020 at 10:21 AM Peter Morrow
<pemorrow@linux.microsoft.com> wrote:
>
> The default compression algorithm is gzip, this patch allows the default
> to be changed via a bbappend file by setting SQUASHFS_TOOLS_COMP_DEFAULT
> to a valid compression algorithm.
>
> Signed-off-by: Peter Morrow <pemorrow@linux.microsoft.com>
> ---
>  ...ols-Allow-COMP_DEFAULT-to-be-overridden-v.patch | 34 ++++++++++++++++++++++
>  .../squashfs-tools/squashfs-tools_git.bb           |  4 +++
>  2 files changed, 38 insertions(+)
>  create mode 100644 meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-Allow-COMP_DEFAULT-to-be-overridden-v.patch
>
> diff --git a/meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-Allow-COMP_DEFAULT-to-be-overridden-v.patch b/meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-Allow-COMP_DEFAULT-to-be-overridden-v.patch
> new file mode 100644
> index 0000000..5f12c42
> --- /dev/null
> +++ b/meta/recipes-devtools/squashfs-tools/files/0001-squashfs-tools-Allow-COMP_DEFAULT-to-be-overridden-v.patch
> @@ -0,0 +1,34 @@
> +From d2d9b517696f5950597f5b60ae8fdade5b7c14a9 Mon Sep 17 00:00:00 2001
> +From: Peter Morrow <pemorrow@linux.microsoft.com>
> +Date: Fri, 4 Sep 2020 15:43:15 +0100
> +Subject: [PATCH] squashfs-tools: Allow COMP_DEFAULT to be overridden via make
> + cmdline
> +
> +Currently the only way to modify the default compression algorithm is to
> +modify the Makefile. It is useful to be able to set the default compression
> +algorithm via the make command line since otherwise a build time search
> +replace operation needs to be performed on the Makefile.

That's not how Makefiles normally work. Options set via the command
line over-ride variables set with = in the Makefile.

Does setting your chosen value for COMP_DEFAULT on the make command
line really not work?

> +Upstream-Status: Submitted [https://github.com/plougher/squashfs-tools/pull/93 ]
> +
> +Signed-off-by: Peter Morrow <pemorrow@linux.microsoft.com>
> +---
> + squashfs-tools/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/squashfs-tools/Makefile b/squashfs-tools/Makefile
> +index aee4b96..7425605 100644
> +--- a/squashfs-tools/Makefile
> ++++ b/squashfs-tools/Makefile
> +@@ -85,7 +85,7 @@ GZIP_SUPPORT = 1
> + # in Mksquashfs.  Obviously the compression algorithm must have been
> + # selected to be built
> + #
> +-COMP_DEFAULT = gzip
> ++COMP_DEFAULT ?= gzip
> +
> +
> + ###############################################
> +--
> +2.20.1
> +
> diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> index b06951d..df025d4 100644
> --- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> +++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
> @@ -9,6 +9,7 @@ PV = "4.4"
>  SRCREV = "52eb4c279cd283ed9802dd1ceb686560b22ffb67"
>  SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https \
>             file://0001-squashfs-tools-fix-build-failure-against-gcc-10.patch;striplevel=2 \
> +           file://0001-squashfs-tools-Allow-COMP_DEFAULT-to-be-overridden-v.patch;striplevel=2 \
>  "
>
>  S = "${WORKDIR}/git/squashfs-tools"
> @@ -25,6 +26,9 @@ PACKAGECONFIG[xattr] = "XATTR_SUPPORT=1,XATTR_SUPPORT=0,attr"
>  PACKAGECONFIG[zstd] = "ZSTD_SUPPORT=1,ZSTD_SUPPORT=0,zstd"
>  PACKAGECONFIG[reproducible] = "REPRODUCIBLE_DEFAULT=1,REPRODUCIBLE_DEFAULT=0,"
>
> +SQUASHFS_TOOLS_COMP_DEFAULT ?= "gzip"
> +EXTRA_OEMAKE += "COMP_DEFAULT=${SQUASHFS_TOOLS_COMP_DEFAULT}"

Note that this will force the recipe's default value even if upstream
squashfs-tools changes. Not a problem now as the two are the same, but
something which will need to be checked each time squashfs-tools is
updated.

>  do_compile() {
>         oe_runmake all
>  }
> --
> 1.8.3.1
>
> 
