Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id CCA0E6B200
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 10:17:45 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id e49so3914509eek.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Mar 2014 03:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bcKIWrXKyfXyIj8hY/ivt2ms2JmaRdywO9xsfoHck6U=;
	b=cApnVwshHrNSMm5ln0BzKcNDG4b3cyxV2G+DTwzzlNW0XGQtb0m4juy9wV6nV/gibZ
	4kaCp6nQZ16JNm941T/7QXqqVVSZqJdpbRx91d8oN3LCs1UVugDZ15eQGMiINsU3BSML
	nsIykvJCly7ZKsWgaBYkoz1ufkLhQOL+faU0FpZtQFcvQyYDSdUmqKzqX3XRAITscDoU
	ZgmbOgYZH19e/OoeAUyKpaL4AbJANDtPLUupMS1yX1fZvMEYlbmzKrjidfA84/4WaCyp
	+X6zHHSSrMuVLfgMUJZbFEA7o8cjT1EBZhQ/lpFhmh3bvUHdyuU7TwK2dWhRI5F8jO9f
	GPxQ==
X-Received: by 10.15.43.77 with SMTP id w53mr8917144eev.10.1396001866085;
	Fri, 28 Mar 2014 03:17:46 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bc51sm10624821eeb.22.2014.03.28.03.17.43 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Mar 2014 03:17:44 -0700 (PDT)
Date: Fri, 28 Mar 2014 11:17:45 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <20140328101745.GB3714@jama>
References: <cover.1395996410.git.hongxu.jia@windriver.com>
	<83f0a66f2733ddb620e210ff46fbe67e86d74ceb.1395996410.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <83f0a66f2733ddb620e210ff46fbe67e86d74ceb.1395996410.git.hongxu.jia@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: saul.wold@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/5] libc-common.bbclass: rename ALL the packages
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
X-List-Received-Date: Fri, 28 Mar 2014 10:17:46 -0000
X-Groupsio-MsgNum: 51785
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZfOjI3PrQbgiZnxM"
Content-Disposition: inline

--ZfOjI3PrQbgiZnxM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 28, 2014 at 05:43:54PM +0800, Hongxu Jia wrote:
> From: Peter Seebach <peter.seebach@windriver.com>
>=20
> The DEBIAN_NAMES feature renames some of the libc packages to
> "libc6*" names --but only some. A previous patch added the -dbg
> package. However, this doesn't cover other packages (such as
> the -doc package), and it didn't take multilibs into account.
>=20
> Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
> Signed-off-by: Jeff Polk <jeff.polk@windriver.com>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/classes/libc-common.bbclass | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
>=20
> diff --git a/meta/classes/libc-common.bbclass b/meta/classes/libc-common.=
bbclass
> index daf499d..53bf467 100644
> --- a/meta/classes/libc-common.bbclass
> +++ b/meta/classes/libc-common.bbclass
> @@ -25,12 +25,19 @@ def get_libc_fpu_setting(bb, d):
> =20
>  python populate_packages_prepend () {
>      if d.getVar('DEBIAN_NAMES', True):
> +        pkgs =3D d.getVar('PACKAGES', True).split()
>          bpn =3D d.getVar('BPN', True)
> -        d.setVar('PKG_'+bpn, 'libc6')
> -        d.setVar('PKG_'+bpn+'-dev', 'libc6-dev')
> -        d.setVar('PKG_'+bpn+'-dbg', 'libc6-dbg')
> +        prefix =3D d.getVar('MLPREFIX', True) or ""
> +        # Set the base package...
> +        d.setVar('PKG_' + prefix + bpn, prefix + 'libc6')
> +        initial =3D prefix + bpn + '-'

I would prefer better variable name here, first thing on my mind when
I've seen it was eglibc-initial and I was wondering why should all libc
packages be renamed like that.

> +        for p in pkgs:
> +            # And all the subpackages.
> +            if p.startswith(initial):
> +                renamed =3D p.replace(bpn, 'libc6', 1)
> +                d.setVar('PKG_' + p, renamed)
>          # For backward compatibility with old -dbg package
> -        d.appendVar('RPROVIDES_' + bpn + '-dbg', ' libc-dbg')
> -        d.appendVar('RCONFLICTS_' + bpn + '-dbg', ' libc-dbg')
> -        d.appendVar('RREPLACES_' + bpn + '-dbg', ' libc-dbg')
> +        d.appendVar('RPROVIDES_' + initial + 'dbg', ' ' + prefix + 'libc=
-dbg')
> +        d.appendVar('RCONFLICTS_' + initial + 'dbg', ' ' + prefix + 'lib=
c-dbg')
> +        d.appendVar('RREPLACES_' + initial + 'dbg', ' ' + prefix + 'libc=
-dbg')
>  }
> --=20
> 1.8.1.2
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZfOjI3PrQbgiZnxM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlM1TEkACgkQN1Ujt2V2gByEpgCbBTHLll7xUYsMKILqUx/pEMig
iCwAnR3eDCCrpmkSfvJooGMpzdk88NFk
=W8hV
-----END PGP SIGNATURE-----

--ZfOjI3PrQbgiZnxM--
