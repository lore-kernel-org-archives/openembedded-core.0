Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QraH4-0006Gc-6L for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 20:46:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7BIg3Ld000684
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 19:42:03 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 32410-06 for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 19:41:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7BIfsn2000678
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2011 19:41:55 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1313076641.14274.431.camel@rex>
References: <1312484099-29314-1-git-send-email-galak@kernel.crashing.org>
	<4E437883.90406@intel.com>
	<1D98D492-1D74-49DE-A884-C919AFF30BDD@kernel.crashing.org>
	<1313076641.14274.431.camel@rex>
Date: Thu, 11 Aug 2011 19:41:16 +0100
Message-ID: <1313088076.14274.461.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH] gcc: use ${base_lib} to match gcc default configuration
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
X-List-Received-Date: Thu, 11 Aug 2011 18:46:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-08-11 at 16:30 +0100, Richard Purdie wrote:
> On Thu, 2011-08-11 at 01:47 -0500, Kumar Gala wrote:
> > revert this is not acceptable as that will break ppc64 builds.
> > 
> > I think you need to look at 64bithack.patch and if we really should be using it for multilib builds.
> 
> This just sounds like gcc totally ignores the the library directory
> we're using and that is plain wrong :(.
> 
> I'd much prefer gcc didn't make assumptions in this case and did what
> were were configuring it to do. That is why there is that 64bit hack
> there and I think gcc should be honouring however we configure the
> library directories, not doing what it thinks is best...

I did more digging and this really just highlights why we have that
64bit "hack" patch in the first place.

GCC has internal multilib 'magic' which assumes certain library layout
in the 64 bit case. The implication is if you build 64 bit, you cannot
have baselib != "lib64". Whilst I can understand this on desktop system,
I'd suggest our build system has a better idea what its doing than most
and can cope without hardcoding things.

This is why the default builds in the gcc config are set to "." by that
patch, that respects whatever base_libdir is set to. I'd suggest we do
this for x86, pcc and mips 64 bit and revert the origin baselib patch,
but this time better improve the patch documentation about why this is
necessary.

Cheers,

Richard



