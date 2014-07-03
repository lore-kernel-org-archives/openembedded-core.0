Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8D831609B1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jul 2014 16:46:07 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s63Gjit0028054; Thu, 3 Jul 2014 17:45:44 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id T7w0ZqAlXORs; Thu,  3 Jul 2014 17:45:44 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s63GjdxB028045
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 3 Jul 2014 17:45:41 +0100
Message-ID: <1404405934.6362.89.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 03 Jul 2014 17:45:34 +0100
In-Reply-To: <20140623124437.GG2437@jama>
References: <1403177022-19086-1-git-send-email-Martin.Jansa@gmail.com>
	<3503275.YjDqJfgFMA@peggleto-mobl5.ger.corp.intel.com>
	<CAJTo0LbmBrwHOdYKdeaiKzHxpCdJ5XtxTUO5CnK7yi+Rm3nUyQ@mail.gmail.com>
	<20140623123922.GF2437@jama> <20140623124437.GG2437@jama>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] usbinit, weston-init, run-postinsts, qt-demo-init: Drop allarch
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
X-List-Received-Date: Thu, 03 Jul 2014 16:46:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-06-23 at 14:44 +0200, Martin Jansa wrote:
> On Mon, Jun 23, 2014 at 02:39:22PM +0200, Martin Jansa wrote:
> > On Mon, Jun 23, 2014 at 01:12:25PM +0100, Burton, Ross wrote:
> > > On 19 June 2014 14:54, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> > > >> * update-rc.d.bbclass now adds dependency on TUNE_PKGARCH initscripts, so
> > > >> these cannot be allarch
> > > >
> > > > As I've said before, I really dislike this change. The system should be made
> > > > to handle the situation properly instead of working around the issue.
> > > 
> > > Isn't this what the abi exclude thingy is for?
> > 
> > Do we want to maintain list of all recipes which inherit update-rc.c in
> > layer.conf?
> > 
> > That's what I did in one of our layers and the list is rather long.
> 
> Ah sorry for possible confusion, I had to list *all* of them because we
> have MACHINE_ARCH initscripts.
> 
> To fix current issues in oe-core we only need to list all recipes which
> inherit allarch *and* update-rc.d (unless we want to exclude it
> everywhere just for consistency).
> 
> > abi exclude thingy
> 
> is a bit dangerous, I still sometimes see issues when something is
> supposed to be abisafe and in some cases it isn't and I need to manually
> bump PR in the recipe which wasn't rebuilt.
> 
> So I'm trying to use SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS only in cases where
> it's really safe or when the dependent recipe takes forever to build (so
> I wan't to build it just once or once per TUNE_PKGARCH). For simple and
> quickly built recipe I really don't mind "building" them multiple times
> if it prevents "rebuilding" them every single time I change MACHINE.

Can't we just add "initscripts" to the list there. There shouldn't be a
need to rebuild initscripts any time something depending on it changes,
it should have a safe ABI in that sense?

Cheers,

Richard




