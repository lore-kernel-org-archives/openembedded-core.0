Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id CB227606E8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 22:24:40 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1YyShh-0006uY-9h; Sat, 30 May 2015 00:24:37 +0200
Message-ID: <1432938270.2461.46.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Fri, 29 May 2015 23:24:30 +0100
In-Reply-To: <1528283.0UTgDEqc8E@peggleto-mobl.ger.corp.intel.com>
References: <cover.1432775689.git.kai.kang@windriver.com>
	<20150528084706.GC2383@jama> <5567C29C.3030307@windriver.com>
	<1528283.0UTgDEqc8E@peggleto-mobl.ger.corp.intel.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/5] libav: upgrade to 9.18
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
X-List-Received-Date: Fri, 29 May 2015 22:24:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2015-05-29 at 16:28 +0100, Paul Eggleton wrote:
> Just for background, the reason I disabled the textrel check for x86 in 
> libav.inc was that I was able to determine based on quick research that 
> upstream deliberately doesn't enable -fPIC for x86 (32-bit) because apparently 
> it doesn't really work there. I honestly didn't check what the situation was 
> on 32-bit ARM; I probably should have done that at the time.

PIC is particularly problematic on x86 because it ties up %ebx.  This
represents 25% of the available general purpose registers which can
cause a measurable performance loss because of increased spilling, and
in the particular case of libav there is a lot of hand-written assembly
in the codecs which expects to be able to clobber that register.  It
certainly used to be the case that this code wouldn't compile at all
under -fpic.

The performance thing does apply to ARM as well but to a slightly lesser
extent.  The second problem probably doesn't affect ARM at all.  But,
personally, I would disable the textrel check and build without -fpic on
all platforms.

p.



