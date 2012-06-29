Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SkTNQ-0003H1-1S
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 07:04:16 +0200
Received: by eaal1 with SMTP id l1so1119245eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 21:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=CNYUh5vtzEhgR5dUD/xMEw6Yq4/j7zs2vt9VbrXxpeA=;
	b=bIMxfM2CVNpDwiM8h2btpk9ZwOmsdHHIzOe4rjpvpTc/9ZdpGvLK6GuvrFveKK1wLb
	c7R6Je0j8k10pHmEy9zRV6mDyGPo0NbItGnKBb8vmDzDkzLbGrYTmdIj4ZyR/x444yLu
	of4+vb1XooZ9WQurjXAuU1acW3Tdbcsz6SkkGpPTfd+nqeyLGBUWAb+8SySxYqv99wM0
	8+OpP8pGh8vv57dqX9jzVxBrDMUytqixi/R7pBDkhfn5GoKCkIyMnonitv4QQP1BdSNl
	kZa3H2LLLSJBMJ9M8yYAnRiMQjPBW2hFzK1pm0MRfhtJUAVPeG6sdiWeVgMafJhQRbDL
	iKng==
Received: by 10.14.37.76 with SMTP id x52mr97000eea.102.1340945600706; Thu, 28
	Jun 2012 21:53:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Thu, 28 Jun 2012 21:52:50 -0700 (PDT)
In-Reply-To: <5b45f71fee3c593e5420a5a9b36ba947c429a397.1340942930.git.dvhart@linux.intel.com>
References: <cover.1340942930.git.dvhart@linux.intel.com>
	<4263ffefaa6f3b0069bc41c0f7578d36717edcfc.1340942930.git.dvhart@linux.intel.com>
	<5b45f71fee3c593e5420a5a9b36ba947c429a397.1340942930.git.dvhart@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Jun 2012 21:52:50 -0700
Message-ID: <CAMKF1sopV66-Rohk5HYMygcSamkcxDgOM8bfruF7VWR0ZAXpnQ@mail.gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Poky <poky@yoctoproject.org>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] kernel: Add kernel-headers package for target module build
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 29 Jun 2012 05:04:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 28, 2012 at 9:18 PM, Darren Hart <dvhart@linux.intel.com> wrote=
:
> [YOCTO #1614]
>
> Add a kernel-headers package to kernel.bbclass. This packages
> effectively packages what was already built and kept in sysroots for
> building modules with bitbake. Making this available on the target
> requires removing some additional host binaries.
>
> Move the location to /usr/src/kernel-headers.
>
> Before use on the target, the user will need to:
>
> =C2=A0 =C2=A0# cd /usr/src/kernel-headers
> =C2=A0 =C2=A0# make scripts
>

IMO using kernel-headers may not be representing the package contents
correctly since I believe it contains more than headers. Its probably
kernel-dev or external-lkm-dev or somesuch.

> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> CC: Bruce Ashfield <bruce.ashfield@windriver.com>
> CC: Tom Zanussi <tom.zanussi@intel.com>
> CC: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0meta/classes/kernel.bbclass | =C2=A0 11 +++++++----
> =C2=A0meta/conf/bitbake.conf =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A02 files changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 31e633b..b82af74 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -130,7 +130,7 @@ kernel_do_install() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# Support for external module building - creat=
e a minimal copy of the
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# kernel source tree.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0#
> - =C2=A0 =C2=A0 =C2=A0 kerneldir=3D${D}/kernel
> + =C2=A0 =C2=A0 =C2=A0 kerneldir=3D${D}/usr/src/kernel-headers
> =C2=A0 =C2=A0 =C2=A0 =C2=A0install -d $kerneldir
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0#
> @@ -183,10 +183,11 @@ kernel_do_install() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp arch/powerpc/li=
b/crtsavres.o $kerneldir/arch/powerpc/lib/crtsavres.o
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
>
> - =C2=A0 =C2=A0 =C2=A0 # Remove the following binaries which cause strip =
errors
> + =C2=A0 =C2=A0 =C2=A0 # Remove the following binaries which cause strip =
or arch QA errors
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# during do_package for cross-compiled platfor=
ms
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bin_files=3D"arch/powerpc/boot/addnote arch/po=
werpc/boot/hack-coff \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arch/powe=
rpc/boot/mktree"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0arch/powe=
rpc/boot/mktree scripts/kconfig/zconf.tab.o \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0scripts/k=
config/conf.o"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0for entry in $bin_files; do
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f $kerneldir/$=
entry
> =C2=A0 =C2=A0 =C2=A0 =C2=A0done
> @@ -247,13 +248,15 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
>
> =C2=A0# kernel-base becomes kernel-${KERNEL_VERSION}
> =C2=A0# kernel-image becomes kernel-image-${KERNEL_VERISON}
> -PACKAGES =3D "kernel kernel-base kernel-vmlinux kernel-image kernel-dev =
kernel-misc"
> +PACKAGES =3D "kernel kernel-base kernel-vmlinux kernel-image kernel-dev =
\
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel-misc kernel-headers"
> =C2=A0FILES =3D ""
> =C2=A0FILES_kernel-image =3D "/boot/${KERNEL_IMAGETYPE}*"
> =C2=A0FILES_kernel-dev =3D "/boot/System.map* /boot/Module.symvers* /boot=
/config*"
> =C2=A0FILES_kernel-vmlinux =3D "/boot/vmlinux*"
> =C2=A0# misc is a package to contain files we need in staging
> =C2=A0FILES_kernel-misc =3D "/kernel/include/config /kernel/scripts /kern=
el/drivers/crypto /kernel/drivers/media"
> +FILES_kernel-headers =3D "/usr/src/kernel-headers"
> =C2=A0RDEPENDS_kernel =3D "kernel-base"
> =C2=A0# Allow machines to override this dependency if kernel image files =
are
> =C2=A0# not wanted in images as standard
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 9b26580..9f3abee 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -380,7 +380,7 @@ SDKPATHNATIVE =3D "${SDKPATH}/sysroots/${SDK_SYS}"
> =C2=A0##################################################################
>
> =C2=A0OLDEST_KERNEL =3D "2.6.16"
> -STAGING_KERNEL_DIR =3D "${STAGING_DIR_HOST}/kernel"
> +STAGING_KERNEL_DIR =3D "${STAGING_DIR_HOST}/usr/src/kernel-headers"
>
> =C2=A0##################################################################
> =C2=A0# Specific image creation and rootfs population info.
> --
> 1.7.10.2
>


