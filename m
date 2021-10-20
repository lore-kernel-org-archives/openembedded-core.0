Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <4a4329e7ec5640aea90f15d5d851becd548b69c7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] externalsrc.bbclass: Allow externalsrc to be extended with extra classes
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Wed, 20 Oct 2021 12:21:47 +0100
In-Reply-To: <35229a81fcb740edb3d77e35c8ebc787@axis.com>
References: <20211019170321.18270-1-pkj@axis.com>
	 <CANPvuR=noMymOncORwNan6-D-DCkSKQDXYjjWR+8yhqx3JxY=Q@mail.gmail.com>
	 <16AF9916496D59D2.6466@lists.openembedded.org>
	 <0618e0381622433f86303a2d5d6968cd@axis.com>
	 <86a6794721045c94bc4cd445a051ff1df40baa6e.camel@linuxfoundation.org>
	 <35229a81fcb740edb3d77e35c8ebc787@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>

On Wed, 2021-10-20 at 10:57 +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
> > Sent: den 20 oktober 2021 11:59
> > To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Jose Quaresma
> > <quaresma.jose@gmail.com>
> > Cc: OE-core <openembedded-core@lists.openembedded.org>
> > Subject: Re: [OE-core] [PATCH] externalsrc.bbclass: Allow externalsrc to
> > be extended with extra classes
> > 
> > On Wed, 2021-10-20 at 09:09 +0000, Peter Kjellerstedt wrote:
> > > I thought of another problem with the wrapper class solution: if we 
> > > needto actually backport a newer version of the class from, e.g., 
> > > Poky master, then there is now no natural place for it since it is 
> > > occupied by the wrapper class. That means we would either have to 
> > > rename the backported class, or put it somewhere else than in 
> > > "classes". It also means backporting a class requires the wrapper 
> > > class to be modified.
> > > 
> > > Here is a question for Richard: what do you think of an idea I had to
> > > add support in bitbake for extending classes? I do not mean to add 
> > > something like bbclassappend, as I know that is troublesome. My idea 
> > > instead is something like the prefuncs/postfuncs that we have for 
> > > functions. I.e., before actually doing the inherit of a classfoo, 
> > > bitbake would inherit anything specified in BBCLASS_PRE_INHERIT:foo, 
> > > and after inheriting the class it would automatically inherit 
> > > anything in BBCLASS_POST_INHERIT:foo.  That way one can simply extend 
> > > a class through normal variable operations, making it easy to do, 
> > > e.g., in the distro configuration.
> > 
> > That sounds very like a bbclassappend under a different name?
> > 
> > Cheers,
> > 
> > Richard
> 
> Well, I guess it is similar to what a bbclassappend file suffix would Do we
> want to allow users to do whatever 
> entail, but more flexible and controlled. Do you think something like 
> this would work, or have I missed some technical problems that would 
> prevent it? And if you think it is technically possible, would you be 
> willing to accept a patch that implements it?

How is it more flexible and controlled? We'd swap a concept most users
understand (bbappend) for one that is less obvious and more complex.

The issue with bbclassappend was never a technical one, it is a question of
policy. We already allow users to do pretty much anything to the system but the
question is how easy we make certain things. We've tended to believe that
encouraging class changes back to their parent classes was a good thing overall.

You are basically saying we no longer want to do that and stop encouraging
people to do it. I'm not sure that is true, quite the opposite.

We actively chose not to implement bbclassappend and I'm not sure the underlying
reasons for doing that have changed.

Cheers,

Richard

