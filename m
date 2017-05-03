Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 587DE71993
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 May 2017 19:06:56 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id y10so15359341wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 May 2017 12:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=FOacBQcQRjkE4Tkp7sKljfroo+6cyOzWvsPVE9fCkbQ=;
	b=OcR7yNWWUbI/N1x5wXx7BLW7prRMbsUUGDxtu+7PsGZ+OldGCO7qTEm3O6TZ5dFFt6
	0dqnE1O+2VDdKGdNEj3La1ux22bEDq5n6qyFnMYgNRQSLiR/anQ6kco2Td8mR47VVQLb
	FKhgT9Dj4SEfd5KGBeN3vEzyIgKYpvqWg1huEc/99TjNeYx7ZkX4jFiE2WjivlIZOcGl
	YdCSM22fZB9B1A2HHOnJ7oxNE5x/rAjmXhwKGJhNs3qW8nwlT06IbuuwBITFDGvs9p+f
	+WcalGKEN6ZtxGCQtAxD8v/aK6ECngGvnYpsmz6w4vrkKFs6bRbCfGUvdViCuUq3oTLw
	pQcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=FOacBQcQRjkE4Tkp7sKljfroo+6cyOzWvsPVE9fCkbQ=;
	b=e3FbhI5jHsgz0rfFfhNIAySY4dCtxiKPsMH3URPCAbIHjLlYwqUDIJjErL8mPTIA2e
	+UnJzb3yQVgW8ePQG4YaVDWuTZO/TFeDb68ha4+7JZqIX4PvUlFR1bWTxntCflUoh6mq
	WrmyYL+h7cBGPqDRsyd9YkkCWcLhXBQOkt+GUAOHoKEWPSKTStbYdZVTCZasafgpCJWP
	p+r2cAdwRYtucZf8/IAtIR/lTFlGAM0b14BnmqxexdZgo7HCUPHyFmXCVTw0O4VSy0/G
	9jCg6p9aztnOfD5r8UCZ99x2CTRIgth2Cd+zHHd93eLdX15FVPRt440OjmCXm0/dAZN7
	dMJA==
X-Gm-Message-State: AN3rC/6KgsUkKfcmKfil2G1P0n478mMYVcV4PwSmwYjamTJ+CV+E4Pfg
	RDPgvexPEAWWTjMiHrUM8ZQ/i1yq5w==
X-Received: by 10.28.70.129 with SMTP id t123mr175531wma.98.1493838416747;
	Wed, 03 May 2017 12:06:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.172.100 with HTTP; Wed, 3 May 2017 12:06:56 -0700 (PDT)
In-Reply-To: <20170503161317.16784-1-stefan.wiehler@missinglinkelectronics.com>
References: <20170503161317.16784-1-stefan.wiehler@missinglinkelectronics.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 3 May 2017 12:06:56 -0700
Message-ID: <CAJ86T=ULob-3w572btu9UuVxDU1TxNc=jYNkfY7kewVCirxx8w@mail.gmail.com>
To: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
Cc: ulrich.langenbach@missinglinkelectronics.com,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] module.bbclass: Add devshell support
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
X-List-Received-Date: Wed, 03 May 2017 19:06:56 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 3, 2017 at 9:13 AM, Stefan Wiehler
<stefan.wiehler@missinglinkelectronics.com> wrote:
> Adds development shell support for out-of-tree kernel modules by reproducing
> the build environment of the compile task.
>
> Signed-off-by: Stefan Wiehler <stefan.wiehler@missinglinkelectronics.com>
> ---
>  meta/classes/module.bbclass | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
> index 802476bc7a..9b019513ae 100644
> --- a/meta/classes/module.bbclass
> +++ b/meta/classes/module.bbclass
> @@ -1,6 +1,7 @@
>  inherit module-base kernel-module-split pkgconfig
>
>  addtask make_scripts after do_prepare_recipe_sysroot before do_compile
> +addtask make_scripts after do_prepare_recipe_sysroot before do_devshell

For normal recipes, devshell doesn't care about any build dependencies
(and so runs very quickly if you just need to refresh a patch etc). If
you need a devshell which is able to build something then the normal
way would be to manually run the configure or compile task before the
devshell task.

I'm not sure of kernel modules are a special enough case to do things
differently and add build dependencies to the devshell task?

>  do_make_scripts[lockfiles] = "${TMPDIR}/kernel-scripts.lock"
>  do_make_scripts[depends] += "virtual/kernel:do_shared_workdir"
>
> @@ -18,6 +19,26 @@ python __anonymous () {
>      d.setVar('KBUILD_EXTRA_SYMBOLS', " ".join(extra_symbols))
>  }
>
> +python do_devshell_prepend () {
> +    os.environ['CFLAGS'] = ''
> +    os.environ['CPPFLAGS'] = ''
> +    os.environ['CXXFLAGS'] = ''
> +    os.environ['LDFLAGS'] = ''
> +
> +    os.environ['KERNEL_PATH'] = d.getVar('STAGING_KERNEL_DIR')
> +    os.environ['KERNEL_SRC'] = d.getVar('STAGING_KERNEL_DIR')
> +    os.environ['KERNEL_VERSION'] = d.getVar('KERNEL_VERSION')
> +    os.environ['CC'] = d.getVar('KERNEL_CC')
> +    os.environ['LD'] = d.getVar('KERNEL_LD')
> +    os.environ['AR'] = d.getVar('KERNEL_AR')
> +    os.environ['O'] = d.getVar('STAGING_KERNEL_BUILDDIR')
> +    kbuild_extra_symbols = d.getVar('KBUILD_EXTRA_SYMBOLS')
> +    if kbuild_extra_symbols:
> +        os.environ['KBUILD_EXTRA_SYMBOLS'] = kbuild_extra_symbols
> +    else:
> +        os.environ['KBUILD_EXTRA_SYMBOLS'] = ''
> +}
> +
>  module_do_compile() {
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS
>         oe_runmake KERNEL_PATH=${STAGING_KERNEL_DIR}   \
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

