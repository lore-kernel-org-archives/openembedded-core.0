Return-Path: <andrea.adami@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 56D0C79E16
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Nov 2018 13:32:34 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id u13-v6so7714428pfm.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Nov 2018 05:32:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Gj74/PSz85Nqx90fZt9CGsp6/K2wGllO6E+vNVVevkc=;
	b=kYrWxofE6mGGdUnwsnEhn6e4xNX7uYl+vdoemSsCxjqsc0K5DEHiZLWXkgvIGDjub0
	D5J7mj84FGAonKliX65KuJSoq2O2PdC1r6s1RGcc1e7uPuemNzJoKJTBCSYn73xRC3vq
	SbMBbjrmqNaWPHRnpmUM1I2//d1rNOUCx/5yHeZac84C6+870knccxU7Fv+KKJTPPKDB
	uiQKK9hMmEQ0RuQUL0ZteTFDS+MYBUKfBf/tTFabrFbBPsSIOeHZ+PcRcwALNLRvLAfX
	oSIMr3Lm9Q4H6MXtCQLQXYj33N/m9WOsZdD9+d2zmaJdKHWIIk/LetQUc+NIu496K2hr
	mjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Gj74/PSz85Nqx90fZt9CGsp6/K2wGllO6E+vNVVevkc=;
	b=LioAIvY1vQ7H5N6K2zaf+OaakPz30oTyZ+OjZNk0rOuoTY4PwUfYBFDjSgAr15sICP
	80ENxfoIL8glyAFxSuHpfaN+6HVe9Eg+c96uBKLivukh5vqDj+my/RQLIUa08V+im6I/
	bg2wzLWWWgElqpBAJ00wuyVpPdseRwexkF1oWOiEWU6nB3G9Rlt82fQAUDYJtVMLyBIW
	oQmedlODRL2YX4QnTr6s6vJzNxJtQ3qwpSaqj7jOQRjPlV+YcVZ7xHsYyodAJ2BazRqP
	Xslqq2vmEVGmVs9s4uOtS6Icgr/QmQUg28/7Ik2r98qfjts/4kPMEUe5kxCy7NgUFML4
	KrFw==
X-Gm-Message-State: AGRZ1gLFRl0/giLGpYccWTDG7cyxPq4yVxEJH+SGYKAnhv9oyZ7+kWLt
	0BlKOcAH1SAuPZl6Pnyt85Viyimn/0VuBGzvW9U=
X-Google-Smtp-Source: AJdET5eOz0hTx9aOTFQXuJB48EJA5BWbzqgcH3d2rVWmXATQnp9HUvY9r0za8ZPzUE3cHJSqks3DPfYF3GLGmjFoS/M=
X-Received: by 2002:a62:5b43:: with SMTP id
	p64-v6mr254987pfb.122.1541597555567; 
	Wed, 07 Nov 2018 05:32:35 -0800 (PST)
MIME-Version: 1.0
References: <20181107121602.13768-1-nathan@nathanrossi.com>
	<20181107121602.13768-2-nathan@nathanrossi.com>
In-Reply-To: <20181107121602.13768-2-nathan@nathanrossi.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Wed, 7 Nov 2018 14:32:22 +0100
Message-ID: <CAAQYJAurMNXOeAh5Px8a5NqUBzc4PdcfL1KpfqUESjzdwO0gvw@mail.gmail.com>
To: nathan@nathanrossi.com
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernel-initramfs.bbclass: Handle built-in /dev/console dependence
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
X-List-Received-Date: Wed, 07 Nov 2018 13:32:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 7, 2018 at 1:16 PM Nathan Rossi <nathan@nathanrossi.com> wrote:
>
> The kernel has two differing code paths when handling a built-in cpio
> versus a cpio passed to the kernel from a boot loader. When the kernel
> is booted with the built-in cpio it expects the /dev/console node to
> exist and will panic if it does not exist.
>
>   Kernel panic - not syncing: /dev/console is missing or not a character device!
>
> When the cpio is passed to the kernel via a bootloader, this behaviour
> is not observed.
>

