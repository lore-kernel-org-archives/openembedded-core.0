Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id AAC72731AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 21:22:44 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1aJpLu-00004y-N9; Thu, 14 Jan 2016 22:22:43 +0100
Message-ID: <1452806554.26165.0.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Jan 2016 21:22:34 +0000
In-Reply-To: <3FF112F9-6E3D-4A9E-9A1D-AA30AF596FD6@gmail.com>
References: <1441975783-21782-1-git-send-email-clopez@igalia.com>
	<1441983077.31676.17.camel@pbcl.net>
	<E1DF44AB-9219-4848-9031-60846FC2BF7B@gmail.com>
	<55F751DA.1020903@igalia.com>
	<3FF112F9-6E3D-4A9E-9A1D-AA30AF596FD6@gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] matchbox-keyboard: Fix build failure with ld-is-gold
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
X-List-Received-Date: Thu, 14 Jan 2016 21:22:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

How does that patch help with this issue?  It seems to be adding ifunc
support which isn't obviously related to the problem at hand.

p.

On Thu, 2016-01-14 at 10:27 -0800, Khem Raj wrote:
> Carlos
> 
> Can you try this fix
> 
> https://github.com/kraj/openembedded-core/commit/0e35ad5a35262cfb7a6249ce158f76d1399d6cb4
> 
> 
> This should help with this issue.
> 
> 
> > On Sep 14, 2015, at 4:01 PM, Carlos Alberto Lopez Perez <clopez@igalia.com> wrote:
> > 
> > On 14/09/15 09:24, Khem Raj wrote:
> >> 
> >>> On Sep 11, 2015, at 7:51 AM, Phil Blundell <pb@pbcl.net> wrote:
> >>> 
> >>> On Fri, 2015-09-11 at 14:49 +0200, Carlos Alberto Lopez Perez wrote:
> >>>> * When ld-is-gold is enabled in DISTRO_FEATURES, matchbox-keyboard
> >>>>   will fail to build with this error:
> >>>> 
> >>>>   ld: error: matchbox-keyboard-image.o: requires unsupported dynamic
> >>>>              reloc R_ARM_MOVW_ABS_NC; recompile with -fPIC
> >>> 
> >>> This is only an issue for ARM (and only for Thumb2 at that).  I don't
> >>> think it's necessarily appropriate to force -fPIC on all targets.
> >>> 
> >>> Also, before adding this sort of hack it would be worth verifying
> >>> whether this is in fact a toolchain bug and, if it is, fixing it there.
> >>> 
> >> 
> >> This may not be a toolchain bug if there is a MOVW_ABS relocation being emitted
> >> into an object that is eventually linked into shared library. Using -fPIC seems to be right fix
> >> I know bfd linker silently ignored these relocations and generated bad .so files but that was fixed
> >> several years ago. So I think what needs to be looked at is why does same .o links ok with bfd linker
> >> is it some linker trampoline code thats in question here which may be different between gold and ld
> >> 
> >> Carlos
> >> 
> >> Can you check the linker cmdline of failing link step and see if its generating a shared object there ?
> >> if thats the case and I assume gcc is generating this relocation into both
> >> 
> > 
> > It looks is generating an executable (matchbox-keyboard).
> > 
> > Full log: http://sprunge.us/VPIN
> > 
> 



