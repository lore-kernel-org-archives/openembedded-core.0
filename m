Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB57C433F5
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 16:02:58 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.13061.1644336176259315138
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 08:02:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=VTNyjZEc;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1644336176;
  x=1675872176;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=hPcIYNXR7pOd1Ut0kU90tS3/8fwZq4FAAkbLnCDNJ84=;
  b=VTNyjZEcFbhWVll5a8SjRgL0i1wXAj1xOFCA6tudbbiIH12xdXQUpYE8
   MjyHxHJJrMnc8xTS6P472kNCz4VC25LbTlU1hqxk76WitzE2nTfeVzIl3
   v8Z1EI8spi2oIzaSiffm5Bm9VfKrdEzycf4xoc6ILpIbF3YIGtnKnXC/y
   WYE9lu6en13WqIkWkLQT743eao76oNzLi4dKKiDgGNKagZRXHVXbIG8ge
   PzHpoXie/JOIXGzoCVYwh8GfLibyWrSlaQdjW3mkg/PH9lVe0lJS86x7N
   +gwS87lbeR2Offq1YGF5qK1tRqRcHSxoD3CfpUCSJLMTyttexS4EKP0mR
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Saul Wold <Saul.Wold@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 1/5] skip_recipe: remove old class and rename
 VarFlag to SKIP_RECIPE
Thread-Topic: [OE-core] [PATCH 1/5] skip_recipe: remove old class and rename
 VarFlag to SKIP_RECIPE
Thread-Index: AQHYGekF3KDSq6PYlUquUmXzku9jL6yJ1bLg
Date: Tue, 8 Feb 2022 16:02:54 +0000
Message-ID: <b4f59ddad47246c6b4963f9108ecf90e@axis.com>
References: <20220204170144.105536-1-saul.wold@windriver.com>
 <20220204170144.105536-2-saul.wold@windriver.com>
In-Reply-To: <20220204170144.105536-2-saul.wold@windriver.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 16:02:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161521

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.o=
penembedded.org> On Behalf Of Saul Wold
> Sent: den 4 februari 2022 18:02
> To: openembedded-core@lists.openembedded.org
> Cc: Saul Wold <saul.wold@windriver.com>
> Subject: [OE-core] [PATCH 1/5] skip_recipe: remove old class and rename V=
arFlag to SKIP_RECIPE
>=20
> This change better describes what the VarFlag is doing since it
> is implemeted with the SkipRecipe() function.

Change "implemeted" to " implemented".

>=20
> By moving this into base.bbclass we simplify the distro inherit.
>=20
> Signed-off-by: Saul Wold <saul.wold@windriver.com>
> ---
>  meta/classes/base.bbclass          | 10 ++++++++++
>  meta/classes/blacklist.bbclass     | 20 --------------------
>  meta/conf/distro/defaultsetup.conf |  3 +--
>  3 files changed, 11 insertions(+), 22 deletions(-)
>  delete mode 100644 meta/classes/blacklist.bbclass
>=20
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 5f4956a1d31..854d14d8a51 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -438,6 +438,16 @@ python () {
>      if os.path.normpath(d.getVar("WORKDIR")) !=3D
> os.path.normpath(d.getVar("B")):
>          d.appendVar("PSEUDO_IGNORE_PATHS", ",${B}")
>=20
> +    # To add a recipe to the skip list , set:
> +    #   SKIP_RECIPE[pn] =3D "message"
> +    pn =3D d.getVar('PN')
> +    if d.getVarFlag('PNBLACKLIST', pn) is not None:
> +        bb.error("PNBLACKLIST is deprecated, please convert to SKIP_RECI=
PE[%s]" % (pn))
> +    skip_msg =3D d.getVarFlag('SKIP_RECIPE', pn)

Is there any reason this is a varflag rather than an override? I.e., why=20
is it SKIP_RECIPE[foo] rather than SKIP_RECIPE:foo or SKIP_RECIPE:pn-foo)?

> +    if skip_msg:
> +        bb.debug(1, "Skipping %s %s" % (pn, skip_msg))
> +        raise bb.parse.SkipRecipe("Recipe will be skipped because: %s" %=
 (skip_msg))
> +
>      # Handle PACKAGECONFIG
>      #
>      # These take the form:
> diff --git a/meta/classes/blacklist.bbclass b/meta/classes/blacklist.bbcl=
ass
> deleted file mode 100644
> index dc794228ffe..00000000000
> --- a/meta/classes/blacklist.bbclass
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -# anonymous support class from originally from angstrom
> -#
> -# To use the blacklist, a distribution should include this
> -# class in the INHERIT_DISTRO
> -#
> -# No longer use ANGSTROM_BLACKLIST, instead use a table of
> -# recipes in PNBLACKLIST
> -#
> -# Features:
> -#
> -# * To add a package to the blacklist, set:
> -#   PNBLACKLIST[pn] =3D "message"
> -#
> -
> -python () {
> -    blacklist =3D d.getVarFlag('PNBLACKLIST', d.getVar('PN'))
> -
> -    if blacklist:
> -        raise bb.parse.SkipRecipe("Recipe is blacklisted: %s" % (blackli=
st))
> -}
> diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaul=
tsetup.conf
> index b36a4ffffe5..f6894f3ab56 100644
> --- a/meta/conf/distro/defaultsetup.conf
> +++ b/meta/conf/distro/defaultsetup.conf
> @@ -14,9 +14,8 @@ TMPDIR .=3D "${TCLIBCAPPEND}"
>=20
>  USER_CLASSES ?=3D ""
>  PACKAGE_CLASSES ?=3D "package_ipk"
> -INHERIT_BLACKLIST =3D "blacklist"
>  INHERIT_DISTRO ?=3D "debian devshell sstate license remove-libtool"
> -INHERIT +=3D "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO} ${INH=
ERIT_BLACKLIST}"
> +INHERIT +=3D "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO}"
>=20
>  INIT_MANAGER ??=3D "none"
>  require conf/distro/include/init-manager-${INIT_MANAGER}.inc
> --
> 2.31.1

//Peter

