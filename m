Received: from mail-da0-f53.google.com ([209.85.210.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UUzCg-00058g-VA
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 14:53:43 +0200
Received: by mail-da0-f53.google.com with SMTP id n34so860858dal.40
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2013 05:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=znJPDOna7Ci5qKjtC85Twbkzd/f7/Uphj4bee6jl7FU=;
	b=hnBE4MkM6OvdYeegjZwShyx4r3Tjk1bXCMLJ+vl/Smem5hVj3+IJu+ESZAPDdcBlOT
	94E5hwzQywW6d951Do81gZBAnHhdT0OKw02Vu5VYPotJYsBC0ZEmNyCNvR6weCMJoa2C
	CACaaX/H7mvtecfBYv53TW5tA99SHsKUJXQ+sl4lYMfVf0ArujCk16vuc3xtycG1vggx
	ZEI+d2lrLgCGEL4ezn5EplASmPlxdLz+Y5WRqwcJOOi2i+qBPgQ2Iulswyze9lJ6OZon
	930EayTevTVVZupt5S08drXA5vutsNDpC3aj5NDZcehXYX59OTKEjlCC6J9GY8ypM4R7
	2XEQ==
X-Received: by 10.68.228.134 with SMTP id si6mr47579222pbc.24.1366806960199;
	Wed, 24 Apr 2013 05:36:00 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	aj2sm2946564pbc.1.2013.04.24.05.35.57 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 24 Apr 2013 05:35:59 -0700 (PDT)
Date: Wed, 24 Apr 2013 14:36:08 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20130424123608.GI3217@jama>
References: <CALbNGRQ4vS=kvgqNZyS5G9HRBE1ixrta_uF+PvzOPZvfjbhNkQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQ4vS=kvgqNZyS5G9HRBE1ixrta_uF+PvzOPZvfjbhNkQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: postinst questions (was postinst does not finish)
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
X-List-Received-Date: Wed, 24 Apr 2013 12:53:43 -0000
X-Groupsio-MsgNum: 38296
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jaTU8Y2VLE5tlY1O"
Content-Disposition: inline

--jaTU8Y2VLE5tlY1O
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2013 at 02:04:39PM +0200, Andreas M=FCller wrote:
> Hi
>=20
> as written before: an 'exit 1' within recipe's postinst causes
> trouble. E.g meta-oe's lxdm does not run systemd.bbclass' code which
> leaves lxdm in unprepared condition causing start too early and ending
> in unfinished postinstall.
>=20
> A simple workaround for this (we should think of something else later)
> would be to prepend postinst code within systemd.bbclass (and maybe
> others too) instead of appending. Hereby we ensure that the code is
> executed independent of recipe's code. First question: Any objections?
>=20
> In case of no objections: Second question: Is shebang in
> post/pre/install/remove scripts (I saw many scripts without shebang)?

When looking for something else I've noticed
package.bbclass:do_split_packages
    if postinst:
        postinst =3D '#!/bin/sh\n' + postinst + '\n'
    if postrm:
        postrm =3D '#!/bin/sh\n' + postrm + '\n'

and few other places like update-alternatives.bbclass:
meta/classes/update-alternatives.bbclass:            postinst =3D d.getVar(=
'pkg_postinst_%s' % pkg, True) or '#!/bin/sh\n'
meta/classes/update-alternatives.bbclass:            postrm =3D d.getVar('p=
kg_postrm_%s' % pkg, True) or '#!/bin/sh\n'

Maybe it would be easier to prepend shebang only in one place, just
before it's written in package. Well until someone decides to write some
postinst script in perl :).


>=20
> Andreas
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jaTU8Y2VLE5tlY1O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlF30bgACgkQN1Ujt2V2gBzVxQCcDqkNuYHA2P9jVbyY25IiQv2v
goQAn1Q7Va6B9mBkZQTsLnTkMuOBWoH4
=SSjr
-----END PGP SIGNATURE-----

--jaTU8Y2VLE5tlY1O--
