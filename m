Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TbqX4-0007BV-12
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Nov 2012 11:30:50 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TbqJQ-0005I4-Ie; Fri, 23 Nov 2012 11:16:44 +0100
From: Phil Blundell <philb@gnu.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Fri, 23 Nov 2012 10:16:43 +0000
In-Reply-To: <1353621779.10459.67.camel@ted>
References: <1353620179.10459.59.camel@ted>
	<1353621014.2000.16.camel@x121e.pbcl.net>
	<1353621779.10459.67.camel@ted>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1353665804.13864.713.camel@phil-desktop>
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-cross: Explicitly depend on linux-libc-headers
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Nov 2012 10:30:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-11-22 at 22:02 +0000, Richard Purdie wrote:
> On Thu, 2012-11-22 at 21:50 +0000, Phil Blundell wrote:
> > On Thu, 2012-11-22 at 21:36 +0000, Richard Purdie wrote:
> > > -DEPENDS = "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}libc-for-gcc ${NATIVEDEPS}"
> > > +DEPENDS = "virtual/${TARGET_PREFIX}binutils virtual/${TARGET_PREFIX}libc-for-gcc linux-libc-headers ${NATIVEDEPS}"
> > 
> > gcc-cross isn't particularly specific to linux targets and ideally we
> > don't want to be adding more linuxisms to the recipe.  It is,
> > admittedly, not entirely obvious how we could conveniently get that
> > dependency added only for linux targets (since I don't think there's any
> > existing OVERRIDE that's helpful here) but perhaps we should find a way
> > to address that problem rather than just sticking it in unconditionally.
> 
> virtual/${TARGET_OS}-headers with a suitable provider entry?

I think a better approach would be to use a python fragment which
appends linux-libc-headers if ${TARGET_OS} starts with "linux".  Your
suggestion would work as well but it seems a bit ugly, and would still
be slightly annoying for targets where no such headers are required.

> I was assuming someone who cares about non-linux wouldn't find this
> particularly hard to deal with...

Well, indeed, but equally it doesn't seem especially polite to introduce
gratuitous target-specific bits into core recipes on the assumption that
someone else will run around after you cleaning them up.  If I was to
start sending patches for gcc which worked for my employer's favourite
target but broke everything else then you would presumably reject them,
and rightly so.

p.




