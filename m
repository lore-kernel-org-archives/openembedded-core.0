Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B4A9D6010B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 08:57:01 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v588uu8j017175
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 8 Jun 2017 09:56:57 +0100
Message-ID: <1496912216.6630.225.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <jpewhacker@gmail.com>, Patrick Ohly <patrick.ohly@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 08 Jun 2017 09:56:56 +0100
In-Reply-To: <1496850184.21235.1.camel@gmail.com>
References: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
	<1496850184.21235.1.camel@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 08 Jun 2017 09:56:57 +0100 (BST)
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
X-List-Received-Date: Thu, 08 Jun 2017 08:57:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-06-07 at 10:43 -0500, Joshua Watt wrote:
> On Wed, 2017-06-07 at 17:31 +0200, Patrick Ohly wrote:
> > 
> > As discussed in the "[Openembedded-architecture] Yocto Compatible
> > 2.0
> > + signature changes" mail thread, changes in a .bbappend cannot be
> > done unconditionally. Making _append and _remove depend on
> > overrides
> > which get set based on DISTRO_FEATURES is one way of achieving
> > this.
> > 
> > The oe.utils.optional_includes() helper function has not been
> > discussed before. It's an attempt to address concerns by developers
> > that having to write code for (potentially complex) condition
> > checking
> > is error prone and hard to read.
> I promise I'm not trying to start a flame war here, and perhaps there
> is history behind this that I'm not aware of but...
> 
> Why doesn't bitbake support some sort of "if" statement? It seems
> like most of what we are trying to do could be accomplished with much
> less fuss if one could simply do this in the bb file:
> 
>  if bb.utils.contains('DISTRO_FEATURES', 'my-feature', d):
>     include foo.inc

This wouldn't actually solve as much of the problem as you think it
might at first glance and probably causes others, at least as I
understand it (as someone who's worked on bitbake's override code).

For example, at what point does this get evaluated? Most bitbake
variables are expanded at usage time, not parse time but here, the way
the parser works today, it would have to do an immediate expansion of
DISTRO_FEATURES to decide whether to include this file (or code block).

So ok, lets assume we change bitbake massively and defer the expansion
somehow. What if foo.inc influences the contents of DISTRO_FEATURES?
Should it then "unparse" foo.inc if my-feature was removed? or error?
or silently ignore that?

bitbake's main conditional today is through overrides and these do
allow a controlled delayed expansion of metadata in most cases. In some
cases such as include and inherit statements there is still the
immediate expansion issue above but at least there aren't huge changes
to the parser required to make it work so its the best of both worlds.

> One could even eliminate the separate inc file and simply put its
> contents under the conditional (as much fun as it seems to have to
> open
> a new file just to see what a recipe is doing with a distro
> feature...)
> 
> It would also appear that this could make a lot of other things
> simpler as well (and may even negate the need to backfill
> DISTRO_FEATURES into overrides?)

See if the above gives food for thought on that...

The big problems are the corner cases. If we do add new syntax it needs
to avoid these as we already have some pretty nasty ones, thankfully
most people don't hit them though.

Cheers,

Richard

