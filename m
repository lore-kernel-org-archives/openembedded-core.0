Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SIg03-0000KF-W8
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Apr 2012 14:53:16 +0200
Received: by wera1 with SMTP id a1so1925238wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Apr 2012 05:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZKt+ZoEj+aO8wbzPOTABMBcMpq+8/gk+5pwNzz7IyPw=;
	b=fC0m5p7+F515Nzv4bVv560LYeXO4Vr9xDgwkIqz3aJMZQjvSvmvYAXWqPf6fFV2tse
	RXkLkF9OClnv3FJRPNiFJS+twn8rfW4n/XNaDIc3p7sMUw4MXuHXIJQPKIjDreiiItpn
	bVdgIeysogIf+SK34H1FO5qGm2k394KlccGW2Tj7aAf7jevAh3O2k4jIiH8Ge3ckeDWM
	X2ViXsHszKGlBH7L83BU3qxc6CxcmjaKZ3yuj9F44EwXRn6mngyccwZ8iwAxz839oJu4
	5LvE+TjyuN3Y2a7IudpdYctr+dwdxap0cGbta2nwgGHETTPDk9V5FDf42npn3j2bR1h7
	M9+Q==
Received: by 10.180.88.169 with SMTP id bh9mr4443503wib.5.1334321034807;
	Fri, 13 Apr 2012 05:43:54 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ev10sm4523126wid.10.2012.04.13.05.43.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Apr 2012 05:43:53 -0700 (PDT)
Date: Fri, 13 Apr 2012 14:43:54 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120413124354.GF3651@jama.jama.net>
References: <1334235858.7309.34.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1334235858.7309.34.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] base.bbclass: Fix PACKAGECONFIG issues with native and nativesdk BBCLASSEXTEND recipes (and multilib)
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
X-List-Received-Date: Fri, 13 Apr 2012 12:53:16 -0000
X-Groupsio-MsgNum: 20706
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f61P+fpdnY2FZS1u"
Content-Disposition: inline

--f61P+fpdnY2FZS1u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 12, 2012 at 02:04:18PM +0100, Richard Purdie wrote:
> This patch fixes up the issues that were being seen where BBCLASSEXTEND a=
nd
> PACKAGECONFIG were interacting badly. It also ensures PACKAGECONFIG inter=
acts
> properly with multilib builds.
>=20
> Ideally some of this code will be abstracted into lib/oe/classextend.py b=
ut
> at this point in release more invasive changes like this are inappropriat=
e.
>=20
> This patch also removed empty strings from expressions rather than
> passing them around as this was complicating the additional code
> unnecessarily.
>=20
> The patch was verified against the OE-Core metadata where the return valu=
es of=20
> expandFilter() were sanity checked by hand for native/nativesdk and
> multilib combinations.

I can confirm it also fixes gtk+-native depends, cannot do more tests
now.

meta-oe people could be interested in this patch
http://git.openembedded.org/meta-openembedded-contrib/commit/?h=3Djansa/xor=
g&id=3D1ab99af784f5f1564f28f6afc4718d630b42a606
when this change hits oe-core

> [YOCTO #2225]
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> index 2e8a0b0..3c9d76c 100644
> --- a/meta/classes/base.bbclass
> +++ b/meta/classes/base.bbclass
> @@ -305,9 +305,32 @@ python () {
>      pkgconfigflags =3D d.getVarFlags("PACKAGECONFIG") or {}
>      if pkgconfigflags:
>          pkgconfig =3D (d.getVar('PACKAGECONFIG', True) or "").split()
> +        pn =3D d.getVar("PN", True)
> +        mlprefix =3D d.getVar("MLPREFIX", True)
> +
> +        def expandFilter(appends, extension, prefix):
> +            appends =3D bb.utils.explode_deps(d.expand(" ".join(appends)=
))
> +            newappends =3D []
> +            for a in appends:
> +               if a.endswith("-native") or a.endswith("-cross"):
> +                   newappends.append(a)
> +               elif a.startswith("virtual/"):
> +                   subs =3D a.split("/", 1)[1]
> +                   newappends.append("virtual/" + prefix + subs + extens=
ion)
> +               else:
> +                   newappends.append(prefix + a + extension)
> +            return newappends
> +
>          def appendVar(varname, appends):
>              if not appends:
>                  return
> +            if varname.find("DEPENDS") !=3D -1:
> +                if pn.endswith("-nativesdk"):
> +                    appends =3D expandFilter(appends, "-nativesdk", "")
> +                if pn.endswith("-native"):
> +                    appends =3D expandFilter(appends, "-native", "")
> +                if mlprefix:
> +                    appends =3D expandFilter(appends, "", mlprefix)
>              varname =3D d.expand(varname)
>              d.appendVar(varname, " " + " ".join(appends))
> =20
> @@ -324,11 +347,14 @@ python () {
>              elif len(items) =3D=3D 4:
>                  enable, disable, depend, rdepend =3D items
>              if flag in pkgconfig:
> -                extradeps.append(depend)
> -                extrardeps.append(rdepend)
> -                extraconf.append(enable)
> -            else:
> -                extraconf.append(disable)
> +                if depend:
> +                    extradeps.append(depend)
> +                if rdepend:
> +                    extrardeps.append(rdepend)
> +                if enable:
> +                    extraconf.append(enable)
> +            elif disable:
> +                    extraconf.append(disable)
>          appendVar('DEPENDS', extradeps)
>          appendVar('RDEPENDS_${PN}', extrardeps)
>          appendVar('EXTRA_OECONF', extraconf)
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f61P+fpdnY2FZS1u
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+IH4oACgkQN1Ujt2V2gBwf/gCfXYCYAFjhKQvQ1myf2kW4DYw0
fysAoJu98VG69dJJaZdtA97S/dsZii26
=aitA
-----END PGP SIGNATURE-----

--f61P+fpdnY2FZS1u--
