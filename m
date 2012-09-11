Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TBTpS-0002rX-JD
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 19:00:50 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TBTdN-0000Ry-9z; Tue, 11 Sep 2012 18:48:21 +0200
Message-ID: <1347381972.29443.15.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 11 Sep 2012 17:46:12 +0100
In-Reply-To: <20120911130155.GC14077@jama.jama.net>
References: <20120911130155.GC14077@jama.jama.net>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: qemuarm: should it really have TUNE_ARCH armv5te?
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
X-List-Received-Date: Tue, 11 Sep 2012 17:00:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-09-11 at 15:01 +0200, Martin Jansa wrote:
> Shouldn't spitz produce something like armv5te-xscale and qemuarm armv5te-arm926ejs?

That's a DISTRO policy decision really.

"armv5te", in common with most of the PACKAGE_ARCHes, represents an ISA.
That is, it is guaranteed to only contain instructions which are
supported by all v5TE cores (which includes both ARM926EJ-S and XScale).
It obviously follows from this that packages with PACKAGE_ARCH=armv5te
are suitable for running on both qemuarm and xscale MACHINEs.

Note that a binary that was built with -mtune=arm926ej-s is still an
ARMv5TE binary and will run just fine on xscale.  It won't run quite as
fast as one that was built -mtune=xscale, though the performance
difference is not so great as to be completely crippling.  With current
gcc, the reverse is true as well: a binary built -mtune=xscale is also
still ARMv5TE and will run just fine on ARM926EJ-S, and in fact the
performance penalty is less this way around.

Now, if your DISTRO feels that the performance difference is important
enough to be worth distinguishing the packages, you can certainly
arrange for those two tunings to get separate PACKAGE_ARCHes and
maintain parallel feeds.  But in the general case it's not totally
obvious that this would be worthwhile, and I'm not sure it is a very
useful thing to do by default.

p.




