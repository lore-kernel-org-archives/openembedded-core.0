Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SykrI-0004yz-Vg for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 16:34:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q77EML9d011870;
	Tue, 7 Aug 2012 15:22:21 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11709-03; Tue,  7 Aug 2012 15:22:16 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q77EMDds011864
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 7 Aug 2012 15:22:14 +0100
Message-ID: <1344349336.9756.259.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Tue, 07 Aug 2012 15:22:16 +0100
In-Reply-To: <50212122.50109@windriver.com>
References: <1344008589-3660-1-git-send-email-liang.li@windriver.com>
	<1344348160.9756.255.camel@ted> <50212122.50109@windriver.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: darren.hart@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] perf: pass STAGING_INCDIR(sysroot) to perf
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
X-List-Received-Date: Tue, 07 Aug 2012 14:34:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-08-07 at 10:07 -0400, Bruce Ashfield wrote:
> On 12-08-07 10:02 AM, Richard Purdie wrote:
> > On Fri, 2012-08-03 at 23:43 +0800, Liang Li wrote:
> >> Via EXTRA_CFLAGS, we can pass the sysroot include directory to perf to
> >> provide slang.h rather than hardcoded host dir in perf's Makefile.
> >>
> >> Pass WERROR=0 to perf's Makefile to avoid warnings being treated
> >> as errors. Warnings are not fatal, and while they will be fixed in the
> >> future, there's no need for them to break the build.
> >
> > No mention of the additional slang dependency is made here?
> >
> >> Signed-off-by: Liang Li<liang.li@windriver.com>
> >> ---
> >>   meta/recipes-kernel/perf/perf_3.4.bb | 3 +++
> >>   1 file changed, 3 insertions(+)
> >>
> >> diff --git a/meta/recipes-kernel/perf/perf_3.4.bb b/meta/recipes-kernel/perf/perf_3.4.bb
> >> index 505c7b8..537e926 100644
> >> --- a/meta/recipes-kernel/perf/perf_3.4.bb
> >> +++ b/meta/recipes-kernel/perf/perf_3.4.bb
> >> @@ -24,6 +24,7 @@ DEPENDS = "virtual/kernel \
> >>              ${MLPREFIX}binutils \
> >>              ${TUI_DEPENDS} \
> >>              ${SCRIPTING_DEPENDS} \
> >> +           slang \
> >>             "
> >>
> >>   SCRIPTING_RDEPENDS = "${@perf_feature_enabled('perf-scripting', 'perl perl-modules python', '',d)}"
> >> @@ -63,6 +64,8 @@ EXTRA_OEMAKE = \
> >>   		AR="${AR}" \
> >>   		prefix=/usr \
> >>   		NO_GTK2=1 ${TUI_DEFINES} NO_DWARF=1 ${SCRIPTING_DEFINES} \
> >> +		WERROR=0 \
> >> +		EXTRA_CFLAGS=-I${STAGING_INCDIR} \
> >>   		'
> >
> > This is is not acceptable since the include directory /usr/include/slang
> > is still being looked at and this just "hides" the error. STAGING_INCDIR
> > is on the compilers default search path anyway.
> 
> But this makes it first, which is what we were going for. For
> an external toolchain, this also might not be true.

You have an external toolchain which does not search the sysroot
usr/include directory? Really? ;-)

I accept we won't search usr/include/slang but we don't install slang in
that directory anyway so its irrelevant and that isn't the path you're
adding.

> > So this patch is wrong in several different ways :(
> >
> > I've merged a temporary fix until we get this resolved properly.
> 
> I think this is a point of view thing, since from here, this is a
> better temporary fix than commenting out the path in the perf
> Makefile, which will break standalone tree cases if I merge the patch
> into the tree, and I don't want to go to a milestone freeze with
> an out of tree patch.

I doubt it will actually break anything.

> So I'd ask again that we reconsider this patch, since what's in tree
> has issues with other use cases.

No, I'm flatly refusing it, sorry.

Cheers,

Richard



