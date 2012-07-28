Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Sv3JF-0007Zs-MB
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jul 2012 11:27:41 +0200
Received: by wgbdr1 with SMTP id dr1so3063100wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jul 2012 02:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=zyDiJ5r87fEgFsyCvbADQ0zFuc8CUM7QCKv9GbB6N3M=;
	b=p8GfPQdc+jRuLJ0HAfs6/4PCa/dZesXJXTBvkoGwEUOUrc0tc7Feer2NrPy7970RFf
	G+Wp+E+6MtrB84uB8DkkDHsGYuym8qfjeJaOvJk5r5SXruTU97BRg5gqbNK4aiE8HelQ
	Z8n8EeeSMO2Keo+5Y4K/pxl0JBv/lHITb/HZvaw6rLkX73wm2rZ504P08QXyImH7yKH0
	aNsfTutG9Gm9oq4QIJPHDDuB1ELbCXRbxCu2jKqpdD+VLWlTJpMUr7kkt9QH5NuOTjjM
	Zv6OEl4UILBjig3IQYipmZ9J0Hl54/dp5Yot5twOEkHbX5YfVYormJlDNQyl9eNffg6m
	tPrw==
Received: by 10.180.84.169 with SMTP id a9mr12422609wiz.8.1343466968657;
	Sat, 28 Jul 2012 02:16:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h9sm3064461wiz.1.2012.07.28.02.16.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 Jul 2012 02:16:07 -0700 (PDT)
Date: Sat, 28 Jul 2012 11:16:14 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: ml@communistcode.co.uk, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120728091614.GD3742@jama.jama.net>
References: <1343307951.29991.27.camel@ted>
	<5013AACF.2010807@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <5013AACF.2010807@communistcode.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] lib/oe/lsb: Add basic LSB functions
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
X-List-Received-Date: Sat, 28 Jul 2012 09:27:41 -0000
X-Groupsio-MsgNum: 26428
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GyRA7555PLgSTuth"
Content-Disposition: inline

--GyRA7555PLgSTuth
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 28, 2012 at 10:03:11AM +0100, Jack Mitchell wrote:
> On 26/07/2012 14:05, Richard Purdie wrote:
> > This code was written by Christopher Larson <chris_larson@mentor.com> a=
nd
> > allows generation of the LSB release data based upon the lsb_release
> > command. It also includes a helper function to generate a string
> > representing a given distribution.
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> > diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
> > new file mode 100644
> > index 0000000..a774169
> > --- a/dev/null
> > +++ b/meta/lib/oe/lsb.py
> > @@ -0,0 +1,28 @@
> > +def release_dict():
> > +    """Return the output of lsb_release -a as a dictionary"""
> > +    from subprocess import PIPE
> > +
> > +    try:
> > +        output, err =3D bb.process.run(['lsb_release', '-a'], stderr=
=3DPIPE)
> > +    except bb.process.CmdError as exc:
> > +        return
> > +
> > +    data =3D {}
> > +    for line in output.splitlines():
> > +        try:
> > +            key, value =3D line.split(":\t", 1)
> > +        except ValueError:
> > +            continue
> > +        else:
> > +            data[key] =3D value
> > +    return data
> > +
> > +def distro_identifier(adjust_hook=3DNone):
> > +    """Return a distro identifier string based upon lsb_release -ri,
> > +       with optional adjustment via a hook"""
> > +
> > +    lsb_data =3D release_dict()
> > +    distro_id, release =3D lsb_data['Distributor ID'], lsb_data['Relea=
se']
> > +    if adjust_hook:
> > +        distro_id, release =3D adjust_hook(distro_id, release)
> > +    return '{0}-{1}'.format(distro_id, release)
> >
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> There is an unchecked error case here. I just had to fix this issue:
>=20
> ERROR: Execution of event handler 'oe_import_eh' failed
> Traceback (most recent call last):
>    File "oe_import_eh(e)", line 4, in=20
> oe_import_eh(e=3D<bb.event.ConfigParsed object at 0x3834f90>)
>    File "/mnt/yocto/poky.git/meta/lib/oe/lsb.py", line 25, in=20
> distro_identifier(adjust_hook=3DNone):
>           lsb_data =3D release_dict()
>      >    distro_id, release =3D lsb_data['Distributor ID'],=20
> lsb_data['Release']
>           if adjust_hook:
> TypeError: 'NoneType' object has no attribute '__getitem__'
>=20
>=20
> by installing lsb_release. Archlinux 64.
>=20
> Should it check to see if it installed first and error otherwise? It=20
> looks like it tries to do it here:
>=20
> +    try:
> +        output, err =3D bb.process.run(['lsb_release', '-a'], stderr=3DP=
IPE)
> +    except bb.process.CmdError as exc:
> +        return
>=20
>=20
> but it must be missing something.

Same here, interesting is that it failed only during 2nd build, 1st
with this commit applied finished fine.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GyRA7555PLgSTuth
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlATrd4ACgkQN1Ujt2V2gBwGpwCfVdDKeUeGmKpwGLGoXUWrmtTZ
xrkAoJbsVDBCTNeEUrZsHaoAbLDTxoJP
=Xm+v
-----END PGP SIGNATURE-----

--GyRA7555PLgSTuth--
