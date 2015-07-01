Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f179.google.com (mail-yk0-f179.google.com
	[209.85.160.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2114B75C5B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 14:48:45 +0000 (UTC)
Received: by ykfy125 with SMTP id y125so40903716ykf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jul 2015 07:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=5wBhYDyXzTxj/AH3HtL+omd0S8FT1ynlJrebr9AfhQA=;
	b=u1Dri3ykCkzo2g145oxUnayXrjO1Rb+nfr0yJr8lFs7O5nlXIMTYCmP4meAn7lqQlp
	lful1k9Hu03kQkaaUmfKLamHLyrpzrb3nDmdy7jhdTG4VdddwnhNo1qD7vLuaqvrg7Cd
	dsB27kJp9StXv8CeRa+Cjx6ihgbZeUzWN6R1xGmpStnhDfQ5ykwpCEptE/ToEgnP7pNX
	Q8r6YW1G2e2fY1C/W52dyaJ1nDbQjDEBCso6Y0bQKY4Gryebtbg+MM95VC8lLgo+T5hD
	cOLBjahz92lEHcopNGNh6MnKIPw7GRo1JLGdvKVl2/bAerT/R0GhJR7M+IrWEnAYl9nn
	0ajA==
MIME-Version: 1.0
X-Received: by 10.13.198.2 with SMTP id i2mr33523120ywd.123.1435762125397;
	Wed, 01 Jul 2015 07:48:45 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Wed, 1 Jul 2015 07:48:45 -0700 (PDT)
In-Reply-To: <1435731416-31190-1-git-send-email-jian.liu@windriver.com>
References: <1435731416-31190-1-git-send-email-jian.liu@windriver.com>
Date: Wed, 1 Jul 2015 10:48:45 -0400
Message-ID: <CADkTA4NwLTbU3O=NVc2cU13OctN_k0RD_cb8t9vtMrY0V4pS6Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Jian Liu <jian.liu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-devsrc: missing tools for building modules
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
X-List-Received-Date: Wed, 01 Jul 2015 14:48:46 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 1, 2015 at 2:16 AM, Jian Liu <jian.liu@windriver.com> wrote:
> Some tools under scripts are missed and this can cause error
> during building modules on the target
> Build these tools by "make script".

We have a bugzilla for this, but the change was pending some other
re-organizations
of the kernel source packaging.

The problem with packing this is that we used to get QA errors since
the tools don't
match the target arch.

Can you confirm that you've built, packaged and installed this on a
non-x86 architecture ?

Bruce

>
> Also handle the .debug directories.
>
> Signed-off-by: Jian Liu <jian.liu@windriver.com>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index dd65788..ff03d4e 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -57,6 +57,9 @@ do_install() {
>          # architecture (since scripts and helpers are native format).
>          KBUILD_OUTPUT="$kerneldir"
>          oe_runmake -C $kerneldir CC="${KERNEL_CC}" LD="${KERNEL_LD}" clean _mrproper_scripts
> +        # Tools under scripts/ is necessary.
> +        cross_tool_prefix=${@d.getVar('TARGET_RAW_PREFIX', True) or ""}
> +        make -C $kerneldir CROSS_COMPILE=$cross_tool_prefix scripts
>
>          # As of Linux kernel version 3.0.1, the clean target removes
>          # arch/powerpc/lib/crtsavres.o which is present in
> @@ -71,6 +74,7 @@ do_install() {
>  # Ensure we don't race against "make scripts" during cpio
>  do_install[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
>
> -PACKAGES = "kernel-devsrc"
> +PACKAGES = "kernel-devsrc-dbg kernel-devsrc"
> +FILES_${PN}-dbg = "${KERNEL_SRC_PATH}/scripts/.debug ${KERNEL_SRC_PATH}/scripts/*/.debug"
>  FILES_${PN} = "${KERNEL_SRC_PATH}"
>  RDEPENDS_${PN} = "bc"
> --
> 1.8.5.2.233.g932f7e4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

