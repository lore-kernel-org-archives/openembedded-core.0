Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id EC3016FF78
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Feb 2017 17:50:09 +0000 (UTC)
Received: from [2a00:c60:0:cb01:186:cd80:7d57:daaf] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.87)
	(envelope-from <pb@pbcl.net>)
	id 1ciPR1-0000eq-2Z; Mon, 27 Feb 2017 18:50:08 +0100
Message-ID: <1488217806.8657.20.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Date: Mon, 27 Feb 2017 17:50:06 +0000
In-Reply-To: <alpine.LFD.2.20.1702270819550.25847@uk63952.mitel.com>
References: <alpine.LFD.2.20.1702270819550.25847@uk63952.mitel.com>
X-Mailer: Evolution 3.22.1-2 
Mime-Version: 1.0
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
X-List-Received-Date: Mon, 27 Feb 2017 17:50:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-02-27 at 09:09 -0500, Robert P. J. Day wrote:
>  # webkit-efl isn't available for < armv7a
>  COMPATIBLE_MACHINE = "(-)"
>   COMPATIBLE_MACHINE_x86 = "(.*)"
>   COMPATIBLE_MACHINE_x86-64 = "(.*)"
>   COMPATIBLE_MACHINE_armv7a = "(.*)"
> 
>   first, that comment seems out of date as it makes no mention of
> MIPS
> or ppc, but that's just being picky.
> 
>   next, i assume the line:
> 
>   COMPATIBLE_MACHINE = "(-)"
> 
> is to initialize the set of compatible machines to the empty set,
> yes?

I think the intent is to set it to a string that "can't possibly ever
match". 

> 
  i next assume that lines of the form:
> 
>   COMPATIBLE_MACHINE_x86 = "(.*)"
> 
> are meant to indicate that if that MACHINE_OVERRIDES comparison
> succeeds, then all possible targets are compatible, is that right?
> however, given precisely those lines above, is it not equivalent to
> just write:
> 
>   COMPATIBLE_MACHINE = "(x86|x86-64|armv7a)"

No, because "armv7a" is not a MACHINE.  It would be more equivalent to
write

COMPATIBLE_HOST = "armv7a-.*"

but even this would not be quite the same because it would fail to
match "cortexa15-linux" for example.  Actually that's not a very good
example because cortexa15 is armv7ve not armv7a, but you get the idea.

> oddly, there is another recipe that seems to do the same thing, but
> in
> a very different way, meta-oe/recipes-support/ne10/ne10_1.2.1.bb:
> 
>   COMPATIBLE_MACHINE_aarch64 = "(.*)"
>   COMPATIBLE_MACHINE_armv7a = "(.*)"
> 
>   python () {
>     if any(t.startswith('armv7') for t in
> d.getVar('TUNE_FEATURES').split()):
>         d.setVar('NE10_TARGET_ARCH', 'armv7')
>         bb.debug(2, 'Building Ne10 for armv7')
>     elif any(t.startswith('aarch64') for t in
> d.getVar('TUNE_FEATURES').split()):
>         d.setVar('NE10_TARGET_ARCH', 'aarch64')
>         bb.debug(2, 'Building Ne10 for aarch64')
>     else:
>         raise bb.parse.SkipPackage("Incompatible with archs other
> than armv7 and aarch64")
>   }

The COMPATIBLE_MACHINE declarations there do seem completely useless
and redundant.  I can only assume that the author of this recipe tried
to use COMPATIBLE_MACHINE to get what they wanted, found they couldn't
(which is true, the COMPATIBLE_MACHINE semantics are full of suck, and
even COMPATIBLE_HOST has a fairly high suckage quotient) and resorted
to writing python to express their requirements.

> now, i can see that that anonymous python routine refines the
> machine compatibility even further but, to speed things up, why not
> first start with just:
> 
>   COMPATIBLE_MACHINE = "(aarch64|armv7a)"
> 
> or (once again), am i misunderstanding something?

No, that will lose unless your MACHINE happens to be literally named
"aarch64", which it probably isn't.  But in any case there is no magic
associated with COMPATIBLE_MACHINE, it is just processed by a piece of
anonymous python which is not entirely dissimilar to that bit you
quoted above.

p.


