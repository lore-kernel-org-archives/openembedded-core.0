Return-Path: <paul@pbarker.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D9DE9A048
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 15:13:55 +0000 (UTC)
Received: from fout-a8-smtp.messagingengine.com (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15790.1771514032460549375
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 07:13:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=VrHhYNqz;
 dkim=pass header.i=@messagingengine.com header.s=fm3 header.b=HcYF4MEt;
 spf=pass (domain: pbarker.dev, ip: 103.168.172.151, mailfrom: paul@pbarker.dev)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 86948EC053D;
	Thu, 19 Feb 2026 10:13:51 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 19 Feb 2026 10:13:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1771514031; x=1771600431; bh=ELiacLSDkN
	WST4Y8j6G6aZKG0t29Jpeag6KzvdHw6QE=; b=VrHhYNqz1OGKAs9QGztePM5PtX
	ww5NGfNk/LMYYTqsd/tXq4I91jLgrcDOs8MhpK6YQRi346HoS30Dj3KSedtGLikB
	vdxzb5qkLwXyHj3nHXVfYgXk/uI1tPqCHX50+JpgUKXDrkDdHsfMuzC1nIQLcnCb
	RoHbug5855ikiSh0rmFjcrkSLUJGEbAjPFn5aqF2XufpPV3JyhD3OI+ZNk2y+mdG
	Fftqq+VnkLuqunREzo4+Q9NIp70MGgoWqujLpChgq+aa+sDlJdMU49Um2DQrTZ/P
	luY+dhQWI5OXEKyF9510EVM6BljJCf6ka0lauoD4qFYp/I1x85lLrAsDOTrg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1771514031; x=1771600431; bh=ELiacLSDkNWST4Y8j6G6aZKG0t29Jpeag6K
	zvdHw6QE=; b=HcYF4MEt3wfc2NIOmTjxVmajNrpGLxsRwcc6IPMTcIqWHItk+Ln
	G9nkUnRE7z91Rxu+27/XOqXgN0Vb/0Gx876++RPVKIIF5Ta+W4qY0x2dFxnR9H+i
	uO5bN+BOL3CnNp2idc3m6HP2dk4Wfv99MTuOLiIAkFAO5kH2YQxiNCF6ebQOV7Sd
	fCAwRjo7amYReCb2a9F5BSiw8ts+uxe3ugyiEkcl2dIs39OM/Wh66hIVy5JXnUwB
	Oe00i/FVFuIzBDyVbnjtAkSvKypqYFuOQ+2qqv6Zv9x+eVGzV+UdtkJewB0gLtFC
	ViIdytsOv/KgXEJaXd3pBn1MIkBQesKZWaA==
X-ME-Sender: <xms:ryiXaTqFffvWhDkAK92uOvxlLagWgJluA83z79G8beIWyDfHHYYpmQ>
    <xme:ryiXaTp1L9A6GWCbuZp4fdh7Pib3EChHvIAyX6zD0Pd2wy2Xitdpn7dUZRMfT4727
    4pMLPMV5HOgzYbxZlu36bh7xZRNREcsM7ZeMDL2U6iYNTzCkoeRlh8>
X-ME-Received: <xmr:ryiXad37R9lu7ghsuzeNSpW30JALo51fmBVmTR0f3FT0P3Kw7czaFSgfPqth25gjky1E8OFIerDXMCfkIqjYNAL2H-mEBCVfQlKo84QzRtKe>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvvdehkeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpefkuffhvfffjghftggfggesghdtreertd
    erjeenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhesphgsrghrkhgvrhdr
    uggvvheqnecuggftrfgrthhtvghrnhepleevheetgfeltdekleegleeitdefudelieefgf
    etvefgvdeugeeiveeltdevgeelnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdr
    ohhrghdpghhnuhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvhdpnhgspghrtghpthhtohep
    vddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhonhihsgestgihsggvrhhnvg
    htihgtshdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehl
    ihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-ME-Proxy: <xmx:ryiXaSAUhS1L3DoYOMNhrQf4hlVkFeHSD99xALyWvOCz7OVzuRCD6w>
    <xmx:ryiXaVfPBCmpuDvi8N4CnqBZnkFaOXOIhoNC7SpcruPr9DGk4gDfOQ>
    <xmx:ryiXaXhdIP1SWNQrNiZbUqn-uY_F4GhSygRCZmEePfxm_2ormPeEvg>
    <xmx:ryiXadpO9vAzvXT44Y0fwG9WImxcgQtSujf1dD7Bz-18LiA-m8H-AQ>
    <xmx:ryiXaUs3FngpURGWxCnVquzmF_jFj3LnSKO57qZtWim7eRYGmBkIubnZ>
Feedback-ID: i51494658:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Feb 2026 10:13:50 -0500 (EST)
Message-ID: <63299bf7a75a50a7b9c7a669a83a117fd014dae3.camel@pbarker.dev>
Subject: Re: [OE-core] [PATCH v2] texinfo: Fix gcc 15 compile errors
From: Paul Barker <paul@pbarker.dev>
To: tonyb@cybernetics.com, openembedded-core@lists.openembedded.org
Date: Thu, 19 Feb 2026 15:13:47 +0000
In-Reply-To: <cd8dabb4-fc3b-426e-8dea-c8c83e87f3f4@cybernetics.com>
References: <cd8dabb4-fc3b-426e-8dea-c8c83e87f3f4@cybernetics.com>
Autocrypt: addr=paul@pbarker.dev; prefer-encrypt=mutual;
 keydata=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
 LUewj8JVy0aJsGTwI4invl
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-8/2sSo8KGardAwCmVBx7"
User-Agent: Evolution 3.52.3-0ubuntu1.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 15:13:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231430


--=-8/2sSo8KGardAwCmVBx7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2026-02-16 at 11:40 -0500, Tony Battersby via
lists.openembedded.org wrote:
> gcc 15 switches the default from -std=3Dgnu17 to -std=3Dgnu23, which caus=
es
> multiple errors compiling texinfo:
>=20
> texinfo-7.2/info/terminal.c:164:7:
>   error: too many arguments to function 'tputs'; expected 0, have 3
> etc.
>=20
> My patch to fix the issue has been accepted upstream; backport it since
> texinfo 7.2 is still the latest release.
>=20
> Signed-off-by: Tony Battersby <tonyb@cybernetics.com>

I wonder why you're seeing this error and we're not seeing it on the
autobuilder... termcap.h is provided by ncurses, which is listed in both
DEPENDS and DEPENDS:class-native in the recipe, so in theory you
shouldn't see the case where that file is not available during the
texinfo build.

Is the error seen when building texinfo for the target or
texinfo-native? And is there anything unique in terms of host distro,
local.conf, layers, etc that you think might be triggering this?

> ---
>=20
> This needs to be applied to openembedded-core master and backported to
> whinlatter.
>=20
>=20
>  ...l.c-use-modern-prototypes-for-curses.patch | 35 +++++++++++++++++++
>  meta/recipes-extended/texinfo/texinfo_7.2.bb  |  1 +
>  2 files changed, 36 insertions(+)
>  create mode 100644 meta/recipes-extended/texinfo/texinfo/0004-info-termi=
nal.c-use-modern-prototypes-for-curses.patch
>=20
> diff --git a/meta/recipes-extended/texinfo/texinfo/0004-info-terminal.c-u=
se-modern-prototypes-for-curses.patch b/meta/recipes-extended/texinfo/texin=
fo/0004-info-terminal.c-use-modern-prototypes-for-curses.patch
> new file mode 100644
> index 0000000000..4af4a0eb51
> --- /dev/null
> +++ b/meta/recipes-extended/texinfo/texinfo/0004-info-terminal.c-use-mode=
rn-prototypes-for-curses.patch
> @@ -0,0 +1,35 @@
> +From 20ca4b10bd5f3aac55ff6bdfbb0c8debdb5cf380 Mon Sep 17 00:00:00 2001
> +From: Tony Battersby <tonyb@cybernetics.com>
> +Date: Sat, 14 Feb 2026 16:56:19 +0000
> +Subject: [PATCH] * info/terminal.c: use modern prototypes for curses
> +
> +This fixes compile errors with -std=3Dgnu23 (which is the default
> +with gcc 15) on systems that do not have termcap.h.
> +
> +Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/texinf=
o.git/commit/?id=3D20ca4b10bd5f3aac55ff6bdfbb0c8debdb5cf380]
> +
> +Signed-off-by: Tony Battersby <tonyb@cybernetics.com>
> +---
> +diff --git a/info/terminal.c b/info/terminal.c
> +index b1eb0ffd13..273a9ca48d 100644
> +--- a/info/terminal.c
> ++++ b/info/terminal.c
> +@@ -44,9 +44,12 @@
> + char *BC, *UP;
> + char PC;      /* Pad character */
> + short ospeed; /* Terminal output baud rate */
> +-extern int tgetnum (), tgetflag (), tgetent ();
> +-extern char *tgetstr (), *tgoto ();
> +-extern int tputs ();
> ++extern int tgetnum (char *id);
> ++extern int tgetflag (char *id);
> ++extern int tgetent (char *bp, const char *name);
> ++extern char *tgetstr (char *id, char **area);
> ++extern char *tgoto (const char *cap, int col, int row);
> ++extern int tputs (const char *str, int affcnt, int (*putc)(int));
> + #endif /* not HAVE_NCURSES_TERMCAP_H */
> +=20
> + /* Function "hooks".  If you make one of these point to a function, tha=
t
> +--=20
> +2.43.0
> +
> diff --git a/meta/recipes-extended/texinfo/texinfo_7.2.bb b/meta/recipes-=
extended/texinfo/texinfo_7.2.bb
> index 784f67f65b..20f316b8bf 100644
> --- a/meta/recipes-extended/texinfo/texinfo_7.2.bb
> +++ b/meta/recipes-extended/texinfo/texinfo_7.2.bb
> @@ -32,6 +32,7 @@ SRC_URI =3D "${GNU_MIRROR}/texinfo/${BP}.tar.gz \
>             file://0001-texinfo-several-changes-to-build-without-zlib-and=
-nc.patch \
>             file://0001-Makefile.am-do-not-build-manpages.patch \
>             ${TARGET_PATCH} \
> +           file://0004-info-terminal.c-use-modern-prototypes-for-curses.=
patch \
>             "
> =20
>  SRC_URI[sha256sum] =3D "e86de7dfef6b352aa1bf647de3a6213d1567c70129eccbf8=
977706d9c91919c8"

--=20
Paul Barker


--=-8/2sSo8KGardAwCmVBx7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iIcEABYKAC8WIQSzjPXf5Y1BDWhU2iCrY1Tsnbr0bgUCaZcoqxEccGF1bEBwYmFy
a2VyLmRldgAKCRCrY1Tsnbr0bkV+AP4h0pPuRnVdUbLrDRXtCQYhjIPjLyRh6p90
KxOL+QSj4QD/SqbK+L860SeftIPCSgzjgGcJTihptbgxrimbo7WnHQY=
=92Gk
-----END PGP SIGNATURE-----

--=-8/2sSo8KGardAwCmVBx7--

