Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2C46B6013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 15:46:11 +0000 (UTC)
Received: by lahp7 with SMTP id p7so54612806lah.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 08:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=taVeX/G9unjVLl6gXzwN71RdsCAmtK1NfQg3rQre8hc=;
	b=kxNOiQxzhAtfCDLIpH25Pb20lylbASmAvdSXSurLO39NveS3UNUgELw1Xr1rfVHJU8
	NGsJXPqhf7QCq7FTMrVrj8zn0RecClS6nc3a+v9TcuEAiFKTILRT+F3Gv8ikoZCeqndk
	feM4lFSDMgEfIUzdQP+VX+mL5NXzIIbgWLMdXiVcxU5aSdhhU5A8M30zp9OSrf2X0V9B
	620vG3jIWICNq2wBwn2IBKK9zRPDDuFhk5QQSZfMdwN1MsCjwXVpnsq43pJwaQvOtwP1
	MjFMkYifxE0Tb7myvzfGRtUHjeBRP6pNs+oGwaxoYOlC4imeVvuWzjacdRSdCpKllS0B
	KGRA==
MIME-Version: 1.0
X-Received: by 10.152.203.134 with SMTP id kq6mr18342738lac.110.1427471171843; 
	Fri, 27 Mar 2015 08:46:11 -0700 (PDT)
Received: by 10.112.170.70 with HTTP; Fri, 27 Mar 2015 08:46:11 -0700 (PDT)
In-Reply-To: <1427469661-14521-2-git-send-email-ross.burton@intel.com>
References: <1427469661-14521-1-git-send-email-ross.burton@intel.com>
	<1427469661-14521-2-git-send-email-ross.burton@intel.com>
Date: Fri, 27 Mar 2015 11:46:11 -0400
Message-ID: <CADkTA4M24NLmz-jTsThsVbUKwF0m9Gt+C5uRGL7fxBXhiL+P3A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernel-yocto: merge duplicate kernel_configme task definitions
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
X-List-Received-Date: Fri, 27 Mar 2015 15:46:12 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 27, 2015 at 11:21 AM, Ross Burton <ross.burton@intel.com> wrote:
> The kernel_configme task was added twice (once in the .bbclass, one in a .inc)
> with different ordering constraints.
>
> Change this to be just one definition in the bbclass with the stronger ordering
> constraints.

Agreed. Organically grown .. and not ideal in the existing layout :)

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>


>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/kernel-yocto.bbclass         |    2 +-
>  meta/recipes-kernel/linux/linux-yocto.inc |    2 --
>  2 files changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index a1fbb51..650ae5a 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -289,7 +289,7 @@ do_kernel_configme() {
>         echo "CONFIG_LOCALVERSION="\"${LINUX_VERSION_EXTENSION}\" >> ${B}/.config
>  }
>
> -addtask kernel_configme after do_patch
> +addtask kernel_configme before do_configure after do_patch
>
>  python do_kernel_configcheck() {
>      import re, string, sys
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
> index 5b69a49..3b41a61 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -32,8 +32,6 @@ KCONF_BSP_AUDIT_LEVEL ?= "0"
>
>  LINUX_VERSION_EXTENSION ?= "-yocto-${LINUX_KERNEL_TYPE}"
>
> -addtask kernel_configme before do_configure after do_patch
> -
>  # Pick up shared functions
>  inherit kernel
>  inherit kernel-yocto
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

