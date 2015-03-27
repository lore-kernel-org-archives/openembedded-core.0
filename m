Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7CDE2723B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 15:45:34 +0000 (UTC)
Received: by lbdc10 with SMTP id c10so12438260lbd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 08:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=C28uSOK7oHypBNDmZRxgNM/zRaU2IJfncO+xyOkaDVA=;
	b=SS1OMatVs2+3/4X6fkmTBxyg4hfjj5n56iENz9gV49XoQUOhDwqAwbz7kKX02KI01T
	LjDpoEAmHhtWkPBU1qd3UocgaoLwKyWwgDUY25jU2l99quMpTE5l+pngJgMSr0w6l/zu
	PEdQi0oo7gLwhmcsT5ccykZLyRxrdyVC90LGH0je/BPeJdKpSmNf64b+GPcJvHy47FqG
	dh2rmBx3pnxCBtMrIARk66237pkUkzC0wMUo1WGyd/RlwTFurfeuwjcGnviLq+uYPUIy
	XRQt3SUqoiA5pOhaJGpQRNcqRyUJN7o0zPWbwwf5LF2SpvZHwg2IjIMQmt2gHn+odv/r
	Tc1g==
MIME-Version: 1.0
X-Received: by 10.152.8.161 with SMTP id s1mr9635863laa.41.1427471133799; Fri,
	27 Mar 2015 08:45:33 -0700 (PDT)
Received: by 10.112.170.70 with HTTP; Fri, 27 Mar 2015 08:45:33 -0700 (PDT)
In-Reply-To: <1427469661-14521-1-git-send-email-ross.burton@intel.com>
References: <1427469661-14521-1-git-send-email-ross.burton@intel.com>
Date: Fri, 27 Mar 2015 11:45:33 -0400
Message-ID: <CADkTA4MVz=on8Cb0eqYbr1Zeukjd-92NUVnyocjZc_10aTJS=w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] linux-yocto: add kern-tools-native to kernel_metadata depends
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
X-List-Received-Date: Fri, 27 Mar 2015 15:45:37 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 27, 2015 at 11:21 AM, Ross Burton <ross.burton@intel.com> wrote:
> The autobuilder failed like this:
>
>   temp/run.do_kernel_metadata.25242: line 165: createme: command not found
>
> createme is provided by kern-tools-native.  do_patch has a dependency on
> kern-tools-native, but do_kernel_metadata runs before do_patch.  So move the
> dependency from do_patch to do_kernel_metadata, moving the statement from the
> .inc to the class so it's alongside the task definition.

Agreed. I've meant to do this cleanup myself a few times .. and then
get sidetracked.

If the depends had been beside the task definition in the .inc, I
would have realized
that I needed to tweak it at the same time .. so this is much better.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

>
> [ YOCTO #7531 ]
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/kernel-yocto.bbclass         |    1 +
>  meta/recipes-kernel/linux/linux-yocto.inc |    2 --
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index 14551a2..a1fbb51 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -261,6 +261,7 @@ do_kernel_checkout[dirs] = "${S}"
>
>  addtask kernel_checkout before do_patch after do_unpack
>  addtask kernel_metadata after do_validate_branches before do_patch
> +do_kernel_metadata[depends] = "kern-tools-native:do_populate_sysroot"
>
>  do_kernel_configme[dirs] += "${S} ${B}"
>  do_kernel_configme() {
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
> index c62f8ca..5b69a49 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -32,8 +32,6 @@ KCONF_BSP_AUDIT_LEVEL ?= "0"
>
>  LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
>
> -do_patch[depends] = "kern-tools-native:do_populate_sysroot"
> -
>  addtask kernel_configme before do_configure after do_patch
>
>  # Pick up shared functions
> --
> 1.7.10.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

