Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SMxYo-0002V0-99 for openembedded-core@lists.openembedded.org;
	Wed, 25 Apr 2012 10:26:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3P8HEbo023087
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2012 09:17:14 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22601-03 for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2012 09:17:10 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q3P8H3sB023081
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Apr 2012 09:17:05 +0100
Message-ID: <1335341824.21409.55.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 25 Apr 2012 09:17:04 +0100
In-Reply-To: <CAPhnLPDfjVWLKSDTwiZDCBNpHE7CKXuWfzTMccAuq-ruPtsW9w@mail.gmail.com>
References: <CAK18fxFXyj7U1RgBSigrED+H6BjJjx3uCcWY2nVONCOULxL+iw@mail.gmail.com>
	<CAPhnLPDr2epHUeCjDaeg473mv8cR9jf6gA-BpxT=jU_BDcq3sg@mail.gmail.com>
	<CAK18fxG0_-aQDuPMA5drMAA8Kk-bnAPw-THrxafAOM6amvE2hA@mail.gmail.com>
	<CAPhnLPCWAKLiLUfKVaguN_cFA=PAgRhW4vZ-pa1XDtW=Wugvpg@mail.gmail.com>
	<CABcZANnyFDurr+B6nW5nJz+3kq2RXp4403Eqhcahkt53ififeA@mail.gmail.com>
	<CAPhnLPDfjVWLKSDTwiZDCBNpHE7CKXuWfzTMccAuq-ruPtsW9w@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: LICENSE_{X}-xxx is parsed?
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
X-List-Received-Date: Wed, 25 Apr 2012 08:26:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-04-24 at 16:13 -0700, Flanagan, Elizabeth wrote:
> On Tue, Apr 24, 2012 at 3:53 PM, Chris Larson <clarson@kergoth.com> wrote:
> > On Tue, Apr 24, 2012 at 3:38 PM, Flanagan, Elizabeth
> > <elizabeth.flanagan@intel.com> wrote:
> >> The rest of the packages in the bb should be inheriting LICENSE if no
> >> PN level license is set. Which obviously causes problems for the above
> >> example.
> >>
> >> In a case like above you'd want to do either of the following:
> >>
> >> a. Call out each package's license individually (better but can be
> >> painful for recipes with lots of packages)
> >> b. Leave GPLv3 out of LICENSE (easier but not technically accurate) so
> >> undefined package level licensing inherits the correct LICENSE.
> >
> > I wonder if a partially specified set of individual package settings
> > should be identified by some sanity check (an explicit, rather than
> > implicit, one, like recipe_sanity) as a potential bug / source of
> > confusion.
> 
> It's something I've been thinking heavily about how over the past few
> month. How to implement full package level license support without
> requiring too many recipe changes. The current setup licensing moves
> us in the right direction, without having to do too many recipe
> changes, but there are some inadequacies in it and we may have to
> address them sooner or later.

I like the idea that LICENSE is the default and is used where no other
LICENSE is set. If our LICENSE field building code is clever enough to
be able to find any LICENSE_xxx variables that are set now, we could
just define LICENSE to be the default LICENSE unless something else is
set. It would then be up to the license handling code to create the xxx
& xxx expressions where needed.

This keeps things simpler for the recipes but still gets us where we
need to be. I don't think forcing users to set LICENSE for every
subpackage will be particularly useful, nor is having the top LICENSE
field being a complete summary when we could calculate that.

> > I suspect most of the time it should be one or the other,
> > either no individual package LICENSEs are defined, or they all should
> > be.
> 
> I would tend to agree. One thing I think we may want to start
> considering (even if it does make me cringe a bit) is that if we go
> this route, we may want to support LIC_SRC_URI_${PN} as well. It means
> quite a few recipe changes, but it yet another step in more accurate
> license auditing.

Please, no ;-). Do something like the SRC_URI checksums (name the urls,
then apply extra information to them, or use parameters in the urls.

Cheers,

Richard



