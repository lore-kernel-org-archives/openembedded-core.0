Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 3011F74F35
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 May 2018 00:57:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A1AC120BD7;
	Sun, 20 May 2018 00:57:44 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id dAxRkfZ_ZabF; Sun, 20 May 2018 00:57:44 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 77F8C20908;
	Sun, 20 May 2018 00:57:43 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id EA10E16347F; Sat, 19 May 2018 20:57:42 -0400 (EDT)
Date: Sat, 19 May 2018 20:57:42 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20180520005742.GN19965@denix.org>
References: <20180519162102.GL19965@denix.org>
	<CAMKF1srt3AbRBgdBZp2ya-VkWm1K6r8eywFbqr3nMFe7EqNuFw@mail.gmail.com>
	<20180519193341.GM19965@denix.org>
	<CAMKF1sqfpZhKJKjFoouGhpRbZEfJBqXJxmqunepAx2weVsQEnA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqfpZhKJKjFoouGhpRbZEfJBqXJxmqunepAx2weVsQEnA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: GCC 9 Drops Support For Older ARM Microarchitecture Versions
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
X-List-Received-Date: Sun, 20 May 2018 00:57:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, May 19, 2018 at 02:26:13PM -0700, Khem Raj wrote:
> On Sat, May 19, 2018 at 12:33 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > On Sat, May 19, 2018 at 11:07:55AM -0700, Khem Raj wrote:
> >> On Sat, May 19, 2018 at 9:21 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> >> > https://www.phoronix.com/scan.php?page=news_item&px=GCC-9-Dropping-Older-ARM
> >> >
> >> > Particularly, ARMv5 and ARMv5E are being dropped (but T and TE variants
> >> > remain)
> >> >
> >> > Are there any concerns from OE community perspective?
> >>
> >> From yocto project perspctive qemuarm which is emulating arm926ejs
> >> with default tune armv5te is used.
> >> so we are right at the trailing edge and wont be affected. However, I
> >> know there were OE users who had
> >> devices using other armv5 or v4 variants
> >>
> >> I have been suggesting to switch qemuarm to use armv7 based board
> >> emulator for few years now.
> >> may be this is the time to make that call for next YP release.
> >
> > Valid point about qemuarm, but see below.
> >
> >
> >> > At least for binutils we needed this patch even for armv5te:
> >> > http://cgit.openembedded.org/openembedded-core/tree/meta/recipes-devtools/binutils/binutils/0007-Add-the-armv5e-architecture-to-binutils.patch
> >> >
> >>
> >> this patch technically required to support one of OEs available tune
> >> values. namely armv5e, we should be able to drop it.
> >
> > $ grep conf/machine meta/conf/machine/qemuarm.conf
> > require conf/machine/include/qemu.inc
> > require conf/machine/include/tune-arm926ejs.inc
> > #require conf/machine/include/tune-arm1136jf-s.inc
> >
> > $ MACHINE=qemuarm bitbake virtual/kernel -e|grep -E '^DEFAULTTUNE=|^ARMPKGSFX_THUMB=|^TUNE_PKGARCH=|^TUNE_CCARGS='
> > ARMPKGSFX_THUMB=""
> > DEFAULTTUNE="armv5te"
> > TUNE_CCARGS=" -march=armv5e -marm"
> > TUNE_PKGARCH="armv5e"
> >
> >
> > I have already tried binutils w/o that patch for arm926ejs/armv5te machine and
> > it fails, because as you can see above, -march=armv5e is being passed...
> 
> What happens if you drop setting TUNE_CCARGS and  TUNE_PKGARCH ?

From OE-Core?

http://cgit.openembedded.org/openembedded-core/tree/meta/conf/machine/include/arm/arch-armv5.inc#n5
http://cgit.openembedded.org/openembedded-core/tree/meta/conf/machine/include/arm/arch-arm.inc#n11

From the README:
A small set of ARM specific variables have been defined to allow 
TUNE_PKGARCH to be automatically defined.  Optimized tunings must NOT 
change the definiton of TUNE_PKGARCH.  TUNE_PKGACH_tune-<tune> will be 
ignored.  The format of the package arch is enforced by the TUNE_PKGARCH
default.  The format must be of the form:
<armversion>[t][e][hf][b][-vfp][-neon]

