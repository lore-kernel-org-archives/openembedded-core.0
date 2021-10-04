Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFBE3C433F5
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 15:09:04 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.10785.1633360137734766672
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 08:08:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=ebN21/1g;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1633360138;
  x=1664896138;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=LJbdc7IrOBCA+hQEoedXqcXgZax3lr0lDCtCaYBlzvQ=;
  b=ebN21/1gB3Da1oEXYt+/dbB5v+Yuakxb7PCH9JZbWlaUSamomT19yP0b
   m8WyV+Lyi3Uwi1SWuctuzdCNepBclHYiyuAbNWae8MssZQFrTEKuRUncY
   3WzKnqns1CkMKEZBrq/9DOiowTrDhAnIClozORMpeB4qqLgOfIDl1ZDRZ
   J9fZEBAF8JmbeP4I87LubOikmBQV79snIxZs1YMTnzo0bO84zi8zM9KnL
   jmbKXkkOOnkfhF1oI2y8kRrbfdURMIt0LiBtu/PWfWYmtuQtNblmfMBm9
   WErdQgdxV3VoR71Mc1fku8y3EnKsx2qFPXQvsmqUVj1mqw6Oj/TZlJOZ2
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Konrad Weihmann <kweihmann@outlook.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH 2/3] glibc: fix append in DEPENDS
Thread-Topic: [OE-core] [PATCH 2/3] glibc: fix append in DEPENDS
Thread-Index: AQHXuSPdkmwkYvyw2EWeOUbNjNppN6vC8L3A
Date: Mon, 4 Oct 2021 15:08:54 +0000
Message-ID: <2d32793c8dbc47a0afced79d07377812@axis.com>
References: <20211004132853.30543-1-kweihmann@outlook.com>
 <AM9PR09MB46421376B722A7A7A315BC8CA8AE9@AM9PR09MB4642.eurprd09.prod.outlook.com>
In-Reply-To: 
 <AM9PR09MB46421376B722A7A7A315BC8CA8AE9@AM9PR09MB4642.eurprd09.prod.outlook.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 15:09:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156609

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Konrad Weihmann
> Sent: den 4 oktober 2021 15:29
> To: openembedded-core@lists.openembedded.org
> Cc: Konrad Weihmann <kweihmann@outlook.com>
> Subject: [OE-core] [PATCH 2/3] glibc: fix append in DEPENDS
>=20
> fix the append with a leading blank, otherwise this messes up
> DEPENDS when globally inherited classes add dependecies of their own
>=20
> Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
> ---
>  meta/recipes-core/glib-2.0/glib.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib=
-
> 2.0/glib.inc
> index a34776b083..3436645f15 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -30,7 +30,7 @@ LEAD_SONAME =3D "libglib-2.0.*"
>=20
>  inherit meson gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-
> even bash-completion gio-module-cache manpages
>=20
> -DEPENDS:append:class-target =3D "${@' gtk-doc' if d.getVar('GTKDOC_ENABL=
ED') =3D=3D 'True' else ''}"
> +DEPENDS:append:class-target =3D " ${@' gtk-doc' if d.getVar('GTKDOC_ENAB=
LED') =3D=3D 'True' else ''}"

This change is not needed as there already is a space inside=20
the if statement (in ' gtk-doc').

>=20
>  GTKDOC_MESON_OPTION =3D "gtk_doc"
>=20
> --
> 2.25.1

//Peter


