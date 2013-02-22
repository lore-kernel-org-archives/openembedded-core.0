Received: from sestofw01.enea.se ([192.36.1.252] helo=mx-3.enea.com)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <bjst@sestofb10.enea.se>) id 1U8vEV-0007Sn-De
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Feb 2013 17:12:24 +0100
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Fri, 22 Feb 2013 16:56:05 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4331)	id 0D02E2831B8;
	Fri, 22 Feb 2013 16:56:06 +0100 (CET)
Date: Fri, 22 Feb 2013 16:56:06 +0100
From: =?iso-8859-1?Q?Bj=F6rn?= Stenberg <bjst@enea.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130222155605.GI55106@sestofb10.enea.se>
References: <1361279644-17675-1-git-send-email-bjst@enea.com>
	<1361279644-17675-3-git-send-email-bjst@enea.com>
	<1361541751.9309.40.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1361541751.9309.40.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX03.enea.se: bjst@enea.com does not designate
	permitted sender hosts)
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
X-List-Received-Date: Fri, 22 Feb 2013 16:12:24 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote:
> > +RDEPENDS_${PN}-ptest +=3D "make"
> > +RDEPENDS_${PN}-ptest_virtclass-native =3D ""
> > +RDEPENDS_${PN}-ptest_virtclass-nativesdk =3D ""
>=20
> The above scares me. Why? This is going to make packaging of zlib
> dependent on the packaging of make, due to the way our packaging works.

Will it? The intention is to specify that make is only required for running=
 zlib-ptest (and only on target). We do a similar RDEPENDS-ptest declaratio=
n in glib-2.0, adding some tzdata and python packages.

I must admit to not building without ptest very often, but I was under the =
impression this works as intended.

> I also wonder if the make dependency itself isn't best left against the
> main ptest-runner script itself rather and each ptest package.

While make is used by many test suites and could be added to ptest-runnner =
to reduce clutter in other recipes, I think it is the wrong thing to do. Yo=
u don't have to install ptest-runner to run ptests, it is merely a convenie=
nce script that makes it easier to run all of them at once.

Also, make is not the only package required by test suites. For example the=
 gcc-runtime test suite I'll be submitting soon depends on dejagnu (which d=
epends on expect, which depends on tcl). And others still depend on perl or=
 other largeish packages.

> > +FILES_${PN}-dbg +=3D "${PTEST_PATH}/.debug"
> Is this needed after the other fix?

No, this was a leftover mistake. Thanks for spotting it.

--=20
Bj=F6rn


