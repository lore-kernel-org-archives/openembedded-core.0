Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QuXRe-0002y6-5A
	for openembedded-core@lists.openembedded.org;
	Sat, 20 Aug 2011 00:21:44 +0200
Received: by fxg11 with SMTP id 11so2463810fxg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 15:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=N7ChG8e72ipjFfjcRsNHL6YZOyIvHIy3Xs0Xn6QEMMY=;
	b=UFsjRwEAJwy/0f1HHAD6yh4jDkb5QBXwWqOepsJgH0gfrt7rS2U62FpKz/iq/31z/7
	VP7jdaLU5sWKzla1+Xzjy5tnrv2sgbDn1DIkMrhlFfxueuwTG/NKNDNvzRC7LAXAY4+E
	KfXaYOA5pzqXJT8lmFTug0IKSvbtlZ6VoO5U0=
Received: by 10.223.89.2 with SMTP id c2mr321290fam.50.1313792221350;
	Fri, 19 Aug 2011 15:17:01 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r12sm2900644fam.38.2011.08.19.15.16.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 19 Aug 2011 15:17:00 -0700 (PDT)
Date: Sat, 20 Aug 2011 00:16:53 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110819221653.GE22251@jama.jama.net>
References: <4e4e5424.8c5cdf0a.7d94.ffffbafd@mx.google.com>
	<CABcZAN=mt6HCmtMnX+P4-BAOkQwZZ3uCS_sT+uutziBu0VYv9w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZAN=mt6HCmtMnX+P4-BAOkQwZZ3uCS_sT+uutziBu0VYv9w@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] utils.bbclass: skip empty paths when handling FILESEXTRAPATHS
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
X-List-Received-Date: Fri, 19 Aug 2011 22:21:44 -0000
X-Groupsio-MsgNum: 8516
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wchHw8dVAp53YPj8"
Content-Disposition: inline

--wchHw8dVAp53YPj8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 19, 2011 at 03:11:08PM -0700, Chris Larson wrote:
> On Fri, Aug 19, 2011 at 5:16 AM,  <martin.jansa@gmail.com> wrote:
> > From: Martin Jansa <Martin.Jansa@gmail.com>
> >
> > * if there is multiple .bbappend files with FILESEXTRAPATHS_prepend :=
=3D "/:"
> > =A0then the one parsed last is causing trailing ':' and that's causing =
empty element in
> > =A0path =3D extrapaths.split(:) + path
> > * it's hard to keep all .bbappends from foreign layers to follow this r=
ule, so it's better
> > =A0to be able to handle trailing ':'
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> > =A0meta/classes/utils.bbclass | =A0 =A05 +++--
> > =A01 files changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
> > index 56abdd8..3c2e342 100644
> > --- a/meta/classes/utils.bbclass
> > +++ b/meta/classes/utils.bbclass
> > @@ -338,8 +338,9 @@ def base_set_filespath(path, d):
> > =A0 =A0 =A0 =A0# The ":" ensures we have an 'empty' override
> > =A0 =A0 =A0 =A0overrides =3D (bb.data.getVar("OVERRIDES", d, 1) or "") =
+ ":"
> > =A0 =A0 =A0 =A0for p in path:
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 for o in overrides.split(":"):
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 filespath.append(os.path.=
join(p, o))
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if p !=3D "":
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 for o in overrides.split(=
":"):
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 filespath=
=2Eappend(os.path.join(p, o))
>=20
> You shouldn't use 'p !=3D "":'. Instead, use the fact that the empty
> string is false in boolean context.  'if p:'.
>=20
> Of course, you could also use filter. path =3D filter(None, path) --
> filtering an iterable with a function of None results in it dropping
> all false values. But then, there's a tendency nowadays to avoid
> map/filter/etc, so that's probably not best :)

does it apply to all !=3D "" in utils.bbclass? because I've used it just
because it's at least 3 times in this file already.. so to be consistent
with the rest..

Regards,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wchHw8dVAp53YPj8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk5O4NUACgkQN1Ujt2V2gBxfHgCfQBYaVZAMtLO0L9XD5ppbiqiV
+cIAoJgQKkyOy1vvjI2ak5GOEkMQluwJ
=yrBS
-----END PGP SIGNATURE-----

--wchHw8dVAp53YPj8--
