Received: from bsmtp2.bon.at (bsmtp2.bon.at [213.33.87.16])
 by mx.groups.io with SMTP id smtpd.web08.7494.1611754505472361215
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 05:35:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.16, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp2.bon.at (Postfix) with ESMTPSA id 4DQl2s3s6bz5tlB;
	Wed, 27 Jan 2021 14:35:01 +0100 (CET)
Date: Wed, 27 Jan 2021 14:35:00 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Dorinda <dorindabassey@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v4] elfutils: split libdebuginfod into its own package
Message-ID: <20210127133500.zxg6rec7wbguikgk@qschulz>
References: <20210127132712.24952-1-dorindabassey@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210127132712.24952-1-dorindabassey@gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dorinda,

On Wed, Jan 27, 2021 at 02:27:12PM +0100, Dorinda wrote:
> Added package options for libdebuginfod.
> Added GPLv2+ | LGPLv3+ license for libdebuginfod with reference to https://sourceware.org/git/?p=elfutils.git;a=blob;f=debuginfod/debuginfod-client.c;h=de26af5bb26e187b51d9ea00d5826e199a96d01a;hb=HEAD
> 
> [YOCTO #13807]
> 
> Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
> ---
> v4:
> -changed LIC_FILES_CHKSUM for debuginfod-client.c
> 
>  meta/recipes-devtools/elfutils/elfutils_0.182.bb | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.182.bb b/meta/recipes-devtools/elfutils/elfutils_0.182.bb
> index f63208d72b..0b4c30b936 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.182.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.182.bb
> @@ -1,8 +1,10 @@
>  SUMMARY = "Utilities and libraries for handling compiled object files"
>  HOMEPAGE = "https://sourceware.org/elfutils"
>  SECTION = "base"
> -LICENSE = "GPLv2 & LGPLv3+ & GPLv3+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> +LICENSE = "GPLv2 & GPLv2+ & LGPLv3+ & GPLv3+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
> +                    file://debuginfod/debuginfod-client.c;md5=0cf97982735b2ea53f5d7fcd7d88dafe \

That won't fly. Any change to debuginfod/debuginfod-client.c will
trigger a build error because of license changes (which isn't
necessarily the case).

This makes it harder to upgrade the recipe (usually, just changing the
recipe version in the filename is enough, and changes to
LIC_FILES_CHKSUM smell fishy).

You want to use:
file://debuginfod/debuginfod-client.c;endline=27;md5=xxxxxx

c.f. https://docs.yoctoproject.org/dev-manual/common-tasks.html#specifying-the-lic-files-chksum-variable

Cheers,
Quentin
