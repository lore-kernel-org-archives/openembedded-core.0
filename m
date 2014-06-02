Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 47ABD65FDC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jun 2014 21:46:59 +0000 (UTC)
Received: by mail-la0-f41.google.com with SMTP id e16so2971203lan.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jun 2014 14:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=gwIxLPRRl1Jj/xt6D68ouLJAozlRERvEfiDOBV0A+uY=;
	b=T6NCJOAy/77hoq+1XtnBS0UE9MzZ1dX7hfcwTVIZqQbeE68SSqDcXhIcZftCXC5NEe
	VlemOaAFOeI/I4z4unlqlJ+86rwLHHJkTj0APOmOinLmjj0UJJkz5jtMBVCB2lz1tda3
	ar8YheD9IKEYENi/vU45aBkDMBr6dEORSAXke0BdqxRkCcmUbz6KYGnCOuaiCOsc+IU0
	egC0kC101kh4Gj5qu0E+vFBPGnZ05p0Y8IY42DVvp7bFMvP1QiYviccARbAouvNfgF5G
	wqlVQAqsWyo+jg+pZfEtIZtDWbzwEA8TzDwLixxSHbR4yP/PWf/9NX6d9kg+8Jkb8CAY
	1Ing==
X-Received: by 10.112.76.66 with SMTP id i2mr29324128lbw.37.1401745619728;
	Mon, 02 Jun 2014 14:46:59 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	s10sm12149006lal.22.2014.06.02.14.46.58 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 02 Jun 2014 14:46:58 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 2 Jun 2014 23:47:11 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140602214711.GM2426@jama>
References: <1401740101.12440.22.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1401740101.12440.22.camel@ted>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH RFC] autotools: Improve configure dependency code for finding m4 files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Jun 2014 21:47:03 -0000
X-Groupsio-MsgNum: 53743
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vEfizQhTV1P/vojJ"
Content-Disposition: inline

--vEfizQhTV1P/vojJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 02, 2014 at 09:15:01PM +0100, Richard Purdie wrote:
> We have an open bug about the warnings issues in builds from an sstate
> cache when something like glib-2.0 gets rebuilt. The issue is that
> sstate is "clever" and prunes unneeded dependencies out the tree.
>=20
> For example is X depends on pkgconfig-native but we've already build X
> and installed it from sstate, it will not get installed when you build Y
> which depends on X.
>=20
> This patch changes the logic to match the sstate behaviour and prune out
> unnecessary dependencies from the scope of aclocal. This in turn removes
> the warning about missing manifest files.
>=20
> The issue is that this patch exposes holes in our DEPENDS in recipes,
> specifically that some native tools are not listed, specifically, and
> problematically, pkgconfig, gtk-doc and intltool-native in particular.
>=20
> I've sent out patches against OE-Core that address the bulk of the
> issues there however I'm conscious this is probably going to a bug issue
> in other layers and may be too annoying to consider at this point. The
> other alternative is simply to turn the warning into a debug statement.

I'm fine with new warning like this, because I would say that fixing
this has higher priority than e.g. QA warnings we have, so it's
annoying, but easy to fix.

If you wait +- a week I can do test run on my world builds and report
how many warnings it shows.

> I appreciate the code below has commented blocks, this is simply debug
> I've left around for now. It will be cleaned from any final version.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>=20
> diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbcl=
ass
> index 0dc1e6b..34d432e 100644
> --- a/meta/classes/autotools.bbclass
> +++ b/meta/classes/autotools.bbclass
> @@ -142,15 +142,51 @@ python autotools_copy_aclocals () {
>              return
> =20
>      taskdepdata =3D d.getVar("BB_TASKDEPDATA", False)
> +    #bb.warn(str(taskdepdata))
>      pn =3D d.getVar("PN", True)
>      aclocaldir =3D d.getVar("ACLOCALDIR", True)
>      oe.path.remove(aclocaldir)
>      bb.utils.mkdirhier(aclocaldir)
> +    start =3D None
>      configuredeps =3D []
> +
>      for dep in taskdepdata:
>          data =3D taskdepdata[dep]
> -        if data[1] =3D=3D "do_configure" and data[0] !=3D pn:
> -            configuredeps.append(data[0])
> +        if data[1] =3D=3D "do_configure" and data[0] =3D=3D pn:
> +            start =3D dep
> +            break
> +    if not start:
> +        bb.fatal("Couldn't find ourself in BB_TASKDEPDATA?")
> +
> +    # We need to find configure tasks which are either from <target> -> =
<target>
> +    # or <native> -> <native> but not <target> -> <native> unless they'r=
e direct
> +    # dependencies. This mirrors what would get restored from sstate.
> +    done =3D [dep]
> +    next =3D [dep]
> +    while next:
> +        new =3D []
> +        for dep in next:
> +            data =3D taskdepdata[dep]
> +            for datadep in data[3]:
> +                if datadep in done:
> +                    continue
> +                done.append(datadep)
> +                if (not data[0].endswith("-native")) and taskdepdata[dat=
adep][0].endswith("-native") and dep !=3D start:
> +                    continue
> +                new.append(datadep)
> +                if taskdepdata[datadep][1] =3D=3D "do_configure":
> +                    configuredeps.append(taskdepdata[datadep][0])
> +        next =3D new
> +
> +    #configuredeps2 =3D []
> +    #for dep in taskdepdata:
> +    #    data =3D taskdepdata[dep]
> +    #    if data[1] =3D=3D "do_configure" and data[0] !=3D pn:
> +    #        configuredeps2.append(data[0])
> +    #configuredeps.sort()
> +    #configuredeps2.sort()
> +    #bb.warn(str(configuredeps))
> +    #bb.warn(str(configuredeps2))
> =20
>      cp =3D []
>      for c in configuredeps:
>=20
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--vEfizQhTV1P/vojJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlOM8N8ACgkQN1Ujt2V2gBzKOACeMYlFXqIkK9gBVz80KYJBr3tH
oZIAoKop4dcd+Pe3/K5r5+Jn5iTb7HnP
=BGuG
-----END PGP SIGNATURE-----

--vEfizQhTV1P/vojJ--
