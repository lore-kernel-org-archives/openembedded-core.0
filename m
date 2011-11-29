Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RVTnV-0002TZ-M1
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 20:56:57 +0100
Received: by lahe6 with SMTP id e6so1131900lah.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 11:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=fUJNoDqM9IB/Ef7A2NSW1Snj+JKW7a1Zb5e6K4uGRmg=;
	b=PwyYyeneFdW1hoGcdRORYx21MlFQBF7492Y/XOkd+zngVvUOp5dUIxfmPiLK4Wk+XR
	3uC5GB8jzbFzCAh3EFcTOcnIH3MLKWRAmtW3mBK8h+BhqUcgEmfpt9vrbSO0qYXJSD/w
	9WofgJWVVUJ6aJ+O2hKzB1bU0LI1a8rflgCXk=
Received: by 10.152.106.38 with SMTP id gr6mr33212880lab.35.1322596217084;
	Tue, 29 Nov 2011 11:50:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Tue, 29 Nov 2011 11:49:46 -0800 (PST)
In-Reply-To: <1322521031-26849-1-git-send-email-msm@freescale.com>
References: <1322521031-26849-1-git-send-email-msm@freescale.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Nov 2011 11:49:46 -0800
Message-ID: <CAMKF1srHXnMOHHVBsQ_1HrketEJZEcjRnFWgYaK-Zk3kZb-WMQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] eglibc-initial: Fix kernel headers symlink being wrong
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
X-List-Received-Date: Tue, 29 Nov 2011 19:56:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 28, 2011 at 2:57 PM, Matthew McClintock <msm@freescale.com> wro=
te:
> symlinks to the kernel headers were pointing at the wrong
> location when being used from cache. Just copy the kernel
> headers instead
>
> Signed-off-by: Matthew McClintock <msm@freescale.com>
> ---
> Do we need something to depend on the kernel version too since we
> are copying instead of symlinking? Something like:
>
> do_install[vardeps] +=3D "virtual/kernel:do_populate_sysroot"
>
> =C2=A0meta/recipes-core/eglibc/eglibc-common.inc =C2=A0| =C2=A0 =C2=A02 +=
-
> =C2=A0meta/recipes-core/eglibc/eglibc-initial.inc | =C2=A0 =C2=A02 +-
> =C2=A02 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/eglibc/eglibc-common.inc b/meta/recipes-co=
re/eglibc/eglibc-common.inc
> index 4fa6488..6a93968 100644
> --- a/meta/recipes-core/eglibc/eglibc-common.inc
> +++ b/meta/recipes-core/eglibc/eglibc-common.inc
> @@ -3,7 +3,7 @@ DESCRIPTION =3D "Embedded GLIBC (EGLIBC) is a variant of =
the GNU C Library (GLIBC)
> =C2=A0HOMEPAGE =3D "http://www.eglibc.org/home"
> =C2=A0SECTION =3D "libs"
> =C2=A0LICENSE =3D "GPLv2 & LGPLv2.1"
> -INC_PR =3D "r11"
> +INC_PR =3D "r12"
> =C2=A0LIC_FILES_CHKSUM ?=3D "file://LICENSES;md5=3D07a394b26e0902b9ffdec0=
3765209770 \
> =C2=A0 =C2=A0 =C2=A0 file://COPYING;md5=3D393a5ca445f6965873eca0259a17f83=
3 \
> =C2=A0 =C2=A0 =C2=A0 file://posix/rxspencer/COPYRIGHT;md5=3Ddc5485bb394a1=
3b2332ec1c785f5d83a \
> diff --git a/meta/recipes-core/eglibc/eglibc-initial.inc b/meta/recipes-c=
ore/eglibc/eglibc-initial.inc
> index 448f73a..f154d64 100644
> --- a/meta/recipes-core/eglibc/eglibc-initial.inc
> +++ b/meta/recipes-core/eglibc/eglibc-initial.inc
> @@ -48,7 +48,7 @@ do_install () {
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0# add links to linux-libc-headers: gcc-{cross,=
crossdk}-intermediate need this.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0for t in linux asm asm-generic; do
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -s ${STAGING_DIR_TA=
RGET}${includedir}/$t ${D}${includedir}/
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -ar ${STAGING_DIR_T=
ARGET}${includedir}/$t ${D}${includedir}/

thinking a bit more I think just doing ln -sf might be another option
instead of doing ln -s
will avoid copying.

> =C2=A0 =C2=A0 =C2=A0 =C2=A0done
> =C2=A0}
>
> --
> 1.7.6.1
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


