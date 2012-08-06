Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SyJnw-0000Jv-Pr
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Aug 2012 11:40:52 +0200
Received: by wibhq4 with SMTP id hq4so1332209wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Aug 2012 02:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=FfLOcX1s03goW9MoUULzSc5mh3yLmSepyHqTWqsIo4E=;
	b=fbFWNywhwCNfYVWbBQN2+87Q3txH/c9LnhY+kQsd7+fAhLcpNsWKZcWk6u7tT8HV9G
	HYpQbBpW4nZ0k79wqJ2KjhEeZLnR3OufSrIpbDgB3cf+giLiM+qh6QTbt6ItBsc1T1We
	XWwREDMn/f1CUwFIPy1P8lmYwKBnfs5gC+2W1z3UjHvosgr/3SkqreVKE4l3BElSshtI
	/L2rvRYVzU1qRn5y4yBmV6bqMKGvzfVjkMrT5/IrE5+1nZdIjIHRlIC3RKk7zl8F8uhN
	1CviFqRwxPsNnxBZo3ni6QCU4ko4wjbbpxovplxxCIg15P0i1n07ViOtLcqD8AK+dvNH
	rQsA==
Received: by 10.180.98.138 with SMTP id ei10mr16841355wib.1.1344245348493;
	Mon, 06 Aug 2012 02:29:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ex20sm21605224wid.7.2012.08.06.02.29.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Aug 2012 02:29:07 -0700 (PDT)
Date: Mon, 6 Aug 2012 11:29:03 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120806092903.GG3267@jama.jama.net>
References: <cover.1343124846.git.liezhi.yang@windriver.com>
	<7affb352c173c353df0b69002f3ca0f5ee0502cf.1343124846.git.liezhi.yang@windriver.com>
	<1343126992.22222.11.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1343126992.22222.11.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 1/1] package-index: inherit pythonnative
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
X-List-Received-Date: Mon, 06 Aug 2012 09:40:52 -0000
X-Groupsio-MsgNum: 27008
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="doKZ0ri6bHmN2Q5y"
Content-Disposition: inline

--doKZ0ri6bHmN2Q5y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 24, 2012 at 11:49:52AM +0100, Richard Purdie wrote:
> On Tue, 2012-07-24 at 18:19 +0800, Robert Yang wrote:
> > The native python binary has been moved from usr/bin/python to
> > usr/bin/python-native/python, the recipe which needs python-native
> > should "inherit pythonnative", otherwise there would be errors when the
> > python script runs.
> >=20
> > [YOCTO #2822]
> >=20
> > Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> > ---
> >  meta/recipes-core/meta/package-index.bb |    2 ++
> >  1 files changed, 2 insertions(+), 0 deletions(-)
>=20
> Which part of this recipe needs python-native? Shouldn't scripts which
> need pythonnative be using the path to the python interpreter
> explicitly?

This fixes my opkg-utils related issues too
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/026333.html

The problem is that with pythonnative in opkg-utils it's still using=20
#!/usr/bin/env python
in tmp-eglibc/sysroots/x86_64-linux/usr/bin/opkg-make-index

And when python-index executes this:
| + [ -e /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/deplo=
y/ipk/ ]
| + touch /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/depl=
oy/ipk/Packages
| + flock /var/lib/jenkins/jobs/shr-core/workspace/shr-core/tmp-eglibc/depl=
oy/ipk/Packages.flock -c opkg-make-index -r /var/lib/jenkins/jobs/shr-core/=
workspace/shr-core/tmp-eglibc/deploy/ipk/Packages -p /var/lib/jenkins/jobs/=
shr-core/workspace/shr-core/tmp-eglibc/deploy/ipk/Packages -m /var/lib/jenk=
ins/jobs/shr-core/workspace/shr-core/tmp-eglibc/deploy/ipk/
| Traceback (most recent call last):

It depends on PATH of package-index not opkg-utils.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--doKZ0ri6bHmN2Q5y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAfjl8ACgkQN1Ujt2V2gBxJ3gCeIzlTQe/mSkoE9xp/0ocx0JzH
TAwAoIKBzhDlTCvtcz+nt1ugYRIH4Nlv
=DH7P
-----END PGP SIGNATURE-----

--doKZ0ri6bHmN2Q5y--
