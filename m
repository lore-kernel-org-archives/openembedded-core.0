Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S8a5Y-0000j2-Nc for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 17:33:12 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2GGOMjq005052;
	Fri, 16 Mar 2012 16:24:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 04815-01; Fri, 16 Mar 2012 16:24:18 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q2GGOEGV005045
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Fri, 16 Mar 2012 16:24:15 GMT
Message-ID: <1331915055.18586.201.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 16 Mar 2012 16:24:15 +0000
In-Reply-To: <4F636508.2090908@linux.intel.com>
References: <cover.1331848750.git.dvhart@linux.intel.com>
	<5ca651eb19c3fcb64de2ce405de0bc7fa2a8c90b.1331848750.git.dvhart@linux.intel.com>
	<4F636508.2090908@linux.intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Darren Hart <dvhart@linux.intel.com>
Subject: Re: [PATCH 1/1] rt-tests: Add src/backfire to FILES_${PN}
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
X-List-Received-Date: Fri, 16 Mar 2012 16:33:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-03-16 at 09:06 -0700, Saul Wold wrote:
> On 03/15/2012 03:00 PM, Darren Hart wrote:
> > Fixes [YOCTO #2114]
> >
> > The rt-tests recipe was issuing the following WARNINGs:
> >
> > WARNING: For recipe rt-tests, the following files/directories were installed
> > but not shipped in any package:
> > WARNING:   /usr/src
> > WARNING:   /usr/src/backfire
> > WARNING:   /usr/src/backfire/backfire.c
> > WARNING:   /usr/src/backfire/Makefile
> >
> > Add ${prefix}/src/backfire to FILES_${PN} to include these files in the package.
> > These depend on the target kernel and are meant to be able to be rebuilt as
> > needed.  Ideally we would also build this module and include it with rt-tests or
> > the linux-yocto-rt kernel. For now, conform with the intent of the rt-tests
> > Makefile and avoid the WARNINGs.
> >
> > Signed-off-by: Darren Hart<dvhart@linux.intel.com>
> > ---
> >   meta/recipes-rt/rt-tests/rt-tests_0.83.bb |    3 +++
> >   1 files changed, 3 insertions(+), 0 deletions(-)
> >
> > diff --git a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
> > index 78d51b3..6425027 100644
> > --- a/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
> > +++ b/meta/recipes-rt/rt-tests/rt-tests_0.83.bb
> > @@ -11,6 +11,7 @@ SRCREV = "5f1e84f8b015df3ff950056494134eca3f640d70"
> >
> >   # git ->  0.83 needs a PE bump
> >   PE = "1"
> > +PR = "r1"
> >
> >   SRC_URI = "git://github.com/clrkwllms/rt-tests.git"
> >
> > @@ -25,3 +26,5 @@ do_install() {
> >           oe_runmake install DESTDIR=${D} SBINDIR=${sbindir} MANDIR=${mandir} \
> >                              INCLUDEDIR=${includedir}
> >   }
> > +
> > +FILES_${PN} += "${prefix}/src/backfire"
> Darren,
> 
> I looked closer and you need you use ${D}${prefix}/src here instead, 
> that will get you what you want.

You should not need ${D} here...

Cheers,

Richard



