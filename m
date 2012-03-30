Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SDeQM-0007Mw-Kt for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 18:11:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2UG2XLC014489
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 17:02:33 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13284-10 for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 17:02:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2UG2OYI014482
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 17:02:25 +0100
Message-ID: <1333123344.18082.94.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 30 Mar 2012 17:02:24 +0100
In-Reply-To: <20120330172440.54592fce@eb-e6520>
References: <20120329225332.0e8cc2f4@eb-e6520>
	<1333058593.18082.40.camel@ted> <20120330105006.00955b5d@eb-e6520>
	<1333120364.18082.77.camel@ted> <20120330172440.54592fce@eb-e6520>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
X-MIME-Autoconverted: from 8bit to quoted-printable by tim.rpsys.net id
	q2UG2XLC014489
Subject: Re: Fetch time optimization (svn : gcc/eglibc - git : linux-yocto)
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
X-List-Received-Date: Fri, 30 Mar 2012 16:11:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2012-03-30 at 17:24 +0200, Eric B=C3=A9nard wrote:
> Le Fri, 30 Mar 2012 16:12:44 +0100,
> Richard Purdie <richard.purdie@linuxfoundation.org> a =C3=A9crit :
> > On Fri, 2012-03-30 at 10:50 +0200, Eric B=C3=A9nard wrote:
> > > the default configuration seems to fetch from source control system=
s
> > > as I always see very long time to fetch gcc/eglibc/linux-yocto
> > > (despite having a 2.2 MBytes/s downlink DSL line).
> >=20
> > If you're hitting the SCMs I can understand the frustration.
> >=20
> that's not a frustration, that's a feedback on the default
> behaviour. But I agree with you that could be a frustration for someone
> trying OE-core for the first time ;-)
>=20
> > Try adding this to your configuration:
> >=20
> > PREMIRRORS =3D "\
> > git://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \n \
> > svn://.*/.*   http://downloads.yoctoproject.org/mirror/sources/ \n"
> >=20
> > and see if that helps the performance. It might be we consider making
> > this the default for OE-Core although some people are nervous about
> > doing this...
> >=20
> sure that will help : in my work setup I have my own mirrors configured
> but here again, that's not what a new user will have and in that
> case, I'm testing the plain default configuration to help finding bugs
> or things to improve the release.
>=20
> I think fetching from git or svn should not be the first thing to do in
> recipes like gcc, eglibc, linux & co where we are based on a
> stable released version : this doesn't bring real added value to the
> user in OE context and this wastes bandwidth (a tbz2 kernel is around
> 75MB, a git one is around 600MB).

We've gone around in circles on this. We did use tarballs for gcc,
people complained. We switched to svn, you're not happy and probably
others aren't. We can't win.

Adding the PREMIRRORS makes the situation better, I agree its not
perfect. The original question was how can we speed it up and this is an
easy way to do so for the default user case without changing anything
major.

I hear what you're saying on the tarball vs. SCM issue but using
tarballs does break use cases some users do use, the opposite is not
true.=20

Its also ultimately down to the maintainers of recipes. The gcc issue is
more maintainable the way its set up now compared to large numbers of
patches (which took an age to apply) and doesn't have much of an
additional bandwidth cost.

The linux-yocto kernel recipe heavily uses the SCM to do things so
whilst it does have a higher download cost, it as adds value and is
ultimately a maintainers choice too.

So whilst I hear what you're saying, I don't think we can change
anything other than the PREMIRROR...

Cheers,

Richard





