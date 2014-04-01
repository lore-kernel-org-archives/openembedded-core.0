Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id BEAC06B5D9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 10:46:39 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s31AkZTd015658; Tue, 1 Apr 2014 11:46:35 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id llMqz6rN51Mi; Tue,  1 Apr 2014 11:46:34 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s31AkWF8015655
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 1 Apr 2014 11:46:33 +0100
Message-ID: <1396349187.1432.0.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Crowe <mac@mcrowe.com>
Date: Tue, 01 Apr 2014 11:46:27 +0100
In-Reply-To: <20140401101153.GA6306@mcrowe.com>
References: <1396343775-18753-1-git-send-email-mac@mcrowe.com>
	<1396344719.14790.94.camel@ted> <20140401101153.GA6306@mcrowe.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 01 Apr 2014 10:46:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-04-01 at 11:11 +0100, Mike Crowe wrote:
> On Tuesday 01 April 2014 at 10:31:59 +0100, Richard Purdie wrote:
> > On Tue, 2014-04-01 at 10:16 +0100, Mike Crowe wrote:
> > > cmake detects the presence of curses automatically during configure so
> > > cmake-native must also depend on ncurses-native to stop it being removed
> > > from the sysroot during the build.
> > > 
> > > Signed-off-by: Mike Crowe <mac@mcrowe.com>
> > > ---
> > >  meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
> > > index 08b2c02..8d93b9a 100644
> > > --- a/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
> > > +++ b/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
> > > @@ -2,7 +2,7 @@ require cmake.inc
> > >  inherit native
> > >  
> > >  # Using cmake's internal libarchive, so some dependencies are needed
> > > -DEPENDS += "bzip2-native zlib-native"
> > > +DEPENDS += "bzip2-native zlib-native ncurses-native"
> > >  
> > >  SRC_URI += "file://cmlibarchive-disable-ext2fs.patch"
> > >  
> > 
> > What does an ncurses enabled cmake give us that is desirable?
> 
> I'm not really sure.
> 
> CMake's bootstrap configure script detects curses and tries to use it which
> causes build failures if curses has gone missing in the meantime.
> 
> In the failure I saw bitbake was building cmake-native and ncurses-native
> in parallel in a tree that had previously been used to build for a
> different machine. This caused curses.h to be present during
> cmake-native.do_configure but go missing before or during
> cmake-native.do_compile.
> 
> It seems to be possible to disable building the "CursesDialog" component to
> remove the need for ncurses but I couldn't immediately see how to do that
> for a bootstrap build.
> 
> The non-native cmake recipe depends on ncurses even though it passes
> -DBUILD_CursesDialog=0.

I'd much prefer to disable the need for curses if we can since the more
convoluted the dependency chain, the longer our build times. If we don't
need this, it would be much nicer to disable it, even if we have to
patch it out.

Cheers,

Richard


