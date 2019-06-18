Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 9E2BF7C786
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2019 01:30:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C707340BBA;
	Tue, 18 Jun 2019 01:30:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id fhqxSvEFP4Lp; Tue, 18 Jun 2019 01:30:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2A8E740B86;
	Tue, 18 Jun 2019 01:30:49 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id E0FEE1703A7; Mon, 17 Jun 2019 21:30:48 -0400 (EDT)
Date: Mon, 17 Jun 2019 21:30:48 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190618013048.GP2112@denix.org>
References: <1560289312-19244-1-git-send-email-denis@denix.org>
	<20190612053326.GA12642@localhost>
	<20190612222338.GN2112@denix.org>
	<c068fa5192d65f2ffab2b1037bcf5f709b719862.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <c068fa5192d65f2ffab2b1037bcf5f709b719862.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org, Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH] mtd-utils: upgrade 2.0.2 -> 2.1.0
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
X-List-Received-Date: Tue, 18 Jun 2019 01:30:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 12, 2019 at 11:26:06PM +0100, Richard Purdie wrote:
> On Wed, 2019-06-12 at 18:23 -0400, Denys Dmytriyenko wrote:
> > On Wed, Jun 12, 2019 at 08:33:26AM +0300, Adrian Bunk wrote:
> > > On Tue, Jun 11, 2019 at 05:41:52PM -0400, Denys Dmytriyenko wrote:
> > > > ...
> > > > * Now requires openssl:
> > > > > In file included from ../git/ubifs-
> > > > > utils/mkfs.ubifs/mkfs.ubifs.c:25:
> > > > > ../git/ubifs-utils/mkfs.ubifs/mkfs.ubifs.h:49:10: fatal error:
> > > > > openssl/rand.h: No such file or directory
> > > > >  #include <openssl/rand.h>
> > > > >           ^~~~~~~~~~~~~~~~
> > > > > compilation terminated.
> > > > > Makefile:3457: recipe for target 'ubifs-
> > > > > utils/mkfs.ubifs/mkfs_ubifs-mkfs.ubifs.o' failed
> > > > > make: *** [ubifs-utils/mkfs.ubifs/mkfs_ubifs-mkfs.ubifs.o]
> > > > > Error 1
> > > > ...
> > > > -DEPENDS = "zlib e2fsprogs util-linux"
> > > > +DEPENDS = "zlib e2fsprogs util-linux openssl"
> > > 
> > > It doesn't (and should not) require it unconditionally.
> > > 
> > > Please backport "mkfs.ubifs: fix build without openssl" from
> > > upstream git instead.
> > > 
> > > > ...
> > > > -PV = "2.0.2+${SRCPV}"
> > > > +PV = "2.1.0+${SRCPV}"
> > > > ...
> > > 
> > > This was already wrong before but now is an opportunity to fix:
> > > Since this is exactly the release, it should be
> > >   PV = "2.1.0"
> > 
> > So, which is it? Do you want it to be exactly the release, or do you
> > want to start backporting fixes from after the release? It doesn't
> > seem to be a critical issue to warrant backporting, in my opinion.
> 
> openssl is not a light dependency and is one I'd prefer not to be
> adding unless we really need it. Things like this may look/sound
> trivial but they inflate build times, image sizes and build complexity.
> 
> I'd probably prefer to have the 2.1.0 with a backported patch in this
> case if you're after an opinion :)

Luckily, the fix for this was right in the next commit after the release, so I 
opted to bump SRCREV by one, instead of carrying a local patch. Just sent v2.

-- 
Denys

