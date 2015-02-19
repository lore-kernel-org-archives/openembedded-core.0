Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id D581F735C1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 16:47:01 +0000 (UTC)
Received: by labgd6 with SMTP id gd6so745082lab.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 08:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=eFObQN0f3T2VEvrEmZu/QNkpNIfZ7sJigmFbOYJKVKI=;
	b=LQHrlP3U6E0DGlr6k85xUsATz7LIlf5vqvHSQ7ZgR7QJeHVo4yO6uGj9qXYsXF2TPV
	O2vMXas5nr5AJa7M+lCq/Eo8y6OKheMza3g19odyvrdzZfShaTOc3UbJBisl7QeIWw4T
	ND1PUhzMNE+/Kpkikh2cichk05rE+HB0PqQSoLIsqA85U5711JYiRTJrmnyTEpXKGTR4
	RyVK3/hudJztB04eotfWsndzwFw5E1L/WkhdFcNtKQLb6Kx487sUkjOjHKfcURuwx/ey
	5/BJWfR1/GePXIbCQxgtmgq8wiWYGcVhlLDZJt7c9O6WRCzU8UGF52t41GMRc94stF+4
	Kadw==
MIME-Version: 1.0
X-Received: by 10.152.115.169 with SMTP id jp9mr4654767lab.121.1424364421196; 
	Thu, 19 Feb 2015 08:47:01 -0800 (PST)
Received: by 10.112.40.11 with HTTP; Thu, 19 Feb 2015 08:47:01 -0800 (PST)
In-Reply-To: <cover.1424363815.git.paul.eggleton@linux.intel.com>
References: <cover.1424363815.git.paul.eggleton@linux.intel.com>
Date: Thu, 19 Feb 2015 11:47:01 -0500
Message-ID: <CADkTA4NYnGhGUmi9ZSZZU3PYf7wA2Zj-u7HM8GhQbO5sU9AoTg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/15] devtool and externalsrc improvements
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
X-List-Received-Date: Thu, 19 Feb 2015 16:47:04 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 19, 2015 at 11:39 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> I've been attempting to enable usage of devtool with the kernel (which
> effectively means using the externalsrc class with the kernel). This
> doesn't really work yet due to lack of handling the kernel configuration,

I've always insisted/argued and designed in that externalsrc shouldn't touch the
kernel configuration at all.

You are building a tree that is completely managed outside of the build system,
and getting the kernel configuration in place is part of that management.

So I'm not convinced it is a problem that needs to be solved.

Cheers,

Bruce

> so you still can't use externalsrc properly with the kernel, but this
> at least gets us further - you can now extract the source successfully
> and run a build. I also discovered and fixed a number of related issues
> along the way, and made a few behavioural improvements in both devtool
> and externalsrc.
>
>
> The following changes since commit ad016fa7492ba23c751cf33dd1befde7782facfa:
>
>   lzo: Upgrade to 2.09 and add ptest (2015-02-19 07:50:44 +0000)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib paule/devtool-fixes
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool-fixes
>
> Paul Eggleton (15):
>   recipetool: fix regression caused by previous commit
>   lib/oe/patch: fix PATCHTOOL = "git" with source in a subdirectory
>   classes/externalsrc: fix source being wiped out on clean with kernel
>   classes/externalsrc: add workaround for recipes that use SRCPV in PV
>   classes/externalsrc: show a warning on compiling
>   classes/kernel-yocto: extend SRCTREECOVEREDTASKS
>   devtool: add/modify: add option to build in same directory
>   devtool: reset: run bitbake -c clean on recipe
>   devtool: build: run do_populate_sysroot instead of do_install
>   lib/oe/recipeutils: minor improvements to patch_recipe()
>   devtool: update-recipe: add handling for git recipes
>   devtool: prevent extract/modify use with image recipes
>   devtool: modify: handle recipes that use a shared workdir
>   devtool: support source extraction for recipes that use a shared
>     workdir
>   devtool: fix broken clones of git recipes
>
>  meta/classes/externalsrc.bbclass  |  24 ++++
>  meta/classes/kernel-yocto.bbclass |   2 +-
>  meta/lib/oe/patch.py              |   7 +-
>  meta/lib/oe/recipeutils.py        |   4 +-
>  meta/lib/oeqa/selftest/devtool.py | 147 ++++++++++++++++++-
>  scripts/lib/devtool/standard.py   | 292 +++++++++++++++++++++++++-------------
>  scripts/lib/recipetool/create.py  |   8 +-
>  7 files changed, 377 insertions(+), 107 deletions(-)
>
> --
> 1.9.3
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

