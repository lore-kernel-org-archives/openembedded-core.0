Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Swu6G-0006ZI-TV
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 14:01:56 +0200
Received: by wibhq4 with SMTP id hq4so4345177wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 04:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2dvCi8rCQoglYBHvHLd7NpR6d4azc61yzH9u0yyU0qM=;
	b=zx3DJY1ezuIhwGKocKDGbnYxU7+d992B/9jEb3x2FjwDxaCn0UE6bjMF/SZ8uWI5Ui
	Cz/bUQCFBo5H4mcq60qmymDWsCE5a94x9iObKpnBfILQM8TmUhSHzTRGn+XeJWfyWJqM
	vpv8/WrjpIsJ9GesPrfQlBiUPrN6TquminMBRarvpmwtdstxDsR7uxfj0afmrmzqzKc1
	+TLIdJU7rcBgxvtdgyyxF5+HYGTZ/mOIAQEhRFF5fqQsFt81RWEjotAitRsi6m+kHgTh
	xz2k85anD9XMsKV78IOzvtPq0sbLxZ6dZbG77/jFe5KOS8JUSkn1v9STTmf8WkmHOUx3
	bPJQ==
Received: by 10.216.182.195 with SMTP id o45mr10864774wem.185.1343908217471;
	Thu, 02 Aug 2012 04:50:17 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b7sm16700417wiz.9.2012.08.02.04.50.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 04:50:14 -0700 (PDT)
Date: Thu, 2 Aug 2012 13:50:12 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120802115012.GO16306@jama.jama.net>
References: <20120801065021.GC15199@jama.jama.net>
	<20120801065401.GD15199@jama.jama.net>
	<8071B2D8-3431-4B9B-A810-0F01D4837779@gmail.com>
MIME-Version: 1.0
In-Reply-To: <8071B2D8-3431-4B9B-A810-0F01D4837779@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: u-boot do_compile should be reentrant even with ld-is-gold
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
X-List-Received-Date: Thu, 02 Aug 2012 12:01:57 -0000
X-Groupsio-MsgNum: 26772
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="B3NBd8mrXZtPJEYR"
Content-Disposition: inline

--B3NBd8mrXZtPJEYR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 01, 2012 at 04:02:24PM -0700, Khem Raj wrote:
>=20
> On Jul 31, 2012, at 11:54 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> > well not exactly like this one as this is causing
> > /bin/sh: 1: Syntax error: Bad fd number
> > probably from ">&" in dash
>=20
>=20
> yes. I swear I have since fixed this patch this seems to be an older vers=
ion
> did you look into meta-ti/master ?

Yes, your patch is fixed in meta-ti, but cannot be used together with
Otavio's patch to u-boot.inc.

meta-ti is fine because it provides own u-boot.inc, but with your patch
and u-boot.inc from oe-core it ends like this

config.mk:
+LD     =3D $(call exists_bfd_ld, "$(CROSS_COMPILE)ld.bfd.bfd","$(CROSS_COM=
PILE)ld.bfd")

On Wed, Aug 01, 2012 at 09:32:03AM -0300, Otavio Salvador wrote:
> Wouldn't be better to grep for 'ld.bfd' and apply it *only* if not is not=
 found?

no need for grep, something like
-               sed -i 's/$(CROSS_COMPILE)ld/$(CROSS_COMPILE)ld.bfd/g' conf=
ig.mk
+               sed -i 's/$(CROSS_COMPILE)ld$/$(CROSS_COMPILE)ld.bfd/g' con=
fig.mk
should be enough, I will test and send patch..

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--B3NBd8mrXZtPJEYR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAaaXQACgkQN1Ujt2V2gBzlZwCfc+L6ZzhAz37mBy692dpLsWjy
fAMAoK21ZsGE2zgaoPZm3gYf0o0qBKU9
=5XD5
-----END PGP SIGNATURE-----

--B3NBd8mrXZtPJEYR--
