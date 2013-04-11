Received: from mail-pa0-f48.google.com ([209.85.220.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1UQ5ra-0004SP-Sa
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 02:59:50 +0200
Received: by mail-pa0-f48.google.com with SMTP id lj1so592188pab.21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2013 17:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=WZcTXdbIi2Q+q7tyrnuO2Pg6bnTVZnJ23gXc8+8GTeI=;
	b=wfeYLxcB2zYQ92tYjro0yRU5aQ7viA/I9FuHhi8VM3Vhwis/WuA0W2RljgBPO/J1Mc
	vrjMeO7T1niG+44GSkmTPquJn/oeAomlcDjY+DZVBT+xMVQI3aXK8e3nFgsRmpMcWLt+
	C/1IQm0dBc8M328kZEyOxFNvYAp+onTMszOfgAJRByaCnf1QuOcrQemsW75x6dum1TWj
	x42txqwaa6ig7/9SjbkCt1xPr5c5/+ZoQUhgPX/Cn+JYCh/0r0M6IMQRZLdGKn2gATUZ
	SncTSyiR/nFXI5yM8KmlQvnGskgU5VgpbsbsdBiAvH7UuCjZabiJYL/FjDoo46VAFd4d
	f90Q==
MIME-Version: 1.0
X-Received: by 10.66.145.166 with SMTP id sv6mr6677160pab.1.1365640939887;
	Wed, 10 Apr 2013 17:42:19 -0700 (PDT)
Received: by 10.68.216.7 with HTTP; Wed, 10 Apr 2013 17:42:19 -0700 (PDT)
In-Reply-To: <1365630434-7008-2-git-send-email-Chase.Maupin@ti.com>
References: <1365630434-7008-1-git-send-email-Chase.Maupin@ti.com>
	<1365630434-7008-2-git-send-email-Chase.Maupin@ti.com>
Date: Wed, 10 Apr 2013 20:42:19 -0400
Message-ID: <CADkTA4P-9V7X_R12n8SDSAgYxGE9M0Mhfadp85hPwFPFFaM7NQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chase Maupin <Chase.Maupin@ti.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel: Add KERNEL_LOCALVERSION to control version string
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Apr 2013 00:59:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Apr 10, 2013 at 5:47 PM, Chase Maupin <Chase.Maupin@ti.com> wrote:
> * Add a variable called KERNEL_LOCALVERSION which when set will
>   place a version string in the .scmversion file of the kernel
>   sources.  This string will be picked up by the kernel Makefile
>   and will be appended to the kernel version.  This is done to
>   make it easier to identify what revision of the kernel sources
>   are being run.  For example you can use a setting like the
>   following to add the short commit id to the kernel version
>   string:
>
> KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True).partition('+')[2][0:7]}"
>
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  meta/classes/kernel.bbclass |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index af58887..9757465 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -48,6 +48,9 @@ export CMDLINE_CONSOLE = "console=${@d.getVar("KERNEL_CONSOLE",1) or "ttyS0"}"
>
>  KERNEL_VERSION = "${@get_kernelversion('${B}')}"
>
> +# Setting KERNEL_LOCALVERSION will place a string in the .scmversion file
> +# of the kernel tree.  This string will be picked up by the build system
> +# of the kernel and appended to the kernel version.
>  KERNEL_LOCALVERSION ?= ""
>
>  # kernels are generally machine specific
> @@ -210,7 +213,8 @@ kernel_do_configure() {
>         # $ scripts/setlocalversion . => +
>         # $ make kernelversion => 2.6.37
>         # $ make kernelrelease => 2.6.37+
> -       touch ${B}/.scmversion ${S}/.scmversion
> +       echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
> +       echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion

This would clobber trees that already patch, or otherwise have the file in place
in their source directory.  A test to see if it already exists and only echo
the variable if no one has already set it in their tree would be safer.

This will still be overridden by CONFIG_LOCALVERSION, so it is safe
from that angle, but also note that it can be inhibited by setting
# CONFIG_LOCALVERSION_AUTO is not set, in your .config and
setting LOCALVERSION, but you probably already knew that!

Cheers,

Bruce

>
>         # Copy defconfig to .config if .config does not exist. This allows
>         # recipes to manage the .config themselves in do_configure_prepend().
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


