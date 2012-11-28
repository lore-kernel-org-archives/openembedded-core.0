Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdhMG-0008Os-3t
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 14:07:20 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so5154834eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 04:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=51VfXVrwp1pjeI8Qms9ybRywVnYXUiv2UDPa8expI/w=;
	b=SXxdDPA5L82F1riGSw5VtrzdYe2mGEZr9EHQo1C1PBbtc9LfVqat5ZdY8AE3IyI+AF
	zcl7eQLEqY8/ImC67MYxG9mUFw8sNBrybk3YHJlckkrrWjvJkiatFjCAkoaKskgPhd/x
	5feQ+UnAx1aeMPh6d6d4ILoF6YGy+7cZILaCB1mqBiifexAuCCGS7bsr+3tcb7O1RNrF
	o07+uX4tFUWfAL0OrruRnMFoosaWIYm2xzJ0eqPvPFQ8Hi0QxXFt9A6w2P7RD11a9pCn
	Pv2Ha9W+4nxvaxADnSPfWIAeMAlYX9kSjXJ6Y0HX56QSLBII2gmKGDmg+lTj8MCEw52c
	EQYQ==
Received: by 10.14.207.6 with SMTP id m6mr26193852eeo.10.1354107185531;
	Wed, 28 Nov 2012 04:53:05 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q2sm46897392eem.13.2012.11.28.04.53.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Nov 2012 04:53:04 -0800 (PST)
Date: Wed, 28 Nov 2012 13:53:01 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20121128125301.GB3477@jama.jama.net>
References: <20121127182306.GE3692@jama.jama.net>
	<50B50A05.9020201@windriver.com>
	<20121128085726.GA3477@jama.jama.net>
	<1354093560.21863.164.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1354093560.21863.164.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: locale data broken in gstreamer
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
X-List-Received-Date: Wed, 28 Nov 2012 13:07:20 -0000
X-Groupsio-MsgNum: 31837
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z6Eq5LdranGa6ru8"
Content-Disposition: inline

--z6Eq5LdranGa6ru8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 28, 2012 at 09:06:00AM +0000, Richard Purdie wrote:
> On Wed, 2012-11-28 at 09:57 +0100, Martin Jansa wrote:
> > On Tue, Nov 27, 2012 at 12:44:21PM -0600, Mark Hatle wrote:
> > > On 11/27/12 12:23 PM, Martin Jansa wrote:
> > > > In last rebuild from scratch I've noticed couple of weird locale da=
ta:
> > >=20
> > > Paul E and I just observed this as well...  My build machine is an -o=
ld- FC13=20
> > > machine..  system we found it on was x86.
> >=20
> > OK, the issue is triggered by:
> >=20
> > commit 841ea3c1c18e50e77fccbd5f44d6a79a50913b67
> > Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Date:   Thu Oct 11 08:43:01 2012 +0000
> >=20
> >     autotools.bbclass: Fix gettext macro versions issues
> >=20
> > Especially this part:
> > -if [ -d ${S}/po/ -a ! -e ${S}/po/Makefile.in.in ]; then
> > -     cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/po/
> > +if [ -d ${S}/po/ ]; then
> > +     cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/po/
> >=20
> > And it influences gst* because they are hacking their po/Makefile.in.in=
 in autogen.sh by this patch
> > http://cgit.freedesktop.org/gstreamer/common/commit/gettext.patch?id=3D=
c81ad072c76522175cbddead96d6f3c448068d67
> >=20
> > RP: do you remember why you removed "-e ${S}/po/Makefile.in.in" check?
> > I guess it was because it can be from older gettext version (in gstream=
er=20
> > case 0.17 instead of our 0.18)
>=20
> Right, we have to ensure the file is the 0.18 version, whether it exists
> already or not otherwise we get version mismatch issues.
>=20
> > Is there some way to inject Makefile.in.in modification between this=20
> > gettext modifications and running autoreconf/configure? I don't see any=
=20
> > in run.do_configure, but I guess there is cleaner solution for upstream=
=20
> > to use.
> >=20
> > As work around we can replace DOMAIN setting in po/Makevars in all gst*=
 packages.
>=20
> I don't quite understand what you mean here?=20

po/Makevars in gst* is using:
DOMAIN =3D $(GETTEXT_PACKAGE)
we can call=20
sed 's/$(GETTEXT_PACKAGE)/gstreamer-0.10/g' ${S}/po/Makevars
in do_configure_prepend

Or read correct "gstreamer-0.10" value from something so it's not
hardcoded in recipe.

Other option is to include the same hack in our Makefile.in.in
GETTEXT_PACKAGE =3D @GETTEXT_PACKAGE@
if we test that this does not break some other packages.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--z6Eq5LdranGa6ru8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC2CS0ACgkQN1Ujt2V2gBzxVQCgj7KMzwn0TBhDBC5Sz6OORgk3
/yYAoKvw4RGmPcIq9Bjn8FeCohk9HKU2
=iPYT
-----END PGP SIGNATURE-----

--z6Eq5LdranGa6ru8--
