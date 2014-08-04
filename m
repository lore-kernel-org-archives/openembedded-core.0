Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id 1027665CB2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Aug 2014 13:42:44 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20140804134243589
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Aug 2014 13:42:43 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [99.240.204.5] (port=32999 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1XEIX8-0007zd-MY; Mon, 04 Aug 2014 09:42:38 -0400
Date: Mon, 4 Aug 2014 09:42:35 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Paul Eggleton <paul.eggleton@linux.intel.com>
In-Reply-To: <14511164.eDDSBeL19z@peggleto-mobl5.ger.corp.intel.com>
Message-ID: <alpine.LFD.2.11.1408040933500.8919@localhost>
References: <alpine.LFD.2.11.1408021229180.24061@localhost>
	<20140802200959.GA22882@haswell>
	<alpine.LFD.2.11.1408030254520.10897@localhost>
	<14511164.eDDSBeL19z@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: openembedded-core@lists.openembedded.org
Subject: Re: can pkg_{pre, post}rm functions be run at all for image creation?
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
X-List-Received-Date: Mon, 04 Aug 2014 13:42:47 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Mon, 4 Aug 2014, Paul Eggleton wrote:

> On Sunday 03 August 2014 02:56:04 Robert P. J. Day wrote:
> > On Sat, 2 Aug 2014, Khem Raj wrote:
> > > On 14-08-02 15:57:00, Robert P. J. Day wrote:
> > > > On Sat, 2 Aug 2014, Khem Raj wrote:
> > > > > On Sat, Aug 2, 2014 at 9:34 AM, Robert P. J. Day
> <rpjday@crashcourse.ca> wrote:
> > > > > > say, pkg_prerm() functions would never be written with respect to
> > > > > > the
> > > > > > variable ${D}, which would be relevant only during image creation.
> > > > > > but
> > > > > > i can see things like this in sysklogd.inc:
> > > > > >
> > > > > > pkg_prerm_${PN} () {
> > > > > >
> > > > > >         if test "x$D" = "x"; then
> > > > >
> > > > > note that its not ${D} (bitbake context) but $D which is evaluated
> > > > > in the context when the script is run.
> > > > >
> > > >   i still don't understand ... what are the possible values of $D
> > > >
> > > > here, and what would they represent?
> > >
> > > At build time it will not be expanded by bitbake like ${D} is. but
> > > during image creation it will be. But when doing on-device install
> > > of this package $D will be empty. Its a way to differentiate actions
> > > during image creation and on-device install/update/remove
> >
> >   but the yocto dev manual states pretty clearly that pkg_prerm and
> > pkg_postrm functions are *not* used during image creation. so you're
> > saying they are? under what circumstances?
>
> They wouldn't normally be. You could in theory issue some package
> removal commands as part of postprocessing on the image but I can't
> see much use for that given we have things like PACKAGE_EXCLUDE now.

  oooooh ... that's still kind of weaselly terminology. :-) i'm not
*trying* to be annoyingly pedantic, but this is just the kind of thing
that students tend to ask about, which is why i want to nail the
details.

  the current docs state that pkg_*rm routines are *not* run during
image creation, and i'm going to accept that. that means that if a
pkg_*rm routine *is* written with reference to ${D}, as long as that's
run on the target, it won't make a difference. so the references to
${D} in that context don't *hurt*, they're just unnecessary. and
potentially confusing, which is why i'm trying to clarify this. (every
pkg_*rm routine i've seen, *if* it tests the value of ${D}, bailed if
it was set, which makes sense if they should never, ever be invoked at
image creation time.)

  WRT stuff run at rootfs postprocessing time, sure, you could always
run a package removal command, but clarify this for me -- once you're
into rootfs postprocessing, you're running in a "pseudo" environment
such that you are *effectively* running inside that rootfs, no? so in
that case, all filename references would be full names WRT to the root
filesystem -- no references to ${D}. is that correct? or am i just
confused?

> Khem was simply correcting your reference to ${D}. I can only
> imagine the example you gave is just belt-and-braces to make sure it
> could never be run outside the context of the real target.

  fair enough. as it is, it's simply overkill. gotcha.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


