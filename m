Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id B80E17328A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Aug 2016 14:24:12 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20160817142410775_0685;
	Wed, 17 Aug 2016 07:24:10 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=22444 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1ba1n9-0003GB-Ik; Wed, 17 Aug 2016 10:26:03 -0400
Date: Wed, 17 Aug 2016 10:23:59 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@ca624034.mitel.com
To: Ulf Magnusson <ulfalizer@gmail.com>
In-Reply-To: <CAFkk2KSt7rLiTim2oiHZMVKezVgtuegSraR0ePQWmdBhxbd6SQ@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1608171020570.13500@ca624034.mitel.com>
References: <alpine.LFD.2.20.1608160956340.7804@ca624034.mitel.com>
	<CAFkk2KRY=fWTOSUbxV_gm-np9r=4JBrsQ+Zy0FZb0H4Gbhfd+A@mail.gmail.com>
	<alpine.LFD.2.20.1608161147270.9338@ca624034.mitel.com>
	<CAFkk2KSVc3rqAieBHzkayJQT7YHxJhYoD0PSqp-YFL0CYMLkvg@mail.gmail.com>
	<92B4EF25-FE41-4310-B78A-554EA37BF507@gmail.com>
	<alpine.LFD.2.20.1608170913100.11255@ca624034.mitel.com>
	<CAFkk2KSt7rLiTim2oiHZMVKezVgtuegSraR0ePQWmdBhxbd6SQ@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: subtle weirdness when you combine "_append" with "+="?
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
X-List-Received-Date: Wed, 17 Aug 2016 14:24:13 -0000
Content-Type: text/plain; charset=US-ASCII

On Wed, 17 Aug 2016, Ulf Magnusson wrote:

> On Wed, Aug 17, 2016 at 3:21 PM, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> > On Tue, 16 Aug 2016, Khem Raj wrote:
> >
> >   ... big snip ...
> >
> >> the _append/_prepend in conjunction with += is a undocumented
> >> behavior however, I do not see it as much a side effect. But in
> >> future bitbake may silently change its behavior, so I agree its
> >> always good to stay in safe waters.
> >
> >   so just to finalize this discussion, my thoughts on a reasonable and
> > meaningful standard for append/prepend/etc/etc would be to *always*
> > use the "mathematical" operators +=/.=/=+/=. except in two situations:
> >
> >   1) when parsing *must* be delayed until the end, or
>
> I agree as long as that *must* also includes the kind of situation
> described for foo.bbclass in
> https://www.yoctoproject.org/docs/2.2/bitbake-user-manual/bitbake-user-manual.html#override-style-operation-advantages.
> I think you ought to follow the principle of least surprise.

  agreed. i guess a simpler way to state it is that one should never
use "_append" unless it's necessary. that pretty much covers all
situations.

> >   2) when combining the operation with an override (for which i'm
> >      quite sure there is no equivalent when using +=, etc, right?)
> >
> > i'm a big fan of simplicity, in the sense that, if an append operation
> > does not *require* "_append", it shouldn't use it. because if i see an
> > expression:
> >
> >   VAR_append = "..."
> >
> > then i immediately wonder if there is a *reason* for using "_append"
> > rather than "+=" or ".=", or if that is just the developer's personal
> > preference. and i really, really, really hate having to guess.
> >
> >   oh, and of course, never, ever combine "_append" with "+=" or ".=".
> > does that sound like a reasonable coding style?
>
> Sounds reasonable to me. Using _append rather than += can also be
> a bug in certain situations. For example, the following does not
> guarantee that " value1 value2" appears right after "--flag":
>
> FLAGS = "--flag"
> FLAGS_append = " value1"
> FLAGS_append = " value2"
>
> Any earlier FLAGS_append value would appear before those two.

  i don't see that as a "bug"; it's exactly the way it *should*
operate. the above is more an example of someone not *understanding*
how those operators work.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


