Received: from mail-pb0-f43.google.com ([209.85.160.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UCszF-0001Nm-0E
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 15:37:02 +0100
Received: by mail-pb0-f43.google.com with SMTP id md12so4499686pbc.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Mar 2013 06:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=17HogM1OYF70+bL/tsHUduaMvdaOeiv/NZFIexEIMLs=;
	b=PVW0I7hmSiznhky+iMKrPcXwWF39CGsucocRe2Gm3blix8CpT5DUvANQBBkbpYaF/a
	I/2jPUvGpE9VLY1xjKYdDIy5WQBN18MFhvhvFBL7d9oSTZDP8pLY4JtIJxx7h03w1C6B
	2+jqS2B1yMkC6Z6tvdmX5TiX/Ph5CRIHmNkwfk4p3PsAKv2uwTTlXce5HOGq4myWfeye
	MecWe9EDe//lNjQ+mFeHh9aFNd6ErwPUn/EEa8nLpQmJSfgVHAPcktBS2NL0z9CxyYqy
	S+xrsp4de5AoLAipSnOfJGQ2s0jWSGJb66fnzmVwJrHRXAFyxiHViG3RFEmwpbKiBVtd
	xuPQ==
X-Received: by 10.68.75.109 with SMTP id b13mr37885590pbw.25.1362493230652;
	Tue, 05 Mar 2013 06:20:30 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ol7sm26865699pbb.14.2013.03.05.06.20.26
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 05 Mar 2013 06:20:29 -0800 (PST)
Date: Tue, 5 Mar 2013 15:20:18 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130305142018.GB12023@jama.dyndns-home.com>
References: <1362403514-10122-1-git-send-email-Martin.Jansa@gmail.com>
	<1362492625.29587.95.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1362492625.29587.95.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] avahi: move systemd support where it belongs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Mar 2013 14:37:07 -0000
X-Groupsio-MsgNum: 36243
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XF85m9dhOBO43t/C"
Content-Disposition: inline

--XF85m9dhOBO43t/C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 05, 2013 at 02:10:25PM +0000, Richard Purdie wrote:
> On Mon, 2013-03-04 at 14:25 +0100, Martin Jansa wrote:
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/recipes-connectivity/avahi/avahi.inc       | 6 +-----
> >  meta/recipes-connectivity/avahi/avahi_0.6.31.bb | 6 ++++++
> >  2 files changed, 7 insertions(+), 5 deletions(-)
>=20
> "where it belongs"? Is this due to the avahi-ui recipe?

Yes, avahi-ui is overwriting PACKAGES and systemd.bbclass was showing
warnings since this systemd was added to avahi.inc

> > diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-c=
onnectivity/avahi/avahi.inc
> > index 3a4547c..51cbe38 100644
> > --- a/meta/recipes-connectivity/avahi/avahi.inc
> > +++ b/meta/recipes-connectivity/avahi/avahi.inc
> > @@ -37,11 +37,7 @@ USERADD_PARAM_avahi-autoipd =3D "--system --home /va=
r/run/avahi-autoipd \
> >                                -c \"Avahi autoip daemon\" \
> >                                avahi-autoipd"
> > =20
> > -inherit autotools pkgconfig update-rc.d gettext systemd useradd
> > -
> > -SYSTEMD_PACKAGES =3D "${PN}-daemon ${PN}-dnsconfd"
> > -SYSTEMD_SERVICE_avahi-daemon =3D "avahi-daemon.service"
> > -SYSTEMD_SERVICE_avahi-dnsconfd =3D "avahi-dnsconfd.service"
> > +inherit autotools pkgconfig update-rc.d gettext useradd
> > =20
> >  EXTRA_OECONF =3D "--disable-introspection \
> >               --with-avahi-priv-access-group=3Dadm \
> > diff --git a/meta/recipes-connectivity/avahi/avahi_0.6.31.bb b/meta/rec=
ipes-connectivity/avahi/avahi_0.6.31.bb
> > index cff0974..22731f9 100644
> > --- a/meta/recipes-connectivity/avahi/avahi_0.6.31.bb
> > +++ b/meta/recipes-connectivity/avahi/avahi_0.6.31.bb
> > @@ -1,5 +1,11 @@
> >  require avahi.inc
> > =20
> > +inherit systemd
> > +
> > +SYSTEMD_PACKAGES =3D "${PN}-daemon ${PN}-dnsconfd"
> > +SYSTEMD_SERVICE_avahi-daemon =3D "avahi-daemon.service"
> > +SYSTEMD_SERVICE_avahi-dnsconfd =3D "avahi-dnsconfd.service"
> > +
> >  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2d5025d4aa3495befef8f17206a=
5b0a1 \
> >                      file://avahi-common/address.h;endline=3D25;md5=3Db=
1d1d2cda1c07eb848ea7d6215712d9d \
> >                      file://avahi-core/dns.h;endline=3D23;md5=3D6fe8259=
0b81aa0ddea5095b548e2fdcb \
>=20
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XF85m9dhOBO43t/C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlE1/yIACgkQN1Ujt2V2gBwH+gCfe6GQdHvZJiP2293QrWQzXPE0
3lIAn3QJ2g2hSprOCfYwp5PyZHCl+eyZ
=J97Z
-----END PGP SIGNATURE-----

--XF85m9dhOBO43t/C--
