Return-Path: <jlu@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C3AEFB801
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 08:26:38 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15926.1771921590576993923
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 00:26:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: jlu@pengutronix.de)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <jlu@pengutronix.de>)
	id 1vunkS-0002HF-Q7; Tue, 24 Feb 2026 09:26:28 +0100
Message-ID: <16d6a8b7779cb52cae52e0e8b2edf92b0ae5edf1.camel@pengutronix.de>
Subject: Re: [OE-core] [PATCH v2] openssl: add support for config snippet
 includes
From: Jan =?ISO-8859-1?Q?L=FCbbe?= <jlu@pengutronix.de>
Reply-To: jlu@pengutronix.de
To: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
Date: Tue, 24 Feb 2026 09:26:27 +0100
In-Reply-To: <871c180e00e0331a472604442f86d0eb51fc7364.camel@pbarker.dev>
References: <20260216150201.2100724-1-jlu@pengutronix.de>
	 <871c180e00e0331a472604442f86d0eb51fc7364.camel@pbarker.dev>
Organization: Pengutronix
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: jlu@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 08:26:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231746

On Mon, 2026-02-23 at 18:29 +0000, Paul Barker wrote:
> On Mon, 2026-02-16 at 16:02 +0100, Jan Luebbe wrote:
> > This allows configuration (such as enabling providers) to be done by
> > adding snippet files to /etc/ssl/openssl.cnf.d instead of modifying a
> > copy of the full configuration file. As new snippets can be added from
> > separate recipes, targeted changes can be done in multiple layers.
> >=20
> > For example, the pkcs11-provider can be enabled by adding a pkcs11.cnf
> > containing something like:
> > =C2=A0 [default_sect]
> > =C2=A0 activate =3D 1
> >=20
> > =C2=A0 [provider_sect]
> > =C2=A0 pkcs11 =3D pkcs11_sect
> >=20
> > =C2=A0 [pkcs11_sect]
> > =C2=A0 pkcs11-module-path =3D /usr/lib/libckteec.so.0
> > =C2=A0 pkcs11-module-quirks =3D no-operation-state no-deinit
> > =C2=A0 pkcs11-module-encode-provider-uri-to-pem =3D true
> > =C2=A0 activate =3D 1
> >=20
> > Signed-off-by: Jan Luebbe <jlu@pengutronix.de>
> > ---
> > =C2=A0meta/recipes-connectivity/openssl/openssl_3.5.5.bb | 7 +++++++
> > =C2=A01 file changed, 7 insertions(+)
> >=20
> > diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
> > b/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
> > index c0d02b617ba5..94fda03ea206 100644
> > --- a/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
> > +++ b/meta/recipes-connectivity/openssl/openssl_3.5.5.bb
> > @@ -186,6 +186,13 @@ do_install () {
> > =C2=A0	fi
> > =C2=A0}
> > =C2=A0
> > +do_install:append:class-target () {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Add support for config sn=
ippet includes
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo "" >> ${D}${sysconfdir=
}/ssl/openssl.cnf
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo ".include ${sysconfdir=
}/ssl/openssl.cnf.d" >>
> > ${D}${sysconfdir}/ssl/openssl.cnf
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${sysconfdir=
}/ssl/openssl.cnf.d
> > +}
> > +
>=20
> Has there been any discussion with upstream about adding this to
> openssl.cnf by default?

It's a built-in feature in OpenSSL since 1.1.1
https://github.com/openssl/openssl/pull/5351
and was introduced specifically for simplifying configurations when shippin=
g
OpenSSL as part of an OS
https://github.com/openssl/openssl/issues/4962

Adding configuration necessary for engines (now also providers) was also
mentioned in the issue.

https://docs.openssl.org/3.6/man5/config/ says "As a general rule, the path=
name
should be an absolute path", which is the case here.

> I see that CentOS Stream 10 has a similar include directive in
> openssl.cnf, but Debian does not. I wonder if upstream considers this to
> be "safe".

The approach of snippets in .d directories is used by may other packages as=
 well
(systemd, openssh, iproute2, sudo, udev, chrony). In some cases the search =
paths
are hard-coded, in others they are explicitly configured in the "top level"
configuration.

Configuration in /etc needs to be protected against unauthorized modificati=
on,
but that applies to /ssl/openssl.cnf.d/foo.cnf in the same way as for
/ssl/openssl.cnf.

Best regards
Jan

