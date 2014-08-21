Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4E29070EE1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 20:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7LKnITL021889; Thu, 21 Aug 2014 21:49:18 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id vIRa1Reg4FNb; Thu, 21 Aug 2014 21:49:18 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7LKnFG6021886
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 21 Aug 2014 21:49:16 +0100
Message-ID: <1408654156.1669.120.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Armin Kuster <akuster808@gmail.com>
Date: Thu, 21 Aug 2014 21:49:16 +0100
In-Reply-To: <1408653881-7021-2-git-send-email-akuster808@gmail.com>
References: <1408653881-7021-1-git-send-email-akuster808@gmail.com>
	<1408653881-7021-2-git-send-email-akuster808@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH]] gpm: ppc64 build issue
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
X-List-Received-Date: Thu, 21 Aug 2014 20:49:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-08-21 at 13:44 -0700, Armin Kuster wrote:
> tmp-gcd_1.s: Assembler messages:
> | tmp-gcd_1.s:94: Error: unsupported relocation against BMOD_1_TO_MOD_1_THRESHOLD
> | make[2]: *** [gcd_1.lo] Error 1
> 
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta/recipes-support/gmp/gmp/gpm-6.0.0-ppc64.patch | 25 ++++++++++++++++++++++
>  meta/recipes-support/gmp/gmp_6.0.0.bb              |  1 +
>  2 files changed, 26 insertions(+)
>  create mode 100644 meta/recipes-support/gmp/gmp/gpm-6.0.0-ppc64.patch

Could we correct the name to gmp please?

Cheers,

Richard

> diff --git a/meta/recipes-support/gmp/gmp/gpm-6.0.0-ppc64.patch b/meta/recipes-support/gmp/gmp/gpm-6.0.0-ppc64.patch
> new file mode 100644
> index 0000000..19bb4fa
> --- /dev/null
> +++ b/meta/recipes-support/gmp/gmp/gpm-6.0.0-ppc64.patch
> @@ -0,0 +1,25 @@
> +
> +Signed-off-by: Armin Kuster <akuster808@gmail.com>
> +
> +This patch with pulled from gmp.
> +https://gmplib.org/repo/gmp/rev/4a6d258b467f
> +
> +# HG changeset patch
> +# User Torbjorn Granlund <tege@gmplib.org>
> +# Date 1395835068 -3600
> +# Node ID 4a6d258b467f661da0894cc60ecd060f2e3c67c7
> +# Parent  301ce2788826a2d4d2725bd5cf01e998638db37a
> +Provide default for BMOD_1_TO_MOD_1_THRESHOLD.
> +
> +diff -r 301ce2788826 -r 4a6d258b467f mpn/powerpc64/mode64/gcd_1.asm
> +--- a/mpn/powerpc64/mode64/gcd_1.asm    Tue Mar 25 15:34:52 2014 +0100
> ++++ b/mpn/powerpc64/mode64/gcd_1.asm    Wed Mar 26 12:57:48 2014 +0100
> +@@ -43,6 +43,9 @@
> + define(`n',     `r4')
> + define(`v0',    `r5')
> +
> ++ifdef(`BMOD_1_TO_MOD_1_THRESHOLD',,
> ++  `define(`BMOD_1_TO_MOD_1_THRESHOLD',30)')
> ++
> + EXTERN_FUNC(mpn_mod_1)
> + EXTERN_FUNC(mpn_modexact_1c_odd)
> diff --git a/meta/recipes-support/gmp/gmp_6.0.0.bb b/meta/recipes-support/gmp/gmp_6.0.0.bb
> index 19e5f4d..cd515e8 100644
> --- a/meta/recipes-support/gmp/gmp_6.0.0.bb
> +++ b/meta/recipes-support/gmp/gmp_6.0.0.bb
> @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
>  "
>  SRC_URI_append = " file://use-includedir.patch \
>                     file://append_user_provided_flags.patch \
> +                   file://gpm-6.0.0-ppc64.patch \
>  "
>  
>  SRC_URI[md5sum] = "b7ff2d88cae7f8085bd5006096eed470"
> -- 
> 1.9.1
> 



