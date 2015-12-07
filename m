Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id 114D760124
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Dec 2015 12:42:04 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20151207124200562_0485;
	Mon, 07 Dec 2015 12:42:00 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [69.196.158.250] (port=48664 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1a5v7z-0001bY-39; Mon, 07 Dec 2015 07:42:51 -0500
Date: Mon, 7 Dec 2015 07:41:46 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Andreas Oberritter <obi@opendreambox.org>
In-Reply-To: <56655CB9.2050500@opendreambox.org>
Message-ID: <alpine.LFD.2.20.1512070740530.18780@localhost>
References: <alpine.LFD.2.20.1512070440340.13574@localhost>
	<56655CB9.2050500@opendreambox.org>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: openembedded-core@lists.openembedded.org
Subject: Re: what feature fixed the gcc-5 preprocessor build error from a few months back?
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
X-List-Received-Date: Mon, 07 Dec 2015 12:42:07 -0000
Content-Type: text/plain; charset=US-ASCII

On Mon, 7 Dec 2015, Andreas Oberritter wrote:

> Hello Robert,
>
> On 07.12.2015 10:44, Robert P. J. Day wrote:
> >
> >   once upon a time, i asked a question about the origin of this OE
> > build error using gcc-5 to build ncurses-native:
> >
> >> In file included from
> > /home/rpjday/oe/builds/oe/qemux86/tmp-glibc/work/x86_64-linux/ncurses-native/5.9-r15.1/ncurses-5.9/ncurses/curses.priv.h:283:0,
> >>                  from ../ncurses/lib_gen.c:19:
> >> _20141.c:835:15: error: expected ')' before 'int'
> >> ../include/curses.h:1594:56: note: in definition of macro
> > 'mouse_trafo'
> >>  #define mouse_trafo(y,x,to_screen)
> > wmouse_trafo(stdscr,y,x,to_screen)
> >
> >   it didn't take long to be pointed to an explanation on the fedora
> > mailing list:
> >
> > http://lists.openembedded.org/pipermail/openembedded-core/2015-February/101820.html
> >
> > "	these packages failed to build because of the changes in the preprocessor;
> > 	gcc started to generate line directives to better detect whether a macro
> > 	tokens come from a system header - see http://gcc.gnu.org/PR60723
> > 	The fix is to use the -P option if the code isn't prepared to deal with
> > 	such directives.
> >
> >   so i just added to my local.conf:
> >
> > CPPFLAGS_append_pn-ncurses-native = " -P"
> >
> >   that issue was apparently fixed and i haven't needed to do that for
> > a while. however, i'm now using someone's custom version of OE-core
> > and that very error is back, so what was it that was tweaked to deal
> > with it? thanks.
>
> see this commit in fido:
>
> commit 3a5435b371c84ec28b6936b8c8fa6541a592d061
> Author: Martin Stolpe <martinstolpe@gmail.com>
> Date:   Wed Jun 10 16:28:26 2015 +0200
>
>     ncurses: fix native builds when host has gcc5
>
>     GCC"s preprocessor starts to add newlines which are not
>     handled properly by ncurses build system startin from
>     version 5.0.
>
>     See also: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7870
>
>     Signed-off-by: Martin Stolpe <martin.stolpe@gmail.com>
>     Signed-off-by: Joshua Lock <joshua.lock@collabora.co.uk>
>
> In master it's probably been solved by updating ncurses.

  ah, that's pretty much the hackaround i used once upon a time, and i
can see that that patch is not in the vendor-specific OE-Core layer i
was given. so that definitely explains that problem. thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


