Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 471F37CE6C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 05:21:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44PJDY37y5z6m;
	Wed, 20 Mar 2019 06:21:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1553059278;
	bh=I0oOS0rTHk1A0rm2/tT1Z9DZ5IgiJnDcQowcSNE9nB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YQUx9Ml9a2Rsc3d8+9EFLwco5frH1UcKSh7f9uWweTZ39SSn6l443VvK0wvqFZduy
	/5KQR2WZieCJoQfM3WB0iEOhMkRL2p/gYZVUNyycWtpbdwxG0feNo9p/ay1jXMBHC6
	cya9TUFvwsmZXKeKB+EUJRU3wrTUivsa3ErcOGUd8k/E163PwlMNCkcZ1zVjxVAeu3
	QpGLtz8IK4xJS8gUsm9ATDjPfZCEAYSjhtydy+0KM+N8aC5wUdCAKMKoawL0pxdLdN
	wa9XVe+DN8n/YQwSJPYAeuuimWa+X5dr5iCVRPPII/v/4QkzFnVLhRBOWwVhR7fi2J
	bwQOrgUqHktEHtioKz55mp7SzfqPYqOCd1ady1OGQpCwG6UenrK55K0xqfS8aJFy4u
	gQrAm9Y8SzOX/Qq1FUBueMAkXQevC2fms4dcOkNhR5Tk2VpQVYUvYvAuW3VjfjEXFm
	khDXgSC1P3TsAoVNf3juGuX66TMZB8OyO6DUjtQ/00VMpdv6wDIaVp5oJVMjzWWFbO
	qv6aPLhtXO5dzN5N6Rb403BAzvqDAs4xaR6sDde6ozI4IO6zH1WJTHidfXai5fSYK7
	+v88NOI62+oQ00xiCx9Bz+1pO36zmZgvEFWj1RoAP6575+fe0b1vIe5DVzJxATCpSq
	ZMlTpVkE0BjDU5KNwL5anBeM=
Date: Wed, 20 Mar 2019 07:21:15 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190320052115.GA25499@localhost>
References: <1552383718-62708-1-git-send-email-changqing.li@windriver.com>
	<20190315104552.GB14180@localhost>
	<CAMKF1spft7gbJ983GtbyVtjXO5hECMuTqg6TM1bV2ozu0Np_CQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spft7gbJ983GtbyVtjXO5hECMuTqg6TM1bV2ozu0Np_CQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 20 Mar 2019 05:21:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Mar 19, 2019 at 11:51:47PM -0400, Khem Raj wrote:
> On Fri, Mar 15, 2019 at 6:45 AM Adrian Bunk <bunk@stusta.de> wrote:
> >
> > On Tue, Mar 12, 2019 at 05:41:58PM +0800, changqing.li@windriver.com wrote:
> > > From: Changqing Li <changqing.li@windriver.com>
> > >
> > > while compiled with -Werror=maybe-uninitialized/-Werror=format-overflow=,
> > > it failed
> > >
> > > [snip]
> > > | Incremental.c: In function 'Incremental_container':
> > > | Incremental.c:1593:3: error: 'mdfd' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> > > | close(mdfd);
> > > | ^~~~~~~~~~~
> > >
> > > [snip]
> > > super-intel.c: In function 'apply_takeover_update':
> > > | super-intel.c:9615:15: error: '%d' directive writing between 1 and 11 bytes into a region of size 7 [-Werror=format-overflow=]
> > > | " MISSING_%d", du->index);
> > > | ^~
> > >...
> >
> > I am seeing these warnings only with -Og, are you also seeing them with
> > -Og (DEBUG_OPTIMIZATION) only?
> >
> > If this is true, I would consider
> > https://sources.debian.org/src/mdadm/4.1-2/debian/patches/debian-no-Werror.diff/
> > a better workaround.
> >
> This seems a broader brush, I really dont like to relegate Werror if
> we dont have to, because it will force us
> to fix the code.

How are we getting such fixes properly reviewed?

What actually happens is that the easiest change that silences a warning 
gets applied.

And for such bogus -Og only warnings there was no problem in the code,
meaning regression risks by OE/Yocto-only patches without fixing anything.

> However, I am seeing it fail with clang now
> 
> https://errors.yoctoproject.org/Errors/Details/233618/

This is caused by the "fix" for the -Og gcc warning.

Which looks bogus, and might be harmful.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


