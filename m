Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id 819606D14A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2014 04:30:12 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id pv20so1050644lab.16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Feb 2014 20:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=wLOOjGppSLYZAysEe9oichfPKyVgXsHMLgbyO+YIqTU=;
	b=oBjWE5rPMHggcfjA4MkECSrB7+xxlODYPWOTlNnj9l2E5qFqagJrmnts7EOdsg+JDG
	5zBRQTyLaMXJyyElBWlVO6XhQYcd6KYH6wo6LHQmDNrwQShbt1kYnjLgVvHylBfdEICu
	h8s5HzWrwY5kZIxV2fu/X9Fw8aqwdRsqP3bgmvCtZOJQk/MdrwLo8KKIXtKm6I2fgEt8
	feDBbrLWuF20S3h3CbiVRYgzxgJHXMwEOWxQt2W04+GmhpMeVgVU350OacSh3KwLMzfk
	m2BqZUiuzTs3qBRzyLLTZ6sMQtJTMjOEtOLey32opIZwsGfjxbZ+XKIJHEoP7qpeCvjr
	NgqA==
MIME-Version: 1.0
X-Received: by 10.112.43.70 with SMTP id u6mr3640248lbl.30.1391661012645; Wed,
	05 Feb 2014 20:30:12 -0800 (PST)
Received: by 10.112.170.166 with HTTP; Wed, 5 Feb 2014 20:30:12 -0800 (PST)
In-Reply-To: <62909ce827461785e4f3f2ceaec04d08c7b47f17.1391659364.git.dvhart@linux.intel.com>
References: <62909ce827461785e4f3f2ceaec04d08c7b47f17.1391659364.git.dvhart@linux.intel.com>
Date: Wed, 5 Feb 2014 23:30:12 -0500
Message-ID: <CADkTA4OVfau9egNsK_nd2O2gq=WQF89Zh=-2=-AncbgfVStbjw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-yocto: Use PACKAGE_ARCH in build dir
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
X-List-Received-Date: Thu, 06 Feb 2014 04:30:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 5, 2014 at 11:02 PM, Darren Hart <dvhart@linux.intel.com> wrote:
> The current linux-yocto build dir (B) includes MACHINE. This has been
> appropriate as kernels are typically built machine-specific. We have
> recently introduced an intel-common type kernel which can be shared
> across multiple machines sharing a common base (intel-core2-32,
> intel-corei7-64). In these cases, the kernel is built for a something
> more generic than MACHINE, and the current mechanism results in
> something like this when building for MACHINE=sys940x (using intel-common):
>
> tmp/work/core2-32-intel-common-poky-linux/linux-yocto-dev/ \
> 3.13++gitAUTOINC+e5d23e7879_889c6bec6b-r0/linux-sys940x-noemgd-standard-build
>
> Note the descrepancy between core2-32-intel-common and
> linux-sys940x-noemgd-standard-build. This becomes counterintuitive at
> the very least when switching to another machine and attempting to reuse
> this build. This patch swaps MACHINE for PACKAGE_ARCH (which is
> typically MACHINE_ARCH for linux-yocto), resulting in the following
> build path:
>
> tmp/work/core2-32-intel-common-poky-linux/linux-yocto-dev/ \
> 3.13++gitAUTOINC+e5d23e7879_889c6bec6b-r0/linux-core2-32-intel-common-standard-build
>
> The impact to existing MACHINEs is a replace of - with _ if MACHINE
> contains one or more - charachters.
>
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-kernel/linux/linux-yocto.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
> index 2bee042..4ed3188 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -31,7 +31,7 @@ inherit kernel
>  inherit kernel-yocto
>  require linux-dtb.inc
>
> -B = "${WORKDIR}/linux-${MACHINE}-${LINUX_KERNEL_TYPE}-build"
> +B = "${WORKDIR}/linux-${PACKAGE_ARCH}-${LINUX_KERNEL_TYPE}-build"

But for truly machine specific kernel builds, won't this cause us collisions ?

Bruce

>
>  do_install_append(){
>         if [ -n "${KMETA}" ]; then
> --
> 1.7.9.5
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

