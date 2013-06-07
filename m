Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 44AA66969C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jun 2013 20:14:19 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Ul33D-0000Pw-Vs; Fri, 07 Jun 2013 22:14:20 +0200
Message-ID: <1370636049.4141.22.camel@pb-ThinkPad-R50e>
From: Phil Blundell <pb@pbcl.net>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 07 Jun 2013 21:14:09 +0100
In-Reply-To: <20130607192007.GL22710@jama>
References: <20130607192007.GL22710@jama>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: is sstate-cache really deterministic together with shlibs providers?
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
X-List-Received-Date: Fri, 07 Jun 2013 20:14:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-06-07 at 21:20 +0200, Martin Jansa wrote:
> Imagine this process
> 
> foo.bb DEPENDS on libabc.bb to provide libabc.1.so
> 
> evil recipe bar.bb installs some binary crap in /opt/crap and because it's
> picky about libabc version it bundles own compy of libabc.so.1 and
> installs it to /opt/crap/lib/libabc.so.1
> 
> At the time of first build nobody notices libabc.1.so and foo, bar and
> libabc are happily populated to sysroot.
> 
> foo.bb is rebuilt because of some unrelated change, but this times it
> uses bar as shlibs provider for libabc.so.1

It sounds like the real bug here is that the shlibdeps code doesn't
issue a diagnostic when it encounters this kind of ambiguous situation.
It ought to be perfectly capable of figuring out that there are two
copies of libabc.so.1 at large which belong to different packages and,
absent additional guidance, it has no reliable way of knowing which one
of those is going to satisfy the DT_NEEDED in any random binary.

If shlibdeps stopped with an error in that situation, which arguably it
ought to, then the erroneous dependency would never get into sstate and
the scenario that you describe would not be able to happen.

p.



