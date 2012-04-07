Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SGQlu-000755-Ur
	for openembedded-core@lists.openembedded.org;
	Sat, 07 Apr 2012 10:13:23 +0200
Received: by lbky2 with SMTP id y2so957548lbk.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Apr 2012 01:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=5jAM7p+VgRSB5Jmln9pifBSlM8ru6iWcDfzo81wF3qg=;
	b=Kb+HqrobhJlYC9gjPaf0vSGq01JTSZ/s+p7LqFFpj6E9QzY2qp3oq/MmzUledfbnG3
	txwi/ar3q7y9fEGz6gYNhrXuD/aC0xqqi3t2Fbsge9D0tr/DAV4EItiMfED0Xb8TaAmC
	mov/OHA7G9XliS6C8ZEN2azcLRBxpP6RFt/Am0LcRhAGhQxIr4Xb+ONGQ3TbRIex5WhP
	T46ZKWwtjFy60klk8m+2sdvBYkyedNr3ZQ/E/NcgyzQdZdu0NkYYQ+JcePE1GxIxyNvd
	Vp4IBdS4/3ylIov4NZWiBhf6S1aQ5Zo3iAuzvEvL3CsjPr6P1OG9+pbzyaxDx4v0jJhw
	ilMQ==
Received: by 10.152.131.74 with SMTP id ok10mr1141745lab.17.1333785848916;
	Sat, 07 Apr 2012 01:04:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Sat, 7 Apr 2012 01:03:38 -0700 (PDT)
In-Reply-To: <9a2e9d9285851fb5ed61eb8fb8946cd7756fa5f4.1333481624.git.mark.hatle@windriver.com>
References: <cover.1333481624.git.mark.hatle@windriver.com>
	<9a2e9d9285851fb5ed61eb8fb8946cd7756fa5f4.1333481624.git.mark.hatle@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 7 Apr 2012 01:03:38 -0700
Message-ID: <CAMKF1spdbLArzr195SEraA5e2q9CmDQD+VnO0AG7mNNjd0cOtQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/7] binutils: Inform binutils that armv5e really is valid!
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
X-List-Received-Date: Sat, 07 Apr 2012 08:13:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 3, 2012 at 12:47 PM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> A comment in the binutils sources indicate that it should support all of =
the
> -march=3D parameters that gcc supports. =C2=A0The tune validations noted =
that
> gas failed on -march=3Darmv5e.
>
> It is not yet clear to me if this patch belongs upstream or not.

We should fix gcc instead so it emits -march=3Darmv5te if gcc was given
-march=3Darmv5e when calling out assembler. -marmv5e is deprecated in
gas. This wont fly


>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
> =C2=A0.../binutils/binutils/binutils-armv5e.patch =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 20 ++++++++++++++++++++
> =C2=A0meta/recipes-devtools/binutils/binutils_2.22.bb =C2=A0 =C2=A0| =C2=
=A0 =C2=A03 ++-
> =C2=A02 files changed, 22 insertions(+), 1 deletions(-)
> =C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils/binutils=
-armv5e.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils/binutils-armv5e.patc=
h b/meta/recipes-devtools/binutils/binutils/binutils-armv5e.patch
> new file mode 100644
> index 0000000..4ac1a9c
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/binutils-armv5e.patch
> @@ -0,0 +1,20 @@
> +Add the armv5e architecture to binutils
> +
> +Binutils has a comment that indicates it is supposed to match gcc for al=
l of
> +the support "-march=3D" settings, but it was lacking the armv5e setting.=
 =C2=A0This
> +was a simple way to add it, as thumb instructions shouldn't be generated=
 by
> +the compiler anyway.
> +
> +Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> +
> +diff -urN binutils-2.22.orig/gas/config/tc-arm.c binutils-2.22/gas/confi=
g/tc-arm.c
> +--- binutils-2.22.orig/gas/config/tc-arm.c =C2=A0 =C2=A0 2011-11-21 03:2=
9:31.000000000 -0600
> ++++ binutils-2.22/gas/config/tc-arm.c =C2=A02012-04-03 12:07:42.23015876=
0 -0500
> +@@ -22990,6 +22990,7 @@
> + =C2=A0 {"armv4t", =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARM_ARCH_V4T, =C2=
=A0 =C2=A0FPU_ARCH_FPA},
> + =C2=A0 {"armv4txm", =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0ARM_ARCH_V4TxM, =C2=A0FPU_ARCH_FPA},
> + =C2=A0 {"armv5", =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARM_ARCH_V5, =C2=A0=
 =C2=A0 FPU_ARCH_VFP},
> ++ =C2=A0{"armv5e", =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARM_ARCH_V5TE, =C2=
=A0 FPU_ARCH_VFP},
> + =C2=A0 {"armv5t", =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARM_ARCH_V5T, =C2=
=A0 =C2=A0FPU_ARCH_VFP},
> + =C2=A0 {"armv5txm", =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0ARM_ARCH_V5TxM, =C2=A0FPU_ARCH_VFP},
> + =C2=A0 {"armv5te", =C2=A0 =C2=A0 =C2=A0 =C2=A0 ARM_ARCH_V5TE, =C2=A0 FP=
U_ARCH_VFP},
> diff --git a/meta/recipes-devtools/binutils/binutils_2.22.bb b/meta/recip=
es-devtools/binutils/binutils_2.22.bb
> index 8b058fe..d6d19a1 100644
> --- a/meta/recipes-devtools/binutils/binutils_2.22.bb
> +++ b/meta/recipes-devtools/binutils/binutils_2.22.bb
> @@ -1,6 +1,6 @@
> =C2=A0require binutils.inc
>
> -PR =3D "r5"
> +PR =3D "r6"
>
> =C2=A0LIC_FILES_CHKSUM=3D"\
> =C2=A0 =C2=A0 file://src-release;endline=3D17;md5=3D4830a9ef968f3b18dd5e9=
f2c00db2d35\
> @@ -30,6 +30,7 @@ SRC_URI =3D "\
> =C2=A0 =C2=A0 =C2=A0file://libtool-rpath-fix.patch \
> =C2=A0 =C2=A0 =C2=A0file://clone-shadow.patch \
> =C2=A0 =C2=A0 =C2=A0file://binutils-powerpc-e5500.patch \
> + =C2=A0 =C2=A0 file://binutils-armv5e.patch \
> =C2=A0 =C2=A0 =C2=A0"
>
> =C2=A0SRC_URI[md5sum] =3D "ee0f10756c84979622b992a4a61ea3f5"
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


