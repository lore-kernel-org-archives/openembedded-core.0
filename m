Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rykyr-0002M2-A9 for openembedded-core@lists.openembedded.org;
	Sat, 18 Feb 2012 15:09:42 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1IE1Mnr014893;
	Sat, 18 Feb 2012 14:01:22 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12223-04; Sat, 18 Feb 2012 14:01:17 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1IE19xB014887
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 18 Feb 2012 14:01:12 GMT
Message-ID: <1329573666.1884.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 18 Feb 2012 14:01:06 +0000
In-Reply-To: <20120218115651.GA11351@jama.jama.net>
References: <1e2722b29db9486276198e13f06345babce10518.1329147583.git.Martin.Jansa@gmail.com>
	<b17109ebc9396973f7c0dbf6812699e2c0930349.1329147583.git.Martin.Jansa@gmail.com>
	<4F3ED680.5020909@linux.intel.com>
	<20120218115651.GA11351@jama.jama.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/4] gdb-cross-canadian: use NATIVESDK paths as it happens to be here
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
X-List-Received-Date: Sat, 18 Feb 2012 14:09:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2012-02-18 at 12:56 +0100, Martin Jansa wrote:
> On Fri, Feb 17, 2012 at 02:36:48PM -0800, Saul Wold wrote:
> > On 02/13/2012 07:40 AM, Martin Jansa wrote:
> > > * seems like config/config in -L was also wrong
> > >
> > > Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> > > ---
> > >   meta/recipes-devtools/gdb/gdb-cross-canadian.inc |   10 ++++++++--
> > >   1 files changed, 8 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> > > index b5746ce..bac63b7 100644
> > > --- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> > > +++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
> > > @@ -10,12 +10,18 @@ RDEPENDS += "python-nativesdk-core python-nativesdk-lang python-nativesdk-re \
> > >
> > >   EXTRA_OECONF_append = "--with-python=${WORKDIR}/python"
> > >
> > > +NATIVESDK_NAME = "oecore-${SDK_ARCH}-${SDK_ARCH}"
> > > +NATIVESDK_PATH = "/usr/local/${NATIVESDK_NAME}"
> 
> Ah, I was reusing definition from bitbake.conf:
> meta/conf/bitbake.conf:SDK_NAME = "oecore-${SDK_ARCH}-${TARGET_ARCH}"
> 
> with only TARGET_ARCH replaced with SDK_ARCH.
> 
> Can we move "oecore" to extra varible like:
> 
> bitbake.conf:
> -SDK_NAME = "oecore-${SDK_ARCH}-${TARGET_ARCH}"
> +SDK_NAME_PREFIX = "oecore"
> +SDK_NAME = "${SDK_NAME_PREFIX}-${SDK_ARCH}-${TARGET_ARCH}"
> 
> meta-yocto/conf/distro/poky.conf:
> -SDK_NAME = "${DISTRO}-${TCLIBC}-${SDK_ARCH}-${TARGET_ARCH}"
> +SDK_NAME_PREFIX = "${DISTRO}-${TCLIBC}"
> 
> SDK_PATH is worse:
> meta/conf/bitbake.conf:SDKPATH = "/usr/local/${SDK_NAME}"
> meta-yocto/conf/distro/poky.conf:SDKPATH = "/opt/${DISTRO}/${SDK_VERSION}"
> 
> Maybe this patch is not going in right direction, but nobody replied in
> "SDK confusion Was: [oe] [meta-oe] gdb-cross-canadian: build gdb with python support"
> thread so I have sent this version which works in default (distroless)
> oe-core (and also for SHR as we don't override default SDK* variables.

This last week has been a bit problematic with conference activities
occupying many of the people who would normally have replied to that
kind of thread.

I'm very worried that you're having to copy the base bitbake definitions
as needing to do that is usually a sign there is some underlying more
fundamental problem. We really need to find a better alternative.

I therefore don't think the patch as it stands can go in but I do want
to understand the problem and try and fix it in a way that addresses the
issues. I'm probably not going to get a chance to look at things until
next week though.

Cheers,

Richard



