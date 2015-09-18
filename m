Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id B706776E2E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 02:11:13 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3nHJYY2jNbz3hj3C;
	Fri, 18 Sep 2015 04:11:13 +0200 (CEST)
X-Auth-Info: wm/O4I0ytji+rkDiR8zYSGPiuPAthHctwSukJypYEls=
Received: from chi.localnet (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp-auth.mnet-online.de (Postfix) with ESMTPSA id 3nHJYY0qjZzvhTZ; 
	Fri, 18 Sep 2015 04:11:13 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Sep 2015 04:11:25 +0200
User-Agent: KMail/1.13.7 (Linux/3.14-2-amd64; KDE/4.13.1; x86_64; ; )
References: <1442500317-9064-1-git-send-email-marex@denx.de>
	<201509180348.30142.marex@denx.de>
	<D2512C01-1DA3-4423-8E4E-D91FEEB4F694@gmail.com>
In-Reply-To: <D2512C01-1DA3-4423-8E4E-D91FEEB4F694@gmail.com>
MIME-Version: 1.0
Message-Id: <201509180411.25944.marex@denx.de>
Cc: lftan@altera.com, waltergoossens@home.nl,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 18 Sep 2015 02:11:15 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Friday, September 18, 2015 at 03:51:30 AM, Khem Raj wrote:
> > On Sep 17, 2015, at 6:48 PM, Marek Vasut <marex@denx.de> wrote:
> >=20
> > On Friday, September 18, 2015 at 03:43:50 AM, Khem Raj wrote:
> >>> On Sep 17, 2015, at 6:41 PM, Marek Vasut <marex@denx.de> wrote:
> >>>=20
> >>> On Friday, September 18, 2015 at 03:40:11 AM, Khem Raj wrote:
> >>>=20
> >>> Hi!
> >>>=20
> >>>>> On Sep 17, 2015, at 7:31 AM, Marek Vasut <marex@denx.de> wrote:
> >>>>>=20
> >>>>> Make nios2 kernel depend on libgcc.
> >>>>>=20
> >>>>> In arch/nios2/Makefile, it adds LIBGCC to libs-y:
> >>>>>=20
> >>>>> LIBGCC          :=3D $(shell $(CC) $(KBUILD_CFLAGS)
> >>>>> -print-libgcc-file-name) libs-y          +=3D $(LIBGCC)
> >>>>>=20
> >>>>> In file Makefile in top directory, libs-y is assigned to to var
> >>>>> KBUILD_VMLINUX_MAIN. It uses script link-vmlinux.sh to link
> >>>>> vmlinux.o, and when execute function vmlinux_link() in
> >>>>> link-vmlinux.sh, KBUILD_VMLINUX_MAIN is passed to ${LD}.
> >>>>>=20
> >>>>> If build without libgcc, the value of LIBGCC is just libgcc.a witho=
ut
> >>>>>=20
> >>>>> parent directory. linux-yocto fails to build:
> >>>>> |   LD      vmlinux.o
> >>>>> |=20
> >>>>> | nios2-poky-linux-ld.bfd: cannot find libgcc.a: No such file or
> >>>>> | directory
> >>>>>=20
> >>>>> Add libgcc to nios2 kernel dependency.
> >>>>>=20
> >>>>> Signed-off-by: Marek Vasut <marex@denx.de>
> >>>>> ---
> >>>>> meta/recipes-kernel/linux/linux-yocto.inc | 4 ++++
> >>>>> 1 file changed, 4 insertions(+)
> >>>>>=20
> >>>>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
> >>>>> b/meta/recipes-kernel/linux/linux-yocto.inc index 3b41a61..81ffa24
> >>>>> 100644
> >>>>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> >>>>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> >>>>> @@ -11,6 +11,10 @@ DEPENDS_append_aarch64 =3D " libgcc"
> >>>>> KERNEL_CC_append_aarch64 =3D " ${TOOLCHAIN_OPTIONS}"
> >>>>> KERNEL_LD_append_aarch64 =3D " ${TOOLCHAIN_OPTIONS}"
> >>>>>=20
> >>>>> +DEPENDS_append_nios2 =3D " libgcc"
> >>>>> +KERNEL_CC_append_nios2 =3D " ${TOOLCHAIN_OPTIONS}"
> >>>>> +KERNEL_LD_append_nios2 =3D " ${TOOLCHAIN_OPTIONS}=E2=80=9D
> >>>>=20
> >>>> Please try bitbake virtual/kernel build from scratch with this chang=
e.
> >>>=20
> >>> What do you mean, does it break anything or what should I expect ?
> >>=20
> >> I am not sure if there is a race, with this dependency between libgcc
> >> and gcc-cross hopefully there is not but this will prove it.
> >=20
> > Wouldn't arm64 explode in the same way then ? I'll set up the build
> > shortly.
>=20
> yes it would

Build of virtual/kernel just finished, all good, no issues.

Best regards,
Marek Vasut

