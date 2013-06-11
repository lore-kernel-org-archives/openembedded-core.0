Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 41A1E6A99A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 22:35:00 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id m14so6548355eaj.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 15:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0bMKSyFcjcep2L0engBtrCJ4/pboqGOWIUqAUCGzTd8=;
	b=YhOKCVSpc4y32s8GwKoIA95aOKdrjU8beDTD99arSE2cW5i3rKuIJETMj5hkDehFvf
	nGepWZavb/UaLwSUz+Him/k6qZbLoFw2VbMEaWztlgbdukXCfnC4uzxvHGk8Vyft1a+D
	F4DXvKAwAKf9Mu/3K29nET9EX7aDUjp0IXB86wtRw6EmD+gcF0HYmDZmydSxCi4fThO7
	9IocwX5Zp4iLRaKhgNcfK9N8xzABi6Gb844u7DCvHQk2+0XnrdzNgecw13ogIUyp9k/s
	Iza+9tEkmuMuCenQwwrc4hhWKyZRcnFJHldbm74DL0cwz6cQceeqy7KWqR/EWfXKsrTY
	693Q==
X-Received: by 10.14.215.197 with SMTP id e45mr18299540eep.130.1370990100694; 
	Tue, 11 Jun 2013 15:35:00 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	u7sm33068957eef.14.2013.06.11.15.34.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 11 Jun 2013 15:35:00 -0700 (PDT)
Date: Wed, 12 Jun 2013 00:35:24 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20130611223524.GM3233@jama>
References: <1370987869-19041-1-git-send-email-raj.khem@gmail.com>
	<1370989876-20531-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1370989876-20531-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [RFC][PATCH] gcc-4.8: Backport fix for ICE triggered in pixman
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
X-List-Received-Date: Tue, 11 Jun 2013 22:35:00 -0000
X-Groupsio-MsgNum: 40506
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pP0ycGQONqsnqIMP"
Content-Disposition: inline

--pP0ycGQONqsnqIMP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2013 at 12:31:16AM +0200, Martin Jansa wrote:
> * http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D57329

Only RFC, because world build is still running to confirm that it
doesn't introduce new issues and that it indeed fixes pixman build for
xscalete.

>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/recipes-devtools/gcc/gcc-4.8.inc              |  1 +
>  .../gcc/gcc-4.8/0036-PR-target-56102.patch         | 83 ++++++++++++++++=
++++++
>  2 files changed, 84 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0036-PR-target-5610=
2.patch
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtool=
s/gcc/gcc-4.8.inc
> index 6664f1c..bfdb766 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.8.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
> @@ -65,6 +65,7 @@ SRC_URI =3D "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.=
bz2 \
>  	   file://0033-gcc-armv4-pass-fix-v4bx-to-linker-to-support-EABI.patch \
>  	   file://0034-Use-the-multilib-config-files-from-B-instead-of-usin.pat=
ch \
>  	   file://0035-wcast-qual-PR-55383.patch \
> +	   file://0036-PR-target-56102.patch \
>  	   file://gcc-4.8-PR56797.patch \
>  	   file://gcc-4.8-build-args.patch \
>  	  "
> diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0036-PR-target-56102.patch=
 b/meta/recipes-devtools/gcc/gcc-4.8/0036-PR-target-56102.patch
