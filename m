Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4B2B476230
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 09:16:46 +0000 (UTC)
Received: by wmec201 with SMTP id c201so12107692wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 01:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=dGpOE4XpZTr4VXrz0f5WvOvC/Zi5fRgSs3h2ldH2opQ=;
	b=j6us3WbM9fNZfM8krFlN4h43ZgobZVLg8nK9wz27wF2X900suUM5CmBcxKofBR++oJ
	tMJs2yqR8Xeh7if2O9xrsyCKjcHejomhmkhjR+RVeJxaEpDq/vKDs0lfgXUVtTVoWlOR
	gSf0dJ6zaIxHl4ydQpmdQZalcXiI/a86hhvb1SLtBvvQih24t/CzXT6czrHRhkl2k+D3
	+4QZAFf57Ba291zIuGF7Vdu1w6Z35JaVXYsv483Sd0grNZcGGNIhdJBFO5PKl20usS9i
	FS+Hoh5y8WC8g1p63cCmO27KPspPCDKgPBkZe3YV4DCI48uUonktwmwbegW8VDudES4O
	1JQQ==
MIME-Version: 1.0
X-Received: by 10.28.87.1 with SMTP id l1mr8404122wmb.72.1446801406504; Fri,
	06 Nov 2015 01:16:46 -0800 (PST)
Received: by 10.194.140.38 with HTTP; Fri, 6 Nov 2015 01:16:46 -0800 (PST)
In-Reply-To: <1446734821-6011-1-git-send-email-mac@mcrowe.com>
References: <1446734821-6011-1-git-send-email-mac@mcrowe.com>
Date: Fri, 6 Nov 2015 01:16:46 -0800
Message-ID: <CAJ86T=WxqbJ83S4RESL_oKX9gYNg6-aAPGUYR3btSQBhKQo-1g@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf, module.bbclass: Support opting out of legacy EXTRA_OEMAKE
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
X-List-Received-Date: Fri, 06 Nov 2015 09:16:47 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 5, 2015 at 6:47 AM, Mike Crowe <mac@mcrowe.com> wrote:
> Give recipes and classes the ability to opt out of EXTRA_OEMAKE
> containing the legacy value without removing other recipe-specific or
> local additions.

Isn't this possible already from within a recipe or class by using

  EXTRA_OEMAKE = ...

instead of

  EXTRA_OEMAKE += ...

ie what autotools.bbclass, kernel.bbclass and many recipes do already.

For the specific case of module.bbclass, changing the EXTRA_OEMAKE
assignment to '=' might require some recipes to be tweaked to so that
they "inherit module" before adding their own options to EXTRA_OEMAKE,
but it seems like a cleaner solution?


> The default value of EXTRA_OEMAKE="-e MAKEFLAGS=" is unfortunate. It
> causes breakage and unintended behaviour in various recipes.
>
> It is particularly toxic when variables are passed on the command line
> to make since they then don't survive calling into a submake.
>
> In particular this breaks building modules when LD=gold since the
> overridden LD=${KERNEL_LD} is lost by the time the kernel's Makefile is
> invoked.
>
> This solution isn't pretty either, but it may be a good small first step
> towards a future utopia where EXTRA_OEMAKE needn't contain "-e
> MAKEFLAGS=" by default at all.
>
> Signed-off-by: Mike Crowe <mac@mcrowe.com>
> Acked-by: Phil Blundell <pb@pbcl.net>
> ---
>  meta/classes/module.bbclass | 4 ++++
>  meta/conf/bitbake.conf      | 3 ++-
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
> index 0952c0c..4913aac 100644
> --- a/meta/classes/module.bbclass
> +++ b/meta/classes/module.bbclass
> @@ -4,6 +4,10 @@ addtask make_scripts after do_patch before do_compile
>  do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
>  do_make_scripts[depends] += "virtual/kernel:do_shared_workdir"
>
> +# -e MAKEFLAGS= is toxic when building modules since it will cause
> +# none of the variables passed to make on the command line to make it
> +# through to submakes.
> +EXTRA_OEMAKE_LEGACY = ""
>  EXTRA_OEMAKE += "KERNEL_SRC=${STAGING_KERNEL_DIR}"
>
>  module_do_compile() {
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 06971da..93ab02a 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -477,7 +477,8 @@ export BUILD_STRIP = "${BUILD_PREFIX}strip"
>  export BUILD_NM = "${BUILD_PREFIX}nm"
>
>  export MAKE = "make"
> -EXTRA_OEMAKE = "-e MAKEFLAGS="
> +EXTRA_OEMAKE_LEGACY = "-e MAKEFLAGS="
> +EXTRA_OEMAKE = "${EXTRA_OEMAKE_LEGACY}"
>  EXTRA_OECONF = ""
>  export LC_ALL = "C"
>
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

