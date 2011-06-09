Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QUdEq-00059i-8b for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 13:17:24 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QUdBf-0007wV-1U
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 13:14:07 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1307547318.15712.109.camel@rex>
References: <cover.1307523829.git.dongxiao.xu@intel.com>
	<3cb0d7f134013f8dcd664429b7efda396d12790e.1307523829.git.dongxiao.xu@intel.com>
	<1307525772.2529.4777.camel@phil-desktop>
	<1307547318.15712.109.camel@rex>
Organization: Phil Blundell Consulting Ltd
Date: Thu, 09 Jun 2011 12:14:04 +0100
Message-ID: <1307618044.2529.4810.camel@phil-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 1/1] libc-locale: split locale handling from libc recipe.
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
X-List-Received-Date: Thu, 09 Jun 2011 11:17:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-08 at 16:35 +0100, Richard Purdie wrote:
> I'm not sure how this would reduce performance of builds of a few
> threads, it should just make better use of any available "spare"
> processing capacity throughout the build.

If I'm reading the patch right, it does involve a certain amount of
extra copying around of the locale-related files since they need to be
stashed away in some place where libc-locale.bb can find them later.  I
don't think these files are especially big, but there are quite a few of
them (which is the whole reason that libc's do_package was slow in the
first place). 

I must admit that I'm slightly surprised that libc's packaging stage is
becoming a bottleneck for anything other than the very smallest builds.
If there's any substantial amount of other material being compiled then
I would expect that there would be enough do_compile() work to keep the
other threads busy until libc was done packaging.  That's not to say
that I think this change is a bad idea, but I would be interested to
know what the actual impact is for real-world workloads.

And, just on a point of principle, any time we're making a chance for
performance-related reasons I think we should always have measurements
to back it up. 

p.




