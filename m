Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RiuMV-0001KD-I6
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 21:56:36 +0100
Received: by lami14 with SMTP id i14so291555lam.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2012 12:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=iNki181262wFoXk0gHPGjzBgnx9GGuGrAhSxUA/9lj0=;
	b=ue8exevqhKMjgVsEtGwyiLkYFYOGIXRO3rabefVeVyMoEV2SO4EQsfkZsItPpxX67I
	Dm1CYbnWLIb3g+rtFIJt4Pm0sr5Mq3a9anA1tHiKlGaLOqk6/evRVeVPj91dX9R8/90J
	NnDTNeZO9juuri88OwFSpLYVt7uUCy4w23eNQ=
Received: by 10.112.36.8 with SMTP id m8mr719099lbj.54.1325796551303; Thu, 05
	Jan 2012 12:49:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.115.1 with HTTP; Thu, 5 Jan 2012 12:48:40 -0800 (PST)
In-Reply-To: <521a1d1e78e4e797ce9c1787c83d8e0b2020281e.1325725256.git.nitin.a.kamble@intel.com>
References: <cover.1325725256.git.nitin.a.kamble@intel.com>
	<aa69250b08b446ad0408357587a0271a66684f12.1325725256.git.nitin.a.kamble@intel.com>
	<521a1d1e78e4e797ce9c1787c83d8e0b2020281e.1325725256.git.nitin.a.kamble@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Jan 2012 12:48:40 -0800
Message-ID: <CAMKF1srE2FO8iY0x0UvzYCKEosWV79VomhkovmLUUjXgU19dew@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] libxxf86dga: fix compilation with x32 toolchain
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
X-List-Received-Date: Thu, 05 Jan 2012 20:56:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 4, 2012 at 5:02 PM,  <nitin.a.kamble@intel.com> wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> Fix type conversion for x32. For x32 the off_t is 64bit and pointers are
> 32bit.
> so the conversion of pointer to off_t was resulting into this error:
>
> | XF86DGA2.c:931:24: error: cast from pointer to integer of different
> size [-Werror=3Dpointer-to-int-cast]
> | cc1: some warnings being treated as errors
> |
> | make[2]: *** [XF86DGA2.lo] Error 1
>
> Fixed it by typecasting pointer into unsigned long 1st and then again
> typecasting unsigned long to off_t.
>
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
> =C2=A0.../libxxf86dga-1.1.2_fix_for_x32.patch =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0| =C2=A0 30 ++++++++++++++++++++
> =C2=A0.../recipes-graphics/xorg-lib/libxxf86dga_1.1.2.bb | =C2=A0 =C2=A05=
 ++-
> =C2=A02 files changed, 34 insertions(+), 1 deletions(-)
> =C2=A0create mode 100644 meta/recipes-graphics/xorg-lib/libxxf86dga/libxx=
f86dga-1.1.2_fix_for_x32.patch
>
> diff --git a/meta/recipes-graphics/xorg-lib/libxxf86dga/libxxf86dga-1.1.2=
_fix_for_x32.patch b/meta/recipes-graphics/xorg-lib/libxxf86dga/libxxf86dga=
-1.1.2_fix_for_x32.patch
> new file mode 100644
> index 0000000..30692ad
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-lib/libxxf86dga/libxxf86dga-1.1.2_fix_fo=
r_x32.patch
> @@ -0,0 +1,30 @@
> +Upstream-Status: pending
> +
> +Fix type conversion for x32. For x32 the off_t is 64bit and pointers are=
 32bit.
> +so the conversion of pointer to off_t was resulting into this error:
> +
> +| XF86DGA2.c:931:24: error: cast from pointer to integer of different si=
ze [-Werror=3Dpointer-to-int-cast]
> +| cc1: some warnings being treated as errors
> +|
> +| make[2]: *** [XF86DGA2.lo] Error 1
> +
> +Fixed it by typecasting pointer into unsigned long 1st and then again ty=
pecasting
> +unsigned long to off_t.

where is pointer here ?
http://cvsweb.xfree86.org/cvsweb/xc/lib/Xxf86dga/XF86DGA2.c?rev=3D1.30&cont=
ent-type=3Dtext/vnd.viewcvs-markup
shows that base is of type mmapOffset which is

#if !defined(_LP64) && defined(_FILE_OFFSET_BITS) && (_FILE_OFFSET_BITS =3D=
=3D 64)
typedef unsigned long long mmapOffset;
#else
typedef unsigned long      mmapOffset;
#endif

and off_t is typedef'ed to long int

> +
> +Signed-Off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> +2012/01/04
> +
> +
> +Index: libXxf86dga-1.1.2/src/XF86DGA2.c
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- libXxf86dga-1.1.2.orig/src/XF86DGA2.c =C2=A0 =C2=A0 =C2=A02010-10-06=
 21:17:11.000000000 -0700
> ++++ libXxf86dga-1.1.2/src/XF86DGA2.c =C2=A0 2012-01-04 14:21:36.27597117=
2 -0800
> +@@ -928,7 +928,7 @@ DGAMapPhysical(
> + =C2=A0 =C2=A0 if ((pMap->fd =3D open(name, O_RDWR)) < 0)
> + =C2=A0 =C2=A0 =C2=A0 return False;
> + =C2=A0 =C2=A0 pMap->virtual =3D mmap(NULL, size, PROT_READ | PROT_WRITE=
,
> +- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0MAP_FILE | MAP_SHARED, pMap->fd, (off_t)base);
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0MAP_FILE | MAP_SHARED, pMap->fd, (off_t)(unsigned long)base);
> + =C2=A0 =C2=A0 if (pMap->virtual =3D=3D (void *)-1)
> + =C2=A0 =C2=A0 =C2=A0 return False;
> + =C2=A0 =C2=A0 mprotect(pMap->virtual, size, PROT_READ | PROT_WRITE);
> diff --git a/meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.2.bb b/meta/r=
ecipes-graphics/xorg-lib/libxxf86dga_1.1.2.bb
> index 8e777c3..9a1c96f 100644
> --- a/meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.2.bb
> +++ b/meta/recipes-graphics/xorg-lib/libxxf86dga_1.1.2.bb
> @@ -8,7 +8,10 @@ allows relative mouse reporting, et al. =C2=A0It is main=
ly used by games and \
> =C2=A0emulators for games."
>
> =C2=A0DEPENDS +=3D "libxext xf86dgaproto"
> -PR =3D "r1"
> +PR =3D "r2"
> +
> +SRC_URI +=3D "file://libxxf86dga-1.1.2_fix_for_x32.patch"
> +
> =C2=A0PE =3D "1"
>
> =C2=A0XORG_PN =3D "libXxf86dga"
> --
> 1.7.6.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


