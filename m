Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SIn8p-0005Bs-9F
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 22:30:47 +0200
Received: by lagw12 with SMTP id w12so2559766lag.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 13:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=u2+GPp1633Y6lJWt/lNfK6JQ81YoogHvtKJr/JoL81M=;
	b=NfqOlvD1W3Ia6y6UWC2FGfFWhh1wTGcwcMt2AUh6bwVR0dSTqZVGgH9451cAJUTCus
	gsJt0So7RSa6B1KRGT+x1WcHaO6nFSenZhylpPFnamXnIGgU+zz8an5nHBjojkvaXQFY
	cFgMtRcw2XA1fuERL9u0BXCETWfi5jzvcHKxlIxGb7tOmteyovLK1nCUmqWDpMtiJaLk
	/ufQK1/WaKTrna2aAYfD1SeBvfjGOBg6wW0PoHMy3UF/IBlyA/ciz6rfrGjcObSzvbDm
	X1X0n5KzRW4x6LZOVGvsplDDeneTafPT4WMAiHQaSyvMSkTcKwKQgtB2nvSycPQqhZUP
	NBcw==
Received: by 10.152.146.234 with SMTP id tf10mr2631850lab.31.1334348485147;
	Fri, 13 Apr 2012 13:21:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Fri, 13 Apr 2012 13:20:54 -0700 (PDT)
In-Reply-To: <638c4f827223820ee30ff0820df4179d41acfb60.1334308316.git.liezhi.yang@windriver.com>
References: <cover.1334308316.git.liezhi.yang@windriver.com>
	<638c4f827223820ee30ff0820df4179d41acfb60.1334308316.git.liezhi.yang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 13 Apr 2012 13:20:54 -0700
Message-ID: <CAMKF1soUx3Ov3Z1jZJpn3=hj_u79j5VaTVEG-S27SMQ8icsUWg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] grub 1.99: fix build for gcc 4.7
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
X-List-Received-Date: Fri, 13 Apr 2012 20:30:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 13, 2012 at 2:41 AM, Robert Yang <liezhi.yang@windriver.com> wr=
ote:
> There was an error when build with gcc 4.7 (FC 17 64bit):
> | fs/zfs/zfs.c: In function 'get_filesystem_dnode':
> | fs/zfs/zfs.c:1449:7: error: dereferencing type-punned pointer will brea=
k strict-aliasing rules [-Werror=3Dstrict-aliasing]
> ......
> cc1: all warnings being treated as errors
>
> While compare the compile command between gcc 4.4.4 and gcc 4.7.0, they
> are the same (both of them have -Wall and -Werror), it seems that gcc
> 4.7.0 has changed its algorithm for the strict aliasing check, but I
> didn't find the related information from its release note.
>
> Add "-fno-strict-aliasing" to gcc's option would fix the problem, this
> would disable the optimization for strict-aliasing.

This seems a bit more than whats needed. You could try adding
-Wno-error=3Dstrict-aliasing to CFLAGS

on another note. I do not see this failing with gcc-4.7(target compiler) he=
re
when I build grub for qemux86 so I am a bit puzzled

>
> [YOCTO #2291]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
> =C2=A0meta/recipes-bsp/grub/grub_1.99.bb | =C2=A0 =C2=A07 ++++++-
> =C2=A01 files changed, 6 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-bsp/grub/grub_1.99.bb b/meta/recipes-bsp/grub/g=
rub_1.99.bb
> index ac66e83..f45b634 100644
> --- a/meta/recipes-bsp/grub/grub_1.99.bb
> +++ b/meta/recipes-bsp/grub/grub_1.99.bb
> @@ -12,7 +12,7 @@ LICENSE =3D "GPLv3"
> =C2=A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d=
47fae504"
>
> =C2=A0RDEPENDS_${PN} =3D "diffutils freetype"
> -PR =3D "r3"
> +PR =3D "r4"
>
> =C2=A0SRC_URI =3D "ftp://ftp.gnu.org/gnu/grub/grub-${PV}.tar.gz \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://grub-install.in.patch \
> @@ -29,6 +29,11 @@ inherit gettext
> =C2=A0EXTRA_OECONF =3D "--with-platform=3Dpc --disable-grub-mkfont --targ=
et=3D${TARGET_ARCH} --program-prefix=3D"""
>
> =C2=A0do_configure() {
> + =C2=A0 =C2=A0# Fix build error for gcc 4.7
> + =C2=A0 =C2=A0echo "CPPFLAGS_DEFAULT +=3D -fno-strict-aliasing" >> conf/=
Makefile.common
> + =C2=A0 =C2=A0# Also modify Makefile.in, we can remove this when we can =
run autoreconf
> + =C2=A0 =C2=A0sed -i 's/^CPPFLAGS_DEFAULT =3D \(.*\)/CPPFLAGS_DEFAULT =
=3D -fno-strict-aliasing \1/' \
> + =C2=A0 =C2=A0 =C2=A0 Makefile.in grub-core/Makefile.in
> =C2=A0 =C2=A0 oe_runconf
> =C2=A0}
>
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


