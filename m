Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 056E06BA9D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 15:31:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47CBYH071Bz4c;
	Tue, 12 Nov 2019 16:31:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1573572693;
	bh=PTgtbN8DVVKRoQiRuGz3/0n/WUecxQ4dkLH+2YtkTGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nt85jWQ78QcyHsZ25h1+naKw/Uc7Gwx1zidwLqrSy7fsbrL5THx63y38DRmGsZYsI
	/sU3HMUTGJKh815vDLpeiT8r0AXpWStWZNTMQO8Ue+tLd9PLIgTyerfolYJt+PmBP0
	MzB04+i94wvBgO6wqVreKp3BVnvfTbFw5iEBm40QPsp1go6KkDym5iMy72CQKxndur
	oTkS++m+jxI5R/1hnoJ6G1eurPS3wFlCovRNyxrmK+N0HfPFi+ko61s3nTvft4YS2F
	bkZdO8/+mx6kVEA2iEdaa2+ctoHZrI/Y9EFmkhVw6xcJPDeE90FfdIyjTmM/jnby5n
	OX/xeXYrAWpZDmsh6HPixj4jeyxr0GSr6ZzJH0YsjDobQDkabwohfgaNcrDq74evoH
	30tijOpM/XjrJaf/puC8+k1u/A8uYIQo01r6SCDHs9xQcB7bZn45JttctLOsp8I6A1
	4f/MY3lChOadTgmtOdWJdbiWAvPEna5VMlPWJv1+KuLw64ECFCJ3JZ5DWi/8Ud691d
	GAAgVfCdgbAfCrHT3zTNAG23N1V5mY0Du/T4KzEv8kXhDo4rLP7L/xkMSr7T5EeGd8
	pqat+7AAamDdBQoc8dhdY5GD02htOmFdM9ED3F65GOv9VkF3uxbqGGmzTPA49Gv6yI
	UDfvJjpbz+rzbfRKoOkO8ZF8=
Date: Tue, 12 Nov 2019 17:31:29 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20191112153129.GB14540@localhost>
References: <20191104224805.3149-1-alistair.francis@wdc.com>
	<fd81b5bc-cb84-8857-ea5e-bce2c931750b@intel.com>
	<CAMKF1srMzPL4pBAQYscX6fxPPL2SExcYFw+Ti2B656nK3hyH0g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srMzPL4pBAQYscX6fxPPL2SExcYFw+Ti2B656nK3hyH0g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v6] mesa: Upgrade to 19.2.1
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
X-List-Received-Date: Tue, 12 Nov 2019 15:31:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Nov 08, 2019 at 10:13:07AM -0800, Khem Raj wrote:
> On Fri, Nov 8, 2019 at 2:32 AM Ross Burton <ross.burton@intel.com> wrote:
> > On 04/11/2019 22:48, Alistair Francis wrote:
> > > From: Alistair Francis <alistair@alistair23.me>
> > >
> > > Upgrade mesa and mesa-gl to 19.2.1.
> > >
> > > The license hash change was a trivial new line removal.
> > >
> > > The glx-tls option was removed as it isn't included in the meson.build
> > > file. It has been replaced with 'use-elf-tls' instead.
> >
> > I think this has regressed something, this is a new warning on musl builds:
> >
> > do_package_qa: QA Issue: ELF binary
> > '[...]libgles2-mesa/usr/lib/libGLESv2.so.2.0.0' has relocations in .text
> > [textrel]
> >
> > (ditto for libGLESv1_CM.so.1.1.0 libGL.so.1.2.0 libglapi.so.0.0.0)
> 
> right this means glx-tls is not working anymore, and it will fail on
> musl at runtime
> see
> https://gitlab.freedesktop.org/mesa/mesa/issues/966

glx-tls is already PACKAGECONFIG_remove_libc-musl.

That this is no longer sufficient is the regression Ross mentioned.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


