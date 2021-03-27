Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.659.1616866330510626378
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Mar 2021 10:32:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ir6WpJSK;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id ap14so8346ejc.0
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Mar 2021 10:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gPj8TYDQVY4GTcO07342MMI+BALVxZGihmcBgxkjocw=;
        b=ir6WpJSK483574u6kjTfaObOqkMZT0h3crbMyLj5sAwvsUNkLYL2T4UpIPMvee74Ro
         XZb4774MPZAMnh06xuUzmdu+D+VnyTBDnLn+1JC1r7cNz5sgXOEdh1msdTYLOzIjPbYK
         j/wjLVNSe/tnwAQlIaZ6IxcSZeHAXoZQYt60CKiMBUl0ooKvf2EMJ/okkhNWPlNGADo3
         cTmrG/NQroTjhMaahi+RjFMxTtQkCC81035MoTZvxdrkN4BHWeme9AJOuBsnQiGlzful
         siSUrjMbQfh45ppN0mkr1QzqMoZeuGN8ywTmiCg7k41wEKSblhTZrVRm43oDlEsPNW29
         ACcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gPj8TYDQVY4GTcO07342MMI+BALVxZGihmcBgxkjocw=;
        b=BajzboSz5NpE9JXgSC6a1xg9w9NPndH35WYDEZ+pHACKNM9lj5UQgBDXJzYfvt7udJ
         Lc8+U+fmjweIEHS9Aq2V8NAj7sW5mCI1/whPZT/y/AF/aozBNwrQ3RkJb6CEQcQJWLzN
         UsikNTvb3oNkLQWsBheTjbp63zP33HLvNpCHCaXpDqP2rngCTyb/b4RO2qE+bdRMWY0z
         qnIa7fjOedxbAk1vsZ6UyfBuDMzqL1/2/4aHxvjsufqQmrVNqZocmDxWOJjpCdQWZubd
         VTlqUPyBokHVvy9KYl9OHc97BQ4uZrkePOeH0lwVgC+RiRWJPsoF45sQSZO+m51FakvZ
         nlZg==
X-Gm-Message-State: AOAM533yH2NZ9wAJLRcLz3ccAzZxXAd4/jpQSDXRfp2F3hmgMlJW1Okf
	iOXD9WY3ulXixfdSvjXhHVLfhpkw5b45KvJ342E=
X-Google-Smtp-Source: ABdhPJylqD/GfRhovEu5zXMTxMbWl6Z1oN+6eWf46l7QVj0axjZR8xa6R7LP+XyJMn4+LELnT4/jBOVaE0R/BWofhso=
X-Received: by 2002:a17:906:9bdb:: with SMTP id de27mr21456346ejc.459.1616866328927;
 Sat, 27 Mar 2021 10:32:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210326011304.25640-1-nm@ti.com>
In-Reply-To: <20210326011304.25640-1-nm@ti.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sat, 27 Mar 2021 13:31:57 -0400
Message-ID: <CADkTA4M1+oP3nOnibE+AiLNn3gc9T84dgBzGTqjadW3Hd4+tpA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] make-mod-scripts: Provide the correct objcopy to kernel make
To: Nishanth Menon <nm@ti.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, praneeth@ti.com, 
	Denys Dmytriyenko <denis@denix.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 25, 2021 at 9:13 PM Nishanth Menon via
lists.openembedded.org <nm=ti.com@lists.openembedded.org> wrote:
>
> When cross-compiling with v5.12-rc3, prepare fails[1] build of vdso at
> the objcopy stage since it seems to be using the local host's objcopy
> rather than the cross-compile version we want it to use.
>
> This can be trivially reproduced in a localbuild of the kernel
> following the build parameters provided in the process[2]
>
> Lets fix this by passing OBJCOPY over to the kernel.
>

As I mentioned to Denys, I hadn't seen this. Consulting the
maintainers file would have found me as a good addition to the cc'.

I'm doing some other work on make-mod-scripts dependencies right now,
so I've pulled this in and will re-test against all of the active
kernel versions in master.

But I don't think that make-mod-scripts is the only place we'd need
this, if it is indeed happening on the tip of all the supported
versions.  There are routes to have the prepare steps run, without a
make-mod-scripts dependency.

