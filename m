Received: from [93.97.173.237] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QqPUW-0006I8-Tl for openembedded-core@lists.openembedded.org;
	Mon, 08 Aug 2011 15:03:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p78Cx5Ox002796;
	Mon, 8 Aug 2011 13:59:05 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02217-05; Mon,  8 Aug 2011 13:59:01 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p78Cx0Dt002788
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 8 Aug 2011 13:59:00 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <F5D4B029-50F1-47E1-934C-8918DF2624F5@kernel.crashing.org>
References: <F5D4B029-50F1-47E1-934C-8918DF2624F5@kernel.crashing.org>
Date: Mon, 08 Aug 2011 13:58:30 +0100
Message-ID: <1312808310.14274.187.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: multilib theory & practice
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
X-List-Received-Date: Mon, 08 Aug 2011 13:03:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2011-08-06 at 15:56 -0500, Kumar Gala wrote:
> I'm looking at trying to get multilib working for powerpc.  However
> I'm a bit lost in how this is suppose to work from a few different
> perspectives:
> 
> 1. from user perspective (I'm starting with a 64-bit build in /lib64 and adding 32-bit that would be in /lib):
> 
> (i've added in local/conf):
> require conf/multilib.conf
> MULTILIBS = "multilib:lib"
> DEFAULTTUNE_virtclass-multilib-lib = "powerpc"

Rather than use the identifier "lib", I'd use an identifier like "lib32"
which is unlikely to be found in a recipe name. Therefore something
like:

require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "powerpc"

> What should this end up producing?  Do I get a 32-bit set of libs built automatically?  What else do I need to do?

This will enable a number of other built targets such as "lib32-bash".
You can also construct images that are mixtures of the various multilibs
(e.g. install both openssl and lib32-openssl).

> 2. From a infrastructure point of view:
> 
> * Do have a single compiler that is multi-arch or 2 compilers? (not sure how the x86_64 toolchain works today)

At this point we've gone for 2 compilers. This was a conscious choice to
avoid additional complexity and allow us to get the core functionality
working. We can support merged toolchains at a future date with
appropriate toolchain configuration and ASSUME_PROVIDED declarations.

> * what areas should I investigate that might need tweaking that are arch specific?

There should be very little beyond the places you've already changed
that should need tweaking. The only issues may be due to this being
very new code.

> * should I see different task names for the new multilib builds? (or the 32-bit specific builds?)

multilib.conf lists the recipes that will become multilib enabled. I've
just merged a patch to extend this list to include the various ones that
have been tested. The ultimate plan is not to require that list and its
just a transition point.

Cheers,

Richard





