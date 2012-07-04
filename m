Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Paul.Gortmaker@windriver.com>) id 1SmREW-0006Ih-OQ
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 17:11:13 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q64F07jq013294
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 4 Jul 2012 08:00:07 -0700 (PDT)
Received: from yow-pgortmak-d1 (128.224.146.65) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 4 Jul 2012 08:00:06 -0700
Received: from paul by yow-pgortmak-d1 with local (Exim 4.74)	(envelope-from
	<paul.gortmaker@windriver.com>)	id 1SmR3l-0000cg-Gh; Wed, 04 Jul 2012
	11:00:05 -0400
Date: Wed, 4 Jul 2012 11:00:05 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20120704150005.GD1817@windriver.com>
References: <4FF0C930.4000104@linux.intel.com>
	<1341207885-9463-1-git-send-email-paul.gortmaker@windriver.com>
	<4FF33085.1070703@linux.intel.com>
	<20120704141259.GA1817@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20120704141259.GA1817@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv2 0/3] u-boot recipe updates
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
X-List-Received-Date: Wed, 04 Jul 2012 15:11:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

[Re: [PATCHv2 0/3] u-boot recipe updates] On 04/07/2012 (Wed 10:12) Paul Gortmaker wrote:

> [Re: [PATCHv2 0/3] u-boot recipe updates] On 03/07/2012 (Tue 10:48) Saul Wold wrote:
> 
> > On 07/01/2012 10:44 PM, Paul Gortmaker wrote:
> > >These are the oe-core updates required so that yocto can do
> > >a successful build of a working u-boot image for the mpc8315
> > >reference BSP.
> > >
> > >In v2, I've fixed up the issue where TARGET_PREFIX accidentally became
> > >specific to the one single recipe.  That made the 3/3 patch in v1 no
> > >longer required.  However, when build testing, I noticed that we
> > >were needlessly clobbering PARALLEL_MAKE for u-boot, which is not
> > >at all required, and just slows down builds.  So a new patch is
> > >added to fix that, and we still have three total.
> > >
> > >I've built for the beagleboard with -j8 (twice), and the same for
> > >the 8315 BSP.  I've also always built u-boot with -j10 or greater
> > >for countless powerpc images I've made in the last 1/2 dozen years.
> > >Looking at the git history, it appears this just came in with some
> > >large import, versus being an actively chosen individual setting.
> > >
> > >The 8315 specific patch that was sent to the yocto list earlier to
> > >enable building it (u-boot.bin) by default is unchanged, but I can
> > >resend that if it helps somehow.
> > >
> > >Paul.
> > >---
> > >
> > >Paul Gortmaker (3):
> > >   u-boot: Don't make the -Os removal part of global settings.
> > >   u-boot: make FILESDIR a shared setting.
> > >   u-boot: do not clobber PARALLEL_MAKE setting
> > >
> > Took in patches 1 & 3 into OE-Core
> 
> Thanks!
> 
> > 
> > Looking for an update for FILESDIR -> FILESPATH as suggested by Richard.
> 
> I've not seen Richard's feedback, since I'm OOO, and with the To/Cc:
> stripped, it has got archived vs. staying in my inbox.  [They get
> archived, because just like LKML, I'm not going to pretend I can read
> all poky/oe mail on the very day it arrives.]

I've found Richard's comments [looking in OE archive and not poky
helped] and will test what he proposed to replace FILESDIR.  But I still
think it extremely worthwhile if some fine tuning to the mailing list(s)
can be done to address what I mentioned below.

Thanks,
Paul.
--

> 
> On a related note, is it possible to fix the mailing list so that it
> does not strip To/Cc information and Message-ID strings?  [I'd have to
> check -- maybe it is (also) inserting a needless Reply-To: header that
> messes things up.]
> 
> Further, without a proper Message-ID, it breaks patchworks, so Richard's
> comments should be here:
> 
> http://patchwork.openembedded.org/patch/30879/
> 
> but unfortunately they are not.  The netdev and ppc dev lists for linux
> use patchworks and have the follow-up review comments captured and it is
> really quite useful to all (esp. the person who has to triage and
> decruftify patchworks content/state once a month...)
> 
> Finally, I can't even find it in the June/July archives:
> 
> https://lists.yoctoproject.org/pipermail/poky/2012-July/subject.html
> 
> Just thought it worth a mention, in case it hasn't been mentioned
> before.  Fixing these little quirks would lower the barrier to entry
> and the frustration factor for new contributors.  If I can help out
> somehow with testing a fix, let me know.
> 
> Thanks,
> Paul.
> --
> 
> > 
> > Thanks
> > 	Sau!
> > 
> > 
> > >  meta/recipes-bsp/u-boot/u-boot.inc           |    6 ++----
> > >  meta/recipes-bsp/u-boot/u-boot_2011.03.bb    |    2 --
> > >  meta/recipes-bsp/u-boot/u-boot_2011.06.bb    |    2 --
> > >  meta/recipes-bsp/u-boot/u-boot_2012.04.01.bb |    2 --
> > >  4 files changed, 2 insertions(+), 10 deletions(-)
> > >