We've already made the mistake of letting the make-mod-scrips and
kernel build parameters diverge (see AR=${KERNEL_AR}), so I need to
spend a few minutes getting them back in sync.

I was just able to build and boot qemuarm64 on 5.12-rc4, so there's
something different about your config than my setup. We need to figure
that out. It could be a .config triggering different components to be
built, but unlikely given vdso being involved.

qemuarm64 login: root
root@qemuarm64:~# uname -a
Linux qemuarm64 5.12.0-rc4-yoctodev-standard #1 SMP PREEMPT Mon Mar 22
18:46:22 UTC 2021 aarch64 aarch64 aarch64 GNU/Linux
root@qemuarm64:~#

> [1] https://pastebin.ubuntu.com/p/pNcQtb93wr/
> [2] https://pastebin.ubuntu.com/p/vZGqgh9Sq5/
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
>
> NOTE:
> 1. This is a different problem and is not resolved with
> https://lists.openembedded.org/g/openembedded-core/message/149943
>
> 2. Though reproduced during a dunfell build, this should probably
> apply else where as well.
>
> 3. I have'nt been able to cleanly bisect things, but my best guess was
> that this might be a consequence of kernel fixup exposing this.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a5b8ca97fbf8300a5e21c393df25ce6f521e7939
>
>  meta/classes/kernel-arch.bbclass                             | 3 +++
>  meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/kernel-arch.bbclass b/meta/classes/kernel-arch.bbclass
> index 07ec242e63bb..3d25fc7ac531 100644
> --- a/meta/classes/kernel-arch.bbclass
> +++ b/meta/classes/kernel-arch.bbclass
> @@ -60,9 +60,12 @@ TARGET_LD_KERNEL_ARCH ?= ""
>  HOST_LD_KERNEL_ARCH ?= "${TARGET_LD_KERNEL_ARCH}"
>  TARGET_AR_KERNEL_ARCH ?= ""
>  HOST_AR_KERNEL_ARCH ?= "${TARGET_AR_KERNEL_ARCH}"
> +TARGET_OBJCOPY_KERNEL_ARCH ?= ""
> +HOST_OBJCOPY_KERNEL_ARCH ?= "${TARGET_OBJCOPY_KERNEL_ARCH}"
>

We shouldn't need this TARGET_OBJCOPY_KERNEL_ARCH ->
HOST_OBJCOPY_KERNEL_ARCH, I can't think of how objcopy would be using
them.

Are you setting them to some value in your builds ?

>  KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} -fuse-ld=bfd ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH}"
>  KERNEL_LD = "${CCACHE}${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
>  KERNEL_AR = "${CCACHE}${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
> +KERNEL_OBJCOPY = "${CCACHE}${HOST_PREFIX}objcopy ${HOST_OBJCOPY_KERNEL_ARCH}"

The main kernel Makefile already defines, and the standard env should
already have both CROSS_COMPILE and OBJCOPY defined to be the target
version.

Makefile:OBJCOPY                = $(CROSS_COMPILE)objcopy

So we really have to pass this, when fundamentally it is the same
definition as what the defaults give us.

What does that resolve to in your builds ? In mine, when I dump the
objcopy value from within the kernel build, I get:

| /opt/poky/build/tmp/work-shared/qemuarm64/kernel-source/Makefile:443:
*** objcopy: aarch64-poky-linux-objcopy.  Stop.

Which should be doing the job.

Are you building arm on arm ? or something else like that ?

Bruce

>  TOOLCHAIN = "gcc"
>
> diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> index 87b7d240f51a..2d73e8093c2e 100644
> --- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> +++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
> @@ -25,7 +25,7 @@ EXTRA_OEMAKE = " HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="
>  do_configure() {
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>         for t in prepare scripts_basic scripts; do
> -               oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" \
> +               oe_runmake CC="${KERNEL_CC}" LD="${KERNEL_LD}" AR="${KERNEL_AR}" OBJCOPY="${KERNEL_OBJCOPY}"\
>                 -C ${STAGING_KERNEL_DIR} O=${STAGING_KERNEL_BUILDDIR} $t
>         done
>  }
> --
> 2.31.0
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
