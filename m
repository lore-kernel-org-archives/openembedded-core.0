Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0fuo-00057D-NO
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Feb 2012 22:09:26 +0100
Received: by eaal10 with SMTP id l10so783656eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2012 13:01:05 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.16.136 as permitted sender) client-ip=10.213.16.136; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.16.136 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.16.136])
	by 10.213.16.136 with SMTP id o8mr15466eba.13.1330030865214 (num_hops =
	1); Thu, 23 Feb 2012 13:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+F4CUPBflKdJfZ200qGQATv/n6F7WEhrbkpBuSTbBzA=;
	b=GRtioCxZz2NH/khflSYAaaE9+XVqajK4RuhmZY2pQSoeQpOWS4jpAr01vvSPnGOF0v
	B9f1+WUaCr/DAHfgax+nnEnczTxZ8toZqjr8bo2s5S8+KWLDZzQv+p/A8ZnxdiiTCHQU
	/WMoNcarROrsn46KyKazgc3F1Hc6jwTS6Vu4I=
Received: by 10.213.16.136 with SMTP id o8mr8546eba.13.1330030864746;
	Thu, 23 Feb 2012 13:01:04 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n17sm9534506eei.3.2012.02.23.13.01.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 13:01:03 -0800 (PST)
Date: Thu, 23 Feb 2012 22:01:01 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120223210101.GB3769@jama.jama.net>
References: <4F4645CC.4050403@opendreambox.org>
	<20120223140409.GT3769@jama.jama.net>
	<4F466F3D.8060504@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <4F466F3D.8060504@opendreambox.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: bug in recipe version priorities across layers?
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
X-List-Received-Date: Thu, 23 Feb 2012 21:09:26 -0000
X-Groupsio-MsgNum: 17852
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XoSOsMJQ8mz74oyx"
Content-Disposition: inline

--XoSOsMJQ8mz74oyx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2012 at 05:54:21PM +0100, Andreas Oberritter wrote:
> On 23.02.2012 15:04, Martin Jansa wrote:
> > Afaik latest version from layer with highest priority wins. Which
> > doesn't always mean latest version globally.
> >=20
> > DEFAULT_PREFERENCE doesn't help e.g. to demote development version in s=
ome
> > layer with higher priority.
> >=20
> > But PREFERRED_VERSION does work.
>=20
> Thanks, Martin! I didn't expect that, but it's an explanation. Is this=20
> documented somewhere? I think OE-classic behaved differently.

Well I think this is bug or at least very unintuitive behavior.

I have use-case where I've added development version of libsoup-2.4:
meta-openembedded/meta-efl/recipes-support/libsoup/libsoup-2.4_2.37.2.bb

just to meta-efl layer and just because webkit-efl is works more
reliable with this version then current stable.

The problem is that even with D_P -1 it becomes default version for
everybody who includes meta-efl before oe-core, more usefull behavior
would be to force people who use webkit-efl to add P_V if they really
want this development version and keep stable one as default for everyone=
=20
else.

> I noticed that "bitbake-layers show-overlayed" nicely prints the=20
> available versions in order of preference. For some packages, I don't=20
> understand the ordering though, e.g.:
>=20
> python-setuptools:
>   meta-oe              0.6c11-ml3
>   meta                 0.6c11-ml3
> python-setuptools-native:
>   meta                 0.6c11-ml3
>   meta-oe              0.6c11-ml3
>=20
> (I modified bitbake-layers to include PR in its output)
>=20
> The diff between both layers looks like this:
>=20
> --- openembedded-core/meta/recipes-devtools/python/python-setuptools_0.6c=
11.bb	2012-01-18 15:05:39.876945863 +0100
> +++ meta-openembedded/meta-oe/recipes-devtools/python/python-setuptools_0=
=2E6c11.bb	2012-01-18 15:10:23.816943155 +0100
> @@ -29,3 +29,5 @@
>  SRC_URI[sha256sum] =3D "630fea9b726320b73ee3ca6ff61732cb32675b0389be6580=
80fe46383b87a1d3"
> =20
>  BBCLASSEXTEND =3D "native"
> +
> +NATIVE_INSTALL_WORKS =3D "1"
> ---
>=20
> The only occurence of python-setuptools(-native) is:
> meta/classes/setuptools.bbclass:DEPENDS +=3D "python-setuptools-native"

please just send patch removing python-setuptools from meta-oe,
NATIVE_INSTALL_WORKS isn't needed in oe-core world.. and now with
python-setuptools_0.6c11.bb in oe-core it doesn't make sense to keep
both :).

> Another strange one, this time with unequal versions:
>=20
> mpfr:
>   meta-oe              3.0.0-r4
>   meta                 3.1.0-r0
> mpfr-native:
>   meta                 3.1.0-r0
>   meta-oe              3.0.0-r4

This also looks like candidate for removal or at least conversion to
=2Ebbappend if there is significant diff between meta-oe and oe-core.

> Would lowering the priority of meta-openembedded affect its ability to
> bbappend OE-core's recipes? Is it possible to lower its priority, or to
> raise the priority of OE core, without modifying conf/layer.conf in
> either layer?

I don't remember exact rules now, but priority is strange combination of
layer.conf priority and order of bblayers.conf which doesn't even behave
the same for .bbclasses and .bb files IIRC, there was discussion about
improving this situation but I haven't seen any patches doing it since
then. FWIW .bbappend files work as expected in any layer.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XoSOsMJQ8mz74oyx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9GqQ0ACgkQN1Ujt2V2gBz9dwCfbfTXWhwvq/8JvTK0EuOcG0Re
PDsAnAw/GlKh+V9rHDTblrHF+l6V/Cw4
=76+9
-----END PGP SIGNATURE-----

--XoSOsMJQ8mz74oyx--
