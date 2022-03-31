Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A249C433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 14:09:14 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.7509.1648735752206405967
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Mar 2022 07:09:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=HlAAD1p4;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1648735752;
  x=1680271752;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=6u1lNww7QKhRo74mfg3/ABk/xh78clZ0EdbUiMphqu0=;
  b=HlAAD1p4VtiZOSnbgYcgLtzC/wyZ81TBgBi8orwx/LeYkkbfqCMz2NAw
   t5XsqR/ceM2rwN0Pi2CHMyAz9D1owo4+Wt4LC9o08CKwBRfwCbHq8FVAa
   7Az/be5PuKn8aiHsr5J9ODKKZ+G3djZqTIr6mjqafZoPiLgZ2NmJxm1sh
   ADi6u4gSloYxxnLoM3mjsJg7H7aZ2JCR24iIavjvcftbYn+dJmXFyWVv4
   /f0nItIPlP4ZCqRitauW1DBp/C26vA1aWPxiKxkpCoINlbPSZarM60ptb
   PM2lEkJVVFh96UEG/LgX03NpBY2qhbU/9paCv3Ely7x/TTcjHaguip6dT
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH RFC] mirrors: Switch glibc and binutils to use
 shallow mirror tarballs
Thread-Topic: [OE-core] [PATCH RFC] mirrors: Switch glibc and binutils to use
 shallow mirror tarballs
Thread-Index: AQHYRDEFA25bCmZHUEuJezq1iB6jfKzZhvtA
Date: Thu, 31 Mar 2022 14:09:10 +0000
Message-ID: <5ad842968691474f8671615154122c87@axis.com>
References: <20220330122344.1507091-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220330122344.1507091-1-richard.purdie@linuxfoundation.org>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Mar 2022 14:09:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163835

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Richard Purdie
> Sent: den 30 mars 2022 14:24
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH RFC] mirrors: Switch glibc and binutils to use =
shallow mirror tarballs
>=20
> These two repositories are large and overload our downloads server as a
> premirror but the recipes are easier to maintain as git urls. Compromise
> and use shallow clones for them.
>=20
> In order to be effective, we need premirror entries on where to find
> the shallow mirror tarballs.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/mirrors.bbclass | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
> index 37dc449ade7..ffdccff5fb4 100644
> --- a/meta/classes/mirrors.bbclass
> +++ b/meta/classes/mirrors.bbclass
> @@ -76,3 +76,14 @@ git://git.gnome.org/.* git://gitlab.gnome.org/GNOME/PA=
TH;protocol=3Dhttps \
>  git://.*/.*                   git://HOST/PATH;protocol=3Dhttps \
>  git://.*/.*                   git://HOST/git/PATH;protocol=3Dhttps \
>  "
> +
> +# Switch glibc and binutils recipes to use shallow clones as they're lar=
ge and this
> +# improves user experience whilst allowing the flexibility of git urls i=
n the recipes
> +BB_GIT_SHALLOW:pn-binutils =3D "1"
> +BB_GIT_SHALLOW:pn-binutils-cross-${TARGET_ARCH} =3D "1"
> +BB_GIT_SHALLOW:pn-binutils-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D =
"1"
> +BB_GIT_SHALLOW:pn-binutils-cross-testsuite =3D "1"
> +BB_GIT_SHALLOW:pn-binutils-crosssdk-${SDK_SYS} =3D "1"
> +BB_GIT_SHALLOW:pn-glibc =3D "1"
> +PREMIRRORS +=3D "git://sourceware.org/git/glibc.git https://downloads.yo=
ctoproject.org/mirror/sources/ \
> +              git://sourceware.org/git/binutils-gdb.git https://download=
s.yoctoproject.org/mirror/sources/"

Please use PREMIRRORS:append here, or you will wipe away any=20
default configuration of PREMIRRORS defined using "?=3D".

> --
> 2.32.0

//Peter


