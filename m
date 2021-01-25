Received: from bsmtp3.bon.at (bsmtp3.bon.at [213.33.87.17])
 by mx.groups.io with SMTP id smtpd.web08.33928.1611564889089980848
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jan 2021 00:54:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: streamunlimited.com, ip: 213.33.87.17, mailfrom: quentin.schulz@streamunlimited.com)
Received: from qschulz (vpn.streamunlimited.com [91.114.0.140])
	by bsmtp3.bon.at (Postfix) with ESMTPSA id 4DPNwQ2kS2z5tlG;
	Mon, 25 Jan 2021 09:54:46 +0100 (CET)
Date: Mon, 25 Jan 2021 09:54:45 +0100
From: "Quentin Schulz" <quentin.schulz@streamunlimited.com>
To: Dorinda <dorindabassey@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/5] elfutils: split libdebuginfod into its own package
Message-ID: <20210125085444.35d7hftsxoujwqjc@qschulz>
References: <20210124135559.21894-1-dorindabassey@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210124135559.21894-1-dorindabassey@gmail.com>
User-Agent: NeoMutt/20180716
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dorinda,

On Sun, Jan 24, 2021 at 02:55:55PM +0100, Dorinda wrote:
> add package options for libdebuginfod
> 
> Signed-off-by: Dorinda Bassey <dorindabassey@gmail.com>
> ---
>  meta/recipes-devtools/elfutils/elfutils_0.182.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.182.bb b/meta/recipes-devtools/elfutils/elfutils_0.182.bb
> index f63208d72b..2666032d24 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.182.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.182.bb
> @@ -1,7 +1,7 @@
>  SUMMARY = "Utilities and libraries for handling compiled object files"
>  HOMEPAGE = "https://sourceware.org/elfutils"
>  SECTION = "base"
> -LICENSE = "GPLv2 & LGPLv3+ & GPLv3+"
> +LICENSE = "GPLv2 & GPLv2+ & LGPLv3+ & GPLv3+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"

A change in LICENSE but not in LIC_FILES_CHKSUM is very unusual and
usually tells us that something was missed.

Having quickly checked in the git repo, indeed,
https://sourceware.org/git/?p=elfutils.git;a=blob;f=debuginfod/debuginfod-client.c
and the header are GPLv2+ | LGPLv3+.

What I recommend is adding either the c file or the header to
LIC_FILES_CHKSUM (only the commented part which contains the licenses;
check for the begin/end arguments in LIC_FILES_CHKSUM).

That way, if there's any change to this file's license, Yocto will
refuse to build the package until the license is fixed, which is what we
want.

Please explain also in the commit log why the recipe license has changed
with a short sentence.

Thanks,
Quentin
