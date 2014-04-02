Return-Path: <mac@mcrowe.com>
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mail.openembedded.org (Postfix) with ESMTP id 1A1AA6E79A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 09:14:04 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,779,1389744000"; d="scan'208";a="72632510"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 02 Apr 2014 10:14:06 +0100
Received: from mac by deneb.mcrowe.com with local (Exim 4.80)
	(envelope-from <mac@mcrowe.com>)
	id 1WVHFE-0007mX-48; Wed, 02 Apr 2014 10:14:04 +0100
Date: Wed, 2 Apr 2014 10:14:04 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140402091404.GA29076@mcrowe.com>
References: <1396343775-18753-1-git-send-email-mac@mcrowe.com>
	<1396344719.14790.94.camel@ted> <20140401101153.GA6306@mcrowe.com>
	<CAMKF1soedDRPPiJTLnqi9SjGHhLwTrZ3cMx3EJV+TXSDqabOiQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soedDRPPiJTLnqi9SjGHhLwTrZ3cMx3EJV+TXSDqabOiQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake-native: Depend on ncurses-native too
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
X-List-Received-Date: Wed, 02 Apr 2014 09:14:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tuesday 01 April 2014 at 21:59:34 -0700, Khem Raj wrote:
> On Tue, Apr 1, 2014 at 3:11 AM, Mike Crowe <mac@mcrowe.com> wrote:
> > It seems to be possible to disable building the "CursesDialog" component to
> > remove the need for ncurses but I couldn't immediately see how to do that
> > for a bootstrap build.
> >
> > The non-native cmake recipe depends on ncurses even though it passes
> > -DBUILD_CursesDialog=0.
> 
> you need to disable it completely in CMakefile.txt, just that define
> does not suffice you might try something like
> http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-util/cmake/files/cmake-2.8.10-libform.patch?diff_format=f&view=markup

As far as I can tell (by poisoning curses.h in the sysroot) the non-native
cmake build does successfully avoid using curses by specifying
-DBUILD_CursesDialog=0. I have successfully tested removing the
ncurses dependency from the recipe too.

The cmake-native bootstrap procedure means that it is not possible to get
that parameter through to the ultimate cmake native build. So I came up
with this patch:

--- cmake-2.8.12.2/bootstrap~	2014-01-16 17:15:09.000000000 +0000
+++ cmake-2.8.12.2/bootstrap	2014-04-01 21:27:23.841996822 +0100
@@ -1578,6 +1578,7 @@ export MAKE
 
 # Run bootstrap CMake to configure real CMake
 cmake_options="-DCMAKE_BOOTSTRAP=1"
+cmake_options="${cmake_options} -DBUILD_CursesDialog=0"
 if [ -n "${cmake_verbose}" ]; then
   cmake_options="${cmake_options} -DCMAKE_VERBOSE_MAKEFILE=1"
 fi

If I apply this for cmake-native then it also doesn't require curses
(tested with the same poisoning.)

The Gentoo patch may be somewhat safer in the long term because it does a
better job of ensuring that the curses dependency can't come back with
newer cmake versions; it is more likely that the patch would not apply or
the link would fail.

Do you prefer the one line patch above or the Gentoo one?

Thanks.

Mike.