> new file mode 100644
> index 0000000..a9498fc
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.8/0036-PR-target-56102.patch
> @@ -0,0 +1,83 @@
> +From fa049b3584a1cc36c250205e3d5841e6a40ff677 Mon Sep 17 00:00:00 2001
> +From: amker <amker@138bc75d-0d04-0410-961f-82ee72b054a4>
> +Date: Wed, 27 Mar 2013 08:16:54 +0000
> +Subject: [PATCH] PR target/56102
> +
> +* config/arm/arm.c (thumb1_rtx_costs, thumb1_size_rtx_costs): Fix rtx co=
sts for SET/ASHIFT/ASHIFTRT/LSHIFTRT/ROTATERT patterns with mult-word mode.
> +
> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@197155 138bc75d-0d04-041=
0-961f-82ee72b054a4
> +
> +Upstream-Status: Backport
> +http://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D57329
> +
> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> +---
> + gcc/config/arm/arm.c | 17 ++++++++++++++---
> + 1 file changed, 14 insertions(+), 3 deletions(-)
> +
> +diff --git a/gcc/config/arm/arm.c b/gcc/config/arm/arm.c
> +index 460d333..edf850d 100644
> +--- a/gcc/config/arm/arm.c
> ++++ b/gcc/config/arm/arm.c
> +@@ -7094,7 +7094,7 @@ static inline int
> + thumb1_rtx_costs (rtx x, enum rtx_code code, enum rtx_code outer)
> + {
> +   enum machine_mode mode =3D GET_MODE (x);
> +-  int total;
> ++  int total, words;
> +=20
> +   switch (code)
> +     {
> +@@ -7102,6 +7102,8 @@ thumb1_rtx_costs (rtx x, enum rtx_code code, enum =
rtx_code outer)
> +     case ASHIFTRT:
> +     case LSHIFTRT:
> +     case ROTATERT:
> ++      return (mode =3D=3D SImode) ? COSTS_N_INSNS (1) : COSTS_N_INSNS (=
2);
> ++
> +     case PLUS:
> +     case MINUS:
> +     case COMPARE:
> +@@ -7125,7 +7127,10 @@ thumb1_rtx_costs (rtx x, enum rtx_code code, enum=
 rtx_code outer)
> +       return COSTS_N_INSNS (1) + 16;
> +=20
> +     case SET:
> +-      return (COSTS_N_INSNS (1)
> ++      /* A SET doesn't have a mode, so let's look at the SET_DEST to get
> ++	 the mode.  */
> ++      words =3D ARM_NUM_INTS (GET_MODE_SIZE (GET_MODE (SET_DEST (x))));
> ++      return (COSTS_N_INSNS (words)
> + 	      + 4 * ((MEM_P (SET_SRC (x)))
> + 		     + MEM_P (SET_DEST (x))));
> +=20
> +@@ -7822,6 +7827,7 @@ static inline int
> + thumb1_size_rtx_costs (rtx x, enum rtx_code code, enum rtx_code outer)
> + {
> +   enum machine_mode mode =3D GET_MODE (x);
> ++  int words;
> +=20
> +   switch (code)
> +     {
> +@@ -7829,6 +7835,8 @@ thumb1_size_rtx_costs (rtx x, enum rtx_code code, =
enum rtx_code outer)
> +     case ASHIFTRT:
> +     case LSHIFTRT:
> +     case ROTATERT:
> ++      return (mode =3D=3D SImode) ? COSTS_N_INSNS (1) : COSTS_N_INSNS (=
2);
> ++
> +     case PLUS:
> +     case MINUS:
> +     case COMPARE:
> +@@ -7847,7 +7855,10 @@ thumb1_size_rtx_costs (rtx x, enum rtx_code code,=
 enum rtx_code outer)
> +       return COSTS_N_INSNS (1);
> +=20
> +     case SET:
> +-      return (COSTS_N_INSNS (1)
> ++      /* A SET doesn't have a mode, so let's look at the SET_DEST to get
> ++	 the mode.  */
> ++      words =3D ARM_NUM_INTS (GET_MODE_SIZE (GET_MODE (SET_DEST (x))));
> ++      return (COSTS_N_INSNS (words)
> +               + 4 * ((MEM_P (SET_SRC (x)))
> +                      + MEM_P (SET_DEST (x))));
> +=20
> +--=20
> +1.8.2.1
> +
> --=20
> 1.8.2.1
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pP0ycGQONqsnqIMP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlG3piwACgkQN1Ujt2V2gBwafACeLtx68W2zBo6vGxOgOH5/z46R
ZnkAn07bKVxQOxw+N8SM7PRWLE12zQWt
=Usd2
-----END PGP SIGNATURE-----

--pP0ycGQONqsnqIMP--
