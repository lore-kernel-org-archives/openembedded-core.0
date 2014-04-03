Return-Path: <mac@mcrowe.com>
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mail.openembedded.org (Postfix) with ESMTP id 2C27B6F6C0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Apr 2014 10:44:20 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,786,1389744000"; d="scan'208";a="72852737"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 03 Apr 2014 11:44:19 +0100
Received: from mac by deneb.mcrowe.com with local (Exim 4.80)
	(envelope-from <mac@mcrowe.com>)
	id 1WVf7z-0005RF-PV; Thu, 03 Apr 2014 11:44:11 +0100
Date: Thu, 3 Apr 2014 11:44:11 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140403104411.GA20640@mcrowe.com>
References: <1396343775-18753-1-git-send-email-mac@mcrowe.com>
	<1396344719.14790.94.camel@ted> <20140401101153.GA6306@mcrowe.com>
	<CAMKF1soedDRPPiJTLnqi9SjGHhLwTrZ3cMx3EJV+TXSDqabOiQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soedDRPPiJTLnqi9SjGHhLwTrZ3cMx3EJV+TXSDqabOiQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: cmake-native also depends on acl-native (was Re: cmake-native: Depend on ncurses-native too)
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
X-List-Received-Date: Thu, 03 Apr 2014 10:44:21 -0000
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
> 

It appears that a similar problem occurs if cmake-native is built at the
same time as acl-native:

 Building C object Utilities/cmcurl/CMakeFiles/cmcurl.dir/http_chunks.c.o
 [ 30%] /home/jenkins/workspace/nightly-brightsign-master/MACHINE/source/label/nightly/build-bcm7425/source-release-test-build/brightsign-oe/build-bcm7425/tmp-eglibc/work/x86_64-linux/cmake-native/2.8.12.2-r0/cmake-2.8.12.2/Utilities/cmlibarchive/libarchive/archive_read_disk_entry_from_file.c:38:21:fatal error: sys/acl.h: No such file or directory
 compilation terminated.

cmake detects sys/acl.h but by the time the compiler tries to include it
the file has been unstaged from the sysroot.

This one is harder to patch out. Do you object to me adding acl{,-native}
to DEPENDS?

Thanks.

Mike.

