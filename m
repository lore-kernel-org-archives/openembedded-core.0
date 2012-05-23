Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1SXAkr-0000tn-1v
	for openembedded-core@lists.openembedded.org;
	Wed, 23 May 2012 14:33:29 +0200
Received: by werg55 with SMTP id g55so4974626wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2012 05:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=y/1qCwnCzbvTqHSQUOIk6pMU5QKCYlwUVB/lkmJaDa8=;
	b=fEvESjl02EEGLIgwx4wM5+CbAXhUzn4aK4/DURNoK638P6/RuxcfiaxGwaVAKmEFCe
	vubqdDTfWdPUrxawYhkpRBU47LfFf8cXC3NSNdkA+AbQrRvIJRda7gTlDsaSVSnzg+Pb
	hw8S2g7SbIBoL46VDLcfgGsNho/9l1/6BznitThBKyU9+si+aBHXXYtyU/fRUxdOiHOA
	4392pgfy2K/EabeFdGjc1zHAz4EXYCEuC9bxY35v+yCa01vgUFZZHyXkl3YV2XmwnTfo
	VUHds7gr9WFW0zQqLRH6ipemWzkg3GkHuuUUIou6FLsUsgQazmWH0FFQxXuU01U00OI4
	Xhig==
MIME-Version: 1.0
Received: by 10.180.106.7 with SMTP id gq7mr45788342wib.4.1337775799350; Wed,
	23 May 2012 05:23:19 -0700 (PDT)
Received: by 10.223.74.16 with HTTP; Wed, 23 May 2012 05:23:19 -0700 (PDT)
In-Reply-To: <1337775586-32611-1-git-send-email-s.stirtzel@googlemail.com>
References: <1337775586-32611-1-git-send-email-s.stirtzel@googlemail.com>
Date: Wed, 23 May 2012 14:23:19 +0200
Message-ID: <CAGiJk9eMgQFSbrzL8a+ZevxQy2Bpqo75Jx4H8rQ9ff-H7J338A@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] valgrind: Enable valgrind for omap3
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
X-List-Received-Date: Wed, 23 May 2012 12:33:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2012/5/23 Samuel Stirtzel <s.stirtzel@googlemail.com>:
> Valgrind supports the armv7 architecture, this patch allows users of the =
omap3 soc family to build and use valgrind
>
> This patch was run-tested on a Gumstix Overo (armv7a cortex-a8)
> * The test consisted of running valgrinds memcheck (memory leakage detect=
ion),
> * and callgrind (profiling) on a Qt 4 application
>
> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> ---
> =C2=A0meta/recipes-devtools/valgrind/valgrind_3.7.0.bb | =C2=A0 =C2=A05 +=
+++-
> =C2=A01 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb b/meta/reci=
pes-devtools/valgrind/valgrind_3.7.0.bb
> index d7c7b24..0311d75 100644
> --- a/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
> +++ b/meta/recipes-devtools/valgrind/valgrind_3.7.0.bb
> @@ -22,14 +22,17 @@ SRC_URI =3D "http://www.valgrind.org/downloads/valgri=
nd-${PV}.tar.bz2 \
> =C2=A0SRC_URI[md5sum] =3D "a855fda56edf05614f099dca316d1775"
> =C2=A0SRC_URI[sha256sum] =3D "5d62c0330f1481fe2c593249192fa68ff454c19c343=
43978cc9ce91aa324cbf6"
>
> -COMPATIBLE_HOST =3D '(i.86|x86_64|powerpc|powerpc64).*-linux'
> +COMPATIBLE_HOST =3D '(i.86|x86_64|powerpc|powerpc64|arm).*-linux'

Oops forgot to change this line back, v2 coming soon.

> +COMPATIBLE_HOST_omap3 =3D 'arm.*-linux'
>
> =C2=A0inherit autotools
>
> =C2=A0EXTRA_OECONF =3D "--enable-tls"
> +EXTRA_OECONF_omap3 =3D "--enable-tls -host=3Darmv7-none-linux-gnueabi"
> =C2=A0EXTRA_OEMAKE =3D "-w"
> =C2=A0PARALLEL_MAKE =3D ""
>
> =C2=A0FILES_${PN}-dbg +=3D "${libdir}/${PN}/*/.debug/*"
> =C2=A0RRECOMMENDS_${PN}_powerpc +=3D "${TCLIBC}-dbg"
> =C2=A0RRECOMMENDS_${PN}_powerpc64 +=3D "${TCLIBC}-dbg"
> +RRECOMMENDS_${PN}_omap3 +=3D "libc6-dbg"
> \ No newline at end of file
> --
> 1.7.5.4
>



--=20
Regards
Samuel


