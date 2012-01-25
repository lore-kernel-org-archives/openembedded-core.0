Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Rq3TX-0002aT-27
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 15:05:23 +0100
Received: by eekd41 with SMTP id d41so1693401eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jan 2012 05:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AmXA7t/G6y93uI8sAucsZgUOogNl0COMWZVFYfrBtjU=;
	b=HTLrzwmPLm7ACYy35bYo8VIrJoWeCjDM8yHciEjudLD1TtFY0uGxgkHQe05bMm4YdZ
	TD+eHBT4ZpEH+22IPvQEa/QJCiBZIwWfga7O4Sk+X4sj1DRDTcHCHlG5eeZjvWmqHjDf
	eybtpw3ayLkQvrSvxeGU+/lcpu0ZAwMp1srDg=
Received: by 10.14.2.1 with SMTP id 1mr6187332eee.24.1327499856445;
	Wed, 25 Jan 2012 05:57:36 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x4sm1960619eeb.4.2012.01.25.05.57.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jan 2012 05:57:31 -0800 (PST)
Date: Wed, 25 Jan 2012 14:57:29 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120125135729.GD3843@jama.jama.net>
References: <1327425074.19643.101.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1327425074.19643.101.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] lib/oe/sstatesig.py: Exclude common machine specific dependencies from task signatures
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
X-List-Received-Date: Wed, 25 Jan 2012 14:05:23 -0000
X-Groupsio-MsgNum: 16541
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sgneBHv3152wZ8jf"
Content-Disposition: inline

--sgneBHv3152wZ8jf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 24, 2012 at 05:11:14PM +0000, Richard Purdie wrote:
> Where we have machine specific recipes with well defined behaviour, it ma=
kes
> no sense to rebuild recipes with these as dependencies whenever the machi=
ne
> changes. This patch lists those well behaved recipes and excludes them fr=
om
> the task signatures so we can change MACHINE without invalidating existing
> PACKAGE_ARCH binaries.

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
> index 247f592..ee7cbad 100644
> --- a/meta/lib/oe/sstatesig.py
> +++ b/meta/lib/oe/sstatesig.py
> @@ -26,6 +26,10 @@ def sstate_rundepfilter(fn, recipename, task, dep, dep=
name):
>      if isNative(depname) or isCross(depname) or isNativeSDK(depname):
>          return False
> =20
> +    # Exclude well defined machine specific configurations which don't c=
hange ABI
> +    if depname in ['sysvinit-inittab', 'shadow-securetty', 'opkg-config-=
base', 'netbase', 'formfactor', 'xserver-xf86-config', 'pointercal', 'base-=
files']:
> +        return False
> +
>      # Default to keep dependencies
>      return True
> =20
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sgneBHv3152wZ8jf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8gCkkACgkQN1Ujt2V2gBwuGwCfbyJAKqSNugM4v6LT8U9Lg7V2
pbEAnjNsQgqbA6Ip1hA2SQiLGlNHcMlf
=HqN5
-----END PGP SIGNATURE-----

--sgneBHv3152wZ8jf--
