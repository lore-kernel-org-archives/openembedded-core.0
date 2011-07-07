Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Qem97-0004at-JD for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 12:49:25 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>) id 1Qem5Q-0005PP-7S
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 12:45:36 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 07 Jul 2011 11:45:35 +0100
In-Reply-To: <1310034549.20015.816.camel@rex>
References: <1308148061.25285.1764.camel@phil-desktop>
	<1310034549.20015.816.camel@rex>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.0.2- 
Message-ID: <1310035536.6337.63.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] tinylogin: use angstrom mirror for SRC_URI
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Jul 2011 10:49:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-07 at 11:29 +0100, Richard Purdie wrote:
> Longer term, I wonder if we could make this recipe download and build
> busybox but only build the getty/login parts and rename the resulting
> static binary to be standalone from busybox itself?
> 
> That would likely address the concerns people (rightly IMO) have about
> making busybox itself SUID...

I wondered about that too, but I'm still not very convinced that this is
a good solution.  I continue to feel that having the setuid
login-related pieces as a separate source package is the best approach
and I've never entirely understood why the busybox folks have been so
determined to deprecate tinylogin in favour of the rolled-up version.

Just to recap, I think there are five main areas of concern around
having login and suchlike be part of busybox:

a) the risk that busybox's privilege-dropping code might malfunction and
lead to applets being run with more privs than they ought to have;

b) the risk that busybox might have vulnerabilities in the code which
runs before privileges are dropped;

c) the difficulty in auditing the codebase for vulnerabilities: given
that any part of busybox can (potentially) call any other function in
the executable, it is hard to determine for sure which lines of code
might be executed under setuid context and which might not;

d) the various pieces of low-level fallout which go with having busybox
itself be technically setuid (even if it drops the privileges
immediately), for example inability to strace /bin/sh as any user other
than root.

e) the relatively high level of churn in the busybox codebase, meaning
that any audit would need to be repeated frequently

I think your proposal would address issues (a), (b), (d), and
potentially (e), but it's not obvious to me that there is any way of
solving (c) that wouldn't introduce another maintenance headache.  And
on the downside, I think (although I haven't tested it) that a
login-only busybox build would probably end up bigger than the tinylogin
binaries that we have today.

p.




