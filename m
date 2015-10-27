Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f182.google.com (mail-yk0-f182.google.com
	[209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id 5B80575CC2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 13:46:32 +0000 (UTC)
Received: by ykft191 with SMTP id t191so35855206ykf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Oct 2015 06:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=C15R6I2FSgvGCkbNNmTwjkWjY6EVfQfG7NKkmVK365U=;
	b=RI7nJZq0qM08k8gxZazIbo3Ix5E13+boehkEZhblne9cbZV9wrDVRQNMOivNiJ0BnH
	iTQrtT+j50CKO+xZR2poUOD41nrS94w/5WqtdWXAXgqLpOKnHZNtekWETQajizPRkHlE
	L2eBM7rtA7rBYVwv47etxiJG5oovLju1ZibGaw0MF4qLQXdgZ5Y8yLrjcM42hi++3HsN
	dVfvQlOoD/OHeYRxpe1eXwt2iYoRUm2MgRivqgtaoaQNsSUZczIHAbpJLNx5qU+lFVl+
	WphaAuIFpau+UOCoCyrlC+M0RssA6Br2LQStqe86S6ONa2c5qaET8N0hd3YfQrtvAOP1
	GrGg==
MIME-Version: 1.0
X-Received: by 10.129.91.68 with SMTP id p65mr29423684ywb.252.1445953592999;
	Tue, 27 Oct 2015 06:46:32 -0700 (PDT)
Received: by 10.129.153.142 with HTTP; Tue, 27 Oct 2015 06:46:32 -0700 (PDT)
In-Reply-To: <34a726445da94bca0bf2f56f9823f176b837ac1d.1445942620.git.hongxu.jia@windriver.com>
References: <cover.1445942620.git.hongxu.jia@windriver.com>
	<34a726445da94bca0bf2f56f9823f176b837ac1d.1445942620.git.hongxu.jia@windriver.com>
Date: Tue, 27 Oct 2015 09:46:32 -0400
Message-ID: <CADkTA4PTc-jyJLKzARJftXU2g-jAVBN-_nAdwLdc509Hg7dtyA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: "Ashfield, Bruce" <bruce.ashfield@windriver.co>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] kernel.bbclass: add kernel-devsrc to kernel-dev's RDEPENDS
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
X-List-Received-Date: Tue, 27 Oct 2015 13:46:33 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 27, 2015 at 6:45 AM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> In kernel-dev package, Nothing in ${KERNEL_SRC_PATH}.

Honestly, I'd rather leave this as-is for now.

I have a feature/bugzilla (call it what you want) for the 2.1 release to re-work
the partitioning of these packages.

kernel-dev and devsrc have been like this for a while now, and if someone
really wants the source on their target, they've been adding devsrc as their
package.

If the split changes such that kernel-dev doesn't end up bringing the source,
I'd rather not create another set of users that we need to migrate to some
new packaging scheme.

Bruce

> ...
> $ find packages-split/kernel-dev
> packages-split/kernel-dev
> packages-split/kernel-dev/boot
> packages-split/kernel-dev/boot/System.map-4.1.10-WR8.0.0.0_standard
> packages-split/kernel-dev/boot/Module.symvers-4.1.10-WR8.0.0.0_standard
> packages-split/kernel-dev/boot/config-4.1.10-WR8.0.0.0_standard
> ..
>
> And package kernel-devsrc included ${KERNEL_SRC_PATH}, so we add
> kernel-devsrc to kernel-dev's RDEPENDS
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/classes/kernel.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 5e8b6cf..a07c5c1 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -357,7 +357,7 @@ PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev kernel-mod
>  FILES_${PN} = ""
>  FILES_kernel-base = "/lib/modules/${KERNEL_VERSION}/modules.order /lib/modules/${KERNEL_VERSION}/modules.builtin"
>  FILES_kernel-image = "/boot/${KERNEL_IMAGETYPE}*"
> -FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
> +FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* /lib/modules/${KERNEL_VERSION}/build"
>  FILES_kernel-vmlinux = "/boot/vmlinux*"
>  FILES_kernel-modules = ""
>  RDEPENDS_kernel = "kernel-base"
> @@ -368,6 +368,7 @@ PKG_kernel-image = "kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')
>  RDEPENDS_kernel-image += "${@base_conditional('KERNEL_IMAGETYPE', 'vmlinux', 'kernel-vmlinux', '', d)}"
>  PKG_kernel-base = "kernel-${@legitimize_package_name('${KERNEL_VERSION}')}"
>  RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
> +RDEPENDS_kernel-dev += "kernel-devsrc"
>  ALLOW_EMPTY_kernel = "1"
>  ALLOW_EMPTY_kernel-base = "1"
>  ALLOW_EMPTY_kernel-image = "1"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

