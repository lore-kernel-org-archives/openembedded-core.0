Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RVCAX-0003ne-V4
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 02:07:34 +0100
Received: by lahe6 with SMTP id e6so770356lah.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2011 17:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=/MuvroRIu8B46Mq0B+FUHYpsOfEJqEsKKv6TWA1w9ps=;
	b=nJjNdAbXDmN/9/8Rk7Ua+gBkZL/tERSHexLWFQTkLnwtAd4eGn59/aqOLVmUlodO5i
	zwuu+scIzIUZFuxss3wdMEhdEr0UvbZLE4v/kKbK1V6gie20nsU1BR0ZVSsylUg1MV/5
	Z0cWGXCnbuofgke9aXrhYOGdhaMSHhGPScauo=
Received: by 10.152.134.77 with SMTP id pi13mr30339055lab.21.1322528455098;
	Mon, 28 Nov 2011 17:00:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Mon, 28 Nov 2011 17:00:24 -0800 (PST)
In-Reply-To: <1322521031-26849-1-git-send-email-msm@freescale.com>
References: <1322521031-26849-1-git-send-email-msm@freescale.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 28 Nov 2011 17:00:24 -0800
Message-ID: <CAMKF1speQmWnt697F-9pQPN1xMLhkPW-XPyA6czX+ySNR5CxMg@mail.gmail.com>
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
X-List-Received-Date: Tue, 29 Nov 2011 01:07:34 -0000
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
> =C2=A0 =C2=A0 =C2=A0 =C2=A0done
> =C2=A0}


these were cross sysroot symlinks. imo copying is
the safer think to do here.

Acked-by: Khem Raj <raj.khem@gmail.com>