Well, of course once booted you have devtmpfs or you have provided
your devices-list.
We fight since long with this early issues and I think this approach
is wrong: there are more things needed, not only /dev/consoleI'd say
the responsability to check for devtmpfs or recreate the devices is up
to init manager of the image.

We don't use busybox, just a single binary running as init: kexecboot
will exactly do that, check and recreate devices if missing:
http://cgit.openembedded.org/meta-openembedded/tree/meta-initramfs/recipes-bsp/kexecboot/kexecboot_git.bb

Please don't inject anything in the cpio, let the image-engineer decide.

This poor image is regularly attacked by new changes filling the cpio
with undesidered stuff:
http://cgit.openembedded.org/meta-openembedded/tree/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb

Maybe we are on the corner-case, size-contraints limit us to be within
1MiB, neverthless I think it is a good exercise to keep things small
and clean ;)

As for the previous patch touching initramfs, I hold my comments for
the moment: let me first test it.
Cheers

Andrea

> To resolve this issue, ensure any cpio that is built into the kernel is
> prepared with a /dev/console node. This is done by appending to the
> copied cpio of the INITRAMFS_IMAGE. In order to create the node to
> append, the task must be executed with root permission (to run mknod).
> As such this change creates and intermediate _prepare task between the
> existing _bundle and _copy tasks.
>
> Note: The default/minimal initramfs that the kernel sources
> gen_initramfs_list.sh generates contains this device node.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/usr/gen_initramfs_list.sh?h=master#n55
>
> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> ---
>  meta/classes/kernel-initramfs.bbclass | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel-initramfs.bbclass b/meta/classes/kernel-initramfs.bbclass
> index b23fb51495..135f4c8949 100644
> --- a/meta/classes/kernel-initramfs.bbclass
> +++ b/meta/classes/kernel-initramfs.bbclass
> @@ -16,7 +16,8 @@ python __anonymous () {
>      if image and bundle:
>          # add all the tasks
>          bb.build.addtask('do_initramfs_copy', 'do_initramfs_bundle', 'do_install', d)
> -        bb.build.addtask('do_initramfs_bundle', 'do_deploy', 'do_initramfs_copy', d)
> +        bb.build.addtask('do_initramfs_prepare', 'do_initramfs_bundle', 'do_initramfs_copy', d)
> +        bb.build.addtask('do_initramfs_bundle', 'do_deploy', 'do_initramfs_prepare', d)
>
>          # make the do_initramfs_copy task depend on the image do_image_complete task
>          d.appendVarFlag('do_initramfs_copy', 'depends', ' ${INITRAMFS_IMAGE}:do_image_complete')
> @@ -67,6 +68,18 @@ do_initramfs_copy () {
>      echo "Finished copy of initramfs into ./usr"
>  }
>
> +do_initramfs_prepare[dirs] = "${B}"
> +fakeroot do_initramfs_prepare () {
> +    echo "Preparing initramfs by creating required /dev/ nodes"
> +    # append a /dev/console node, this node must be created in the rootfs
> +    # for built-in initramfs cpios otherwise it will error with:
> +    #   Kernel panic - not syncing: /dev/console is missing or not a character device!
> +    rm -rf ${B}/usr/append
> +    mkdir -p ${B}/usr/append/dev
> +    mknod -m 600 ${B}/usr/append/dev/console c 5 1
> +    (cd  ${B}/usr/append && echo "./dev/console" | cpio -oA -H newc -F ${B}/usr/${INITRAMFS_IMAGE_NAME}.cpio)
> +}
> +
>  do_initramfs_bundle[dirs] = "${B}"
>  do_initramfs_bundle () {
>      echo "Creating a kernel image with a bundled initramfs..."
> ---
> 2.19.1
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

