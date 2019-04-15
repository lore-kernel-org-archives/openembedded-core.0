Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id BE67B7D716
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 16:21:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44jYft565NzFr;
	Mon, 15 Apr 2019 18:21:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1555345320;
	bh=XNbD3V2FEqJFQf54TaEiZ9VpWbzIl4hF2E0UkWqlRLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lwLS4a3yRknTuPZhj1GmOl6caWorKanexYmSOeu1+d2LchGYkTClzaDBzR6tGNiDC
	AThTHCamcvXhB/VnTbgjlFfz4YuRWaJTYmwid5FaDbiz06T7N3nTwEeGoxgdgzxhCZ
	PrK0XrO4i4yQYSvdG5vA18z45U7+sNQZpcfniNh70w+PTqFQdcyGPMKQZrZgP7yA5L
	lXyPHrPkGXZIteK4nyYGcajzMzA8fRwNlfyzECFr1Tnxh8IkGAzdNYjvY392nqQq16
	5B0L4rJaBw09VkT0jMThHlKPMhvtpOlRp+I7LVYtCLwCttnkeq/rdPGHRz4uedWdhU
	h87/PYS+vuMpaYH/dzjUzxTfQgernUCdICeSjbwuFPu7A4wAzh3KpubYqV52wrY6re
	kafmhqezQGSt8WGfidkq26is/XgBlIT2RCQDRbOkhJ83XD2rbSbohV8DWA6fIRgXXT
	qLk/dTa37J2Mtqzl4P56gH/ChWQvBBR4fjtRGYEjjJd92mcZL3xV8+Oha10InQHRqj
	7Q+o8UmUfeUfBT1HUTLF/XPsxzpAlm7O3SFEl+xdEg2MCiZNAG1zOc8IR6vjmnhIm8
	GmRZ3HgqoTXlqgKVmmN7TKuqly9BwP7ULLcAkp2V+s6XDbyfXnVb8FdQZkTB+EYX/l
	bXqBazfqEf+FGpBJj1kXLmU0=
Date: Mon, 15 Apr 2019 19:21:56 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190415162156.GA16706@localhost>
References: <CAMKF1soKYZj6fKjFdNzAjhgtwaFKcw7iwyCU_kPq_QxmgCivng@mail.gmail.com>
	<1554777170-58044-1-git-send-email-mingli.yu@windriver.com>
	<CAMKF1sq0wYPvJg1G5+cnY-6owi1K=Nc4bctXm3pcsbh1R5gpFA@mail.gmail.com>
	<20190415093825.GB4317@localhost>
	<CAMKF1sps-k6m=ZrpuMmhj23ZkmF8C=17hGPscRH-V0cagV-2rw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sps-k6m=ZrpuMmhj23ZkmF8C=17hGPscRH-V0cagV-2rw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] gcc-sanitizers: fix -Werror=maybe-uninitialized issue
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
X-List-Received-Date: Mon, 15 Apr 2019 16:22:00 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Apr 15, 2019 at 07:19:13AM -0700, Khem Raj wrote:
> 
> What are you trying to convey ? That’s what I mentioned before I began my
> reply however to reiterate my point was if a package is not usually built
> and tested with this combination which is evident because it fails to build
> then how good would it be if we fix this error especially complex packages
> like compilers so is it worth to fix them or disable Og for them

Packages that usually get built and tested with -Og should be pretty rare,
and these specific build failures are better at finding the rare packages
that use -Werror than pointing at potential miscompilations.

From a distribution point of view, a package build with -Werror by 
default is arguably a bug since this frequently breaks when something
is changed (usually the compiler version).

-Og is better suited than the -O that was previously used for debugging,
but are we talking about debug builds or production builds?
If users would be using DEBUG_OPTIMIZATION in production builds that 
would be wrong - this will always be a mostly untested situation
with an increased probability of hitting bugs noone else has seen
before.

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


