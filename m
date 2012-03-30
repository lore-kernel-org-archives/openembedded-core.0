Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SDdBm-0005Rd-T0 for openembedded-core@lists.openembedded.org;
	Fri, 30 Mar 2012 16:52:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2UEhQ5i013932
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 15:43:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13284-06 for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 15:43:22 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2UEhJgF013926
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2012 15:43:20 +0100
Message-ID: <1333118598.18082.74.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 30 Mar 2012 15:43:18 +0100
In-Reply-To: <20120330142210.GU25815@jama.jama.net>
References: <af4afbb6196cc0f3bacdca43776ae952c7bf4b05.1332541342.git.Martin.Jansa@gmail.com>
	<91da393da433b492fb7db038bd767c8428f24321.1332541342.git.Martin.Jansa@gmail.com>
	<1333116632.18082.72.camel@ted> <20120330142210.GU25815@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCHv 05/10] pixman: add native support and perl-native to DEPENDS from meta-oe
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
X-List-Received-Date: Fri, 30 Mar 2012 14:52:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-30 at 16:22 +0200, Martin Jansa wrote:
> On Fri, Mar 30, 2012 at 03:10:32PM +0100, Richard Purdie wrote:
> > On Fri, 2012-03-23 at 23:30 +0100, Martin Jansa wrote:
> > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > ---
> > >  meta/recipes-graphics/xorg-lib/pixman_0.25.2.bb |    3 ++-
> > >  1 files changed, 2 insertions(+), 1 deletions(-)
> > > 
> > > diff --git a/meta/recipes-graphics/xorg-lib/pixman_0.25.2.bb b/meta/recipes-graphics/xorg-lib/pixman_0.25.2.bb
> > > index bf239d9..e4e3460 100644
> > > --- a/meta/recipes-graphics/xorg-lib/pixman_0.25.2.bb
> > > +++ b/meta/recipes-graphics/xorg-lib/pixman_0.25.2.bb
> > > @@ -12,7 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=14096c769ae0cbb5fcb94ec468be11b3 \
> > >                      file://pixman/pixman-matrix.c;endline=25;md5=ba6e8769bfaaee2c41698755af04c4be \
> > >                      file://pixman/pixman-arm-neon-asm.h;endline=24;md5=9a9cc1e51abbf1da58f4d9528ec9d49b \
> > >                     "
> > > -DEPENDS += "zlib libpng"
> > > +DEPENDS += "zlib libpng perl-native"
> > > +BBCLASSEXTEND = "native"
> > 
> > Er, why does this need perl-native? If it really does, the correct way
> > to do this is with "inherit perlnative" and then PATH gets set
> > correctly. I'd prefer not to add that dependency if its not needed
> > though.
> 
> It was added 2 years ago
> http://git.openembedded.org/openembedded/commit/?id=c1993858d847ac17f4bd00655adf5655fd9d2c6c
> 
> and it's still mandatory dep:
> configure.ac:AC_PATH_PROG(PERL, perl, no)
> configure.ac:if test "x$PERL" = xno; then
> configure.ac:    AC_MSG_ERROR([Perl is required to build pixman.])

We do assume plain perl is present on the system we're building on. I'd
imagine that perl is good enough for the purposes of building pixman?

We did use to have race conditions around using the host perl which is
why we now have perlnative.bbclass. I therefore believe the dependency
is unnecessary...

Cheers,

Richard



