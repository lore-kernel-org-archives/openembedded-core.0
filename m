Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SwUT0-0000cL-Vp
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 10:39:43 +0200
Received: by bkcik5 with SMTP id ik5so2876266bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 01:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oiJQHAgzPytYod+qpMjFsOsZaglHZ+5MqAnVZHM1eig=;
	b=VWmWYxg9mcG5UBBju769t8CU0ooD0DZp9MLADUZGmc7UFtVRNBCygSpEt7/XzMtzOT
	N1Opk1vWGdcEJ94BcPFZPzJPiY6qEm587ItNF02sRMyQ47XtjnMOsjoULGF48lklzhW8
	HUM2Dc0p/zVC5+EGrH9nIq4nge4nUQCHggPZUI8Gt3FEgN1ypnbREaR2N4QQUYdUfgrF
	+tc8+rC1UTJzmgg0P+efpQ/5uWLr/T1LLLUJhagcc7jzPpBCrWv7jYOGeTzHoiXJ8wcn
	1pJ/yHjX3e2uzae496ci+lekhQEUYMN9Y68aWy1mCj/QH/ynUL+fbHB4Zok5ggZO0hDr
	2QOg==
Received: by 10.204.0.80 with SMTP id 16mr6515287bka.71.1343809684947;
	Wed, 01 Aug 2012 01:28:04 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 14sm1116511bkq.12.2012.08.01.01.28.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 01:28:03 -0700 (PDT)
Date: Wed, 1 Aug 2012 10:28:00 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120801082800.GA16306@jama.jama.net>
References: <20120731110242.D424910219@opal>
	<20120731132257.GW3261@jama.jama.net> <5018E623.5090502@intel.com>
MIME-Version: 1.0
In-Reply-To: <5018E623.5090502@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-commits] Radu Moisan : dbus: include dbus-launch in the main dbus package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2012 08:39:43 -0000
X-Groupsio-MsgNum: 26604
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline

--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 01, 2012 at 11:17:39AM +0300, Radu Moisan wrote:
> Could not get rid of PREFERRED_PROVIDER warning. Tried different=20
> variations but the warning remains there every time. Can you give me=20
> some hint about PREFERRED_PROVIDER usage?

It's not problem in configuration, it's bug in dbus metadata

>> +RPROVIDES_${PN} =3D "dbus-x11"
>> +RREPLACES_${PN} +=3D "dbus-x11"

should be:
1) if we don't have anything depending on e.g. dbus-x11-nativesdk then
you can fix that by something like:
RPROVIDES_${PN} =3D "${PN}-x11"
RREPLACES_${PN} +=3D "${PN}-x11"
which will cause dbus-nativesdk to provide dbus-nativesdk-x11 (which
nobody is interested in).

2) but if some package with nativesdk BBCLASSEXTEND have RDEPENDS_${PN}
=3D "dbus-x11" then you have to append PKGSUFFIX after dbus-x11 not
between dbus and x11. Something like:
PKGSUFFIX =3D ""
PKGSUFFIX_virtclass-nativesdk =3D "-nativesdk"
RPROVIDES_${PN} =3D "dbus-x11${PKGSUFFIX}"
RREPLACES_${PN} +=3D dbus-x11${PKGSUFFIX}"

Cheers,

>=20
> Thanks,
> Radu
>=20
> On 07/31/2012 04:22 PM, Martin Jansa wrote:
> > On Tue, Jul 31, 2012 at 11:02:42AM +0000, git@git.openembedded.org wrot=
e:
> >> Module: openembedded-core.git
> >> Branch: master
> >> Commit: c02364f36e228835ea5d7fd4e1d347fd451f8544
> >> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcom=
mit;h=3Dc02364f36e228835ea5d7fd4e1d347fd451f8544
> >>
> >> Author: Radu Moisan <radu.moisan@intel.com>
> >> Date:   Tue Jul 31 09:23:23 2012 +0300
> >>
> >> dbus: include dbus-launch in the main dbus package
> >>
> >> Followed suggestions from Bugz 2261:
> >>
> >> 2) make the virtual/libx11 DEPENDS conditional based on the x11 distro=
 feature.
> >> This makes the build dependencies reflect the feature list.
> >>
> >> 3) remove dbus-x11, meaning that dbus-launch with its potential X11 de=
pendency
> >> is now back in dbus where is belongs.
> >>
> >> 4) make dbus provide dbus-x11, for compatibility.
> > 5) create new warning:
> > NOTE: multiple providers are available for runtime dbus-x11 (dbus, dbus=
-nativesdk)
> > NOTE: consider defining a PREFERRED_PROVIDER entry to match dbus-x11
> >
> > Cheers,
> >
> >> Fixes [Yocto #2261]
> >>
> >> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> >> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >>
> >> ---
> >>
> >>   meta/recipes-core/dbus/dbus.inc |   10 ++++++----
> >>   1 files changed, 6 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/meta/recipes-core/dbus/dbus.inc b/meta/recipes-core/dbus/=
dbus.inc
> >> index a75583d..164c4d3 100644
> >> --- a/meta/recipes-core/dbus/dbus.inc
> >> +++ b/meta/recipes-core/dbus/dbus.inc
> >> @@ -31,10 +31,11 @@ CONFFILES_${PN} =3D "${sysconfdir}/dbus-1/system.c=
onf ${sysconfdir}/dbus-1/session
> >>  =20
> >>   DEBIANNAME_${PN} =3D "dbus-1"
> >>  =20
> >> -PACKAGES =3D+ "${PN}-lib ${PN}-systemd ${@base_contains('DISTRO_FEATU=
RES', 'x11', '${PN}-x11', '', d)}"
> >> +PACKAGES =3D+ "${PN}-lib ${PN}-systemd"
> >>  =20
> >> -FILES_${PN}-x11 =3D "${bindir}/dbus-launch"
> >> -RDEPENDS_${PN}-x11 =3D "${PN}"
> >> +# for compatibility
> >> +RPROVIDES_${PN} =3D "dbus-x11"
> >> +RREPLACES_${PN} +=3D "dbus-x11"
> >>  =20
> >>   FILES_${PN}-systemd =3D "${systemd_unitdir}/system/"
> >>  =20
> >> @@ -43,6 +44,7 @@ FILES_${PN} =3D "${bindir}/dbus-daemon* \
> >>                  ${bindir}/dbus-cleanup-sockets \
> >>                  ${bindir}/dbus-send \
> >>                  ${bindir}/dbus-monitor \
> >> +               ${bindir}/dbus-launch \
> >>                  ${libexecdir}/dbus* \
> >>                  ${sysconfdir} \
> >>                  ${localstatedir} \
> >> @@ -59,7 +61,7 @@ pkg_postinst_dbus() {
> >>   }
> >>  =20
> >>   EXTRA_OECONF_X =3D "${@base_contains('DISTRO_FEATURES', 'x11', '--wi=
th-x', '--without-x', d)}"
> >> -EXTRA_OECONF_X_virtclass-native =3D "--without-x"
> >> +EXTRA_OECONF_X_virtclass-native =3D "--disable-x11-autolaunch"
> >>  =20
> >>   EXTRA_OECONF =3D "--disable-tests \
> >>                   --disable-checks \
> >>
> >>
> >> _______________________________________________
> >> Openembedded-commits mailing list
> >> Openembedded-commits@lists.openembedded.org
> >> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commi=
ts
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAY6JAACgkQN1Ujt2V2gBzGbACfZddoZurjMUjaEcIDZtxfq0F+
cIgAn2lMgpb7/+eKlwMktKuRiioviDGo
=7xWn
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
