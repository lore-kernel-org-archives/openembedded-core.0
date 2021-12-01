Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <f2c3aa7c59a874f99b80d49bde596e93664a5392.camel@linuxfoundation.org>
Subject: Re: [PATCH] linux-yocto-dev: Make -dev kernel work for a fixed revision
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Wed, 01 Dec 2021 11:28:24 +0000
In-Reply-To: <20211201043934.3212357-1-kexin.hao@windriver.com>
References: <20211201043934.3212357-1-kexin.hao@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: Kevin Hao <kexin.hao@windriver.com>, openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, Linux Yocto <linux-yocto@lists.yoctoproject.org>

On Wed, 2021-12-01 at 12:39 +0800, Kevin Hao wrote:
> By default the -dev kernel uses the "AUTOREV" to pull in the branch
> head as the revision. Some of our BSPs are based on the -dev kernel and
> we choose to nail down the kernel to a specific revision when releasing
> our product by using some setting like below:
>   PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-dev"
>   SRCREV_machine:pn-linux-yocto-dev = "6fb48ae18a10770702266dd1f1aa500149e361ec"
>   KBRANCH:pn-linux-yocto-dev = "standard/x86"
>   LINUX_VERSION = "5.15"
> 
> Since all the standard/* branches will be rebased after each kernel
> version bump, we would get bitbake fetch failure due to that specific
> commit is not reachable in the new version branch. This kind of issue
> can be fixed by setting the "nobranch" parameter in the SRC_URI because
> it will cause the fetcher to skip the SHA validation for the branch.
> And this also won't cause other side effect because all the branches
> will be created in the do_kernel_checkout() and the current branch will
> be reset to the reversion we want in do_validate_branches().
> 
> Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-dev.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> index 6b6ea9a7e864..7204c3eddc11 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> @@ -19,7 +19,8 @@ include recipes-kernel/linux/linux-yocto-dev-revisions.inc
>  KBRANCH = "standard/base"
>  KMETA = "kernel-meta"
>  
> -SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine \
> +# Set nobranch to skip the SHA validation for branch if a fixed revesion is used
> +SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine;nobranch=1 \
>             git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=master;destsuffix=${KMETA}"
>  
>  # Set default SRCREVs. Both the machine and meta SRCREVs are statically set

I'm afraid this looks to be a bit of a horrible workaround/hack. It happens that
if you specify a branch and set nobranch it might do what you want but that
certainly isn't by design.

Either the revision is in the branch or it isn't. The error is telling you the
configuration you set isn't valid and you really need to set a valid
configuration, i.e. a revision and a branch or a revision and set nobranch but
not both.

I'm not sure I understand why the kernel would be rebasing after each kernel
release? Is this because it is one of the unversioned branches?

I can fix the fetcher to hard error if both are set...

Cheers,

Richard



