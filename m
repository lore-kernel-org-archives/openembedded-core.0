Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3004C433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 08:03:43 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.21306.1664957018813544092
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 01:03:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=TplEWOQ4;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1664957019;
  x=1696493019;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rEiPs3NLUtgRu+/i0/Wde6/r3hg71ytERMYXouEGD3c=;
  b=TplEWOQ4kQY5z+A/J93m8votpxFakIr9zqJlxrNjA48rJScCxB5z88fs
   DKEs6r1MWx1ZPB8OHJeC/TRF+SFYxPaknwvuOmlpmOCSVslHA6x3GZuOx
   eALd94YpKxBnoa3w/c0aFS1aPX2uiuoiBwNTokTWv8dCbSn0trFS3rpgH
   mKCLVLpaKuG61cYEtPB1d+g+WuY78zhke/5qZRpcpYlUMKtw+CQWKx5w3
   sGVSOQZulCawohDH80vwXlHHD0EZ5rGvXf5z6UWdHUOZnviJICxumqto/
   UOka2up2/F9wkn4eDvumOnE3Usotm6ynX0bCuU+spcIiMdk9A/m9RdxtU
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Mikko Rapeli <mikko.rapeli@linaro.org>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH v2 3/5] u-boot: use openssl-native.bbclass
Thread-Topic: [OE-core] [PATCH v2 3/5] u-boot: use openssl-native.bbclass
Thread-Index: AQHY2AXvlzHYi26wukCA3aM5SGry163+pviAgACHbACAAEJXAA==
Date: Wed, 5 Oct 2022 08:03:36 +0000
Message-ID: <6447047e34164ab487fba4c9c5656e24@axis.com>
References: <20221004152807.987313-1-mikko.rapeli@linaro.org>
 <20221004235719.0e2bd17b@booty> <Yz0d2F1PygnDspnK@nuoska>
In-Reply-To: <Yz0d2F1PygnDspnK@nuoska>
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
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 08:03:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171449

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Mikko Rapeli
> Sent: den 5 oktober 2022 08:02
> To: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH v2 3/5] u-boot: use openssl-native.bbclass
>=20
> Hi,
>=20
> On Tue, Oct 04, 2022 at 11:57:19PM +0200, Luca Ceresoli wrote:
> > Hello Mikko,
> >
> > On Tue,  4 Oct 2022 18:28:07 +0300
> > "Mikko Rapeli" <mikko.rapeli@linaro.org> wrote:
> >
> > > It sets all environment variables correctly for openssl-native.
> > >
> > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> >
> > I'm taking this patch for testing, however I have a question, see below=
.
> >
> > > ---
> > >  meta/recipes-bsp/u-boot/u-boot.inc | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-
> boot/u-boot.inc
> > > index f022aed732..cd9c578962 100644
> > > --- a/meta/recipes-bsp/u-boot/u-boot.inc
> > > +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> > > @@ -17,7 +17,8 @@ PACKAGECONFIG ??=3D "openssl"
> > >  # u-boot will compile its own tools during the build, with specific
> > >  # configurations (aka when CONFIG_FIT_SIGNATURE is enabled) openssl
> is needed as
> > >  # a host build dependency.
> > > -PACKAGECONFIG[openssl] =3D ",,openssl-native"
> > > +OPENSSL_INHERIT .=3D "${@bb.utils.contains('PACKAGECONFIG', 'openssl=
',
> 'openssl-native', '', d)}"
> >
> > What is the reason to use '.=3D' and not just '=3D' here?

You typically use it to avoid introducing extra space to a variable when a=
=20
feature is not enabled.

>=20
> Hehe, it was in another example which was using conditional inheritance.
>=20
> meta/recipes-support/gpgme/gpgme_1.18.0.bb
>=20
> PYTHON_INHERIT .=3D "${@bb.utils.contains('PACKAGECONFIG', 'python3', 'py=
thon3native python3targetconfig', '', d)}"

That example is actually wrong. If someone was to enable both "python2"=20
and "python3", the resulting PYTHON_INHERIT would be=20
"pythonnativepython3native python3targetconfig", which obviously will=20
not work.

>=20
> I guess normal =3D assignment would work too. If that's preferred I can
> send a v3.
>=20
> Cheers,
>=20
> -Mikko

//Peter


