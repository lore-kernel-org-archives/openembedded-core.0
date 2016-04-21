Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 6C8F560291
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 13:39:24 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20160421133923009_0685;
	Thu, 21 Apr 2016 06:39:23 -0700
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=54442 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1atEqi-000098-OE; Thu, 21 Apr 2016 09:40:52 -0400
Date: Thu, 21 Apr 2016 09:39:16 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: Richard Purdie <richard.purdie@linuxfoundation.org>
In-Reply-To: <1461244406.31320.117.camel@linuxfoundation.org>
Message-ID: <alpine.LFD.2.20.1604210925001.25332@localhost.localdomain>
References: <alpine.LFD.2.20.1604210639150.4110@localhost.localdomain>
	<1461244406.31320.117.camel@linuxfoundation.org>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: question about order of processing SRC_URI items
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
X-List-Received-Date: Thu, 21 Apr 2016 13:39:29 -0000
Content-Type: text/plain; charset=US-ASCII


... some stuff snipped ...

On Thu, 21 Apr 2016, Richard Purdie wrote:

> On Thu, 2016-04-21 at 07:19 -0400, Robert P. J. Day wrote:

> >   more significantly, i realize the final order of SRC_URI items
> > depending on which one you use might be different, as "_append"
> > leaves the appending until the final stage of processing. so what
> > this tells me is that all of the items you list in SRC_URI should
> > *not* be order-dependent, is that a fair statement? or, IOW, if
> > your layer depends on the items in SRC_URI being processed in a
> > specific order, you probably need to rework your recipe file.
>
> Sometimes order is important, e.g. two patches which change the same
> set of files would need to be applied in the correct order.

  if i had that situation, i would think the obvious approach is that
those two patches should be bundled into the same .scc file, where
patch application ordering is preserved. my point was that i wouldn't
want to count on the ordering of items in the SRC_URI list itself.

> >   and, finally, given that you can have a combination of SRC_URI
> > assignments and appends in the same .bbappend file:
> >
> >   SRC_URI += "..."
> >   SRC_URI_append = "..."
> >   SRC_URI_append_<override> = "..."
> >
> > that tells me that you *really* don't want any of that to be
> > order-dependent, as i mentioned before.
>
> Right, you'd have to be careful with this.

  and that's the point i was making ... if you're mixing conditional
and unconditional SRC_URI appending, you *really* don't want to count
on any particular order of processing of the items in that variable.

  oh, one more thing related to coding style. given that .bb recipe
files are the foundation on which further .bbappend customization is
built, it would seem that .bb files should consistently use just:

  SRC_URI = "..."

and not

  SRC_URI += "..."

*unless* they're first including some .inc file that would set that
variable to some common initial value.

  i know it would make no difference in the end, but for me, it's a
visual thing -- when i see any use of "+=", i normally assume that
there might be some earlier value that's been assigned, so i take a
little more care in what i'm doing. so my coding style for new recipe
files would be to *always* use:

  SRC_URI = "..."

unless there was a good reason not to. and, yes, i am that pedantic.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================



