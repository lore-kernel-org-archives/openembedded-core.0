Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 583F96C1BD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 15:00:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44PY4k5QcDz5c;
	Wed, 20 Mar 2019 16:00:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1553094023;
	bh=vyFrb68FwHBSRSSjCsywwPeVwQXWCMMIYUUy4/5vUQk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R0QNxKVFSwIUjKJnQyISq8D1dBsi9CjNYPr2Y6w2cZg7tcd6umVqhvSC0k/BSTVxh
	jZjWVgpL4yYOGqobK2masu+T25SiBrw257BOTj1+OguCGMRUp14L5PgIrW7wno5o/D
	wjdUTcNcyRZfCuJmWUZeHIlYKj17Ebns0yUyIgvtAXm9/1olNswmgvRJkxoZgZw/TT
	EBw32mSxDPfsQMdQMeMQ4ICz16glV3TlifKJxODFhB5QEiKSDHALVFKWwz0fTe3oAH
	7YcLoAapZkyV6mRnHPdbQUDreHDilosO/JmalcTZD/Z2MBpx/HE2JW3udHSJlxth2L
	of6OiKoT5CXaIvgbrTRr4p9/NG/8JWkuUweh4LBixNqzJDozUMyDxVQmdmEQaHoNiW
	6t4APfW7b+yC25SefktFsBlE/IC6gpjaR/LjC5yk6rHRacn0/5esGD3tyYohcOKg65
	V5AwHLAhnBJr67yXWlTFFv2bgvQtCfmm+wkLbjsdedZ8/nFMK/l/hqe+DBh1CaEuvp
	VRZ2sulWej2bGow1YmPL8lB4l6fgX1ufCnKDsDPJ34ZykkL7lbdxnyE+8URzlhWKdk
	LiIeVqoB5Vm763+BwI1RJGShBauXzhkaYHflI6utQye5YMMsGc0q5fI1HfYfxRyOs6
	5I7YMRBk+WEJiIeKzkCNLTIk=
Date: Wed, 20 Mar 2019 17:00:21 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190320150021.GB31018@localhost>
References: <1552383718-62708-1-git-send-email-changqing.li@windriver.com>
	<20190315104552.GB14180@localhost>
	<CAMKF1spft7gbJ983GtbyVtjXO5hECMuTqg6TM1bV2ozu0Np_CQ@mail.gmail.com>
	<20190320052115.GA25499@localhost>
	<CAMKF1soQbssBdHEgmdGmeNFPWWQH+FdRbdzBuPDo_TOdnY0oRA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1soQbssBdHEgmdGmeNFPWWQH+FdRbdzBuPDo_TOdnY0oRA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mdadm: fix gcc8 maybe-uninitialized/format-overflow warning
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
X-List-Received-Date: Wed, 20 Mar 2019 15:00:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Mar 20, 2019 at 08:59:39AM -0400, Khem Raj wrote:
> On Wed, Mar 20, 2019 at 1:21 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Tue, Mar 19, 2019 at 11:51:47PM -0400, Khem Raj wrote:
> > > On Fri, Mar 15, 2019 at 6:45 AM Adrian Bunk <bunk@stusta.de> wrote:
> > > >
> > > > On Tue, Mar 12, 2019 at 05:41:58PM +0800, changqing.li@windriver.com wrote:
> > > > > From: Changqing Li <changqing.li@windriver.com>
> > > > >
> > > > > while compiled with -Werror=maybe-uninitialized/-Werror=format-overflow=,
> > > > > it failed
> > > > >
> > > > > [snip]
> > > > > | Incremental.c: In function 'Incremental_container':
> > > > > | Incremental.c:1593:3: error: 'mdfd' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> > > > > | close(mdfd);
> > > > > | ^~~~~~~~~~~
> > > > >
> > > > > [snip]
> > > > > super-intel.c: In function 'apply_takeover_update':
> > > > > | super-intel.c:9615:15: error: '%d' directive writing between 1 and 11 bytes into a region of size 7 [-Werror=format-overflow=]
> > > > > | " MISSING_%d", du->index);
> > > > > | ^~
> > > > >...
> > > >
> > > > I am seeing these warnings only with -Og, are you also seeing them with
> > > > -Og (DEBUG_OPTIMIZATION) only?
> > > >
> > > > If this is true, I would consider
> > > > https://sources.debian.org/src/mdadm/4.1-2/debian/patches/debian-no-Werror.diff/
> > > > a better workaround.
> > > >
> > > This seems a broader brush, I really dont like to relegate Werror if
> > > we dont have to, because it will force us
> > > to fix the code.
> >
> > How are we getting such fixes properly reviewed?
> >
> > What actually happens is that the easiest change that silences a warning
> > gets applied.
> >
> > And for such bogus -Og only warnings there was no problem in the code,
> 
> so then probably a better fix is to add -Wno-error to DEBUG_FLAGS
> which will limit it to -Og case, and revert the original fix.

For mdadm this might work, for puzzles it would not.

Order matters, and upstream can insert your flags before or after
the -Werror. So unfortunately this would not cover all recipes.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


