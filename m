Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1T4Fic-00048P-8d
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 20:31:54 +0200
Received: by qcad10 with SMTP id d10so856380qca.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 11:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=vfZE75aKjlxJZht6+anfat/KnQkoXEumDwVO5eqr6So=;
	b=nCMmELycJMRoAw9UOST54sbI5nUHxGtCrPrBCLQg03wYozxGOi4PX0C/taNlGTbUZ8
	6rHcZ4xv2l8BJP//uvg99aQQQKSUF1Aj3wnZ68rEQdKxjDniz2KqqXt8O2y0YH1+2oYN
	399DzSaMbJAGNCwZu6z625w5/TEN+70wUwFFcQ3YgXC0zWCrHO1CIlZQLIajSYKh7IcP
	WwTJl/tSE6sKdxzlLbbvVdG0lerKARCSWUL0PBYJchX+QeTRID2CTbi3ciS/+OC+N64H
	DWSIfUbEVLehLRkZNzbQ21RUkfV3w+Cwe3rUNjGhAzgErB+4jGeP/h9ZKLTJ57S1vfqj
	NTvQ==
MIME-Version: 1.0
Received: by 10.224.178.133 with SMTP id bm5mr12186571qab.1.1345659588585;
	Wed, 22 Aug 2012 11:19:48 -0700 (PDT)
Received: by 10.229.247.198 with HTTP; Wed, 22 Aug 2012 11:19:48 -0700 (PDT)
In-Reply-To: <1345658390-19692-3-git-send-email-raj.khem@gmail.com>
References: <1345658390-19692-1-git-send-email-raj.khem@gmail.com>
	<1345658390-19692-3-git-send-email-raj.khem@gmail.com>
Date: Wed, 22 Aug 2012 14:19:48 -0400
Message-ID: <CADkTA4OZbVVXexU=dUF5wv+AS2gBQNPpfKzfgda2k2V0Of6t0g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] kernel.bbclass, module-base.bbclass: Use CC to form KERNEL_CC
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
X-List-Received-Date: Wed, 22 Aug 2012 18:31:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 22, 2012 at 1:59 PM, Khem Raj <raj.khem@gmail.com> wrote:
> kernel compiler is not special and we currently have it so
> we want to pass -march and -mtune options as CFLAGS to kernel
> build so that compiler picks the right subarch flags when
> compiling assembly files in particular. Otherwise defaults
> are chosen which may not be right in many case e.g. when
> compiling kernel for collie machine we should use arch=armv4
> but it uses toolchain/as defaults which is armv5te
>
> in some case e.g. thumb1 we know that kernel can not be compiled
> in thumb1 mode so we can provide that information e.g. -marm
> option through KERNEL_HOST_CC_ARCH variable as we do now

Having just fought with this a few months ago myself, I know that I ended up
needing to override KERNEL_CC completely, vs using any of the existing
variables and options. So I don't see a problem with streamlining the variables.

Some random questions below:

>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/classes/kernel.bbclass      |    9 +++------
>  meta/classes/module-base.bbclass |    9 +++------
>  2 files changed, 6 insertions(+), 12 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index f34e632..766f345 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -1,7 +1,7 @@
>  inherit linux-kernel-base module_strip
>
>  PROVIDES += "virtual/kernel"
> -DEPENDS += "virtual/${TARGET_PREFIX}gcc kmod-native virtual/${TARGET_PREFIX}gcc${KERNEL_CCSUFFIX} update-modules"
> +DEPENDS += "virtual/${TARGET_PREFIX}gcc kmod-native update-modules"
>
>  # we include gcc above, we dont need virtual/libc
>  INHIBIT_DEFAULT_DEPS = "1"
> @@ -37,9 +37,6 @@ KERNEL_PRIORITY ?= "${@int(d.getVar('PV',1).split('-')[0].split('+')[0].split('.
>
>  KERNEL_RELEASE ?= "${KERNEL_VERSION}"
>
> -KERNEL_CCSUFFIX ?= ""
> -KERNEL_LDSUFFIX ?= ""
> -
>  # Set TARGET_??_KERNEL_ARCH in the machine .conf to set architecture
>  # specific options necessary for building the kernel and modules.
>  #FIXME: should be this: TARGET_CC_KERNEL_ARCH ?= "${TARGET_CC_ARCH}"
> @@ -48,8 +45,8 @@ HOST_CC_KERNEL_ARCH ?= "${TARGET_CC_KERNEL_ARCH}"
>  TARGET_LD_KERNEL_ARCH ?= ""
>  HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
>
> -KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc${KERNEL_CCSUFFIX} ${HOST_CC_KERNEL_ARCH}${TOOLCHAIN_OPTIONS}"
> -KERNEL_LD = "${HOST_PREFIX}ld${KERNEL_LDSUFFIX} ${HOST_LD_KERNEL_ARCH}${TOOLCHAIN_OPTIONS}"
> +KERNEL_CC = "${CC} ${HOST_CC_KERNEL_ARCH}"
> +KERNEL_LD = "${LD} ${HOST_LD_KERNEL_ARCH}"

I haven't looked at CC recently, I assume it can contain ccache within
it's variable
definition if a person is inclined to use ccache ?

>
>  # Where built kernel lies in the kernel tree
>  KERNEL_OUTPUT ?= "arch/${ARCH}/boot/${KERNEL_IMAGETYPE}"
> diff --git a/meta/classes/module-base.bbclass b/meta/classes/module-base.bbclass
> index 9379bf8..72a0bff 100644
> --- a/meta/classes/module-base.bbclass
> +++ b/meta/classes/module-base.bbclass
> @@ -7,9 +7,6 @@ export CROSS_COMPILE = "${TARGET_PREFIX}"
>
>  export KERNEL_VERSION = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-abiversion')}"
>  KERNEL_OBJECT_SUFFIX = ".ko"
> -KERNEL_CCSUFFIX = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-ccsuffix')}"
> -KERNEL_LDSUFFIX = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-ldsuffix')}"
> -KERNEL_ARSUFFIX = "${@base_read_file('${STAGING_KERNEL_DIR}/kernel-arsuffix')}"
>
>  # Set TARGET_??_KERNEL_ARCH in the machine .conf to set architecture
>  # specific options necessary for building the kernel and modules.
> @@ -20,9 +17,9 @@ HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
>  TARGET_AR_KERNEL_ARCH ?= ""
>  HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
>
> -KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc${KERNEL_CCSUFFIX} ${HOST_CC_KERNEL_ARCH}"
> -KERNEL_LD = "${HOST_PREFIX}ld${KERNEL_LDSUFFIX} ${HOST_LD_KERNEL_ARCH}"
> -KERNEL_AR = "${HOST_PREFIX}ar${KERNEL_ARSUFFIX} ${HOST_AR_KERNEL_ARCH}"
> +KERNEL_CC = "${CC} ${HOST_CC_KERNEL_ARCH}"
> +KERNEL_LD = "${LD} ${HOST_LD_KERNEL_ARCH}"
> +KERNEL_AR = "${AR} ${HOST_AR_KERNEL_ARCH}"

When I was working through my build issues, I wondered if the
module-base and kernel.bbclass
compile definitions could be unified to a single location (say
kernel-arch.bbclass). I know
that I found an issue with it, and didn't complete my work, but can
you see a way that
we could have a single definition vs the two ? These look to be
exactly the same now :)

Cheers,

Bruce

>
>  # kernel modules are generally machine specific
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


