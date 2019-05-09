Return-Path: <uol@pengutronix.de>
X-Greylist: delayed 976 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 09 May 2019 13:45:12 UTC
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by mail.openembedded.org (Postfix) with ESMTP id 587327D714
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 13:45:12 +0000 (UTC)
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
	by metis.ext.pengutronix.de with esmtps
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
	(envelope-from <uol@pengutronix.de>) id 1hOj6W-0005lq-F8
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2019 15:28:56 +0200
Received: from uol by dude.hi.pengutronix.de with local (Exim 4.92-RC6)
	(envelope-from <uol@pengutronix.de>) id 1hOj6W-00037V-66
	for openembedded-core@lists.openembedded.org;
	Thu, 09 May 2019 15:28:56 +0200
References: <20190502180916.32114-1-m.felsch@pengutronix.de>
	<20190502180916.32114-4-m.felsch@pengutronix.de>
User-agent: mu4e 1.1.0; emacs 26.1
From: Ulrich =?utf-8?Q?=C3=96lmann?= <u.oelmann@pengutronix.de>
To: openembedded-core@lists.openembedded.org
In-reply-to: <20190502180916.32114-4-m.felsch@pengutronix.de>
Date: Thu, 09 May 2019 15:28:56 +0200
Message-ID: <6rh8a37o4n.fsf@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 3/4] mesa: make gallium swrast target optional
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
X-List-Received-Date: Thu, 09 May 2019 13:45:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi there,

On Thu, May 02 2019 at 20:09 +0200, Marco Felsch <m.felsch@pengutronix.de> =
wrote:
> Most the time we are compiling for embedded targets which have dedicated
> hardware combinations. Setting swrast default on isn't a good solution
> for such devices because if the hardware render node have an issue or
> don't support a special format/request mesa will fallback to the
> software renderer. This will make it harder to debug performace issues.
>
> A better way is to let the user deciced if a software renderer is
> needed e.g. if the system has no hardware renderer or to have such a
> fallback device. This way the user knows that the software renderer is
> enabled.
>
> Upstream-Status: Submitted [openembedded-core@lists.openembedded.org]
>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
> Changelog:
>
> v2:
> - added Upstream-Status line
> - fix leading comma
>
>  meta/recipes-graphics/mesa/mesa.inc | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/=
mesa/mesa.inc
> index 7516a06639..b41d3054c3 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -86,24 +86,27 @@ PACKAGECONFIG[egl] =3D "-Degl=3Dtrue, -Degl=3Dfalse"
>
>  PACKAGECONFIG[etnaviv] =3D ""
>  PACKAGECONFIG[kmsro] =3D ""
> +PACKAGECONFIG[swrast] =3D ""
>
> -GALLIUMDRIVERS =3D "swrast"
> -GALLIUMDRIVERS_append =3D"${@bb.utils.contains('PACKAGECONFIG', 'etnaviv=
', ',etnaviv', '', d)}"
> -GALLIUMDRIVERS_append =3D"${@bb.utils.contains('PACKAGECONFIG', 'kmsro',=
 ',kmsro', '', d)}"
> +GALLIUMDRIVERS =3D ""
> +GALLIUMDRIVERS +=3D"${@bb.utils.contains('PACKAGECONFIG', 'swrast', 'swr=
ast', '', d)}"
> +GALLIUMDRIVERS +=3D"${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', 'et=
naviv', '', d)}"
> +GALLIUMDRIVERS +=3D"${@bb.utils.contains('PACKAGECONFIG', 'kmsro', 'kmsr=
o', '', d)}"
>
>  # radeonsi requires LLVM
> -GALLIUMDRIVERS_LLVM33 =3D "${@bb.utils.contains('PACKAGECONFIG', 'r600',=
 ',radeonsi', '', d)}"
> +GALLIUMDRIVERS_LLVM33 =3D "${@bb.utils.contains('PACKAGECONFIG', 'r600',=
 'radeonsi', '', d)}"
>  GALLIUMDRIVERS_LLVM33_ENABLED =3D "${@oe.utils.version_less_or_equal('ME=
SA_LLVM_RELEASE', '3.2', False, len('${GALLIUMDRIVERS_LLVM33}') > 0, d)}"
> -GALLIUMDRIVERS_LLVM =3D "r300,svga,nouveau${@',${GALLIUMDRIVERS_LLVM33}'=
 if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
> +GALLIUMDRIVERS_LLVM =3D "r300 svga nouveau ${@'${GALLIUMDRIVERS_LLVM33}'=
 if ${GALLIUMDRIVERS_LLVM33_ENABLED} else ''}"
>
>  PACKAGECONFIG[r600] =3D ""
>
> -GALLIUMDRIVERS_append =3D "${@bb.utils.contains('PACKAGECONFIG', 'galliu=
m-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
> -GALLIUMDRIVERS_append =3D "${@bb.utils.contains('PACKAGECONFIG', 'r600',=
 ',r600', '', d)}"
> -GALLIUMDRIVERS_append =3D ",virgl"
> +GALLIUMDRIVERS +=3D "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm=
', '${GALLIUMDRIVERS_LLVM}', '', d)}"
> +GALLIUMDRIVERS +=3D "${@bb.utils.contains('PACKAGECONFIG', 'r600', 'r600=
', '', d)}"
> +GALLIUMDRIVERS +=3D "virgl"
> +GALLIUMDRIVERS_MESON =3D "${@",".join("${GALLIUMDRIVERS}".split())}"

how does it have to look like if I want to go without this auxiliary
variable GALLIUMDRIVERS_MESON and instead insert the Python expression
that generates its content directly into ...

>  # keep --with-gallium-drivers separate, because when only one of gallium=
 versions is enabled, other 2 were adding --without-gallium-drivers
> -PACKAGECONFIG[gallium] =3D "-Dgallium-drivers=3D${GALLIUMDRIVERS}, -Dgal=
lium-drivers=3D''"
> +PACKAGECONFIG[gallium] =3D "-Dgallium-drivers=3D${GALLIUMDRIVERS_MESON},=
 -Dgallium-drivers=3D''"

... the above assignment of PACKAGECONFIG[gallium]?
I can't get it to work - perhaps it is a problem with escaping things?

Best regards
Ulrich


>  MESA_LLVM_RELEASE ?=3D "8.0.0"
>  PACKAGECONFIG[gallium-llvm] =3D "-Dllvm=3Dtrue -Dshared-llvm=3Dtrue, -Dl=
lvm=3Dfalse, llvm${MESA_LLVM_RELEASE} llvm-native \
>                                 ${@'elfutils' if ${GALLIUMDRIVERS_LLVM33_=
ENABLED} else ''}"
--=20
Pengutronix e.K.                           | Ulrich =C3=96lmann            =
   |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

