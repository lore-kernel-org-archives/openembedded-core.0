Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id E78DE6FF84
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 14:00:53 +0000 (UTC)
Received: from elite.brightsigndigital.co.uk ([213.210.30.29]
	helo=phil-desktop) by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <pb@pbcl.net>)
	id 1abToD-0007gp-DU; Thu, 03 Mar 2016 15:00:53 +0100
Message-ID: <1457013652.3476.44.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 03 Mar 2016 14:00:52 +0000
In-Reply-To: <20160303131826.GE2569@jama>
References: <1453937316-1311-1-git-send-email-armccurdy@gmail.com>
	<1453937316-1311-4-git-send-email-armccurdy@gmail.com>
	<1457010155.3476.31.camel@pbcl.net> <20160303131826.GE2569@jama>
X-Mailer: Evolution 3.18.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] glib.inc: limit ARM_INSTRUCTION_SET over-rides to armv4/armv5
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
X-List-Received-Date: Thu, 03 Mar 2016 14:00:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2016-03-03 at 14:18 +0100, Martin Jansa wrote:
> On Thu, Mar 03, 2016 at 01:02:35PM +0000, Phil Blundell wrote:
> > On Wed, 2016-01-27 at 15:28 -0800, Andre McCurdy wrote:
> > > -ARM_INSTRUCTION_SET = "arm"
> > > +ARM_INSTRUCTION_SET_armv4 = "arm"
> > > +ARM_INSTRUCTION_SET_armv5 = "arm"
> > 
> > Although I agree that this is a net improvement over the old code
> > in
> > almost all cases, this patch is not quite right.  The reason for
> > the
> > original override is that there is assembler code in glib which
> > won't
> > compile as Thumb-1 (but is ok in Thumb-2).  Thumb-2 is only
> > available
> > in ARMv6T2 and newer architectures so with your patch it looks like
> > compilation on arm1136jf-s (which is ARMv6 not ARMv6T2) would now
> > fail.
> 
> If the MACHINE doesn't have thumb in TUNE_FEATURES (for selected
> DEFAULTTUNE) won't use -mthumb, so building on ARMv6 shouldn't fail
> or I didn't get your point.

Well, right, clearly it won't fail if you don't select thumb at all,
but the same is true of armv4 and armv5 so by that line of argument the
overrides here are completely redundant.  If you enable thumb on ARMv6
then glib-2.0 fails to build in the same way as it would have done for
armv4/armv5 without the overrides on ARM_INSTRUCTION_SET.

(Admittedly though, if you actually try to enable thumb with ARMv6 then
there are other problems that you need to fix before you can get as far
as even trying to compile glib-2.0.  This is perhaps further evidence
that nobody is doing this in practice!)

> 
> > 3. Take the view that it's now nearly fifteen years since Thumb-2
> > was
> > introduced, OE-core no longer needs to pander explicitly to Thumb-
> > 1,
> > and we should just remove all this scar tissue entirely.  Distros
> > that
> > do want to target Thumb-1 can still maintain the appropriate
> > compatibility stuff (which is probably only a dozen lines or so)
> > for
> > themselves.
> 
> Except that oe-core still contains qemuarm which is armv5t and
> almost 
> nobody is building it with thumb enabled in DISTRO config. 

Right, and the point I was trying to make is that, in this day and age,
it's not obvious that supporting Thumb1 is an important goal for oe-
core (because Thumb1 is sufficiently limited in both capabilities and
performance that anybody who wants Thumb-state will be using a Thumb2
capable cpu, and anybody who is stuck with an older cpu will be using
ARM-state).  

If nobody, or almost nobody, is actually building a Thumb1
configuration then this would seem to indicate that this is just an
obsolete technology and nobody would mind very much if support for it
were removed from oe-core.

p.


