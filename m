Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 426246A8B3
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jun 2013 13:23:50 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UlJ7W-0001nc-2v; Sat, 08 Jun 2013 15:23:50 +0200
Message-ID: <1370697821.4141.56.camel@pb-ThinkPad-R50e>
From: Phil Blundell <pb@pbcl.net>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 08 Jun 2013 14:23:41 +0100
In-Reply-To: <20130607204305.GM22710@jama>
References: <20130607192007.GL22710@jama>
	<1370636049.4141.22.camel@pb-ThinkPad-R50e>
	<20130607204305.GM22710@jama>
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
X-List-Received-Date: Sat, 08 Jun 2013 13:23:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-06-07 at 22:43 +0200, Martin Jansa wrote:
> 2) RP2+PB: Warning/Error if two things provide the same shlibs
>    - probably better to error out when bar.bb is being built and tries
>      to provide the same libabc libabc.bb, it can be in different order
>      as bar does not depends on libabc, so next time it can show error
>      when building libabc, but IMHO better then showing error when foo 
>      finds out 2 possible libabc providers

Raising an error if libabc is already staged when bar is built would be
good as well, but I don't think this is sufficient in the general case.
Consider:

1. bitbake libabc

-> no problem, bar isn't built yet, libabc goes into sstate-cache

2. rm -rf $TMPDIR; bitbake bar

-> also no problem, libabc isn't in the sysroot anymore, bar goes into
sysroot (and sstate-cache)

3. bitbake foo

-> libabc comes back from sstate but bar is still there, disaster
strikes.

Obviously that particular example is a bit contrived, but you can
imagine that if your sstate-cache (or part of it) is shared among
multiple users then this sort of situation could arise fairly easily.

p.



