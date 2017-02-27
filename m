Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id 925A67199C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 18:53:56 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20170227185347960_0485;
	Mon, 27 Feb 2017 18:53:47 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [174.118.92.171] (port=37638 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1ciQQW-0007Hn-Ju; Mon, 27 Feb 2017 13:53:40 -0500
Date: Mon, 27 Feb 2017 13:53:38 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Phil Blundell <pb@pbcl.net>
In-Reply-To: <1488217806.8657.20.camel@pbcl.net>
Message-ID: <alpine.LFD.2.20.1702271347110.6269@localhost.localdomain>
References: <alpine.LFD.2.20.1702270819550.25847@uk63952.mitel.com>
	<1488217806.8657.20.camel@pbcl.net>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: a few more picky questions about COMPATIBLE_MACHINE usage
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
X-List-Received-Date: Mon, 27 Feb 2017 18:53:57 -0000
Content-Type: multipart/mixed; BOUNDARY="8323328-1223019616-1488221620=:6269"

--8323328-1223019616-1488221620=:6269
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Mon, 27 Feb 2017, Phil Blundell wrote:

> On Mon, 2017-02-27 at 09:09 -0500, Robert P. J. Day wrote:
> >  # webkit-efl isn't available for < armv7a
> >  COMPATIBLE_MACHINE = "(-)"
> >   COMPATIBLE_MACHINE_x86 = "(.*)"
> >   COMPATIBLE_MACHINE_x86-64 = "(.*)"
> >   COMPATIBLE_MACHINE_armv7a = "(.*)"
> >
> >   first, that comment seems out of date as it makes no mention of
> > MIPS
> > or ppc, but that's just being picky.
> >
> >   next, i assume the line:
> >
> >   COMPATIBLE_MACHINE = "(-)"
> >
> > is to initialize the set of compatible machines to the empty set,
> > yes?
>
> I think the intent is to set it to a string that "can't possibly
> ever match".

  right, that's what i suspected.

> >
>   i next assume that lines of the form:
> >
> >   COMPATIBLE_MACHINE_x86 = "(.*)"
> >
> > are meant to indicate that if that MACHINE_OVERRIDES comparison
> > succeeds, then all possible targets are compatible, is that right?
> > however, given precisely those lines above, is it not equivalent to
> > just write:
> >
> >   COMPATIBLE_MACHINE = "(x86|x86-64|armv7a)"
>
> No, because "armv7a" is not a MACHINE.  It would be more equivalent
> to write
>
> COMPATIBLE_HOST = "armv7a-.*"
>
> but even this would not be quite the same because it would fail to
> match "cortexa15-linux" for example.  Actually that's not a very
> good example because cortexa15 is armv7ve not armv7a, but you get
> the idea.

  i'm going to disagree here, i never suggested "armv7a" was a
"machine" (in the sense of having a defining armv7a.conf file). i said
it was part of MACHINE_OVERRIDES, and therefore *would* be considered
a matching "machine" for the purposes of COMPATIBLE_MACHINE.

  as another example, there is no such machine as a "qoriq", but that
is considered a valid choice for COMPATIBLE_MACHINE since several
actual machine definition files do this:

  MACHINEOVERRIDES =. "qoriq:"

am i making sense?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-1223019616-1488221620=:6269--
