Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QofvP-0004yf-N1
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 20:12:11 +0200
Received: by yib18 with SMTP id 18so660432yib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Aug 2011 11:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=0J1GMu6TyIk/Z5a8FrXlr28MqDl1g4N4z4oMEms0QDE=;
	b=Mg3r3PusDpc38uEqKv25Ddg6JzxT2VK/UnzTHzmAn2eBVi/2gzFvZ134/jlIich2IQ
	9GLVjSNr0kIpGHziI0/LO+YpRiF5r/1RamFmhOmXCCHrnxmeal6zpnymt4a2msA2QEhG
	DFvnaOXL8lVMvQeVwEJSJ7bftQMDqgtbVPdZs=
Received: by 10.142.215.10 with SMTP id n10mr216379wfg.290.1312394868109; Wed,
	03 Aug 2011 11:07:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.46.137 with HTTP; Wed, 3 Aug 2011 11:07:18 -0700 (PDT)
In-Reply-To: <1312386236-11826-1-git-send-email-galak@kernel.crashing.org>
References: <1312386236-11826-1-git-send-email-galak@kernel.crashing.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Aug 2011 11:07:18 -0700
Message-ID: <CAMKF1srMkWCjX+18PDwoM5GB4hZwJGepUokfphn55Z29JkL9Xg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tcl: Fix packaging of platform independent files
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
X-List-Received-Date: Wed, 03 Aug 2011 18:12:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 3, 2011 at 8:43 AM, Kumar Gala <galak@kernel.crashing.org> wrot=
e:
> Tcl's doesn't utilize ${baselib} for platform independent files but
> defines it as follows:
>
> TCL_LIBRARY =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D $(prefix)/lib/t=
cl$(VERSION)
>
> Match that so if ${baselib} is not just /lib things work properly.


hmm may be fixing tcl to honour --libdir=3D<dir> to generate TCL_LIBRARY
from configure would be a nice solution

>
> Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
> ---
> =C2=A0meta/recipes-devtools/tcltk/tcl_8.5.9.bb | =C2=A0 =C2=A04 ++--
> =C2=A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-devtools/tcltk/tcl_8.5.9.bb b/meta/recipes-devt=
ools/tcltk/tcl_8.5.9.bb
> index 12e2bd0..2eabb4d 100644
> --- a/meta/recipes-devtools/tcltk/tcl_8.5.9.bb
> +++ b/meta/recipes-devtools/tcltk/tcl_8.5.9.bb
> @@ -11,7 +11,7 @@ LIC_FILES_CHKSUM =3D "file://../license.terms;md5=3Da47=
a9be26d03f925fc1fbd2784f27e11
> =C2=A0 =C2=A0 file://../win/license.terms;md5=3Da47a9be26d03f925fc1fbd278=
4f27e11 \
> =C2=A0 =C2=A0 "
>
> -PR =3D "r0"
> +PR =3D "r1"
>
> =C2=A0BASE_SRC_URI =3D "${SOURCEFORGE_MIRROR}/tcl/tcl${PV}-src.tar.gz \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://tcl-add-so=
name.patch"
> @@ -59,7 +59,7 @@ do_install() {
>
> =C2=A0PACKAGES =3D+ "${PN}-lib"
> =C2=A0FILES_${PN}-lib =3D "${libdir}/libtcl8.5.so*"
> -FILES_${PN} +=3D "${libdir}/tcl8.5"
> +FILES_${PN} +=3D "${prefix}/lib/tcl8.5"
> =C2=A0FILES_${PN}-dev +=3D "${libdir}/tclConfig.sh"
>
> =C2=A0BBCLASSEXTEND =3D "native"
> --
> 1.7.3.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


