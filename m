Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 937C1781DC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 14:33:26 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v58EXLcq018121
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 8 Jun 2017 15:33:22 +0100
Message-ID: <1496932400.6630.250.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>, Patrick Ohly <patrick.ohly@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 08 Jun 2017 15:33:20 +0100
In-Reply-To: <1496930142.8427.2.camel@gmail.com>
References: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
	<1496850184.21235.1.camel@gmail.com>
	<1496912216.6630.225.camel@linuxfoundation.org>
	<1496930142.8427.2.camel@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 08 Jun 2017 15:33:22 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 0/2] Yocto Compatible 2.0 support code
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
X-List-Received-Date: Thu, 08 Jun 2017 14:33:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-06-08 at 08:55 -0500, Joshua Watt wrote:
> On Thu, 2017-06-08 at 09:56 +0100, Richard Purdie wrote:
> > 
> > On Wed, 2017-06-07 at 10:43 -0500, Joshua Watt wrote:
> > > 
> > > On Wed, 2017-06-07 at 17:31 +0200, Patrick Ohly wrote:
> > > > 
> > > > 
> > > > As discussed in the "[Openembedded-architecture] Yocto
> > > > Compatible
> > > > 2.0
> > > > + signature changes" mail thread, changes in a .bbappend cannot
> > > > be
> > > > done unconditionally. Making _append and _remove depend on
> > > > overrides
> > > > which get set based on DISTRO_FEATURES is one way of achieving
> > > > this.
> > > > 
> > > > The oe.utils.optional_includes() helper function has not been
> > > > discussed before. It's an attempt to address concerns by
> > > > developers
> > > > that having to write code for (potentially complex) condition
> > > > checking
> > > > is error prone and hard to read.
> > > I promise I'm not trying to start a flame war here, and perhaps
> > > there
> > > is history behind this that I'm not aware of but...
> > > 
> > > Why doesn't bitbake support some sort of "if" statement? It seems
> > > like most of what we are trying to do could be accomplished with
> > > much
> > > less fuss if one could simply do this in the bb file:
> > > 
> > >  if bb.utils.contains('DISTRO_FEATURES', 'my-feature', d):
> > >     include foo.inc
> > This wouldn't actually solve as much of the problem as you think it
> > might at first glance and probably causes others, at least as I
> > understand it (as someone who's worked on bitbake's override code).
> > 
> > For example, at what point does this get evaluated? Most bitbake
> > variables are expanded at usage time, not parse time but here, the
> > way
> > the parser works today, it would have to do an immediate expansion
> > of
> > DISTRO_FEATURES to decide whether to include this file (or code
> > block).
> Doesn't this same argument apply to doing a conditional include of a
> file? When bitbake goes to resolve the file name while evaluating the
> AST, it has to evaluate DISTRO_FEATURES which might not be complete.
> If
> the conditional in an "if" statement were also evaluated when
> evaluating the AST, I believe the following snipet:
> 
>  require ${@ oe.utils.optional_includes(d, 'foo-feature:bar.inc') }
> 
> Would be (functionally) identical to something (sort of) like:
> 
>  if oe.utils.optional_includes(d, 'foo-feature:True'):
>      <All of the content of bar.inc>
> 
> Without requiring splitting the recipe content up into multiple
> files.

I did say the problem applied to the require syntax, yes.

Put another way, my big worry is that the if syntax will make people
start to want if syntax for things other than include style operations
and try and do other things other than "inclusion" type work with it.
We'll also need to then start dealing with nesting and most likely
other complications as well as pushing us to having to deal with
immediate expansion problems.

One of the strengths of the current syntax we have to day is that it
makes most things possible but does try and encourage you to do things
"the right way". In adding an if syntax like this I suspect we're on a
path which won't lead to a good place. I appreciate this isn't an exact
science answer :/.


To recap on how we get here, there is a problem of selective content
inclusion in distros/layers. Right now you tend to have to buy into
everything in a layer or nothing. This is bad for usability and
adoption of components in layers. Sometimes its not practical to
separate everything into isolated layers.

We've therefore tried to come up with a way of handling this adding
minimal changes but allowing the configuration we need.

We do need to try and limit the scope of the usage of this as there is
a fundamental issue, namely immediate expansion. I know most users will
not realise there is even a problem with this.

*If* we limit the scope to DISTRO_FEATURES, we stand a reasonable
chance of being able to limit the occasions a user runs into this.

On the other hand, if we add a generic if syntax, encourage usage of
any variable and so on I think we're setting ourselves up for failure.

Patrick for example mentioned IMAGE_FEATURES. This one is fraught with
problems since:

a) Its a recipe level setting so using it in a base configuration
context would end badly

b) Users change this in a variety of places some of which would be
bitten by the immediate expansion problem even just in recipe context

So no, I really don't like the idea of the if syntax, attractive as it
may look at first.

Cheers,

Richard



