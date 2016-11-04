Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id AC655605BF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 23:14:57 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=tp13)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.84)
	(envelope-from <pb@pbcl.net>)
	id 1c2nhG-0006Dy-KJ; Sat, 05 Nov 2016 00:14:55 +0100
Message-ID: <1478301288.3662.21.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Khem Raj <raj.khem@gmail.com>, Li Zhou <li.zhou@windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 04 Nov 2016 23:14:48 +0000
In-Reply-To: <b3c8d5de-1d26-b37b-e28c-f8cca01c9ba3@gmail.com>
References: <20161104090719.30795-1-li.zhou@windriver.com>
	<b3c8d5de-1d26-b37b-e28c-f8cca01c9ba3@gmail.com>
X-Mailer: Evolution 3.20.5-1 
Mime-Version: 1.0
Subject: Re: [PATCH] db: disable the ARM assembler mutex code
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
X-List-Received-Date: Fri, 04 Nov 2016 23:15:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-11-04 at 11:22 -0700, Khem Raj wrote:
> 
> 
> On 11/4/16 2:07 AM, Li Zhou wrote:
> > 
> > The swpb in macro MUTEX_SET will cause "undefined instruction"
> > error
> > on the new arm arches which don't support this assembly instruction
> > any more. If use ldrex/strex to replace swpb, the old arm arches
> > don't
> > support them. So to avoid this issue, just disable the ARM
> > assembler
> > mutex code, and use the default pthreads mutex.
> > 

> it would be good to keep this for older < armv5 arches

I guess you meant "<= ARMv5".  STREX etc were introduced in ARMv6, so
ARMv5 (and ARMv5TE) don't have it.  But in any case, won't the default
libpthread mutex work just fine on those older architectures?  There is
no SMP on anything before ARMv6 anyway so lock contention will be
relatively low, and it seems fairly unlikely that anybody has a real-
world application which uses db so heavily that the mutex
implementation will have any noticeable performance impact.

And, given that it's now something like 15 years since support for
STREX was introduced in ARMv6, and more than 10 years since support for
SWP was deleted in ARMv7, it doesn't seem entirely unreasonable for oe-
core to pick the newer paradigm as the case to optimise for.  Distros
that want to target ARMv5 or older are obviously free to do so and they
can carry the SWP patch locally if they want to.  But as far as oe-core 
itself is concerned, at this point it seems like it's just scar tissue.

p.


