Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 778B865CA8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jul 2014 13:18:54 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6SDIZ1A019053; Mon, 28 Jul 2014 14:18:35 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id CzJO7t2q4Ynt; Mon, 28 Jul 2014 14:18:34 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6SDIUiU018805
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 28 Jul 2014 14:18:31 +0100
Message-ID: <1406553510.13346.17.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 28 Jul 2014 14:18:30 +0100
In-Reply-To: <20140724152218.GM2492@jama>
References: <1406209379-1662-1-git-send-email-Martin.Jansa@gmail.com>
	<1406209379-1662-2-git-send-email-Martin.Jansa@gmail.com>
	<CAJTo0La2AZo=nxBJGnkQrC+=jB9hoO+tsYyuCMbfAT0vwwd-qg@mail.gmail.com>
	<20140724152218.GM2492@jama>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] recipes: add x11 to required DISTRO_FEATURES
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
X-List-Received-Date: Mon, 28 Jul 2014 13:18:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-07-24 at 17:22 +0200, Martin Jansa wrote:
> On Thu, Jul 24, 2014 at 02:52:45PM +0100, Burton, Ross wrote:
> > On 24 July 2014 14:42, Martin Jansa <martin.jansa@gmail.com> wrote:
> > > +REQUIRED_DISTRO_FEATURES = "x11"
> > 
> > Now I'm wondering why this is the solution.
> > 
> > If you attempt to build e.g. gnome-desktop explicitly without the x11
> > distro feature you understandably get an error message, because
> > gnome-desktop depends on libx11 which sanity checks the distro
> > features.  This seems correct.
> > 
> > Presumably you're problem is that you're running world builds and
> > they're producing errors on gnome-desktop because they can't satisfy a
> > dependency on libx11.  It seems that bubbling up the
> > REQUIRED_DISTRO_FEATURES tests isn't the right thing to do here - why
> > can't SkipPackage be handled specially, so if you do bitbake -k world
> > and libx11 emits SkipPackage, anything that has unsatisfiable
> > dependencies because of this is also skipped?
> 
> We discussed this many months ago and IIRC the conclusion was that user
> should explicitly say that he wants to skip the recipes which depend on
> something skipped (so that he is aware of what he is missing).
> 
> At that time there wasn't REQUIRED_DISTRO_FEATURES support, so I've
> created huge list of PNBLACKLISTs to blacklist everything not available
> in our setup - so I can do world builds without ERRORs at the beginning.
> 
> REQUIRED_DISTRO_FEATURES seems to me like reasonable compromise, that's
> why I've sent this patchset to replace small part of my huge blacklist.
> 
> This is the list:
> https://github.com/openwebos/meta-webos/blob/master/conf/distro/include/webos-recipe-blacklist-world.inc
> 
> If someone has time to improve SkipPackage and we really want to skip
> all depending packages, I would be glad to test such patch (because it
> allows to easily drop all those blacklists for "depends-on-broken"
> components)

The question here is whether we want a system which calculates what it
thinks is right or that we declare it.

The risk is that if SkipPackage (now known as SkipRecipe) were to
automatically "spread", you could in theory break the toolchain, have
nothing buildable and "bitbake world" would return success.

Effectively the -k option to bitbake already does the SkipPackage
"spread" idea since bitbake just removes dependencies until it works. If
does that in a fairly verbose way but it does so deliberately so you can
see what is going on.

The alternative is to declare what a given recipe supports and then we
can know whether it should be skipped or not under a given circumstance.

Personally, I'm leaning towards a more declarative approach where we
specify what should and shouldn't be expected to work. I'm open to
discussion on it though...

Cheers,

Richard





