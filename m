Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QUdTc-0005Mm-SU for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 13:32:41 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p59BTHF2012106
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Jun 2011 12:29:17 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11638-08 for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2011 12:29:13 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p59BTCvA012100
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Jun 2011 12:29:13 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1307618044.2529.4810.camel@phil-desktop>
References: <cover.1307523829.git.dongxiao.xu@intel.com>
	<3cb0d7f134013f8dcd664429b7efda396d12790e.1307523829.git.dongxiao.xu@intel.com>
	<1307525772.2529.4777.camel@phil-desktop>
	<1307547318.15712.109.camel@rex>
	<1307618044.2529.4810.camel@phil-desktop>
Date: Thu, 09 Jun 2011 12:29:04 +0100
Message-ID: <1307618944.15712.150.camel@rex>
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
X-List-Received-Date: Thu, 09 Jun 2011 11:32:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-09 at 12:14 +0100, Phil Blundell wrote:
> On Wed, 2011-06-08 at 16:35 +0100, Richard Purdie wrote:
> > I'm not sure how this would reduce performance of builds of a few
> > threads, it should just make better use of any available "spare"
> > processing capacity throughout the build.
> 
> If I'm reading the patch right, it does involve a certain amount of
> extra copying around of the locale-related files since they need to be
> stashed away in some place where libc-locale.bb can find them later.  I
> don't think these files are especially big, but there are quite a few of
> them (which is the whole reason that libc's do_package was slow in the
> first place). 
> 
> I must admit that I'm slightly surprised that libc's packaging stage is
> becoming a bottleneck for anything other than the very smallest builds.
> If there's any substantial amount of other material being compiled then
> I would expect that there would be enough do_compile() work to keep the
> other threads busy until libc was done packaging.  That's not to say
> that I think this change is a bad idea, but I would be interested to
> know what the actual impact is for real-world workloads.
> 
> And, just on a point of principle, any time we're making a chance for
> performance-related reasons I think we should always have measurements
> to back it up. 

Totally agreed and this decision is being made on real world data even
if its perhaps not clearly being presented here.

$ cat buildstats/core-image-sato-qemux86/201106030912/eglibc-2.13-r1+svnr13356/do_package | grep time
eglibc-2.13-r1+svnr13356: do_package: Elapsed time: 828.01 seconds

As you can see, eglibc do_package takes about 14 minutes which is about
14% of our build time. That is a long time to block pretty much all
packaging activity, particularly if you have access to something with
several cores. When it does complete, even on my 4 core system you see a
"stampeding herd" of packaging happening on the build charts suggesting
a backlog does build up.

For those reasons I do think its a reasonable change.

Cheers,

Richard










