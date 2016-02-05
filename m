Return-Path: <mac@mcrowe.com>
Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
	by mail.openembedded.org (Postfix) with ESMTP id D1BE1771FC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 17:32:58 +0000 (UTC)
Received: from deneb ([80.229.24.9]) by avasout06 with smtp
	id EhYw1s0070BmcFC01hYxiG; Fri, 05 Feb 2016 17:32:58 +0000
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.1 cv=Rr04V3SK c=1 sm=1 tr=0
	a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
	a=L9H7d07YOLsA:10 a=9cW_t1CCXrUA:10 a=s5jvgZ67dGcA:10 a=kj9zAlcOel0A:10
	a=jFJIQSaiL_oA:10 a=5i4OYfP2o5spmVWWHpwA:9 a=CjuIK1q_8ugA:10
Received: from mac by deneb with local (Exim 4.84)
	(envelope-from <mac@mcrowe.com>)
	id 1aRkFc-00021H-IZ; Fri, 05 Feb 2016 17:32:56 +0000
Date: Fri, 5 Feb 2016 17:32:56 +0000
From: Mike Crowe <mac@mcrowe.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160205173256.GA7728@mcrowe.com>
References: <1454424587-4251-1-git-send-email-mac@mcrowe.com>
	<1454428874.27087.87.camel@linuxfoundation.org>
	<20160202210411.GA20640@mcrowe.com>
	<1454452885.27087.127.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1454452885.27087.127.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] Remove unhelpful default value of EXTRA_OEMAKE
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
X-List-Received-Date: Fri, 05 Feb 2016 17:33:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, 2016-02-02 at 14:49 +0000, Mike Crowe wrote:
> > > > [snip] Set EXTRA_OEMAKE = "" in bitbake.conf

On Tuesday 02 February 2016 at 16:01:14 +0000, Richard Purdie wrote:
> > > Which architectures did you test? Often, x86 is a bad choice here and
> > > we'd need something cross (arm/mips/ppc) to ensure it really is doing
> > > the right things. We also need to assess a bit more than just sato.
> > > We can run this up on the autobuilder and see what happens.

On Tue, 2016-02-02 at 21:04 +0000, Mike Crowe wrote:
> > I've compile-tested qemux86 and qemuarm for core-image-sato. qemumips
> > is building now.

Since then I've collected enough patches to make "bitbake world" build
successfully for qemux86, qemuarm, qemuppc and qemumips. qemux86-64 is
building now. The recipes that needed fixing to explicitly set
EXTRA_OEMAKE = "-e MAKEFLAGS=" were:

  meta/recipes-bsp/apmd/apmd_3.2.2-15.bb
  meta/recipes-bsp/libacpi/libacpi_0.2.bb
  meta/recipes-bsp/pciutils/pciutils_3.4.1.bb
  meta/recipes-connectivity/openssl/openssl.inc
  meta/recipes-devtools/dmidecode/dmidecode_3.0.bb
  meta/recipes-devtools/fdisk/gptfdisk_1.0.1.bb
  meta/recipes-devtools/perl/perl-native_5.22.1.bb
  meta/recipes-devtools/perl/perl_5.22.1.bb
  meta/recipes-extended/ed/ed_1.9.bb
  meta/recipes-extended/iputils/iputils_s20151218.bb
  meta/recipes-extended/pigz/pigz.inc
  meta/recipes-extended/stat/stat_3.3.bb
  meta/recipes-extended/sysklogd/sysklogd.inc
  meta/recipes-extended/unzip/unzip_6.0.bb
  meta/recipes-gnome/gtk-theme-torturer/gtk-theme-torturer_git.bb
  meta/recipes-support/ptest-runner/ptest-runner_2.0.bb

I will submit patches for these shortly.

> > We've been running with the previous version of the patch with our code
> > for a while but now I look more closely that solution didn't have
> > anywhere near as wide an impact so I'll switch us over to using these
> > patches. That will runtime-test a few real mips and arm targets (and
> > even x86 and x86-64 to a limited extent) but only with our customised
> > set of packages.

On Tuesday 02 February 2016 at 22:41:25 +0000, Richard Purdie wrote:
> Thanks. Please do mention what tests have passed/failed just so I can
> build some idea of the risk of the patch and decide if/as/when the
> right time to merge it is.

I've not yet done any more runtime tests. I hope to get the change into our
tree tonight so everything gets rebuilt with it over the weekend and I can
test next week.

> > > A post to the architecture list is probably needed so everyone knows
> > > this is happening (or at least being considered).

I hope to send such a post later today.

Mike.

