Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QlRS1-0003fO-9T
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 22:08:29 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1QlRNz-00010u-55
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 22:04:19 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E2DBE41.2090202@windriver.com>
References: <bd2e16888f6520e2d02d3ff6c43b360d217572e4.1311601422.git.richard.purdie@linuxfoundation.org>
	<f654f647aa04b5173883785af5cb062df676842a.1311601422.git.richard.purdie@linuxfoundation.org>
	<1311602379.30326.220.camel@phil-desktop>
	<4E2DBE41.2090202@windriver.com>
Date: Mon, 25 Jul 2011 21:04:13 +0100
Message-ID: <1311624253.3098.10.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 3/5] eglibc: Update 2.13 to avoid multilib conflicts
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
X-List-Received-Date: Mon, 25 Jul 2011 20:08:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-07-25 at 14:04 -0500, Mark Hatle wrote:
> As for maintenance, I see this as not terribly complex once you understand what
> and why the patches exist.  Except for the two? headers that I hand merged,
> everything else is obvious once you run a diff between the stock i386 and x86_64
> versions.  There is no intent for "original content" to be in this patch.

The thing about maintenance is that this is a big patch which touches a
lot of files and, although it might be obvious to you what it's doing
and how the contents are generated, it is not necessarily going to be so
obvious to the lucky soul who gets to update the eglibc recipe to a new
version.

If the intent of the patch is that (in most cases) the x86-64 headers
are just being copied on top of the i386 ones, it would be better
expressed as exactly that, i.e. a series of "cp" commands.  Doing it as
a patch is fragile since if the i386 header changes then the patch will
fail to apply, whereas if the x86-64 header changes then the patch will
become stale and you will end up with different contents again.  The
more files are touched by the patch, the greater the likelihood that at
least one of them will have a problem for any given upgrade.

Of course, doing it with "cp" does bring the opposite risk: that a
necessary change to the i386 headers might be lost if the x86-64 ones
are not also updated.  This seems like a smaller risk but perhaps not a
completely negligible one.

And, given that there is at least one header (ie syscall.h) that can't
be merged, I am still tempted to say that the path of least resistance
is simply to install the whole lot into parallel directories and add
them to the front of the compiler search path.  Having
separate /usr/include/32 and /usr/include/64 trees would also avoid the
need for that interstitial header and the licensing imbroglio that it
seems to be causing.

p.




