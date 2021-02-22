Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.86.1614015648894205730
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 09:40:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Wf/1owD5;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1614015649;
  x=1645551649;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=aYCcQcun6iG+aLn4WyzN1c88XdfnrI65S8BdBdP/jQk=;
  b=Wf/1owD5512pL9XmT99KqBYnTGFlDJKq9tV/dd1LfmPqO7f12CZKeuos
   y+2kaZhFi4+aiLx0Um1DNHc/3o/Zgs/hFBq4B/c0HsU577SHc2G3qdbcN
   ZnFqNLcs33NRIkTVcuNj0Yzo/u1cPlTALzctNVIfTwrvjKdRulE7+jMsy
   20QOgLOrGl3HppMqqIP6lmD4KTiqFPNj1dM2UNN1Y2GGpEtWsxobCxCDn
   3ZErOY979FQ9CawELOXGb2mEQI0tuOykQSkmolm9AlPWf8BscDkUhDxn1
   bMngQgKSsLukhRcQbXzWJTx/gFIJSS67q8+bz8S6X1GUNWahtMbiYbuYJ
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/7] rsync: Fix a file sorting determinism issue
Thread-Topic: [OE-core] [PATCH 1/7] rsync: Fix a file sorting determinism
 issue
Thread-Index: AQHXCJ9fxK8iRabjmESfgQGhC3ppRapkcLBA
Date: Mon, 22 Feb 2021 17:40:46 +0000
Message-ID: <5de61c9b67bd4008a8786244e93bdcfe@XBOX03.axis.com>
References: <20210221221717.3714714-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20210221221717.3714714-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Richard Purdie
> Sent: den 21 februari 2021 23:17
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 1/7] rsync: Fix a file sorting determinism issu=
e
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../rsync/files/determism.patch               | 28 +++++++++++++++++++
>  meta/recipes-devtools/rsync/rsync_3.2.3.bb    |  1 +
>  2 files changed, 29 insertions(+)
>  create mode 100644 meta/recipes-devtools/rsync/files/determism.patch
>=20
> diff --git a/meta/recipes-devtools/rsync/files/determism.patch b/meta/rec=
ipes-devtools/rsync/files/determism.patch
> new file mode 100644
> index 00000000000..53a4ca75058
> --- /dev/null
> +++ b/meta/recipes-devtools/rsync/files/determism.patch
> @@ -0,0 +1,28 @@
> +The Makefile calls awk on a "*.c" glob. The results of this glob are sor=
ted
> +but the order depends on the locale settings, particularly whether
> +"util.c" and "util2.c" sort before or after each other. In en_US.UTF-8
> +they sort one way, in C, they sort the other. The sorting order changes
> +the output binaries. The behaviour also changes dependning on whether
> +SHELL (/bin/sh) is dash or bash.
> +
> +Specify a C locale setting to be deterministic.
> +
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +Upstream-Status: Pending
> +
> +Index: rsync-3.2.3/Makefile.in
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +--- rsync-3.2.3.orig/Makefile.in
> ++++ rsync-3.2.3/Makefile.in
> +@@ -26,6 +26,11 @@ MKDIR_P=3D@MKDIR_P@
> + VPATH=3D$(srcdir)
> + SHELL=3D/bin/sh
> +
> ++# We use globbing in commands, need to be deterministic
> ++unexport LC_ALL
> ++LC_COLLATE=3DC
> ++export LC_COLLATE

Rather than using a patch, can't this be achieved by doing:

export LC_COLLATE=3DC

or:

export LC_ALL=3DC

in the recipe?

> ++
> + .SUFFIXES:
> + .SUFFIXES: .c .o
> +
> diff --git a/meta/recipes-devtools/rsync/rsync_3.2.3.bb b/meta/recipes-de=
vtools/rsync/rsync_3.2.3.bb
> index b7205e5bdef..c08f93884f5 100644
> --- a/meta/recipes-devtools/rsync/rsync_3.2.3.bb
> +++ b/meta/recipes-devtools/rsync/rsync_3.2.3.bb
> @@ -12,6 +12,7 @@ DEPENDS =3D "popt"
>  SRC_URI =3D "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
>             file://rsyncd.conf \
>             file://makefile-no-rebuild.patch \
> +           file://determism.patch \
>             "
>=20
>  SRC_URI[sha256sum] =3D "becc3c504ceea499f4167a260040ccf4d9f2ef9499ad5683=
c179a697146ce50e"
> --
> 2.27.0

//Peter

