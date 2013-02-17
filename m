Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1U71iO-0002ee-Rf for openembedded-core@lists.openembedded.org;
	Sun, 17 Feb 2013 11:43:32 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1HAXbgi008362; Sun, 17 Feb 2013 10:33:37 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QHgNDz10Iudc; Sun, 17 Feb 2013 10:33:37 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r1HAXR7U008359
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sun, 17 Feb 2013 10:33:30 GMT
Message-ID: <1361096822.31795.122.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Seebach <peter.seebach@windriver.com>
Date: Sun, 17 Feb 2013 10:27:02 +0000
In-Reply-To: <1361067834-23267-1-git-send-email-peter.seebach@windriver.com>
References: <1361067834-23267-1-git-send-email-peter.seebach@windriver.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Pseudo performance changes...
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
X-List-Received-Date: Sun, 17 Feb 2013 10:43:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2013-02-16 at 20:23 -0600, Peter Seebach wrote:
> Unlike most of my submissions, this isn't patches against oe-core; rather,
> it's patches against pseudo, and if I can get some confirmation that they do
> what I think they do, and some review, I'm planning to make this into
> pseudo 1.5, and send a patch "soonish" to merge that into oe-core.
> 
> What this does: Fix a number of build performance issues. By far the
> largest change is actually not so much a problem with pseudo as a problem
> that pseudo can solve by brute force. Packaging systems (at least RPM and
> SMART) do a lot of fsync() and fdatasync() calls. That usually implies
> flushing EVERYTHING that's been written, not just one specific file. And
> that, in turn, results in a severe performance hit.
> 
> So, for instance, on one of my test workstations, this moves a do_rootfs
> with about 1200 RPMs from about 22 minutes to about 4.5. Yeah.
> 
> The other changes aren't as dramatic for that case, but have very significant
> performance impact for at least some workloads. The first is switching to
> using an in-memory database for the files database, dumping it to disk only
> when the pseudo daemon is idle or shutting down. This doesn't produce huge
> benefits in all cases, but for workloads with a lot of parallelism, it can
> produce a very noticeable reduction in how much pseudo slows things down.
> 
> The second is a fairly major protocol change. In short, with this patch,
> pseudo clients only wait for a server response when they need information
> from the server in order to continue. That's OP_FSTAT, OP_STAT,
> OP_MAY_UNLINK, and OP_MKNOD. Everything else just silently assumes that
> it probably succeeded.
> 
> How much does this matter? Between the protocol change and the memory
> DB, a trivial unpack of a tarball (lots of writes to the database, very
> few reads) can be about 4x faster. Removing stuff isn't much faster, but
> it might be a bit faster.
> 
> This is most noticeable, by far, when running more than one build, or
> when running builds while doing other things. It has a much smaller effect
> on builds with no shared state (compile time still dominates that), but
> even there I'm seeing decreases from ~83 minutes to ~64 from just the
> fsync and memory changes. Still waiting on my real test case (multiple
> simultaneous builds which need compiles) completing.

All sounds good to me. I've set the autobuilder away to test this set of
changes.

Cheers,

Richard



