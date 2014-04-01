Return-Path: <mac@mcrowe.com>
Received: from smtpout.karoo.kcom.com (smtpout.karoo.kcom.com [212.50.160.34])
	by mail.openembedded.org (Postfix) with ESMTP id D01DA6F8B7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 10:11:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,771,1389744000"; d="scan'208";a="72411673"
Received: from deneb.mcrowe.com ([82.152.148.4])
	by smtpout.karoo.kcom.com with ESMTP; 01 Apr 2014 11:11:55 +0100
Received: from mac by deneb.mcrowe.com with local (Exim 4.80)
	(envelope-from <mac@mcrowe.com>)
	id 1WUvfd-0001jz-RI; Tue, 01 Apr 2014 11:11:53 +0100
Date: Tue, 1 Apr 2014 11:11:53 +0100
From: Mike Crowe <mac@mcrowe.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20140401101153.GA6306@mcrowe.com>
References: <1396343775-18753-1-git-send-email-mac@mcrowe.com>
	<1396344719.14790.94.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1396344719.14790.94.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Tue, 01 Apr 2014 10:12:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tuesday 01 April 2014 at 10:31:59 +0100, Richard Purdie wrote:
> On Tue, 2014-04-01 at 10:16 +0100, Mike Crowe wrote:
> > cmake detects the presence of curses automatically during configure so
> > cmake-native must also depend on ncurses-native to stop it being removed
> > from the sysroot during the build.
> > 
> > Signed-off-by: Mike Crowe <mac@mcrowe.com>
> > ---
> >  meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
> > index 08b2c02..8d93b9a 100644
> > --- a/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
> > +++ b/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
> > @@ -2,7 +2,7 @@ require cmake.inc
> >  inherit native
> >  
> >  # Using cmake's internal libarchive, so some dependencies are needed
> > -DEPENDS += "bzip2-native zlib-native"
> > +DEPENDS += "bzip2-native zlib-native ncurses-native"
> >  
> >  SRC_URI += "file://cmlibarchive-disable-ext2fs.patch"
> >  
> 
> What does an ncurses enabled cmake give us that is desirable?

I'm not really sure.

CMake's bootstrap configure script detects curses and tries to use it which
causes build failures if curses has gone missing in the meantime.

In the failure I saw bitbake was building cmake-native and ncurses-native
in parallel in a tree that had previously been used to build for a
different machine. This caused curses.h to be present during
cmake-native.do_configure but go missing before or during
cmake-native.do_compile.

It seems to be possible to disable building the "CursesDialog" component to
remove the need for ncurses but I couldn't immediately see how to do that
for a bootstrap build.

The non-native cmake recipe depends on ncurses even though it passes
-DBUILD_CursesDialog=0.

Thanks.

Mike.

