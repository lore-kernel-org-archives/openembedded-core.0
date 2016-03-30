Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 5EF3760248
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Mar 2016 22:46:33 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <pb@pbcl.net>)
	id 1alOsi-0002CW-Hm; Thu, 31 Mar 2016 00:46:32 +0200
Message-ID: <1459377982.2322.57.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 30 Mar 2016 23:46:22 +0100
In-Reply-To: <CAJ86T=V8ftVDVY498MULYspLE57JvzPCOgQhCk_hp-8UbTuBEg@mail.gmail.com>
References: <1459178969-23397-1-git-send-email-daniel.dragomir@windriver.com>
	<1459203003.2322.29.camel@pbcl.net>
	<87103DB9-1813-4A3B-A68D-9BDC572BC588@gmail.com>
	<56FBF8CA.20809@windriver.com>
	<0D55B52F-DFC8-4E25-A7E7-AAEEE683894B@gmail.com>
	<CAJ86T=WfMfoXjabaN0+9u52Jxy4d+HXnaJv2Hii+TEtr0JohNw@mail.gmail.com>
	<6065832E-762D-413F-AE15-9B743371EF93@gmail.com>
	<CAJ86T=V8ftVDVY498MULYspLE57JvzPCOgQhCk_hp-8UbTuBEg@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ARMv8-A: Add tune for AArch32 state and AArch64 state
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
X-List-Received-Date: Wed, 30 Mar 2016 22:46:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-03-30 at 11:53 -0700, Andre McCurdy wrote:
> Either way it shouldn't be a concern for the CPU tuning files.
> Building Thumb2 for an armv8a CPU is really just an extension of
> "optimise for size" and we don't include -Os, -O2, etc options in the
> CPU tuning files.

Yes, agreed.  In principle there's no reason that the compiler couldn't
choose between A32 and T32 instruction sets dynamically for each
compilation unit (or each function) according to which it thinks would
give the better result.  And from the user's point of view, the outcome
should be equivalent apart from minor performance differences.

> >> For most cores from Cortex A9 onwards NEON and VFP are optional, so
> >> hardcoded assumptions won't work.

> Nothing very concrete. The ARM Cortex-A Series Programmer’s Guide for
> ARMv8-A mentions:
> 
> "Both floating-point and NEON are required in all standard ARMv8
> implementations. However, implementations targeting specialized
> markets may support the following combinations:
> 
>  - No NEON or floating-point.
>  - Full floating-point and SIMD support with exception trapping.
>  - Full floating-point and SIMD support without exception trapping.

Is there any evidence that anyone is actually building ARMv8-A (as
opposed to -R or -M) cores that lack VFP and/or NEON?  Unless there is a
fairly clear indication that such cores do exist and are likely to be
used with OE, I think we should not complicate the tuning files with
support for such things.  Anybody who wants them can always add
appropriate tunes later, either in oe-core or in their own layer.

p.



