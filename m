Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id BB23E6B07E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 03:52:12 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id z25so940807qti.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 20:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Om9X7Epn1XzhO+2jxCfgjb2VI1yogiXf4pKqcjmyIVQ=;
	b=KwIb9Imdjalr4jvC7gW9f/dOWTFRufGwOSFZhFIB0apxAXh8VmhONrWtRCXLRGoa8t
	/j1HyQqL6rOV1BwV42VVOXjXBHWuY5jS46PhRvQbN3JhSRXsOpu/ZodBTM8p/FKWMaW9
	HYjg9F5Kvb2bd/iHAFH0rldtGbt/hazGfB3jYMg9ipoTCaI/9vOOTev3Cbi1wFhcS6dR
	7iopvw752AAA/BiDHkH5yQgkUd99pdNyX0oVN/fGOOtd7tcUcrgaumjOU6zdpJD+9RdC
	YuzYBctBJrw05hwjgfoIM0UpOxcC1YwJASvm3pEzyG9KeGlkvzAIPDips8ZhuoElkzvN
	v/6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Om9X7Epn1XzhO+2jxCfgjb2VI1yogiXf4pKqcjmyIVQ=;
	b=oVMfK6SmndPzJO9TwgfNO7XIiLCc6K0Q+iOv0fkp5o5725oo5/k7JI92EsaaUZdd15
	gLA6l3e5WVTTyhvmC1UMr7qM3rnIzYi23AbpkDf7v+ivyVey/YNdJa2bfODesXn3b+rk
	/YSmebxv/sLRe+khCXX0E9K4psXXVZGHdsVkgPcNddERKT+Lhfkw0Xoz98Vd3YBIHHWE
	q0lW+J7xcnZG6BZNybBOuBy5HTHJGshYeTZN619kPgzNQ9lzsDwVk9VzgG6IZhZ2pEtp
	lMFdhxfIfbte1rIYL+tmLDhZmLES30gCwu9i5ZTbJPLq92TURN0wYCTMOu3oZI7OvSVM
	9t3A==
X-Gm-Message-State: APjAAAX1+T/W3MpjcGSoj6PludV4O1nAfquUl3vv+DgBN7gsMj8XGJsM
	OFzDgk4onsna1LYYETJH+up+upK8kYzZ9anhvzFWFMhZhQk=
X-Google-Smtp-Source: APXvYqzbCU1uzgA/8fx0Gf+hLagkTgci/5u+Jra8P9hIXUVRVRAI7VPjJGaC8oESqYqDQ9vaZNUGbTsdbDmH5sx3Y/o=
X-Received: by 2002:ac8:2f59:: with SMTP id k25mr4956106qta.254.1553053933397; 
	Tue, 19 Mar 2019 20:52:13 -0700 (PDT)
MIME-Version: 1.0
References: <1552383718-62708-1-git-send-email-changqing.li@windriver.com>
	<20190315104552.GB14180@localhost>
In-Reply-To: <20190315104552.GB14180@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Mar 2019 23:51:47 -0400
Message-ID: <CAMKF1spft7gbJ983GtbyVtjXO5hECMuTqg6TM1bV2ozu0Np_CQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 20 Mar 2019 03:52:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 15, 2019 at 6:45 AM Adrian Bunk <bunk@stusta.de> wrote:
>
> On Tue, Mar 12, 2019 at 05:41:58PM +0800, changqing.li@windriver.com wrote:
> > From: Changqing Li <changqing.li@windriver.com>
> >
> > while compiled with -Werror=maybe-uninitialized/-Werror=format-overflow=,
> > it failed
> >
> > [snip]
> > | Incremental.c: In function 'Incremental_container':
> > | Incremental.c:1593:3: error: 'mdfd' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> > | close(mdfd);
> > | ^~~~~~~~~~~
> >
> > [snip]
> > super-intel.c: In function 'apply_takeover_update':
> > | super-intel.c:9615:15: error: '%d' directive writing between 1 and 11 bytes into a region of size 7 [-Werror=format-overflow=]
> > | " MISSING_%d", du->index);
> > | ^~
> >...
>
> I am seeing these warnings only with -Og, are you also seeing them with
> -Og (DEBUG_OPTIMIZATION) only?
>
> If this is true, I would consider
> https://sources.debian.org/src/mdadm/4.1-2/debian/patches/debian-no-Werror.diff/
> a better workaround.
>
This seems a broader brush, I really dont like to relegate Werror if
we dont have to, because it will force us
to fix the code. However, I am seeing it fail with clang now

https://errors.yoctoproject.org/Errors/Details/233618/
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
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

