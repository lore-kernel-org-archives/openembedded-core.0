Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RG8LJ-0001Er-F5
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Oct 2011 14:00:25 +0200
Received: by bkat8 with SMTP id t8so756978bka.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Oct 2011 04:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=6hgHl/bwzENCuVlvnbUqL7Uw5iCy3BLiX1Cewo9jUmw=;
	b=WgBm6kw2FEmgBWEBClZ6O585C8g0URsDA1uuYOGAbph4RXkw+X/cR02xdvJQT/pHyb
	6d91jWa1RF6qLZMUpD8MULuM3r/TKrfSkJPdIIGD0rtVDDiYfS0i6HHG8yMyWIB6whga
	ol0n/6gcoNzSDZt9mMvlEjOji0qtuoQ+cGyO0=
Received: by 10.204.137.72 with SMTP id v8mr1581615bkt.35.1318938872907;
	Tue, 18 Oct 2011 04:54:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u10sm1846643bkv.3.2011.10.18.04.54.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Oct 2011 04:54:31 -0700 (PDT)
Date: Tue, 18 Oct 2011 13:54:25 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111018115425.GD20678@jama.jama.net>
References: <1318855942-8677-1-git-send-email-Martin.Jansa@gmail.com>
	<1318859310.22985.114.camel@phil-desktop>
	<20111017135938.GH12684@jama.jama.net>
	<1318860385.22985.118.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1318860385.22985.118.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [RFC] bitbake.conf: include only ${libdir}/${BPN}/*${SOLIBS} not whole ${libdir}/${BPN}/* in FILES_${PN}-dev
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
X-List-Received-Date: Tue, 18 Oct 2011 12:00:25 -0000
X-Groupsio-MsgNum: 11156
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="veXX9dWIonWZEC6h"
Content-Disposition: inline

--veXX9dWIonWZEC6h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 17, 2011 at 03:06:24PM +0100, Phil Blundell wrote:
> On Mon, 2011-10-17 at 15:59 +0200, Martin Jansa wrote:
> > On Mon, Oct 17, 2011 at 02:48:29PM +0100, Phil Blundell wrote:
> > > If there are .la or .so files in ${libdir}/${PN} that are causing a
> > > problem then it does seem reasonable to add them to FILES_${PN}-dev.
> > > But I don't think that restricting the scope of FILES_${PN} is
> > > desirable, or ought to be necessary.
> >=20
> > How to do this with this order of PACKAGES, without redefining PACKAGES
> > itself?
> >=20
> > PACKAGES =3D "${PN}-dbg ${PN} ${PN}-doc ${PN}-dev ${PN}-staticdev ${PN}=
-locale"
>=20
> Ah, hm.  I had thought for some reason that ${PN}-dev was before ${PN}
> but evidently that's not correct.  So you're right, there is probably no
> good way to do it without fiddling FILES_${PN}. =20
>=20
> That being the case, I am inclined to say that this ought just to be
> fixed locally in the recipes that have the problem: it isn't very
> obvious to me that setting a restrictive glob on FILES_${PN} (and then
> having to edit all the recipes that install non-library things in there)
> is going to be a net win compared to just fixing the recipes that are
> currently shipping .la files in there by mistake.

OK, I didn't any research to find what type of files are usually stored
in ${libdir}/${BPN} but find /usr/lib64 on my gentoo box suggests that
you're right (almost every directory under /usr/lib64 has something more
than .so and .la files:

# find /usr/lib64/ -mindepth 1 -maxdepth 1 -type d | wc -l=20
186
# for i in `find /usr/lib64/ -mindepth 1 -maxdepth 1 -type d`; do ls -1 $i/=
* 2>/dev/null | grep -v ".so" | wc -l | grep -v '^0$'; done | wc -l
136
# for i in `find /usr/lib64/ -mindepth 1 -maxdepth 1 -type d`; do ls -1 $i/=
* 2>/dev/null | grep -v ".so" | grep -v ".la" | wc -l | grep -v '^0$'; done=
 | wc -l
128

I've fixed it in syslog-ng by redifining FILES_${PN} in
http://git.openembedded.org/meta-openembedded/commit/?id=3D1ab4e30380da2444=
cfc66fe5283beb83168964a7

and we can ignore this conf/bitbake.conf patch.

Thanks

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--veXX9dWIonWZEC6h
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6daPEACgkQN1Ujt2V2gBxLAQCfbNB9xLZIxpkUpu6FoykREmtW
9QkAnjw4KJ2HtTxQkBZcCzv81rwWBD/3
=V+Ym
-----END PGP SIGNATURE-----

--veXX9dWIonWZEC6h--
