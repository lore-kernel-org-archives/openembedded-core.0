Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 3EA3D6066A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 21:59:24 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4TM3fZ1025143; Wed, 29 May 2013 23:03:41 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dcnxd1N-dpOb; Wed, 29 May 2013 23:03:41 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4TM3bL7025132
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 29 May 2013 23:03:39 +0100
Message-ID: <1369864751.14887.258.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Wed, 29 May 2013 22:59:11 +0100
In-Reply-To: <51A672E5.3060000@windriver.com>
References: <1369840203-21898-1-git-send-email-mark.hatle@windriver.com>
	<1369840203-21898-19-git-send-email-mark.hatle@windriver.com>
	<1369861845.14887.232.camel@ted> <51A672E5.3060000@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 18/21] Fix problems expanding the IMAGE_INSTALL package groups
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
X-List-Received-Date: Wed, 29 May 2013 21:59:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-05-29 at 16:28 -0500, Mark Hatle wrote:
> On 5/29/13 4:10 PM, Richard Purdie wrote:
> > On Wed, 2013-05-29 at 10:10 -0500, Mark Hatle wrote:
> >> From: Jason Wessel <jason.wessel@windriver.com>
> >>
> >> The ncurses package was generating the following error as a result
> >> of not specifing the PACKAGES_DYNAMIC correctly.  This error only
> >> appear when using the IMAGE_INSTALL list that has been expanded by
> >> the hob or from the pkgdata.
> >>
> >> ERROR: Nothing RPROVIDES 'ncurses-libtinfo'
> >>
> >> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> >> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> >> ---
> >>   meta/recipes-core/ncurses/ncurses.inc | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
> >> index 8a81381..584ad46 100644
> >> --- a/meta/recipes-core/ncurses/ncurses.inc
> >> +++ b/meta/recipes-core/ncurses/ncurses.inc
> >> @@ -29,6 +29,8 @@ BUILD_CPPFLAGS += "-D_GNU_SOURCE"
> >>   # natives don't generally look in base_libdir
> >>   base_libdir_class-native = "${libdir}"
> >>
> >> +PACKAGES_DYNAMIC = "^${PN}-.*"
> >> +
> >>   # Fall back to the host termcap / terminfo for -nativesdk and -native
> >>   # The reality is a work around for strange problems with things like
> >>   # "bitbake -c menuconfig busybox" where it cannot find the terminfo
> >
> > I'm pretty sure I talked to Jason about this and we concluded this was
> > fixed with some other change in master. Certainly this fix as it stands
> > doesn't sound right.
> 
> The original thread included libpcre, it was libpcre side was in fact fixed 
> prior to the initial patch being submitted.  ncurses however is still broken.
> 
> If I revert this commit in my tree, and add to IMAGE_INSTALL "ncurses-libtinfo", 
> I get the following failure:
> 
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'ncurses-libtinfo' (but 
> /msp-lpggp21/lmhatle/build-1/layers/oe-core/meta/recipes-core/images/core-image-minimal.bb 
> RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'ncurses-libtinfo' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['ncurses-libtinfo']
> ERROR: Required build target 'core-image-minimal' has no buildable providers.
> Missing or unbuildable dependency chain was: ['core-image-minimal', 
> 'ncurses-libtinfo']
> 
> with the patch applied it completes successfully.
> 
> Reproducer:
> 
> Add to conf/local.conf
> 
> IMAGE_INSTALL_append = " ncurses-libtinfo"
> 
> bitbake core-image-minimal


Fair enough. Can we at least match the pattern do_split_packages uses,
i.e.:

PACKAGES_DYNAMIC = "^${PN}-lib.*"

I'm a little paranoid about adding wildcards like ${PN}-* as the
potential for namespace problems is not insignificant, particularly if
you know the horrible things bitbake does with this behind the
scenes :/.

Cheers,

Richard


