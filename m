Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 269CD75F3A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 01:40:13 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so35201901pac.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 18:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=iEeipkVmKpW5XPehZiJ75Brw1EnBfjt/XRyVYP4Vi38=;
	b=Sf2rLH1bOIEpGipgXFPPqpkDd6uq1VNMk9WdCD8+gl6J3ULH+jo2KSlzyXBHf4CJb5
	MoLEXKqPW3YEOduPMIMNZ4U0XPd4kzmzmr7OxqEMmwQ2RUDAGlvhBh9AU+IxBLunREhg
	+XpyHXyZhtH0L8gghKbd9W66tvfw/vNQPpWsykxThtE3fLFFeohH8GUyDk9NQZIBC955
	AE+Pro5IWz9PoiS3Ya100zdOEkAQyaDgUE6+UVNCQ24n64pbhxiVL5M3y0HbAv98y1yO
	E6RT1HTmiU1/gOYIQwdbRBqzanAQLt+cCI528OPJl+tlC3WZaDTtkYPk1GbKL3/5srgP
	0HPQ==
X-Received: by 10.68.137.161 with SMTP id qj1mr4110994pbb.14.1442540413783;
	Thu, 17 Sep 2015 18:40:13 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:1079:2f51:a2f9:e171?
	([2601:646:8601:4580:1079:2f51:a2f9:e171])
	by smtp.gmail.com with ESMTPSA id
	dh1sm5646489pbd.49.2015.09.17.18.40.12
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 17 Sep 2015 18:40:12 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1442500317-9064-4-git-send-email-marex@denx.de>
Date: Thu, 17 Sep 2015 18:40:11 -0700
Message-Id: <02670CD0-39E3-4C94-9FB6-CFC19B3AB6E6@gmail.com>
References: <1442500317-9064-1-git-send-email-marex@denx.de>
	<1442500317-9064-4-git-send-email-marex@denx.de>
To: Marek Vasut <marex@denx.de>
X-Mailer: Apple Mail (2.3094)
Cc: lftan@altera.com, waltergoossens@home.nl,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/8] linux-yocto: depend on libgcc for nios2
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
X-List-Received-Date: Fri, 18 Sep 2015 01:40:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Sep 17, 2015, at 7:31 AM, Marek Vasut <marex@denx.de> wrote:
>=20
> Make nios2 kernel depend on libgcc.
>=20
> In arch/nios2/Makefile, it adds LIBGCC to libs-y:
>=20
> LIBGCC          :=3D $(shell $(CC) $(KBUILD_CFLAGS) =
-print-libgcc-file-name)
> libs-y          +=3D $(LIBGCC)
>=20
> In file Makefile in top directory, libs-y is assigned to to var
> KBUILD_VMLINUX_MAIN. It uses script link-vmlinux.sh to link vmlinux.o,
> and when execute function vmlinux_link() in link-vmlinux.sh,
> KBUILD_VMLINUX_MAIN is passed to ${LD}.
>=20
> If build without libgcc, the value of LIBGCC is just libgcc.a without
> parent directory. linux-yocto fails to build:
>=20
> |   LD      vmlinux.o
> | nios2-poky-linux-ld.bfd: cannot find libgcc.a: No such file or =
directory
>=20
> Add libgcc to nios2 kernel dependency.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> meta/recipes-kernel/linux/linux-yocto.inc | 4 ++++
> 1 file changed, 4 insertions(+)
>=20
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc =
b/meta/recipes-kernel/linux/linux-yocto.inc
> index 3b41a61..81ffa24 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -11,6 +11,10 @@ DEPENDS_append_aarch64 =3D " libgcc"
> KERNEL_CC_append_aarch64 =3D " ${TOOLCHAIN_OPTIONS}"
> KERNEL_LD_append_aarch64 =3D " ${TOOLCHAIN_OPTIONS}"
>=20
> +DEPENDS_append_nios2 =3D " libgcc"
> +KERNEL_CC_append_nios2 =3D " ${TOOLCHAIN_OPTIONS}"
> +KERNEL_LD_append_nios2 =3D " ${TOOLCHAIN_OPTIONS}=E2=80=9D

Please try bitbake virtual/kernel build from scratch with this change.

> +

> # A KMACHINE is the mapping of a yocto $MACHINE to what is built
> # by the kernel. This is typically the branch that should be built,
> # and it can be specific to the machine or shared
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


