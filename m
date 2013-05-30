Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 8BE756162D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 20:10:16 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4UKEcnc013789; Thu, 30 May 2013 21:14:38 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Tmejl31XXD9b; Thu, 30 May 2013 21:14:38 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r4UKEX5g013783
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Thu, 30 May 2013 21:14:35 +0100
Message-ID: <1369944602.14887.332.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Thu, 30 May 2013 21:10:02 +0100
In-Reply-To: <51A74480.6080102@windriver.com>
References: <1369840203-21898-1-git-send-email-mark.hatle@windriver.com>
	<1369840203-21898-19-git-send-email-mark.hatle@windriver.com>
	<1369861845.14887.232.camel@ted> <51A672E5.3060000@windriver.com>
	<1369864751.14887.258.camel@ted>
	<1369910774.8846.26.camel@phil-desktop.brightsign>
	<51A74480.6080102@windriver.com>
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
X-List-Received-Date: Thu, 30 May 2013 20:10:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2013-05-30 at 07:22 -0500, Mark Hatle wrote:
> On 5/30/13 5:46 AM, Phil Blundell wrote:
> > On Wed, 2013-05-29 at 22:59 +0100, Richard Purdie wrote:
> >> Fair enough. Can we at least match the pattern do_split_packages uses,
> >> i.e.:
> >>
> >> PACKAGES_DYNAMIC = "^${PN}-lib.*"
> >>
> >> I'm a little paranoid about adding wildcards like ${PN}-* as the
> >> potential for namespace problems is not insignificant, particularly if
> >> you know the horrible things bitbake does with this behind the
> >> scenes :/.
> >
> > Does it really need to be dynamic at all?  I don't think the list of
> > libraries installed by ncurses varies all that much (apart from WIDEC
> > on/off), and nor is it overwhelmingly large.  It doesn't seem like it
> > would be all that hard to arrange for the right stuff to be added to
> > PACKAGES at parse time, in which case this whole problem would just go
> > away.
> 
> Certainly possible.  That's not the tactic we took on resolving the issue.  One 
> line change vs significantly modifying the package.   The following is the chunk 
> that handles the dynamic generation (from ncurses.inc)
> 
> python populate_packages_prepend () {
>      libdir = d.expand("${libdir}")
>      base_libdir = d.expand("${base_libdir}")
>      pnbase = d.expand("${PN}-lib%s")
>      do_split_packages(d, libdir, '^lib(.*)\.so\..*', pnbase, 'ncurses %s 
> library', prepend=True, extra_depends = '', allow_links=True)
>      if libdir is not base_libdir:
>          do_split_packages(d, base_libdir, '^lib(.*)\.so\..*', pnbase, 'ncurses 
> %s library', prepend=True, extra_depends = '', allow_links=True)
> }
> 
> Beyond this even, the package has a number of dynamic configurations that should 
> probably be done based on libc and/or distro flags as well.
> 
> So this is probably a job for a janitor task.
> 
> I still think as a minimal change the PACKAGES_DYNAMIC is the correct change, 
> but as you said -- during a cleanup -- the need for PACKAGES_DYNAMIC can be 
> diminished or removed.

I've mixed feelings on this. For now I've taken the PACKAGES_DYNAMIC
change since its simple and I'm happier now the "lib" is in there and it
matches the package split. Any other patches will be considered on their
own merit, as usual...

Cheers,

Richard




