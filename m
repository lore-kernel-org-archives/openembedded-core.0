Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 218316E5FB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Jan 2017 08:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v058p7WG027675; Thu, 5 Jan 2017 08:51:07 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 39zHH096jLRa; Thu,  5 Jan 2017 08:51:07 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v058p5nE027671
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 5 Jan 2017 08:51:06 GMT
Message-ID: <1483606265.4367.75.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Ohly <patrick.ohly@intel.com>, "Burton, Ross"
	<ross.burton@intel.com>
Date: Thu, 05 Jan 2017 08:51:05 +0000
In-Reply-To: <1483601563.28169.69.camel@intel.com>
References: <cover.1483570577.git.chris_larson@mentor.com>
	<CAJTo0LYepu3mAAc=Y76RxBW20w1gEVH1+ms7gpfmSTB-ePfrcQ@mail.gmail.com>
	<1483601563.28169.69.camel@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] Add opengl to REQUIRED_DISTRO_FEATURES for some recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Jan 2017 08:51:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2017-01-05 at 08:32 +0100, Patrick Ohly wrote:
> On Wed, 2017-01-04 at 23:49 +0000, Burton, Ross wrote:
> > 
> > 
> > On 4 January 2017 at 22:57, Christopher Larson <kergoth@gmail.com>
> > wrote:
> >         These aren't buildable without it, and adding it fixes oe-
> > core
> >         world builds
> >         with nodistro (which does not have the opengl feature by
> >         default).
> >         
> > 
> > Am I still the only person who thinks skipping of recipes should be
> > recursive, so if say libx11 throws a SkipRecipe then everything
> > else
> > that depends on it is also magically skipped?
> Not at all, I'd also prefer that. If recipe "foo" has some obscure
> conditions when it can be built, then repeating those conditions in
> any
> recipe depending on "foo" is a maintenance headache.
> 
> Last time I brought this up, it was mentioned as advantage of the
> current approach that conditions are explicit and thus less
> surprising.
> There's some truth to that, but I don't believe that it outweighs the
> disadvantages.

Imagine for example that we accidentally add some condition which
results in 50% of the recipes being skipped. "bitbake world" would pass
if this auto-skipping functionality was implemented. I worry that it
would make it really easy to hide some subset of completely a non-
buildable recipes which we can't even easily identify other than
directly trying to build each target. We added something to avoid that
(the world target).

The second problem is the actual implementation of it. I've never come
up with a sane way to address this problem and give errors where people
would want them yet hide the cases where people really don't want to be
bothered, its very hard to make it work well at the bitbake level and
the code is already complex/fragile enough.

Considering this, marking things up explicitly has always seemed like
the right thing to do ever time I've looked further into this. If
someone has the time and wants to propose a solution, sure, but I think
there are other more important/pressing things to do.

Cheers,

Richard

