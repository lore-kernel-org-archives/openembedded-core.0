Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QUKqK-0008K4-H9 for openembedded-core@lists.openembedded.org;
	Wed, 08 Jun 2011 17:38:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p58FZYJV000436
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Jun 2011 16:35:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00358-01 for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jun 2011 16:35:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p58FZPoD000430
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Jun 2011 16:35:26 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1307525772.2529.4777.camel@phil-desktop>
References: <cover.1307523829.git.dongxiao.xu@intel.com>
	<3cb0d7f134013f8dcd664429b7efda396d12790e.1307523829.git.dongxiao.xu@intel.com>
	<1307525772.2529.4777.camel@phil-desktop>
Date: Wed, 08 Jun 2011 16:35:17 +0100
Message-ID: <1307547318.15712.109.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Wed, 08 Jun 2011 15:38:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-06-08 at 10:36 +0100, Phil Blundell wrote:
> On Wed, 2011-06-08 at 17:08 +0800, Dongxiao Xu wrote:
> > *libc's do_package will cost a lot of time due to the locale handing,
> > which may delay the other recipe's do_package task and affect the build
> > performance.
> > 
> > This commit moves locale handling into a separate recipe *libc-locale.
> 
> Can you quantify the effect on build performance a bit?  If I understand
> correctly, you're basically saying that the goal is to increase
> parallelism.  Does that cause reduced performance for people running
> with few threads?

One of the side effects of debian.bbclass is that it requires all
dependencies to do_package before any package itself can do_package so
any renaming of dependencies can be accounted for.

There is an issue if do_package for libc takes an age as it holds up any
other tasks from writing out packages. Pretty much most things depend on
libc.

This patch therefore splits it into two stages and means that packaging
of things depending on libc can happen sooner thereby increasing the
potential parallelism of the packaging stages of builds.

There is a very clear step on the "bootchart" graphs of builds I made
showing this.

I'm not sure how this would reduce performance of builds of a few
threads, it should just make better use of any available "spare"
processing capacity throughout the build.

Cheers,

Richard




