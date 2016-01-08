Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id B80F36FFFE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 20:44:50 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1aHdtx-0003zI-Pd; Fri, 08 Jan 2016 21:44:50 +0100
Message-ID: <1452285883.1933.31.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 08 Jan 2016 20:44:43 +0000
In-Reply-To: <CAJ86T=VQdAB9dRRb4c_XmFOO+BxH13ar=-Fi209Z59Ry6zVy1w@mail.gmail.com>
References: <1452256574-21587-1-git-send-email-Martin.Jansa@gmail.com>
	<1452257072-1799-1-git-send-email-Martin.Jansa@gmail.com>
	<CAJ86T=WNGGp=L358DSu2+VXM4eEdOz9FRcDBkGueUap80RjGBw@mail.gmail.com>
	<20160108170054.GB2573@jama>
	<CAJ86T=VQdAB9dRRb4c_XmFOO+BxH13ar=-Fi209Z59Ry6zVy1w@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2][RFC] arch-armv7ve.inc: respect armv7a override as well
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
X-List-Received-Date: Fri, 08 Jan 2016 20:44:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-01-08 at 10:24 -0800, Andre McCurdy wrote:
> On Fri, Jan 8, 2016 at 9:00 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> > On Fri, Jan 08, 2016 at 08:24:36AM -0800, Andre McCurdy wrote:
> >> If it's a long term solution then how will armv7m and armv7r be
> >> handled? They are likely to need to duplicate a lot of the current
> >> armv7a over-rides too.
> >
> > armv7a and armv7ve are much closer than armv7a and armv7m or armv7r as
> > Khem said in earlier discussion.
> 
> I'm not sure what the definition of "close" is here. An armv7a CPU can
> not run armv7ve binaries.
> 
> Saying armv7a and armv7ve are close is like saying armv4 and armv5 are
> close. True in some respects, but they don't define each other's
> over-rides.

Yeah, there clearly is some difference in "closeness".

armv4 and armv5 are at least moderately close, in the sense that an
armv5 processor can run almost all (though not absolutely all) armv4
binaries.  There are some significant differences in code generation
and, in particular, ARMv4 is not supported by the EABI (i.e. binary
libraries compiled with -march=armv4 are not EABI compliant).

armv7a and armv7ve are close to each other in the sense that an armv7ve
processor can run any armv7a binary (i.e. the architecture with
virtualisation extensions is a superset of the one without), and there
are only fairly minor differences in code generation between the two.

armv7a and armv7r are, as far as application code needs to be concerned,
more or less equivalent.  Clearly ARMv7-R cores don't have MMUs, but
this ought to manifest itself in a different TARGET_OS setting and there
should be no particular need for overrides to distinguish armv7r
specifically.

armv7m and armv7a/r are a bit more complicated because, in general, you
can't run an armv7a/r binary on an armv7m processor (which doesn't have
32 bit instructions) and you can't run an armv7m binary on an armv7a
processor (which may not have the divide instruction).  It might be true
to say that armv7ve processors can always run binaries built for armv7m;
I'm not sure.  But whether there are any situations where overrides need
to care is unclear.

But overall I remain fairly convinced that the direction of travel ought
to be towards having fewer overrides, and the ones that we do have being
more semantically meaningful.

p.



