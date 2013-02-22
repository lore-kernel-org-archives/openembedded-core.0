Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U8wr6-00017C-It for openembedded-core@lists.openembedded.org;
	Fri, 22 Feb 2013 18:56:22 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1MHkjX2028674; Fri, 22 Feb 2013 17:46:45 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id b0PDYYt6bOgJ; Fri, 22 Feb 2013 17:46:45 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1MHkaoL028669
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 22 Feb 2013 17:46:41 GMT
Message-ID: <1361554778.25338.31.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
Date: Fri, 22 Feb 2013 09:39:38 -0800
In-Reply-To: <20130222155605.GI55106@sestofb10.enea.se>
References: <1361279644-17675-1-git-send-email-bjst@enea.com>
	<1361279644-17675-3-git-send-email-bjst@enea.com>
	<1361541751.9309.40.camel@ted>
	<20130222155605.GI55106@sestofb10.enea.se>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	r1MHkjX2028674
Cc: Anders Roxell <anders.roxell@enea.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/8] zlib: Add ptest
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
X-List-Received-Date: Fri, 22 Feb 2013 17:56:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2013-02-22 at 16:56 +0100, Bj=C3=B6rn Stenberg wrote:
> Richard Purdie wrote:
> > > +RDEPENDS_${PN}-ptest +=3D "make"
> > > +RDEPENDS_${PN}-ptest_virtclass-native =3D ""
> > > +RDEPENDS_${PN}-ptest_virtclass-nativesdk =3D ""
> >=20
> > The above scares me. Why? This is going to make packaging of zlib
> > dependent on the packaging of make, due to the way our packaging work=
s.
>=20
> Will it?

It will.

>  The intention is to specify that make is only required for running
> zlib-ptest (and only on target). We do a similar RDEPENDS-ptest
> declaration in glib-2.0, adding some tzdata and python packages.

See below.
>=20
> I must admit to not building without ptest very often, but I was under
> the impression this works as intended.

I'm not saying it won't work. What it will do is increase build time,
probably significantly, particularly if we do this a lot. This will not
be acceptable to some.

> > I also wonder if the make dependency itself isn't best left against t=
he
> > main ptest-runner script itself rather and each ptest package.
>=20
> While make is used by many test suites and could be added to
> ptest-runnner to reduce clutter in other recipes, I think it is the
> wrong thing to do. You don't have to install ptest-runner to run
> ptests, it is merely a convenience script that makes it easier to run
> all of them at once.
>=20
> Also, make is not the only package required by test suites. For
> example the gcc-runtime test suite I'll be submitting soon depends on
> dejagnu (which depends on expect, which depends on tcl). And others
> still depend on perl or other largeish packages.

The issue is that on most system images other than tiny ones, we
probably end up triggering perl/python to build. Most devices don't end
up with make. If we do go this route (and I'm not sure we have any
choice), we need to ensure that the dependencies don't hurt people who
don't want ptest and to try and minimise the performance impact. We at
least need to be aware it will hurt build performance.

Cheers,

Richard




