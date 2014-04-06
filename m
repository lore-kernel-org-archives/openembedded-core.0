Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 0CAA260E79
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Apr 2014 11:57:18 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s36BvCOp008930; Sun, 6 Apr 2014 12:57:12 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id eo-ZNYlaROyo; Sun,  6 Apr 2014 12:57:12 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s36Bv7FX008922
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Sun, 6 Apr 2014 12:57:09 +0100
Message-ID: <1396785422.24597.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Crowe <mac@mcrowe.com>
Date: Sun, 06 Apr 2014 12:57:02 +0100
In-Reply-To: <20140403104411.GA20640@mcrowe.com>
References: <1396343775-18753-1-git-send-email-mac@mcrowe.com>
	<1396344719.14790.94.camel@ted> <20140401101153.GA6306@mcrowe.com>
	<CAMKF1soedDRPPiJTLnqi9SjGHhLwTrZ3cMx3EJV+TXSDqabOiQ@mail.gmail.com>
	<20140403104411.GA20640@mcrowe.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: cmake-native also depends on acl-native (was Re: cmake-native: Depend on ncurses-native too)
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
X-List-Received-Date: Sun, 06 Apr 2014 11:57:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-04-03 at 11:44 +0100, Mike Crowe wrote:
> On Tuesday 01 April 2014 at 21:59:34 -0700, Khem Raj wrote:
> > On Tue, Apr 1, 2014 at 3:11 AM, Mike Crowe <mac@mcrowe.com> wrote:
> > > It seems to be possible to disable building the "CursesDialog" component to
> > > remove the need for ncurses but I couldn't immediately see how to do that
> > > for a bootstrap build.
> > >
> > > The non-native cmake recipe depends on ncurses even though it passes
> > > -DBUILD_CursesDialog=0.
> > 
> > you need to disable it completely in CMakefile.txt, just that define
> > does not suffice you might try something like
> > http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-util/cmake/files/cmake-2.8.10-libform.patch?diff_format=f&view=markup
> > 
> 
> It appears that a similar problem occurs if cmake-native is built at the
> same time as acl-native:
> 
>  Building C object Utilities/cmcurl/CMakeFiles/cmcurl.dir/http_chunks.c.o
>  [ 30%] /home/jenkins/workspace/nightly-brightsign-master/MACHINE/source/label/nightly/build-bcm7425/source-release-test-build/brightsign-oe/build-bcm7425/tmp-eglibc/work/x86_64-linux/cmake-native/2.8.12.2-r0/cmake-2.8.12.2/Utilities/cmlibarchive/libarchive/archive_read_disk_entry_from_file.c:38:21:fatal error: sys/acl.h: No such file or directory
>  compilation terminated.
> 
> cmake detects sys/acl.h but by the time the compiler tries to include it
> the file has been unstaged from the sysroot.
> 
> This one is harder to patch out. Do you object to me adding acl{,-native}
> to DEPENDS?

Each dependency we add like this tends to cause slightly longer builds.
Each small piece mounts up. So I do feel quite strongly we disable
things we can...

Cheers,

Richard


