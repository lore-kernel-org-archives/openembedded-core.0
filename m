Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QUfhm-0006Pj-VX for openembedded-core@lists.openembedded.org;
	Thu, 09 Jun 2011 15:55:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p59Dq8fE013244
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Jun 2011 14:52:08 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12908-06 for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2011 14:52:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p59Dq2SX013238
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Jun 2011 14:52:03 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <1307625339.15712.155.camel@rex>
References: <cover.1307523829.git.dongxiao.xu@intel.com>
	<3cb0d7f134013f8dcd664429b7efda396d12790e.1307523829.git.dongxiao.xu@intel.com>
	<1307525772.2529.4777.camel@phil-desktop>
	<1307547318.15712.109.camel@rex>
	<1307618044.2529.4810.camel@phil-desktop>
	<1307618944.15712.150.camel@rex>
	<1307619798.2529.4844.camel@phil-desktop>
	<1307625339.15712.155.camel@rex>
Date: Thu, 09 Jun 2011 14:51:53 +0100
Message-ID: <1307627513.15712.158.camel@rex>
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
X-List-Received-Date: Thu, 09 Jun 2011 13:55:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-09 at 14:15 +0100, Richard Purdie wrote:
> On Thu, 2011-06-09 at 12:43 +0100, Phil Blundell wrote:
> > On Thu, 2011-06-09 at 12:29 +0100, Richard Purdie wrote:
> > > As you can see, eglibc do_package takes about 14 minutes which is about
> > > 14% of our build time. That is a long time to block pretty much all
> > > packaging activity, particularly if you have access to something with
> > > several cores. When it does complete, even on my 4 core system you see a
> > > "stampeding herd" of packaging happening on the build charts suggesting
> > > a backlog does build up.
> > 
> > Yeah, I can imagine that a backlog of packaging activity does build up.
> > The thing I'm not entirely clear on is whether this is actually causing
> > some threads to get starved of work (and hence the total build time to
> > be longer than it needs to be) or whether we're really just shifting
> > things around in the timeline without making much/any difference to the
> > overall build duration.
> 
> It will certainly be a net win on large core systems which I know of
> people running builds on as task starvation happens there. Last time I
> tested this on a 4 core I think we saw a couple of minutes improvement
> in build time so it appears beneficial there too.

Just as another data point, I'm running builds on my 4 core machine here
and it is scheduling many do_package tasks including long running ones
such as perl's in parallel with eglibc-locale's do_package task. It
would appear the bitbake scheduler believes there is benefit in
splitting these out at least.

Cheers,

Richard





