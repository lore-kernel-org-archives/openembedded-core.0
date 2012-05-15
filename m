Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SUOze-0000nM-5h
	for openembedded-core@lists.openembedded.org;
	Tue, 15 May 2012 23:09:18 +0200
Received: by eaal1 with SMTP id l1so5724eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2012 13:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=+MGqvhLNJCsidyqoGM5NU47ZkmZEpeLTIJ73KduBgSU=;
	b=HYgQbPI26vcCkrvaEyBcJkhaHeE/RReaZxlVWrC1FprGPz7kb6Yi7GmDJ106wF/A8m
	WOqTAbt/C35MUmQ4ScFoO6J3shK9Pl/VDkliu01iHf3nyYkIn31LmmYbp5b0ER43cVnr
	lEv3S8w786yx51V3GEYFHq0N0ymrA56dKJYy3qN7pUbVvKG3q6hXZcN5pLbJapiG0gcN
	wWgZU2w1NPrLhrxlZwxoyh1DSaLUXlcPfr0EUHI+S3OdLuEWL9UQq9oHO4rUUlPOAR+H
	H1ZbKN/2QbKd6JYq3JfkvoeBXEHxxG2rKYQf+DU/deGBkKGYz+bW8loIfbGHZ+arLrdP
	25XA==
Received: by 10.213.121.130 with SMTP id h2mr848046ebr.122.1337115557876; Tue,
	15 May 2012 13:59:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Tue, 15 May 2012 13:58:47 -0700 (PDT)
In-Reply-To: <1a12675b146fbaf56ff3e9505885c5f9f4ecbd26.1337114347.git.otavio@ossystems.com.br>
References: <cover.1337114347.git.otavio@ossystems.com.br>
	<1a12675b146fbaf56ff3e9505885c5f9f4ecbd26.1337114347.git.otavio@ossystems.com.br>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 May 2012 13:58:47 -0700
Message-ID: <CAMKF1sp-_t6J293dnycC6xxWDuregBoXq9ymh41Vz2zNDf_7eA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] kmod: fix installation path of pkgconfig files
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
X-List-Received-Date: Tue, 15 May 2012 21:09:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 15, 2012 at 1:39 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> The pkgconfig files need to be installed in ${libdir} instead of
> ${base_libdir}.
>


Looks ok to me


> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> =C2=A0meta/recipes-kernel/kmod/kmod_git.bb | =C2=A0 10 ++++++++--
> =C2=A01 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/kmod/kmod_git.bb b/meta/recipes-kernel/k=
mod/kmod_git.bb
> index d9c4d8b..11dfe57 100644
> --- a/meta/recipes-kernel/kmod/kmod_git.bb
> +++ b/meta/recipes-kernel/kmod/kmod_git.bb
> @@ -3,7 +3,7 @@
>
> =C2=A0require kmod.inc
>
> -PR =3D "${INC_PR}.1"
> +PR =3D "${INC_PR}.2"
>
> =C2=A0PROVIDES +=3D "module-init-tools-insmod-static module-init-tools-de=
pmod module-init-tools"
> =C2=A0RPROVIDES_${PN} +=3D "module-init-tools-insmod-static module-init-t=
ools-depmod module-init-tools"
> @@ -16,7 +16,8 @@ RCONFLICTS_libkmod2 +=3D "module-init-tools-insmod-stat=
ic module-init-tools-depmod
> =C2=A0# autotools set prefix to /usr, however we want them in /bin and /s=
bin
> =C2=A0bindir =3D "${base_bindir}"
> =C2=A0sbindir =3D "${base_sbindir}"
> -libdir =3D "${base_libdir}"
> +
> +EXTRA_OECONF +=3D "--libdir=3D${base_libdir}"
>
> =C2=A0do_install_append () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -dm755 ${D}${base_bindir}
> @@ -34,6 +35,10 @@ do_install_append () {
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 # install depmod.d file for search/ dir
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -Dm644 "${WORKDIR}/depmod-search.conf=
" "${D}${base_libdir}/depmod.d/search.conf"
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0# fix pkgconfig installation path
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0install -dm755 ${D}${libdir}
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0mv ${D}${base_libdir}/pkgconfig ${D}${libdir=
}
> =C2=A0}
>
> =C2=A0pkg_postinst_kmod() {
> @@ -59,4 +64,5 @@ pkg_prerm_kmod() {
> =C2=A0PACKAGES =3D+ "libkmod"
>
> =C2=A0FILES_libkmod =3D "${base_libdir}/libkmod*${SOLIBS} ${libdir}/libkm=
od*${SOLIBS}"
> +FILES_${PN}-dev +=3D "${base_libdir}/libkmod*${SOLIBSDEV} ${base_libdir}=
/*.la"
> =C2=A0FILES_${PN} +=3D "${base_libdir}/depmod.d ${base_libdir}/modprobe.d=
"
> --
> 1.7.2.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


