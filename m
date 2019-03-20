Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 8DE087CCC0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 13:00:05 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id k2so2345814qtm.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 06:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TgLl5tjLNh1SP0Q0q1OyQMvDICBpc6lHS7pvJhF4qKQ=;
	b=qSTzsBZ5b8I7Smp+XEkq90jKpjTyXs4geIz+r/FGaCOkIGuVSOywd8i3mzptizPWIZ
	5QJwCt/JTwmV97SUddluh+TZhSe559EkuhHPTvuVbVFD9gu145M5CpXGDJO6HZZ2fdpt
	x3l+cxuGq+Z9H0CNjddH7IBwAWtO8wxDntpqdfqP9XiCn4uMpWw7ywHvkLwSeh3BjrY+
	hKCHNVAwxh1j/aU8arM2vOzUpl5ezL5pYJFAcY5YV4ssSxss7RoyPKQZPTZqHq3ttMGS
	ABfqSYiAGvHI6i16IwtgRrkaTTQn6iScBzV/MXVpPlV4ZRjP4Zpq2pdCj7ZpRpcKesX+
	iwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TgLl5tjLNh1SP0Q0q1OyQMvDICBpc6lHS7pvJhF4qKQ=;
	b=s+m7DX3/6p0pbbjW+bC5fzvoW05K+lLL2d1NPKns9QW/V/CLP6nnGWK2mIi84KD/KL
	1J/n1saKgZMkPT81x891KaBeilj8nM4MlBS8+nxWrU79yljRoj9BGiopxkvcRY8U8cd5
	RmLOEvfr/rrr9X9AAVDJ1bUGiiCG2biiZPVxyrQ/o6onTYF2oJwqx1H21VIaWI56Xvv9
	D8tj2Zz5nzOJSm6QJ0gygtqeMi5ic9wwrOlfu70rlw7M2cWDnGSoJ72JaK7zXcRkJD5w
	6wglWi5CFbPRwO8iarX0B0Gvfj80RMUfee+244zOL2/tPgNBg4rcSGOnzDnBtCmaAIkR
	wwAg==
X-Gm-Message-State: APjAAAWIVEvDGmIJf4Zx+ocDJuh9IDYO/OyBIeBkbwrzgf7DvCxhhfuO
	QLFjbWBQPHABQLZr3p9BKUGbYkB1PdfzyIfphS0=
X-Google-Smtp-Source: APXvYqwvNsNhtoGTJjcEgjIGJgmVhHHcm5a7lfPYXDd01oeizWMSJHyqlJUWPNPEP5wkv+ZWKSSX6joI8ahuHIuJGe8=
X-Received: by 2002:aed:2321:: with SMTP id h30mr5935762qtc.253.1553086806196; 
	Wed, 20 Mar 2019 06:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <1552383718-62708-1-git-send-email-changqing.li@windriver.com>
	<20190315104552.GB14180@localhost>
	<CAMKF1spft7gbJ983GtbyVtjXO5hECMuTqg6TM1bV2ozu0Np_CQ@mail.gmail.com>
	<20190320052115.GA25499@localhost>
In-Reply-To: <20190320052115.GA25499@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Mar 2019 08:59:39 -0400
Message-ID: <CAMKF1soQbssBdHEgmdGmeNFPWWQH+FdRbdzBuPDo_TOdnY0oRA@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
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
X-List-Received-Date: Wed, 20 Mar 2019 13:00:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 20, 2019 at 1:21 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Tue, Mar 19, 2019 at 11:51:47PM -0400, Khem Raj wrote:
> > On Fri, Mar 15, 2019 at 6:45 AM Adrian Bunk <bunk@stusta.de> wrote:
> > >
> > > On Tue, Mar 12, 2019 at 05:41:58PM +0800, changqing.li@windriver.com wrote:
> > > > From: Changqing Li <changqing.li@windriver.com>
> > > >
> > > > while compiled with -Werror=maybe-uninitialized/-Werror=format-overflow=,
> > > > it failed
> > > >
> > > > [snip]
> > > > | Incremental.c: In function 'Incremental_container':
> > > > | Incremental.c:1593:3: error: 'mdfd' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> > > > | close(mdfd);
> > > > | ^~~~~~~~~~~
> > > >
> > > > [snip]
> > > > super-intel.c: In function 'apply_takeover_update':
> > > > | super-intel.c:9615:15: error: '%d' directive writing between 1 and 11 bytes into a region of size 7 [-Werror=format-overflow=]
> > > > | " MISSING_%d", du->index);
> > > > | ^~
> > > >...
> > >
> > > I am seeing these warnings only with -Og, are you also seeing them with
> > > -Og (DEBUG_OPTIMIZATION) only?
> > >
> > > If this is true, I would consider
> > > https://sources.debian.org/src/mdadm/4.1-2/debian/patches/debian-no-Werror.diff/
> > > a better workaround.
> > >
> > This seems a broader brush, I really dont like to relegate Werror if
> > we dont have to, because it will force us
> > to fix the code.
>
> How are we getting such fixes properly reviewed?
>
> What actually happens is that the easiest change that silences a warning
> gets applied.
>
> And for such bogus -Og only warnings there was no problem in the code,

so then probably a better fix is to add -Wno-error to DEBUG_FLAGS
which will limit it to -Og case, and revert the original fix.



> meaning regression risks by OE/Yocto-only patches without fixing anything.
>
> > However, I am seeing it fail with clang now
> >
> > https://errors.yoctoproject.org/Errors/Details/233618/
>
> This is caused by the "fix" for the -Og gcc warning.
>
> Which looks bogus, and might be harmful.

I think that is right. the fix seems to be regressing on gcc 9 as well
so it has to be done differently.
>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>

